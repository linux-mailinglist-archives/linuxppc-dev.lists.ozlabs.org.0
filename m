Return-Path: <linuxppc-dev+bounces-4616-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D07A0057E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 09:03:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPbgL489cz30DL;
	Fri,  3 Jan 2025 19:03:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735891422;
	cv=none; b=OPwncROwkgK0FY7SNPX0tDAaItnLdApv/bMfOVNYhJMhb7tU5o8SRXRWN3zv68kmVeEVkl1DRiJofn/EAiKcTlJ3tbU3ED6WEm2E5+xmKLG5MdXgACBD4cIfGutDHAUJLPEtY5iexH7I8YDOBj8f285Fnv8PuE6Y2oWYX1IDqtEpETVNAbenn2dL5+3yiSC/X4U8N3LG9RHCDYd0mdm5n/24cwtjccqB3n9zxzwYi6mXS9hX2UxyRjQp3xXJxY6W2g/9mpGyfclbI5lVsMbuTmhCeqV/nljeW07NK/xIh3SuX0HuxYWheBAhW2TnsvTHbgcVHPOJH/84UFSmeKRauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735891422; c=relaxed/relaxed;
	bh=/OeHPFYsSusQTMTpEoomDP6spK4mL3gkKfUc71lXwpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y14Les44AoZDdk4vsZ+StDGfHUiC+/6fSmwIO92Ku8+rL6SLIp9e3qOaKF/ZjEMRujMzMi6FczG4489LpFagW9BapdCIKT5Bq5x1hCOsUaYMAowaDHm/0s2Qisw9POGONYBYt6MfkQnR7qppKNmZTYm+IzF7mYQE6UhxEdWF58Z2C29XXgfl/OcJo1ocWTE6/NWBCHZYlfnZ4tIG8j0DBqHkhdMjk9iH5bhY9z0KJhCnOyv8ZYjbvXiBhd6LCqDJqQrMP7jx9fi1cQDC3aiyjJzo1ufi4MW8c1NdNG9+IGf74GFAWisXPQJ4JOInj4W9ZrackzmJ8LHdwVQM3OtvUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPbgK2T2Xz2yRF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 19:03:40 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D277D150C;
	Fri,  3 Jan 2025 00:03:37 -0800 (PST)
Received: from [10.57.92.237] (unknown [10.57.92.237])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CED73F673;
	Fri,  3 Jan 2025 00:03:01 -0800 (PST)
Message-ID: <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
Date: Fri, 3 Jan 2025 09:02:59 +0100
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
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
 <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
 <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 03/01/2025 04:48, Qi Zheng wrote:
> Hi Kevin,
>
> On 2025/1/3 00:53, Kevin Brodsky wrote:
>> On 30/12/2024 10:07, Qi Zheng wrote:
>>>   static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb,
>>> void *pt)
>>>   {
>>> -    if (riscv_use_sbi_for_rfence())
>>> +    if (riscv_use_sbi_for_rfence()) {
>>>           tlb_remove_ptdesc(tlb, pt);
>>> -    else
>>> +    } else {
>>> +        pagetable_dtor(pt);
>>>           tlb_remove_page_ptdesc(tlb, pt);
>>
>> I find the imbalance pretty confusing: pagetable_dtor() is called
>> explicitly before using tlb_remove_page() but not tlb_remove_ptdesc().
>> Doesn't that assume that CONFIG_MMU_GATHER_HAVE_TABLE_FREE is selected?
>> Could we not call pagetable_dtor() from __tlb_batch_free_encoded_pages()
>> to ensure that the dtor is always called just before freeing, and remove
>
> In __tlb_batch_free_encoded_pages(), we can indeed detect PageTable()
> and call pagetable_dtor() to dtor the page table pages.
> But __tlb_batch_free_encoded_pages() is also used to free normal pages
> (not page table pages), so I don't want to add overhead there.

Interesting, can a tlb batch refer to pages than are not PTPs then?

>
> But now I think maybe we can do this in tlb_remove_page_ptdesc(), like
> this:
>
> diff --git a/arch/csky/include/asm/pgalloc.h
> b/arch/csky/include/asm/pgalloc.h
> index f1ce5b7b28f22..e45c7e91dcbf9 100644
> --- a/arch/csky/include/asm/pgalloc.h
> +++ b/arch/csky/include/asm/pgalloc.h
> @@ -63,7 +63,6 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
>
>  #define __pte_free_tlb(tlb, pte, address)              \
>  do {                                                   \
> -       pagetable_dtor(page_ptdesc(pte));               \
>         tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));  \
>  } while (0)
>
> [...]
>
> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
> index a96d4b440f3da..a59205863f431 100644
> --- a/include/asm-generic/tlb.h
> +++ b/include/asm-generic/tlb.h
> @@ -506,6 +506,7 @@ static inline void tlb_remove_ptdesc(struct
> mmu_gather *tlb, void *pt)
>  /* Like tlb_remove_ptdesc, but for page-like page directories. */
>  static inline void tlb_remove_page_ptdesc(struct mmu_gather *tlb,
> struct ptdesc *pt)
>  {
> +       pagetable_dtor(pt);
>         tlb_remove_page(tlb, ptdesc_page(pt));
>  }

I think this is an interesting idea, it does make arch code easier to
follow. OTOH it would have been more natural to me to call
pagetable_dtor() from tlb_remove_page(). I can however see that this
doesn't work, because tlb_remove_table() is defined as tlb_remove_page()
if CONFIG_MMU_GATHER_HAVE_TABLE_FREE isn't selected. Which brings me
back to my earlier question: in that case, aren't we missing a call to
pagetable_dtor() when using tlb_remove_table() (or tlb_remove_ptdesc())?

- Kevin

