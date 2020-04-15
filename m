Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B34A81A9143
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 05:01:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4926Yl5xBhzDqyb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 13:00:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4926W75jvdzDq9n
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 12:58:43 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 3029DAE8001E;
 Tue, 14 Apr 2020 22:56:14 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] powerpc/dma: Call indirect dma_ops when persistent
 memory present
Date: Wed, 15 Apr 2020 12:58:04 +1000
Message-Id: <20200415025804.63723-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: Brian J King <bjking1@us.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Sam Bobroff <sbobroff@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Wen Xiong <wenxiong@us.ibm.com>, Christoph Hellwig <hch@lst.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Unlike normal memory ("memory" compatible type in the FDT),
the persistent memory ("ibm,pmemory" in the FDT) can be mapped anywhere
in the guest physical space and it can be used for DMA.

In order to maintain 1:1 mapping via the huge DMA window, we need to
know the maximum physical address at the time of the window setup.
So far we've been looking at "memory" nodes but "ibm,pmemory" does not
have fixed addresses and the persistent memory may be mapped afterwards.

When the maximum window size is not big enough to fit persistent memory,
this clears the dma_ops_bypass flag to tell the generic code that indirect
dma_ops call is needed. This lets the platform code check the DMA
boundaries and call direct DMA API if DMA-ing to/from generic RAM
or call IOMMU API otherwise.

This adds dma_max to device::archdata to tell the direct DMA mapping
limit. At the moment only pseries sets the limit so powernv is
unaffected by this change.

As persistent memory is backed with page structs, this uses
MAX_PHYSMEM_BITS as the upper limit (rather than simple 64bit).

This should not change the existing behaviour when no persistent memory.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

This is based on
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=170152

---
 arch/powerpc/include/asm/device.h      |  2 +
 arch/powerpc/kernel/dma-iommu.c        | 68 +++++++++++++++++++++++++-
 arch/powerpc/platforms/pseries/iommu.c | 23 ++++++++-
 3 files changed, 89 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/device.h b/arch/powerpc/include/asm/device.h
