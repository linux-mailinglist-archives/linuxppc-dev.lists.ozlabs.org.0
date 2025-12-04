Return-Path: <linuxppc-dev+bounces-14585-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DE9CA24F0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 05:18:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMLpP0gGWz2xCp;
	Thu, 04 Dec 2025 15:18:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764821884;
	cv=none; b=lA8qH7kE7IWFtKZYUG1bB0nRzhGJsEIKoH1BrOwfuInU+7+1QlWFnDteHVxoG4BTieEAzMVC1lZiWJWNcQUl7kQWwJUR2HLjsbq8zxhss9paGDcwKOjhnnPLZWgrLg0Tv12yJZGGHva436RuEfKdJ9XbHscgJP8Lif2CjJO5sacqm7KRWDHqHiDJ7zP739AgYjtFwWbPALAnC3yl9Pnm5acSH4qSbPoQEq065lToTpFBhRRc4eTydpO9FRsO1iGGscgIamtseX/cOIXqpFmtlQIcSEynj65I8irdNqLAZpwtgW6iuuqnGjj9k61g5i3H9NRxibeK9VAFPQqVjfH2pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764821884; c=relaxed/relaxed;
	bh=KhhsxxUkmvsyFxzryeELovXrD4pDMdBwLSzlByVrI58=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b9nJApNMGGmbERMlSlMtxJIA2/bEkx+DFUjfrAeWkqx1ERzjTQtVpy+JmR0o6IlQo9BgaowKB7UtWnV5iOXV5U/7y0BtPPjzaclwzaS8f9vjofFTv9LLHSg3Bz/8nvjeB6SqDTFNdRsz5I63Ar7PWwLElFdgu1DyQSOZkTLQWZMXmoaLJ8AA5WAs/AgycFGNZChmnZsRRws8NcpZyVELEI+hK4iI52JPOIDMIRnpYnV8rxV5LCd8F2eeFqdSiAnrnK0EBPPMTFbc6AIn5ezjDySVD43TPl+D7tOvRN9wLJkv6kq2FgQ8CyCGF7v9F7ukLl/w29iNLtP0G7B/dZMZCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMLpM5gr7z2x9c
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 15:18:03 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85D5E339;
	Wed,  3 Dec 2025 20:17:24 -0800 (PST)
