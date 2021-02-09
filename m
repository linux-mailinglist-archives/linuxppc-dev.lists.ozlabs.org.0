Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A600A314D87
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 11:52:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZfqb2B0DzDqWy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 21:52:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZdbC42BCzDsTV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 20:56:55 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZdb74pTTz9txgT;
 Tue,  9 Feb 2021 10:56:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9zqXF27KukOz; Tue,  9 Feb 2021 10:56:51 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZdb73rT8z9txg8;
 Tue,  9 Feb 2021 10:56:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 809148B7D7;
 Tue,  9 Feb 2021 10:56:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hysO57WsarBP; Tue,  9 Feb 2021 10:56:52 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1A1BF8B7D6;
 Tue,  9 Feb 2021 10:56:52 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E862A67342; Tue,  9 Feb 2021 09:56:51 +0000 (UTC)
Message-Id: <5c5ee276dccc358faf5db3627d4295665354db21.1612864003.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612864003.git.christophe.leroy@csgroup.eu>
References: <cover.1612864003.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 27/41] powerpc/32: Save trap number on stack in
 exception prolog
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Feb 2021 09:56:51 +0000 (UTC)
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

Saving the trap number into the stack goes into
the exception prolog, as EXC_XFER_xxx will soon disappear.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.h        | 14 ++++-----
 arch/powerpc/kernel/head_40x.S       | 22 +++++++-------
 arch/powerpc/kernel/head_8xx.S       | 14 ++++-----
 arch/powerpc/kernel/head_book3s_32.S | 14 ++++-----
 arch/powerpc/kernel/head_booke.h     | 44 +++++++++++++++-------------
 arch/powerpc/kernel/head_fsl_booke.S |  4 +--
 6 files changed, 58 insertions(+), 54 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 4d638d760a96..bf4c288173ad 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -10,10 +10,10 @@
  * We assume sprg3 has the physical address of the current
  * task's thread_struct.
  */
-.macro EXCEPTION_PROLOG		name handle_dar_dsisr=0
+.macro EXCEPTION_PROLOG		trapno name handle_dar_dsisr=0
 	EXCEPTION_PROLOG_0	handle_dar_dsisr=\handle_dar_dsisr
 	EXCEPTION_PROLOG_1
-	EXCEPTION_PROLOG_2	\name handle_dar_dsisr=\handle_dar_dsisr
+	EXCEPTION_PROLOG_2	\trapno \name handle_dar_dsisr=\handle_dar_dsisr
 .endm
 
 .macro EXCEPTION_PROLOG_0 handle_dar_dsisr=0
@@ -56,7 +56,7 @@
 #endif
 .endm
 
-.macro EXCEPTION_PROLOG_2 name handle_dar_dsisr=0
+.macro EXCEPTION_PROLOG_2 trapno name handle_dar_dsisr=0
 #ifdef CONFIG_PPC_8xx
 	.if	\handle_dar_dsisr
 	li	r11, RPN_PATTERN
@@ -108,6 +108,8 @@
 	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
 	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
 	stw	r10,8(r11)
+	li	r10, \trapno
+	stw	r10,_TRAP(r11)
 	SAVE_4GPRS(3, r11)
 	SAVE_2GPRS(7, r11)
 _ASM_NOKPROBE_SYMBOL(\name\()_virt)
@@ -182,12 +184,10 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 
 #define EXCEPTION(n, label, hdlr, xfer)		\
 	START_EXCEPTION(n, label)		\
-	EXCEPTION_PROLOG label;			\
+	EXCEPTION_PROLOG n label;		\
 	xfer(n, hdlr)
 
 #define EXC_XFER_TEMPLATE(hdlr, trap, msr, tfer, ret)		\
-	li	r10,trap;					\
-	stw	r10,_TRAP(r11);					\
 	bl	tfer;						\
 	bl	hdlr;						\
 	b	ret
@@ -213,7 +213,7 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 #endif
 	lwz	r1, emergency_ctx@l(r1)
 	addi	r1, r1, THREAD_SIZE - INT_FRAME_SIZE
-	EXCEPTION_PROLOG_2 vmap_stack_overflow
+	EXCEPTION_PROLOG_2 0 vmap_stack_overflow
 	EXC_XFER_STD(0, stack_overflow_exception)
 .endm
 
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index a65778380704..7270caff665c 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -104,7 +104,7 @@ _ENTRY(crit_esr)
  * Instead we use a couple of words of memory at low physical addresses.
  * This is OK since we don't support SMP on these processors.
  */
