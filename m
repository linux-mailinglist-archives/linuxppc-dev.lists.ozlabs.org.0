Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F7B16EE4E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 19:47:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RnxR2Pz3zDq61
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:47:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TTMnWOqW; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RmSF4mpzzDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 04:41:01 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id d6so7229442pgn.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 09:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5yIFVHWN7TQA+aRF1WdPWjJCPHqMzA/zypIaK4o8Cb8=;
 b=TTMnWOqWCuMiICVL25zSJi4TfbwDPjE4RHCkTfrSO4ykeeSyHJPlHatiw/heCJmZzB
 kquD/ohsRfq1iWHnb2pvFUoI3GvA0BOUfWwE5tPUsr8CSGuRKLJvH+xP0FQkYIne52Fd
 OL1sPYbXiv2wb3CfJlQvX2fHpAn8idWZzscARe4wVGnYjAxWx9OjR8ingoBiDCjO4WBH
 m2/hzqxThzk9x9RPkWBYdui5LgeKsdPst8AXutlrkgP2J0JWsgPP2jt+utJX9EjL+ieL
 0swzOvxzxuLilN1Jl+R8zHHxWj01EPmYARs9WIil04OiPOsmNS+0fPcJ+SlIgHzRi0wo
 mCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5yIFVHWN7TQA+aRF1WdPWjJCPHqMzA/zypIaK4o8Cb8=;
 b=T4cv+n6PCIRFCv+4UVTdmgATcmgKwP5aSO2nFJw3NbH3rW5MTyyjzK+krCGCHjiWna
 NUqfII8cXai6E9S/souazVtg9jLRFcigHLGF9uSrjeQKhx/80oFdyOKgoG1G66/k4yaW
 i76aXR/XSMIfOkSltgJ2a7HpfweaKZYMm1OT0SRal1GsCPZqzqsyZMLTVy9MaFCldJ5b
 7obTvEIsr1l462zOxVhAt/bdWraqEs6H3a3LxU7r0UojuHBxeUQSYega5tMkpBoa8KyA
 svYsvzbIhhTaIsG75l+nrFxFNXPWY5W/u59Aq+qUgMAGm0brwe4wvGZbzPjttnGQ+PiY
 M0jQ==
X-Gm-Message-State: APjAAAX3dP4sJ87K+WGHkn/xOuJnWJ6kTvZo4ZbV2TQmdpJSszzjMFYX
 xxNOMGMXGMsEWGNqYVxE3bNwyGWj
X-Google-Smtp-Source: APXvYqyidp/4KZrHm8a2SD4+S1DToxgmLu3fK9rW4/X2vUypufJQaUqZwyRgYVzra0v83sOg1Kc2dA==
X-Received: by 2002:a65:6901:: with SMTP id s1mr2909228pgq.446.1582652455693; 
 Tue, 25 Feb 2020 09:40:55 -0800 (PST)
Received: from bobo.ibm.com ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id z63sm14791480pgd.12.2020.02.25.09.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:40:55 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 25/32] powerpc/64: system call implement entry/exit logic
 in C
Date: Wed, 26 Feb 2020 03:35:34 +1000
Message-Id: <20200225173541.1549955-26-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225173541.1549955-1-npiggin@gmail.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

System call entry and particularly exit code is beyond the limit of what
is reasonable to implement in asm.

This conversion moves all conditional branches out of the asm code,
except for the case that all GPRs should be restored at exit.

Null syscall test is about 5% faster after this patch, because the exit
work is handled under local_irq_disable, and the hard mask and pending
interrupt replay is handled after that, which avoids games with MSR.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---

v2,rebase (from Michal):
- Add endian conversion for dtl_idx (ms)
- Fix sparse warning about missing declaration (ms)
- Add unistd.h to fix some defconfigs, add SPDX, minor formatting (mpe)

v3: Fixes thanks to reports from mpe and selftests errors:
- Several soft-mask debug and unsafe smp_processor_id() warnings due to
  tracing and other false positives due to checks in "unreconciled" code.
- Fix a bug with syscall tracing functions that set registers (e.g.,
  PTRACE_SETREG) not setting GPRs properly.
