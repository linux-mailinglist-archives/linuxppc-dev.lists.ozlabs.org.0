Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F67314CD7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 11:25:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZfCy1wRnzDsc0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 21:25:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZdZx2FfNzDqqy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 20:56:41 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZdZs1NLWz9txgB;
 Tue,  9 Feb 2021 10:56:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 7kpAlsur4FQ0; Tue,  9 Feb 2021 10:56:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZdZr6zfBz9txg8;
 Tue,  9 Feb 2021 10:56:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF9018B7D6;
 Tue,  9 Feb 2021 10:56:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YlCMFDQ0-tLw; Tue,  9 Feb 2021 10:56:37 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7B9EC8B7D4;
 Tue,  9 Feb 2021 10:56:37 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 576E767342; Tue,  9 Feb 2021 09:56:37 +0000 (UTC)
Message-Id: <f285c6903492dfe4c608b0465752f0b44ec1a0b4.1612864003.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612864003.git.christophe.leroy@csgroup.eu>
References: <cover.1612864003.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 13/41] powerpc/32: Always enable data translation in
 exception prolog
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Feb 2021 09:56:37 +0000 (UTC)
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

If the code can use a stack in vm area, it can also use a
stack in linear space.

Simplify code by removing old non VMAP stack code on PPC32.

That means the data translation is now re-enabled early in
exception prolog in all cases, not only when using VMAP stacks.

