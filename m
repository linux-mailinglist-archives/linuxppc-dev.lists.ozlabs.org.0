Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C1B6ACAC3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 18:38:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVm503zdVz3cht
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 04:38:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=rPL6QstU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=rPL6QstU;
	dkim-atps=neutral
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVm345cYgz3cdb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 04:36:32 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id DD87037E2D608F;
	Mon,  6 Mar 2023 11:30:21 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id C0UBHeda5DkJ; Mon,  6 Mar 2023 11:30:20 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 3D82E37E2D608C;
	Mon,  6 Mar 2023 11:30:20 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 3D82E37E2D608C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1678123820; bh=IIMqz1QQYrje3bbf91KJUZcVhibsDYEdfwdZwwDI3R8=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=rPL6QstU9zX7HYDbw2GGTvg7rq0YEwiZVo/eVuPp7JpIKBUhaBryow+/qpK1/gFO5
	 2PkPqB1QrrWDaQWk5lvxjiSUHqbKX8lNl9wd8KWUWzYTchhm+7hI2tcEHODgkirYh1
	 oBIZ0aX05lA96l/7csbZ54Wzxgr7ci7KxQRwsDmc=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RxuhlV1h4t_W; Mon,  6 Mar 2023 11:30:20 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 2028737E2D6089;
	Mon,  6 Mar 2023 11:30:20 -0600 (CST)
Date: Mon, 6 Mar 2023 11:30:20 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: kvm <kvm@vger.kernel.org>
Message-ID: <525438831.16998517.1678123820075.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH v2 1/4] powerpc/iommu: Add "borrowing" iommu_table_group_ops
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC110 (Linux)/8.5.0_GA_3042)
Thread-Index: hUSfuDDPqLKZwFP9gR3jsjjw6MwO/A==
Thread-Topic: powerpc/iommu: Add "borrowing" iommu_table_group_ops
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
Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
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
index ee95937bdaf1..f9f5a9418092 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1086,7 +1086,7 @@ void iommu_tce_kill(struct iommu_table *tbl,
 }
 EXPORT_SYMBOL_GPL(iommu_tce_kill);
 
-int iommu_take_ownership(struct iommu_table *tbl)
+static int iommu_take_ownership(struct iommu_table *tbl)
 {
 	unsigned long flags, i, sz = (tbl->it_size + 7) >> 3;
 	int ret = 0;
@@ -1118,9 +1118,8 @@ int iommu_take_ownership(struct iommu_table *tbl)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(iommu_take_ownership);
 
-void iommu_release_ownership(struct iommu_table *tbl)
+static void iommu_release_ownership(struct iommu_table *tbl)
 {
 	unsigned long flags, i, sz = (tbl->it_size + 7) >> 3;
 
@@ -1137,7 +1136,6 @@ void iommu_release_ownership(struct iommu_table *tbl)
 		spin_unlock(&tbl->pools[i].lock);
 	spin_unlock_irqrestore(&tbl->large_pool.lock, flags);
 }
-EXPORT_SYMBOL_GPL(iommu_release_ownership);
 
 int iommu_add_device(struct iommu_table_group *table_group, struct device *dev)
 {
@@ -1179,4 +1177,96 @@ void iommu_del_device(struct device *dev)
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
index 4f6e20a35aa1..539934c76002 100644
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
index c74b71d4733d..6769d2c55187 100644
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
index 60a50ce8701e..c3f8ae102ece 100644
--- a/drivers/vfio/vfio_iommu_spapr_tce.c
+++ b/drivers/vfio/vfio_iommu_spapr_tce.c
@@ -1189,52 +1189,6 @@ static long tce_iommu_ioctl(void *iommu_data,
 
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
 
@@ -1250,18 +1204,14 @@ static void tce_iommu_release_ownership_ddw(struct tce_container *container,
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
@@ -1307,9 +1257,14 @@ static int tce_iommu_attach_group(void *iommu_data,
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
@@ -1344,29 +1299,15 @@ static int tce_iommu_attach_group(void *iommu_data,
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
 
@@ -1405,10 +1346,7 @@ static void tce_iommu_detach_group(void *iommu_data,
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