- Fix silly tabort_syscall bug that causes kernel crashes when making system
  calls in transactional state.

 arch/powerpc/include/asm/asm-prototypes.h     |  17 +-
 .../powerpc/include/asm/book3s/64/kup-radix.h |  14 +-
 arch/powerpc/include/asm/cputime.h            |  29 ++
 arch/powerpc/include/asm/hw_irq.h             |   4 +
 arch/powerpc/include/asm/ptrace.h             |   3 +
 arch/powerpc/include/asm/signal.h             |   3 +
 arch/powerpc/include/asm/switch_to.h          |   5 +
 arch/powerpc/include/asm/time.h               |   3 +
 arch/powerpc/kernel/Makefile                  |   3 +-
 arch/powerpc/kernel/entry_64.S                | 338 +++---------------
 arch/powerpc/kernel/signal.h                  |   2 -
 arch/powerpc/kernel/syscall_64.c              | 213 +++++++++++
 arch/powerpc/kernel/systbl.S                  |   9 +-
 13 files changed, 328 insertions(+), 315 deletions(-)
 create mode 100644 arch/powerpc/kernel/syscall_64.c

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 983c0084fb3f..4b3609554e76 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -97,6 +97,12 @@ ppc_select(int n, fd_set __user *inp, fd_set __user *outp, fd_set __user *exp,
 unsigned long __init early_init(unsigned long dt_ptr);
 void __init machine_init(u64 dt_ptr);
 #endif
+#ifdef CONFIG_PPC64
+long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs);
+notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs);
+notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr);
+notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr);
+#endif
 
 long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
 		      u32 len_high, u32 len_low);
@@ -104,14 +110,6 @@ long sys_switch_endian(void);
 notrace unsigned int __check_irq_replay(void);
 void notrace restore_interrupts(void);
 
-/* ptrace */
-long do_syscall_trace_enter(struct pt_regs *regs);
-void do_syscall_trace_leave(struct pt_regs *regs);
-
-/* process */
-void restore_math(struct pt_regs *regs);
-void restore_tm_state(struct pt_regs *regs);
-
 /* prom_init (OpenFirmware) */
 unsigned long __init prom_init(unsigned long r3, unsigned long r4,
 			       unsigned long pp,
@@ -122,9 +120,6 @@ unsigned long __init prom_init(unsigned long r3, unsigned long r4,
 void __init early_setup(unsigned long dt_ptr);
 void early_setup_secondary(void);
 
-/* time */
-void accumulate_stolen_time(void);
-
 /* misc runtime */
 extern u64 __bswapdi2(u64);
 extern s64 __lshrdi3(s64, int);
diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
index 90dd3a3fc8c7..71081d90f999 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -3,6 +3,7 @@
 #define _ASM_POWERPC_BOOK3S_64_KUP_RADIX_H
 
 #include <linux/const.h>
+#include <asm/reg.h>
 
 #define AMR_KUAP_BLOCK_READ	UL(0x4000000000000000)
 #define AMR_KUAP_BLOCK_WRITE	UL(0x8000000000000000)
@@ -56,7 +57,14 @@
 
 #ifdef CONFIG_PPC_KUAP
 
-#include <asm/reg.h>
+#include <asm/mmu.h>
+#include <asm/ptrace.h>
+
+static inline void kuap_check_amr(void)
+{
+	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_RADIX_KUAP))
+		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
+}
 
 /*
  * We support individually allowing read or write, but we don't support nesting
@@ -127,6 +135,10 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
 		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
 }
+#else /* CONFIG_PPC_KUAP */
+static inline void kuap_check_amr(void)
+{
+}
 #endif /* CONFIG_PPC_KUAP */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/cputime.h
index 2431b4ada2fa..6639a6847cc0 100644
--- a/arch/powerpc/include/asm/cputime.h
+++ b/arch/powerpc/include/asm/cputime.h
@@ -44,6 +44,28 @@ static inline unsigned long cputime_to_usecs(const cputime_t ct)
 #ifdef CONFIG_PPC64
 #define get_accounting(tsk)	(&get_paca()->accounting)
 static inline void arch_vtime_task_switch(struct task_struct *tsk) { }
+
+/*
+ * account_cpu_user_entry/exit runs "unreconciled", so can't trace,
+ * can't use use get_paca()
+ */
+static notrace inline void account_cpu_user_entry(void)
+{
+	unsigned long tb = mftb();
+	struct cpu_accounting_data *acct = &local_paca->accounting;
+
+	acct->utime += (tb - acct->starttime_user);
+	acct->starttime = tb;
+}
+static notrace inline void account_cpu_user_exit(void)
+{
+	unsigned long tb = mftb();
+	struct cpu_accounting_data *acct = &local_paca->accounting;
+
+	acct->stime += (tb - acct->starttime);
+	acct->starttime_user = tb;
+}
+
 #else
 #define get_accounting(tsk)	(&task_thread_info(tsk)->accounting)
 /*
@@ -61,5 +83,12 @@ static inline void arch_vtime_task_switch(struct task_struct *prev)
 #endif
 
 #endif /* __KERNEL__ */
+#else /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
+static inline void account_cpu_user_entry(void)
+{
+}
+static inline void account_cpu_user_exit(void)
+{
+}
 #endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
 #endif /* __POWERPC_CPUTIME_H */
diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index e3a905e3d573..310583e62bd9 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -228,9 +228,13 @@ static inline bool arch_irqs_disabled(void)
 #ifdef CONFIG_PPC_BOOK3E
 #define __hard_irq_enable()	wrtee(MSR_EE)
 #define __hard_irq_disable()	wrtee(0)
