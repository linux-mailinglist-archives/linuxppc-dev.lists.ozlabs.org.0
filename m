Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 060CC25E994
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 19:54:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BkMd21PH0zDqDT
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 03:54:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ME6UsKgX; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BkMNW5zVbzDqcn
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Sep 2020 03:43:55 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id u13so5988166pgh.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Sep 2020 10:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uyp45AwZx4SPbIe+ddqWx8LW0IVQnPCG6EvfBYBEpAc=;
 b=ME6UsKgXkf19XtknKhZoUP8zmWyqLNCF4YP/fCjDcfcJuXEnB2ch7mW6yBkJtzhdmw
 DKR3N7VZ6eW4gtrDiQi7YjJKlzbETbaT5b5K9qb710wGFqYxNEGCW6qsgF6MX8G7gevV
 tSaGJ/p9zAU5X2WaKNJPomu+3AhVWCyvZ7UGXP0lCr/IrsVZUTffKwAPMf1mP+9ihOSt
 /YosB1nWJxL7sLK4u6KCtl82b5HdOJoqbj9hcWcMOB135KxP2Xucsw5o5dJZuFAR8d3k
 8H4ZFOsyxiGr5evLe7Y59nTCKkdJQAfvciGJ3freJfJluky6HjgdnpOexRQcQbCe7WTn
 PIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uyp45AwZx4SPbIe+ddqWx8LW0IVQnPCG6EvfBYBEpAc=;
 b=ubykOfSx1PmKWPy+12I/8ZR/Mj9W0T+bKkaVD/5XQmqnVV55jf4Ystp2EnYd5XgSph
 yVMJMoyM/M75wq1i2r12XMGW9XeReNAkKNtjLK/lSeOMZY7TQEDGzt8lmQQlGbyDe42g
 OWG+mVMhVaE9yOoFqyERTecJaFpZCJC7Q5ICKIeD1C5tYZDDqj+72bTgyMhDkxIv2sQs
 lJM2WqfSwUofEMyp2TvJ+bCts19w+r4F40au+NxhqHuNsSUeAoWXbAA2b2vj06fruV4U
 IRDgi/X6C9oOKS5YkCZ/dOHCC2LyCeJtuw/lVcA75PBQM19cNx72ELH3R+thBG+p5TP5
 GRAA==
X-Gm-Message-State: AOAM531k1P/1CsGQ9x/cAxN9IJrD9aoth7EsrHCmutCgcxq3xzPhfA8c
 P8Yk/U+t3vTnBKHrf8FGC8I=
X-Google-Smtp-Source: ABdhPJxUO0TB0Vf4Imy7nZB5UObv1sQBBgnQ4dGHQeiRGuttpquIZGigSNdXsIaBOPHQT7+Tw5zD1A==
X-Received: by 2002:a65:6412:: with SMTP id a18mr11568447pgv.215.1599327832795; 
 Sat, 05 Sep 2020 10:43:52 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id i1sm10405317pfk.21.2020.09.05.10.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 10:43:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [RFC PATCH 03/12] powerpc: interrupt handler wrapper functions
Date: Sun,  6 Sep 2020 03:43:26 +1000
Message-Id: <20200905174335.3161229-4-npiggin@gmail.com>
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

Add wrapper functions (derived from x86 macros) for interrupt handler
functions. This allows interrupt entry code to be written in C.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h |  28 ---
 arch/powerpc/include/asm/bug.h            |   1 -
 arch/powerpc/include/asm/hw_irq.h         |   9 -
 arch/powerpc/include/asm/interrupt.h      | 201 ++++++++++++++++++++++
 arch/powerpc/include/asm/time.h           |   2 +
 arch/powerpc/kernel/dbell.c               |   3 +-
 arch/powerpc/kernel/exceptions-64s.S      |   8 +-
 arch/powerpc/kernel/irq.c                 |   3 +-
 arch/powerpc/kernel/mce.c                 |   5 +-
 arch/powerpc/kernel/tau_6xx.c             |   2 +-
 arch/powerpc/kernel/time.c                |   3 +-
 arch/powerpc/kernel/traps.c               |  78 ++++++---
 arch/powerpc/kernel/watchdog.c            |   7 +-
 arch/powerpc/kvm/book3s_hv_builtin.c      |   1 +
 arch/powerpc/mm/book3s64/hash_utils.c     |   3 +-
 arch/powerpc/mm/book3s64/slb.c            |   5 +-
 arch/powerpc/mm/fault.c                   |  10 +-
 arch/powerpc/platforms/powernv/idle.c     |   1 +
 18 files changed, 290 insertions(+), 80 deletions(-)
 create mode 100644 arch/powerpc/include/asm/interrupt.h

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index fffac9de2922..de4dad05e272 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -56,34 +56,6 @@ int exit_vmx_usercopy(void);
 int enter_vmx_ops(void);
 void *exit_vmx_ops(void *dest);
 
