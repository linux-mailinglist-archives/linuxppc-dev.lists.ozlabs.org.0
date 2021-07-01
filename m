Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 983DB3B9250
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:32:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFzfC41y3z3f8B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 23:32:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFzYZ1fzXz304Y
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 23:28:18 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161D5MlD142777; Thu, 1 Jul 2021 09:28:11 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39hbs5djcq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:28:11 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 161DLa0o023673;
 Thu, 1 Jul 2021 13:28:09 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 39duv8aeat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 13:28:09 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 161DS7tN34931148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 13:28:07 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57DA511C0C6;
 Thu,  1 Jul 2021 13:28:07 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A00C11C0DA;
 Thu,  1 Jul 2021 13:28:07 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  1 Jul 2021 13:28:07 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.183])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 990342201CC;
 Thu,  1 Jul 2021 15:28:06 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 21/32] powerpc/powernv/pci: Customize the MSI EOI handler
 to support PHB3
Date: Thu,  1 Jul 2021 15:27:39 +0200
Message-Id: <20210701132750.1475580-22-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210701132750.1475580-1-clg@kaod.org>
References: <20210701132750.1475580-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7JkR8A0QPzVOKvARcKWPBCmOoMUbEsIw
X-Proofpoint-GUID: 7JkR8A0QPzVOKvARcKWPBCmOoMUbEsIw
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_07:2021-07-01,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=870 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 impostorscore=0 clxscore=1034
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PHB3s need an extra OPAL call to EOI the interrupt. The call takes an
OPAL HW IRQ number but it is translated into a vector number in OPAL.
Here, we directly use the vector number of the in-the-middle "PNV-MSI"
domain instead of grabbing the OPAL HW IRQ number in the XICS parent
domain.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/pla=
tforms/powernv/pci-ioda.c
index e77caa4dbbdf..b498876a976f 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2169,12 +2169,33 @@ static void pnv_msi_compose_msg(struct irq_data *=
d, struct msi_msg *msg)
 			entry->msi_attrib.is_64 ? "64" : "32", d->hwirq, rc);
 }
=20
+/*
+ * The IRQ data is mapped in the MSI domain in which HW IRQ numbers
+ * correspond to vector numbers.
+ */
+static void pnv_msi_eoi(struct irq_data *d)
+{
+	struct pci_controller *hose =3D irq_data_get_irq_chip_data(d);
+	struct pnv_phb *phb =3D hose->private_data;
+
+	if (phb->model =3D=3D PNV_PHB_MODEL_PHB3) {
+		/*
+		 * The EOI OPAL call takes an OPAL HW IRQ number but
+		 * since it is translated into a vector number in
+		 * OPAL, use that directly.
+		 */
+		WARN_ON_ONCE(opal_pci_msi_eoi(phb->opal_id, d->hwirq));
+	}
+
+	irq_chip_eoi_parent(d);
+}
+
 static struct irq_chip pnv_msi_irq_chip =3D {
 	.name			=3D "PNV-MSI",
 	.irq_shutdown		=3D pnv_msi_shutdown,
 	.irq_mask		=3D irq_chip_mask_parent,
 	.irq_unmask		=3D irq_chip_unmask_parent,
-	.irq_eoi		=3D irq_chip_eoi_parent,
+	.irq_eoi		=3D pnv_msi_eoi,
 	.irq_set_affinity	=3D irq_chip_set_affinity_parent,
 	.irq_compose_msi_msg	=3D pnv_msi_compose_msg,
 };
--=20
2.31.1

