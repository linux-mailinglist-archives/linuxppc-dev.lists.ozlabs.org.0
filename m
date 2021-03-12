Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88243338DFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 13:58:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dxm8Z42z7z3h34
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 23:58:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxlzL2phrz3dMM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 23:50:38 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DxlzG2QvYz9ttBX;
 Fri, 12 Mar 2021 13:50:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bNTthzEm_pNP; Fri, 12 Mar 2021 13:50:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DxlzG1Ytgz9ttDF;
 Fri, 12 Mar 2021 13:50:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3F7F48B812;
 Fri, 12 Mar 2021 13:50:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PqMHwASxOLrX; Fri, 12 Mar 2021 13:50:35 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 771328B764;
 Fri, 12 Mar 2021 13:50:34 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4F854675C9; Fri, 12 Mar 2021 12:50:34 +0000 (UTC)
Message-Id: <48f8bae91da899d8e73fc0d75c9af66cc97b4d5b.1615552867.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615552866.git.christophe.leroy@csgroup.eu>
References: <cover.1615552866.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 24/41] powerpc/32: Replace ASM exception exit by C
 exception exit from ppc64
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Fri, 12 Mar 2021 12:50:34 +0000 (UTC)
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

This patch replaces the PPC32 ASM exception exit by C exception exit.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/entry_32.S  | 436 +++++++++-----------------------
 arch/powerpc/kernel/interrupt.c |   6 +-
 2 files changed, 123 insertions(+), 319 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 7084289994b3..79311d0bd09b 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -336,7 +336,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_SPE)
 fast_exception_return:
 #if !(defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
 	andi.	r10,r9,MSR_RI		/* check for recoverable interrupt */
-	beq	1f			/* if not, we've got problems */
+	beq	3f			/* if not, we've got problems */
 #endif
 
 2:	REST_4GPRS(3, r11)
@@ -363,30 +363,6 @@ fast_exception_return:
 #endif
 _ASM_NOKPROBE_SYMBOL(fast_exception_return)
 
-#if !(defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
-/* check if the exception happened in a restartable section */
-1:	lis	r3,exc_exit_restart_end@ha
-	addi	r3,r3,exc_exit_restart_end@l
-	cmplw	r12,r3
-	bge	3f
-	lis	r4,exc_exit_restart@ha
-	addi	r4,r4,exc_exit_restart@l
-	cmplw	r12,r4
-	blt	3f
-	lis	r3,fee_restarts@ha
-	tophys(r3,r3)
-	lwz	r5,fee_restarts@l(r3)
-	addi	r5,r5,1
-	stw	r5,fee_restarts@l(r3)
-	mr	r12,r4		/* restart at exc_exit_restart */
-	b	2b
-
-	.section .bss
-	.align	2
-fee_restarts:
-	.space	4
-	.previous
-
 /* aargh, a nonrecoverable interrupt, panic */
 /* aargh, we don't know which trap this is */
 3:
@@ -395,8 +371,7 @@ fee_restarts:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	transfer_to_handler_full
 	bl	unrecoverable_exception
-	b	ret_from_except
-#endif
+	trap	/* should not get here */
 
 	.globl	ret_from_except_full
 ret_from_except_full:
@@ -405,213 +380,145 @@ ret_from_except_full:
 
 	.globl	ret_from_except
 ret_from_except:
-	/* Hard-disable interrupts so that current_thread_info()->flags
-	 * can't change between when we test it and when we return
-	 * from the interrupt. */
-	/* Note: We don't bother telling lockdep about it */
-	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL)
-	mtmsr	r10		/* disable interrupts */
-
-	lwz	r3,_MSR(r1)	/* Returning to user mode? */
-	andi.	r0,r3,MSR_PR
-	beq	resume_kernel
-
-user_exc_return:		/* r10 contains MSR_KERNEL here */
-	/* Check current_thread_info()->flags */
-	lwz	r9,TI_FLAGS(r2)
-	andi.	r0,r9,_TIF_USER_WORK_MASK
-	bne	do_work
-
-restore_user:
-#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
-	/* Check whether this process has its own DBCR0 value.  The internal
-	   debug mode bit tells us that dbcr0 should be loaded. */
-	lwz	r0,THREAD+THREAD_DBCR0(r2)
-	andis.	r10,r0,DBCR0_IDM@h
-	bnel-	load_dbcr0
-#endif
-	ACCOUNT_CPU_USER_EXIT(r2, r10, r11)
+_ASM_NOKPROBE_SYMBOL(ret_from_except)
+
+	.globl interrupt_return
+interrupt_return:
+	lwz	r4,_MSR(r1)
+	addi	r3,r1,STACK_FRAME_OVERHEAD
+	andi.	r0,r4,MSR_PR
+	beq	.Lkernel_interrupt_return
+	bl	interrupt_exit_user_prepare
+	cmpwi	r3,0
+	bne-	.Lrestore_nvgprs
+
+.Lfast_user_interrupt_return:
 #ifdef CONFIG_PPC_BOOK3S_32
 	kuep_unlock	r10, r11
 #endif
