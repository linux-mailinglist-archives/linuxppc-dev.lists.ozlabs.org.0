Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E7E85618E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 12:29:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbCWj1Tw3z3vcV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 22:29:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbCWH2RpMz2ykC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 22:28:58 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2B3ADA7;
	Thu, 15 Feb 2024 03:29:07 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.68.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 522743F7B4;
	Thu, 15 Feb 2024 03:28:23 -0800 (PST)
Date: Thu, 15 Feb 2024 11:28:20 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH v6 13/18] arm64/mm: Implement new wrprotect_ptes() batch
 API
Message-ID: <Zc31VN2j7DJYmgoJ@FVFF77S0Q05N>
References: <20240215103205.2607016-1-ryan.roberts@arm.com>
 <20240215103205.2607016-14-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215103205.2607016-14-ryan.roberts@arm.com>
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

On Thu, Feb 15, 2024 at 10:32:00AM +0000, Ryan Roberts wrote:
> Optimize the contpte implementation to fix some of the fork performance
> regression introduced by the initial contpte commit. Subsequent patches
> will solve it entirely.
> 
> During fork(), any private memory in the parent must be write-protected.
> Previously this was done 1 PTE at a time. But the core-mm supports
> batched wrprotect via the new wrprotect_ptes() API. So let's implement
> that API and for fully covered contpte mappings, we no longer need to
> unfold the contpte. This has 2 benefits:
> 
>   - reduced unfolding, reduces the number of tlbis that must be issued.
>   - The memory remains contpte-mapped ("folded") in the parent, so it
>     continues to benefit from the more efficient use of the TLB after
>     the fork.
> 
> The optimization to wrprotect a whole contpte block without unfolding is
> possible thanks to the tightening of the Arm ARM in respect to the
> definition and behaviour when 'Misprogramming the Contiguous bit'. See
> section D21194 at https://developer.arm.com/documentation/102105/ja-07/
> 
> Tested-by: John Hubbard <jhubbard@nvidia.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/include/asm/pgtable.h | 61 ++++++++++++++++++++++++++------
>  arch/arm64/mm/contpte.c          | 38 ++++++++++++++++++++
>  2 files changed, 89 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 831099cfc96b..8643227c318b 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -978,16 +978,12 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
>  }
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
> -/*
> - * __ptep_set_wrprotect - mark read-only while trasferring potential hardware
> - * dirty status (PTE_DBM && !PTE_RDONLY) to the software PTE_DIRTY bit.
> - */
> -static inline void __ptep_set_wrprotect(struct mm_struct *mm,
> -					unsigned long address, pte_t *ptep)
> +static inline void ___ptep_set_wrprotect(struct mm_struct *mm,
> +					unsigned long address, pte_t *ptep,
> +					pte_t pte)
>  {
> -	pte_t old_pte, pte;
> +	pte_t old_pte;
>  
> -	pte = __ptep_get(ptep);
>  	do {
>  		old_pte = pte;
>  		pte = pte_wrprotect(pte);
> @@ -996,6 +992,25 @@ static inline void __ptep_set_wrprotect(struct mm_struct *mm,
>  	} while (pte_val(pte) != pte_val(old_pte));
>  }
>  
> +/*
> + * __ptep_set_wrprotect - mark read-only while trasferring potential hardware
> + * dirty status (PTE_DBM && !PTE_RDONLY) to the software PTE_DIRTY bit.
> + */
> +static inline void __ptep_set_wrprotect(struct mm_struct *mm,
> +					unsigned long address, pte_t *ptep)
> +{
> +	___ptep_set_wrprotect(mm, address, ptep, __ptep_get(ptep));
> +}
> +
> +static inline void __wrprotect_ptes(struct mm_struct *mm, unsigned long address,
> +				pte_t *ptep, unsigned int nr)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < nr; i++, address += PAGE_SIZE, ptep++)
> +		__ptep_set_wrprotect(mm, address, ptep);
> +}
> +
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  #define __HAVE_ARCH_PMDP_SET_WRPROTECT
>  static inline void pmdp_set_wrprotect(struct mm_struct *mm,
> @@ -1149,6 +1164,8 @@ extern int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
>  				unsigned long addr, pte_t *ptep);
>  extern int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
>  				unsigned long addr, pte_t *ptep);
> +extern void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
> +				pte_t *ptep, unsigned int nr);
>  extern int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
>  				unsigned long addr, pte_t *ptep,
>  				pte_t entry, int dirty);
> @@ -1268,12 +1285,35 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>  	return contpte_ptep_clear_flush_young(vma, addr, ptep);
>  }
>  
> +#define wrprotect_ptes wrprotect_ptes
> +static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
> +				pte_t *ptep, unsigned int nr)
> +{
> +	if (likely(nr == 1)) {
> +		/*
> +		 * Optimization: wrprotect_ptes() can only be called for present
> +		 * ptes so we only need to check contig bit as condition for
> +		 * unfold, and we can remove the contig bit from the pte we read
> +		 * to avoid re-reading. This speeds up fork() which is sensitive
> +		 * for order-0 folios. Equivalent to contpte_try_unfold().
> +		 */
> +		pte_t orig_pte = __ptep_get(ptep);
> +
> +		if (unlikely(pte_cont(orig_pte))) {
> +			__contpte_try_unfold(mm, addr, ptep, orig_pte);
> +			orig_pte = pte_mknoncont(orig_pte);
> +		}
> +		___ptep_set_wrprotect(mm, addr, ptep, orig_pte);
> +	} else {
> +		contpte_wrprotect_ptes(mm, addr, ptep, nr);
> +	}
> +}
> +
>  #define __HAVE_ARCH_PTEP_SET_WRPROTECT
>  static inline void ptep_set_wrprotect(struct mm_struct *mm,
>  				unsigned long addr, pte_t *ptep)
>  {
> -	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
> -	__ptep_set_wrprotect(mm, addr, ptep);
> +	wrprotect_ptes(mm, addr, ptep, 1);
>  }
>  
>  #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
> @@ -1305,6 +1345,7 @@ static inline int ptep_set_access_flags(struct vm_area_struct *vma,
>  #define ptep_clear_flush_young			__ptep_clear_flush_young
>  #define __HAVE_ARCH_PTEP_SET_WRPROTECT
>  #define ptep_set_wrprotect			__ptep_set_wrprotect
> +#define wrprotect_ptes				__wrprotect_ptes
>  #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
>  #define ptep_set_access_flags			__ptep_set_access_flags
>  
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index 6d7f40667fa2..bedb58524535 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -26,6 +26,26 @@ static inline pte_t *contpte_align_down(pte_t *ptep)
>  	return PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
>  }
>  
> +static void contpte_try_unfold_partial(struct mm_struct *mm, unsigned long addr,
> +					pte_t *ptep, unsigned int nr)
> +{
> +	/*
> +	 * Unfold any partially covered contpte block at the beginning and end
> +	 * of the range.
> +	 */
> +
> +	if (ptep != contpte_align_down(ptep) || nr < CONT_PTES)
> +		contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
> +
> +	if (ptep + nr != contpte_align_down(ptep + nr)) {
> +		unsigned long last_addr = addr + PAGE_SIZE * (nr - 1);
> +		pte_t *last_ptep = ptep + nr - 1;
> +
> +		contpte_try_unfold(mm, last_addr, last_ptep,
> +				   __ptep_get(last_ptep));
> +	}
> +}
> +
>  static void contpte_convert(struct mm_struct *mm, unsigned long addr,
>  			    pte_t *ptep, pte_t pte)
>  {
> @@ -238,6 +258,24 @@ int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
>  }
>  EXPORT_SYMBOL(contpte_ptep_clear_flush_young);
>  
> +void contpte_wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
> +					pte_t *ptep, unsigned int nr)
> +{
> +	/*
> +	 * If wrprotecting an entire contig range, we can avoid unfolding. Just
> +	 * set wrprotect and wait for the later mmu_gather flush to invalidate
> +	 * the tlb. Until the flush, the page may or may not be wrprotected.
> +	 * After the flush, it is guaranteed wrprotected. If it's a partial
> +	 * range though, we must unfold, because we can't have a case where
> +	 * CONT_PTE is set but wrprotect applies to a subset of the PTEs; this
> +	 * would cause it to continue to be unpredictable after the flush.
> +	 */
> +
> +	contpte_try_unfold_partial(mm, addr, ptep, nr);
> +	__wrprotect_ptes(mm, addr, ptep, nr);
> +}
> +EXPORT_SYMBOL(contpte_wrprotect_ptes);
> +
>  int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
>  					unsigned long addr, pte_t *ptep,
>  					pte_t entry, int dirty)
> -- 
> 2.25.1
> 
