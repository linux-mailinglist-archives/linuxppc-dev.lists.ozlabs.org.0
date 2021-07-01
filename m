Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5341C3B9265
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 15:36:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFzlC1hy2z3fFp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jul 2021 23:36:39 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFzYh6bPjz3bXj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jul 2021 23:28:24 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161D3nEg136546; Thu, 1 Jul 2021 09:28:11 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39h950akmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:28:11 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 161DKgs9005615;
 Thu, 1 Jul 2021 13:28:08 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 39ft8erqaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 13:28:07 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 161DQRYZ25690502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Jul 2021 13:26:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BCEF420A2;
 Thu,  1 Jul 2021 13:28:05 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CB344204F;
 Thu,  1 Jul 2021 13:28:05 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu,  1 Jul 2021 13:28:05 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.33.183])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id BE3862201CC;
 Thu,  1 Jul 2021 15:28:04 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 17/32] powerpc/xics: Rename the map handler in a check
 handler
Date: Thu,  1 Jul 2021 15:27:35 +0200
Message-Id: <20210701132750.1475580-18-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210701132750.1475580-1-clg@kaod.org>
References: <20210701132750.1475580-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hTcsgbi990ssNbx6-AldIIhwJwUGnYzJ
X-Proofpoint-GUID: hTcsgbi990ssNbx6-AldIIhwJwUGnYzJ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_07:2021-07-01,
 2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 mlxlogscore=731 clxscore=1034
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This moves the IRQ initialization done under the different ICS backends
in the common part of XICS. The 'map' handler becomes a simple 'check'
on the HW IRQ at the FW level.

As we don't need an ICS anymore in xics_migrate_irqs_away(), the XICS
domain does not set a chip data for the IRQ.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/xics.h        |  3 ++-
 arch/powerpc/sysdev/xics/ics-native.c  | 13 +++++-------
 arch/powerpc/sysdev/xics/ics-opal.c    | 27 +++++++++----------------
 arch/powerpc/sysdev/xics/ics-rtas.c    | 28 +++++++++-----------------
 arch/powerpc/sysdev/xics/xics-common.c | 15 ++++++++------
 5 files changed, 36 insertions(+), 50 deletions(-)

diff --git a/arch/powerpc/include/asm/xics.h b/arch/powerpc/include/asm/x=
ics.h
index 584dcf903590..e76d835dc03f 100644
--- a/arch/powerpc/include/asm/xics.h
+++ b/arch/powerpc/include/asm/xics.h
@@ -89,10 +89,11 @@ static inline int ics_opal_init(void) { return -ENODE=
V; }
 /* ICS instance, hooked up to chip_data of an irq */
 struct ics {
 	struct list_head link;
-	int (*map)(struct ics *ics, unsigned int virq);
+	int (*check)(struct ics *ics, unsigned int hwirq);
 	void (*mask_unknown)(struct ics *ics, unsigned long vec);
 	long (*get_server)(struct ics *ics, unsigned long vec);
 	int (*host_match)(struct ics *ics, struct device_node *node);
+	struct irq_chip *chip;
 	char data[];
 };
=20
diff --git a/arch/powerpc/sysdev/xics/ics-native.c b/arch/powerpc/sysdev/=
xics/ics-native.c
index d450502f4053..dec7d93a8ba1 100644
--- a/arch/powerpc/sysdev/xics/ics-native.c
+++ b/arch/powerpc/sysdev/xics/ics-native.c
@@ -131,19 +131,15 @@ static struct irq_chip ics_native_irq_chip =3D {
 	.irq_retrigger		=3D xics_retrigger,
 };
=20
-static int ics_native_map(struct ics *ics, unsigned int virq)
+static int ics_native_check(struct ics *ics, unsigned int hw_irq)
 {
-	unsigned int vec =3D (unsigned int)virq_to_hw(virq);
 	struct ics_native *in =3D to_ics_native(ics);
=20
-	pr_devel("%s: vec=3D0x%x\n", __func__, vec);
+	pr_devel("%s: hw_irq=3D0x%x\n", __func__, hw_irq);
=20
-	if (vec < in->ibase || vec >=3D (in->ibase + in->icount))
+	if (hw_irq < in->ibase || hw_irq >=3D (in->ibase + in->icount))
 		return -EINVAL;
=20
-	irq_set_chip_and_handler(virq, &ics_native_irq_chip, handle_fasteoi_irq=
);
-	irq_set_chip_data(virq, ics);
-
 	return 0;
 }
