Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7B61A7AF4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 14:38:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491lQP1TSjzDqck
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 22:38:21 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=P+S81egH; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491l7N37ZkzDqcQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 22:25:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=kom/CIBRWnlOW1ThqBKL6yDK2u3DAQkIEIUVL4MSjp8=; b=P+S81egH/6p3TTiviqato/Qh1X
 topOKY0ScT/FBNqgXkUuxl84aRXvtxKC/4mDynnAXp7RwbLwVF/6SqilFkbJWt0HbCgF3Xi/Rq4FA
 aH1SB2uRnfkxcMD1a94eH3lcoZUw21i2OJFk8J66TVvX+Eevz9IprPMXYTDQFvFBygqrEZWVZ9lhw
 qBwvK7fvCQbvlRAfH3m7++0eKG0zHrQ0yBc/c4fCgFwi2kOdpTebtiTXhXHff5sDR5owqv2Vbr+kM
 iQk+VUBpDMoJBepQqs9ERe3LE5cRBUb9C/zphHz/Ii77aX/eg4wnklF0GpkZJDLAarrSD/WOIERUL
 vFtchf5A==;
Received: from [2001:4bb8:180:384b:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOKcu-00055O-Nw; Tue, 14 Apr 2020 12:25:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org,
	Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH 2/4] dma-mapping: inline the fast path dma-direct calls
Date: Tue, 14 Apr 2020 14:25:04 +0200
Message-Id: <20200414122506.438134-3-hch@lst.de>
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

Inline the single page map/unmap/sync dma-direct calls into the now
out of line generic wrappers.  This restores the behavior of a single
function call that we had before moving the generic calls out of line.
Besides the dma-mapping callers there are just a few callers in IOMMU
drivers that have a bypass mode, and more of those are going to be
switched to the generic bypass soon.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/dma-direct.h | 88 ++++++++++++++++++++++++++++----------
 kernel/dma/direct.c        | 65 ----------------------------
 2 files changed, 65 insertions(+), 88 deletions(-)

diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index da689ad5fffd..d653070d515b 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -3,8 +3,10 @@
 #define _LINUX_DMA_DIRECT_H 1
 
 #include <linux/dma-mapping.h>
+#include <linux/dma-noncoherent.h>
 #include <linux/memblock.h> /* for min_low_pfn */
 #include <linux/mem_encrypt.h>
+#include <linux/swiotlb.h>
 
 extern unsigned int zone_dma_bits;
 
@@ -85,25 +87,17 @@ int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		unsigned long attrs);
 int dma_direct_supported(struct device *dev, u64 mask);
-dma_addr_t dma_direct_map_page(struct device *dev, struct page *page,
-		unsigned long offset, size_t size, enum dma_data_direction dir,
-		unsigned long attrs);
 int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 		enum dma_data_direction dir, unsigned long attrs);
 dma_addr_t dma_direct_map_resource(struct device *dev, phys_addr_t paddr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs);
+size_t dma_direct_max_mapping_size(struct device *dev);
 
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
     defined(CONFIG_SWIOTLB)
-void dma_direct_sync_single_for_device(struct device *dev,
-		dma_addr_t addr, size_t size, enum dma_data_direction dir);
-void dma_direct_sync_sg_for_device(struct device *dev,
-		struct scatterlist *sgl, int nents, enum dma_data_direction dir);
+void dma_direct_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
+		int nents, enum dma_data_direction dir);
 #else
-static inline void dma_direct_sync_single_for_device(struct device *dev,
-		dma_addr_t addr, size_t size, enum dma_data_direction dir)
-{
-}
 static inline void dma_direct_sync_sg_for_device(struct device *dev,
 		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
 {
@@ -113,34 +107,82 @@ static inline void dma_direct_sync_sg_for_device(struct device *dev,
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL) || \
     defined(CONFIG_SWIOTLB)
-void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
-		size_t size, enum dma_data_direction dir, unsigned long attrs);
 void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
 		int nents, enum dma_data_direction dir, unsigned long attrs);
-void dma_direct_sync_single_for_cpu(struct device *dev,
-		dma_addr_t addr, size_t size, enum dma_data_direction dir);
 void dma_direct_sync_sg_for_cpu(struct device *dev,
 		struct scatterlist *sgl, int nents, enum dma_data_direction dir);
 #else
-static inline void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
-		size_t size, enum dma_data_direction dir, unsigned long attrs)
-{
-}
 static inline void dma_direct_unmap_sg(struct device *dev,
 		struct scatterlist *sgl, int nents, enum dma_data_direction dir,
 		unsigned long attrs)
 {
 }
+static inline void dma_direct_sync_sg_for_cpu(struct device *dev,
+		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
+{
+}
+#endif
+
+static inline void dma_direct_sync_single_for_device(struct device *dev,
+		dma_addr_t addr, size_t size, enum dma_data_direction dir)
+{
+	phys_addr_t paddr = dma_to_phys(dev, addr);
+
+	if (unlikely(is_swiotlb_buffer(paddr)))
+		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_DEVICE);
+
+	if (!dev_is_dma_coherent(dev))
+		arch_sync_dma_for_device(paddr, size, dir);
+}
+
 static inline void dma_direct_sync_single_for_cpu(struct device *dev,
 		dma_addr_t addr, size_t size, enum dma_data_direction dir)
 {
+	phys_addr_t paddr = dma_to_phys(dev, addr);
+
+	if (!dev_is_dma_coherent(dev)) {
+		arch_sync_dma_for_cpu(paddr, size, dir);
+		arch_sync_dma_for_cpu_all();
+	}
+
+	if (unlikely(is_swiotlb_buffer(paddr)))
+		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_CPU);
 }
