Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C4E6ACA89
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 18:32:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVlxp4dYBz3f3q
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 04:31:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=SA6l+T5I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=SA6l+T5I;
	dkim-atps=neutral
X-Greylist: delayed 67 seconds by postgrey-1.36 at boromir; Tue, 07 Mar 2023 04:31:05 AEDT
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVlwn5MH5z3cbV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 04:31:05 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id A173E37E2D60E5;
	Mon,  6 Mar 2023 11:31:02 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id uuLrLi4_1t_N; Mon,  6 Mar 2023 11:31:00 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 57EE937E2D60DA;
	Mon,  6 Mar 2023 11:31:00 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 57EE937E2D60DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1678123860; bh=yebnO1LO3S3uTuA0LRdMAMfR8loATotNKkTWX/e7OlE=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=SA6l+T5I8WLMDPE3WyvJpAQjGWFCI57QcPGeWYQpS6rqRbn7ruZhX/mzPVVmdX8R8
	 5QYjmta2/KWSdOSY6fqZChCSpWTSvt0sgFZsWgQloWRztFKxvNkf3QpFOh9n2WRV3z
	 ohaG4REddOpKFLag5+HVgTVt/puZGYfybCcTNbxo=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9jaesIDJkhYb; Mon,  6 Mar 2023 11:31:00 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 2F93537E2D60D7;
	Mon,  6 Mar 2023 11:31:00 -0600 (CST)
Date: Mon, 6 Mar 2023 11:31:00 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: kvm <kvm@vger.kernel.org>
Message-ID: <2000135730.16998523.1678123860135.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH v2 3/4] powerpc/iommu: Add iommu_ops to report capabilities
 and
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC110 (Linux)/8.5.0_GA_3042)
Thread-Index: 6jUIKsIr3C/DQkflHEmExIa6wjx3Kg==
Thread-Topic: powerpc/iommu: Add iommu_ops to report capabilities and
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

 allow blocking domains

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

The previous discussion is here:
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220707135552.3688927-1-aik@ozlabs.ru/
https://patchwork.ozlabs.org/project/kvm-ppc/patch/20220701061751.1955857-1-aik@ozlabs.ru/

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
Co-authored-by: Timothy Pearson <tpearson@raptorengineering.com>
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/powerpc/include/asm/pci-bridge.h     |   7 +
 arch/powerpc/kernel/iommu.c               | 148 +++++++++++++++++++++-
 arch/powerpc/platforms/powernv/pci-ioda.c |  30 +++++
 arch/powerpc/platforms/pseries/iommu.c    |  24 ++++
 arch/powerpc/platforms/pseries/pseries.h  |   4 +
 arch/powerpc/platforms/pseries/setup.c    |   3 +
 drivers/vfio/vfio_iommu_spapr_tce.c       |   8 --
 7 files changed, 214 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index 71c1d26f2400..2aa3a091ef20 100644
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
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index f9f5a9418092..b42e202af3bc 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -35,6 +35,7 @@
 #include <asm/vio.h>
 #include <asm/tce.h>
 #include <asm/mmu_context.h>
+#include <asm/ppc-pci.h>
 
 #define DBG(...)
 
@@ -1156,8 +1157,14 @@ int iommu_add_device(struct iommu_table_group *table_group, struct device *dev)
 
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
 
@@ -1237,6 +1244,7 @@ static long spapr_tce_take_ownership(struct iommu_table_group *table_group)
 		rc = iommu_take_ownership(tbl);
 		if (!rc)
 			continue;
+
 		for (j = 0; j < i; ++j)
 			iommu_release_ownership(table_group->tables[j]);
 		return rc;
@@ -1269,4 +1277,140 @@ struct iommu_table_group_ops spapr_tce_table_group_ops = {
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
+static void spapr_tce_blocking_iommu_set_platform_dma(struct device *dev)
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
+};
+
+static bool spapr_tce_iommu_capable(struct device *dev, enum iommu_cap cap)
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
+	.set_platform_dma_ops = spapr_tce_blocking_iommu_set_platform_dma,
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
index 539934c76002..6e9a0967bab1 100644
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
@@ -2919,6 +2929,25 @@ static void pnv_pci_ioda_dma_bus_setup(struct pci_bus *bus)
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
@@ -2929,6 +2958,7 @@ static const struct pci_controller_ops pnv_pci_ioda_controller_ops = {
 	.setup_bridge		= pnv_pci_fixup_bridge_resources,
 	.reset_secondary_bus	= pnv_pci_reset_secondary_bus,
 	.shutdown		= pnv_pci_ioda_shutdown,
+	.device_group		= pnv_pci_device_group,
 };
 
 static const struct pci_controller_ops pnv_npu_ocapi_ioda_controller_ops = {
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 6769d2c55187..1c911eedf8fb 100644
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
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 4a0cec8cf623..94a7617eb044 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -1118,6 +1118,9 @@ static int pSeries_pci_probe_mode(struct pci_bus *bus)
 
 struct pci_controller_ops pseries_pci_controller_ops = {
 	.probe_mode		= pSeries_pci_probe_mode,
+#ifdef CONFIG_SPAPR_TCE_IOMMU
+	.device_group		= pSeries_pci_device_group,
+#endif
 };
 
 define_machine(pseries) {
diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
index c3f8ae102ece..a94ec6225d31 100644
--- a/drivers/vfio/vfio_iommu_spapr_tce.c
+++ b/drivers/vfio/vfio_iommu_spapr_tce.c
@@ -1200,8 +1200,6 @@ static void tce_iommu_release_ownership(struct tce_container *container,
 	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i)
 		if (container->tables[i])
 			table_group->ops->unset_window(table_group, i);
-
-	table_group->ops->release_ownership(table_group);
 }
 
 static long tce_iommu_take_ownership(struct tce_container *container,
@@ -1209,10 +1207,6 @@ static long tce_iommu_take_ownership(struct tce_container *container,
 {
 	long i, ret = 0;
 
-	ret = table_group->ops->take_ownership(table_group);
-	if (ret)
-		return ret;
-
 	/* Set all windows to the new group */
 	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i) {
 		struct iommu_table *tbl = container->tables[i];
@@ -1231,8 +1225,6 @@ static long tce_iommu_take_ownership(struct tce_container *container,
 	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i)
 		table_group->ops->unset_window(table_group, i);
 
-	table_group->ops->release_ownership(table_group);
-
 	return ret;
 }
 
-- 
2.30.2
