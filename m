Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B8B2DF9D5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 09:18:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Czsn62qbZzDqkL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 19:18:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Czrzc58bXzDqLd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 18:42:52 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BL73iur096339; Mon, 21 Dec 2020 02:42:40 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35jpgrhjpm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 02:42:40 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0BL7Ov7S165301;
 Mon, 21 Dec 2020 02:42:39 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35jpgrhjpa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 02:42:39 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BL7d3ai002817;
 Mon, 21 Dec 2020 07:42:38 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 35h9589spw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 07:42:38 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0BL7gZQf20250884
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Dec 2020 07:42:35 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4AA6A405D;
 Mon, 21 Dec 2020 07:42:35 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9228BA406F;
 Mon, 21 Dec 2020 07:42:35 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 21 Dec 2020 07:42:35 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-39-10.uk.ibm.com [9.145.39.10])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id EA80E22024D;
 Mon, 21 Dec 2020 08:42:34 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 17/23] powerpc/watchdog: Declare soft_nmi_interrupt() prototype
Date: Mon, 21 Dec 2020 08:42:16 +0100
Message-Id: <20201221074222.403894-18-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201221074222.403894-1-clg@kaod.org>
References: <20201221074222.403894-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-21_02:2020-12-19,
 2020-12-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 mlxlogscore=745
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1034 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012210049
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It fixes this W=3D1 compile error :

../arch/powerpc/kernel/watchdog.c:250:6: error: no previous prototype for=
 =E2=80=98soft_nmi_interrupt=E2=80=99 [-Werror=3Dmissing-prototypes]
  250 | void soft_nmi_interrupt(struct pt_regs *regs)
      |      ^~~~~~~~~~~~~~~~~~

Cc: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/include/asm/asm-prototypes.h | 1 +
 arch/powerpc/kernel/watchdog.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/inc=
lude/asm/asm-prototypes.h
index d0b832cbbec8..0f39eefbd5a5 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -84,6 +84,7 @@ void machine_check_exception(struct pt_regs *regs);
 void emulation_assist_interrupt(struct pt_regs *regs);
 long do_slb_fault(struct pt_regs *regs, unsigned long ea);
 void do_bad_slb_fault(struct pt_regs *regs, unsigned long ea, long err);
+void soft_nmi_interrupt(struct pt_regs *regs);
=20
 /* signals, syscalls and interrupts */
 long sys_swapcontext(struct ucontext __user *old_ctx,
diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdo=
g.c
index af3c15a1d41e..855716f563ac 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -27,6 +27,7 @@
 #include <linux/smp.h>
=20
 #include <asm/paca.h>
+#include <asm/asm-prototypes.h>
=20
 /*
  * The powerpc watchdog ensures that each CPU is able to service timers.
--=20
2.26.2

