Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B52F92F459A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 08:59:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG0Fx0v9pzDrTC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 18:59:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RLaYAu9J; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFzgV4YSJzDqwh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 18:32:54 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id v19so927461pgj.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 23:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0VAXDmtttqe2s3cvLxIoaipB7RBn94pfsMyZqO/rEvk=;
 b=RLaYAu9JmIu/JKz04bv8NdUswit4H15EPdZiQdCAhVhBg2wA2pET5sy3OLeEuBSRPv
 ViU7BWlX8xTuZ/dsjTIV/VyFKUXqr2+sueKYUGyM6ri2xAW4wFrJybE+5KZtoS+RVeK+
 2IdCdMBoxxpS9YI5EE2QFWLEqRl0EFfBhI97vjO2XKkC0fU0a8ECCEAO+oy9bHQ2rTDt
 ePgyQi0BceHWoA1Nr0SVnNDWoQceoZhR8Q8LN/GLwhvicckWMbcP6JyhtNrqwP2QT/b4
 xzYu3Y1ZliN3rd3QYc5WrJhnIi6E2OyqEap1/JximFUucKbYM9tn9SLTBb08vKZ06zQv
 4uoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0VAXDmtttqe2s3cvLxIoaipB7RBn94pfsMyZqO/rEvk=;
 b=RkCN54/uYLHA9GtV3ThpAUfu51vDD1k8iAqoRKCNvwLjYMSM8DYigiX/9zNzex3Zc5
 5cZzAS0soWF8JhjTxiwzCdpYYlvQwiufmXRW/Rf6DFXe4aZ3ycMe1jvc5ecjA/C4wI3/
 OAUmeRQiSxEkrUWIqpkXNtth77Px3xkBJ3Rokj06Qg+w77lFivuaCVTchCl3TvF19YAM
 4DBDgtndcHbcGoyQBvpIfAjbKieGbILybSH/Luf557W6enZkn5X9G9wsjy/0N5uKx/6C
 thuNFRyFHD8Sdqkf3t051982bYoYm1sXFl2SNmE9XR6mKeGhzg8lS47CC7NmrTlM6Z9M
 5FdA==
X-Gm-Message-State: AOAM533L77hlY9nBfO7OLIaz+kMUzVJsZb28b0iBFEg1StuF6uOvzrk4
 96w/iuZjzLar0ucLmQVa76MIwqRTM9E=
X-Google-Smtp-Source: ABdhPJzibo9I5dI6MD0xLHMH7Do1qmHg/IMwup/oqNp/LaAyElU9idM/qp2syVrWdE+QrO1vcQAXgA==
X-Received: by 2002:a63:e108:: with SMTP id z8mr875755pgh.363.1610523170611;
 Tue, 12 Jan 2021 23:32:50 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id m77sm1394264pfd.105.2021.01.12.23.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:32:50 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 11/21] powerpc/64: context tracking move to interrupt
 wrappers
Date: Wed, 13 Jan 2021 17:32:05 +1000
Message-Id: <20210113073215.516986-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210113073215.516986-1-npiggin@gmail.com>
References: <20210113073215.516986-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This moves exception_enter/exit calls to wrapper functions for
synchronous interrupts. More interrupt handlers are covered by
this than previously.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h  |  9 ++++
 arch/powerpc/kernel/traps.c           | 74 ++++++---------------------
 arch/powerpc/mm/book3s64/hash_utils.c |  3 --
 arch/powerpc/mm/fault.c               |  9 +---
 4 files changed, 27 insertions(+), 68 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index dfa846ebae43..7fab54a14152 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -7,10 +7,16 @@
 #include <asm/ftrace.h>
 
 struct interrupt_state {
+#ifdef CONFIG_PPC64
+	enum ctx_state ctx_state;
+#endif
 };
 
 static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
+#ifdef CONFIG_PPC64
+	state->ctx_state = exception_enter();
+#endif
 }
 
 /*
@@ -29,6 +35,9 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
  */
 static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
