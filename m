Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7380A3E33E8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 09:21:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GhYgf2cz4z3dH6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Aug 2021 17:21:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GhYg91Sw1z308b
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Aug 2021 17:21:23 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17774Gjt139672; Sat, 7 Aug 2021 03:21:05 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a9k3qaprh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 07 Aug 2021 03:21:04 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17775QcY141980;
 Sat, 7 Aug 2021 03:21:04 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a9k3qapqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 07 Aug 2021 03:21:04 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1776gT98009431;
 Sat, 7 Aug 2021 07:21:02 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3a9heh8f8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 07 Aug 2021 07:21:02 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1777L0Kl49480086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 7 Aug 2021 07:21:00 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4CB094C040;
 Sat,  7 Aug 2021 07:21:00 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DEBDA4C05C;
 Sat,  7 Aug 2021 07:20:59 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Sat,  7 Aug 2021 07:20:59 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.63.119])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 01A8722013D;
 Sat,  7 Aug 2021 09:20:58 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/xive: Do not skip CPU-less nodes when creating the
 IPIs
Date: Sat,  7 Aug 2021 09:20:57 +0200
Message-Id: <20210807072057.184698-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PN6bnJJHZmQm0GQSWdvPJPAn1mn699jE
X-Proofpoint-GUID: yjLyv9_vcdik4LmjU4yhiWwxHLe4B8YR
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-07_02:2021-08-06,
 2021-08-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 clxscore=1034 malwarescore=0 suspectscore=0
 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108070042
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>, stable@vger.kernel.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On PowerVM, CPU-less nodes can be populated with hot-plugged CPUs at
runtime. Today, the IPI is not created for such nodes, and hot-plugged
CPUs use a bogus IPI, which leads to soft lockups.

We can not directly allocate and request the IPI on demand because
bringup_up() is called under the IRQ sparse lock. The alternative is
to allocate the IPIs for all possible nodes at startup and to request
the mapping on demand when the first CPU of a node is brought up.

Fixes: 7dcc37b3eff9 ("powerpc/xive: Map one IPI interrupt per node")
Cc: stable@vger.kernel.org # v5.13
Reported-by: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20210629131542.743888-1-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/common.c | 35 +++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index dbdbbc2f1dc5..943fd30095af 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -67,6 +67,7 @@ static struct irq_domain *xive_irq_domain;
 static struct xive_ipi_desc {
 	unsigned int irq;
 	char name[16];
+	atomic_t started;
 } *xive_ipis;
=20
 /*
@@ -1120,7 +1121,7 @@ static const struct irq_domain_ops xive_ipi_irq_dom=
ain_ops =3D {
 	.alloc  =3D xive_ipi_irq_domain_alloc,
 };
=20
-static int __init xive_request_ipi(void)
+static int __init xive_init_ipis(void)
 {
 	struct fwnode_handle *fwnode;
 	struct irq_domain *ipi_domain;
@@ -1144,10 +1145,6 @@ static int __init xive_request_ipi(void)
 		struct xive_ipi_desc *xid =3D &xive_ipis[node];
 		struct xive_ipi_alloc_info info =3D { node };
=20
-		/* Skip nodes without CPUs */
-		if (cpumask_empty(cpumask_of_node(node)))
-			continue;
-
 		/*
 		 * Map one IPI interrupt per node for all cpus of that node.
 		 * Since the HW interrupt number doesn't have any meaning,
@@ -1159,11 +1156,6 @@ static int __init xive_request_ipi(void)
 		xid->irq =3D ret;
=20
 		snprintf(xid->name, sizeof(xid->name), "IPI-%d", node);
-
-		ret =3D request_irq(xid->irq, xive_muxed_ipi_action,
-				  IRQF_PERCPU | IRQF_NO_THREAD, xid->name, NULL);
-
-		WARN(ret < 0, "Failed to request IPI %d: %d\n", xid->irq, ret);
 	}
=20
 	return ret;
@@ -1178,6 +1170,22 @@ static int __init xive_request_ipi(void)
 	return ret;
 }
=20
+static int __init xive_request_ipi(unsigned int cpu)
+{
+	struct xive_ipi_desc *xid =3D &xive_ipis[early_cpu_to_node(cpu)];
+	int ret;
+
+	if (atomic_inc_return(&xid->started) > 1)
+		return 0;
+
+	ret =3D request_irq(xid->irq, xive_muxed_ipi_action,
+			  IRQF_PERCPU | IRQF_NO_THREAD,
+			  xid->name, NULL);
+
+	WARN(ret < 0, "Failed to request IPI %d: %d\n", xid->irq, ret);
+	return ret;
+}
+
 static int xive_setup_cpu_ipi(unsigned int cpu)
 {
 	unsigned int xive_ipi_irq =3D xive_ipi_cpu_to_irq(cpu);
@@ -1192,6 +1200,9 @@ static int xive_setup_cpu_ipi(unsigned int cpu)
 	if (xc->hw_ipi !=3D XIVE_BAD_IRQ)
 		return 0;
=20
+	/* Register the IPI */
+	xive_request_ipi(cpu);
+
 	/* Grab an IPI from the backend, this will populate xc->hw_ipi */
 	if (xive_ops->get_ipi(cpu, xc))
 		return -EIO;
@@ -1231,6 +1242,8 @@ static void xive_cleanup_cpu_ipi(unsigned int cpu, =
struct xive_cpu *xc)
 	if (xc->hw_ipi =3D=3D XIVE_BAD_IRQ)
 		return;
=20
+	/* TODO: clear IPI mapping */
+
 	/* Mask the IPI */
 	xive_do_source_set_mask(&xc->ipi_data, true);
=20
@@ -1253,7 +1266,7 @@ void __init xive_smp_probe(void)
 	smp_ops->cause_ipi =3D xive_cause_ipi;
=20
 	/* Register the IPI */
-	xive_request_ipi();
+	xive_init_ipis();
=20
 	/* Allocate and setup IPI for the boot CPU */
 	xive_setup_cpu_ipi(smp_processor_id());
--=20
2.31.1

