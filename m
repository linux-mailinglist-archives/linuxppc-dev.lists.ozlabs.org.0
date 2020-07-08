Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CE5218C2B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 17:47:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B23b9678yzDqJg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 01:47:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=90.155.50.34;
 helo=casper.infradead.org;
 envelope-from=batv+ecee53eaa0583d54eab4+6163+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=Awv94X5L; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B23QB54LvzDqjW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 01:39:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=YWMW3K2J8IUvzI1kP8IohAug+CmpewPJUfdbnh0Wntw=; b=Awv94X5LC0od1aO6iiqfINx41h
 2ztg70rY1xevKISNu8a6NNpryEMxwzKMDhpZNrUz6cW3Zzki2SpLb7SW1pjbnB7fN+89XrPwHbUEI
 F2+9CQ+b1aSn1ueXLovk8LBQ00lAQdvLuVZ24glSD1MkAUNFDZyBISY4AiT5gAYobVJLW/TdI0uW6
 iaxu7eGXc5ldvemq9ZchE9XZk12GnQL01sBY+XIFwIse/zuPtE/7V4gyEVVcFuFr5/Dgu9G5wgtUK
 mEiz6s6MG0By+PY7KJX8TQYrbBgHVGXeLFuBIOOP7CNoZ7B9KThLVw6WWY1sQE35duApqGEDQ7X4K
 cLAq4RrA==;
Received: from 213-225-32-40.nat.highway.a1.net ([213.225.32.40]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtCAB-0002eQ-Vl; Wed, 08 Jul 2020 15:39:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org,
	Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH 5/5] powerpc: use the generic dma_ops_bypass mode
Date: Wed,  8 Jul 2020 17:24:49 +0200
Message-Id: <20200708152449.316476-6-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200708152449.316476-1-hch@lst.de>
References: <20200708152449.316476-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <brouer@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the DMA API bypass mechanism for direct window mappings.  This uses
common code and speed up the direct mapping case by avoiding indirect
calls just when not using dma ops at all.  It also fixes a problem where
the sync_* methods were using the bypass check for DMA allocations, but
those are part of the streaming ops.

Note that this patch loses the DMA_ATTR_WEAK_ORDERING override, which
has never been well defined, as is only used by a few drivers, which
IIRC never showed up in the typical Cell blade setups that are affected
by the ordering workaround.

Fixes: efd176a04bef ("powerpc/pseries/dma: Allow SWIOTLB")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/Kconfig              |  1 +
 arch/powerpc/include/asm/device.h |  5 --
 arch/powerpc/kernel/dma-iommu.c   | 90 ++++---------------------------
 3 files changed, 10 insertions(+), 86 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e9b091d3587222..be868bfbe76ecf 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -152,6 +152,7 @@ config PPC
 	select CLONE_BACKWARDS
 	select DCACHE_WORD_ACCESS		if PPC64 && CPU_LITTLE_ENDIAN
 	select DMA_OPS				if PPC64
+	select DMA_OPS_BYPASS			if PPC64
 	select DYNAMIC_FTRACE			if FUNCTION_TRACER
 	select EDAC_ATOMIC_SCRUB
 	select EDAC_SUPPORT
