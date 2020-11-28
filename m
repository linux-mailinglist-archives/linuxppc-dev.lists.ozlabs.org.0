Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F2C2C6FB5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 15:58:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjvlJ08JGzDrHt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 01:58:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HKRMjBr6; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjvMY4QdBzDsP0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 01:41:45 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id s21so6950259pfu.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 06:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oBNoe6wJJfg8iXXkzlcN36tMDXFywk3NQBWUtEDQoHY=;
 b=HKRMjBr6CfeAwyigD2EKf5gIxCeg7qLqYwoOIN8xUKyaxnvsI5VFLBLXT+OD8kwgic
 elicVuhEi8pjJLDv1y55b3OVliWX55XeznKj6WIjjA+8LJNv4ves4Kpv1aXIQDhonsP3
 OKVE49vbt1KdABGQ4LWFYAECrzL+IuIf3Juu9LtlDN/N3gHnsNZBcrZGnm619hQPTr0U
 hko1+xqAs+Uvf1F8w5PPl3qqx43LHx62dCLwtUA2GdQEidZzOkTqYmiZEEp56ygGHkID
 RLBUj5nUpw+D3VH9IYLXfh18HreogGi8VmuOzvqV2OY1AgP/lRS5GqP4fbRgtdtzseao
 cGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oBNoe6wJJfg8iXXkzlcN36tMDXFywk3NQBWUtEDQoHY=;
 b=WP5Iq8a2Wfy6xiewagHcxXj+isKFBuPOZj9v1vrmzOhiscgT9pXHY25agg4vWr/d3M
 cdJUatJDj2qOzzUH8FPNVVNpHK5t0RET46Wn0VSlBT00OVsf58LzaLrp/USQQZhZneG9
 sSXTb73id4y2m2TVgWRI4PeRbnPfCXOMERV7/DFANAygAum9I0kDQmiGk6S/NmoHX5WU
 P8OEDRRJ/O+7AdiudG1PHxAk40QiQdWHVy7VOZO0ng5+qsWhDFnAq3/YdHE1L2b9DLDe
 6cuCD4H6pSZpp8XQEJ5Ygp7Yg2mQ80Ce9l6iaNn0sfgb2gKF9Pqf4dufo0OTebfbYL2m
 1eug==
X-Gm-Message-State: AOAM531rVPcSdNJcXBp6OvvMiCgBkTw1stpqnfZLQ4s+c5jwPG4yljhP
 J9iFkQuT40+Q/KDzOL17bJf7/tlw2Yk=
X-Google-Smtp-Source: ABdhPJwv3sQxxSANMG5IKeHhlp0a8TlHgMkcdUdy+ODo7/DLchUUD0l4lfRg1W9NZeaOZ3dIHbe7Og==
X-Received: by 2002:a17:90a:bd0c:: with SMTP id
 y12mr11775248pjr.154.1606574502269; 
 Sat, 28 Nov 2020 06:41:42 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-103-132.tpgi.com.au.
 [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id y201sm10750764pfb.2.2020.11.28.06.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 06:41:41 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 09/19] powerpc/64: context tracking move to interrupt
 wrappers
