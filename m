Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4171A7AE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 14:35:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491lM84vlQzDqdZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 22:35:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+4a22011dcb1da0b09bf4+6078+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=LrmRmdyL; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491l7M0fx7zDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 22:25:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=UXE4ZvfpHvFCQtXgmZx5sPrQdZniGS5Gq+YeZThj91M=; b=LrmRmdyLMoPXNoS0vgOAFKTl1i
 pcrAMPT0EMtmcmLMM5IJE8LtIJoSyXEfuzxyhA5vtvW5O0Ynk2q+g+VNyHsp2fGRDveabXdoEK+Li
 lFRRTG6rKoiqDn9vgr3LBf9DFP7Jk60GxyPCwy8xJVs7VyhsHV2V2PxXPj+IFqxOQRGOh4daZBGs1
 P5kyDX0o5aNIlUkc/La7pFv/p8K4SxYeFKTc2XaTNMohfEueZF8LHhMq7+aEwkY3cpeabkNbbRJyA
 CoqwP0LrKfYPwUopVNIcrgAs3A6A9p2KAYbiSrrzYTdOlMa/xMR2PAYkK8siFdO3xCWb+tUIINAjg
 dNzBvVIw==;
Received: from [2001:4bb8:180:384b:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOKcr-0004Qr-PN; Tue, 14 Apr 2020 12:25:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org,
	Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH 1/4] dma-mapping: move the remaining DMA API calls out of line
Date: Tue, 14 Apr 2020 14:25:03 +0200
Message-Id: <20200414122506.438134-2-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414122506.438134-1-hch@lst.de>
References: <20200414122506.438134-1-hch@lst.de>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For a long time the DMA API has been implemented inline in dma-mapping.h,
but the function bodies can be quite large.  Move them all out of line.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/dma-direct.h  |  58 +++++++++
 include/linux/dma-mapping.h | 247 ++++--------------------------------
 kernel/dma/direct.c         |   9 --
 kernel/dma/mapping.c        | 164 ++++++++++++++++++++++++
 4 files changed, 244 insertions(+), 234 deletions(-)

diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 24b8684aa21d..da689ad5fffd 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -85,4 +85,62 @@ int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		unsigned long attrs);
 int dma_direct_supported(struct device *dev, u64 mask);
