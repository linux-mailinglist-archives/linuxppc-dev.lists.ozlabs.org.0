Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E32914A52
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 14:39:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MrTM76nk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W76wz2Kkdz3cbB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 22:39:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MrTM76nk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W76vs1jcZz3cYh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 22:38:48 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OBx3tg018393;
	Mon, 24 Jun 2024 12:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	subject:from:to:cc:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=pp1; bh=
	cGNDuTfYQKiJFkzABJPhR0g/ZtUL2dSZtJVYo1Dzriw=; b=MrTM76nkBoPteJb9
	nfuaKxmZy0l//+cSakAcsoYlr5lTQhSPlQtmxuHgXiTzn2/O0Ouxkg7vVMqFihXO
	iL6PgQTH+6rBMvajUGOyt1puNs3bO8uY5aGSPdkMcQSrmnZ/YV6Q20i8mYvSQty2
	54TsSwYN9czDSGoQ5j23PCUqCsqCvjxTS6GjPJJ1o6TxCTDv6BNzeodM2pnN5L74
	dxhGTIbr/16uzrn+mgriNGGwWCub2LnV15apBAeEVLlmUfkehofzZIxtl2se0oKr
	U3bkxs/a01HkwGW5npEz5LWr2iSQaT/tRGFKuWUzH6gFNSDVjc5+Vhm+OF8yG+6y
	6Xc1Og==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yy8d204fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 12:38:33 +0000 (GMT)
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45OCcXSG030627;
	Mon, 24 Jun 2024 12:38:33 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yy8d204ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 12:38:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45OAeZP6019984;
	Mon, 24 Jun 2024 12:38:32 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yxb5m8et8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 12:38:31 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45OCcQ2m56361464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jun 2024 12:38:28 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 38C4B20040;
	Mon, 24 Jun 2024 12:38:26 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 958D220043;
	Mon, 24 Jun 2024 12:38:22 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.3.101.175])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Jun 2024 12:38:22 +0000 (GMT)
Subject: [PATCH v4 1/6] powerpc/iommu: Move pSeries specific functions to
 pseries/iommu.c
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: mpe@ellerman.id.au, tpearson@raptorengineering.com,
        alex.williamson@redhat.com, linuxppc-dev@lists.ozlabs.org, aik@amd.com
Date: Mon, 24 Jun 2024 12:38:21 +0000
Message-ID: <171923269701.1397.15758640002786937132.stgit@linux.ibm.com>
In-Reply-To: <171923268781.1397.8871195514893204050.stgit@linux.ibm.com>
References: <171923268781.1397.8871195514893204050.stgit@linux.ibm.com>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Hzm6CQ-vk8ro9cWo1Y20sXqJxemiL82-
X-Proofpoint-GUID: nHg8wieqzgx0jNvG_L78V0Dnfy4rgaeV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_09,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The PowerNV specific table_group_ops are defined in powernv/pci-ioda.c.
The pSeries specific table_group_ops are sitting in the generic powerpc
file. Move it to where it actually belong(pseries/iommu.c).

The functions are currently defined even for CONFIG_PPC_POWERNV
which are unused on PowerNV.

Only code movement, no functional changes intended.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 arch/powerpc/include/asm/iommu.h       |    4 +
 arch/powerpc/kernel/iommu.c            |  149 --------------------------------
 arch/powerpc/platforms/pseries/iommu.c |  144 +++++++++++++++++++++++++++++++
 3 files changed, 149 insertions(+), 148 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index 026695943550..744cc5fc22d3 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -156,6 +156,9 @@ extern int iommu_tce_table_put(struct iommu_table *tbl);
 extern struct iommu_table *iommu_init_table(struct iommu_table *tbl,
 		int nid, unsigned long res_start, unsigned long res_end);
 bool iommu_table_in_use(struct iommu_table *tbl);
+extern void iommu_table_reserve_pages(struct iommu_table *tbl,
+		unsigned long res_start, unsigned long res_end);
+extern void iommu_table_clear(struct iommu_table *tbl);
 
 #define IOMMU_TABLE_GROUP_MAX_TABLES	2
 
