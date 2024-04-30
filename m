Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75348B813F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 22:13:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BQwZZ0dw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTWbf3FqHz3dfy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 06:13:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BQwZZ0dw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTWZJ3tZ7z3cc5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 06:12:08 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43UK2QiH024441;
	Tue, 30 Apr 2024 20:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : from : to : cc
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=6FXreo8CnAYhBZlC6M9UfWfMe6XfuGesZXSaEiEZzD0=;
 b=BQwZZ0dwfU5toaSN21WcbtaSZThPbtfa6Gs6BaAIvhQRYOVtc6eEJRxbk1Qt16FOgZhF
 i+0RGymErp7lh6F7+SUwJNMHXD636BvopT75YYavXxgvOtqphW0V2jR4mNvgYzGysc39
 ks+MR+wQMef3+FbuayWxwqNrEsoONLbEJpXnBBlZcBfGjYlzpgX7f9CwJ0OQSX2qAeaT
 WlWbnQmar3Im9W3+fY0jg3cd/XXRKFXWPgxattn+sIZCh5+D/RfbHAG2vgncKLCDJ8VH
 ANgKJfI3QY3FJSploC1RYWLIUo9sDPGZ54laURGUM5D27uJW2kRrgV7bNzJKT6bxQMCa yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xu7aw00tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 20:11:57 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43UKBuA7006168;
	Tue, 30 Apr 2024 20:11:56 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xu7aw00tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 20:11:56 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43UK2VBG002989;
	Tue, 30 Apr 2024 20:07:07 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xscppey8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 20:07:06 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43UK71FQ52953472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Apr 2024 20:07:03 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 539522004E;
	Tue, 30 Apr 2024 20:07:01 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F5FF20043;
	Tue, 30 Apr 2024 20:06:57 +0000 (GMT)
Received: from ltcd48-lp2.aus.stglabs.ibm.com (unknown [9.3.101.175])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 30 Apr 2024 20:06:57 +0000 (GMT)
Subject: [RFC PATCH v2 6/6] powerpc/iommu: Implement the iommu_table_group_ops
 for pSeries
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: mpe@ellerman.id.au, tpearson@raptorengineering.com,
        alex.williamson@redhat.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Date: Tue, 30 Apr 2024 15:06:56 -0500
Message-ID: <171450761160.10851.2154049402123640038.stgit@linux.ibm.com>
In-Reply-To: <171450753489.10851.3056035705169121613.stgit@linux.ibm.com>
References: <171450753489.10851.3056035705169121613.stgit@linux.ibm.com>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: N34KQzt1tk6rbCvz3Cb5UyVpA6tMDC5r
X-Proofpoint-ORIG-GUID: WOV5tNjtybhozIApd_Q2R9B-VhCQiZdh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_12,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404300145
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
Cc: svaidy@linux.ibm.com, robh@kernel.org, jroedel@suse.de, sbhat@linux.ibm.com, gbatra@linux.vnet.ibm.com, jgg@ziepe.ca, aik@ozlabs.ru, linux-kernel@vger.kernel.org, mahesh@linux.ibm.com, aneesh.kumar@kernel.org, brking@linux.vnet.ibm.com, oohall@gmail.com, npiggin@gmail.com, kvm@vger.kernel.org, ruscur@russell.cc, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, msuchanek@suse.de, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PPC64 IOMMU API defines iommu_table_group_ops which handles DMA
windows for PEs, their ownership transfer, create/set/unset the TCE
tables for the Dynamic DMA wundows(DDW). VFIOS uses these APIs for
support on POWER.

The commit 9d67c9433509 "(powerpc/iommu: Add "borrowing"
iommu_table_group_ops)" implemented partial support for this API with
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