+dma_addr_t dma_direct_map_page(struct device *dev, struct page *page,
+		unsigned long offset, size_t size, enum dma_data_direction dir,
+		unsigned long attrs);
+int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
+		enum dma_data_direction dir, unsigned long attrs);
+dma_addr_t dma_direct_map_resource(struct device *dev, phys_addr_t paddr,
+		size_t size, enum dma_data_direction dir, unsigned long attrs);
+
+#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
+    defined(CONFIG_SWIOTLB)
+void dma_direct_sync_single_for_device(struct device *dev,
+		dma_addr_t addr, size_t size, enum dma_data_direction dir);
+void dma_direct_sync_sg_for_device(struct device *dev,
+		struct scatterlist *sgl, int nents, enum dma_data_direction dir);
+#else
+static inline void dma_direct_sync_single_for_device(struct device *dev,
+		dma_addr_t addr, size_t size, enum dma_data_direction dir)
+{
+}
+static inline void dma_direct_sync_sg_for_device(struct device *dev,
+		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
+{
+}
+#endif
+
+#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
+    defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL) || \
+    defined(CONFIG_SWIOTLB)
+void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
+		size_t size, enum dma_data_direction dir, unsigned long attrs);
+void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
+		int nents, enum dma_data_direction dir, unsigned long attrs);
+void dma_direct_sync_single_for_cpu(struct device *dev,
+		dma_addr_t addr, size_t size, enum dma_data_direction dir);
+void dma_direct_sync_sg_for_cpu(struct device *dev,
+		struct scatterlist *sgl, int nents, enum dma_data_direction dir);
+#else
+static inline void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
+		size_t size, enum dma_data_direction dir, unsigned long attrs)
+{
+}
+static inline void dma_direct_unmap_sg(struct device *dev,
+		struct scatterlist *sgl, int nents, enum dma_data_direction dir,
+		unsigned long attrs)
+{
+}
+static inline void dma_direct_sync_single_for_cpu(struct device *dev,
+		dma_addr_t addr, size_t size, enum dma_data_direction dir)
+{
+}
+static inline void dma_direct_sync_sg_for_cpu(struct device *dev,
+		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
+{
+}
+#endif
+
+size_t dma_direct_max_mapping_size(struct device *dev);
+
 #endif /* _LINUX_DMA_DIRECT_H */
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 330ad58fbf4d..793ad775cd54 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -188,73 +188,6 @@ static inline int dma_mmap_from_global_coherent(struct vm_area_struct *vma,
 }
 #endif /* CONFIG_DMA_DECLARE_COHERENT */
 
-static inline bool dma_is_direct(const struct dma_map_ops *ops)
-{
-	return likely(!ops);
-}
-
-/*
- * All the dma_direct_* declarations are here just for the indirect call bypass,
- * and must not be used directly drivers!
- */
-dma_addr_t dma_direct_map_page(struct device *dev, struct page *page,
-		unsigned long offset, size_t size, enum dma_data_direction dir,
-		unsigned long attrs);
-int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
-		enum dma_data_direction dir, unsigned long attrs);
-dma_addr_t dma_direct_map_resource(struct device *dev, phys_addr_t paddr,
-		size_t size, enum dma_data_direction dir, unsigned long attrs);
-
-#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
-    defined(CONFIG_SWIOTLB)
-void dma_direct_sync_single_for_device(struct device *dev,
-		dma_addr_t addr, size_t size, enum dma_data_direction dir);
-void dma_direct_sync_sg_for_device(struct device *dev,
-		struct scatterlist *sgl, int nents, enum dma_data_direction dir);
-#else
-static inline void dma_direct_sync_single_for_device(struct device *dev,
-		dma_addr_t addr, size_t size, enum dma_data_direction dir)
-{
-}
-static inline void dma_direct_sync_sg_for_device(struct device *dev,
-		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
-{
-}
-#endif
-
-#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
-    defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL) || \
-    defined(CONFIG_SWIOTLB)
-void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
-		size_t size, enum dma_data_direction dir, unsigned long attrs);
-void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
-		int nents, enum dma_data_direction dir, unsigned long attrs);
-void dma_direct_sync_single_for_cpu(struct device *dev,
-		dma_addr_t addr, size_t size, enum dma_data_direction dir);
-void dma_direct_sync_sg_for_cpu(struct device *dev,
-		struct scatterlist *sgl, int nents, enum dma_data_direction dir);
-#else
-static inline void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
-		size_t size, enum dma_data_direction dir, unsigned long attrs)
-{
-}
-static inline void dma_direct_unmap_sg(struct device *dev,
-		struct scatterlist *sgl, int nents, enum dma_data_direction dir,
-		unsigned long attrs)
-{
-}
-static inline void dma_direct_sync_single_for_cpu(struct device *dev,
-		dma_addr_t addr, size_t size, enum dma_data_direction dir)
-{
-}
-static inline void dma_direct_sync_sg_for_cpu(struct device *dev,
-		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
-{
-}
-#endif
-
-size_t dma_direct_max_mapping_size(struct device *dev);
-
 #ifdef CONFIG_HAS_DMA
 #include <asm/dma-mapping.h>
 
@@ -271,164 +204,6 @@ static inline void set_dma_ops(struct device *dev,
 	dev->dma_ops = dma_ops;
 }
 
-static inline dma_addr_t dma_map_page_attrs(struct device *dev,
-		struct page *page, size_t offset, size_t size,
-		enum dma_data_direction dir, unsigned long attrs)
-{
-	const struct dma_map_ops *ops = get_dma_ops(dev);
-	dma_addr_t addr;
-
-	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
-		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
-	else
-		addr = ops->map_page(dev, page, offset, size, dir, attrs);
-	debug_dma_map_page(dev, page, offset, size, dir, addr);
-
-	return addr;
-}
-
-static inline void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr,
-		size_t size, enum dma_data_direction dir, unsigned long attrs)
-{
-	const struct dma_map_ops *ops = get_dma_ops(dev);
-
-	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
-		dma_direct_unmap_page(dev, addr, size, dir, attrs);
-	else if (ops->unmap_page)
-		ops->unmap_page(dev, addr, size, dir, attrs);
-	debug_dma_unmap_page(dev, addr, size, dir);
-}
-
-/*
- * dma_maps_sg_attrs returns 0 on error and > 0 on success.
- * It should never return a value < 0.
- */
-static inline int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
-				   int nents, enum dma_data_direction dir,
-				   unsigned long attrs)
-{
-	const struct dma_map_ops *ops = get_dma_ops(dev);
-	int ents;
-
-	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
-		ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
-	else
-		ents = ops->map_sg(dev, sg, nents, dir, attrs);
-	BUG_ON(ents < 0);
-	debug_dma_map_sg(dev, sg, nents, ents, dir);
-
-	return ents;
-}
-
-static inline void dma_unmap_sg_attrs(struct device *dev, struct scatterlist *sg,
-				      int nents, enum dma_data_direction dir,
-				      unsigned long attrs)
-{
-	const struct dma_map_ops *ops = get_dma_ops(dev);
-
-	BUG_ON(!valid_dma_direction(dir));
-	debug_dma_unmap_sg(dev, sg, nents, dir);
-	if (dma_is_direct(ops))
-		dma_direct_unmap_sg(dev, sg, nents, dir, attrs);
-	else if (ops->unmap_sg)
-		ops->unmap_sg(dev, sg, nents, dir, attrs);
-}
-
-static inline dma_addr_t dma_map_resource(struct device *dev,
-					  phys_addr_t phys_addr,
-					  size_t size,
-					  enum dma_data_direction dir,
-					  unsigned long attrs)
-{
-	const struct dma_map_ops *ops = get_dma_ops(dev);
-	dma_addr_t addr = DMA_MAPPING_ERROR;
-
-	BUG_ON(!valid_dma_direction(dir));
-
-	/* Don't allow RAM to be mapped */
-	if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
-		return DMA_MAPPING_ERROR;
-
-	if (dma_is_direct(ops))
-		addr = dma_direct_map_resource(dev, phys_addr, size, dir, attrs);
-	else if (ops->map_resource)
-		addr = ops->map_resource(dev, phys_addr, size, dir, attrs);
-
-	debug_dma_map_resource(dev, phys_addr, size, dir, addr);
-	return addr;
-}
-
-static inline void dma_unmap_resource(struct device *dev, dma_addr_t addr,
-				      size_t size, enum dma_data_direction dir,
-				      unsigned long attrs)
-{
-	const struct dma_map_ops *ops = get_dma_ops(dev);
-
-	BUG_ON(!valid_dma_direction(dir));
-	if (!dma_is_direct(ops) && ops->unmap_resource)
-		ops->unmap_resource(dev, addr, size, dir, attrs);
-	debug_dma_unmap_resource(dev, addr, size, dir);
-}
-
-static inline void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
-					   size_t size,
-					   enum dma_data_direction dir)
-{
-	const struct dma_map_ops *ops = get_dma_ops(dev);
-
-	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
-		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
-	else if (ops->sync_single_for_cpu)
-		ops->sync_single_for_cpu(dev, addr, size, dir);
-	debug_dma_sync_single_for_cpu(dev, addr, size, dir);
-}
-
-static inline void dma_sync_single_for_device(struct device *dev,
-					      dma_addr_t addr, size_t size,
-					      enum dma_data_direction dir)
-{
-	const struct dma_map_ops *ops = get_dma_ops(dev);
-
-	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
-		dma_direct_sync_single_for_device(dev, addr, size, dir);
-	else if (ops->sync_single_for_device)
-		ops->sync_single_for_device(dev, addr, size, dir);
-	debug_dma_sync_single_for_device(dev, addr, size, dir);
-}
-
-static inline void
-dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg,
-		    int nelems, enum dma_data_direction dir)
-{
-	const struct dma_map_ops *ops = get_dma_ops(dev);
-
-	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
-		dma_direct_sync_sg_for_cpu(dev, sg, nelems, dir);
-	else if (ops->sync_sg_for_cpu)
-		ops->sync_sg_for_cpu(dev, sg, nelems, dir);
-	debug_dma_sync_sg_for_cpu(dev, sg, nelems, dir);
-}
-
-static inline void
-dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg,
-		       int nelems, enum dma_data_direction dir)
-{
-	const struct dma_map_ops *ops = get_dma_ops(dev);
-
-	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
-		dma_direct_sync_sg_for_device(dev, sg, nelems, dir);
-	else if (ops->sync_sg_for_device)
-		ops->sync_sg_for_device(dev, sg, nelems, dir);
-	debug_dma_sync_sg_for_device(dev, sg, nelems, dir);
-
-}
 
 static inline int dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
 {
@@ -439,6 +214,28 @@ static inline int dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
 	return 0;
 }
 
+dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
+		size_t offset, size_t size, enum dma_data_direction dir,
+		unsigned long attrs);
+void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr, size_t size,
+		enum dma_data_direction dir, unsigned long attrs);
+int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg, int nents,
+		enum dma_data_direction dir, unsigned long attrs);
+void dma_unmap_sg_attrs(struct device *dev, struct scatterlist *sg,
+				      int nents, enum dma_data_direction dir,
+				      unsigned long attrs);
+dma_addr_t dma_map_resource(struct device *dev, phys_addr_t phys_addr,
+		size_t size, enum dma_data_direction dir, unsigned long attrs);
+void dma_unmap_resource(struct device *dev, dma_addr_t addr, size_t size,
+		enum dma_data_direction dir, unsigned long attrs);
+void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr, size_t size,
+		enum dma_data_direction dir);
+void dma_sync_single_for_device(struct device *dev, dma_addr_t addr,
+		size_t size, enum dma_data_direction dir);
+void dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg,
+		    int nelems, enum dma_data_direction dir);
+void dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg,
+		       int nelems, enum dma_data_direction dir);
 void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 		gfp_t flag, unsigned long attrs);
 void dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 8f4bbdaf965e..f1a9099a4b5b 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -260,7 +260,6 @@ void dma_direct_sync_single_for_device(struct device *dev,
 	if (!dev_is_dma_coherent(dev))
 		arch_sync_dma_for_device(paddr, size, dir);
 }
