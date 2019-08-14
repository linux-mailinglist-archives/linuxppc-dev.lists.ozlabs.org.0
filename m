Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C708D4BC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 15:31:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467r8S68RBzDqVD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 23:31:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (mailfrom)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+147547a3be601d556dd4+5834+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="DIKc7zKG"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467qyF6g5LzDqNQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 23:22:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KkEmC0qkJTeJkjO+VJKQkyOPoFFP5BuSqcwAZS7RTHQ=; b=DIKc7zKGkSQtU7jY78VmU7sGFt
 4LVuwVHR9U6kt+DeGtMcw4oXDAWUJdJuGOIhgx4GVloCY4mqbBLmbIO4vDxf2NFQnScNWDNecyznG
 p40/zPficLfONlMh+FjkFcHo9DxhaQBD5fB17uRTZ/qUzBRHCX+BP+N6bGI7I9dRB5Yks1rDQITMf
 9seGzV8FbJdP1G4/mgxydeo2S++LaL1GJgt5zIZgSIxRSwdVZHgOPRHW6ns/etFjmLBwaJ/z2H25N
 QKk40lZC0isvPLJ+UrzVnOLeQarF2FUdXyZH1q4CuBcFBwcU+OH/NJEWy0rdhr8MzlRo/q2lu9vjW
 NbUjmbKw==;
