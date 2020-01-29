Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 370CA14C933
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 12:02:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4870th4blpzDqSH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 22:02:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=JuaK8XNV; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4870rC0QpfzDqNp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 22:00:08 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4870r21RY8z9v0tt;
 Wed, 29 Jan 2020 12:00:02 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=JuaK8XNV; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NIc-mSmKXBHz; Wed, 29 Jan 2020 12:00:02 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4870r209kSz9v0tX;
 Wed, 29 Jan 2020 12:00:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580295602; bh=eo1LGu13LHyYGJm/1vuF8zbjVCSBxAZNy/rzjY3K+pU=;
 h=From:Subject:To:Cc:Date:From;
 b=JuaK8XNV610vLh7hnDPhEPguWNAnu8mY3HauHODwpDoauLz+feOX0qhqZSPowIUiJ
 LZJaxvJJJhWVDg0DwI6mYLf6Ay/nLWL8BClxnCS85pLbf1/mmmpa2yg6lpQDNusKLR
 m4jIi+KBESZIFlq7RBvOWUXyH/QxZmGaytAzsYyo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9CF638B813;
 Wed, 29 Jan 2020 12:00:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yj8iD1CVuSA3; Wed, 29 Jan 2020 12:00:02 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0DEED8B809;
 Wed, 29 Jan 2020 12:00:01 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2524B651CF; Wed, 29 Jan 2020 11:00:01 +0000 (UTC)
Message-Id: <83c1270762342f0d3e2e0caaf4184f74a7c38ac9.1580295440.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1] powerpc/uaccess: simplify the get_fs() set_fs() logic
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 29 Jan 2020 11:00:01 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On powerpc, we only have USER_DS and KERNEL_DS

Today, this is managed as an 'unsigned long' data space limit
which is used to compare the passed address with, plus a bit
in the thread_info flags that is set whenever modifying the limit
to enable the verification in addr_limit_user_check()

The limit is either the last address of user space when USER_DS is
set, and the last address of address space when KERNEL_DS is set.
In both cases, the limit is a compiletime constant.

get_fs() returns the limit, which is part of thread_info struct
set_fs() updates the limit then set the TI_FSCHECK flag.
addr_limit_user_check() check the flag, and if it is set it checks
the limit is the user limit, then unsets the TI_FSCHECK flag.

In addition, when the flag is set the syscall exit work is involved.

Remove this TI_FSCHECK flag, and replace it by a TIF_KERNEL_DS flag
which tells whether KERNEL_DS or USER_DS is set. When TIF_KERNEL_DS
is set, the limit is ~0UL. Otherwise it is TASK_SIZE_USER (resp
TASK_SIZE_USER64 on PPC64). When KERNEL_DS is set, there is no range
to check.

