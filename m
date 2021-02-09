Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71506314D9D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 11:58:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZfyT5DxMzDrcH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 21:58:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZdbG52r9zDsTb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 20:56:58 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZdbB62KLz9txgY;
 Tue,  9 Feb 2021 10:56:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id h_fq3iiw_08u; Tue,  9 Feb 2021 10:56:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZdbB5GRlz9txgW;
 Tue,  9 Feb 2021 10:56:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B003D8B7D4;
 Tue,  9 Feb 2021 10:56:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fFX3evgk_4J8; Tue,  9 Feb 2021 10:56:55 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 34ADB8B7D7;
 Tue,  9 Feb 2021 10:56:55 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0AD1B67342; Tue,  9 Feb 2021 09:56:55 +0000 (UTC)
Message-Id: <05508c9c1dcd45f4faae8908b1af82f6012cf970.1612864003.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612864003.git.christophe.leroy@csgroup.eu>
References: <cover.1612864003.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 30/41] powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Feb 2021 09:56:55 +0000 (UTC)
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

In order to get more control in exception prolog, dismantle
all non standard exception macros, finishing with EXC_XFER_STD
and EXC_XFER_LITE and EXC_XFER_TEMPLATE.

Also remove transfer_to_handler_full and ret_from_except and
ret_from_except_full as they are not used anymore.

Last parameter of EXCEPTION() is now ignored, will be removed
in a later patch to avoid too much churn.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S       | 40 -----------------------
 arch/powerpc/kernel/head_32.h        | 21 ++++--------
 arch/powerpc/kernel/head_40x.S       | 33 ++++++++++++-------
 arch/powerpc/kernel/head_8xx.S       | 12 +++++--
 arch/powerpc/kernel/head_book3s_32.S | 27 ++++++++++-----
 arch/powerpc/kernel/head_booke.h     | 49 +++++++++++++++-------------
 arch/powerpc/kernel/head_fsl_booke.S | 14 +++++---
 7 files changed, 91 insertions(+), 105 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index d8a913f850ef..75ca010bd78d 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -48,30 +48,6 @@
  */
 	.align	12
 
-#ifdef CONFIG_BOOKE
-	.globl	mcheck_transfer_to_handler
-mcheck_transfer_to_handler:
-	/* fall through */
-_ASM_NOKPROBE_SYMBOL(mcheck_transfer_to_handler)
-
-	.globl	debug_transfer_to_handler
-debug_transfer_to_handler:
-	/* fall through */
-_ASM_NOKPROBE_SYMBOL(debug_transfer_to_handler)
-
-	.globl	crit_transfer_to_handler
-crit_transfer_to_handler:
-	/* fall through */
-_ASM_NOKPROBE_SYMBOL(crit_transfer_to_handler)
-#endif
-
-#ifdef CONFIG_40x
-	.globl	crit_transfer_to_handler
-crit_transfer_to_handler:
-	/* fall through */
-_ASM_NOKPROBE_SYMBOL(crit_transfer_to_handler)
-#endif
-
 /*
  * This code finishes saving the registers to the exception frame
  * and jumps to the appropriate handler for the exception, turning
@@ -79,13 +55,6 @@ _ASM_NOKPROBE_SYMBOL(crit_transfer_to_handler)
  * Note that we rely on the caller having set cr0.eq iff the exception
  * occurred in kernel mode (i.e. MSR:PR = 0).
  */
-	.globl	transfer_to_handler_full
-transfer_to_handler_full:
-_ASM_NOKPROBE_SYMBOL(transfer_to_handler_full)
-	/* fall through */
-
-	.globl	transfer_to_handler
-transfer_to_handler:
 	.globl	prepare_transfer_to_handler
 prepare_transfer_to_handler:
 	SAVE_NVGPRS(r11)
@@ -136,7 +105,6 @@ transfer_to_handler_cont:
 	b	fast_exception_return
 #endif
 _ASM_NOKPROBE_SYMBOL(prepare_transfer_to_handler)
-_ASM_NOKPROBE_SYMBOL(transfer_to_handler)
 _ASM_NOKPROBE_SYMBOL(transfer_to_handler_cont)
 
 	.globl	transfer_to_syscall
@@ -333,14 +301,6 @@ fast_exception_return:
 #endif
 _ASM_NOKPROBE_SYMBOL(fast_exception_return)
 
