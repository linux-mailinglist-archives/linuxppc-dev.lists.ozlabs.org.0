Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7699C294700
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 05:36:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGGP76L5GzDqwn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 14:36:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
X-Greylist: delayed 542 seconds by postgrey-1.36 at bilbo;
 Wed, 21 Oct 2020 14:29:49 AEDT
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CGGFn0YYdzDqcR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Oct 2020 14:29:48 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 584AFAE80120;
 Tue, 20 Oct 2020 23:19:58 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel 1/2] Revert "dma-mapping: move large parts of
 <linux/dma-direct.h> to kernel/dma"
Date: Wed, 21 Oct 2020 14:20:25 +1100
Message-Id: <20201021032026.45030-2-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201021032026.45030-1-aik@ozlabs.ru>
References: <20201021032026.45030-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit 19c65c3d30bb5a97170e425979d2e44ab2096c7d which
was a right move but sadly there is a POWERPC/pseries hardware config
which uses a mixture of direct and IOMMU DMA but bringing this
logic to the generic code won't benefit anybody else. The user of
this revert comes in the next patch.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 include/linux/dma-direct.h | 106 +++++++++++++++++++++++++++++++++
 kernel/dma/direct.h        | 119 -------------------------------------
 kernel/dma/direct.c        |   2 +-
 kernel/dma/mapping.c       |   2 +-
 4 files changed, 108 insertions(+), 121 deletions(-)
 delete mode 100644 kernel/dma/direct.h

diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 18aade195884..e388b77e0048 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -120,8 +120,114 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 void dma_direct_free_pages(struct device *dev, size_t size,
 		struct page *page, dma_addr_t dma_addr,
 		enum dma_data_direction dir);
+int dma_direct_get_sgtable(struct device *dev, struct sg_table *sgt,
+		void *cpu_addr, dma_addr_t dma_addr, size_t size,
+		unsigned long attrs);
+bool dma_direct_can_mmap(struct device *dev);
+int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
+		void *cpu_addr, dma_addr_t dma_addr, size_t size,
+		unsigned long attrs);
 int dma_direct_supported(struct device *dev, u64 mask);
+bool dma_direct_need_sync(struct device *dev, dma_addr_t dma_addr);
+int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
+		enum dma_data_direction dir, unsigned long attrs);
 dma_addr_t dma_direct_map_resource(struct device *dev, phys_addr_t paddr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs);
+size_t dma_direct_max_mapping_size(struct device *dev);
 
+#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
+    defined(CONFIG_SWIOTLB)
+void dma_direct_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
+		int nents, enum dma_data_direction dir);
+#else
+static inline void dma_direct_sync_sg_for_device(struct device *dev,
+		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
+{
+}
+#endif
+
+#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
+    defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL) || \
+    defined(CONFIG_SWIOTLB)
+void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
+		int nents, enum dma_data_direction dir, unsigned long attrs);
+void dma_direct_sync_sg_for_cpu(struct device *dev,
+		struct scatterlist *sgl, int nents, enum dma_data_direction dir);
+#else
+static inline void dma_direct_unmap_sg(struct device *dev,
+		struct scatterlist *sgl, int nents, enum dma_data_direction dir,
+		unsigned long attrs)
+{
+}
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
+static inline void dma_direct_sync_single_for_cpu(struct device *dev,
+		dma_addr_t addr, size_t size, enum dma_data_direction dir)
+{
+	phys_addr_t paddr = dma_to_phys(dev, addr);
+
+	if (!dev_is_dma_coherent(dev)) {
+		arch_sync_dma_for_cpu(paddr, size, dir);
+		arch_sync_dma_for_cpu_all();
+	}
+
+	if (unlikely(is_swiotlb_buffer(paddr)))
+		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_CPU);
+
+	if (dir == DMA_FROM_DEVICE)
+		arch_dma_mark_clean(paddr, size);
+}
+
+static inline dma_addr_t dma_direct_map_page(struct device *dev,
+		struct page *page, unsigned long offset, size_t size,
+		enum dma_data_direction dir, unsigned long attrs)
+{
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
+}
+
+static inline void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
+		size_t size, enum dma_data_direction dir, unsigned long attrs)
+{
+	phys_addr_t phys = dma_to_phys(dev, addr);
+
+	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
+
+	if (unlikely(is_swiotlb_buffer(phys)))
+		swiotlb_tbl_unmap_single(dev, phys, size, size, dir, attrs);
+}
 #endif /* _LINUX_DMA_DIRECT_H */
diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
deleted file mode 100644
index b98615578737..000000000000
--- a/kernel/dma/direct.h
+++ /dev/null
@@ -1,119 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2018 Christoph Hellwig.
- *
- * DMA operations that map physical memory directly without using an IOMMU.
- */
-#ifndef _KERNEL_DMA_DIRECT_H
-#define _KERNEL_DMA_DIRECT_H
-
-#include <linux/dma-direct.h>
-
-int dma_direct_get_sgtable(struct device *dev, struct sg_table *sgt,
-		void *cpu_addr, dma_addr_t dma_addr, size_t size,
-		unsigned long attrs);
-bool dma_direct_can_mmap(struct device *dev);
-int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
-		void *cpu_addr, dma_addr_t dma_addr, size_t size,
-		unsigned long attrs);
-bool dma_direct_need_sync(struct device *dev, dma_addr_t dma_addr);
-int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
-		enum dma_data_direction dir, unsigned long attrs);
-size_t dma_direct_max_mapping_size(struct device *dev);
-
-#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
-    defined(CONFIG_SWIOTLB)
-void dma_direct_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
-		int nents, enum dma_data_direction dir);
-#else
-static inline void dma_direct_sync_sg_for_device(struct device *dev,
-		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
-{
-}
-#endif
-
-#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
-    defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL) || \
-    defined(CONFIG_SWIOTLB)
-void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
-		int nents, enum dma_data_direction dir, unsigned long attrs);
-void dma_direct_sync_sg_for_cpu(struct device *dev,
-		struct scatterlist *sgl, int nents, enum dma_data_direction dir);
-#else
-static inline void dma_direct_unmap_sg(struct device *dev,
-		struct scatterlist *sgl, int nents, enum dma_data_direction dir,
-		unsigned long attrs)
-{
-}
-static inline void dma_direct_sync_sg_for_cpu(struct device *dev,
-		struct scatterlist *sgl, int nents, enum dma_data_direction dir)
-{
-}
-#endif
-
-static inline void dma_direct_sync_single_for_device(struct device *dev,
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
-static inline void dma_direct_sync_single_for_cpu(struct device *dev,
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
-
-	if (dir == DMA_FROM_DEVICE)
-		arch_dma_mark_clean(paddr, size);
-}
-
-static inline dma_addr_t dma_direct_map_page(struct device *dev,
-		struct page *page, unsigned long offset, size_t size,
-		enum dma_data_direction dir, unsigned long attrs)
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
-static inline void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
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
-#endif /* _KERNEL_DMA_DIRECT_H */
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 06c111544f61..cf281589cdc6 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -7,13 +7,13 @@
 #include <linux/memblock.h> /* for max_pfn */
 #include <linux/export.h>
 #include <linux/mm.h>
+#include <linux/dma-direct.h>
 #include <linux/dma-map-ops.h>
 #include <linux/scatterlist.h>
 #include <linux/pfn.h>
 #include <linux/vmalloc.h>
 #include <linux/set_memory.h>
 #include <linux/slab.h>
-#include "direct.h"
 
 /*
  * Most architectures use ZONE_DMA for the first 16 Megabytes, but some use
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 51bb8fa8eb89..335ba183e095 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -7,6 +7,7 @@
  */
 #include <linux/memblock.h> /* for max_pfn */
 #include <linux/acpi.h>
+#include <linux/dma-direct.h>
 #include <linux/dma-map-ops.h>
 #include <linux/export.h>
 #include <linux/gfp.h>
@@ -14,7 +15,6 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 #include "debug.h"
-#include "direct.h"
 
 /*
  * Managed DMA API
-- 
2.17.1

