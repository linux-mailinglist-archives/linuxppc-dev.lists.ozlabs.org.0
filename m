Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8513095E5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:29:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSc5w0K5WzDsWK
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:29:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dr24IL4i; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZMT1589zDrRv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:10:45 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id md11so7231838pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IxMRT8eyq4r4K7XAnfcYAYp9F8f6mdC2q2uNq2HKoZw=;
 b=dr24IL4i8W8ei/jiGoksa4+P5O89k8Ak9OSkD9e4TXBTEJ+Z0uteecxLpOhzgwBj4G
 IofOT5HKyrRm3H2a6x9u6ajA0pAnRLBzITaOpQXoHcWq7sl0NfL2TldS/PRlKuf9Tu/N
 XwMb7NSK0opJl30gGuLo7t2LxTq8hTEMO77M4z6rZ45z4QV3JOVy+E+atrmDncadKGer
 g3D2WU9uSicaok9kYzR2/cLdLTsgzpyIcx6/7lprqAzHxHBKRWQ4Gzr4lj3tWbci11P3
 g5J7Pdal3t4HBkW8KfH8hrQbPdZoIweBOf14/N6XWtOmGndihY0mXAQ2bRq6JU2czHob
 Jn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IxMRT8eyq4r4K7XAnfcYAYp9F8f6mdC2q2uNq2HKoZw=;
 b=RMRpl1THMvu92YYfWmPdhj6NNoeOKYdnu0wwJS7ZNW5Uigufrl60UmSE9vCDPgo2F+
 bNBYcmt7VhjjT4l0O/c8eCbcnUDDY+is+9elbnznxCok4VQ35rDLIcspYks/cOqUkkW3
 rQssm9tFZl7/OQz6XYkl1hc7V1Tyii7+HgnstSmnTCsdpHdagbKYkaRWPOUgCiC38D4T
 6/n6ofCz2l1JyM9bDTKwMhHVfcrIt2dT3+eAivhWg2DseSqkoRaEB77Hm3xG9KutNzXr
 ViWbFcgLCGjWVsZO5LLKd4nsJtE2zc7bmO8fEd6ByQ3m0kdUD/s354+zTFcF+XlZZC7/
 Jrsg==
X-Gm-Message-State: AOAM530awx/LWGIrQGv3DPEMbHGcq4xp0/0MFHHBNv4VQsNgP2ZPK+Cc
 MEahQZZgQ41m8GHrZ2DP0uKzZOuiJRY=
X-Google-Smtp-Source: ABdhPJwndOTgJIy+9k8tcpO8BotuKopnnrbOMJmAiOsOlhamXn1pexG7umYDtGYJ1z/Idi7yuiHT8g==
X-Received: by 2002:a17:90a:2f88:: with SMTP id
 t8mr8696931pjd.144.1612012241283; 
 Sat, 30 Jan 2021 05:10:41 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:10:40 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 30/42] powerpc/64: context tracking remove _TIF_NOHZ
Date: Sat, 30 Jan 2021 23:08:40 +1000
Message-Id: <20210130130852.2952424-31-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add context tracking to the system call handler explicitly, and remove
_TIF_NOHZ.

This improves system call performance when nohz_full is enabled. On a
POWER9, gettid scv system call cost on a nohz_full CPU improves from
1129 cycles to 1004 cycles and on a housekeeping CPU from 550 cycles
to 430 cycles.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                   |  1 -
 arch/powerpc/include/asm/thread_info.h |  4 +-
 arch/powerpc/kernel/ptrace/ptrace.c    |  4 --
 arch/powerpc/kernel/signal.c           |  4 --
 arch/powerpc/kernel/syscall_64.c       | 72 ++++++++++++++++----------
 5 files changed, 47 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 107bb4319e0e..28d5a1b1510f 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -196,7 +196,6 @@ config PPC
 	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
 	select HAVE_CONTEXT_TRACKING		if PPC64
