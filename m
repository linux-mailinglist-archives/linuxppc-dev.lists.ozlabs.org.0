Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C49AD3B72D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 16:21:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MwLS0JdHzDqPM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 00:21:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
X-Greylist: delayed 536 seconds by postgrey-1.36 at bilbo;
 Tue, 11 Jun 2019 00:19:43 AEST
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 45MwHz5WP2zDqDs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 00:19:42 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77617344;
 Mon, 10 Jun 2019 07:10:42 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3D5A3F557;
 Mon, 10 Jun 2019 07:10:41 -0700 (PDT)
Date: Mon, 10 Jun 2019 15:10:36 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 4/4] mm/vmalloc: Hugepage vmalloc mappings
Message-ID: <20190610141036.GA16989@lakrids.cambridge.arm.com>
References: <20190610043838.27916-1-npiggin@gmail.com>
 <20190610043838.27916-4-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610043838.27916-4-npiggin@gmail.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Mon, Jun 10, 2019 at 02:38:38PM +1000, Nicholas Piggin wrote:
> For platforms that define HAVE_ARCH_HUGE_VMAP, have vmap allow vmalloc to
> allocate huge pages and map them
> 
> This brings dTLB misses for linux kernel tree `git diff` from 45,000 to
> 8,000 on a Kaby Lake KVM guest with 8MB dentry hash and mitigations=off
> (performance is in the noise, under 1% difference, page tables are likely
> to be well cached for this workload). Similar numbers are seen on POWER9.

Do you happen to know which vmalloc mappings these get used for in the
above case? Where do we see vmalloc mappings that large?

I'm worried as to how this would interact with the set_memory_*()
functions, as on arm64 those can only operate on page-granular mappings.
Those may need fixing up to handle huge mappings; certainly if the above
is all for modules.

