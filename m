Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 633A82DF99F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 08:55:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CzsFY0tQYzDqS6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 18:54:57 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzrzW3K7vzDqML
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 18:42:47 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BL7Wj5t031454; Mon, 21 Dec 2020 02:42:33 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35jqd8g6h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 02:42:32 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BL7c37p010958;
 Mon, 21 Dec 2020 07:42:31 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 35h9588wtn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 07:42:31 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BL7gTte40108406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Dec 2020 07:42:29 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6882A406D;
 Mon, 21 Dec 2020 07:42:28 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC6B5A4051;
 Mon, 21 Dec 2020 07:42:28 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 21 Dec 2020 07:42:28 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-39-10.uk.ibm.com [9.145.39.10])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 327FC220198;
 Mon, 21 Dec 2020 08:42:28 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/23] powerpc/setup_64: Make some routines static
Date: Mon, 21 Dec 2020 08:42:05 +0100
Message-Id: <20201221074222.403894-7-clg@kaod.org>
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
 clxscore=1034 malwarescore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=605
 mlxscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012210049
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

Fixes these W=3D1 errors :

../arch/powerpc/kernel/setup_64.c:261:13: error: no previous prototype fo=
r =E2=80=98record_spr_defaults=E2=80=99 [-Werror=3Dmissing-prototypes]
  261 | void __init record_spr_defaults(void)
      |             ^~~~~~~~~~~~~~~~~~~
../arch/powerpc/kernel/setup_64.c:1011:6: error: no previous prototype fo=
r =E2=80=98entry_flush_enable=E2=80=99 [-Werror=3Dmissing-prototypes]
 1011 | void entry_flush_enable(bool enable)
      |      ^~~~~~~~~~~~~~~~~~
../arch/powerpc/kernel/setup_64.c:1023:6: error: no previous prototype fo=
r =E2=80=98uaccess_flush_enable=E2=80=99 [-Werror=3Dmissing-prototypes]
 1023 | void uaccess_flush_enable(bool enable)
      |      ^~~~~~~~~~~~~~~~~~~~

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/kernel/setup_64.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_6=
4.c
index c28e949cc222..560ed8b975e7 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -67,6 +67,7 @@
 #include <asm/kup.h>
 #include <asm/early_ioremap.h>
 #include <asm/pgalloc.h>
+#include <asm/asm-prototypes.h>
=20
 #include "setup.h"
=20
@@ -258,7 +259,7 @@ static void cpu_ready_for_interrupts(void)
=20
 unsigned long spr_default_dscr =3D 0;
=20
-void __init record_spr_defaults(void)
+static void __init record_spr_defaults(void)
 {
 	if (early_cpu_has_feature(CPU_FTR_DSCR))
 		spr_default_dscr =3D mfspr(SPRN_DSCR);
@@ -1008,7 +1009,7 @@ void rfi_flush_enable(bool enable)
 	rfi_flush =3D enable;
 }
=20
-void entry_flush_enable(bool enable)
+static void entry_flush_enable(bool enable)
 {
 	if (enable) {
 		do_entry_flush_fixups(enabled_flush_types);
@@ -1020,7 +1021,7 @@ void entry_flush_enable(bool enable)
 	entry_flush =3D enable;
 }
=20
-void uaccess_flush_enable(bool enable)
+static void uaccess_flush_enable(bool enable)
 {
 	if (enable) {
 		do_uaccess_flush_fixups(enabled_flush_types);
--=20
2.26.2

