Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AC636F6D8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 10:06:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWlLy2Kl4z3cKm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:06:34 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWlJY2C6yz2yyt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:04:28 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13U82r9Z080857; Fri, 30 Apr 2021 04:04:23 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 388dy3g7c1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 04:04:22 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13U83xiN023307;
 Fri, 30 Apr 2021 08:04:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 384akhaxqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 08:04:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13U84IX245940998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 08:04:18 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D5B5A404D;
 Fri, 30 Apr 2021 08:04:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 194DAA4040;
 Fri, 30 Apr 2021 08:04:18 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 08:04:18 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 99D6D2200B7;
 Fri, 30 Apr 2021 10:04:17 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 12/31] powerpc/powernv/pci: Add MSI domains
Date: Fri, 30 Apr 2021 10:03:48 +0200
Message-Id: <20210430080407.4030767-13-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430080407.4030767-1-clg@kaod.org>
References: <20210430080407.4030767-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kZntPlbl6jdad6DSH6UTWxA_JPKFwjnt
X-Proofpoint-ORIG-GUID: kZntPlbl6jdad6DSH6UTWxA_JPKFwjnt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_05:2021-04-28,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 clxscore=1034 mlxscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

This is very similar to the MSI domains of the pSeries platform. The
MSI allocator is directly handled under the Linux PHB in the
in-the-middle "MSI" domain.

Only the XIVE (P9/P10) parent domain is supported for now. We still
need to add support for IRQ domain hierarchy under XICS.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 188 ++++++++++++++++++++++
 1 file changed, 188 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/pla=
tforms/powernv/pci-ioda.c
index b2a8da6114b5..3886ca6e2ed3 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -36,6 +36,7 @@
 #include <asm/firmware.h>
 #include <asm/pnv-pci.h>
 #include <asm/mmzone.h>
+#include <asm/xive.h>
=20
 #include <misc/cxl-base.h>
=20
@@ -2244,6 +2245,189 @@ static int pnv_pci_ioda_msi_setup(struct pnv_phb =
*phb, struct pci_dev *dev,
 	return 0;
 }
