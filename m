Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB846F88E5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 20:48:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCfnr1bL4z3fJS
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 May 2023 04:48:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XVYAdfz/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XVYAdfz/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCfmx0tvQz3chx
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 May 2023 04:47:12 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 345IhlWk000520;
	Fri, 5 May 2023 18:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=tCWewwhzNLT0+5WARNzbfIophe2U3lcINauMVgUVO5g=;
 b=XVYAdfz/rWUGW028owkrhPJY8WG0zNysJHvFrAHoGvacdz544tl64hhhnxPOMHQywaeD
 9McWb+J8fIIOWQSV97enhgJQbTXJRVok/qeT/Z8TPmkmXuRChbDs8+eeayy5E0vmIkc2
 YvVwCeJt/CWN3wrp3wz+queTUEGkI0I6wJxG/SOk+Uel4pRW2BOtZkkf8m++WgPJdKlK
 PNS3ddKpMKG+RN0o3mIc+1gbnJNun+FH0CDiAPtM/C36+3gRT4ZdWyeBaG7Ak4jzhn6i
 irM30cWziSIMBOPQtfQrHu6Oqpl1nhsRlhlBorNoQLlXRmtyyTUKpbasJ4U4kpEhncPu 3Q== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qd6wj0s2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 May 2023 18:47:05 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 345FuQJl004378;
	Fri, 5 May 2023 18:47:04 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3q8tv8r3dn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 May 2023 18:47:04 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 345Il3Aa65208748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 May 2023 18:47:03 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 84BD25805F;
	Fri,  5 May 2023 18:47:03 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C5FDF58060;
	Fri,  5 May 2023 18:47:02 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.65.191])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  5 May 2023 18:47:02 +0000 (GMT)
From: Gaurav Batra <gbatra@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] iommu/powerpc: Incorrect DDW Table is referenced for SR-IOV device
Date: Fri,  5 May 2023 13:47:01 -0500
Message-Id: <20230505184701.91613-1-gbatra@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mqeODoSq4tlKCvot_EjBbtTaW64Ugdqa
X-Proofpoint-ORIG-GUID: mqeODoSq4tlKCvot_EjBbtTaW64Ugdqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_25,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2305050152
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
Cc: brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, Gaurav Batra <gbatra@linux.vnet.ibm.com>, gjoyce@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For an SR-IOV device, while enabling DDW, a new table is created and added
at index 1 in the group. In the below 2 scenarios, the table is incorrectly
referenced at index 0 (which is where the table is for default DMA window).

1. When adding DDW

        This issue is exposed with "slub_debug". Error thrown out from
        dma_iommu_dma_supported()

        Warning: IOMMU offset too big for device mask
        mask: 0xffffffff, table offset: 0x800000000000000

2. During Dynamic removal of the PCI device.

        Error is from iommu_tce_table_put() since a NULL table pointer is
        passed in.

Fixes: 381ceda88c4c ("powerpc/pseries/iommu: Make use of DDW for indirect mapping")

Signed-off-by: Gaurav Batra <gbatra@linux.vnet.ibm.com>

Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/dma-iommu.c        |  4 +++-
 arch/powerpc/platforms/pseries/iommu.c | 13 +++++++++----
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index 038ce8d9061d..8920862ffd79 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -144,7 +144,7 @@ static bool dma_iommu_bypass_supported(struct device *dev, u64 mask)
 /* We support DMA to/from any memory page via the iommu */
 int dma_iommu_dma_supported(struct device *dev, u64 mask)
 {
-	struct iommu_table *tbl = get_iommu_table_base(dev);
+	struct iommu_table *tbl;
 
 	if (dev_is_pci(dev) && dma_iommu_bypass_supported(dev, mask)) {
 		/*
@@ -162,6 +162,8 @@ int dma_iommu_dma_supported(struct device *dev, u64 mask)
 		return 1;
 	}
 
+	tbl = get_iommu_table_base(dev);
+
 	if (!tbl) {
 		dev_err(dev, "Warning: IOMMU dma not supported: mask 0x%08llx, table unavailable\n", mask);
 		return 0;
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index c74b71d4733d..a8acd3b402d7 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -85,19 +85,24 @@ static struct iommu_table_group *iommu_pseries_alloc_group(int node)
 static void iommu_pseries_free_group(struct iommu_table_group *table_group,
 		const char *node_name)
 {
-	struct iommu_table *tbl;
-
 	if (!table_group)
 		return;
 
-	tbl = table_group->tables[0];
 #ifdef CONFIG_IOMMU_API
 	if (table_group->group) {
 		iommu_group_put(table_group->group);
 		BUG_ON(table_group->group);
 	}
 #endif
-	iommu_tce_table_put(tbl);
+
+	/* Default DMA window table is at index 0, while DDW at 1. SR-IOV
+	 * adapters only have table on index 1.
+	 */
+	if (table_group->tables[0])
+		iommu_tce_table_put(table_group->tables[0]);
+
+	if (table_group->tables[1])
+		iommu_tce_table_put(table_group->tables[1]);
 
 	kfree(table_group);
 }
-- 

