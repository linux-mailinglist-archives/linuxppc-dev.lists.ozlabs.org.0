Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 298C23B924A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:31:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFzcr0n77z3dn5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 23:31:08 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFzYW5kLbz303j
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 23:28:14 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161D2iql178552; Thu, 1 Jul 2021 09:28:08 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39hc20521a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:28:08 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 161DL6jS022255;
 Thu, 1 Jul 2021 13:28:06 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 39duv8h8w8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 13:28:06 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 161DS3Ee26280234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 13:28:03 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AA394204F;
 Thu,  1 Jul 2021 13:28:03 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 65C5D420B5;
 Thu,  1 Jul 2021 13:28:03 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  1 Jul 2021 13:28:03 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.183])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D24332201CC;
 Thu,  1 Jul 2021 15:28:02 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 13/32] KVM: PPC: Book3S HV: Use the new IRQ chip to detect
 passthrough interrupts
Date: Thu,  1 Jul 2021 15:27:31 +0200
Message-Id: <20210701132750.1475580-14-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210701132750.1475580-1-clg@kaod.org>
References: <20210701132750.1475580-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -sHvZbGzhsuiP67kWxBtc9WVHYsZDuK6
X-Proofpoint-ORIG-GUID: -sHvZbGzhsuiP67kWxBtc9WVHYsZDuK6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_07:2021-07-01,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=587
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1034 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107010082
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

Passthrough PCI MSI interrupts are detected in KVM with a check on a
specific EOI handler (P8) or on XIVE (P9). We can now check the
PCI-MSI IRQ chip which is cleaner.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/kvm/book3s_hv.c              | 2 +-
 arch/powerpc/platforms/powernv/pci-ioda.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index dd39b5373075..048b4ca55cfe 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5260,7 +5260,7 @@ static int kvmppc_set_passthru_irq(struct kvm *kvm,=
 int host_irq, int guest_gsi)
 	 * what our real-mode EOI code does, or a XIVE interrupt
 	 */
 	chip =3D irq_data_get_irq_chip(&desc->irq_data);
-	if (!chip || !(is_pnv_opal_msi(chip) || is_xive_irq(chip))) {
+	if (!chip || !is_pnv_opal_msi(chip)) {
 		pr_warn("kvmppc_set_passthru_irq_hv: Could not assign IRQ map for (%d,=
%d)\n",
 			host_irq, guest_gsi);
 		mutex_unlock(&kvm->lock);
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/pla=
tforms/powernv/pci-ioda.c
index d2a17fcb6002..e77caa4dbbdf 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2007,13 +2007,15 @@ void pnv_set_msi_irq_chip(struct pnv_phb *phb, un=
signed int virq)
 	irq_set_chip(virq, &phb->ioda.irq_chip);
 }
=20
+static struct irq_chip pnv_pci_msi_irq_chip;
+
 /*
  * Returns true iff chip is something that we could call
  * pnv_opal_pci_msi_eoi for.
  */
 bool is_pnv_opal_msi(struct irq_chip *chip)
 {
-	return chip->irq_eoi =3D=3D pnv_ioda2_msi_eoi;
+	return chip->irq_eoi =3D=3D pnv_ioda2_msi_eoi || chip =3D=3D &pnv_pci_m=
si_irq_chip;
 }
 EXPORT_SYMBOL_GPL(is_pnv_opal_msi);
=20
--=20
2.31.1

