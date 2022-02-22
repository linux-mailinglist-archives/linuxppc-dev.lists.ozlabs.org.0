Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE6B4BFD41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 16:41:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K33Lc3VtPz3dx8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 02:41:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mQ9qW//6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+11ac0858211c0bd5236f+6757+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=mQ9qW//6; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K33D716vSz3cBx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 02:36:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=MP133v1kwiW3c87+cPBpFDQUlQtDeX75p5kJbFoXYYs=; b=mQ9qW//6Cxq6fp2v+y0k83BlCl
 GTdHl2Yi4VXTsa/9OlEJ0bqFePJeG7UTfNRxQx80vp2FE55AN2IXeWPgz50xZ0a897v1bfsI+FoQC
 j8fFViIssX34Qs2bn4z0LTmuU+eIW6qKSfyZ8G6R77UHR3RNmyp5Py95tYTZ3XX6cnNIiy8Jr+Otv
 XMvu/dYxbmt96Sb4q38Z2Xg8sDoms9cUzYRFGgkj7hdhl+EwO/G2WQKCF+qfaX6hjmmRiSqkIUpqx
 bE2ISLDfZeJ57BsLZqwCiTIXh4QZ2KXBPLBjQ74kVwirBtAomdzrqLRCWBQkdjyqzyX/f5KefywDJ
 e7NcH08w==;
Received: from [2001:4bb8:198:f8fc:c22a:ebfc:be8d:63c2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMXCb-00AH4p-Lb; Tue, 22 Feb 2022 15:35:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 10/11] swiotlb: merge swiotlb-xen initialization into swiotlb
Date: Tue, 22 Feb 2022 16:35:13 +0100
Message-Id: <20220222153514.593231-11-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222153514.593231-1-hch@lst.de>
References: <20220222153514.593231-1-hch@lst.de>
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
Cc: Juergen Gross <jgross@suse.com>, linux-s390@vger.kernel.org,
 linux-hyperv@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 linux-ia64@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, tboot-devel@lists.sourceforge.net,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Allow to pass a remap argument to the swiotlb initialization functions
to handle the Xen/x86 remap case.  ARM/ARM64 never did any remapping
from xen_swiotlb_fixup, so we don't even need that quirk.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/xen/mm.c               |  23 +++---
 arch/x86/include/asm/xen/page.h |   5 --
 arch/x86/kernel/pci-dma.c       |  27 ++++---
 arch/x86/pci/sta2x11-fixup.c    |   2 +-
 drivers/xen/swiotlb-xen.c       | 128 +-------------------------------
 include/linux/swiotlb.h         |   7 +-
 include/xen/arm/page.h          |   1 -
 include/xen/swiotlb-xen.h       |   8 +-
 kernel/dma/swiotlb.c            | 120 +++++++++++++++---------------
 9 files changed, 102 insertions(+), 219 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index a7e54a087b802..58b40f87617d3 100644
--- a/arch/arm/xen/mm.c
+++ b/arch/arm/xen/mm.c
@@ -23,22 +23,20 @@
 #include <asm/xen/hypercall.h>
 #include <asm/xen/interface.h>
 
-unsigned long xen_get_swiotlb_free_pages(unsigned int order)
+static gfp_t xen_swiotlb_gfp(void)
 {
 	phys_addr_t base;
-	gfp_t flags = __GFP_NOWARN|__GFP_KSWAPD_RECLAIM;
 	u64 i;
 
 	for_each_mem_range(i, &base, NULL) {
 		if (base < (phys_addr_t)0xffffffff) {
 			if (IS_ENABLED(CONFIG_ZONE_DMA32))
-				flags |= __GFP_DMA32;
-			else
-				flags |= __GFP_DMA;
-			break;
+				return __GFP_DMA32;
+			return __GFP_DMA;
 		}
 	}
-	return __get_free_pages(flags, order);
+
+	return GFP_KERNEL;
 }
 
 static bool hypercall_cflush = false;
@@ -143,10 +141,15 @@ static int __init xen_mm_init(void)
 	if (!xen_swiotlb_detect())
 		return 0;
 
-	rc = xen_swiotlb_init();
 	/* we can work with the default swiotlb */
