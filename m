Return-Path: <linuxppc-dev+bounces-9048-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D93AC93F0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 18:51:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b88QN3c7Kz2yGQ;
	Sat, 31 May 2025 02:51:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748623883;
	cv=none; b=lz6ZZ/epyxpthrwzG3+DTWBNGmqA+mvKHzk0TV4aATYbaevUUOXNx+aZChKgXBNHFI8Z5/NmlC45ORUebWhCFbSFG2AWnFchfZtch/gButdEx8lWxfOuGIh9nGxHHK1DT8OZ86yhNVeFRM9NDM2PPfhNPT8GwZXe+jCi2IpjifHiRL46rkqwvhyOqcyQyZSApjBGfIB/Ze0UVNOujh8D90YrjS0DsDMlKVcpjb6/5San9UWDhKFu73t9AbaLg3w3wpvnowdi7Q4oBfRCw90GLdumxNSMw5ZkVrr5wpJe2EDIq/Jd94sd9ssenM8jNky9b7tjP/US1/OoXABCZu+03A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748623883; c=relaxed/relaxed;
	bh=tM2i8L5oNKfyT476wf6f0sWku7qyNenSVjOgP1rIFgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=NkWt1wOiWL70LONtUBoCKS/tg8GLZOqwAaEdka4DnnVq/ROZSw3sGKzUROulXjgcsvcCNmuIRJmTcBVJ/Auky0kgyoLgPw5c1iP6oCHWo67L4KAz9edHOVdGIdIojByqBQl/qhLT6v1hB2buu6nc6wuWCLzzqXxWoSz45uZoVODiRn/gaOJYdnZIWaCmLNxuGq/jlIzpodnajkLis48274Vsvz8a0MxZOF2HF22pXPVGJS5qIVOfVGAjsDjTlLyHaumTjpseGRbUEMTT/nMjyKVnUcDidqeOTgGVhlL9pd4AS2xafrp3QvbvXj7O/qtGmcF9KUoovLMoDZnTyL9yLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b88QL32fzz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 May 2025 02:51:22 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63DD81692;
	Fri, 30 May 2025 09:50:34 -0700 (PDT)