+#define __hard_EE_RI_disable()	wrtee(0)
+#define __hard_RI_enable()	do { } while (0)
 #else
 #define __hard_irq_enable()	__mtmsrd(MSR_EE|MSR_RI, 1)
 #define __hard_irq_disable()	__mtmsrd(MSR_RI, 1)
+#define __hard_EE_RI_disable()	__mtmsrd(0, 1)
+#define __hard_RI_enable()	__mtmsrd(MSR_RI, 1)
 #endif
 
 #define hard_irq_disable()	do {					\
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index ee3ada66deb5..082a40153b94 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -138,6 +138,9 @@ extern unsigned long profile_pc(struct pt_regs *regs);
 #define profile_pc(regs) instruction_pointer(regs)
 #endif
 
+long do_syscall_trace_enter(struct pt_regs *regs);
+void do_syscall_trace_leave(struct pt_regs *regs);
+
 #define kernel_stack_pointer(regs) ((regs)->gpr[1])
 static inline int is_syscall_success(struct pt_regs *regs)
 {
diff --git a/arch/powerpc/include/asm/signal.h b/arch/powerpc/include/asm/signal.h
index 0803ca8b9149..99e1c6de27bc 100644
--- a/arch/powerpc/include/asm/signal.h
+++ b/arch/powerpc/include/asm/signal.h
@@ -6,4 +6,7 @@
 #include <uapi/asm/signal.h>
 #include <uapi/asm/ptrace.h>
 
+struct pt_regs;
+void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags);
+
 #endif /* _ASM_POWERPC_SIGNAL_H */
diff --git a/arch/powerpc/include/asm/switch_to.h b/arch/powerpc/include/asm/switch_to.h
index 5b03d8a82409..476008bc3d08 100644
--- a/arch/powerpc/include/asm/switch_to.h
+++ b/arch/powerpc/include/asm/switch_to.h
@@ -5,6 +5,7 @@
 #ifndef _ASM_POWERPC_SWITCH_TO_H
 #define _ASM_POWERPC_SWITCH_TO_H
 
+#include <linux/sched.h>
 #include <asm/reg.h>
 
 struct thread_struct;
@@ -22,6 +23,10 @@ extern void switch_booke_debug_regs(struct debug_reg *new_debug);
 
 extern int emulate_altivec(struct pt_regs *);
 
+void restore_math(struct pt_regs *regs);
+
+void restore_tm_state(struct pt_regs *regs);
+
 extern void flush_all_to_thread(struct task_struct *);
 extern void giveup_all(struct task_struct *);
 
diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index e0107495c4de..39ce95016a3a 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -194,5 +194,8 @@ DECLARE_PER_CPU(u64, decrementers_next_tb);
 /* Convert timebase ticks to nanoseconds */
 unsigned long long tb_to_ns(unsigned long long tb_ticks);
 
+/* SPLPAR */
+void accumulate_stolen_time(void);
+
 #endif /* __KERNEL__ */
 #endif /* __POWERPC_TIME_H */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 78a1b22d4fd8..5700231a8988 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -50,7 +50,8 @@ obj-y				:= cputable.o ptrace.o syscalls.o \
 				   of_platform.o prom_parse.o
 obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o \
 				   signal_64.o ptrace32.o \
-				   paca.o nvram_64.o firmware.o note.o
+				   paca.o nvram_64.o firmware.o note.o \
+				   syscall_64.o
 obj-$(CONFIG_VDSO32)		+= vdso32/
 obj-$(CONFIG_PPC_WATCHDOG)	+= watchdog.o
 obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 14afe12eae8c..7404290fa132 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -63,12 +63,7 @@ exception_marker:
 
 	.globl system_call_common
 system_call_common:
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-BEGIN_FTR_SECTION
-	extrdi.	r10, r12, 1, (63-MSR_TS_T_LG) /* transaction active? */
-	bne	.Ltabort_syscall
-END_FTR_SECTION_IFSET(CPU_FTR_TM)
-#endif
+_ASM_NOKPROBE_SYMBOL(system_call_common)
 	mr	r10,r1
 	ld	r1,PACAKSAVE(r13)
 	std	r10,0(r1)
@@ -76,344 +71,101 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
 	std	r12,_MSR(r1)
 	std	r0,GPR0(r1)
 	std	r10,GPR1(r1)
+	std	r2,GPR2(r1)
 #ifdef CONFIG_PPC_FSL_BOOK3E
 START_BTB_FLUSH_SECTION
 	BTB_FLUSH(r10)
 END_BTB_FLUSH_SECTION
 #endif
-	ACCOUNT_CPU_USER_ENTRY(r13, r10, r11)
-	std	r2,GPR2(r1)
+	ld	r2,PACATOC(r13)
+	mfcr	r12
+	li	r11,0
+	/* Can we avoid saving r3-r8 in common case? */
 	std	r3,GPR3(r1)