-	if (rc < 0 && rc != -EEXIST)
-		return rc;
+	if (!io_tlb_default_mem.nslabs) {
+		if (!xen_initial_domain())
+			return -EINVAL;
+		rc = swiotlb_init_late(swiotlb_size_or_default(),
+				       xen_swiotlb_gfp(), NULL);
+		if (rc < 0)
+			return rc;
+	}
 
 	cflush.op = 0;
 	cflush.a.dev_bus_addr = 0;
diff --git a/arch/x86/include/asm/xen/page.h b/arch/x86/include/asm/xen/page.h
index e989bc2269f54..1fc67df500145 100644
--- a/arch/x86/include/asm/xen/page.h
+++ b/arch/x86/include/asm/xen/page.h
@@ -357,9 +357,4 @@ static inline bool xen_arch_need_swiotlb(struct device *dev,
 	return false;
 }
 
-static inline unsigned long xen_get_swiotlb_free_pages(unsigned int order)
-{
-	return __get_free_pages(__GFP_NOWARN, order);
-}
-
 #endif /* _ASM_X86_XEN_PAGE_H */
diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index 9576a02a2590f..b849f11a756d0 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -40,7 +40,6 @@ int iommu_detected __read_mostly = 0;
 #ifdef CONFIG_SWIOTLB
 bool x86_swiotlb_enable;
 static unsigned int x86_swiotlb_flags;
-static bool xen_swiotlb;
 
 /*
  * If 4GB or more detected (and iommu=off not set) or if SME is active
@@ -50,17 +49,16 @@ static void __init pci_swiotlb_detect_4gb(void)
 {
 #ifdef CONFIG_SWIOTLB_XEN
 	if (xen_pv_domain()) {
-		if (xen_initial_domain() || x86_swiotlb_enable) {
-			xen_swiotlb = true;
-			xen_swiotlb_init_early();
-			dma_ops = &xen_swiotlb_dma_ops;
+		if (xen_initial_domain())
+			x86_swiotlb_enable = true;
 
+		if (x86_swiotlb_enable) {
+			dma_ops = &xen_swiotlb_dma_ops;
 #ifdef CONFIG_PCI
 			/* Make sure ACS will be enabled */
 			pci_request_acs();
 #endif
 		}
-		x86_swiotlb_enable = false;
 		return;
 	}
 #endif /* CONFIG_SWIOTLB_XEN */
@@ -91,7 +89,8 @@ void __init pci_iommu_alloc(void)
 	amd_iommu_detect();
 	detect_intel_iommu();
 #ifdef CONFIG_SWIOTLB
-	swiotlb_init(x86_swiotlb_enable, x86_swiotlb_flags);
+	swiotlb_init_remap(x86_swiotlb_enable, x86_swiotlb_flags,
+			   xen_pv_domain() ? xen_swiotlb_fixup : NULL);
 #endif
 }
 
@@ -205,13 +204,17 @@ int pci_xen_swiotlb_init_late(void)
 {
 	int rc;
 
-	if (xen_swiotlb)
+	if (dma_ops == &xen_swiotlb_dma_ops)
 		return 0;
 
-	rc = xen_swiotlb_init();
-	if (rc)
-		return rc;
-
+	/* we can work with the default swiotlb */
+	if (!io_tlb_default_mem.nslabs) {
+		rc = swiotlb_init_late(swiotlb_size_or_default(),
+				       GFP_KERNEL, xen_swiotlb_fixup);
+		if (rc < 0)
+			return rc;
+	}
+ 
 	/* XXX: this switches the dma ops under live devices! */
 	dma_ops = &xen_swiotlb_dma_ops;
 #ifdef CONFIG_PCI
diff --git a/arch/x86/pci/sta2x11-fixup.c b/arch/x86/pci/sta2x11-fixup.c
index c7e6faf59a861..7368afc039987 100644
--- a/arch/x86/pci/sta2x11-fixup.c
+++ b/arch/x86/pci/sta2x11-fixup.c
@@ -57,7 +57,7 @@ static void sta2x11_new_instance(struct pci_dev *pdev)
 		int size = STA2X11_SWIOTLB_SIZE;
 		/* First instance: register your own swiotlb area */
 		dev_info(&pdev->dev, "Using SWIOTLB (size %i)\n", size);
-		if (swiotlb_init_late(size, GFP_DMA))
+		if (swiotlb_init_late(size, GFP_DMA, NULL))
 			dev_emerg(&pdev->dev, "init swiotlb failed\n");
 	}
 	list_add(&instance->list, &sta2x11_instance_list);
diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index c2da3eb4826e8..df8085b50df10 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -104,7 +104,7 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 	return 0;
 }
 
-static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
+int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 {
 	int rc;
 	unsigned int order = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT);
@@ -130,132 +130,6 @@ static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 	return 0;
 }
 
-enum xen_swiotlb_err {
-	XEN_SWIOTLB_UNKNOWN = 0,
-	XEN_SWIOTLB_ENOMEM,
-	XEN_SWIOTLB_EFIXUP
-};
-
-static const char *xen_swiotlb_error(enum xen_swiotlb_err err)
-{
-	switch (err) {
-	case XEN_SWIOTLB_ENOMEM:
-		return "Cannot allocate Xen-SWIOTLB buffer\n";
-	case XEN_SWIOTLB_EFIXUP:
-		return "Failed to get contiguous memory for DMA from Xen!\n"\
-		    "You either: don't have the permissions, do not have"\
-		    " enough free memory under 4GB, or the hypervisor memory"\
-		    " is too fragmented!";
-	default:
-		break;
-	}
-	return "";
-}
-
-int xen_swiotlb_init(void)
-{
-	enum xen_swiotlb_err m_ret = XEN_SWIOTLB_UNKNOWN;
-	unsigned long bytes = swiotlb_size_or_default();
-	unsigned long nslabs = bytes >> IO_TLB_SHIFT;
-	unsigned int order, repeat = 3;
-	int rc = -ENOMEM;
-	char *start;
-
-	if (io_tlb_default_mem.nslabs) {
-		pr_warn("swiotlb buffer already initialized\n");
-		return -EEXIST;
-	}
-
-retry:
-	m_ret = XEN_SWIOTLB_ENOMEM;
-	order = get_order(bytes);
-
-	/*
-	 * Get IO TLB memory from any location.
-	 */
-#define SLABS_PER_PAGE (1 << (PAGE_SHIFT - IO_TLB_SHIFT))
-#define IO_TLB_MIN_SLABS ((1<<20) >> IO_TLB_SHIFT)
-	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
-		start = (void *)xen_get_swiotlb_free_pages(order);
-		if (start)
-			break;
-		order--;
-	}
-	if (!start)
-		goto exit;
-	if (order != get_order(bytes)) {
-		pr_warn("Warning: only able to allocate %ld MB for software IO TLB\n",
-			(PAGE_SIZE << order) >> 20);
-		nslabs = SLABS_PER_PAGE << order;
-		bytes = nslabs << IO_TLB_SHIFT;
-	}
-
-	/*
-	 * And replace that memory with pages under 4GB.
-	 */
-	rc = xen_swiotlb_fixup(start, nslabs);
-	if (rc) {
-		free_pages((unsigned long)start, order);
-		m_ret = XEN_SWIOTLB_EFIXUP;
-		goto error;
-	}
-	rc = swiotlb_late_init_with_tbl(start, nslabs);
-	if (rc)
-		return rc;
-	return 0;
-error:
-	if (nslabs > 1024 && repeat--) {
-		/* Min is 2MB */
-		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
-		bytes = nslabs << IO_TLB_SHIFT;
-		pr_info("Lowering to %luMB\n", bytes >> 20);
-		goto retry;
-	}
-exit:
-	pr_err("%s (rc:%d)\n", xen_swiotlb_error(m_ret), rc);
-	return rc;
-}
-
-#ifdef CONFIG_X86
-void __init xen_swiotlb_init_early(void)
-{
-	unsigned long bytes = swiotlb_size_or_default();
-	unsigned long nslabs = bytes >> IO_TLB_SHIFT;
-	unsigned int repeat = 3;
-	char *start;
-	int rc;
-
-retry:
-	/*
-	 * Get IO TLB memory from any location.
-	 */
-	start = memblock_alloc(PAGE_ALIGN(bytes),
-			       IO_TLB_SEGSIZE << IO_TLB_SHIFT);
-	if (!start)
-		panic("%s: Failed to allocate %lu bytes\n",
-		      __func__, PAGE_ALIGN(bytes));
-
-	/*
-	 * And replace that memory with pages under 4GB.
-	 */
-	rc = xen_swiotlb_fixup(start, nslabs);
-	if (rc) {
-		memblock_free(start, PAGE_ALIGN(bytes));
-		if (nslabs > 1024 && repeat--) {
-			/* Min is 2MB */
-			nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
-			bytes = nslabs << IO_TLB_SHIFT;
-			pr_info("Lowering to %luMB\n", bytes >> 20);
-			goto retry;
-		}
-		panic("%s (rc:%d)", xen_swiotlb_error(XEN_SWIOTLB_EFIXUP), rc);
-	}
-
-	if (swiotlb_init_with_tbl(start, nslabs, SWIOTLB_VERBOSE))
-		panic("Cannot allocate SWIOTLB buffer");
-}
-#endif /* CONFIG_X86 */
-
 static void *
 xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 			   dma_addr_t *dma_handle, gfp_t flags,
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index ee655f2e4d28b..919cf82ed978e 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -34,10 +34,11 @@ struct scatterlist;
 /* default to 64MB */
 #define IO_TLB_DEFAULT_SIZE (64UL<<20)
 