Received: from [10.57.95.14] (unknown [10.57.95.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A56B3F673;
	Fri, 30 May 2025 09:50:45 -0700 (PDT)
Message-ID: <c7017555-cc46-4cf9-86d2-03a252165062@arm.com>
Date: Fri, 30 May 2025 17:50:43 +0100
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 3/6] mm: Avoid calling page allocator from
 apply_to_page_range()
Content-Language: en-GB
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Juergen Gross <jgross@suse.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.makhalov@broadcom.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, virtualization@lists.linux.dev,
 xen-devel@lists.xenproject.org, linux-mm@kvack.org
References: <20250530140446.2387131-1-ryan.roberts@arm.com>
 <20250530140446.2387131-4-ryan.roberts@arm.com>
 <6nf3cxwhij7jtfi2u6nmt4igezf754gmue5dfskn4jkfkxmjzr@7btdipzmzjuo>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <6nf3cxwhij7jtfi2u6nmt4igezf754gmue5dfskn4jkfkxmjzr@7btdipzmzjuo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 30/05/2025 17:23, Liam R. Howlett wrote:
> * Ryan Roberts <ryan.roberts@arm.com> [250530 10:05]:
>> Lazy mmu mode applies to the current task and permits pte modifications
>> to be deferred and updated at a later time in a batch to improve
>> performance. apply_to_page_range() calls its callback in lazy mmu mode
>> and some of those callbacks call into the page allocator to either
>> allocate or free pages.
>>
>> This is problematic with CONFIG_DEBUG_PAGEALLOC because
>> debug_pagealloc_[un]map_pages() calls the arch implementation of
>> __kernel_map_pages() which must modify the ptes for the linear map.
>>
>> There are two possibilities at this point:
>>
>>  - If the arch implementation modifies the ptes directly without first
>>    entering lazy mmu mode, the pte modifications may get deferred until
>>    the existing lazy mmu mode is exited. This could result in taking
>>    spurious faults for example.
>>
>>  - If the arch implementation enters a nested lazy mmu mode before
>>    modification of the ptes (many arches use apply_to_page_range()),
>>    then the linear map updates will definitely be applied upon leaving
>>    the inner lazy mmu mode. But because lazy mmu mode does not support
>>    nesting, the remainder of the outer user is no longer in lazy mmu
>>    mode and the optimization opportunity is lost.
>>
>> So let's just ensure that the page allocator is never called from within
>> lazy mmu mode. New "_nolazy" variants of apply_to_page_range() and
>> apply_to_existing_page_range() are introduced which don't enter lazy mmu
>> mode. Then users which need to call into the page allocator within their
>> callback are updated to use the _nolazy variants.
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  include/linux/mm.h |  6 ++++++
>>  kernel/bpf/arena.c |  6 +++---
>>  mm/kasan/shadow.c  |  2 +-
>>  mm/memory.c        | 54 +++++++++++++++++++++++++++++++++++-----------
>>  4 files changed, 51 insertions(+), 17 deletions(-)
>>
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index e51dba8398f7..11cae6ce04ff 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -3743,9 +3743,15 @@ static inline bool gup_can_follow_protnone(struct vm_area_struct *vma,
>>  typedef int (*pte_fn_t)(pte_t *pte, unsigned long addr, void *data);
>>  extern int apply_to_page_range(struct mm_struct *mm, unsigned long address,
>>  			       unsigned long size, pte_fn_t fn, void *data);
>> +extern int apply_to_page_range_nolazy(struct mm_struct *mm,
>> +				      unsigned long address, unsigned long size,
>> +				      pte_fn_t fn, void *data);
> 
> We are removing externs as things are edited, so probably drop them
> here.

ACK

> 
>>  extern int apply_to_existing_page_range(struct mm_struct *mm,
>>  				   unsigned long address, unsigned long size,
>>  				   pte_fn_t fn, void *data);
>> +extern int apply_to_existing_page_range_nolazy(struct mm_struct *mm,
>> +				   unsigned long address, unsigned long size,
>> +				   pte_fn_t fn, void *data);
>>  
>>  #ifdef CONFIG_PAGE_POISONING
>>  extern void __kernel_poison_pages(struct page *page, int numpages);
>> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
>> index 0d56cea71602..ca833cfeefb7 100644
>> --- a/kernel/bpf/arena.c
>> +++ b/kernel/bpf/arena.c
>> @@ -187,10 +187,10 @@ static void arena_map_free(struct bpf_map *map)
>>  	/*
>>  	 * free_vm_area() calls remove_vm_area() that calls free_unmap_vmap_area().
>>  	 * It unmaps everything from vmalloc area and clears pgtables.
>> -	 * Call apply_to_existing_page_range() first to find populated ptes and
>> -	 * free those pages.
>> +	 * Call apply_to_existing_page_range_nolazy() first to find populated
>> +	 * ptes and free those pages.
>>  	 */
>> -	apply_to_existing_page_range(&init_mm, bpf_arena_get_kern_vm_start(arena),
>> +	apply_to_existing_page_range_nolazy(&init_mm, bpf_arena_get_kern_vm_start(arena),
>>  				     KERN_VM_SZ - GUARD_SZ, existing_page_cb, NULL);
>>  	free_vm_area(arena->kern_vm);
>>  	range_tree_destroy(&arena->rt);
>> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
>> index d2c70cd2afb1..2325c5166c3a 100644
>> --- a/mm/kasan/shadow.c
>> +++ b/mm/kasan/shadow.c
>> @@ -590,7 +590,7 @@ void kasan_release_vmalloc(unsigned long start, unsigned long end,
>>  
>>  
>>  		if (flags & KASAN_VMALLOC_PAGE_RANGE)
>> -			apply_to_existing_page_range(&init_mm,
>> +			apply_to_existing_page_range_nolazy(&init_mm,
>>  					     (unsigned long)shadow_start,
>>  					     size, kasan_depopulate_vmalloc_pte,
>>  					     NULL);
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 49199410805c..24436074ce48 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -2913,7 +2913,7 @@ EXPORT_SYMBOL(vm_iomap_memory);
>>  static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>>  				     unsigned long addr, unsigned long end,
>>  				     pte_fn_t fn, void *data, bool create,
>> -				     pgtbl_mod_mask *mask)
>> +				     pgtbl_mod_mask *mask, bool lazy_mmu)
>>  {
>>  	pte_t *pte, *mapped_pte;
>>  	int err = 0;
>> @@ -2933,7 +2933,8 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>>  			return -EINVAL;
>>  	}
>>  
>> -	arch_enter_lazy_mmu_mode();
>> +	if (lazy_mmu)
>> +		arch_enter_lazy_mmu_mode();
>>  
>>  	if (fn) {
>>  		do {
>> @@ -2946,7 +2947,8 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>>  	}
>>  	*mask |= PGTBL_PTE_MODIFIED;
>>  
>> -	arch_leave_lazy_mmu_mode();
>> +	if (lazy_mmu)
>> +		arch_leave_lazy_mmu_mode();
>>  
>>  	if (mm != &init_mm)
>>  		pte_unmap_unlock(mapped_pte, ptl);
>> @@ -2956,7 +2958,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>>  static int apply_to_pmd_range(struct mm_struct *mm, pud_t *pud,
>>  				     unsigned long addr, unsigned long end,
>>  				     pte_fn_t fn, void *data, bool create,
>> -				     pgtbl_mod_mask *mask)
>> +				     pgtbl_mod_mask *mask, bool lazy_mmu)
> 
> I am having a hard time understanding why other lazy mmus were more
> self-contained, but arm has added arguments to generic code?

They are not; as I explain in the cover letter, arm64 can work with the code as
it is today, but IMHO opinion it is very fragile and this is an attempt to
reduce the fragility (for all).

> 
>>  {
>>  	pmd_t *pmd;
>>  	unsigned long next;
>> @@ -2983,7 +2985,7 @@ static int apply_to_pmd_range(struct mm_struct *mm, pud_t *pud,
>>  			pmd_clear_bad(pmd);
>>  		}
>>  		err = apply_to_pte_range(mm, pmd, addr, next,
>> -					 fn, data, create, mask);
>> +					 fn, data, create, mask, lazy_mmu);
>>  		if (err)
>>  			break;
>>  	} while (pmd++, addr = next, addr != end);
>> @@ -2994,7 +2996,7 @@ static int apply_to_pmd_range(struct mm_struct *mm, pud_t *pud,
>>  static int apply_to_pud_range(struct mm_struct *mm, p4d_t *p4d,
>>  				     unsigned long addr, unsigned long end,
>>  				     pte_fn_t fn, void *data, bool create,
>> -				     pgtbl_mod_mask *mask)
>> +				     pgtbl_mod_mask *mask, bool lazy_mmu)
>>  {
>>  	pud_t *pud;
>>  	unsigned long next;
>> @@ -3019,7 +3021,7 @@ static int apply_to_pud_range(struct mm_struct *mm, p4d_t *p4d,
>>  			pud_clear_bad(pud);
>>  		}
>>  		err = apply_to_pmd_range(mm, pud, addr, next,
>> -					 fn, data, create, mask);
>> +					 fn, data, create, mask, lazy_mmu);
>>  		if (err)
>>  			break;
>>  	} while (pud++, addr = next, addr != end);
>> @@ -3030,7 +3032,7 @@ static int apply_to_pud_range(struct mm_struct *mm, p4d_t *p4d,
>>  static int apply_to_p4d_range(struct mm_struct *mm, pgd_t *pgd,
>>  				     unsigned long addr, unsigned long end,
>>  				     pte_fn_t fn, void *data, bool create,
>> -				     pgtbl_mod_mask *mask)
>> +				     pgtbl_mod_mask *mask, bool lazy_mmu)
>>  {
>>  	p4d_t *p4d;
>>  	unsigned long next;
>> @@ -3055,7 +3057,7 @@ static int apply_to_p4d_range(struct mm_struct *mm, pgd_t *pgd,
>>  			p4d_clear_bad(p4d);
>>  		}
>>  		err = apply_to_pud_range(mm, p4d, addr, next,
>> -					 fn, data, create, mask);
>> +					 fn, data, create, mask, lazy_mmu);
>>  		if (err)
>>  			break;
>>  	} while (p4d++, addr = next, addr != end);
>> @@ -3065,7 +3067,7 @@ static int apply_to_p4d_range(struct mm_struct *mm, pgd_t *pgd,
>>  
>>  static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
>>  				 unsigned long size, pte_fn_t fn,
>> -				 void *data, bool create)
>> +				 void *data, bool create, bool lazy_mmu)
>>  {
>>  	pgd_t *pgd;
>>  	unsigned long start = addr, next;
>> @@ -3091,7 +3093,7 @@ static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
>>  			pgd_clear_bad(pgd);
>>  		}
>>  		err = apply_to_p4d_range(mm, pgd, addr, next,
>> -					 fn, data, create, &mask);
>> +					 fn, data, create, &mask, lazy_mmu);
> 
> This is annoying.  We now have a bool, bool passed through with mask
> inserted in the middle.
> 
>>  		if (err)
>>  			break;
>>  	} while (pgd++, addr = next, addr != end);
>> @@ -3105,11 +3107,14 @@ static int __apply_to_page_range(struct mm_struct *mm, unsigned long addr,
>>  /*
>>   * Scan a region of virtual memory, filling in page tables as necessary
>>   * and calling a provided function on each leaf page table.
>> + *
>> + * fn() is called in lazy mmu mode. As a result, the callback must be careful
>> + * not to perform memory allocation.
>>   */
>>  int apply_to_page_range(struct mm_struct *mm, unsigned long addr,
>>  			unsigned long size, pte_fn_t fn, void *data)
>>  {
>> -	return __apply_to_page_range(mm, addr, size, fn, data, true);
>> +	return __apply_to_page_range(mm, addr, size, fn, data, true, true);
> 
> Please add something here to tell me what false, true is.
> 
>>  }
>>  EXPORT_SYMBOL_GPL(apply_to_page_range);
>>  
>> @@ -3117,13 +3122,36 @@ EXPORT_SYMBOL_GPL(apply_to_page_range);
>>   * Scan a region of virtual memory, calling a provided function on
>>   * each leaf page table where it exists.
>>   *
>> + * fn() is called in lazy mmu mode. As a result, the callback must be careful
>> + * not to perform memory allocation.
>> + *
>>   * Unlike apply_to_page_range, this does _not_ fill in page tables
>>   * where they are absent.
>>   */
>>  int apply_to_existing_page_range(struct mm_struct *mm, unsigned long addr,
>>  				 unsigned long size, pte_fn_t fn, void *data)
>>  {
>> -	return __apply_to_page_range(mm, addr, size, fn, data, false);
>> +	return __apply_to_page_range(mm, addr, size, fn, data, false, true);
> 
> every..
> 
>> +}
>> +
>> +/*
>> + * As per apply_to_page_range() but fn() is not called in lazy mmu mode.
>> + */
>> +int apply_to_page_range_nolazy(struct mm_struct *mm, unsigned long addr,
>> +			       unsigned long size, pte_fn_t fn, void *data)
>> +{
>> +	return __apply_to_page_range(mm, addr, size, fn, data, true, false);
> 
> one...
> 
>> +}
>> +
>> +/*
>> + * As per apply_to_existing_page_range() but fn() is not called in lazy mmu
>> + * mode.
>> + */
>> +int apply_to_existing_page_range_nolazy(struct mm_struct *mm,
>> +					unsigned long addr, unsigned long size,
>> +					pte_fn_t fn, void *data)
>> +{
>> +	return __apply_to_page_range(mm, addr, size, fn, data, false, false);
> 
> adds confusion :)
> 
> 
> These wrappers are terrible for readability and annoying for argument
> lists too.

Agreed.

> 
> Could we do something like the pgtbl_mod_mask or zap_details and pass
> through a struct or one unsigned int for create and lazy_mmu?

Or just create some enum flags?

> 
> At least we'd have better self-documenting code in the wrappers.. and if
> we ever need a third boolean, we could avoid multiplying the wrappers
> again.
> 
> WDYT?

I'm happy with either approach. I was expecting more constination about the idea
of being able to disable lazy mode though, so perhaps I'll wait and see if any
arrives. If it doesn't... flags?

> 
> Cheers,
> Liam