+#ifdef CONFIG_PPC64
+	exception_exit(state->ctx_state);
+#endif
 }
 
 static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 0b712c40272b..b2c53883580b 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1077,41 +1077,28 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(handle_hmi_exception)
 
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
@@ -1121,8 +1108,6 @@ DEFINE_INTERRUPT_HANDLER(RunModeException)
 
 DEFINE_INTERRUPT_HANDLER(single_step_exception)
 {
-	enum ctx_state prev_state = exception_enter();
-
 	clear_single_step(regs);
 	clear_br_trace(regs);
 
@@ -1131,14 +1116,11 @@ DEFINE_INTERRUPT_HANDLER(single_step_exception)
 
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
 
@@ -1466,7 +1448,6 @@ static inline int emulate_math(struct pt_regs *regs) { return -1; }
 
 DEFINE_INTERRUPT_HANDLER(program_check_exception)
 {
-	enum ctx_state prev_state = exception_enter();
 	unsigned int reason = get_reason(regs);
 
 	/* We can now get here via a FP Unavailable exception if the core
@@ -1475,22 +1456,22 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
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
@@ -1502,10 +1483,10 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
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
@@ -1526,7 +1507,7 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
 		 */
 		if (user_mode(regs)) {
 			_exception(SIGILL, regs, ILL_ILLOPN, regs->nip);
-			goto bail;
+			return;
 		} else {
 			printk(KERN_EMERG "Unexpected TM Bad Thing exception "
 			       "at %lx (msr 0x%lx) tm_scratch=%llx\n",
@@ -1557,7 +1538,7 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
 	 * pattern to occurrences etc. -dgibson 31/Mar/2003
 	 */
 	if (!emulate_math(regs))
-		goto bail;
+		return;
 
 	/* Try to emulate it if we should. */
 	if (reason & (REASON_ILLEGAL | REASON_PRIVILEGED)) {
@@ -1565,10 +1546,10 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
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
 
@@ -1577,9 +1558,6 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
 		_exception(SIGILL, regs, ILL_PRVOPC, regs->nip);
 	else
 		_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
-
-bail:
-	exception_exit(prev_state);
 }
 NOKPROBE_SYMBOL(program_check_exception);
 
@@ -1596,14 +1574,12 @@ NOKPROBE_SYMBOL(emulation_assist_interrupt);
 
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
@@ -1611,7 +1587,7 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
 	}
 
 	if (tm_abort_check(regs, TM_CAUSE_ALIGNMENT | TM_CAUSE_PERSISTENT))
-		goto bail;
+		return;
 
 	/* we don't implement logging of alignment exceptions */
 	if (!(current->thread.align_ctl & PR_UNALIGN_SIGBUS))
@@ -1621,7 +1597,7 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
 		/* skip over emulated instruction */
 		regs->nip += inst_length(reason);
 		emulate_single_step(regs);
-		goto bail;
+		return;
 	}
 
 	/* Operand address was bad */
@@ -1637,9 +1613,6 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
 		_exception(sig, regs, code, regs->dar);
 	else
 		bad_page_fault(regs, sig);
-
-bail:
-	exception_exit(prev_state);
 }
 
 DEFINE_INTERRUPT_HANDLER(StackOverflow)
@@ -1653,41 +1626,28 @@ DEFINE_INTERRUPT_HANDLER(StackOverflow)
 
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
index 801d5e94cd2b..662adafc92e0 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1513,7 +1513,6 @@ EXPORT_SYMBOL_GPL(hash_page);
 
 DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
 {
-	enum ctx_state prev_state = exception_enter();
 	unsigned long ea = regs->dar;
 	unsigned long dsisr = regs->dsisr;
 	unsigned long access = _PAGE_PRESENT | _PAGE_READ;
@@ -1565,8 +1564,6 @@ DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
 		err = hash__do_page_fault(regs);
 	}
 
-	exception_exit(prev_state);
-
 	return err;
 }
 
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 495edce9dc51..cc71c93cceaf 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -585,14 +585,7 @@ NOKPROBE_SYMBOL(__do_page_fault);
 
 DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
 {
-	enum ctx_state prev_state = exception_enter();
-	long err;
-
-	err = __do_page_fault(regs);
-
-	exception_exit(prev_state);
-
-	return err;
+	return __do_page_fault(regs);
 }
 NOKPROBE_SYMBOL(do_page_fault);
 
-- 
2.23.0

