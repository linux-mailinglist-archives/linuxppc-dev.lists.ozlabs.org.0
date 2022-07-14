Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C4A574692
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 10:19:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lk6pZ4jQnz3dqw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 18:19:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lk6p013glz3c46
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 18:18:47 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
	by ozlabs.ru (Postfix) with ESMTP id 4833980B3D;
	Thu, 14 Jul 2022 04:18:36 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel 1/3] powerpc/iommu: Add "borrowing" iommu_table_group_ops
Date: Thu, 14 Jul 2022 18:18:20 +1000
Message-Id: <20220714081822.3717693-2-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220714081822.3717693-1-aik@ozlabs.ru>
References: <20220714081822.3717693-1-aik@ozlabs.ru>
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
Cc: kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Daniel Henrique Barboza <danielhb413@gmail.com>, Deming Wang <wangdeming@inspur.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PPC64 IOMMU API defines iommu_table_group_ops which handles DMA windows
for PEs: control the ownership, create/set/unset a table the hardware
for dynamic DMA windows (DDW). VFIO uses the API to implement support
on POWER.

So far only PowerNV IODA2 (POWER8 and newer machines) implemented this and other cases (POWER7 or nested KVM) did not and instead reused
existing iommu_table structs. This means 1) no DDW 2) ownership transfer
is done directly in the VFIO SPAPR TCE driver.

Soon POWER is going to get its own iommu_ops and ownership control is
going to move there. This implements spapr_tce_table_group_ops which
borrows iommu_table tables. The upside is that VFIO needs to know less
about POWER.

The new ops returns the existing table from create_table() and
only checks if the same window is already set. This is only going to work
if the default DMA window starts table_group.tce32_start and as big as
pe->table_group.tce32_size (not the case for IODA2+ PowerNV).

This changes iommu_table_group_ops::take_ownership() to return an error
if borrowing a table failed.

This should not cause any visible change in behavior for PowerNV.
pSeries was not that well tested/supported anyway.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/include/asm/iommu.h          |  6 +-
 arch/powerpc/kernel/iommu.c               | 98 ++++++++++++++++++++++-
 arch/powerpc/platforms/powernv/pci-ioda.c |  6 +-
 arch/powerpc/platforms/pseries/iommu.c    |  3 +
 drivers/vfio/vfio_iommu_spapr_tce.c       | 94 ++++------------------
 5 files changed, 121 insertions(+), 86 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index 7e29c73e3dd4..678b5bdc79b1 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -175,7 +175,7 @@ struct iommu_table_group_ops {
 	long (*unset_window)(struct iommu_table_group *table_group,
 			int num);
 	/* Switch ownership from platform code to external user (e.g. VFIO) */
-	void (*take_ownership)(struct iommu_table_group *table_group);
+	long (*take_ownership)(struct iommu_table_group *table_group);
 	/* Switch ownership from external user (e.g. VFIO) back to core */
 	void (*release_ownership)(struct iommu_table_group *table_group);
 };
@@ -215,6 +215,8 @@ extern long iommu_tce_xchg_no_kill(struct mm_struct *mm,
 		enum dma_data_direction *direction);
 extern void iommu_tce_kill(struct iommu_table *tbl,
 		unsigned long entry, unsigned long pages);
