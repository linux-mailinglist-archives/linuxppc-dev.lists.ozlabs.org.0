Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3B42F8331
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 19:01:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHTWh3c2szDsnQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 05:01:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j9P1NN97; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRzf5xdJzDshT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:51:58 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id h186so5856041pfe.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D9RgcwBhDiOucpbU8i2xRxjwLiDybU7Nj9Cy47GVI3w=;
 b=j9P1NN97Hy3YMBBoAj4sgdXZmQkjCDBpTmymbfKB5GI/mT5+MaQhEz1jTKzRUkXL6y
 82gbVzRHDyUm5WOoEKZQO1D7AkTJ1Ey6PXMprGJNd175ZYiNXIgMMX9h2iRjsn+4+qBf
 b4CcxtLmclXE1oHusI4tuAmhmPF7fZMEsqM9CXDV8BvonnBNfuqHeA/rm3+B1V61FHwc
 3iG5Xm+9fXWcQWV62qWtWyyjSQY5A1p0t96K6T85O0j8xeZLzCH7VdlYjOJaRa9tqhv5
 WOvBgkUYk6DjcLPEaOsy+rS0od7e7Skm7ywc4kuLorWyQ13AgUqrbaHoshm8dKUKiBf+
 X0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D9RgcwBhDiOucpbU8i2xRxjwLiDybU7Nj9Cy47GVI3w=;
 b=fDJ61XlgabnP1CfRtqWOdVb+0RetswqRZZmt0KGGJSmNwPzaD/JinOq7WA3nfj9Ml2
 NWyi07i/ZfAw7KL1tFUawgD1dV/QEoA+hLiS3EAgKX+afb7K7U9g2UWQgtKDLyKBEea/
 kuDKvU4mxBw48YJAE0gIgAPzEQIEspDQkz6HZd2CHJYAqC8OvurYvRtm52R/MQCk07PE
 rRElvr3c7/oYDhBZ28jiWUMzJc+T+sjvoB86eLAj6mMmV0qQPSYg/mwioFUVvlU9g9wu
 r+BhWBteynFvjgVVuiYyQ+mdnqpbcGtRK+bE2oSzyZTfH4fRU4tc8Llq8lHsLwJxtMgR
 RMzQ==
X-Gm-Message-State: AOAM5317IUtFoObzjSu7inlabiogWXfv1Nc+DmbWGxUp0QlofYZ5+WFn
 +T8/4kDmrzSnUyixwS+EYDVMf6+9g3A=
X-Google-Smtp-Source: ABdhPJwRWlHNZf0Zgbo4/E6q3ggrlauVDlppH5GaRtLkDCAqJ0d/I+H2//lPMMW9iTQFeYZkR0bCew==
X-Received: by 2002:a65:498e:: with SMTP id r14mr13554938pgs.235.1610729516886; 
 Fri, 15 Jan 2021 08:51:56 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:51:56 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 27/39] powerpc/64: context tracking remove _TIF_NOHZ
Date: Sat, 16 Jan 2021 02:50:00 +1000
Message-Id: <20210115165012.1260253-28-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210115165012.1260253-1-npiggin@gmail.com>
References: <20210115165012.1260253-1-npiggin@gmail.com>
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

This improves system call performance when nohz_full is enabled. On a
POWER9, gettid scv system call cost on a nohz_full CPU improves from
1129 cycles to 1004 cycles and on a housekeeping CPU from 550 cycles
to 430 cycles.

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

