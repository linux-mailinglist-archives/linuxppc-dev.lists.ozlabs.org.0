Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E640336F6E8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 10:09:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWlQl50wWz3c5v
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:09:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWlJj73d4z30J5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:04:37 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13U83DRN157320; Fri, 30 Apr 2021 04:04:32 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3889t26ch5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 04:04:32 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13U83xiO023307;
 Fri, 30 Apr 2021 08:04:29 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 384akhaxqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 08:04:29 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13U842uQ24248592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 08:04:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FE255205A;
 Fri, 30 Apr 2021 08:04:27 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 2A5A252051;
 Fri, 30 Apr 2021 08:04:27 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 8DCF62200B7;
 Fri, 30 Apr 2021 10:04:26 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 30/31] KVM: PPC: Book3S HV: XICS: Fix mapping of passthrough
 interrupts
Date: Fri, 30 Apr 2021 10:04:06 +0200
Message-Id: <20210430080407.4030767-31-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430080407.4030767-1-clg@kaod.org>
References: <20210430080407.4030767-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9HML2Fsvt7zKYB98vPvYWKLSr-TKEgYB
X-Proofpoint-ORIG-GUID: 9HML2Fsvt7zKYB98vPvYWKLSr-TKEgYB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_05:2021-04-28,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=637
 impostorscore=0 bulkscore=0 clxscore=1034 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PCI MSIs now live in an MSI domain but the underlying calls, which
will EOI the interrupt in real mode, need an HW IRQ number mapped in
the XICS IRQ domain. Grab it there.

Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/kvm/book3s_hv.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 9f4eb74a11cc..6058bcc5b61e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5126,6 +5126,7 @@ static int kvmppc_set_passthru_irq(struct kvm *kvm,=
 int host_irq, int guest_gsi)
 	struct kvmppc_passthru_irqmap *pimap;
 	struct irq_chip *chip;
 	int i, rc =3D 0;
+	struct irq_data *host_data;
=20
 	if (!kvm_irq_bypass)
 		return 1;
@@ -5190,7 +5191,14 @@ static int kvmppc_set_passthru_irq(struct kvm *kvm=
, int host_irq, int guest_gsi)
 	 * the KVM real mode handler.
 	 */
 	smp_wmb();
-	irq_map->r_hwirq =3D desc->irq_data.hwirq;
+
+	/*
+	 * The 'host_irq' number is mapped in the PCI-MSI domain but
+	 * the underlying calls, which will EOI the interrupt in real
+	 * mode, need an HW IRQ number mapped in the XICS IRQ domain.
+	 */
+	host_data =3D irq_domain_get_irq_data(irq_get_default_host(), host_irq)=
;
+	irq_map->r_hwirq =3D (unsigned int)irqd_to_hwirq(host_data);
=20
 	if (i =3D=3D pimap->n_mapped)
 		pimap->n_mapped++;
@@ -5198,7 +5206,7 @@ static int kvmppc_set_passthru_irq(struct kvm *kvm,=
 int host_irq, int guest_gsi)
 	if (xics_on_xive())
 		rc =3D kvmppc_xive_set_mapped(kvm, guest_gsi, host_irq);
 	else
-		kvmppc_xics_set_mapped(kvm, guest_gsi, desc->irq_data.hwirq);
+		kvmppc_xics_set_mapped(kvm, guest_gsi, irq_map->r_hwirq);
 	if (rc)
 		irq_map->r_hwirq =3D 0;
=20
--=20
2.26.3

