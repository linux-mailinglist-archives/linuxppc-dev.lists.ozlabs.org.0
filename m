Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E55EA254
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 18:13:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473FRL2r8FzF4XJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 04:13:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 473F7m6PP0zF4R1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 04:00:20 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9UGf7OB011266; Wed, 30 Oct 2019 13:00:04 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vycvwmdb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 13:00:04 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x9UGw1Ln062954;
 Wed, 30 Oct 2019 13:00:03 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vycvwmda5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 13:00:03 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9UGqMig017779;
 Wed, 30 Oct 2019 17:00:02 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 2vxwh69ccv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 17:00:02 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9UH01c417170786
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Oct 2019 17:00:01 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5748AAC064;
 Wed, 30 Oct 2019 17:00:01 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E892AC065;
 Wed, 30 Oct 2019 17:00:01 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.179.210])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 30 Oct 2019 17:00:01 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 4562F465432; Wed, 30 Oct 2019 12:00:00 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/11] Revert "powerpc/powernv: Remove unused
 pnv_npu_try_dma_set_bypass() function"
Date: Wed, 30 Oct 2019 11:59:50 -0500
Message-Id: <1572454800-17976-2-git-send-email-arbab@linux.ibm.com>
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
 mlxlogscore=929 adultscore=0 classifier=spam adjust=0 reason=mlx
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

Revert commit b4d37a7b6934 ("powerpc/powernv: Remove unused
pnv_npu_try_dma_set_bypass() function") so that this function can be
reintegrated.

Fixes: 2d6ad41b2c21 ("powerpc/powernv: use the generic iommu bypass code")
Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Cc: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/platforms/powernv/npu-dma.c | 99 ++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
index b95b9e3c4c98..5a8313654033 100644
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ b/arch/powerpc/platforms/powernv/npu-dma.c
@@ -193,6 +193,105 @@ static long pnv_npu_unset_window(struct iommu_table_group *table_group, int num)
 	return 0;
 }
 
+/*
+ * Enables 32 bit DMA on NPU.
+ */
+static void pnv_npu_dma_set_32(struct pnv_ioda_pe *npe)
+{
+	struct pci_dev *gpdev;
+	struct pnv_ioda_pe *gpe;
+	int64_t rc;
+
+	/*
+	 * Find the assoicated PCI devices and get the dma window
+	 * information from there.
+	 */
+	if (!npe->pdev || !(npe->flags & PNV_IODA_PE_DEV))
+		return;
+
+	gpe = get_gpu_pci_dev_and_pe(npe, &gpdev);
+	if (!gpe)
+		return;
+
+	rc = pnv_npu_set_window(&npe->table_group, 0,
+			gpe->table_group.tables[0]);
+
+	/*
+	 * NVLink devices use the same TCE table configuration as
+	 * their parent device so drivers shouldn't be doing DMA
+	 * operations directly on these devices.
+	 */
+	set_dma_ops(&npe->pdev->dev, &dma_dummy_ops);
+}
+
+/*
+ * Enables bypass mode on the NPU. The NPU only supports one
+ * window per link, so bypass needs to be explicitly enabled or
+ * disabled. Unlike for a PHB3 bypass and non-bypass modes can't be
+ * active at the same time.
+ */
+static int pnv_npu_dma_set_bypass(struct pnv_ioda_pe *npe)
+{
+	struct pnv_phb *phb = npe->phb;
+	int64_t rc = 0;
+	phys_addr_t top = memblock_end_of_DRAM();
+
+	if (phb->type != PNV_PHB_NPU_NVLINK || !npe->pdev)
+		return -EINVAL;
+
+	rc = pnv_npu_unset_window(&npe->table_group, 0);
+	if (rc != OPAL_SUCCESS)
+		return rc;
+
+	/* Enable the bypass window */
+
+	top = roundup_pow_of_two(top);
+	dev_info(&npe->pdev->dev, "Enabling bypass for PE %x\n",
+			npe->pe_number);
+	rc = opal_pci_map_pe_dma_window_real(phb->opal_id,
+			npe->pe_number, npe->pe_number,
+			0 /* bypass base */, top);
+
+	if (rc == OPAL_SUCCESS)
+		pnv_pci_ioda2_tce_invalidate_entire(phb, false);
+
+	return rc;
+}
+
+void pnv_npu_try_dma_set_bypass(struct pci_dev *gpdev, bool bypass)
+{
+	int i;
+	struct pnv_phb *phb;
+	struct pci_dn *pdn;
+	struct pnv_ioda_pe *npe;
+	struct pci_dev *npdev;
+
+	for (i = 0; ; ++i) {
+		npdev = pnv_pci_get_npu_dev(gpdev, i);
+
+		if (!npdev)
+			break;
+
+		pdn = pci_get_pdn(npdev);
+		if (WARN_ON(!pdn || pdn->pe_number == IODA_INVALID_PE))
+			return;
+
+		phb = pci_bus_to_host(npdev->bus)->private_data;
+
+		/* We only do bypass if it's enabled on the linked device */
+		npe = &phb->ioda.pe_array[pdn->pe_number];
+
+		if (bypass) {
+			dev_info(&npdev->dev,
+					"Using 64-bit DMA iommu bypass\n");
+			pnv_npu_dma_set_bypass(npe);
+		} else {
+			dev_info(&npdev->dev, "Using 32-bit DMA via iommu\n");
+			pnv_npu_dma_set_32(npe);
+		}
+	}
+}
+
 /* Switch ownership from platform code to external user (e.g. VFIO) */
 static void pnv_npu_take_ownership(struct iommu_table_group *table_group)
 {
-- 
1.8.3.1

