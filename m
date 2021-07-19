Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCEC3CD57B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 15:07:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GT2F36Gmhz3bff
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 23:07:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GT2Df3kh1z302g
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 23:06:56 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JD5HO2139307; Mon, 19 Jul 2021 09:06:29 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39w8yat6x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 09:06:28 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16JD0LdX006644;
 Mon, 19 Jul 2021 13:06:26 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 39upu88cg8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Jul 2021 13:06:25 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16JD6NaK31916376
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 13:06:23 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05F234C050;
 Mon, 19 Jul 2021 13:06:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C13004C044;
 Mon, 19 Jul 2021 13:06:22 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 19 Jul 2021 13:06:22 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.37.94])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 05CC2220078;
 Mon, 19 Jul 2021 15:06:21 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: use IRQF_NO_DEBUG for IPIs
Date: Mon, 19 Jul 2021 15:06:14 +0200
Message-Id: <20210719130614.195886-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2wm83TAd6tRjuMW3Cyc4YtxDEeUV61Dw
X-Proofpoint-ORIG-GUID: 2wm83TAd6tRjuMW3Cyc4YtxDEeUV61Dw
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-19_05:2021-07-19,
 2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1034 adultscore=0 mlxscore=0 spamscore=0 impostorscore=0
 mlxlogscore=745 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107190076
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no need to use the lockup detector ("noirqdebug") for IPIs.
The ipistorm benchmark measures a ~10% improvement on high systems
when this flag is set.

Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/sysdev/xics/xics-common.c | 2 +-
 arch/powerpc/sysdev/xive/common.c      | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev=
/xics/xics-common.c
index b14c502e56a8..18174ccefbc0 100644
--- a/arch/powerpc/sysdev/xics/xics-common.c
+++ b/arch/powerpc/sysdev/xics/xics-common.c
@@ -133,7 +133,7 @@ static void xics_request_ipi(void)
 	 * IPIs are marked IRQF_PERCPU. The handler was set in map.
 	 */
 	BUG_ON(request_irq(ipi, icp_ops->ipi_action,
-			   IRQF_PERCPU | IRQF_NO_THREAD, "IPI", NULL));
+			   IRQF_NO_DEBUG | IRQF_PERCPU | IRQF_NO_THREAD, "IPI", NULL));
 }
=20
 void __init xics_smp_probe(void)
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index dbdbbc2f1dc5..9ab44d069704 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1161,7 +1161,8 @@ static int __init xive_request_ipi(void)
 		snprintf(xid->name, sizeof(xid->name), "IPI-%d", node);
=20
 		ret =3D request_irq(xid->irq, xive_muxed_ipi_action,
-				  IRQF_PERCPU | IRQF_NO_THREAD, xid->name, NULL);
+				  IRQF_NO_DEBUG | IRQF_PERCPU | IRQF_NO_THREAD,
+				  xid->name, NULL);
=20
 		WARN(ret < 0, "Failed to request IPI %d: %d\n", xid->irq, ret);
 	}
--=20
2.31.1

