Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CF89DC11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 05:41:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HZRn4RjHzDq9p
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 13:41:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="s0QOCDFl"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HZCQ17BZzDqnT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 13:30:57 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id k3so11796536pgb.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 20:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+hyYRu259BVVhpKUTfQHoyG81wlh7R/UrT6smkfc1y0=;
 b=s0QOCDFlYLPNLljKs9HEe/sxauMCXnwq6INFp/91qa2JZnGMp6sUmdKWK5yU9gcihC
 qMVYzUnWra5Up7bg2S653gQVyLzZjQIzeXQT8r/cvvpSfeUJSblf7xO+Q0eEmrZVc+ml
 sa0b1vmKVSKJ1HTszduyNohzFT+UdhyyGq+BTtRQWkRroog227w00V9pe2yvOjcf9ao1
 Zx9G+viPF0QlNW156Z3C4Mb7JeuOd3b6AgjUtH4HyO9D++qtFHjvIxtY5oBbJNsoTTn7
 x5dGcwtRjoqmQ9KUArix7lE3g5iYLTpYhWmUZC11Ken+2nws+p6wFrkRcHla2L5LLk3L
 bx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+hyYRu259BVVhpKUTfQHoyG81wlh7R/UrT6smkfc1y0=;
 b=n4eOonf39Vk+9I6J5cjpY13zx1ZqdkwH385NJDQe4hnZY5c8LjhkcfY+vKbQmYYMiF
 ojUqlREuO8LwQQEQ5yVsLxSPvOhnt4MR5KhjazLK7ap9J7lX3rV7kxU8dU6ym9OMnIEv
 VWeBuK286eUUWlX2ebMKei9FYdxr0VCyw/hWk7Vl8b/Z+Pm8s2wrAh9evjcAGVthWjlJ
 Y4cREf9F53CP5DMsEztdR3kyS1WbDrikABPf0ncgmJg/ucoMg4hlt2I2Hc0jsKngBDH+
 loBxKBef0Vm7A78QbawGxw/Iyg5Vsm9wtYoXMGkixf637csIyR1QTz74aKKb7TBaC+hG
 tPNw==
X-Gm-Message-State: APjAAAUXu5Ib/C/j+bMwgPfHuA003JzhWbVA7p2TlAZy6goYJRqcy52Q
 +zcqv4PDlYCQ9y+kwa0Zj1Yfp73z
X-Google-Smtp-Source: APXvYqwVqv2+dCf7YM2aK+gsvHoICO4gx7tsq+NT1erryQOwOEcIsJLMkev1DHmvZGJ1tOMyohJ3+g==
X-Received: by 2002:a63:4a51:: with SMTP id j17mr19230758pgl.284.1566876653378; 
 Mon, 26 Aug 2019 20:30:53 -0700 (PDT)
Received: from bobo.local0.net (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id x24sm11383984pgl.84.2019.08.26.20.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 20:30:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/4] powerpc/64: system call implement the bulk of the logic
 in C
Date: Tue, 27 Aug 2019 13:30:10 +1000
Message-Id: <20190827033010.28090-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827033010.28090-1-npiggin@gmail.com>
References: <20190827033010.28090-1-npiggin@gmail.com>
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

System call entry and particularly exit code is beyond the limit of what
is reasonable to implement in asm.

This conversion moves all conditional branches out of the asm code,
except a relatively simple test to see whether all GPRs should be
restored at exit time.

Null syscall test is about 5% faster after this patch, because the exit
work is handled under local_irq_disable, and the hard mask and pending
interrupt replay is handled after that, which avoids games with MSR.

