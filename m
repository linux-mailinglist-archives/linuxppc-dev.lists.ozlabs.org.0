Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E24879B29
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 19:17:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YuXtDlQj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvMLQ6x7Sz3vcf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 05:17:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YuXtDlQj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvMHs64hzz3vX8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 05:15:05 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42CI2Fq9012214;
	Tue, 12 Mar 2024 18:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : from : to : cc
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Qpe8OHrLllath+SBvB0Y7CkJtrx77IztT4zCArdCnRI=;
 b=YuXtDlQjycRKcw63w61kY0tB4xI7DDbswodzhXrWJVD964HLpuoHF1V0EIEAatBoqVT+
 mP/od+nKrcnWpT6gZgjl/O68Sfumu2+grjWYT5kb5OcJPWP1aHs/zQOxi+Ri/xzJ+68Q
 VtbDcnE8Z8auevoKoiabcmijSl2Wdoq3goV0pgQO/VpWPx9i4PKOHXRBs3Qq8R5IRDJn
 ZMPca4oMFB0EUEUAPW1vOIGRiFRRtB/wk8QaQa5WWqGfwWr1KV2Fkwt8EDh8afwT6XG+
 O4l6xHw30ruK0q5GUFcEv1hh5QTnugpEWT8r+p9RtFhk12zB6MUUlOZUeY2Ae1dhSaBK 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wtuyj06kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 18:14:55 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42CI2FVr012225;
	Tue, 12 Mar 2024 18:14:54 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wtuyj06km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 18:14:54 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42CH0W8C018543;
	Tue, 12 Mar 2024 18:14:53 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ws4t208y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 18:14:53 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42CIEmCp40304968
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Mar 2024 18:14:50 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E2032004B;
	Tue, 12 Mar 2024 18:14:48 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD3AD20040;
	Tue, 12 Mar 2024 18:14:44 +0000 (GMT)
Received: from ltcd48-lp2.aus.stglabs.ibm.com (unknown [9.3.101.175])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Mar 2024 18:14:44 +0000 (GMT)
Subject: [RFC PATCH 3/3] pseries/iommu: Enable DDW for VFIO TCE create
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: tpearson@raptorengineering.com, alex.williamson@redhat.com,
        linuxppc-dev@lists.ozlabs.org
