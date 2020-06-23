Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5C0204CF6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 10:50:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rg3F1rWbzDqSc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 18:50:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=vPeVfjCa; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rfp34smYzDqR0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 18:39:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
 Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To;
 bh=SSLKZeyu7fBZlHBU8ut/dbZ96ZAF1b478rz6z9cNiBc=; b=vPeVfjCa+fBUGHn48EXdn76zPa
 u2qXqDL2reZ9W0WiXgZUpVCs3dIDUb+drJatr7GAC0FH0AlmQ3nFI9IguUTz98+J+XKygzHiPran9
 CM+6cbGkJz625jKx0dhxhYPllJCz08SBsmnN8kAhRwQb9cOJGV+7a797Q02hPkz15AsPXKLIawfqw
 WCDRKbetulQtd0EqlMWxZs1LadQbnPpyBdWd7JBjrgXTYPdMg7Chv2nrHHLoZ9jmQFO42RhpkAyMm
 n4xZdJ/9GyH2QEV3sLKnNVd35ubZdfo5y5sm9UyIOut7ByYUX2BiQNktXF+i4Cd8vqb7RJQLs+gOi
 8ELAPAmw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jneS5-0000g5-Av; Tue, 23 Jun 2020 08:38:45 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0F21F30477A;
 Tue, 23 Jun 2020 10:38:40 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id E05C7237095F9; Tue, 23 Jun 2020 10:38:39 +0200 (CEST)
Message-ID: <20200623083721.216740948@infradead.org>
User-Agent: quilt/0.66
Date: Tue, 23 Jun 2020 10:36:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org,
 will@kernel.org,
 tglx@linutronix.de
Subject: [PATCH v4 2/8] x86/entry: Fix NMI vs IRQ state tracking
References: <20200623083645.277342609@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-s390@vger.kernel.org, peterz@infradead.org, bigeasy@linutronix.de,
 x86@kernel.org, heiko.carstens@de.ibm.com, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, linux@armlinux.org.uk, a.darwish@linutronix.de,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While the nmi_enter() users did
trace_hardirqs_{off_prepare,on_finish}() there was no matching
lockdep_hardirqs_*() calls to complete the picture.

Introduce idtentry_{enter,exit}_nmi() to enable proper IRQ state
tracking across the NMIs.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/entry/common.c         |   42 ++++++++++++++++++++++++++++++++++++----
 arch/x86/include/asm/idtentry.h |    3 ++
 arch/x86/kernel/nmi.c           |    9 +++-----
 arch/x86/kernel/traps.c         |   17 +++++-----------
 include/linux/hardirq.h         |   28 ++++++++++++++++++--------
 5 files changed, 70 insertions(+), 29 deletions(-)

--- a/arch/x86/entry/common.c
+++ b/arch/x86/entry/common.c
@@ -550,7 +550,7 @@ SYSCALL_DEFINE0(ni_syscall)
  * The return value must be fed into the rcu_exit argument of
  * idtentry_exit_cond_rcu().
  */