=20
+/*
+ * The msi_free() op is called before irq_domain_free_irqs_top() when
+ * the handler data is still available. Use that to clear the XIVE
+ * controller.
+ */
+static void pnv_msi_ops_msi_free(struct irq_domain *domain,
+				 struct msi_domain_info *info,
+				 unsigned int irq)
+{
+	if (xive_enabled())
+		xive_irq_free_data(irq);
+}
+
+static struct msi_domain_ops pnv_pci_msi_domain_ops =3D {
+	.msi_free	=3D pnv_msi_ops_msi_free,
+};
+
+static void pnv_msi_shutdown(struct irq_data *d)
+{
+	d =3D d->parent_data;
+	if (d->chip->irq_shutdown)
+		d->chip->irq_shutdown(d);
+}
+
+static void pnv_msi_mask(struct irq_data *d)
+{
+	pci_msi_mask_irq(d);
+	irq_chip_mask_parent(d);
+}
+
+static void pnv_msi_unmask(struct irq_data *d)
+{
+	pci_msi_unmask_irq(d);
+	irq_chip_unmask_parent(d);
+}
+
+static struct irq_chip pnv_pci_msi_irq_chip =3D {
+	.name		=3D "PNV-PCI-MSI",
+	.irq_shutdown	=3D pnv_msi_shutdown,
+	.irq_mask	=3D pnv_msi_mask,
+	.irq_unmask	=3D pnv_msi_unmask,
+	.irq_eoi	=3D irq_chip_eoi_parent,
+};
+
+static struct msi_domain_info pnv_msi_domain_info =3D {
+	.flags =3D (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
+		  MSI_FLAG_MULTI_PCI_MSI  | MSI_FLAG_PCI_MSIX),
+	.ops   =3D &pnv_pci_msi_domain_ops,
+	.chip  =3D &pnv_pci_msi_irq_chip,
+};
+
+static void pnv_msi_compose_msg(struct irq_data *d, struct msi_msg *msg)
+{
+	struct msi_desc *entry =3D irq_data_get_msi_desc(d);
+	struct pci_dev *pdev =3D msi_desc_to_pci_dev(entry);
+	struct pci_controller *hose =3D irq_data_get_irq_chip_data(d);
+	struct pnv_phb *phb =3D hose->private_data;
+	int rc;
+
+	rc =3D __pnv_pci_ioda_msi_setup(phb, pdev, d->hwirq,
+				      entry->msi_attrib.is_64, msg);
+	if (rc)
+		dev_err(&pdev->dev, "Failed to setup %s-bit MSI #%ld : %d\n",
+			entry->msi_attrib.is_64 ? "64" : "32", d->hwirq, rc);
+}
+
+static struct irq_chip pnv_msi_irq_chip =3D {
+	.name			=3D "PNV-MSI",
+	.irq_shutdown		=3D pnv_msi_shutdown,
+	.irq_mask		=3D irq_chip_mask_parent,
+	.irq_unmask		=3D irq_chip_unmask_parent,
+	.irq_eoi		=3D irq_chip_eoi_parent,
+	.irq_set_affinity	=3D irq_chip_set_affinity_parent,
+	.irq_compose_msi_msg	=3D pnv_msi_compose_msg,
+};
+
+static int pnv_irq_parent_domain_alloc(struct irq_domain *domain,
+				       unsigned int virq, int hwirq)
+{
+	struct irq_fwspec parent_fwspec;
+	int ret;
+
+	parent_fwspec.fwnode =3D domain->parent->fwnode;
+	parent_fwspec.param_count =3D 2;
+	parent_fwspec.param[0] =3D hwirq;
+	parent_fwspec.param[1] =3D IRQ_TYPE_EDGE_RISING;
+
+	ret =3D irq_domain_alloc_irqs_parent(domain, virq, 1, &parent_fwspec);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int pnv_irq_domain_alloc(struct irq_domain *domain, unsigned int =
virq,
+				unsigned int nr_irqs, void *arg)
+{
+	struct pci_controller *hose =3D domain->host_data;
+	struct pnv_phb *phb =3D hose->private_data;
+	msi_alloc_info_t *info =3D arg;
+	struct pci_dev *pdev =3D msi_desc_to_pci_dev(info->desc);
+	int hwirq;
+	int i, ret;
+
+	hwirq =3D msi_bitmap_alloc_hwirqs(&phb->msi_bmp, nr_irqs);
+	if (hwirq < 0) {
+		dev_warn(&pdev->dev, "failed to find a free MSI\n");
+		return -ENOSPC;
+	}
+
+	dev_dbg(&pdev->dev, "%s bridge %pOF %d/%x #%d\n", __func__,
+		hose->dn, virq, hwirq, nr_irqs);
+
+	for (i =3D 0; i < nr_irqs; i++) {
+		ret =3D pnv_irq_parent_domain_alloc(domain, virq + i,
+						  phb->msi_base + hwirq + i);
+		if (ret)
+			goto out;
+
+		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
+					      &pnv_msi_irq_chip, hose);
+	}
+
+	return 0;
+
+out:
+	irq_domain_free_irqs_parent(domain, virq, i - 1);
+	msi_bitmap_free_hwirqs(&phb->msi_bmp, hwirq, nr_irqs);
+	return ret;
+}
+
+static void pnv_irq_domain_free(struct irq_domain *domain, unsigned int =
virq,
+				unsigned int nr_irqs)
+{
+	struct irq_data *d =3D irq_domain_get_irq_data(domain, virq);
+	struct pci_controller *hose =3D irq_data_get_irq_chip_data(d);
+	struct pnv_phb *phb =3D hose->private_data;
+
+	pr_debug("%s bridge %pOF %d/%lx #%d\n", __func__, hose->dn,
+		 virq, d->hwirq, nr_irqs);
+
+	msi_bitmap_free_hwirqs(&phb->msi_bmp, d->hwirq, nr_irqs);
+	/* XIVE domain is cleared through ->msi_free() */
+}
+
+static const struct irq_domain_ops pnv_irq_domain_ops =3D {
+	.alloc  =3D pnv_irq_domain_alloc,
+	.free   =3D pnv_irq_domain_free,
+};
+
+static int pnv_msi_allocate_domains(struct pci_controller *hose, unsigne=
d int count)
+{
+	struct pnv_phb *phb =3D hose->private_data;
+	struct irq_domain *parent =3D irq_get_default_host();
+
+	hose->fwnode =3D irq_domain_alloc_named_id_fwnode("PNV-MSI", phb->opal_=
id);
+	if (!hose->fwnode)
+		return -ENOMEM;
+
+	hose->dev_domain =3D irq_domain_create_hierarchy(parent, 0, count,
+						       hose->fwnode,
+						       &pnv_irq_domain_ops, hose);
+	if (!hose->dev_domain) {
+		pr_err("PCI: failed to create IRQ domain bridge %pOF (domain %d)\n",
+		       hose->dn, hose->global_number);
+		irq_domain_free_fwnode(hose->fwnode);
+		return -ENOMEM;
+	}
+
+	hose->msi_domain =3D pci_msi_create_irq_domain(of_node_to_fwnode(hose->=
dn),
+						     &pnv_msi_domain_info,
+						     hose->dev_domain);
+	if (!hose->msi_domain) {
+		pr_err("PCI: failed to create MSI IRQ domain bridge %pOF (domain %d)\n=
",
+		       hose->dn, hose->global_number);
+		irq_domain_free_fwnode(hose->fwnode);
+		irq_domain_remove(hose->dev_domain);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
 static void pnv_pci_init_ioda_msis(struct pnv_phb *phb)
 {
 	unsigned int count;
@@ -2268,6 +2452,10 @@ static void pnv_pci_init_ioda_msis(struct pnv_phb =
*phb)
 	phb->msi32_support =3D 1;
 	pr_info("  Allocated bitmap for %d MSIs (base IRQ 0x%x)\n",
 		count, phb->msi_base);
+
+	/* Only supported by the XIVE driver */
+	if (xive_enabled())
+		pnv_msi_allocate_domains(phb->hose, count);
 }
=20
 static void pnv_ioda_setup_pe_res(struct pnv_ioda_pe *pe,
--=20
2.26.3