The asm instruction scheduling has not really been analysed and
optimised yet, as there are higher level features and improvements to
add first.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h |  11 -
 arch/powerpc/include/asm/ptrace.h         |   3 +
 arch/powerpc/include/asm/signal.h         |   2 +
 arch/powerpc/include/asm/switch_to.h      |   4 +
 arch/powerpc/include/asm/time.h           |   3 +
 arch/powerpc/kernel/Makefile              |   3 +-
 arch/powerpc/kernel/entry_64.S            | 343 ++++------------------
 arch/powerpc/kernel/process.c             |   6 +-
 arch/powerpc/kernel/signal.h              |   2 -
 arch/powerpc/kernel/syscall_64.c          | 202 +++++++++++++
 10 files changed, 271 insertions(+), 308 deletions(-)
 create mode 100644 arch/powerpc/kernel/syscall_64.c

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index ec1c97a8e8cb..f00ef8924a99 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -92,14 +92,6 @@ long sys_switch_endian(void);
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
@@ -110,9 +102,6 @@ unsigned long __init prom_init(unsigned long r3, unsigned long r4,
 void __init early_setup(unsigned long dt_ptr);
 void early_setup_secondary(void);
 
-/* time */
-void accumulate_stolen_time(void);
-
 /* misc runtime */
 extern u64 __bswapdi2(u64);
 extern s64 __lshrdi3(s64, int);
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index feee1b21bbd5..af363086403a 100644
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
index 0803ca8b9149..0113be8dcb59 100644
--- a/arch/powerpc/include/asm/signal.h
+++ b/arch/powerpc/include/asm/signal.h
@@ -6,4 +6,6 @@
 #include <uapi/asm/signal.h>
 #include <uapi/asm/ptrace.h>
 
+void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags);
+
 #endif /* _ASM_POWERPC_SIGNAL_H */
diff --git a/arch/powerpc/include/asm/switch_to.h b/arch/powerpc/include/asm/switch_to.h
index 5b03d8a82409..231fcb2058cf 100644
--- a/arch/powerpc/include/asm/switch_to.h
+++ b/arch/powerpc/include/asm/switch_to.h
@@ -5,6 +5,7 @@
 #ifndef _ASM_POWERPC_SWITCH_TO_H
 #define _ASM_POWERPC_SWITCH_TO_H
 
+#include <linux/sched.h>
 #include <asm/reg.h>
 
 struct thread_struct;
@@ -22,6 +23,9 @@ extern void switch_booke_debug_regs(struct debug_reg *new_debug);
 
 extern int emulate_altivec(struct pt_regs *);
 
+void restore_math(struct pt_regs *regs);
+void restore_tm_state(struct pt_regs *regs);
+
 extern void flush_all_to_thread(struct task_struct *);
 extern void giveup_all(struct task_struct *);
 
diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 54f4ec1f9fab..ba97858c9d76 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -199,5 +199,8 @@ DECLARE_PER_CPU(u64, decrementers_next_tb);
 /* Convert timebase ticks to nanoseconds */
 unsigned long long tb_to_ns(unsigned long long tb_ticks);
 
+/* SPLPAR */
+void accumulate_stolen_time(void);
+
 #endif /* __KERNEL__ */
 #endif /* __POWERPC_TIME_H */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 56dfa7a2a6f2..7f53cc07f933 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -52,7 +52,8 @@ obj-y				:= cputable.o ptrace.o syscalls.o \
 				   of_platform.o prom_parse.o
 obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o \
 				   signal_64.o ptrace32.o \
-				   paca.o nvram_64.o firmware.o
+				   paca.o nvram_64.o firmware.o \
+				   syscall_64.o
 obj-$(CONFIG_VDSO32)		+= vdso32/
 obj-$(CONFIG_PPC_WATCHDOG)	+= watchdog.o
 obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 5a3e0b5c9ad1..2ec825a85f5b 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -63,12 +63,6 @@ exception_marker:
 
 	.globl system_call_common
 system_call_common:
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-BEGIN_FTR_SECTION
-	extrdi.	r10, r12, 1, (63-MSR_TS_T_LG) /* transaction active? */
-	bne	.Ltabort_syscall
-END_FTR_SECTION_IFSET(CPU_FTR_TM)
-#endif
 	mr	r10,r1
 	ld	r1,PACAKSAVE(r13)
 	std	r10,0(r1)
