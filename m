Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 008975F68B4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:00:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjtPl3tlyz3dqh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 01:00:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XWlbW0Fb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjtNm52GSz3c3Z
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 00:59:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XWlbW0Fb;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MjtNj4ymDz4x1V;
	Fri,  7 Oct 2022 00:59:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665064789;
	bh=NAfAFO8M+XwjF0DBnM043PgiJUmdYBoU9Hnv92Mrhys=;
	h=From:To:Cc:Subject:Date:From;
	b=XWlbW0Fbk0DrvcOmhNlqnAaTfdXhM/awBuRHrB/Yt2J8NMB7JU1ZgtaqfpZRmBIMw
	 06qtjNRK0VailYV4Oi6wdrNgwOBmYGXAoqv90UjU3OfoB86ttSfAbgaSSeFFMvZHFJ
	 vX2+yZ6hPRxxkWWBOFejwh0puEJKiaV6A9Yp8gVczn9eLew2ERqFJmoNHvSLcihepE
	 aVHuuXCMonakA5UCLmAsWHMuPREs6uDL1xQS0eRZjzN3t+ObLAAIaxpVbyRu7zg5dM
	 i8/b8W50QiEvwhBdVkwqc7TFsv06HxaXPiKXD7TbJI6WC/xpUKVuDxg1EY9xBAl71L
	 6+qIgF4cN8HOg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Don't add __powerpc_ prefix to syscall entry points
Date: Fri,  7 Oct 2022 00:59:40 +1100
Message-Id: <20221006135940.1223988-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: rmclure@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When using syscall wrappers the __SYSCALL_DEFINEx() and related macros
add a "__powerpc_" prefix to all syscall entry points.

So for example sys_mmap becomes __powerpc_sys_mmap.

This risks breaking workflows and tools that expect the old naming
scheme. At a minimum setting a breakpoint on eg. sys_mmap with gdb no
longer works.

There seems to be no compelling reason to add the "__powerpc_" prefix,
other than that it follows what some other arches do (x86, arm64, s390).

But unlike other arches powerpc doesn't always enable syscall wrappers,
so the syscall entry points can change name depending on CONFIG options.

For those reasons drop the "__powerpc_" prefix, reverting to the
existing naming.

Doing so reveals two prototypes in signal.h that have the incorrect type
when syscall wrappers are enabled. There are already prototypes for both
functions in syscalls.h, so drop the ones from signal.h.

Fixes: 7e92e01b7245 ("powerpc: Provide syscall wrapper")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/syscall_wrapper.h | 18 ++++++++----------
 arch/powerpc/include/asm/syscalls.h        |  2 +-
 arch/powerpc/kernel/signal.h               |  3 ---
 arch/powerpc/kernel/systbl.c               |  3 +--
 4 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/syscall_wrapper.h b/arch/powerpc/include/asm/syscall_wrapper.h
index 75b41b173f7a..67486c67e8a2 100644
--- a/arch/powerpc/include/asm/syscall_wrapper.h
+++ b/arch/powerpc/include/asm/syscall_wrapper.h
@@ -16,11 +16,11 @@ struct pt_regs;
 	      ,,regs->gpr[6],,regs->gpr[7],,regs->gpr[8])
 
 #define __SYSCALL_DEFINEx(x, name, ...)						\
-	long __powerpc_sys##name(const struct pt_regs *regs);			\
-	ALLOW_ERROR_INJECTION(__powerpc_sys##name, ERRNO);			\
+	long sys##name(const struct pt_regs *regs);			\
+	ALLOW_ERROR_INJECTION(sys##name, ERRNO);			\
 	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
 	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
-	long __powerpc_sys##name(const struct pt_regs *regs)			\
+	long sys##name(const struct pt_regs *regs)			\
 	{									\
 		return __se_sys##name(SC_POWERPC_REGS_TO_ARGS(x,__VA_ARGS__));	\
 	}									\
@@ -35,17 +35,15 @@ struct pt_regs;
 
 #define SYSCALL_DEFINE0(sname)							\
 	SYSCALL_METADATA(_##sname, 0);						\
-	long __powerpc_sys_##sname(const struct pt_regs *__unused);		\
-	ALLOW_ERROR_INJECTION(__powerpc_sys_##sname, ERRNO);			\
-	long __powerpc_sys_##sname(const struct pt_regs *__unused)
+	long sys_##sname(const struct pt_regs *__unused);		\
+	ALLOW_ERROR_INJECTION(sys_##sname, ERRNO);			\
+	long sys_##sname(const struct pt_regs *__unused)
 
 #define COND_SYSCALL(name)							\
-	long __powerpc_sys_##name(const struct pt_regs *regs);			\
-	long __weak __powerpc_sys_##name(const struct pt_regs *regs)		\
+	long sys_##name(const struct pt_regs *regs);			\
+	long __weak sys_##name(const struct pt_regs *regs)		\
 	{									\
 		return sys_ni_syscall();					\
 	}
 
-#define SYS_NI(name) SYSCALL_ALIAS(__powerpc_sys_##name, sys_ni_posix_timers);
-
 #endif // __ASM_POWERPC_SYSCALL_WRAPPER_H
diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index 49bbc3e0733d..9840d572da55 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -124,7 +124,7 @@ long sys_ppc_fadvise64_64(int fd, int advice,
 
 #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
 #define __SYSCALL(nr, entry) \
-	long __powerpc_##entry(const struct pt_regs *regs);
+	long entry(const struct pt_regs *regs);
 
 #ifdef CONFIG_PPC64
 #include <asm/syscall_table_64.h>
diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
index 618aeccdf691..a429c57ed433 100644
--- a/arch/powerpc/kernel/signal.h
+++ b/arch/powerpc/kernel/signal.h
@@ -196,9 +196,6 @@ extern int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 
 #else /* CONFIG_PPC64 */
 
-extern long sys_rt_sigreturn(void);
-extern long sys_sigreturn(void);
-
 static inline int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 				     struct task_struct *tsk)
 {
diff --git a/arch/powerpc/kernel/systbl.c b/arch/powerpc/kernel/systbl.c
index 9d7c5a596171..4305f2a2162f 100644
--- a/arch/powerpc/kernel/systbl.c
+++ b/arch/powerpc/kernel/systbl.c
@@ -20,8 +20,7 @@
 
 #undef __SYSCALL
 #ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
-#define __SYSCALL(nr, entry) [nr] = __powerpc_##entry,
-#define __powerpc_sys_ni_syscall	sys_ni_syscall
+#define __SYSCALL(nr, entry) [nr] = entry,
 #else
 /*
  * Coerce syscall handlers with arbitrary parameters to common type
-- 
2.37.3