=20
@@ -177,10 +173,11 @@ static int ics_native_host_match(struct ics *ics, s=
truct device_node *node)
 }
=20
 static struct ics ics_native_template =3D {
-	.map		=3D ics_native_map,
+	.check		=3D ics_native_check,
 	.mask_unknown	=3D ics_native_mask_unknown,
 	.get_server	=3D ics_native_get_server,
 	.host_match	=3D ics_native_host_match,
+	.chip =3D &ics_native_irq_chip,
 };
=20
 static int __init ics_native_add_one(struct device_node *np)
diff --git a/arch/powerpc/sysdev/xics/ics-opal.c b/arch/powerpc/sysdev/xi=
cs/ics-opal.c
index 823f6c9664cd..8c7ddcc718b6 100644
--- a/arch/powerpc/sysdev/xics/ics-opal.c
+++ b/arch/powerpc/sysdev/xics/ics-opal.c
@@ -157,26 +157,13 @@ static struct irq_chip ics_opal_irq_chip =3D {
 	.irq_retrigger =3D xics_retrigger,
 };
=20
-static int ics_opal_map(struct ics *ics, unsigned int virq);
-static void ics_opal_mask_unknown(struct ics *ics, unsigned long vec);
-static long ics_opal_get_server(struct ics *ics, unsigned long vec);
-
 static int ics_opal_host_match(struct ics *ics, struct device_node *node=
)
 {
 	return 1;
 }
=20
-/* Only one global & state struct ics */
-static struct ics ics_hal =3D {
-	.map		=3D ics_opal_map,
-	.mask_unknown	=3D ics_opal_mask_unknown,
-	.get_server	=3D ics_opal_get_server,
-	.host_match	=3D ics_opal_host_match,
-};
-
-static int ics_opal_map(struct ics *ics, unsigned int virq)
+static int ics_opal_check(struct ics *ics, unsigned int hw_irq)
 {
-	unsigned int hw_irq =3D (unsigned int)virq_to_hw(virq);
 	int64_t rc;
 	__be16 server;
 	int8_t priority;
@@ -189,9 +176,6 @@ static int ics_opal_map(struct ics *ics, unsigned int=
 virq)
 	if (rc !=3D OPAL_SUCCESS)
 		return -ENXIO;
=20
-	irq_set_chip_and_handler(virq, &ics_opal_irq_chip, handle_fasteoi_irq);
-	irq_set_chip_data(virq, &ics_hal);
-
 	return 0;
 }
=20
@@ -222,6 +206,15 @@ static long ics_opal_get_server(struct ics *ics, uns=
igned long vec)
 	return ics_opal_unmangle_server(be16_to_cpu(server));
 }
