Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 590533502A6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 16:48:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9Thd2MNlz3dkL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 01:48:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9TdK4g7pz30Jp
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 01:45:41 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12VEYigf036080; Wed, 31 Mar 2021 10:45:28 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37mn0c4448-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 10:45:27 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12VEg0Va017149;
 Wed, 31 Mar 2021 14:45:25 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 37mngr08un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 14:45:25 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12VEjNRN43975028
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 14:45:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE465A4053;
 Wed, 31 Mar 2021 14:45:22 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2635A4057;
 Wed, 31 Mar 2021 14:45:22 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 31 Mar 2021 14:45:22 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.101])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id ED4E5220059;
 Wed, 31 Mar 2021 16:45:21 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 8/9] powerpc/xive: Map one IPI interrupt per node
Date: Wed, 31 Mar 2021 16:45:13 +0200
Message-Id: <20210331144514.892250-9-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210331144514.892250-1-clg@kaod.org>
References: <20210331144514.892250-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: t8lS6fVAgpuF1NgQDPQcT3rZxCIk5Kif
X-Proofpoint-ORIG-GUID: t8lS6fVAgpuF1NgQDPQcT3rZxCIk5Kif
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
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

Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---

 Changes in v3:

  - increased IPI name length
  - use of early_cpu_to_node() for hotplugged CPUs
  - filter CPU-less nodes
  - dropped Greg's Reviewed-by because of the changes
=20=20
 arch/powerpc/sysdev/xive/xive-internal.h |  2 -
 arch/powerpc/sysdev/xive/common.c        | 60 +++++++++++++++++++-----
 2 files changed, 47 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/xive-internal.h b/arch/powerpc/sysdev=
/xive/xive-internal.h
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
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/c=
ommon.c
index 69980b49afb7..06f29cd07448 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -63,8 +63,19 @@ static const struct xive_ops *xive_ops;
 static struct irq_domain *xive_irq_domain;
=20
 #ifdef CONFIG_SMP
-/* The IPIs all use the same logical irq number */
-static u32 xive_ipi_irq;
+/* The IPIs use the same logical irq number when on the same chip */
+static struct xive_ipi_desc {
+	unsigned int irq;
+	char name[16];
+} *xive_ipis;
+
+/*
+ * Use early_cpu_to_node() for hot-plugged CPUs
+ */
+static unsigned int xive_ipi_cpu_to_irq(unsigned int cpu)
+{
+	return xive_ipis[early_cpu_to_node(cpu)].irq;
+}
 #endif
=20
 /* Xive state for each CPU */
@@ -1107,33 +1118,53 @@ static int __init xive_request_ipi(void)
 {
 	struct fwnode_handle *fwnode;
 	struct irq_domain *ipi_domain;
-	unsigned int virq;
+	unsigned int node;
 	int ret =3D -ENOMEM;
=20
 	fwnode =3D irq_domain_alloc_named_fwnode("XIVE-IPI");
 	if (!fwnode)
 		goto out;
=20
-	ipi_domain =3D irq_domain_create_linear(fwnode, 1,
+	ipi_domain =3D irq_domain_create_linear(fwnode, nr_node_ids,
 					      &xive_ipi_irq_domain_ops, NULL);
 	if (!ipi_domain)
 		goto out_free_fwnode;
=20
-	/* Initialize it */
-	virq =3D irq_create_mapping(ipi_domain, XIVE_IPI_HW_IRQ);
-	if (!virq) {
-		ret =3D -EINVAL;
+	xive_ipis =3D kcalloc(nr_node_ids, sizeof(*xive_ipis), GFP_KERNEL | __GFP=
_NOFAIL);
+	if (!xive_ipis)
 		goto out_free_domain;
-	}
=20
-	xive_ipi_irq =3D virq;
+	for_each_node(node) {
+		struct xive_ipi_desc *xid =3D &xive_ipis[node];
+		irq_hw_number_t ipi_hwirq =3D node;
+
+		/* Skip nodes without CPUs */
+		if (cpumask_empty(cpumask_of_node(node)))
+			continue;
+
+		/*
+		 * Map one IPI interrupt per node for all cpus of that node.
+		 * Since the HW interrupt number doesn't have any meaning,
+		 * simply use the node number.
+		 */
+		xid->irq =3D irq_create_mapping(ipi_domain, ipi_hwirq);
+		if (!xid->irq) {
+			ret =3D -EINVAL;
+			goto out_free_xive_ipis;
+		}
+
+		snprintf(xid->name, sizeof(xid->name), "IPI-%d", node);
+
+		ret =3D request_irq(xid->irq, xive_muxed_ipi_action,
+				  IRQF_PERCPU | IRQF_NO_THREAD, xid->name, NULL);
=20
-	ret =3D request_irq(virq, xive_muxed_ipi_action,
-			  IRQF_PERCPU | IRQF_NO_THREAD, "IPI", NULL);
+		WARN(ret < 0, "Failed to request IPI %d: %d\n", xid->irq, ret);
+	}
=20
-	WARN(ret < 0, "Failed to request IPI %d: %d\n", virq, ret);
 	return ret;
=20
+out_free_xive_ipis:
+	kfree(xive_ipis);
 out_free_domain:
 	irq_domain_remove(ipi_domain);
 out_free_fwnode:
@@ -1144,6 +1175,7 @@ static int __init xive_request_ipi(void)
=20
 static int xive_setup_cpu_ipi(unsigned int cpu)
 {
+	unsigned int xive_ipi_irq =3D xive_ipi_cpu_to_irq(cpu);
 	struct xive_cpu *xc;
 	int rc;
=20
@@ -1186,6 +1218,8 @@ static int xive_setup_cpu_ipi(unsigned int cpu)
=20
 static void xive_cleanup_cpu_ipi(unsigned int cpu, struct xive_cpu *xc)
 {
+	unsigned int xive_ipi_irq =3D xive_ipi_cpu_to_irq(cpu);
+
 	/* Disable the IPI and free the IRQ data */
=20
 	/* Already cleaned up ? */
--=20
2.26.3

