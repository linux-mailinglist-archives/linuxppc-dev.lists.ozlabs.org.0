Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCE5EA240
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 18:04:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473FDn4TcyzF4Ts
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 04:04:41 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 473F7j2vQNzF4R0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 04:00:17 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9UGiXnh024845; Wed, 30 Oct 2019 13:00:04 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vyea80kjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 13:00:03 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x9UGirQi025778;
 Wed, 30 Oct 2019 13:00:03 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vyea80khq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 13:00:03 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9UGu6fa030956;
 Wed, 30 Oct 2019 17:00:05 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01wdc.us.ibm.com with ESMTP id 2vxwh5fgbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 17:00:05 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9UH01BT52232636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Oct 2019 17:00:01 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49A9F28067;
 Wed, 30 Oct 2019 17:00:01 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34DE72805C;
 Wed, 30 Oct 2019 17:00:01 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.179.210])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 30 Oct 2019 17:00:01 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 5562A4654A9; Wed, 30 Oct 2019 12:00:00 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/11] powerpc/powernv/npu: Wire up
 pnv_npu_try_dma_set_bypass()
Date: Wed, 30 Oct 2019 11:59:53 -0500
Message-Id: <1572454800-17976-5-git-send-email-arbab@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1572454800-17976-1-git-send-email-arbab@linux.ibm.com>
References: <1572454800-17976-1-git-send-email-arbab@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-30_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
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

Rework of pnv_pci_ioda_iommu_bypass_supported() dropped a call to
pnv_npu_try_dma_set_bypass(). Reintroduce this call, so that the DMA
bypass configuration of a GPU device is propagated to its corresponding
NPU devices.

Fixes: 2d6ad41b2c21 ("powerpc/powernv: use the generic iommu bypass code")
Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Cc: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 8849218187d7..70e834635971 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1833,14 +1833,13 @@ static bool pnv_pci_ioda_iommu_bypass_supported(struct pci_dev *pdev,
 	struct pnv_phb *phb = hose->private_data;
 	struct pci_dn *pdn = pci_get_pdn(pdev);
 	struct pnv_ioda_pe *pe;
+	bool bypass;
 
 	if (WARN_ON(!pdn || pdn->pe_number == IODA_INVALID_PE))
 		return false;
 
 	pe = &phb->ioda.pe_array[pdn->pe_number];
-
-	if (pnv_ioda_pe_iommu_bypass_supported(pe, dma_mask))
-		return true;
+	bypass = pnv_ioda_pe_iommu_bypass_supported(pe, dma_mask);
 
 	/*
 	 * If the device can't set the TCE bypass bit but still wants
@@ -1848,7 +1847,8 @@ static bool pnv_pci_ioda_iommu_bypass_supported(struct pci_dev *pdev,
 	 * bypass the 32-bit region and be usable for 64-bit DMAs.
 	 * The device needs to be able to address all of this space.
 	 */
-	if (dma_mask >> 32 &&
+	if (!bypass &&
+	    dma_mask >> 32 &&
 	    dma_mask > (memory_hotplug_max() + (1ULL << 32)) &&
 	    /* pe->pdev should be set if it's a single device, pe->pbus if not */
 	    (pe->device_count == 1 || !pe->pbus) &&
@@ -1859,10 +1859,14 @@ static bool pnv_pci_ioda_iommu_bypass_supported(struct pci_dev *pdev,
 			return false;
 		/* 4GB offset bypasses 32-bit space */
 		pdev->dev.archdata.dma_offset = (1ULL << 32);
-		return true;
+
+		bypass = true;
 	}
 
-	return false;
+	/* Update peer npu devices */
+	pnv_npu_try_dma_set_bypass(pdev, dma_mask);
+
+	return bypass;
 }
 
 static void pnv_ioda_setup_bus_dma(struct pnv_ioda_pe *pe, struct pci_bus *bus)
-- 
1.8.3.1

