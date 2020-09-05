Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FA025E99B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 20:00:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BkMll0YDkzDqg8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 04:00:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=K6N1sCOv; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BkMNc2vsmzDqk9
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Sep 2020 03:44:00 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id np15so6205506pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Sep 2020 10:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NC8ldo5hOvRK/MNcluFLcOgqfNk3vvV/gcf/ePyBKGU=;
 b=K6N1sCOvEji4GnbavBQfBNwCR90saYetO+Hh62/eE7s3WRBCxBLyElxulj1qxgjplh
 fZCOCrPGfxLEphKXANVvocThQ9oajb+nij+vuTKV080ZfnNEO3f2E+MUNc0o3Q4yQaVx
 ozsDEdmnZ0tGz+MElb+JKnEtbFENllsPAAqYhavbmu05xZ1wu6agzJzzFGNukkRHRW5h
 iW0k8hbFjse8E8NBplYh/o2KjStTRYNxB9ib4stjP6vIr5JUit00rI+aiGDvpuWX4Rog
 DhtHW0dcWhLUGCpNER9Y1KvvuarYBiGZwrbwSE1kuyyLdoSmw0OLdnuR37k0EkQDjl7v
 8nUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NC8ldo5hOvRK/MNcluFLcOgqfNk3vvV/gcf/ePyBKGU=;
 b=OpeYLpS6pnZUt+EWEsVnaLdoUj8mNQS15lFzLfGaeA1+2yn40pKAJjj3HrT1jXLSmV
 AGuNaCDLMY1LdyKgSdCna6Via2e7WVhZhMY3t4oRM7TmQsiNdMwGdt8+yoC8rom5c5Bp
 EjB7af3WzsPO/EAL/NOmnvuGT6ZSrAjinM7q0DpZmGFXEhxcvr4HVWBzZ/h6Uh+eIO1v
 Ryf+MDK4sX/y4ZbhyBv7Iq8XCevRVMrQcUgn4duKA1nNcyfjKPi5PFZYCak0WoZd59TP
 3KWkOJoKi3Mjn7R9r9vzlZzle0eKNKdJtfsgKy257nIj4gfIRzEyUusNOdR8NLNG2M/o
 efLw==
X-Gm-Message-State: AOAM530F0u05/qqYQ6S5LOZyGnVPj63DEow/bXtBnMD7SBtIH3R9L9RB
 boc7K/8UyoqELNLAmDz5cMjAxHsaxuU=
X-Google-Smtp-Source: ABdhPJwp8HxNrBSs/ij5HSKvo5LRgwiD1OxVLIo90+bkAiaCBNGzMY9iWT06KAHgu7HG6X6nlwVmXw==
X-Received: by 2002:a17:90a:aa89:: with SMTP id
 l9mr9886350pjq.226.1599327837856; 
 Sat, 05 Sep 2020 10:43:57 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id i1sm10405317pfk.21.2020.09.05.10.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 10:43:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [RFC PATCH 05/12] powerpc/64s: Do context tracking in interrupt entry
 wrapper
Date: Sun,  6 Sep 2020 03:43:28 +1000
Message-Id: <20200905174335.3161229-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200905174335.3161229-1-npiggin@gmail.com>
References: <20200905174335.3161229-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Context tracking is very broken currently. Add a helper function that is to
be called first thing by any normal interrupt handler function to track user
exits, and user entry is done by the interrupt exit prepare functions.

Context tracking is disabled on 64e for now, it must move to interrupt exit
in C before enabling it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                  |  2 +-
 arch/powerpc/include/asm/interrupt.h  | 23 +++++++++
 arch/powerpc/kernel/ptrace/ptrace.c   |  4 --
 arch/powerpc/kernel/signal.c          |  4 --
 arch/powerpc/kernel/syscall_64.c      | 14 +++++
 arch/powerpc/kernel/traps.c           | 74 ++++++---------------------
 arch/powerpc/mm/book3s64/hash_utils.c |  2 -
 arch/powerpc/mm/fault.c               |  3 --
 8 files changed, 55 insertions(+), 71 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1f48bbfb3ce9..3da7bbff46a9 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -189,7 +189,7 @@ config PPC
 	select HAVE_CBPF_JIT			if !PPC64
 	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
-	select HAVE_CONTEXT_TRACKING		if PPC64
+	select HAVE_CONTEXT_TRACKING		if PPC_BOOK3S_64
 	select HAVE_TIF_NOHZ			if PPC64
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DEBUG_STACKOVERFLOW
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 7231949fc1c8..98acfbb2df04 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -6,6 +6,23 @@
 #include <linux/hardirq.h>
 #include <asm/ftrace.h>
 
