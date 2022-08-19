Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE135993BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 05:49:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M876B2QB8z3fHF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 13:49:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qn+MJoc4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qn+MJoc4;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M86vP4YRfz3c7y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 13:39:44 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J3Rqbt023615;
	Fri, 19 Aug 2022 03:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XaQ6Ca2jLkKxmiLoG5T+FA0BsTqQ2twTVdjkem94TII=;
 b=qn+MJoc4Rg98KtHUgYB3cVMmL3rCFqwFybe+SJ5tnDJRWOVQcQUEaGP/Vz4ZHytD5GWl
 BJzck1czBn+6m6NbdK2XpaqIplVIEPyDxuQdYZgEUE+dJeDLwiuY3LGHopeyNS6gQoi2
 9h3OnvLx40+iAxMQaABuLFMxbvpRiFnhdcwm84F/cZAqHEvwEU+gE0ZVXAlCWynN+cd+
 htfVO3hPuimBYcnI6DgpUcT661o7XBfFwPXKE2Le7d1oPiVZW7TQ5dcFkWwrYWKqwIOL
 qD3y5X1L29rI0M6vO1uubRWqQieJx7oJ9pld6QdwCVLR9Jif/8Ww7nKHpFrMZXc/wj1P kg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j22mwgac1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:38 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27J3d4Et020228;
	Fri, 19 Aug 2022 03:39:35 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3hx3k8xpma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:35 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27J3aigE31654290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Aug 2022 03:36:44 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 740F44C046;
	Fri, 19 Aug 2022 03:39:33 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D4C44C040;
	Fri, 19 Aug 2022 03:39:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 19 Aug 2022 03:39:33 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9989F60462;
	Fri, 19 Aug 2022 13:39:29 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 09/18] powerpc: Enable compile-time check for syscall handlers
Date: Fri, 19 Aug 2022 13:37:57 +1000
Message-Id: <20220819033806.162054-10-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819033806.162054-1-rmclure@linux.ibm.com>
References: <20220819033806.162054-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TSx2kOBYmC_2aZVLTSY4j_741pxyCZn6
X-Proofpoint-ORIG-GUID: TSx2kOBYmC_2aZVLTSY4j_741pxyCZn6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1011 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208190013
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
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