Date: Tue, 12 Mar 2024 13:14:44 -0500
Message-ID: <171026728072.8367.13581504605624115205.stgit@linux.ibm.com>
In-Reply-To: <171026724548.8367.8321359354119254395.stgit@linux.ibm.com>
References: <171026724548.8367.8321359354119254395.stgit@linux.ibm.com>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kRujcfDp-OtMsLWIsKbVrWo8iIV8o-b-
X-Proofpoint-ORIG-GUID: eOk7-MbDjtchGKZni5cMFFbyB5H_9r6P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_11,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403120138
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
Cc: robh@kernel.org, jroedel@suse.de, sbhat@linux.ibm.com, gbatra@linux.vnet.ibm.com, jgg@ziepe.ca, aik@ozlabs.ru, linux-kernel@vger.kernel.org, svaidy@linux.ibm.com, aneesh.kumar@kernel.org, brking@linux.vnet.ibm.com, npiggin@gmail.com, kvm@vger.kernel.org, naveen.n.rao@linux.ibm.com, vaibhav@linux.ibm.com, msuchanek@suse.de, aik@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The commit 9d67c9433509 ("powerpc/iommu: Add \"borrowing\"
iommu_table_group_ops") implemented the "borrow" mechanism for
the pSeries SPAPR TCE. It did implement this support partially
that it left out creating the DDW if not present already.

The patch here attempts to fix the missing gaps.
 - Expose the DDW info to user by collecting it during probe.
 - Create the window and the iommu table if not present during
   VFIO_SPAPR_TCE_CREATE.
 - Remove and recreate the window if the pageshift and window sizes
   do not match.
 - Restore the original window in enable_ddw() if the user had
   created/modified the DDW. As there is preference for DIRECT mapping
   on the host driver side, the user created window is removed.

The changes work only for the non-SRIOV-VF scenarios for PEs having
2 DMA windows.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 arch/powerpc/include/asm/iommu.h       |    3 
 arch/powerpc/kernel/iommu.c            |    7 -
 arch/powerpc/platforms/pseries/iommu.c |  362 +++++++++++++++++++++++++++++++-
 3 files changed, 360 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index 744cc5fc22d3..fde174122844 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -110,6 +110,7 @@ struct iommu_table {
 	unsigned long  it_page_shift;/* table iommu page size */
 	struct list_head it_group_list;/* List of iommu_table_group_link */
 	__be64 *it_userspace; /* userspace view of the table */
+	bool reset_ddw;
 	struct iommu_table_ops *it_ops;
 	struct kref    it_kref;
 	int it_nid;
@@ -169,6 +170,8 @@ struct iommu_table_group_ops {
 			__u32 page_shift,
 			__u64 window_size,
 			__u32 levels);
+	void (*init_group)(struct iommu_table_group *table_group,
+			struct device *dev);
 	long (*create_table)(struct iommu_table_group *table_group,
 			int num,
 			__u32 page_shift,
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index aa11b2acf24f..1cce2b8b8f2c 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -740,6 +740,7 @@ struct iommu_table *iommu_init_table(struct iommu_table *tbl, int nid,
 		return NULL;
 	}
 
+	tbl->it_nid = nid;
 	iommu_table_reserve_pages(tbl, res_start, res_end);
 
 	/* We only split the IOMMU table if we have 1GB or more of space */
@@ -1141,7 +1142,10 @@ spapr_tce_platform_iommu_attach_dev(struct iommu_domain *platform_domain,
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct iommu_group *grp = iommu_group_get(dev);
-	struct iommu_table_group *table_group;
+	struct iommu_table_group *table_group = iommu_group_get_iommudata(grp);
+
+	/* This should have been in spapr_tce_iommu_probe_device() ?*/
+	table_group->ops->init_group(table_group, dev);
 
 	/* At first attach the ownership is already set */
 	if (!domain) {
@@ -1149,7 +1153,6 @@ spapr_tce_platform_iommu_attach_dev(struct iommu_domain *platform_domain,
 		return 0;
 	}
 
-	table_group = iommu_group_get_iommudata(grp);
 	/*
 	 * The domain being set to PLATFORM from earlier
 	 * BLOCKED. The table_group ownership has to be released.
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 3d9865dadf73..7224107a0f60 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -630,6 +630,62 @@ static void iommu_table_setparms(struct pci_controller *phb,
 	phb->dma_window_base_cur += phb->dma_window_size;
 }
 
+static int iommu_table_reset(struct iommu_table *tbl, unsigned long busno,
+				   unsigned long liobn, unsigned long win_addr,
+				   unsigned long window_size, unsigned long page_shift,
+				   void *base, struct iommu_table_ops *table_ops)
+{
+	unsigned long sz = BITS_TO_LONGS(tbl->it_size) * sizeof(unsigned long);
+	unsigned int i, oldsize = tbl->it_size;
+	struct iommu_pool *p;
+
+	WARN_ON(!tbl->it_ops);
+
+	if (oldsize != (window_size >> page_shift)) {
+		vfree(tbl->it_map);
+
+		tbl->it_map = vzalloc_node(sz, tbl->it_nid);
+		if (!tbl->it_map)
+			return -ENOMEM;
+
+		tbl->it_size = window_size >> page_shift;
+		if (oldsize < (window_size >> page_shift))
+			iommu_table_clear(tbl);
+	}
+	tbl->it_busno = busno;
+	tbl->it_index = liobn;
+	tbl->it_offset = win_addr >> page_shift;
+	tbl->it_blocksize = 16;
+	tbl->it_type = TCE_PCI;
+	tbl->it_ops = table_ops;
+	tbl->it_page_shift = page_shift;
+	tbl->it_base = (unsigned long)base;
+
+	if ((tbl->it_size << tbl->it_page_shift) >= (1UL * 1024 * 1024 * 1024))
+		tbl->nr_pools = IOMMU_NR_POOLS;
+	else
+		tbl->nr_pools = 1;
+
+	tbl->poolsize = (tbl->it_size * 3 / 4) / tbl->nr_pools;
+
+	for (i = 0; i < tbl->nr_pools; i++) {
+		p = &tbl->pools[i];
+		spin_lock_init(&(p->lock));
+		p->start = tbl->poolsize * i;
+		p->hint = p->start;
+		p->end = p->start + tbl->poolsize;
+	}
+
+	p = &tbl->large_pool;
+	spin_lock_init(&(p->lock));
+	p->start = tbl->poolsize * i;
+	p->hint = p->start;
+	p->end = tbl->it_size;
+	return 0;
+}
+
+
+
 struct iommu_table_ops iommu_table_lpar_multi_ops;
 
 struct iommu_table_ops iommu_table_pseries_ops = {
@@ -1016,8 +1072,8 @@ static int remove_ddw(struct device_node *np, bool remove_prop, const char *win_
 	return 0;
 }
 
-static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, int *window_shift,
-			      bool *direct_mapping)
+static bool find_existing_ddw(struct device_node *pdn, u32 *liobn, u64 *dma_addr,
+			      int *window_shift, bool *direct_mapping)
 {
 	struct dma_win *window;
 	const struct dynamic_dma_window_prop *dma64;
@@ -1031,6 +1087,7 @@ static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr, int *windo
 			*dma_addr = be64_to_cpu(dma64->dma_base);
 			*window_shift = be32_to_cpu(dma64->window_shift);
 			*direct_mapping = window->direct;
+			*liobn = be32_to_cpu(dma64->liobn);
 			found = true;
 			break;
 		}
@@ -1315,6 +1372,23 @@ static int iommu_get_page_shift(u32 query_page_size)
 	return ret;
 }
 
+static __u64 query_page_size_to_mask(u32 query_page_size)
+{
+	const long shift[] = {
+		(SZ_4K),   (SZ_64K), (SZ_16M),
+		(SZ_32M),  (SZ_64M), (SZ_128M),
+		(SZ_256M), (SZ_16G), (SZ_2M)
+	};
+	int i, ret = 0;
+
+	for (i = 0; i < ARRAY_SIZE(shift); i++) {
+		if (query_page_size & (1 << i))
+			ret |= shift[i];
+	}
+
+	return ret;
+}
+
 static struct property *ddw_property_create(const char *propname, u32 liobn, u64 dma_addr,
 					    u32 page_shift, u32 window_shift)
 {
@@ -1344,6 +1418,9 @@ static struct property *ddw_property_create(const char *propname, u32 liobn, u64
 	return win64;
 }
 
+static long remove_dynamic_dma_windows_locked(struct iommu_table_group *table_group,
+					      struct pci_dev *pdev);
+
 /*
  * If the PE supports dynamic dma windows, and there is space for a table
  * that can map all pages in a linear offset, then setup such a table,
@@ -1373,6 +1450,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	bool pmem_present;
 	struct pci_dn *pci = PCI_DN(pdn);
 	struct property *default_win = NULL;
+	u32 liobn;
 
 	dn = of_find_node_by_type(NULL, "ibm,pmemory");
 	pmem_present = dn != NULL;
@@ -1380,8 +1458,19 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 	mutex_lock(&dma_win_init_mutex);
 
-	if (find_existing_ddw(pdn, &dev->dev.archdata.dma_offset, &len, &direct_mapping))
-		goto out_unlock;
+	if (find_existing_ddw(pdn, &liobn, &dev->dev.archdata.dma_offset, &len, &direct_mapping)) {
+		struct iommu_table *tbl = pci->table_group->tables[1];
+
+		if (direct_mapping || (tbl && !tbl->reset_ddw))
+			goto out_unlock;
+		/* VFIO user created window has custom size/pageshift */
+		if (remove_dynamic_dma_windows_locked(pci->table_group, dev))
+			goto out_failed;
+
+		iommu_tce_table_put(tbl);
+		pci->table_group->tables[1] = NULL;
+		set_iommu_table_base(&dev->dev, pci->table_group->tables[0]);
+	}
 
 	/*
 	 * If we already went through this for a previous function of
@@ -1726,20 +1815,272 @@ static unsigned long spapr_tce_get_table_size(__u32 page_shift,
 	return size;
 }
 
+static void spapr_tce_init_group(struct iommu_table_group *table_group, struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct device_node *dn, *pdn;
+	u32 ddw_avail[DDW_APPLICABLE_SIZE];
+	struct ddw_query_response query;
+	int ret;
+
+	if (table_group->max_dynamic_windows_supported > 0)
+		return;
+
+	/* No need to insitialize for kdump kernel. */
+	if (is_kdump_kernel())
+		return;
+
+	dn = pci_device_to_OF_node(pdev);
+	pdn = pci_dma_find(dn, NULL);
+	if (!pdn || !PCI_DN(pdn)) {
+		table_group->max_dynamic_windows_supported = -1;
+		return;
+	}
+
+	/* TODO: Phyp sets VF default window base at 512PiB offset. Need
+	 * tce32_base set to the global offset and use the start as 0?
+	 */
+	ret = of_property_read_u32_array(pdn, "ibm,ddw-applicable",
+			&ddw_avail[0], DDW_APPLICABLE_SIZE);
+	if (ret) {
+		table_group->max_dynamic_windows_supported = -1;
+		return;
+	}
+
+	ret = query_ddw(pdev, ddw_avail, &query, pdn);
+	if (ret) {
+		dev_err(&pdev->dev, "%s: query_ddw failed\n", __func__);
+		table_group->max_dynamic_windows_supported = -1;
+		return;
+	}
+
+	/* The SRIOV VFs have only 1 window, the default is removed
+	 * before creating the 64-bit window
+	 */
+	if (query.windows_available == 0)
+		table_group->max_dynamic_windows_supported = 1;
+	else
+		table_group->max_dynamic_windows_supported = 2;
+
+	table_group->max_levels = 1;
+	table_group->pgsizes |= query_page_size_to_mask(query.page_size);
+}
+
+
+static long remove_dynamic_dma_windows_locked(struct iommu_table_group *table_group,
+					      struct pci_dev *pdev)
+{
+	struct device_node *dn = pci_device_to_OF_node(pdev), *pdn;
+	bool direct_mapping;
+	struct dma_win *window;
+	u32 liobn;
+	int len;
+
+	pdn = pci_dma_find(dn, NULL);
+	if (!pdn || !PCI_DN(pdn)) { // Niether of 32s|64-bit exist!
+		return -ENODEV;
+	}
+
+	if (find_existing_ddw(pdn, &liobn, &pdev->dev.archdata.dma_offset, &len, &direct_mapping)) {
+		remove_ddw(pdn, true, direct_mapping ? DIRECT64_PROPNAME : DMA64_PROPNAME);
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
+static int dev_has_iommu_table(struct device *dev, void *data)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct pci_dev **ppdev = data;
+
+	if (!dev)
+		return 0;
+
+	if (device_iommu_mapped(dev)) {
+		*ppdev = pdev;
+		return 1;
+	}
+
+	return 0;
+}
+
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
 static long spapr_tce_create_table(struct iommu_table_group *table_group, int num,
 				   __u32 page_shift, __u64 window_size, __u32 levels,
 				   struct iommu_table **ptbl)
 {
-	struct iommu_table *tbl = table_group->tables[0];
+	struct pci_dev *pdev = iommu_group_get_first_pci_dev(table_group->group);
+	struct device_node *dn = pci_device_to_OF_node(pdev), *pdn;
+	struct iommu_table *tbl = table_group->tables[num];
+	u32 window_shift = order_base_2(window_size);
+	u32 ddw_avail[DDW_APPLICABLE_SIZE];
+	struct ddw_create_response create;
+	struct ddw_query_response query;
+	unsigned long start = 0, end = 0;
+	struct failed_ddw_pdn *fpdn;
+	struct dma_win *window;
+	struct property *win64;
+	struct pci_dn *pci;
+	int len, ret = 0;
+	u64 win_addr;
 
-	if (num > 0)
+	if (num > 1)
 		return -EPERM;
 
-	if (tbl->it_page_shift != page_shift ||
-	    tbl->it_size != (window_size >> page_shift) ||
-	    tbl->it_indirect_levels != levels - 1)
-		return -EINVAL;
+	if (tbl && (tbl->it_page_shift == page_shift) &&
+		(tbl->it_size == (window_size >> page_shift)) &&
+		(tbl->it_indirect_levels == levels - 1))
+		goto exit;
+
+	if (num == 0)
+		return -EINVAL; /* Can't modify the default window. */
+
+	/* TODO: The SRIO-VFs have only 1 window. */
+	if (table_group->max_dynamic_windows_supported == 1)
+		return -EPERM;
+
+	mutex_lock(&dma_win_init_mutex);
+
+	ret = -ENODEV;
+	/* If the enable DDW failed for the pdn, dont retry! */
+	list_for_each_entry(fpdn, &failed_ddw_pdn_list, list) {
+		if (fpdn->pdn == pdn) {
+			pr_err("%s: %pOF in failed DDW device list\n", __func__, pdn);
+			goto out_unlock;
+		}
+	}
+
+	pdn = pci_dma_find(dn, NULL);
+	if (!pdn || !PCI_DN(pdn)) { /* Niether of 32s|64-bit exist! */
+		pr_err("%s: No dma-windows exist for the node %pOF\n", __func__, pdn);
+		goto out_failed;
+	}
+
+	/* The existing ddw didn't match the size/shift */
+	if (remove_dynamic_dma_windows_locked(table_group, pdev)) {
+		pr_err("%s: The existing DDW remova failed for node %pOF\n", __func__, pdn);
+		goto out_failed; /* Could not remove it either! */
+	}
+
+	pci = PCI_DN(pdn);
+	ret = of_property_read_u32_array(pdn, "ibm,ddw-applicable",
+				&ddw_avail[0], DDW_APPLICABLE_SIZE);
+	if (ret) {
+		pr_err("%s: ibm,ddw-applicable not found\n", __func__);
+		goto out_failed;
+	}
+
+	ret = query_ddw(pdev, ddw_avail, &query, pdn);
+	if (ret)
+		goto out_failed;
+	ret = -ENODEV;
 
+	len = window_shift;
+	if (query.largest_available_block < (1ULL << (len - page_shift))) {
+		dev_dbg(&pdev->dev, "can't map window 0x%llx with %llu %llu-sized pages\n",
+				1ULL << len, query.largest_available_block,
+				1ULL << page_shift);
+		ret = -EINVAL; /* Retry with smaller window size */
+		goto out_unlock;
+	}
+
+	if (create_ddw(pdev, ddw_avail, &create, page_shift, len))
+		goto out_failed;
+
+	win_addr = ((u64)create.addr_hi << 32) | create.addr_lo;
+	win64 = ddw_property_create(DMA64_PROPNAME, create.liobn, win_addr, page_shift, len);
+	if (!win64)
+		goto remove_window;
+
+	ret = of_add_property(pdn, win64);
+	if (ret) {
+		dev_err(&pdev->dev, "unable to add DMA window property for %pOF: %d",
+			pdn, ret);
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
+	if (tbl) {
+		iommu_table_reset(tbl, pci->phb->bus->number, create.liobn, win_addr,
+				  1UL << len, page_shift, NULL, &iommu_table_lpar_multi_ops);
+	} else {
+		tbl = iommu_pseries_alloc_table(pci->phb->node);
+		if (!tbl) {
+			dev_err(&pdev->dev, "couldn't create new IOMMU table\n");
+			goto free_window;
+		}
+		iommu_table_setparms_common(tbl, pci->phb->bus->number, create.liobn, win_addr,
+					    1UL << len, page_shift, NULL,
+					    &iommu_table_lpar_multi_ops);
+		iommu_init_table(tbl, pci->phb->node, start, end);
+	}
+
+	tbl->reset_ddw = true;
+	pci->table_group->tables[1] = tbl;
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
+free_window:
+	kfree(window);
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
 	*ptbl = iommu_tce_table_get(tbl);
 	return 0;
 }
@@ -1795,6 +2136,7 @@ static void spapr_tce_release_ownership(struct iommu_table_group *table_group)
 struct iommu_table_group_ops spapr_tce_table_group_ops = {
 	.get_table_size = spapr_tce_get_table_size,
 	.create_table = spapr_tce_create_table,
+	.init_group = spapr_tce_init_group,
 	.set_window = spapr_tce_set_window,
 	.unset_window = spapr_tce_unset_window,
 	.take_ownership = spapr_tce_take_ownership,


