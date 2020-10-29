Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E31B229E140
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 02:57:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CM7qr5wTrzDqZP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 12:57:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=ozlabs.ru (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CM7kV4wztzDqXD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 12:53:06 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09T1YQ1l153458; Wed, 28 Oct 2020 21:52:51 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34ejc32p1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 21:52:51 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09T1npka021923;
 Thu, 29 Oct 2020 01:52:50 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 34dwh0hhb8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Oct 2020 01:52:49 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09T1qlCO8520060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Oct 2020 01:52:47 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AA31E5204E;
 Thu, 29 Oct 2020 01:52:47 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0C2E752050;
 Thu, 29 Oct 2020 01:52:47 +0000 (GMT)
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id EDA3FA0218;
 Thu, 29 Oct 2020 12:52:45 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (fstn1-p1.ozlabs.ibm.com
 [10.61.161.111])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id D5276E0104;
 Thu, 29 Oct 2020 12:52:45 +1100 (AEDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v4 2/2] powerpc/dma: Fallback to dma_ops when
 persistent memory present
Date: Thu, 29 Oct 2020 12:52:41 +1100
Message-Id: <20201029015241.73920-3-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201029015241.73920-1-aik@ozlabs.ru>
References: <20201029015241.73920-1-aik@ozlabs.ru>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_09:2020-10-28,
 2020-10-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1034 adultscore=0 suspectscore=29 bulkscore=0 phishscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010290002
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, iommu@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org
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

This defines arch_dma_map_direct/etc to allow generic DMA code perform
additional checks on whether direct DMA is still possible.

This checks if the system has persistent memory. If it does not,
the DMA bypass mode is selected, i.e.
* dev->bus_dma_limit = 0
* dev->dma_ops_bypass = true <- this avoid calling dma_ops for mapping.

If there is such memory, this creates identity mapping only for RAM and
sets the dev->bus_dma_limit to let the generic code decide whether to
call into the direct DMA or the indirect DMA ops.

This should not change the existing behaviour when no persistent memory
as dev->dma_ops_bypass is expected to be set.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v4:
* fixed leaked device_node
* wrapped long lines
---
 arch/powerpc/kernel/dma-iommu.c        | 73 +++++++++++++++++++++++++-
 arch/powerpc/platforms/pseries/iommu.c | 51 ++++++++++++++----
 arch/powerpc/Kconfig                   |  1 +
 3 files changed, 113 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index a1c744194018..e5e9e5e3e3ca 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -10,6 +10,65 @@
 #include <linux/pci.h>
 #include <asm/iommu.h>
 
+#define can_map_direct(dev, addr) \
+	((dev)->bus_dma_limit >= phys_to_dma((dev), (addr)))
+
+bool arch_dma_map_page_direct(struct device *dev, phys_addr_t addr)
+{
+	if (likely(!dev->bus_dma_limit))
+		return false;
+
+	return can_map_direct(dev, addr);
+}
+EXPORT_SYMBOL_GPL(arch_dma_map_page_direct);
+
+#define is_direct_handle(dev, h) ((h) >= (dev)->archdata.dma_offset)
+
+bool arch_dma_unmap_page_direct(struct device *dev, dma_addr_t dma_handle)
+{
+	if (likely(!dev->bus_dma_limit))
+		return false;
+
+	return is_direct_handle(dev, dma_handle);
+}
+EXPORT_SYMBOL_GPL(arch_dma_unmap_page_direct);
+
+bool arch_dma_map_sg_direct(struct device *dev, struct scatterlist *sg,
+			    int nents)
+{
+	struct scatterlist *s;
+	int i;
+
+	if (likely(!dev->bus_dma_limit))
+		return false;
+
+	for_each_sg(sg, s, nents, i) {
+		if (!can_map_direct(dev, sg_phys(s) + s->offset + s->length))
+			return false;
+	}
+
+	return true;
+}
+EXPORT_SYMBOL(arch_dma_map_sg_direct);
+
+bool arch_dma_unmap_sg_direct(struct device *dev, struct scatterlist *sg,
+			      int nents)
+{
+	struct scatterlist *s;
+	int i;
+
+	if (likely(!dev->bus_dma_limit))
+		return false;
+
+	for_each_sg(sg, s, nents, i) {
+		if (!is_direct_handle(dev, s->dma_address + s->length))
+			return false;
+	}
+
+	return true;
+}
+EXPORT_SYMBOL(arch_dma_unmap_sg_direct);
+
 /*
  * Generic iommu implementation
  */
@@ -90,8 +149,18 @@ int dma_iommu_dma_supported(struct device *dev, u64 mask)
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
+			dev_warn(dev,
+				 "iommu: 64-bit OK but direct DMA is limited by %llx\n",
+				 dev->bus_dma_limit);
+		else
+			dev_dbg(dev, "iommu: 64-bit OK, using fixed ops\n");
 		return 1;
 	}
 
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index e4198700ed1a..9fc5217f0c8e 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -839,7 +839,7 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
 			np, ret);
 }
 