+	kuap_check r2, r4
+	lwz	r11,_NIP(r1)
+	lwz	r12,_MSR(r1)
+	mtspr	SPRN_SRR0,r11
+	mtspr	SPRN_SRR1,r12
 
-	b	restore
-
-/* N.B. the only way to get here is from the beq following ret_from_except. */
-resume_kernel:
-	/* check current_thread_info, _TIF_EMULATE_STACK_STORE */
-	lwz	r8,TI_FLAGS(r2)
-	andis.	r0,r8,_TIF_EMULATE_STACK_STORE@h
-	beq+	1f
+BEGIN_FTR_SECTION
+	stwcx.	r0,0,r1		/* to clear the reservation */
+FTR_SECTION_ELSE
+	lwarx	r0,0,r1
+ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
-	addi	r8,r1,INT_FRAME_SIZE	/* Get the kprobed function entry */
+	lwz	r3,_CCR(r1)
+	lwz	r4,_LINK(r1)
+	lwz	r5,_CTR(r1)
+	lwz	r6,_XER(r1)
+	li	r0,0
 
-	lwz	r3,GPR1(r1)
-	subi	r3,r3,INT_FRAME_SIZE	/* dst: Allocate a trampoline exception frame */
-	mr	r4,r1			/* src:  current exception frame */
-	mr	r1,r3			/* Reroute the trampoline frame to r1 */
+	/*
+	 * Leaving a stale exception_marker on the stack can confuse
+	 * the reliable stack unwinder later on. Clear it.
+	 */
+	stw	r0,8(r1)
+	REST_4GPRS(7, r1)
+	REST_2GPRS(11, r1)
 
-	/* Copy from the original to the trampoline. */
-	li	r5,INT_FRAME_SIZE/4	/* size: INT_FRAME_SIZE */
-	li	r6,0			/* start offset: 0 */
+	mtcr	r3
+	mtlr	r4
 	mtctr	r5
-2:	lwzx	r0,r6,r4
-	stwx	r0,r6,r3
-	addi	r6,r6,4
-	bdnz	2b
-
-	/* Do real store operation to complete stwu */
-	lwz	r5,GPR1(r1)
-	stw	r8,0(r5)
-
-	/* Clear _TIF_EMULATE_STACK_STORE flag */
-	lis	r11,_TIF_EMULATE_STACK_STORE@h
-	addi	r5,r2,TI_FLAGS
-0:	lwarx	r8,0,r5
-	andc	r8,r8,r11
-	stwcx.	r8,0,r5
-	bne-	0b
-1:
+	mtspr	SPRN_XER,r6
 
-#ifdef CONFIG_PREEMPTION
-	/* check current_thread_info->preempt_count */
-	lwz	r0,TI_PREEMPT(r2)
-	cmpwi	0,r0,0		/* if non-zero, just restore regs and return */
-	bne	restore_kuap
-	andi.	r8,r8,_TIF_NEED_RESCHED
-	beq+	restore_kuap
-	lwz	r3,_MSR(r1)
-	andi.	r0,r3,MSR_EE	/* interrupts off? */
-	beq	restore_kuap	/* don't schedule if so */
-#ifdef CONFIG_TRACE_IRQFLAGS
-	/* Lockdep thinks irqs are enabled, we need to call
-	 * preempt_schedule_irq with IRQs off, so we inform lockdep
-	 * now that we -did- turn them off already
-	 */
-	bl	trace_hardirqs_off
-#endif
-	bl	preempt_schedule_irq
-#ifdef CONFIG_TRACE_IRQFLAGS
-	/* And now, to properly rebalance the above, we tell lockdep they
-	 * are being turned back on, which will happen when we return
-	 */
-	bl	trace_hardirqs_on
+	REST_4GPRS(2, r1)
+	REST_GPR(6, r1)
+	REST_GPR(0, r1)
+	REST_GPR(1, r1)
+	rfi
+#ifdef CONFIG_40x
+	b .	/* Prevent prefetch past rfi */
 #endif
