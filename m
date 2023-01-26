Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 922F467D5A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 20:48:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2rpr3Np9z3fJv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 06:48:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NUjXBQYG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NUjXBQYG;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2rlW44Sjz3fQt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 06:45:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 13272B81EDE;
	Thu, 26 Jan 2023 19:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2829C433EF;
	Thu, 26 Jan 2023 19:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674762307;
	bh=SLOCp19ShmPRojpKjXV281Ecbc/CFj+xP/D1whQxIws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NUjXBQYGtlaP9W8apuqmwxyZCKSVC+zH6LNhHk+kZntztDXXCBpf6DZYAV2DPStnZ
	 hNfjUAxfF6geE7suDh6IH5bnLzfYIgVVaQx8P49HWzLkubmXKlo7ORxPN5ocrpuFaf
	 +Wq5PTSoahISSfXQ40Ex+HgwjzuLA1VmMODbRir8lKlBPFmFMsMH/Dt+s6JPpoq4ZE
	 BwC5AKq8ReTxejCh3nPWkHtrG1FaVIFwLhEDY9XRrTtQHf4wERPaEf8I9/FEtiEzV5
	 KDOjwA9Mmx7AdemygO540NnnjAFi6oeL8djnTEz1GN6zXW8T2oYQHZd8/AABZ0YjTR
	 PeSyWH32s2kOQ==
Date: Thu, 26 Jan 2023 21:44:45 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v4 6/7] mm: introduce __vm_flags_mod and use it in
 untrack_pfn
Message-ID: <Y9LYLQn3YwSu91HH@kernel.org>
References: <20230126193752.297968-1-surenb@google.com>
 <20230126193752.297968-7-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126193752.297968-7-surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity
 .net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 11:37:51AM -0800, Suren Baghdasaryan wrote:
