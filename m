Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AE914C93D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 12:04:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4870wm22kYzDqRC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 22:04:08 +1100 (AEDT)
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
 header.s=mail header.b=qs8ph2Ev; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4870rh2zvwzDqRt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 22:00:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4870rb1hntz9tyc4;
 Wed, 29 Jan 2020 12:00:31 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=qs8ph2Ev; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WuB_LY8e-sz0; Wed, 29 Jan 2020 12:00:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4870rb0dbnz9tybr;
 Wed, 29 Jan 2020 12:00:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580295631; bh=HAgPIk+COU0dO0xnoZooOq0+WHtVN4eKRebEIzfNAxo=;
 h=From:Subject:To:Cc:Date:From;
 b=qs8ph2EvfJksyrQzhO8X7u3NcEXFDFLXLgKPsVwevTJ4cTlGt5/LtPZ2kdaIeW5fe
 JZ54t0at7v5O6vChTqQMZKTJjxCdxSoWpywc6iZXdrV7t3dNQ1TIZ14YvHSHu2hiKD
 EKNFm2p+WK2BKUZtbw6pg3pcTZsL/dCkmbYNXDQ4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6A13F8B817;
 Wed, 29 Jan 2020 12:00:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oo0zgLSYoH1f; Wed, 29 Jan 2020 12:00:31 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EEE8C8B816;
 Wed, 29 Jan 2020 12:00:30 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 70649651D0; Wed, 29 Jan 2020 11:00:29 +0000 (UTC)
Message-Id: <dd2876b808ea38eb7b7f760ecd6ce06096c61fb5.1580295551.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2] powerpc/uaccess: simplify the get_fs() set_fs() logic
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 29 Jan 2020 11:00:29 +0000 (UTC)
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

Rename this TI_FSCHECK flag to TIF_KERNEL_DS flag which tells whether
KERNEL_DS or USER_DS is set. Get mm_segment_t be redifined as a bool
struct that is either false (for USER_DS) or true (for KERNEL_DS).
When TIF_KERNEL_DS is set, the limit is ~0UL. Otherwise it is
TASK_SIZE_USER (resp TASK_SIZE_USER64 on PPC64). When KERNEL_DS is
set, there is no range to check. Define TI_FSCHECK as an alias to
TIF_KERNEL_DS.

On exit, involve exit work when the bit is set, i.e. when KERNEL_DS
is set. addr_limit_user_check() will clear the bit and kill the
user process.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/processor.h   |  5 +---
 arch/powerpc/include/asm/thread_info.h |  9 ++++---
 arch/powerpc/include/asm/uaccess.h     | 35 +++++++++++++-------------
 arch/powerpc/lib/sstep.c               |  2 +-
 4 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 8387698bd5b6..e9e3c3b0f05e 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -84,7 +84,7 @@ void start_thread(struct pt_regs *regs, unsigned long fdptr, unsigned long sp);
 void release_thread(struct task_struct *);
 
 typedef struct {
-	unsigned long seg;
+	bool is_kernel_ds;
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
index a2270749b282..a681ce624ab7 100644
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
@@ -90,7 +90,8 @@ void arch_setup_new_exec(void);
 #define TIF_SYSCALL_TRACE	0	/* syscall trace active */
 #define TIF_SIGPENDING		1	/* signal pending */
 #define TIF_NEED_RESCHED	2	/* rescheduling necessary */
-#define TIF_FSCHECK		3	/* Check FS is USER_DS on return */
+#define TIF_KERNEL_DS		3	/* KERNEL_DS is set */
+#define TIF_FSCHECK	TIF_KERNEL_DS
 #define TIF_SYSCALL_EMU		4	/* syscall emulation active */
 #define TIF_RESTORE_TM		5	/* need to restore TM FP/VEC/VSX */
 #define TIF_PATCH_PENDING	6	/* pending live patching update */
@@ -130,7 +131,7 @@ void arch_setup_new_exec(void);
 #define _TIF_SYSCALL_TRACEPOINT	(1<<TIF_SYSCALL_TRACEPOINT)
 #define _TIF_EMULATE_STACK_STORE	(1<<TIF_EMULATE_STACK_STORE)
 #define _TIF_NOHZ		(1<<TIF_NOHZ)
-#define _TIF_FSCHECK		(1<<TIF_FSCHECK)
+#define _TIF_KERNEL_DS		(1 << TIF_KERNEL_DS)
 #define _TIF_SYSCALL_EMU	(1<<TIF_SYSCALL_EMU)
 #define _TIF_SYSCALL_DOTRACE	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
 				 _TIF_SECCOMP | _TIF_SYSCALL_TRACEPOINT | \
@@ -139,7 +140,7 @@ void arch_setup_new_exec(void);
 #define _TIF_USER_WORK_MASK	(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
 				 _TIF_NOTIFY_RESUME | _TIF_UPROBE | \
 				 _TIF_RESTORE_TM | _TIF_PATCH_PENDING | \
-				 _TIF_FSCHECK)
+				 _TIF_KERNEL_DS)
 #define _TIF_PERSYSCALL_MASK	(_TIF_RESTOREALL|_TIF_NOERROR)
 
 /* Bits in local_flags */
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index c92fe7fe9692..391c3a26f980 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -21,43 +21,44 @@
 
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
+
+#define get_fs()	(MAKE_MM_SEG(test_thread_flag(TIF_KERNEL_DS)))
 
-#define get_fs()	(current->thread.addr_limit)
+#define segment_eq(a, b)	((a).is_kernel_ds == (b).is_kernel_ds)
 
 static inline void set_fs(mm_segment_t fs)
 {
-	current->thread.addr_limit = fs;
-	/* On user-mode return check addr_limit (fs) is correct */
-	set_thread_flag(TIF_FSCHECK);
+	update_thread_flag(TIF_KERNEL_DS, segment_eq(fs, KERNEL_DS));
 }
 
-#define segment_eq(a, b)	((a).seg == (b).seg)
-
-#define user_addr_max()	(get_fs().seg)
+#define user_addr_max()	(segment_eq(get_fs(), KERNEL_DS) ? ~0UL : END_OF_USER_DS - 1)
 
 #ifdef __powerpc64__
+
+#define END_OF_USER_DS		TASK_SIZE_USER64
+
 /*
  * This check is sufficient because there is a large enough
  * gap between user addresses and the kernel addresses
  */
 #define __access_ok(addr, size, segment)	\
-	(((addr) <= (segment).seg) && ((size) <= (segment).seg))
+	segment_eq(segment, KERNEL_DS) ?	\
+	1 : (addr) < END_OF_USER_DS && ((size) < END_OF_USER_DS)
 
 #else
 
+#define END_OF_USER_DS		TASK_SIZE
+
 static inline int __access_ok(unsigned long addr, unsigned long size,
 			mm_segment_t seg)
 {
-	if (addr > seg.seg)
+	if (segment_eq(seg, KERNEL_DS))
+		return 1;
+	if (addr >= END_OF_USER_DS)
 		return 0;
-	return (size == 0 || size - 1 <= seg.seg - addr);
+	return addr + size <= END_OF_USER_DS;
 }
 
 #endif
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index c077acb983a1..bf005dd9407e 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -110,7 +110,7 @@ static nokprobe_inline long address_ok(struct pt_regs *regs,
 		return 1;
 	if (__access_ok(ea, 1, USER_DS))
 		/* Access overlaps the end of the user region */
-		regs->dar = USER_DS.seg;
+		regs->dar = END_OF_USER_DS;
 	else
 		regs->dar = ea;
 	return 0;
-- 
2.25.0