On exit, involve exit work when the bit is set, i.e. when KERNEL_DS
is set. As TI_FSCHECK is not set anymore, test will be done everytime
exit work is run, but doing the check is now as costly as checking
whether the check is to be done.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
This version is first version. The intention was to not modify things
much, but the resulting assembly is bad, so lets take v2 instead.
---
 arch/powerpc/include/asm/processor.h   |  3 ---
 arch/powerpc/include/asm/thread_info.h |  8 ++++----
 arch/powerpc/include/asm/uaccess.h     | 10 ++++------
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 8387698bd5b6..0747f930a680 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -148,7 +148,6 @@ struct thread_struct {
 	unsigned long	ksp_vsid;
 #endif
 	struct pt_regs	*regs;		/* Pointer to saved register state */
-	mm_segment_t	addr_limit;	/* for get_fs() validation */
 #ifdef CONFIG_BOOKE
 	/* BookE base exception scratch space; align on cacheline */
 	unsigned long	normsave[8] ____cacheline_aligned;
@@ -289,7 +288,6 @@ struct thread_struct {
 #define INIT_THREAD { \
 	.ksp = INIT_SP, \
 	.ksp_limit = INIT_SP_LIMIT, \
-	.addr_limit = KERNEL_DS, \
 	.pgdir = swapper_pg_dir, \
 	.fpexc_mode = MSR_FE0 | MSR_FE1, \
 	SPEFSCR_INIT \
@@ -298,7 +296,6 @@ struct thread_struct {
 #define INIT_THREAD  { \
 	.ksp = INIT_SP, \
 	.regs = (struct pt_regs *)INIT_SP - 1, /* XXX bogus, I think */ \
-	.addr_limit = KERNEL_DS, \
 	.fpexc_mode = 0, \
 	.fscr = FSCR_TAR | FSCR_EBB \
 }
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index a2270749b282..8980bbddc4d6 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -69,7 +69,7 @@ struct thread_info {
 #define INIT_THREAD_INFO(tsk)			\
 {						\
 	.preempt_count = INIT_PREEMPT_COUNT,	\
-	.flags =	0,			\
+	.flags =	_TIF_KERNEL_DS,		\
 }
 
 #define THREAD_SIZE_ORDER	(THREAD_SHIFT - PAGE_SHIFT)
@@ -90,7 +90,7 @@ void arch_setup_new_exec(void);
 #define TIF_SYSCALL_TRACE	0	/* syscall trace active */
 #define TIF_SIGPENDING		1	/* signal pending */
 #define TIF_NEED_RESCHED	2	/* rescheduling necessary */
-#define TIF_FSCHECK		3	/* Check FS is USER_DS on return */
+#define TIF_KERNEL_DS		3	/* KERNEL_DS is set */
 #define TIF_SYSCALL_EMU		4	/* syscall emulation active */
 #define TIF_RESTORE_TM		5	/* need to restore TM FP/VEC/VSX */
 #define TIF_PATCH_PENDING	6	/* pending live patching update */
@@ -130,7 +130,7 @@ void arch_setup_new_exec(void);
 #define _TIF_SYSCALL_TRACEPOINT	(1<<TIF_SYSCALL_TRACEPOINT)
 #define _TIF_EMULATE_STACK_STORE	(1<<TIF_EMULATE_STACK_STORE)
 #define _TIF_NOHZ		(1<<TIF_NOHZ)
-#define _TIF_FSCHECK		(1<<TIF_FSCHECK)
+#define _TIF_KERNEL_DS		(1 << TIF_KERNEL_DS)
 #define _TIF_SYSCALL_EMU	(1<<TIF_SYSCALL_EMU)
 #define _TIF_SYSCALL_DOTRACE	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
 				 _TIF_SECCOMP | _TIF_SYSCALL_TRACEPOINT | \
@@ -139,7 +139,7 @@ void arch_setup_new_exec(void);
 #define _TIF_USER_WORK_MASK	(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
 				 _TIF_NOTIFY_RESUME | _TIF_UPROBE | \
 				 _TIF_RESTORE_TM | _TIF_PATCH_PENDING | \
-				 _TIF_FSCHECK)
+				 _TIF_KERNEL_DS)
 #define _TIF_PERSYSCALL_MASK	(_TIF_RESTOREALL|_TIF_NOERROR)
 
 /* Bits in local_flags */
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index c92fe7fe9692..17f87573c407 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -29,17 +29,15 @@
 #define USER_DS		MAKE_MM_SEG(TASK_SIZE - 1)
 #endif
 
-#define get_fs()	(current->thread.addr_limit)
+#define segment_eq(a, b)	((a).seg == (b).seg)
+
+#define get_fs()	(test_thread_flag(TIF_KERNEL_DS) ? KERNEL_DS : USER_DS)
 
 static inline void set_fs(mm_segment_t fs)
 {
-	current->thread.addr_limit = fs;
-	/* On user-mode return check addr_limit (fs) is correct */
-	set_thread_flag(TIF_FSCHECK);
+	update_thread_flag(TIF_KERNEL_DS, segment_eq(fs, KERNEL_DS));
 }
 
-#define segment_eq(a, b)	((a).seg == (b).seg)
-
 #define user_addr_max()	(get_fs().seg)
 
 #ifdef __powerpc64__
-- 
2.25.0