-static u64 find_existing_ddw(struct device_node *pdn)
+static u64 find_existing_ddw(struct device_node *pdn, int *window_shift)
 {
 	struct direct_window *window;
 	const struct dynamic_dma_window_prop *direct64;
@@ -851,6 +851,7 @@ static u64 find_existing_ddw(struct device_node *pdn)
 		if (window->device == pdn) {
 			direct64 = window->prop;
 			dma_addr = be64_to_cpu(direct64->dma_base);
+			*window_shift = be32_to_cpu(direct64->window_shift);
 			break;
 		}
 	}
@@ -1111,11 +1112,12 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
  */
 static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 {
-	int len, ret;
+	int len = 0, ret;
+	int max_ram_len = order_base_2(ddw_memory_hotplug_max());
 	struct ddw_query_response query;
 	struct ddw_create_response create;
 	int page_shift;
-	u64 dma_addr, max_addr;
+	u64 dma_addr;
 	struct device_node *dn;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
 	struct direct_window *window;
@@ -1123,10 +1125,15 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	struct dynamic_dma_window_prop *ddwprop;
 	struct failed_ddw_pdn *fpdn;
 	bool default_win_removed = false;
+	bool pmem_present;
+
+	dn = of_find_node_by_type(NULL, "ibm,pmemory");
+	pmem_present = dn != NULL;
+	of_node_put(dn);
 
 	mutex_lock(&direct_window_init_mutex);
 
-	dma_addr = find_existing_ddw(pdn);
+	dma_addr = find_existing_ddw(pdn, &len);
 	if (dma_addr != 0)
 		goto out_unlock;
 
@@ -1212,14 +1219,29 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	}
 	/* verify the window * number of ptes will map the partition */
 	/* check largest block * page size > max memory hotplug addr */
-	max_addr = ddw_memory_hotplug_max();
-	if (query.largest_available_block < (max_addr >> page_shift)) {
-		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu "
-			  "%llu-sized pages\n", max_addr,  query.largest_available_block,
-			  1ULL << page_shift);
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
+		dev_dbg(&dev->dev,
+			"can't map partition max 0x%llx with %llu %llu-sized pages\n",
+			1ULL << len,
+			query.largest_available_block,
+			1ULL << page_shift);
 		goto out_failed;
 	}
-	len = order_base_2(max_addr);
 	win64 = kzalloc(sizeof(struct property), GFP_KERNEL);
 	if (!win64) {
 		dev_info(&dev->dev,
@@ -1299,6 +1321,15 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
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
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e9f13fe08492..b2d4580acf79 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -159,6 +159,7 @@ config PPC
 	select DCACHE_WORD_ACCESS		if PPC64 && CPU_LITTLE_ENDIAN
 	select DMA_OPS				if PPC64
 	select DMA_OPS_BYPASS			if PPC64
+	select ARCH_HAS_DMA_MAP_DIRECT 		if PPC64 && PPC_PSERIES
 	select DYNAMIC_FTRACE			if FUNCTION_TRACER
 	select EDAC_ATOMIC_SCRUB
 	select EDAC_SUPPORT
-- 
2.17.1