-.macro CRITICAL_EXCEPTION_PROLOG name
+.macro CRITICAL_EXCEPTION_PROLOG trapno name
 	stw	r10,crit_r10@l(0)	/* save two registers to work with */
 	stw	r11,crit_r11@l(0)
 	mfspr	r10,SPRN_SRR0
@@ -161,6 +161,8 @@ _ENTRY(crit_esr)
 	lis	r10, STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
 	addi	r10, r10, STACK_FRAME_REGS_MARKER@l
 	stw	r10, 8(r11)
+	li	r10, \trapno + 2
+	stw	r10,_TRAP(r11)
 	SAVE_4GPRS(3, r11)
 	SAVE_2GPRS(7, r11)
 _ASM_NOKPROBE_SYMBOL(\name\()_virt)
@@ -184,7 +186,7 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
  */
 #define CRITICAL_EXCEPTION(n, label, hdlr)			\
 	START_EXCEPTION(n, label);				\
-	CRITICAL_EXCEPTION_PROLOG label;				\
+	CRITICAL_EXCEPTION_PROLOG n label;				\
 	EXC_XFER_TEMPLATE(hdlr, n+2, (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), \
 			  crit_transfer_to_handler, ret_from_crit_exc)
 
@@ -206,7 +208,7 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
  * if they can't resolve the lightweight TLB fault.
  */
 	START_EXCEPTION(0x0300,	DataStorage)
-	EXCEPTION_PROLOG DataStorage handle_dar_dsisr=1
+	EXCEPTION_PROLOG 0x300 DataStorage handle_dar_dsisr=1
 	EXC_XFER_LITE(0x300, do_page_fault)
 
 /*
@@ -214,7 +216,7 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
  * This is caused by a fetch from non-execute or guarded pages.
  */
 	START_EXCEPTION(0x0400, InstructionAccess)
-	EXCEPTION_PROLOG InstructionAccess
+	EXCEPTION_PROLOG 0x400 InstructionAccess
 	li	r5,0
 	stw	r5, _ESR(r11)		/* Zero ESR */
 	stw	r12, _DEAR(r11)		/* SRR0 as DEAR */
@@ -225,12 +227,12 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 
 /* 0x0600 - Alignment Exception */
 	START_EXCEPTION(0x0600, Alignment)
-	EXCEPTION_PROLOG Alignment handle_dar_dsisr=1
+	EXCEPTION_PROLOG 0x600 Alignment handle_dar_dsisr=1
 	EXC_XFER_STD(0x600, alignment_exception)
 
 /* 0x0700 - Program Exception */
 	START_EXCEPTION(0x0700, ProgramCheck)
-	EXCEPTION_PROLOG ProgramCheck handle_dar_dsisr=1
+	EXCEPTION_PROLOG 0x700 ProgramCheck handle_dar_dsisr=1
 	EXC_XFER_STD(0x700, program_check_exception)
 
 	EXCEPTION(0x0800, Trap_08, unknown_exception, EXC_XFER_STD)
@@ -449,7 +451,7 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
  */
 	/* 0x2000 - Debug Exception */
 	START_EXCEPTION(0x2000, DebugTrap)
-	CRITICAL_EXCEPTION_PROLOG DebugTrap
+	CRITICAL_EXCEPTION_PROLOG 0x2000 DebugTrap
 
 	/*
 	 * If this is a single step or branch-taken exception in an
@@ -498,7 +500,7 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 	/* Programmable Interval Timer (PIT) Exception. (from 0x1000) */
 	__HEAD
 Decrementer:
-	EXCEPTION_PROLOG Decrementer
+	EXCEPTION_PROLOG 0x1000 Decrementer
 	lis	r0,TSR_PIS@h
 	mtspr	SPRN_TSR,r0		/* Clear the PIT exception */
 	EXC_XFER_LITE(0x1000, timer_interrupt)
@@ -506,13 +508,13 @@ Decrementer:
 	/* Fixed Interval Timer (FIT) Exception. (from 0x1010) */
 	__HEAD
 FITException:
-	EXCEPTION_PROLOG FITException
+	EXCEPTION_PROLOG 0x1010 FITException
 	EXC_XFER_STD(0x1010, unknown_exception)
 
 	/* Watchdog Timer (WDT) Exception. (from 0x1020) */
 	__HEAD
 WDTException:
-	CRITICAL_EXCEPTION_PROLOG WDTException
+	CRITICAL_EXCEPTION_PROLOG 0x1020 WDTException
 	EXC_XFER_TEMPLATE(WatchdogException, 0x1020+2,
 	                  (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)),
 			  crit_transfer_to_handler, ret_from_crit_exc)
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 4078d0dc2f18..c48de97f42fc 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -122,7 +122,7 @@ instruction_counter:
 
 /* Machine check */
 	START_EXCEPTION(0x200, MachineCheck)
-	EXCEPTION_PROLOG MachineCheck handle_dar_dsisr=1
+	EXCEPTION_PROLOG 0x200 MachineCheck handle_dar_dsisr=1
 	EXC_XFER_STD(0x200, machine_check_exception)
 
 /* External interrupt */
@@ -130,7 +130,7 @@ instruction_counter:
 
 /* Alignment exception */
 	START_EXCEPTION(0x600, Alignment)
-	EXCEPTION_PROLOG Alignment handle_dar_dsisr=1
+	EXCEPTION_PROLOG 0x600 Alignment handle_dar_dsisr=1
 	EXC_XFER_STD(0x600, alignment_exception)
 
 /* Program check exception */
@@ -292,12 +292,12 @@ instruction_counter:
  * addresses.  There is nothing to do but handle a big time error fault.
  */
 	START_EXCEPTION(0x1300, InstructionTLBError)
-	EXCEPTION_PROLOG InstructionTLBError
+	/* 0x400 is InstructionAccess exception, needed by bad_page_fault() */
+	EXCEPTION_PROLOG 0x400 InstructionTLBError
 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
 	andis.	r10,r9,SRR1_ISI_NOPT@h
 	beq+	.Litlbie
 	tlbie	r12
-	/* 0x400 is InstructionAccess exception, needed by bad_page_fault() */
 .Litlbie:
 	stw	r12, _DAR(r11)
 	stw	r5, _DSISR(r11)
@@ -314,14 +314,14 @@ instruction_counter:
 	beq-	cr1, FixupDAR	/* must be a buggy dcbX, icbi insn. */
 DARFixed:/* Return from dcbx instruction bug workaround */
 	EXCEPTION_PROLOG_1
-	EXCEPTION_PROLOG_2 DataTLBError handle_dar_dsisr=1
+	/* 0x300 is DataAccess exception, needed by bad_page_fault() */
+	EXCEPTION_PROLOG_2 0x300 DataTLBError handle_dar_dsisr=1
 	lwz	r4, _DAR(r11)
 	lwz	r5, _DSISR(r11)
 	andis.	r10,r5,DSISR_NOHPTE@h
 	beq+	.Ldtlbie
 	tlbie	r4
 .Ldtlbie:
-	/* 0x300 is DataAccess exception, needed by bad_page_fault() */
 	EXC_XFER_LITE(0x300, do_page_fault)
 
 #ifdef CONFIG_VMAP_STACK
@@ -345,7 +345,7 @@ DARFixed:/* Return from dcbx instruction bug workaround */
 	rfi
 
 1:	EXCEPTION_PROLOG_1
-	EXCEPTION_PROLOG_2 DataBreakpoint handle_dar_dsisr=1
+	EXCEPTION_PROLOG_2 0x1c00 DataBreakpoint handle_dar_dsisr=1
 	mfspr	r4,SPRN_BAR
 	stw	r4,_DAR(r11)
 	EXC_XFER_STD(0x1c00, do_break)
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 81a6ec098dd1..67dac65b8ec3 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -266,7 +266,7 @@ __secondary_hold_acknowledge:
 	mfspr	r1, SPRN_SPRG_SCRATCH2
 #endif /* CONFIG_PPC_CHRP */
 	EXCEPTION_PROLOG_1
-7:	EXCEPTION_PROLOG_2 MachineCheck
+7:	EXCEPTION_PROLOG_2 0x200 MachineCheck
 #ifdef CONFIG_PPC_CHRP
 	beq	cr1, 1f
 	twi	31, 0, 0
