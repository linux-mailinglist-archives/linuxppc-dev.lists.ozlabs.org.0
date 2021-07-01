Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 458633B925A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:34:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFzhz11Z9z3fy1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 23:34:43 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFzYd4Btlz309X
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 23:28:21 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161D39aF121240; Thu, 1 Jul 2021 09:28:15 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39hcn8kpc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:28:15 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 161DMJSQ001976;
 Thu, 1 Jul 2021 13:28:13 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 39dugh99b0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 13:28:12 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 161DSAmY33554826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 13:28:10 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4182511C078;
 Thu,  1 Jul 2021 13:28:10 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13E5311C0D9;
 Thu,  1 Jul 2021 13:28:10 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  1 Jul 2021 13:28:10 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.183])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 829122201CC;
 Thu,  1 Jul 2021 15:28:09 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 27/32] powerpc/xics: Fix IRQ migration
Date: Thu,  1 Jul 2021 15:27:45 +0200
Message-Id: <20210701132750.1475580-28-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210701132750.1475580-1-clg@kaod.org>
References: <20210701132750.1475580-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: p4kyd6zXlGCsQU8cBl7sM_78QGYAnSbn
X-Proofpoint-ORIG-GUID: p4kyd6zXlGCsQU8cBl7sM_78QGYAnSbn
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_07:2021-07-01,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 suspectscore=0 bulkscore=0 clxscore=1034 mlxscore=0 mlxlogscore=880
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

desc->irq_data points to the top level IRQ data descriptor which is
not necessarily in the XICS IRQ domain. MSIs are in another domain for
instance. Fix that by looking for a mapping on the low level XICS IRQ
domain.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xics/xics-common.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev=
/xics/xics-common.c
index e82d0d4ddec0..0b8b49446992 100644
--- a/arch/powerpc/sysdev/xics/xics-common.c
+++ b/arch/powerpc/sysdev/xics/xics-common.c
@@ -183,6 +183,8 @@ void xics_migrate_irqs_away(void)
 	unsigned int irq, virq;
 	struct irq_desc *desc;
=20
+	pr_debug("%s: CPU %u\n", __func__, cpu);
+
 	/* If we used to be the default server, move to the new "boot_cpuid" */
 	if (hw_cpu =3D=3D xics_default_server)
 		xics_update_irq_servers();
@@ -197,6 +199,7 @@ void xics_migrate_irqs_away(void)
 		struct irq_chip *chip;
 		long server;
 		unsigned long flags;
+		struct irq_data *irqd;
=20
 		/* We can't set affinity on ISA interrupts */
 		if (virq < NUM_ISA_INTERRUPTS)
@@ -204,9 +207,11 @@ void xics_migrate_irqs_away(void)
 		/* We only need to migrate enabled IRQS */
 		if (!desc->action)
 			continue;
-		if (desc->irq_data.domain !=3D xics_host)
+		/* We need a mapping in the XICS IRQ domain */
+		irqd =3D irq_domain_get_irq_data(xics_host, virq);
+		if (!irqd)
 			continue;
-		irq =3D desc->irq_data.hwirq;
+		irq =3D irqd_to_hwirq(irqd);
 		/* We need to get IPIs still. */
 		if (irq =3D=3D XICS_IPI || irq =3D=3D XICS_IRQ_SPURIOUS)
 			continue;
--=20
2.31.1