=20
+/* Only one global & state struct ics */
+static struct ics ics_hal =3D {
+	.check		=3D ics_opal_check,
+	.mask_unknown	=3D ics_opal_mask_unknown,
+	.get_server	=3D ics_opal_get_server,
+	.host_match	=3D ics_opal_host_match,
+	.chip		=3D &ics_opal_irq_chip,
+};
+
 int __init ics_opal_init(void)
 {
 	if (!firmware_has_feature(FW_FEATURE_OPAL))
diff --git a/arch/powerpc/sysdev/xics/ics-rtas.c b/arch/powerpc/sysdev/xi=
cs/ics-rtas.c
index 4cf18000f07c..6d19d711ed35 100644
--- a/arch/powerpc/sysdev/xics/ics-rtas.c
+++ b/arch/powerpc/sysdev/xics/ics-rtas.c
@@ -24,19 +24,6 @@ static int ibm_set_xive;
 static int ibm_int_on;
 static int ibm_int_off;
=20
-static int ics_rtas_map(struct ics *ics, unsigned int virq);
-static void ics_rtas_mask_unknown(struct ics *ics, unsigned long vec);
-static long ics_rtas_get_server(struct ics *ics, unsigned long vec);
-static int ics_rtas_host_match(struct ics *ics, struct device_node *node=
);
-
-/* Only one global & state struct ics */
-static struct ics ics_rtas =3D {
-	.map		=3D ics_rtas_map,
-	.mask_unknown	=3D ics_rtas_mask_unknown,
-	.get_server	=3D ics_rtas_get_server,
-	.host_match	=3D ics_rtas_host_match,
-};
-
 static void ics_rtas_unmask_irq(struct irq_data *d)
 {
 	unsigned int hw_irq =3D (unsigned int)irqd_to_hwirq(d);
@@ -169,9 +156,8 @@ static struct irq_chip ics_rtas_irq_chip =3D {
 	.irq_retrigger =3D xics_retrigger,
 };
=20
-static int ics_rtas_map(struct ics *ics, unsigned int virq)
+static int ics_rtas_check(struct ics *ics, unsigned int hw_irq)
 {
-	unsigned int hw_irq =3D (unsigned int)virq_to_hw(virq);
 	int status[2];
 	int rc;
=20
@@ -183,9 +169,6 @@ static int ics_rtas_map(struct ics *ics, unsigned int=
 virq)
 	if (rc)
 		return -ENXIO;
=20
-	irq_set_chip_and_handler(virq, &ics_rtas_irq_chip, handle_fasteoi_irq);
-	irq_set_chip_data(virq, &ics_rtas);
-
 	return 0;
 }
=20
@@ -213,6 +196,15 @@ static int ics_rtas_host_match(struct ics *ics, stru=
ct device_node *node)
 	return !of_device_is_compatible(node, "chrp,iic");
 }
=20
+/* Only one global & state struct ics */
+static struct ics ics_rtas =3D {
+	.check		=3D ics_rtas_check,
+	.mask_unknown	=3D ics_rtas_mask_unknown,
+	.get_server	=3D ics_rtas_get_server,
+	.host_match	=3D ics_rtas_host_match,
+	.chip =3D &ics_rtas_irq_chip,
+};
+
 __init int ics_rtas_init(void)
 {
 	ibm_get_xive =3D rtas_token("ibm,get-xive");
diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev=
/xics/xics-common.c
index 05e5e7d84ca7..399dd5becf65 100644
--- a/arch/powerpc/sysdev/xics/xics-common.c
+++ b/arch/powerpc/sysdev/xics/xics-common.c
@@ -318,10 +318,10 @@ static struct irq_chip xics_ipi_chip =3D {
 	.irq_unmask =3D xics_ipi_unmask,
 };
=20
-static int xics_host_map(struct irq_domain *h, unsigned int virq,
-			 irq_hw_number_t hw)
+static int xics_host_map(struct irq_domain *domain, unsigned int virq,
+			 irq_hw_number_t hwirq)
 {
-	pr_devel("xics: map virq %d, hwirq 0x%lx\n", virq, hw);
+	pr_devel("xics: map virq %d, hwirq 0x%lx\n", virq, hwirq);
=20
 	/*
 	 * Mark interrupts as edge sensitive by default so that resend
@@ -331,7 +331,7 @@ static int xics_host_map(struct irq_domain *h, unsign=
ed int virq,
 	irq_clear_status_flags(virq, IRQ_LEVEL);
=20
 	/* Don't call into ICS for IPIs */
-	if (hw =3D=3D XICS_IPI) {
+	if (hwirq =3D=3D XICS_IPI) {
 		irq_set_chip_and_handler(virq, &xics_ipi_chip,
 					 handle_percpu_irq);
 		return 0;
@@ -340,10 +340,13 @@ static int xics_host_map(struct irq_domain *h, unsi=
gned int virq,
 	if (WARN_ON(!xics_ics))
 		return -EINVAL;
=20
-	/* Let the ICS setup the chip data */
-	if (xics_ics->map(xics_ics, virq))
+	if (xics_ics->check(xics_ics, hwirq))
 		return -EINVAL;
=20
+	/* No chip data for the XICS domain */
+	irq_domain_set_info(domain, virq, hwirq, xics_ics->chip,
+			    NULL, handle_fasteoi_irq, NULL, NULL);
+
 	return 0;
 }
=20
--=20
2.31.1