-	select HAVE_TIF_NOHZ			if PPC64
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_DYNAMIC_FTRACE
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index 3d8a47af7a25..386d576673a1 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -94,7 +94,6 @@ void arch_setup_new_exec(void);
 #define TIF_PATCH_PENDING	6	/* pending live patching update */
 #define TIF_SYSCALL_AUDIT	7	/* syscall auditing active */
 #define TIF_SINGLESTEP		8	/* singlestepping active */
-#define TIF_NOHZ		9	/* in adaptive nohz mode */
 #define TIF_SECCOMP		10	/* secure computing */
 #define TIF_RESTOREALL		11	/* Restore all regs (implies NOERROR) */
 #define TIF_NOERROR		12	/* Force successful syscall return */
@@ -128,11 +127,10 @@ void arch_setup_new_exec(void);
 #define _TIF_UPROBE		(1<<TIF_UPROBE)
 #define _TIF_SYSCALL_TRACEPOINT	(1<<TIF_SYSCALL_TRACEPOINT)
 #define _TIF_EMULATE_STACK_STORE	(1<<TIF_EMULATE_STACK_STORE)
-#define _TIF_NOHZ		(1<<TIF_NOHZ)
 #define _TIF_SYSCALL_EMU	(1<<TIF_SYSCALL_EMU)
 #define _TIF_SYSCALL_DOTRACE	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
 				 _TIF_SECCOMP | _TIF_SYSCALL_TRACEPOINT | \
-				 _TIF_NOHZ | _TIF_SYSCALL_EMU)
+				 _TIF_SYSCALL_EMU)
 
 #define _TIF_USER_WORK_MASK	(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
 				 _TIF_NOTIFY_RESUME | _TIF_UPROBE | \
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 3d44b73adb83..4f3d4ff3728c 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -262,8 +262,6 @@ long do_syscall_trace_enter(struct pt_regs *regs)
 {
 	u32 flags;
 
-	user_exit();
-
 	flags = READ_ONCE(current_thread_info()->flags) &
 		(_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE);
 
@@ -340,8 +338,6 @@ void do_syscall_trace_leave(struct pt_regs *regs)
 	step = test_thread_flag(TIF_SINGLESTEP);
 	if (step || test_thread_flag(TIF_SYSCALL_TRACE))
 		tracehook_report_syscall_exit(regs, step);
-
-	user_enter();
 }
 
 void __init pt_regs_check(void);
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index 53782aa60ade..9ded046edb0e 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -282,8 +282,6 @@ static void do_signal(struct task_struct *tsk)
 
 void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags)
 {
-	user_exit();
-
 	if (thread_info_flags & _TIF_UPROBE)
 		uprobe_notify_resume(regs);
 
@@ -299,8 +297,6 @@ void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags)
 		tracehook_notify_resume(regs);
 		rseq_handle_notify_resume(NULL, regs);
 	}
-
-	user_enter();
 }
 
 static unsigned long get_tm_stackpointer(struct task_struct *tsk)
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 316c3ba16554..45c4420fe339 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -1,9 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
+#include <linux/context_tracking.h>
 #include <linux/err.h>
 #include <asm/asm-prototypes.h>
 #include <asm/kup.h>
 #include <asm/cputime.h>
+#include <asm/interrupt.h>
 #include <asm/hw_irq.h>
 #include <asm/interrupt.h>
 #include <asm/kprobes.h>
@@ -28,6 +30,9 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
 
+	CT_WARN_ON(ct_state() == CONTEXT_KERNEL);
+	user_exit_irqoff();
+
 	trace_hardirqs_off(); /* finish reconciling */
 
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S))
@@ -144,7 +149,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
  * enabled when the interrupt handler returns (indicating a process-context /
  * synchronous interrupt) then irqs_enabled should be true.
  */
