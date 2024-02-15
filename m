Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3D485616F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 12:24:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbCPt4Nvlz3vb6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 22:24:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbCPS3BtKz3020
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 22:23:55 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D48E2150C;
	Thu, 15 Feb 2024 03:24:04 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.68.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4026F3F7B4;
	Thu, 15 Feb 2024 03:23:20 -0800 (PST)
Date: Thu, 15 Feb 2024 11:23:17 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v6 10/18] arm64/mm: New ptep layer to manage contig bit
Message-ID: <Zc30JQJEoAMqdt_T@FVFF77S0Q05N>
References: <20240215103205.2607016-1-ryan.roberts@arm.com>
 <20240215103205.2607016-11-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215103205.2607016-11-ryan.roberts@arm.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 15, 2024 at 10:31:57AM +0000, Ryan Roberts wrote:
> Create a new layer for the in-table PTE manipulation APIs. For now, The
> existing API is prefixed with double underscore to become the
> arch-private API and the public API is just a simple wrapper that calls
> the private API.
> 
> The public API implementation will subsequently be used to transparently
> manipulate the contiguous bit where appropriate. But since there are
> already some contig-aware users (e.g. hugetlb, kernel mapper), we must
> first ensure those users use the private API directly so that the future
> contig-bit manipulations in the public API do not interfere with those
> existing uses.
> 
> The following APIs are treated this way:
> 
>  - ptep_get
>  - set_pte
>  - set_ptes
>  - pte_clear
>  - ptep_get_and_clear
>  - ptep_test_and_clear_young
>  - ptep_clear_flush_young
>  - ptep_set_wrprotect
>  - ptep_set_access_flags
> 
> Tested-by: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/include/asm/pgtable.h | 83 +++++++++++++++++---------------
>  arch/arm64/kernel/efi.c          |  4 +-
>  arch/arm64/kernel/mte.c          |  2 +-
>  arch/arm64/kvm/guest.c           |  2 +-
>  arch/arm64/mm/fault.c            | 12 ++---
>  arch/arm64/mm/fixmap.c           |  4 +-
>  arch/arm64/mm/hugetlbpage.c      | 40 +++++++--------
>  arch/arm64/mm/kasan_init.c       |  6 +--
>  arch/arm64/mm/mmu.c              | 14 +++---
>  arch/arm64/mm/pageattr.c         |  6 +--
>  arch/arm64/mm/trans_pgd.c        |  6 +--
>  11 files changed, 93 insertions(+), 86 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 9a2df85eb493..7336d40a893a 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -93,7 +93,8 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
>  	__pte(__phys_to_pte_val((phys_addr_t)(pfn) << PAGE_SHIFT) | pgprot_val(prot))
>  
>  #define pte_none(pte)		(!pte_val(pte))
> -#define pte_clear(mm,addr,ptep)	set_pte(ptep, __pte(0))
> +#define __pte_clear(mm, addr, ptep) \
> +				__set_pte(ptep, __pte(0))
>  #define pte_page(pte)		(pfn_to_page(pte_pfn(pte)))
>  
>  /*
> @@ -137,7 +138,7 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
>   * so that we don't erroneously return false for pages that have been
>   * remapped as PROT_NONE but are yet to be flushed from the TLB.
>   * Note that we can't make any assumptions based on the state of the access
> - * flag, since ptep_clear_flush_young() elides a DSB when invalidating the
> + * flag, since __ptep_clear_flush_young() elides a DSB when invalidating the
>   * TLB.
>   */
>  #define pte_accessible(mm, pte)	\
> @@ -261,7 +262,7 @@ static inline pte_t pte_mkdevmap(pte_t pte)
>  	return set_pte_bit(pte, __pgprot(PTE_DEVMAP | PTE_SPECIAL));
>  }
>  
> -static inline void set_pte(pte_t *ptep, pte_t pte)
> +static inline void __set_pte(pte_t *ptep, pte_t pte)
>  {
>  	WRITE_ONCE(*ptep, pte);
>  
> @@ -275,8 +276,7 @@ static inline void set_pte(pte_t *ptep, pte_t pte)
>  	}
>  }
>  
> -#define ptep_get ptep_get
> -static inline pte_t ptep_get(pte_t *ptep)
> +static inline pte_t __ptep_get(pte_t *ptep)
>  {
>  	return READ_ONCE(*ptep);
>  }
> @@ -308,7 +308,7 @@ static inline void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep,
>  	if (!IS_ENABLED(CONFIG_DEBUG_VM))
>  		return;
>  
> -	old_pte = ptep_get(ptep);
> +	old_pte = __ptep_get(ptep);
>  
>  	if (!pte_valid(old_pte) || !pte_valid(pte))
>  		return;
> @@ -317,7 +317,7 @@ static inline void __check_safe_pte_update(struct mm_struct *mm, pte_t *ptep,
>  
>  	/*
>  	 * Check for potential race with hardware updates of the pte
> -	 * (ptep_set_access_flags safely changes valid ptes without going
> +	 * (__ptep_set_access_flags safely changes valid ptes without going
>  	 * through an invalid entry).
>  	 */
>  	VM_WARN_ONCE(!pte_young(pte),
> @@ -363,23 +363,22 @@ static inline pte_t pte_advance_pfn(pte_t pte, unsigned long nr)
>  	return pfn_pte(pte_pfn(pte) + nr, pte_pgprot(pte));
>  }
>  
> -static inline void set_ptes(struct mm_struct *mm,
> -			    unsigned long __always_unused addr,
> -			    pte_t *ptep, pte_t pte, unsigned int nr)
> +static inline void __set_ptes(struct mm_struct *mm,
> +			      unsigned long __always_unused addr,
> +			      pte_t *ptep, pte_t pte, unsigned int nr)
>  {
>  	page_table_check_ptes_set(mm, ptep, pte, nr);
>  	__sync_cache_and_tags(pte, nr);
>  
>  	for (;;) {
>  		__check_safe_pte_update(mm, ptep, pte);
> -		set_pte(ptep, pte);
> +		__set_pte(ptep, pte);
>  		if (--nr == 0)
>  			break;
>  		ptep++;
>  		pte = pte_advance_pfn(pte, 1);
>  	}
>  }
> -#define set_ptes set_ptes
>  
>  /*
>   * Huge pte definitions.
> @@ -546,7 +545,7 @@ static inline void __set_pte_at(struct mm_struct *mm,
>  {
>  	__sync_cache_and_tags(pte, nr);
>  	__check_safe_pte_update(mm, ptep, pte);
> -	set_pte(ptep, pte);
> +	__set_pte(ptep, pte);
>  }
>  
>  static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
> @@ -860,8 +859,7 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
>  	return pte_pmd(pte_modify(pmd_pte(pmd), newprot));
>  }
>  
> -#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
> -extern int ptep_set_access_flags(struct vm_area_struct *vma,
> +extern int __ptep_set_access_flags(struct vm_area_struct *vma,
>  				 unsigned long address, pte_t *ptep,
>  				 pte_t entry, int dirty);
>  
> @@ -871,7 +869,8 @@ static inline int pmdp_set_access_flags(struct vm_area_struct *vma,
>  					unsigned long address, pmd_t *pmdp,
>  					pmd_t entry, int dirty)
>  {
> -	return ptep_set_access_flags(vma, address, (pte_t *)pmdp, pmd_pte(entry), dirty);
> +	return __ptep_set_access_flags(vma, address, (pte_t *)pmdp,
> +							pmd_pte(entry), dirty);
>  }
>  
>  static inline int pud_devmap(pud_t pud)
> @@ -905,12 +904,13 @@ static inline bool pud_user_accessible_page(pud_t pud)
>  /*
>   * Atomic pte/pmd modifications.
>   */
> -#define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
> -static inline int __ptep_test_and_clear_young(pte_t *ptep)
> +static inline int __ptep_test_and_clear_young(struct vm_area_struct *vma,
> +					      unsigned long address,
> +					      pte_t *ptep)
>  {
>  	pte_t old_pte, pte;
>  
> -	pte = ptep_get(ptep);
> +	pte = __ptep_get(ptep);
>  	do {
>  		old_pte = pte;
>  		pte = pte_mkold(pte);
> @@ -921,18 +921,10 @@ static inline int __ptep_test_and_clear_young(pte_t *ptep)
>  	return pte_young(pte);
>  }
>  
> -static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
> -					    unsigned long address,
> -					    pte_t *ptep)
> -{
> -	return __ptep_test_and_clear_young(ptep);
> -}
> -
> -#define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
> -static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
> +static inline int __ptep_clear_flush_young(struct vm_area_struct *vma,
>  					 unsigned long address, pte_t *ptep)
>  {
> -	int young = ptep_test_and_clear_young(vma, address, ptep);
> +	int young = __ptep_test_and_clear_young(vma, address, ptep);
>  
>  	if (young) {
>  		/*
> @@ -955,12 +947,11 @@ static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
>  					    unsigned long address,
>  					    pmd_t *pmdp)
>  {
> -	return ptep_test_and_clear_young(vma, address, (pte_t *)pmdp);
> +	return __ptep_test_and_clear_young(vma, address, (pte_t *)pmdp);
>  }
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
> -#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
> -static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
> +static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
>  				       unsigned long address, pte_t *ptep)
>  {
>  	pte_t pte = __pte(xchg_relaxed(&pte_val(*ptep), 0));
> @@ -984,15 +975,15 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
>  /*
> - * ptep_set_wrprotect - mark read-only while trasferring potential hardware
> + * __ptep_set_wrprotect - mark read-only while trasferring potential hardware
>   * dirty status (PTE_DBM && !PTE_RDONLY) to the software PTE_DIRTY bit.
>   */
> -#define __HAVE_ARCH_PTEP_SET_WRPROTECT
> -static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long address, pte_t *ptep)
> +static inline void __ptep_set_wrprotect(struct mm_struct *mm,
> +					unsigned long address, pte_t *ptep)
>  {
>  	pte_t old_pte, pte;
>  
> -	pte = ptep_get(ptep);
> +	pte = __ptep_get(ptep);
>  	do {
>  		old_pte = pte;
>  		pte = pte_wrprotect(pte);
> @@ -1006,7 +997,7 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addres
>  static inline void pmdp_set_wrprotect(struct mm_struct *mm,
>  				      unsigned long address, pmd_t *pmdp)
>  {
> -	ptep_set_wrprotect(mm, address, (pte_t *)pmdp);
> +	__ptep_set_wrprotect(mm, address, (pte_t *)pmdp);
>  }
>  
>  #define pmdp_establish pmdp_establish
> @@ -1084,7 +1075,7 @@ static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
>  #endif /* CONFIG_ARM64_MTE */
>  
>  /*
> - * On AArch64, the cache coherency is handled via the set_ptes() function.
> + * On AArch64, the cache coherency is handled via the __set_ptes() function.
>   */
>  static inline void update_mmu_cache_range(struct vm_fault *vmf,
>  		struct vm_area_struct *vma, unsigned long addr, pte_t *ptep,
> @@ -1136,6 +1127,22 @@ extern pte_t ptep_modify_prot_start(struct vm_area_struct *vma,
>  extern void ptep_modify_prot_commit(struct vm_area_struct *vma,
>  				    unsigned long addr, pte_t *ptep,
>  				    pte_t old_pte, pte_t new_pte);
> +
> +#define ptep_get				__ptep_get
> +#define set_pte					__set_pte
> +#define set_ptes				__set_ptes
> +#define pte_clear				__pte_clear
> +#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
> +#define ptep_get_and_clear			__ptep_get_and_clear
> +#define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
> +#define ptep_test_and_clear_young		__ptep_test_and_clear_young
> +#define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
> +#define ptep_clear_flush_young			__ptep_clear_flush_young
> +#define __HAVE_ARCH_PTEP_SET_WRPROTECT
> +#define ptep_set_wrprotect			__ptep_set_wrprotect
> +#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
> +#define ptep_set_access_flags			__ptep_set_access_flags
> +
>  #endif /* !__ASSEMBLY__ */
>  
>  #endif /* __ASM_PGTABLE_H */
> diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
> index d0e08e93b246..9afcc690fe73 100644
> --- a/arch/arm64/kernel/efi.c
> +++ b/arch/arm64/kernel/efi.c
> @@ -103,7 +103,7 @@ static int __init set_permissions(pte_t *ptep, unsigned long addr, void *data)
>  {
>  	struct set_perm_data *spd = data;
>  	const efi_memory_desc_t *md = spd->md;
> -	pte_t pte = ptep_get(ptep);
> +	pte_t pte = __ptep_get(ptep);
>  
>  	if (md->attribute & EFI_MEMORY_RO)
>  		pte = set_pte_bit(pte, __pgprot(PTE_RDONLY));
> @@ -111,7 +111,7 @@ static int __init set_permissions(pte_t *ptep, unsigned long addr, void *data)
>  		pte = set_pte_bit(pte, __pgprot(PTE_PXN));
>  	else if (system_supports_bti_kernel() && spd->has_bti)
>  		pte = set_pte_bit(pte, __pgprot(PTE_GP));
> -	set_pte(ptep, pte);
> +	__set_pte(ptep, pte);
>  	return 0;
>  }
>  
> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> index 59bfe2e96f8f..dcdcccd40891 100644
> --- a/arch/arm64/kernel/mte.c
> +++ b/arch/arm64/kernel/mte.c
> @@ -67,7 +67,7 @@ int memcmp_pages(struct page *page1, struct page *page2)
>  	/*
>  	 * If the page content is identical but at least one of the pages is
>  	 * tagged, return non-zero to avoid KSM merging. If only one of the
> -	 * pages is tagged, set_ptes() may zero or change the tags of the
> +	 * pages is tagged, __set_ptes() may zero or change the tags of the
>  	 * other page via mte_sync_tags().
>  	 */
>  	if (page_mte_tagged(page1) || page_mte_tagged(page2))
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 6e0df623c8e9..629145fd3161 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -1072,7 +1072,7 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>  		} else {
>  			/*
>  			 * Only locking to serialise with a concurrent
> -			 * set_ptes() in the VMM but still overriding the
> +			 * __set_ptes() in the VMM but still overriding the
>  			 * tags, hence ignoring the return value.
>  			 */
>  			try_page_mte_tagging(page);
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 3235e23309ec..9a1c66183d16 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -191,7 +191,7 @@ static void show_pte(unsigned long addr)
>  		if (!ptep)
>  			break;
>  
> -		pte = ptep_get(ptep);
> +		pte = __ptep_get(ptep);
>  		pr_cont(", pte=%016llx", pte_val(pte));
>  		pte_unmap(ptep);
>  	} while(0);
> @@ -205,16 +205,16 @@ static void show_pte(unsigned long addr)
>   *
>   * It needs to cope with hardware update of the accessed/dirty state by other
>   * agents in the system and can safely skip the __sync_icache_dcache() call as,
> - * like set_ptes(), the PTE is never changed from no-exec to exec here.
> + * like __set_ptes(), the PTE is never changed from no-exec to exec here.
>   *
>   * Returns whether or not the PTE actually changed.
>   */
> -int ptep_set_access_flags(struct vm_area_struct *vma,
> -			  unsigned long address, pte_t *ptep,
> -			  pte_t entry, int dirty)
> +int __ptep_set_access_flags(struct vm_area_struct *vma,
> +			    unsigned long address, pte_t *ptep,
> +			    pte_t entry, int dirty)
>  {
>  	pteval_t old_pteval, pteval;
> -	pte_t pte = ptep_get(ptep);
> +	pte_t pte = __ptep_get(ptep);
>  
>  	if (pte_same(pte, entry))
>  		return 0;
> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
> index c0a3301203bd..bfc02568805a 100644
> --- a/arch/arm64/mm/fixmap.c
> +++ b/arch/arm64/mm/fixmap.c
> @@ -121,9 +121,9 @@ void __set_fixmap(enum fixed_addresses idx,
>  	ptep = fixmap_pte(addr);
>  
>  	if (pgprot_val(flags)) {
> -		set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
> +		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, flags));
>  	} else {
> -		pte_clear(&init_mm, addr, ptep);
> +		__pte_clear(&init_mm, addr, ptep);
>  		flush_tlb_kernel_range(addr, addr+PAGE_SIZE);
>  	}
>  }
> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
> index 48e8b429879d..0f0e10bb0a95 100644
> --- a/arch/arm64/mm/hugetlbpage.c
> +++ b/arch/arm64/mm/hugetlbpage.c
> @@ -145,14 +145,14 @@ pte_t huge_ptep_get(pte_t *ptep)
>  {
>  	int ncontig, i;
>  	size_t pgsize;
> -	pte_t orig_pte = ptep_get(ptep);
> +	pte_t orig_pte = __ptep_get(ptep);
>  
>  	if (!pte_present(orig_pte) || !pte_cont(orig_pte))
>  		return orig_pte;
>  
>  	ncontig = num_contig_ptes(page_size(pte_page(orig_pte)), &pgsize);
>  	for (i = 0; i < ncontig; i++, ptep++) {
> -		pte_t pte = ptep_get(ptep);
> +		pte_t pte = __ptep_get(ptep);
>  
>  		if (pte_dirty(pte))
>  			orig_pte = pte_mkdirty(orig_pte);
> @@ -177,11 +177,11 @@ static pte_t get_clear_contig(struct mm_struct *mm,
>  			     unsigned long pgsize,
>  			     unsigned long ncontig)
>  {
> -	pte_t orig_pte = ptep_get(ptep);
> +	pte_t orig_pte = __ptep_get(ptep);
>  	unsigned long i;
>  
>  	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++) {
> -		pte_t pte = ptep_get_and_clear(mm, addr, ptep);
> +		pte_t pte = __ptep_get_and_clear(mm, addr, ptep);
>  
>  		/*
>  		 * If HW_AFDBM is enabled, then the HW could turn on
> @@ -229,7 +229,7 @@ static void clear_flush(struct mm_struct *mm,
>  	unsigned long i, saddr = addr;
>  
>  	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
> -		ptep_get_and_clear(mm, addr, ptep);
> +		__ptep_get_and_clear(mm, addr, ptep);
>  
>  	flush_tlb_range(&vma, saddr, addr);
>  }
> @@ -247,12 +247,12 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>  
>  	if (!pte_present(pte)) {
>  		for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
> -			set_ptes(mm, addr, ptep, pte, 1);
> +			__set_ptes(mm, addr, ptep, pte, 1);
>  		return;
>  	}
>  
>  	if (!pte_cont(pte)) {
> -		set_ptes(mm, addr, ptep, pte, 1);
> +		__set_ptes(mm, addr, ptep, pte, 1);
>  		return;
>  	}
>  
> @@ -263,7 +263,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
>  	clear_flush(mm, addr, ptep, pgsize, ncontig);
>  
>  	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
> -		set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
> +		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
>  }
>  
>  pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
> @@ -393,7 +393,7 @@ void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
>  	ncontig = num_contig_ptes(sz, &pgsize);
>  
>  	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
> -		pte_clear(mm, addr, ptep);
> +		__pte_clear(mm, addr, ptep);
>  }
>  
>  pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
> @@ -401,10 +401,10 @@ pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
>  {
>  	int ncontig;
>  	size_t pgsize;
> -	pte_t orig_pte = ptep_get(ptep);
> +	pte_t orig_pte = __ptep_get(ptep);
>  
>  	if (!pte_cont(orig_pte))
> -		return ptep_get_and_clear(mm, addr, ptep);
> +		return __ptep_get_and_clear(mm, addr, ptep);
>  
>  	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
>  
> @@ -424,11 +424,11 @@ static int __cont_access_flags_changed(pte_t *ptep, pte_t pte, int ncontig)
>  {
>  	int i;
>  
> -	if (pte_write(pte) != pte_write(ptep_get(ptep)))
> +	if (pte_write(pte) != pte_write(__ptep_get(ptep)))
>  		return 1;
>  
>  	for (i = 0; i < ncontig; i++) {
> -		pte_t orig_pte = ptep_get(ptep + i);
> +		pte_t orig_pte = __ptep_get(ptep + i);
>  
>  		if (pte_dirty(pte) != pte_dirty(orig_pte))
>  			return 1;
> @@ -452,7 +452,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  	pte_t orig_pte;
>  
>  	if (!pte_cont(pte))
> -		return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
> +		return __ptep_set_access_flags(vma, addr, ptep, pte, dirty);
>  
>  	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
>  	dpfn = pgsize >> PAGE_SHIFT;
> @@ -471,7 +471,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
>  
>  	hugeprot = pte_pgprot(pte);
>  	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
> -		set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
> +		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
>  
>  	return 1;
>  }
> @@ -485,8 +485,8 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
>  	size_t pgsize;
>  	pte_t pte;
>  
> -	if (!pte_cont(ptep_get(ptep))) {
> -		ptep_set_wrprotect(mm, addr, ptep);
> +	if (!pte_cont(__ptep_get(ptep))) {
> +		__ptep_set_wrprotect(mm, addr, ptep);
>  		return;
>  	}
>  
> @@ -500,7 +500,7 @@ void huge_ptep_set_wrprotect(struct mm_struct *mm,
>  	pfn = pte_pfn(pte);
>  
>  	for (i = 0; i < ncontig; i++, ptep++, addr += pgsize, pfn += dpfn)
> -		set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
> +		__set_ptes(mm, addr, ptep, pfn_pte(pfn, hugeprot), 1);
>  }
>  
>  pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
> @@ -510,7 +510,7 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
>  	size_t pgsize;
>  	int ncontig;
>  
> -	if (!pte_cont(ptep_get(ptep)))
> +	if (!pte_cont(__ptep_get(ptep)))
>  		return ptep_clear_flush(vma, addr, ptep);
>  
>  	ncontig = find_num_contig(mm, addr, ptep, &pgsize);
> @@ -543,7 +543,7 @@ pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma, unsigned long addr
>  		 * when the permission changes from executable to non-executable
>  		 * in cases where cpu is affected with errata #2645198.
>  		 */
> -		if (pte_user_exec(ptep_get(ptep)))
> +		if (pte_user_exec(__ptep_get(ptep)))
>  			return huge_ptep_clear_flush(vma, addr, ptep);
>  	}
>  	return huge_ptep_get_and_clear(vma->vm_mm, addr, ptep);
> diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
> index c2a9f4f6c7dd..9ee16cfce587 100644
> --- a/arch/arm64/mm/kasan_init.c
> +++ b/arch/arm64/mm/kasan_init.c
> @@ -112,8 +112,8 @@ static void __init kasan_pte_populate(pmd_t *pmdp, unsigned long addr,
>  		if (!early)
>  			memset(__va(page_phys), KASAN_SHADOW_INIT, PAGE_SIZE);
>  		next = addr + PAGE_SIZE;
> -		set_pte(ptep, pfn_pte(__phys_to_pfn(page_phys), PAGE_KERNEL));
> -	} while (ptep++, addr = next, addr != end && pte_none(ptep_get(ptep)));
> +		__set_pte(ptep, pfn_pte(__phys_to_pfn(page_phys), PAGE_KERNEL));
> +	} while (ptep++, addr = next, addr != end && pte_none(__ptep_get(ptep)));
>  }
>  
>  static void __init kasan_pmd_populate(pud_t *pudp, unsigned long addr,
> @@ -271,7 +271,7 @@ static void __init kasan_init_shadow(void)
>  	 * so we should make sure that it maps the zero page read-only.
>  	 */
>  	for (i = 0; i < PTRS_PER_PTE; i++)
> -		set_pte(&kasan_early_shadow_pte[i],
> +		__set_pte(&kasan_early_shadow_pte[i],
>  			pfn_pte(sym_to_pfn(kasan_early_shadow_page),
>  				PAGE_KERNEL_RO));
>  
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 343629a17042..6208c7541f87 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -173,16 +173,16 @@ static void init_pte(pmd_t *pmdp, unsigned long addr, unsigned long end,
>  
>  	ptep = pte_set_fixmap_offset(pmdp, addr);
>  	do {
> -		pte_t old_pte = ptep_get(ptep);
> +		pte_t old_pte = __ptep_get(ptep);
>  
> -		set_pte(ptep, pfn_pte(__phys_to_pfn(phys), prot));
> +		__set_pte(ptep, pfn_pte(__phys_to_pfn(phys), prot));
>  
>  		/*
>  		 * After the PTE entry has been populated once, we
>  		 * only allow updates to the permission attributes.
>  		 */
>  		BUG_ON(!pgattr_change_is_safe(pte_val(old_pte),
> -					      pte_val(ptep_get(ptep))));
> +					      pte_val(__ptep_get(ptep))));
>  
>  		phys += PAGE_SIZE;
>  	} while (ptep++, addr += PAGE_SIZE, addr != end);
> @@ -852,12 +852,12 @@ static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
>  
>  	do {
>  		ptep = pte_offset_kernel(pmdp, addr);
> -		pte = ptep_get(ptep);
> +		pte = __ptep_get(ptep);
>  		if (pte_none(pte))
>  			continue;
>  
>  		WARN_ON(!pte_present(pte));
> -		pte_clear(&init_mm, addr, ptep);
> +		__pte_clear(&init_mm, addr, ptep);
>  		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>  		if (free_mapped)
>  			free_hotplug_page_range(pte_page(pte),
> @@ -985,7 +985,7 @@ static void free_empty_pte_table(pmd_t *pmdp, unsigned long addr,
>  
>  	do {
>  		ptep = pte_offset_kernel(pmdp, addr);
> -		pte = ptep_get(ptep);
> +		pte = __ptep_get(ptep);
>  
>  		/*
>  		 * This is just a sanity check here which verifies that
> @@ -1004,7 +1004,7 @@ static void free_empty_pte_table(pmd_t *pmdp, unsigned long addr,
>  	 */
>  	ptep = pte_offset_kernel(pmdp, 0UL);
>  	for (i = 0; i < PTRS_PER_PTE; i++) {
> -		if (!pte_none(ptep_get(&ptep[i])))
> +		if (!pte_none(__ptep_get(&ptep[i])))
>  			return;
>  	}
>  
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 73a5e8f82586..0c4e3ecf989d 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -36,12 +36,12 @@ bool can_set_direct_map(void)
>  static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
>  {
>  	struct page_change_data *cdata = data;
> -	pte_t pte = ptep_get(ptep);
> +	pte_t pte = __ptep_get(ptep);
>  
>  	pte = clear_pte_bit(pte, cdata->clear_mask);
>  	pte = set_pte_bit(pte, cdata->set_mask);
>  
> -	set_pte(ptep, pte);
> +	__set_pte(ptep, pte);
>  	return 0;
>  }
>  
> @@ -245,5 +245,5 @@ bool kernel_page_present(struct page *page)
>  		return true;
>  
>  	ptep = pte_offset_kernel(pmdp, addr);
> -	return pte_valid(ptep_get(ptep));
> +	return pte_valid(__ptep_get(ptep));
>  }
> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
> index f71ab4704cce..5139a28130c0 100644
> --- a/arch/arm64/mm/trans_pgd.c
> +++ b/arch/arm64/mm/trans_pgd.c
> @@ -33,7 +33,7 @@ static void *trans_alloc(struct trans_pgd_info *info)
>  
>  static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>  {
> -	pte_t pte = ptep_get(src_ptep);
> +	pte_t pte = __ptep_get(src_ptep);
>  
>  	if (pte_valid(pte)) {
>  		/*
> @@ -41,7 +41,7 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>  		 * read only (code, rodata). Clear the RDONLY bit from
>  		 * the temporary mappings we use during restore.
>  		 */
> -		set_pte(dst_ptep, pte_mkwrite_novma(pte));
> +		__set_pte(dst_ptep, pte_mkwrite_novma(pte));
>  	} else if ((debug_pagealloc_enabled() ||
>  		   is_kfence_address((void *)addr)) && !pte_none(pte)) {
>  		/*
> @@ -55,7 +55,7 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>  		 */
>  		BUG_ON(!pfn_valid(pte_pfn(pte)));
>  
> -		set_pte(dst_ptep, pte_mkpresent(pte_mkwrite_novma(pte)));
> +		__set_pte(dst_ptep, pte_mkpresent(pte_mkwrite_novma(pte)));
>  	}
>  }
>  
> -- 
> 2.25.1
> 