-#endif /* CONFIG_PREEMPTION */
-restore_kuap:
-	kuap_restore r1, r2, r9, r10, r0
 
-	/* interrupts are hard-disabled at this point */
-restore:
-#if defined(CONFIG_44x) && !defined(CONFIG_PPC_47x)
-	lis	r4,icache_44x_need_flush@ha
-	lwz	r5,icache_44x_need_flush@l(r4)
-	cmplwi	cr0,r5,0
-	beq+	1f
-	li	r6,0
-	iccci	r0,r0
-	stw	r6,icache_44x_need_flush@l(r4)
-1:
-#endif  /* CONFIG_44x */
-
-	lwz	r9,_MSR(r1)
-#ifdef CONFIG_TRACE_IRQFLAGS
-	/* Lockdep doesn't know about the fact that IRQs are temporarily turned
-	 * off in this assembly code while peeking at TI_FLAGS() and such. However
-	 * we need to inform it if the exception turned interrupts off, and we
-	 * are about to trun them back on.
-	 */
-	andi.	r10,r9,MSR_EE
-	beq	1f
-	stwu	r1,-32(r1)
-	mflr	r0
-	stw	r0,4(r1)
-	bl	trace_hardirqs_on
-	addi	r1, r1, 32
-	lwz	r9,_MSR(r1)
-1:
-#endif /* CONFIG_TRACE_IRQFLAGS */
+.Lrestore_nvgprs:
+	REST_NVGPRS(r1)
+	b	.Lfast_user_interrupt_return
 
-	lwz	r0,GPR0(r1)
-	lwz	r2,GPR2(r1)
-	REST_4GPRS(3, r1)
-	REST_2GPRS(7, r1)
+.Lkernel_interrupt_return:
+	bl	interrupt_exit_kernel_prepare
 
-	lwz	r10,_XER(r1)
-	lwz	r11,_CTR(r1)
-	mtspr	SPRN_XER,r10
-	mtctr	r11
+.Lfast_kernel_interrupt_return:
+	cmpwi	cr1,r3,0
+	kuap_restore r1, r2, r3, r4, r5
+	lwz	r11,_NIP(r1)
+	lwz	r12,_MSR(r1)
+	mtspr	SPRN_SRR0,r11
+	mtspr	SPRN_SRR1,r12
 
 BEGIN_FTR_SECTION
-	lwarx	r11,0,r1
-END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
-	stwcx.	r0,0,r1			/* to clear the reservation */
+	stwcx.	r0,0,r1		/* to clear the reservation */
+FTR_SECTION_ELSE
+	lwarx	r0,0,r1
+ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
-#if !(defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
-	andi.	r10,r9,MSR_RI		/* check if this exception occurred */
-	beql	nonrecoverable		/* at a bad place (MSR:RI = 0) */
+	lwz	r3,_LINK(r1)
+	lwz	r4,_CTR(r1)
+	lwz	r5,_XER(r1)
+	lwz	r6,_CCR(r1)
+	li	r0,0
 
-	lwz	r10,_CCR(r1)
-	lwz	r11,_LINK(r1)
-	mtcrf	0xFF,r10
-	mtlr	r11
+	REST_4GPRS(7, r1)
+	REST_2GPRS(11, r1)
+
+	mtlr	r3
+	mtctr	r4
+	mtspr	SPRN_XER,r5
 
-	/* Clear the exception_marker on the stack to avoid confusing stacktrace */
-	li	r10, 0
-	stw	r10, 8(r1)
 	/*
-	 * Once we put values in SRR0 and SRR1, we are in a state
-	 * where exceptions are not recoverable, since taking an
-	 * exception will trash SRR0 and SRR1.  Therefore we clear the
-	 * MSR:RI bit to indicate this.  If we do take an exception,
-	 * we can't return to the point of the exception but we
-	 * can restart the exception exit path at the label
-	 * exc_exit_restart below.  -- paulus
+	 * Leaving a stale exception_marker on the stack can confuse
+	 * the reliable stack unwinder later on. Clear it.
 	 */
-	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL & ~MSR_RI)
-	mtmsr	r10		/* clear the RI bit */
-	.globl exc_exit_restart
-exc_exit_restart:
-	lwz	r12,_NIP(r1)
-	mtspr	SPRN_SRR0,r12
-	mtspr	SPRN_SRR1,r9
-	REST_4GPRS(9, r1)
-	lwz	r1,GPR1(r1)
-	.globl exc_exit_restart_end
-exc_exit_restart_end:
+	stw	r0,8(r1)
+
+	REST_4GPRS(2, r1)
+
+	bne-	cr1,1f /* emulate stack store */
+	mtcr	r6
+	REST_GPR(6, r1)
+	REST_GPR(0, r1)
+	REST_GPR(1, r1)
 	rfi