+#ifdef CONFIG_PPC_BOOK3S_64
+static inline void interrupt_enter_prepare(struct pt_regs *regs)
+{
+	if (user_mode(regs)) {
+		CT_WARN_ON(ct_state() == CONTEXT_KERNEL);
+		user_exit_irqoff();
+	} else {
+		CT_WARN_ON(ct_state() == CONTEXT_USER);
+	}
+}
+
+#else /* CONFIG_PPC_BOOK3S_64 */
+static inline void interrupt_enter_prepare(struct pt_regs *regs)
+{
+}
+#endif /* CONFIG_PPC_BOOK3S_64 */
+
 /**
  * DECLARE_INTERRUPT_HANDLER_RAW - Declare raw interrupt handler function
  * @func:	Function name of the entry point
@@ -60,6 +77,8 @@ static __always_inline void ___##func(struct pt_regs *regs);		\
 									\
 __visible noinstr void func(struct pt_regs *regs)			\
 {									\
+	interrupt_enter_prepare(regs);					\
+									\
 	___##func (regs);						\
 }									\
 									\
@@ -90,6 +109,8 @@ __visible noinstr long func(struct pt_regs *regs)			\
 {									\
 	long ret;							\
 									\
+	interrupt_enter_prepare(regs);					\
+									\
 	ret = ___##func (regs);						\
 									\
 	return ret;							\
@@ -118,6 +139,8 @@ static __always_inline void ___##func(struct pt_regs *regs);		\
 									\
 __visible noinstr void func(struct pt_regs *regs)			\
 {									\
+	interrupt_enter_prepare(regs);					\
+									\
 	___##func (regs);						\
 }									\
 									\
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index f6e51be47c6e..8970400e521c 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -290,8 +290,6 @@ long do_syscall_trace_enter(struct pt_regs *regs)
 {
 	u32 flags;
 
-	user_exit();
-
 	flags = READ_ONCE(current_thread_info()->flags) &
 		(_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE);
 
@@ -368,8 +366,6 @@ void do_syscall_trace_leave(struct pt_regs *regs)
 	step = test_thread_flag(TIF_SINGLESTEP);
 	if (step || test_thread_flag(TIF_SYSCALL_TRACE))
 		tracehook_report_syscall_exit(regs, step);
-
-	user_enter();
 }
 
 void __init pt_regs_check(void);
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index d15a98c758b8..f5f347fa3c31 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -310,8 +310,6 @@ static void do_signal(struct task_struct *tsk)
 
 void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags)
 {
-	user_exit();
-
 	/* Check valid addr_limit, TIF check is done there */
 	addr_limit_user_check();
 
@@ -331,8 +329,6 @@ void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags)
 		tracehook_notify_resume(regs);
 		rseq_handle_notify_resume(NULL, regs);
 	}
-
-	user_enter();
 }
 
 unsigned long get_tm_stackpointer(struct task_struct *tsk)
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 8e50818aa50b..58eec1c7fdb8 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -1,9 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
+#include <linux/context_tracking.h>
 #include <linux/err.h>
 #include <asm/asm-prototypes.h>
 #include <asm/book3s/64/kup-radix.h>
 #include <asm/cputime.h>
+#include <asm/interrupt.h>
 #include <asm/hw_irq.h>
 #include <asm/kprobes.h>
 #include <asm/paca.h>
@@ -27,6 +29,9 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
 
+	CT_WARN_ON(ct_state() == CONTEXT_KERNEL);
+	user_exit_irqoff();
+
 	trace_hardirqs_off(); /* finish reconciling */
 
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S))
@@ -157,6 +162,8 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	unsigned long ti_flags;
 	unsigned long ret = 0;
 
+	CT_WARN_ON(ct_state() == CONTEXT_USER);
+
 	kuap_check_amr();
 
 	regs->result = r3;
@@ -233,8 +240,11 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		}
 	}
 
+	user_enter_irqoff();
+
 	/* scv need not set RI=0 because SRRs are not used */
 	if (unlikely(!prep_irq_for_enabled_exit(!scv))) {
+		user_exit_irqoff();
 		local_irq_enable();
 		goto again;
 	}
@@ -264,6 +274,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	BUG_ON(!(regs->msr & MSR_PR));
 	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(regs->softe != IRQS_ENABLED);