+
+extern struct iommu_table_group_ops spapr_tce_table_group_ops;
 #else
 static inline void iommu_register_group(struct iommu_table_group *table_group,
 					int pci_domain_number,
@@ -303,8 +305,6 @@ extern int iommu_tce_check_gpa(unsigned long page_shift,
 		iommu_tce_check_gpa((tbl)->it_page_shift, (gpa)))
 
 extern void iommu_flush_tce(struct iommu_table *tbl);
-extern int iommu_take_ownership(struct iommu_table *tbl);
-extern void iommu_release_ownership(struct iommu_table *tbl);
 
 extern enum dma_data_direction iommu_tce_direction(unsigned long tce);
 extern unsigned long iommu_direction_to_tce_perm(enum dma_data_direction dir);
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index caebe1431596..d873c123ab49 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1088,7 +1088,7 @@ void iommu_tce_kill(struct iommu_table *tbl,
 }
 EXPORT_SYMBOL_GPL(iommu_tce_kill);
 
-int iommu_take_ownership(struct iommu_table *tbl)
+static int iommu_take_ownership(struct iommu_table *tbl)
 {
 	unsigned long flags, i, sz = (tbl->it_size + 7) >> 3;
 	int ret = 0;
@@ -1120,9 +1120,8 @@ int iommu_take_ownership(struct iommu_table *tbl)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(iommu_take_ownership);
 
-void iommu_release_ownership(struct iommu_table *tbl)
+static void iommu_release_ownership(struct iommu_table *tbl)
 {
 	unsigned long flags, i, sz = (tbl->it_size + 7) >> 3;
 
@@ -1139,7 +1138,6 @@ void iommu_release_ownership(struct iommu_table *tbl)
 		spin_unlock(&tbl->pools[i].lock);
 	spin_unlock_irqrestore(&tbl->large_pool.lock, flags);
 }
-EXPORT_SYMBOL_GPL(iommu_release_ownership);
 
 int iommu_add_device(struct iommu_table_group *table_group, struct device *dev)
 {
@@ -1181,4 +1179,96 @@ void iommu_del_device(struct device *dev)
 	iommu_group_remove_device(dev);
 }
 EXPORT_SYMBOL_GPL(iommu_del_device);
+
+/*
+ * A simple iommu_table_group_ops which only allows reusing the existing
+ * iommu_table. This handles VFIO for POWER7 or the nested KVM.
+ * The ops does not allow creating windows and only allows reusing the existing
+ * one if it matches table_group->tce32_start/tce32_size/page_shift.
+ */
+static unsigned long spapr_tce_get_table_size(__u32 page_shift,
+					      __u64 window_size, __u32 levels)
+{
+	unsigned long size;
+
+	if (levels > 1)
+		return ~0U;
+	size = window_size >> (page_shift - 3);
+	return size;
+}
+
+static long spapr_tce_create_table(struct iommu_table_group *table_group,
+		int num, __u32 page_shift, __u64 window_size, __u32 levels,
+		struct iommu_table **ptbl)
+{
+	struct iommu_table *tbl = table_group->tables[0];
+
+	if (num > 0)
+		return -EPERM;
+
+	if (tbl->it_page_shift != page_shift ||
+	    tbl->it_size != (window_size >> page_shift) ||
+	    tbl->it_indirect_levels != levels - 1)
+		return -EINVAL;
+
+	*ptbl = iommu_tce_table_get(tbl);
+	return 0;
+}
+
+static long spapr_tce_set_window(struct iommu_table_group *table_group,
+			       int num, struct iommu_table *tbl)
+{
+	return tbl == table_group->tables[num] ? 0 : -EPERM;
+}
+
+static long spapr_tce_unset_window(struct iommu_table_group *table_group, int num)
+{
+	return 0;
+}
+
+static long spapr_tce_take_ownership(struct iommu_table_group *table_group)
+{
+	int i, j, rc = 0;
+
+	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i) {
+		struct iommu_table *tbl = table_group->tables[i];
+
+		if (!tbl || !tbl->it_map)
+			continue;
+
+		rc = iommu_take_ownership(tbl);
+		if (!rc)
+			continue;
+		for (j = 0; j < i; ++j)
+			iommu_release_ownership(table_group->tables[j]);
+		return rc;
+	}
+	return 0;
+}
+
+static void spapr_tce_release_ownership(struct iommu_table_group *table_group)
+{
+	int i;
+
+	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i) {
+		struct iommu_table *tbl = table_group->tables[i];
+
+		if (!tbl)
+			continue;
+
+		iommu_table_clear(tbl);
+		if (tbl->it_map)
+			iommu_release_ownership(tbl);
+	}
+}
+
+struct iommu_table_group_ops spapr_tce_table_group_ops = {
+	.get_table_size = spapr_tce_get_table_size,
+	.create_table = spapr_tce_create_table,
+	.set_window = spapr_tce_set_window,
+	.unset_window = spapr_tce_unset_window,
+	.take_ownership = spapr_tce_take_ownership,
+	.release_ownership = spapr_tce_release_ownership,
+};
+
 #endif /* CONFIG_IOMMU_API */
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 9de9b2fb163d..180965a309b6 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1554,6 +1554,8 @@ static void pnv_pci_ioda1_setup_dma_pe(struct pnv_phb *phb,
 	if (WARN_ON(!tbl))
 		return;
 
+	pe->table_group.ops = &spapr_tce_table_group_ops;
+	pe->table_group.pgsizes = SZ_4K;
 	iommu_register_group(&pe->table_group, phb->hose->global_number,
 			pe->pe_number);
 	pnv_pci_link_table_and_group(phb->hose->node, 0, tbl, &pe->table_group);
@@ -1888,7 +1890,7 @@ static void pnv_ioda_setup_bus_dma(struct pnv_ioda_pe *pe, struct pci_bus *bus)
 	}
 }
 
-static void pnv_ioda2_take_ownership(struct iommu_table_group *table_group)
+static long pnv_ioda2_take_ownership(struct iommu_table_group *table_group)
 {
 	struct pnv_ioda_pe *pe = container_of(table_group, struct pnv_ioda_pe,
 						table_group);
@@ -1902,6 +1904,8 @@ static void pnv_ioda2_take_ownership(struct iommu_table_group *table_group)
 	else if (pe->pdev)
 		set_iommu_table_base(&pe->pdev->dev, NULL);
 	iommu_tce_table_put(tbl);
+
+	return 0;
 }
 
 static void pnv_ioda2_release_ownership(struct iommu_table_group *table_group)
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index c3d425ef7b39..ae05b11c457d 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -74,6 +74,9 @@ static struct iommu_table_group *iommu_pseries_alloc_group(int node)
 	if (!table_group)
 		return NULL;
 
+	table_group->ops = &spapr_tce_table_group_ops;
+	table_group->pgsizes = SZ_4K;
+
 	table_group->tables[0] = iommu_pseries_alloc_table(node);
 	if (table_group->tables[0])
 		return table_group;