-_ASM_NOKPROBE_SYMBOL(exc_exit_restart)
-_ASM_NOKPROBE_SYMBOL(exc_exit_restart_end)
+#ifdef CONFIG_40x
+	b .	/* Prevent prefetch past rfi */
+#endif
 
-#else /* !(CONFIG_4xx || CONFIG_BOOKE) */
-	/*
-	 * This is a bit different on 4xx/Book-E because it doesn't have
-	 * the RI bit in the MSR.
-	 * The TLB miss handler checks if we have interrupted
-	 * the exception exit path and restarts it if so
-	 * (well maybe one day it will... :).
+1:	/*
+	 * Emulate stack store with update. New r1 value was already calculated
+	 * and updated in our interrupt regs by emulate_loadstore, but we can't
+	 * store the previous value of r1 to the stack before re-loading our
+	 * registers from it, otherwise they could be clobbered.  Use
+	 * SPRG Scratch0 as temporary storage to hold the store
+	 * data, as interrupts are disabled here so it won't be clobbered.
 	 */
-	lwz	r11,_LINK(r1)
-	mtlr	r11
-	lwz	r10,_CCR(r1)
-	mtcrf	0xff,r10
-	/* Clear the exception_marker on the stack to avoid confusing stacktrace */
-	li	r10, 0
-	stw	r10, 8(r1)
-	REST_2GPRS(9, r1)
-	.globl exc_exit_restart
-exc_exit_restart:
-	lwz	r11,_NIP(r1)
-	lwz	r12,_MSR(r1)
-	mtspr	SPRN_SRR0,r11
-	mtspr	SPRN_SRR1,r12
-	REST_2GPRS(11, r1)
-	lwz	r1,GPR1(r1)
-	.globl exc_exit_restart_end
-exc_exit_restart_end:
+	mtcr	r6
+#ifdef CONFIG_BOOKE
+	mtspr	SPRN_SPRG_WSCRATCH0, r9
+#else
+	mtspr	SPRN_SPRG_SCRATCH0, r9
+#endif
+	addi	r9,r1,INT_FRAME_SIZE /* get original r1 */
+	REST_GPR(6, r1)
+	REST_GPR(0, r1)
+	REST_GPR(1, r1)
+	stw	r9,0(r1) /* perform store component of stwu */
+#ifdef CONFIG_BOOKE
+	mfspr	r9, SPRN_SPRG_RSCRATCH0
+#else
+	mfspr	r9, SPRN_SPRG_SCRATCH0
+#endif
 	rfi
-	b	.			/* prevent prefetch past rfi */
-_ASM_NOKPROBE_SYMBOL(exc_exit_restart)
+#ifdef CONFIG_40x
+	b .	/* Prevent prefetch past rfi */
+#endif
+_ASM_NOKPROBE_SYMBOL(interrupt_return)
+
+#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
 
 /*
  * Returning from a critical interrupt in user mode doesn't need
@@ -642,8 +549,7 @@ _ASM_NOKPROBE_SYMBOL(exc_exit_restart)
 	REST_NVGPRS(r1);						\
 	lwz	r3,_MSR(r1);						\
 	andi.	r3,r3,MSR_PR;						\
-	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL);				\
-	bne	user_exc_return;					\
+	bne	interrupt_return;					\
 	lwz	r0,GPR0(r1);						\
 	lwz	r2,GPR2(r1);						\
 	REST_4GPRS(3, r1);						\
@@ -746,114 +652,8 @@ ret_from_mcheck_exc:
 	RET_FROM_EXC_LEVEL(SPRN_MCSRR0, SPRN_MCSRR1, PPC_RFMCI)
 _ASM_NOKPROBE_SYMBOL(ret_from_mcheck_exc)
 #endif /* CONFIG_BOOKE */
