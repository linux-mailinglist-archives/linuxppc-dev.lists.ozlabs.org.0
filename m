Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8515036F6F4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 10:12:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWlVD3yWjz3fpX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:12:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWlJn6fFgz30J5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:04:41 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13U83wl0087693; Fri, 30 Apr 2021 04:04:29 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388cek2u8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 04:04:28 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13U80ND4032463;
 Fri, 30 Apr 2021 08:04:26 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 384ay8jy9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 08:04:26 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13U83xma36307394
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 08:03:59 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 66F3D4204B;
 Fri, 30 Apr 2021 08:04:24 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 402FC42045;
 Fri, 30 Apr 2021 08:04:24 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 08:04:24 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id BC8B8220193;
 Fri, 30 Apr 2021 10:04:23 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 25/31] powerpc/powernv/pci: Drop unused MSI code
Date: Fri, 30 Apr 2021 10:04:01 +0200
Message-Id: <20210430080407.4030767-26-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430080407.4030767-1-clg@kaod.org>
References: <20210430080407.4030767-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: V9DvzNMOH8yJ6RWQRXLlCWSX1qFvO_mI
X-Proofpoint-ORIG-GUID: V9DvzNMOH8yJ6RWQRXLlCWSX1qFvO_mI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_05:2021-04-28,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 clxscore=1034 spamscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300056
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

MSIs should be fully managed by the PCI and IRQ subsystems now.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/platforms/powernv/pci.h      |  6 --
 arch/powerpc/platforms/powernv/pci-ioda.c | 29 ----------
 arch/powerpc/platforms/powernv/pci.c      | 67 -----------------------
 3 files changed, 102 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platform=
s/powernv/pci.h
index 36d22920f5a3..a075012788df 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -127,11 +127,7 @@ struct pnv_phb {
 #endif
=20
 	unsigned int		msi_base;
-	unsigned int		msi32_support;
 	struct msi_bitmap	msi_bmp;
-	int (*msi_setup)(struct pnv_phb *phb, struct pci_dev *dev,
-			 unsigned int hwirq, unsigned int virq,
-			 unsigned int is_64, struct msi_msg *msg);
 	int (*init_m64)(struct pnv_phb *phb);
 	int (*get_pe_state)(struct pnv_phb *phb, int pe_no);
 	void (*freeze_pe)(struct pnv_phb *phb, int pe_no);
@@ -295,8 +291,6 @@ extern void pnv_npu2_map_lpar(struct pnv_ioda_pe *gpe=
, unsigned long msr);
 extern void pnv_pci_reset_secondary_bus(struct pci_dev *dev);
 extern int pnv_eeh_phb_reset(struct pci_controller *hose, int option);
=20
-extern int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type);
-extern void pnv_teardown_msi_irqs(struct pci_dev *pdev);
 extern struct pnv_ioda_pe *pnv_pci_bdfn_to_pe(struct pnv_phb *phb, u16 b=
dfn);
 extern struct pnv_ioda_pe *pnv_ioda_get_pe(struct pci_dev *dev);
 extern void pnv_set_msi_irq_chip(struct pnv_phb *phb, unsigned int virq)=
;
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/pla=
tforms/powernv/pci-ioda.c
index 13b56de92d85..c5acd85a9144 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2224,29 +2224,6 @@ static int __pnv_pci_ioda_msi_setup(struct pnv_phb=
 *phb, struct pci_dev *dev,
 	return 0;
 }
