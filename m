Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F45F8513F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 14:00:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYPhn04l6z3dRl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 00:00:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYPhM5JQDz3bpt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 00:00:34 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03E3BDA7;
	Mon, 12 Feb 2024 05:00:44 -0800 (PST)
Received: from [10.57.78.115] (unknown [10.57.78.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 95E743F7BD;
	Mon, 12 Feb 2024 04:59:58 -0800 (PST)
Message-ID: <c899f252-dbf3-4e7b-8342-b5a5180486cd@arm.com>
Date: Mon, 12 Feb 2024 12:59:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/25] arm64/mm: Wire up PTE_CONT for user mappings
Content-Language: en-GB
To: Mark Rutland <mark.rutland@arm.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <20240202080756.1453939-20-ryan.roberts@arm.com>
 <ZcoIVypNwOPIX30w@FVFF77S0Q05N>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ZcoIVypNwOPIX30w@FVFF77S0Q05N>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/02/2024 12:00, Mark Rutland wrote:
> Hi Ryan,
> 
> Overall this looks pretty good; I have a bunch of minor comments below, and a
> bigger question on the way ptep_get_lockless() works.

OK great - thanks for the review. Let's see if I can answer them all...

> 
> On Fri, Feb 02, 2024 at 08:07:50AM +0000, Ryan Roberts wrote:
>> With the ptep API sufficiently refactored, we can now introduce a new
>> "contpte" API layer, which transparently manages the PTE_CONT bit for
>> user mappings.
>>
>> In this initial implementation, only suitable batches of PTEs, set via
>> set_ptes(), are mapped with the PTE_CONT bit. Any subsequent
>> modification of individual PTEs will cause an "unfold" operation to
>> repaint the contpte block as individual PTEs before performing the
>> requested operation. While, a modification of a single PTE could cause
>> the block of PTEs to which it belongs to become eligible for "folding"
>> into a contpte entry, "folding" is not performed in this initial
>> implementation due to the costs of checking the requirements are met.
>> Due to this, contpte mappings will degrade back to normal pte mappings
>> over time if/when protections are changed. This will be solved in a
>> future patch.
>>
>> Since a contpte block only has a single access and dirty bit, the
>> semantic here changes slightly; when getting a pte (e.g. ptep_get())
>> that is part of a contpte mapping, the access and dirty information are
>> pulled from the block (so all ptes in the block return the same
>> access/dirty info). When changing the access/dirty info on a pte (e.g.
>> ptep_set_access_flags()) that is part of a contpte mapping, this change
>> will affect the whole contpte block. This is works fine in practice
>> since we guarantee that only a single folio is mapped by a contpte
>> block, and the core-mm tracks access/dirty information per folio.
>>
>> In order for the public functions, which used to be pure inline, to
>> continue to be callable by modules, export all the contpte_* symbols
>> that are now called by those public inline functions.
>>
>> The feature is enabled/disabled with the ARM64_CONTPTE Kconfig parameter
>> at build time. It defaults to enabled as long as its dependency,
>> TRANSPARENT_HUGEPAGE is also enabled. The core-mm depends upon
>> TRANSPARENT_HUGEPAGE to be able to allocate large folios, so if its not
>> enabled, then there is no chance of meeting the physical contiguity
>> requirement for contpte mappings.
>>
>> Tested-by: John Hubbard <jhubbard@nvidia.com>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  arch/arm64/Kconfig               |   9 +
>>  arch/arm64/include/asm/pgtable.h | 161 ++++++++++++++++++
>>  arch/arm64/mm/Makefile           |   1 +
>>  arch/arm64/mm/contpte.c          | 283 +++++++++++++++++++++++++++++++
>>  4 files changed, 454 insertions(+)
>>  create mode 100644 arch/arm64/mm/contpte.c
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index d86d7f4758b5..1442e8ed95b6 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -2230,6 +2230,15 @@ config UNWIND_PATCH_PAC_INTO_SCS
>>  	select UNWIND_TABLES
>>  	select DYNAMIC_SCS
>>  
>> +config ARM64_CONTPTE
>> +	bool "Contiguous PTE mappings for user memory" if EXPERT
>> +	depends on TRANSPARENT_HUGEPAGE
>> +	default y
>> +	help
>> +	  When enabled, user mappings are configured using the PTE contiguous
>> +	  bit, for any mappings that meet the size and alignment requirements.
>> +	  This reduces TLB pressure and improves performance.
>> +
>>  endmenu # "Kernel Features"
>>  
>>  menu "Boot options"
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index 7dc6b68ee516..34892a95403d 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -133,6 +133,10 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
>>   */
>>  #define pte_valid_not_user(pte) \
>>  	((pte_val(pte) & (PTE_VALID | PTE_USER | PTE_UXN)) == (PTE_VALID | PTE_UXN))
>> +/*
>> + * Returns true if the pte is valid and has the contiguous bit set.
>> + */
>> +#define pte_valid_cont(pte)	(pte_valid(pte) && pte_cont(pte))
>>  /*
>>   * Could the pte be present in the TLB? We must check mm_tlb_flush_pending
>>   * so that we don't erroneously return false for pages that have been
>> @@ -1135,6 +1139,161 @@ void vmemmap_update_pte(unsigned long addr, pte_t *ptep, pte_t pte);
>>  #define vmemmap_update_pte vmemmap_update_pte
>>  #endif
>>  
>> +#ifdef CONFIG_ARM64_CONTPTE
>> +
>> +/*
>> + * The contpte APIs are used to transparently manage the contiguous bit in ptes
>> + * where it is possible and makes sense to do so. The PTE_CONT bit is considered
>> + * a private implementation detail of the public ptep API (see below).
>> + */
>> +extern void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>> +				pte_t *ptep, pte_t pte);
>> +extern pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte);
>> +extern pte_t contpte_ptep_get_lockless(pte_t *orig_ptep);
>> +extern void contpte_set_ptes(struct mm_struct *mm, unsigned long addr,
>> +				pte_t *ptep, pte_t pte, unsigned int nr);
>> +extern int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
>> +				unsigned long addr, pte_t *ptep);
>> +extern int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
>> +				unsigned long addr, pte_t *ptep);
>> +extern int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
>> +				unsigned long addr, pte_t *ptep,
>> +				pte_t entry, int dirty);
>> +
>> +static inline void contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>> +					pte_t *ptep, pte_t pte)
>> +{
>> +	if (unlikely(pte_valid_cont(pte)))
>> +		__contpte_try_unfold(mm, addr, ptep, pte);
>> +}
>> +
>> +/*
>> + * The below functions constitute the public API that arm64 presents to the
>> + * core-mm to manipulate PTE entries within their page tables (or at least this
>> + * is the subset of the API that arm64 needs to implement). These public
>> + * versions will automatically and transparently apply the contiguous bit where
>> + * it makes sense to do so. Therefore any users that are contig-aware (e.g.
>> + * hugetlb, kernel mapper) should NOT use these APIs, but instead use the
>> + * private versions, which are prefixed with double underscore. All of these
>> + * APIs except for ptep_get_lockless() are expected to be called with the PTL
>> + * held.
>> + */
>> +
>> +#define ptep_get ptep_get
>> +static inline pte_t ptep_get(pte_t *ptep)
>> +{
>> +	pte_t pte = __ptep_get(ptep);
>> +
>> +	if (likely(!pte_valid_cont(pte)))
>> +		return pte;
>> +
>> +	return contpte_ptep_get(ptep, pte);
>> +}
>> +
>> +#define ptep_get_lockless ptep_get_lockless
>> +static inline pte_t ptep_get_lockless(pte_t *ptep)
>> +{
>> +	pte_t pte = __ptep_get(ptep);
>> +
>> +	if (likely(!pte_valid_cont(pte)))
>> +		return pte;
>> +
>> +	return contpte_ptep_get_lockless(ptep);
>> +}
>> +
>> +static inline void set_pte(pte_t *ptep, pte_t pte)
>> +{
>> +	/*
>> +	 * We don't have the mm or vaddr so cannot unfold contig entries (since
>> +	 * it requires tlb maintenance). set_pte() is not used in core code, so
>> +	 * this should never even be called. Regardless do our best to service
>> +	 * any call and emit a warning if there is any attempt to set a pte on
>> +	 * top of an existing contig range.
>> +	 */
>> +	pte_t orig_pte = __ptep_get(ptep);
>> +
>> +	WARN_ON_ONCE(pte_valid_cont(orig_pte));
>> +	__set_pte(ptep, pte_mknoncont(pte));
>> +}
>> +
>> +#define set_ptes set_ptes
>> +static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>> +				pte_t *ptep, pte_t pte, unsigned int nr)
>> +{
>> +	pte = pte_mknoncont(pte);
> 
> Why do we have to clear the contiguous bit here? Is that for the same reason as
> set_pte(), or do we expect callers to legitimately call this with the
> contiguous bit set in 'pte'?
> 
> I think you explained this to me in-person, and IIRC we don't expect callers to
> go set the bit themselves, but since it 'leaks' out to them via __ptep_get() we
> have to clear it here to defer the decision of whether to set/clear it when
> modifying entries. It would be nice if we could have a description of why/when
> we need to clear this, e.g. in the 'public API' comment block above.

Yes, I think you've got it, but just to ram home the point: The PTE_CONT bit is
private to the architecture code and is never set directly by core code. If the
public API ever receives a pte that happens to have the PTE_CONT bit set, it
would be bad news if we then accidentally set that in the pgtable.

Ideally, we would just uncondidtionally clear the bit before a getter returns
the pte (e.g. ptep_get(), ptep_get_lockless(), ptep_get_and_clear(), ...). That
way, the code code is guarranteed never to see a pte with the PTE_CONT bit set
and can therefore never accidentally pass such a pte into a setter function.
However, there is existing functionality that relies on being able to get a pte,
then pass it to pte_leaf_size(), and arch function that checks the PTE_CONT bit
to determine how big the leaf is. This is used in perf_get_pgtable_size().

So to allow perf_get_pgtable_size() to continue to see the "real" page size, I
decided to allow PTE_CONT to leak through the getters and instead
unconditionally clear the bit when a pte is passed to any of the setters.

I'll add a (slightly less verbose) comment as you suggest.

> 
>> +
>> +	if (likely(nr == 1)) {
>> +		contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
>> +		__set_ptes(mm, addr, ptep, pte, 1);
>> +	} else {
>> +		contpte_set_ptes(mm, addr, ptep, pte, nr);
>> +	}
>> +}
>> +
>> +static inline void pte_clear(struct mm_struct *mm,
>> +				unsigned long addr, pte_t *ptep)
>> +{
>> +	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
>> +	__pte_clear(mm, addr, ptep);
>> +}
>> +
>> +#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
>> +static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
>> +				unsigned long addr, pte_t *ptep)
>> +{
>> +	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
>> +	return __ptep_get_and_clear(mm, addr, ptep);
>> +}
>> +
>> +#define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
>> +static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
>> +				unsigned long addr, pte_t *ptep)
>> +{
>> +	pte_t orig_pte = __ptep_get(ptep);
>> +
>> +	if (likely(!pte_valid_cont(orig_pte)))
>> +		return __ptep_test_and_clear_young(vma, addr, ptep);
>> +
>> +	return contpte_ptep_test_and_clear_young(vma, addr, ptep);
>> +}
>> +
>> +#define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
>> +static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>> +				unsigned long addr, pte_t *ptep)
>> +{
>> +	pte_t orig_pte = __ptep_get(ptep);
>> +
>> +	if (likely(!pte_valid_cont(orig_pte)))
>> +		return __ptep_clear_flush_young(vma, addr, ptep);
>> +
>> +	return contpte_ptep_clear_flush_young(vma, addr, ptep);
>> +}
>> +
>> +#define __HAVE_ARCH_PTEP_SET_WRPROTECT
>> +static inline void ptep_set_wrprotect(struct mm_struct *mm,
>> +				unsigned long addr, pte_t *ptep)
>> +{
>> +	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
>> +	__ptep_set_wrprotect(mm, addr, ptep);
>> +}
>> +
>> +#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
>> +static inline int ptep_set_access_flags(struct vm_area_struct *vma,
>> +				unsigned long addr, pte_t *ptep,
>> +				pte_t entry, int dirty)
>> +{
>> +	pte_t orig_pte = __ptep_get(ptep);
>> +
>> +	entry = pte_mknoncont(entry);
>> +
>> +	if (likely(!pte_valid_cont(orig_pte)))
>> +		return __ptep_set_access_flags(vma, addr, ptep, entry, dirty);
>> +
>> +	return contpte_ptep_set_access_flags(vma, addr, ptep, entry, dirty);
>> +}
>> +
>> +#else /* CONFIG_ARM64_CONTPTE */
>> +
>>  #define ptep_get				__ptep_get
>>  #define set_pte					__set_pte
>>  #define set_ptes				__set_ptes
>> @@ -1150,6 +1309,8 @@ void vmemmap_update_pte(unsigned long addr, pte_t *ptep, pte_t pte);
>>  #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
>>  #define ptep_set_access_flags			__ptep_set_access_flags
>>  
>> +#endif /* CONFIG_ARM64_CONTPTE */
>> +
>>  #endif /* !__ASSEMBLY__ */
>>  
>>  #endif /* __ASM_PGTABLE_H */
>> diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
>> index dbd1bc95967d..60454256945b 100644
>> --- a/arch/arm64/mm/Makefile
>> +++ b/arch/arm64/mm/Makefile
>> @@ -3,6 +3,7 @@ obj-y				:= dma-mapping.o extable.o fault.o init.o \
>>  				   cache.o copypage.o flush.o \
>>  				   ioremap.o mmap.o pgd.o mmu.o \
>>  				   context.o proc.o pageattr.o fixmap.o
>> +obj-$(CONFIG_ARM64_CONTPTE)	+= contpte.o
>>  obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
>>  obj-$(CONFIG_PTDUMP_CORE)	+= ptdump.o
>>  obj-$(CONFIG_PTDUMP_DEBUGFS)	+= ptdump_debugfs.o
>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>> new file mode 100644
>> index 000000000000..bfb50e6b44c7
>> --- /dev/null
>> +++ b/arch/arm64/mm/contpte.c
>> @@ -0,0 +1,283 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2023 ARM Ltd.
>> + */
>> +
>> +#include <linux/mm.h>
>> +#include <linux/export.h>
>> +#include <asm/tlbflush.h>
>> +
>> +static inline bool mm_is_user(struct mm_struct *mm)
>> +{
>> +	/*
>> +	 * Don't attempt to apply the contig bit to kernel mappings, because
>> +	 * dynamically adding/removing the contig bit can cause page faults.
>> +	 * These racing faults are ok for user space, since they get serialized
>> +	 * on the PTL. But kernel mappings can't tolerate faults.
>> +	 */
>> +	return mm != &init_mm;
>> +}
> 
> We also have the efi_mm as a non-user mm, though I don't think we manipulate
> that while it is live, and I'm not sure if that needs any special handling.

