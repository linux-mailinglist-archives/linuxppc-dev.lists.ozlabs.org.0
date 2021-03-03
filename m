Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A02732B992
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 18:49:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrM2Q45KNz3d3B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 04:49:34 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrM250RXtz30QQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 04:49:15 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 123HWjtI045972; Wed, 3 Mar 2021 12:49:08 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 372e941ux3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 12:49:07 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 123HhbTF027553;
 Wed, 3 Mar 2021 17:49:04 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3713s9s1b4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 17:49:04 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 123Hn2b430409126
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Mar 2021 17:49:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A8D85205A;
 Wed,  3 Mar 2021 17:49:02 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 40DD95204F;
 Wed,  3 Mar 2021 17:49:02 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.85.87])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id B8334220423;
 Wed,  3 Mar 2021 18:49:01 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 6/8] powerpc/xive: Simplify the dump of XIVE interrupts
 under xmon
Date: Wed,  3 Mar 2021 18:48:55 +0100
Message-Id: <20210303174857.1760393-7-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303174857.1760393-1-clg@kaod.org>
References: <20210303174857.1760393-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-03_05:2021-03-03,
 2021-03-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 clxscore=1034 mlxscore=0 mlxlogscore=741 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103030124
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
index 60ebd6f4b31d..f6b7b15bbb3a 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -291,6 +291,20 @@ int xmon_xive_get_irq_config(u32 hw_irq, struct irq_=
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
2.26.2