Date: Sun, 29 Nov 2020 00:41:04 +1000
Message-Id: <20201128144114.944000-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128144114.944000-1-npiggin@gmail.com>
References: <20201128144114.944000-1-npiggin@gmail.com>
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
 arch/powerpc/mm/book3s64/hash_utils.c |  2 -
 arch/powerpc/mm/fault.c               |  3 --
 4 files changed, 26 insertions(+), 62 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 2ab0675c27aa..e2410f54c6e9 100644
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
index 8a6cb2838ce6..f40b45086b93 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1108,41 +1108,28 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(handle_hmi_exception)
 
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
@@ -1152,8 +1139,6 @@ DEFINE_INTERRUPT_HANDLER(RunModeException)
 
 DEFINE_INTERRUPT_HANDLER(single_step_exception)
 {
-	enum ctx_state prev_state = exception_enter();
-
 	clear_single_step(regs);
 	clear_br_trace(regs);
 
@@ -1162,14 +1147,11 @@ DEFINE_INTERRUPT_HANDLER(single_step_exception)
 
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
 
@@ -1495,7 +1477,6 @@ static inline int emulate_math(struct pt_regs *regs) { return -1; }
 
 DEFINE_INTERRUPT_HANDLER(program_check_exception)
 {
-	enum ctx_state prev_state = exception_enter();
 	unsigned int reason = get_reason(regs);
 
 	/* We can now get here via a FP Unavailable exception if the core
@@ -1504,22 +1485,22 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
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
@@ -1531,10 +1512,10 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
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
@@ -1555,7 +1536,7 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
 		 */
 		if (user_mode(regs)) {
 			_exception(SIGILL, regs, ILL_ILLOPN, regs->nip);
-			goto bail;
+			return;
 		} else {
 			printk(KERN_EMERG "Unexpected TM Bad Thing exception "
 			       "at %lx (msr 0x%lx) tm_scratch=%llx\n",
@@ -1586,7 +1567,7 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
 	 * pattern to occurrences etc. -dgibson 31/Mar/2003
 	 */
 	if (!emulate_math(regs))
-		goto bail;
+		return;
 
 	/* Try to emulate it if we should. */
 	if (reason & (REASON_ILLEGAL | REASON_PRIVILEGED)) {
@@ -1594,10 +1575,10 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
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
 
@@ -1606,9 +1587,6 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
 		_exception(SIGILL, regs, ILL_PRVOPC, regs->nip);
 	else
 		_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
-
-bail:
-	exception_exit(prev_state);
 }
 NOKPROBE_SYMBOL(program_check_exception);
 
@@ -1625,14 +1603,12 @@ NOKPROBE_SYMBOL(emulation_assist_interrupt);
 
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
@@ -1640,7 +1616,7 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
 	}
 
 	if (tm_abort_check(regs, TM_CAUSE_ALIGNMENT | TM_CAUSE_PERSISTENT))
-		goto bail;
+		return;
 
 	/* we don't implement logging of alignment exceptions */
 	if (!(current->thread.align_ctl & PR_UNALIGN_SIGBUS))
@@ -1650,7 +1626,7 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
 		/* skip over emulated instruction */
 		regs->nip += inst_length(reason);
 		emulate_single_step(regs);
-		goto bail;
+		return;
 	}
 
 	/* Operand address was bad */
@@ -1666,9 +1642,6 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
 		_exception(sig, regs, code, regs->dar);
 	else
 		bad_page_fault(regs, sig);
-
-bail:
-	exception_exit(prev_state);
 }
 
 DEFINE_INTERRUPT_HANDLER(StackOverflow)
@@ -1682,41 +1655,28 @@ DEFINE_INTERRUPT_HANDLER(StackOverflow)
 
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
index a48c484b9e9b..39dcfaf7ba36 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1289,7 +1289,6 @@ int hash_page_mm(struct mm_struct *mm, unsigned long ea,
 		 unsigned long flags)
 {
 	bool is_thp;
-	enum ctx_state prev_state = exception_enter();
 	pgd_t *pgdir;
 	unsigned long vsid;
 	pte_t *ptep;
@@ -1489,7 +1488,6 @@ int hash_page_mm(struct mm_struct *mm, unsigned long ea,
 	DBG_LOW(" -> rc=%d\n", rc);
 
 bail:
-	exception_exit(prev_state);
 	return rc;
 }
 EXPORT_SYMBOL_GPL(hash_page_mm);
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 4896f44c8374..2778fe0a41d5 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -550,7 +550,6 @@ NOKPROBE_SYMBOL(__do_page_fault);
 
 DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
 {
-	enum ctx_state prev_state = exception_enter();
 	unsigned long address = regs->dar;
 	unsigned long error_code = regs->dsisr;
 	long err;
@@ -573,8 +572,6 @@ DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
 	}
 #endif
 
-	exception_exit(prev_state);
-
 	return err;
 }
 NOKPROBE_SYMBOL(do_page_fault);
-- 
2.23.0