Received: from [2001:4bb8:180:1ec3:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hxtEa-0002YJ-33; Wed, 14 Aug 2019 13:22:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: use the generic dma coherent remap allocator
Date: Wed, 14 Aug 2019 15:22:30 +0200
Message-Id: <20190814132230.31874-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814132230.31874-1-hch@lst.de>
References: <20190814132230.31874-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This switches to using common code for the DMA allocations, including
potential use of the CMA allocator if configured.

Switching to the generic code enables DMA allocations from atomic
context, which is required by the DMA API documentation, and also
adds various other minor features drivers start relying upon.  It
also makes sure we have on tested code base for all architectures
that require uncached pte bits for coherent DMA allocations.

Another advantage is that consistent memory allocations now share
the general vmalloc pool instead of needing an explicit careout
from it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/Kconfig                         |  12 -
 arch/powerpc/include/asm/book3s/32/pgtable.h |  12 +-
 arch/powerpc/include/asm/nohash/32/pgtable.h |  12 +-
 arch/powerpc/mm/dma-noncoherent.c            | 318 +------------------
 arch/powerpc/mm/mem.c                        |   4 -
 arch/powerpc/mm/ptdump/ptdump.c              |   9 -
 arch/powerpc/platforms/Kconfig.cputype       |   2 +
 7 files changed, 17 insertions(+), 352 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 77f6ebf97113..7135e47390f3 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1139,18 +1139,6 @@ config TASK_SIZE
 	default "0x80000000" if PPC_8xx
 	default "0xc0000000"
 
-config CONSISTENT_SIZE_BOOL
-	bool "Set custom consistent memory pool size"
-	depends on ADVANCED_OPTIONS && NOT_COHERENT_CACHE
-	help
-	  This option allows you to set the size of the
-	  consistent memory pool.  This pool of virtual memory
-	  is used to make consistent memory allocations.
-
-config CONSISTENT_SIZE
-	hex "Size of consistent memory pool" if CONSISTENT_SIZE_BOOL
-	default "0x00200000" if NOT_COHERENT_CACHE
-
 config PIN_TLB
 	bool "Pinned Kernel TLBs (860 ONLY)"
 	depends on ADVANCED_OPTIONS && PPC_8xx && \
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 838de59f6754..b6c7214113ab 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -148,21 +148,15 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
  */
 #include <asm/fixmap.h>
 
-#ifdef CONFIG_HIGHMEM
-#define KVIRT_TOP	PKMAP_BASE
-#else
-#define KVIRT_TOP	FIXADDR_START
-#endif
-
 /*
  * ioremap_bot starts at that address. Early ioremaps move down from there,
  * until mem_init() at which point this becomes the top of the vmalloc
  * and ioremap space
  */
-#ifdef CONFIG_NOT_COHERENT_CACHE
-#define IOREMAP_TOP	((KVIRT_TOP - CONFIG_CONSISTENT_SIZE) & PAGE_MASK)
+#ifdef CONFIG_HIGHMEM
+#define IOREMAP_TOP	PKMAP_BASE
 #else
-#define IOREMAP_TOP	KVIRT_TOP
+#define IOREMAP_TOP	FIXADDR_START
 #endif
 
 /*
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 0284f8f5305f..c3764638c27f 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -78,21 +78,15 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
  */
 #include <asm/fixmap.h>
 
-#ifdef CONFIG_HIGHMEM
-#define KVIRT_TOP	PKMAP_BASE
-#else
-#define KVIRT_TOP	FIXADDR_START
-#endif
-
 /*
  * ioremap_bot starts at that address. Early ioremaps move down from there,
  * until mem_init() at which point this becomes the top of the vmalloc
  * and ioremap space
  */
-#ifdef CONFIG_NOT_COHERENT_CACHE
-#define IOREMAP_TOP	((KVIRT_TOP - CONFIG_CONSISTENT_SIZE) & PAGE_MASK)
+#ifdef CONFIG_HIGHMEM
+#define IOREMAP_TOP	PKMAP_BASE
 #else
-#define IOREMAP_TOP	KVIRT_TOP
+#define IOREMAP_TOP	FIXADDR_START
 #endif
 
 /*
diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-noncoherent.c
index c617282d5b2a..4272ca5e8159 100644
--- a/arch/powerpc/mm/dma-noncoherent.c
+++ b/arch/powerpc/mm/dma-noncoherent.c
@@ -4,310 +4,18 @@
  *    Copyright (C) 2001 Dan Malek (dmalek@jlc.net)
  *
  *  Copyright (C) 2000 Russell King
- *
- * Consistent memory allocators.  Used for DMA devices that want to
- * share uncached memory with the processor core.  The function return
- * is the virtual address and 'dma_handle' is the physical address.
- * Mostly stolen from the ARM port, with some changes for PowerPC.
- *						-- Dan
- *
- * Reorganized to get rid of the arch-specific consistent_* functions
- * and provide non-coherent implementations for the DMA API. -Matt
- *
- * Added in_interrupt() safe dma_alloc_coherent()/dma_free_coherent()
- * implementation. This is pulled straight from ARM and barely
- * modified. -Matt
  */
 
-#include <linux/sched.h>
-#include <linux/slab.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
-#include <linux/string.h>
 #include <linux/types.h>
 #include <linux/highmem.h>
 #include <linux/dma-direct.h>
 #include <linux/dma-noncoherent.h>
-#include <linux/export.h>
 
 #include <asm/tlbflush.h>
 #include <asm/dma.h>
 
-#include <mm/mmu_decl.h>
-
-/*
- * This address range defaults to a value that is safe for all
- * platforms which currently set CONFIG_NOT_COHERENT_CACHE. It
- * can be further configured for specific applications under
- * the "Advanced Setup" menu. -Matt
- */
-#define CONSISTENT_BASE		(IOREMAP_TOP)
-#define CONSISTENT_END 		(CONSISTENT_BASE + CONFIG_CONSISTENT_SIZE)
-#define CONSISTENT_OFFSET(x)	(((unsigned long)(x) - CONSISTENT_BASE) >> PAGE_SHIFT)
-
-/*
- * This is the page table (2MB) covering uncached, DMA consistent allocations
- */
-static DEFINE_SPINLOCK(consistent_lock);
-
-/*
- * VM region handling support.
- *
- * This should become something generic, handling VM region allocations for
- * vmalloc and similar (ioremap, module space, etc).
- *
- * I envisage vmalloc()'s supporting vm_struct becoming:
- *
- *  struct vm_struct {
- *    struct vm_region	region;
- *    unsigned long	flags;
- *    struct page	**pages;
- *    unsigned int	nr_pages;
- *    unsigned long	phys_addr;
- *  };
- *
- * get_vm_area() would then call vm_region_alloc with an appropriate
- * struct vm_region head (eg):
- *
- *  struct vm_region vmalloc_head = {
- *	.vm_list	= LIST_HEAD_INIT(vmalloc_head.vm_list),
- *	.vm_start	= VMALLOC_START,
- *	.vm_end		= VMALLOC_END,
- *  };
- *
- * However, vmalloc_head.vm_start is variable (typically, it is dependent on
- * the amount of RAM found at boot time.)  I would imagine that get_vm_area()
- * would have to initialise this each time prior to calling vm_region_alloc().
- */
-struct ppc_vm_region {
-	struct list_head	vm_list;
-	unsigned long		vm_start;
-	unsigned long		vm_end;
-};
-
-static struct ppc_vm_region consistent_head = {
-	.vm_list	= LIST_HEAD_INIT(consistent_head.vm_list),
-	.vm_start	= CONSISTENT_BASE,
-	.vm_end		= CONSISTENT_END,
-};
-
-static struct ppc_vm_region *
-ppc_vm_region_alloc(struct ppc_vm_region *head, size_t size, gfp_t gfp)
-{
-	unsigned long addr = head->vm_start, end = head->vm_end - size;
-	unsigned long flags;
-	struct ppc_vm_region *c, *new;
-
-	new = kmalloc(sizeof(struct ppc_vm_region), gfp);
-	if (!new)
-		goto out;
-
-	spin_lock_irqsave(&consistent_lock, flags);
-
-	list_for_each_entry(c, &head->vm_list, vm_list) {
-		if ((addr + size) < addr)
-			goto nospc;
-		if ((addr + size) <= c->vm_start)
-			goto found;
-		addr = c->vm_end;
-		if (addr > end)
-			goto nospc;
-	}
-
- found:
-	/*
-	 * Insert this entry _before_ the one we found.
-	 */
-	list_add_tail(&new->vm_list, &c->vm_list);
-	new->vm_start = addr;
-	new->vm_end = addr + size;
-
-	spin_unlock_irqrestore(&consistent_lock, flags);
-	return new;
-
- nospc:
-	spin_unlock_irqrestore(&consistent_lock, flags);
-	kfree(new);
- out:
-	return NULL;
-}
-
-static struct ppc_vm_region *ppc_vm_region_find(struct ppc_vm_region *head, unsigned long addr)
-{
-	struct ppc_vm_region *c;
-
-	list_for_each_entry(c, &head->vm_list, vm_list) {
-		if (c->vm_start == addr)
-			goto out;
-	}
-	c = NULL;
- out:
-	return c;
-}
-
-/*
- * Allocate DMA-coherent memory space and return both the kernel remapped
- * virtual and bus address for that space.
- */
-void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
-		gfp_t gfp, unsigned long attrs)
-{
-	struct page *page;
-	struct ppc_vm_region *c;
-	unsigned long order;
-	u64 mask = ISA_DMA_THRESHOLD, limit;
-
-	if (dev) {
-		mask = dev->coherent_dma_mask;
-
-		/*
-		 * Sanity check the DMA mask - it must be non-zero, and
-		 * must be able to be satisfied by a DMA allocation.
-		 */
-		if (mask == 0) {
-			dev_warn(dev, "coherent DMA mask is unset\n");
-			goto no_page;
-		}
-
-		if ((~mask) & ISA_DMA_THRESHOLD) {
-			dev_warn(dev, "coherent DMA mask %#llx is smaller "
-				 "than system GFP_DMA mask %#llx\n",
-				 mask, (unsigned long long)ISA_DMA_THRESHOLD);
-			goto no_page;
-		}
-	}
-
-
-	size = PAGE_ALIGN(size);
-	limit = (mask + 1) & ~mask;
-	if ((limit && size >= limit) ||
-	    size >= (CONSISTENT_END - CONSISTENT_BASE)) {
-		printk(KERN_WARNING "coherent allocation too big (requested %#x mask %#Lx)\n",
-		       size, mask);
-		return NULL;
-	}
-
-	order = get_order(size);
-
-	/* Might be useful if we ever have a real legacy DMA zone... */
-	if (mask != 0xffffffff)
-		gfp |= GFP_DMA;
-
-	page = alloc_pages(gfp, order);
-	if (!page)
-		goto no_page;
-
-	/*
-	 * Invalidate any data that might be lurking in the
-	 * kernel direct-mapped region for device DMA.
-	 */
-	{
-		unsigned long kaddr = (unsigned long)page_address(page);
-		memset(page_address(page), 0, size);
-		flush_dcache_range(kaddr, kaddr + size);
-	}
-
-	/*
-	 * Allocate a virtual address in the consistent mapping region.
-	 */
-	c = ppc_vm_region_alloc(&consistent_head, size,
-			    gfp & ~(__GFP_DMA | __GFP_HIGHMEM));
-	if (c) {
-		unsigned long vaddr = c->vm_start;
-		struct page *end = page + (1 << order);
-
-		split_page(page, order);
-
-		/*
-		 * Set the "dma handle"
-		 */
-		*dma_handle = phys_to_dma(dev, page_to_phys(page));
-
-		do {
-			SetPageReserved(page);
-			map_kernel_page(vaddr, page_to_phys(page),
-					pgprot_noncached(PAGE_KERNEL));
-			page++;
-			vaddr += PAGE_SIZE;
-		} while (size -= PAGE_SIZE);
-
-		/*
-		 * Free the otherwise unused pages.
-		 */
-		while (page < end) {
-			__free_page(page);
-			page++;
-		}
-
-		return (void *)c->vm_start;
-	}
-
-	if (page)
-		__free_pages(page, order);
- no_page:
-	return NULL;
-}
-
-/*
- * free a page as defined by the above mapping.
- */
-void arch_dma_free(struct device *dev, size_t size, void *vaddr,
-		dma_addr_t dma_handle, unsigned long attrs)
-{
-	struct ppc_vm_region *c;
-	unsigned long flags, addr;
-	
-	size = PAGE_ALIGN(size);
-
-	spin_lock_irqsave(&consistent_lock, flags);
-
-	c = ppc_vm_region_find(&consistent_head, (unsigned long)vaddr);
-	if (!c)
-		goto no_area;
-
-	if ((c->vm_end - c->vm_start) != size) {
-		printk(KERN_ERR "%s: freeing wrong coherent size (%ld != %d)\n",
-		       __func__, c->vm_end - c->vm_start, size);
-		dump_stack();
-		size = c->vm_end - c->vm_start;
-	}
-
-	addr = c->vm_start;
-	do {
-		pte_t *ptep;
-		unsigned long pfn;
-
-		ptep = pte_offset_kernel(pmd_offset(pud_offset(pgd_offset_k(addr),
-							       addr),
-						    addr),
-					 addr);
-		if (!pte_none(*ptep) && pte_present(*ptep)) {
-			pfn = pte_pfn(*ptep);
-			pte_clear(&init_mm, addr, ptep);
-			if (pfn_valid(pfn)) {
-				struct page *page = pfn_to_page(pfn);
-				__free_reserved_page(page);
-			}
-		}
-		addr += PAGE_SIZE;
-	} while (size -= PAGE_SIZE);
-
-	flush_tlb_kernel_range(c->vm_start, c->vm_end);
-
-	list_del(&c->vm_list);
-
-	spin_unlock_irqrestore(&consistent_lock, flags);
-
-	kfree(c);
-	return;
-
- no_area:
-	spin_unlock_irqrestore(&consistent_lock, flags);
-	printk(KERN_ERR "%s: trying to free invalid coherent area: %p\n",
-	       __func__, vaddr);
-	dump_stack();
-}
-
 /*
  * make an area consistent.
  */