+	CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 	/*
 	 * We don't need to restore AMR on the way back to userspace for KUAP.
@@ -306,7 +317,9 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 		}
 	}
 
+	user_enter_irqoff();
 	if (unlikely(!prep_irq_for_enabled_exit(true))) {
+		user_exit_irqoff();
 		local_irq_enable();
 		local_irq_disable();
 		goto again;
@@ -347,6 +360,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 		unrecoverable_exception(regs);
 	BUG_ON(regs->msr & MSR_PR);
 	BUG_ON(!FULL_REGS(regs));
+	CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 	amr = kuap_get_and_check_amr();
 
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index a850647b7062..3784578db630 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1112,41 +1112,28 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(handle_hmi_exception)
 
 DEFINE_INTERRUPT_HANDLER(unknown_exception)
 {
-	enum ctx_state prev_state = exception_enter();
-
 	printk("Bad trap at PC: %lx, SR: %lx, vector=%lx\n",
 	       regs->nip, regs->msr, regs->trap);
 
 	_exception(SIGTRAP, regs, TRAP_UNK, 0);
-
-	exception_exit(prev_state);
 }
 
 DEFINE_INTERRUPT_HANDLER_ASYNC(unknown_async_exception)
 {
-	enum ctx_state prev_state = exception_enter();
-
 	printk("Bad trap at PC: %lx, SR: %lx, vector=%lx\n",
 	       regs->nip, regs->msr, regs->trap);
 
 	_exception(SIGTRAP, regs, TRAP_UNK, 0);
-
-	exception_exit(prev_state);
 }
 
 DEFINE_INTERRUPT_HANDLER(instruction_breakpoint_exception)
 {
-	enum ctx_state prev_state = exception_enter();
-
 	if (notify_die(DIE_IABR_MATCH, "iabr_match", regs, 5,
 					5, SIGTRAP) == NOTIFY_STOP)
-		goto bail;
+		return;
 	if (debugger_iabr_match(regs))
-		goto bail;
+		return;
 	_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
-
-bail:
-	exception_exit(prev_state);
 }
 
 DEFINE_INTERRUPT_HANDLER(RunModeException)
@@ -1156,8 +1143,6 @@ DEFINE_INTERRUPT_HANDLER(RunModeException)
 
 DEFINE_INTERRUPT_HANDLER(single_step_exception)
 {
-	enum ctx_state prev_state = exception_enter();
-
 	clear_single_step(regs);
 	clear_br_trace(regs);
 
@@ -1166,14 +1151,11 @@ DEFINE_INTERRUPT_HANDLER(single_step_exception)
 
 	if (notify_die(DIE_SSTEP, "single_step", regs, 5,
 					5, SIGTRAP) == NOTIFY_STOP)
-		goto bail;
+		return;
 	if (debugger_sstep(regs))
-		goto bail;
+		return;
 
 	_exception(SIGTRAP, regs, TRAP_TRACE, regs->nip);
-
-bail:
-	exception_exit(prev_state);
 }
 NOKPROBE_SYMBOL(single_step_exception);
 
@@ -1499,7 +1481,6 @@ static inline int emulate_math(struct pt_regs *regs) { return -1; }
 
 DEFINE_INTERRUPT_HANDLER(program_check_exception)
 {
-	enum ctx_state prev_state = exception_enter();
 	unsigned int reason = get_reason(regs);
 
 	/* We can now get here via a FP Unavailable exception if the core
@@ -1508,22 +1489,22 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
 	if (reason & REASON_FP) {
 		/* IEEE FP exception */
 		parse_fpe(regs);
-		goto bail;
+		return;
 	}
 	if (reason & REASON_TRAP) {
 		unsigned long bugaddr;
 		/* Debugger is first in line to stop recursive faults in
 		 * rcu_lock, notify_die, or atomic_notifier_call_chain */
 		if (debugger_bpt(regs))
-			goto bail;
+			return;
 
 		if (kprobe_handler(regs))
-			goto bail;
+			return;
 
 		/* trap exception */
 		if (notify_die(DIE_BPT, "breakpoint", regs, 5, 5, SIGTRAP)
 				== NOTIFY_STOP)
-			goto bail;
+			return;
 
 		bugaddr = regs->nip;
 		/*
@@ -1535,10 +1516,10 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
 		if (!(regs->msr & MSR_PR) &&  /* not user-mode */
 		    report_bug(bugaddr, regs) == BUG_TRAP_TYPE_WARN) {
 			regs->nip += 4;
-			goto bail;
+			return;
 		}
 		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
