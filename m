Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 762D52F830E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 18:55:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHTNq63tszDsnF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 04:55:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=djhc3GLk; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHRzZ0BP4zDshH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 03:51:54 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id g15so6347525pgu.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 08:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ho2TfR44o6HfcAoLS5saSG4hD71g/lU/B7WRXEy6AQg=;
 b=djhc3GLk+JOPAQcaZLyDIBypcMFeI0sa02jtHZcM55+XP0pVuNlbW/Xz/oX5Qg2CxK
 RqlJEVNozTRwDAD4fkCGRUqfMv9aEZbQ0T5A1hMrErgaEZgGlZbd4nwgATnR3YakZaFe
 vpil/GHDhX5I+5j+U+TKvBsOk98cg4SfhKzaxVMEZ2Vq4H61F+3pjjG59y9/KP9opDu8
 8xrwPHk5QhX+taQo6uPCQKG3G7LJOav7fpeYGyDq+rYFbKOYzLhnlv3GmX/T6CExO9MH
 gEIg2CConGypConUuvOgrxjLjuYqnAtx0wo8WW5rYs2W/PeYxL02Ggv2Pi4VRZjsAMeG
 sR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ho2TfR44o6HfcAoLS5saSG4hD71g/lU/B7WRXEy6AQg=;
 b=VurXw3k4YSD4Ug70wjMVzWOYLa0+bIy8lAi1gENExU3mWpZ7ksYVouU15TG4zLuiLh
 Y/+aHcrr+vwkHZHnraZok5NhHS2HHXy9WsJ3q+fLK/7s0MiMFHMT/gBz6AZsoFUSwb6U
 5SRU7d6ZW0Crs8m2FrbRpnhH2wRno6h2wE21WSYt/rtxNuiB9O6NAKgC6cHH93X5wvwO
 1LLzxwt5sOUfvLZ69ljg9v4SQyvyYzd2dzuKlq+xX67TuDs/AM+U7sUB0NKHCrhT+2Gu
 8lnglqZUe1xyIeIzSPE5GSorvm9sORztbtrHpO8wZwM+IMj+l4I4waj+tf4UTf2AWZUa
 9N2Q==
X-Gm-Message-State: AOAM531cI7O52lkXmHGfhXgD/L369KejC2mjCh7GyY6WxXmNHoIks6JL
 TNmQOdtrx35ldQi9fx7XTxhKQwm06JU=
X-Google-Smtp-Source: ABdhPJwyaUzgjYy50PgFAcm1mP8DpED+JV2ebb1mz+voDsuJKV86VqYVsa64IJ4xggIy4EMjM/jGzA==
X-Received: by 2002:a63:fb54:: with SMTP id w20mr13306984pgj.419.1610729511229; 
 Fri, 15 Jan 2021 08:51:51 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id u1sm8455477pjr.51.2021.01.15.08.51.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 08:51:50 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 25/39] powerpc: convert interrupt handlers to use wrappers