> There are scenarios when vm_flags can be modified without exclusive
> mmap_lock, such as:
> - after VMA was isolated and mmap_lock was downgraded or dropped
> - in exit_mmap when there are no other mm users and locking is unnecessary
> Introduce __vm_flags_mod to avoid assertions when the caller takes
> responsibility for the required locking.
> Pass a hint to untrack_pfn to conditionally use __vm_flags_mod for
> flags modification to avoid assertion.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Acked-by: Michal Hocko <mhocko@suse.com>

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/x86/mm/pat/memtype.c | 10 +++++++---
>  include/linux/mm.h        | 14 ++++++++++++--
>  include/linux/pgtable.h   |  5 +++--
>  mm/memory.c               | 13 +++++++------
>  mm/memremap.c             |  4 ++--
>  mm/mmap.c                 | 16 ++++++++++------
>  6 files changed, 41 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> index 6ca51b1aa5d9..691bf8934b6f 100644
> --- a/arch/x86/mm/pat/memtype.c
> +++ b/arch/x86/mm/pat/memtype.c
> @@ -1046,7 +1046,7 @@ void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot, pfn_t pfn)
>   * can be for the entire vma (in which case pfn, size are zero).
>   */
>  void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
> -		 unsigned long size)
> +		 unsigned long size, bool mm_wr_locked)
>  {
>  	resource_size_t paddr;
>  	unsigned long prot;
> @@ -1065,8 +1065,12 @@ void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
>  		size = vma->vm_end - vma->vm_start;
>  	}
>  	free_pfn_range(paddr, size);
> -	if (vma)
> -		vm_flags_clear(vma, VM_PAT);
> +	if (vma) {
> +		if (mm_wr_locked)
> +			vm_flags_clear(vma, VM_PAT);
> +		else
> +			__vm_flags_mod(vma, 0, VM_PAT);
> +	}
>  }
>  
>  /*
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 3c7fc3ecaece..a00fdeb4492d 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -656,6 +656,16 @@ static inline void vm_flags_clear(struct vm_area_struct *vma,
>  	ACCESS_PRIVATE(vma, __vm_flags) &= ~flags;
>  }
>  
> +/*
> + * Use only if VMA is not part of the VMA tree or has no other users and
> + * therefore needs no locking.
> + */
> +static inline void __vm_flags_mod(struct vm_area_struct *vma,
> +				  vm_flags_t set, vm_flags_t clear)
> +{
> +	vm_flags_init(vma, (vma->vm_flags | set) & ~clear);
> +}
> +
>  /*
>   * Use only when the order of set/clear operations is unimportant, otherwise
>   * use vm_flags_{set|clear} explicitly.
> @@ -664,7 +674,7 @@ static inline void vm_flags_mod(struct vm_area_struct *vma,
>  				vm_flags_t set, vm_flags_t clear)
>  {
>  	mmap_assert_write_locked(vma->vm_mm);
> -	vm_flags_init(vma, (vma->vm_flags | set) & ~clear);
> +	__vm_flags_mod(vma, set, clear);
>  }
>  
>  static inline void vma_set_anonymous(struct vm_area_struct *vma)
> @@ -2102,7 +2112,7 @@ static inline void zap_vma_pages(struct vm_area_struct *vma)
>  }
>  void unmap_vmas(struct mmu_gather *tlb, struct maple_tree *mt,
>  		struct vm_area_struct *start_vma, unsigned long start,
> -		unsigned long end);
> +		unsigned long end, bool mm_wr_locked);
>  
>  struct mmu_notifier_range;
>  
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 5fd45454c073..c63cd44777ec 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1185,7 +1185,8 @@ static inline int track_pfn_copy(struct vm_area_struct *vma)
>   * can be for the entire vma (in which case pfn, size are zero).
>   */
>  static inline void untrack_pfn(struct vm_area_struct *vma,
> -			       unsigned long pfn, unsigned long size)
> +			       unsigned long pfn, unsigned long size,
> +			       bool mm_wr_locked)
>  {
>  }
>  
> @@ -1203,7 +1204,7 @@ extern void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
>  			     pfn_t pfn);
>  extern int track_pfn_copy(struct vm_area_struct *vma);
>  extern void untrack_pfn(struct vm_area_struct *vma, unsigned long pfn,
> -			unsigned long size);
> +			unsigned long size, bool mm_wr_locked);
>  extern void untrack_pfn_moved(struct vm_area_struct *vma);
>  #endif
>  
> diff --git a/mm/memory.c b/mm/memory.c
> index a6316cda0e87..7a04a1130ec1 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1613,7 +1613,7 @@ void unmap_page_range(struct mmu_gather *tlb,
>  static void unmap_single_vma(struct mmu_gather *tlb,
>  		struct vm_area_struct *vma, unsigned long start_addr,
>  		unsigned long end_addr,
> -		struct zap_details *details)
> +		struct zap_details *details, bool mm_wr_locked)
>  {
>  	unsigned long start = max(vma->vm_start, start_addr);
>  	unsigned long end;
> @@ -1628,7 +1628,7 @@ static void unmap_single_vma(struct mmu_gather *tlb,
>  		uprobe_munmap(vma, start, end);
>  
>  	if (unlikely(vma->vm_flags & VM_PFNMAP))
> -		untrack_pfn(vma, 0, 0);
> +		untrack_pfn(vma, 0, 0, mm_wr_locked);
>  
>  	if (start != end) {
>  		if (unlikely(is_vm_hugetlb_page(vma))) {
> @@ -1675,7 +1675,7 @@ static void unmap_single_vma(struct mmu_gather *tlb,
>   */
>  void unmap_vmas(struct mmu_gather *tlb, struct maple_tree *mt,
>  		struct vm_area_struct *vma, unsigned long start_addr,
> -		unsigned long end_addr)
> +		unsigned long end_addr, bool mm_wr_locked)
>  {
>  	struct mmu_notifier_range range;
>  	struct zap_details details = {
> @@ -1689,7 +1689,8 @@ void unmap_vmas(struct mmu_gather *tlb, struct maple_tree *mt,
>  				start_addr, end_addr);
>  	mmu_notifier_invalidate_range_start(&range);
>  	do {
> -		unmap_single_vma(tlb, vma, start_addr, end_addr, &details);
> +		unmap_single_vma(tlb, vma, start_addr, end_addr, &details,
> +				 mm_wr_locked);
>  	} while ((vma = mas_find(&mas, end_addr - 1)) != NULL);
>  	mmu_notifier_invalidate_range_end(&range);
>  }
> @@ -1723,7 +1724,7 @@ void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
>  	 * unmap 'address-end' not 'range.start-range.end' as range
>  	 * could have been expanded for hugetlb pmd sharing.
>  	 */
> -	unmap_single_vma(&tlb, vma, address, end, details);
> +	unmap_single_vma(&tlb, vma, address, end, details, false);
>  	mmu_notifier_invalidate_range_end(&range);
>  	tlb_finish_mmu(&tlb);
>  }
> @@ -2492,7 +2493,7 @@ int remap_pfn_range(struct vm_area_struct *vma, unsigned long addr,
>  
>  	err = remap_pfn_range_notrack(vma, addr, pfn, size, prot);
>  	if (err)
> -		untrack_pfn(vma, pfn, PAGE_ALIGN(size));
> +		untrack_pfn(vma, pfn, PAGE_ALIGN(size), true);
>  	return err;
>  }
>  EXPORT_SYMBOL(remap_pfn_range);
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 08cbf54fe037..2f88f43d4a01 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -129,7 +129,7 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
>  	}
>  	mem_hotplug_done();
>  
> -	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range));
> +	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
>  	pgmap_array_delete(range);
>  }
>  
> @@ -276,7 +276,7 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
>  	if (!is_private)
>  		kasan_remove_zero_shadow(__va(range->start), range_len(range));
>  err_kasan:
> -	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range));
> +	untrack_pfn(NULL, PHYS_PFN(range->start), range_len(range), true);
>  err_pfn_remap:
>  	pgmap_array_delete(range);
>  	return error;
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 3d9b14d5f933..429e42c8fccc 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -78,7 +78,7 @@ core_param(ignore_rlimit_data, ignore_rlimit_data, bool, 0644);
>  static void unmap_region(struct mm_struct *mm, struct maple_tree *mt,
>  		struct vm_area_struct *vma, struct vm_area_struct *prev,
>  		struct vm_area_struct *next, unsigned long start,
> -		unsigned long end);
> +		unsigned long end, bool mm_wr_locked);
>  
>  static pgprot_t vm_pgprot_modify(pgprot_t oldprot, unsigned long vm_flags)
>  {
> @@ -2136,14 +2136,14 @@ static inline void remove_mt(struct mm_struct *mm, struct ma_state *mas)
>  static void unmap_region(struct mm_struct *mm, struct maple_tree *mt,
>  		struct vm_area_struct *vma, struct vm_area_struct *prev,
>  		struct vm_area_struct *next,
> -		unsigned long start, unsigned long end)
> +		unsigned long start, unsigned long end, bool mm_wr_locked)
>  {
>  	struct mmu_gather tlb;
>  
>  	lru_add_drain();
>  	tlb_gather_mmu(&tlb, mm);
>  	update_hiwater_rss(mm);
> -	unmap_vmas(&tlb, mt, vma, start, end);
> +	unmap_vmas(&tlb, mt, vma, start, end, mm_wr_locked);
>  	free_pgtables(&tlb, mt, vma, prev ? prev->vm_end : FIRST_USER_ADDRESS,
>  				 next ? next->vm_start : USER_PGTABLES_CEILING);
>  	tlb_finish_mmu(&tlb);
> @@ -2391,7 +2391,11 @@ do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  			mmap_write_downgrade(mm);
>  	}
>  
> -	unmap_region(mm, &mt_detach, vma, prev, next, start, end);
> +	/*
> +	 * We can free page tables without write-locking mmap_lock because VMAs
> +	 * were isolated before we downgraded mmap_lock.
> +	 */
> +	unmap_region(mm, &mt_detach, vma, prev, next, start, end, !downgrade);
>  	/* Statistics and freeing VMAs */
>  	mas_set(&mas_detach, start);
>  	remove_mt(mm, &mas_detach);
> @@ -2704,7 +2708,7 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
>  
>  		/* Undo any partial mapping done by a device driver. */
>  		unmap_region(mm, &mm->mm_mt, vma, prev, next, vma->vm_start,
> -			     vma->vm_end);
> +			     vma->vm_end, true);
>  	}
>  	if (file && (vm_flags & VM_SHARED))
>  		mapping_unmap_writable(file->f_mapping);
> @@ -3031,7 +3035,7 @@ void exit_mmap(struct mm_struct *mm)
>  	tlb_gather_mmu_fullmm(&tlb, mm);
>  	/* update_hiwater_rss(mm) here? but nobody should be looking */
>  	/* Use ULONG_MAX here to ensure all VMAs in the mm are unmapped */
> -	unmap_vmas(&tlb, &mm->mm_mt, vma, 0, ULONG_MAX);
> +	unmap_vmas(&tlb, &mm->mm_mt, vma, 0, ULONG_MAX, false);
>  	mmap_read_unlock(mm);
>  
>  	/*
> -- 
> 2.39.1
> 

-- 
Sincerely yours,
Mike.
