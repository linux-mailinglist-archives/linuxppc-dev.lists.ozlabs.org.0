Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 216F719FD7B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 20:49:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48x01j2ltQzDqN0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 04:48:57 +1000 (AEST)
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
 header.s=mail header.b=Z0ZFZdi0; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wzJl2xRVzDqfD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 04:16:55 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48wzJh3PgRz9v0BQ;
 Mon,  6 Apr 2020 20:16:52 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Z0ZFZdi0; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DH1v5XkC13le; Mon,  6 Apr 2020 20:16:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48wzJh2N6Hz9v0BL;
 Mon,  6 Apr 2020 20:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586197012; bh=1AidArci8N5KuTg0CDLz4W+BdoHzlnqPCtXks34VgCU=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=Z0ZFZdi0MY/Mi37SDq1vJ8IQJCL9f6dSCDOWBUrHCp9/a268u3P1d92fD9lu9IeGo
 On7sbCHFYn/XPkmmOl76SRfFE5RImhpx8YSwi5NEe9NFiQxRIMmZcBPBxVLWlfsYHy
 AIcMhYJDUDSGWEcRUmKEfbZlHRP/DT6Zef8qbCUg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 40F658B784;
 Mon,  6 Apr 2020 20:16:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 02kfsZkVfoFr; Mon,  6 Apr 2020 20:16:52 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BB9348B775;
 Mon,  6 Apr 2020 20:16:51 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 90BC0656E9; Mon,  6 Apr 2020 18:16:51 +0000 (UTC)
Message-Id: <1299b6b50facf78458e7db265fb9936595ea009a.1586196948.git.christophe.leroy@c-s.fr>
In-Reply-To: <5aeaa33383e833f6eca30893fbd188b88e019eaa.1586196948.git.christophe.leroy@c-s.fr>
References: <5aeaa33383e833f6eca30893fbd188b88e019eaa.1586196948.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v3 15/15] powerpc/kernel: Do not inconditionally save non
 volatile registers on system call
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Mon,  6 Apr 2020 18:16:51 +0000 (UTC)
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

To allow that, syscall_exit_prepare() gets split in 3 parts.
On PPC32, the three parts are called from entry_32.S
On PPC64, we keep a syscall_exit_prepare() function which
concatenates the three parts.

One benefit is also that the likely part of
syscall_exit_prepare_begin() and the syscall_exit_prepare_end()
functions are frameless whereas there was no way to get the
likely part of syscall_exit_prepare() frameless.

Before : 347 cycles on null_syscall
After  : 307 cycles on null_syscall, ie better than before C porting.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/asm-prototypes.h | 11 +++
 arch/powerpc/kernel/entry_32.S            | 25 ++++++-
 arch/powerpc/kernel/head_32.h             |  3 +-
 arch/powerpc/kernel/syscall.c             | 83 +++++++++++++++--------
 4 files changed, 92 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 7d81e86a1e5d..eea5133733bb 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -98,6 +98,17 @@ unsigned long __init early_init(unsigned long dt_ptr);
 void __init machine_init(u64 dt_ptr);
 #endif
 long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs);
+#ifdef CONFIG_PPC64
+#define static64 static
+#else
+#define static64
+#endif
+static64 notrace unsigned long
+syscall_exit_prepare_begin(unsigned long r3, struct pt_regs *regs, unsigned long ti_flags);
+static64 notrace unsigned long
+syscall_exit_prepare_loop(unsigned long ret, struct pt_regs *regs, unsigned long ti_flags);
+static64 notrace unsigned long
+syscall_exit_prepare_end(unsigned long ret, struct pt_regs *regs, unsigned long ti_flags);
 notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs);
 notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr);
 notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr);
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 103f5158bc44..b9287fd0fcc6 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -315,14 +315,37 @@ stack_ovf:
 	RFI
 #endif
 
+save_nvgprs:
+	lwz	r11, _TRAP(r1)
+	andi.	r12, r11, 1
+	rlwinm	r11, r11, 0, ~1
+	beqlr
+	SAVE_NVGPRS(r1)
+	stw	r11, _TRAP(r1)
+	blr
+
 	.globl	transfer_to_syscall
 transfer_to_syscall:
+	lwz     r10, TI_FLAGS(r2)
 	mr	r9, r0
+	andi.   r10, r10, _TIF_SYSCALL_DOTRACE
 	addi	r10, r1, STACK_FRAME_OVERHEAD
+	bnel-	save_nvgprs
 	bl	system_call_exception
 ret_from_syscall:
+	lwz     r5, TI_FLAGS(r2)
 	addi    r4, r1, STACK_FRAME_OVERHEAD
-	bl	syscall_exit_prepare
+	andi.   r0, r5, _TIF_SYSCALL_DOTRACE | _TIF_SINGLESTEP | _TIF_USER_WORK_MASK
+	bnel-	save_nvgprs
+	bl	syscall_exit_prepare_begin
+1:	lwz	r5, TI_FLAGS(r2)
+	addi    r4, r1, STACK_FRAME_OVERHEAD
+	andi.	r0, r5, _TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM
+	beq+	1f
+	bl	save_nvgprs
+	bl	syscall_exit_prepare_loop
+	b	1b
+1:	bl	syscall_exit_prepare_end
 	lwz	r2, _CCR(r1)
 	lwz	r4, _NIP(r1)
 	lwz	r5, _MSR(r1)
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index c301d666a3e5..1cc9a67cb42c 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -174,13 +174,12 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	stw	r2,GPR2(r11)
 	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
 	stw	r9,_MSR(r11)