-int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, unsigned int flags);
 unsigned long swiotlb_size_or_default(void);
-extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
-int swiotlb_init_late(size_t size, gfp_t gfp_mask);
+int swiotlb_init_late(size_t size, gfp_t gfp_mask,
+		int (*remap)(void *tlb, unsigned long nslabs));
+void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
+		int (*remap)(void *tlb, unsigned long nslabs));
 extern void __init swiotlb_update_mem_attributes(void);
 
 phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
index ac1b654705631..7e199c6656b90 100644
--- a/include/xen/arm/page.h
+++ b/include/xen/arm/page.h
@@ -115,6 +115,5 @@ static inline bool set_phys_to_machine(unsigned long pfn, unsigned long mfn)
 bool xen_arch_need_swiotlb(struct device *dev,
 			   phys_addr_t phys,
 			   dma_addr_t dev_addr);
-unsigned long xen_get_swiotlb_free_pages(unsigned int order);
 
 #endif /* _ASM_ARM_XEN_PAGE_H */
diff --git a/include/xen/swiotlb-xen.h b/include/xen/swiotlb-xen.h
index b3e647f86e3e2..590ceb923f0c8 100644
--- a/include/xen/swiotlb-xen.h
+++ b/include/xen/swiotlb-xen.h
@@ -10,8 +10,12 @@ void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
 void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
 			     size_t size, enum dma_data_direction dir);
 
-int xen_swiotlb_init(void);
-void __init xen_swiotlb_init_early(void);
+#ifdef CONFIG_SWIOTLB_XEN
+int xen_swiotlb_fixup(void *buf, unsigned long nslabs);
+#else
+#define xen_swiotlb_fixup NULL
+#endif
+
 extern const struct dma_map_ops xen_swiotlb_dma_ops;
 
 #endif /* __LINUX_SWIOTLB_XEN_H */
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index ec200e40fc397..35ee2318ea563 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -234,40 +234,17 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 	return;
 }
 
-int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs,
-		unsigned int flags)
-{
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
-	size_t alloc_size;
-
-	if (swiotlb_force_disable)
-		return 0;
-
-	/* protect against double initialization */
-	if (WARN_ON_ONCE(mem->nslabs))
-		return -ENOMEM;
-
-	alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
-	mem->slots = memblock_alloc(alloc_size, PAGE_SIZE);
-	if (!mem->slots)
-		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
-		      __func__, alloc_size, PAGE_SIZE);
-
-	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
-	mem->force_bounce = flags & SWIOTLB_FORCE;
-
-	if (flags & SWIOTLB_VERBOSE)
-		swiotlb_print_info();
-	return 0;
-}
-
 /*
  * Statically reserve bounce buffer space and initialize bounce buffer data
  * structures for the software IO TLB used to implement the DMA API.
  */
