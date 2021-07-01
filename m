Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E073B9243
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:29:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFzZd0Vnwz3cd7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 23:29:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFzYV3qPrz301p
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 23:28:13 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161D3XZs129526; Thu, 1 Jul 2021 09:28:04 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39hdyfs9ur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:28:03 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 161DMc3J024414;
 Thu, 1 Jul 2021 13:28:02 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 39duv8aeaj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 13:28:02 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 161DRxFp33489328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 13:27:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A81F952101;
 Thu,  1 Jul 2021 13:27:59 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 7AB50520A3;
 Thu,  1 Jul 2021 13:27:59 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.183])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 005582201CC;
 Thu,  1 Jul 2021 15:27:58 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/32] powerpc/pseries/pci: Add MSI domains
Date: Thu,  1 Jul 2021 15:27:23 +0200
Message-Id: <20210701132750.1475580-6-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210701132750.1475580-1-clg@kaod.org>
References: <20210701132750.1475580-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: psiSH15X65dN4oRJnVrkIo7s4x77Uzkn
X-Proofpoint-ORIG-GUID: psiSH15X65dN4oRJnVrkIo7s4x77Uzkn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_07:2021-07-01,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 mlxscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1034 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107010082
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

Two IRQ domains are added on top of default machine IRQ domain.

First, the top level "pSeries-PCI-MSI" domain deals with the MSI
specificities. In this domain, the HW IRQ numbers are generated by the
PCI MSI layer, they compose a unique ID for an MSI source with the PCI
device identifier and the MSI vector number.

These numbers can be quite large on a pSeries machine running under
the IBM Hypervisor and /sys/kernel/irq/ and /proc/interrupts will
require small fixes to show them correctly.

Second domain is the in-the-middle "pSeries-MSI" domain which acts as
a proxy between the PCI MSI subsystem and the machine IRQ subsystem.
It usually allocate the MSI vector numbers but, on pSeries machines,
this is done by the RTAS FW and RTAS returns IRQ numbers in the IRQ
number space of the machine. This is why the in-the-middle "pSeries-MSI"
domain has the same HW IRQ numbers as its parent domain.

Only the XIVE (P9/P10) parent domain is supported for now. We still
need to add support for IRQ domain hierarchy under XICS.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/pci-bridge.h    |   5 +
 arch/powerpc/platforms/pseries/pseries.h |   1 +
 arch/powerpc/kernel/pci-common.c         |   6 +
 arch/powerpc/platforms/pseries/msi.c     | 185 +++++++++++++++++++++++
 arch/powerpc/platforms/pseries/setup.c   |   2 +
 5 files changed, 199 insertions(+)

diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include=
/asm/pci-bridge.h
index 74424c14515c..90f488fa4c17 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -126,6 +126,11 @@ struct pci_controller {
 #endif	/* CONFIG_PPC64 */
=20
 	void *private_data;
+
+	/* IRQ domain hierarchy */
+	struct irq_domain	*dev_domain;
+	struct irq_domain	*msi_domain;
+	struct fwnode_handle	*fwnode;
 };
=20
 /* These are used for config access before all the PCI probing
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/plat=
forms/pseries/pseries.h
index 1f051a786fb3..d9280262588b 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -85,6 +85,7 @@ struct pci_host_bridge;
 int pseries_root_bridge_prepare(struct pci_host_bridge *bridge);
=20
 extern struct pci_controller_ops pseries_pci_controller_ops;
+int pseries_msi_allocate_domains(struct pci_controller *phb);
=20
 unsigned long pseries_memory_block_size(void);
=20
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-c=
ommon.c
index 001e90cd8948..c3573430919d 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -29,6 +29,7 @@
 #include <linux/slab.h>
 #include <linux/vgaarb.h>
 #include <linux/numa.h>
+#include <linux/msi.h>
=20
 #include <asm/processor.h>
 #include <asm/io.h>
@@ -1060,11 +1061,16 @@ void pcibios_bus_add_device(struct pci_dev *dev)
=20
 int pcibios_add_device(struct pci_dev *dev)
 {
+	struct irq_domain *d;
+
 #ifdef CONFIG_PCI_IOV
 	if (ppc_md.pcibios_fixup_sriov)
 		ppc_md.pcibios_fixup_sriov(dev);
 #endif /* CONFIG_PCI_IOV */