diff --git a/drivers/vfio/vfio_iommu_spapr_tce.c b/drivers/vfio/vfio_iommu_spapr_tce.c
index cd7b9c136889..8a65ea61744c 100644
--- a/drivers/vfio/vfio_iommu_spapr_tce.c
+++ b/drivers/vfio/vfio_iommu_spapr_tce.c
@@ -1141,52 +1141,6 @@ static long tce_iommu_ioctl(void *iommu_data,
 
 static void tce_iommu_release_ownership(struct tce_container *container,
 		struct iommu_table_group *table_group)
-{
-	int i;
-
-	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i) {
-		struct iommu_table *tbl = container->tables[i];
-
-		if (!tbl)
-			continue;
-
-		tce_iommu_clear(container, tbl, tbl->it_offset, tbl->it_size);
-		if (tbl->it_map)
-			iommu_release_ownership(tbl);
-
-		container->tables[i] = NULL;
-	}
-}
-
-static int tce_iommu_take_ownership(struct tce_container *container,
-		struct iommu_table_group *table_group)
-{
-	int i, j, rc = 0;
-
-	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i) {
-		struct iommu_table *tbl = table_group->tables[i];
-
-		if (!tbl || !tbl->it_map)
-			continue;
-
-		rc = iommu_take_ownership(tbl);
-		if (rc) {
-			for (j = 0; j < i; ++j)
-				iommu_release_ownership(
-						table_group->tables[j]);
-
-			return rc;
-		}
-	}
-
-	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i)
-		container->tables[i] = table_group->tables[i];
-
-	return 0;
-}
-
-static void tce_iommu_release_ownership_ddw(struct tce_container *container,
-		struct iommu_table_group *table_group)
 {
 	long i;
 
@@ -1202,18 +1156,14 @@ static void tce_iommu_release_ownership_ddw(struct tce_container *container,
 	table_group->ops->release_ownership(table_group);
 }
 
-static long tce_iommu_take_ownership_ddw(struct tce_container *container,
+static long tce_iommu_take_ownership(struct tce_container *container,
 		struct iommu_table_group *table_group)
 {
 	long i, ret = 0;
 
-	if (!table_group->ops->create_table || !table_group->ops->set_window ||
-			!table_group->ops->release_ownership) {
-		WARN_ON_ONCE(1);
-		return -EFAULT;
-	}
-
-	table_group->ops->take_ownership(table_group);
+	ret = table_group->ops->take_ownership(table_group);
+	if (ret)
+		return ret;
 
 	/* Set all windows to the new group */
 	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i) {
@@ -1259,9 +1209,14 @@ static int tce_iommu_attach_group(void *iommu_data,
 		goto unlock_exit;
 	}
 
-	if (tce_groups_attached(container) && (!table_group->ops ||
-			!table_group->ops->take_ownership ||
-			!table_group->ops->release_ownership)) {
+	/* v2 requires full support of dynamic DMA windows */
+	if (container->v2 && table_group->max_dynamic_windows_supported == 0) {
+		ret = -EINVAL;
+		goto unlock_exit;
+	}
+
+	/* v1 reuses TCE tables and does not share them among PEs */
+	if (!container->v2 && tce_groups_attached(container)) {
 		ret = -EBUSY;
 		goto unlock_exit;
 	}
@@ -1293,29 +1248,15 @@ static int tce_iommu_attach_group(void *iommu_data,
 		goto unlock_exit;
 	}
 
-	if (!table_group->ops || !table_group->ops->take_ownership ||
-			!table_group->ops->release_ownership) {
-		if (container->v2) {
-			ret = -EPERM;
-			goto free_exit;
-		}
-		ret = tce_iommu_take_ownership(container, table_group);
-	} else {
-		if (!container->v2) {
-			ret = -EPERM;
-			goto free_exit;
-		}
-		ret = tce_iommu_take_ownership_ddw(container, table_group);
-		if (!tce_groups_attached(container) && !container->tables[0])
-			container->def_window_pending = true;
-	}
+	ret = tce_iommu_take_ownership(container, table_group);
+	if (!tce_groups_attached(container) && !container->tables[0])
+		container->def_window_pending = true;
 
 	if (!ret) {
 		tcegrp->grp = iommu_group;
 		list_add(&tcegrp->next, &container->group_list);
 	}
 
-free_exit:
 	if (ret && tcegrp)
 		kfree(tcegrp);
 
@@ -1354,10 +1295,7 @@ static void tce_iommu_detach_group(void *iommu_data,
 	table_group = iommu_group_get_iommudata(iommu_group);
 	BUG_ON(!table_group);
 
-	if (!table_group->ops || !table_group->ops->release_ownership)
-		tce_iommu_release_ownership(container, table_group);
-	else
-		tce_iommu_release_ownership_ddw(container, table_group);
+	tce_iommu_release_ownership(container, table_group);
 
 unlock_exit:
 	mutex_unlock(&container->lock);
-- 
2.30.2