@@ -76,350 +70,118 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
 	std	r12,_MSR(r1)
 	std	r0,GPR0(r1)
 	std	r10,GPR1(r1)
+	std	r2,GPR2(r1)
 #ifdef CONFIG_PPC_FSL_BOOK3E
+	andi.	r10,r12,MSR_PR
+	beq	1f			/* if from kernel mode */
 START_BTB_FLUSH_SECTION
 	BTB_FLUSH(r10)
 END_BTB_FLUSH_SECTION
+1:
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
-
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
+	addi    r4,r1,STACK_FRAME_OVERHEAD
+	bl	syscall_exit_prepare
 
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
 
-	kuap_check_amr r10, r11
-
-#ifdef CONFIG_PPC_BOOK3S
-	/*
-	 * Clear MSR_RI, MSR_EE is already and remains disabled. We could do
-	 * this later, but testing shows that doing it here causes less slow
-	 * down than doing it closer to the rfid.
-	 */
-	li	r11,0
-	mtmsrd	r11,1
+	mtspr	SPRN_SRR0,r4
+	mtspr	SPRN_SRR1,r5
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	std	r5,PACATMSCRATCH(r13)
 #endif
+	mtlr	r6
 
-	beq-	1f
-	ACCOUNT_CPU_USER_EXIT(r13, r11, r12)
+	cmpdi	r3,0
+	bne	syscall_restore_regs
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
+_ASM_NOKPROBE_SYMBOL(system_call_common);
 
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
+syscall_restore_regs:
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
+	.globl tabort_syscall
+tabort_syscall:
 	/* Firstly we need to enable TM in the kernel */
 	mfmsr	r10
 	li	r9, 1
 	rldimi	r10, r9, MSR_TM_LG, 63-MSR_TM_LG
 	mtmsrd	r10, 0
 
+	ld	r11,_NIP(r13)
+	ld	r12,_MSR(r13)
+
 	/* tabort, this dooms the transaction, nothing else */
 	li	r9, (TM_CAUSE_SYSCALL|TM_CAUSE_PERSISTENT)
 	TABORT(R9)
@@ -438,9 +200,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	RFI_TO_USER
 	b	.	/* prevent speculative execution */
 #endif
-_ASM_NOKPROBE_SYMBOL(system_call_common);
-_ASM_NOKPROBE_SYMBOL(system_call_exit);
-
 _GLOBAL(ret_from_fork)
 	bl	schedule_tail
 	REST_NVGPRS(r1)
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 24621e7e5033..f444525da9ce 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1609,7 +1609,6 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
 	extern void ret_from_kernel_thread(void);
 	void (*f)(void);
 	unsigned long sp = (unsigned long)task_stack_page(p) + THREAD_SIZE;
-	struct thread_info *ti = task_thread_info(p);
 
 	klp_init_thread_info(p);
 
