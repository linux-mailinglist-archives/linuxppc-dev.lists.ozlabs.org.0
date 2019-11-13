Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB45FB1AA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 14:45:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Cm8s1FMwzF72J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 00:45:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+b6a0ef5c1751a0763e03+5925+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="t9QomIeJ"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ClzP6x9LzF7dG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 00:37:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W7usFROFF3fsdWRNY+5NMk8LSNdlchEf2gZtNlXIxVc=; b=t9QomIeJY+XVMUq5UqJORjyt4b
 0lQ1nltCrRTmvZngDW2Ks+5Wheddik8g8/HwTQGCPmmvkKnXgVpS94X0sG+m1ReeUV40F71D6jVFk
 i56x5bvTpR8j1qlcq88pNWYZwmX4cfT0OBJMP8H1brj/gOWGlaImppF+wTlIyb+0LHsvqrIcspb6Z
 QC8zdteCNOA4UA1K8Nnr3PP1ztUeG6UNkBaydC2PmAX1XM54stxUFYeL4MbqhRKxNFSBrE27lRsAX
 UkeGFeN4sc70KT2Eisn9O1FxQDYLkiEPctVPWnxMBr5xTLvIMOXcTP9f3/hXYEQNJrgHIxu7U7LDx
 fG49W9Ng==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUspy-0008NH-Rg; Wed, 13 Nov 2019 13:37:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org,
	Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH 1/2] dma-mapping: add a dma_ops_bypass flag to struct device
Date: Wed, 13 Nov 2019 14:37:30 +0100
Message-Id: <20191113133731.20870-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113133731.20870-1-hch@lst.de>
References: <20191113133731.20870-1-hch@lst.de>
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
 linuxppc-dev@lists.ozlabs.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Several IOMMU drivers have a bypass mode where they can use a direct
