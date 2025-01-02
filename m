Return-Path: <linuxppc-dev+bounces-4567-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D3E9FFC63
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 17:54:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPCVW0Jflz2yhM;
	Fri,  3 Jan 2025 03:54:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735836883;
	cv=none; b=iKwRS03zY4aR+RbqyUGfnmErEwibIY7zxkIc29gxa6CUHqnPumtNPsqzQdaSL3VRZFL+7mnMETObb2d069G9yEpBbuIcMlDpFwrgyY+ns3FW7L1ABYFMquxMw2RWMHyMucvnmiJI/EfnOmZClR/2ax83ZQs+GuwWrW5x3lIqymq8ZjnIzpOgg9GZfmq102NDTnGlZ9bcFs8O6BFlDuxOk5KwCnJ5ZLMHTHVBdFESfooDMEL3gTCXgOqY2iI/0ZtUe04lMNUOSOXfiE5Bx4bvCugTYJ2vVbvRIKgyoTZZuoYj/kYKC1sTBrdXoMUi+7xFRsSGz4TzwH5eesNYtDMQvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735836883; c=relaxed/relaxed;
	bh=KVwKHyu8Gg+zMPltZA366Kn5pjCmCCo125yHAly9hf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HsuO67pq5vO9L5QM75theYgby063vsAi18Q89gaQSxZZSsKEk1INugDJ+KKwLoeZajq2uzLOYEykhvHdeav3Z955W2/+14EkwWbbP9CJgy0h3+PgEci/cBAOTBEIiv/P51fBZvDLOWDt37NaxF/CN7Nlzk7Wi4DtPFIOOaur1Cry2W4BCnORhIemvLrUTaGCSfjRgDVzH8y+9qzY3itob3Oav1vm+YBxN8OTcdlmjUso1S4I+omS/c2+39dDRVa9ix9Sn4kDpEZrbJr53nBQ3dsdEEwTYa1xzm4SKh/cJzxQCjA3slBc8uxq3fzkL/jnjgpJgGVx285gr55G2Lqj4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPCVV38Nmz2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 03:54:42 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA569153B;
	Thu,  2 Jan 2025 08:54:39 -0800 (PST)
Received: from [10.57.91.208] (unknown [10.57.91.208])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23C923F673;
	Thu,  2 Jan 2025 08:54:02 -0800 (PST)
Message-ID: <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
Date: Thu, 2 Jan 2025 17:53:58 +0100
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
Subject: Re: [PATCH v4 10/15] riscv: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
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
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 30/12/2024 10:07, Qi Zheng wrote:
>  static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
>  {
> -	if (riscv_use_sbi_for_rfence())
> +	if (riscv_use_sbi_for_rfence()) {
>  		tlb_remove_ptdesc(tlb, pt);
> -	else
> +	} else {
> +		pagetable_dtor(pt);
>  		tlb_remove_page_ptdesc(tlb, pt);

I find the imbalance pretty confusing: pagetable_dtor() is called
explicitly before using tlb_remove_page() but not tlb_remove_ptdesc().
Doesn't that assume that CONFIG_MMU_GATHER_HAVE_TABLE_FREE is selected?
Could we not call pagetable_dtor() from __tlb_batch_free_encoded_pages()
to ensure that the dtor is always called just before freeing, and remove
the extra handling from arch code? I may well be missing something, I'm
not super familiar with the tlb handling code.

- Kevin

