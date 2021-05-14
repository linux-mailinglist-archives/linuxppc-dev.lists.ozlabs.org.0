Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0BE380542
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 10:29:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhMBh35gnz3bsC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 18:29:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhMBK53D1z2yZF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 18:28:53 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FhMBB1gFdz9sbR;
 Fri, 14 May 2021 10:28:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqo0VNtJiH8k; Fri, 14 May 2021 10:28:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FhMBB0Pdhz9sbQ;
 Fri, 14 May 2021 10:28:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DCBC78B7F7;
 Fri, 14 May 2021 10:28:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0ExbbOvENrJc; Fri, 14 May 2021 10:28:49 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F5038B7F6;
 Fri, 14 May 2021 10:28:49 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3CCC764BE0; Fri, 14 May 2021 08:28:49 +0000 (UTC)
Message-Id: <cd0634769e5fea397411a0f833db52749852c6f8.1620980916.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/2] powerpc/interrupt: Refactor interrupt_exit_user_prepare()
 and syscall_exit_prepare()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Fri, 14 May 2021 08:28:49 +0000 (UTC)
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

Last part of interrupt_exit_user_prepare() and syscall_exit_prepare()
are identical.

Create a __interrupt_exit_user_prepare() function that is called by
both.

Note that it replaces a local_irq_save(flags) by local_irq_disable().
This is similar because the flags are never used. On ppc 8xx it is
more efficient because it doesn't require reading MSR.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
It requires the following commits that are in powerpc/fixes-test:
5d510ed78bcf powerpc/syscall: Calling kuap_save_and_lock() is wrong
a78339698ab1 powerpc/interrupts: Fix kuep_unlock() call

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/interrupt.c | 147 ++++++++++----------------------
 1 file changed, 44 insertions(+), 103 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index e0938ba298f2..d896fc6ed0be 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -231,56 +231,15 @@ static notrace void booke_load_dbcr0(void)
 #endif
 }
 
-/*
- * This should be called after a syscall returns, with r3 the return value
- * from the syscall. If this function returns non-zero, the system call
- * exit assembly should additionally load all GPR registers and CTR and XER
- * from the interrupt frame.
- *
- * The function graph tracer can not trace the return side of this function,
- * because RI=0 and soft mask state is "unreconciled", so it is marked notrace.
- */
-notrace unsigned long syscall_exit_prepare(unsigned long r3,
-					   struct pt_regs *regs,
-					   long scv)
+static notrace unsigned long __interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long ret,
+							   bool is_not_scv)
 {
 	unsigned long ti_flags;
-	unsigned long ret = 0;
-	bool is_not_scv = !IS_ENABLED(CONFIG_PPC_BOOK3S_64) || !scv;
 
 	CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 	kuap_assert_locked();
 
-	regs->result = r3;
-
-	/* Check whether the syscall is issued inside a restartable sequence */
-	rseq_syscall(regs);
-
-	ti_flags = current_thread_info()->flags;
-
-	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && is_not_scv) {
-		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
-			r3 = -r3;
-			regs->ccr |= 0x10000000; /* Set SO bit in CR */
-		}
-	}
-
-	if (unlikely(ti_flags & _TIF_PERSYSCALL_MASK)) {
-		if (ti_flags & _TIF_RESTOREALL)
-			ret = _TIF_RESTOREALL;
-		else
-			regs->gpr[3] = r3;
-		clear_bits(_TIF_PERSYSCALL_MASK, &current_thread_info()->flags);
-	} else {
-		regs->gpr[3] = r3;
-	}
-
-	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
-		do_syscall_trace_leave(regs);
-		ret |= _TIF_RESTOREALL;
-	}
-
 	local_irq_disable();
 
 again:
@@ -303,7 +262,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		ti_flags = READ_ONCE(current_thread_info()->flags);
 	}
 
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && IS_ENABLED(CONFIG_PPC_FPU)) {
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && IS_ENABLED(CONFIG_PPC_FPU)) {
 		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
 				unlikely((ti_flags & _TIF_RESTORE_TM))) {
 			restore_tm_state(regs);
@@ -352,81 +311,63 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	return ret;
 }
 
-notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr)
+/*
+ * This should be called after a syscall returns, with r3 the return value
+ * from the syscall. If this function returns non-zero, the system call
+ * exit assembly should additionally load all GPR registers and CTR and XER
+ * from the interrupt frame.
+ *
+ * The function graph tracer can not trace the return side of this function,
+ * because RI=0 and soft mask state is "unreconciled", so it is marked notrace.
+ */
+notrace unsigned long syscall_exit_prepare(unsigned long r3,
+					   struct pt_regs *regs,
+					   long scv)
 {
 	unsigned long ti_flags;
-	unsigned long flags;
 	unsigned long ret = 0;
+	bool is_not_scv = !IS_ENABLED(CONFIG_PPC_BOOK3S_64) || !scv;
 
-	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
-		BUG_ON(!(regs->msr & MSR_RI));
-	BUG_ON(!(regs->msr & MSR_PR));
-	BUG_ON(arch_irq_disabled_regs(regs));
-	CT_WARN_ON(ct_state() == CONTEXT_USER);
+	regs->result = r3;
 
-	/*
-	 * We don't need to restore AMR on the way back to userspace for KUAP.
-	 * AMR can only have been unlocked if we interrupted the kernel.
-	 */
-	kuap_assert_locked();
+	/* Check whether the syscall is issued inside a restartable sequence */
+	rseq_syscall(regs);
 
-	local_irq_save(flags);
+	ti_flags = current_thread_info()->flags;
 
-again:
-	ti_flags = READ_ONCE(current_thread_info()->flags);
-	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
-		local_irq_enable(); /* returning to user: may enable */
-		if (ti_flags & _TIF_NEED_RESCHED) {
-			schedule();
-		} else {
-			if (ti_flags & _TIF_SIGPENDING)
-				ret |= _TIF_RESTOREALL;
-			do_notify_resume(regs, ti_flags);
+	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO) && is_not_scv) {
+		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
+			r3 = -r3;
+			regs->ccr |= 0x10000000; /* Set SO bit in CR */
 		}
-		local_irq_disable();
-		ti_flags = READ_ONCE(current_thread_info()->flags);
 	}
 
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && IS_ENABLED(CONFIG_PPC_FPU)) {
-		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
-				unlikely((ti_flags & _TIF_RESTORE_TM))) {
-			restore_tm_state(regs);
-		} else {
-			unsigned long mathflags = MSR_FP;
-
-			if (cpu_has_feature(CPU_FTR_VSX))
-				mathflags |= MSR_VEC | MSR_VSX;
-			else if (cpu_has_feature(CPU_FTR_ALTIVEC))
-				mathflags |= MSR_VEC;
-
-			/* See above restore_math comment */
-			if ((regs->msr & mathflags) != mathflags)
-				restore_math(regs);
-		}
+	if (unlikely(ti_flags & _TIF_PERSYSCALL_MASK)) {
+		if (ti_flags & _TIF_RESTOREALL)
+			ret = _TIF_RESTOREALL;
+		else
+			regs->gpr[3] = r3;
+		clear_bits(_TIF_PERSYSCALL_MASK, &current_thread_info()->flags);
+	} else {
+		regs->gpr[3] = r3;
 	}
 
-	user_enter_irqoff();
-
-	if (unlikely(!__prep_irq_for_enabled_exit(true))) {
-		user_exit_irqoff();
-		local_irq_enable();
-		local_irq_disable();
-		goto again;
+	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
+		do_syscall_trace_leave(regs);
+		ret |= _TIF_RESTOREALL;
 	}
 
-	booke_load_dbcr0();
-
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	local_paca->tm_scratch = regs->msr;
-#endif
-
-	account_cpu_user_exit();
+	return __interrupt_exit_user_prepare(regs, ret, is_not_scv);
+}
 
-	/* Restore user access locks last */
-	kuap_user_restore(regs);
-	kuep_unlock();
+notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr)
+{
+	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
+		BUG_ON(!(regs->msr & MSR_RI));
+	BUG_ON(!(regs->msr & MSR_PR));
+	BUG_ON(arch_irq_disabled_regs(regs));
 
-	return ret;
+	return __interrupt_exit_user_prepare(regs, 0, true);
 }
 
 void preempt_schedule_irq(void);
-- 
2.25.0