mapping if the devices DMA mask is large enough.  Add generic support
to the core dma-mapping code to do that to switch those drivers to
a common solution.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/device.h      |  4 ++++
 include/linux/dma-mapping.h | 30 ++++++++++++++++++------------
 kernel/dma/mapping.c        | 35 ++++++++++++++++++++++++++---------
 3 files changed, 48 insertions(+), 21 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 297239a08bb7..b8a3b4ec46bd 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1217,6 +1217,9 @@ struct dev_links_info {
  *              device.
  * @dma_coherent: this particular device is dma coherent, even if the
  *		architecture supports non-coherent devices.
+ * @dma_ops_bypass: If set to %true then the dma_ops are bypassed for the
+ *		streaming DMA operations (->map_* / ->unmap_* / ->sync_*).
+ *		This flag is managed by the dma_ops from ->dma_supported.
  *
  * At the lowest level, every device in a Linux system is represented by an
  * instance of struct device. The device structure contains the information
@@ -1316,6 +1319,7 @@ struct device {
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
 	bool			dma_coherent:1;
 #endif
+	bool			dma_ops_bypass : 1;
 };
 
 static inline struct device *kobj_to_dev(struct kobject *kobj)
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 4d450672b7d6..22fe74179e02 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -191,9 +191,15 @@ static inline int dma_mmap_from_global_coherent(struct vm_area_struct *vma,
 }
 #endif /* CONFIG_DMA_DECLARE_COHERENT */
 
-static inline bool dma_is_direct(const struct dma_map_ops *ops)
+/*
+ * Check if the devices uses a direct mapping for streaming DMA operations.
+ * This allows IOMMU drivers to set a bypass mode if the DMA mask is large
+ * enough.
+ */
+static inline bool dma_map_direct(struct device *dev,
+		const struct dma_map_ops *ops)
 {
-	return likely(!ops);
+	return likely(!ops) || dev->dma_ops_bypass;
 }
 
 /*
@@ -282,7 +288,7 @@ static inline dma_addr_t dma_map_page_attrs(struct device *dev,
 	dma_addr_t addr;
 
 	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
 	else
 		addr = ops->map_page(dev, page, offset, size, dir, attrs);
@@ -297,7 +303,7 @@ static inline void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr,
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
 	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		dma_direct_unmap_page(dev, addr, size, dir, attrs);
 	else if (ops->unmap_page)
 		ops->unmap_page(dev, addr, size, dir, attrs);
@@ -316,7 +322,7 @@ static inline int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
 	int ents;
 
 	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
 	else
 		ents = ops->map_sg(dev, sg, nents, dir, attrs);
@@ -334,7 +340,7 @@ static inline void dma_unmap_sg_attrs(struct device *dev, struct scatterlist *sg
 
 	BUG_ON(!valid_dma_direction(dir));
 	debug_dma_unmap_sg(dev, sg, nents, dir);
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		dma_direct_unmap_sg(dev, sg, nents, dir, attrs);
 	else if (ops->unmap_sg)
 		ops->unmap_sg(dev, sg, nents, dir, attrs);
@@ -355,7 +361,7 @@ static inline dma_addr_t dma_map_resource(struct device *dev,
 	if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
 		return DMA_MAPPING_ERROR;
 
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		addr = dma_direct_map_resource(dev, phys_addr, size, dir, attrs);
 	else if (ops->map_resource)
 		addr = ops->map_resource(dev, phys_addr, size, dir, attrs);
@@ -371,7 +377,7 @@ static inline void dma_unmap_resource(struct device *dev, dma_addr_t addr,
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
 	BUG_ON(!valid_dma_direction(dir));
-	if (!dma_is_direct(ops) && ops->unmap_resource)
+	if (!dma_map_direct(dev, ops) && ops->unmap_resource)
 		ops->unmap_resource(dev, addr, size, dir, attrs);
 	debug_dma_unmap_resource(dev, addr, size, dir);
 }
@@ -383,7 +389,7 @@ static inline void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
 	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
 	else if (ops->sync_single_for_cpu)
 		ops->sync_single_for_cpu(dev, addr, size, dir);
@@ -397,7 +403,7 @@ static inline void dma_sync_single_for_device(struct device *dev,
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
 	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		dma_direct_sync_single_for_device(dev, addr, size, dir);
 	else if (ops->sync_single_for_device)
 		ops->sync_single_for_device(dev, addr, size, dir);
@@ -411,7 +417,7 @@ dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg,
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
 	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		dma_direct_sync_sg_for_cpu(dev, sg, nelems, dir);
 	else if (ops->sync_sg_for_cpu)
 		ops->sync_sg_for_cpu(dev, sg, nelems, dir);
@@ -425,7 +431,7 @@ dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg,
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
 	BUG_ON(!valid_dma_direction(dir));
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		dma_direct_sync_sg_for_device(dev, sg, nelems, dir);
 	else if (ops->sync_sg_for_device)
 		ops->sync_sg_for_device(dev, sg, nelems, dir);
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 12ff766ec1fa..fdb6e16c1b00 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -105,6 +105,19 @@ void *dmam_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 }
 EXPORT_SYMBOL(dmam_alloc_attrs);
 
+/*
+ * Check if the devices uses a direct mapping for DMA allocations.
+ * This allows IOMMU drivers to set a bypass mode if the DMA mask is large
+ * enough.
+ */
+static inline bool dma_alloc_direct(struct device *dev,
+		const struct dma_map_ops *ops)
+{
+	return likely(!ops) ||
+		(dev->dma_ops_bypass &&
+		 dma_direct_supported(dev, dev->coherent_dma_mask));
+}
+
 /*
  * Create scatter-list for the already allocated DMA buffer.
  */
@@ -138,7 +151,7 @@ int dma_get_sgtable_attrs(struct device *dev, struct sg_table *sgt,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
-	if (dma_is_direct(ops))
+	if (dma_alloc_direct(dev, ops))
 		return dma_direct_get_sgtable(dev, sgt, cpu_addr, dma_addr,
 				size, attrs);
 	if (!ops->get_sgtable)
@@ -206,7 +219,7 @@ bool dma_can_mmap(struct device *dev)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
-	if (dma_is_direct(ops))
+	if (dma_alloc_direct(dev, ops))
 		return dma_direct_can_mmap(dev);
 	return ops->mmap != NULL;
 }
@@ -231,7 +244,7 @@ int dma_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
-	if (dma_is_direct(ops))
+	if (dma_alloc_direct(dev, ops))
 		return dma_direct_mmap(dev, vma, cpu_addr, dma_addr, size,
 				attrs);
 	if (!ops->mmap)
@@ -244,7 +257,7 @@ u64 dma_get_required_mask(struct device *dev)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		return dma_direct_get_required_mask(dev);
 	if (ops->get_required_mask)
 		return ops->get_required_mask(dev);
@@ -275,7 +288,7 @@ void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 	/* let the implementation decide on the zone to allocate from: */
 	flag &= ~(__GFP_DMA | __GFP_DMA32 | __GFP_HIGHMEM);
 
-	if (dma_is_direct(ops))
+	if (dma_alloc_direct(dev, ops))
 		cpu_addr = dma_direct_alloc(dev, size, dma_handle, flag, attrs);
 	else if (ops->alloc)
 		cpu_addr = ops->alloc(dev, size, dma_handle, flag, attrs);
@@ -307,7 +320,7 @@ void dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
 		return;
 
 	debug_dma_free_coherent(dev, size, cpu_addr, dma_handle);
-	if (dma_is_direct(ops))
+	if (dma_alloc_direct(dev, ops))
 		dma_direct_free(dev, size, cpu_addr, dma_handle, attrs);
 	else if (ops->free)
 		ops->free(dev, size, cpu_addr, dma_handle, attrs);
@@ -318,7 +331,11 @@ int dma_supported(struct device *dev, u64 mask)
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 
-	if (dma_is_direct(ops))
+	/*
+	 * Only call the dma-direct version if we really do not have any ops
+	 * set, as the dma_supported op will set the dma_ops_bypass flag.
+	 */
+	if (!ops)
 		return dma_direct_supported(dev, mask);
 	if (!ops->dma_supported)
 		return 1;
@@ -374,7 +391,7 @@ void dma_cache_sync(struct device *dev, void *vaddr, size_t size,
 
 	BUG_ON(!valid_dma_direction(dir));
 
-	if (dma_is_direct(ops))
+	if (dma_alloc_direct(dev, ops))
 		arch_dma_cache_sync(dev, vaddr, size, dir);
 	else if (ops->cache_sync)
 		ops->cache_sync(dev, vaddr, size, dir);
@@ -386,7 +403,7 @@ size_t dma_max_mapping_size(struct device *dev)
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	size_t size = SIZE_MAX;
 
-	if (dma_is_direct(ops))
+	if (dma_map_direct(dev, ops))
 		size = dma_direct_max_mapping_size(dev);
 	else if (ops && ops->max_mapping_size)
 		size = ops->max_mapping_size(dev);
-- 
2.20.1

