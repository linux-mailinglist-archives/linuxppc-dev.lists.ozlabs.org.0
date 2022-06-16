Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F263154DC54
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 09:59:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNvhg6GPyz3cCC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 17:59:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNvhH0jywz2xKX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 17:59:09 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id E54E1804E7;
	Thu, 16 Jun 2022 03:59:03 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel] pseries/iommu/ddw: Fix kdump to work in absence of ibm,dma-window
Date: Thu, 16 Jun 2022 17:59:01 +1000
Message-Id: <20220616075901.835871-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Leonardo Bras <leobras.c@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pseries platform uses 32bit default DMA window (always 4K pages) and
optional 64bit DMA window available via DDW ("Dynamic DMA Windows"),
64K or 2M pages. For ages the default one was not removed and a huge
window was created in addition. Things changed with SRIOV-enabled
PowerVM which creates a default-and-bigger DMA window in 64bit space
(still using 4K pages) for IOV VFs so certain OSes do not need to use
the DDW API in order to utilize all available TCE budget.

Linux on the other hand removes the default window and creates a bigger
one (with more TCEs or/and a bigger page size - 64K/2M) in a bid to map
the entire RAM, and if the new window size is smaller than that - it
still uses this new bigger window. The result is that the default window
is removed but the "ibm,dma-window" property is not.

When kdump is invoked, the existing code tries reusing the existing 64bit
DMA window which location and parameters are stored in the device tree but
this fails as the new property does not make it to the kdump device tree
blob. So the code falls back to the default window which does not exist
anymore although the device tree says that it does. The result of that
is that PCI devices become unusable and cannot be used for kdumping.

This preserves the DMA64 and DIRECT64 properties in the device tree blob
for the crash kernel. Since the crash kernel setup is done after device
drivers are loaded and probed, the proper DMA config is stored at least
for boot time devices.

Because DDW window is optional and the code configures the default window
first, the existing code creates an IOMMU table descriptor for
the non-existing default DMA window. It is harmless for kdump as it does
not touch the actual window (only reads what is mapped and marks those IO
pages as used) but it is bad for kexec which clears it thinking it is
a smaller default window rather than a bigger DDW window.

This removes the "ibm,dma-window" property from the device tree after
a bigger window is created and the crash kernel setup picks it up.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/kexec/file_load_64.c      | 52 +++++++++++++++
 arch/powerpc/platforms/pseries/iommu.c | 88 +++++++++++++++-----------
 2 files changed, 102 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index b4981b651d9a..b4b486b68b63 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -1038,6 +1038,48 @@ static int update_cpus_node(void *fdt)
 	return ret;
 }
 
+static int copy_dma_property(void *fdt, int node_offset, const struct device_node *dn,
+			     const char *propname)
+{
+	const void *prop, *fdtprop;
+	int len = 0, fdtlen = 0, ret;
+
+	prop = of_get_property(dn, propname, &len);
+	fdtprop = fdt_getprop(fdt, node_offset, propname, &fdtlen);
+
+	if (fdtprop && !prop)
+		ret = fdt_delprop(fdt, node_offset, propname);
+	else if (prop)
+		ret = fdt_setprop(fdt, node_offset, propname, prop, len);
+
+	return ret;
+}
+
+static int update_pci_nodes(void *fdt, const char *dmapropname)
+{
+	struct device_node *dn;
+	int pci_offset, root_offset, ret = 0;
+
+	if (!firmware_has_feature(FW_FEATURE_LPAR))
+		return 0;
+
+	root_offset = fdt_path_offset(fdt, "/");
+	for_each_node_with_property(dn, dmapropname) {
+		pci_offset = fdt_subnode_offset(fdt, root_offset, of_node_full_name(dn));
+		if (pci_offset < 0)
+			continue;
+
+		ret = copy_dma_property(fdt, pci_offset, dn, "ibm,dma-window");
+		if (ret < 0)
+			break;
+		ret = copy_dma_property(fdt, pci_offset, dn, dmapropname);
+		if (ret < 0)
+			break;
+	}
+
+	return ret;
+}
+
 /**
  * setup_new_fdt_ppc64 - Update the flattend device-tree of the kernel
  *                       being loaded.
@@ -1099,6 +1141,16 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 	if (ret < 0)
 		goto out;
 
+#define DIRECT64_PROPNAME "linux,direct64-ddr-window-info"
+#define DMA64_PROPNAME "linux,dma64-ddr-window-info"
+	ret = update_pci_nodes(fdt, DIRECT64_PROPNAME);
+	if (ret < 0)
+		goto out;
+
+	ret = update_pci_nodes(fdt, DMA64_PROPNAME);
+	if (ret < 0)
+		goto out;
+
 	/* Update memory reserve map */
 	ret = get_reserved_memory_ranges(&rmem);
 	if (ret)
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index fba64304e859..af3c871668df 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -700,6 +700,33 @@ struct iommu_table_ops iommu_table_lpar_multi_ops = {
 	.get = tce_get_pSeriesLP
 };
 