-	li	r2, \trapno
+	li	r2, \trapno + 1
 	stw	r10,8(r11)
 	stw	r2,_TRAP(r11)
 	SAVE_GPR(0, r11)
 	SAVE_4GPRS(3, r11)
 	SAVE_2GPRS(7, r11)
-	SAVE_NVGPRS(r11)
 	addi	r11,r1,STACK_FRAME_OVERHEAD
 	addi	r2,r12,-THREAD
 	stw	r11,PT_REGS(r12)
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index af449a4a8e8f..b15f19c00ccb 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -37,7 +37,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	if (!IS_ENABLED(CONFIG_PPC_BOOK3E))
 		BUG_ON(!(regs->msr & MSR_RI));
 	BUG_ON(IS_ENABLED(CONFIG_PPC64) && !(regs->msr & MSR_PR));
-	BUG_ON(!FULL_REGS(regs));
+	BUG_ON(IS_ENABLED(CONFIG_PPC64) && !FULL_REGS(regs));
 	BUG_ON(IS_ENABLED(CONFIG_PPC64) && get_softe(regs) != IRQS_ENABLED);
 
 	account_cpu_user_entry();
@@ -145,11 +145,9 @@ static notrace inline bool prep_irq_for_enabled_exit(void)
  * The function graph tracer can not trace the return side of this function,
  * because RI=0 and soft mask state is "unreconciled", so it is marked notrace.
  */
-notrace unsigned long syscall_exit_prepare(unsigned long r3,
-					   struct pt_regs *regs)
+static64 notrace unsigned long
+syscall_exit_prepare_begin(unsigned long r3, struct pt_regs *regs, unsigned long ti_flags)
 {
-	unsigned long *ti_flagsp = &current_thread_info()->flags;
-	unsigned long ti_flags;
 	unsigned long ret = 0;
 
 	regs->result = r3;
@@ -157,8 +155,6 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	/* Check whether the syscall is issued inside a restartable sequence */
 	rseq_syscall(regs);
 
-	ti_flags = *ti_flagsp;
-
 	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO)) {
 		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
 			r3 = -r3;
@@ -171,7 +167,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 			ret = _TIF_RESTOREALL;
 		else
 			regs->gpr[3] = r3;
-		clear_bits(_TIF_PERSYSCALL_MASK, ti_flagsp);
+		clear_bits(_TIF_PERSYSCALL_MASK, &current_thread_info()->flags);
 	} else {
 		regs->gpr[3] = r3;
 	}
@@ -181,27 +177,35 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		ret |= _TIF_RESTOREALL;
 	}
 
-again:
 	local_irq_disable();
-	ti_flags = READ_ONCE(*ti_flagsp);
-	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
-		local_irq_enable();
-		if (ti_flags & _TIF_NEED_RESCHED) {
-			schedule();
-		} else {
-			/*
-			 * SIGPENDING must restore signal handler function
-			 * argument GPRs, and some non-volatiles (e.g., r1).
-			 * Restore all for now. This could be made lighter.
-			 */
-			if (ti_flags & _TIF_SIGPENDING)
-				ret |= _TIF_RESTOREALL;
-			do_notify_resume(regs, ti_flags);
-		}
-		local_irq_disable();
-		ti_flags = READ_ONCE(*ti_flagsp);
+
+	return ret;
+}
+
+static64 notrace unsigned long
+syscall_exit_prepare_loop(unsigned long ret, struct pt_regs *regs, unsigned long ti_flags)
+{
+	local_irq_enable();
+	if (ti_flags & _TIF_NEED_RESCHED) {
+		schedule();
+	} else {
+		/*
+		 * SIGPENDING must restore signal handler function
+		 * argument GPRs, and some non-volatiles (e.g., r1).
+		 * Restore all for now. This could be made lighter.
+		 */
+		if (ti_flags & _TIF_SIGPENDING)
+			ret |= _TIF_RESTOREALL;
+		do_notify_resume(regs, ti_flags);
 	}
+	local_irq_disable();
+
+	return ret;
+}
 
+static64 notrace unsigned long
+syscall_exit_prepare_end(unsigned long ret, struct pt_regs *regs, unsigned long ti_flags)
+{
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && IS_ENABLED(CONFIG_PPC_FPU)) {
 		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
 				unlikely((ti_flags & _TIF_RESTORE_TM))) {
@@ -221,7 +225,8 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 
 	if (unlikely(!prep_irq_for_enabled_exit())) {
 		local_irq_enable();
-		goto again;
+		local_irq_disable();
+		return ret | 0x80000000;
 	}
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
@@ -235,6 +240,30 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	return ret;
 }
 
+#ifdef CONFIG_PPC64
+notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs)
+{
+	unsigned long ret;
+	unsigned long *ti_flagsp = &current_thread_info()->flags;
+	unsigned long ti_flags = *ti_flagsp;
+
+	ret = syscall_exit_prepare_begin(r3, regs, ti_flags);
+
+again:
+	ti_flags = READ_ONCE(*ti_flagsp);
+	if (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
+		ret = syscall_exit_prepare_loop(ret, regs, ti_flags);
+		goto again;
+	}
+	ret = syscall_exit_prepare_end(ret, regs, ti_flags);
+	if (unlikely(ret & 0x80000000)) {
+		ret &= ~0x80000000;
+		goto again;
+	}
+	return ret;
+}
+#endif
+
 #ifdef CONFIG_PPC_BOOK3S_64 /* BOOK3E not yet using this */
 notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr)
 {
-- 
2.25.0

