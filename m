Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBF4927401
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 12:26:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P+VJVlXA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFCVs6Zq8z30Vf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 20:26:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P+VJVlXA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFCV744tfz3c4W
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 20:26:06 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4649vdbj014367;
	Thu, 4 Jul 2024 10:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	subject:from:to:cc:date:message-id:content-type
	:content-transfer-encoding:mime-version; s=pp1; bh=beaAn83Z14Fgy
	nHM1T6PvGwI5Mpl48BF0FwSGHvL8Ms=; b=P+VJVlXAdZEj6SSUUjOPbGMAJcsao
	GmSJlR2cpJy/6c1M3dFv7IKDwKx1Sy4ft873vw6P7qUlGEYUN7+DVN+6OSACJFvl
	af53qWaKj285p0bBK+kOUNZLUabSQxYqWgONXqEKeDB/MDLfM3JHzaVngxu5dQ8C
	VU+cuqCBKS8qvGo5ORi5zqlK3DpS46MTQ09FohZWngRu93cqL92mCOC500z327al
	4mI+IOg6S9oO6u8huE2WPQ0tjkI3MTEN5S4hpOauqlApSFlkOxK2tJDuc9wESfHR
	Y33Dklksl9IPUj2+Pj6HVgs+wGsVeB4T9kvsq9WzU0HkhYE0z8IPFqcFA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 405r8m892s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 10:25:57 +0000 (GMT)
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 464APu2U023834;
	Thu, 4 Jul 2024 10:25:56 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 405r8m8911-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 10:25:56 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4647YRf3026386;
	Thu, 4 Jul 2024 10:22:45 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 402wkq7jjk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 10:22:45 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 464AMdm039125310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Jul 2024 10:22:41 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C04E820043;
	Thu,  4 Jul 2024 10:22:39 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A9B320040;
	Thu,  4 Jul 2024 10:22:38 +0000 (GMT)
Received: from [172.17.0.2] (unknown [9.3.101.175])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Jul 2024 10:22:37 +0000 (GMT)
Subject: [PATCH] powerpc/pseries/iommu: Define spapr_tce_table_group_ops only
 with CONFIG_IOMMU_API
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Date: Thu, 04 Jul 2024 10:22:37 +0000
Message-ID: <172008854222.784.13666247605789409729.stgit@linux.ibm.com>
User-Agent: StGit/1.5
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: X3dxyxVRaFXE-JkPkAQcVZ3EaetPX8DY
X-Proofpoint-ORIG-GUID: FQCHDyXwtnorQwBRYtnOW0e3msDtdnlE
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_06,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=812 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407040072
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
Cc: gbatra@linux.vnet.ibm.com, sbhat@linux.ibm.com, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, jgg@ziepe.ca, tpearson@raptorengineering.com, npiggin@gmail.com, ruscur@russell.cc, vaibhav@linux.ibm.com, msuchanek@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch fixes the below warning,
arch/powerpc/platforms/pseries/iommu.c:1824:37: warning: 'spapr_tce_table_group_ops' defined but not used [-Wunused-variable]

The other error reported by the test robot no longer exists on the top
of the tree due to later changes on the file.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202407020357.Hz8kQkKf-lkp@intel.com/
Fixes: b09c031d9433 ("powerpc/iommu: Move pSeries specific functions to pseries/iommu.c")
Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 672199ba7400..534cd159e9ab 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -68,7 +68,9 @@ static struct iommu_table *iommu_pseries_alloc_table(int node)
 	return tbl;
 }
 
+#ifdef CONFIG_IOMMU_API
 static struct iommu_table_group_ops spapr_tce_table_group_ops;
+#endif
 
 static struct iommu_table_group *iommu_pseries_alloc_group(int node)
 {
@@ -165,6 +167,7 @@ static unsigned long tce_get_pseries(struct iommu_table *tbl, long index)
 	return be64_to_cpu(*tcep);
 }
 
+#ifdef CONFIG_IOMMU_API
 static long pseries_tce_iommu_userspace_view_alloc(struct iommu_table *tbl)
 {
 	unsigned long cb = ALIGN(sizeof(tbl->it_userspace[0]) * tbl->it_size, PAGE_SIZE);
@@ -183,6 +186,7 @@ static long pseries_tce_iommu_userspace_view_alloc(struct iommu_table *tbl)
 
 	return 0;
 }
+#endif
 
 static void tce_iommu_userspace_view_free(struct iommu_table *tbl)
 {
@@ -738,6 +742,7 @@ struct iommu_table_ops iommu_table_lpar_multi_ops = {
 	.free = tce_free_pSeries
 };
 
+#ifdef CONFIG_IOMMU_API
 /*
  * When the DMA window properties might have been removed,
  * the parent node has the table_group setup on it.
@@ -757,6 +762,7 @@ static struct device_node *pci_dma_find_parent_node(struct pci_dev *dev,
 
 	return NULL;
 }
+#endif
 
 /*
  * Find nearest ibm,dma-window (default DMA window) or direct DMA window or
@@ -1845,6 +1851,7 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
 	return false;
 }
 
+#ifdef CONFIG_IOMMU_API
 /*
  * A simple iommu_table_group_ops which only allows reusing the existing
  * iommu_table. This handles VFIO for POWER7 or the nested KVM.
@@ -2327,6 +2334,7 @@ static struct iommu_table_group_ops spapr_tce_table_group_ops = {
 	.take_ownership = spapr_tce_take_ownership,
 	.release_ownership = spapr_tce_release_ownership,
 };
+#endif
 
 static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
 		void *data)