While we are touching EXCEPTION_PROLOG macros, remove the
unused for_rtas parameter in EXCEPTION_PROLOG_1.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/processor.h |  4 +-
 arch/powerpc/kernel/asm-offsets.c    |  2 -
 arch/powerpc/kernel/entry_32.S       | 19 +++----
 arch/powerpc/kernel/fpu.S            |  2 -
 arch/powerpc/kernel/head_32.h        | 85 +---------------------------
 arch/powerpc/kernel/head_40x.S       | 23 --------
 arch/powerpc/kernel/head_8xx.S       | 19 +------
 arch/powerpc/kernel/head_book3s_32.S | 47 +--------------
 arch/powerpc/kernel/idle_6xx.S       | 12 +---
 arch/powerpc/kernel/idle_e500.S      |  4 +-
 arch/powerpc/kernel/vector.S         |  2 -
 arch/powerpc/mm/book3s32/hash_low.S  | 14 -----
 12 files changed, 17 insertions(+), 216 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index 43cbd9281055..eae16facc390 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -147,11 +147,9 @@ struct thread_struct {
 #ifdef CONFIG_PPC_RTAS
 	unsigned long	rtas_sp;	/* stack pointer for when in RTAS */
 #endif
-#endif
 #if defined(CONFIG_PPC_BOOK3S_32) && defined(CONFIG_PPC_KUAP)
 	unsigned long	kuap;		/* opened segments for user access */
 #endif
-#ifdef CONFIG_VMAP_STACK
 	unsigned long	srr0;
 	unsigned long	srr1;
 	unsigned long	dar;
@@ -160,7 +158,7 @@ struct thread_struct {
 	unsigned long	r0, r3, r4, r5, r6, r8, r9, r11;
 	unsigned long	lr, ctr;
 #endif
-#endif
+#endif /* CONFIG_PPC32 */
 	/* Debug Registers */
 	struct debug_reg debug;
 #ifdef CONFIG_PPC_FPU_REGS
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 1f47d4e0f3b5..d500ee82212a 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -131,7 +131,6 @@ int main(void)
 	OFFSET(KSP_VSID, thread_struct, ksp_vsid);
 #else /* CONFIG_PPC64 */
 	OFFSET(PGDIR, thread_struct, pgdir);
-#ifdef CONFIG_VMAP_STACK
 	OFFSET(SRR0, thread_struct, srr0);
 	OFFSET(SRR1, thread_struct, srr1);
 	OFFSET(DAR, thread_struct, dar);
@@ -148,7 +147,6 @@ int main(void)
 	OFFSET(THLR, thread_struct, lr);
 	OFFSET(THCTR, thread_struct, ctr);
 #endif
-#endif
 #ifdef CONFIG_SPE
 	OFFSET(THREAD_EVR0, thread_struct, evr[0]);
 	OFFSET(THREAD_ACC, thread_struct, acc);
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 23f46e697546..0b6af35acdfd 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -129,7 +129,7 @@ transfer_to_handler:
 	stw	r12,_CTR(r11)
 	stw	r2,_XER(r11)
 	mfspr	r12,SPRN_SPRG_THREAD
-	tovirt_vmstack r12, r12
+	tovirt(r12, r12)
 	beq	2f			/* if from user, fix up THREAD.regs */
 	addi	r2, r12, -THREAD
 	addi	r11,r1,STACK_FRAME_OVERHEAD
@@ -154,8 +154,7 @@ transfer_to_handler:
 transfer_to_handler_cont:
 3:
 	mflr	r9
-	tovirt_novmstack r2, r2 	/* set r2 to current */
-	tovirt_vmstack r9, r9
+	tovirt(r9, r9)
 	lwz	r11,0(r9)		/* virtual address of handler */
 	lwz	r9,4(r9)		/* where to go when done */
 #if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
@@ -933,7 +932,6 @@ _GLOBAL(enter_rtas)
 	lis	r6,1f@ha	/* physical return address for rtas */
 	addi	r6,r6,1f@l
 	tophys(r6,r6)
-	tophys_novmstack r7, r1
 	lwz	r8,RTASENTRY(r4)
 	lwz	r4,RTASBASE(r4)
 	mfmsr	r9
@@ -942,22 +940,19 @@ _GLOBAL(enter_rtas)
 	mtmsr	r0	/* disable interrupts so SRR0/1 don't get trashed */
 	li	r9,MSR_KERNEL & ~(MSR_IR|MSR_DR)
 	mtlr	r6
-	stw	r7, THREAD + RTAS_SP(r2)
+	stw	r1, THREAD + RTAS_SP(r2)
 	mtspr	SPRN_SRR0,r8
 	mtspr	SPRN_SRR1,r9
 	rfi
-1:	tophys_novmstack r9, r1
-#ifdef CONFIG_VMAP_STACK
+1:
 	li	r0, MSR_KERNEL & ~MSR_IR	/* can take DTLB miss */
 	mtmsr	r0
 	isync
-#endif
-	lwz	r8,INT_FRAME_SIZE+4(r9)	/* get return address */
-	lwz	r9,8(r9)	/* original msr value */
+	lwz	r8,INT_FRAME_SIZE+4(r1)	/* get return address */
+	lwz	r9,8(r1)	/* original msr value */
 	addi	r1,r1,INT_FRAME_SIZE
 	li	r0,0
-	tophys_novmstack r7, r2
-	stw	r0, THREAD + RTAS_SP(r7)
+	stw	r0, THREAD + RTAS_SP(r2)
 	mtspr	SPRN_SRR0,r8
 	mtspr	SPRN_SRR1,r9
 	rfi			/* return to caller */
diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
index 3ff9a8fafa46..2c57ece6671c 100644
--- a/arch/powerpc/kernel/fpu.S
+++ b/arch/powerpc/kernel/fpu.S
@@ -92,9 +92,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 	/* enable use of FP after return */
 #ifdef CONFIG_PPC32
 	mfspr	r5,SPRN_SPRG_THREAD	/* current task's THREAD (phys) */
-#ifdef CONFIG_VMAP_STACK
 	tovirt(r5, r5)
-#endif
 	lwz	r4,THREAD_FPEXC_MODE(r5)
 	ori	r9,r9,MSR_FP		/* enable FP for current */
 	or	r9,r9,r4
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 25ee6b26ef5a..1b707755c68e 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -19,7 +19,6 @@
 .macro EXCEPTION_PROLOG_0 handle_dar_dsisr=0
 	mtspr	SPRN_SPRG_SCRATCH0,r10
 	mtspr	SPRN_SPRG_SCRATCH1,r11
-#ifdef CONFIG_VMAP_STACK
 	mfspr	r10, SPRN_SPRG_THREAD
 	.if	\handle_dar_dsisr
 #ifdef CONFIG_40x
@@ -37,17 +36,13 @@
 	.endif
 	mfspr	r11, SPRN_SRR0
 	stw	r11, SRR0(r10)
-#endif
 	mfspr	r11, SPRN_SRR1		/* check whether user or kernel */
-#ifdef CONFIG_VMAP_STACK
 	stw	r11, SRR1(r10)
-#endif
 	mfcr	r10
 	andi.	r11, r11, MSR_PR
 .endm
 
-.macro EXCEPTION_PROLOG_1 for_rtas=0
-#ifdef CONFIG_VMAP_STACK
+.macro EXCEPTION_PROLOG_1
 	mtspr	SPRN_SPRG_SCRATCH2,r1
 	subi	r1, r1, INT_FRAME_SIZE		/* use r1 if kernel */
 	beq	1f
@@ -55,20 +50,13 @@
 	lwz	r1,TASK_STACK-THREAD(r1)
 	addi	r1, r1, THREAD_SIZE - INT_FRAME_SIZE
 1:
+#ifdef CONFIG_VMAP_STACK
 	mtcrf	0x3f, r1
 	bt	32 - THREAD_ALIGN_SHIFT, stack_overflow
-#else
-	subi	r11, r1, INT_FRAME_SIZE		/* use r1 if kernel */
-	beq	1f
-	mfspr	r11,SPRN_SPRG_THREAD
-	lwz	r11,TASK_STACK-THREAD(r11)
-	addi	r11, r11, THREAD_SIZE - INT_FRAME_SIZE
-1:	tophys(r11, r11)
 #endif
 .endm
 
 .macro EXCEPTION_PROLOG_2 handle_dar_dsisr=0
-#ifdef CONFIG_VMAP_STACK
 	LOAD_REG_IMMEDIATE(r11, MSR_KERNEL & ~(MSR_IR | MSR_RI)) /* can take DTLB miss */
 	mtmsr	r11
 	isync
@@ -76,11 +64,6 @@
 	stw	r11,GPR1(r1)
 	stw	r11,0(r1)
 	mr	r11, r1
-#else
-	stw	r1,GPR1(r11)
-	stw	r1,0(r11)
-	tovirt(r1, r11)		/* set new kernel sp */
-#endif
 	stw	r10,_CCR(r11)		/* save registers */
 	stw	r12,GPR12(r11)
 	stw	r9,GPR9(r11)
@@ -90,7 +73,6 @@
 	stw	r12,GPR11(r11)
 	mflr	r10
 	stw	r10,_LINK(r11)
-#ifdef CONFIG_VMAP_STACK
 	mfspr	r12, SPRN_SPRG_THREAD
 	tovirt(r12, r12)
 	.if	\handle_dar_dsisr
@@ -101,20 +83,12 @@
 	.endif
 	lwz	r9, SRR1(r12)
 	lwz	r12, SRR0(r12)
-#else
-	mfspr	r12,SPRN_SRR0
-	mfspr	r9,SPRN_SRR1
-#endif
 #ifdef CONFIG_40x
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
 #elif defined(CONFIG_PPC_8xx)
 	mtspr	SPRN_EID, r2		/* Set MSR_RI */
 #else
-#ifdef CONFIG_VMAP_STACK
 	li	r10, MSR_KERNEL & ~MSR_IR /* can take exceptions */
-#else
-	li	r10,MSR_KERNEL & ~(MSR_IR|MSR_DR) /* can take exceptions */
-#endif
 	mtmsr	r10			/* (except for mach check in rtas) */
 #endif
 	stw	r0,GPR0(r11)
@@ -166,59 +140,6 @@
 	b	transfer_to_syscall		/* jump to handler */
 .endm
 
-.macro save_dar_dsisr_on_stack reg1, reg2, sp
-#ifndef CONFIG_VMAP_STACK
-#ifdef CONFIG_40x
-	mfspr	\reg1, SPRN_DEAR
-	mfspr	\reg2, SPRN_ESR
-#else
-	mfspr	\reg1, SPRN_DAR
-	mfspr	\reg2, SPRN_DSISR
-#endif
-	stw	\reg1, _DAR(\sp)
-	stw	\reg2, _DSISR(\sp)
-#endif
-.endm
-
-.macro get_and_save_dar_dsisr_on_stack reg1, reg2, sp
-#ifdef CONFIG_VMAP_STACK
-	lwz	\reg1, _DAR(\sp)
-	lwz	\reg2, _DSISR(\sp)
-#else
-	save_dar_dsisr_on_stack \reg1, \reg2, \sp
-#endif
-.endm
-
-.macro tovirt_vmstack dst, src
-#ifdef CONFIG_VMAP_STACK
-	tovirt(\dst, \src)
-#else
-	.ifnc	\dst, \src
-	mr	\dst, \src
-	.endif
-#endif
-.endm
-
-.macro tovirt_novmstack dst, src
-#ifndef CONFIG_VMAP_STACK
-	tovirt(\dst, \src)
-#else
-	.ifnc	\dst, \src
-	mr	\dst, \src
-	.endif
-#endif
-.endm
-
-.macro tophys_novmstack dst, src
-#ifndef CONFIG_VMAP_STACK
-	tophys(\dst, \src)
-#else
-	.ifnc	\dst, \src
-	mr	\dst, \src
-	.endif
-#endif
-.endm
-
 /*
  * Note: code which follows this uses cr0.eq (set if from kernel),
  * r11, r12 (SRR0), and r9 (SRR1).
@@ -266,7 +187,6 @@
 			  ret_from_except)
 
 .macro vmap_stack_overflow_exception
-#ifdef CONFIG_VMAP_STACK
 #ifdef CONFIG_SMP
 	mfspr	r1, SPRN_SPRG_THREAD
 	lwz	r1, TASK_CPU - THREAD(r1)
@@ -285,7 +205,6 @@
 	SAVE_NVGPRS(r11)
 	addi	r3, r1, STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0, stack_overflow_exception)
-#endif
 .endm
 
 #endif /* __HEAD_32_H__ */
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 72e4962902de..7da673ec63ef 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -111,12 +111,10 @@ _ENTRY(crit_esr)
 	mfspr	r11,SPRN_SRR1
 	stw	r10,crit_srr0@l(0)
 	stw	r11,crit_srr1@l(0)
-#ifdef CONFIG_VMAP_STACK
 	mfspr	r10,SPRN_DEAR
 	mfspr	r11,SPRN_ESR
 	stw	r10,crit_dear@l(0)
 	stw	r11,crit_esr@l(0)
-#endif
 	mfcr	r10			/* save CR in r10 for now	   */
 	mfspr	r11,SPRN_SRR3		/* check whether user or kernel    */
 	andi.	r11,r11,MSR_PR
@@ -126,7 +124,6 @@ _ENTRY(crit_esr)
 	/* COMING FROM USER MODE */
 	mfspr	r11,SPRN_SPRG_THREAD	/* if from user, start at top of   */
 	lwz	r11,TASK_STACK-THREAD(r11) /* this thread's kernel stack */
-#ifdef CONFIG_VMAP_STACK
 1:	stw	r1,crit_r1@l(0)
 	addi	r1,r11,THREAD_SIZE-INT_FRAME_SIZE /* Alloc an excpt frm  */
 	LOAD_REG_IMMEDIATE(r11,MSR_KERNEL & ~(MSR_IR | MSR_RI))
@@ -136,35 +133,18 @@ _ENTRY(crit_esr)
 	stw	r11,GPR1(r1)
 	stw	r11,0(r1)
 	mr	r11,r1
-#else
-1:	addi	r11,r11,THREAD_SIZE-INT_FRAME_SIZE /* Alloc an excpt frm  */
-	tophys(r11,r11)
-	stw	r1,GPR1(r11)
-	stw	r1,0(r11)
-	tovirt(r1,r11)
-#endif
 	stw	r10,_CCR(r11)		/* save various registers	   */
 	stw	r12,GPR12(r11)
 	stw	r9,GPR9(r11)
 	mflr	r10
 	stw	r10,_LINK(r11)
-#ifdef CONFIG_VMAP_STACK
 	lis	r9,PAGE_OFFSET@ha
 	lwz	r10,crit_r10@l(r9)
 	lwz	r12,crit_r11@l(r9)
-#else
-	lwz	r10,crit_r10@l(0)
-	lwz	r12,crit_r11@l(0)
-#endif
 	stw	r10,GPR10(r11)
 	stw	r12,GPR11(r11)
-#ifdef CONFIG_VMAP_STACK
 	lwz	r12,crit_dear@l(r9)
 	lwz	r9,crit_esr@l(r9)
-#else
-	mfspr	r12,SPRN_DEAR		/* save DEAR and ESR in the frame  */
-	mfspr	r9,SPRN_ESR		/* in them at the point where the  */
-#endif
 	stw	r12,_DEAR(r11)		/* since they may have had stuff   */
 	stw	r9,_ESR(r11)		/* exception was taken		   */
 	mfspr	r12,SPRN_SRR2
@@ -220,7 +200,6 @@ _ENTRY(crit_esr)
  */
 	START_EXCEPTION(0x0300,	DataStorage)
 	EXCEPTION_PROLOG handle_dar_dsisr=1
-	save_dar_dsisr_on_stack	r4, r5, r11
 	EXC_XFER_LITE(0x300, handle_page_fault)
 
 /*
@@ -240,14 +219,12 @@ _ENTRY(crit_esr)
 /* 0x0600 - Alignment Exception */
 	START_EXCEPTION(0x0600, Alignment)
 	EXCEPTION_PROLOG handle_dar_dsisr=1
-	save_dar_dsisr_on_stack r4, r5, r11
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x600, alignment_exception)
 
 /* 0x0700 - Program Exception */
 	START_EXCEPTION(0x0700, ProgramCheck)
 	EXCEPTION_PROLOG handle_dar_dsisr=1
-	save_dar_dsisr_on_stack r4, r5, r11
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	EXC_XFER_STD(0x700, program_check_exception)
 
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 46dff3f9c31f..792e2fd86479 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -124,7 +124,6 @@ instruction_counter:
 	. = 0x200
 MachineCheck:
 	EXCEPTION_PROLOG handle_dar_dsisr=1
-	save_dar_dsisr_on_stack r4, r5, r11
 	li	r6, RPN_PATTERN
 	mtspr	SPRN_DAR, r6	/* Tag DAR, to be used in DTLB Error */
 	addi r3,r1,STACK_FRAME_OVERHEAD
@@ -137,7 +136,6 @@ MachineCheck:
 	. = 0x600
 Alignment:
 	EXCEPTION_PROLOG handle_dar_dsisr=1
-	save_dar_dsisr_on_stack r4, r5, r11
 	li	r6, RPN_PATTERN
 	mtspr	SPRN_DAR, r6	/* Tag DAR, to be used in DTLB Error */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -333,21 +331,16 @@ DataTLBError:
 	cmpwi	cr1, r11, RPN_PATTERN
 	beq-	cr1, FixupDAR	/* must be a buggy dcbX, icbi insn. */
 DARFixed:/* Return from dcbx instruction bug workaround */
-#ifdef CONFIG_VMAP_STACK
 	li	r11, RPN_PATTERN
 	mtspr	SPRN_DAR, r11	/* Tag DAR, to be used in DTLB Error */
-#endif
 	EXCEPTION_PROLOG_1
 	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
-	get_and_save_dar_dsisr_on_stack r4, r5, r11
+	lwz	r4, _DAR(r11)
+	lwz	r5, _DSISR(r11)
 	andis.	r10,r5,DSISR_NOHPTE@h
 	beq+	.Ldtlbie
 	tlbie	r4
 .Ldtlbie:
-#ifndef CONFIG_VMAP_STACK
-	li	r10,RPN_PATTERN
-	mtspr	SPRN_DAR,r10	/* Tag DAR, to be used in DTLB Error */
-#endif
 	/* 0x300 is DataAccess exception, needed by bad_page_fault() */
 	EXC_XFER_LITE(0x300, handle_page_fault)
 
@@ -364,10 +357,6 @@ do_databreakpoint:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	mfspr	r4,SPRN_BAR
 	stw	r4,_DAR(r11)
-#ifndef CONFIG_VMAP_STACK
-	mfspr	r5,SPRN_DSISR
-	stw	r5,_DSISR(r11)
-#endif
 	EXC_XFER_STD(0x1c00, do_break)
 
 	. = 0x1c00
@@ -510,14 +499,10 @@ FixupDAR:/* Entry point for dcbx workaround. */
 152:
 	mfdar	r11
 	mtctr	r11			/* restore ctr reg from DAR */
-#ifdef CONFIG_VMAP_STACK
 	mfspr	r11, SPRN_SPRG_THREAD
 	stw	r10, DAR(r11)
 	mfspr	r10, SPRN_DSISR
 	stw	r10, DSISR(r11)
-#else
-	mtdar	r10			/* save fault EA to DAR */
-#endif
 	mfspr	r10,SPRN_M_TW
 	b	DARFixed		/* Go back to normal TLB handling */
 
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 727fdab557c9..59efbee7c080 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -260,21 +260,14 @@ __secondary_hold_acknowledge:
 MachineCheck:
 	EXCEPTION_PROLOG_0
 #ifdef CONFIG_PPC_CHRP
-#ifdef CONFIG_VMAP_STACK
 	mtspr	SPRN_SPRG_SCRATCH2,r1
 	mfspr	r1, SPRN_SPRG_THREAD
 	lwz	r1, RTAS_SP(r1)
 	cmpwi	cr1, r1, 0
 	bne	cr1, 7f
 	mfspr	r1, SPRN_SPRG_SCRATCH2
-#else
-	mfspr	r11, SPRN_SPRG_THREAD
-	lwz	r11, RTAS_SP(r11)
-	cmpwi	cr1, r11, 0
-	bne	cr1, 7f
-#endif
 #endif /* CONFIG_PPC_CHRP */
-	EXCEPTION_PROLOG_1 for_rtas=1
+	EXCEPTION_PROLOG_1
 7:	EXCEPTION_PROLOG_2
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_CHRP
@@ -288,7 +281,6 @@ MachineCheck:
 	. = 0x300
 	DO_KVM  0x300
 DataAccess:
-#ifdef CONFIG_VMAP_STACK
 #ifdef CONFIG_PPC_BOOK3S_604
 BEGIN_MMU_FTR_SECTION
 	mtspr	SPRN_SPRG_SCRATCH2,r10
@@ -310,29 +302,11 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
 1:	EXCEPTION_PROLOG_0 handle_dar_dsisr=1
 	EXCEPTION_PROLOG_1
 	b	handle_page_fault_tramp_1
-#else	/* CONFIG_VMAP_STACK */
-	EXCEPTION_PROLOG handle_dar_dsisr=1
-	get_and_save_dar_dsisr_on_stack	r4, r5, r11
-#ifdef CONFIG_PPC_BOOK3S_604
-BEGIN_MMU_FTR_SECTION
-	andis.	r0, r5, (DSISR_BAD_FAULT_32S | DSISR_DABRMATCH)@h
-	bne	handle_page_fault_tramp_2	/* if not, try to put a PTE */
-	rlwinm	r3, r5, 32 - 15, 21, 21		/* DSISR_STORE -> _PAGE_RW */
-	bl	hash_page
-	b	handle_page_fault_tramp_1
-MMU_FTR_SECTION_ELSE
-#endif
-	b	handle_page_fault_tramp_2
-#ifdef CONFIG_PPC_BOOK3S_604
-ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_HPTE_TABLE)
-#endif
-#endif	/* CONFIG_VMAP_STACK */
 
 /* Instruction access exception. */
 	. = 0x400
 	DO_KVM  0x400
 InstructionAccess:
