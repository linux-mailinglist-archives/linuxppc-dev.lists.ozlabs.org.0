Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA963502AE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 16:48:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9Thz5jwJz3dpt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 01:48:51 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9TdP0BQwz301t
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 01:45:44 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12VEYjoc036099; Wed, 31 Mar 2021 10:45:36 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37mn0c448f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 10:45:35 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12VEfq0c008860;
 Wed, 31 Mar 2021 14:45:26 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 37maaqrc9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 14:45:26 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12VEjOZw26477050
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 14:45:24 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E5AB42041;
 Wed, 31 Mar 2021 14:45:23 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69AB042054;
 Wed, 31 Mar 2021 14:45:23 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 31 Mar 2021 14:45:23 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.101])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id A3AE2220190;
 Wed, 31 Mar 2021 16:45:22 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 9/9] powerpc/xive: Modernize XIVE-IPI domain with an
 'alloc' handler
Date: Wed, 31 Mar 2021 16:45:14 +0200
Message-Id: <20210331144514.892250-10-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210331144514.892250-1-clg@kaod.org>
References: <20210331144514.892250-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Xmng1mxxOrs7YXK3O0O3vZcF1knAlXL_
X-Proofpoint-ORIG-GUID: Xmng1mxxOrs7YXK3O0O3vZcF1knAlXL_
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-31_03:2021-03-31,
 2021-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1034 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Instead of calling irq_create_mapping() to map the IPI for a node,
introduce an 'alloc' handler. This is usually an extension to support
hierarchy irq_domains which is not exactly the case for XIVE-IPI
domain. However, we can now use the irq_domain_alloc_irqs() routine
which allocates the IRQ descriptor on the specified node, even better
for cache performance on multi node machines.

Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 I didn't rerun the benchmark to check for a difference.
=20
 arch/powerpc/sysdev/xive/common.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index 06f29cd07448..bb7435ffe99c 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1103,15 +1103,26 @@ static struct irq_chip xive_ipi_chip =3D {
  * IPIs are marked per-cpu. We use separate HW interrupts under the
  * hood but associated with the same "linux" interrupt
  */
-static int xive_ipi_irq_domain_map(struct irq_domain *h, unsigned int vi=
rq,
-				   irq_hw_number_t hw)
+struct xive_ipi_alloc_info {
+	irq_hw_number_t hwirq;
+};
+
+static int xive_ipi_irq_domain_alloc(struct irq_domain *domain, unsigned=
 int virq,
+				     unsigned int nr_irqs, void *arg)
 {
-	irq_set_chip_and_handler(virq, &xive_ipi_chip, handle_percpu_irq);
+	struct xive_ipi_alloc_info *info =3D arg;
+	int i;
+
+	for (i =3D 0; i < nr_irqs; i++) {
+		irq_domain_set_info(domain, virq + i, info->hwirq + i, &xive_ipi_chip,
+				    domain->host_data, handle_percpu_irq,
+				    NULL, NULL);
+	}
 	return 0;
 }
=20
 static const struct irq_domain_ops xive_ipi_irq_domain_ops =3D {
-	.map =3D xive_ipi_irq_domain_map,
+	.alloc  =3D xive_ipi_irq_domain_alloc,
 };
=20
 static int __init xive_request_ipi(void)
@@ -1136,7 +1147,7 @@ static int __init xive_request_ipi(void)
=20
 	for_each_node(node) {
 		struct xive_ipi_desc *xid =3D &xive_ipis[node];
-		irq_hw_number_t ipi_hwirq =3D node;
+		struct xive_ipi_alloc_info info =3D { node };
=20
 		/* Skip nodes without CPUs */
 		if (cpumask_empty(cpumask_of_node(node)))
@@ -1147,9 +1158,9 @@ static int __init xive_request_ipi(void)
 		 * Since the HW interrupt number doesn't have any meaning,
 		 * simply use the node number.
 		 */
-		xid->irq =3D irq_create_mapping(ipi_domain, ipi_hwirq);
-		if (!xid->irq) {
-			ret =3D -EINVAL;
+		xid->irq =3D irq_domain_alloc_irqs(ipi_domain, 1, node, &info);
+		if (xid->irq < 0) {
+			ret =3D xid->irq;
 			goto out_free_xive_ipis;
 		}
=20
--=20
2.26.3