-
-/*
- * Load the DBCR0 value for a task that is being ptraced,
- * having first saved away the global DBCR0.  Note that r0
- * has the dbcr0 value to set upon entry to this.
- */
-load_dbcr0:
-	mfmsr	r10		/* first disable debug exceptions */
-	rlwinm	r10,r10,0,~MSR_DE
-	mtmsr	r10
-	isync
-	mfspr	r10,SPRN_DBCR0
-	lis	r11,global_dbcr0@ha
-	addi	r11,r11,global_dbcr0@l
-#ifdef CONFIG_SMP
-	lwz	r9,TASK_CPU(r2)
-	slwi	r9,r9,2
-	add	r11,r11,r9
-#endif
-	stw	r10,0(r11)
-	mtspr	SPRN_DBCR0,r0
-	li	r11,-1
-	mtspr	SPRN_DBSR,r11	/* clear all pending debug events */
-	blr
-
-	.section .bss
-	.align	4
-	.global global_dbcr0
-global_dbcr0:
-	.space	4*NR_CPUS
-	.previous
 #endif /* !(CONFIG_4xx || CONFIG_BOOKE) */
 
-do_work:			/* r10 contains MSR_KERNEL here */
-	andi.	r0,r9,_TIF_NEED_RESCHED
-	beq	do_user_signal
-
-do_resched:			/* r10 contains MSR_KERNEL here */
-#ifdef CONFIG_TRACE_IRQFLAGS
-	bl	trace_hardirqs_on
-	mfmsr	r10
-#endif
-	ori	r10,r10,MSR_EE
-	mtmsr	r10		/* hard-enable interrupts */
-	bl	schedule
-recheck:
-	/* Note: And we don't tell it we are disabling them again
-	 * neither. Those disable/enable cycles used to peek at
-	 * TI_FLAGS aren't advertised.
-	 */
-	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL)
-	mtmsr	r10		/* disable interrupts */
-	lwz	r9,TI_FLAGS(r2)
-	andi.	r0,r9,_TIF_NEED_RESCHED
-	bne-	do_resched
-	andi.	r0,r9,_TIF_USER_WORK_MASK
-	beq	restore_user
-do_user_signal:			/* r10 contains MSR_KERNEL here */
-	ori	r10,r10,MSR_EE
-	mtmsr	r10		/* hard-enable interrupts */
-2:	addi	r3,r1,STACK_FRAME_OVERHEAD
-	mr	r4,r9
-	bl	do_notify_resume
-	REST_NVGPRS(r1)
-	b	recheck
-
-/*
- * We come here when we are at the end of handling an exception
- * that occurred at a place where taking an exception will lose
- * state information, such as the contents of SRR0 and SRR1.
- */
-nonrecoverable:
-	lis	r10,exc_exit_restart_end@ha
-	addi	r10,r10,exc_exit_restart_end@l
-	cmplw	r12,r10
-	bge	3f
-	lis	r11,exc_exit_restart@ha
-	addi	r11,r11,exc_exit_restart@l
-	cmplw	r12,r11
-	blt	3f
-	lis	r10,ee_restarts@ha
-	lwz	r12,ee_restarts@l(r10)
-	addi	r12,r12,1
-	stw	r12,ee_restarts@l(r10)
-	mr	r12,r11		/* restart at exc_exit_restart */
-	blr
-3:	/* OK, we can't recover, kill this process */
-	lwz	r3,_TRAP(r1)
-	andi.	r0,r3,1
-	beq	5f
-	SAVE_NVGPRS(r1)
-	rlwinm	r3,r3,0,0,30
-	stw	r3,_TRAP(r1)
-5:	mfspr	r2,SPRN_SPRG_THREAD
-	addi	r2,r2,-THREAD
-	tovirt(r2,r2)			/* set back r2 to current */
-4:	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	unrecoverable_exception
-	/* shouldn't return */
-	b	4b
-_ASM_NOKPROBE_SYMBOL(nonrecoverable)
-
-	.section .bss
-	.align	2
-ee_restarts:
-	.space	4
-	.previous
-
 /*
  * PROM code for specific machines follows.  Put it
  * here so it's easy to add arch-specific sections later.
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index c475a229a42a..6875b82f613a 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -20,6 +20,10 @@
 #include <asm/time.h>
 #include <asm/unistd.h>
 
+#if defined(CONFIG_PPC_ADV_DEBUG_REGS) && defined(CONFIG_PPC32)
+unsigned long global_dbcr0[NR_CPUS];
+#endif
+
 typedef long (*syscall_fn)(long, long, long, long, long, long);
 
 /* Has to run notrace because it is entered not completely "reconciled" */
@@ -392,7 +396,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 		ti_flags = READ_ONCE(current_thread_info()->flags);
 	}
 
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && IS_ENABLED(CONFIG_PPC_FPU)) {
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && IS_ENABLED(CONFIG_PPC_FPU)) {
 		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
 				unlikely((ti_flags & _TIF_RESTORE_TM))) {
 			restore_tm_state(regs);
-- 
2.25.0

