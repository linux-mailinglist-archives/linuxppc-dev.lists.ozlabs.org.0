Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6933153BF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 17:26:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZpD81R6CzDrWV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 03:26:00 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZp532YTNzDspL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 03:19:50 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 119GD2Pd108396; Tue, 9 Feb 2021 11:19:44 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36kwqc068s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 11:19:44 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 119GF5dO024338;
 Tue, 9 Feb 2021 16:19:42 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 36hqda3cdf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 09 Feb 2021 16:19:42 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 119GJeGS38469958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Feb 2021 16:19:40 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 69C1142042;
 Tue,  9 Feb 2021 16:19:40 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F42B42041;
 Tue,  9 Feb 2021 16:19:40 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  9 Feb 2021 16:19:40 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.88.237])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B98012202B9;
 Tue,  9 Feb 2021 17:19:39 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/5] powerpc/xive: Map one IPI interrupt per node
Date: Tue,  9 Feb 2021 17:19:36 +0100
Message-Id: <20210209161936.377760-6-clg@kaod.org>
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
 clxscore=1034 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102090080
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

ipistorm [*] can be used to benchmark the raw interrupt rate of an
interrupt controller by measuring the number of IPIs a system can
sustain. When applied to the XIVE interrupt controller of POWER9 and
POWER10 systems, a significant drop of the interrupt rate can be
observed when crossing the second node boundary.

This is due to the fact that a single IPI interrupt is used for all
CPUs of the system. The structure is shared and the cache line updates
impact greatly the traffic between nodes and the overall IPI
performance.

As a workaround, the impact can be reduced by deactivating the IRQ
lockup detector ("noirqdebug") which does a lot of accounting in the
Linux IRQ descriptor structure and is responsible for most of the
performance penalty.

As a fix, this proposal allocates an IPI interrupt per node, to be
shared by all CPUs of that node. It solves the scaling issue, the IRQ
lockup detector still has an impact but the XIVE interrupt rate scales
linearly. It also improves the "noirqdebug" case as showed in the
tables below.

 * P9 DD2.2 - 2s * 64 threads

                                               "noirqdebug"
                        Mint/s                    Mint/s
 chips  cpus      IPI/sys   IPI/chip       IPI/chip    IPI/sys
 --------------------------------------------------------------
 1      0-15     4.984023   4.875405       4.996536   5.048892
        0-31    10.879164  10.544040      10.757632  11.037859
        0-47    15.345301  14.688764      14.926520  15.310053
        0-63    17.064907  17.066812      17.613416  17.874511
 2      0-79    11.768764  21.650749      22.689120  22.566508
        0-95    10.616812  26.878789      28.434703  28.320324
        0-111   10.151693  31.397803      31.771773  32.388122
        0-127    9.948502  33.139336      34.875716  35.224548

 * P10 DD1 - 4s (not homogeneous) 352 threads

                                               "noirqdebug"
                        Mint/s                    Mint/s
 chips  cpus      IPI/sys   IPI/chip       IPI/chip    IPI/sys
 --------------------------------------------------------------
 1      0-15     2.409402   2.364108       2.383303   2.395091
        0-31     6.028325   6.046075       6.089999   6.073750
        0-47     8.655178   8.644531       8.712830   8.724702
        0-63    11.629652  11.735953      12.088203  12.055979
        0-79    14.392321  14.729959      14.986701  14.973073
        0-95    12.604158  13.004034      17.528748  17.568095
 2      0-111    9.767753  13.719831      19.968606  20.024218
        0-127    6.744566  16.418854      22.898066  22.995110
        0-143    6.005699  19.174421      25.425622  25.417541
        0-159    5.649719  21.938836      27.952662  28.059603
        0-175    5.441410  24.109484      31.133915  31.127996
 3      0-191    5.318341  24.405322      33.999221  33.775354
        0-207    5.191382  26.449769      36.050161  35.867307
        0-223    5.102790  29.356943      39.544135  39.508169
        0-239    5.035295  31.933051      42.135075  42.071975
        0-255    4.969209  34.477367      44.655395  44.757074
 4      0-271    4.907652  35.887016      47.080545  47.318537
        0-287    4.839581  38.076137      50.464307  50.636219
        0-303    4.786031  40.881319      53.478684  53.310759
        0-319    4.743750  43.448424      56.388102  55.973969
        0-335    4.709936  45.623532      59.400930  58.926857
        0-351    4.681413  45.646151      62.035804  61.830057