-EXPORT_SYMBOL(dma_direct_sync_single_for_device);
 
 void dma_direct_sync_sg_for_device(struct device *dev,
 		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
@@ -280,7 +279,6 @@ void dma_direct_sync_sg_for_device(struct device *dev,
 					dir);
 	}
 }
-EXPORT_SYMBOL(dma_direct_sync_sg_for_device);
 #endif
 
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
@@ -299,7 +297,6 @@ void dma_direct_sync_single_for_cpu(struct device *dev,
 	if (unlikely(is_swiotlb_buffer(paddr)))
 		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_CPU);
 }
-EXPORT_SYMBOL(dma_direct_sync_single_for_cpu);
 
 void dma_direct_sync_sg_for_cpu(struct device *dev,
 		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
@@ -321,7 +318,6 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 	if (!dev_is_dma_coherent(dev))
 		arch_sync_dma_for_cpu_all();
 }
-EXPORT_SYMBOL(dma_direct_sync_sg_for_cpu);
 
 void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
@@ -334,7 +330,6 @@ void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
 	if (unlikely(is_swiotlb_buffer(phys)))
 		swiotlb_tbl_unmap_single(dev, phys, size, size, dir, attrs);
 }
-EXPORT_SYMBOL(dma_direct_unmap_page);
 
 void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
 		int nents, enum dma_data_direction dir, unsigned long attrs)