-/* Traps */
-long machine_check_early(struct pt_regs *regs);
-long hmi_exception_realmode(struct pt_regs *regs);
-void SMIException(struct pt_regs *regs);
-void handle_hmi_exception(struct pt_regs *regs);
-void instruction_breakpoint_exception(struct pt_regs *regs);
-void RunModeException(struct pt_regs *regs);
-void single_step_exception(struct pt_regs *regs);
-void program_check_exception(struct pt_regs *regs);
-void alignment_exception(struct pt_regs *regs);
-void StackOverflow(struct pt_regs *regs);
-void kernel_fp_unavailable_exception(struct pt_regs *regs);
-void altivec_unavailable_exception(struct pt_regs *regs);
-void vsx_unavailable_exception(struct pt_regs *regs);
-void fp_unavailable_tm(struct pt_regs *regs);
-void altivec_unavailable_tm(struct pt_regs *regs);
-void vsx_unavailable_tm(struct pt_regs *regs);
-void facility_unavailable_exception(struct pt_regs *regs);
-void TAUException(struct pt_regs *regs);
-void altivec_assist_exception(struct pt_regs *regs);
-void unrecoverable_exception(struct pt_regs *regs);
-void kernel_bad_stack(struct pt_regs *regs);
-void system_reset_exception(struct pt_regs *regs);
-void machine_check_exception(struct pt_regs *regs);
-void emulation_assist_interrupt(struct pt_regs *regs);
-long do_slb_fault(struct pt_regs *regs);
-void do_bad_slb_fault(struct pt_regs *regs);
-
 /* signals, syscalls and interrupts */
 long sys_swapcontext(struct ucontext __user *old_ctx,
 		    struct ucontext __user *new_ctx,
diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 2fa0cf6c6011..7b89cdbbb789 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -111,7 +111,6 @@
 #ifndef __ASSEMBLY__
 
 struct pt_regs;
-extern long do_page_fault(struct pt_regs *);
 extern long hash__do_page_fault(struct pt_regs *);
 extern void bad_page_fault(struct pt_regs *, unsigned long, int);
 extern void _exception(int, struct pt_regs *, int, unsigned long);
diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 3a0db7b0b46e..19420e48bcd5 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -51,15 +51,6 @@
 
 #ifndef __ASSEMBLY__
 
-extern void replay_system_reset(void);
-extern void replay_soft_interrupts(void);
-
-extern void timer_interrupt(struct pt_regs *);
-extern void timer_broadcast_interrupt(void);
-extern void performance_monitor_exception(struct pt_regs *regs);
-extern void WatchdogException(struct pt_regs *regs);
-extern void unknown_exception(struct pt_regs *regs);
-
 #ifdef CONFIG_PPC64
 #include <asm/paca.h>
 
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
new file mode 100644
index 000000000000..7c7e58541171
--- /dev/null
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -0,0 +1,201 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _ASM_POWERPC_INTERRUPT_H
+#define _ASM_POWERPC_INTERRUPT_H
+
+#include <linux/context_tracking.h>
+#include <asm/ftrace.h>
+
+/**
+ * DECLARE_INTERRUPT_HANDLER_RAW - Declare raw interrupt handler function
+ * @func:	Function name of the entry point
+ * @returns:	Returns a value back to asm caller
+ */
+#define DECLARE_INTERRUPT_HANDLER_RAW(func)				\
+	__visible long func(struct pt_regs *regs)
+
+/**
+ * DEFINE_INTERRUPT_HANDLER_RAW - Define raw interrupt handler function
+ * @func:	Function name of the entry point
+ * @returns:	Returns a value back to asm caller
+ *
+ * @func is called from ASM entry code.
+ *
+ * This is a plain function which does no tracing, reconciling, etc.
+ * The macro is written so it acts as function definition. Append the
+ * body with a pair of curly brackets.
+ */
+#define DEFINE_INTERRUPT_HANDLER_RAW(func)				\
+static __always_inline long ___##func(struct pt_regs *regs);		\
+									\
+__visible noinstr long func(struct pt_regs *regs)			\
+{									\
+	long ret;							\
+									\
+	ret = ___##func (regs);						\
+									\
+	return ret;							\
+}									\
+									\
+static __always_inline long ___##func(struct pt_regs *regs)
+
+/**
+ * DECLARE_INTERRUPT_HANDLER - Declare synchronous interrupt handler function
+ * @func:	Function name of the entry point
+ */
+#define DECLARE_INTERRUPT_HANDLER(func)					\
+	__visible void func(struct pt_regs *regs)
+
+/**
+ * DEFINE_INTERRUPT_HANDLER - Define synchronous interrupt handler function
+ * @func:	Function name of the entry point
+ *
+ * @func is called from ASM entry code.
+ *
+ * The macro is written so it acts as function definition. Append the
+ * body with a pair of curly brackets.
+ */
+#define DEFINE_INTERRUPT_HANDLER(func)					\
+static __always_inline void ___##func(struct pt_regs *regs);		\
+									\
+__visible noinstr void func(struct pt_regs *regs)			\
+{									\
+	___##func (regs);						\
+}									\
+									\
+static __always_inline void ___##func(struct pt_regs *regs)
+
+/**
+ * DECLARE_INTERRUPT_HANDLER_RET - Declare synchronous interrupt handler function
+ * @func:	Function name of the entry point
+ * @returns:	Returns a value back to asm caller
+ */
+#define DECLARE_INTERRUPT_HANDLER_RET(func)				\
+	__visible long func(struct pt_regs *regs)
+
+/**
+ * DEFINE_INTERRUPT_HANDLER_RET - Define synchronous interrupt handler function
+ * @func:	Function name of the entry point
+ * @returns:	Returns a value back to asm caller
+ *
+ * @func is called from ASM entry code.
+ *
+ * The macro is written so it acts as function definition. Append the
+ * body with a pair of curly brackets.
+ */
+#define DEFINE_INTERRUPT_HANDLER_RET(func)				\
+static __always_inline long ___##func(struct pt_regs *regs);		\
+									\
+__visible noinstr long func(struct pt_regs *regs)			\
+{									\
+	long ret;							\
+									\
+	ret = ___##func (regs);						\
+									\
+	return ret;							\
+}									\
+									\
+static __always_inline long ___##func(struct pt_regs *regs)
+
+/**
+ * DECLARE_INTERRUPT_HANDLER_ASYNC - Declare asynchronous interrupt handler function
+ * @func:	Function name of the entry point
+ */
+#define DECLARE_INTERRUPT_HANDLER_ASYNC(func)				\
+	__visible void func(struct pt_regs *regs)
+
+/**
+ * DEFINE_INTERRUPT_HANDLER_ASYNC - Define asynchronous interrupt handler function
+ * @func:	Function name of the entry point
+ *
+ * @func is called from ASM entry code.
+ *
+ * The macro is written so it acts as function definition. Append the
+ * body with a pair of curly brackets.
+ */
+#define DEFINE_INTERRUPT_HANDLER_ASYNC(func)				\
+static __always_inline void ___##func(struct pt_regs *regs);		\
+									\
+__visible noinstr void func(struct pt_regs *regs)			\
+{									\
+	___##func (regs);						\
+}									\
+									\
+static __always_inline void ___##func(struct pt_regs *regs)
+
+/**
+ * DECLARE_INTERRUPT_HANDLER_NMI - Declare NMI interrupt handler function
+ * @func:	Function name of the entry point
+ * @returns:	Returns a value back to asm caller
+ */
+#define DECLARE_INTERRUPT_HANDLER_NMI(func)				\
+	__visible long func(struct pt_regs *regs)
+
+/**
+ * DEFINE_INTERRUPT_HANDLER_NMI - Define NMI interrupt handler function
+ * @func:	Function name of the entry point
+ * @returns:	Returns a value back to asm caller
+ *
+ * @func is called from ASM entry code.
+ *
+ * The macro is written so it acts as function definition. Append the
+ * body with a pair of curly brackets.
+ */
+#define DEFINE_INTERRUPT_HANDLER_NMI(func)				\
+static __always_inline long ___##func(struct pt_regs *regs);		\
+									\
+__visible noinstr long func(struct pt_regs *regs)			\
+{									\
+	long ret;							\
+									\
+	ret = ___##func (regs);						\
+									\
+	return ret;							\
+}									\
+									\
+static __always_inline long ___##func(struct pt_regs *regs)
+
+
+/* Interrupt handlers */
+DECLARE_INTERRUPT_HANDLER_NMI(machine_check_early);
+DECLARE_INTERRUPT_HANDLER_NMI(hmi_exception_realmode);
+DECLARE_INTERRUPT_HANDLER(SMIException);
+DECLARE_INTERRUPT_HANDLER(handle_hmi_exception);
+DECLARE_INTERRUPT_HANDLER(instruction_breakpoint_exception);
+DECLARE_INTERRUPT_HANDLER(RunModeException);
+DECLARE_INTERRUPT_HANDLER(single_step_exception);
+DECLARE_INTERRUPT_HANDLER(program_check_exception);
+DECLARE_INTERRUPT_HANDLER(alignment_exception);
+DECLARE_INTERRUPT_HANDLER(StackOverflow);
+DECLARE_INTERRUPT_HANDLER(kernel_fp_unavailable_exception);
+DECLARE_INTERRUPT_HANDLER(altivec_unavailable_exception);
+DECLARE_INTERRUPT_HANDLER(vsx_unavailable_exception);
+DECLARE_INTERRUPT_HANDLER(fp_unavailable_tm);
+DECLARE_INTERRUPT_HANDLER(altivec_unavailable_tm);
+DECLARE_INTERRUPT_HANDLER(vsx_unavailable_tm);
+DECLARE_INTERRUPT_HANDLER(facility_unavailable_exception);
+DECLARE_INTERRUPT_HANDLER(TAUException);
+DECLARE_INTERRUPT_HANDLER(altivec_assist_exception);
+DECLARE_INTERRUPT_HANDLER(unrecoverable_exception);
+DECLARE_INTERRUPT_HANDLER(kernel_bad_stack);
+DECLARE_INTERRUPT_HANDLER_NMI(system_reset_exception);
+#ifdef CONFIG_PPC_BOOK3S_64
+DECLARE_INTERRUPT_HANDLER_ASYNC(machine_check_exception);
+#else
+DECLARE_INTERRUPT_HANDLER_NMI(machine_check_exception);
+#endif
+DECLARE_INTERRUPT_HANDLER(emulation_assist_interrupt);
+DECLARE_INTERRUPT_HANDLER_RAW(do_slb_fault);
+DECLARE_INTERRUPT_HANDLER(do_bad_slb_fault);
+DECLARE_INTERRUPT_HANDLER_RET(do_page_fault);
+DECLARE_INTERRUPT_HANDLER(do_bad_page_fault);
+
+DECLARE_INTERRUPT_HANDLER_ASYNC(timer_interrupt);
+DECLARE_INTERRUPT_HANDLER_ASYNC(performance_monitor_exception);
+DECLARE_INTERRUPT_HANDLER(WatchdogException);
+DECLARE_INTERRUPT_HANDLER(unknown_exception);
+DECLARE_INTERRUPT_HANDLER_ASYNC(unknown_async_exception);
+
+void replay_system_reset(void);
+void replay_soft_interrupts(void);
+
+#endif /* _ASM_POWERPC_INTERRUPT_H */
diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index cb326720a8a1..27dca4d96fcc 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -181,6 +181,8 @@ DECLARE_PER_CPU(u64, decrementers_next_tb);
 /* Convert timebase ticks to nanoseconds */
 unsigned long long tb_to_ns(unsigned long long tb_ticks);
 
+void timer_broadcast_interrupt(void);
+
 /* SPLPAR */
 void accumulate_stolen_time(void);
 
diff --git a/arch/powerpc/kernel/dbell.c b/arch/powerpc/kernel/dbell.c
index 52680cf07c9d..2c59dee7ec90 100644
--- a/arch/powerpc/kernel/dbell.c
+++ b/arch/powerpc/kernel/dbell.c
@@ -12,13 +12,14 @@
 #include <linux/hardirq.h>
 
 #include <asm/dbell.h>
+#include <asm/interrupt.h>
 #include <asm/irq_regs.h>
 #include <asm/kvm_ppc.h>
 #include <asm/trace.h>
 
 #ifdef CONFIG_SMP
 
-void doorbell_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_ASYNC(doorbell_exception)
 {
 	struct pt_regs *old_regs = set_irq_regs(regs);
 
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 1f34cfd1887c..f6989321136d 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1922,7 +1922,7 @@ EXC_COMMON_BEGIN(doorbell_super_common)
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
 #else
-	bl	unknown_exception
+	bl	unknown_async_exception
 #endif
 	b	interrupt_return
 
@@ -2135,9 +2135,7 @@ EXC_COMMON_BEGIN(h_data_storage_common)
 	GEN_COMMON h_data_storage
 	addi    r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
-	ld	r4,_DAR(r1)
-	li	r5,SIGSEGV
-	bl      bad_page_fault
+	bl      do_bad_page_fault
 MMU_FTR_SECTION_ELSE
 	bl      unknown_exception
 ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
@@ -2310,7 +2308,7 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 #ifdef CONFIG_PPC_DOORBELL
 	bl	doorbell_exception
 #else
-	bl	unknown_exception
+	bl	unknown_async_exception
 #endif
 	b	interrupt_return
 
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index bf21ebd36190..cb4559bb4878 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -54,6 +54,7 @@
 #include <linux/pgtable.h>
 
 #include <linux/uaccess.h>
+#include <asm/interrupt.h>
 #include <asm/io.h>
 #include <asm/irq.h>
 #include <asm/cache.h>
@@ -725,7 +726,7 @@ void __do_irq(struct pt_regs *regs)
 	irq_exit();
 }
 
-void do_IRQ(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_ASYNC(do_IRQ)
 {
 	struct pt_regs *old_regs = set_irq_regs(regs);
 	void *cursp, *irqsp, *sirqsp;
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index ada59f6c4298..d0bbcc4fe13c 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -18,6 +18,7 @@
 #include <linux/extable.h>
 #include <linux/ftrace.h>
 
+#include <asm/interrupt.h>
 #include <asm/machdep.h>
 #include <asm/mce.h>
 #include <asm/nmi.h>
@@ -588,7 +589,7 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
  *
  * regs->nip and regs->msr contains srr0 and ssr1.
  */
-long notrace machine_check_early(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_NMI(machine_check_early)
 {
 	long handled = 0;
 	bool nested = in_nmi();
@@ -723,7 +724,7 @@ long hmi_handle_debugtrig(struct pt_regs *regs)
 /*
  * Return values:
  */
-long hmi_exception_realmode(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_NMI(hmi_exception_realmode)
 {	
 	int ret;
 
diff --git a/arch/powerpc/kernel/tau_6xx.c b/arch/powerpc/kernel/tau_6xx.c
index e2ab8a111b69..4ce3f7319140 100644
--- a/arch/powerpc/kernel/tau_6xx.c
+++ b/arch/powerpc/kernel/tau_6xx.c
@@ -124,7 +124,7 @@ static void TAUupdate(int cpu)
  * with interrupts disabled
  */
 
-void TAUException(struct pt_regs * regs)
+DEFINE_INTERRUPT_HANDLER(TAUException) /* XXX async? */
 {
 	int cpu = smp_processor_id();
 
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index f85539ebb513..6e26bc2aa24a 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -56,6 +56,7 @@
 #include <linux/processor.h>
 #include <asm/trace.h>
 
+#include <asm/interrupt.h>
 #include <asm/io.h>
 #include <asm/nvram.h>
 #include <asm/cache.h>
@@ -564,7 +565,7 @@ void arch_irq_work_raise(void)
  * timer_interrupt - gets called when the decrementer overflows,
  * with interrupts disabled.
  */
-void timer_interrupt(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 {
 	struct clock_event_device *evt = this_cpu_ptr(&decrementers);
 	u64 *next_tb = this_cpu_ptr(&decrementers_next_tb);
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index d1ebe152f210..96fa2d7e088c 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -41,6 +41,7 @@
 #include <asm/emulated_ops.h>
 #include <linux/uaccess.h>
 #include <asm/debugfs.h>
+#include <asm/interrupt.h>
 #include <asm/io.h>
 #include <asm/machdep.h>
 #include <asm/rtas.h>
@@ -436,8 +437,9 @@ void hv_nmi_check_nonrecoverable(struct pt_regs *regs)
 	regs->msr &= ~MSR_RI;
 #endif
 }
+/* XXX make this nokprobe? */
 
-void system_reset_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
 {
 	unsigned long hsrr0, hsrr1;
 	bool saved_hsrrs = false;
@@ -522,6 +524,8 @@ void system_reset_exception(struct pt_regs *regs)
 	this_cpu_set_ftrace_enabled(ftrace_enabled);
 
 	/* What should we do here? We could issue a shutdown or hard reset. */
+
+	return 0;
 }
 
 /*
@@ -823,7 +827,12 @@ int machine_check_generic(struct pt_regs *regs)
 }
 #endif /* everything else */
 
-void machine_check_exception(struct pt_regs *regs)
+
+#ifdef CONFIG_PPC_BOOK3S_64
+DEFINE_INTERRUPT_HANDLER_ASYNC(machine_check_exception)
+#else
+DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
+#endif
 {
 	int recover = 0;
 
@@ -873,13 +882,20 @@ void machine_check_exception(struct pt_regs *regs)
 	if (!(regs->msr & MSR_RI))
 		die("Unrecoverable Machine check", regs, SIGBUS);
 
+#ifdef CONFIG_PPC_BOOK3S_64
+bail:
 	return;
+#else
+	return 0;
 
 bail:
 	if (nmi) nmi_exit();
+
+	return 0;
+#endif
 }
 
-void SMIException(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(SMIException) /* async? */
 {
 	die("System Management Interrupt", regs, SIGABRT);
 }
@@ -1065,7 +1081,7 @@ static void p9_hmi_special_emu(struct pt_regs *regs)
 }
 #endif /* CONFIG_VSX */
 
-void handle_hmi_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_ASYNC(handle_hmi_exception)
 {
 	struct pt_regs *old_regs;
 
@@ -1094,7 +1110,19 @@ void handle_hmi_exception(struct pt_regs *regs)
 	set_irq_regs(old_regs);
 }
 
-void unknown_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(unknown_exception)
+{
+	enum ctx_state prev_state = exception_enter();
+
+	printk("Bad trap at PC: %lx, SR: %lx, vector=%lx\n",
+	       regs->nip, regs->msr, regs->trap);
+
+	_exception(SIGTRAP, regs, TRAP_UNK, 0);
+
+	exception_exit(prev_state);
+}
+
+DEFINE_INTERRUPT_HANDLER_ASYNC(unknown_async_exception)
 {
 	enum ctx_state prev_state = exception_enter();
 
@@ -1106,7 +1134,7 @@ void unknown_exception(struct pt_regs *regs)
 	exception_exit(prev_state);
 }
 
-void instruction_breakpoint_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(instruction_breakpoint_exception)
 {
 	enum ctx_state prev_state = exception_enter();
 
@@ -1121,12 +1149,12 @@ void instruction_breakpoint_exception(struct pt_regs *regs)
 	exception_exit(prev_state);
 }
 
-void RunModeException(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(RunModeException)
 {
 	_exception(SIGTRAP, regs, TRAP_UNK, 0);
 }
 
-void single_step_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(single_step_exception)
 {
 	enum ctx_state prev_state = exception_enter();
 
@@ -1469,7 +1497,7 @@ static int emulate_math(struct pt_regs *regs)
 static inline int emulate_math(struct pt_regs *regs) { return -1; }
 #endif
 
-void program_check_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(program_check_exception)
 {
 	enum ctx_state prev_state = exception_enter();
 	unsigned int reason = get_reason(regs);
@@ -1594,14 +1622,14 @@ NOKPROBE_SYMBOL(program_check_exception);
  * This occurs when running in hypervisor mode on POWER6 or later
  * and an illegal instruction is encountered.
  */
-void emulation_assist_interrupt(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(emulation_assist_interrupt)
 {
 	regs->msr |= REASON_ILLEGAL;
 	program_check_exception(regs);
 }
 NOKPROBE_SYMBOL(emulation_assist_interrupt);
 
-void alignment_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(alignment_exception)
 {
 	enum ctx_state prev_state = exception_enter();
 	int sig, code, fixed = 0;
@@ -1651,7 +1679,7 @@ void alignment_exception(struct pt_regs *regs)
 	exception_exit(prev_state);
 }
 
-void StackOverflow(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(StackOverflow)
 {
 	pr_crit("Kernel stack overflow in process %s[%d], r1=%lx\n",
 		current->comm, task_pid_nr(current), regs->gpr[1]);
@@ -1660,7 +1688,7 @@ void StackOverflow(struct pt_regs *regs)
 	panic("kernel stack overflow");
 }
 
-void stack_overflow_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(stack_overflow_exception)
 {
 	enum ctx_state prev_state = exception_enter();
 
@@ -1669,7 +1697,7 @@ void stack_overflow_exception(struct pt_regs *regs)
 	exception_exit(prev_state);
 }
 
-void kernel_fp_unavailable_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(kernel_fp_unavailable_exception)
 {
 	enum ctx_state prev_state = exception_enter();
 
@@ -1680,7 +1708,7 @@ void kernel_fp_unavailable_exception(struct pt_regs *regs)
 	exception_exit(prev_state);
 }
 
-void altivec_unavailable_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(altivec_unavailable_exception)
 {
 	enum ctx_state prev_state = exception_enter();
 
@@ -1699,7 +1727,7 @@ void altivec_unavailable_exception(struct pt_regs *regs)
 	exception_exit(prev_state);
 }
 
-void vsx_unavailable_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(vsx_unavailable_exception)
 {
 	if (user_mode(regs)) {
 		/* A user program has executed an vsx instruction,
@@ -1730,7 +1758,7 @@ static void tm_unavailable(struct pt_regs *regs)
 	die("Unrecoverable TM Unavailable Exception", regs, SIGABRT);
 }
 
-void facility_unavailable_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(facility_unavailable_exception)
 {
 	static char *facility_strings[] = {
 		[FSCR_FP_LG] = "FPU",
@@ -1850,7 +1878,7 @@ void facility_unavailable_exception(struct pt_regs *regs)
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 
-void fp_unavailable_tm(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(fp_unavailable_tm)
 {
 	/* Note:  This does not handle any kind of FP laziness. */
 
@@ -1883,7 +1911,7 @@ void fp_unavailable_tm(struct pt_regs *regs)
 	tm_recheckpoint(&current->thread);
 }
 
-void altivec_unavailable_tm(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(altivec_unavailable_tm)
 {
 	/* See the comments in fp_unavailable_tm().  This function operates
 	 * the same way.
@@ -1898,7 +1926,7 @@ void altivec_unavailable_tm(struct pt_regs *regs)
 	current->thread.used_vr = 1;
 }
 
-void vsx_unavailable_tm(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(vsx_unavailable_tm)
 {
 	/* See the comments in fp_unavailable_tm().  This works similarly,
 	 * though we're loading both FP and VEC registers in here.
@@ -1923,7 +1951,7 @@ void vsx_unavailable_tm(struct pt_regs *regs)
 }
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
-void performance_monitor_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_ASYNC(performance_monitor_exception)
 {
 	__this_cpu_inc(irq_stat.pmu_irqs);
 
@@ -2061,7 +2089,7 @@ NOKPROBE_SYMBOL(DebugException);
 #endif /* CONFIG_PPC_ADV_DEBUG_REGS */
 
 #ifdef CONFIG_ALTIVEC
-void altivec_assist_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(altivec_assist_exception)
 {
 	int err;
 
@@ -2203,7 +2231,7 @@ void SPEFloatingPointRoundException(struct pt_regs *regs)
  * in the MSR is 0.  This indicates that SRR0/1 are live, and that
  * we therefore lost state by taking this exception.
  */
-void unrecoverable_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(unrecoverable_exception)
 {
 	pr_emerg("Unrecoverable exception %lx at %lx (msr=%lx)\n",
 		 regs->trap, regs->nip, regs->msr);
@@ -2223,7 +2251,7 @@ void __attribute__ ((weak)) WatchdogHandler(struct pt_regs *regs)
 	return;
 }
 
-void WatchdogException(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(WatchdogException) /* XXX NMI? async? */
 {
 	printk (KERN_EMERG "PowerPC Book-E Watchdog Exception\n");
 	WatchdogHandler(regs);
@@ -2234,7 +2262,7 @@ void WatchdogException(struct pt_regs *regs)
  * We enter here if we discover during exception entry that we are
  * running in supervisor mode with a userspace value in the stack pointer.
  */
-void kernel_bad_stack(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(kernel_bad_stack)
 {
 	printk(KERN_EMERG "Bad kernel stack pointer %lx at %lx\n",
 	       regs->gpr[1], regs->nip);
diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index af3c15a1d41e..824b9376ac35 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -26,6 +26,7 @@
 #include <linux/delay.h>
 #include <linux/smp.h>
 
+#include <asm/interrupt.h>
 #include <asm/paca.h>
 
 /*
@@ -247,14 +248,14 @@ static void watchdog_timer_interrupt(int cpu)
 		watchdog_smp_panic(cpu, tb);
 }
 
-void soft_nmi_interrupt(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
 {
 	unsigned long flags;
 	int cpu = raw_smp_processor_id();
 	u64 tb;
 
 	if (!cpumask_test_cpu(cpu, &wd_cpus_enabled))
-		return;
+		return 0;
 
 	nmi_enter();
 
@@ -291,6 +292,8 @@ void soft_nmi_interrupt(struct pt_regs *regs)
 
 out:
 	nmi_exit();
+
+	return 0;
 }
 
 static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 073617ce83e0..17102ea50cf4 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -17,6 +17,7 @@
 
 #include <asm/asm-prototypes.h>
 #include <asm/cputable.h>
+#include <asm/interrupt.h>
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s.h>
 #include <asm/archrandom.h>
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 8d36b47b3f5a..360748a8042c 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -38,6 +38,7 @@
 #include <linux/pgtable.h>
 
 #include <asm/debugfs.h>
+#include <asm/interrupt.h>
 #include <asm/processor.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
@@ -1500,7 +1501,7 @@ int hash_page(unsigned long ea, unsigned long access, unsigned long trap,
 }
 EXPORT_SYMBOL_GPL(hash_page);
 
-long do_hash_fault(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_RET(do_hash_fault)
 {
 	unsigned long ea = regs->dar;
 	unsigned long dsisr = regs->dsisr;
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 21832a2f15d7..fdbae002339e 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -10,6 +10,7 @@
  */
 
 #include <asm/asm-prototypes.h>
+#include <asm/interrupt.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
 #include <asm/paca.h>
@@ -837,7 +838,7 @@ static long slb_allocate_user(struct mm_struct *mm, unsigned long ea)
 	return slb_insert_entry(ea, context, flags, ssize, false);
 }
 
-long do_slb_fault(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_RAW(do_slb_fault)
 {
 	unsigned long ea = regs->dar;
 	unsigned long id = get_region_id(ea);
@@ -890,7 +891,7 @@ long do_slb_fault(struct pt_regs *regs)
 	}
 }
 
-void do_bad_slb_fault(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(do_bad_slb_fault)
 {
 	int err = regs->result;
 
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 826f84311ae9..7d63b5512068 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -34,6 +34,7 @@
 #include <linux/uaccess.h>
 
 #include <asm/firmware.h>
+#include <asm/interrupt.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
@@ -547,7 +548,7 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 }
 NOKPROBE_SYMBOL(__do_page_fault);
 
-long do_page_fault(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
 {
 	enum ctx_state prev_state = exception_enter();
 	unsigned long address = regs->dar;
@@ -654,3 +655,10 @@ void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
 
 	die("Kernel access of bad area", regs, sig);
 }
+
+#ifdef CONFIG_PPC_BOOK3S_64
+DEFINE_INTERRUPT_HANDLER(do_bad_page_fault)
+{
+	bad_page_fault(regs, regs->dar, SIGSEGV);
+}
+#endif
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 77513a80cef9..fef30a0da30b 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -14,6 +14,7 @@
 
 #include <asm/asm-prototypes.h>
 #include <asm/firmware.h>
+#include <asm/interrupt.h>
 #include <asm/machdep.h>
 #include <asm/opal.h>
 #include <asm/cputhreads.h>
-- 
2.23.0