-#ifdef CONFIG_VMAP_STACK
 	mtspr	SPRN_SPRG_SCRATCH0,r10
 	mtspr	SPRN_SPRG_SCRATCH1,r11
 	mfspr	r10, SPRN_SPRG_THREAD
@@ -353,18 +327,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 
 	EXCEPTION_PROLOG_1
 	EXCEPTION_PROLOG_2
-#else	/* CONFIG_VMAP_STACK */
-	EXCEPTION_PROLOG
-	andis.	r0,r9,SRR1_ISI_NOPT@h	/* no pte found? */
-	beq	1f			/* if so, try to put a PTE */
-	li	r3,0			/* into the hash table */
-	mr	r4,r12			/* SRR0 is fault address */
-#ifdef CONFIG_PPC_BOOK3S_604
-BEGIN_MMU_FTR_SECTION
-	bl	hash_page
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
-#endif
-#endif	/* CONFIG_VMAP_STACK */
 	andis.	r5,r9,DSISR_SRR1_MATCH_32S@h /* Filter relevant SRR1 bits */
 	stw	r5, _DSISR(r11)
 	stw	r12, _DAR(r11)
@@ -378,7 +340,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	DO_KVM  0x600
 Alignment:
 	EXCEPTION_PROLOG handle_dar_dsisr=1
