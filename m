Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 586E9314D70
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 11:48:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZfkZ6Jr6zDspY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 21:48:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZdb95LcyzDsTV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 20:56:53 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZdb55CrPz9txgR;
 Tue,  9 Feb 2021 10:56:49 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id BPs9k79OXJj9; Tue,  9 Feb 2021 10:56:49 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZdb54RQRz9txg8;
 Tue,  9 Feb 2021 10:56:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 694618B7D7;
 Tue,  9 Feb 2021 10:56:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Xn-SJbqpliYn; Tue,  9 Feb 2021 10:56:50 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0B15E8B7D6;
 Tue,  9 Feb 2021 10:56:50 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id D8C4F67342; Tue,  9 Feb 2021 09:56:49 +0000 (UTC)
Message-Id: <d22d2ff8a5cc59a36d4a3a5805cdd4bbca5b5607.1612864003.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612864003.git.christophe.leroy@csgroup.eu>
References: <cover.1612864003.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 25/41] powerpc/32: Set regs parameter in r3 in
 transfer_to_handler
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Feb 2021 09:56:49 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All exception handlers take regs as first parameter.

Instead of setting r3 just before each call to a handler, set
it in transfer_to_handler.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S       |  5 ++---
 arch/powerpc/kernel/head_32.h        |  2 --
 arch/powerpc/kernel/head_40x.S       |  7 -------
 arch/powerpc/kernel/head_8xx.S       |  3 ---
 arch/powerpc/kernel/head_book3s_32.S |  9 ++-------
 arch/powerpc/kernel/head_booke.h     | 11 +----------
 arch/powerpc/kernel/head_fsl_booke.S |  4 +---
 7 files changed, 6 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 9a75ccb800e7..0b4fdc930aa5 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -87,6 +87,7 @@ _ASM_NOKPROBE_SYMBOL(transfer_to_handler_full)
 	.globl	transfer_to_handler
 transfer_to_handler:
 	SAVE_NVGPRS(r11)
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 	stw	r2,GPR2(r11)
 	stw	r12,_NIP(r11)
 	stw	r9,_MSR(r11)
@@ -99,8 +100,7 @@ transfer_to_handler:
 	tovirt(r12, r12)
 	beq	2f			/* if from user, fix up THREAD.regs */
 	addi	r2, r12, -THREAD
-	addi	r11,r1,STACK_FRAME_OVERHEAD
-	stw	r11,PT_REGS(r12)
+	stw	r3,PT_REGS(r12)
 #ifdef CONFIG_PPC_BOOK3S_32
 	kuep_lock r11, r12
 #endif
@@ -228,7 +228,6 @@ ret_from_kernel_thread:
  */
 	.globl	handle_page_fault
 handle_page_fault:
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_page_fault
 	cmpwi	r3,0
 	beq+	ret_from_except
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 087445e45489..4d638d760a96 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -183,7 +183,6 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 #define EXCEPTION(n, label, hdlr, xfer)		\
 	START_EXCEPTION(n, label)		\
 	EXCEPTION_PROLOG label;			\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;	\
 	xfer(n, hdlr)
 
 #define EXC_XFER_TEMPLATE(hdlr, trap, msr, tfer, ret)		\
@@ -215,7 +214,6 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 	lwz	r1, emergency_ctx@l(r1)
 	addi	r1, r1, THREAD_SIZE - INT_FRAME_SIZE
 	EXCEPTION_PROLOG_2 vmap_stack_overflow
-	addi	r3, r1, STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0, stack_overflow_exception)
 .endm
 
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 86883ccb3dc5..08563d4170c6 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -185,7 +185,6 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 #define CRITICAL_EXCEPTION(n, label, hdlr)			\
 	START_EXCEPTION(n, label);				\
 	CRITICAL_EXCEPTION_PROLOG label;				\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;			\
 	EXC_XFER_TEMPLATE(hdlr, n+2, (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), \
 			  crit_transfer_to_handler, ret_from_crit_exc)
 
@@ -227,13 +226,11 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 /* 0x0600 - Alignment Exception */
 	START_EXCEPTION(0x0600, Alignment)
 	EXCEPTION_PROLOG Alignment handle_dar_dsisr=1
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x600, alignment_exception)
 
 /* 0x0700 - Program Exception */
 	START_EXCEPTION(0x0700, ProgramCheck)
 	EXCEPTION_PROLOG ProgramCheck handle_dar_dsisr=1
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x700, program_check_exception)
 
 	EXCEPTION(0x0800, Trap_08, unknown_exception, EXC_XFER_STD)