Well we never need this function in the hot (order-0 folio) path, so I think I
could add a check for efi_mm here with performance implication. It's probably
safest to explicitly exclude it? What do you think?

> 
>> +static inline pte_t *contpte_align_down(pte_t *ptep)
>> +{
>> +	return (pte_t *)(ALIGN_DOWN((unsigned long)ptep >> 3, CONT_PTES) << 3);
> 
> I think this can be:
> 
> static inline pte_t *contpte_align_down(pte_t *ptep)
> {
> 	return PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
> }

Yep - that's much less ugly - thanks!

> 
>> +
>> +static void contpte_convert(struct mm_struct *mm, unsigned long addr,
>> +			    pte_t *ptep, pte_t pte)
>> +{
>> +	struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
>> +	unsigned long start_addr;
>> +	pte_t *start_ptep;
>> +	int i;
>> +
>> +	start_ptep = ptep = contpte_align_down(ptep);
>> +	start_addr = addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
>> +	pte = pfn_pte(ALIGN_DOWN(pte_pfn(pte), CONT_PTES), pte_pgprot(pte));
>> +
>> +	for (i = 0; i < CONT_PTES; i++, ptep++, addr += PAGE_SIZE) {
>> +		pte_t ptent = __ptep_get_and_clear(mm, addr, ptep);
>> +
>> +		if (pte_dirty(ptent))
>> +			pte = pte_mkdirty(pte);
>> +
>> +		if (pte_young(ptent))
>> +			pte = pte_mkyoung(pte);
>> +	}
> 
> Not a big deal either way, but I wonder if it makes more sense to accumulate
> the 'ptent' dirty/young values, then modify 'pte' once, i.e.
> 
> 	bool dirty = false, young = false;
> 
> 	for (...) {
> 		pte_t ptent = __ptep_get_and_clear(mm, addr, ptep);
> 		dirty |= pte_dirty(ptent);
> 		young |= pte_young(ptent);
> 	}
> 
> 	if (dirty)
> 		pte_mkdirty(pte);
> 	if (young)
> 		pte_mkyoung(pte);
> 
> I suspect that might generate slightly better code, but I'm also happy with the
> current form if people thnk that's more legible (I have no strong feelings
> either way).

I kept it this way, because its the same pattern used in arm64's hugetlbpage.c.
We also had the same comment against David's batching patches recently, and he
opted to stick with the former version:

https://lore.kernel.org/linux-mm/d83309fa-4daa-430f-ae52-4e72162bca9a@redhat.com/

So I'm inclined to leave it as is, since you're not insisting :)

