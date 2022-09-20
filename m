Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFCC5BE6D6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 15:16:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MX2B41Kkfz3cdp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 23:16:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MX29D5BLKz306r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 23:15:43 +1000 (AEST)
Received: from ole.1.ozlabs.ru (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id 19CCE82ED3;
	Tue, 20 Sep 2022 09:05:15 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2 3/3] powerpc/iommu: Add iommu_ops to report capabilities and allow blocking domains
Date: Tue, 20 Sep 2022 23:04:57 +1000
Message-Id: <20220920130457.29742-4-aik@ozlabs.ru>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920130457.29742-1-aik@ozlabs.ru>
References: <20220920130457.29742-1-aik@ozlabs.ru>
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
Cc: kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Daniel Henrique Barboza <danielhb413@gmail.com>, Deming Wang <wangdeming@inspur.com>, Nicholas Piggin <npiggin@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>, Alex Williamson <alex.williamson@redhat.com>, kvm-ppc@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, Frederic Barrat <fbarrat@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Up until now PPC64 managed to avoid using iommu_ops. The VFIO driver
uses a SPAPR TCE sub-driver and all iommu_ops uses were kept in
the Type1 VFIO driver. Recent development added 2 uses of iommu_ops to
the generic VFIO which broke POWER:
- a coherency capability check;
- blocking IOMMU domain - iommu_group_dma_owner_claimed()/...

This adds a simple iommu_ops which reports support for cache
coherency and provides a basic support for blocking domains. No other
domain types are implemented so the default domain is NULL.

Since now iommu_ops controls the group ownership, this takes it out of
VFIO.

This adds an IOMMU device into a pci_controller (=PHB) and registers it
in the IOMMU subsystem, iommu_ops is registered at this point.
This setup is done in postcore_initcall_sync.

This replaces iommu_group_add_device() with iommu_probe_device() as
the former misses necessary steps in connecting PCI devices to IOMMU
devices. This adds a comment about why explicit iommu_probe_device()
is still needed.

Fixes: e8ae0e140c05 ("vfio: Require that devices support DMA cache coherence")
Fixes: 70693f470848 ("vfio: Set DMA ownership for VFIO devices")
Cc: Deming Wang <wangdeming@inspur.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex.williamson@redhat.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Fabiano Rosas <farosas@linux.ibm.com>
Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v2:
* replaced a default domain with blocked
---
 arch/powerpc/include/asm/pci-bridge.h     |   7 +
 arch/powerpc/platforms/pseries/pseries.h  |   4 +
 arch/powerpc/kernel/iommu.c               | 149 +++++++++++++++++++++-
 arch/powerpc/platforms/powernv/pci-ioda.c |  30 +++++
 arch/powerpc/platforms/pseries/iommu.c    |  24 ++++
 arch/powerpc/platforms/pseries/setup.c    |   3 +
 drivers/vfio/vfio_iommu_spapr_tce.c       |   8 --
 7 files changed, 215 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index e18c95f4e1d4..fcab0e4b203b 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -8,6 +8,7 @@
 #include <linux/list.h>
 #include <linux/ioport.h>
 #include <linux/numa.h>
+#include <linux/iommu.h>
 
 struct device_node;
 
@@ -44,6 +45,9 @@ struct pci_controller_ops {
 #endif
 
 	void		(*shutdown)(struct pci_controller *hose);
+
+	struct iommu_group *(*device_group)(struct pci_controller *hose,
+					    struct pci_dev *pdev);
 };
 
 /*
@@ -131,6 +135,9 @@ struct pci_controller {
 	struct irq_domain	*dev_domain;
 	struct irq_domain	*msi_domain;
 	struct fwnode_handle	*fwnode;
+
+	/* iommu_ops support */
+	struct iommu_device	iommu;
 };
 
 /* These are used for config access before all the PCI probing
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 1d75b7742ef0..f8bce40ebd0c 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -123,5 +123,9 @@ static inline void pseries_lpar_read_hblkrm_characteristics(void) { }
 #endif
 
 void pseries_rng_init(void);
+#ifdef CONFIG_SPAPR_TCE_IOMMU
+struct iommu_group *pSeries_pci_device_group(struct pci_controller *hose,
+					     struct pci_dev *pdev);
+#endif
 
 #endif /* _PSERIES_PSERIES_H */
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index d873c123ab49..823da727aac7 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -35,6 +35,7 @@
 #include <asm/vio.h>
 #include <asm/tce.h>
 #include <asm/mmu_context.h>
