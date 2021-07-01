Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC553B9260
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:35:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFzk96WvGz3gJG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 23:35:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFzYf2Xd6z3bT7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 23:28:22 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161D3m4U136507; Thu, 1 Jul 2021 09:28:16 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39h950akqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:28:16 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 161DKxX3019834;
 Thu, 1 Jul 2021 13:28:14 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 39duv8h9ae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 13:28:13 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 161DSB2f20316424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 13:28:11 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5BCEA13A0A4;
 Thu,  1 Jul 2021 13:28:11 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F5C513A09D;
 Thu,  1 Jul 2021 13:28:11 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  1 Jul 2021 13:28:11 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.183])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 909A22201CC;
 Thu,  1 Jul 2021 15:28:10 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 29/32] powerpc/powernv/pci: Rework pnv_opal_pci_msi_eoi()
Date: Thu,  1 Jul 2021 15:27:47 +0200
Message-Id: <20210701132750.1475580-30-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210701132750.1475580-1-clg@kaod.org>
References: <20210701132750.1475580-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tDtC4kKtAg9RGtJjd_-xaPcFtpAAa5XT
X-Proofpoint-GUID: tDtC4kKtAg9RGtJjd_-xaPcFtpAAa5XT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_07:2021-07-01,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 mlxlogscore=972 clxscore=1034
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010082
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pnv_opal_pci_msi_eoi() is called from KVM to EOI passthrough interrupts
when in real mode. Adding MSI domain broke the hack using the
'ioda.irq_chip' field to deduce the owning PHB. Fix that by using the
IRQ chip data in the MSI domain.

The 'ioda.irq_chip' field is now unused and could be removed from the
pnv_phb struct.

Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/pnv-pci.h        |  2 +-
 arch/powerpc/kvm/book3s_hv_rm_xics.c      |  8 ++++----
 arch/powerpc/platforms/powernv/pci-ioda.c | 17 +++++++++++++----
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/pnv-pci.h b/arch/powerpc/include/as=
m/pnv-pci.h
index d0ee0ede5767..b3f480799352 100644
--- a/arch/powerpc/include/asm/pnv-pci.h
+++ b/arch/powerpc/include/asm/pnv-pci.h
@@ -33,7 +33,7 @@ int pnv_cxl_alloc_hwirqs(struct pci_dev *dev, int num);
 void pnv_cxl_release_hwirqs(struct pci_dev *dev, int hwirq, int num);
 int pnv_cxl_get_irq_count(struct pci_dev *dev);
 struct device_node *pnv_pci_get_phb_node(struct pci_dev *dev);
-int64_t pnv_opal_pci_msi_eoi(struct irq_chip *chip, unsigned int hw_irq)=
;
+int64_t pnv_opal_pci_msi_eoi(struct irq_data *d);
 bool is_pnv_opal_msi(struct irq_chip *chip);
=20
 #ifdef CONFIG_CXL_BASE
diff --git a/arch/powerpc/kvm/book3s_hv_rm_xics.c b/arch/powerpc/kvm/book=
3s_hv_rm_xics.c
index 0a11ec88a0ae..587c33fc4564 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_xics.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_xics.c
@@ -706,6 +706,7 @@ static int ics_rm_eoi(struct kvm_vcpu *vcpu, u32 irq)
 		icp->rm_eoied_irq =3D irq;
 	}
=20
+	/* Handle passthrough interrupts */
 	if (state->host_irq) {
 		++vcpu->stat.pthru_all;
 		if (state->intr_cpu !=3D -1) {
@@ -759,12 +760,12 @@ int xics_rm_h_eoi(struct kvm_vcpu *vcpu, unsigned l=
ong xirr)
=20
 static unsigned long eoi_rc;
=20
-static void icp_eoi(struct irq_chip *c, u32 hwirq, __be32 xirr, bool *ag=
ain)
+static void icp_eoi(struct irq_data *d, u32 hwirq, __be32 xirr, bool *ag=
ain)
 {
 	void __iomem *xics_phys;
 	int64_t rc;
=20
-	rc =3D pnv_opal_pci_msi_eoi(c, hwirq);
+	rc =3D pnv_opal_pci_msi_eoi(d);
=20
 	if (rc)
 		eoi_rc =3D rc;
@@ -872,8 +873,7 @@ long kvmppc_deliver_irq_passthru(struct kvm_vcpu *vcp=
u,
 		icp_rm_deliver_irq(xics, icp, irq, false);
=20
 	/* EOI the interrupt */
-	icp_eoi(irq_desc_get_chip(irq_map->desc), irq_map->r_hwirq, xirr,
-		again);
+	icp_eoi(irq_desc_get_irq_data(irq_map->desc), irq_map->r_hwirq, xirr, a=
gain);
=20
 	if (check_too_hard(xics, icp) =3D=3D H_TOO_HARD)
 		return 2;
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/pla=
tforms/powernv/pci-ioda.c
index aa97245eedbf..2389cd79c3c8 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1963,12 +1963,21 @@ void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *p=
hb,
 	pe->dma_setup_done =3D true;
 }
=20
-int64_t pnv_opal_pci_msi_eoi(struct irq_chip *chip, unsigned int hw_irq)
+/*
+ * Called from KVM in real mode to EOI passthru interrupts. The ICP
+ * EOI is handled directly in KVM in kvmppc_deliver_irq_passthru().
+ *
+ * The IRQ data is mapped in the PCI-MSI domain and the EOI OPAL call
+ * needs an HW IRQ number mapped in the XICS IRQ domain. The HW IRQ
+ * numbers of the in-the-middle MSI domain are vector numbers and it's
+ * good enough for OPAL. Use that.
+ */
+int64_t pnv_opal_pci_msi_eoi(struct irq_data *d)
 {
-	struct pnv_phb *phb =3D container_of(chip, struct pnv_phb,
-					   ioda.irq_chip);
+	struct pci_controller *hose =3D irq_data_get_irq_chip_data(d->parent_da=
ta);
+	struct pnv_phb *phb =3D hose->private_data;
=20
-	return opal_pci_msi_eoi(phb->opal_id, hw_irq);
+	return opal_pci_msi_eoi(phb->opal_id, d->parent_data->hwirq);
 }
=20
 /*
--=20
2.31.1