Received: from [10.164.18.78] (unknown [10.164.18.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C294D3F73B;
	Wed,  3 Dec 2025 20:17:21 -0800 (PST)
Message-ID: <e43c147f-bff8-462a-88dc-4345500f4ed7@arm.com>
Date: Thu, 4 Dec 2025 09:47:19 +0530
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
Subject: Re: [PATCH v5 06/12] mm: introduce generic lazy_mmu helpers
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-7-kevin.brodsky@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251124132228.622678-7-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 24/11/25 6:52 PM, Kevin Brodsky wrote:
> The implementation of the lazy MMU mode is currently entirely
> arch-specific; core code directly calls arch helpers:
> arch_{enter,leave}_lazy_mmu_mode().
> 
> We are about to introduce support for nested lazy MMU sections.
> As things stand we'd have to duplicate that logic in every arch
> implementing lazy_mmu - adding to a fair amount of logic
> already duplicated across lazy_mmu implementations.
> 
> This patch therefore introduces a new generic layer that calls the
> existing arch_* helpers. Two pair of calls are introduced:
> 
> * lazy_mmu_mode_enable() ... lazy_mmu_mode_disable()
>     This is the standard case where the mode is enabled for a given
>     block of code by surrounding it with enable() and disable()
>     calls.
> 
> * lazy_mmu_mode_pause() ... lazy_mmu_mode_resume()
>     This is for situations where the mode is temporarily disabled
>     by first calling pause() and then resume() (e.g. to prevent any
>     batching from occurring in a critical section).
> 
> The documentation in <linux/pgtable.h> will be updated in a
> subsequent patch.
> > No functional change should be introduced at this stage.
> The implementation of enable()/resume() and disable()/pause() is
> currently identical, but nesting support will change that.
> 
> Most of the call sites have been updated using the following
> Coccinelle script:
> 
> @@
> @@
> {
> ...
> - arch_enter_lazy_mmu_mode();
> + lazy_mmu_mode_enable();
> ...
> - arch_leave_lazy_mmu_mode();
> + lazy_mmu_mode_disable();
> ...
> }
> 
> @@
> @@
> {
> ...
> - arch_leave_lazy_mmu_mode();
> + lazy_mmu_mode_pause();
> ...
> - arch_enter_lazy_mmu_mode();
> + lazy_mmu_mode_resume();
> ...
> }

At this point arch_enter/leave_lazy_mmu_mode() helpers are still
present on a given platform but now being called from new generic
helpers lazy_mmu_mode_enable/disable(). Well except x86, there is
direct call sites for those old helpers.

arch/arm64/include/asm/pgtable.h:static inline void arch_enter_lazy_mmu_mode(void)
arch/arm64/include/asm/pgtable.h:static inline void arch_leave_lazy_mmu_mode(void)

arch/arm64/mm/mmu.c:    lazy_mmu_mode_enable();
arch/arm64/mm/pageattr.c:       lazy_mmu_mode_enable();

arch/arm64/mm/mmu.c:    lazy_mmu_mode_disable();
arch/arm64/mm/pageattr.c:       lazy_mmu_mode_disable();

> 
> A couple of notes regarding x86:
> 
> * Xen is currently the only case where explicit handling is required
>   for lazy MMU when context-switching. This is purely an
>   implementation detail and using the generic lazy_mmu_mode_*
>   functions would cause trouble when nesting support is introduced,
>   because the generic functions must be called from the current task.
>   For that reason we still use arch_leave() and arch_enter() there.
> 
> * x86 calls arch_flush_lazy_mmu_mode() unconditionally in a few
>   places, but only defines it if PARAVIRT_XXL is selected, and we
>   are removing the fallback in <linux/pgtable.h>. Add a new fallback
>   definition to <asm/pgtable.h> to keep things building.
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/mm/mmu.c                     |  4 ++--
>  arch/arm64/mm/pageattr.c                |  4 ++--
>  arch/powerpc/mm/book3s64/hash_tlb.c     |  8 +++----
>  arch/powerpc/mm/book3s64/subpage_prot.c |  4 ++--
>  arch/x86/include/asm/pgtable.h          |  1 +
>  fs/proc/task_mmu.c                      |  4 ++--
>  include/linux/pgtable.h                 | 29 +++++++++++++++++++++----
>  mm/kasan/shadow.c                       |  8 +++----
>  mm/madvise.c                            | 18 +++++++--------
>  mm/memory.c                             | 16 +++++++-------
>  mm/migrate_device.c                     |  8 +++----
>  mm/mprotect.c                           |  4 ++--
>  mm/mremap.c                             |  4 ++--
>  mm/userfaultfd.c                        |  4 ++--
>  mm/vmalloc.c                            | 12 +++++-----
>  mm/vmscan.c                             | 12 +++++-----
>  16 files changed, 81 insertions(+), 59 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 94e29e3574ff..ce66ae77abaa 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -729,7 +729,7 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>  		return -EINVAL;
>  
>  	mutex_lock(&pgtable_split_lock);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  
>  	/*
>  	 * The split_kernel_leaf_mapping_locked() may sleep, it is not a
> @@ -751,7 +751,7 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>  			ret = split_kernel_leaf_mapping_locked(end);
>  	}
>  
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  	mutex_unlock(&pgtable_split_lock);
>  	return ret;
>  }
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 5135f2d66958..e4059f13c4ed 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -110,7 +110,7 @@ static int update_range_prot(unsigned long start, unsigned long size,
>  	if (WARN_ON_ONCE(ret))
>  		return ret;
>  
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  
>  	/*
>  	 * The caller must ensure that the range we are operating on does not
> @@ -119,7 +119,7 @@ static int update_range_prot(unsigned long start, unsigned long size,
>  	 */
>  	ret = walk_kernel_page_table_range_lockless(start, start + size,
>  						    &pageattr_ops, NULL, &data);
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  
>  	return ret;
>  }
> diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
> index 21fcad97ae80..787f7a0e27f0 100644
> --- a/arch/powerpc/mm/book3s64/hash_tlb.c
> +++ b/arch/powerpc/mm/book3s64/hash_tlb.c
> @@ -205,7 +205,7 @@ void __flush_hash_table_range(unsigned long start, unsigned long end)
>  	 * way to do things but is fine for our needs here.
>  	 */
>  	local_irq_save(flags);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  	for (; start < end; start += PAGE_SIZE) {
>  		pte_t *ptep = find_init_mm_pte(start, &hugepage_shift);
>  		unsigned long pte;
> @@ -217,7 +217,7 @@ void __flush_hash_table_range(unsigned long start, unsigned long end)
>  			continue;
>  		hpte_need_flush(&init_mm, start, ptep, pte, hugepage_shift);
>  	}
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  	local_irq_restore(flags);
>  }
>  
> @@ -237,7 +237,7 @@ void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long
>  	 * way to do things but is fine for our needs here.
>  	 */
>  	local_irq_save(flags);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  	start_pte = pte_offset_map(pmd, addr);
>  	if (!start_pte)
>  		goto out;
> @@ -249,6 +249,6 @@ void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long
>  	}
>  	pte_unmap(start_pte);
>  out:
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  	local_irq_restore(flags);
>  }
> diff --git a/arch/powerpc/mm/book3s64/subpage_prot.c b/arch/powerpc/mm/book3s64/subpage_prot.c
> index ec98e526167e..07c47673bba2 100644
> --- a/arch/powerpc/mm/book3s64/subpage_prot.c
> +++ b/arch/powerpc/mm/book3s64/subpage_prot.c
> @@ -73,13 +73,13 @@ static void hpte_flush_range(struct mm_struct *mm, unsigned long addr,
>  	pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
>  	if (!pte)
>  		return;
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  	for (; npages > 0; --npages) {
>  		pte_update(mm, addr, pte, 0, 0, 0);
>  		addr += PAGE_SIZE;
>  		++pte;
>  	}
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  	pte_unmap_unlock(pte - 1, ptl);
>  }
>  
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index e33df3da6980..2842fa1f7a2c 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -118,6 +118,7 @@ extern pmdval_t early_pmd_flags;
>  #define __pte(x)	native_make_pte(x)
>  
>  #define arch_end_context_switch(prev)	do {} while(0)
> +static inline void arch_flush_lazy_mmu_mode(void) {}
>  #endif	/* CONFIG_PARAVIRT_XXL */
>  
>  static inline pmd_t pmd_set_flags(pmd_t pmd, pmdval_t set)
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index d00ac179d973..ee1778adcc20 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -2737,7 +2737,7 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
>  		return 0;
>  	}
>  
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  
>  	if ((p->arg.flags & PM_SCAN_WP_MATCHING) && !p->vec_out) {
>  		/* Fast path for performing exclusive WP */
> @@ -2807,7 +2807,7 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
>  	if (flush_end)
>  		flush_tlb_range(vma, start, addr);
>  
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  	pte_unmap_unlock(start_pte, ptl);
>  
>  	cond_resched();
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index de7d2c7e63eb..c121358dba15 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -231,10 +231,31 @@ static inline int pmd_dirty(pmd_t pmd)
>   * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
>   * and the mode cannot be used in interrupt context.
>   */
> -#ifndef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> -static inline void arch_enter_lazy_mmu_mode(void) {}
> -static inline void arch_leave_lazy_mmu_mode(void) {}
> -static inline void arch_flush_lazy_mmu_mode(void) {}
> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> +static inline void lazy_mmu_mode_enable(void)
> +{
> +	arch_enter_lazy_mmu_mode();
> +}
> +
> +static inline void lazy_mmu_mode_disable(void)
> +{
> +	arch_leave_lazy_mmu_mode();
> +}
> +
> +static inline void lazy_mmu_mode_pause(void)
> +{
> +	arch_leave_lazy_mmu_mode();
> +}
> +
> +static inline void lazy_mmu_mode_resume(void)
> +{
> +	arch_enter_lazy_mmu_mode();
> +}
> +#else
> +static inline void lazy_mmu_mode_enable(void) {}
> +static inline void lazy_mmu_mode_disable(void) {}
> +static inline void lazy_mmu_mode_pause(void) {}
> +static inline void lazy_mmu_mode_resume(void) {}
>  #endif
>  
>  #ifndef pte_batch_hint
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index 29a751a8a08d..c1433d5cc5db 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -305,7 +305,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>  	pte_t pte;
>  	int index;
>  
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_pause();

This replacement works because lazy_mmu_mode_pause() still calls
arch_leave_lazy_mmu_mode() atleast for now.

>  
>  	index = PFN_DOWN(addr - data->start);
>  	page = data->pages[index];
> @@ -319,7 +319,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>  	}
>  	spin_unlock(&init_mm.page_table_lock);
>  
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_resume();

