Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B8E914AB0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 14:43:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Drn92VYJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W770s5N5Mz30VN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 22:43:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Drn92VYJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W76wz0fLrz3cVZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 22:39:46 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OCSW8H008962;
	Mon, 24 Jun 2024 12:39:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	subject:from:to:cc:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=pp1; bh=
	jAepbTZ11AAakUdCxyZ/o8GKqXpYX6jmM2MNSZdO3ok=; b=Drn92VYJ2h29Y+am
	SF1lvXTttBjLpV2XCeDEp2a3CWTtBUP7nwARxYpR3H6ss6za3KvPVRyBPSgi9YnK
	98PYeLGWU+FruJf+eAD8CCUohUdQRocHRkJA0/ZAg53vIuqMXFDL5dM/SB+8gTjl
	A8NdhWdk5Dlisekbu+mtBSo1UC75wXRQMEe+l7eA83xdUh3LHMAC5rE+kfnLBKiZ
	eznkSk3Ee7ZcGxU4RV3F6O1a6yFKAiUxs9gnLwl9rWuS6nI/l1vZV/ohU/zhvcny
	ktpTdNSfNdZuFWUMU3bJp3YBq7EOCP5srms5KaQVH/Js43oas8QosdLfFfw6T+TK
	DDSFAA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yy8u5015h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 12:39:35 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45OCdZh9029641;
	Mon, 24 Jun 2024 12:39:35 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yy8u5015a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 12:39:35 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45OCKXiK008152;
	Mon, 24 Jun 2024 12:39:33 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yx9b0gw9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 12:39:33 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45OCdRlW22413678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jun 2024 12:39:29 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A0AC12004D;
	Mon, 24 Jun 2024 12:39:27 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C84F320063;
	Mon, 24 Jun 2024 12:39:23 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.3.101.175])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Jun 2024 12:39:23 +0000 (GMT)
Subject: [PATCH v4 6/6] powerpc/iommu: Reimplement the iommu_table_group_ops
 for pSeries
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: mpe@ellerman.id.au, tpearson@raptorengineering.com,
        alex.williamson@redhat.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Date: Mon, 24 Jun 2024 12:39:23 +0000
Message-ID: <171923275958.1397.907964437142542242.stgit@linux.ibm.com>
In-Reply-To: <171923268781.1397.8871195514893204050.stgit@linux.ibm.com>
References: <171923268781.1397.8871195514893204050.stgit@linux.ibm.com>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Mzr9KY4fg9Aq0hLzD2PS3hzlohO4HNou
X-Proofpoint-GUID: y4oYtkVlKRqPhPctzjjDvnTFN5ihfMV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_09,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406240099
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
Cc: svaidy@linux.ibm.com, robh@kernel.org, jroedel@suse.de, sbhat@linux.ibm.com, gbatra@linux.vnet.ibm.com, jgg@ziepe.ca, aik@ozlabs.ru, sanastasio@raptorengineering.com, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, mahesh@linux.ibm.com, aneesh.kumar@kernel.org, brking@linux.vnet.ibm.com, oohall@gmail.com, npiggin@gmail.com, kvm@vger.kernel.org, ruscur@russell.cc, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, msuchanek@suse.de, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PPC64 IOMMU API defines iommu_table_group_ops which handles DMA
windows for PEs, their ownership transfer, create/set/unset the TCE
tables for the Dynamic DMA wundows(DDW). VFIOS uses these APIs for
support on POWER.

