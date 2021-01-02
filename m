Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E81222E8756
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 13:52:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7MGl6zP2zDqGY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 23:51:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=L8t4cNDZ; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7LhV3XQWzDqJK
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jan 2021 23:25:46 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id 11so13569753pfu.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Jan 2021 04:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mZzZMK6pQ4+jnZ6DMuKH6m/gvLUsKx4bPYcsKUG6wk4=;
 b=L8t4cNDZtmV57g0PtiXYRSWpjMBpLtw0SzRygu0tVCfvLI2UJhz+S4yrrIflWW/pOd
 H5etRJ2VW3DpUvSFZvcW+MpYJ2/V93hOZwdTLzfqfswgpeDWgcgz6T9JHYhgGfFwAhxl
 g04okdf7JePY3QyL3SGzh3eiHuMXY3g9hoo46ctmmIX8YbHk08/CT81iiv90GEmrnEfi
 crBLMvl799ZpDBxG8OTPAoP4bQsjsg2Z/38/CB5i3+k6Kfta3EdLdfL4kPEUFlrwYdUf
 vcdGsyn4jJy4jHlHeYAZb0ilw7UtmQEHP10677/tgX1R0PFuVGSW5XhOVSVV+QfyEK6Z
 DUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mZzZMK6pQ4+jnZ6DMuKH6m/gvLUsKx4bPYcsKUG6wk4=;
 b=fKLvKCqhjZdjlbqi6FwqOZ5sMaLL/TvdZe450jbwKqfjpFiaabhReJlMsOxT/HQSSI
 d2Wptt3KmWV8w+qeJ12dxpU/fPZOzF9Bn9Bq3xMeiwuvRLUozNjf6PPyc/F8LDbj6LEc
 sjMk5IVyqEHCtdqR1nbBsUl/mAsdCl8oHiiSj0pe3tMYvY8oMSRV95vgADvOtQ+RphAk
 qF6yjPJ8Xx/Nz01/7W3P6uhcIMFXePIqLQw/Nh3LGhlMBfXp0C+JmNy8PtV8YTw3z5zi
 7yEN5SvEWcF8y/kEWIBkNnXMEkE4I5ErwCgW0jw7fCd02p1Na0eVKuRRuNBZoYcnqfnL
 qExw==
X-Gm-Message-State: AOAM533YEA7XjHtOzYm0cXHcQptKK5BgbsvSCfq+GL7JBqhEBUU7id+F
 BhWvMHkym01c6RSK5nqzmgPfWoDR9Wk=
X-Google-Smtp-Source: ABdhPJyTmLbNJgpayKb92P5svCaSAIGX+1zhR+NZcGmdVjrY3Og9UEtFbHI1esqcJHtvnIx0UNHSHg==
X-Received: by 2002:a63:da58:: with SMTP id l24mr63397549pgj.178.1609590344076; 
 Sat, 02 Jan 2021 04:25:44 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id h4sm58501413pgp.8.2021.01.02.04.25.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 04:25:43 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 09/21] powerpc/64: context tracking remove _TIF_NOHZ
Date: Sat,  2 Jan 2021 22:24:56 +1000
Message-Id: <20210102122508.1950592-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210102122508.1950592-1-npiggin@gmail.com>
References: <20210102122508.1950592-1-npiggin@gmail.com>
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

