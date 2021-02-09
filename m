Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DED3153B4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:21:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZp7S1Z14zDsjr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 03:21:56 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZp531YzTzDspG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 03:19:50 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 119G4BtD131443; Tue, 9 Feb 2021 11:19:43 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36kvmmu7as-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 11:19:43 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 119GEn2H022986;
 Tue, 9 Feb 2021 16:19:41 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 36hqda3cdc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 16:19:41 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 119GJTKU28049752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Feb 2021 16:19:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FC68AE053;
 Tue,  9 Feb 2021 16:19:39 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8249AE051;
 Tue,  9 Feb 2021 16:19:38 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  9 Feb 2021 16:19:38 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.88.237])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6C968220155;
 Tue,  9 Feb 2021 17:19:38 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/5] powerpc/xive: Introduce an IPI interrupt domain
Date: Tue,  9 Feb 2021 17:19:33 +0100
Message-Id: <20210209161936.377760-3-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210209161936.377760-1-clg@kaod.org>
References: <20210209161936.377760-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_03:2021-02-09,
 2021-02-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 clxscore=1034 impostorscore=0 phishscore=0 mlxlogscore=715 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090081
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
index 776871274b69..4aceac0f3046 100644
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
@@ -1068,20 +1070,32 @@ static struct irq_chip xive_ipi_chip =3D {
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
@@ -1179,19 +1193,6 @@ static int xive_irq_domain_map(struct irq_domain *=
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
@@ -1203,15 +1204,7 @@ static int xive_irq_domain_map(struct irq_domain *=
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