Thanks,
Mark.

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  include/asm-generic/4level-fixup.h |   1 +
>  include/asm-generic/5level-fixup.h |   1 +
>  include/linux/vmalloc.h            |   1 +
>  mm/vmalloc.c                       | 132 +++++++++++++++++++++++------
>  4 files changed, 107 insertions(+), 28 deletions(-)
> 
> diff --git a/include/asm-generic/4level-fixup.h b/include/asm-generic/4level-fixup.h
> index e3667c9a33a5..3cc65a4dd093 100644
> --- a/include/asm-generic/4level-fixup.h
> +++ b/include/asm-generic/4level-fixup.h
> @@ -20,6 +20,7 @@
>  #define pud_none(pud)			0
>  #define pud_bad(pud)			0
>  #define pud_present(pud)		1
> +#define pud_large(pud)			0
>  #define pud_ERROR(pud)			do { } while (0)
>  #define pud_clear(pud)			pgd_clear(pud)
>  #define pud_val(pud)			pgd_val(pud)
> diff --git a/include/asm-generic/5level-fixup.h b/include/asm-generic/5level-fixup.h
> index bb6cb347018c..c4377db09a4f 100644
> --- a/include/asm-generic/5level-fixup.h
> +++ b/include/asm-generic/5level-fixup.h
> @@ -22,6 +22,7 @@
>  #define p4d_none(p4d)			0
>  #define p4d_bad(p4d)			0
>  #define p4d_present(p4d)		1
> +#define p4d_large(p4d)			0
>  #define p4d_ERROR(p4d)			do { } while (0)
>  #define p4d_clear(p4d)			pgd_clear(p4d)
>  #define p4d_val(p4d)			pgd_val(p4d)
> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> index 812bea5866d6..4c92dc608928 100644
> --- a/include/linux/vmalloc.h
> +++ b/include/linux/vmalloc.h
> @@ -42,6 +42,7 @@ struct vm_struct {
>  	unsigned long		size;
>  	unsigned long		flags;
>  	struct page		**pages;
> +	unsigned int		page_shift;
>  	unsigned int		nr_pages;
>  	phys_addr_t		phys_addr;
>  	const void		*caller;
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index dd27cfb29b10..0cf8e861caeb 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -36,6 +36,7 @@
>  #include <linux/rbtree_augmented.h>
>  
>  #include <linux/uaccess.h>
> +#include <asm/pgtable.h>
>  #include <asm/tlbflush.h>
>  #include <asm/shmparam.h>
>  
> @@ -440,6 +441,41 @@ static int vmap_pages_range(unsigned long start, unsigned long end,
>  	return ret;
>  }
>  
> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
> +static int vmap_hpages_range(unsigned long start, unsigned long end,
> +				   pgprot_t prot, struct page **pages,
> +				   unsigned int page_shift)
> +{
> +	unsigned long addr = start;
> +	unsigned int i, nr = (end - start) >> (PAGE_SHIFT + page_shift);
> +
> +	for (i = 0; i < nr; i++) {
> +		int err;
> +
> +		err = vmap_range_noflush(addr,
> +					addr + (PAGE_SIZE << page_shift),
> +					__pa(page_address(pages[i])), prot,
> +					PAGE_SHIFT + page_shift);
> +		if (err)
> +			return err;
> +
> +		addr += PAGE_SIZE << page_shift;
> +	}
> +	flush_cache_vmap(start, end);
> +
> +	return nr;
> +}
> +#else
> +static int vmap_hpages_range(unsigned long start, unsigned long end,
> +			   pgprot_t prot, struct page **pages,
> +			   unsigned int page_shift)
> +{
> +	BUG_ON(page_shift != PAGE_SIZE);
> +	return vmap_pages_range(start, end, prot, pages);
> +}
> +#endif
> +
> +
>  int is_vmalloc_or_module_addr(const void *x)
>  {
>  	/*
> @@ -462,7 +498,7 @@ struct page *vmalloc_to_page(const void *vmalloc_addr)
>  {
>  	unsigned long addr = (unsigned long) vmalloc_addr;
>  	struct page *page = NULL;
> -	pgd_t *pgd = pgd_offset_k(addr);
> +	pgd_t *pgd;
>  	p4d_t *p4d;
>  	pud_t *pud;
>  	pmd_t *pmd;
> @@ -474,27 +510,38 @@ struct page *vmalloc_to_page(const void *vmalloc_addr)
>  	 */
>  	VIRTUAL_BUG_ON(!is_vmalloc_or_module_addr(vmalloc_addr));
>  
> +	pgd = pgd_offset_k(addr);
>  	if (pgd_none(*pgd))
>  		return NULL;
> +
>  	p4d = p4d_offset(pgd, addr);
>  	if (p4d_none(*p4d))
>  		return NULL;
> -	pud = pud_offset(p4d, addr);
> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
> +	if (p4d_large(*p4d))
> +		return p4d_page(*p4d) + ((addr & ~P4D_MASK) >> PAGE_SHIFT);
> +#endif
> +	if (WARN_ON_ONCE(p4d_bad(*p4d)))
> +		return NULL;
>  
> -	/*
> -	 * Don't dereference bad PUD or PMD (below) entries. This will also
> -	 * identify huge mappings, which we may encounter on architectures
> -	 * that define CONFIG_HAVE_ARCH_HUGE_VMAP=y. Such regions will be
> -	 * identified as vmalloc addresses by is_vmalloc_addr(), but are
> -	 * not [unambiguously] associated with a struct page, so there is
> -	 * no correct value to return for them.
> -	 */
> -	WARN_ON_ONCE(pud_bad(*pud));
> -	if (pud_none(*pud) || pud_bad(*pud))
> +	pud = pud_offset(p4d, addr);
> +	if (pud_none(*pud))
> +		return NULL;
> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
> +	if (pud_large(*pud))
> +		return pud_page(*pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
> +#endif
> +	if (WARN_ON_ONCE(pud_bad(*pud)))
>  		return NULL;
> +
>  	pmd = pmd_offset(pud, addr);
> -	WARN_ON_ONCE(pmd_bad(*pmd));
> -	if (pmd_none(*pmd) || pmd_bad(*pmd))
> +	if (pmd_none(*pmd))
> +		return NULL;
> +#ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
> +	if (pmd_large(*pmd))
> +		return pmd_page(*pmd) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
> +#endif
> +	if (WARN_ON_ONCE(pmd_bad(*pmd)))
>  		return NULL;
>  
>  	ptep = pte_offset_map(pmd, addr);
> @@ -502,6 +549,7 @@ struct page *vmalloc_to_page(const void *vmalloc_addr)
>  	if (pte_present(pte))
>  		page = pte_page(pte);
>  	pte_unmap(ptep);
> +
>  	return page;
>  }
>  EXPORT_SYMBOL(vmalloc_to_page);
> @@ -2185,8 +2233,9 @@ static struct vm_struct *__get_vm_area_node(unsigned long size,
>  		return NULL;
>  
>  	if (flags & VM_IOREMAP)
> -		align = 1ul << clamp_t(int, get_count_order_long(size),
> -				       PAGE_SHIFT, IOREMAP_MAX_ORDER);
> +		align = max(align,
> +				1ul << clamp_t(int, get_count_order_long(size),
> +				       PAGE_SHIFT, IOREMAP_MAX_ORDER));
>  
>  	area = kzalloc_node(sizeof(*area), gfp_mask & GFP_RECLAIM_MASK, node);
>  	if (unlikely(!area))
> @@ -2398,7 +2447,7 @@ static void __vunmap(const void *addr, int deallocate_pages)
>  			struct page *page = area->pages[i];
>  
>  			BUG_ON(!page);
> -			__free_pages(page, 0);
> +			__free_pages(page, area->page_shift);
>  		}
>  
>  		kvfree(area->pages);
> @@ -2541,14 +2590,17 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
>  				 pgprot_t prot, int node)
>  {
>  	struct page **pages;
> +	unsigned long addr = (unsigned long)area->addr;
> +	unsigned long size = get_vm_area_size(area);
> +	unsigned int page_shift = area->page_shift;
> +	unsigned int shift = page_shift + PAGE_SHIFT;
>  	unsigned int nr_pages, array_size, i;
>  	const gfp_t nested_gfp = (gfp_mask & GFP_RECLAIM_MASK) | __GFP_ZERO;
>  	const gfp_t alloc_mask = gfp_mask | __GFP_NOWARN;
>  	const gfp_t highmem_mask = (gfp_mask & (GFP_DMA | GFP_DMA32)) ?
> -					0 :
> -					__GFP_HIGHMEM;
> +					0 : __GFP_HIGHMEM;
>  
> -	nr_pages = get_vm_area_size(area) >> PAGE_SHIFT;
> +	nr_pages = size >> shift;
>  	array_size = (nr_pages * sizeof(struct page *));
>  
>  	area->nr_pages = nr_pages;
> @@ -2569,10 +2621,8 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
>  	for (i = 0; i < area->nr_pages; i++) {
>  		struct page *page;
>  
> -		if (node == NUMA_NO_NODE)
> -			page = alloc_page(alloc_mask|highmem_mask);
> -		else
> -			page = alloc_pages_node(node, alloc_mask|highmem_mask, 0);
> +		page = alloc_pages_node(node,
> +				alloc_mask|highmem_mask, page_shift);
>  
>  		if (unlikely(!page)) {
>  			/* Successfully allocated i pages, free them in __vunmap() */
> @@ -2584,8 +2634,9 @@ static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask,
>  			cond_resched();
>  	}
>  
> -	if (map_vm_area(area, prot, pages))
> +	if (vmap_hpages_range(addr, addr + size, prot, pages, page_shift) < 0)
>  		goto fail;
> +
>  	return area->addr;
>  
>  fail:
> @@ -2619,22 +2670,39 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
>  			pgprot_t prot, unsigned long vm_flags, int node,
>  			const void *caller)
>  {
> -	struct vm_struct *area;
> +	struct vm_struct *area = NULL;
>  	void *addr;
>  	unsigned long real_size = size;
> +	unsigned long real_align = align;
> +	unsigned int shift = PAGE_SHIFT;
>  
>  	size = PAGE_ALIGN(size);
>  	if (!size || (size >> PAGE_SHIFT) > totalram_pages())
>  		goto fail;
>  
> +	if (IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP)) {
> +		unsigned long size_per_node;
> +
> +		size_per_node = size;
> +		if (node == NUMA_NO_NODE)
> +			size_per_node /= num_online_nodes();
> +		if (size_per_node >= PMD_SIZE)
> +			shift = PMD_SHIFT;
> +	}
> +again:
> +	align = max(real_align, 1UL << shift);
> +	size = ALIGN(real_size, align);
> +
>  	area = __get_vm_area_node(size, align, VM_ALLOC | VM_UNINITIALIZED |
>  				vm_flags, start, end, node, gfp_mask, caller);
>  	if (!area)
>  		goto fail;
>  
> +	area->page_shift = shift - PAGE_SHIFT;
> +
>  	addr = __vmalloc_area_node(area, gfp_mask, prot, node);
>  	if (!addr)
> -		return NULL;
> +		goto fail;
>  
>  	/*
>  	 * In this function, newly allocated vm_struct has VM_UNINITIALIZED
> @@ -2648,8 +2716,16 @@ void *__vmalloc_node_range(unsigned long size, unsigned long align,
>  	return addr;
>  
>  fail:
> -	warn_alloc(gfp_mask, NULL,
> +	if (shift == PMD_SHIFT) {
> +		shift = PAGE_SHIFT;
> +		goto again;
> +	}
> +
> +	if (!area) {
> +		/* Warn for area allocation, page allocations already warn */
> +		warn_alloc(gfp_mask, NULL,
>  			  "vmalloc: allocation failure: %lu bytes", real_size);
> +	}
>  	return NULL;
>  }
>  
> -- 
> 2.20.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