-static inline void dma_direct_sync_sg_for_cpu(struct device *dev,
-		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
+
+static inline dma_addr_t dma_direct_map_page(struct device *dev,
+		struct page *page, unsigned long offset, size_t size,
+		enum dma_data_direction dir, unsigned long attrs)
 {
+	phys_addr_t phys = page_to_phys(page) + offset;
+	dma_addr_t dma_addr = phys_to_dma(dev, phys);
+
+	if (unlikely(swiotlb_force == SWIOTLB_FORCE))
+		return swiotlb_map(dev, phys, size, dir, attrs);
+
+	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
+		if (swiotlb_force != SWIOTLB_NO_FORCE)
+			return swiotlb_map(dev, phys, size, dir, attrs);
+
+		dev_WARN_ONCE(dev, 1,
+			     "DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
+			     &dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
+		return DMA_MAPPING_ERROR;
+	}
+
+	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+		arch_sync_dma_for_device(phys, size, dir);
+	return dma_addr;
 }
-#endif
 
-size_t dma_direct_max_mapping_size(struct device *dev);
+static inline void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
+		size_t size, enum dma_data_direction dir, unsigned long attrs)
+{
+	phys_addr_t phys = dma_to_phys(dev, addr);
 
+	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
+
+	if (unlikely(is_swiotlb_buffer(phys)))
+		swiotlb_tbl_unmap_single(dev, phys, size, size, dir, attrs);
+}
 #endif /* _LINUX_DMA_DIRECT_H */
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index f1a9099a4b5b..0a320f9b837f 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -10,11 +10,9 @@
 #include <linux/dma-direct.h>
 #include <linux/scatterlist.h>
 #include <linux/dma-contiguous.h>
-#include <linux/dma-noncoherent.h>
 #include <linux/pfn.h>
 #include <linux/vmalloc.h>
 #include <linux/set_memory.h>
-#include <linux/swiotlb.h>
 
 /*
  * Most architectures use ZONE_DMA for the first 16 Megabytes, but some use it
@@ -249,18 +247,6 @@ void dma_direct_free(struct device *dev, size_t size,
 
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
     defined(CONFIG_SWIOTLB)
-void dma_direct_sync_single_for_device(struct device *dev,
-		dma_addr_t addr, size_t size, enum dma_data_direction dir)
-{
-	phys_addr_t paddr = dma_to_phys(dev, addr);
-
-	if (unlikely(is_swiotlb_buffer(paddr)))
-		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_DEVICE);
-
-	if (!dev_is_dma_coherent(dev))
-		arch_sync_dma_for_device(paddr, size, dir);
-}
-
 void dma_direct_sync_sg_for_device(struct device *dev,
 		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
 {
@@ -284,20 +270,6 @@ void dma_direct_sync_sg_for_device(struct device *dev,
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL) || \
     defined(CONFIG_SWIOTLB)
-void dma_direct_sync_single_for_cpu(struct device *dev,
-		dma_addr_t addr, size_t size, enum dma_data_direction dir)
-{
-	phys_addr_t paddr = dma_to_phys(dev, addr);
-
-	if (!dev_is_dma_coherent(dev)) {
-		arch_sync_dma_for_cpu(paddr, size, dir);
-		arch_sync_dma_for_cpu_all();
-	}
-
-	if (unlikely(is_swiotlb_buffer(paddr)))
-		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_CPU);
-}
-
 void dma_direct_sync_sg_for_cpu(struct device *dev,
 		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
 {
@@ -319,18 +291,6 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 		arch_sync_dma_for_cpu_all();
 }
 
-void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
-		size_t size, enum dma_data_direction dir, unsigned long attrs)
-{
-	phys_addr_t phys = dma_to_phys(dev, addr);
-
-	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
-
-	if (unlikely(is_swiotlb_buffer(phys)))
-		swiotlb_tbl_unmap_single(dev, phys, size, size, dir, attrs);
-}
-
 void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
 		int nents, enum dma_data_direction dir, unsigned long attrs)
 {
@@ -343,31 +303,6 @@ void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
 }
 #endif
 
-dma_addr_t dma_direct_map_page(struct device *dev, struct page *page,
-		unsigned long offset, size_t size, enum dma_data_direction dir,
-		unsigned long attrs)
-{
-	phys_addr_t phys = page_to_phys(page) + offset;
-	dma_addr_t dma_addr = phys_to_dma(dev, phys);
-
-	if (unlikely(swiotlb_force == SWIOTLB_FORCE))
-		return swiotlb_map(dev, phys, size, dir, attrs);
-
-	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
-		if (swiotlb_force != SWIOTLB_NO_FORCE)
-			return swiotlb_map(dev, phys, size, dir, attrs);
-
-		dev_WARN_ONCE(dev, 1,
-			     "DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
-			     &dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
-		return DMA_MAPPING_ERROR;
-	}
-
-	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
-		arch_sync_dma_for_device(phys, size, dir);
-	return dma_addr;
-}
-
 int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
 		enum dma_data_direction dir, unsigned long attrs)
 {
-- 
2.25.1