-	save_dar_dsisr_on_stack r4, r5, r11
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	b	alignment_exception_tramp
 
@@ -686,18 +647,13 @@ alignment_exception_tramp:
 	EXC_XFER_STD(0x600, alignment_exception)
 
 handle_page_fault_tramp_1:
-#ifdef CONFIG_VMAP_STACK
 	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
-#endif
 	lwz	r5, _DSISR(r11)
-	/* fall through */
-handle_page_fault_tramp_2:
 	andis.	r0, r5, DSISR_DABRMATCH@h
 	bne-	1f
 	EXC_XFER_LITE(0x300, handle_page_fault)
 1:	EXC_XFER_STD(0x300, do_break)
 
-#ifdef CONFIG_VMAP_STACK
 #ifdef CONFIG_PPC_BOOK3S_604
 .macro save_regs_thread		thread
 	stw	r0, THR0(\thread)
@@ -772,6 +728,7 @@ fast_hash_page_return:
 	rfi
 #endif /* CONFIG_PPC_BOOK3S_604 */
 
+#ifdef CONFIG_VMAP_STACK
 stack_overflow:
 	vmap_stack_overflow_exception
 #endif
diff --git a/arch/powerpc/kernel/idle_6xx.S b/arch/powerpc/kernel/idle_6xx.S
index 69df840f7253..153366e178c4 100644
--- a/arch/powerpc/kernel/idle_6xx.S
+++ b/arch/powerpc/kernel/idle_6xx.S
@@ -145,9 +145,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 
 /*
  * Return from NAP/DOZE mode, restore some CPU specific registers,
- * we are called with DR/IR still off and r2 containing physical
- * address of current.  R11 points to the exception frame (physical
- * address).  We have to preserve r10.
+ * R11 points to the exception frame. We have to preserve r10.
  */
 _GLOBAL(power_save_ppc32_restore)
 	lwz	r9,_LINK(r11)		/* interrupted in ppc6xx_idle: */
