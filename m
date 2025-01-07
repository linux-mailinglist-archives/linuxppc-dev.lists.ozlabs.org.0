Return-Path: <linuxppc-dev+bounces-4781-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCB4A04202
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 15:18:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSCnV2Y7Pz3bSb;
	Wed,  8 Jan 2025 01:18:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736259486;
	cv=none; b=WYSttQEjwCdfSjYtmysClnSHXnpUDRPWqiKUi3igjRNlFM5A91zqWcVn6Dda+lrlL7IoGq6PJXyOYtAOfoZj4ljOrAxZjUJ57+ekrGvQkMgVrJedLqbz53+8lZ4uCKHNB3tkA/7F0SwQf7Mx9njRjLt0VV+15hUyvJwFMM2bJrZouPaTg9R9gZtjjUbufxJFd+VA5aYP8daowbdbNPvBIVN8SmGHAdjVLdIuQCDoe3YoVIw2ZRb6BeLO9pH7zgGdc8SfJYFMfWxjg97LD/DrbsQPlvOFMg+oNmgHNpJ8mvBxbRdBcBUn5g+nfC62TxBfLOSDmmmkU1vpYfuaoSa0tA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736259486; c=relaxed/relaxed;
	bh=LdjW4ickP4Xi4e0fu3fIWfHzf6KJRYYvI9Few8GoUtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PormUYY3iZ/5f/Lg8Avfs0QUFla5KpXzQPhbTqzSL0yNMVqLtFN/jR2yM1s1xuJHMbsTTZbV6D6RDwbdO49SwaSXpoKwBI2wNT3ThCjaxrNKt7q5z/OjR+Azb4GOutYaH1Wc1dV+2oGa/RWHEtlhctuEFeJqxqkZSoIKXbXPfendUuM2HW9a7xqSj6TXvFs2S8TI7bejjQeU/INuewl3Qfpjwkp0UTOpPm9hFbjjiBovP/xtAna9ihBv/lWjruJv/6WI9ehZjDemmyuxW98ujETabAy/rAnILPpqb9Q4/2ey8EUGsbl1CjMVaeARGf3i3HtKjRhLweY+Z1EwyOziyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSCnS4SLRz30hQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 01:18:02 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5F4761424;
	Tue,  7 Jan 2025 06:17:57 -0800 (PST)
Received: from [10.44.160.93] (e126510-lin.lund.arm.com [10.44.160.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91DCA3F59E;
	Tue,  7 Jan 2025 06:17:20 -0800 (PST)
Message-ID: <f1f98c3d-2db0-455f-80e7-b7d4c3154de6@arm.com>
Date: Tue, 7 Jan 2025 15:17:17 +0100
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
Cc: agordeev@linux.ibm.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, rientjes@google.com, vishal.moola@gmail.com,
 arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 dave.hansen@linux.intel.com, rppt@kernel.org, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
 peterz@infradead.org, akpm@linux-foundation.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
 <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
 <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
 <7e2c26c8-f5df-4833-a93f-3409b00b58fd@arm.com>
 <e9fe97d4-99d5-443e-b722-43903655a76e@bytedance.com>
 <31e1a033-00a7-4953-81e7-0caedd0227a9@bytedance.com>
 <d9a14211-4bbd-4fb6-ba87-a555a40bb67a@arm.com>
 <de8756aa-dbf7-4f6f-91f0-934270397192@bytedance.com>
 <ee393a7f-d01e-4e5d-9bf8-779795613af1@arm.com>
 <07e0c05f-cb69-4263-885d-6d20d4442152@bytedance.com>
 <4a0b5edb-6fc7-4df4-93d9-ca834e6a760b@arm.com>
 <fca0d7de-b563-4d11-9ed8-c6b8290c4cf9@bytedance.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <fca0d7de-b563-4d11-9ed8-c6b8290c4cf9@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 07/01/2025 13:31, Qi Zheng wrote:
> On 2025/1/7 19:58, Kevin Brodsky wrote:
>> On 07/01/2025 11:51, Qi Zheng wrote:
>>> [...]
>>>
>>> Author: Qi Zheng <zhengqi.arch@bytedance.com>
>>> Date:   Fri Dec 13 17:13:48 2024 +0800
>>>
>>>      mm: pgtable: completely move pagetable_dtor() to generic
>>> tlb_remove_table()
>>>
>>>      For the generic tlb_remove_table(), it is implemented in the
>>> following two
>>>      forms:
>>>
>>>      1) CONFIG_MMU_GATHER_TABLE_FREE is enabled
>>>
>>>      tlb_remove_table
>>>      --> generic __tlb_remove_table()
>>>
>>>      2) CONFIG_MMU_GATHER_TABLE_FREE is disabled
>>>
>>>      tlb_remove_table
>>>      --> tlb_remove_page
>>>
>>>      For case 1), the pagetable_dtor() has already been moved to
>>> generic
>>>      __tlb_remove_table().
>>>
>>>      For case 2), now only arm will call
>>> tlb_remove_table()/tlb_remove_ptdesc()
>>>      when CONFIG_MMU_GATHER_TABLE_FREE is disabled. Let's move
>>> pagetable_dtor()
>>>      completely to generic tlb_remove_table(), so that the
>>> architectures can
>>>      follow more easily.
>>>
>>>      Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>
> I missed your Suggested-by, will add it in v5.