-	mfcr	r2
 	std	r4,GPR4(r1)
 	std	r5,GPR5(r1)
 	std	r6,GPR6(r1)
 	std	r7,GPR7(r1)
 	std	r8,GPR8(r1)
-	li	r11,0
+	/* Zero r9-r12, this should only be required when restoring all GPRs */
 	std	r11,GPR9(r1)
 	std	r11,GPR10(r1)
 	std	r11,GPR11(r1)
 	std	r11,GPR12(r1)
-	std	r11,_XER(r1)
-	std	r11,_CTR(r1)
 	std	r9,GPR13(r1)
 	SAVE_NVGPRS(r1)
+	std	r11,_XER(r1)
+	std	r11,_CTR(r1)
 	mflr	r10
+
 	/*
 	 * This clears CR0.SO (bit 28), which is the error indication on
 	 * return from this system call.
 	 */
-	rldimi	r2,r11,28,(63-28)
+	rldimi	r12,r11,28,(63-28)
 	li	r11,0xc00
 	std	r10,_LINK(r1)
 	std	r11,_TRAP(r1)
+	std	r12,_CCR(r1)
 	std	r3,ORIG_GPR3(r1)
-	std	r2,_CCR(r1)
-	ld	r2,PACATOC(r13)
-	addi	r9,r1,STACK_FRAME_OVERHEAD
+	addi	r10,r1,STACK_FRAME_OVERHEAD
 	ld	r11,exception_marker@toc(r2)
-	std	r11,-16(r9)		/* "regshere" marker */
-
-	kuap_check_amr r10, r11
-
-#if defined(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) && defined(CONFIG_PPC_SPLPAR)
-BEGIN_FW_FTR_SECTION
-	/* see if there are any DTL entries to process */
-	ld	r10,PACALPPACAPTR(r13)	/* get ptr to VPA */
-	ld	r11,PACA_DTL_RIDX(r13)	/* get log read index */
-	addi	r10,r10,LPPACA_DTLIDX
-	LDX_BE	r10,0,r10		/* get log write index */
-	cmpd	r11,r10
-	beq+	33f
-	bl	accumulate_stolen_time
-	REST_GPR(0,r1)
-	REST_4GPRS(3,r1)
-	REST_2GPRS(7,r1)
-	addi	r9,r1,STACK_FRAME_OVERHEAD
-33:
-END_FW_FTR_SECTION_IFSET(FW_FEATURE_SPLPAR)
-#endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE && CONFIG_PPC_SPLPAR */
-
-	/*
-	 * A syscall should always be called with interrupts enabled
-	 * so we just unconditionally hard-enable here. When some kind
-	 * of irq tracing is used, we additionally check that condition
-	 * is correct
-	 */
-#if defined(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG) && defined(CONFIG_BUG)
-	lbz	r10,PACAIRQSOFTMASK(r13)
-1:	tdnei	r10,IRQS_ENABLED
-	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,BUGFLAG_WARNING
-#endif
-
-#ifdef CONFIG_PPC_BOOK3E
-	wrteei	1
-#else
-	li	r11,MSR_RI
-	ori	r11,r11,MSR_EE
-	mtmsrd	r11,1
-#endif /* CONFIG_PPC_BOOK3E */
-
-system_call:			/* label this so stack traces look sane */
-	/* We do need to set SOFTE in the stack frame or the return
-	 * from interrupt will be painful
-	 */
-	li	r10,IRQS_ENABLED
-	std	r10,SOFTE(r1)
-
-	ld	r11, PACA_THREAD_INFO(r13)
-	ld	r10,TI_FLAGS(r11)
-	andi.	r11,r10,_TIF_SYSCALL_DOTRACE
-	bne	.Lsyscall_dotrace		/* does not return */
-	cmpldi	0,r0,NR_syscalls
-	bge-	.Lsyscall_enosys
-
-.Lsyscall:
-/*
- * Need to vector to 32 Bit or default sys_call_table here,
- * based on caller's run-mode / personality.
- */
-	ld	r11,SYS_CALL_TABLE@toc(2)
-	andis.	r10,r10,_TIF_32BIT@h
-	beq	15f
-	ld	r11,COMPAT_SYS_CALL_TABLE@toc(2)
-	clrldi	r3,r3,32
-	clrldi	r4,r4,32
-	clrldi	r5,r5,32
-	clrldi	r6,r6,32
-	clrldi	r7,r7,32
-	clrldi	r8,r8,32
-15:
-	slwi	r0,r0,3
-
-	barrier_nospec_asm
-	/*
-	 * Prevent the load of the handler below (based on the user-passed
-	 * system call number) being speculatively executed until the test
-	 * against NR_syscalls and branch to .Lsyscall_enosys above has
-	 * committed.
-	 */
+	std	r11,-16(r10)		/* "regshere" marker */
 
