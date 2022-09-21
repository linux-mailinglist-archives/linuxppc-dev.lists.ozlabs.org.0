Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCB95BF714
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 09:09:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXV0462j5z3fxY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:09:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fklJR9HA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fklJR9HA;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTmB5Vyrz3dw1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 16:59:06 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L6DeNY029411;
	Wed, 21 Sep 2022 06:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=v2agHLp3UM+J7VMUZQNMxNOZ7UjvgVAy637Sm4i5oP0=;
 b=fklJR9HAPbecb93BFIXnRjWvIOGfXGZKcLLWuOCv3bO/auH76sK9gx9F920M1//gMEsZ
 446ifellqBuC87Xu0j1KFw7YWHdYG5i0a3BP90oWsa2voJ3274ZddAxiCm2mSjTjgmww
 PGayPPp6A7eVjJ+ACwq5522J2h+rRDU3O+ViNY1Sn7jguEl2UzAtjXagBBQHnqj8ABu7
 I/+OjAwkU1HCZptrlpueUgSfbBPW5YlciqfrWpIGOd3LTrCw4EJaQ/JAXfEQo6zPiu4L
 3sVZ/ll+0o2Suk4QVDgS6I/j+k6GBtjXNV9rOM2DfJxy9rz1AffvJ7aSPShpsmnIcUe/ iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqw5fs83w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:59:01 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28L6I0wo008153;
	Wed, 21 Sep 2022 06:59:01 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqw5fs82y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:59:01 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L6uSl6007076;
	Wed, 21 Sep 2022 06:58:59 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma02fra.de.ibm.com with ESMTP id 3jn5v8ukc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:58:59 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L6wvwI35652022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 06:58:57 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1743E4C044;
	Wed, 21 Sep 2022 06:58:57 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CDB44C040;
	Wed, 21 Sep 2022 06:58:56 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 06:58:56 +0000 (GMT)
Received: from civic.. (unknown [9.177.29.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 1D45760060;
	Wed, 21 Sep 2022 16:58:52 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 18/25] powerpc: Use common syscall handler type
Date: Wed, 21 Sep 2022 16:55:58 +1000
Message-Id: <20220921065605.1051927-19-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921065605.1051927-1-rmclure@linux.ibm.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zK8JOHmLbiSjlJBugNw50dPt3ONMsMzZ
X-Proofpoint-ORIG-GUID: v8zTaPZbnX6jr8tSEL5p89956ywzOYkq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_02,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210043
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cause syscall handlers to be typed as follows when called indirectly
throughout the kernel. This is to allow for better type checking.

typedef long (*syscall_fn)(unsigned long, unsigned long, unsigned long,
                           unsigned long, unsigned long, unsigned long);

Since both 32 and 64-bit abis allow for at least the first six
machine-word length parameters to a function to be passed by registers,
even handlers which admit fewer than six parameters may be viewed as
having the above type.

Coercing syscalls to syscall_fn requires a cast to void* to avoid
-Wcast-function-type.

Fixup comparisons in VDSO to avoid pointer-integer comparison. Introduce
explicit cast on systems with SPUs.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
V2: New patch.
V3: Remove unnecessary cast from const syscall_fn to syscall_fn
V5: Update patch desctiption.
V6: Remove syscall_fn typedef in syscall.c. Comment void* cast.
---
 arch/powerpc/include/asm/syscall.h          |  7 +++++--
 arch/powerpc/include/asm/syscalls.h         |  1 +
 arch/powerpc/kernel/syscall.c               |  2 --
 arch/powerpc/kernel/systbl.c                | 11 ++++++++---
 arch/powerpc/kernel/vdso.c                  |  4 ++--
 arch/powerpc/platforms/cell/spu_callbacks.c |  6 +++---
 6 files changed, 19 insertions(+), 12 deletions(-)

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
index 5d106acf7906..cc87168d6ecb 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -8,6 +8,7 @@
 #include <linux/types.h>
 #include <linux/compat.h>
 
+#include <asm/syscall.h>
 #ifdef CONFIG_PPC64
 #include <asm/syscalls_32.h>
 #endif
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index 64102a64fd84..9875486f6168 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -12,8 +12,6 @@
 #include <asm/unistd.h>
 
 
-typedef long (*syscall_fn)(long, long, long, long, long, long);
-
 /* Has to run notrace because it is entered not completely "reconciled" */
 notrace long system_call_exception(long r3, long r4, long r5,
 				   long r6, long r7, long r8,
diff --git a/arch/powerpc/kernel/systbl.c b/arch/powerpc/kernel/systbl.c
index ce52bd2ec292..d64dfafc2e5e 100644
--- a/arch/powerpc/kernel/systbl.c
+++ b/arch/powerpc/kernel/systbl.c
@@ -16,9 +16,14 @@
 #include <asm/syscalls.h>
 
 #define __SYSCALL_WITH_COMPAT(nr, entry, compat) __SYSCALL(nr, entry)
-#define __SYSCALL(nr, entry) [nr] = (unsigned long) &entry,
 
-const unsigned long sys_call_table[] = {
+/*
+ * Coerce syscall handlers with arbitrary parameters to common type
+ * requires cast to void* to avoid -Wcast-function-type.
+ */
+#define __SYSCALL(nr, entry) [nr] = (void *) entry,
+
+const syscall_fn sys_call_table[] = {
 #ifdef CONFIG_PPC64
 #include <asm/syscall_table_64.h>
 #else
@@ -29,7 +34,7 @@ const unsigned long sys_call_table[] = {
 #ifdef CONFIG_COMPAT
 #undef __SYSCALL_WITH_COMPAT
 #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
-const unsigned long compat_sys_call_table[] = {
+const syscall_fn compat_sys_call_table[] = {
 #include <asm/syscall_table_32.h>
 };
 #endif /* CONFIG_COMPAT */
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index bf9574ec26ce..fcca06d200d3 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -304,10 +304,10 @@ static void __init vdso_setup_syscall_map(void)
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

