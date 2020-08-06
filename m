Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC71423D7FE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 10:28:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMhTd5LWrzDqBx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 18:28:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMhMV6GwCzDqDY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 18:23:14 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BMhML21kJz9v0TM;
 Thu,  6 Aug 2020 10:23:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id JAc1_NBpuyfq; Thu,  6 Aug 2020 10:23:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BMhML1CRlz9v0St;
 Thu,  6 Aug 2020 10:23:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E9FF8B7FF;
 Thu,  6 Aug 2020 10:23:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id MF6ErjQ8BmQa; Thu,  6 Aug 2020 10:23:11 +0200 (CEST)
Received: from po16052vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D28148B75E;
 Thu,  6 Aug 2020 10:23:10 +0200 (CEST)
Received: by po16052vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C7D0065BC9; Thu,  6 Aug 2020 08:23:10 +0000 (UTC)
Message-Id: <cf39cb8e42cffe323393b8cecdc59a7230298eab.1596702117.git.christophe.leroy@csgroup.eu>
In-Reply-To: <a6e62627d25fb7ae9b91d8bf553e707689e37498.1596702117.git.christophe.leroy@csgroup.eu>
References: <a6e62627d25fb7ae9b91d8bf553e707689e37498.1596702117.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 3/3] powerpc/uaccess: simplify the get_fs() set_fs() logic
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  6 Aug 2020 08:23:10 +0000 (UTC)
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
This exit work is heavy compared to normal syscall exit as it goes
through normal exception exit instead of the fast syscall exit.

Rename this TI_FSCHECK flag to TIF_UACCESS_KERNEL flag which tells
whether KERNEL_DS or USER_DS is set. Get mm_segment_t be redifined as
a bool struct that is either false (for USER_DS) or true (for
KERNEL_DS). When TIF_UACCESS_KERNEL is set, the limit is ~0UL.
Otherwise it is TASK_SIZE_USER (resp TASK_SIZE_USER64 on PPC64). When
KERNEL_DS is set, there is no range to check. Define TI_FSCHECK as an
alias to TIF_UACCESS_KERNEL.

On exit, involve exit work when the bit is set, i.e. when KERNEL_DS
is set. addr_limit_user_check() will clear the bit and kill the
user process.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: Rebased and taken into account removal of segment_eq() and comments from mpe
---
 arch/powerpc/include/asm/processor.h   |  5 +---
 arch/powerpc/include/asm/thread_info.h |  9 ++++---
 arch/powerpc/include/asm/uaccess.h     | 35 +++++++++++++-------------
 arch/powerpc/lib/sstep.c               |  2 +-
 4 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index ed0d633ab5aa..86a9c4395b99 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -84,7 +84,7 @@ void start_thread(struct pt_regs *regs, unsigned long fdptr, unsigned long sp);
 void release_thread(struct task_struct *);
 
 typedef struct {
-	unsigned long seg;
+	bool uaccess_kernel;
 } mm_segment_t;
 
 #define TS_FPR(i) fp_state.fpr[i][TS_FPROFFSET]
