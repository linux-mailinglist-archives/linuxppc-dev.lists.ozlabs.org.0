Return-Path: <linuxppc-dev+bounces-4761-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1900A03BA7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 10:58:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS62B07qrz30f8;
	Tue,  7 Jan 2025 20:58:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736243921;
	cv=none; b=FNPDPJ7YlMluwOhJr0QTe9CqAFnfv9gUrXqtIEn1EVaUKAjNQeOmTeoyBv8f0f+SQi10/USZ6uMe2VW8p3PGxN24yeeLDf3YUOfonzhlliooLn0pSm6+2/XplV8fymzkf1Qa4KG1/XUSuLQpmUpoK4RPvD1BcuKtOxRYHQRwI25LliY4iS17YVP/ja5yvz2GXjAbXAmkOzqaGw8OOKAz+Kuo8qC3WakO4+qrno7br29iNUa4xSPbeofiDZsnFy3PV/v8BKd7CA1E+fHNUbGmv/9si/ekmX1QkNjKWlcnf8DOAwyKo1fu+NEsJ1fUBc9DU5+EoXw2t5MTqktl68I6RA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736243921; c=relaxed/relaxed;
	bh=zdmYeT6nirJQQeULEz/Mx26Ga9KASAi8ohiMId5QGl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W6u0ODZdp4DI5An5X54OaF+KWdAasW9kkCugmZ/tM0ojqusjx4I/NgqsLJtZ8Vd4gWh21UEsbhukxGsCf4IlMTGtWesIbE/jQY3OiJU5T+9KkdhukZvxa/63WBvBwZ0VS0qReBiVT5ifMOO9wrXvK+PQ3ipRpv4MxDIlwcbd2pYozhg24CnIEs+eNJrksI9inoG0HwaO4kJEcIkpi8o4uoeEp8ULnosh2BFyJXgzre2qXmeNWFhW9cs8Sbg4Moiws+lIJsUvyCfhYD+lcKGgbfPom2QUgCEbFCrmn/s/cmpIqyrfbK4qisRZY51/R7v8YMgLNDHCizu3lLpKUqln9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YS62869M0z2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 20:58:40 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D1D0143D;
	Tue,  7 Jan 2025 01:58:37 -0800 (PST)
Received: from [10.44.160.93] (e126510-lin.lund.arm.com [10.44.160.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46B0F3F673;
	Tue,  7 Jan 2025 01:58:01 -0800 (PST)
Message-ID: <ee393a7f-d01e-4e5d-9bf8-779795613af1@arm.com>
Date: Tue, 7 Jan 2025 10:57:59 +0100
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
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <de8756aa-dbf7-4f6f-91f0-934270397192@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 06/01/2025 04:49, Qi Zheng wrote:
> [...]
>
>> Once this is done, we should be able to replace all those confusing
>> calls to tlb_remove_page() on PTPs with tlb_remove_table() and remove
>> the explicit call to pagetable_dtor(). AIUI this is essentially what
>> Peter suggested on v3 [2].
>
> Since this patch series is mainly for bug fix, I think that these things
> can be done in separate patch series later.

Sure that's fair.

>
>>
>> [...]
>>
>>> Or can we just not let tlb_remove_table() fall back to
>>> tlb_remove_page()? Like the following:
>>>
>>> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
>>> index a59205863f431..354ffaa4bd120 100644
>>> --- a/include/asm-generic/tlb.h
>>> +++ b/include/asm-generic/tlb.h
>>> @@ -195,8 +195,6 @@
>>>    *  various ptep_get_and_clear() functions.
>>>    */
>>>
>>> -#ifdef CONFIG_MMU_GATHER_TABLE_FREE
>>> -
>>>   struct mmu_table_batch {
>>>   #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
>>>          struct rcu_head         rcu;
>>> @@ -219,16 +217,6 @@ static inline void __tlb_remove_table(void *table)
>>>
>>>   extern void tlb_remove_table(struct mmu_gather *tlb, void *table);
>>>
>>> -#else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
>>> -
>>> -/*
>>> - * Without MMU_GATHER_TABLE_FREE the architecture is assumed to have
>>> page based
>>> - * page directories and we can use the normal page batching to free
>>> them.
>>> - */
>>> -#define tlb_remove_table(tlb, page) tlb_remove_page((tlb), (page))
>>
>> We still need a different implementation of tlb_remove_table() in this
>> case. We could define it inline here:
>>
>> static inline void tlb_remove_table(struct mmu_gather *tlb, void *table)
>> {
>>      struct page *page = table;
>>
>>      pagetable_dtor(page_ptdesc(page));
>>      tlb_remove_page(page);
>> }
>
> Right. As I said above, will add this to the updated patch #8.

I think it would be preferable to make it a standalone patch, because
this is a change to generic code that could in principle impact other
arch's too.

- Kevin