index 452402215e12..380e92684a16 100644
--- a/arch/powerpc/include/asm/device.h
+++ b/arch/powerpc/include/asm/device.h
@@ -18,6 +18,8 @@ struct iommu_table;
  * drivers/macintosh/macio_asic.c
  */
 struct dev_archdata {
+	/* Maximum DMA address for 1:1 mapping (when enabled) */
+	dma_addr_t		dma_max;
 	/*
 	 * These two used to be a union. However, with the hybrid ops we need
 	 * both so here we store both a DMA offset for direct mappings and
diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index 569fecd7b5b2..8c67bfffdef6 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -10,6 +10,16 @@
 #include <linux/pci.h>
 #include <asm/iommu.h>
 
+static inline bool can_map_direct(struct device *dev, phys_addr_t addr)
+{
+	return dev->archdata.dma_max >= phys_to_dma(dev, addr);
+}
+
+static inline bool dma_handle_direct(struct device *dev, dma_addr_t dma_handle)
+{
+	return dma_handle >= dev->archdata.dma_offset;
+}
+
 /*
  * Generic iommu implementation
  */
@@ -44,6 +54,12 @@ static dma_addr_t dma_iommu_map_page(struct device *dev, struct page *page,
 				     enum dma_data_direction direction,
 				     unsigned long attrs)
 {
+	if (dev->archdata.dma_max &&
+	    can_map_direct(dev, (phys_addr_t) page_to_phys(page) +
+			   offset + size))
+		return dma_direct_map_page(dev, page, offset, size, direction,
+					   attrs);
+
 	return iommu_map_page(dev, get_iommu_table_base(dev), page, offset,
 			      size, dma_get_mask(dev), direction, attrs);
 }
@@ -53,6 +69,12 @@ static void dma_iommu_unmap_page(struct device *dev, dma_addr_t dma_handle,
 				 size_t size, enum dma_data_direction direction,
 				 unsigned long attrs)
 {
+	if (dev->archdata.dma_max &&
+	    dma_handle_direct(dev, dma_handle + size)) {
+		dma_direct_unmap_page(dev, dma_handle, size, direction, attrs);
+		return;
+	}
+
 	iommu_unmap_page(get_iommu_table_base(dev), dma_handle, size, direction,
 			 attrs);
 }
@@ -62,6 +84,22 @@ static int dma_iommu_map_sg(struct device *dev, struct scatterlist *sglist,
 			    int nelems, enum dma_data_direction direction,
 			    unsigned long attrs)
 {
+	if (dev->archdata.dma_max) {
+		struct scatterlist *s;
+		bool direct = true;
+		int i;
+
+		for_each_sg(sglist, s, nelems, i) {
+			direct = can_map_direct(dev,
+					sg_phys(s) + s->offset + s->length);
+			if (!direct)
+				break;
+		}
+		if (direct)
+			return dma_direct_map_sg(dev, sglist, nelems, direction,
+						 attrs);
+	}
+
 	return ppc_iommu_map_sg(dev, get_iommu_table_base(dev), sglist, nelems,
 				dma_get_mask(dev), direction, attrs);
 }
@@ -70,6 +108,24 @@ static void dma_iommu_unmap_sg(struct device *dev, struct scatterlist *sglist,
 		int nelems, enum dma_data_direction direction,
 		unsigned long attrs)
 {
+	if (dev->archdata.dma_max) {
+		struct scatterlist *s;
+		bool direct = true;
+		int i;
+
+		for_each_sg(sglist, s, nelems, i) {
+			direct = dma_handle_direct(dev,
+						   s->dma_address + s->length);
+			if (!direct)
+				break;
+		}
+		if (direct) {
+			dma_direct_unmap_sg(dev, sglist, nelems, direction,
+					    attrs);
+			return;
+		}
+	}
+
 	ppc_iommu_unmap_sg(get_iommu_table_base(dev), sglist, nelems,
 			   direction, attrs);
 }
@@ -90,8 +146,16 @@ int dma_iommu_dma_supported(struct device *dev, u64 mask)
 	struct iommu_table *tbl = get_iommu_table_base(dev);
 
 	if (dev_is_pci(dev) && dma_iommu_bypass_supported(dev, mask)) {
-		dev->dma_ops_bypass = true;
-		dev_dbg(dev, "iommu: 64-bit OK, using fixed ops\n");
+		/*
+		 * dma_iommu_bypass_supported() sets dma_max when there is
+		 * 1:1 mapping but it is somehow limited.
+		 * ibm,pmemory is one example.
+		 */
+		dev->dma_ops_bypass = dev->archdata.dma_max == 0;
+		if (!dev->dma_ops_bypass)
+			dev_warn(dev, "iommu: 64-bit OK but using default ops\n");
+		else
+			dev_dbg(dev, "iommu: 64-bit OK, using fixed ops\n");
 		return 1;
 	}
 
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 6d47b4a3ce39..227055a4fbe2 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -994,7 +994,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	struct ddw_query_response query;
 	struct ddw_create_response create;
 	int page_shift;
-	u64 dma_addr, max_addr;
+	u64 dma_addr, max_addr = 0, dma_max_sz = 0;
 	struct device_node *dn;
 	u32 ddw_avail[3];
 	struct direct_window *window;
@@ -1066,7 +1066,23 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	}
 	/* verify the window * number of ptes will map the partition */
 	/* check largest block * page size > max memory hotplug addr */
-	max_addr = ddw_memory_hotplug_max();
+	/*
+	 * The "ibm,pmemory" can appear anywhere in the address space.
+	 * Assuming it is still backed by page structs, try MAX_PHYSMEM_BITS
+	 * for the upper limit and fallback to max RAM otherwise but this
+	 * disables device::dma_ops_bypass.
+	 */
+	if (of_find_node_by_type(NULL, "ibm,pmemory")) {
+		max_addr = 1ULL << (MAX_PHYSMEM_BITS - page_shift);
+		if (query.largest_available_block < max_addr) {
+			dev_info(&dev->dev, "Skipping ibm,pmemory");
+			max_addr = ddw_memory_hotplug_max();
+			dma_max_sz = max_addr;
+		}
+	} else {
+		max_addr = ddw_memory_hotplug_max();
+	}
+
 	if (query.largest_available_block < (max_addr >> page_shift)) {
 		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %u "
 			  "%llu-sized pages\n", max_addr,  query.largest_available_block,
@@ -1151,6 +1167,9 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 out_unlock:
 	mutex_unlock(&direct_window_init_mutex);
+	if (!dev->dev.archdata.dma_max && dma_addr && dma_max_sz)
+		dev->dev.archdata.dma_max = dma_addr + dma_max_sz;
+
 	return dma_addr;
 }
 
-- 
2.17.1