-	.globl	ret_from_except_full
-ret_from_except_full:
-	/* fall through */
-
-	.globl	ret_from_except
-ret_from_except:
-_ASM_NOKPROBE_SYMBOL(ret_from_except)
-
 	.globl interrupt_return
 interrupt_return:
 	lwz	r4,_MSR(r1)
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 3ab0f3ad9a6a..412ede8610f7 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -189,20 +189,9 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 #define EXCEPTION(n, label, hdlr, xfer)		\
 	START_EXCEPTION(n, label)		\
 	EXCEPTION_PROLOG n label;		\
-	xfer(n, hdlr)
-
-#define EXC_XFER_TEMPLATE(hdlr, trap, msr, tfer, ret)		\
-	bl	tfer;						\
-	bl	hdlr;						\
-	b	ret
-
-#define EXC_XFER_STD(n, hdlr)		\
-	EXC_XFER_TEMPLATE(hdlr, n, MSR_KERNEL, transfer_to_handler_full,	\
-			  ret_from_except_full)
-
-#define EXC_XFER_LITE(n, hdlr)		\
-	EXC_XFER_TEMPLATE(hdlr, n, MSR_KERNEL, transfer_to_handler, \
-			  ret_from_except)
+	prepare_transfer_to_handler;		\
+	bl	hdlr;				\
+	b	interrupt_return
 
 .macro vmap_stack_overflow_exception
 	__HEAD
@@ -218,7 +207,9 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 	lwz	r1, emergency_ctx@l(r1)
 	addi	r1, r1, THREAD_SIZE - INT_FRAME_SIZE
 	EXCEPTION_PROLOG_2 0 vmap_stack_overflow
-	EXC_XFER_STD(0, stack_overflow_exception)
+	prepare_transfer_to_handler
+	bl	stack_overflow_exception
+	b	interrupt_return
 .endm
 
 #endif /* __HEAD_32_H__ */
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index f3e5b462113f..7eb49ebd6000 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -187,8 +187,9 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 #define CRITICAL_EXCEPTION(n, label, hdlr)			\
 	START_EXCEPTION(n, label);				\
 	CRITICAL_EXCEPTION_PROLOG n label;				\
-	EXC_XFER_TEMPLATE(hdlr, n+2, (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), \
-			  crit_transfer_to_handler, ret_from_crit_exc)
+	prepare_transfer_to_handler;				\
+	bl	hdlr;						\
+	b	ret_from_crit_exc
 
 /*
  * 0x0100 - Critical Interrupt Exception
@@ -209,7 +210,9 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
  */
 	START_EXCEPTION(0x0300,	DataStorage)
 	EXCEPTION_PROLOG 0x300 DataStorage handle_dar_dsisr=1
-	EXC_XFER_LITE(0x300, do_page_fault)
+	prepare_transfer_to_handler
+	bl	do_page_fault
+	b	interrupt_return
 
 /*
  * 0x0400 - Instruction Storage Exception
@@ -220,7 +223,9 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 	li	r5,0
 	stw	r5, _ESR(r11)		/* Zero ESR */
 	stw	r12, _DEAR(r11)		/* SRR0 as DEAR */
-	EXC_XFER_LITE(0x400, do_page_fault)
+	prepare_transfer_to_handler
+	bl	do_page_fault
+	b	interrupt_return
 
 /* 0x0500 - External Interrupt Exception */
 	EXCEPTION(0x0500, HardwareInterrupt, do_IRQ, EXC_XFER_LITE)
@@ -499,9 +504,9 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 	/* continue normal handling for a critical exception... */
 2:	mfspr	r4,SPRN_DBSR
 	stw	r4,_ESR(r11)		/* DebugException takes DBSR in _ESR */
-	EXC_XFER_TEMPLATE(DebugException, 0x2002, \
-		(MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), \
-		crit_transfer_to_handler, ret_from_crit_exc)
+	prepare_transfer_to_handler
+	bl	DebugException
+	b	ret_from_crit_exc
 
 	/* Programmable Interval Timer (PIT) Exception. (from 0x1000) */
 	__HEAD
@@ -509,21 +514,25 @@ Decrementer:
 	EXCEPTION_PROLOG 0x1000 Decrementer
 	lis	r0,TSR_PIS@h
 	mtspr	SPRN_TSR,r0		/* Clear the PIT exception */
