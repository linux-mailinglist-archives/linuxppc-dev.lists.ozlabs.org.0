Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD9123159D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 00:36:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGWkY59BJzDqy1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 08:36:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gromero@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGWhb4YlSzDqw0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 08:35:10 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SMX8CO099048
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 18:35:08 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jj2wtk19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 18:35:08 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06SMXHrQ099366
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 18:35:08 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jj2wtk0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 18:35:08 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06SMTiFE020881;
 Tue, 28 Jul 2020 22:35:06 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 32gcprd2qf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 22:35:06 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06SMZ5p320185388
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jul 2020 22:35:05 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63B22BE074;
 Tue, 28 Jul 2020 22:35:05 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CB4EBE075;
 Tue, 28 Jul 2020 22:35:03 +0000 (GMT)
Received: from pub.ltc.br.ibm.com (unknown [9.80.219.128])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 28 Jul 2020 22:35:02 +0000 (GMT)
From: Gustavo Romero <gromero@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv/pci: Fix build of pci-ioda.o
Date: Tue, 28 Jul 2020 19:33:37 -0300
Message-Id: <20200728223337.40447-1-gromero@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_17:2020-07-28,
 2020-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 mlxlogscore=915 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 bulkscore=0 suspectscore=1 adultscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007280160
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
Cc: oohall@gmail.com, gromero@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently pnv_ioda_setup_bus_dma() is outside of a CONFIG_IOMMU_API guard
and if CONFIG_IOMMU_API=n the build can fail if the compiler sets
-Werror=unused-function, because pnv_ioda_setup_bus_dma() is only used in
functions guarded by a CONFIG_IOMMU_API guard.

That issue can be easily reproduced using the skiroot_defconfig. For other
configs, like powernv_defconfig, that issue is hidden by the fact that
if CONFIG_IOMMU_SUPPORT is enabled plus other common IOMMU options, like
CONFIG_OF_IOMMU, by default CONFIG_IOMMU_API is enabled as well. Hence, for
powernv_defconfig, it's necessary to set CONFIG_IOMMU_SUPPORT=n to make the
build fail, because CONFIG_PCI=y and pci-ioda.c is included in the build,
but since CONFIG_IOMMU_SUPPORT=n the CONFIG_IOMMU_API is disabled, breaking
the build.

This commit fixes that build issue by moving the pnv_ioda_setup_bus_dma()
inside a CONFIG_IOMMU_API guard, so when CONFIG_IOMMU_API is disabled that
function is not defined.

Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 26 +++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 73a63efcf855..743d840712da 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1885,19 +1885,6 @@ static bool pnv_pci_ioda_iommu_bypass_supported(struct pci_dev *pdev,
 	return false;
 }
 
-static void pnv_ioda_setup_bus_dma(struct pnv_ioda_pe *pe, struct pci_bus *bus)
-{
-	struct pci_dev *dev;
-
-	list_for_each_entry(dev, &bus->devices, bus_list) {
-		set_iommu_table_base(&dev->dev, pe->table_group.tables[0]);
-		dev->dev.archdata.dma_offset = pe->tce_bypass_base;
-
-		if ((pe->flags & PNV_IODA_PE_BUS_ALL) && dev->subordinate)
-			pnv_ioda_setup_bus_dma(pe, dev->subordinate);
-	}
-}
-
 static inline __be64 __iomem *pnv_ioda_get_inval_reg(struct pnv_phb *phb,
 						     bool real_mode)
 {
@@ -2501,6 +2488,19 @@ static long pnv_pci_ioda2_unset_window(struct iommu_table_group *table_group,
 #endif
 
 #ifdef CONFIG_IOMMU_API
+static void pnv_ioda_setup_bus_dma(struct pnv_ioda_pe *pe, struct pci_bus *bus)
+{
+	struct pci_dev *dev;
+
+	list_for_each_entry(dev, &bus->devices, bus_list) {
+		set_iommu_table_base(&dev->dev, pe->table_group.tables[0]);
+		dev->dev.archdata.dma_offset = pe->tce_bypass_base;
+
+		if ((pe->flags & PNV_IODA_PE_BUS_ALL) && dev->subordinate)
+			pnv_ioda_setup_bus_dma(pe, dev->subordinate);
+	}
+}
+
 unsigned long pnv_pci_ioda2_get_table_size(__u32 page_shift,
 		__u64 window_size, __u32 levels)
 {
-- 
2.17.1

