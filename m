Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF7857F96C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 08:30:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrqsT5ynNz3f6D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 16:30:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ql4nr1QF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ql4nr1QF;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrqrD1CBKz3f2F
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 16:28:59 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26P6LBWx002438;
	Mon, 25 Jul 2022 06:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=6XsF4Sb6E/eA/MnbqlmAOVMQh1q+1gOT4L8VzaGxi40=;
 b=ql4nr1QFD4iYWMv2HxNtPbyte5zIAVp2gG+ddvaW9Jock3hyUSlV6ltHcKs/+Y+Lx6vm
 RuI51CRo1MSaHcOtsszuJwGWN4Mc6uBQcnHFW1yDa7P8WYA1vJ+51OIORRgWZEB63E5k
 qjkrEwgcPlq25nHzOXwTd9yIJSSzKAjzf/2T0GckBhZ36NafXTDv2tKjzGe7irCdD1mI
 4qZ+bEv0GOLdRyRTU+ps9sBgWNnVRKGNfzmHPFKGr+el+P9xVEz3IfdLMh4OyX19bxra
 QoiwQSnOnjtQaNQY7bAp7tqyoorF+FV1L5RY9VvAEeEFXGvhYzTjp1KK217JIuIa8fpk Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhnu4g5x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:28:54 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26P6Llj6003696;
	Mon, 25 Jul 2022 06:28:54 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhnu4g5wk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:28:54 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26P6LDSJ017862;
	Mon, 25 Jul 2022 06:28:52 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma01fra.de.ibm.com with ESMTP id 3hg98n9xrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 06:28:52 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26P6Qsvp15991196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Jul 2022 06:26:54 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B53C11C04A;
	Mon, 25 Jul 2022 06:28:50 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9FBE511C050;
	Mon, 25 Jul 2022 06:28:48 +0000 (GMT)
Received: from civic.. (unknown [9.192.255.53])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 25 Jul 2022 06:28:48 +0000 (GMT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 08/14] powerpc: Use common syscall handler type
Date: Mon, 25 Jul 2022 16:28:45 +1000
Message-Id: <20220725062845.119908-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QRtwu-wxsR6V7TsbnmmR8C4SK200_FW0
X-Proofpoint-GUID: Amr7Ld260CbpfCxd_zcjZvgrDdtTau9u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-23_02,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 mlxlogscore=963 mlxscore=0 adultscore=0
 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com
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
---
 arch/powerpc/include/asm/syscall.h          | 7 +++++--
 arch/powerpc/include/asm/syscalls.h         | 1 +
 arch/powerpc/kernel/interrupt.c             | 2 --
 arch/powerpc/kernel/systbl.c                | 6 +++---
 arch/powerpc/kernel/vdso.c                  | 4 ++--
 arch/powerpc/platforms/cell/spu_callbacks.c | 8 ++++----
 6 files changed, 15 insertions(+), 13 deletions(-)

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
index 8b2757d7f423..fbeab8e88c5e 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -8,6 +8,7 @@
 #include <linux/types.h>
 #include <linux/compat.h>
 
+#include <asm/syscall.h>
 #ifdef CONFIG_PPC64
 #include <asm/ppc32.h>
 #endif
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 784ea3289c84..62e636e0f684 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -24,8 +24,6 @@
 unsigned long global_dbcr0[NR_CPUS];
 #endif
 
-typedef long (*syscall_fn)(long, long, long, long, long, long);
-
 #ifdef CONFIG_PPC_BOOK3S_64
 DEFINE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
 static inline bool exit_must_hard_disable(void)
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
index fe0d8797a00a..114bbe2eeacc 100644
--- a/arch/powerpc/platforms/cell/spu_callbacks.c
+++ b/arch/powerpc/platforms/cell/spu_callbacks.c
@@ -34,22 +34,22 @@
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
 		return -ENOSYS;
 	}
 
-	syscall = spu_syscall_table[s->nr_ret];
+	syscall = (syscall_fn) spu_syscall_table[s->nr_ret];
 
 	pr_debug("SPU-syscall "
 		 "%pSR:syscall%lld(%llx, %llx, %llx, %llx, %llx, %llx)\n",
-- 
2.34.1