-	EXC_XFER_LITE(0x1000, timer_interrupt)
+	prepare_transfer_to_handler
+	bl	timer_interrupt
+	b	interrupt_return
 
 	/* Fixed Interval Timer (FIT) Exception. (from 0x1010) */
 	__HEAD
 FITException:
 	EXCEPTION_PROLOG 0x1010 FITException
-	EXC_XFER_STD(0x1010, unknown_exception)
+	prepare_transfer_to_handler
+	bl	unknown_exception
+	b	interrupt_return
 
 	/* Watchdog Timer (WDT) Exception. (from 0x1020) */
 	__HEAD
 WDTException:
 	CRITICAL_EXCEPTION_PROLOG 0x1020 WDTException
-	EXC_XFER_TEMPLATE(WatchdogException, 0x1020+2,
-	                  (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)),
-			  crit_transfer_to_handler, ret_from_crit_exc)
+	prepare_transfer_to_handler
+	bl	WatchdogException
+	b	ret_from_crit_exc
 
 /* Other PowerPC processors, namely those derived from the 6xx-series
  * have vectors from 0x2100 through 0x2F00 defined, but marked as reserved.
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 86f844eb0e5a..4d73549722a1 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -123,7 +123,9 @@ instruction_counter:
 /* Machine check */
 	START_EXCEPTION(0x200, MachineCheck)
 	EXCEPTION_PROLOG 0x200 MachineCheck handle_dar_dsisr=1
-	EXC_XFER_STD(0x200, machine_check_exception)
+	prepare_transfer_to_handler
+	bl	machine_check_exception
+	b	interrupt_return
 
 /* External interrupt */
 	EXCEPTION(0x500, HardwareInterrupt, do_IRQ, EXC_XFER_LITE)
@@ -314,7 +316,9 @@ instruction_counter:
 .Litlbie:
 	stw	r12, _DAR(r11)
 	stw	r5, _DSISR(r11)
-	EXC_XFER_LITE(0x400, do_page_fault)
+	prepare_transfer_to_handler
+	bl	do_page_fault
+	b	interrupt_return
 
 /* This is the data TLB error on the MPC8xx.  This could be due to
  * many reasons, including a dirty update to a pte.  We bail out to
@@ -335,7 +339,9 @@ DARFixed:/* Return from dcbx instruction bug workaround */
 	beq+	.Ldtlbie
 	tlbie	r4
 .Ldtlbie:
-	EXC_XFER_LITE(0x300, do_page_fault)
+	prepare_transfer_to_handler
+	bl	do_page_fault
+	b	interrupt_return
 
 #ifdef CONFIG_VMAP_STACK
 	vmap_stack_overflow_exception
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 609b2eedd4f9..0082342f0ae6 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -271,7 +271,9 @@ __secondary_hold_acknowledge:
 	beq	cr1, 1f
 	twi	31, 0, 0
 #endif
-1:	EXC_XFER_STD(0x200, machine_check_exception)
+1:	prepare_transfer_to_handler
+	bl	machine_check_exception
+	b	interrupt_return
 
 /* Data access exception. */
 	START_EXCEPTION(0x300, DataAccess)
@@ -296,12 +298,13 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
 1:	EXCEPTION_PROLOG_0 handle_dar_dsisr=1
 	EXCEPTION_PROLOG_1
 	EXCEPTION_PROLOG_2 0x300 DataAccess handle_dar_dsisr=1
+	prepare_transfer_to_handler
 	lwz	r5, _DSISR(r11)
 	andis.	r0, r5, DSISR_DABRMATCH@h
 	bne-	1f
-	EXC_XFER_LITE(0x300, do_page_fault)
-1:	prepare_transfer_to_handler
-	bl	do_break
+	bl	do_page_fault
+	b	interrupt_return
+1:	bl	do_break
 	REST_NVGPRS(r1)
 	b	interrupt_return
 
@@ -331,7 +334,9 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
 	stw	r5, _DSISR(r11)
 	stw	r12, _DAR(r11)
-	EXC_XFER_LITE(0x400, do_page_fault)
+	prepare_transfer_to_handler
+	bl	do_page_fault
+	b	interrupt_return
 
 /* External interrupt */
 	EXCEPTION(0x500, HardwareInterrupt, do_IRQ, EXC_XFER_LITE)
