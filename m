Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5EC59F150
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 04:13:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC8lv4hF6z3fLf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 12:13:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eWE8IHPb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eWE8IHPb;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC8cB6rCkz3c2j
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 12:07:06 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27O1xqfd008806;
	Wed, 24 Aug 2022 02:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XaQ6Ca2jLkKxmiLoG5T+FA0BsTqQ2twTVdjkem94TII=;
 b=eWE8IHPbUtE/Qoq7mLnE5bwQC2eRUCjclUIRGYx3pPnageYsLxKykp3/n/3G5PsmP8fz
 JUzpew4W0NY7Ox7/3kR89e+WERWNKezAHh/eOeuxFzec4D9R9ieo/NQhXRSjT0k+frSv
 OSnwimpOxJI9z1Awq719qeaYrwxhDIjycB09NvYhckngB63HIrOPjYnOyhv3CJVAB6Wt
 g0xVCFSc0LVxON1mOE7TDqwJzzAwacSOwzaKUSgT1S/UIo/evQmuWpBO6JIej7VwYIEG
 Yw27GJFmfnN0y6FCAMVqyMYNNrQLQeDU1tjx3Vmnx+nyrdjFwc5U+gagEt0jXH5KywuV sA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j5atag59q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 02:06:56 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27O25Iej027092;
	Wed, 24 Aug 2022 02:06:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma01fra.de.ibm.com with ESMTP id 3j2q88u9uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 02:06:54 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27O26qKN35324252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Aug 2022 02:06:52 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AC6CAE04D;
	Wed, 24 Aug 2022 02:06:52 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0489DAE045;
	Wed, 24 Aug 2022 02:06:52 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 24 Aug 2022 02:06:51 +0000 (GMT)
Received: from civic.. (unknown [9.177.18.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 917C560151;
	Wed, 24 Aug 2022 12:06:48 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 09/20] powerpc: Enable compile-time check for syscall handlers
Date: Wed, 24 Aug 2022 12:05:37 +1000
Message-Id: <20220824020548.62625-10-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824020548.62625-1-rmclure@linux.ibm.com>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0Zk7IPFrLo_py7QmU25RTR134lebJiCg
X-Proofpoint-ORIG-GUID: 0Zk7IPFrLo_py7QmU25RTR134lebJiCg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_10,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208240005
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

