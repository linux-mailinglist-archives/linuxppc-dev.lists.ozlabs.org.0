Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F12A621CF97
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 08:25:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4ttT5sYFzDqTp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 16:25:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4B4trq65btzDqMX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 16:23:55 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id BED66AE80110;
 Mon, 13 Jul 2020 02:21:19 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] powerpc/dma: Fallback to dma_ops when persistent
 memory present
Date: Mon, 13 Jul 2020 16:23:48 +1000
Message-Id: <20200713062348.100552-1-aik@ozlabs.ru>
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
Cc: Leonardo Bras <leobras.c@gmail.com>, Brian J King <bjking1@us.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

So far we have been using huge DMA windows to map all the RAM available.
The RAM is normally mapped to the VM address space contiguously, and
there is always a reasonable upper limit for possible future hot plugged
RAM which makes it easy to map all RAM via IOMMU.

Now there is persistent memory ("ibm,pmemory" in the FDT) which (unlike
normal RAM) can map anywhere in the VM space beyond the maximum RAM size
and since it can be used for DMA, it requires extending the huge window
up to MAX_PHYSMEM_BITS which requires hypervisor support for:
1. huge TCE tables;
2. multilevel TCE tables;
3. huge IOMMU pages.

Certain hypervisors cannot do either so the only option left is
restricting the huge DMA window to include only RAM and fallback to
the default DMA window for persistent memory.

This checks if the system has persistent memory. If it does not,
the DMA bypass mode is selected, i.e.
* dev->bus_dma_limit = 0
* dev->dma_ops_bypass = true <- this avoid calling dma_ops for mapping.

If there is such memory, this creates identity mapping only for RAM and
disables the DMA bypass mode which makes generic DMA code use indirect
dma_ops which may have performance impact:
* dev->bus_dma_limit = bus_offset + max_ram_size
  for example 0x0800.0000.8000.0000 for a 2GB VM
* dev->dma_ops_bypass = false <- this forces indirect calls to dma_ops for
  every mapping which then directs these to small or huge window.

This should not change the existing behaviour when no persistent memory.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

This is based on
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=188385

Leonardo, this makes
https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=187348
not apply but the conflict should be quite trivial to resolve
(do not rush, let me finish reviewing this first). Cheers,



---
 arch/powerpc/kernel/dma-iommu.c        | 68 +++++++++++++++++++++++++-
 arch/powerpc/platforms/pseries/iommu.c | 41 +++++++++++++---
 2 files changed, 99 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index 569fecd7b5b2..9fe5f0aefa9d 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -10,6 +10,16 @@
 #include <linux/pci.h>
 #include <asm/iommu.h>
 
+static inline bool can_map_direct(struct device *dev, phys_addr_t addr)
+{
+	return dev->bus_dma_limit >= phys_to_dma(dev, addr);
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
+	if (dev->bus_dma_limit &&
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
+	if (dev->bus_dma_limit &&
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
+	if (dev->bus_dma_limit) {
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
+	if (dev->bus_dma_limit) {
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
+		dev->dma_ops_bypass = dev->bus_dma_limit == 0;
+		if (!dev->dma_ops_bypass)
+			dev_warn(dev, "iommu: 64-bit OK but using default ops\n");
+		else
+			dev_dbg(dev, "iommu: 64-bit OK, using fixed ops\n");
 		return 1;
 	}
 
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 6d47b4a3ce39..1996f83021fe 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -816,7 +816,7 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
 			np, ret);
 }
 
-static u64 find_existing_ddw(struct device_node *pdn)
+static u64 find_existing_ddw(struct device_node *pdn, int *window_shift)
 {
 	struct direct_window *window;
 	const struct dynamic_dma_window_prop *direct64;
@@ -828,6 +828,7 @@ static u64 find_existing_ddw(struct device_node *pdn)
 		if (window->device == pdn) {
 			direct64 = window->prop;
 			dma_addr = be64_to_cpu(direct64->dma_base);
+			*window_shift = be32_to_cpu(direct64->window_shift);
 			break;
 		}
 	}
@@ -990,11 +991,13 @@ static phys_addr_t ddw_memory_hotplug_max(void)
  */
 static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 {
-	int len, ret;
+	int len = 0, ret;
+	bool pmem_present = of_find_node_by_type(NULL, "ibm,pmemory") != NULL;
+	int max_ram_len = order_base_2(ddw_memory_hotplug_max());
 	struct ddw_query_response query;
 	struct ddw_create_response create;
 	int page_shift;
-	u64 dma_addr, max_addr;
+	u64 dma_addr;
 	struct device_node *dn;
 	u32 ddw_avail[3];
 	struct direct_window *window;
@@ -1004,7 +1007,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 	mutex_lock(&direct_window_init_mutex);
 
-	dma_addr = find_existing_ddw(pdn);
+	dma_addr = find_existing_ddw(pdn, &len);
 	if (dma_addr != 0)
 		goto out_unlock;
 
@@ -1066,14 +1069,27 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	}
 	/* verify the window * number of ptes will map the partition */
 	/* check largest block * page size > max memory hotplug addr */
-	max_addr = ddw_memory_hotplug_max();
-	if (query.largest_available_block < (max_addr >> page_shift)) {
+	/*
+	 * The "ibm,pmemory" can appear anywhere in the address space.
+	 * Assuming it is still backed by page structs, try MAX_PHYSMEM_BITS
+	 * for the upper limit and fallback to max RAM otherwise but this
+	 * disables device::dma_ops_bypass.
+	 */
+	len = max_ram_len;
+	if (pmem_present) {
+		if (query.largest_available_block >=
+		    (1ULL << (MAX_PHYSMEM_BITS - page_shift)))
+			len = MAX_PHYSMEM_BITS - page_shift;
+		else
+			dev_info(&dev->dev, "Skipping ibm,pmemory");
+	}
+
+	if (query.largest_available_block < (1ULL << (len - page_shift))) {
 		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %u "
-			  "%llu-sized pages\n", max_addr,  query.largest_available_block,
+			  "%llu-sized pages\n", 1ULL << len, query.largest_available_block,
 			  1ULL << page_shift);
 		goto out_failed;
 	}
-	len = order_base_2(max_addr);
 	win64 = kzalloc(sizeof(struct property), GFP_KERNEL);
 	if (!win64) {
 		dev_info(&dev->dev,
@@ -1151,6 +1167,15 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 out_unlock:
 	mutex_unlock(&direct_window_init_mutex);
+
+	/*
+	 * If we have persistent memory and the window size is only as big
+	 * as RAM, then we failed to create a window to cover persistent
+	 * memory and need to set the DMA limit.
+	 */
+	if (pmem_present && dma_addr && (len == max_ram_len))
+		dev->dev.bus_dma_limit = dma_addr + (1ULL << len);
+
 	return dma_addr;
 }
 
-- 
2.17.1