@@ -366,7 +371,9 @@ END_FTR_SECTION_IFSET(CPU_FTR_FPU_UNAVAILABLE)
 	beq	1f
 	bl	load_up_fpu		/* if from user, just load it up */
 	b	fast_exception_return
-1:	EXC_XFER_LITE(0x800, kernel_fp_unavailable_exception)
+1:	prepare_transfer_to_handler
+	bl	kernel_fp_unavailable_exception
+	b	interrupt_return
 #else
 	b 	ProgramCheck
 #endif
@@ -727,12 +734,16 @@ AltiVecUnavailable:
 	bl	load_up_altivec		/* if from user, just load it up */
 	b	fast_exception_return
 #endif /* CONFIG_ALTIVEC */
-1:	EXC_XFER_LITE(0xf20, altivec_unavailable_exception)
+1:	prepare_transfer_to_handler
+	bl	altivec_unavailable_exception
+	b	interrupt_return
 
 	__HEAD
 PerformanceMonitor:
 	EXCEPTION_PROLOG 0xf00 PerformanceMonitor
-	EXC_XFER_STD(0xf00, performance_monitor_exception)
+	prepare_transfer_to_handler
+	bl	performance_monitor_exception
+	b	interrupt_return
 
 
 	__HEAD
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 809d1c6c9af9..ae6ce924b49a 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -302,15 +302,18 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 #define EXCEPTION(n, intno, label, hdlr, xfer)			\
 	START_EXCEPTION(label);					\
 	NORMAL_EXCEPTION_PROLOG(n, intno);			\
-	xfer(n, hdlr)
+	prepare_transfer_to_handler;				\
+	bl	hdlr;						\
+	b	interrupt_return
 
 #define CRITICAL_EXCEPTION(n, intno, label, hdlr)			\
 	START_EXCEPTION(label);						\
 	CRITICAL_EXCEPTION_PROLOG(n, intno);				\
 	SAVE_MMU_REGS;							\
 	SAVE_xSRR SRR;							\
-	EXC_XFER_TEMPLATE(hdlr, n+2, (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), \
-			  crit_transfer_to_handler, ret_from_crit_exc)
+	prepare_transfer_to_handler;					\
+	bl	hdlr;							\
+	b	ret_from_crit_exc
 
 #define MCHECK_EXCEPTION(n, label, hdlr)			\
 	START_EXCEPTION(label);					\
@@ -321,21 +324,9 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	SAVE_xSRR CSRR;						\
 	SAVE_MMU_REGS;						\
 	SAVE_xSRR SRR;						\
-	EXC_XFER_TEMPLATE(hdlr, n+4, (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), \
-			  mcheck_transfer_to_handler, ret_from_mcheck_exc)
-
-#define EXC_XFER_TEMPLATE(hdlr, trap, msr, tfer, ret)	\
-	bl	tfer;						\
+	prepare_transfer_to_handler;				\
 	bl	hdlr;						\
-	b	ret;						\
-
-#define EXC_XFER_STD(n, hdlr)		\
-	EXC_XFER_TEMPLATE(hdlr, n, MSR_KERNEL, transfer_to_handler_full, \
-			  ret_from_except_full)
-
-#define EXC_XFER_LITE(n, hdlr)		\
-	EXC_XFER_TEMPLATE(hdlr, n, MSR_KERNEL, transfer_to_handler, \
-			  ret_from_except)
+	b	ret_from_mcheck_exc
 
 /* Check for a single step debug exception while in an exception
  * handler before state has been saved.  This is to catch the case
@@ -404,7 +395,9 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	SAVE_xSRR CSRR;							      \
 	SAVE_MMU_REGS;							      \
 	SAVE_xSRR SRR;							      \
-	EXC_XFER_TEMPLATE(DebugException, 0x2008, (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), debug_transfer_to_handler, ret_from_debug_exc)
+	prepare_transfer_to_handler;				      \
+	bl	DebugException;						      \
+	b	ret_from_debug_exc
 
 #define DEBUG_CRIT_EXCEPTION						      \
 	START_EXCEPTION(DebugCrit);					      \
@@ -459,7 +452,9 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	stw	r4,_ESR(r11);		/* DebugException takes DBSR in _ESR */\
 	SAVE_MMU_REGS;							      \
 	SAVE_xSRR SRR;							      \