-static notrace inline bool prep_irq_for_enabled_exit(bool clear_ri, bool irqs_enabled)
+static notrace inline bool __prep_irq_for_enabled_exit(bool clear_ri)
 {
 	/* This must be done with RI=1 because tracing may touch vmaps */
 	trace_hardirqs_on();
@@ -161,29 +166,6 @@ static notrace inline bool prep_irq_for_enabled_exit(bool clear_ri, bool irqs_en
 		trace_hardirqs_off();
 		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 
-		/*
-		 * Must replay pending soft-masked interrupts now. Don't just
-		 * local_irq_enabe(); local_irq_disable(); because if we are
-		 * returning from an asynchronous interrupt here, another one
-		 * might hit after irqs are enabled, and it would exit via this
-		 * same path allowing another to fire, and so on unbounded.
-		 *
-		 * If interrupts were enabled when this interrupt exited,
-		 * indicating a process context (synchronous) interrupt,
-		 * local_irq_enable/disable can be used, which will enable
-		 * interrupts rather than keeping them masked (unclear how
-		 * much benefit this is over just replaying for all cases,
-		 * because we immediately disable again, so all we're really
-		 * doing is allowing hard interrupts to execute directly for
-		 * a very small time, rather than being masked and replayed).
-		 */
-		if (irqs_enabled) {
-			local_irq_enable();
-			local_irq_disable();
-		} else {
-			replay_soft_interrupts();
-		}
-
 		return false;
 	}
 	local_paca->irq_happened = 0;
@@ -192,6 +174,37 @@ static notrace inline bool prep_irq_for_enabled_exit(bool clear_ri, bool irqs_en
 	return true;
 }
 
+static notrace inline bool prep_irq_for_enabled_exit(bool clear_ri, bool irqs_enabled)
+{
+	if (__prep_irq_for_enabled_exit(clear_ri))
+		return true;
+
+	/*
+	 * Must replay pending soft-masked interrupts now. Don't just
+	 * local_irq_enabe(); local_irq_disable(); because if we are
+	 * returning from an asynchronous interrupt here, another one
+	 * might hit after irqs are enabled, and it would exit via this
+	 * same path allowing another to fire, and so on unbounded.
+	 *
+	 * If interrupts were enabled when this interrupt exited,
+	 * indicating a process context (synchronous) interrupt,
+	 * local_irq_enable/disable can be used, which will enable
+	 * interrupts rather than keeping them masked (unclear how
+	 * much benefit this is over just replaying for all cases,
+	 * because we immediately disable again, so all we're really
+	 * doing is allowing hard interrupts to execute directly for
+	 * a very small time, rather than being masked and replayed).
+	 */
+	if (irqs_enabled) {
+		local_irq_enable();
+		local_irq_disable();
+	} else {
+		replay_soft_interrupts();
+	}
+
+	return false;
+}
+
 /*
  * This should be called after a syscall returns, with r3 the return value
  * from the syscall. If this function returns non-zero, the system call
@@ -209,6 +222,8 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	unsigned long ti_flags;
 	unsigned long ret = 0;
 
+	CT_WARN_ON(ct_state() == CONTEXT_USER);
+
 	kuap_check_amr();
 
 	regs->result = r3;
@@ -240,9 +255,9 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		ret |= _TIF_RESTOREALL;
 	}
 
+again:
 	local_irq_disable();
 
-again:
 	ti_flags = READ_ONCE(*ti_flagsp);
 	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
 		local_irq_enable();
@@ -286,9 +301,14 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		}
 	}
 
+	user_enter_irqoff();
+
 	/* scv need not set RI=0 because SRRs are not used */
-	if (unlikely(!prep_irq_for_enabled_exit(!scv, true)))
+	if (unlikely(!__prep_irq_for_enabled_exit(!scv))) {
+		user_exit_irqoff();
+		local_irq_enable();
 		goto again;
+	}
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	local_paca->tm_scratch = regs->msr;
-- 
2.23.0