@@ -1617,6 +1616,8 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
 	sp -= sizeof(struct pt_regs);
 	childregs = (struct pt_regs *) sp;
 	if (unlikely(p->flags & PF_KTHREAD)) {
+		struct thread_info *ti = task_thread_info(p);
+
 		/* kernel thread */
 		memset(childregs, 0, sizeof(struct pt_regs));
 		childregs->gpr[1] = sp + sizeof(struct pt_regs);
@@ -1634,12 +1635,13 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
 	} else {
 		/* user thread */
 		struct pt_regs *regs = current_pt_regs();
+
 		CHECK_FULL_REGS(regs);
 		*childregs = *regs;
 		if (usp)
 			childregs->gpr[1] = usp;
 		p->thread.regs = childregs;
-		childregs->gpr[3] = 0;  /* Result from fork() */
+		/* ret_from_fork sets fork() result to 0 */
 		if (clone_flags & CLONE_SETTLS) {
 #ifdef CONFIG_PPC64
 			if (!is_32bit_task())
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
index 000000000000..98ed970796d5
--- /dev/null
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -0,0 +1,202 @@
+#include <linux/err.h>
+#include <asm/hw_irq.h>
+#include <asm/paca.h>
+#include <asm/ptrace.h>
+#include <asm/reg.h>
+#include <asm/signal.h>
+#include <asm/switch_to.h>
+#include <asm/syscall.h>
+#include <asm/time.h>
+
+extern void __noreturn tabort_syscall(void);
+
+#ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
+static inline void account_cpu_user_entry(void)
+{
+	unsigned long tb = mftb();
+
+	local_paca->accounting.utime += (tb - local_paca->accounting.starttime_user);
+	local_paca->accounting.starttime = tb;
+}
+static inline void account_cpu_user_exit(void)
+{
+	unsigned long tb = mftb();
+
+	local_paca->accounting.stime += (tb - local_paca->accounting.starttime);
+	local_paca->accounting.starttime_user = tb;
+}
+#else
+static inline void account_cpu_user_entry(void)
+{
+}
+static inline void account_cpu_user_exit(void)
+{
+}
+#endif
+
+typedef long (*syscall_fn)(long, long, long, long, long, long);
+
+long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs)
+{
+	unsigned long ti_flags;
+	syscall_fn f;
+
+	BUG_ON(!(regs->msr & MSR_PR));
+
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	if (unlikely(regs->msr & MSR_TS_T))
+		tabort_syscall();
+#endif
+
+	account_cpu_user_entry();
+
+#if defined(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) && defined(CONFIG_PPC_SPLPAR)
+	if (firmware_has_feature(FW_FEATURE_SPLPAR)) {
+		struct lppaca *lp = get_lppaca();
+
+		if (unlikely(local_paca->dtl_ridx != lp->dtl_idx))
+			accumulate_stolen_time();
+	}
+#endif
+
+#ifdef CONFIG_PPC_KUAP_DEBUG
+	if (mmu_has_feature(MMU_FTR_RADIX_KUAP))
+		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
+#endif
+
+	/*
+	 * A syscall should always be called with interrupts enabled
+	 * so we just unconditionally hard-enable here. When some kind
+	 * of irq tracing is used, we additionally check that condition
+	 * is correct
+	 */
+#if defined(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)
+	WARN_ON(irq_soft_mask_return() != IRQS_ENABLED);
+	WARN_ON(local_paca->irq_happened);
+#endif
+
+	__hard_irq_enable();
+
+	/*
+	 * We do need to set SOFTE in the stack frame or the return
+	 * from interrupt will be painful
+	 */
+	regs->softe = IRQS_ENABLED;
+
+	ti_flags = current_thread_info()->flags;
+	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
+		/*
+		 * We use the return value of do_syscall_trace_enter() as the
+		 * syscall number. If the syscall was rejected for any reason
+		 * do_syscall_trace_enter() returns an invalid syscall number
+		 * and the test below against NR_syscalls will fail.
+		 */
+		r0 = do_syscall_trace_enter(regs);
+	}
+
+	if (unlikely(r0 >= NR_syscalls))
+		return -ENOSYS;
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
+unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs)
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
+	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE))
+		do_syscall_trace_leave(regs);
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
+#ifdef CONFIG_ALTIVEC
+	if ((regs->msr & (MSR_FP|MSR_VEC)) != (MSR_FP|MSR_VEC))
+#else
+	if ((regs->msr & MSR_FP) != MSR_FP)
+#endif
+		restore_math(regs);
+
+	/* This pattern matches prep_irq_for_idle */
+	__mtmsrd(0, 1);	/* Disable MSR_EE and MSR_RI */
+	if (unlikely(lazy_irq_pending())) {
+		__mtmsrd(MSR_RI, 1);
+		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+		local_irq_enable();
+		/* Took an interrupt which may have more exit work to do. */
+		goto again;
+	}
+	trace_hardirqs_on();
+	local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
+	irq_soft_mask_set(IRQS_ENABLED);
+
+	account_cpu_user_exit();
+
+#ifdef CONFIG_PPC_KUAP_DEBUG
+	if (mmu_has_feature(MMU_FTR_RADIX_KUAP))
+		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
+#endif
+
+	return ret;
+}
+
-- 
2.22.0