[*] https://github.com/antonblanchard/ipistorm

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/xive-internal.h |  2 --
 arch/powerpc/sysdev/xive/common.c        | 39 ++++++++++++++++++------
 2 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/xive-internal.h b/arch/powerpc/sysd=
ev/xive/xive-internal.h
index 9cf57c722faa..b3a456fdd3a5 100644
--- a/arch/powerpc/sysdev/xive/xive-internal.h
+++ b/arch/powerpc/sysdev/xive/xive-internal.h
@@ -5,8 +5,6 @@
 #ifndef __XIVE_INTERNAL_H
 #define __XIVE_INTERNAL_H
=20
-#define XIVE_IPI_HW_IRQ		0 /* interrupt source # for IPIs */
-
 /*
  * A "disabled" interrupt should never fire, to catch problems
  * we set its logical number to this
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index 30034af4462b..a1e61a5cf927 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -65,8 +65,16 @@ static struct irq_domain *xive_irq_domain;
 #ifdef CONFIG_SMP
 static struct irq_domain *xive_ipi_irq_domain;
=20
-/* The IPIs all use the same logical irq number */
-static u32 xive_ipi_irq;
+/* The IPIs use the same logical irq number when on the same chip */
+static struct xive_ipi_desc {
+	unsigned int irq;
+	char name[8]; /* enough bytes to fit IPI-XXX */
+} *xive_ipis;
+
+static unsigned int xive_ipi_cpu_to_irq(unsigned int cpu)
+{
+	return xive_ipis[cpu_to_node(cpu)].irq;
+}
 #endif
=20
 /* Xive state for each CPU */
@@ -1087,25 +1095,36 @@ static const struct irq_domain_ops xive_ipi_irq_d=
omain_ops =3D {
=20
 static void __init xive_request_ipi(void)
 {
-	unsigned int virq;
+	unsigned int node;
=20
-	xive_ipi_irq_domain =3D irq_domain_add_linear(NULL, 1,
+	xive_ipi_irq_domain =3D irq_domain_add_linear(NULL, nr_node_ids,
 						    &xive_ipi_irq_domain_ops, NULL);
 	if (WARN_ON(xive_ipi_irq_domain =3D=3D NULL))
 		return;
=20
-	/* Initialize it */
-	virq =3D irq_create_mapping(xive_ipi_irq_domain, XIVE_IPI_HW_IRQ);
-	xive_ipi_irq =3D virq;
+	xive_ipis =3D kcalloc(nr_node_ids, sizeof(*xive_ipis), GFP_KERNEL | __G=
FP_NOFAIL);
+	for_each_node(node) {
+		struct xive_ipi_desc *xid =3D &xive_ipis[node];
+		irq_hw_number_t node_ipi_hwirq =3D node;
+
+		/*
+		 * Map one IPI interrupt per node for all cpus of that node.
+		 * Since the HW interrupt number doesn't have any meaning,
+		 * simply use the node number.
+		 */
+		xid->irq =3D irq_create_mapping(xive_ipi_irq_domain, node_ipi_hwirq);
+		snprintf(xid->name, sizeof(xid->name), "IPI-%d", node);
=20
-	WARN_ON(request_irq(virq, xive_muxed_ipi_action,
-			    IRQF_PERCPU | IRQF_NO_THREAD, "IPI", NULL));
+		WARN_ON(request_irq(xid->irq, xive_muxed_ipi_action,
+				    IRQF_PERCPU | IRQF_NO_THREAD, xid->name, NULL));
+	}
 }
=20
 static int xive_setup_cpu_ipi(unsigned int cpu)
 {
 	struct xive_cpu *xc;
 	int rc;
+	unsigned int xive_ipi_irq =3D xive_ipi_cpu_to_irq(cpu);
=20
 	pr_debug("Setting up IPI for CPU %d\n", cpu);
=20
@@ -1146,6 +1165,8 @@ static int xive_setup_cpu_ipi(unsigned int cpu)
=20
 static void xive_cleanup_cpu_ipi(unsigned int cpu, struct xive_cpu *xc)
 {
+	unsigned int xive_ipi_irq =3D xive_ipi_cpu_to_irq(cpu);
+
 	/* Disable the IPI and free the IRQ data */
=20
 	/* Already cleaned up ? */
--=20
2.26.2

