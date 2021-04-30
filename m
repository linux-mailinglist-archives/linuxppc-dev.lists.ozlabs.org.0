Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6CA36F6E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 10:09:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWlQP1HVdz3dxk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:09:33 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWlJh6kmHz30NP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:04:36 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13U84PZw181654; Fri, 30 Apr 2021 04:04:30 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 388e1v00tt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 04:04:30 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13U84Ndt031161;
 Fri, 30 Apr 2021 08:04:23 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 384ay8jxyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 08:04:23 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13U83uXT31392006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 08:03:56 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDB22AE05D;
 Fri, 30 Apr 2021 08:04:20 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1179AE05A;
 Fri, 30 Apr 2021 08:04:20 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 30 Apr 2021 08:04:20 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.40.192])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2AC52220193;
 Fri, 30 Apr 2021 10:04:20 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 17/31] powerpc/xics: Rename the map handler in a check handler
Date: Fri, 30 Apr 2021 10:03:53 +0200
Message-Id: <20210430080407.4030767-18-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210430080407.4030767-1-clg@kaod.org>
References: <20210430080407.4030767-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1Lu8ih8ABYi16Py64__x4_aI0NKe_cXA
X-Proofpoint-ORIG-GUID: 1Lu8ih8ABYi16Py64__x4_aI0NKe_cXA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-30_03:2021-04-28,
 2021-04-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 mlxlogscore=679 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

This moves the IRQ initialization done under the OPAL and RTAS backends
in the common part of XICS. The 'map' handler becomes a simple 'check'
on the HW IRQ at the FW level.

As we don't need an ICS anymore in xics_migrate_irqs_away(), the XICS
domain does not set a chip data for the IRQ.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/xics.h        |  3 ++-
 arch/powerpc/sysdev/xics/ics-opal.c    | 27 +++++++++----------------
 arch/powerpc/sysdev/xics/ics-rtas.c    | 28 +++++++++-----------------
 arch/powerpc/sysdev/xics/xics-common.c | 15 ++++++++------
 4 files changed, 31 insertions(+), 42 deletions(-)

diff --git a/arch/powerpc/include/asm/xics.h b/arch/powerpc/include/asm/x=
ics.h
index 8e903b3f9c24..01b51a926f56 100644
--- a/arch/powerpc/include/asm/xics.h
+++ b/arch/powerpc/include/asm/xics.h
@@ -85,10 +85,11 @@ static inline int ics_opal_init(void) { return -ENODE=
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
index 509b9432c368..2fa45cd12a82 100644
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
2.26.3