Same.

>  
>  	return 0;
>  }
> @@ -471,7 +471,7 @@ static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>  	pte_t pte;
>  	int none;
>  
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_pause();
>  
>  	spin_lock(&init_mm.page_table_lock);
>  	pte = ptep_get(ptep);
> @@ -483,7 +483,7 @@ static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>  	if (likely(!none))
>  		__free_page(pfn_to_page(pte_pfn(pte)));
>  
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_resume();
>  
>  	return 0;
>  }
> diff --git a/mm/madvise.c b/mm/madvise.c
> index b617b1be0f53..6bf7009fa5ce 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -453,7 +453,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  	if (!start_pte)
>  		return 0;
>  	flush_tlb_batched_pending(mm);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  	for (; addr < end; pte += nr, addr += nr * PAGE_SIZE) {
>  		nr = 1;
>  		ptent = ptep_get(pte);
> @@ -461,7 +461,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  		if (++batch_count == SWAP_CLUSTER_MAX) {
>  			batch_count = 0;
>  			if (need_resched()) {
> -				arch_leave_lazy_mmu_mode();
> +				lazy_mmu_mode_disable();
>  				pte_unmap_unlock(start_pte, ptl);
>  				cond_resched();
>  				goto restart;
> @@ -497,7 +497,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  				if (!folio_trylock(folio))
>  					continue;
>  				folio_get(folio);
> -				arch_leave_lazy_mmu_mode();
> +				lazy_mmu_mode_disable();
>  				pte_unmap_unlock(start_pte, ptl);
>  				start_pte = NULL;
>  				err = split_folio(folio);
> @@ -508,7 +508,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  				if (!start_pte)
>  					break;
>  				flush_tlb_batched_pending(mm);
> -				arch_enter_lazy_mmu_mode();
> +				lazy_mmu_mode_enable();
>  				if (!err)
>  					nr = 0;
>  				continue;
> @@ -556,7 +556,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>  	}
>  
>  	if (start_pte) {
> -		arch_leave_lazy_mmu_mode();
> +		lazy_mmu_mode_disable();
>  		pte_unmap_unlock(start_pte, ptl);
>  	}
>  	if (pageout)
> @@ -675,7 +675,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>  	if (!start_pte)
>  		return 0;
>  	flush_tlb_batched_pending(mm);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  	for (; addr != end; pte += nr, addr += PAGE_SIZE * nr) {
>  		nr = 1;
>  		ptent = ptep_get(pte);
> @@ -724,7 +724,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>  				if (!folio_trylock(folio))
>  					continue;
>  				folio_get(folio);
> -				arch_leave_lazy_mmu_mode();
> +				lazy_mmu_mode_disable();
>  				pte_unmap_unlock(start_pte, ptl);
>  				start_pte = NULL;
>  				err = split_folio(folio);
> @@ -735,7 +735,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>  				if (!start_pte)
>  					break;
>  				flush_tlb_batched_pending(mm);
> -				arch_enter_lazy_mmu_mode();
> +				lazy_mmu_mode_enable();
>  				if (!err)
>  					nr = 0;
>  				continue;
> @@ -775,7 +775,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>  	if (nr_swap)
>  		add_mm_counter(mm, MM_SWAPENTS, nr_swap);
>  	if (start_pte) {
> -		arch_leave_lazy_mmu_mode();
> +		lazy_mmu_mode_disable();
>  		pte_unmap_unlock(start_pte, ptl);
>  	}
>  	cond_resched();
> diff --git a/mm/memory.c b/mm/memory.c
> index 6675e87eb7dd..c0c29a3b0bcc 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1256,7 +1256,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  	spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
>  	orig_src_pte = src_pte;
>  	orig_dst_pte = dst_pte;
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  
>  	do {
>  		nr = 1;
> @@ -1325,7 +1325,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>  	} while (dst_pte += nr, src_pte += nr, addr += PAGE_SIZE * nr,
>  		 addr != end);
>  
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  	pte_unmap_unlock(orig_src_pte, src_ptl);
>  	add_mm_rss_vec(dst_mm, rss);
>  	pte_unmap_unlock(orig_dst_pte, dst_ptl);
> @@ -1842,7 +1842,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  		return addr;
>  
>  	flush_tlb_batched_pending(mm);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  	do {
>  		bool any_skipped = false;
>  
> @@ -1874,7 +1874,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  		direct_reclaim = try_get_and_clear_pmd(mm, pmd, &pmdval);
>  
>  	add_mm_rss_vec(mm, rss);
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  
>  	/* Do the actual TLB flush before dropping ptl */
>  	if (force_flush) {
> @@ -2813,7 +2813,7 @@ static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  	mapped_pte = pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
>  	if (!pte)
>  		return -ENOMEM;
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  	do {
>  		BUG_ON(!pte_none(ptep_get(pte)));
>  		if (!pfn_modify_allowed(pfn, prot)) {
> @@ -2823,7 +2823,7 @@ static int remap_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  		set_pte_at(mm, addr, pte, pte_mkspecial(pfn_pte(pfn, prot)));
>  		pfn++;
>  	} while (pte++, addr += PAGE_SIZE, addr != end);
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  	pte_unmap_unlock(mapped_pte, ptl);
>  	return err;
>  }
> @@ -3174,7 +3174,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  			return -EINVAL;
>  	}
>  
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  
>  	if (fn) {
>  		do {
> @@ -3187,7 +3187,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
>  	}
>  	*mask |= PGTBL_PTE_MODIFIED;
>  
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  
>  	if (mm != &init_mm)
>  		pte_unmap_unlock(mapped_pte, ptl);
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 23379663b1e1..0346c2d7819f 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -271,7 +271,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  	ptep = pte_offset_map_lock(mm, pmdp, start, &ptl);
>  	if (!ptep)
>  		goto again;
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  	ptep += (addr - start) / PAGE_SIZE;
>  
>  	for (; addr < end; addr += PAGE_SIZE, ptep++) {
> @@ -313,7 +313,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			if (folio_test_large(folio)) {
>  				int ret;
>  
> -				arch_leave_lazy_mmu_mode();
> +				lazy_mmu_mode_disable();
>  				pte_unmap_unlock(ptep, ptl);
>  				ret = migrate_vma_split_folio(folio,
>  							  migrate->fault_page);
> @@ -356,7 +356,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			if (folio && folio_test_large(folio)) {
>  				int ret;
>  
> -				arch_leave_lazy_mmu_mode();
> +				lazy_mmu_mode_disable();
>  				pte_unmap_unlock(ptep, ptl);
>  				ret = migrate_vma_split_folio(folio,
>  							  migrate->fault_page);
> @@ -485,7 +485,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  	if (unmapped)
>  		flush_tlb_range(walk->vma, start, end);
>  
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  	pte_unmap_unlock(ptep - 1, ptl);
>  
>  	return 0;
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 283889e4f1ce..c0571445bef7 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -233,7 +233,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  		is_private_single_threaded = vma_is_single_threaded_private(vma);
>  
>  	flush_tlb_batched_pending(vma->vm_mm);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  	do {
>  		nr_ptes = 1;
>  		oldpte = ptep_get(pte);
> @@ -379,7 +379,7 @@ static long change_pte_range(struct mmu_gather *tlb,
>  			}
>  		}
>  	} while (pte += nr_ptes, addr += nr_ptes * PAGE_SIZE, addr != end);
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  	pte_unmap_unlock(pte - 1, ptl);
>  
>  	return pages;
> diff --git a/mm/mremap.c b/mm/mremap.c
> index 672264807db6..8275b9772ec1 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -260,7 +260,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  	if (new_ptl != old_ptl)
>  		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
>  	flush_tlb_batched_pending(vma->vm_mm);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  
>  	for (; old_addr < old_end; old_ptep += nr_ptes, old_addr += nr_ptes * PAGE_SIZE,
>  		new_ptep += nr_ptes, new_addr += nr_ptes * PAGE_SIZE) {
> @@ -305,7 +305,7 @@ static int move_ptes(struct pagetable_move_control *pmc,
>  		}
>  	}
>  
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  	if (force_flush)
>  		flush_tlb_range(vma, old_end - len, old_end);
>  	if (new_ptl != old_ptl)
> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
> index e6dfd5f28acd..b11f81095fa5 100644
> --- a/mm/userfaultfd.c
> +++ b/mm/userfaultfd.c
> @@ -1103,7 +1103,7 @@ static long move_present_ptes(struct mm_struct *mm,
>  	/* It's safe to drop the reference now as the page-table is holding one. */
>  	folio_put(*first_src_folio);
>  	*first_src_folio = NULL;
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  
>  	while (true) {
>  		orig_src_pte = ptep_get_and_clear(mm, src_addr, src_pte);
> @@ -1140,7 +1140,7 @@ static long move_present_ptes(struct mm_struct *mm,
>  			break;
>  	}
>  
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  	if (src_addr > src_start)
>  		flush_tlb_range(src_vma, src_start, src_addr);
>  
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index ecbac900c35f..1dea299fbb5a 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -108,7 +108,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	if (!pte)
>  		return -ENOMEM;
>  
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  
>  	do {
>  		if (unlikely(!pte_none(ptep_get(pte)))) {
> @@ -134,7 +134,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  		pfn++;
>  	} while (pte += PFN_DOWN(size), addr += size, addr != end);
>  
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  	*mask |= PGTBL_PTE_MODIFIED;
>  	return 0;
>  }
> @@ -366,7 +366,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	unsigned long size = PAGE_SIZE;
>  
>  	pte = pte_offset_kernel(pmd, addr);
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  
>  	do {
>  #ifdef CONFIG_HUGETLB_PAGE
> @@ -385,7 +385,7 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
>  	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
>  
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  	*mask |= PGTBL_PTE_MODIFIED;
>  }
>  
> @@ -533,7 +533,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  	if (!pte)
>  		return -ENOMEM;
>  
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  
>  	do {
>  		struct page *page = pages[*nr];
> @@ -555,7 +555,7 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
>  		(*nr)++;
>  	} while (pte++, addr += PAGE_SIZE, addr != end);
>  
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  	*mask |= PGTBL_PTE_MODIFIED;
>  
>  	return err;
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 92980b072121..564c97a9362f 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3515,7 +3515,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>  		return false;
>  	}
>  
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  restart:
>  	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
>  		unsigned long pfn;
> @@ -3556,7 +3556,7 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
>  	if (i < PTRS_PER_PTE && get_next_vma(PMD_MASK, PAGE_SIZE, args, &start, &end))
>  		goto restart;
>  
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  	pte_unmap_unlock(pte, ptl);
>  
>  	return suitable_to_scan(total, young);
> @@ -3597,7 +3597,7 @@ static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area
>  	if (!spin_trylock(ptl))
>  		goto done;
>  
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  
>  	do {
>  		unsigned long pfn;
> @@ -3644,7 +3644,7 @@ static void walk_pmd_range_locked(pud_t *pud, unsigned long addr, struct vm_area
>  
>  	walk_update_folio(walk, last, gen, dirty);
>  
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  	spin_unlock(ptl);
>  done:
>  	*first = -1;
> @@ -4243,7 +4243,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>  		}
>  	}
>  
> -	arch_enter_lazy_mmu_mode();
> +	lazy_mmu_mode_enable();
>  
>  	pte -= (addr - start) / PAGE_SIZE;
>  
> @@ -4277,7 +4277,7 @@ bool lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
>  
>  	walk_update_folio(walk, last, gen, dirty);
>  
> -	arch_leave_lazy_mmu_mode();
> +	lazy_mmu_mode_disable();
>  
>  	/* feedback from rmap walkers to page table walkers */
>  	if (mm_state && suitable_to_scan(i, young))

LGTM and also no apparent problem on arm64 platform.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

