Return-Path: <linuxppc-dev+bounces-4821-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE4DA05566
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 09:31:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSh3Z2Sbtz30TL;
	Wed,  8 Jan 2025 19:31:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736325114;
	cv=none; b=O8/1GmshVffE0qtGSNYOQAEg67CRTHRu+W27nb5PVqZcZKgseDuEApZPKO+Wa0tjNjRc054fWgk5eDwEgwaVnvzrCLQgJ5AAwreocDKWroWhUPk58QknPxbHJjhaV5LkmCuekq7ux2m58y4ldDez+KQqa9/0auvPvL/IyfuErNOKr3A4gr5cvblPpXR9Axwd/yD0pfeyMNhVBz9keNGHqdGB88daRjlVia+D/jIxwXrZL0el1NBdkszR1jm3UWZCtaA7ZU/4RMGvgrqA5BrShMYsJAu0WB8aj81wdBy0IZPLf2/ynjkUS4d0f+yY1WUXh/DzpKa5YhbkZE6eUBYm0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736325114; c=relaxed/relaxed;
	bh=lom+i4v3PxfHxmognsFk46EQaMmrjYMhI/xbLHGccvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NwbrUOS7xZopSBidjbB30SQFw3c0Lkvnc/LrpgVNYLZr9CKcloEDiX+eHjrbfecSB8oc92DxDyv3FADPb6UgftZlmxMGKqXFNVJFdCNKKdIMdMvOT07uBkWOyVuNK86evnDf+lBYIkSdANi5dTRN566BjugG0SpaEw+KUgZkBcInHPUGx0IObxPz8dDAHGbk8U1VI6duI1fGcdXgWF4oPsS26D9JnYYGuGcPMGST6IYaRzU+9IfWGehyviv6n8wrQQoaEikQhyeUmI7Lc9VNsVTrF+1+kr467bTXiMlvz2gVgdv5VdqqZZOtHmFlsufhl5dgQwpyzXn33enEDdagOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSh3X6Xblz30DL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 19:31:51 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A875312FC;
	Wed,  8 Jan 2025 00:31:45 -0800 (PST)
Received: from [10.57.94.52] (unknown [10.57.94.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28A753F59E;
	Wed,  8 Jan 2025 00:31:08 -0800 (PST)
Message-ID: <7cf8fa3b-799f-415a-82a1-eee6b7b2e0f5@arm.com>
Date: Wed, 8 Jan 2025 09:31:06 +0100
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
Subject: Re: [PATCH v5 11/17] x86: pgtable: convert __tlb_remove_table() to
 use struct ptdesc
To: Qi Zheng <zhengqi.arch@bytedance.com>, peterz@infradead.org,
 agordeev@linux.ibm.com, alex@ghiti.fr, andreas@gaisler.com,
 palmer@dabbelt.com, tglx@linutronix.de, david@redhat.com, jannh@google.com,
 hughd@google.com, yuzhao@google.com, willy@infradead.org,
 muchun.song@linux.dev, vbabka@kernel.org, lorenzo.stoakes@oracle.com,
 akpm@linux-foundation.org, rientjes@google.com, vishal.moola@gmail.com,
 arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
 <39f60f93143ff77cf5d6b3c3e75af0ffc1480adb.1736317725.git.zhengqi.arch@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <39f60f93143ff77cf5d6b3c3e75af0ffc1480adb.1736317725.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 08/01/2025 07:57, Qi Zheng wrote:
> Convert __tlb_remove_table() to use struct ptdesc, which will help to move
> pagetable_dtor() to __tlb_remove_table().
>
> And page tables shouldn't have swap cache, so use pagetable_free() instead
> of free_page_and_swap_cache() to free page table pages.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Definitely a good idea to have split patch 11 from v4.

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

- Kevin