Ah yes thanks!

>
>>>
>>> diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
>>> index b8eebdb598631..ea4fbe7b17f6f 100644
>>> --- a/arch/arm/include/asm/tlb.h
>>> +++ b/arch/arm/include/asm/tlb.h
>>> @@ -34,10 +34,6 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t
>>> pte, unsigned long addr)
>>>   {
>>>          struct ptdesc *ptdesc = page_ptdesc(pte);
>>>
>>> -#ifndef CONFIG_MMU_GATHER_TABLE_FREE
>>> -       pagetable_dtor(ptdesc);
>>> -#endif
>>
>> I guess this hunk will disappear since this call isn't present to start
>> with.
>
> Yes, I plan to add this in the patch #8, and remove it in this patch.

Right I guess this is required to keep patch 8 self-contained, makes sense.

>
>>
>>> -
>>>   #ifndef CONFIG_ARM_LPAE
>>>          /*
>>>           * With the classic ARM MMU, a pte page has two
>>> corresponding pmd
>>> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
>>> index 69de47c7ef3c5..53ae7748f555b 100644
>>> --- a/include/asm-generic/tlb.h
>>> +++ b/include/asm-generic/tlb.h
>>> @@ -220,14 +220,20 @@ static inline void __tlb_remove_table(void
>>> *table)
>>>
>>>   extern void tlb_remove_table(struct mmu_gather *tlb, void *table);
>>>
>>> -#else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
>>> +#else /* !CONFIG_MMU_GATHER_TABLE_FREE */
>>
>> Good catch!
>>
>>>
>>> +static inline void tlb_remove_page(struct mmu_gather *tlb, struct
>>> page *page);
>>
>> Nit: might be better to move the declaration up, e.g. above #ifdef
>> CONFIG_MMU_GATHER_TABLE_FREE.
>
> Now only the tlb_remove_table() below calls it, maybe it's better to
> keep the impact to minimum?

I feel it might be better to make the declaration unconditional, but
this is really a detail, I don't mind either way.

>
>>
>>>   /*
>>>    * Without MMU_GATHER_TABLE_FREE the architecture is assumed to have
>>> page based
>>>    * page directories and we can use the normal page batching to free
>>> them.
>>>    */
>>> -#define tlb_remove_table(tlb, page) tlb_remove_page((tlb), (page))
>>> +static inline void tlb_remove_table(struct mmu_gather *tlb, void
>>> *table)
>>> +{
>>> +       struct page *page = (struct page *)table;
>>>
>>> +       pagetable_dtor(page_ptdesc(page));
>>> +       tlb_remove_page(tlb, page);
>>> +}
>>>   #endif /* CONFIG_MMU_GATHER_TABLE_FREE */
>>>
>>>   #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
>>
>> Looks good to me otherwise.
>
> I will add your Reviewed-by to all patches (except yours) in v5, can
> I also add it to this new added patch? (if we agree with the discussion
> above) ;)

Yes please do, thanks!

- Kevin