> 
>> +
>> +	__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
>> +
>> +	__set_ptes(mm, start_addr, start_ptep, pte, CONT_PTES);
>> +}
>> +
>> +void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>> +			pte_t *ptep, pte_t pte)
>> +{
>> +	/*
>> +	 * We have already checked that the ptes are contiguous in
>> +	 * contpte_try_unfold(), so just check that the mm is user space.
>> +	 */
>> +
>> +	if (!mm_is_user(mm))
>> +		return;
> 
> Nit: normally we don't put a line gap between a comment block and the
> associated block of code.

ACK, I'll fix in next version.

> 
>> +
>> +	pte = pte_mknoncont(pte);
>> +	contpte_convert(mm, addr, ptep, pte);
>> +}
>> +EXPORT_SYMBOL(__contpte_try_unfold);
>> +
>> +pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>> +{
>> +	/*
>> +	 * Gather access/dirty bits, which may be populated in any of the ptes
>> +	 * of the contig range. We are guarranteed to be holding the PTL, so any
>> +	 * contiguous range cannot be unfolded or otherwise modified under our
>> +	 * feet.
>> +	 */
> 
> Nit: s/guarranteed/guaranteed/

ACK, I'll fix in next version.

> 
>> +
>> +	pte_t pte;
>> +	int i;
>> +
>> +	ptep = contpte_align_down(ptep);
>> +
>> +	for (i = 0; i < CONT_PTES; i++, ptep++) {
>> +		pte = __ptep_get(ptep);
>> +
>> +		if (pte_dirty(pte))
>> +			orig_pte = pte_mkdirty(orig_pte);
>> +
>> +		if (pte_young(pte))
>> +			orig_pte = pte_mkyoung(orig_pte);
>> +	}
>> +
>> +	return orig_pte;
>> +}
>> +EXPORT_SYMBOL(contpte_ptep_get);
>> +
>> +pte_t contpte_ptep_get_lockless(pte_t *orig_ptep)
>> +{
>> +	/*
>> +	 * Gather access/dirty bits, which may be populated in any of the ptes
>> +	 * of the contig range. We may not be holding the PTL, so any contiguous
>> +	 * range may be unfolded/modified/refolded under our feet. Therefore we
>> +	 * ensure we read a _consistent_ contpte range by checking that all ptes
>> +	 * in the range are valid and have CONT_PTE set, that all pfns are
>> +	 * contiguous and that all pgprots are the same (ignoring access/dirty).
>> +	 * If we find a pte that is not consistent, then we must be racing with
>> +	 * an update so start again. If the target pte does not have CONT_PTE
>> +	 * set then that is considered consistent on its own because it is not
>> +	 * part of a contpte range.
>> +	 */
>> +
>> +	pgprot_t orig_prot;
>> +	unsigned long pfn;
>> +	pte_t orig_pte;
>> +	pgprot_t prot;
>> +	pte_t *ptep;
>> +	pte_t pte;
>> +	int i;
>> +
>> +retry:
>> +	orig_pte = __ptep_get(orig_ptep);
>> +
>> +	if (!pte_valid_cont(orig_pte))
>> +		return orig_pte;
>> +
>> +	orig_prot = pte_pgprot(pte_mkold(pte_mkclean(orig_pte)));
>> +	ptep = contpte_align_down(orig_ptep);
>> +	pfn = pte_pfn(orig_pte) - (orig_ptep - ptep);
>> +
>> +	for (i = 0; i < CONT_PTES; i++, ptep++, pfn++) {
>> +		pte = __ptep_get(ptep);
>> +		prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
>> +
>> +		if (!pte_valid_cont(pte) ||
>> +		   pte_pfn(pte) != pfn ||
>> +		   pgprot_val(prot) != pgprot_val(orig_prot))
>> +			goto retry;
>> +
>> +		if (pte_dirty(pte))
>> +			orig_pte = pte_mkdirty(orig_pte);
>> +
>> +		if (pte_young(pte))
>> +			orig_pte = pte_mkyoung(orig_pte);
>> +	}
>> +
>> +	return orig_pte;
>> +}
>> +EXPORT_SYMBOL(contpte_ptep_get_lockless);
> 
> I'm struggling to convince myself that this is safe in general, as it really
> depends on how the caller will use this value. Which caller(s) actually care
> about the access/dirty bits, given those could change at any time anyway?

