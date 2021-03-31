Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AE23502A3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 16:48:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9ThG6hW1z3ddb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 01:48:14 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9TdJ3YYDz3brK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 01:45:40 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12VEY0Jo041283; Wed, 31 Mar 2021 10:45:23 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37mtxugdcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 10:45:23 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12VEgBMD017253;
 Wed, 31 Mar 2021 14:45:20 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 37matt0nnj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 14:45:20 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12VEjIDi36634940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 14:45:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D28842047;
 Wed, 31 Mar 2021 14:45:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 400A44203F;
 Wed, 31 Mar 2021 14:45:18 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 31 Mar 2021 14:45:18 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.101])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 81D09220059;
 Wed, 31 Mar 2021 16:45:17 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/9] powerpc/xive: Introduce an IPI interrupt domain
Date: Wed, 31 Mar 2021 16:45:07 +0200
Message-Id: <20210331144514.892250-3-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210331144514.892250-1-clg@kaod.org>
References: <20210331144514.892250-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JRbVso_d0MKM7mKoWcAAShltObwel1VT
X-Proofpoint-GUID: JRbVso_d0MKM7mKoWcAAShltObwel1VT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-31_03:2021-03-31,
 2021-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 malwarescore=0
 mlxlogscore=794 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103300000 definitions=main-2103310105
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
Cc: Thomas Gleixner <tglx@linutronix.de>, Greg Kurz <groug@kaod.org>,
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

Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Changes in v3:

  - better error handling of xive_request_ipi()
  - use of a fwnode_handle to name the new domain
  - dropped Greg's Reviewed-by because of the changes

 arch/powerpc/sysdev/xive/common.c | 79 ++++++++++++++++++-------------
 1 file changed, 46 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index 776871274b69..98f4dc916fa1 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1068,24 +1068,58 @@ static struct irq_chip xive_ipi_chip =3D {
 	.irq_unmask =3D xive_ipi_do_nothing,
 };
=20
-static void __init xive_request_ipi(void)
+/*
+ * IPIs are marked per-cpu. We use separate HW interrupts under the
+ * hood but associated with the same "linux" interrupt
+ */
+static int xive_ipi_irq_domain_map(struct irq_domain *h, unsigned int vi=
rq,
+				   irq_hw_number_t hw)
 {
+	irq_set_chip_and_handler(virq, &xive_ipi_chip, handle_percpu_irq);
+	return 0;
+}
+
+static const struct irq_domain_ops xive_ipi_irq_domain_ops =3D {
+	.map =3D xive_ipi_irq_domain_map,
+};
+
+static int __init xive_request_ipi(void)
+{
+	struct fwnode_handle *fwnode;
+	struct irq_domain *ipi_domain;
 	unsigned int virq;
+	int ret =3D -ENOMEM;
=20
-	/*
-	 * Initialization failed, move on, we might manage to
-	 * reach the point where we display our errors before
-	 * the system falls appart
-	 */
-	if (!xive_irq_domain)
-		return;
+	fwnode =3D irq_domain_alloc_named_fwnode("XIVE-IPI");
+	if (!fwnode)
+		goto out;
+
+	ipi_domain =3D irq_domain_create_linear(fwnode, 1,
+					      &xive_ipi_irq_domain_ops, NULL);
+	if (!ipi_domain)
+		goto out_free_fwnode;
=20
 	/* Initialize it */
-	virq =3D irq_create_mapping(xive_irq_domain, XIVE_IPI_HW_IRQ);
+	virq =3D irq_create_mapping(ipi_domain, XIVE_IPI_HW_IRQ);
+	if (!virq) {
+		ret =3D -EINVAL;
+		goto out_free_domain;
+	}
+
 	xive_ipi_irq =3D virq;
=20
-	WARN_ON(request_irq(virq, xive_muxed_ipi_action,
-			    IRQF_PERCPU | IRQF_NO_THREAD, "IPI", NULL));
+	ret =3D request_irq(virq, xive_muxed_ipi_action,
+			  IRQF_PERCPU | IRQF_NO_THREAD, "IPI", NULL);
+
+	WARN(ret < 0, "Failed to request IPI %d: %d\n", virq, ret);
+	return ret;
+
+out_free_domain:
+	irq_domain_remove(ipi_domain);
+out_free_fwnode:
+	irq_domain_free_fwnode(fwnode);
+out:
+	return ret;
 }
=20
 static int xive_setup_cpu_ipi(unsigned int cpu)
@@ -1179,19 +1213,6 @@ static int xive_irq_domain_map(struct irq_domain *=
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
@@ -1203,15 +1224,7 @@ static int xive_irq_domain_map(struct irq_domain *=
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
2.26.3