=20
+	d =3D dev_get_msi_domain(&dev->bus->dev);
+	if (d)
+		dev_set_msi_domain(&dev->dev, d);
 	return 0;
 }
=20
diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platform=
s/pseries/msi.c
index 4bf14f27e1aa..86c6809ebac2 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -13,6 +13,7 @@
 #include <asm/hw_irq.h>
 #include <asm/ppc-pci.h>
 #include <asm/machdep.h>
+#include <asm/xive.h>
=20
 #include "pseries.h"
=20
@@ -518,6 +519,190 @@ static int rtas_setup_msi_irqs(struct pci_dev *pdev=
, int nvec_in, int type)
 	return 0;
 }
=20
+static int pseries_msi_ops_prepare(struct irq_domain *domain, struct dev=
ice *dev,
+				   int nvec, msi_alloc_info_t *arg)
+{
+	struct pci_dev *pdev =3D to_pci_dev(dev);
+	struct msi_desc *desc =3D first_pci_msi_entry(pdev);
+	int type =3D desc->msi_attrib.is_msix ? PCI_CAP_ID_MSIX : PCI_CAP_ID_MS=
I;
+
+	return rtas_prepare_msi_irqs(pdev, nvec, type, arg);
+}
+
+static struct msi_domain_ops pseries_pci_msi_domain_ops =3D {
+	.msi_prepare	=3D pseries_msi_ops_prepare,
+};
+
+static void pseries_msi_shutdown(struct irq_data *d)
+{
+	d =3D d->parent_data;
+	if (d->chip->irq_shutdown)
+		d->chip->irq_shutdown(d);
+}
+
+static void pseries_msi_mask(struct irq_data *d)
+{
+	pci_msi_mask_irq(d);
+	irq_chip_mask_parent(d);
+}
+
+static void pseries_msi_unmask(struct irq_data *d)
+{
+	pci_msi_unmask_irq(d);
+	irq_chip_unmask_parent(d);
+}
+
+static struct irq_chip pseries_pci_msi_irq_chip =3D {
+	.name		=3D "pSeries-PCI-MSI",
+	.irq_shutdown	=3D pseries_msi_shutdown,
+	.irq_mask	=3D pseries_msi_mask,
+	.irq_unmask	=3D pseries_msi_unmask,
+	.irq_eoi	=3D irq_chip_eoi_parent,
+};
+
+static struct msi_domain_info pseries_msi_domain_info =3D {
+	.flags =3D (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
+		  MSI_FLAG_MULTI_PCI_MSI  | MSI_FLAG_PCI_MSIX),
+	.ops   =3D &pseries_pci_msi_domain_ops,
+	.chip  =3D &pseries_pci_msi_irq_chip,
+};
+
+static void pseries_msi_compose_msg(struct irq_data *data, struct msi_ms=
g *msg)
+{
+	__pci_read_msi_msg(irq_data_get_msi_desc(data), msg);
+}
+
+static struct irq_chip pseries_msi_irq_chip =3D {
+	.name			=3D "pSeries-MSI",
+	.irq_shutdown		=3D pseries_msi_shutdown,
+	.irq_mask		=3D irq_chip_mask_parent,
+	.irq_unmask		=3D irq_chip_unmask_parent,
+	.irq_eoi		=3D irq_chip_eoi_parent,
+	.irq_set_affinity	=3D irq_chip_set_affinity_parent,
+	.irq_compose_msi_msg	=3D pseries_msi_compose_msg,
+};
+
+static int pseries_irq_parent_domain_alloc(struct irq_domain *domain, un=
signed int virq,
+					   irq_hw_number_t hwirq)
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
+static int pseries_irq_domain_alloc(struct irq_domain *domain, unsigned =
int virq,
+				    unsigned int nr_irqs, void *arg)
+{
+	struct pci_controller *phb =3D domain->host_data;
+	msi_alloc_info_t *info =3D arg;
+	struct msi_desc *desc =3D info->desc;
+	struct pci_dev *pdev =3D msi_desc_to_pci_dev(desc);
+	int hwirq;
+	int i, ret;
+
+	hwirq =3D rtas_query_irq_number(pci_get_pdn(pdev), desc->msi_attrib.ent=
ry_nr);
+	if (hwirq < 0) {
+		dev_err(&pdev->dev, "Failed to query HW IRQ: %d\n", hwirq);
+		return hwirq;
+	}
+
+	dev_dbg(&pdev->dev, "%s bridge %pOF %d/%x #%d\n", __func__,
+		phb->dn, virq, hwirq, nr_irqs);
+
+	for (i =3D 0; i < nr_irqs; i++) {
+		ret =3D pseries_irq_parent_domain_alloc(domain, virq + i, hwirq + i);
+		if (ret)
+			goto out;
+
+		irq_domain_set_hwirq_and_chip(domain, virq + i, hwirq + i,
+					      &pseries_msi_irq_chip, domain->host_data);
+	}
+
+	return 0;
+
+out:
+	/* TODO: handle RTAS cleanup in ->msi_finish() ? */
+	irq_domain_free_irqs_parent(domain, virq, i - 1);
+	return ret;
+}
+
+static void pseries_irq_domain_free(struct irq_domain *domain, unsigned =
int virq,
+				    unsigned int nr_irqs)
+{
+	struct irq_data *d =3D irq_domain_get_irq_data(domain, virq);
+	struct pci_controller *phb =3D irq_data_get_irq_chip_data(d);
+
+	pr_debug("%s bridge %pOF %d #%d\n", __func__, phb->dn, virq, nr_irqs);
+
+	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
+}
+
+static const struct irq_domain_ops pseries_irq_domain_ops =3D {
+	.alloc  =3D pseries_irq_domain_alloc,
+	.free   =3D pseries_irq_domain_free,
+};
+
+static int __pseries_msi_allocate_domains(struct pci_controller *phb,
+					  unsigned int count)
+{
+	struct irq_domain *parent =3D irq_get_default_host();
+
+	phb->fwnode =3D irq_domain_alloc_named_id_fwnode("pSeries-MSI",
+						       phb->global_number);
+	if (!phb->fwnode)
+		return -ENOMEM;
+
+	phb->dev_domain =3D irq_domain_create_hierarchy(parent, 0, count,
+						      phb->fwnode,
+						      &pseries_irq_domain_ops, phb);
+	if (!phb->dev_domain) {
+		pr_err("PCI: failed to create IRQ domain bridge %pOF (domain %d)\n",
+		       phb->dn, phb->global_number);
+		irq_domain_free_fwnode(phb->fwnode);
+		return -ENOMEM;
+	}
+
+	phb->msi_domain =3D pci_msi_create_irq_domain(of_node_to_fwnode(phb->dn=
),
+						    &pseries_msi_domain_info,
+						    phb->dev_domain);
+	if (!phb->msi_domain) {
+		pr_err("PCI: failed to create MSI IRQ domain bridge %pOF (domain %d)\n=
",
+		       phb->dn, phb->global_number);
+		irq_domain_free_fwnode(phb->fwnode);
+		irq_domain_remove(phb->dev_domain);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+int pseries_msi_allocate_domains(struct pci_controller *phb)
+{
+	int count;
+
+	/* Only supported by the XIVE driver */
+	if (!xive_enabled())
+		return -ENODEV;
+
+	if (!__find_pe_total_msi(phb->dn, &count)) {
+		pr_err("PCI: failed to find MSIs for bridge %pOF (domain %d)\n",
+		       phb->dn, phb->global_number);
+		return -ENOSPC;
+	}
+
+	return __pseries_msi_allocate_domains(phb, count);
+}
+
 static void rtas_msi_pci_irq_fixup(struct pci_dev *pdev)
 {
 	/* No LSI -> leave MSIs (if any) configured */
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platfo=
rms/pseries/setup.c
index 754e493b7c05..307dc768f2fa 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -486,6 +486,8 @@ static void __init pSeries_discover_phbs(void)
=20
 		/* create pci_dn's for DT nodes under this PHB */
 		pci_devs_phb_init_dynamic(phb);
+
+		pseries_msi_allocate_domains(phb);
 	}
=20
 	of_node_put(root);
--=20
2.31.1

