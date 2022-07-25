Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AAA57F96A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 08:29:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrqrl4FKWz3f3N
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 16:29:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jw9ap7n7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jw9ap7n7;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lrqqf0F5gz3drL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 16:28:29 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26P5lTUA027972;
	Mon, 25 Jul 2022 06:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=XaQ6Ca2jLkKxmiLoG5T+FA0BsTqQ2twTVdjkem94TII=;
 b=jw9ap7n7CGGN5zV3+Z1pdlNtrDaSpjheaD413KLM26QnktHCtHFjJOK4+xyet4HB1Wg/
 dt4sq0xLHOoayO1JHJguVvHN82tTjsN9Fyp4BFwEMeWFzMR+rRUZ28rVT3BuzssTVbMx
 5wMli0VaoyblgL6bbRxg80NoweU5IPhXJzV555RWBEzvRm84WfgCaKUgerWtz3kI1zUX
 zLfgzTusDJxLPXAYXa3JQ0ZndQz1GCOy+TdW+YsWgCIVZA4lG1NtyL69ECVr5+hdOl7E
 caRJPwdhkFJxqL1FtNRdx6CVYvNIkYzGIzHxSzpsHk8ESy9B5W2MqTr9LPsyvkJLzPeB hw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhnb9rxu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:28:23 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26P6RQQ4001651;
	Mon, 25 Jul 2022 06:28:22 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhnb9rxtu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:28:22 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26P6LfLn016966;
	Mon, 25 Jul 2022 06:28:21 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3hg97t9ysm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:28:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26P6SWLa28180962
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Jul 2022 06:28:32 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B787DA4040;
	Mon, 25 Jul 2022 06:28:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90ABBA404D;
	Mon, 25 Jul 2022 06:28:16 +0000 (GMT)
Received: from civic.. (unknown [9.192.255.53])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 25 Jul 2022 06:28:16 +0000 (GMT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 07/14] powerpc: Enable compile-time check for syscall handlers
Date: Mon, 25 Jul 2022 16:28:13 +1000
Message-Id: <20220725062813.119723-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 93CXa6DK2Cz8BR2BfMP-0II80XHXSD6n
X-Proofpoint-GUID: Ns2ULJzPFXYwQRxE6nzb-XWsQWlneKkb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250026
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, arnd@arndb.de, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The table of syscall handlers and registered compatibility syscall
handlers has in past been produced using assembly, with function
references resolved at link time. This moves link-time errors to
compile-time, by rewriting systbl.S in C, and including the
linux/syscalls.h, linux/compat.h and asm/syscalls.h headers for
prototypes.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: New patch.
---
 arch/powerpc/kernel/{systbl.S => systbl.c} | 27 ++++++++++----------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/systbl.S b/arch/powerpc/kernel/systbl.c
similarity index 59%
rename from arch/powerpc/kernel/systbl.S
rename to arch/powerpc/kernel/systbl.c
index cb3358886203..99ffdfef6b9c 100644
--- a/arch/powerpc/kernel/systbl.S
+++ b/arch/powerpc/kernel/systbl.c
@@ -10,31 +10,32 @@
  * PPC64 updates by Dave Engebretsen (engebret@us.ibm.com) 
  */
 
-#include <asm/ppc_asm.h>
+#include <linux/syscalls.h>
+#include <linux/compat.h>
+#include <asm/unistd.h>
+#include <asm/syscalls.h>
 
-.section .rodata,"a"
+#define __SYSCALL_WITH_COMPAT(nr, entry, compat) __SYSCALL(nr, entry)
 
-#ifdef CONFIG_PPC64
-	.p2align	3
-#define __SYSCALL(nr, entry)	.8byte entry
+#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
+#define __SYSCALL(nr, entry) [nr] = __powerpc_##entry,
+#define __powerpc_sys_ni_syscall	sys_ni_syscall
 #else
-#define __SYSCALL(nr, entry)	.long entry
+#define __SYSCALL(nr, entry) [nr] = entry,
 #endif
 
-#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
-.globl sys_call_table
-sys_call_table:
+void *sys_call_table[] = {
 #ifdef CONFIG_PPC64
 #include <asm/syscall_table_64.h>
 #else
 #include <asm/syscall_table_32.h>
 #endif
+};
 
 #ifdef CONFIG_COMPAT
 #undef __SYSCALL_WITH_COMPAT
 #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
-.globl compat_sys_call_table
-compat_sys_call_table:
-#define compat_sys_sigsuspend	sys_sigsuspend
+void *compat_sys_call_table[] = {
 #include <asm/syscall_table_32.h>
-#endif
+};
+#endif /* CONFIG_COMPAT */
-- 
2.34.1