@@ -346,7 +341,6 @@ void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
 		dma_direct_unmap_page(dev, sg->dma_address, sg_dma_len(sg), dir,
 			     attrs);
 }
-EXPORT_SYMBOL(dma_direct_unmap_sg);
 #endif
 
 dma_addr_t dma_direct_map_page(struct device *dev, struct page *page,
@@ -373,7 +367,6 @@ dma_addr_t dma_direct_map_page(struct device *dev, struct page *page,
 		arch_sync_dma_for_device(phys, size, dir);
 	return dma_addr;
 }
-EXPORT_SYMBOL(dma_direct_map_page);
 
 int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 		enum dma_data_direction dir, unsigned long attrs)
@@ -395,7 +388,6 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 	dma_direct_unmap_sg(dev, sgl, i, dir, attrs | DMA_ATTR_SKIP_CPU_SYNC);
 	return 0;
 }
-EXPORT_SYMBOL(dma_direct_map_sg);
 
 dma_addr_t dma_direct_map_resource(struct device *dev, phys_addr_t paddr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
@@ -412,7 +404,6 @@ dma_addr_t dma_direct_map_resource(struct device *dev, phys_addr_t paddr,
 
 	return dma_addr;
 }
-EXPORT_SYMBOL(dma_direct_map_resource);
 
 int dma_direct_get_sgtable(struct device *dev, struct sg_table *sgt,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 98e3d873792e..8e4155f9ee69 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -105,6 +105,170 @@ void *dmam_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 }
 EXPORT_SYMBOL(dmam_alloc_attrs);
 
+static inline bool dma_is_direct(const struct dma_map_ops *ops)
+{
+	return likely(!ops);
+}
+
+dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
+		size_t offset, size_t size, enum dma_data_direction dir,
+		unsigned long attrs)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+	dma_addr_t addr;
+
+	BUG_ON(!valid_dma_direction(dir));
+	if (dma_is_direct(ops))
+		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
+	else
+		addr = ops->map_page(dev, page, offset, size, dir, attrs);
+	debug_dma_map_page(dev, page, offset, size, dir, addr);
+
+	return addr;
+}
+EXPORT_SYMBOL(dma_map_page_attrs);
+
+void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr, size_t size,
+		enum dma_data_direction dir, unsigned long attrs)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	BUG_ON(!valid_dma_direction(dir));
+	if (dma_is_direct(ops))
+		dma_direct_unmap_page(dev, addr, size, dir, attrs);
+	else if (ops->unmap_page)
+		ops->unmap_page(dev, addr, size, dir, attrs);
+	debug_dma_unmap_page(dev, addr, size, dir);
+}
+EXPORT_SYMBOL(dma_unmap_page_attrs);
+
+/*
+ * dma_maps_sg_attrs returns 0 on error and > 0 on success.
+ * It should never return a value < 0.
+ */
+int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg, int nents,
+		enum dma_data_direction dir, unsigned long attrs)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+	int ents;
+
+	BUG_ON(!valid_dma_direction(dir));
+	if (dma_is_direct(ops))
+		ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
+	else
+		ents = ops->map_sg(dev, sg, nents, dir, attrs);
+	BUG_ON(ents < 0);
+	debug_dma_map_sg(dev, sg, nents, ents, dir);
+
+	return ents;
+}
+EXPORT_SYMBOL(dma_map_sg_attrs);
+
+void dma_unmap_sg_attrs(struct device *dev, struct scatterlist *sg,
+				      int nents, enum dma_data_direction dir,
+				      unsigned long attrs)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	BUG_ON(!valid_dma_direction(dir));
+	debug_dma_unmap_sg(dev, sg, nents, dir);
+	if (dma_is_direct(ops))
+		dma_direct_unmap_sg(dev, sg, nents, dir, attrs);
+	else if (ops->unmap_sg)
+		ops->unmap_sg(dev, sg, nents, dir, attrs);
+}
+EXPORT_SYMBOL(dma_unmap_sg_attrs);
+
+dma_addr_t dma_map_resource(struct device *dev, phys_addr_t phys_addr,
+		size_t size, enum dma_data_direction dir, unsigned long attrs)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+	dma_addr_t addr = DMA_MAPPING_ERROR;
+
+	BUG_ON(!valid_dma_direction(dir));
+
+	/* Don't allow RAM to be mapped */
+	if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
+		return DMA_MAPPING_ERROR;
+
+	if (dma_is_direct(ops))
+		addr = dma_direct_map_resource(dev, phys_addr, size, dir, attrs);
+	else if (ops->map_resource)
+		addr = ops->map_resource(dev, phys_addr, size, dir, attrs);
+
+	debug_dma_map_resource(dev, phys_addr, size, dir, addr);
+	return addr;
+}
+EXPORT_SYMBOL(dma_map_resource);
+
+void dma_unmap_resource(struct device *dev, dma_addr_t addr, size_t size,
+		enum dma_data_direction dir, unsigned long attrs)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	BUG_ON(!valid_dma_direction(dir));
+	if (!dma_is_direct(ops) && ops->unmap_resource)
+		ops->unmap_resource(dev, addr, size, dir, attrs);
+	debug_dma_unmap_resource(dev, addr, size, dir);
+}
+EXPORT_SYMBOL(dma_unmap_resource);
+
+void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr, size_t size,
+		enum dma_data_direction dir)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	BUG_ON(!valid_dma_direction(dir));
+	if (dma_is_direct(ops))
+		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
+	else if (ops->sync_single_for_cpu)
+		ops->sync_single_for_cpu(dev, addr, size, dir);
+	debug_dma_sync_single_for_cpu(dev, addr, size, dir);
+}
+EXPORT_SYMBOL(dma_sync_single_for_cpu);
+
+void dma_sync_single_for_device(struct device *dev, dma_addr_t addr,
+		size_t size, enum dma_data_direction dir)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	BUG_ON(!valid_dma_direction(dir));
+	if (dma_is_direct(ops))
+		dma_direct_sync_single_for_device(dev, addr, size, dir);
+	else if (ops->sync_single_for_device)
+		ops->sync_single_for_device(dev, addr, size, dir);
+	debug_dma_sync_single_for_device(dev, addr, size, dir);
+}
+EXPORT_SYMBOL(dma_sync_single_for_device);
+
+void dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg,
+		    int nelems, enum dma_data_direction dir)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	BUG_ON(!valid_dma_direction(dir));
+	if (dma_is_direct(ops))
+		dma_direct_sync_sg_for_cpu(dev, sg, nelems, dir);
+	else if (ops->sync_sg_for_cpu)
+		ops->sync_sg_for_cpu(dev, sg, nelems, dir);
+	debug_dma_sync_sg_for_cpu(dev, sg, nelems, dir);
+}
+EXPORT_SYMBOL(dma_sync_sg_for_cpu);
+
+void dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg,
+		       int nelems, enum dma_data_direction dir)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	BUG_ON(!valid_dma_direction(dir));
+	if (dma_is_direct(ops))
+		dma_direct_sync_sg_for_device(dev, sg, nelems, dir);
+	else if (ops->sync_sg_for_device)
+		ops->sync_sg_for_device(dev, sg, nelems, dir);
+	debug_dma_sync_sg_for_device(dev, sg, nelems, dir);
+}
+EXPORT_SYMBOL(dma_sync_sg_for_device);
+
 /*
  * Create scatter-list for the already allocated DMA buffer.
  */
-- 
2.25.1