@@ -166,11 +164,7 @@ BEGIN_FTR_SECTION
 	mfspr	r9,SPRN_HID0
 	andis.	r9,r9,HID0_NAP@h
 	beq	1f
-#ifdef CONFIG_VMAP_STACK
 	addis	r9, r11, nap_save_msscr0@ha
-#else
-	addis	r9,r11,(nap_save_msscr0-KERNELBASE)@ha
-#endif
 	lwz	r9,nap_save_msscr0@l(r9)
 	mtspr	SPRN_MSSCR0, r9
 	sync
@@ -178,11 +172,7 @@ BEGIN_FTR_SECTION
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_NAP_DISABLE_L2_PR)
 BEGIN_FTR_SECTION
-#ifdef CONFIG_VMAP_STACK
 	addis	r9, r11, nap_save_hid1@ha
-#else
-	addis	r9,r11,(nap_save_hid1-KERNELBASE)@ha
-#endif
 	lwz	r9,nap_save_hid1@l(r9)
 	mtspr	SPRN_HID1, r9
 END_FTR_SECTION_IFSET(CPU_FTR_DUAL_PLL_750FX)
diff --git a/arch/powerpc/kernel/idle_e500.S b/arch/powerpc/kernel/idle_e500.S
index 72c85b6f3898..7795727e7f08 100644
--- a/arch/powerpc/kernel/idle_e500.S
+++ b/arch/powerpc/kernel/idle_e500.S
@@ -74,8 +74,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
 
 /*
  * Return from NAP/DOZE mode, restore some CPU specific registers,
- * r2 containing physical address of current.
- * r11 points to the exception frame (physical address).
+ * r2 containing address of current.
+ * r11 points to the exception frame.
  * We have to preserve r10.
  */
 _GLOBAL(power_save_ppc32_restore)
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index 801dc28fdcca..f5a52f444e36 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -67,9 +67,7 @@ _GLOBAL(load_up_altivec)
 #ifdef CONFIG_PPC32
 	mfspr	r5,SPRN_SPRG_THREAD		/* current task's THREAD (phys) */
 	oris	r9,r9,MSR_VEC@h