+/*
+ * Find nearest ibm,dma-window (default DMA window) or direct DMA window or
+ * dynamic 64bit DMA window, walking up the device tree.
+ */
+static struct device_node *pci_dma_find(struct device_node *dn,
+					const __be32 **dma_window)
+{
+	const __be32 *dw = NULL;
+
+	for ( ; dn && PCI_DN(dn); dn = dn->parent) {
+		dw = of_get_property(dn, "ibm,dma-window", NULL);
+		if (dw) {
+			if (dma_window)
+				*dma_window = dw;
+			return dn;
+		}
+		dw = of_get_property(dn, DIRECT64_PROPNAME, NULL);
+		if (dw)
+			return dn;
+		dw = of_get_property(dn, DMA64_PROPNAME, NULL);
+		if (dw)
+			return dn;
+	}
+
+	return NULL;
+}
+
 static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 {
 	struct iommu_table *tbl;
@@ -712,20 +739,10 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 	pr_debug("pci_dma_bus_setup_pSeriesLP: setting up bus %pOF\n",
 		 dn);
 
-	/*
-	 * Find nearest ibm,dma-window (default DMA window), walking up the
-	 * device tree
-	 */
-	for (pdn = dn; pdn != NULL; pdn = pdn->parent) {
-		dma_window = of_get_property(pdn, "ibm,dma-window", NULL);
-		if (dma_window != NULL)
-			break;
-	}
+	pdn = pci_dma_find(dn, &dma_window);
 
-	if (dma_window == NULL) {
+	if (dma_window == NULL)
 		pr_debug("  no ibm,dma-window property !\n");
-		return;
-	}
 
 	ppci = PCI_DN(pdn);
 
@@ -735,11 +752,13 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 	if (!ppci->table_group) {
 		ppci->table_group = iommu_pseries_alloc_group(ppci->phb->node);
 		tbl = ppci->table_group->tables[0];
-		iommu_table_setparms_lpar(ppci->phb, pdn, tbl,
-				ppci->table_group, dma_window);
+		if (dma_window) {
+			iommu_table_setparms_lpar(ppci->phb, pdn, tbl,
+						  ppci->table_group, dma_window);
 
-		if (!iommu_init_table(tbl, ppci->phb->node, 0, 0))
-			panic("Failed to initialize iommu table");
+			if (!iommu_init_table(tbl, ppci->phb->node, 0, 0))
+				panic("Failed to initialize iommu table");
+		}
 		iommu_register_group(ppci->table_group,
 				pci_domain_nr(bus), 0);
 		pr_debug("  created table: %p\n", ppci->table_group);
@@ -1429,16 +1448,22 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 		pci->table_group->tables[1] = newtbl;
 
-		/* Keep default DMA window struct if removed */
-		if (default_win_removed) {
-			tbl->it_size = 0;
-			vfree(tbl->it_map);
-			tbl->it_map = NULL;
-		}
-
 		set_iommu_table_base(&dev->dev, newtbl);
 	}
 
+	if (default_win_removed) {
+		struct property *def_win;
+		struct pci_dn *pci = PCI_DN(pdn);
+
+		iommu_tce_table_put(pci->table_group->tables[0]);
+		def_win = of_find_property(pdn, "ibm,dma-window", NULL);
+		if (def_win) {
+			of_remove_property(pdn, def_win);
+			dev_info(&dev->dev, "Removed default DMA window for %pOF\n", pdn);
+		}
+		pci->table_group->tables[0] = NULL;
+	}
+
 	spin_lock(&dma_win_list_lock);
 	list_add(&window->list, &dma_win_list);
 	spin_unlock(&dma_win_list_lock);
@@ -1503,13 +1528,7 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
 	dn = pci_device_to_OF_node(dev);
 	pr_debug("  node is %pOF\n", dn);
 
-	for (pdn = dn; pdn && PCI_DN(pdn) && !PCI_DN(pdn)->table_group;
-	     pdn = pdn->parent) {
-		dma_window = of_get_property(pdn, "ibm,dma-window", NULL);
-		if (dma_window)
-			break;
-	}
-
+	pdn = pci_dma_find(dn, &dma_window);
 	if (!pdn || !PCI_DN(pdn)) {
 		printk(KERN_WARNING "pci_dma_dev_setup_pSeriesLP: "
 		       "no DMA window found for pci dev=%s dn=%pOF\n",
@@ -1540,7 +1559,6 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
 static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
 {
 	struct device_node *dn = pci_device_to_OF_node(pdev), *pdn;
-	const __be32 *dma_window = NULL;
 
 	/* only attempt to use a new window if 64-bit DMA is requested */
 	if (dma_mask < DMA_BIT_MASK(64))
@@ -1554,13 +1572,7 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
 	 * search upwards in the tree until we either hit a dma-window
 	 * property, OR find a parent with a table already allocated.
 	 */
-	for (pdn = dn; pdn && PCI_DN(pdn) && !PCI_DN(pdn)->table_group;
-			pdn = pdn->parent) {
-		dma_window = of_get_property(pdn, "ibm,dma-window", NULL);
-		if (dma_window)
-			break;
-	}
-
+	pdn = pci_dma_find(dn, NULL);
 	if (pdn && PCI_DN(pdn))
 		return enable_ddw(pdev, pdn);
 
-- 
2.30.2

