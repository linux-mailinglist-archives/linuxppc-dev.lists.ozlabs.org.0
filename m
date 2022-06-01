Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFB5539CC8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 07:50:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCdXk3t7Mz3cDf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 15:50:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cs3hSu1W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cs3hSu1W;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCdWJ2KY9z2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 15:49:15 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2514IM1r030804;
	Wed, 1 Jun 2022 05:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4VqEPUqAK5/hTLNEx9tGjX86KyIIoeZ5EtwI/O0I4QA=;
 b=Cs3hSu1WWUv7NuG+tEjmEy9YFNro9gI7IiQyfAKBsaJZrmp/rnKEWGGvw7KLVORxCElS
 wfYVy8cIG0FfswCrbQIN0v05CH5aY2S8l2EXoEo/6MpG9Y9Yc7nbU3AWUE2eS532PTos
 nlA9MTAzLmRb1ERZEr774rUzJvFxVyL2/zyr6KaKXI61mwy5Cm6wE9p3n2ZBGKWpfPUo
 xXiY4hrrCyfS9Ln2+Zclh0NhxZj0L2dmsIsrSYxc5JEjwCRE7aFHla/zsUbpK501JkcV
 WWzTkTNVABNQkCd74DnWZV1HFiiJdZiry8n0k9OGesdD/fZmdYkRFw1eJ6VWQ7+39ZQG RA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ge0yf9731-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 05:49:09 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2515I1hD014036;
	Wed, 1 Jun 2022 05:49:09 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ge0yf972q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 05:49:09 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2515Z1eA005684;
	Wed, 1 Jun 2022 05:49:07 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma02fra.de.ibm.com with ESMTP id 3gbcc6buby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jun 2022 05:49:07 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2515n3Dh47579520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jun 2022 05:49:03 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C994D11C04A;
	Wed,  1 Jun 2022 05:49:03 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51B1111C04C;
	Wed,  1 Jun 2022 05:49:01 +0000 (GMT)
Received: from civic.. (unknown [9.192.255.94])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jun 2022 05:49:00 +0000 (GMT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/6] powerpc: Provide syscall wrapper
Date: Wed,  1 Jun 2022 15:48:46 +1000
Message-Id: <20220601054850.250287-2-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220601054850.250287-1-rmclure@linux.ibm.com>
References: <20220601054850.250287-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xoCsP9yVi1-1R4DDgKkfb7-EJQLOzeYf
X-Proofpoint-GUID: gDhpTjcQYzVLAfIRRGk6DpCH8HrVp3LW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-01_01,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=355 spamscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206010025
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Syscall wrapper implemented as per s390, x86, arm64, providing the
option for gprs to be cleared on entry to the kernel, reducing caller
influence influence on speculation within syscall routine. The wrapper
is a macro that emits syscall handler implementations with parameters
passed by stack pointer.

For platforms supporting this syscall wrapper, emit symbols with usual
in-register parameters (`sys...`) to support calls to syscall handlers
from within the kernel.

Syscalls are wrapped on all platforms except Cell processor. SPUs require
access syscall prototypes which are omitted with ARCH_HAS_SYSCALL_WRAPPER
enabled.

Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/powerpc/Kconfig                       |  1 +
 arch/powerpc/include/asm/interrupt.h       |  3 +-
 arch/powerpc/include/asm/syscall_wrapper.h | 92 ++++++++++++++++++++++
 arch/powerpc/include/asm/syscalls.h        | 83 +++++++++++++------
 arch/powerpc/kernel/entry_32.S             |  6 +-
 arch/powerpc/kernel/interrupt.c            | 35 ++++----
 arch/powerpc/kernel/interrupt_64.S         | 30 +++----
 arch/powerpc/kernel/sys_ppc32.c            | 50 +++++++-----
 arch/powerpc/kernel/syscalls.c             | 19 +++--
 arch/powerpc/kernel/systbl.S               | 21 +++++
 arch/powerpc/kernel/vdso.c                 |  2 +
 11 files changed, 255 insertions(+), 87 deletions(-)
 create mode 100644 arch/powerpc/include/asm/syscall_wrapper.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 174edabb74fa..e58287a70061 100644
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
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index f964ef5c57d8..8e8949e4db7a 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -636,8 +636,7 @@ static inline void interrupt_cond_local_irq_enable(struct pt_regs *regs)
 		local_irq_enable();
 }
 
