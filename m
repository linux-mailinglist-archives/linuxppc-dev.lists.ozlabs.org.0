Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FD42D6346
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 18:17:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsLFT3S1kzDqxG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 04:17:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsLC424kyzDqvl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Dec 2020 04:15:11 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BAHEnGh054894; Thu, 10 Dec 2020 12:15:02 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35bqweg060-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 12:15:01 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BAHC7IN009770;
 Thu, 10 Dec 2020 17:14:59 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3583svnwmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 17:14:59 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BAHEv9d9830734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 17:14:57 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25C364C06E;
 Thu, 10 Dec 2020 17:14:57 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFE184C058;
 Thu, 10 Dec 2020 17:14:56 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Thu, 10 Dec 2020 17:14:56 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-158-23.de.ibm.com [9.145.158.23])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 6BE762204B9;
 Thu, 10 Dec 2020 18:14:56 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/13] powerpc/xive: Add a name to the IRQ domain
Date: Thu, 10 Dec 2020 18:14:42 +0100
Message-Id: <20201210171450.1933725-6-clg@kaod.org>
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
 mlxlogscore=999 clxscore=1034
 lowpriorityscore=0 spamscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 impostorscore=0 suspectscore=1 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012100105
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

We hope one day to handle multiple irq_domain in the XIVE driver.
Start simple by setting the name using the DT node.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xive/xive-internal.h |  4 ++--
 arch/powerpc/sysdev/xive/common.c        | 10 +++++-----
 arch/powerpc/sysdev/xive/native.c        |  2 +-
 arch/powerpc/sysdev/xive/spapr.c         |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/xive-internal.h b/arch/powerpc/sysd=
ev/xive/xive-internal.h
index d701af7fb48c..c07fadb9d264 100644
--- a/arch/powerpc/sysdev/xive/xive-internal.h
+++ b/arch/powerpc/sysdev/xive/xive-internal.h
@@ -63,8 +63,8 @@ struct xive_ops {
 	const char *name;
 };
=20
-bool xive_core_init(const struct xive_ops *ops, void __iomem *area, u32 =
offset,
-		    u8 max_prio);
+bool xive_core_init(struct device_node *np, const struct xive_ops *ops,
+		    void __iomem *area, u32 offset, u8 max_prio);
 __be32 *xive_queue_page_alloc(unsigned int cpu, u32 queue_shift);
 int xive_core_debug_init(void);
=20
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index 605238ca65e4..7314b87d0b45 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1310,9 +1310,9 @@ static const struct irq_domain_ops xive_irq_domain_=
ops =3D {
 	.xlate =3D xive_irq_domain_xlate,
 };
=20
-static void __init xive_init_host(void)
+static void __init xive_init_host(struct device_node *np)
 {
-	xive_irq_domain =3D irq_domain_add_nomap(NULL, XIVE_MAX_IRQ,
+	xive_irq_domain =3D irq_domain_add_nomap(np, XIVE_MAX_IRQ,
 					       &xive_irq_domain_ops, NULL);
 	if (WARN_ON(xive_irq_domain =3D=3D NULL))
 		return;
@@ -1508,8 +1508,8 @@ void xive_shutdown(void)
 	xive_ops->shutdown();
 }
=20
-bool __init xive_core_init(const struct xive_ops *ops, void __iomem *are=
a, u32 offset,
-			   u8 max_prio)
+bool __init xive_core_init(struct device_node *np, const struct xive_ops=
 *ops,
+			   void __iomem *area, u32 offset, u8 max_prio)
 {
 	xive_tima =3D area;
 	xive_tima_offset =3D offset;
@@ -1520,7 +1520,7 @@ bool __init xive_core_init(const struct xive_ops *o=
ps, void __iomem *area, u32 o
 	__xive_enabled =3D true;
=20
 	pr_devel("Initializing host..\n");
-	xive_init_host();
+	xive_init_host(np);
=20
 	pr_devel("Initializing boot CPU..\n");
=20
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive=
/native.c
index cb58ec7ce77a..c3182ec9ed65 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -622,7 +622,7 @@ bool __init xive_native_init(void)
 	xive_native_setup_pools();
=20
 	/* Initialize XIVE core with our backend */
-	if (!xive_core_init(&xive_native_ops, tima, TM_QW3_HV_PHYS,
+	if (!xive_core_init(np, &xive_native_ops, tima, TM_QW3_HV_PHYS,
 			    max_prio)) {
 		opal_xive_reset(OPAL_XIVE_MODE_EMU);
 		return false;
diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/=
spapr.c
index 1e3674d7ea7b..6610e5149d5a 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -857,7 +857,7 @@ bool __init xive_spapr_init(void)
 	}
=20
 	/* Initialize XIVE core with our backend */
-	if (!xive_core_init(&xive_spapr_ops, tima, TM_QW1_OS, max_prio))
+	if (!xive_core_init(np, &xive_spapr_ops, tima, TM_QW1_OS, max_prio))
 		return false;
=20
 	pr_info("Using %dkB queues\n", 1 << (xive_queue_shift - 10));
--=20
2.26.2

