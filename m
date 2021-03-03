Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 299AF32B99B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 18:51:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrM4N0qv9z3d7Y
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 04:51:16 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrM283lsGz3cYP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 04:49:20 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 123HWcfn028826; Wed, 3 Mar 2021 12:49:07 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 372ehyh8ej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 12:49:07 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 123HheFQ031092;
 Wed, 3 Mar 2021 17:49:02 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 371162j2dx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 17:49:02 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 123Hn0OV49611236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Mar 2021 17:49:00 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E90A11C04A;
 Wed,  3 Mar 2021 17:49:00 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C45A11C052;
 Wed,  3 Mar 2021 17:49:00 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  3 Mar 2021 17:49:00 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.87])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A84FE220423;
 Wed,  3 Mar 2021 18:48:59 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/8] powerpc/xive: Introduce an IPI interrupt domain
Date: Wed,  3 Mar 2021 18:48:51 +0100
Message-Id: <20210303174857.1760393-3-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303174857.1760393-1-clg@kaod.org>
References: <20210303174857.1760393-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-03_05:2021-03-03,
 2021-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 malwarescore=0
 impostorscore=0 bulkscore=0 mlxlogscore=712 mlxscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103030124
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
Cc: Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The IPI interrupt is a special case of the XIVE IRQ domain. When
mapping and unmapping the interrupts in the Linux interrupt number
space, the HW interrupt number 0 (XIVE_IPI_HW_IRQ) is checked to
distinguish the IPI interrupt from other interrupts of the system.

Simplify the XIVE interrupt domain by introducing a specific domain
for the IPI.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 51 +++++++++++++------------------
 1 file changed, 22 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index b8e456da28aa..e7783760d278 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -63,6 +63,8 @@ static const struct xive_ops *xive_ops;
 static struct irq_domain *xive_irq_domain;
=20
 #ifdef CONFIG_SMP
+static struct irq_domain *xive_ipi_irq_domain;
+
 /* The IPIs all use the same logical irq number */
 static u32 xive_ipi_irq;
 #endif
@@ -1067,20 +1069,32 @@ static struct irq_chip xive_ipi_chip =3D {
 	.irq_unmask =3D xive_ipi_do_nothing,
 };
=20
+/*
+ * IPIs are marked per-cpu. We use separate HW interrupts under the
+ * hood but associated with the same "linux" interrupt
+ */
+static int xive_ipi_irq_domain_map(struct irq_domain *h, unsigned int vi=
rq,
+				   irq_hw_number_t hw)
+{
+	irq_set_chip_and_handler(virq, &xive_ipi_chip, handle_percpu_irq);
+	return 0;
+}
+
+static const struct irq_domain_ops xive_ipi_irq_domain_ops =3D {
+	.map =3D xive_ipi_irq_domain_map,
+};
+
 static void __init xive_request_ipi(void)
 {
 	unsigned int virq;
=20
-	/*
-	 * Initialization failed, move on, we might manage to
-	 * reach the point where we display our errors before
-	 * the system falls appart
-	 */
-	if (!xive_irq_domain)
+	xive_ipi_irq_domain =3D irq_domain_add_linear(NULL, 1,
+						    &xive_ipi_irq_domain_ops, NULL);
+	if (WARN_ON(xive_ipi_irq_domain =3D=3D NULL))
 		return;
=20
 	/* Initialize it */
-	virq =3D irq_create_mapping(xive_irq_domain, XIVE_IPI_HW_IRQ);
+	virq =3D irq_create_mapping(xive_ipi_irq_domain, XIVE_IPI_HW_IRQ);
 	xive_ipi_irq =3D virq;
=20
 	WARN_ON(request_irq(virq, xive_muxed_ipi_action,
@@ -1178,19 +1192,6 @@ static int xive_irq_domain_map(struct irq_domain *=
h, unsigned int virq,
 	 */
 	irq_clear_status_flags(virq, IRQ_LEVEL);
=20
-#ifdef CONFIG_SMP
-	/* IPIs are special and come up with HW number 0 */
-	if (hw =3D=3D XIVE_IPI_HW_IRQ) {
-		/*
-		 * IPIs are marked per-cpu. We use separate HW interrupts under
-		 * the hood but associated with the same "linux" interrupt
-		 */
-		irq_set_chip_and_handler(virq, &xive_ipi_chip,
-					 handle_percpu_irq);
-		return 0;
-	}
-#endif
-
 	rc =3D xive_irq_alloc_data(virq, hw);
 	if (rc)
 		return rc;
@@ -1202,15 +1203,7 @@ static int xive_irq_domain_map(struct irq_domain *=
h, unsigned int virq,
=20
 static void xive_irq_domain_unmap(struct irq_domain *d, unsigned int vir=
q)
 {
-	struct irq_data *data =3D irq_get_irq_data(virq);
-	unsigned int hw_irq;
-
-	/* XXX Assign BAD number */
-	if (!data)
-		return;
-	hw_irq =3D (unsigned int)irqd_to_hwirq(data);
-	if (hw_irq !=3D XIVE_IPI_HW_IRQ)
-		xive_irq_free_data(virq);
+	xive_irq_free_data(virq);
 }
=20
 static int xive_irq_domain_xlate(struct irq_domain *h, struct device_nod=
e *ct,
--=20
2.26.2