Date: Sat, 16 Jan 2021 02:49:58 +1000
Message-Id: <20210115165012.1260253-26-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h     | 29 -------
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |  1 -
 arch/powerpc/include/asm/debug.h              |  3 -
 arch/powerpc/include/asm/hw_irq.h             |  9 --
 arch/powerpc/include/asm/interrupt.h          | 66 +++++++++++++++
 arch/powerpc/kernel/dbell.c                   |  6 +-
 arch/powerpc/kernel/irq.c                     |  3 +-
 arch/powerpc/kernel/mce.c                     |  5 +-
 arch/powerpc/kernel/process.c                 |  3 +-
 arch/powerpc/kernel/syscall_64.c              |  1 +
 arch/powerpc/kernel/tau_6xx.c                 |  2 +-
 arch/powerpc/kernel/time.c                    |  3 +-
 arch/powerpc/kernel/traps.c                   | 84 +++++++++++--------
 arch/powerpc/kernel/watchdog.c                |  7 +-
 arch/powerpc/kvm/book3s_hv.c                  |  1 +
 arch/powerpc/kvm/book3s_hv_builtin.c          |  1 +
 arch/powerpc/kvm/booke.c                      |  1 +
 arch/powerpc/mm/book3s64/hash_utils.c         | 11 ++-
 arch/powerpc/mm/book3s64/slb.c                |  7 +-
 arch/powerpc/mm/fault.c                       |  5 +-
 arch/powerpc/platforms/cell/ras.c             |  6 +-
 arch/powerpc/platforms/cell/ras.h             |  9 +-
 arch/powerpc/platforms/powernv/idle.c         |  1 +
 23 files changed, 164 insertions(+), 100 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 22c9d08fa3a4..939f3c94c8f3 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -56,35 +56,6 @@ int exit_vmx_usercopy(void);
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
-void stack_overflow_exception(struct pt_regs *regs);
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
diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index b9968e297da2..066b1d34c7bc 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -454,7 +454,6 @@ static inline unsigned long hpt_hash(unsigned long vpn,
 #define HPTE_NOHPTE_UPDATE	0x2
 #define HPTE_USE_KERNEL_KEY	0x4
 
-long do_hash_fault(struct pt_regs *regs);
 extern int __hash_page_4K(unsigned long ea, unsigned long access,
 			  unsigned long vsid, pte_t *ptep, unsigned long trap,
 			  unsigned long flags, int ssize, int subpage_prot);
diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/debug.h
index 0550eceab3ca..86a14736c76c 100644
--- a/arch/powerpc/include/asm/debug.h
+++ b/arch/powerpc/include/asm/debug.h
@@ -50,9 +50,6 @@ bool ppc_breakpoint_available(void);
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
 extern void do_send_trap(struct pt_regs *regs, unsigned long address,
 			 unsigned long error_code, int brkpt);
-#else
-
-void do_break(struct pt_regs *regs);
 #endif
 
 #endif /* _ASM_POWERPC_DEBUG_H */
diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 75c2b137fc00..614957f74cee 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -50,15 +50,6 @@
 
 #ifndef __ASSEMBLY__
 
-extern void replay_system_reset(void);
-extern void replay_soft_interrupts(void);
-
-extern void timer_interrupt(struct pt_regs *);
-extern void performance_monitor_exception(struct pt_regs *regs);
-extern void WatchdogException(struct pt_regs *regs);
-extern void unknown_exception(struct pt_regs *regs);
-void unknown_async_exception(struct pt_regs *regs);
-
 #ifdef CONFIG_PPC64
 #include <asm/paca.h>
 
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 3df1921cfda3..4ffbd3d75324 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -232,4 +232,70 @@ __visible noinstr long func(struct pt_regs *regs)			\
 									\
 static __always_inline long ____##func(struct pt_regs *regs)
 
+
+/* Interrupt handlers */
+/* kernel/traps.c */
+DECLARE_INTERRUPT_HANDLER_NMI(system_reset_exception);
+#ifdef CONFIG_PPC_BOOK3S_64
+DECLARE_INTERRUPT_HANDLER_ASYNC(machine_check_exception);
+#else
+DECLARE_INTERRUPT_HANDLER_NMI(machine_check_exception);
+#endif
+DECLARE_INTERRUPT_HANDLER(SMIException);
+DECLARE_INTERRUPT_HANDLER(handle_hmi_exception);
+DECLARE_INTERRUPT_HANDLER(unknown_exception);
+DECLARE_INTERRUPT_HANDLER_ASYNC(unknown_async_exception);
+DECLARE_INTERRUPT_HANDLER(instruction_breakpoint_exception);
+DECLARE_INTERRUPT_HANDLER(RunModeException);
+DECLARE_INTERRUPT_HANDLER(single_step_exception);
+DECLARE_INTERRUPT_HANDLER(program_check_exception);
+DECLARE_INTERRUPT_HANDLER(emulation_assist_interrupt);
+DECLARE_INTERRUPT_HANDLER(alignment_exception);
+DECLARE_INTERRUPT_HANDLER(StackOverflow);
+DECLARE_INTERRUPT_HANDLER(stack_overflow_exception);
+DECLARE_INTERRUPT_HANDLER(kernel_fp_unavailable_exception);
+DECLARE_INTERRUPT_HANDLER(altivec_unavailable_exception);
+DECLARE_INTERRUPT_HANDLER(vsx_unavailable_exception);
+DECLARE_INTERRUPT_HANDLER(facility_unavailable_exception);
+DECLARE_INTERRUPT_HANDLER(fp_unavailable_tm);
+DECLARE_INTERRUPT_HANDLER(altivec_unavailable_tm);
+DECLARE_INTERRUPT_HANDLER(vsx_unavailable_tm);
+DECLARE_INTERRUPT_HANDLER_NMI(performance_monitor_exception_nmi);
+DECLARE_INTERRUPT_HANDLER_ASYNC(performance_monitor_exception_async);
+DECLARE_INTERRUPT_HANDLER_RAW(performance_monitor_exception);
+DECLARE_INTERRUPT_HANDLER(DebugException);
+DECLARE_INTERRUPT_HANDLER(altivec_assist_exception);
+DECLARE_INTERRUPT_HANDLER(CacheLockingException);
+DECLARE_INTERRUPT_HANDLER(SPEFloatingPointException);
+DECLARE_INTERRUPT_HANDLER(SPEFloatingPointRoundException);
+DECLARE_INTERRUPT_HANDLER(unrecoverable_exception);
+DECLARE_INTERRUPT_HANDLER(WatchdogException);
+DECLARE_INTERRUPT_HANDLER(kernel_bad_stack);
+
+/* slb.c */
+DECLARE_INTERRUPT_HANDLER_RAW(do_slb_fault);
+DECLARE_INTERRUPT_HANDLER(do_bad_slb_fault);
+
+/* hash_utils.c */
+DECLARE_INTERRUPT_HANDLER_RAW(do_hash_fault);
+
+/* fault.c */
+DECLARE_INTERRUPT_HANDLER_RET(do_page_fault);
+DECLARE_INTERRUPT_HANDLER(do_bad_page_fault_segv);
+
+/* process.c */
+DECLARE_INTERRUPT_HANDLER(do_break);
+
+/* time.c */
+DECLARE_INTERRUPT_HANDLER_ASYNC(timer_interrupt);
+
+/* mce.c */
+DECLARE_INTERRUPT_HANDLER_NMI(machine_check_early);
+DECLARE_INTERRUPT_HANDLER_NMI(hmi_exception_realmode);
+
+DECLARE_INTERRUPT_HANDLER_ASYNC(TAUException);
+
+void replay_system_reset(void);
+void replay_soft_interrupts(void);
+
 #endif /* _ASM_POWERPC_INTERRUPT_H */
diff --git a/arch/powerpc/kernel/dbell.c b/arch/powerpc/kernel/dbell.c
index 52680cf07c9d..6a7ecfca5c3b 100644
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
 
@@ -39,9 +40,8 @@ void doorbell_exception(struct pt_regs *regs)
 	set_irq_regs(old_regs);
 }
 #else /* CONFIG_SMP */