-#ifdef CONFIG_VMAP_STACK
 	tovirt(r5, r5)
-#endif
 #else
 	ld	r4,PACACURRENT(r13)
 	addi	r5,r4,THREAD		/* Get THREAD */
diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index 0e6dc830c38b..fb4233a5bdf7 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -140,10 +140,6 @@ _GLOBAL(hash_page)
 	bne-	.Lretry			/* retry if someone got there first */
 
 	mfsrin	r3,r4			/* get segment reg for segment */
-#ifndef CONFIG_VMAP_STACK
-	mfctr	r0
-	stw	r0,_CTR(r11)
-#endif
 	bl	create_hpte		/* add the hash table entry */
 
 #ifdef CONFIG_SMP
@@ -152,17 +148,7 @@ _GLOBAL(hash_page)
 	li	r0,0
 	stw	r0, (mmu_hash_lock - PAGE_OFFSET)@l(r8)
 #endif
-
-#ifdef CONFIG_VMAP_STACK
 	b	fast_hash_page_return
-#else
-	/* Return from the exception */
-	lwz	r5,_CTR(r11)
-	mtctr	r5
-	lwz	r0,GPR0(r11)
-	lwz	r8,GPR8(r11)
-	b	fast_exception_return
-#endif
 
 #ifdef CONFIG_SMP
 .Lhash_page_out:
-- 
2.25.0

