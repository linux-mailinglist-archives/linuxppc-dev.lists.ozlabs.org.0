Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B754D94D7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 07:48:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHkX65y3pz3bbD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 17:48:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHkWh1Yp8z2yh9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 17:48:31 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5D2E468AFE; Tue, 15 Mar 2022 07:48:26 +0100 (CET)
Date: Tue, 15 Mar 2022 07:48:26 +0100
From: Christoph Hellwig <hch@lst.de>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 13/15] swiotlb: merge swiotlb-xen initialization into
 swiotlb
Message-ID: <20220315064826.GA1508@lst.de>
References: <20220314073129.1862284-1-hch@lst.de>
 <20220314073129.1862284-14-hch@lst.de>
 <6a43380c-b873-3f8e-5d5b-4a066ee57ac2@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="WYTEVAkct0FjGQmd"
Content-Disposition: inline
In-Reply-To: <6a43380c-b873-3f8e-5d5b-4a066ee57ac2@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 Stefano Stabellini <sstabellini@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 tboot-devel@lists.sourceforge.net, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw2@infradead.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--WYTEVAkct0FjGQmd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 14, 2022 at 07:07:44PM -0400, Boris Ostrovsky wrote:
>> +	swiotlb_init_remap(true, x86_swiotlb_flags, xen_swiotlb_fixup);
>
>
> I think we need to have SWIOTLB_ANY set in x86_swiotlb_flags here.

Yes.

> Notice that we don't do remap() after final update to nslabs. We should.

Indeed.  I've pushed the fixed patches to the git tree and attached
the patches 12, 13 and 14 in case that is easier:

--WYTEVAkct0FjGQmd
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="0012-swiotlb-provide-swiotlb_init-variants-that-remap-the.patch"

From 6d72b98620281984ae778659cedeb369e82af8d8 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Mon, 14 Mar 2022 08:02:57 +0100
Subject: swiotlb: provide swiotlb_init variants that remap the buffer

To shared more code between swiotlb and xen-swiotlb, offer a
swiotlb_init_remap interface and add a remap callback to
swiotlb_init_late that will allow Xen to remap the buffer the
buffer without duplicating much of the logic.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/pci/sta2x11-fixup.c |  2 +-
 include/linux/swiotlb.h      |  5 ++++-
 kernel/dma/swiotlb.c         | 36 +++++++++++++++++++++++++++++++++---
 3 files changed, 38 insertions(+), 5 deletions(-)

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
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index ee655f2e4d28b..7b50c82f84ce9 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -36,8 +36,11 @@ struct scatterlist;
 
 int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, unsigned int flags);
 unsigned long swiotlb_size_or_default(void);
+void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
+	int (*remap)(void *tlb, unsigned long nslabs));
+int swiotlb_init_late(size_t size, gfp_t gfp_mask,
+	int (*remap)(void *tlb, unsigned long nslabs));
 extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
-int swiotlb_init_late(size_t size, gfp_t gfp_mask);
 extern void __init swiotlb_update_mem_attributes(void);
 
 phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 79641c446d284..c37fd3d1c97f7 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -256,9 +256,11 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs,
  * Statically reserve bounce buffer space and initialize bounce buffer data
  * structures for the software IO TLB used to implement the DMA API.
  */
-void __init swiotlb_init(bool addressing_limit, unsigned int flags)
+void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
+		int (*remap)(void *tlb, unsigned long nslabs))
 {
-	size_t bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
+	unsigned long nslabs = default_nslabs;
+	size_t bytes;
 	void *tlb;
 
 	if (!addressing_limit && !swiotlb_force_bounce)
@@ -271,12 +273,23 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
 	 * allow to pick a location everywhere for hypervisors with guest
 	 * memory encryption.
 	 */
+retry:
+	bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
 	if (flags & SWIOTLB_ANY)
 		tlb = memblock_alloc(bytes, PAGE_SIZE);
 	else
 		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
 	if (!tlb)
 		goto fail;
+	if (remap && remap(tlb, nslabs) < 0) {
+		memblock_free(tlb, PAGE_ALIGN(bytes));
+
+		if (nslabs <= IO_TLB_MIN_SLABS)
+			panic("%s: Failed to remap %zu bytes\n",
+			      __func__, bytes);
+		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
+		goto retry;
+	}
 	if (swiotlb_init_with_tbl(tlb, default_nslabs, flags))
 		goto fail_free_mem;
 	return;
@@ -287,12 +300,18 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
 	pr_warn("Cannot allocate buffer");
 }
 