-void doorbell_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_ASYNC(doorbell_exception)
 {
 	printk(KERN_WARNING "Received doorbell on non-smp system\n");
 }
 #endif /* CONFIG_SMP */
-
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 6b1eca53e36c..2055d204d08e 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -54,6 +54,7 @@
 #include <linux/pgtable.h>
 
 #include <linux/uaccess.h>
+#include <asm/interrupt.h>
 #include <asm/io.h>
 #include <asm/irq.h>
 #include <asm/cache.h>
@@ -665,7 +666,7 @@ void __do_irq(struct pt_regs *regs)
 	irq_exit();
 }
 
-void do_IRQ(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_ASYNC(do_IRQ)
 {
 	struct pt_regs *old_regs = set_irq_regs(regs);
 	void *cursp, *irqsp, *sirqsp;
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 9f3e133b57b7..54269947113d 100644
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
 	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
@@ -722,7 +723,7 @@ long hmi_handle_debugtrig(struct pt_regs *regs)
 /*
  * Return values:
  */
-long hmi_exception_realmode(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_NMI(hmi_exception_realmode)
 {	
 	int ret;
 
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 4f0f81e9420b..8520ed5ae144 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -41,6 +41,7 @@
 #include <linux/pkeys.h>
 #include <linux/seq_buf.h>
 
+#include <asm/interrupt.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 #include <asm/mmu.h>
@@ -659,7 +660,7 @@ static void do_break_handler(struct pt_regs *regs)
 	}
 }
 
-void do_break(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(do_break)
 {
 	current->thread.trap_nr = TRAP_HWBKPT;
 	if (notify_die(DIE_DABR_MATCH, "dabr_match", regs, regs->dsisr,
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 7c85ed04a164..dd87b2118620 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -5,6 +5,7 @@
 #include <asm/kup.h>
 #include <asm/cputime.h>
 #include <asm/hw_irq.h>
+#include <asm/interrupt.h>
 #include <asm/kprobes.h>
 #include <asm/paca.h>
 #include <asm/ptrace.h>
diff --git a/arch/powerpc/kernel/tau_6xx.c b/arch/powerpc/kernel/tau_6xx.c
index 0b4694b8d248..46b2e5de4ef5 100644
--- a/arch/powerpc/kernel/tau_6xx.c
+++ b/arch/powerpc/kernel/tau_6xx.c
@@ -100,7 +100,7 @@ static void TAUupdate(int cpu)
  * with interrupts disabled
  */
 
-void TAUException(struct pt_regs * regs)
+DEFINE_INTERRUPT_HANDLER_ASYNC(TAUException)
 {
 	int cpu = smp_processor_id();
 
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 67feb3524460..435a251247ed 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -56,6 +56,7 @@
 #include <linux/processor.h>
 #include <asm/trace.h>
 
+#include <asm/interrupt.h>
 #include <asm/io.h>
 #include <asm/nvram.h>
 #include <asm/cache.h>
@@ -570,7 +571,7 @@ void arch_irq_work_raise(void)
  * timer_interrupt - gets called when the decrementer overflows,
  * with interrupts disabled.
  */
-void timer_interrupt(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 {
 	struct clock_event_device *evt = this_cpu_ptr(&decrementers);
 	u64 *next_tb = this_cpu_ptr(&decrementers_next_tb);
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index f70d3f6174c8..b000956cde3f 100644
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
@@ -430,8 +431,7 @@ void hv_nmi_check_nonrecoverable(struct pt_regs *regs)
 	regs->msr &= ~MSR_RI;
 #endif
 }
-
-void system_reset_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
 {
 	unsigned long hsrr0, hsrr1;
 	bool saved_hsrrs = false;
@@ -519,6 +519,8 @@ void system_reset_exception(struct pt_regs *regs)
 	this_cpu_set_ftrace_enabled(ftrace_enabled);
 
 	/* What should we do here? We could issue a shutdown or hard reset. */
+
+	return 0;
 }
 NOKPROBE_SYMBOL(system_reset_exception);
 
@@ -805,7 +807,11 @@ void die_mce(const char *str, struct pt_regs *regs, long err)
 }
 NOKPROBE_SYMBOL(die_mce);
 
-void machine_check_exception(struct pt_regs *regs)
+#ifdef CONFIG_PPC_BOOK3S_64
+DEFINE_INTERRUPT_HANDLER_ASYNC(machine_check_exception)
+#else
+DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
+#endif
 {
 	int recover = 0;
 
@@ -855,10 +861,16 @@ void machine_check_exception(struct pt_regs *regs)
 		die_mce("Unrecoverable Machine check", regs, SIGBUS);
 
 	if (nmi) nmi_exit();
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	return;
+#else
+	return 0;
+#endif
 }
 NOKPROBE_SYMBOL(machine_check_exception);
 
-void SMIException(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(SMIException) /* async? */
 {
 	die("System Management Interrupt", regs, SIGABRT);
 }
@@ -1044,7 +1056,7 @@ static void p9_hmi_special_emu(struct pt_regs *regs)
 }
 #endif /* CONFIG_VSX */
 
-void handle_hmi_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_ASYNC(handle_hmi_exception)
 {
 	struct pt_regs *old_regs;
 
@@ -1073,7 +1085,7 @@ void handle_hmi_exception(struct pt_regs *regs)
 	set_irq_regs(old_regs);
 }
 
-void unknown_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(unknown_exception)
 {
 	enum ctx_state prev_state = exception_enter();
 
@@ -1085,7 +1097,7 @@ void unknown_exception(struct pt_regs *regs)
 	exception_exit(prev_state);
 }
 
-void unknown_async_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_ASYNC(unknown_async_exception)
 {
 	enum ctx_state prev_state = exception_enter();
 
@@ -1097,7 +1109,7 @@ void unknown_async_exception(struct pt_regs *regs)
 	exception_exit(prev_state);
 }
 
-void instruction_breakpoint_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(instruction_breakpoint_exception)
 {
 	enum ctx_state prev_state = exception_enter();
 
@@ -1112,12 +1124,12 @@ void instruction_breakpoint_exception(struct pt_regs *regs)
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
 
@@ -1462,7 +1474,7 @@ static int emulate_math(struct pt_regs *regs)
 static inline int emulate_math(struct pt_regs *regs) { return -1; }
 #endif
 
-void program_check_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(program_check_exception)
 {
 	enum ctx_state prev_state = exception_enter();
 	unsigned int reason = get_reason(regs);
@@ -1587,14 +1599,14 @@ NOKPROBE_SYMBOL(program_check_exception);
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
@@ -1644,7 +1656,7 @@ void alignment_exception(struct pt_regs *regs)
 	exception_exit(prev_state);
 }
 
-void StackOverflow(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(StackOverflow)
 {
 	pr_crit("Kernel stack overflow in process %s[%d], r1=%lx\n",
 		current->comm, task_pid_nr(current), regs->gpr[1]);
@@ -1653,7 +1665,7 @@ void StackOverflow(struct pt_regs *regs)
 	panic("kernel stack overflow");
 }
 
-void stack_overflow_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(stack_overflow_exception)
 {
 	enum ctx_state prev_state = exception_enter();
 
@@ -1662,7 +1674,7 @@ void stack_overflow_exception(struct pt_regs *regs)
 	exception_exit(prev_state);
 }
 
-void kernel_fp_unavailable_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(kernel_fp_unavailable_exception)
 {
 	enum ctx_state prev_state = exception_enter();
 
@@ -1673,7 +1685,7 @@ void kernel_fp_unavailable_exception(struct pt_regs *regs)
 	exception_exit(prev_state);
 }
 
-void altivec_unavailable_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(altivec_unavailable_exception)
 {
 	enum ctx_state prev_state = exception_enter();
 
@@ -1692,7 +1704,7 @@ void altivec_unavailable_exception(struct pt_regs *regs)
 	exception_exit(prev_state);
 }
 
-void vsx_unavailable_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(vsx_unavailable_exception)
 {
 	if (user_mode(regs)) {
 		/* A user program has executed an vsx instruction,
@@ -1723,7 +1735,7 @@ static void tm_unavailable(struct pt_regs *regs)
 	die("Unrecoverable TM Unavailable Exception", regs, SIGABRT);
 }
 
-void facility_unavailable_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(facility_unavailable_exception)
 {
 	static char *facility_strings[] = {
 		[FSCR_FP_LG] = "FPU",
@@ -1843,7 +1855,7 @@ void facility_unavailable_exception(struct pt_regs *regs)
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 
-void fp_unavailable_tm(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(fp_unavailable_tm)
 {
 	/* Note:  This does not handle any kind of FP laziness. */
 
@@ -1876,7 +1888,7 @@ void fp_unavailable_tm(struct pt_regs *regs)
 	tm_recheckpoint(&current->thread);
 }
 
-void altivec_unavailable_tm(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(altivec_unavailable_tm)
 {
 	/* See the comments in fp_unavailable_tm().  This function operates
 	 * the same way.
@@ -1891,7 +1903,7 @@ void altivec_unavailable_tm(struct pt_regs *regs)
 	current->thread.used_vr = 1;
 }
 
-void vsx_unavailable_tm(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(vsx_unavailable_tm)
 {
 	/* See the comments in fp_unavailable_tm().  This works similarly,
 	 * though we're loading both FP and VEC registers in here.
@@ -1916,7 +1928,8 @@ void vsx_unavailable_tm(struct pt_regs *regs)
 }
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
-static void performance_monitor_exception_nmi(struct pt_regs *regs)
+#ifdef CONFIG_PPC64
+DEFINE_INTERRUPT_HANDLER_NMI(performance_monitor_exception_nmi)
 {
 	nmi_enter();
 
@@ -1925,9 +1938,12 @@ static void performance_monitor_exception_nmi(struct pt_regs *regs)
 	perf_irq(regs);
 
 	nmi_exit();
+
+	return 0;
 }
+#endif
 
-static void performance_monitor_exception_async(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_ASYNC(performance_monitor_exception_async)
 {
 	irq_enter();
 
@@ -1938,7 +1954,7 @@ static void performance_monitor_exception_async(struct pt_regs *regs)
 	irq_exit();
 }
 
-void performance_monitor_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_RAW(performance_monitor_exception)
 {
 	/*
 	 * On 64-bit, if perf interrupts hit in a local_irq_disable
@@ -1950,6 +1966,8 @@ void performance_monitor_exception(struct pt_regs *regs)
 		performance_monitor_exception_nmi(regs);
 	else
 		performance_monitor_exception_async(regs);
+
+	return 0;
 }
 
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
@@ -2012,7 +2030,7 @@ static void handle_debug(struct pt_regs *regs, unsigned long debug_status)
 		mtspr(SPRN_DBCR0, current->thread.debug.dbcr0);
 }
 
-void DebugException(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(DebugException)
 {
 	unsigned long debug_status = regs->dsisr;
 
@@ -2085,7 +2103,7 @@ NOKPROBE_SYMBOL(DebugException);
 #endif /* CONFIG_PPC_ADV_DEBUG_REGS */
 
 #ifdef CONFIG_ALTIVEC
-void altivec_assist_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(altivec_assist_exception)
 {
 	int err;
 
@@ -2119,7 +2137,7 @@ void altivec_assist_exception(struct pt_regs *regs)
 #endif /* CONFIG_ALTIVEC */
 
 #ifdef CONFIG_FSL_BOOKE
-void CacheLockingException(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(CacheLockingException)
 {
 	unsigned long error_code = regs->dsisr;
 
@@ -2134,7 +2152,7 @@ void CacheLockingException(struct pt_regs *regs)
 #endif /* CONFIG_FSL_BOOKE */
 
 #ifdef CONFIG_SPE
-void SPEFloatingPointException(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(SPEFloatingPointException)
 {
 	extern int do_spe_mathemu(struct pt_regs *regs);
 	unsigned long spefscr;
@@ -2186,7 +2204,7 @@ void SPEFloatingPointException(struct pt_regs *regs)
 	return;
 }
 
-void SPEFloatingPointRoundException(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(SPEFloatingPointRoundException)
 {
 	extern int speround_handler(struct pt_regs *regs);
 	int err;
@@ -2228,7 +2246,7 @@ void SPEFloatingPointRoundException(struct pt_regs *regs)
  * in the MSR is 0.  This indicates that SRR0/1 are live, and that
  * we therefore lost state by taking this exception.
  */
-void unrecoverable_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(unrecoverable_exception)
 {
 	pr_emerg("Unrecoverable exception %lx at %lx (msr=%lx)\n",
 		 regs->trap, regs->nip, regs->msr);
@@ -2248,7 +2266,7 @@ void __attribute__ ((weak)) WatchdogHandler(struct pt_regs *regs)
 	return;
 }
 
-void WatchdogException(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(WatchdogException) /* XXX NMI? async? */
 {
 	printk (KERN_EMERG "PowerPC Book-E Watchdog Exception\n");
 	WatchdogHandler(regs);
@@ -2259,7 +2277,7 @@ void WatchdogException(struct pt_regs *regs)
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
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index d348e77cee20..43e64e60ee33 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -53,6 +53,7 @@
 #include <asm/cputable.h>
 #include <asm/cacheflush.h>
 #include <linux/uaccess.h>
+#include <asm/interrupt.h>
 #include <asm/io.h>
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s.h>
diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 8053efdf7ea7..10fc274bea65 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -17,6 +17,7 @@
 
 #include <asm/asm-prototypes.h>
 #include <asm/cputable.h>
+#include <asm/interrupt.h>
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s.h>
 #include <asm/archrandom.h>
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 288a9820ec01..bd2bb73021d8 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -20,6 +20,7 @@
 
 #include <asm/cputable.h>
 #include <linux/uaccess.h>
+#include <asm/interrupt.h>
 #include <asm/kvm_ppc.h>
 #include <asm/cacheflush.h>
 #include <asm/dbell.h>
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index d7d3a80a51d4..824fcb2627e4 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -38,6 +38,7 @@
 #include <linux/pgtable.h>
 
 #include <asm/debugfs.h>
+#include <asm/interrupt.h>
 #include <asm/processor.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
@@ -1512,7 +1513,7 @@ int hash_page(unsigned long ea, unsigned long access, unsigned long trap,
 }
 EXPORT_SYMBOL_GPL(hash_page);
 
-static long __do_hash_fault(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
 {
 	unsigned long ea = regs->dar;
 	unsigned long dsisr = regs->dsisr;
@@ -1565,7 +1566,11 @@ static long __do_hash_fault(struct pt_regs *regs)
 	return err;
 }
 
-long do_hash_fault(struct pt_regs *regs)
+/*
+ * The _RAW interrupt entry checks for the in_nmi() case before
+ * running the full handler.
+ */
+DEFINE_INTERRUPT_HANDLER_RAW(do_hash_fault)
 {
 	unsigned long dsisr = regs->dsisr;
 	long err;
@@ -1587,7 +1592,7 @@ long do_hash_fault(struct pt_regs *regs)
 	 * the access, or panic if there isn't a handler.
 	 */
 	if (unlikely(in_nmi())) {
-		bad_page_fault(regs, SIGSEGV);
+		do_bad_page_fault_segv(regs);
 		return 0;
 	}
 
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 14c62b685f0c..c91bd85eb90e 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -10,6 +10,7 @@
  */
 
 #include <asm/asm-prototypes.h>
+#include <asm/interrupt.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
 #include <asm/paca.h>
@@ -813,7 +814,7 @@ static long slb_allocate_user(struct mm_struct *mm, unsigned long ea)
 	return slb_insert_entry(ea, context, flags, ssize, false);
 }
 
-long do_slb_fault(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_RAW(do_slb_fault)
 {
 	unsigned long ea = regs->dar;
 	unsigned long id = get_region_id(ea);
@@ -833,7 +834,7 @@ long do_slb_fault(struct pt_regs *regs)
 	 */
 
 	/*
-	 * The interrupt state is not reconciled, for performance, so that
+	 * This is a raw interrupt handler, for performance, so that
 	 * fast_interrupt_return can be used. The handler must not touch local
 	 * irq state, or schedule. We could test for usermode and upgrade to a
 	 * normal process context (synchronous) interrupt for those, which
@@ -868,7 +869,7 @@ long do_slb_fault(struct pt_regs *regs)
 	}
 }
 
-void do_bad_slb_fault(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(do_bad_slb_fault)
 {
 	int err = regs->result;
 
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 900901d0038e..b84794d53664 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -34,6 +34,7 @@
 #include <linux/uaccess.h>
 
 #include <asm/firmware.h>
+#include <asm/interrupt.h>
 #include <asm/page.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
@@ -540,7 +541,7 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 }
 NOKPROBE_SYMBOL(__do_page_fault);
 
-long do_page_fault(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
 {
 	enum ctx_state prev_state;
 	long err;
@@ -623,7 +624,7 @@ void bad_page_fault(struct pt_regs *regs, int sig)
 }
 
 #ifdef CONFIG_PPC_BOOK3S_64
-void do_bad_page_fault_segv(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(do_bad_page_fault_segv)
 {
 	bad_page_fault(regs, SIGSEGV);
 }
diff --git a/arch/powerpc/platforms/cell/ras.c b/arch/powerpc/platforms/cell/ras.c
index 6ea480539419..4325c05bedd9 100644
--- a/arch/powerpc/platforms/cell/ras.c
+++ b/arch/powerpc/platforms/cell/ras.c
@@ -49,7 +49,7 @@ static void dump_fir(int cpu)
 
 }
 
-void cbe_system_error_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(cbe_system_error_exception)
 {
 	int cpu = smp_processor_id();
 
@@ -58,7 +58,7 @@ void cbe_system_error_exception(struct pt_regs *regs)
 	dump_stack();
 }
 
-void cbe_maintenance_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(cbe_maintenance_exception)
 {
 	int cpu = smp_processor_id();
 
@@ -70,7 +70,7 @@ void cbe_maintenance_exception(struct pt_regs *regs)
 	dump_stack();
 }
 
-void cbe_thermal_exception(struct pt_regs *regs)
+DEFINE_INTERRUPT_HANDLER(cbe_thermal_exception)
 {
 	int cpu = smp_processor_id();
 
diff --git a/arch/powerpc/platforms/cell/ras.h b/arch/powerpc/platforms/cell/ras.h
index 6c2e6bc0062e..226dbd48efad 100644
--- a/arch/powerpc/platforms/cell/ras.h
+++ b/arch/powerpc/platforms/cell/ras.h
@@ -2,9 +2,12 @@
 #ifndef RAS_H
 #define RAS_H
 
-extern void cbe_system_error_exception(struct pt_regs *regs);
-extern void cbe_maintenance_exception(struct pt_regs *regs);
-extern void cbe_thermal_exception(struct pt_regs *regs);
+#include <asm/interrupt.h>
+
+DECLARE_INTERRUPT_HANDLER(cbe_system_error_exception);
+DECLARE_INTERRUPT_HANDLER(cbe_maintenance_exception);
+DECLARE_INTERRUPT_HANDLER(cbe_thermal_exception);
+
 extern void cbe_ras_init(void);
 
 #endif /* RAS_H */
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index e6f461812856..999997d9e9a9 100644
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

