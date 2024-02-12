Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E5C850FD7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 10:38:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYKBv2CPTz3dWX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 20:38:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYKBT5f09z2xdh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 20:37:52 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC9BBDA7;
	Mon, 12 Feb 2024 01:38:02 -0800 (PST)
Received: from [10.57.78.115] (unknown [10.57.78.115])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B1643F762;
	Mon, 12 Feb 2024 01:37:18 -0800 (PST)
Message-ID: <04380249-3bf2-4702-a004-46465a9ae381@arm.com>
Date: Mon, 12 Feb 2024 09:37:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] mm/memory: optimize unmap/zap with PTE-mapped
 THP
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240209221509.585251-1-david@redhat.com>
 <20240209221509.585251-11-david@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240209221509.585251-11-david@redhat.com>
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
Cc: Michal Hocko <mhocko@suse.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Nick Piggin <npiggin@gmail.com>, Yin Fengwei <fengwei.yin@intel.com>, Sven Schnelle <svens@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/02/2024 22:15, David Hildenbrand wrote:
> Similar to how we optimized fork(), let's implement PTE batching when
> consecutive (present) PTEs map consecutive pages of the same large
> folio.
> 
> Most infrastructure we need for batching (mmu gather, rmap) is already
> there. We only have to add get_and_clear_full_ptes() and
> clear_full_ptes(). Similarly, extend zap_install_uffd_wp_if_needed() to
> process a PTE range.
> 
> We won't bother sanity-checking the mapcount of all subpages, but only
> check the mapcount of the first subpage we process. If there is a real
> problem hiding somewhere, we can trigger it simply by using small
> folios, or when we zap single pages of a large folio. Ideally, we had
> that check in rmap code (including for delayed rmap), but then we cannot
> print the PTE. Let's keep it simple for now. If we ever have a cheap
> folio_mapcount(), we might just want to check for underflows there.
> 
> To keep small folios as fast as possible force inlining of a specialized
> variant using __always_inline with nr=1.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  include/linux/pgtable.h | 70 +++++++++++++++++++++++++++++++
>  mm/memory.c             | 92 +++++++++++++++++++++++++++++------------
>  2 files changed, 136 insertions(+), 26 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index aab227e12493..49ab1f73b5c2 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -580,6 +580,76 @@ static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
>  }
>  #endif
>  
> +#ifndef get_and_clear_full_ptes
> +/**
> + * get_and_clear_full_ptes - Clear present PTEs that map consecutive pages of
> + *			     the same folio, collecting dirty/accessed bits.
> + * @mm: Address space the pages are mapped into.
> + * @addr: Address the first page is mapped at.
> + * @ptep: Page table pointer for the first entry.
> + * @nr: Number of entries to clear.
> + * @full: Whether we are clearing a full mm.
> + *
> + * May be overridden by the architecture; otherwise, implemented as a simple
> + * loop over ptep_get_and_clear_full(), merging dirty/accessed bits into the
> + * returned PTE.
> + *
> + * Note that PTE bits in the PTE range besides the PFN can differ. For example,
> + * some PTEs might be write-protected.
> + *
> + * Context: The caller holds the page table lock.  The PTEs map consecutive
> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
> + */
> +static inline pte_t get_and_clear_full_ptes(struct mm_struct *mm,
> +		unsigned long addr, pte_t *ptep, unsigned int nr, int full)
> +{
> +	pte_t pte, tmp_pte;
> +
> +	pte = ptep_get_and_clear_full(mm, addr, ptep, full);
> +	while (--nr) {
> +		ptep++;
> +		addr += PAGE_SIZE;
> +		tmp_pte = ptep_get_and_clear_full(mm, addr, ptep, full);
> +		if (pte_dirty(tmp_pte))
> +			pte = pte_mkdirty(pte);
> +		if (pte_young(tmp_pte))
> +			pte = pte_mkyoung(pte);
> +	}
> +	return pte;
> +}
> +#endif
> +
> +#ifndef clear_full_ptes
> +/**
> + * clear_full_ptes - Clear present PTEs that map consecutive pages of the same
> + *		     folio.
> + * @mm: Address space the pages are mapped into.
> + * @addr: Address the first page is mapped at.
> + * @ptep: Page table pointer for the first entry.
> + * @nr: Number of entries to clear.
> + * @full: Whether we are clearing a full mm.
> + *
> + * May be overridden by the architecture; otherwise, implemented as a simple
> + * loop over ptep_get_and_clear_full().
> + *
> + * Note that PTE bits in the PTE range besides the PFN can differ. For example,
> + * some PTEs might be write-protected.
> + *
> + * Context: The caller holds the page table lock.  The PTEs map consecutive
> + * pages that belong to the same folio.  The PTEs are all in the same PMD.
> + */
> +static inline void clear_full_ptes(struct mm_struct *mm, unsigned long addr,
> +		pte_t *ptep, unsigned int nr, int full)
> +{
> +	for (;;) {
> +		ptep_get_and_clear_full(mm, addr, ptep, full);
> +		if (--nr == 0)
> +			break;
> +		ptep++;
> +		addr += PAGE_SIZE;
> +	}
> +}
> +#endif
>  
>  /*
>   * If two threads concurrently fault at the same page, the thread that
> diff --git a/mm/memory.c b/mm/memory.c
> index a3efc4da258a..3b8e56eb08a3 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1515,7 +1515,7 @@ static inline bool zap_drop_file_uffd_wp(struct zap_details *details)
>   */
>  static inline void
>  zap_install_uffd_wp_if_needed(struct vm_area_struct *vma,
> -			      unsigned long addr, pte_t *pte,
> +			      unsigned long addr, pte_t *pte, int nr,
>  			      struct zap_details *details, pte_t pteval)
>  {
>  	/* Zap on anonymous always means dropping everything */
> @@ -1525,20 +1525,27 @@ zap_install_uffd_wp_if_needed(struct vm_area_struct *vma,
>  	if (zap_drop_file_uffd_wp(details))
>  		return;
>  
> -	pte_install_uffd_wp_if_needed(vma, addr, pte, pteval);
> +	for (;;) {
> +		/* the PFN in the PTE is irrelevant. */
> +		pte_install_uffd_wp_if_needed(vma, addr, pte, pteval);
> +		if (--nr == 0)
> +			break;
> +		pte++;
> +		addr += PAGE_SIZE;
> +	}
>  }
>  
> -static inline void zap_present_folio_pte(struct mmu_gather *tlb,
> +static __always_inline void zap_present_folio_ptes(struct mmu_gather *tlb,
>  		struct vm_area_struct *vma, struct folio *folio,
> -		struct page *page, pte_t *pte, pte_t ptent, unsigned long addr,
> -		struct zap_details *details, int *rss, bool *force_flush,
> -		bool *force_break)
> +		struct page *page, pte_t *pte, pte_t ptent, unsigned int nr,
> +		unsigned long addr, struct zap_details *details, int *rss,
> +		bool *force_flush, bool *force_break)
>  {
>  	struct mm_struct *mm = tlb->mm;
>  	bool delay_rmap = false;
>  
>  	if (!folio_test_anon(folio)) {
> -		ptent = ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
> +		ptent = get_and_clear_full_ptes(mm, addr, pte, nr, tlb->fullmm);
>  		if (pte_dirty(ptent)) {
>  			folio_mark_dirty(folio);
>  			if (tlb_delay_rmap(tlb)) {
> @@ -1548,36 +1555,49 @@ static inline void zap_present_folio_pte(struct mmu_gather *tlb,
>  		}
>  		if (pte_young(ptent) && likely(vma_has_recency(vma)))
>  			folio_mark_accessed(folio);
> -		rss[mm_counter(folio)]--;
> +		rss[mm_counter(folio)] -= nr;
>  	} else {
>  		/* We don't need up-to-date accessed/dirty bits. */
> -		ptep_get_and_clear_full(mm, addr, pte, tlb->fullmm);
> -		rss[MM_ANONPAGES]--;
> +		clear_full_ptes(mm, addr, pte, nr, tlb->fullmm);
> +		rss[MM_ANONPAGES] -= nr;
>  	}
> +	/* Checking a single PTE in a batch is sufficient. */
>  	arch_check_zapped_pte(vma, ptent);
> -	tlb_remove_tlb_entry(tlb, pte, addr);
> +	tlb_remove_tlb_entries(tlb, pte, nr, addr);
>  	if (unlikely(userfaultfd_pte_wp(vma, ptent)))
> -		zap_install_uffd_wp_if_needed(vma, addr, pte, details, ptent);
> +		zap_install_uffd_wp_if_needed(vma, addr, pte, nr, details,
> +					      ptent);
>  
>  	if (!delay_rmap) {
> -		folio_remove_rmap_pte(folio, page, vma);
> +		folio_remove_rmap_ptes(folio, page, nr, vma);
> +
> +		/* Only sanity-check the first page in a batch. */
>  		if (unlikely(page_mapcount(page) < 0))
>  			print_bad_pte(vma, addr, ptent, page);
>  	}
> -	if (unlikely(__tlb_remove_page(tlb, page, delay_rmap))) {
> +	if (unlikely(__tlb_remove_folio_pages(tlb, page, nr, delay_rmap))) {
>  		*force_flush = true;
>  		*force_break = true;
>  	}
>  }
>  
> -static inline void zap_present_pte(struct mmu_gather *tlb,
> +/*
> + * Zap or skip at least one present PTE, trying to batch-process subsequent
> + * PTEs that map consecutive pages of the same folio.
> + *
> + * Returns the number of processed (skipped or zapped) PTEs (at least 1).
> + */
> +static inline int zap_present_ptes(struct mmu_gather *tlb,
>  		struct vm_area_struct *vma, pte_t *pte, pte_t ptent,
> -		unsigned long addr, struct zap_details *details,
> -		int *rss, bool *force_flush, bool *force_break)
> +		unsigned int max_nr, unsigned long addr,
> +		struct zap_details *details, int *rss, bool *force_flush,
> +		bool *force_break)
>  {
> +	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>  	struct mm_struct *mm = tlb->mm;
>  	struct folio *folio;
>  	struct page *page;
> +	int nr;
>  
>  	page = vm_normal_page(vma, addr, ptent);
>  	if (!page) {
> @@ -1587,14 +1607,29 @@ static inline void zap_present_pte(struct mmu_gather *tlb,
>  		tlb_remove_tlb_entry(tlb, pte, addr);
>  		VM_WARN_ON_ONCE(userfaultfd_wp(vma));
>  		ksm_might_unmap_zero_page(mm, ptent);
> -		return;
> +		return 1;
>  	}
>  
>  	folio = page_folio(page);
>  	if (unlikely(!should_zap_folio(details, folio)))
> -		return;
> -	zap_present_folio_pte(tlb, vma, folio, page, pte, ptent, addr, details,
> -			      rss, force_flush, force_break);
> +		return 1;
> +
> +	/*
> +	 * Make sure that the common "small folio" case is as fast as possible
> +	 * by keeping the batching logic separate.
> +	 */
> +	if (unlikely(folio_test_large(folio) && max_nr != 1)) {
> +		nr = folio_pte_batch(folio, addr, pte, ptent, max_nr, fpb_flags,
> +				     NULL);
> +
> +		zap_present_folio_ptes(tlb, vma, folio, page, pte, ptent, nr,
> +				       addr, details, rss, force_flush,
> +				       force_break);
> +		return nr;
> +	}
> +	zap_present_folio_ptes(tlb, vma, folio, page, pte, ptent, 1, addr,
> +			       details, rss, force_flush, force_break);
> +	return 1;
>  }
>  
>  static unsigned long zap_pte_range(struct mmu_gather *tlb,
> @@ -1609,6 +1644,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  	pte_t *start_pte;
>  	pte_t *pte;
>  	swp_entry_t entry;
> +	int nr;
>  
>  	tlb_change_page_size(tlb, PAGE_SIZE);
>  	init_rss_vec(rss);
> @@ -1622,7 +1658,9 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  		pte_t ptent = ptep_get(pte);
>  		struct folio *folio;
>  		struct page *page;
> +		int max_nr;
>  
> +		nr = 1;
>  		if (pte_none(ptent))
>  			continue;
>  
> @@ -1630,10 +1668,12 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  			break;
>  
>  		if (pte_present(ptent)) {
> -			zap_present_pte(tlb, vma, pte, ptent, addr, details,
> -					rss, &force_flush, &force_break);
> +			max_nr = (end - addr) / PAGE_SIZE;
> +			nr = zap_present_ptes(tlb, vma, pte, ptent, max_nr,
> +					      addr, details, rss, &force_flush,
> +					      &force_break);
>  			if (unlikely(force_break)) {
> -				addr += PAGE_SIZE;
> +				addr += nr * PAGE_SIZE;
>  				break;
>  			}
>  			continue;
> @@ -1687,8 +1727,8 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  			WARN_ON_ONCE(1);
>  		}
>  		pte_clear_not_present_full(mm, addr, pte, tlb->fullmm);
> -		zap_install_uffd_wp_if_needed(vma, addr, pte, details, ptent);
> -	} while (pte++, addr += PAGE_SIZE, addr != end);
> +		zap_install_uffd_wp_if_needed(vma, addr, pte, 1, details, ptent);
> +	} while (pte += nr, addr += PAGE_SIZE * nr, addr != end);
>  
>  	add_mm_rss_vec(mm, rss);
>  	arch_leave_lazy_mmu_mode();