+void __init swiotlb_init(bool addressing_limit, unsigned int flags)
+{
+	return swiotlb_init_remap(addressing_limit, flags, NULL);
+}
+
 /*
  * Systems with larger DMA zones (those that don't support ISA) can
  * initialize the swiotlb later using the slab allocator if needed.
  * This should be just like above, but with some error catching.
  */
-int swiotlb_init_late(size_t size, gfp_t gfp_mask)
+int swiotlb_init_late(size_t size, gfp_t gfp_mask,
+		int (*remap)(void *tlb, unsigned long nslabs))
 {
 	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
 	unsigned long bytes;
@@ -303,6 +322,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
 	if (swiotlb_force_disable)
 		return 0;
 
+retry:
 	order = get_order(nslabs << IO_TLB_SHIFT);
 	nslabs = SLABS_PER_PAGE << order;
 	bytes = nslabs << IO_TLB_SHIFT;
@@ -323,6 +343,16 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
 			(PAGE_SIZE << order) >> 20);
 		nslabs = SLABS_PER_PAGE << order;
 	}
+	if (remap)
+		rc = remap(vstart, nslabs);
+	if (rc) {
+		free_pages((unsigned long)vstart, order);
+ 
+		if (IO_TLB_MIN_SLABS <= 1024)
+			return rc;
+		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
+		goto retry;
+	}
 	rc = swiotlb_late_init_with_tbl(vstart, nslabs);
 	if (rc)
 		free_pages((unsigned long)vstart, order);
-- 
2.30.2


--WYTEVAkct0FjGQmd
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="0013-swiotlb-merge-swiotlb-xen-initialization-into-swiotl.patch"

From abfe30ed0a7cd3ca97824d9062a655215ddee7f2 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Mon, 14 Mar 2022 07:58:45 +0100
Subject: swiotlb: merge swiotlb-xen initialization into swiotlb

Reuse the generic swiotlb initialization for xen-swiotlb.  For ARM/ARM64
this works trivially, while for x86 xen_swiotlb_fixup needs to be passed
as the remap argument to swiotlb_init_remap/swiotlb_init_late.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 arch/arm/xen/mm.c               |  21 +++---
 arch/x86/include/asm/xen/page.h |   5 --
 arch/x86/kernel/pci-dma.c       |  20 ++---
 drivers/xen/swiotlb-xen.c       | 128 +-------------------------------
 include/xen/arm/page.h          |   1 -
 include/xen/swiotlb-xen.h       |   8 +-
 6 files changed, 28 insertions(+), 155 deletions(-)

diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
index 28c2070602535..ff05a7899cb86 100644
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
@@ -140,10 +138,13 @@ static int __init xen_mm_init(void)
 	if (!xen_swiotlb_detect())
 		return 0;
 
-	rc = xen_swiotlb_init();
 	/* we can work with the default swiotlb */