* The DMA start address for 32-bit window is 0, and for the 64-bit window
in case of PowerNV is hardcoded to TVE select (bit 59) at 512PiB offset.
And this address is returned at the time of create_table() API call(even
before the window is created), the subsequent set_window() call actually
opens the DMA window. On pSeries, the DMA start address for 32-bit
window is known from the 'ibm,dma-window' DT property. However, the
64-bit window start address is not known until the create-pe-dma RTAS
call is made. So, the create_table() which returns the DMA window start
address actually opens the DMA window and returns the DMA start address
as returned by the Hypervisor for the create-pe-dma RTAS call.

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
 arch/powerpc/platforms/pseries/iommu.c    |  643 +++++++++++++++++++++++++----
 4 files changed, 559 insertions(+), 98 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index 784809e34abe..1e0c2b2882c2 100644
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
index 31dc663be0cc..2ad1e320f69f 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1170,7 +1170,7 @@ spapr_tce_platform_iommu_attach_dev(struct iommu_domain *platform_domain,
 	 * The domain being set to PLATFORM from earlier
 	 * BLOCKED. The table_group ownership has to be released.
 	 */
-	table_group->ops->release_ownership(table_group);
+	table_group->ops->release_ownership(table_group, dev);
 	iommu_group_put(grp);
 
 	return 0;
@@ -1198,7 +1198,7 @@ spapr_tce_blocked_iommu_attach_dev(struct iommu_domain *platform_domain,
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
index e701255560a6..470a86117b03 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -23,6 +23,8 @@
 #include <linux/memory.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/of_fdt.h>
+#include <linux/libfdt.h>
 #include <linux/iommu.h>
 #include <linux/rculist.h>
 #include <asm/io.h>
@@ -54,57 +56,6 @@ enum {
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
@@ -196,7 +147,7 @@ static int tce_build_pSeries(struct iommu_table *tbl, long index,
 }
 
 
-static void tce_free_pSeries(struct iommu_table *tbl, long index, long npages)
+static void tce_clear_pSeries(struct iommu_table *tbl, long index, long npages)
 {
 	__be64 *tcep;
 
@@ -215,6 +166,37 @@ static unsigned long tce_get_pseries(struct iommu_table *tbl, long index)
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
 
@@ -629,7 +611,7 @@ struct iommu_table_ops iommu_table_lpar_multi_ops;
 
 struct iommu_table_ops iommu_table_pseries_ops = {
 	.set = tce_build_pSeries,
-	.clear = tce_free_pSeries,
+	.clear = tce_clear_pSeries,
 	.get = tce_get_pseries
 };
 
@@ -738,17 +720,45 @@ static int tce_exchange_pseries(struct iommu_table *tbl, long index, unsigned
 
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
@@ -955,7 +965,7 @@ static void __remove_dma_window(struct device_node *np, u32 *ddw_avail, u64 liob
 }
 
 static void remove_dma_window(struct device_node *np, u32 *ddw_avail,
-			      struct property *win)
+			      struct property *win, bool cleanup)
 {
 	struct dynamic_dma_window_prop *dwp;
 	u64 liobn;
@@ -963,11 +973,13 @@ static void remove_dma_window(struct device_node *np, u32 *ddw_avail,
 	dwp = win->value;
 	liobn = (u64)be32_to_cpu(dwp->liobn);
 
-	clean_dma_window(np, dwp);
+	if (cleanup)
+		clean_dma_window(np, dwp);
 	__remove_dma_window(np, ddw_avail, liobn);
 }
 
-static int remove_ddw(struct device_node *np, bool remove_prop, const char *win_name)
+static int remove_dma_window_named(struct device_node *np, bool remove_prop, const char *win_name,
+				   bool cleanup)
 {
 	struct property *win;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
@@ -982,9 +994,8 @@ static int remove_ddw(struct device_node *np, bool remove_prop, const char *win_
 	if (ret)
 		return 0;
 
-
 	if (win->length >= sizeof(struct dynamic_dma_window_prop))
-		remove_dma_window(np, ddw_avail, win);
+		remove_dma_window(np, ddw_avail, win, cleanup);
 
 	if (!remove_prop)
 		return 0;
@@ -1046,7 +1057,7 @@ static void find_existing_ddw_windows_named(const char *name)
 	for_each_node_with_property(pdn, name) {
 		dma64 = of_get_property(pdn, name, &len);
 		if (!dma64 || len < sizeof(*dma64)) {
-			remove_ddw(pdn, true, name);
+			remove_dma_window_named(pdn, true, name, true);
 			continue;
 		}
 
@@ -1423,7 +1434,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		if (reset_win_ext)
 			goto out_failed;
 
-		remove_dma_window(pdn, ddw_avail, default_win);
+		remove_dma_window(pdn, ddw_avail, default_win, true);
 		default_win_removed = true;
 
 		/* Query again, to check if the window is available */
@@ -1768,24 +1779,380 @@ static unsigned long spapr_tce_get_table_size(__u32 page_shift,
 	return size;
 }
 
+/*
+ * The default window property always exists on the FDT, only during the kexec/kdump
+ * load its removed to match the DT actuals. So, its safe to fetch from FDT.
+ */
+static struct property *default_window_property_create(struct device_node *pdn)
+{
+	const void *fdt = initial_boot_params;
+	int fdt_root_offset, node_offset;
+	struct property *win;
+	const void *fdtprop;
+	int length;
+
+	fdt_root_offset = fdt_path_offset(fdt, "/");
+	node_offset = fdt_subnode_offset(fdt, fdt_root_offset, of_node_full_name(pdn));
+	if (node_offset < 0) {
+		pr_err("Failed to get the node %pOF from fdt\n", pdn);
+		return NULL;
+	}
+
+	fdtprop = fdt_getprop(fdt, node_offset, "ibm,dma-window", &length);
+	if (!length) {
+		pr_err("%pOF: Failed to get the ibm,dma-window property\n", pdn);
+		return NULL;
+	}
+
+	win = kzalloc(sizeof(struct property), GFP_KERNEL);
+	if (!win)
+		return NULL;
+
+	win->name = kstrdup("ibm,dma-window", GFP_KERNEL);
+	win->length = length;
+	win->value = kmemdup(fdtprop, length, GFP_KERNEL);
+	if (!win->value) {
+		kfree(win);
+		return NULL;
+	}
+
+	return win;
+}
+
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
+	struct property *def_win;
+	int ret;
+
+	reset_dma_window(pdev, pdn);
+
+	/* Restore the DT property from the FDT */
+	def_win = default_window_property_create(pdn);
+	if (!def_win)
+		return;
+	ret = of_add_property(pdn, def_win);
+	if (ret)
+		dev_err(&pdev->dev, "unable to add DMA window property for %pOF: %d",
+			pdn, ret);
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
+	unsigned int entries_shift;
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
+	entries_shift = window_shift - page_shift;
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
+		dump_stack();
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
@@ -1794,43 +2161,135 @@ static long spapr_tce_set_window(struct iommu_table_group *table_group,
 
 static long spapr_tce_unset_window(struct iommu_table_group *table_group, int num)
 {
-	return 0;
+	struct pci_dev *pdev = iommu_group_get_first_pci_dev(table_group->group);
+	struct device_node *dn = pci_device_to_OF_node(pdev), *pdn;
+	struct iommu_table *tbl = table_group->tables[num];
+	struct failed_ddw_pdn *fpdn;
+	struct dma_win *window;
+	const char *win_name;
+	struct pci_dn *pci;
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
+	pci = PCI_DN(pdn);
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
+
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
+	}
 
-		for (j = 0; j < i; ++j)
-			iommu_release_ownership(table_group->tables[j]);
-		return rc;
+	/* The table_group->tables[0] is not null now, it must be the default window
+	 * Remove it, let the userspace create it as it needs.
+	 */
+	if (table_group->tables[0]) {
+		remove_dma_window_named(pdn, true, "ibm,dma-window", true);
+		iommu_tce_table_put(tbl);
+		table_group->tables[0] = NULL;
 	}
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
 
 struct iommu_table_group_ops spapr_tce_table_group_ops = {
@@ -1903,8 +2362,8 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
 		 * we have to remove the property when releasing
 		 * the device node.
 		 */
-		if (remove_ddw(np, false, DIRECT64_PROPNAME))
-			remove_ddw(np, false, DMA64_PROPNAME);
+		if (remove_dma_window_named(np, false, DIRECT64_PROPNAME, true))
+			remove_dma_window_named(np, false, DMA64_PROPNAME, true);
 
 		if (pci && pci->table_group)
 			iommu_pseries_free_group(pci->table_group,