diff --git a/arch/powerpc/include/asm/device.h b/arch/powerpc/include/asm/device.h
index 266542769e4bd1..452402215e1210 100644
--- a/arch/powerpc/include/asm/device.h
+++ b/arch/powerpc/include/asm/device.h
@@ -18,11 +18,6 @@ struct iommu_table;
  * drivers/macintosh/macio_asic.c
  */
 struct dev_archdata {
-	/*
-	 * Set to %true if the dma_iommu_ops are requested to use a direct
-	 * window instead of dynamically mapping memory.
-	 */
-	bool			iommu_bypass : 1;
 	/*
 	 * These two used to be a union. However, with the hybrid ops we need
 	 * both so here we store both a DMA offset for direct mappings and
diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index e486d1d78de288..569fecd7b5b234 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -14,23 +14,6 @@
  * Generic iommu implementation
  */
 
-/*
- * The coherent mask may be smaller than the real mask, check if we can
- * really use a direct window.
- */
-static inline bool dma_iommu_alloc_bypass(struct device *dev)
-{
-	return dev->archdata.iommu_bypass && !iommu_fixed_is_weak &&
-		dma_direct_supported(dev, dev->coherent_dma_mask);
-}
-
-static inline bool dma_iommu_map_bypass(struct device *dev,
-		unsigned long attrs)
-{
-	return dev->archdata.iommu_bypass &&
-		(!iommu_fixed_is_weak || (attrs & DMA_ATTR_WEAK_ORDERING));
-}
-
 /* Allocates a contiguous real buffer and creates mappings over it.
  * Returns the virtual address of the buffer and sets dma_handle
  * to the dma address (mapping) of the first page.
@@ -39,8 +22,6 @@ static void *dma_iommu_alloc_coherent(struct device *dev, size_t size,
 				      dma_addr_t *dma_handle, gfp_t flag,
 				      unsigned long attrs)
 {
-	if (dma_iommu_alloc_bypass(dev))
-		return dma_direct_alloc(dev, size, dma_handle, flag, attrs);
 	return iommu_alloc_coherent(dev, get_iommu_table_base(dev), size,
 				    dma_handle, dev->coherent_dma_mask, flag,
 				    dev_to_node(dev));
@@ -50,11 +31,7 @@ static void dma_iommu_free_coherent(struct device *dev, size_t size,
 				    void *vaddr, dma_addr_t dma_handle,
 				    unsigned long attrs)
 {
-	if (dma_iommu_alloc_bypass(dev))
-		dma_direct_free(dev, size, vaddr, dma_handle, attrs);
-	else
-		iommu_free_coherent(get_iommu_table_base(dev), size, vaddr,
-				dma_handle);
+	iommu_free_coherent(get_iommu_table_base(dev), size, vaddr, dma_handle);
 }
 
 /* Creates TCEs for a user provided buffer.  The user buffer must be
@@ -67,9 +44,6 @@ static dma_addr_t dma_iommu_map_page(struct device *dev, struct page *page,
 				     enum dma_data_direction direction,
 				     unsigned long attrs)
 {
-	if (dma_iommu_map_bypass(dev, attrs))
-		return dma_direct_map_page(dev, page, offset, size, direction,
-				attrs);
 	return iommu_map_page(dev, get_iommu_table_base(dev), page, offset,
 			      size, dma_get_mask(dev), direction, attrs);
 }
@@ -79,11 +53,8 @@ static void dma_iommu_unmap_page(struct device *dev, dma_addr_t dma_handle,
 				 size_t size, enum dma_data_direction direction,
 				 unsigned long attrs)
 {
-	if (!dma_iommu_map_bypass(dev, attrs))
-		iommu_unmap_page(get_iommu_table_base(dev), dma_handle, size,
-				direction,  attrs);
-	else
-		dma_direct_unmap_page(dev, dma_handle, size, direction, attrs);
+	iommu_unmap_page(get_iommu_table_base(dev), dma_handle, size, direction,
+			 attrs);
 }
 
 
@@ -91,8 +62,6 @@ static int dma_iommu_map_sg(struct device *dev, struct scatterlist *sglist,
 			    int nelems, enum dma_data_direction direction,
 			    unsigned long attrs)
 {
-	if (dma_iommu_map_bypass(dev, attrs))
-		return dma_direct_map_sg(dev, sglist, nelems, direction, attrs);
 	return ppc_iommu_map_sg(dev, get_iommu_table_base(dev), sglist, nelems,
 				dma_get_mask(dev), direction, attrs);
 }
@@ -101,11 +70,8 @@ static void dma_iommu_unmap_sg(struct device *dev, struct scatterlist *sglist,
 		int nelems, enum dma_data_direction direction,
 		unsigned long attrs)
 {
-	if (!dma_iommu_map_bypass(dev, attrs))
-		ppc_iommu_unmap_sg(get_iommu_table_base(dev), sglist, nelems,
+	ppc_iommu_unmap_sg(get_iommu_table_base(dev), sglist, nelems,
 			   direction, attrs);
-	else
-		dma_direct_unmap_sg(dev, sglist, nelems, direction, attrs);
 }
 
 static bool dma_iommu_bypass_supported(struct device *dev, u64 mask)
@@ -113,8 +79,9 @@ static bool dma_iommu_bypass_supported(struct device *dev, u64 mask)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct pci_controller *phb = pci_bus_to_host(pdev->bus);
 
-	return phb->controller_ops.iommu_bypass_supported &&
-		phb->controller_ops.iommu_bypass_supported(pdev, mask);
+	if (iommu_fixed_is_weak || !phb->controller_ops.iommu_bypass_supported)
+		return false;
+	return phb->controller_ops.iommu_bypass_supported(pdev, mask);
 }
 
 /* We support DMA to/from any memory page via the iommu */
@@ -123,7 +90,7 @@ int dma_iommu_dma_supported(struct device *dev, u64 mask)
 	struct iommu_table *tbl = get_iommu_table_base(dev);
 
 	if (dev_is_pci(dev) && dma_iommu_bypass_supported(dev, mask)) {
-		dev->archdata.iommu_bypass = true;
+		dev->dma_ops_bypass = true;
 		dev_dbg(dev, "iommu: 64-bit OK, using fixed ops\n");
 		return 1;
 	}
@@ -141,7 +108,7 @@ int dma_iommu_dma_supported(struct device *dev, u64 mask)
 	}
 
 	dev_dbg(dev, "iommu: not 64-bit, using default ops\n");
