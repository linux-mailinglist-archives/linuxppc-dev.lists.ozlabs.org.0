Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D6B5BF72F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 09:11:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXV2P62NKz3g65
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 17:11:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QBKjesi8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QBKjesi8;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXTmL4cbPz3cdc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 16:59:14 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L6uCMB009188;
	Wed, 21 Sep 2022 06:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=T+T9KaGH/sr2Tlg0riv9ILEbgrIf12dlaqO6bmtU3mY=;
 b=QBKjesi8Csf+zuS+DBMVBcYjlJY0gCjmxDdQhw9RB9zQ1iSZWC2r24mRSMQoafAz6KB6
 6FyRaMEMFP0HrWFlY3tKqPXkqYkR0uXZyZ30CnJ/rPfdBTR/2+OII3sE4GHMtyOwje7C
 FVafHvF0dv5OXllQR8U8oLd+4/1RktS4e6BwAqD+DTP1QsACr7lPvLFOfK2sUtjjXmme
 I4GlZ9FdiV9caZxiBO3Y2REYjn+JT8KyQKF/Zw0G0HEzQ4fy4eF5/8JAoEwfHZkrfnLr
 r4ShAj1nsFoMo841UGxeR4y7tI/mtbxr20vgZT7lj22gSmQPbfTdeb2y6nd/INY+RZ4x Tw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqw9r0qx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:59:10 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L6qkLm021082;
	Wed, 21 Sep 2022 06:59:08 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03fra.de.ibm.com with ESMTP id 3jn5v8kkg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 06:59:08 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L6x54o26608022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 06:59:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D14734C040;
	Wed, 21 Sep 2022 06:59:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 316DD4C046;
	Wed, 21 Sep 2022 06:59:05 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 06:59:05 +0000 (GMT)