=20
-static int pnv_pci_ioda_msi_setup(struct pnv_phb *phb, struct pci_dev *d=
ev,
-				  unsigned int hwirq, unsigned int virq,
-				  unsigned int is_64, struct msi_msg *msg)
-{
-	struct pnv_ioda_pe *pe =3D pnv_ioda_get_pe(dev);
-	unsigned int xive_num =3D hwirq - phb->msi_base;
-	int rc;
-
-	rc =3D __pnv_pci_ioda_msi_setup(phb, dev, xive_num, is_64, msg);
-	if (rc)
-		return rc;
-
-	/* P8 only */
-	pnv_set_msi_irq_chip(phb, virq);
-
-	pr_devel("%s: %s-bit MSI on hwirq %x (xive #%d),"
-		 " address=3D%x_%08x data=3D%x PE# %x\n",
-		 pci_name(dev), is_64 ? "64" : "32", hwirq, xive_num,
-		 msg->address_hi, msg->address_lo, msg->data, pe->pe_number);
-
-	return 0;
-}
-
 /*
  * The msi_free() op is called before irq_domain_free_irqs_top() when
  * the handler data is still available. Use that to clear the XIVE
@@ -2471,8 +2448,6 @@ static void pnv_pci_init_ioda_msis(struct pnv_phb *=
phb)
 		return;
 	}
=20
-	phb->msi_setup =3D pnv_pci_ioda_msi_setup;
-	phb->msi32_support =3D 1;
 	pr_info("  Allocated bitmap for %d MSIs (base IRQ 0x%x)\n",
 		count, phb->msi_base);
=20
@@ -3090,8 +3065,6 @@ static const struct pci_controller_ops pnv_pci_ioda=
_controller_ops =3D {
 	.dma_dev_setup		=3D pnv_pci_ioda_dma_dev_setup,
 	.dma_bus_setup		=3D pnv_pci_ioda_dma_bus_setup,
 	.iommu_bypass_supported	=3D pnv_pci_ioda_iommu_bypass_supported,
-	.setup_msi_irqs		=3D pnv_setup_msi_irqs,
-	.teardown_msi_irqs	=3D pnv_teardown_msi_irqs,
 	.enable_device_hook	=3D pnv_pci_enable_device_hook,
 	.release_device		=3D pnv_pci_release_device,
 	.window_alignment	=3D pnv_pci_window_alignment,
@@ -3101,8 +3074,6 @@ static const struct pci_controller_ops pnv_pci_ioda=
_controller_ops =3D {
 };
=20
 static const struct pci_controller_ops pnv_npu_ioda_controller_ops =3D {
-	.setup_msi_irqs		=3D pnv_setup_msi_irqs,
-	.teardown_msi_irqs	=3D pnv_teardown_msi_irqs,
 	.enable_device_hook	=3D pnv_pci_enable_device_hook,
 	.window_alignment	=3D pnv_pci_window_alignment,
 	.reset_secondary_bus	=3D pnv_pci_reset_secondary_bus,
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platform=
s/powernv/pci.c
index 9b9bca169275..397b3d7eb150 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -160,73 +160,6 @@ int pnv_pci_set_power_state(uint64_t id, uint8_t sta=
te, struct opal_msg *msg)
 }
 EXPORT_SYMBOL_GPL(pnv_pci_set_power_state);
=20
-int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type)
-{
-	struct pnv_phb *phb =3D pci_bus_to_pnvhb(pdev->bus);
-	struct msi_desc *entry;
-	struct msi_msg msg;
-	int hwirq;
-	unsigned int virq;
-	int rc;
-
-	if (WARN_ON(!phb) || !phb->msi_bmp.bitmap)
-		return -ENODEV;
-
-	if (pdev->no_64bit_msi && !phb->msi32_support)
-		return -ENODEV;
-
-	for_each_pci_msi_entry(entry, pdev) {
-		if (!entry->msi_attrib.is_64 && !phb->msi32_support) {
-			pr_warn("%s: Supports only 64-bit MSIs\n",
-				pci_name(pdev));
-			return -ENXIO;
-		}
-		hwirq =3D msi_bitmap_alloc_hwirqs(&phb->msi_bmp, 1);
-		if (hwirq < 0) {
-			pr_warn("%s: Failed to find a free MSI\n",
-				pci_name(pdev));
-			return -ENOSPC;
-		}
-		virq =3D irq_create_mapping(NULL, phb->msi_base + hwirq);
-		if (!virq) {
-			pr_warn("%s: Failed to map MSI to linux irq\n",
-				pci_name(pdev));
-			msi_bitmap_free_hwirqs(&phb->msi_bmp, hwirq, 1);
-			return -ENOMEM;
-		}
-		rc =3D phb->msi_setup(phb, pdev, phb->msi_base + hwirq,
-				    virq, entry->msi_attrib.is_64, &msg);
-		if (rc) {
-			pr_warn("%s: Failed to setup MSI\n", pci_name(pdev));
-			irq_dispose_mapping(virq);
-			msi_bitmap_free_hwirqs(&phb->msi_bmp, hwirq, 1);
-			return rc;
-		}
-		irq_set_msi_desc(virq, entry);
-		pci_write_msi_msg(virq, &msg);
-	}
-	return 0;
-}
-
-void pnv_teardown_msi_irqs(struct pci_dev *pdev)
-{
-	struct pnv_phb *phb =3D pci_bus_to_pnvhb(pdev->bus);
-	struct msi_desc *entry;
-	irq_hw_number_t hwirq;
-
-	if (WARN_ON(!phb))
-		return;
-
-	for_each_pci_msi_entry(entry, pdev) {
-		if (!entry->irq)
-			continue;
-		hwirq =3D virq_to_hw(entry->irq);
-		irq_set_msi_desc(entry->irq, NULL);
-		irq_dispose_mapping(entry->irq);
-		msi_bitmap_free_hwirqs(&phb->msi_bmp, hwirq - phb->msi_base, 1);
-	}
-}
-
 /* Nicely print the contents of the PE State Tables (PEST). */
 static void pnv_pci_dump_pest(__be64 pestA[], __be64 pestB[], int pest_s=
ize)
 {
--=20
2.26.3