-long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
-			   unsigned long r0, struct pt_regs *regs);
+long system_call_exception(unsigned long r0, struct pt_regs *regs);
 notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs, long scv);
 notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs);
 notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs);
diff --git a/arch/powerpc/include/asm/syscall_wrapper.h b/arch/powerpc/include/asm/syscall_wrapper.h
new file mode 100644
index 000000000000..23da22b081e4
--- /dev/null
+++ b/arch/powerpc/include/asm/syscall_wrapper.h
@@ -0,0 +1,92 @@
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
+	asmlinkage long __powerpc_compat_sys##name(const struct pt_regs *regs);		\
+	ALLOW_ERROR_INJECTION(__powerpc_compat_sys##name, ERRNO);			\
+	static long __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
+	static inline long __do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
+	asmlinkage long __powerpc_compat_sys##name(const struct pt_regs *regs)		\
+	{										\
+		return __se_compat_sys##name(SC_POWERPC_REGS_TO_ARGS(x,__VA_ARGS__));	\
+	}										\
+	static long __se_compat_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))		\
+	{										\
+		return __do_compat_sys##name(__MAP(x,__SC_DELOUSE,__VA_ARGS__));	\
+	}										\
+	static inline long __do_compat_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
+
+#define COMPAT_SYSCALL_DEFINE0(sname)							\
+	asmlinkage long __powerpc_compat_sys_##sname(const struct pt_regs *__unused);	\
+	ALLOW_ERROR_INJECTION(__powerpc_compat_sys_##sname, ERRNO);			\
+	asmlinkage long __powerpc_compat_sys_##sname(const struct pt_regs *__unused)
+
+#define COND_SYSCALL_COMPAT(name)							\
+	asmlinkage long __weak __powerpc_compat_sys_##name(const struct pt_regs *regs)	\
+	{										\
+		return sys_ni_syscall();						\
+	}
+#define COMPAT_SYS_NI(name) \
+	SYSCALL_ALIAS(__powerpc_compat_sys_##name, sys_ni_posix_timers);
+
+#endif /* CONFIG_COMPAT */
+
+#define __SYSCALL_DEFINEx(x, name, ...)						\
+	asmlinkage long __powerpc_sys##name(const struct pt_regs *regs);	\
+	ALLOW_ERROR_INJECTION(__powerpc_sys##name, ERRNO);			\
+	long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));				\
+	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
+	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
+	asmlinkage long __powerpc_sys##name(const struct pt_regs *regs)		\
+	{									\
+		return __se_sys##name(SC_POWERPC_REGS_TO_ARGS(x,__VA_ARGS__));	\
+	}									\
+	long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))				\
+	{									\
+		return __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));		\
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
+	long sys_##name(void);							\
+	asmlinkage long __powerpc_sys_##sname(const struct pt_regs *__unused);	\
+	ALLOW_ERROR_INJECTION(__powerpc_sys_##sname, ERRNO);			\
+	long sys_##sname(void)							\
+	{									\
+		return __powerpc_sys_##sname(NULL);				\
+	}									\
+	asmlinkage long __powerpc_sys_##sname(const struct pt_regs *__unused)
+
+#define COND_SYSCALL(name)							\
+	asmlinkage long __weak __powerpc_sys_##name(const struct pt_regs *regs)	\
+	{									\
+		return sys_ni_syscall();					\
+	}
+
+#define SYS_NI(name) SYSCALL_ALIAS(__powerpc_sys_##name, sys_ni_posix_timers);
+
+#endif /* __ASM_SYSCALL_WRAPPER_H */
diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index a2b13e55254f..75d8e1822caf 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -8,14 +8,47 @@
 #include <linux/types.h>
 #include <linux/compat.h>
 
+/*
+ * For PowerPC specific syscall implementations, wrapper takes exact name and
+ * return type for a given function.
+ */
+
+#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
+#define PPC_SYSCALL_DEFINE(x, type, name, ...)					\
+	asmlinkage type __powerpc_##name(const struct pt_regs *regs);		\
+	ALLOW_ERROR_INJECTION(__powerpc_##name, ERRNO);				\
+	type sys_##name(__MAP(x,__SC_DECL,__VA_ARGS__));			\
+	static type __se_##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
+	static inline type __do_##name(__MAP(x,__SC_DECL,__VA_ARGS__));		\
+	asmlinkage type __powerpc_##name(const struct pt_regs *regs)		\
+	{									\
+		return __se_##name(SC_POWERPC_REGS_TO_ARGS(x,__VA_ARGS__));	\
+	}									\
+	type sys_##name(__MAP(x,__SC_DECL,__VA_ARGS__))				\
+	{									\
+		return __do_##name(__MAP(x,__SC_CAST,__VA_ARGS__));		\
+	}									\
+	static type __se_##name(__MAP(x,__SC_LONG,__VA_ARGS__))			\
+	{									\
+		type ret = __do_##name(__MAP(x,__SC_CAST,__VA_ARGS__));		\
+		__MAP(x,__SC_TEST,__VA_ARGS__);					\
+		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));		\
+		return ret;							\
+	}									\
+	static inline type __do_##name(__MAP(x,__SC_DECL,__VA_ARGS__))
+#else
+#define PPC_SYSCALL_DEFINE(x, type, name, ...)					\
+	type name(__MAP(x,__SC_DECL,__VA_ARGS__))
+#endif
+
 struct rtas_args;
 
 asmlinkage long sys_mmap(unsigned long addr, size_t len,
-		unsigned long prot, unsigned long flags,
-		unsigned long fd, off_t offset);
+			 unsigned long prot, unsigned long flags,
+			 unsigned long fd, off_t offset);
 asmlinkage long sys_mmap2(unsigned long addr, size_t len,
-		unsigned long prot, unsigned long flags,
-		unsigned long fd, unsigned long pgoff);
+			  unsigned long prot, unsigned long flags,
+			  unsigned long fd, unsigned long pgoff);
 asmlinkage long ppc64_personality(unsigned long personality);
 asmlinkage long sys_rtas(struct rtas_args __user *uargs);
 int ppc_select(int n, fd_set __user *inp, fd_set __user *outp,
@@ -24,32 +57,38 @@ long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
 		      u32 len_high, u32 len_low);
 
 #ifdef CONFIG_COMPAT
-unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
-			       unsigned long prot, unsigned long flags,
-			       unsigned long fd, unsigned long pgoff);
+asmlinkage unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
+					  unsigned long prot, unsigned long flags,
+					  unsigned long fd, unsigned long pgoff);
 
-compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf, compat_size_t count,
-				  u32 reg6, u32 pos1, u32 pos2);
+asmlinkage compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf,
+					     compat_size_t count,
+					     u32 reg6, u32 pos1, u32 pos2);
 
-compat_ssize_t compat_sys_pwrite64(unsigned int fd, const char __user *ubuf, compat_size_t count,
-				   u32 reg6, u32 pos1, u32 pos2);
+asmlinkage compat_ssize_t compat_sys_pwrite64(unsigned int fd, const char __user *ubuf,
+					      compat_size_t count,
+					      u32 reg6, u32 pos1, u32 pos2);
 
-compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offset1, u32 offset2, u32 count);
+asmlinkage compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offset1,
+					       u32 offset2, u32 count);
 
-int compat_sys_truncate64(const char __user *path, u32 reg4,
-			  unsigned long len1, unsigned long len2);
+asmlinkage int compat_sys_truncate64(const char __user *path, u32 reg4,
+				     unsigned long len1, unsigned long len2);
 
-long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2, u32 len1, u32 len2);
+asmlinkage long compat_sys_fallocate(int fd, int mode, u32 offset1,
+				     u32 offset2, u32 len1, u32 len2);
 