-	if (rc < 0 && rc != -EEXIST)
-		return rc;
+	if (!io_tlb_default_mem.nslabs) {
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
index a705a199bf8a3..30bbe4abb5d61 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -72,15 +72,13 @@ static inline void __init pci_swiotlb_detect(void)
 #endif /* CONFIG_SWIOTLB */
 
 #ifdef CONFIG_SWIOTLB_XEN
-static bool xen_swiotlb;
-
 static void __init pci_xen_swiotlb_init(void)
 {
 	if (!xen_initial_domain() && !x86_swiotlb_enable)
 		return;
 	x86_swiotlb_enable = true;
-	xen_swiotlb = true;
-	xen_swiotlb_init_early();
+	x86_swiotlb_flags |= SWIOTLB_ANY;
+	swiotlb_init_remap(true, x86_swiotlb_flags, xen_swiotlb_fixup);
 	dma_ops = &xen_swiotlb_dma_ops;
 	if (IS_ENABLED(CONFIG_PCI))
 		pci_request_acs();
@@ -88,14 +86,16 @@ static void __init pci_xen_swiotlb_init(void)
 
 int pci_xen_swiotlb_init_late(void)
 {
-	int rc;
-
-	if (xen_swiotlb)
+	if (dma_ops == &xen_swiotlb_dma_ops)
 		return 0;
 
-	rc = xen_swiotlb_init();
-	if (rc)
-		return rc;
+	/* we can work with the default swiotlb */
+	if (!io_tlb_default_mem.nslabs) {
+		int rc = swiotlb_init_late(swiotlb_size_or_default(),
+					   GFP_KERNEL, xen_swiotlb_fixup);
+		if (rc < 0)
+			return rc;
+	}
 
 	/* XXX: this switches the dma ops under live devices! */
 	dma_ops = &xen_swiotlb_dma_ops;
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
-- 
2.30.2


--WYTEVAkct0FjGQmd
Content-Type: text/x-patch; charset=us-ascii
Content-Disposition: attachment; filename="0014-swiotlb-remove-swiotlb_init_with_tbl-and-swiotlb_ini.patch"

From 2e7a39f16760d3c0076691a3358d3c7499805687 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Tue, 15 Mar 2022 07:41:04 +0100
Subject: swiotlb: remove swiotlb_init_with_tbl and swiotlb_init_late_with_tbl

No users left.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/swiotlb.h |  2 --
 kernel/dma/swiotlb.c    | 77 +++++++++++------------------------------
 2 files changed, 20 insertions(+), 59 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 7b50c82f84ce9..7ed35dd3de6e7 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -34,13 +34,11 @@ struct scatterlist;
 /* default to 64MB */
 #define IO_TLB_DEFAULT_SIZE (64UL<<20)
 
-int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, unsigned int flags);
 unsigned long swiotlb_size_or_default(void);
 void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 	int (*remap)(void *tlb, unsigned long nslabs));
 int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 	int (*remap)(void *tlb, unsigned long nslabs));
-extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
 extern void __init swiotlb_update_mem_attributes(void);
 
 phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index c37fd3d1c97f7..cb930d064e813 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -225,33 +225,6 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
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
@@ -259,7 +232,9 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs,
 void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		int (*remap)(void *tlb, unsigned long nslabs))
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long nslabs = default_nslabs;
+	size_t alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
 	size_t bytes;
 	void *tlb;
 
@@ -280,7 +255,8 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 	else
 		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
 	if (!tlb)
-		goto fail;
+		panic("%s: failed to allocate tlb structure\n", __func__);
+
 	if (remap && remap(tlb, nslabs) < 0) {
 		memblock_free(tlb, PAGE_ALIGN(bytes));
 
@@ -290,14 +266,17 @@ void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
 		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
 		goto retry;
 	}
-	if (swiotlb_init_with_tbl(tlb, default_nslabs, flags))
-		goto fail_free_mem;
-	return;
 
-fail_free_mem:
-	memblock_free(tlb, bytes);
-fail:
-	pr_warn("Cannot allocate buffer");
+	mem->slots = memblock_alloc(alloc_size, PAGE_SIZE);
+	if (!mem->slots)
+		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
+		      __func__, alloc_size, PAGE_SIZE);
+
+	swiotlb_init_io_tlb_mem(mem, __pa(tlb), default_nslabs, false);
+	mem->force_bounce = flags & SWIOTLB_FORCE;
+
+	if (flags & SWIOTLB_VERBOSE)
+		swiotlb_print_info();
 }
 
 void __init swiotlb_init(bool addressing_limit, unsigned int flags)
@@ -313,6 +292,7 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
 int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		int (*remap)(void *tlb, unsigned long nslabs))
 {
+	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
 	unsigned long bytes;
 	unsigned char *vstart = NULL;
@@ -353,33 +333,16 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
 		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
 		goto retry;
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
-
-	if (swiotlb_force_disable)
-		return 0;
-
-	/* protect against double initialization */
-	if (WARN_ON_ONCE(mem->nslabs))
-		return -ENOMEM;
 
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


--WYTEVAkct0FjGQmd--