-	ldx	r12,r11,r0	/* Fetch system call handler [ptr] */
-	mtctr   r12
-	bctrl			/* Call handler */
+	/* Calling convention has r9 = orig r0, r10 = regs */
+	mr	r9,r0
+	bl	system_call_exception
 
-	/* syscall_exit can exit to kernel mode, via ret_from_kernel_thread */
 .Lsyscall_exit:
-	std	r3,RESULT(r1)
+	addi    r4,r1,STACK_FRAME_OVERHEAD
+	bl	syscall_exit_prepare
 
-#ifdef CONFIG_DEBUG_RSEQ
-	/* Check whether the syscall is issued inside a restartable sequence */
-	addi    r3,r1,STACK_FRAME_OVERHEAD
-	bl      rseq_syscall
-	ld	r3,RESULT(r1)
-#endif
-
-	ld	r12, PACA_THREAD_INFO(r13)
-
-	ld	r8,_MSR(r1)
-
-/*
- * This is a few instructions into the actual syscall exit path (which actually
- * starts at .Lsyscall_exit) to cater to kprobe blacklisting and to reduce the
- * number of visible symbols for profiling purposes.
- *
- * We can probe from system_call until this point as MSR_RI is set. But once it
- * is cleared below, we won't be able to take a trap.
- *
- * This is blacklisted from kprobes further below with _ASM_NOKPROBE_SYMBOL().
- */
-system_call_exit:
-	/*
-	 * Disable interrupts so current_thread_info()->flags can't change,
-	 * and so that we don't get interrupted after loading SRR0/1.
-	 *
-	 * Leave MSR_RI enabled for now, because with THREAD_INFO_IN_TASK we
-	 * could fault on the load of the TI_FLAGS below.
-	 */
-#ifdef CONFIG_PPC_BOOK3E
-	wrteei	0
-#else
-	li	r11,MSR_RI
-	mtmsrd	r11,1
-#endif /* CONFIG_PPC_BOOK3E */
-
-	ld	r9,TI_FLAGS(r12)
-	li	r11,-MAX_ERRNO
-	andi.	r0,r9,(_TIF_SYSCALL_DOTRACE|_TIF_SINGLESTEP|_TIF_USER_WORK_MASK|_TIF_PERSYSCALL_MASK)
-	bne-	.Lsyscall_exit_work
+	ld	r2,_CCR(r1)
+	ld	r4,_NIP(r1)
+	ld	r5,_MSR(r1)
+	ld	r6,_LINK(r1)
 
-	andi.	r0,r8,MSR_FP
-	beq 2f
-#ifdef CONFIG_ALTIVEC
-	andis.	r0,r8,MSR_VEC@h
-	bne	3f
-#endif
-2:	addi    r3,r1,STACK_FRAME_OVERHEAD
-	bl	restore_math
-	ld	r8,_MSR(r1)
-	ld	r3,RESULT(r1)
-	li	r11,-MAX_ERRNO
-
-3:	cmpld	r3,r11
-	ld	r5,_CCR(r1)
-	bge-	.Lsyscall_error
-.Lsyscall_error_cont:
-	ld	r7,_NIP(r1)
 BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1			/* to clear the reservation */
 END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
-	andi.	r6,r8,MSR_PR
-	ld	r4,_LINK(r1)
-
-	kuap_check_amr r10, r11
 
-#ifdef CONFIG_PPC_BOOK3S
-	/*
-	 * Clear MSR_RI, MSR_EE is already and remains disabled. We could do
-	 * this later, but testing shows that doing it here causes less slow
-	 * down than doing it closer to the rfid.
-	 */
-	li	r11,0
-	mtmsrd	r11,1
-#endif
+	mtspr	SPRN_SRR0,r4
+	mtspr	SPRN_SRR1,r5
+	mtlr	r6
 
-	beq-	1f
-	ACCOUNT_CPU_USER_EXIT(r13, r11, r12)
+	cmpdi	r3,0
+	bne	.Lsyscall_restore_regs
+.Lsyscall_restore_regs_cont:
 
 BEGIN_FTR_SECTION
 	HMT_MEDIUM_LOW
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	std	r8, PACATMSCRATCH(r13)
-#endif
-
 	/*
 	 * We don't need to restore AMR on the way back to userspace for KUAP.
 	 * The value of AMR only matters while we're in the kernel.
 	 */
-	ld	r13,GPR13(r1)	/* only restore r13 if returning to usermode */
+	mtcr	r2
 	ld	r2,GPR2(r1)
+	ld	r3,GPR3(r1)
+	ld	r13,GPR13(r1)
 	ld	r1,GPR1(r1)
-	mtlr	r4
-	mtcr	r5
-	mtspr	SPRN_SRR0,r7
-	mtspr	SPRN_SRR1,r8
 	RFI_TO_USER
 	b	.	/* prevent speculative execution */
 