@@ -148,7 +148,6 @@ struct thread_struct {
 	unsigned long	ksp_vsid;
 #endif
 	struct pt_regs	*regs;		/* Pointer to saved register state */
-	mm_segment_t	addr_limit;	/* for get_fs() validation */
 #ifdef CONFIG_BOOKE
 	/* BookE base exception scratch space; align on cacheline */
 	unsigned long	normsave[8] ____cacheline_aligned;
@@ -295,7 +294,6 @@ struct thread_struct {
 #define INIT_THREAD { \
 	.ksp = INIT_SP, \
 	.ksp_limit = INIT_SP_LIMIT, \
-	.addr_limit = KERNEL_DS, \
 	.pgdir = swapper_pg_dir, \
 	.fpexc_mode = MSR_FE0 | MSR_FE1, \
 	SPEFSCR_INIT \
@@ -303,7 +301,6 @@ struct thread_struct {
 #else
 #define INIT_THREAD  { \
 	.ksp = INIT_SP, \
-	.addr_limit = KERNEL_DS, \
 	.fpexc_mode = 0, \
 }
 #endif
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index ca6c97025704..123232a63ee7 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -69,7 +69,7 @@ struct thread_info {
 #define INIT_THREAD_INFO(tsk)			\
 {						\
 	.preempt_count = INIT_PREEMPT_COUNT,	\
-	.flags =	0,			\
+	.flags =	_TIF_UACCESS_KERNEL,		\
 }
 
 #define THREAD_SIZE_ORDER	(THREAD_SHIFT - PAGE_SHIFT)
@@ -90,7 +90,8 @@ void arch_setup_new_exec(void);
 #define TIF_SYSCALL_TRACE	0	/* syscall trace active */
 #define TIF_SIGPENDING		1	/* signal pending */
 #define TIF_NEED_RESCHED	2	/* rescheduling necessary */
-#define TIF_FSCHECK		3	/* Check FS is USER_DS on return */
+#define TIF_UACCESS_KERNEL	3	/* KERNEL_DS is set */
+#define TIF_FSCHECK	TIF_UACCESS_KERNEL
 #define TIF_SYSCALL_EMU		4	/* syscall emulation active */
 #define TIF_RESTORE_TM		5	/* need to restore TM FP/VEC/VSX */
 #define TIF_PATCH_PENDING	6	/* pending live patching update */
@@ -130,7 +131,7 @@ void arch_setup_new_exec(void);
 #define _TIF_SYSCALL_TRACEPOINT	(1<<TIF_SYSCALL_TRACEPOINT)
 #define _TIF_EMULATE_STACK_STORE	(1<<TIF_EMULATE_STACK_STORE)
 #define _TIF_NOHZ		(1<<TIF_NOHZ)
-#define _TIF_FSCHECK		(1<<TIF_FSCHECK)
+#define _TIF_UACCESS_KERNEL	(1 << TIF_UACCESS_KERNEL)
 #define _TIF_SYSCALL_EMU	(1<<TIF_SYSCALL_EMU)
 #define _TIF_SYSCALL_DOTRACE	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
 				 _TIF_SECCOMP | _TIF_SYSCALL_TRACEPOINT | \
@@ -139,7 +140,7 @@ void arch_setup_new_exec(void);
 #define _TIF_USER_WORK_MASK	(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
 				 _TIF_NOTIFY_RESUME | _TIF_UPROBE | \
 				 _TIF_RESTORE_TM | _TIF_PATCH_PENDING | \
-				 _TIF_FSCHECK)
+				 _TIF_UACCESS_KERNEL)
 #define _TIF_PERSYSCALL_MASK	(_TIF_RESTOREALL|_TIF_NOERROR)
 
 /* Bits in local_flags */
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 00699903f1ef..8567bec6f939 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -15,48 +15,49 @@
  *
  * For historical reasons, these macros are grossly misnamed.
  *
- * The fs/ds values are now the highest legal address in the "segment".
+ * The fs/ds values are now a bool which tells the "segment" is user or kernel.
  * This simplifies the checking in the routines below.
  */
 
 #define MAKE_MM_SEG(s)  ((mm_segment_t) { (s) })
 
-#define KERNEL_DS	MAKE_MM_SEG(~0UL)
-#ifdef __powerpc64__
-/* We use TASK_SIZE_USER64 as TASK_SIZE is not constant */
-#define USER_DS		MAKE_MM_SEG(TASK_SIZE_USER64 - 1)
-#else
-#define USER_DS		MAKE_MM_SEG(TASK_SIZE - 1)
-#endif
+#define KERNEL_DS	MAKE_MM_SEG(true)
+#define USER_DS		MAKE_MM_SEG(false)
 
-#define get_fs()	(current->thread.addr_limit)
+#define get_fs()	(MAKE_MM_SEG(test_thread_flag(TIF_UACCESS_KERNEL)))
 
 static inline void set_fs(mm_segment_t fs)
 {
-	current->thread.addr_limit = fs;
-	/* On user-mode return check addr_limit (fs) is correct */
-	set_thread_flag(TIF_FSCHECK);
+	update_thread_flag(TIF_UACCESS_KERNEL, fs.uaccess_kernel);
 }
 
-#define uaccess_kernel() (get_fs().seg == KERNEL_DS.seg)
-#define user_addr_max()	(get_fs().seg)
+#define uaccess_kernel() (get_fs().uaccess_kernel)
+#define user_addr_max()	(get_fs().uaccess_kernel ? ~0UL : USER_ADDR_MAX - 1)
 
 #ifdef __powerpc64__
+
+#define USER_ADDR_MAX		TASK_SIZE_USER64
+
 /*
  * This check is sufficient because there is a large enough
  * gap between user addresses and the kernel addresses
  */
 #define __access_ok(addr, size, segment)	\
-	(((addr) <= (segment).seg) && ((size) <= (segment).seg))
+	segment.uaccess_kernel ?	\
+	1 : (addr) < USER_ADDR_MAX && ((size) < USER_ADDR_MAX)
 
 #else
 
+#define USER_ADDR_MAX		TASK_SIZE
+
 static inline int __access_ok(unsigned long addr, unsigned long size,
 			mm_segment_t seg)
 {
-	if (addr > seg.seg)
+	if (seg.uaccess_kernel)
+		return 1;
+	if (addr >= USER_ADDR_MAX)
 		return 0;
-	return (size == 0 || size - 1 <= seg.seg - addr);
+	return addr + size <= USER_ADDR_MAX;
 }
 
 #endif
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index caee8cc77e19..e10b642566ba 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -112,7 +112,7 @@ static nokprobe_inline long address_ok(struct pt_regs *regs,
 		return 1;
 	if (__access_ok(ea, 1, USER_DS))
 		/* Access overlaps the end of the user region */
-		regs->dar = USER_DS.seg;
+		regs->dar = USER_ADDR_MAX;
 	else
 		regs->dar = ea;
 	return 0;
-- 
2.25.0

