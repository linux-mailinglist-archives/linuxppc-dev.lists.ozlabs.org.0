Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F132C5993A8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 05:44:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M871161lPz3f68
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 13:44:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PICt4vGw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PICt4vGw;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M86vM5R8Bz3c8s
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 13:39:42 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27J3CR1t003220;
	Fri, 19 Aug 2022 03:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=bBIau/jdNRTId9ZiOxVHckNq3cim2rJ+k5V9fWXnuMk=;
 b=PICt4vGwhruJBS1fJywymU5mMHgbljLGn3/YRkM0A7mPku8OC+li5HCxEaQanHQbvV8F
 2c+JsGgxkzS0WtPHcmVkcklzxiwkeIn/f3HbCdCHPB6RS6sQ8RLjrEIurVueNN9KFbQB
 SUZ9KmB3UdRcdUqEaloBfXkI44LwNUxNyxL6hECVzAC+JXbldZSiebi+lX2WKx5oCT1n
 wIWn3Q5cDj0JynyTSlNeAjffa5THLuJb4sP/taE9bh40IUgBaNxL4NKhTgdbSz7tgETL
 pnlSOhqt/cE2U/YGfAGM/Td7up/8XLUoXUpCstp7mcJlJmXA7IkM16ak1nFef2mgWQES lg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j22dc0e4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:38 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27J3bJSU019414;
	Fri, 19 Aug 2022 03:39:36 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma01fra.de.ibm.com with ESMTP id 3hx3k950t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 03:39:36 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27J3aiog31654292
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Aug 2022 03:36:44 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD5F74C046;
	Fri, 19 Aug 2022 03:39:33 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D86B4C044;
	Fri, 19 Aug 2022 03:39:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 19 Aug 2022 03:39:33 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9B2F860463;
	Fri, 19 Aug 2022 13:39:29 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 10/18] powerpc: Use common syscall handler type
Date: Fri, 19 Aug 2022 13:37:58 +1000
Message-Id: <20220819033806.162054-11-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819033806.162054-1-rmclure@linux.ibm.com>
References: <20220819033806.162054-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XJOPNc08j9XtYnchHyael-pt1sVm6kXG
X-Proofpoint-GUID: XJOPNc08j9XtYnchHyael-pt1sVm6kXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-19_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cause syscall handlers to be typed as follows when called indirectly
throughout the kernel.

typedef long (*syscall_fn)(unsigned long, unsigned long, unsigned long,
                           unsigned long, unsigned long, unsigned long);

Since both 32 and 64-bit abis allow for at least the first six
machine-word length parameters to a function to be passed by registers,
even handlers which admit fewer than six parameters may be viewed as
having the above type.

Fixup comparisons in VDSO to avoid pointer-integer comparison. Introduce
explicit cast on systems with SPUs.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: New patch.
V2 -> V3: Remove unnecessary cast from const syscall_fn to syscall_fn
---
 arch/powerpc/include/asm/syscall.h          | 7 +++++--
 arch/powerpc/include/asm/syscalls.h         | 1 +
 arch/powerpc/kernel/systbl.c                | 6 +++---
 arch/powerpc/kernel/vdso.c                  | 4 ++--
 arch/powerpc/platforms/cell/spu_callbacks.c | 6 +++---
 5 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
index 25fc8ad9a27a..d2a8dfd5de33 100644
--- a/arch/powerpc/include/asm/syscall.h
+++ b/arch/powerpc/include/asm/syscall.h
@@ -14,9 +14,12 @@
 #include <linux/sched.h>
 #include <linux/thread_info.h>
 
+typedef long (*syscall_fn)(unsigned long, unsigned long, unsigned long,
+			   unsigned long, unsigned long, unsigned long);
+
 /* ftrace syscalls requires exporting the sys_call_table */
-extern const unsigned long sys_call_table[];
-extern const unsigned long compat_sys_call_table[];
+extern const syscall_fn sys_call_table[];
+extern const syscall_fn compat_sys_call_table[];
 
 static inline int syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
 {
diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index 91417dee534e..e979b7593d2b 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -8,6 +8,7 @@
 #include <linux/types.h>
 #include <linux/compat.h>
 
+#include <asm/syscall.h>
 #ifdef CONFIG_PPC64
 #include <asm/syscalls_32.h>
 #endif
diff --git a/arch/powerpc/kernel/systbl.c b/arch/powerpc/kernel/systbl.c
index 99ffdfef6b9c..b88a9c2a1f50 100644
--- a/arch/powerpc/kernel/systbl.c
+++ b/arch/powerpc/kernel/systbl.c
@@ -21,10 +21,10 @@
 #define __SYSCALL(nr, entry) [nr] = __powerpc_##entry,
 #define __powerpc_sys_ni_syscall	sys_ni_syscall
 #else
-#define __SYSCALL(nr, entry) [nr] = entry,
+#define __SYSCALL(nr, entry) [nr] = (void *) entry,
 #endif
 
-void *sys_call_table[] = {
+const syscall_fn sys_call_table[] = {
 #ifdef CONFIG_PPC64
 #include <asm/syscall_table_64.h>
 #else
@@ -35,7 +35,7 @@ void *sys_call_table[] = {
 #ifdef CONFIG_COMPAT
 #undef __SYSCALL_WITH_COMPAT
 #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
-void *compat_sys_call_table[] = {
+const syscall_fn compat_sys_call_table[] = {
 #include <asm/syscall_table_32.h>
 };
 #endif /* CONFIG_COMPAT */
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 0da287544054..080c9e7de0c0 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -313,10 +313,10 @@ static void __init vdso_setup_syscall_map(void)
 	unsigned int i;
 
 	for (i = 0; i < NR_syscalls; i++) {
-		if (sys_call_table[i] != (unsigned long)&sys_ni_syscall)
+		if (sys_call_table[i] != (void *)&sys_ni_syscall)
 			vdso_data->syscall_map[i >> 5] |= 0x80000000UL >> (i & 0x1f);
 		if (IS_ENABLED(CONFIG_COMPAT) &&
-		    compat_sys_call_table[i] != (unsigned long)&sys_ni_syscall)
+		    compat_sys_call_table[i] != (void *)&sys_ni_syscall)
 			vdso_data->compat_syscall_map[i >> 5] |= 0x80000000UL >> (i & 0x1f);
 	}
 }
diff --git a/arch/powerpc/platforms/cell/spu_callbacks.c b/arch/powerpc/platforms/cell/spu_callbacks.c
index fe0d8797a00a..e780c14c5733 100644
--- a/arch/powerpc/platforms/cell/spu_callbacks.c
+++ b/arch/powerpc/platforms/cell/spu_callbacks.c
@@ -34,15 +34,15 @@
  *	mbind, mq_open, ipc, ...
  */
 
-static void *spu_syscall_table[] = {
+static const syscall_fn spu_syscall_table[] = {
 #define __SYSCALL_WITH_COMPAT(nr, entry, compat) __SYSCALL(nr, entry)
-#define __SYSCALL(nr, entry) [nr] = entry,
+#define __SYSCALL(nr, entry) [nr] = (void *) entry,
 #include <asm/syscall_table_spu.h>
 };
 
 long spu_sys_callback(struct spu_syscall_block *s)
 {
-	long (*syscall)(u64 a1, u64 a2, u64 a3, u64 a4, u64 a5, u64 a6);
+	syscall_fn syscall;
 
 	if (s->nr_ret >= ARRAY_SIZE(spu_syscall_table)) {
 		pr_debug("%s: invalid syscall #%lld", __func__, s->nr_ret);
-- 
2.34.1