-	dev->archdata.iommu_bypass = false;
+	dev->dma_ops_bypass = false;
 	return 1;
 }
 
@@ -153,47 +120,12 @@ u64 dma_iommu_get_required_mask(struct device *dev)
 	if (!tbl)
 		return 0;
 
-	if (dev_is_pci(dev)) {
-		u64 bypass_mask = dma_direct_get_required_mask(dev);
-
-		if (dma_iommu_bypass_supported(dev, bypass_mask))
-			return bypass_mask;
-	}
-
 	mask = 1ULL < (fls_long(tbl->it_offset + tbl->it_size) - 1);
 	mask += mask - 1;
 
 	return mask;
 }
 
-static void dma_iommu_sync_for_cpu(struct device *dev, dma_addr_t addr,
-		size_t size, enum dma_data_direction dir)
-{
-	if (dma_iommu_alloc_bypass(dev))
-		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
-}
-
-static void dma_iommu_sync_for_device(struct device *dev, dma_addr_t addr,
-		size_t sz, enum dma_data_direction dir)
-{
-	if (dma_iommu_alloc_bypass(dev))
-		dma_direct_sync_single_for_device(dev, addr, sz, dir);
-}
-
-extern void dma_iommu_sync_sg_for_cpu(struct device *dev,
-		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
-{
-	if (dma_iommu_alloc_bypass(dev))
-		dma_direct_sync_sg_for_cpu(dev, sgl, nents, dir);
-}
-
-extern void dma_iommu_sync_sg_for_device(struct device *dev,
-		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
-{
-	if (dma_iommu_alloc_bypass(dev))
-		dma_direct_sync_sg_for_device(dev, sgl, nents, dir);
-}
-
 const struct dma_map_ops dma_iommu_ops = {
 	.alloc			= dma_iommu_alloc_coherent,
 	.free			= dma_iommu_free_coherent,
@@ -203,10 +135,6 @@ const struct dma_map_ops dma_iommu_ops = {
 	.map_page		= dma_iommu_map_page,
 	.unmap_page		= dma_iommu_unmap_page,
 	.get_required_mask	= dma_iommu_get_required_mask,
-	.sync_single_for_cpu	= dma_iommu_sync_for_cpu,
-	.sync_single_for_device	= dma_iommu_sync_for_device,
-	.sync_sg_for_cpu	= dma_iommu_sync_sg_for_cpu,
-	.sync_sg_for_device	= dma_iommu_sync_sg_for_device,
 	.mmap			= dma_common_mmap,
 	.get_sgtable		= dma_common_get_sgtable,
 };
-- 
2.26.2