+#include <asm/ppc-pci.h>
 
 #define DBG(...)
 
@@ -1158,8 +1159,14 @@ int iommu_add_device(struct iommu_table_group *table_group, struct device *dev)
 
 	pr_debug("%s: Adding %s to iommu group %d\n",
 		 __func__, dev_name(dev),  iommu_group_id(table_group->group));
-
-	return iommu_group_add_device(table_group->group, dev);
+	/*
+	 * This is still not adding devices via the IOMMU bus notifier because
+	 * of pcibios_init() from arch/powerpc/kernel/pci_64.c which calls
+	 * pcibios_scan_phb() first (and this guy adds devices and triggers
+	 * the notifier) and only then it calls pci_bus_add_devices() which
+	 * configures DMA for buses which also creates PEs and IOMMU groups.
+	 */
+	return iommu_probe_device(dev);
 }
 EXPORT_SYMBOL_GPL(iommu_add_device);
 
@@ -1239,6 +1246,7 @@ static long spapr_tce_take_ownership(struct iommu_table_group *table_group)
 		rc = iommu_take_ownership(tbl);
 		if (!rc)
 			continue;
+
 		for (j = 0; j < i; ++j)
 			iommu_release_ownership(table_group->tables[j]);
 		return rc;
@@ -1271,4 +1279,141 @@ struct iommu_table_group_ops spapr_tce_table_group_ops = {
 	.release_ownership = spapr_tce_release_ownership,
 };
 
