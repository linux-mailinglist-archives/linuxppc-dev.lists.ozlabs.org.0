Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0B9EA24B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 18:09:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473FKn1QGvzF4VQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 04:09:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473F7k186dzF4R0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 04:00:17 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9UGff3L023929; Wed, 30 Oct 2019 13:00:06 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vydy89ntq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 13:00:06 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x9UGfvYE025195;
 Wed, 30 Oct 2019 13:00:05 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vydy89nt1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 13:00:05 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9UGnhAw014574;
 Wed, 30 Oct 2019 17:00:04 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 2vxwh69cdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 17:00:04 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9UH030H12517730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Oct 2019 17:00:03 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7A6778084;
 Wed, 30 Oct 2019 17:00:01 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4AB678077;
 Wed, 30 Oct 2019 17:00:01 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.179.210])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 30 Oct 2019 17:00:01 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 7C2734654B1; Wed, 30 Oct 2019 12:00:00 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/11] powerpc/powernv: Add pnv_pci_ioda_dma_set_mask()
Date: Wed, 30 Oct 2019 12:00:00 -0500
Message-Id: <1572454800-17976-12-git-send-email-arbab@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1572454800-17976-1-git-send-email-arbab@linux.ibm.com>
References: <1572454800-17976-1-git-send-email-arbab@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-30_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910300150
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Oliver O'Halloran <oohall@gmail.com>, Alistair Popple <alistair@popple.id.au>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Change pnv_pci_ioda_iommu_bypass_supported() to have no side effects, by
separating the part of the function that determines if bypass is
supported from the part that actually attempts to configure it.

Move the latter to a controller-specific dma_set_mask() callback.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/Kconfig    |  1 +
 arch/powerpc/platforms/powernv/pci-ioda.c | 30 ++++++++++++++++--------------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
index 938803eab0ad..6e6e27841764 100644
--- a/arch/powerpc/platforms/powernv/Kconfig
+++ b/arch/powerpc/platforms/powernv/Kconfig
@@ -17,6 +17,7 @@ config PPC_POWERNV
 	select PPC_DOORBELL
 	select MMU_NOTIFIER
 	select FORCE_SMP
+	select ARCH_HAS_DMA_SET_MASK
 	default y
 
 config OPAL_PRD
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 57e6a43d9a3a..5291464930ed 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1854,32 +1854,33 @@ static bool pnv_pci_ioda_iommu_bypass_supported(struct pci_dev *pdev,
 		u64 dma_mask)
 {
 	struct pnv_ioda_pe *pe = pnv_ioda_get_pe(pdev);
-	bool bypass;
 
 	if (WARN_ON(!pe))
 		return false;
 
-	bypass = pnv_ioda_pe_iommu_bypass_supported(pe, dma_mask);
+	return pnv_ioda_pe_iommu_bypass_supported(pe, dma_mask) ||
+	       pnv_phb3_iommu_bypass_supported(pe, dma_mask);
+}
+
+static void pnv_pci_ioda_dma_set_mask(struct pci_dev *pdev, u64 mask)
+{
+	struct pnv_ioda_pe *pe = pnv_ioda_get_pe(pdev);
+
+	if (!pe)
+		return;
 
-	if (!bypass && pnv_phb3_iommu_bypass_supported(pe, dma_mask)) {
+	if (!pnv_ioda_pe_iommu_bypass_supported(pe, mask) &&
+	    pnv_phb3_iommu_bypass_supported(pe, mask)) {
 		/* Configure the bypass mode */
 		if (pnv_pci_ioda_dma_64bit_bypass(pe))
-			return false;
+			return;
 
 		/* 4GB offset bypasses 32-bit space */
 		pdev->dev.archdata.dma_offset = (1ULL << 32);
-
-		bypass = true;
 	}
 
-	/*
-	 * Update peer npu devices. We also do this for the special case where
-	 * a 64-bit dma mask can't be fulfilled and falls back to default.
-	 */
-	if (bypass || !(dma_mask >> 32) || dma_mask == DMA_BIT_MASK(64))
-		pnv_npu_try_dma_set_bypass(pdev, dma_mask);
-
-	return bypass;
+	/* Update peer npu devices */
+	pnv_npu_try_dma_set_bypass(pdev, mask);
 }
 
 static void pnv_ioda_setup_bus_dma(struct pnv_ioda_pe *pe, struct pci_bus *bus)
@@ -3612,6 +3613,7 @@ static void pnv_pci_ioda_shutdown(struct pci_controller *hose)
 static const struct pci_controller_ops pnv_pci_ioda_controller_ops = {
 	.dma_dev_setup		= pnv_pci_dma_dev_setup,
 	.dma_bus_setup		= pnv_pci_dma_bus_setup,
+	.dma_set_mask		= pnv_pci_ioda_dma_set_mask,
 	.iommu_bypass_supported	= pnv_pci_ioda_iommu_bypass_supported,
 	.setup_msi_irqs		= pnv_setup_msi_irqs,
 	.teardown_msi_irqs	= pnv_teardown_msi_irqs,
-- 
1.8.3.1