@@ -295,7 +295,7 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
 #endif
 1:	EXCEPTION_PROLOG_0 handle_dar_dsisr=1
 	EXCEPTION_PROLOG_1
-	EXCEPTION_PROLOG_2 DataAccess handle_dar_dsisr=1
+	EXCEPTION_PROLOG_2 0x300 DataAccess handle_dar_dsisr=1
 	lwz	r5, _DSISR(r11)
 	andis.	r0, r5, DSISR_DABRMATCH@h
 	bne-	1f
@@ -324,7 +324,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	andi.	r11, r11, MSR_PR
 
 	EXCEPTION_PROLOG_1
-	EXCEPTION_PROLOG_2 InstructionAccess
+	EXCEPTION_PROLOG_2 0x400 InstructionAccess
 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
 	stw	r5, _DSISR(r11)
 	stw	r12, _DAR(r11)
@@ -335,7 +335,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 
 /* Alignment exception */
 	START_EXCEPTION(0x600, Alignment)
-	EXCEPTION_PROLOG Alignment handle_dar_dsisr=1
+	EXCEPTION_PROLOG 0x600 Alignment handle_dar_dsisr=1
 	EXC_XFER_STD(0x600, alignment_exception)
 
 /* Program check exception */
@@ -351,7 +351,7 @@ BEGIN_FTR_SECTION
  */
 	b 	ProgramCheck
 END_FTR_SECTION_IFSET(CPU_FTR_FPU_UNAVAILABLE)
-	EXCEPTION_PROLOG FPUnavailable
+	EXCEPTION_PROLOG 0x800 FPUnavailable
 	beq	1f
 	bl	load_up_fpu		/* if from user, just load it up */
 	b	fast_exception_return
@@ -710,7 +710,7 @@ fast_hash_page_return:
 
 	__HEAD
 AltiVecUnavailable:
-	EXCEPTION_PROLOG AltiVecUnavailable
+	EXCEPTION_PROLOG 0xf20 AltiVecUnavailable
 #ifdef CONFIG_ALTIVEC
 	beq	1f
 	bl	load_up_altivec		/* if from user, just load it up */
@@ -720,7 +720,7 @@ AltiVecUnavailable:
 
 	__HEAD
 PerformanceMonitor:
-	EXCEPTION_PROLOG PerformanceMonitor
+	EXCEPTION_PROLOG 0xf00 PerformanceMonitor
 	EXC_XFER_STD(0xf00, performance_monitor_exception)
 
 
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 9e7b0192bba7..12add20edbb1 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -44,7 +44,7 @@ END_BTB_FLUSH_SECTION
 #endif
 
 
-#define NORMAL_EXCEPTION_PROLOG(intno)						     \
+#define NORMAL_EXCEPTION_PROLOG(trapno, intno)						     \
 	mtspr	SPRN_SPRG_WSCRATCH0, r10;	/* save one register */	     \
 	mfspr	r10, SPRN_SPRG_THREAD;					     \
 	stw	r11, THREAD_NORMSAVE(0)(r10);				     \
@@ -82,6 +82,8 @@ END_BTB_FLUSH_SECTION
 	lis	r10, STACK_FRAME_REGS_MARKER@ha;/* exception frame marker */ \
 	addi	r10, r10, STACK_FRAME_REGS_MARKER@l;			     \
 	stw	r10, 8(r11);						     \
+	li	r10, trapno;						     \
+	stw	r10,_TRAP(r11);						     \
 	SAVE_4GPRS(3, r11);						     \
 	SAVE_2GPRS(7, r11)
 
@@ -182,7 +184,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
  * registers as the normal prolog above. Instead we use a portion of the
  * critical/machine check exception stack at low physical addresses.
  */
-#define EXC_LEVEL_EXCEPTION_PROLOG(exc_level, intno, exc_level_srr0, exc_level_srr1) \
+#define EXC_LEVEL_EXCEPTION_PROLOG(exc_level, trapno, intno, exc_level_srr0, exc_level_srr1) \
 	mtspr	SPRN_SPRG_WSCRATCH_##exc_level,r8;			     \
 	BOOKE_LOAD_EXC_LEVEL_STACK(exc_level);/* r8 points to the exc_level stack*/ \
 	stw	r9,GPR9(r8);		/* save various registers	   */\