-	EXC_XFER_TEMPLATE(DebugException, 0x2002, (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), crit_transfer_to_handler, ret_from_crit_exc)
+	prepare_transfer_to_handler;				      	      \
+	bl	DebugException;						      \
+	b	ret_from_crit_exc
 
 #define DATA_STORAGE_EXCEPTION						      \
 	START_EXCEPTION(DataStorage)					      \
@@ -468,7 +463,9 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	stw	r5,_ESR(r11);						      \
 	mfspr	r4,SPRN_DEAR;		/* Grab the DEAR */		      \
 	stw	r4, _DEAR(r11);						      \
-	EXC_XFER_LITE(0x0300, do_page_fault)
+	prepare_transfer_to_handler;					      \
+	bl	do_page_fault;						      \
+	b	interrupt_return
 
 #define INSTRUCTION_STORAGE_EXCEPTION					      \
 	START_EXCEPTION(InstructionStorage)				      \
@@ -476,7 +473,9 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	mfspr	r5,SPRN_ESR;		/* Grab the ESR and save it */	      \
 	stw	r5,_ESR(r11);						      \
 	stw	r12, _DEAR(r11);	/* Pass SRR0 as arg2 */		      \
-	EXC_XFER_LITE(0x0400, do_page_fault)
+	prepare_transfer_to_handler;					      \
+	bl	do_page_fault;						      \
+	b	interrupt_return
 
 #define ALIGNMENT_EXCEPTION						      \
 	START_EXCEPTION(Alignment)					      \
@@ -503,7 +502,9 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	NORMAL_EXCEPTION_PROLOG(0x900, DECREMENTER);		      \
 	lis     r0,TSR_DIS@h;           /* Setup the DEC interrupt mask */    \
 	mtspr   SPRN_TSR,r0;		/* Clear the DEC interrupt */	      \
-	EXC_XFER_LITE(0x0900, timer_interrupt)
+	prepare_transfer_to_handler;					      \
+	bl	timer_interrupt;					      \
+	b	interrupt_return
 
 #define FP_UNAVAILABLE_EXCEPTION					      \
 	START_EXCEPTION(FloatingPointUnavailable)			      \
@@ -511,7 +512,9 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	beq	1f;							      \
 	bl	load_up_fpu;		/* if from user, just load it up */   \
 	b	fast_exception_return;					      \
-1:	EXC_XFER_STD(0x800, kernel_fp_unavailable_exception)
+1:	prepare_transfer_to_handler;					      \
+	bl	kernel_fp_unavailable_exception;			      \
+	b	interrupt_return
 
 #else /* __ASSEMBLY__ */
 struct exception_regs {
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index 210871b2eb41..48d022b1f508 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -370,9 +370,13 @@ interrupt_base:
 	stw	r4, _DEAR(r11)
 	andis.	r10,r5,(ESR_ILK|ESR_DLK)@h
 	bne	1f
-	EXC_XFER_LITE(0x0300, do_page_fault)
+	prepare_transfer_to_handler
+	bl	do_page_fault
+	b	interrupt_return
 1:
-	EXC_XFER_LITE(0x0300, CacheLockingException)
+	prepare_transfer_to_handler
+	bl	CacheLockingException
+	b	interrupt_return
 
 	/* Instruction Storage Interrupt */
 	INSTRUCTION_STORAGE_EXCEPTION
@@ -617,7 +621,9 @@ END_BTB_FLUSH_SECTION
 	beq	1f
 	bl	load_up_spe
 	b	fast_exception_return
-1:	EXC_XFER_LITE(0x2010, KernelSPE)
+1:	prepare_transfer_to_handler
+	bl	KernelSPE
+	b	interrupt_return
 #elif defined(CONFIG_SPE_POSSIBLE)
 	EXCEPTION(0x2020, SPE_UNAVAIL, SPEUnavailable, \
 		  unknown_exception, EXC_XFER_STD)
@@ -860,7 +866,7 @@ KernelSPE:
 	lwz	r5,_NIP(r1)
 	bl	printk
 #endif
-	b	ret_from_except
+	b	interrupt_return
 #ifdef CONFIG_PRINTK
 87:	.string	"SPE used in kernel  (task=%p, pc=%x)  \n"
 #endif
-- 
2.25.0

