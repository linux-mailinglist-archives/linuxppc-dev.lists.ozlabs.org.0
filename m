Return-Path: <linuxppc-dev+bounces-4568-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 612129FFC78
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 18:00:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPCdX67yNz2yT0;
	Fri,  3 Jan 2025 04:00:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735837248;
	cv=none; b=Qa17KMG2KcggWHOnwqlz4qszRJAnPqecgN+ptA71CqpcaotMfAs/IsJ5jGbESFT3K5UgqxaNfWQjgKA+8wnY4L95AUv+LgHiBTCenGsR1yOPyl980p0y1wzFIjKHg94H16Rc0HRV5emHtr+0TYl0HrFIOOs6pK9EzF+kA/m2cUnOdT2PKBDB/NUsjv8KGOMeqVogbX1n7linIMFSCZm0alNYuZWfVccIqyitDpGWRyyfdO1TXm7sRVawmOQOd259//eA+XUypO2Gx8zks6QWY01377YlgqXp7a00yam1W3oUpVrvYA3BiHz8dm327YIgihomgfHfc/dHdb+rHHKtNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735837248; c=relaxed/relaxed;
	bh=DVKtDnv73lkMyTG56buW5+Lz0T+F0ADXYZ01KdwQv9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lx0ZarOBMUZvRXySdiStA3XFGnzfoHY8KmoSmSigzsN8EH0a7P3ULbGi8/ffBm/Ynoe7S5o4Y3ayk6u+WDDXu2qxZi7fbmqSPZOypXJ1xEG9p+xLw3exifIGtnYcEp2PB+1T/eyx7P8LX34Nf2+TVs/hyTcfsvb54BekauzvGEmODKrR9rWnUuUSpNouhKaztux8QoMNpAvwqdZhQA2IJ0+8SsMEqlGhJ8um/B7XbNVETTYsgKxyMsZkvxRdoFvZaXSDHkpNdWb+ilryBZeu2JD4cHc+fq4iUjJx2FBoQm+EmFC8BhY9jDSxSXQQwWZ6S2D34FatFwSR0VUUNL60og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPCdW6S2kz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 04:00:47 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4B9911FB;
	Thu,  2 Jan 2025 09:00:44 -0800 (PST)
Received: from [10.57.91.208] (unknown [10.57.91.208])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91B853F673;
	Thu,  2 Jan 2025 09:00:07 -0800 (PST)
Message-ID: <04b0a778-7a6b-4df3-b40e-ca76adddb243@arm.com>
Date: Thu, 2 Jan 2025 18:00:05 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/15] move pagetable_*_dtor() to __tlb_remove_table()
To: Qi Zheng <zhengqi.arch@bytedance.com>, peterz@infradead.org,
 agordeev@linux.ibm.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, akpm@linux-foundation.org, rientjes@google.com,
 vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 30/12/2024 10:07, Qi Zheng wrote:
> Qi Zheng (13):
>   Revert "mm: pgtable: make ptlock be freed by RCU"
>   mm: pgtable: add statistics for P4D level page table
>   arm64: pgtable: use mmu gather to free p4d level page table
>   s390: pgtable: add statistics for PUD and P4D level page table
>   mm: pgtable: introduce pagetable_dtor()
>   arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
>   arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
>   riscv: pgtable: move pagetable_dtor() to __tlb_remove_table()
>   x86: pgtable: move pagetable_dtor() to __tlb_remove_table()
>   s390: pgtable: also move pagetable_dtor() of PxD to
>     __tlb_remove_table()
>   mm: pgtable: introduce generic __tlb_remove_table()
>   mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
>   mm: pgtable: introduce generic pagetable_dtor_free()

Aside from the nit on patch 4 and the request for clarification on patch
10, this is looking good to me, so for the whole series (aside from my
own patches of course):

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

And happy new year!

Cheers,
- Kevin

