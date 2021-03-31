Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 498C23502A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 16:47:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9Tgp0h6Vz3dJd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 01:47:50 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9TdG6wfNz30QY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 01:45:38 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12VEY0BD041388; Wed, 31 Mar 2021 10:45:26 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37mtxugdeq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 10:45:26 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12VEgqZ2017291;
 Wed, 31 Mar 2021 14:45:23 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 37mb3h8bqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 Mar 2021 14:45:23 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12VEj2TS29819176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 31 Mar 2021 14:45:02 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D2A6A405F;
 Wed, 31 Mar 2021 14:45:21 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 35F88A4060;
 Wed, 31 Mar 2021 14:45:21 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 31 Mar 2021 14:45:21 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.101])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 7BC3F220059;
 Wed, 31 Mar 2021 16:45:20 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 6/9] powerpc/xive: Simplify the dump of XIVE interrupts
 under xmon
Date: Wed, 31 Mar 2021 16:45:11 +0200
Message-Id: <20210331144514.892250-7-clg@kaod.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210331144514.892250-1-clg@kaod.org>
References: <20210331144514.892250-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Zvw77gGi5_qVnJSksuFb6yRD7pPMKcsl
X-Proofpoint-GUID: Zvw77gGi5_qVnJSksuFb6yRD7pPMKcsl
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-31_03:2021-03-31,
 2021-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1034 malwarescore=0
 mlxlogscore=842 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
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
Cc: Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the xmon routine under XIVE subsystem and rework the loop on the
interrupts taking into account the xive_irq_domain to filter out IPIs.

Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/xive.h   |  1 +
 arch/powerpc/sysdev/xive/common.c | 14 ++++++++++++++
 arch/powerpc/xmon/xmon.c          | 28 ++--------------------------
 3 files changed, 17 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/xive.h b/arch/powerpc/include/asm/x=
ive.h
index 9a312b975ca8..aa094a8655b0 100644
--- a/arch/powerpc/include/asm/xive.h
+++ b/arch/powerpc/include/asm/xive.h
@@ -102,6 +102,7 @@ void xive_flush_interrupt(void);
 /* xmon hook */
 void xmon_xive_do_dump(int cpu);
 int xmon_xive_get_irq_config(u32 hw_irq, struct irq_data *d);
+void xmon_xive_get_irq_all(void);
=20
 /* APIs used by KVM */
 u32 xive_native_default_eq_shift(void);
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive=
/common.c
index f5fe60c194bc..4c6e2e1289f5 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -289,6 +289,20 @@ int xmon_xive_get_irq_config(u32 hw_irq, struct irq_=
data *d)
 	return 0;
 }
=20
+void xmon_xive_get_irq_all(void)
+{
+	unsigned int i;
+	struct irq_desc *desc;
+
+	for_each_irq_desc(i, desc) {
+		struct irq_data *d =3D irq_desc_get_irq_data(desc);
+		unsigned int hwirq =3D (unsigned int)irqd_to_hwirq(d);
+
+		if (d->domain =3D=3D xive_irq_domain)
+			xmon_xive_get_irq_config(hwirq, d);
+	}
+}
+
 #endif /* CONFIG_XMON */
=20
 static unsigned int xive_get_irq(void)
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 3fe37495f63d..80fbf8968f77 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2727,30 +2727,6 @@ static void dump_all_xives(void)
 		dump_one_xive(cpu);
 }
=20
-static void dump_one_xive_irq(u32 num, struct irq_data *d)
-{
-	xmon_xive_get_irq_config(num, d);
-}
-
-static void dump_all_xive_irq(void)
-{
-	unsigned int i;
-	struct irq_desc *desc;
-
-	for_each_irq_desc(i, desc) {
-		struct irq_data *d =3D irq_desc_get_irq_data(desc);
-		unsigned int hwirq;
-
-		if (!d)
-			continue;
-
-		hwirq =3D (unsigned int)irqd_to_hwirq(d);
-		/* IPIs are special (HW number 0) */
-		if (hwirq)
-			dump_one_xive_irq(hwirq, d);
-	}
-}
-
 static void dump_xives(void)
 {
 	unsigned long num;
@@ -2767,9 +2743,9 @@ static void dump_xives(void)
 		return;
 	} else if (c =3D=3D 'i') {
 		if (scanhex(&num))
-			dump_one_xive_irq(num, NULL);
+			xmon_xive_get_irq_config(num, NULL);
 		else
-			dump_all_xive_irq();
+			xmon_xive_get_irq_all();
 		return;
 	}
=20
--=20
2.26.3