@@ -494,7 +491,6 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 	/* continue normal handling for a critical exception... */
 2:	mfspr	r4,SPRN_DBSR
 	stw	r4,_ESR(r11)		/* DebugException takes DBSR in _ESR */
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_TEMPLATE(DebugException, 0x2002, \
 		(MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), \
 		crit_transfer_to_handler, ret_from_crit_exc)
@@ -505,21 +501,18 @@ Decrementer:
 	EXCEPTION_PROLOG Decrementer
 	lis	r0,TSR_PIS@h
 	mtspr	SPRN_TSR,r0		/* Clear the PIT exception */
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_LITE(0x1000, timer_interrupt)
 
 	/* Fixed Interval Timer (FIT) Exception. (from 0x1010) */
 	__HEAD
 FITException:
 	EXCEPTION_PROLOG FITException
-	addi	r3,r1,STACK_FRAME_OVERHEAD;
 	EXC_XFER_STD(0x1010, unknown_exception)
 
 	/* Watchdog Timer (WDT) Exception. (from 0x1020) */
 	__HEAD
 WDTException:
 	CRITICAL_EXCEPTION_PROLOG WDTException
-	addi	r3,r1,STACK_FRAME_OVERHEAD;
 	EXC_XFER_TEMPLATE(WatchdogException, 0x1020+2,
 	                  (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)),
 			  crit_transfer_to_handler, ret_from_crit_exc)
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 932702a38234..eb1d40a8f2c4 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -123,7 +123,6 @@ instruction_counter:
 /* Machine check */
 	START_EXCEPTION(0x200, MachineCheck)
 	EXCEPTION_PROLOG MachineCheck handle_dar_dsisr=1
-	addi r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x200, machine_check_exception)
 
 /* External interrupt */
@@ -132,7 +131,6 @@ instruction_counter:
 /* Alignment exception */
 	START_EXCEPTION(0x600, Alignment)
 	EXCEPTION_PROLOG Alignment handle_dar_dsisr=1
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x600, alignment_exception)
 
 /* Program check exception */
@@ -348,7 +346,6 @@ DARFixed:/* Return from dcbx instruction bug workaround */
 
 1:	EXCEPTION_PROLOG_1
 	EXCEPTION_PROLOG_2 DataBreakpoint handle_dar_dsisr=1
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 	mfspr	r4,SPRN_BAR
 	stw	r4,_DAR(r11)
 	EXC_XFER_STD(0x1c00, do_break)
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 24cb245e1c5b..626e9fbac2cc 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -267,7 +267,6 @@ __secondary_hold_acknowledge:
 #endif /* CONFIG_PPC_CHRP */
 	EXCEPTION_PROLOG_1
 7:	EXCEPTION_PROLOG_2 MachineCheck
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_CHRP
 	beq	cr1, 1f
 	twi	31, 0, 0
@@ -337,7 +336,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 /* Alignment exception */
 	START_EXCEPTION(0x600, Alignment)
 	EXCEPTION_PROLOG Alignment handle_dar_dsisr=1
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x600, alignment_exception)
 
 /* Program check exception */
@@ -357,8 +355,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_FPU_UNAVAILABLE)
 	beq	1f
 	bl	load_up_fpu		/* if from user, just load it up */
 	b	fast_exception_return
-1:	addi	r3,r1,STACK_FRAME_OVERHEAD
-	EXC_XFER_LITE(0x800, kernel_fp_unavailable_exception)
+1:	EXC_XFER_LITE(0x800, kernel_fp_unavailable_exception)
 #else
 	b 	ProgramCheck
 #endif
@@ -719,13 +716,11 @@ AltiVecUnavailable:
 	bl	load_up_altivec		/* if from user, just load it up */
 	b	fast_exception_return
 #endif /* CONFIG_ALTIVEC */