Received: from civic.. (unknown [9.177.29.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C0CD060531;
	Wed, 21 Sep 2022 16:59:01 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 21/25] powerpc: Provide syscall wrapper
Date: Wed, 21 Sep 2022 16:56:01 +1000
Message-Id: <20220921065605.1051927-22-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921065605.1051927-1-rmclure@linux.ibm.com>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _X3ZxCA6qBoju-I6u3en0L38kSKgcIAG
X-Proofpoint-ORIG-GUID: _X3ZxCA6qBoju-I6u3en0L38kSKgcIAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_03,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=828 mlxscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement syscall wrapper as per s390, x86, arm64. When enabled
cause handlers to accept parameters from a stack frame rather than
from user scratch register state. This allows for user registers to be
safely cleared in order to reduce caller influence on speculation
within syscall routine. The wrapper is a macro that emits syscall
handler symbols that call into the target handler, obtaining its
parameters from a struct pt_regs on the stack.

As registers are already saved to the stack prior to calling
system_call_exception, it appears that this function is executed more
efficiently with the new stack-pointer convention than with parameters
passed by registers, avoiding the allocation of a stack frame for this
method. On a 32-bit system, we see >20% performance increases on the
null_syscall microbenchmark, and on a Power 8 the performance gains
amortise the cost of clearing and restoring registers which is
implemented at the end of this series, seeing final result of ~5.6%
performance improvement on null_syscall.

Syscalls are wrapped in this fashion on all platforms except for the
Cell processor as this commit does not provide SPU support. This can be
quickly fixed in a successive patch, but requires spu_sys_callback to
allocate a pt_regs structure to satisfy the wrapped calling convention.

Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V2: Generate prototypes for symbols produced by the wrapper.
V3: Rebased to remove conflict with 1547db7d1f44
("powerpc: Move system_call_exception() to syscall.c"). Also remove copy
from gpr3 save slot on stackframe to orig_r3's slot. Fix whitespace with
preprocessor defines in system_call_exception.
V5: Move systbl.c syscall wrapper support to this patch. Swap
calling convention for system_call_exception to be (&regs, r0)
V6: Change calling convention for system_call_exception in another
patch.
---
 arch/powerpc/Kconfig                       |  1 +
 arch/powerpc/include/asm/syscall.h         |  4 +
 arch/powerpc/include/asm/syscall_wrapper.h | 84 ++++++++++++++++++++
 arch/powerpc/include/asm/syscalls.h        | 30 ++++++-
 arch/powerpc/kernel/syscall.c              |  7 +-
 arch/powerpc/kernel/systbl.c               |  7 ++
 arch/powerpc/kernel/vdso.c                 |  2 +
 7 files changed, 132 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4c466acdc70d..ef6c83e79c9b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -137,6 +137,7 @@ config PPC
 	select ARCH_HAS_STRICT_KERNEL_RWX	if (PPC_BOOK3S || PPC_8xx || 40x) && !HIBERNATION
 	select ARCH_HAS_STRICT_KERNEL_RWX	if FSL_BOOKE && !HIBERNATION && !RANDOMIZE_BASE
 	select ARCH_HAS_STRICT_MODULE_RWX	if ARCH_HAS_STRICT_KERNEL_RWX
+	select ARCH_HAS_SYSCALL_WRAPPER		if !SPU_BASE
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
index d2a8dfd5de33..3dd36c5e334a 100644
--- a/arch/powerpc/include/asm/syscall.h
+++ b/arch/powerpc/include/asm/syscall.h
@@ -14,8 +14,12 @@
 #include <linux/sched.h>
 #include <linux/thread_info.h>
 
+#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
+typedef long (*syscall_fn)(const struct pt_regs *);
+#else
 typedef long (*syscall_fn)(unsigned long, unsigned long, unsigned long,
 			   unsigned long, unsigned long, unsigned long);
+#endif
 
 /* ftrace syscalls requires exporting the sys_call_table */
 extern const syscall_fn sys_call_table[];
diff --git a/arch/powerpc/include/asm/syscall_wrapper.h b/arch/powerpc/include/asm/syscall_wrapper.h
new file mode 100644
index 000000000000..91bcfa40f740
--- /dev/null
+++ b/arch/powerpc/include/asm/syscall_wrapper.h
@@ -0,0 +1,84 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * syscall_wrapper.h - powerpc specific wrappers to syscall definitions
+ *
+ * Based on arch/{x86,arm64}/include/asm/syscall_wrapper.h
+ */
+
+#ifndef __ASM_SYSCALL_WRAPPER_H
+#define __ASM_SYSCALL_WRAPPER_H
+
+struct pt_regs;
+
+#define SC_POWERPC_REGS_TO_ARGS(x, ...)				\
+	__MAP(x,__SC_ARGS					\
+	      ,,regs->gpr[3],,regs->gpr[4],,regs->gpr[5]	\
+	      ,,regs->gpr[6],,regs->gpr[7],,regs->gpr[8])
+
+#ifdef CONFIG_COMPAT
+
+#define COMPAT_SYSCALL_DEFINEx(x, name, ...)						\
+	long __powerpc_compat_sys##name(const struct pt_regs *regs);			\
+	ALLOW_ERROR_INJECTION(__powerpc_compat_sys##name, ERRNO);			\
+	static long __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
+	static inline long __do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
+	long __powerpc_compat_sys##name(const struct pt_regs *regs)			\
+	{										\
+		return __se_compat_sys##name(SC_POWERPC_REGS_TO_ARGS(x,__VA_ARGS__));	\
+	}										\
+	static long __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))		\
+	{										\
+		return __do_compat_sys##name(__MAP(x,__SC_DELOUSE,__VA_ARGS__));	\
+	}										\
+	static inline long __do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
+
+#define COMPAT_SYSCALL_DEFINE0(sname)						\
+	long __powerpc_compat_sys_##sname(const struct pt_regs *__unused);	\
+	ALLOW_ERROR_INJECTION(__powerpc_compat_sys_##sname, ERRNO);		\
+	long __powerpc_compat_sys_##sname(const struct pt_regs *__unused)
+
+#define COND_SYSCALL_COMPAT(name)						\
+	long __powerpc_compat_sys_##name(const struct pt_regs *regs);		\
+	long __weak __powerpc_compat_sys_##name(const struct pt_regs *regs)	\
+	{									\
+		return sys_ni_syscall();					\
+	}
+#define COMPAT_SYS_NI(name) \
+	SYSCALL_ALIAS(__powerpc_compat_sys_##name, sys_ni_posix_timers);
+
+#endif /* CONFIG_COMPAT */
+
+#define __SYSCALL_DEFINEx(x, name, ...)						\
+	long __powerpc_sys##name(const struct pt_regs *regs);			\
+	ALLOW_ERROR_INJECTION(__powerpc_sys##name, ERRNO);			\
+	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
+	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
+	long __powerpc_sys##name(const struct pt_regs *regs)			\
+	{									\
+		return __se_sys##name(SC_POWERPC_REGS_TO_ARGS(x,__VA_ARGS__));	\
+	}									\
+	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))		\
+	{									\
+		long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));	\
+		__MAP(x,__SC_TEST,__VA_ARGS__);					\
+		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));		\
+		return ret;							\
+	}									\
+	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
+
+#define SYSCALL_DEFINE0(sname)							\
+	SYSCALL_METADATA(_##sname, 0);						\
+	long __powerpc_sys_##sname(const struct pt_regs *__unused);		\
+	ALLOW_ERROR_INJECTION(__powerpc_sys_##sname, ERRNO);			\
+	long __powerpc_sys_##sname(const struct pt_regs *__unused)
+
+#define COND_SYSCALL(name)							\
+	long __powerpc_sys_##name(const struct pt_regs *regs);			\
+	long __weak __powerpc_sys_##name(const struct pt_regs *regs)		\
+	{									\
+		return sys_ni_syscall();					\
+	}
+
+#define SYS_NI(name) SYSCALL_ALIAS(__powerpc_sys_##name, sys_ni_posix_timers);
+
+#endif /* __ASM_SYSCALL_WRAPPER_H */
diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index cc87168d6ecb..1ecdf6c071f6 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -15,6 +15,12 @@
 #include <asm/unistd.h>
 #include <asm/ucontext.h>
 
+#ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
+long sys_ni_syscall(void);
+#else
+long sys_ni_syscall(const struct pt_regs *regs);
+#endif
+
 struct rtas_args;
 
 /*
@@ -29,12 +35,12 @@ struct rtas_args;
 #define merge_64(high, low) ((u64)high << 32) | low
 #endif
 
-long sys_ni_syscall(void);
-
 /*
  * PowerPC architecture-specific syscalls
  */
 
+#ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
+
 long sys_rtas(struct rtas_args __user *uargs);
 
 #ifdef CONFIG_PPC64
@@ -114,5 +120,25 @@ long sys_ppc_fadvise64_64(int fd, int advice,
 			  u32 len_high, u32 len_low);
 #endif
 
+#else
+
+#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
+#define __SYSCALL(nr, entry) \
+	long __powerpc_##entry(const struct pt_regs *regs);
+
+#ifdef CONFIG_PPC64
+#include <asm/syscall_table_64.h>
+#else
+#include <asm/syscall_table_32.h>
+#endif /* CONFIG_PPC64 */
+
+#ifdef CONFIG_COMPAT
+#undef __SYSCALL_WITH_COMPAT
+#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
+#include <asm/syscall_table_32.h>
+#endif /* CONFIG_COMPAT */
+
+#endif /* CONFIG_ARCH_HAS_SYSCALL_WRAPPER */
+
 #endif /* __KERNEL__ */
 #endif /* __ASM_POWERPC_SYSCALLS_H */
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index 0e9ba3efee94..38c499afc689 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -153,7 +153,12 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
 		f = (void *)sys_call_table[r0];
 	}
 
-	ret = f(r3, r4, r5, r6, r7, r8);
+#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
+	ret = f(regs);
+#else
+	ret = f(regs->gpr[3], regs->gpr[4], regs->gpr[5],
+		regs->gpr[6], regs->gpr[7], regs->gpr[8]);
+#endif
 
 	/*
 	 * Ultimately, this value will get limited by KSTACK_OFFSET_MAX(),
diff --git a/arch/powerpc/kernel/systbl.c b/arch/powerpc/kernel/systbl.c
index d64dfafc2e5e..9d7c5a596171 100644
--- a/arch/powerpc/kernel/systbl.c
+++ b/arch/powerpc/kernel/systbl.c
@@ -15,13 +15,20 @@
 #include <asm/unistd.h>
 #include <asm/syscalls.h>
 
+#undef __SYSCALL_WITH_COMPAT
 #define __SYSCALL_WITH_COMPAT(nr, entry, compat) __SYSCALL(nr, entry)
 
+#undef __SYSCALL
+#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
+#define __SYSCALL(nr, entry) [nr] = __powerpc_##entry,
+#define __powerpc_sys_ni_syscall	sys_ni_syscall
+#else
 /*
  * Coerce syscall handlers with arbitrary parameters to common type
  * requires cast to void* to avoid -Wcast-function-type.
  */
 #define __SYSCALL(nr, entry) [nr] = (void *) entry,
+#endif
 
 const syscall_fn sys_call_table[] = {
 #ifdef CONFIG_PPC64
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index fcca06d200d3..e1f36fd61db3 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -39,6 +39,8 @@
 extern char vdso32_start, vdso32_end;
 extern char vdso64_start, vdso64_end;
 
+long sys_ni_syscall(void);
+
 /*
  * The vdso data page (aka. systemcfg for old ppc64 fans) is here.
  * Once the early boot kernel code no longer needs to muck around
-- 
2.34.1