@@ -218,7 +221,6 @@ extern long iommu_tce_xchg_no_kill(struct mm_struct *mm,
 extern void iommu_tce_kill(struct iommu_table *tbl,
 		unsigned long entry, unsigned long pages);
 
-extern struct iommu_table_group_ops spapr_tce_table_group_ops;
 #else
 static inline void iommu_register_group(struct iommu_table_group *table_group,
 					int pci_domain_number,
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index b70b4f93561f..b5febc6c7a5e 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -643,7 +643,7 @@ void ppc_iommu_unmap_sg(struct iommu_table *tbl, struct scatterlist *sglist,
 		tbl->it_ops->flush(tbl);
 }
 
-static void iommu_table_clear(struct iommu_table *tbl)
+void iommu_table_clear(struct iommu_table *tbl)
 {
 	/*
 	 * In case of firmware assisted dump system goes through clean
@@ -684,7 +684,7 @@ static void iommu_table_clear(struct iommu_table *tbl)
 #endif
 }
 
-static void iommu_table_reserve_pages(struct iommu_table *tbl,
+void iommu_table_reserve_pages(struct iommu_table *tbl,
 		unsigned long res_start, unsigned long res_end)
 {
 	int i;
@@ -1102,59 +1102,6 @@ void iommu_tce_kill(struct iommu_table *tbl,
 }
 EXPORT_SYMBOL_GPL(iommu_tce_kill);
 
-#if defined(CONFIG_PPC_PSERIES) || defined(CONFIG_PPC_POWERNV)
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
-#endif
-
 int iommu_add_device(struct iommu_table_group *table_group, struct device *dev)
 {
 	/*
@@ -1186,98 +1133,6 @@ int iommu_add_device(struct iommu_table_group *table_group, struct device *dev)
 EXPORT_SYMBOL_GPL(iommu_add_device);
 
 #if defined(CONFIG_PPC_PSERIES) || defined(CONFIG_PPC_POWERNV)
-/*
- * A simple iommu_table_group_ops which only allows reusing the existing
- * iommu_table. This handles VFIO for POWER7 or the nested KVM.
- * The ops does not allow creating windows and only allows reusing the existing
- * one if it matches table_group->tce32_start/tce32_size/page_shift.
- */
-static unsigned long spapr_tce_get_table_size(__u32 page_shift,
-					      __u64 window_size, __u32 levels)
-{
-	unsigned long size;
-
-	if (levels > 1)
-		return ~0U;
-	size = window_size >> (page_shift - 3);
-	return size;
-}
-
-static long spapr_tce_create_table(struct iommu_table_group *table_group, int num,
-				   __u32 page_shift, __u64 window_size, __u32 levels,
-				   struct iommu_table **ptbl)
-{
-	struct iommu_table *tbl = table_group->tables[0];
-
-	if (num > 0)
-		return -EPERM;
-
-	if (tbl->it_page_shift != page_shift ||
-	    tbl->it_size != (window_size >> page_shift) ||
-	    tbl->it_indirect_levels != levels - 1)
-		return -EINVAL;
-
-	*ptbl = iommu_tce_table_get(tbl);
-	return 0;
-}
-
-static long spapr_tce_set_window(struct iommu_table_group *table_group,
-				 int num, struct iommu_table *tbl)
-{
-	return tbl == table_group->tables[num] ? 0 : -EPERM;
-}
-
-static long spapr_tce_unset_window(struct iommu_table_group *table_group, int num)
-{
-	return 0;
-}
-
-static long spapr_tce_take_ownership(struct iommu_table_group *table_group)
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
-		if (!rc)
-			continue;
-
-		for (j = 0; j < i; ++j)
-			iommu_release_ownership(table_group->tables[j]);
-		return rc;
-	}
-	return 0;
-}
-
-static void spapr_tce_release_ownership(struct iommu_table_group *table_group)
-{
-	int i;
-
-	for (i = 0; i < IOMMU_TABLE_GROUP_MAX_TABLES; ++i) {
-		struct iommu_table *tbl = table_group->tables[i];
-
-		if (!tbl)
-			continue;
-
-		iommu_table_clear(tbl);
-		if (tbl->it_map)
-			iommu_release_ownership(tbl);
-	}
-}
-
-struct iommu_table_group_ops spapr_tce_table_group_ops = {
-	.get_table_size = spapr_tce_get_table_size,
-	.create_table = spapr_tce_create_table,
-	.set_window = spapr_tce_set_window,
-	.unset_window = spapr_tce_unset_window,
-	.take_ownership = spapr_tce_take_ownership,
-	.release_ownership = spapr_tce_release_ownership,
-};
-
 /*
  * A simple iommu_ops to allow less cruft in generic VFIO code.
  */
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index b1e6d275cda9..bbe7eaacd829 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -54,6 +54,57 @@ enum {
 	DDW_EXT_QUERY_OUT_SIZE = 2
 };
 
+static int iommu_take_ownership(struct iommu_table *tbl)
+{
+	unsigned long flags, i, sz = (tbl->it_size + 7) >> 3;
+	int ret = 0;
+
+	/*
+	 * VFIO does not control TCE entries allocation and the guest
+	 * can write new TCEs on top of existing ones so iommu_tce_build()
+	 * must be able to release old pages. This functionality
+	 * requires exchange() callback defined so if it is not
+	 * implemented, we disallow taking ownership over the table.
+	 */
+	if (!tbl->it_ops->xchg_no_kill)
+		return -EINVAL;
+
+	spin_lock_irqsave(&tbl->large_pool.lock, flags);
+	for (i = 0; i < tbl->nr_pools; i++)
+		spin_lock_nest_lock(&tbl->pools[i].lock, &tbl->large_pool.lock);
+
+	if (iommu_table_in_use(tbl)) {
+		pr_err("iommu_tce: it_map is not empty");
+		ret = -EBUSY;
+	} else {
+		memset(tbl->it_map, 0xff, sz);
+	}
+
+	for (i = 0; i < tbl->nr_pools; i++)
+		spin_unlock(&tbl->pools[i].lock);
+	spin_unlock_irqrestore(&tbl->large_pool.lock, flags);
+
+	return ret;
+}
+
+static void iommu_release_ownership(struct iommu_table *tbl)
+{
+	unsigned long flags, i, sz = (tbl->it_size + 7) >> 3;
+
+	spin_lock_irqsave(&tbl->large_pool.lock, flags);
+	for (i = 0; i < tbl->nr_pools; i++)
+		spin_lock_nest_lock(&tbl->pools[i].lock, &tbl->large_pool.lock);
+
+	memset(tbl->it_map, 0, sz);
+
+	iommu_table_reserve_pages(tbl, tbl->it_reserved_start,
+			tbl->it_reserved_end);
+
+	for (i = 0; i < tbl->nr_pools; i++)
+		spin_unlock(&tbl->pools[i].lock);
+	spin_unlock_irqrestore(&tbl->large_pool.lock, flags);
+}
+
 static struct iommu_table *iommu_pseries_alloc_table(int node)
 {
 	struct iommu_table *tbl;
@@ -67,6 +118,8 @@ static struct iommu_table *iommu_pseries_alloc_table(int node)
 	return tbl;
 }
 
+static struct iommu_table_group_ops spapr_tce_table_group_ops;
+
 static struct iommu_table_group *iommu_pseries_alloc_group(int node)
 {
 	struct iommu_table_group *table_group;
@@ -1651,6 +1704,97 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
 	return false;
 }
 
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
+static long spapr_tce_create_table(struct iommu_table_group *table_group, int num,
+				   __u32 page_shift, __u64 window_size, __u32 levels,
+				   struct iommu_table **ptbl)
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
+				 int num, struct iommu_table *tbl)
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
+
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
+		if (tbl->it_map)
+			iommu_release_ownership(tbl);
+	}
+}
+
+static struct iommu_table_group_ops spapr_tce_table_group_ops = {
+	.get_table_size = spapr_tce_get_table_size,
+	.create_table = spapr_tce_create_table,
+	.set_window = spapr_tce_set_window,
+	.unset_window = spapr_tce_unset_window,
+	.take_ownership = spapr_tce_take_ownership,
+	.release_ownership = spapr_tce_release_ownership,
+};
+
 static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
 		void *data)
 {