-bool noinstr idtentry_enter_cond_rcu(struct pt_regs *regs)
+noinstr bool idtentry_enter_cond_rcu(struct pt_regs *regs)
 {
 	if (user_mode(regs)) {
 		enter_from_user_mode();
@@ -640,7 +640,7 @@ static void idtentry_exit_cond_resched(s
  * Counterpart to idtentry_enter_cond_rcu(). The return value of the entry
  * function must be fed into the @rcu_exit argument.
  */
-void noinstr idtentry_exit_cond_rcu(struct pt_regs *regs, bool rcu_exit)
+noinstr void idtentry_exit_cond_rcu(struct pt_regs *regs, bool rcu_exit)
 {
 	lockdep_assert_irqs_disabled();
 
@@ -684,7 +684,7 @@ void noinstr idtentry_exit_cond_rcu(stru
  * Invokes enter_from_user_mode() to establish the proper context for
  * NOHZ_FULL. Otherwise scheduling on exit would not be possible.
  */
-void noinstr idtentry_enter_user(struct pt_regs *regs)
+noinstr void idtentry_enter_user(struct pt_regs *regs)
 {
 	enter_from_user_mode();
 }
@@ -701,13 +701,47 @@ void noinstr idtentry_enter_user(struct
  *
  * Counterpart to idtentry_enter_user().
  */
-void noinstr idtentry_exit_user(struct pt_regs *regs)
+noinstr void idtentry_exit_user(struct pt_regs *regs)
 {
 	lockdep_assert_irqs_disabled();
 
 	prepare_exit_to_usermode(regs);
 }
 
+noinstr bool idtentry_enter_nmi(struct pt_regs *regs)
+{
+	bool irq_state = lockdep_hardirqs_enabled(current);
+
+	__nmi_enter();
+	lockdep_hardirqs_off(CALLER_ADDR0);
+	lockdep_hardirq_enter();
+	rcu_nmi_enter();
+
+	instrumentation_begin();
+	trace_hardirqs_off_finish();
+	ftrace_nmi_enter();
+	instrumentation_end();
+
+	return irq_state;
+}
+
+noinstr void idtentry_exit_nmi(struct pt_regs *regs, bool restore)
+{
+	instrumentation_begin();
+	ftrace_nmi_exit();
+	if (restore) {
+		trace_hardirqs_on_prepare();
+		lockdep_hardirqs_on_prepare(CALLER_ADDR0);
+	}
+	instrumentation_end();
+
+	rcu_nmi_exit();
+	lockdep_hardirq_exit();
+	if (restore)
+		lockdep_hardirqs_on(CALLER_ADDR0);
+	__nmi_exit();
+}
+
 #ifdef CONFIG_XEN_PV
 #ifndef CONFIG_PREEMPTION
 /*
--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -16,6 +16,9 @@ void idtentry_exit_user(struct pt_regs *
 bool idtentry_enter_cond_rcu(struct pt_regs *regs);
 void idtentry_exit_cond_rcu(struct pt_regs *regs, bool rcu_exit);
 
+bool idtentry_enter_nmi(struct pt_regs *regs);
+void idtentry_exit_nmi(struct pt_regs *regs, bool irq_state);
+
 /**
  * DECLARE_IDTENTRY - Declare functions for simple IDT entry points
  *		      No error code pushed by hardware
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -330,7 +330,6 @@ static noinstr void default_do_nmi(struc
 	__this_cpu_write(last_nmi_rip, regs->ip);
 
 	instrumentation_begin();
-	trace_hardirqs_off_finish();
 
 	handled = nmi_handle(NMI_LOCAL, regs);
 	__this_cpu_add(nmi_stats.normal, handled);
@@ -417,8 +416,6 @@ static noinstr void default_do_nmi(struc
 		unknown_nmi_error(reason, regs);
 
 out:
-	if (regs->flags & X86_EFLAGS_IF)
-		trace_hardirqs_on_prepare();
 	instrumentation_end();
 }
 
@@ -478,6 +475,8 @@ static DEFINE_PER_CPU(unsigned long, nmi
 
 DEFINE_IDTENTRY_RAW(exc_nmi)
 {
+	bool irq_state;
+
 	if (IS_ENABLED(CONFIG_SMP) && arch_cpu_is_offline(smp_processor_id()))
 		return;
 
@@ -491,14 +490,14 @@ DEFINE_IDTENTRY_RAW(exc_nmi)
 
 	this_cpu_write(nmi_dr7, local_db_save());
 
-	nmi_enter();
+	irq_state = idtentry_enter_nmi(regs);
 
 	inc_irq_stat(__nmi_count);
 
 	if (!ignore_nmis)
 		default_do_nmi(regs);
 
-	nmi_exit();
+	idtentry_exit_nmi(regs, irq_state);
 
 	local_db_restore(this_cpu_read(nmi_dr7));
 
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -403,7 +403,7 @@ DEFINE_IDTENTRY_DF(exc_double_fault)
 	}
 #endif
 
-	nmi_enter();
+	idtentry_enter_nmi(regs);
 	instrumentation_begin();
 	notify_die(DIE_TRAP, str, regs, error_code, X86_TRAP_DF, SIGSEGV);
 
@@ -649,15 +649,12 @@ DEFINE_IDTENTRY_RAW(exc_int3)
 		instrumentation_end();
 		idtentry_exit_user(regs);
 	} else {
-		nmi_enter();
+		bool irq_state = idtentry_enter_nmi(regs);
 		instrumentation_begin();
-		trace_hardirqs_off_finish();
 		if (!do_int3(regs))
 			die("int3", regs, 0);
-		if (regs->flags & X86_EFLAGS_IF)
-			trace_hardirqs_on_prepare();
 		instrumentation_end();
-		nmi_exit();
+		idtentry_exit_nmi(regs, irq_state);
 	}
 }
 
@@ -865,9 +862,8 @@ static void handle_debug(struct pt_regs
 static __always_inline void exc_debug_kernel(struct pt_regs *regs,
 					     unsigned long dr6)
 {
-	nmi_enter();
+	bool irq_state = idtentry_enter_nmi(regs);
 	instrumentation_begin();
-	trace_hardirqs_off_finish();
 
 	/*
 	 * Catch SYSENTER with TF set and clear DR_STEP. If this hit a
@@ -878,10 +874,8 @@ static __always_inline void exc_debug_ke
 
 	handle_debug(regs, dr6, false);
 
-	if (regs->flags & X86_EFLAGS_IF)
-		trace_hardirqs_on_prepare();
 	instrumentation_end();
-	nmi_exit();
+	idtentry_exit_nmi(regs, irq_state);
 }
 
 static __always_inline void exc_debug_user(struct pt_regs *regs,
@@ -891,6 +885,7 @@ static __always_inline void exc_debug_us
 	instrumentation_begin();
 
 	handle_debug(regs, dr6, true);
+
 	instrumentation_end();
 	idtentry_exit_user(regs);
 }
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -111,32 +111,42 @@ extern void rcu_nmi_exit(void);
 /*
  * nmi_enter() can nest up to 15 times; see NMI_BITS.
  */
-#define nmi_enter()						\
+#define __nmi_enter()						\
 	do {							\
+		lockdep_off();					\
 		arch_nmi_enter();				\
 		printk_nmi_enter();				\
-		lockdep_off();					\
 		BUG_ON(in_nmi() == NMI_MASK);			\
 		__preempt_count_add(NMI_OFFSET + HARDIRQ_OFFSET);	\
-		rcu_nmi_enter();				\
+	} while (0)
+
+#define nmi_enter()						\
+	do {							\
+		__nmi_enter();					\
 		lockdep_hardirq_enter();			\
+		rcu_nmi_enter();				\
 		instrumentation_begin();			\
 		ftrace_nmi_enter();				\
 		instrumentation_end();				\
 	} while (0)
 
+#define __nmi_exit()						\
+	do {							\
+		BUG_ON(!in_nmi());				\
+		__preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET);	\
+		printk_nmi_exit();				\
+		arch_nmi_exit();				\
+		lockdep_on();					\
+	} while (0)
+
 #define nmi_exit()						\
 	do {							\
 		instrumentation_begin();			\
 		ftrace_nmi_exit();				\
 		instrumentation_end();				\
-		lockdep_hardirq_exit();				\
 		rcu_nmi_exit();					\
-		BUG_ON(!in_nmi());				\
-		__preempt_count_sub(NMI_OFFSET + HARDIRQ_OFFSET);	\
-		lockdep_on();					\
-		printk_nmi_exit();				\
-		arch_nmi_exit();				\
+		lockdep_hardirq_exit();				\
+		__nmi_exit();					\
 	} while (0)
 
 #endif /* LINUX_HARDIRQ_H */