I think your points below are valid, and agree we should try to make this work
without needing access/dirty if possible. But can you elaborate on why you don't
think it's safe?

> 
> I took a quick scan, and AFAICT:

Thanks for enumerating these; Saves me from having to refresh my memory :)

> 
> * For perf_get_pgtable_size(), we only care about whether the entry is valid
>   and has the contig bit set. We could clean that up with a new interface, e.g.
>   something like a new ptep_get_size_lockless().
> 
> * For gup_pte_range(), I'm not sure we actually need the access/dirty bits when
>   we look at the pte to start with, since we only care where we can logically
>   write to the page at that point.
> 
>   I see that we later follow up with:
> 
>     with pte_val(pte) != pte_val(ptep_get(ptep)))
> 
>   ... is that why we need ptep_get_lockless() to accumulate the access/dirty
>   bits? So that shape of lockless-try...locked-compare sequence works?
> 
> * For huge_pte_alloc(), arm64 doesn't select CONFIG_ARCH_WANT_GENERAL_HUGETLB,
>   so this doesn' seem to matter.
> 
> * For __collapse_huge_page_swapin(), we only care if the pte is a swap pte,
>   which means the pte isn't valid, and we'll return the orig_pte as-is anyway.
> 
> * For pte_range_none() the access/dirty bits don't matter.
> 
> * For handle_pte_fault() I think we have the same shape of
>   lockless-try...locked-compare sequence as for gup_pte_range(), where we don't
>   care about the acess/dirty bits before we reach the locked compare step.
> 
> * For ptdump_pte_entry() I think it's arguable that we should continue to
>   report the access/dirty bits separately for each PTE, as we have done until
>   now, to give an accurate representation of the contents of the translation
>   tables.
> 
> * For swap_vma_readahead() and unuse_pte_range() we only care if the PTE is a
>   swap entry, the access/dirty bits don't matter.
> 
> So AFAICT this only really matters for gup_pte_range() and handle_pte_fault(),
> and IIUC that's only so that the locklessly-loaded pte value can be compared
> with a subsequently locked-loaded entry (for which the access/dirty bits will
> be accumulated). Have I understood that correctly?