+/*
+ * A simple iommu_ops to allow less cruft in generic VFIO code.
+ */
+static int spapr_tce_blocking_iommu_attach_dev(struct iommu_domain *dom,
+					       struct device *dev)
+{
+	struct iommu_group *grp = iommu_group_get(dev);
+	struct iommu_table_group *table_group;
+	int ret = -EINVAL;
+
+	if (!grp)
+		return -ENODEV;
+
+	table_group = iommu_group_get_iommudata(grp);
+	ret = table_group->ops->take_ownership(table_group);
+	iommu_group_put(grp);
+
+	return ret;
+}
+
+static void spapr_tce_blocking_iommu_detach_dev(struct iommu_domain *dom,
+						struct device *dev)
+{
+	struct iommu_group *grp = iommu_group_get(dev);
+	struct iommu_table_group *table_group;
+
+	table_group = iommu_group_get_iommudata(grp);
+	table_group->ops->release_ownership(table_group);
+}
+
+static const struct iommu_domain_ops spapr_tce_blocking_domain_ops = {
+	.attach_dev = spapr_tce_blocking_iommu_attach_dev,
+	.detach_dev = spapr_tce_blocking_iommu_detach_dev,
+};
+
+static bool spapr_tce_iommu_capable(enum iommu_cap cap)
+{
+	switch (cap) {
+	case IOMMU_CAP_CACHE_COHERENCY:
+		return true;
+	default:
+		break;
+	}
+
+	return false;
+}
+
+static struct iommu_domain *spapr_tce_iommu_domain_alloc(unsigned int type)
+{
+	struct iommu_domain *dom;
+
+	if (type != IOMMU_DOMAIN_BLOCKED)
+		return NULL;
+
+	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
+	if (!dom)
+		return NULL;
+
+	dom->ops = &spapr_tce_blocking_domain_ops;
+
+	return dom;
+}
+
+static struct iommu_device *spapr_tce_iommu_probe_device(struct device *dev)
+{
+	struct pci_dev *pdev;
+	struct pci_controller *hose;
+
+	if (!dev_is_pci(dev))
+		return ERR_PTR(-EPERM);
+
+	pdev = to_pci_dev(dev);
+	hose = pdev->bus->sysdata;
+
+	return &hose->iommu;
+}
+
+static void spapr_tce_iommu_release_device(struct device *dev)
+{
+}
+
+static struct iommu_group *spapr_tce_iommu_device_group(struct device *dev)
+{
+	struct pci_controller *hose;
+	struct pci_dev *pdev;
+
+	pdev = to_pci_dev(dev);
+	hose = pdev->bus->sysdata;
+
+	if (!hose->controller_ops.device_group)
+		return ERR_PTR(-ENOENT);
+
+	return hose->controller_ops.device_group(hose, pdev);
+}
+
+static const struct iommu_ops spapr_tce_iommu_ops = {
+	.capable = spapr_tce_iommu_capable,
+	.domain_alloc = spapr_tce_iommu_domain_alloc,
+	.probe_device = spapr_tce_iommu_probe_device,
+	.release_device = spapr_tce_iommu_release_device,
+	.device_group = spapr_tce_iommu_device_group,
+};
+
+static struct attribute *spapr_tce_iommu_attrs[] = {
+	NULL,
+};
+
+static struct attribute_group spapr_tce_iommu_group = {
+	.name = "spapr-tce-iommu",
+	.attrs = spapr_tce_iommu_attrs,
+};
+
+static const struct attribute_group *spapr_tce_iommu_groups[] = {
+	&spapr_tce_iommu_group,
+	NULL,
+};
+
+/*
+ * This registers IOMMU devices of PHBs. This needs to happen
+ * after core_initcall(iommu_init) + postcore_initcall(pci_driver_init) and
+ * before subsys_initcall(iommu_subsys_init).
+ */
+static int __init spapr_tce_setup_phb_iommus_initcall(void)
+{
+	struct pci_controller *hose;
+
+	list_for_each_entry(hose, &hose_list, list_node) {
+		iommu_device_sysfs_add(&hose->iommu, hose->parent,
+				       spapr_tce_iommu_groups, "iommu-phb%04x",
+				       hose->global_number);
+		iommu_device_register(&hose->iommu, &spapr_tce_iommu_ops,
+				      hose->parent);
+	}
+	return 0;
+}
+postcore_initcall_sync(spapr_tce_setup_phb_iommus_initcall);
+
 #endif /* CONFIG_IOMMU_API */
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 180965a309b6..683425a77233 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1897,6 +1897,13 @@ static long pnv_ioda2_take_ownership(struct iommu_table_group *table_group)
 	/* Store @tbl as pnv_pci_ioda2_unset_window() resets it */
 	struct iommu_table *tbl = pe->table_group.tables[0];
 
+	/*
+	 * iommu_ops transfers the ownership per a device and we mode
+	 * the group ownership with the first device in the group.
+	 */
+	if (!tbl)
+		return 0;
+
 	pnv_pci_ioda2_set_bypass(pe, false);
 	pnv_pci_ioda2_unset_window(&pe->table_group, 0);
 	if (pe->pbus)
@@ -1913,6 +1920,9 @@ static void pnv_ioda2_release_ownership(struct iommu_table_group *table_group)
 	struct pnv_ioda_pe *pe = container_of(table_group, struct pnv_ioda_pe,
 						table_group);
 
+	/* See the comment about iommu_ops above */
+	if (pe->table_group.tables[0])
+		return;
 	pnv_pci_ioda2_setup_default_config(pe);
 	if (pe->pbus)
 		pnv_ioda_setup_bus_dma(pe, pe->pbus);
@@ -2918,6 +2928,25 @@ static void pnv_pci_ioda_dma_bus_setup(struct pci_bus *bus)
 	}
 }
 