@@ -225,6 +227,8 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	stw	r1,0(r11);						     \
 	mr	r1,r11;							     \
 	rlwinm	r9,r9,0,14,12;		/* clear MSR_WE (necessary?)	   */\
+	li	r10, trapno;						     \
+	stw	r10,_TRAP(r11);						     \
 	stw	r0,GPR0(r11);						     \
 	SAVE_4GPRS(3, r11);						     \
 	SAVE_2GPRS(7, r11)
@@ -259,12 +263,12 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 #endif
 .endm
 
-#define CRITICAL_EXCEPTION_PROLOG(intno) \
-		EXC_LEVEL_EXCEPTION_PROLOG(CRIT, intno, SPRN_CSRR0, SPRN_CSRR1)
-#define DEBUG_EXCEPTION_PROLOG \
-		EXC_LEVEL_EXCEPTION_PROLOG(DBG, DEBUG, SPRN_DSRR0, SPRN_DSRR1)
-#define MCHECK_EXCEPTION_PROLOG \
-		EXC_LEVEL_EXCEPTION_PROLOG(MC, MACHINE_CHECK, \
+#define CRITICAL_EXCEPTION_PROLOG(trapno, intno) \
+		EXC_LEVEL_EXCEPTION_PROLOG(CRIT, trapno+2, intno, SPRN_CSRR0, SPRN_CSRR1)
+#define DEBUG_EXCEPTION_PROLOG(trapno) \
+		EXC_LEVEL_EXCEPTION_PROLOG(DBG, trapno+8, DEBUG, SPRN_DSRR0, SPRN_DSRR1)
+#define MCHECK_EXCEPTION_PROLOG(trapno) \
+		EXC_LEVEL_EXCEPTION_PROLOG(MC, trapno+4, MACHINE_CHECK, \
 			SPRN_MCSRR0, SPRN_MCSRR1)
 
 /*
@@ -293,12 +297,12 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 
 #define EXCEPTION(n, intno, label, hdlr, xfer)			\
 	START_EXCEPTION(label);					\
-	NORMAL_EXCEPTION_PROLOG(intno);				\
+	NORMAL_EXCEPTION_PROLOG(n, intno);			\
 	xfer(n, hdlr)
 
 #define CRITICAL_EXCEPTION(n, intno, label, hdlr)			\
 	START_EXCEPTION(label);						\
-	CRITICAL_EXCEPTION_PROLOG(intno);				\
+	CRITICAL_EXCEPTION_PROLOG(n, intno);				\
 	SAVE_MMU_REGS;							\
 	SAVE_xSRR SRR;							\
 	EXC_XFER_TEMPLATE(hdlr, n+2, (MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)), \
@@ -306,7 +310,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 
 #define MCHECK_EXCEPTION(n, label, hdlr)			\
 	START_EXCEPTION(label);					\
-	MCHECK_EXCEPTION_PROLOG;				\
+	MCHECK_EXCEPTION_PROLOG(n);				\
 	mfspr	r5,SPRN_ESR;					\
 	stw	r5,_ESR(r11);					\
 	SAVE_xSRR DSRR;						\
@@ -317,8 +321,6 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 			  mcheck_transfer_to_handler, ret_from_mcheck_exc)
 
 #define EXC_XFER_TEMPLATE(hdlr, trap, msr, tfer, ret)	\
-	li	r10,trap;					\
-	stw	r10,_TRAP(r11);					\
 	bl	tfer;						\
 	bl	hdlr;						\
 	b	ret;						\
@@ -346,7 +348,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
  */
 #define DEBUG_DEBUG_EXCEPTION						      \
 	START_EXCEPTION(DebugDebug);					      \
-	DEBUG_EXCEPTION_PROLOG;						      \
+	DEBUG_EXCEPTION_PROLOG(2000);						      \
 									      \
 	/*								      \
 	 * If there is a single step or branch-taken exception in an	      \
@@ -402,7 +404,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 
 #define DEBUG_CRIT_EXCEPTION						      \
 	START_EXCEPTION(DebugCrit);					      \
-	CRITICAL_EXCEPTION_PROLOG(DEBUG);				      \
+	CRITICAL_EXCEPTION_PROLOG(2000,DEBUG);				      \
 									      \
 	/*								      \
 	 * If there is a single step or branch-taken exception in an	      \
@@ -457,7 +459,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 
 #define DATA_STORAGE_EXCEPTION						      \
 	START_EXCEPTION(DataStorage)					      \
-	NORMAL_EXCEPTION_PROLOG(DATA_STORAGE);		      \
+	NORMAL_EXCEPTION_PROLOG(0x300, DATA_STORAGE);		      \
 	mfspr	r5,SPRN_ESR;		/* Grab the ESR and save it */	      \
 	stw	r5,_ESR(r11);						      \
 	mfspr	r4,SPRN_DEAR;		/* Grab the DEAR */		      \
@@ -466,7 +468,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 
 #define INSTRUCTION_STORAGE_EXCEPTION					      \
 	START_EXCEPTION(InstructionStorage)				      \
-	NORMAL_EXCEPTION_PROLOG(INST_STORAGE);		      \
+	NORMAL_EXCEPTION_PROLOG(0x400, INST_STORAGE);		      \
 	mfspr	r5,SPRN_ESR;		/* Grab the ESR and save it */	      \
 	stw	r5,_ESR(r11);						      \
 	stw	r12, _DEAR(r11);	/* Pass SRR0 as arg2 */		      \
@@ -474,28 +476,28 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 
 #define ALIGNMENT_EXCEPTION						      \
 	START_EXCEPTION(Alignment)					      \
-	NORMAL_EXCEPTION_PROLOG(ALIGNMENT);		      \
+	NORMAL_EXCEPTION_PROLOG(0x600, ALIGNMENT);		      \
 	mfspr   r4,SPRN_DEAR;           /* Grab the DEAR and save it */	      \
 	stw     r4,_DEAR(r11);						      \
 	EXC_XFER_STD(0x0600, alignment_exception)
 
 #define PROGRAM_EXCEPTION						      \
 	START_EXCEPTION(Program)					      \
-	NORMAL_EXCEPTION_PROLOG(PROGRAM);		      \
+	NORMAL_EXCEPTION_PROLOG(0x700, PROGRAM);		      \
 	mfspr	r4,SPRN_ESR;		/* Grab the ESR and save it */	      \
 	stw	r4,_ESR(r11);						      \
 	EXC_XFER_STD(0x0700, program_check_exception)
 
 #define DECREMENTER_EXCEPTION						      \
 	START_EXCEPTION(Decrementer)					      \
-	NORMAL_EXCEPTION_PROLOG(DECREMENTER);		      \
+	NORMAL_EXCEPTION_PROLOG(0x900, DECREMENTER);		      \
 	lis     r0,TSR_DIS@h;           /* Setup the DEC interrupt mask */    \
 	mtspr   SPRN_TSR,r0;		/* Clear the DEC interrupt */	      \
 	EXC_XFER_LITE(0x0900, timer_interrupt)
 
 #define FP_UNAVAILABLE_EXCEPTION					      \
 	START_EXCEPTION(FloatingPointUnavailable)			      \
-	NORMAL_EXCEPTION_PROLOG(FP_UNAVAIL);		      \
+	NORMAL_EXCEPTION_PROLOG(0x800, FP_UNAVAIL);		      \
 	beq	1f;							      \
 	bl	load_up_fpu;		/* if from user, just load it up */   \
 	b	fast_exception_return;					      \
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index 72e9aa45b99b..bf2730b4e43b 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -363,7 +363,7 @@ interrupt_base:
 
 	/* Data Storage Interrupt */
 	START_EXCEPTION(DataStorage)
-	NORMAL_EXCEPTION_PROLOG(DATA_STORAGE)
+	NORMAL_EXCEPTION_PROLOG(0x300, DATA_STORAGE)
 	mfspr	r5,SPRN_ESR		/* Grab the ESR, save it */
 	stw	r5,_ESR(r11)
 	mfspr	r4,SPRN_DEAR		/* Grab the DEAR, save it */
@@ -613,7 +613,7 @@ END_BTB_FLUSH_SECTION
 #ifdef CONFIG_SPE
 	/* SPE Unavailable */
 	START_EXCEPTION(SPEUnavailable)
-	NORMAL_EXCEPTION_PROLOG(SPE_UNAVAIL)
+	NORMAL_EXCEPTION_PROLOG(0x2010, SPE_UNAVAIL)
 	beq	1f
 	bl	load_up_spe
 	b	fast_exception_return
-- 
2.25.0