-		goto bail;
+		return;
 	}
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (reason & REASON_TM) {
@@ -1559,7 +1540,7 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
 		 */
 		if (user_mode(regs)) {
 			_exception(SIGILL, regs, ILL_ILLOPN, regs->nip);
-			goto bail;
+			return;
 		} else {
 			printk(KERN_EMERG "Unexpected TM Bad Thing exception "
 			       "at %lx (msr 0x%lx) tm_scratch=%llx\n",
@@ -1590,7 +1571,7 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
 	 * pattern to occurrences etc. -dgibson 31/Mar/2003
 	 */
 	if (!emulate_math(regs))
-		goto bail;
+		return;
 
 	/* Try to emulate it if we should. */
 	if (reason & (REASON_ILLEGAL | REASON_PRIVILEGED)) {
@@ -1598,10 +1579,10 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
 		case 0:
 			regs->nip += 4;
 			emulate_single_step(regs);
-			goto bail;
+			return;
 		case -EFAULT:
 			_exception(SIGSEGV, regs, SEGV_MAPERR, regs->nip);
-			goto bail;
+			return;
 		}
 	}
 
@@ -1610,9 +1591,6 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
 		_exception(SIGILL, regs, ILL_PRVOPC, regs->nip);
 	else
 		_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
-
-bail:
-	exception_exit(prev_state);
 }
 NOKPROBE_SYMBOL(program_check_exception);
 
@@ -1629,14 +1607,12 @@ NOKPROBE_SYMBOL(emulation_assist_interrupt);
 
 DEFINE_INTERRUPT_HANDLER(alignment_exception)
 {
-	enum ctx_state prev_state = exception_enter();
 	int sig, code, fixed = 0;
 	unsigned long  reason;
 
 	interrupt_cond_local_irq_enable(regs);
 
 	reason = get_reason(regs);
-
 	if (reason & REASON_BOUNDARY) {
 		sig = SIGBUS;
 		code = BUS_ADRALN;
@@ -1644,7 +1620,7 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
 	}
 
 	if (tm_abort_check(regs, TM_CAUSE_ALIGNMENT | TM_CAUSE_PERSISTENT))
-		goto bail;
+		return;
 
 	/* we don't implement logging of alignment exceptions */
 	if (!(current->thread.align_ctl & PR_UNALIGN_SIGBUS))
@@ -1654,7 +1630,7 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
 		/* skip over emulated instruction */
 		regs->nip += inst_length(reason);
 		emulate_single_step(regs);
-		goto bail;
+		return;
 	}
 
 	/* Operand address was bad */
@@ -1670,9 +1646,6 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
 		_exception(sig, regs, code, regs->dar);
 	else
 		bad_page_fault(regs, regs->dar, sig);
-
-bail:
-	exception_exit(prev_state);
 }
 
 DEFINE_INTERRUPT_HANDLER(StackOverflow)
@@ -1686,41 +1659,28 @@ DEFINE_INTERRUPT_HANDLER(StackOverflow)
 
 DEFINE_INTERRUPT_HANDLER(stack_overflow_exception)
 {
-	enum ctx_state prev_state = exception_enter();
-
 	die("Kernel stack overflow", regs, SIGSEGV);
-
-	exception_exit(prev_state);
 }
 
 DEFINE_INTERRUPT_HANDLER(kernel_fp_unavailable_exception)
 {
-	enum ctx_state prev_state = exception_enter();
-
 	printk(KERN_EMERG "Unrecoverable FP Unavailable Exception "
 			  "%lx at %lx\n", regs->trap, regs->nip);
 	die("Unrecoverable FP Unavailable Exception", regs, SIGABRT);
-
-	exception_exit(prev_state);
 }
 
 DEFINE_INTERRUPT_HANDLER(altivec_unavailable_exception)
 {
-	enum ctx_state prev_state = exception_enter();
-
 	if (user_mode(regs)) {
 		/* A user program has executed an altivec instruction,
 		   but this kernel doesn't support altivec. */
 		_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
-		goto bail;
+		return;
 	}
 
 	printk(KERN_EMERG "Unrecoverable VMX/Altivec Unavailable Exception "
 			"%lx at %lx\n", regs->trap, regs->nip);
 	die("Unrecoverable VMX/Altivec Unavailable Exception", regs, SIGABRT);
-
-bail:
-	exception_exit(prev_state);
 }
 
 DEFINE_INTERRUPT_HANDLER(vsx_unavailable_exception)
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 360748a8042c..4abdf29a6c8d 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1279,7 +1279,6 @@ int hash_page_mm(struct mm_struct *mm, unsigned long ea,
 		 unsigned long flags)
 {
 	bool is_thp;
-	enum ctx_state prev_state = exception_enter();
 	pgd_t *pgdir;
 	unsigned long vsid;
 	pte_t *ptep;
@@ -1479,7 +1478,6 @@ int hash_page_mm(struct mm_struct *mm, unsigned long ea,
 	DBG_LOW(" -> rc=%d\n", rc);
 
 bail:
-	exception_exit(prev_state);
 	return rc;
 }
 EXPORT_SYMBOL_GPL(hash_page_mm);
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index fd8e28944293..655d00765627 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -548,7 +548,6 @@ NOKPROBE_SYMBOL(__do_page_fault);
 
 DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
 {
-	enum ctx_state prev_state = exception_enter();
 	unsigned long address = regs->dar;
 	unsigned long error_code = regs->dsisr;
 	long err;
@@ -571,8 +570,6 @@ DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
 	}
 #endif
 
-	exception_exit(prev_state);
-
 	return err;
 }
 NOKPROBE_SYMBOL(do_page_fault);
-- 
2.23.0