-void __init swiotlb_init(bool addressing_limit, unsigned int flags)
+void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
+		int (*remap)(void *tlb, unsigned long nslabs))
 {
-	size_t bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
+	unsigned long nslabs = default_nslabs;
+	size_t alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
+	size_t bytes;
 	void *tlb;
 
 	if (!addressing_limit && !swiotlb_force_bounce)
@@ -275,23 +252,48 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
 	if (swiotlb_force_disable)
 		return;
 
+	/* protect against double initialization */
+	if (WARN_ON_ONCE(mem->nslabs))
+		return;
+
 	/*
 	 * By default allocate the bonuce buffer memory from low memory.
 	 */
+retry:
+	bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
 	if (flags & SWIOTLB_ANY)
 		tlb = memblock_alloc(bytes, PAGE_SIZE);
 	else
 		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
 	if (!tlb)
-		goto fail;
-	if (swiotlb_init_with_tbl(tlb, default_nslabs, flags))
-		goto fail_free_mem;
-	return;
+		panic("%s: failed to allocate tlb structure\n", __func__);
+
+	if (remap && remap(tlb, nslabs) < 0) {
+		memblock_free(tlb, PAGE_ALIGN(bytes));
+
+		/* Min is 2MB */
+		if (nslabs <= 1024)
+			panic("%s: Failed to remap %zu bytes\n",
+			      __func__, bytes);
+		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
+		goto retry;
+	}
+
+	mem->slots = memblock_alloc(alloc_size, PAGE_SIZE);
+	if (!mem->slots)
+		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
+		      __func__, alloc_size, PAGE_SIZE);
 
-fail_free_mem:
-	memblock_free(tlb, bytes);
-fail:
-	pr_warn("Cannot allocate buffer");
+	swiotlb_init_io_tlb_mem(mem, __pa(tlb), default_nslabs, false);
+	mem->force_bounce = flags & SWIOTLB_FORCE;
+
+	if (flags & SWIOTLB_VERBOSE)
+		swiotlb_print_info();
+}
+
+void __init swiotlb_init(bool addressing_limit, unsigned int flags)
+{
+	return swiotlb_init_remap(addressing_limit, flags, NULL);
 }
 
 /*
@@ -299,8 +301,10 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
  * initialize the swiotlb later using the slab allocator if needed.
  * This should be just like above, but with some error catching.
  */
-int swiotlb_init_late(size_t size, gfp_t gfp_mask)
+int swiotlb_init_late(size_t size, gfp_t gfp_mask,
+		int (*remap)(void *tlb, unsigned long nslabs))
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
 	unsigned long bytes;
 	unsigned char *vstart = NULL;
@@ -310,9 +314,14 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
 	if (swiotlb_force_disable)
 		return 0;
 
+	/* protect against double initialization */
+	if (WARN_ON_ONCE(mem->nslabs))
+		return -ENOMEM;
+
 	/*
 	 * Get IO TLB memory from the low pages
 	 */
+retry:
 	order = get_order(nslabs << IO_TLB_SHIFT);
 	nslabs = SLABS_PER_PAGE << order;
 	bytes = nslabs << IO_TLB_SHIFT;
@@ -333,33 +342,28 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
 			(PAGE_SIZE << order) >> 20);
 		nslabs = SLABS_PER_PAGE << order;
 	}
-	rc = swiotlb_late_init_with_tbl(vstart, nslabs);
-	if (rc)
-		free_pages((unsigned long)vstart, order);
-
-	return rc;
-}
-
-int
-swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
-{
-	struct io_tlb_mem *mem = &io_tlb_default_mem;
-	unsigned long bytes = nslabs << IO_TLB_SHIFT;
 
-	if (swiotlb_force_disable)
-		return 0;
+	if (remap)
+		rc = remap(vstart, nslabs);
+	if (rc) {
+		free_pages((unsigned long)vstart, order);
 
-	/* protect against double initialization */
-	if (WARN_ON_ONCE(mem->nslabs))
-		return -ENOMEM;
+		/* Min is 2MB */
+		if (nslabs <= 1024)
+			return rc;
+		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
+		goto retry;
+	}
 
 	mem->slots = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
 		get_order(array_size(sizeof(*mem->slots), nslabs)));
-	if (!mem->slots)
+	if (!mem->slots) {
+		free_pages((unsigned long)vstart, order);
 		return -ENOMEM;
+	}
 
-	set_memory_decrypted((unsigned long)tlb, bytes >> PAGE_SHIFT);
-	swiotlb_init_io_tlb_mem(mem, virt_to_phys(tlb), nslabs, true);
+	set_memory_decrypted((unsigned long)vstart, bytes >> PAGE_SHIFT);
+	swiotlb_init_io_tlb_mem(mem, virt_to_phys(vstart), nslabs, true);
 
 	swiotlb_print_info();
 	return 0;
-- 
2.30.2