-1:	addi	r3,r1,STACK_FRAME_OVERHEAD
-	EXC_XFER_LITE(0xf20, altivec_unavailable_exception)
+1:	EXC_XFER_LITE(0xf20, altivec_unavailable_exception)
 
 	__HEAD
 PerformanceMonitor:
 	EXCEPTION_PROLOG PerformanceMonitor
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0xf00, performance_monitor_exception)
 
 
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index c88c1c474381..740ddf506efc 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -294,13 +294,11 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 #define EXCEPTION(n, intno, label, hdlr, xfer)			\
 	START_EXCEPTION(label);					\
 	NORMAL_EXCEPTION_PROLOG(intno);				\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;			\
 	xfer(n, hdlr)
 
 #define CRITICAL_EXCEPTION(n, intno, label, hdlr)			\
 	START_EXCEPTION(label);						\
 	CRITICAL_EXCEPTION_PROLOG(intno);				\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
 	SAVE_MMU_REGS;							\
 	SAVE_xSRR SRR;							\
 	EXC_XFER_TEMPLATE(hdlr, n+2, (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), \
@@ -311,7 +309,6 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	MCHECK_EXCEPTION_PROLOG;				\
 	mfspr	r5,SPRN_ESR;					\
 	stw	r5,_ESR(r11);					\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;			\
 	SAVE_xSRR DSRR;						\
 	SAVE_xSRR CSRR;						\
 	SAVE_MMU_REGS;						\
@@ -398,7 +395,6 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	/* continue normal handling for a debug exception... */		      \
 2:	mfspr	r4,SPRN_DBSR;						      \
 	stw	r4,_ESR(r11);		/* DebugException takes DBSR in _ESR */\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;				      \
 	SAVE_xSRR CSRR;							      \
 	SAVE_MMU_REGS;							      \
 	SAVE_xSRR SRR;							      \
@@ -455,7 +451,6 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	/* continue normal handling for a critical exception... */	      \
 2:	mfspr	r4,SPRN_DBSR;						      \
 	stw	r4,_ESR(r11);		/* DebugException takes DBSR in _ESR */\
-	addi	r3,r1,STACK_FRAME_OVERHEAD;				      \
 	SAVE_MMU_REGS;							      \
 	SAVE_xSRR SRR;							      \
 	EXC_XFER_TEMPLATE(DebugException, 0x2002, (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), crit_transfer_to_handler, ret_from_crit_exc)
@@ -482,7 +477,6 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	NORMAL_EXCEPTION_PROLOG(ALIGNMENT);		      \
 	mfspr   r4,SPRN_DEAR;           /* Grab the DEAR and save it */	      \
 	stw     r4,_DEAR(r11);						      \
-	addi    r3,r1,STACK_FRAME_OVERHEAD;				      \
 	EXC_XFER_STD(0x0600, alignment_exception)
 
 #define PROGRAM_EXCEPTION						      \
@@ -490,7 +484,6 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	NORMAL_EXCEPTION_PROLOG(PROGRAM);		      \
 	mfspr	r4,SPRN_ESR;		/* Grab the ESR and save it */	      \
 	stw	r4,_ESR(r11);						      \
-	addi	r3,r1,STACK_FRAME_OVERHEAD;				      \
 	EXC_XFER_STD(0x0700, program_check_exception)
 
 #define DECREMENTER_EXCEPTION						      \
@@ -498,7 +491,6 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	NORMAL_EXCEPTION_PROLOG(DECREMENTER);		      \
 	lis     r0,TSR_DIS@h;           /* Setup the DEC interrupt mask */    \
 	mtspr   SPRN_TSR,r0;		/* Clear the DEC interrupt */	      \
-	addi    r3,r1,STACK_FRAME_OVERHEAD;				      \
 	EXC_XFER_LITE(0x0900, timer_interrupt)
 
 #define FP_UNAVAILABLE_EXCEPTION					      \
@@ -507,8 +499,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	beq	1f;							      \
 	bl	load_up_fpu;		/* if from user, just load it up */   \
 	b	fast_exception_return;					      \
-1:	addi	r3,r1,STACK_FRAME_OVERHEAD;				      \
-	EXC_XFER_STD(0x800, kernel_fp_unavailable_exception)
+1:	EXC_XFER_STD(0x800, kernel_fp_unavailable_exception)
 
 #else /* __ASSEMBLY__ */
 struct exception_regs {
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index 3f4a40cccef5..f51c66f747ad 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -372,7 +372,6 @@ interrupt_base:
 	bne	1f
 	EXC_XFER_LITE(0x0300, handle_page_fault)
 1:
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_LITE(0x0300, CacheLockingException)
 
 	/* Instruction Storage Interrupt */
@@ -618,8 +617,7 @@ END_BTB_FLUSH_SECTION
 	beq	1f
 	bl	load_up_spe
 	b	fast_exception_return
-1:	addi	r3,r1,STACK_FRAME_OVERHEAD
-	EXC_XFER_LITE(0x2010, KernelSPE)
+1:	EXC_XFER_LITE(0x2010, KernelSPE)
 #elif defined(CONFIG_SPE_POSSIBLE)
 	EXCEPTION(0x2020, SPE_UNAVAIL, SPEUnavailable, \
 		  unknown_exception, EXC_XFER_STD)
-- 
2.25.0

