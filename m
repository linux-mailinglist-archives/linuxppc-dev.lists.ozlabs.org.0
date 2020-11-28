Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2832C6FB4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 15:57:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjvjP5m9mzF0R8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 01:57:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZORf4CNn; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjvMV4jnKzDsQ7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 01:41:42 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id l4so544534pgu.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 06:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OfHhuTfV+3ngyPqmG9KkeN9zzfuiK23prlzAo3VpEnc=;
 b=ZORf4CNnmITHRrVZy3vkHo30v2XhLhc9qVYa3UdywahR90JKIpFtofLVHDDTQXnlLC
 HuhCinXkmIj2Bl96Y1wHsIh09nZkUKk8CPsYKK3lgiE9v1rI6XZTGnygv7xNw3ILXelx
 8Ob+4X3qWYYeigSqMxcALPwquIuDluYhF9o7NrfEAAAFQp2ohIxLN/N9RTUCWYaBzaqr
 X+nP8cMLjQ+VgWzcfBzeEVZcHTJbOS9/xGKJ4yCnPTlTGk9AqIm8ABaZM14Ezjf7JLB3
 RAt5xado/Xg9/xAFqcXH8PGlsUsdInmeGOcebxwcSM02oxqgF1rU6llsB1Tl74A403jY
 1Hpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OfHhuTfV+3ngyPqmG9KkeN9zzfuiK23prlzAo3VpEnc=;
 b=QC/6hCEYCEgq/vregnyM04UqEl2x15qUU0pYOLpajUUFCHnhOsu5TJhZJezfZmPWHw
 TODMXXAT0I8d4MphNASxUYmjpNdn9MxVZx2K96ddRR9NeRkHslO13DSqV+Eg0FDztPdF
 BpdSRwVzwk6LlDEz6z6uWGbcLU5wZ9feI2eXY1vV3UZRvQYBWYnTHnZGzCzRlRiaqc/e
 Sd43AmX05NJCy+Zz59wqy+qI7nY5ci1z+pA9kEbhavdO1uSJ8py4/fKiB7vCcyGHDhQ8
 S6xbtKaNoOWr2XFS5EDnoVM93wlhdr/LUY0oLY7fTMVJBJj/gNlj1cSKY59Hler2ggkg
 Qvnw==
X-Gm-Message-State: AOAM530eWHzJfbk8DzWiNqZ+cE2xmxEG87PQrT/EitwLhraBgYoOsV96
 NQB10WmZB7jC8MoCH4bMtHOWRkNJLjA=
X-Google-Smtp-Source: ABdhPJwn98SN6waHCi1eE6a5Yzqs9SkBiRw2iS7qHT1KhLYKYDTOZvva9FzMkjVhlMLEly2DitLhwQ==
X-Received: by 2002:a17:90a:c70f:: with SMTP id
 o15mr3713889pjt.40.1606574499877; 
 Sat, 28 Nov 2020 06:41:39 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-103-132.tpgi.com.au.
 [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id y201sm10750764pfb.2.2020.11.28.06.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 06:41:39 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 08/19] powerpc/64: context tracking remove _TIF_NOHZ
Date: Sun, 29 Nov 2020 00:41:03 +1000
Message-Id: <20201128144114.944000-9-npiggin@gmail.com>
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

Add context tracking to the system call handler explicitly, and remove
_TIF_NOHZ.

This saves 35 cycles on gettid system call cost on POWER9 with a
CONFIG_NOHZ_FULL kernel.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/Kconfig                           |  6 ------
 arch/powerpc/Kconfig                   |  1 -
 arch/powerpc/include/asm/thread_info.h |  4 +---
 arch/powerpc/kernel/ptrace/ptrace.c    |  4 ----
 arch/powerpc/kernel/signal.c           |  4 ----
 arch/powerpc/kernel/syscall_64.c       | 10 ++++++++++
 6 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 56b6ccc0e32d..a0b6213f7820 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -618,12 +618,6 @@ config HAVE_CONTEXT_TRACKING
 	  protected inside rcu_irq_enter/rcu_irq_exit() but preemption or signal
 	  handling on irq exit still need to be protected.
 
-config HAVE_TIF_NOHZ
-	bool
-	help
-	  Arch relies on TIF_NOHZ and syscall slow path to implement context
-	  tracking calls to user_enter()/user_exit().
-
 config HAVE_VIRT_CPU_ACCOUNTING
 	bool
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e9f13fe08492..6eaf12a504f8 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -193,7 +193,6 @@ config PPC
 	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
 	select HAVE_CONTEXT_TRACKING		if PPC64
-	select HAVE_TIF_NOHZ			if PPC64
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_DYNAMIC_FTRACE
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index 46a210b03d2b..c9443c16e5fb 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -95,7 +95,6 @@ void arch_setup_new_exec(void);
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
index d2c356f37077..44ec7b34b27e 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -310,8 +310,6 @@ static void do_signal(struct task_struct *tsk)
 
 void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags)
 {
-	user_exit();
-
 	if (thread_info_flags & _TIF_UPROBE)
 		uprobe_notify_resume(regs);
 
@@ -327,8 +325,6 @@ void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags)
 		tracehook_notify_resume(regs);
 		rseq_handle_notify_resume(NULL, regs);
 	}
-
-	user_enter();
 }
 
 unsigned long get_tm_stackpointer(struct task_struct *tsk)
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 16eb2b5dafde..9e855b25bd15 100644
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
@@ -158,6 +163,8 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	unsigned long ti_flags;
 	unsigned long ret = 0;
 
+	CT_WARN_ON(ct_state() == CONTEXT_USER);
+
 	kuap_check_amr();
 
 	regs->result = r3;
@@ -234,8 +241,11 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
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
-- 
2.23.0

