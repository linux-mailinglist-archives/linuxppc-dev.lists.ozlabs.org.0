Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D1E2D6382
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 18:28:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsLV46Dd0zDqyJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 04:28:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsLC601RQzDqvl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 04:15:13 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BAH3jKu190479; Thu, 10 Dec 2020 12:15:00 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bjjx44x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 12:15:00 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BAHCAX0009794;
 Thu, 10 Dec 2020 17:14:58 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3583svnwmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 17:14:58 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0BAHEuiq41419236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 17:14:56 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CC0DA4069;
 Thu, 10 Dec 2020 17:14:56 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1980A405E;
 Thu, 10 Dec 2020 17:14:55 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Dec 2020 17:14:55 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 668A12204B9;
 Thu, 10 Dec 2020 18:14:55 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 03/13] powerpc/xive: Introduce XIVE_IPI_HW_IRQ
Date: Thu, 10 Dec 2020 18:14:40 +0100
Message-Id: <20201210171450.1933725-4-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201210171450.1933725-1-clg@kaod.org>
References: <20201210171450.1933725-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_06:2020-12-09,
 2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=3 adultscore=0 bulkscore=0
 mlxlogscore=944 clxscore=1034 phishscore=0 mlxscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100105
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

The XIVE driver deals with CPU IPIs in a peculiar way. Each CPU has
its own XIVE IPI interrupt allocated at the HW level, for PowerNV, or
at the hypervisor level for pSeries. In practice, these interrupts are
not always used. pSeries/PowerVM prefers local doorbells for local
threads since they are faster. On PowerNV, global doorbells are also
preferred for the same reason.

The mapping in the Linux is reduced to a single interrupt using HW
interrupt number 0 and a custom irq_chip to handle EOI. This can cause
performance issues in some benchmark (ipistorm) on multichip systems.

Clarify the use of the 0 value, it will help in improving multichip
support.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/xive-internal.h |  2 ++
 arch/powerpc/sysdev/xive/common.c        | 10 +++++-----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/xive-internal.h b/arch/powerpc/sysd=
ev/xive/xive-internal.h
index b7b901da2168..d701af7fb48c 100644
--- a/arch/powerpc/sysdev/xive/xive-internal.h
+++ b/arch/powerpc/sysdev/xive/xive-internal.h
@@ -5,6 +5,8 @@
 #ifndef __XIVE_INTERNAL_H
 #define __XIVE_INTERNAL_H
=20
+#define XIVE_IPI_HW_IRQ		0 /* interrupt source # for IPIs */
+
 /*
  * A "disabled" interrupt should never fire, to catch problems
  * we set its logical number to this
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index 65af34ac1fa2..ee375daf8114 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1142,7 +1142,7 @@ static void __init xive_request_ipi(void)
 		return;
=20
 	/* Initialize it */
-	virq =3D irq_create_mapping(xive_irq_domain, 0);
+	virq =3D irq_create_mapping(xive_irq_domain, XIVE_IPI_HW_IRQ);
 	xive_ipi_irq =3D virq;
=20
 	WARN_ON(request_irq(virq, xive_muxed_ipi_action,
@@ -1242,7 +1242,7 @@ static int xive_irq_domain_map(struct irq_domain *h=
, unsigned int virq,
=20
 #ifdef CONFIG_SMP
 	/* IPIs are special and come up with HW number 0 */
-	if (hw =3D=3D 0) {
+	if (hw =3D=3D XIVE_IPI_HW_IRQ) {
 		/*
 		 * IPIs are marked per-cpu. We use separate HW interrupts under
 		 * the hood but associated with the same "linux" interrupt
@@ -1271,7 +1271,7 @@ static void xive_irq_domain_unmap(struct irq_domain=
 *d, unsigned int virq)
 	if (!data)
 		return;
 	hw_irq =3D (unsigned int)irqd_to_hwirq(data);
-	if (hw_irq)
+	if (hw_irq !=3D XIVE_IPI_HW_IRQ)
 		xive_irq_free_data(virq);
 }
=20
@@ -1421,7 +1421,7 @@ static void xive_flush_cpu_queue(unsigned int cpu, =
struct xive_cpu *xc)
 		 * Ignore anything that isn't a XIVE irq and ignore
 		 * IPIs, so can just be dropped.
 		 */
-		if (d->domain !=3D xive_irq_domain || hw_irq =3D=3D 0)
+		if (d->domain !=3D xive_irq_domain || hw_irq =3D=3D XIVE_IPI_HW_IRQ)
 			continue;
=20
 		/*
@@ -1655,7 +1655,7 @@ static int xive_core_debug_show(struct seq_file *m,=
 void *private)
 		hw_irq =3D (unsigned int)irqd_to_hwirq(d);
=20
 		/* IPIs are special (HW number 0) */
-		if (hw_irq)
+		if (hw_irq !=3D XIVE_IPI_HW_IRQ)
 			xive_debug_show_irq(m, hw_irq, d);
 	}
 	return 0;
--=20
2.26.2