-1:	/* exit to kernel */
-	kuap_restore_amr r2
-
-	ld	r2,GPR2(r1)
-	ld	r1,GPR1(r1)
-	mtlr	r4
-	mtcr	r5
-	mtspr	SPRN_SRR0,r7
-	mtspr	SPRN_SRR1,r8
-	RFI_TO_KERNEL
-	b	.	/* prevent speculative execution */
-
-.Lsyscall_error:
-	oris	r5,r5,0x1000	/* Set SO bit in CR */
-	neg	r3,r3
-	std	r5,_CCR(r1)
-	b	.Lsyscall_error_cont
-
-/* Traced system call support */
-.Lsyscall_dotrace:
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	do_syscall_trace_enter
-
-	/*
-	 * We use the return value of do_syscall_trace_enter() as the syscall
-	 * number. If the syscall was rejected for any reason do_syscall_trace_enter()
-	 * returns an invalid syscall number and the test below against
-	 * NR_syscalls will fail.
-	 */
-	mr	r0,r3
-
-	/* Restore argument registers just clobbered and/or possibly changed. */
-	ld	r3,GPR3(r1)
-	ld	r4,GPR4(r1)
-	ld	r5,GPR5(r1)
-	ld	r6,GPR6(r1)
-	ld	r7,GPR7(r1)
-	ld	r8,GPR8(r1)
-
-	/* Repopulate r9 and r10 for the syscall path */
-	addi	r9,r1,STACK_FRAME_OVERHEAD
-	ld	r10, PACA_THREAD_INFO(r13)
-	ld	r10,TI_FLAGS(r10)
-
-	cmpldi	r0,NR_syscalls
-	blt+	.Lsyscall
-
-	/* Return code is already in r3 thanks to do_syscall_trace_enter() */
-	b	.Lsyscall_exit
-
-
-.Lsyscall_enosys:
-	li	r3,-ENOSYS
-	b	.Lsyscall_exit
-	
-.Lsyscall_exit_work:
-	/* If TIF_RESTOREALL is set, don't scribble on either r3 or ccr.
-	 If TIF_NOERROR is set, just save r3 as it is. */
-
-	andi.	r0,r9,_TIF_RESTOREALL
-	beq+	0f
+.Lsyscall_restore_regs:
+	ld	r3,_CTR(r1)
+	ld	r4,_XER(r1)
 	REST_NVGPRS(r1)
-	b	2f
-0:	cmpld	r3,r11		/* r11 is -MAX_ERRNO */
-	blt+	1f
-	andi.	r0,r9,_TIF_NOERROR
-	bne-	1f
-	ld	r5,_CCR(r1)
-	neg	r3,r3
-	oris	r5,r5,0x1000	/* Set SO bit in CR */
-	std	r5,_CCR(r1)
-1:	std	r3,GPR3(r1)
-2:	andi.	r0,r9,(_TIF_PERSYSCALL_MASK)
-	beq	4f
-
-	/* Clear per-syscall TIF flags if any are set.  */
-
-	li	r11,_TIF_PERSYSCALL_MASK
-	addi	r12,r12,TI_FLAGS
-3:	ldarx	r10,0,r12
-	andc	r10,r10,r11
-	stdcx.	r10,0,r12
-	bne-	3b
-	subi	r12,r12,TI_FLAGS
-
-4:	/* Anything else left to do? */
-BEGIN_FTR_SECTION
-	lis	r3,DEFAULT_PPR@highest	/* Set default PPR */
-	sldi	r3,r3,32	/* bits 11-13 are used for ppr */
-	std	r3,_PPR(r1)
-END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
-
-	andi.	r0,r9,(_TIF_SYSCALL_DOTRACE|_TIF_SINGLESTEP)
-	beq	ret_from_except_lite
-
-	/* Re-enable interrupts */
-#ifdef CONFIG_PPC_BOOK3E
-	wrteei	1
-#else
-	li	r10,MSR_RI
-	ori	r10,r10,MSR_EE
-	mtmsrd	r10,1
-#endif /* CONFIG_PPC_BOOK3E */
-
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	do_syscall_trace_leave
-	b	ret_from_except
+	mtctr	r3
+	mtspr	SPRN_XER,r4
+	ld	r0,GPR0(r1)
+	REST_8GPRS(4, r1)
+	ld	r12,GPR12(r1)
+	b	.Lsyscall_restore_regs_cont
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-.Ltabort_syscall:
+_GLOBAL(tabort_syscall) /* (unsigned long nip, unsigned long msr) */
 	/* Firstly we need to enable TM in the kernel */
 	mfmsr	r10
 	li	r9, 1
@@ -433,13 +185,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	li	r9, MSR_RI
 	andc	r10, r10, r9
 	mtmsrd	r10, 1