-int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len1,
-			   unsigned long len2);
+asmlinkage int compat_sys_ftruncate64(unsigned int fd, u32 reg4,
+				      unsigned long len1, unsigned long len2);
 
-long ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
-		     size_t len, int advice);
+asmlinkage long ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2, 
+				size_t len, int advice);
 
-long compat_sys_sync_file_range2(int fd, unsigned int flags,
-				 unsigned int offset1, unsigned int offset2,
-				 unsigned int nbytes1, unsigned int nbytes2);
+asmlinkage long compat_sys_sync_file_range2(int fd, unsigned int flags,
+					    unsigned int offset1,
+					    unsigned int offset2,
+					    unsigned int nbytes1,
+					    unsigned int nbytes2);
 #endif
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 7748c278d13c..2343c577b971 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -121,9 +121,9 @@ transfer_to_syscall:
 	SAVE_NVGPRS(r1)
 	kuep_lock
 
-	/* Calling convention has r9 = orig r0, r10 = regs */
-	addi	r10,r1,STACK_FRAME_OVERHEAD
-	mr	r9,r0
+	/* Calling convention has r3 = orig r0, r4 = regs */
+	addi	r4,r1,STACK_FRAME_OVERHEAD
+	mr	r3,r0
 	bl	system_call_exception
 
 ret_from_syscall:
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 784ea3289c84..a38329ede1a1 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -24,7 +24,11 @@
 unsigned long global_dbcr0[NR_CPUS];
 #endif
 
+#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
+typedef long (*syscall_fn)(struct pt_regs *);
+#else
 typedef long (*syscall_fn)(long, long, long, long, long, long);
+#endif
 
 #ifdef CONFIG_PPC_BOOK3S_64
 DEFINE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
@@ -74,15 +78,13 @@ static notrace __always_inline bool prep_irq_for_enabled_exit(bool restartable)
 }
 
 /* Has to run notrace because it is entered not completely "reconciled" */