The commit 9d67c9433509 ("powerpc/iommu: Add "borrowing"
iommu_table_group_ops") implemented partial support for this API with
"borrow" mechanism wherein the DMA windows if created already by the
host driver, they would be available for VFIO to use. Also, it didn't
have the support to control/modify the window size or the IO page
size.

The current patch implements all the necessary iommu_table_group_ops
APIs there by avoiding the "borrrowing". So, just the way it is on the
PowerNV platform, with this patch the iommu table group ownership is
transferred to the VFIO PPC subdriver, the iommu table, DMA windows
creation/deletion all driven through the APIs.

The pSeries uses the query-pe-dma-window, create-pe-dma-window and
reset-pe-dma-window RTAS calls for DMA window creation, deletion and
reset to defaul. The RTAs calls do show some minor differences to the
way things are to be handled on the pSeries which are listed below.

* On pSeries, the default DMA window size is "fixed" cannot be custom
sized as requested by the user. For non-SRIOV VFs, It is fixed at 2GB
and for SRIOV VFs, its variable sized based on the capacity assigned
to it during the VF assignment to the LPAR. So, for the  default DMA
window alone the size if requested less than tce32_size, the smaller
size is enforced using the iommu table->it_size.

* The DMA start address for 32-bit window is 0, and for the 64-bit
window in case of PowerNV is hardcoded to TVE select (bit 59) at 512PiB
offset. This address is returned at the time of create_table() API call
(even before the window is created), the subsequent set_window() call
actually opens the DMA window. On pSeries, the DMA start address for
32-bit window is known from the 'ibm,dma-window' DT property. However,
the 64-bit window start address is not known until the create-pe-dma
RTAS call is made. So, the create_table() which returns the DMA window
start address actually opens the DMA window and returns the DMA start
address as returned by the Hypervisor for the create-pe-dma RTAS call.

* The reset-pe-dma RTAS call resets the DMA windows and restores the
default DMA window, however it does not clear the TCE table entries
if there are any. In case of ownership transfer from platform domain
which used direct mapping, the patch chooses remove-pe-dma instead of
reset-pe for the 64-bit window intentionally so that the
clear_dma_window() is called.

Other than the DMA window management changes mentioned above, the
patch also brings back the userspace view for the single level TCE
as it existed before commit 090bad39b237a ("powerpc/powernv: Add
indirect levels to it_userspace") along with the relavent
refactoring.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 arch/powerpc/include/asm/iommu.h          |    4 
 arch/powerpc/kernel/iommu.c               |    4 
 arch/powerpc/platforms/powernv/pci-ioda.c |    6 
 arch/powerpc/platforms/pseries/iommu.c    |  627 +++++++++++++++++++++++++----
 4 files changed, 543 insertions(+), 98 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index b2fe6e7f81d6..6ce13ef3e37d 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -181,9 +181,9 @@ struct iommu_table_group_ops {
 	long (*unset_window)(struct iommu_table_group *table_group,
 			int num);
 	/* Switch ownership from platform code to external user (e.g. VFIO) */
-	long (*take_ownership)(struct iommu_table_group *table_group);
+	long (*take_ownership)(struct iommu_table_group *table_group, struct device *dev);
 	/* Switch ownership from external user (e.g. VFIO) back to core */
-	void (*release_ownership)(struct iommu_table_group *table_group);
+	void (*release_ownership)(struct iommu_table_group *table_group, struct device *dev);
 };
 
 struct iommu_table_group_link {
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index ed8204cfa319..76381e14e800 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1171,7 +1171,7 @@ spapr_tce_platform_iommu_attach_dev(struct iommu_domain *platform_domain,
 	 * The domain being set to PLATFORM from earlier
 	 * BLOCKED. The table_group ownership has to be released.
 	 */
-	table_group->ops->release_ownership(table_group);
+	table_group->ops->release_ownership(table_group, dev);
 	iommu_group_put(grp);
 
 	return 0;
@@ -1199,7 +1199,7 @@ spapr_tce_blocked_iommu_attach_dev(struct iommu_domain *platform_domain,
 	 * also sets the dma_api ops
 	 */
 	table_group = iommu_group_get_iommudata(grp);
-	ret = table_group->ops->take_ownership(table_group);
+	ret = table_group->ops->take_ownership(table_group, dev);
 	iommu_group_put(grp);
 
 	return ret;
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 23f5b5093ec1..b0a14e48175c 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1537,7 +1537,8 @@ static void pnv_ioda_setup_bus_dma(struct pnv_ioda_pe *pe, struct pci_bus *bus)
 	}
 }
 
-static long pnv_ioda2_take_ownership(struct iommu_table_group *table_group)
+static long pnv_ioda2_take_ownership(struct iommu_table_group *table_group,
+				     struct device *dev __maybe_unused)
 {
 	struct pnv_ioda_pe *pe = container_of(table_group, struct pnv_ioda_pe,
 						table_group);
@@ -1562,7 +1563,8 @@ static long pnv_ioda2_take_ownership(struct iommu_table_group *table_group)
 	return 0;
 }
 
-static void pnv_ioda2_release_ownership(struct iommu_table_group *table_group)
+static void pnv_ioda2_release_ownership(struct iommu_table_group *table_group,
+					struct device *dev __maybe_unused)
 {
 	struct pnv_ioda_pe *pe = container_of(table_group, struct pnv_ioda_pe,
 						table_group);
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index d2ac6c19cf9b..e226e43c8762 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -21,6 +21,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/crash_dump.h>
 #include <linux/memory.h>
+#include <linux/vmalloc.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/iommu.h>
@@ -54,57 +55,6 @@ enum {
 	DDW_EXT_QUERY_OUT_SIZE = 2
 };
 
-static int iommu_take_ownership(struct iommu_table *tbl)
-{
-	unsigned long flags, i, sz = (tbl->it_size + 7) >> 3;
-	int ret = 0;
-
-	/*
-	 * VFIO does not control TCE entries allocation and the guest
-	 * can write new TCEs on top of existing ones so iommu_tce_build()
-	 * must be able to release old pages. This functionality
-	 * requires exchange() callback defined so if it is not
-	 * implemented, we disallow taking ownership over the table.
-	 */
-	if (!tbl->it_ops->xchg_no_kill)
-		return -EINVAL;
-
-	spin_lock_irqsave(&tbl->large_pool.lock, flags);
-	for (i = 0; i < tbl->nr_pools; i++)
-		spin_lock_nest_lock(&tbl->pools[i].lock, &tbl->large_pool.lock);
-
-	if (iommu_table_in_use(tbl)) {
-		pr_err("iommu_tce: it_map is not empty");
-		ret = -EBUSY;
-	} else {
-		memset(tbl->it_map, 0xff, sz);
-	}
-
-	for (i = 0; i < tbl->nr_pools; i++)
-		spin_unlock(&tbl->pools[i].lock);
-	spin_unlock_irqrestore(&tbl->large_pool.lock, flags);
-
-	return ret;
-}
-
-static void iommu_release_ownership(struct iommu_table *tbl)
-{
-	unsigned long flags, i, sz = (tbl->it_size + 7) >> 3;
-
-	spin_lock_irqsave(&tbl->large_pool.lock, flags);
-	for (i = 0; i < tbl->nr_pools; i++)
-		spin_lock_nest_lock(&tbl->pools[i].lock, &tbl->large_pool.lock);
-
-	memset(tbl->it_map, 0, sz);
-
-	iommu_table_reserve_pages(tbl, tbl->it_reserved_start,
-			tbl->it_reserved_end);
-
-	for (i = 0; i < tbl->nr_pools; i++)
-		spin_unlock(&tbl->pools[i].lock);
-	spin_unlock_irqrestore(&tbl->large_pool.lock, flags);
-}
-
 static struct iommu_table *iommu_pseries_alloc_table(int node)
 {
 	struct iommu_table *tbl;
@@ -196,7 +146,7 @@ static int tce_build_pSeries(struct iommu_table *tbl, long index,
 }
 
 
-static void tce_free_pSeries(struct iommu_table *tbl, long index, long npages)
+static void tce_clear_pSeries(struct iommu_table *tbl, long index, long npages)
 {
 	__be64 *tcep;
 
@@ -215,6 +165,37 @@ static unsigned long tce_get_pseries(struct iommu_table *tbl, long index)
 	return be64_to_cpu(*tcep);
 }
 
+static long pseries_tce_iommu_userspace_view_alloc(struct iommu_table *tbl)
+{
+	unsigned long cb = ALIGN(sizeof(tbl->it_userspace[0]) * tbl->it_size, PAGE_SIZE);
+	unsigned long *uas;
+
+	if (tbl->it_indirect_levels) /* Impossible */
+		return -EPERM;
+
+	WARN_ON(tbl->it_userspace);
+
+	uas = vzalloc(cb);
+	if (!uas)
+		return -ENOMEM;
+
+	tbl->it_userspace = (__be64 *) uas;
+
+	return 0;
+}
+
+static void tce_iommu_userspace_view_free(struct iommu_table *tbl)
+{
+	vfree(tbl->it_userspace);
+	tbl->it_userspace = NULL;
+}
+
+static void tce_free_pSeries(struct iommu_table *tbl)
+{
+	if (!tbl->it_userspace)
+		tce_iommu_userspace_view_free(tbl);
+}
+
 static void tce_free_pSeriesLP(unsigned long liobn, long, long, long);
 static void tce_freemulti_pSeriesLP(struct iommu_table*, long, long);
 
@@ -629,7 +610,7 @@ struct iommu_table_ops iommu_table_lpar_multi_ops;
 
 struct iommu_table_ops iommu_table_pseries_ops = {
 	.set = tce_build_pSeries,
-	.clear = tce_free_pSeries,
+	.clear = tce_clear_pSeries,
 	.get = tce_get_pseries
 };
 
@@ -738,17 +719,45 @@ static int tce_exchange_pseries(struct iommu_table *tbl, long index, unsigned
 
 	return rc;
 }
+
+static __be64 *tce_useraddr_pSeriesLP(struct iommu_table *tbl, long index,
+				      bool __always_unused alloc)
+{
+	return tbl->it_userspace ? &tbl->it_userspace[index - tbl->it_offset] : NULL;
+}
 #endif
 
 struct iommu_table_ops iommu_table_lpar_multi_ops = {
 	.set = tce_buildmulti_pSeriesLP,
 #ifdef CONFIG_IOMMU_API
 	.xchg_no_kill = tce_exchange_pseries,
+	.useraddrptr = tce_useraddr_pSeriesLP,
 #endif
 	.clear = tce_freemulti_pSeriesLP,
-	.get = tce_get_pSeriesLP
+	.get = tce_get_pSeriesLP,
+	.free = tce_free_pSeries
 };
 
+/*
+ * When the DMA window properties might have been removed,
+ * the parent node has the table_group setup on it.
+ */
+static struct device_node *pci_dma_find_parent_node(struct pci_dev *dev,
+					       struct iommu_table_group *table_group)
+{
+	struct device_node *dn = pci_device_to_OF_node(dev);
+	struct pci_dn *rpdn;
+
+	for (; dn && PCI_DN(dn); dn = dn->parent) {
+		rpdn = PCI_DN(dn);
+
+		if (table_group == rpdn->table_group)
+			return dn;
+	}
+
+	return NULL;
+}
+
 /*
  * Find nearest ibm,dma-window (default DMA window) or direct DMA window or
  * dynamic 64bit DMA window, walking up the device tree.
@@ -963,7 +972,7 @@ static void __remove_dma_window(struct device_node *np, u32 *ddw_avail, u64 liob
 }
 
 static void remove_dma_window(struct device_node *np, u32 *ddw_avail,
-			      struct property *win)
+			      struct property *win, bool cleanup)
 {
 	struct dynamic_dma_window_prop *dwp;
 	u64 liobn;
@@ -971,11 +980,44 @@ static void remove_dma_window(struct device_node *np, u32 *ddw_avail,
 	dwp = win->value;
 	liobn = (u64)be32_to_cpu(dwp->liobn);
 
-	clean_dma_window(np, dwp);
+	if (cleanup)
+		clean_dma_window(np, dwp);
 	__remove_dma_window(np, ddw_avail, liobn);
 }
 
-static int remove_ddw(struct device_node *np, bool remove_prop, const char *win_name)
+static void copy_property(struct device_node *pdn, const char *from, const char *to)
+{
+	struct property *src, *dst;
+
+	src = of_find_property(pdn, from, NULL);
+	if (!src)
+		return;
+
+	dst = kzalloc(sizeof(*dst), GFP_KERNEL);
+	if (!dst)
+		return;
+
+	dst->name = kstrdup(to, GFP_KERNEL);
+	dst->value = kmemdup(src->value, src->length, GFP_KERNEL);
+	dst->length = src->length;
+	if (!dst->name || !dst->value)
+		return;
+
+	if (of_add_property(pdn, dst)) {
+		pr_err("Unable to add DMA window property for %pOF", pdn);
+		goto free_prop;
+	}
+
+	return;
+
+free_prop:
+	kfree(dst->name);
+	kfree(dst->value);
+	kfree(dst);
+}
+
+static int remove_dma_window_named(struct device_node *np, bool remove_prop, const char *win_name,
+				   bool cleanup)
 {
 	struct property *win;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
@@ -990,13 +1032,20 @@ static int remove_ddw(struct device_node *np, bool remove_prop, const char *win_
 	if (ret)
 		return 0;
 
-
 	if (win->length >= sizeof(struct dynamic_dma_window_prop))
-		remove_dma_window(np, ddw_avail, win);
+		remove_dma_window(np, ddw_avail, win, cleanup);
 
 	if (!remove_prop)
 		return 0;
 
+	/* Default window property if removed is lost as reset-pe doesn't restore it.
+	 * Though FDT has a copy of it, the DLPAR hotplugged devices will not have a
+	 * node on FDT until next reboot. So, back it up.
+	 */
+	if ((strcmp(win_name, "ibm,dma-window") == 0) &&
+	    !of_find_property(np, "ibm,dma-window-saved", NULL))
+		copy_property(np, win_name, "ibm,dma-window-saved");
+
 	ret = of_remove_property(np, win);
 	if (ret)
 		pr_warn("%pOF: failed to remove DMA window property: %d\n",
@@ -1054,7 +1103,7 @@ static void find_existing_ddw_windows_named(const char *name)
 	for_each_node_with_property(pdn, name) {
 		dma64 = of_get_property(pdn, name, &len);
 		if (!dma64 || len < sizeof(*dma64)) {
-			remove_ddw(pdn, true, name);
+			remove_dma_window_named(pdn, true, name, true);
 			continue;
 		}
 
@@ -1431,7 +1480,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		if (reset_win_ext)
 			goto out_failed;
 
-		remove_dma_window(pdn, ddw_avail, default_win);
+		remove_dma_window(pdn, ddw_avail, default_win, true);
 		default_win_removed = true;
 
 		/* Query again, to check if the window is available */
@@ -1568,6 +1617,8 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 	if (default_win_removed) {
 		/* default_win is valid here because default_win_removed == true */
+		if (!of_find_property(pdn, "ibm,dma-window-saved", NULL))
+			copy_property(pdn, "ibm,dma-window", "ibm,dma-window-saved");
 		of_remove_property(pdn, default_win);
 		dev_info(&dev->dev, "Removed default DMA window for %pOF\n", pdn);
 	}
@@ -1776,24 +1827,326 @@ static unsigned long spapr_tce_get_table_size(__u32 page_shift,
 	return size;
 }
 
+static struct pci_dev *iommu_group_get_first_pci_dev(struct iommu_group *group)
+{
+	struct pci_dev *pdev = NULL;
+	int ret;
+
+	/* No IOMMU group ? */
+	if (!group)
+		return NULL;
+
+	ret = iommu_group_for_each_dev(group, &pdev, dev_has_iommu_table);
+	if (!ret || !pdev)
+		return NULL;
+	return pdev;
+}
+
+static void restore_default_dma_window(struct pci_dev *pdev, struct device_node *pdn)
+{
+	reset_dma_window(pdev, pdn);
+	copy_property(pdn, "ibm,dma-window-saved", "ibm,dma-window");
+}
+
+static long remove_dynamic_dma_windows(struct pci_dev *pdev, struct device_node *pdn)
+{
+	struct pci_dn *pci = PCI_DN(pdn);
+	struct dma_win *window;
+	bool direct_mapping;
+	int len;
+
+	if (find_existing_ddw(pdn, &pdev->dev.archdata.dma_offset, &len, &direct_mapping)) {
+		remove_dma_window_named(pdn, true, direct_mapping ?
+						   DIRECT64_PROPNAME : DMA64_PROPNAME, true);
+		if (!direct_mapping) {
+			WARN_ON(!pci->table_group->tables[0] && !pci->table_group->tables[1]);
+
+			if (pci->table_group->tables[1]) {
+				iommu_tce_table_put(pci->table_group->tables[1]);
+				pci->table_group->tables[1] = NULL;
+			} else if (pci->table_group->tables[0]) {
+				/* Default window was removed and only the DDW exists */
+				iommu_tce_table_put(pci->table_group->tables[0]);
+				pci->table_group->tables[0] = NULL;
+			}
+		}
+		spin_lock(&dma_win_list_lock);
+		list_for_each_entry(window, &dma_win_list, list) {
+			if (window->device == pdn) {
+				list_del(&window->list);
+				kfree(window);
+				break;
+			}
+		}
+		spin_unlock(&dma_win_list_lock);
+	}
+
+	return 0;
+}
+
+static long pseries_setup_default_iommu_config(struct iommu_table_group *table_group,
+					       struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	const __be32 *default_prop;
+	long liobn, offset, size;
+	struct device_node *pdn;
+	struct iommu_table *tbl;
+	struct pci_dn *pci;
+
+	pdn = pci_dma_find_parent_node(pdev, table_group);
+	if (!pdn || !PCI_DN(pdn)) {
+		dev_warn(&pdev->dev, "No table_group configured for the node %pOF\n", pdn);
+		return -1;
+	}
+	pci = PCI_DN(pdn);
+
+	/* The default window is restored if not present already on removal of DDW.
+	 * However, if used by VFIO SPAPR sub driver, the user's order of removal of
+	 * windows might have been different to not leading to auto restoration,
+	 * suppose the DDW was removed first followed by the default one.
+	 * So, restore the default window with reset-pe-dma call explicitly.
+	 */
+	restore_default_dma_window(pdev, pdn);
+
+	default_prop = of_get_property(pdn, "ibm,dma-window", NULL);
+	of_parse_dma_window(pdn, default_prop, &liobn, &offset, &size);
+	tbl = iommu_pseries_alloc_table(pci->phb->node);
+	if (!tbl) {
+		dev_err(&pdev->dev, "couldn't create new IOMMU table\n");
+		return -1;
+	}
+
+	iommu_table_setparms_common(tbl, pci->phb->bus->number, liobn, offset,
+				    size, IOMMU_PAGE_SHIFT_4K, NULL,
+				    &iommu_table_lpar_multi_ops);
+	iommu_init_table(tbl, pci->phb->node, 0, 0);
+
+	pci->table_group->tables[0] = tbl;
+	set_iommu_table_base(&pdev->dev, tbl);
+
+	return 0;
+}
+
+static bool is_default_window_request(struct iommu_table_group *table_group, __u32 page_shift,
+				      __u64 window_size)
+{
+	if ((window_size <= table_group->tce32_size) &&
+	    (page_shift == IOMMU_PAGE_SHIFT_4K))
+		return true;
+
+	return false;
+}
+
 static long spapr_tce_create_table(struct iommu_table_group *table_group, int num,
 				   __u32 page_shift, __u64 window_size, __u32 levels,
 				   struct iommu_table **ptbl)
 {
-	struct iommu_table *tbl = table_group->tables[0];
-
-	if (num > 0)
-		return -EPERM;
+	struct pci_dev *pdev = iommu_group_get_first_pci_dev(table_group->group);
+	u32 ddw_avail[DDW_APPLICABLE_SIZE];
+	struct ddw_create_response create;
+	unsigned long liobn, offset, size;
+	unsigned long start = 0, end = 0;
+	struct ddw_query_response query;
+	const __be32 *default_prop;
+	struct failed_ddw_pdn *fpdn;
+	unsigned int window_shift;
+	struct device_node *pdn;
+	struct iommu_table *tbl;
+	struct dma_win *window;
+	struct property *win64;
+	struct pci_dn *pci;
+	u64 win_addr;
+	int len, i;
+	long ret;
 
-	if (tbl->it_page_shift != page_shift ||
-	    tbl->it_size != (window_size >> page_shift) ||
-	    tbl->it_indirect_levels != levels - 1)
+	if (!is_power_of_2(window_size) || levels > 1)
 		return -EINVAL;
 
+	window_shift = order_base_2(window_size);
+
+	mutex_lock(&dma_win_init_mutex);
+
+	ret = -ENODEV;
+
+	pdn = pci_dma_find_parent_node(pdev, table_group);
+	if (!pdn || !PCI_DN(pdn)) { /* Niether of 32s|64-bit exist! */
+		dev_warn(&pdev->dev, "No dma-windows exist for the node %pOF\n", pdn);
+		goto out_failed;
+	}
+	pci = PCI_DN(pdn);
+
+	/* If the enable DDW failed for the pdn, dont retry! */
+	list_for_each_entry(fpdn, &failed_ddw_pdn_list, list) {
+		if (fpdn->pdn == pdn) {
+			dev_info(&pdev->dev, "%pOF in failed DDW device list\n", pdn);
+			goto out_unlock;
+		}
+	}
+
+	tbl = iommu_pseries_alloc_table(pci->phb->node);
+	if (!tbl) {
+		dev_dbg(&pdev->dev, "couldn't create new IOMMU table\n");
+		goto out_unlock;
+	}
+
+	if (num == 0) {
+		bool direct_mapping;
+		/* The request is not for default window? Ensure there is no DDW window already */
+		if (!is_default_window_request(table_group, page_shift, window_size)) {
+			if (find_existing_ddw(pdn, &pdev->dev.archdata.dma_offset, &len,
+					      &direct_mapping)) {
+				dev_warn(&pdev->dev, "%pOF: 64-bit window already present.", pdn);
+				ret = -EPERM;
+				goto out_unlock;
+			}
+		} else {
+			/* Request is for Default window, ensure there is no DDW if there is a
+			 * need to reset. reset-pe otherwise removes the DDW also
+			 */
+			default_prop = of_get_property(pdn, "ibm,dma-window", NULL);
+			if (!default_prop) {
+				if (find_existing_ddw(pdn, &pdev->dev.archdata.dma_offset, &len,
+						      &direct_mapping)) {
+					dev_warn(&pdev->dev, "%pOF: Attempt to create window#0 when 64-bit window is present. Preventing the attempt as that would destroy the 64-bit window",
+						 pdn);
+					ret = -EPERM;
+					goto out_unlock;
+				}
+
+				restore_default_dma_window(pdev, pdn);
+
+				default_prop = of_get_property(pdn, "ibm,dma-window", NULL);
+				of_parse_dma_window(pdn, default_prop, &liobn, &offset, &size);
+				/* Limit the default window size to window_size */
+				iommu_table_setparms_common(tbl, pci->phb->bus->number, liobn,
+							    offset, 1UL << window_shift,
+							    IOMMU_PAGE_SHIFT_4K, NULL,
+							    &iommu_table_lpar_multi_ops);
+				iommu_init_table(tbl, pci->phb->node, start, end);
+
+				table_group->tables[0] = tbl;
+
+				mutex_unlock(&dma_win_init_mutex);
+
+				goto exit;
+			}
+		}
+	}
+
+	ret = of_property_read_u32_array(pdn, "ibm,ddw-applicable",
+				&ddw_avail[0], DDW_APPLICABLE_SIZE);
+	if (ret) {
+		dev_info(&pdev->dev, "ibm,ddw-applicable not found\n");
+		goto out_failed;
+	}
+	ret = -ENODEV;
+
+	pr_err("%s: Calling query %pOF\n", __func__, pdn);
+	ret = query_ddw(pdev, ddw_avail, &query, pdn);
+	if (ret)
+		goto out_failed;
+	ret = -ENODEV;
+
+	len = window_shift;
+	if (query.largest_available_block < (1ULL << (len - page_shift))) {
+		dev_dbg(&pdev->dev, "can't map window 0x%llx with %llu %llu-sized pages\n",
+				1ULL << len, query.largest_available_block,
+				1ULL << page_shift);
+		ret = -EINVAL; /* Retry with smaller window size */
+		goto out_unlock;
+	}
+
+	if (create_ddw(pdev, ddw_avail, &create, page_shift, len)) {
+		pr_err("%s: Create ddw failed %pOF\n", __func__, pdn);
+		goto out_failed;
+	}
+
+	win_addr = ((u64)create.addr_hi << 32) | create.addr_lo;
+	win64 = ddw_property_create(DMA64_PROPNAME, create.liobn, win_addr, page_shift, len);
+	if (!win64)
+		goto remove_window;
+
+	ret = of_add_property(pdn, win64);
+	if (ret) {
+		dev_err(&pdev->dev, "unable to add DMA window property for %pOF: %ld", pdn, ret);
+		goto free_property;
+	}
+	ret = -ENODEV;
+
+	window = ddw_list_new_entry(pdn, win64->value);
+	if (!window)
+		goto remove_property;
+
+	window->direct = false;
+
+	for (i = 0; i < ARRAY_SIZE(pci->phb->mem_resources); i++) {
+		const unsigned long mask = IORESOURCE_MEM_64 | IORESOURCE_MEM;
+
+		/* Look for MMIO32 */
+		if ((pci->phb->mem_resources[i].flags & mask) == IORESOURCE_MEM) {
+			start = pci->phb->mem_resources[i].start;
+			end = pci->phb->mem_resources[i].end;
+				break;
+		}
+	}
+
+	/* New table for using DDW instead of the default DMA window */
+	iommu_table_setparms_common(tbl, pci->phb->bus->number, create.liobn, win_addr,
+				    1UL << len, page_shift, NULL, &iommu_table_lpar_multi_ops);
+	iommu_init_table(tbl, pci->phb->node, start, end);
+
+	pci->table_group->tables[num] = tbl;
+	set_iommu_table_base(&pdev->dev, tbl);
+	pdev->dev.archdata.dma_offset = win_addr;
+
+	spin_lock(&dma_win_list_lock);
+	list_add(&window->list, &dma_win_list);
+	spin_unlock(&dma_win_list_lock);
+
+	mutex_unlock(&dma_win_init_mutex);
+
+	goto exit;
+
+remove_property:
+	of_remove_property(pdn, win64);
+free_property:
+	kfree(win64->name);
+	kfree(win64->value);
+	kfree(win64);
+remove_window:
+	__remove_dma_window(pdn, ddw_avail, create.liobn);
+
+out_failed:
+	fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
+	if (!fpdn)
+		goto out_unlock;
+	fpdn->pdn = pdn;
+	list_add(&fpdn->list, &failed_ddw_pdn_list);
+
+out_unlock:
+	mutex_unlock(&dma_win_init_mutex);
+
+	return ret;
+exit:
+	/* Allocate the userspace view */
+	pseries_tce_iommu_userspace_view_alloc(tbl);
+	tbl->it_allocated_size = spapr_tce_get_table_size(page_shift, window_size, levels);
+
 	*ptbl = iommu_tce_table_get(tbl);
+
 	return 0;
 }
 
+static bool is_default_window_table(struct iommu_table_group *table_group, struct iommu_table *tbl)
+{
+	if (((tbl->it_size << tbl->it_page_shift)  <= table_group->tce32_size) &&
+	    (tbl->it_page_shift == IOMMU_PAGE_SHIFT_4K))
+		return true;
+
+	return false;
+}
+
 static long spapr_tce_set_window(struct iommu_table_group *table_group,
 				 int num, struct iommu_table *tbl)
 {
@@ -1802,43 +2155,133 @@ static long spapr_tce_set_window(struct iommu_table_group *table_group,
 
 static long spapr_tce_unset_window(struct iommu_table_group *table_group, int num)
 {
-	return 0;
+	struct pci_dev *pdev = iommu_group_get_first_pci_dev(table_group->group);
+	struct device_node *dn = pci_device_to_OF_node(pdev), *pdn;
+	struct iommu_table *tbl = table_group->tables[num];
+	struct failed_ddw_pdn *fpdn;
+	struct dma_win *window;
+	const char *win_name;
+	int ret = -ENODEV;
+
+	mutex_lock(&dma_win_init_mutex);
+
+	if ((num == 0) && is_default_window_table(table_group, tbl))
+		win_name = "ibm,dma-window";
+	else
+		win_name = DMA64_PROPNAME;
+
+	pdn = pci_dma_find(dn, NULL);
+	if (!pdn || !PCI_DN(pdn)) { /* Niether of 32s|64-bit exist! */
+		dev_warn(&pdev->dev, "No dma-windows exist for the node %pOF\n", pdn);
+		goto out_failed;
+	}
+
+	/* Dont clear the TCEs, User should have done it */
+	if (remove_dma_window_named(pdn, true, win_name, false)) {
+		pr_err("%s: The existing DDW removal failed for node %pOF\n", __func__, pdn);
+		goto out_failed; /* Could not remove it either! */
+	}
+
+	if (strcmp(win_name, DMA64_PROPNAME) == 0) {
+		spin_lock(&dma_win_list_lock);
+		list_for_each_entry(window, &dma_win_list, list) {
+			if (window->device == pdn) {
+				list_del(&window->list);
+				kfree(window);
+				break;
+			}
+		}
+		spin_unlock(&dma_win_list_lock);
+	}
+
+	iommu_tce_table_put(table_group->tables[num]);
+	table_group->tables[num] = NULL;
+
+	ret = 0;
+
+	goto out_unlock;
+
+out_failed:
+	fpdn = kzalloc(sizeof(*fpdn), GFP_KERNEL);
+	if (!fpdn)
+		goto out_unlock;
+	fpdn->pdn = pdn;
+	list_add(&fpdn->list, &failed_ddw_pdn_list);
+
+out_unlock:
+	mutex_unlock(&dma_win_init_mutex);
+
+	return ret;
 }
 
-static long spapr_tce_take_ownership(struct iommu_table_group *table_group)
+static long spapr_tce_take_ownership(struct iommu_table_group *table_group, struct device *dev)
 {
-	int i, j, rc = 0;
+	struct iommu_table *tbl = table_group->tables[0];
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct device_node *dn = pci_device_to_OF_node(pdev);
+	struct device_node *pdn;
 
-	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i) {
-		struct iommu_table *tbl = table_group->tables[i];
+	/* SRIOV VFs using direct map by the host driver OR multifunction devices
+	 * where the ownership was taken on the attempt by the first function
+	 */
+	if (!tbl && (table_group->max_dynamic_windows_supported != 1))
+		return 0;
 
-		if (!tbl || !tbl->it_map)
-			continue;
+	mutex_lock(&dma_win_init_mutex);
 
-		rc = iommu_take_ownership(tbl);
-		if (!rc)
-			continue;
+	pdn = pci_dma_find(dn, NULL);
+	if (!pdn || !PCI_DN(pdn)) { /* Niether of 32s|64-bit exist! */
+		dev_warn(&pdev->dev, "No dma-windows exist for the node %pOF\n", pdn);
+		mutex_unlock(&dma_win_init_mutex);
+		return -1;
+	}
 
-		for (j = 0; j < i; ++j)
-			iommu_release_ownership(table_group->tables[j]);
-		return rc;
+	/*
+	 * Though rtas call reset-pe removes the DDW, it doesn't clear the entries on the table
+	 * if there are any. In case of direct map, the entries will be left over, which
+	 * is fine for PEs with 2 DMA windows where the second window is created with create-pe
+	 * at which point the table is cleared. However, on VFs having only one DMA window, the
+	 * default window would end up seeing the entries left over from the direct map done
+	 * on the second window. So, remove the ddw explicitly so that clean_dma_window()
+	 * cleans up the entries if any.
+	 */
+	if (remove_dynamic_dma_windows(pdev, pdn)) {
+		dev_warn(&pdev->dev, "The existing DDW removal failed for node %pOF\n", pdn);
+		mutex_unlock(&dma_win_init_mutex);
+		return -1;
 	}
+
+	/* The table_group->tables[0] is not null now, it must be the default window
+	 * Remove it, let the userspace create it as it needs.
+	 */
+	if (table_group->tables[0]) {
+		remove_dma_window_named(pdn, true, "ibm,dma-window", true);
+		iommu_tce_table_put(tbl);
+		table_group->tables[0] = NULL;
+	}
+	set_iommu_table_base(dev, NULL);
+
+	mutex_unlock(&dma_win_init_mutex);
+
 	return 0;
 }
 
-static void spapr_tce_release_ownership(struct iommu_table_group *table_group)
+static void spapr_tce_release_ownership(struct iommu_table_group *table_group, struct device *dev)
 {
-	int i;
+	struct iommu_table *tbl = table_group->tables[0];
 
-	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i) {
-		struct iommu_table *tbl = table_group->tables[i];
+	if (tbl) { /* Default window already restored */
+		return;
+	}
 
-		if (!tbl)
-			continue;
+	mutex_lock(&dma_win_init_mutex);
 
-		if (tbl->it_map)
-			iommu_release_ownership(tbl);
-	}
+	/* Restore the default window */
+	pseries_setup_default_iommu_config(table_group, dev);
+
+	mutex_unlock(&dma_win_init_mutex);
+
+	return;
 }
 
 static struct iommu_table_group_ops spapr_tce_table_group_ops = {
@@ -1911,8 +2354,8 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
 		 * we have to remove the property when releasing
 		 * the device node.
 		 */
-		if (remove_ddw(np, false, DIRECT64_PROPNAME))
-			remove_ddw(np, false, DMA64_PROPNAME);
+		if (remove_dma_window_named(np, false, DIRECT64_PROPNAME, true))
+			remove_dma_window_named(np, false, DMA64_PROPNAME, true);
 
 		if (pci && pci->table_group)
 			iommu_pseries_free_group(pci->table_group,


