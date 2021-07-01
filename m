Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BCD3B924C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:31:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFzdW3JkSz3dxr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 23:31:43 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFzYY1FJLz303k
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 23:28:17 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161D49UY067883; Thu, 1 Jul 2021 09:28:09 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39hcxdkceb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:28:09 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 161DLnYv023687;
 Thu, 1 Jul 2021 13:28:07 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 39duv8aeap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 13:28:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 161DS5Yh33751414
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 13:28:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D68D4C04E;
 Thu,  1 Jul 2021 13:28:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D30124C050;
 Thu,  1 Jul 2021 13:28:04 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  1 Jul 2021 13:28:04 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.183])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 4DCFE22016C;
 Thu,  1 Jul 2021 15:28:04 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 16/32] powerpc/xics: Remove ICS list
Date: Thu,  1 Jul 2021 15:27:34 +0200
Message-Id: <20210701132750.1475580-17-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210701132750.1475580-1-clg@kaod.org>
References: <20210701132750.1475580-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Fde7E0OxjlklObSTH6itEyu2VISggtec
X-Proofpoint-ORIG-GUID: Fde7E0OxjlklObSTH6itEyu2VISggtec
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_07:2021-07-01,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 impostorscore=0 mlxlogscore=828 clxscore=1034
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
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

We always had only one ICS per machine. Simplify the XICS driver by
removing the ICS list.

The ICS stored in the chip data of the XICS domain becomes useless and
we don't need it anymore to migrate away IRQs from a CPU. This will be
removed in a subsequent patch.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xics/xics-common.c | 45 +++++++++++---------------
 1 file changed, 19 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev=
/xics/xics-common.c
index 7c561a612366..05e5e7d84ca7 100644
--- a/arch/powerpc/sysdev/xics/xics-common.c
+++ b/arch/powerpc/sysdev/xics/xics-common.c
@@ -38,7 +38,7 @@ DEFINE_PER_CPU(struct xics_cppr, xics_cppr);
=20
 struct irq_domain *xics_host;
=20
-static LIST_HEAD(ics_list);
+static struct ics *xics_ics;
=20
 void xics_update_irq_servers(void)
 {
@@ -111,12 +111,11 @@ void xics_setup_cpu(void)
=20
 void xics_mask_unknown_vec(unsigned int vec)
 {
-	struct ics *ics;
-
 	pr_err("Interrupt 0x%x (real) is invalid, disabling it.\n", vec);
=20
-	list_for_each_entry(ics, &ics_list, link)
-		ics->mask_unknown(ics, vec);
+	if (WARN_ON(!xics_ics))
+		return;
+	xics_ics->mask_unknown(xics_ics, vec);
 }
=20
=20
@@ -198,7 +197,6 @@ void xics_migrate_irqs_away(void)
 		struct irq_chip *chip;
 		long server;
 		unsigned long flags;
-		struct ics *ics;
=20
 		/* We can't set affinity on ISA interrupts */
 		if (virq < NUM_ISA_INTERRUPTS)
@@ -219,13 +217,10 @@ void xics_migrate_irqs_away(void)
 		raw_spin_lock_irqsave(&desc->lock, flags);
=20
 		/* Locate interrupt server */
-		server =3D -1;
-		ics =3D irq_desc_get_chip_data(desc);
-		if (ics)
-			server =3D ics->get_server(ics, irq);
+		server =3D xics_ics->get_server(xics_ics, irq);
 		if (server < 0) {
-			printk(KERN_ERR "%s: Can't find server for irq %d\n",
-			       __func__, irq);
+			pr_err("%s: Can't find server for irq %d/%x\n",
+			       __func__, virq, irq);
 			goto unlock;
 		}
=20
@@ -307,13 +302,9 @@ int xics_get_irq_server(unsigned int virq, const str=
uct cpumask *cpumask,
 static int xics_host_match(struct irq_domain *h, struct device_node *nod=
e,
 			   enum irq_domain_bus_token bus_token)
 {
-	struct ics *ics;
-
-	list_for_each_entry(ics, &ics_list, link)
-		if (ics->host_match(ics, node))
-			return 1;
-
-	return 0;
+	if (WARN_ON(!xics_ics))
+		return 0;
+	return xics_ics->host_match(xics_ics, node) ? 1 : 0;
 }
=20
 /* Dummies */
@@ -330,8 +321,6 @@ static struct irq_chip xics_ipi_chip =3D {
 static int xics_host_map(struct irq_domain *h, unsigned int virq,
 			 irq_hw_number_t hw)
 {
-	struct ics *ics;
-
 	pr_devel("xics: map virq %d, hwirq 0x%lx\n", virq, hw);
=20
 	/*
@@ -348,12 +337,14 @@ static int xics_host_map(struct irq_domain *h, unsi=
gned int virq,
 		return 0;
 	}
=20
+	if (WARN_ON(!xics_ics))
+		return -EINVAL;
+
 	/* Let the ICS setup the chip data */
-	list_for_each_entry(ics, &ics_list, link)
-		if (ics->map(ics, virq) =3D=3D 0)
-			return 0;
+	if (xics_ics->map(xics_ics, virq))
+		return -EINVAL;
=20
-	return -EINVAL;
+	return 0;
 }
=20
 static int xics_host_xlate(struct irq_domain *h, struct device_node *ct,
@@ -427,7 +418,9 @@ static void __init xics_init_host(void)
=20
 void __init xics_register_ics(struct ics *ics)
 {
-	list_add(&ics->link, &ics_list);
+	if (WARN_ONCE(xics_ics, "XICS: Source Controller is already defined !")=
)
+		return;
+	xics_ics =3D ics;
 }
=20
 static void __init xics_get_server_size(void)
--=20
2.31.1