-notrace long system_call_exception(long r3, long r4, long r5,
-				   long r6, long r7, long r8,
-				   unsigned long r0, struct pt_regs *regs)
+notrace long system_call_exception(unsigned long r0, struct pt_regs *regs)
 {
 	syscall_fn f;
 
 	kuap_lock();
 
-	regs->orig_gpr3 = r3;
+	regs->orig_gpr3 = regs->gpr[3];
 
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
@@ -196,12 +198,6 @@ notrace long system_call_exception(long r3, long r4, long r5,
 		r0 = do_syscall_trace_enter(regs);
 		if (unlikely(r0 >= NR_syscalls))
 			return regs->gpr[3];
-		r3 = regs->gpr[3];
-		r4 = regs->gpr[4];
-		r5 = regs->gpr[5];
-		r6 = regs->gpr[6];
-		r7 = regs->gpr[7];
-		r8 = regs->gpr[8];
 
 	} else if (unlikely(r0 >= NR_syscalls)) {
 		if (unlikely(trap_is_unsupported_scv(regs))) {
@@ -218,18 +214,23 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	if (unlikely(is_compat_task())) {
 		f = (void *)compat_sys_call_table[r0];
 
-		r3 &= 0x00000000ffffffffULL;
-		r4 &= 0x00000000ffffffffULL;
-		r5 &= 0x00000000ffffffffULL;
-		r6 &= 0x00000000ffffffffULL;
-		r7 &= 0x00000000ffffffffULL;
-		r8 &= 0x00000000ffffffffULL;
+		regs->gpr[3] &= 0x00000000ffffffffULL;
+		regs->gpr[4] &= 0x00000000ffffffffULL;
+		regs->gpr[5] &= 0x00000000ffffffffULL;
+		regs->gpr[6] &= 0x00000000ffffffffULL;
+		regs->gpr[7] &= 0x00000000ffffffffULL;
+		regs->gpr[8] &= 0x00000000ffffffffULL;
 
 	} else {
 		f = (void *)sys_call_table[r0];
 	}
 
-	return f(r3, r4, r5, r6, r7, r8);
+	#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
+	return f(regs);
+	#else
+	return f(regs->gpr[3], regs->gpr[4], regs->gpr[5],
+		 regs->gpr[6], regs->gpr[7], regs->gpr[8]);
+	#endif
 }
 
 static notrace void booke_load_dbcr0(void)
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 7bab2d7de372..b11c2bd84827 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -91,9 +91,9 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
 	li	r11,\trapnr
 	std	r11,_TRAP(r1)
 	std	r12,_CCR(r1)
-	addi	r10,r1,STACK_FRAME_OVERHEAD
+	addi	r4,r1,STACK_FRAME_OVERHEAD
 	ld	r11,exception_marker@toc(r2)
-	std	r11,-16(r10)		/* "regshere" marker */
+	std	r11,-16(r4)		/* "regshere" marker */
 
 BEGIN_FTR_SECTION
 	HMT_MEDIUM
@@ -108,8 +108,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	 * but this is the best we can do.
 	 */
 
-	/* Calling convention has r9 = orig r0, r10 = regs */
-	mr	r9,r0
+	/* Calling convention has r3 = orig r0, r4 = regs */
+	mr	r3,r0
 	bl	system_call_exception
 
 .Lsyscall_vectored_\name\()_exit:
@@ -285,9 +285,9 @@ END_BTB_FLUSH_SECTION
 	std	r10,_LINK(r1)
 	std	r11,_TRAP(r1)
 	std	r12,_CCR(r1)
-	addi	r10,r1,STACK_FRAME_OVERHEAD
+	addi	r4,r1,STACK_FRAME_OVERHEAD
 	ld	r11,exception_marker@toc(r2)
-	std	r11,-16(r10)		/* "regshere" marker */
+	std	r11,-16(r4)		/* "regshere" marker */
 
 #ifdef CONFIG_PPC_BOOK3S
 	li	r11,1
@@ -308,8 +308,8 @@ END_BTB_FLUSH_SECTION
 	wrteei	1
 #endif
 
-	/* Calling convention has r9 = orig r0, r10 = regs */
-	mr	r9,r0
+	/* Calling convention has r3 = orig r0, r4 = regs */
+	mr	r3,r0
 	bl	system_call_exception
 
 .Lsyscall_exit:
@@ -353,16 +353,8 @@ END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	cmpdi	r3,0
 	bne	.Lsyscall_restore_regs
 	/* Zero volatile regs that may contain sensitive kernel data */
-	li	r0,0
-	li	r4,0
-	li	r5,0
-	li	r6,0
-	li	r7,0
-	li	r8,0
-	li	r9,0
-	li	r10,0
-	li	r11,0
-	li	r12,0
+	ZERO_GPR(0)
+	ZERO_GPRS(4, 12)
 	mtctr	r0
 	mtspr	SPRN_XER,r0
 .Lsyscall_restore_regs_cont:
@@ -388,7 +380,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	REST_NVGPRS(r1)
 	mtctr	r3
 	mtspr	SPRN_XER,r4
-	ld	r0,GPR0(r1)
+	REST_GPR(0, r1)
 	REST_GPRS(4, 12, r1)
 	b	.Lsyscall_restore_regs_cont
 .Lsyscall_rst_end:
diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc32.c
index 16ff0399a257..aa7869dbef36 100644
--- a/arch/powerpc/kernel/sys_ppc32.c
+++ b/arch/powerpc/kernel/sys_ppc32.c
@@ -48,9 +48,10 @@
 #include <asm/syscalls.h>
 #include <asm/switch_to.h>
 
-unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
-			  unsigned long prot, unsigned long flags,
-			  unsigned long fd, unsigned long pgoff)
+PPC_SYSCALL_DEFINE(6, unsigned long, compat_sys_mmap2,
+		   unsigned long, addr, size_t, len,
+		   unsigned long, prot, unsigned long, flags,
+		   unsigned long, fd, unsigned long, pgoff)
 {
 	/* This should remain 12 even if PAGE_SIZE changes */
 	return sys_mmap(addr, len, prot, flags, fd, pgoff << 12);
@@ -68,52 +69,63 @@ unsigned long compat_sys_mmap2(unsigned long addr, size_t len,
 #define merge_64(high, low) ((u64)high << 32) | low
 #endif
 
-compat_ssize_t compat_sys_pread64(unsigned int fd, char __user *ubuf, compat_size_t count,
-			     u32 reg6, u32 pos1, u32 pos2)
+PPC_SYSCALL_DEFINE(6, compat_ssize_t, compat_sys_pread64,
+		   unsigned int, fd,
+		   char __user *, ubuf, compat_size_t, count,
+		   u32, reg6, u32, pos1, u32, pos2)
 {
 	return ksys_pread64(fd, ubuf, count, merge_64(pos1, pos2));
 }
 
-compat_ssize_t compat_sys_pwrite64(unsigned int fd, const char __user *ubuf, compat_size_t count,
-			      u32 reg6, u32 pos1, u32 pos2)
+PPC_SYSCALL_DEFINE(6, compat_ssize_t, compat_sys_pwrite64,
+		   unsigned int, fd,
+		   const char __user *, ubuf, compat_size_t, count,
+		   u32, reg6, u32, pos1, u32, pos2)
 {
 	return ksys_pwrite64(fd, ubuf, count, merge_64(pos1, pos2));
 }
 
-compat_ssize_t compat_sys_readahead(int fd, u32 r4, u32 offset1, u32 offset2, u32 count)
+PPC_SYSCALL_DEFINE(5, compat_ssize_t, compat_sys_readahead,
+		   int, fd, u32, r4,
+		   u32, offset1, u32, offset2, u32, count)
 {
 	return ksys_readahead(fd, merge_64(offset1, offset2), count);
 }
 
-asmlinkage int compat_sys_truncate64(const char __user * path, u32 reg4,
-				unsigned long len1, unsigned long len2)
+PPC_SYSCALL_DEFINE(4, int, compat_sys_truncate64,
+		   const char __user *, path, u32, reg4,
+		   unsigned long, len1, unsigned long, len2)
 {
 	return ksys_truncate(path, merge_64(len1, len2));
 }
 
-asmlinkage long compat_sys_fallocate(int fd, int mode, u32 offset1, u32 offset2,
-				     u32 len1, u32 len2)
+PPC_SYSCALL_DEFINE(6, long, compat_sys_fallocate,
+		   int, fd, int, mode, u32, offset1, u32, offset2,
+		   u32, len1, u32, len2)
 {
 	return ksys_fallocate(fd, mode, ((loff_t)offset1 << 32) | offset2,
 			     merge_64(len1, len2));
 }
 
-asmlinkage int compat_sys_ftruncate64(unsigned int fd, u32 reg4, unsigned long len1,
-				 unsigned long len2)
+PPC_SYSCALL_DEFINE(4, int, compat_sys_ftruncate64,
+		   unsigned int, fd, u32, reg4, unsigned long, len1,
+		   unsigned long, len2)
 {
 	return ksys_ftruncate(fd, merge_64(len1, len2));
 }
 
-long ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
-		     size_t len, int advice)
+PPC_SYSCALL_DEFINE(6, long, ppc32_fadvise64,
+		   int, fd, u32, unused, u32, offset1, u32, offset2,
+		   size_t, len, int, advice)
 {
 	return ksys_fadvise64_64(fd, merge_64(offset1, offset2), len,
 				 advice);
 }
 
-asmlinkage long compat_sys_sync_file_range2(int fd, unsigned int flags,
-				   unsigned offset1, unsigned offset2,
-				   unsigned nbytes1, unsigned nbytes2)
+PPC_SYSCALL_DEFINE(6, long, compat_sys_sync_file_range2, int, fd,
+		   unsigned int, flags,
+		   unsigned int, offset1, unsigned int, offset2,
+		   unsigned int, nbytes1, unsigned int, nbytes2)
 {
 	loff_t offset = merge_64(offset1, offset2);
 	loff_t nbytes = merge_64(nbytes1, nbytes2);
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index c4f5b4ce926f..c64cdb5c4435 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -64,14 +64,20 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, size_t, len,
 }
 
 #ifdef CONFIG_PPC32
+asmlinkage long sys_old_select(struct sel_arg_struct __user *arg);
+asmlinkage long sys_select(int n, fd_set __user *inp, fd_set __user *outp,
+			   fd_set __user *exp,
+			   struct __kernel_old_timeval __user *tvp);
+
 /*
  * Due to some executables calling the wrong select we sometimes
  * get wrong args.  This determines how the args are being passed
  * (a single ptr to them all args passed) then calls
  * sys_select() with the appropriate args. -- Cort
  */
-int
-ppc_select(int n, fd_set __user *inp, fd_set __user *outp, fd_set __user *exp, struct __kernel_old_timeval __user *tvp)
+PPC_SYSCALL_DEFINE(5, long, ppc_select,
+		   int, n, fd_set __user *, inp, fd_set __user *, outp,
+		   fd_set __user *, exp, struct __kernel_old_timeval __user *, tvp)
 {
 	if ( (unsigned long)n >= 4096 )
 		return sys_old_select((void __user *)n);
@@ -81,7 +87,9 @@ ppc_select(int n, fd_set __user *inp, fd_set __user *outp, fd_set __user *exp, s
 #endif
 
 #ifdef CONFIG_PPC64
-long ppc64_personality(unsigned long personality)
+asmlinkage long sys_personality(unsigned int personality);
+
+PPC_SYSCALL_DEFINE(1, long, ppc64_personality, unsigned long, personality)
 {
 	long ret;
 
@@ -95,8 +103,9 @@ long ppc64_personality(unsigned long personality)
 }
 #endif
 
-long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
-		      u32 len_high, u32 len_low)
+PPC_SYSCALL_DEFINE(6, long, ppc_fadvise64_64,
+		   int, fd, int, advice, u32, offset_high, u32, offset_low,
+		   u32, len_high, u32, len_low)
 {
 	return ksys_fadvise64_64(fd, (u64)offset_high << 32 | offset_low,
 				 (u64)len_high << 32 | len_low, advice);
diff --git a/arch/powerpc/kernel/systbl.S b/arch/powerpc/kernel/systbl.S
index cb3358886203..70cc7120fce2 100644
--- a/arch/powerpc/kernel/systbl.S
+++ b/arch/powerpc/kernel/systbl.S
@@ -16,11 +16,32 @@
 
 #ifdef CONFIG_PPC64
 	.p2align	3
+#endif
+
+/* Where the syscall wrapper macro is used, handler functions expect parameters
+   to reside on the stack. We still emit symbols with register-mapped
+   parameters, which are distinguished by a prefix. */
+
+#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
+
+#define __powerpc_sys_ni_syscall sys_ni_syscall
+
+#ifdef CONFIG_PPC64
+#define __SYSCALL(nr, entry)	.8byte __powerpc_##entry
+#else
+#define __SYSCALL(nr, entry)	.long __powerpc_##entry
+#endif
+
+#else
+
+#ifdef CONFIG_PPC64
 #define __SYSCALL(nr, entry)	.8byte entry
 #else
 #define __SYSCALL(nr, entry)	.long entry
 #endif
 
+#endif /* CONFIG_ARCH_HAS_SYSCALL_WRAPPER */
+
 #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
 .globl sys_call_table
 sys_call_table:
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 717f2c9a7573..dcf57c07dbad 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -40,6 +40,8 @@
 extern char vdso32_start, vdso32_end;
 extern char vdso64_start, vdso64_end;
 
+asmlinkage long sys_ni_syscall(void);
+
 /*
  * The vdso data page (aka. systemcfg for old ppc64 fans) is here.
  * Once the early boot kernel code no longer needs to muck around
-- 
2.34.1

