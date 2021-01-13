Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9DC2F4593
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 08:55:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG09M2SL3zDrNS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 18:55:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=V3c8BGYq; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFzgQ5msrzDqxM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 18:32:50 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id v1so588171pjr.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 23:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mZzZMK6pQ4+jnZ6DMuKH6m/gvLUsKx4bPYcsKUG6wk4=;
 b=V3c8BGYqrVTeMgIb7Qp5Qh2QArBz9IkwhNQZjLSnkQ0BZAwFR0gYLWTNOM3UqxKSv+
 s2/IniizpJ+D37lDmsTpWWiCSrzQIJJB7WvpygHas72pjgBdvA3Yx8dgyr8TolXZxJEv
 U47oHydzQnMsdZod3XslxzI+Z+dNQrY3YF/jCiHgeEsQlRRqQQ03StCDb/vy9J4YmSJT
 56GH2TJhiVdKelVKABOt6NKpdHzEtBLa9Qvjt9kNYK7NKb3rivDqeM2ghZ7yymoGHgkS
 3Rvpo789hQMhGWCmz9VE4eWhTGZtquZJNJYQvNQhKlAmMezn6Z3JRRGVLU+J4TaY45r6
 nC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mZzZMK6pQ4+jnZ6DMuKH6m/gvLUsKx4bPYcsKUG6wk4=;
 b=lKUzlhWLS2Us4S53LmpXSIhkiDNC/FTGGyVeqSzceEg8NmDjmPVVn5NeqF0SoUujzf
 zzXjRdFehyVM3r1ge/ylGQPzAs+tl02SjHjIDzzXRzPw/ve6WqhP7W7avaXhnVjFDcGv
 zovpl6MuBWjBoO3NTH8OWg9+FV538kFflrG5MqLRwH++sfygyQhvjQdyhC6IZWaRvKxr
 HwN3LKhi4QK/Z9kUP7USN1kPFhwV8U0K4axctXSI7kxnIa0l4KeeB8WMLdtVINOnH67g
 hKGU9VmnZ1euwCbiWrx1ANLBZfUoXZMXlr4V+9oaQu8H7866II9wOKJc67C5R0nHPenQ
 I3PA==
X-Gm-Message-State: AOAM5307MZShm7h8iI3qCcUEmXgshcC9p8+PdhKw7vsSQ7XggRIu0oya
 praULWuE9aFSBmEQBbqaCFL96qM0td8=
X-Google-Smtp-Source: ABdhPJwnloyOb/XPgEfnEuYeVNVniZzB38vk7b3aPVlxbeCNPcVggTjwWWxyWe7uUsZQhxMlU+b7Og==
X-Received: by 2002:a17:90a:d308:: with SMTP id
 p8mr914015pju.110.1610523165944; 
 Tue, 12 Jan 2021 23:32:45 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id m77sm1394264pfd.105.2021.01.12.23.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:32:45 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 09/21] powerpc/64: context tracking remove _TIF_NOHZ
Date: Wed, 13 Jan 2021 17:32:03 +1000
Message-Id: <20210113073215.516986-10-npiggin@gmail.com>
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

Add context tracking to the system call handler explicitly, and remove
_TIF_NOHZ.

This saves 35 cycles on gettid system call cost on POWER9 with a
CONFIG_NOHZ_FULL kernel.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                   |  1 -
 arch/powerpc/include/asm/thread_info.h |  4 +---
 arch/powerpc/kernel/ptrace/ptrace.c    |  4 ----
 arch/powerpc/kernel/signal.c           |  4 ----
 arch/powerpc/kernel/syscall_64.c       | 10 ++++++++++
 5 files changed, 11 insertions(+), 12 deletions(-)

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
index dd87b2118620..d7d256a7a41f 100644
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
@@ -182,6 +187,8 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	unsigned long ti_flags;
 	unsigned long ret = 0;
 
+	CT_WARN_ON(ct_state() == CONTEXT_USER);
+
 	kuap_check_amr();
 
 	regs->result = r3;
@@ -258,8 +265,11 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
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