@@ -408,23 +116,15 @@ void arch_sync_dma_for_cpu(struct device *dev, phys_addr_t paddr,
 	__dma_sync_page(paddr, size, dir);
 }
 
-/*
- * Return the PFN for a given cpu virtual address returned by arch_dma_alloc.
- */
-long arch_dma_coherent_to_pfn(struct device *dev, void *vaddr,
-		dma_addr_t dma_addr)
+void arch_dma_prep_coherent(struct page *page, size_t size)
 {
-	/* This should always be populated, so we don't test every
-	 * level. If that fails, we'll have a nice crash which
-	 * will be as good as a BUG_ON()
-	 */
-	unsigned long cpu_addr = (unsigned long)vaddr;
-	pgd_t *pgd = pgd_offset_k(cpu_addr);
-	pud_t *pud = pud_offset(pgd, cpu_addr);
-	pmd_t *pmd = pmd_offset(pud, cpu_addr);
-	pte_t *ptep = pte_offset_kernel(pmd, cpu_addr);
+	unsigned long kaddr = (unsigned long)page_address(page);
 
-	if (pte_none(*ptep) || !pte_present(*ptep))
-		return 0;
-	return pte_pfn(*ptep);
+	flush_dcache_range(kaddr, kaddr + size);
+}
+
+static int __init atomic_pool_init(void)
+{
+	return dma_atomic_pool_init(GFP_KERNEL, pgprot_noncached(PAGE_KERNEL));
 }