+static struct iommu_group *pnv_pci_device_group(struct pci_controller *hose,
+						struct pci_dev *pdev)
+{
+	struct pnv_phb *phb = hose->private_data;
+	struct pnv_ioda_pe *pe;
+
+	if (WARN_ON(!phb))
+		return ERR_PTR(-ENODEV);
+
+	pe = pnv_pci_bdfn_to_pe(phb, pdev->devfn | (pdev->bus->number << 8));
+	if (!pe)
+		return ERR_PTR(-ENODEV);
+
+	if (!pe->table_group.group)
+		return ERR_PTR(-ENODEV);
+
+	return iommu_group_ref_get(pe->table_group.group);
+}
+
 static const struct pci_controller_ops pnv_pci_ioda_controller_ops = {
 	.dma_dev_setup		= pnv_pci_ioda_dma_dev_setup,
 	.dma_bus_setup		= pnv_pci_ioda_dma_bus_setup,
@@ -2928,6 +2957,7 @@ static const struct pci_controller_ops pnv_pci_ioda_controller_ops = {
 	.setup_bridge		= pnv_pci_fixup_bridge_resources,
 	.reset_secondary_bus	= pnv_pci_reset_secondary_bus,
 	.shutdown		= pnv_pci_ioda_shutdown,
+	.device_group		= pnv_pci_device_group,
 };
 
 static const struct pci_controller_ops pnv_npu_ocapi_ioda_controller_ops = {
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 27877033bf32..6dcdfc2d1779 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1727,3 +1727,27 @@ static int __init tce_iommu_bus_notifier_init(void)
 	return 0;
 }
 machine_subsys_initcall_sync(pseries, tce_iommu_bus_notifier_init);
+
+#ifdef CONFIG_SPAPR_TCE_IOMMU
+struct iommu_group *pSeries_pci_device_group(struct pci_controller *hose,
+					     struct pci_dev *pdev)
+{
+	struct device_node *pdn, *dn = pdev->dev.of_node;
+	struct iommu_group *grp;
+	struct pci_dn *pci;
+
+	pdn = pci_dma_find(dn, NULL);
+	if (!pdn || !PCI_DN(pdn))
+		return ERR_PTR(-ENODEV);
+
+	pci = PCI_DN(pdn);
+	if (!pci->table_group)
+		return ERR_PTR(-ENODEV);
+
+	grp = pci->table_group->group;
+	if (!grp)
+		return ERR_PTR(-ENODEV);
+
+	return iommu_group_ref_get(grp);
+}
+#endif
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 489f4c4df468..496a63ce749e 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -1076,6 +1076,9 @@ static int pSeries_pci_probe_mode(struct pci_bus *bus)
 
 struct pci_controller_ops pseries_pci_controller_ops = {
 	.probe_mode		= pSeries_pci_probe_mode,
+#ifdef CONFIG_SPAPR_TCE_IOMMU
+	.device_group		= pSeries_pci_device_group,
+#endif
 };
 
 define_machine(pseries) {
diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
index e123efee959d..6c4fdfc42496 100644
--- a/drivers/vfio/vfio_iommu_spapr_tce.c
+++ b/drivers/vfio/vfio_iommu_spapr_tce.c
@@ -1151,8 +1151,6 @@ static void tce_iommu_release_ownership(struct tce_container *container,
 	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i)
 		if (container->tables[i])
 			table_group->ops->unset_window(table_group, i);
-
-	table_group->ops->release_ownership(table_group);
 }
 
 static long tce_iommu_take_ownership(struct tce_container *container,
@@ -1160,10 +1158,6 @@ static long tce_iommu_take_ownership(struct tce_container *container,
 {
 	long i, ret = 0;
 
-	ret = table_group->ops->take_ownership(table_group);
-	if (ret)
-		return ret;
-
 	/* Set all windows to the new group */
 	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i) {
 		struct iommu_table *tbl = container->tables[i];
@@ -1182,8 +1176,6 @@ static long tce_iommu_take_ownership(struct tce_container *container,
 	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i)
 		table_group->ops->unset_window(table_group, i);
 
-	table_group->ops->release_ownership(table_group);
-
 	return ret;
 }
 
-- 
2.37.3

