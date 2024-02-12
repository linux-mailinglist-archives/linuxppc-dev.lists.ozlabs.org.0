Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02322851219
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 12:22:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYMWY6Zgqz3dWH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 22:22:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYMW912Mtz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 22:22:28 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C9AFDA7;
	Mon, 12 Feb 2024 03:22:38 -0800 (PST)
Received: from [10.57.78.115] (unknown [10.57.78.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5E683F762;
	Mon, 12 Feb 2024 03:21:53 -0800 (PST)
Message-ID: <398991e6-d09d-4f47-a110-4ff1e8356b6e@arm.com>
Date: Mon, 12 Feb 2024 11:21:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] mm/mmu_gather: improve cond_resched() handling
 with large folios and expensive page freeing
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240209221509.585251-1-david@redhat.com>
 <20240209221509.585251-10-david@redhat.com>
 <f1578e92-4de0-4718-bf79-ec29e9a19fe0@arm.com>
 <6c66f7ca-4b14-4bbb-bf06-e81b3481b03f@redhat.com>
 <590946ad-a538-4c99-947f-93455c2d96c6@arm.com>
 <e6774e16-90c0-4fba-9b9c-98de803fc920@redhat.com>
 <66ca6c58-1983-494f-b920-140be736f1d8@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <66ca6c58-1983-494f-b920-140be736f1d8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Michal Hocko <mhocko@suse.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Nick Piggin <npiggin@gmail.com>, Yin Fengwei <fengwei.yin@intel.com>, Sven Schnelle <svens@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/02/2024 11:05, David Hildenbrand wrote:
> On 12.02.24 11:56, David Hildenbrand wrote:
>> On 12.02.24 11:32, Ryan Roberts wrote:
>>> On 12/02/2024 10:11, David Hildenbrand wrote:
>>>> Hi Ryan,
>>>>
>>>>>> -static void tlb_batch_pages_flush(struct mmu_gather *tlb)
>>>>>> +static void __tlb_batch_free_encoded_pages(struct mmu_gather_batch *batch)
>>>>>>     {
>>>>>> -    struct mmu_gather_batch *batch;
>>>>>> -
>>>>>> -    for (batch = &tlb->local; batch && batch->nr; batch = batch->next) {
>>>>>> -        struct encoded_page **pages = batch->encoded_pages;
>>>>>> +    struct encoded_page **pages = batch->encoded_pages;
>>>>>> +    unsigned int nr, nr_pages;
>>>>>>     +    /*
>>>>>> +     * We might end up freeing a lot of pages. Reschedule on a regular
>>>>>> +     * basis to avoid soft lockups in configurations without full
>>>>>> +     * preemption enabled. The magic number of 512 folios seems to work.
>>>>>> +     */
>>>>>> +    if (!page_poisoning_enabled_static() && !want_init_on_free()) {
>>>>>
>>>>> Is the performance win really worth 2 separate implementations keyed off this?
>>>>> It seems a bit fragile, in case any other operations get added to free
>>>>> which are
>>>>> proportional to size in future. Why not just always do the conservative
>>>>> version?
>>>>
>>>> I really don't want to iterate over all entries on the "sane" common case. We
>>>> already do that two times:
>>>>
>>>> a) free_pages_and_swap_cache()
>>>>
>>>> b) release_pages()
>>>>
>>>> Only the latter really is required, and I'm planning on removing the one in (a)
>>>> to move it into (b) as well.
>>>>
>>>> So I keep it separate to keep any unnecessary overhead to the setups that are
>>>> already terribly slow.
>>>>
>>>> No need to iterate a page full of entries if it can be easily avoided.
>>>> Especially, no need to degrade the common order-0 case.
>>>
>>> Yeah, I understand all that. But given this is all coming from an array, (so
>>> easy to prefetch?) and will presumably all fit in the cache for the common case,
>>> at least, so its hot for (a) and (b), does separating this out really make a
>>> measurable performance difference? If yes then absolutely this optimizaiton
>>> makes sense. But if not, I think its a bit questionable.
>>
>> I primarily added it because
>>
>> (a) we learned that each cycle counts during mmap() just like it does
>> during fork().
>>
>> (b) Linus was similarly concerned about optimizing out another batching
>> walk in c47454823bd4 ("mm: mmu_gather: allow more than one batch of
>> delayed rmaps"):
>>
>> "it needs to walk that array of pages while still holding the page table
>> lock, and our mmu_gather infrastructure allows for batching quite a lot
>> of pages.  We may have thousands on pages queued up for freeing, and we
>> wanted to walk only the last batch if we then added a dirty page to the
>> queue."
>>
>> So if it matters enough for reducing the time we hold the page table
>> lock, it surely adds "some" overhead in general.
>>
>>
>>>
>>> You're the boss though, so if your experience tells you this is neccessary, then
>>> I'm ok with that.
>>
>> I did not do any measurements myself, I just did that intuitively as
>> above. After all, it's all pretty straight forward (keeping the existing
>> logic, we need a new one either way) and not that much code.
>>
>> So unless there are strong opinions, I'd just leave the common case as
>> it was, and the odd case be special.
> 
> I think we can just reduce the code duplication easily:
> 
> diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
> index d175c0f1e2c8..99b3e9408aa0 100644
> --- a/mm/mmu_gather.c
> +++ b/mm/mmu_gather.c
> @@ -91,18 +91,21 @@ void tlb_flush_rmaps(struct mmu_gather *tlb, struct
> vm_area_struct *vma)
>  }
>  #endif
>  
> -static void tlb_batch_pages_flush(struct mmu_gather *tlb)
> -{
> -    struct mmu_gather_batch *batch;
> +/*
> + * We might end up freeing a lot of pages. Reschedule on a regular
> + * basis to avoid soft lockups in configurations without full
> + * preemption enabled. The magic number of 512 folios seems to work.
> + */
> +#define MAX_NR_FOLIOS_PER_FREE        512
>  
> -    for (batch = &tlb->local; batch && batch->nr; batch = batch->next) {
> -        struct encoded_page **pages = batch->encoded_pages;
> +static void __tlb_batch_free_encoded_pages(struct mmu_gather_batch *batch)
> +{
> +    struct encoded_page **pages = batch->encoded_pages;
> +    unsigned int nr, nr_pages;
>  
> -        while (batch->nr) {
> -            /*
> -             * limit free batch count when PAGE_SIZE > 4K
> -             */
> -            unsigned int nr = min(512U, batch->nr);
> +    while (batch->nr) {
> +        if (!page_poisoning_enabled_static() && !want_init_on_free()) {
> +            nr = min(MAX_NR_FOLIOS_PER_FREE, batch->nr);
>  
>              /*
>               * Make sure we cover page + nr_pages, and don't leave
> @@ -111,14 +114,39 @@ static void tlb_batch_pages_flush(struct mmu_gather *tlb)
>              if (unlikely(encoded_page_flags(pages[nr - 1]) &
>                       ENCODED_PAGE_BIT_NR_PAGES_NEXT))
>                  nr++;
> +        } else {
> +            /*
> +             * With page poisoning and init_on_free, the time it
> +             * takes to free memory grows proportionally with the
> +             * actual memory size. Therefore, limit based on the
> +             * actual memory size and not the number of involved
> +             * folios.
> +             */
> +            for (nr = 0, nr_pages = 0;
> +                 nr < batch->nr && nr_pages < MAX_NR_FOLIOS_PER_FREE;
> +                 nr++) {
> +                if (unlikely(encoded_page_flags(pages[nr]) &
> +                         ENCODED_PAGE_BIT_NR_PAGES_NEXT))
> +                    nr_pages += encoded_nr_pages(pages[++nr]);
> +                else
> +                    nr_pages++;
> +            }
> +        }
>  
> -            free_pages_and_swap_cache(pages, nr);
> -            pages += nr;
> -            batch->nr -= nr;
> +        free_pages_and_swap_cache(pages, nr);
> +        pages += nr;
> +        batch->nr -= nr;
>  
> -            cond_resched();
> -        }
> +        cond_resched();
>      }
> +}
> +
> +static void tlb_batch_pages_flush(struct mmu_gather *tlb)
> +{
> +    struct mmu_gather_batch *batch;
> +
> +    for (batch = &tlb->local; batch && batch->nr; batch = batch->next)
> +        __tlb_batch_free_encoded_pages(batch);
>      tlb->active = &tlb->local;
>  }
>  

Yes this is much cleaner IMHO! I don't think putting the poison and init_on_free
checks inside the while loops should make a whole lot of difference - you're
only going round that loop once in the common (4K pages) case.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>