Yes, I agree with what you are saying. My approach was to try to implement the
existing APIs accurately though, the argument being that it reduces the chances
of getting it wrong. But if you think the implementation is unsafe, then I guess
it blows that out of the water...

> 
> If so, I wonder if we could instead do that comparison modulo the access/dirty
> bits, 

I think that would work - but will need to think a bit more on it.

> and leave ptep_get_lockless() only reading a single entry?

I think we will need to do something a bit less fragile. ptep_get() does collect
the access/dirty bits so its confusing if ptep_get_lockless() doesn't IMHO. So
we will likely want to rename the function and make its documentation explicit
that it does not return those bits.

ptep_get_lockless_noyoungdirty()? yuk... Any ideas?

Of course if I could convince you the current implementation is safe, I might be
able to sidestep this optimization until a later date?

Thanks,
Ryan


> 
> Thanks,
> Mark.
> 
>> +void contpte_set_ptes(struct mm_struct *mm, unsigned long addr,
>> +					pte_t *ptep, pte_t pte, unsigned int nr)
>> +{
>> +	unsigned long next;
>> +	unsigned long end;
>> +	unsigned long pfn;
>> +	pgprot_t prot;
>> +
>> +	/*
>> +	 * The set_ptes() spec guarantees that when nr > 1, the initial state of
>> +	 * all ptes is not-present. Therefore we never need to unfold or
>> +	 * otherwise invalidate a range before we set the new ptes.
>> +	 * contpte_set_ptes() should never be called for nr < 2.
>> +	 */
>> +	VM_WARN_ON(nr == 1);
>> +
>> +	if (!mm_is_user(mm))
>> +		return __set_ptes(mm, addr, ptep, pte, nr);
>> +
>> +	end = addr + (nr << PAGE_SHIFT);
>> +	pfn = pte_pfn(pte);
>> +	prot = pte_pgprot(pte);
>> +
>> +	do {
>> +		next = pte_cont_addr_end(addr, end);
>> +		nr = (next - addr) >> PAGE_SHIFT;
>> +		pte = pfn_pte(pfn, prot);
>> +
>> +		if (((addr | next | (pfn << PAGE_SHIFT)) & ~CONT_PTE_MASK) == 0)
>> +			pte = pte_mkcont(pte);
>> +		else
>> +			pte = pte_mknoncont(pte);
>> +
>> +		__set_ptes(mm, addr, ptep, pte, nr);
>> +
>> +		addr = next;
>> +		ptep += nr;
>> +		pfn += nr;
>> +
>> +	} while (addr != end);
>> +}
>> +EXPORT_SYMBOL(contpte_set_ptes);
>> +
>> +int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
>> +					unsigned long addr, pte_t *ptep)
>> +{
>> +	/*
>> +	 * ptep_clear_flush_young() technically requires us to clear the access
>> +	 * flag for a _single_ pte. However, the core-mm code actually tracks
>> +	 * access/dirty per folio, not per page. And since we only create a
>> +	 * contig range when the range is covered by a single folio, we can get
>> +	 * away with clearing young for the whole contig range here, so we avoid
>> +	 * having to unfold.
>> +	 */
>> +
>> +	int young = 0;
>> +	int i;
>> +
>> +	ptep = contpte_align_down(ptep);
>> +	addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
>> +
>> +	for (i = 0; i < CONT_PTES; i++, ptep++, addr += PAGE_SIZE)
>> +		young |= __ptep_test_and_clear_young(vma, addr, ptep);
>> +
>> +	return young;
>> +}
>> +EXPORT_SYMBOL(contpte_ptep_test_and_clear_young);
>> +
>> +int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
>> +					unsigned long addr, pte_t *ptep)
>> +{
>> +	int young;
>> +
>> +	young = contpte_ptep_test_and_clear_young(vma, addr, ptep);
>> +
>> +	if (young) {
>> +		/*
>> +		 * See comment in __ptep_clear_flush_young(); same rationale for
>> +		 * eliding the trailing DSB applies here.
>> +		 */
>> +		addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
>> +		__flush_tlb_range_nosync(vma, addr, addr + CONT_PTE_SIZE,
>> +					 PAGE_SIZE, true, 3);
>> +	}
>> +
>> +	return young;
>> +}
>> +EXPORT_SYMBOL(contpte_ptep_clear_flush_young);
>> +
>> +int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
>> +					unsigned long addr, pte_t *ptep,
>> +					pte_t entry, int dirty)
>> +{
>> +	unsigned long start_addr;
>> +	pte_t orig_pte;
>> +	int i;
>> +
>> +	/*
>> +	 * Gather the access/dirty bits for the contiguous range. If nothing has
>> +	 * changed, its a noop.
>> +	 */
>> +	orig_pte = pte_mknoncont(ptep_get(ptep));
>> +	if (pte_val(orig_pte) == pte_val(entry))
>> +		return 0;
>> +
>> +	/*
>> +	 * We can fix up access/dirty bits without having to unfold the contig
>> +	 * range. But if the write bit is changing, we must unfold.
>> +	 */
>> +	if (pte_write(orig_pte) == pte_write(entry)) {
>> +		/*
>> +		 * For HW access management, we technically only need to update
>> +		 * the flag on a single pte in the range. But for SW access
>> +		 * management, we need to update all the ptes to prevent extra
>> +		 * faults. Avoid per-page tlb flush in __ptep_set_access_flags()
>> +		 * and instead flush the whole range at the end.
>> +		 */
>> +		ptep = contpte_align_down(ptep);
>> +		start_addr = addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
>> +
>> +		for (i = 0; i < CONT_PTES; i++, ptep++, addr += PAGE_SIZE)
>> +			__ptep_set_access_flags(vma, addr, ptep, entry, 0);
>> +
>> +		if (dirty)
>> +			__flush_tlb_range(vma, start_addr, addr,
>> +							PAGE_SIZE, true, 3);
>> +	} else {
>> +		__contpte_try_unfold(vma->vm_mm, addr, ptep, orig_pte);
>> +		__ptep_set_access_flags(vma, addr, ptep, entry, dirty);
>> +	}
>> +
>> +	return 1;
>> +}
>> +EXPORT_SYMBOL(contpte_ptep_set_access_flags);
>> -- 
>> 2.25.1
>>