-	mtspr	SPRN_SRR0, r11
-	mtspr	SPRN_SRR1, r12
+	mtspr	SPRN_SRR0, r3
+	mtspr	SPRN_SRR1, r4
 	RFI_TO_USER
 	b	.	/* prevent speculative execution */
 #endif
-_ASM_NOKPROBE_SYMBOL(system_call_common);
-_ASM_NOKPROBE_SYMBOL(system_call_exit);
 
 _GLOBAL(ret_from_fork)
 	bl	schedule_tail
diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
index 800433685888..d396efca4068 100644
--- a/arch/powerpc/kernel/signal.h
+++ b/arch/powerpc/kernel/signal.h
@@ -10,8 +10,6 @@
 #ifndef _POWERPC_ARCH_SIGNAL_H
 #define _POWERPC_ARCH_SIGNAL_H
 
-extern void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags);
-
 extern void __user *get_sigframe(struct ksignal *ksig, unsigned long sp,
 				  size_t frame_size, int is_32);
 
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
new file mode 100644
index 000000000000..20f77cc19df8
--- /dev/null
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/err.h>
+#include <asm/asm-prototypes.h>
+#include <asm/book3s/64/kup-radix.h>
+#include <asm/cputime.h>
+#include <asm/hw_irq.h>
+#include <asm/kprobes.h>
+#include <asm/paca.h>
+#include <asm/ptrace.h>
+#include <asm/reg.h>
+#include <asm/signal.h>
+#include <asm/switch_to.h>
+#include <asm/syscall.h>
+#include <asm/time.h>
+#include <asm/unistd.h>
+
+extern void __noreturn tabort_syscall(unsigned long nip, unsigned long msr);
+
+typedef long (*syscall_fn)(long, long, long, long, long, long);
+
+/* Has to run notrace because it is entered "unreconciled" */
+notrace long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
+			   unsigned long r0, struct pt_regs *regs)
+{
+	unsigned long ti_flags;
+	syscall_fn f;
+
+	BUG_ON(!(regs->msr & MSR_PR));
+
+	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
+	    unlikely(regs->msr & MSR_TS_T))
+		tabort_syscall(regs->nip, regs->msr);
+
+	account_cpu_user_entry();
+
+#ifdef CONFIG_PPC_SPLPAR
+	if (IS_ENABLED(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) &&
+	    firmware_has_feature(FW_FEATURE_SPLPAR)) {
+		struct lppaca *lp = local_paca->lppaca_ptr;
+
+		if (unlikely(local_paca->dtl_ridx != be64_to_cpu(lp->dtl_idx)))
+			accumulate_stolen_time();
+	}
+#endif
+
+	kuap_check_amr();
+
+	/*
+	 * A syscall should always be called with interrupts enabled
+	 * so we just unconditionally hard-enable here. When some kind
+	 * of irq tracing is used, we additionally check that condition
+	 * is correct
+	 */
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
+		WARN_ON(irq_soft_mask_return() != IRQS_ENABLED);
+		WARN_ON(local_paca->irq_happened);
+	}
+	/*
+	 * This is not required for the syscall exit path, but makes the
+	 * stack frame look nicer. If this was initialised in the first stack
+	 * frame, or if the unwinder was taught the first stack frame always
+	 * returns to user with IRQS_ENABLED, this store could be avoided!
+	 */
+	regs->softe = IRQS_ENABLED;
+
+	__hard_irq_enable();
+
+	ti_flags = current_thread_info()->flags;
+	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
+		/*
+		 * We use the return value of do_syscall_trace_enter() as the
+		 * syscall number. If the syscall was rejected for any reason
+		 * do_syscall_trace_enter() returns an invalid syscall number
+		 * and the test against NR_syscalls will fail and the return
+		 * value to be used is in regs->gpr[3].
+		 */
+		r0 = do_syscall_trace_enter(regs);
+		if (unlikely(r0 >= NR_syscalls))
+			return regs->gpr[3];
+		r3 = regs->gpr[3];
+		r4 = regs->gpr[4];
+		r5 = regs->gpr[5];
+		r6 = regs->gpr[6];
+		r7 = regs->gpr[7];
+		r8 = regs->gpr[8];
+
+	} else if (unlikely(r0 >= NR_syscalls)) {
+		return -ENOSYS;
+	}
+
+	/* May be faster to do array_index_nospec? */
+	barrier_nospec();
+
+	if (unlikely(ti_flags & _TIF_32BIT)) {
+		f = (void *)compat_sys_call_table[r0];
+
+		r3 &= 0x00000000ffffffffULL;
+		r4 &= 0x00000000ffffffffULL;
+		r5 &= 0x00000000ffffffffULL;
+		r6 &= 0x00000000ffffffffULL;
+		r7 &= 0x00000000ffffffffULL;
+		r8 &= 0x00000000ffffffffULL;
+
+	} else {
+		f = (void *)sys_call_table[r0];
+	}
+
+	return f(r3, r4, r5, r6, r7, r8);
+}
+
+/*
+ * This should be called after a syscall returns, with r3 the return value
+ * from the syscall. If this function returns non-zero, the system call
+ * exit assembly should additionally load all GPR registers and CTR and XER
+ * from the interrupt frame.
+ *
+ * The function graph tracer can not trace the return side of this function,
+ * because RI=0 and soft mask state is "unreconciled", so it is marked notrace.
+ */
+notrace unsigned long syscall_exit_prepare(unsigned long r3,
+					   struct pt_regs *regs)
+{
+	unsigned long *ti_flagsp = &current_thread_info()->flags;
+	unsigned long ti_flags;
+	unsigned long ret = 0;
+
+	regs->result = r3;
+
+	/* Check whether the syscall is issued inside a restartable sequence */
+	rseq_syscall(regs);
+
+	ti_flags = *ti_flagsp;
+
+	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO)) {
+		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
+			r3 = -r3;
+			regs->ccr |= 0x10000000; /* Set SO bit in CR */
+		}
+	}
+
+	if (unlikely(ti_flags & _TIF_PERSYSCALL_MASK)) {
+		if (ti_flags & _TIF_RESTOREALL)
+			ret = _TIF_RESTOREALL;
+		else
+			regs->gpr[3] = r3;
+		clear_bits(_TIF_PERSYSCALL_MASK, ti_flagsp);
+	} else {
+		regs->gpr[3] = r3;
+	}
+
+	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
+		do_syscall_trace_leave(regs);
+		ret |= _TIF_RESTOREALL;
+	}
+
+again:
+	local_irq_disable();
+	ti_flags = READ_ONCE(*ti_flagsp);
+	while (unlikely(ti_flags & _TIF_USER_WORK_MASK)) {
+		local_irq_enable();
+		if (ti_flags & _TIF_NEED_RESCHED) {
+			schedule();
+		} else {
+			/*
+			 * SIGPENDING must restore signal handler function
+			 * argument GPRs, and some non-volatiles (e.g., r1).
+			 * Restore all for now. This could be made lighter.
+			 */
+			if (ti_flags & _TIF_SIGPENDING)
+				ret |= _TIF_RESTOREALL;
+			do_notify_resume(regs, ti_flags);
+		}
+		local_irq_disable();
+		ti_flags = READ_ONCE(*ti_flagsp);
+	}
+
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && IS_ENABLED(CONFIG_PPC_FPU)) {
+		unsigned long mathflags = MSR_FP;
+
+		if (IS_ENABLED(CONFIG_ALTIVEC))
+			mathflags |= MSR_VEC;
+
+		if ((regs->msr & mathflags) != mathflags)
+			restore_math(regs);
+	}
+
+	/* This must be done with RI=1 because tracing may touch vmaps */
+	trace_hardirqs_on();
+
+	/* This pattern matches prep_irq_for_idle */
+	__hard_EE_RI_disable();
+	if (unlikely(lazy_irq_pending())) {
+		__hard_RI_enable();
+		trace_hardirqs_off();
+		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+		local_irq_enable();
+		/* Took an interrupt which may have more exit work to do. */
+		goto again;
+	}
+	local_paca->irq_happened = 0;
+	irq_soft_mask_set(IRQS_ENABLED);
+
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	local_paca->tm_scratch = regs->msr;
+#endif
+
+	kuap_check_amr();
+
+	account_cpu_user_exit();
+
+	return ret;
+}
diff --git a/arch/powerpc/kernel/systbl.S b/arch/powerpc/kernel/systbl.S
index 5b905a2f4e4d..d34276f3c495 100644
--- a/arch/powerpc/kernel/systbl.S
+++ b/arch/powerpc/kernel/systbl.S
@@ -16,25 +16,22 @@
 
 #ifdef CONFIG_PPC64
 	.p2align	3
+#define __SYSCALL(nr, entry)	.8byte entry
+#else
+#define __SYSCALL(nr, entry)	.long entry
 #endif
 
 .globl sys_call_table
 sys_call_table:
 #ifdef CONFIG_PPC64
-#define __SYSCALL(nr, entry)	.8byte DOTSYM(entry)
 #include <asm/syscall_table_64.h>
-#undef __SYSCALL
 #else
-#define __SYSCALL(nr, entry)	.long entry
 #include <asm/syscall_table_32.h>
-#undef __SYSCALL
 #endif
 
 #ifdef CONFIG_COMPAT
 .globl compat_sys_call_table
 compat_sys_call_table:
 #define compat_sys_sigsuspend	sys_sigsuspend
-#define __SYSCALL(nr, entry)	.8byte DOTSYM(entry)
 #include <asm/syscall_table_c32.h>
-#undef __SYSCALL
 #endif
-- 
2.23.0

