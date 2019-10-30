Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D4194EA252
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 18:11:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473FP14cRYzF35k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 04:11:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473F7m6S3pzF4R5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 04:00:20 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9UGf5Ws011229; Wed, 30 Oct 2019 13:00:04 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vycvwmdbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 13:00:04 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x9UGfE4X011747;
 Wed, 30 Oct 2019 13:00:03 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vycvwmdae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 13:00:03 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9UGnhrN029126;
 Wed, 30 Oct 2019 17:00:02 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 2vxwh61b9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 17:00:02 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9UH01fC26870084
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Oct 2019 17:00:02 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE17EAC064;
 Wed, 30 Oct 2019 17:00:01 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0DC3AC06F;
 Wed, 30 Oct 2019 17:00:01 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.179.210])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 30 Oct 2019 17:00:01 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 6CA904654AE; Wed, 30 Oct 2019 12:00:00 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/11] powerpc/powernv: Replace open coded pnv_ioda_get_pe()s
Date: Wed, 30 Oct 2019 11:59:57 -0500
Message-Id: <1572454800-17976-9-git-send-email-arbab@linux.ibm.com>
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
 mlxlogscore=840 adultscore=0 classifier=spam adjust=0 reason=mlx
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

Collapse several open coded instances of pnv_ioda_get_pe().

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/npu-dma.c  | 22 +++++-----------------
 arch/powerpc/platforms/powernv/pci-ioda.c | 10 +++-------
 2 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
index a77ce7d71634..0010b21d45b8 100644
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ b/arch/powerpc/platforms/powernv/npu-dma.c
@@ -97,24 +97,17 @@ struct pci_dev *pnv_pci_get_npu_dev(struct pci_dev *gpdev, int index)
 static struct pnv_ioda_pe *get_gpu_pci_dev_and_pe(struct pnv_ioda_pe *npe,
 						  struct pci_dev **gpdev)
 {
-	struct pnv_phb *phb;
-	struct pci_controller *hose;
 	struct pci_dev *pdev;
 	struct pnv_ioda_pe *pe;
-	struct pci_dn *pdn;
 
 	pdev = pnv_pci_get_gpu_dev(npe->pdev);
 	if (!pdev)
 		return NULL;
 
-	pdn = pci_get_pdn(pdev);
-	if (WARN_ON(!pdn || pdn->pe_number == IODA_INVALID_PE))
+	pe = pnv_ioda_get_pe(pdev);
+	if (WARN_ON(!pe))
 		return NULL;
 
-	hose = pci_bus_to_host(pdev->bus);
-	phb = hose->private_data;
-	pe = &phb->ioda.pe_array[pdn->pe_number];
-
 	if (gpdev)
 		*gpdev = pdev;
 
@@ -261,9 +254,6 @@ static int pnv_npu_dma_set_bypass(struct pnv_ioda_pe *npe)
 void pnv_npu_try_dma_set_bypass(struct pci_dev *gpdev, u64 mask)
 {
 	struct pnv_ioda_pe *gpe = pnv_ioda_get_pe(gpdev);
-	struct pnv_phb *phb;
-	struct pci_dn *pdn;
-	struct pnv_ioda_pe *npe;
 	struct pci_dev *npdev;
 	bool bypass;
 	int i = 0;
@@ -275,12 +265,10 @@ void pnv_npu_try_dma_set_bypass(struct pci_dev *gpdev, u64 mask)
 	bypass = pnv_ioda_pe_iommu_bypass_supported(gpe, mask);
 
 	while ((npdev = pnv_pci_get_npu_dev(gpdev, i++))) {
-		pdn = pci_get_pdn(npdev);
-		if (WARN_ON(!pdn || pdn->pe_number == IODA_INVALID_PE))
-			return;
+		struct pnv_ioda_pe *npe = pnv_ioda_get_pe(npdev);
 
-		phb = pci_bus_to_host(npdev->bus)->private_data;
-		npe = &phb->ioda.pe_array[pdn->pe_number];
+		if (WARN_ON(!npe))
+			return;
 
 		if (bypass) {
 			dev_info(&npdev->dev,
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 319152d30bc3..6b932cfc0deb 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1829,16 +1829,12 @@ static int pnv_pci_ioda_dma_64bit_bypass(struct pnv_ioda_pe *pe)
 static bool pnv_pci_ioda_iommu_bypass_supported(struct pci_dev *pdev,
 		u64 dma_mask)
 {
-	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
-	struct pnv_phb *phb = hose->private_data;
-	struct pci_dn *pdn = pci_get_pdn(pdev);
-	struct pnv_ioda_pe *pe;
+	struct pnv_ioda_pe *pe = pnv_ioda_get_pe(pdev);
 	bool bypass;
 
-	if (WARN_ON(!pdn || pdn->pe_number == IODA_INVALID_PE))
+	if (WARN_ON(!pe))
 		return false;
 
-	pe = &phb->ioda.pe_array[pdn->pe_number];
 	bypass = pnv_ioda_pe_iommu_bypass_supported(pe, dma_mask);
 
 	/*
@@ -1852,7 +1848,7 @@ static bool pnv_pci_ioda_iommu_bypass_supported(struct pci_dev *pdev,
 	    dma_mask > (memory_hotplug_max() + (1ULL << 32)) &&
 	    /* pe->pdev should be set if it's a single device, pe->pbus if not */
 	    (pe->device_count == 1 || !pe->pbus) &&
-	    phb->model == PNV_PHB_MODEL_PHB3) {
+	    pe->phb->model == PNV_PHB_MODEL_PHB3) {
 		/* Configure the bypass mode */
 		if (pnv_pci_ioda_dma_64bit_bypass(pe))
 			return false;
-- 
1.8.3.1