+postcore_initcall(atomic_pool_init);
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 9191a66b3bc5..0662671fd019 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -302,10 +302,6 @@ void __init mem_init(void)
 	pr_info("  * 0x%08lx..0x%08lx  : highmem PTEs\n",
 		PKMAP_BASE, PKMAP_ADDR(LAST_PKMAP));
 #endif /* CONFIG_HIGHMEM */
-#ifdef CONFIG_NOT_COHERENT_CACHE
-	pr_info("  * 0x%08lx..0x%08lx  : consistent mem\n",
-		IOREMAP_TOP, IOREMAP_TOP + CONFIG_CONSISTENT_SIZE);
-#endif /* CONFIG_NOT_COHERENT_CACHE */
 	pr_info("  * 0x%08lx..0x%08lx  : early ioremap\n",
 		ioremap_bot, IOREMAP_TOP);
 	pr_info("  * 0x%08lx..0x%08lx  : vmalloc & ioremap\n",
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 6a88a9f585d4..4191e7e89bb2 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -88,10 +88,6 @@ static struct addr_marker address_markers[] = {
 #else
 	{ 0,	"Early I/O remap start" },
 	{ 0,	"Early I/O remap end" },
-#ifdef CONFIG_NOT_COHERENT_CACHE
-	{ 0,	"Consistent mem start" },
-	{ 0,	"Consistent mem end" },
-#endif
 #ifdef CONFIG_HIGHMEM
 	{ 0,	"Highmem PTEs start" },
 	{ 0,	"Highmem PTEs end" },
@@ -341,11 +337,6 @@ static void populate_markers(void)
 #else /* !CONFIG_PPC64 */
 	address_markers[i++].start_address = ioremap_bot;
 	address_markers[i++].start_address = IOREMAP_TOP;
-#ifdef CONFIG_NOT_COHERENT_CACHE
-	address_markers[i++].start_address = IOREMAP_TOP;
-	address_markers[i++].start_address = IOREMAP_TOP +
-					     CONFIG_CONSISTENT_SIZE;
-#endif
 #ifdef CONFIG_HIGHMEM
 	address_markers[i++].start_address = PKMAP_BASE;
 	address_markers[i++].start_address = PKMAP_ADDR(LAST_PKMAP);
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 56a7c814160d..afe71b89dec3 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -450,8 +450,10 @@ config NOT_COHERENT_CACHE
 	depends on 4xx || PPC_8xx || E200 || PPC_MPC512x || \
 		GAMECUBE_COMMON || AMIGAONE
 	select ARCH_HAS_DMA_COHERENT_TO_PFN
+	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
+	select DMA_DIRECT_REMAP
 	default n if PPC_47x
 	default y
 
-- 
2.20.1

