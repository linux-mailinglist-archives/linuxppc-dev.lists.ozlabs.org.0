Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C2133A9E5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 04:19:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzM8c4mmRz3dN3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 14:19:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HhLhOijY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HhLhOijY; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzM6m7059z3cK9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 14:17:36 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id c17so2107794pfv.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 20:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e87XVuVBCmleSGS8/0YOZo64jbW2tcPOIm6VJB8BOqU=;
 b=HhLhOijYUSOtYqbk1l9JrfudeO/N3XnIZq+k+1e8v31HpVAGK6f4zSZBzTCc1TzNOr
 R/tRz7NBRH3DhurmOZ1pNm/SqsSypck+vpoO+5amWWuiprJzWgsTW8Y4WbhAY4lUcgu9
 fPtVZya9LEIFNZDcBZL82BnGR382CzjrHdREksNLgTV+AGyLtQaUMBcOUdVCZIkN0VD3
 oEAcfItPzx85dowS6c+m2L5ELVRhhQ5myTATru33ES1+Jv+Jexmk4FPYJH/fYztJai/1
 yVrEjVUWl6uk0EVCNGZKMnPP4J/nYDRWAwAOWS7tULYdByyI9D04YVEcK5ZiRxjgdVAy
 S1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e87XVuVBCmleSGS8/0YOZo64jbW2tcPOIm6VJB8BOqU=;
 b=omd+FuRg8uFwEE6CkrA1w56wXaLCtG07XDl/axRZlp+fzO/u94YeFQwy+h5gplBcpR
 M+ua6+mgaSF1mhtsRMzZxs1pv27tmD+VXcrijYdZ5/Kes1uBsrggE1nTSrBY2IYgWEmh
 z330nCnLgaW0QWjC0jO+WQlI75jsbZLHtEbOp6b+C9azJ/a2d4QBZan6m1+SeB9jXbtB
 9SsScclplZ6gD/AsoUv2o+tftATpyKv6254Ho3xia9l7r9pt1GwZC5l0zUwcEBCt5hUw
 dX32X4yn32ecA6wYuYz2UXlw5/ggouVfULA3LgKwiZYxLQOgb30zaMhjij1GzthYp0YN
 dyEA==
X-Gm-Message-State: AOAM530WPGvg6hPxaniE+Wur/VDPp/g1a4dmZ91g59Z8xtjTl88cT6eW
 ZDqtPBY4LlZwUYQdTHf7l7mr5Fa0iGo=
X-Google-Smtp-Source: ABdhPJznDXs0LdsvTJHvmY5q7bzSRHa6gRU0TdP7ykonxoqy/YUgM+fE0uMR/tudwxvCqq+tsHoncw==
X-Received: by 2002:a62:8c05:0:b029:1d8:7f36:bcd8 with SMTP id
 m5-20020a628c050000b02901d87f36bcd8mr8561074pfd.43.1615778254418; 
 Sun, 14 Mar 2021 20:17:34 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 j22sm8517740pjz.3.2021.03.14.20.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 20:17:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/10] powerpc/64e/interrupt: use new interrupt return
Date: Mon, 15 Mar 2021 13:17:09 +1000
Message-Id: <20210315031716.3940350-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210315031716.3940350-1-npiggin@gmail.com>
References: <20210315031716.3940350-1-npiggin@gmail.com>
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
Cc: Scott Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update the new C and asm interrupt return code to account for 64e
specifics, switch over to use it.

The now-unused old ret_from_except code, that was moved to 64e after the
64s conversion, is removed.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h |   2 -
 arch/powerpc/kernel/entry_64.S            |   9 +-
 arch/powerpc/kernel/exceptions-64e.S      | 321 ++--------------------
 arch/powerpc/kernel/interrupt.c           |  27 +-
 arch/powerpc/kernel/irq.c                 |  76 -----
 5 files changed, 56 insertions(+), 379 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 939f3c94c8f3..1c7b75834e04 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -77,8 +77,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
 		      u32 len_high, u32 len_low);
 long sys_switch_endian(void);
-notrace unsigned int __check_irq_replay(void);
-void notrace restore_interrupts(void);
 
 /* prom_init (OpenFirmware) */
 unsigned long __init prom_init(unsigned long r3, unsigned long r4,
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 853534b2ae2e..555b3d0a3f38 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -632,7 +632,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	addi	r1,r1,SWITCH_FRAME_SIZE
 	blr
 
-#ifdef CONFIG_PPC_BOOK3S
 	/*
 	 * If MSR EE/RI was never enabled, IRQs not reconciled, NVGPRs not
 	 * touched, no exit work created, then this can be used.
@@ -644,6 +643,7 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
 	kuap_check_amr r3, r4
 	ld	r5,_MSR(r1)
 	andi.	r0,r5,MSR_PR
+#ifdef CONFIG_PPC_BOOK3S
 	bne	.Lfast_user_interrupt_return_amr
 	kuap_kernel_restore r3, r4
 	andi.	r0,r5,MSR_RI
@@ -652,6 +652,10 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unrecoverable_exception
 	b	. /* should not get here */
+#else
+	bne	.Lfast_user_interrupt_return
+	b	.Lfast_kernel_interrupt_return
+#endif
 
 	.balign IFETCH_ALIGN_BYTES
 	.globl interrupt_return
@@ -665,8 +669,10 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
 	cmpdi	r3,0
 	bne-	.Lrestore_nvgprs
 
+#ifdef CONFIG_PPC_BOOK3S
 .Lfast_user_interrupt_return_amr:
 	kuap_user_restore r3, r4
+#endif
 .Lfast_user_interrupt_return:
 	ld	r11,_NIP(r1)
 	ld	r12,_MSR(r1)
@@ -775,7 +781,6 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
 	RFI_TO_KERNEL
 	b	.	/* prevent speculative execution */
-#endif /* CONFIG_PPC_BOOK3S */
 
 #ifdef CONFIG_PPC_RTAS
 /*
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index da78eb6ab92f..1bb4e9b37748 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -139,7 +139,8 @@ ret_from_level_except:
 	ld	r3,_MSR(r1)
 	andi.	r3,r3,MSR_PR
 	beq	1f
-	b	ret_from_except
+	REST_NVGPRS(r1)
+	b	interrupt_return
 1:
 
 	LOAD_REG_ADDR(r11,extlb_level_exc)
@@ -208,7 +209,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
 	/*
 	 * Restore PACAIRQHAPPENED rather than setting it based on
 	 * the return MSR[EE], since we could have interrupted
-	 * __check_irq_replay() or other inconsistent transitory
+	 * interrupt replay or other inconsistent transitory
 	 * states that must remain that way.
 	 */
 	SPECIAL_EXC_LOAD(r10,IRQHAPPENED)
@@ -511,7 +512,7 @@ exc_##n##_bad_stack:							    \
 	CHECK_NAPPING();						\
 	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
 	bl	hdlr;							\
-	b	ret_from_except_lite;
+	b	interrupt_return
 
 /* This value is used to mark exception frames on the stack. */
 	.section	".toc","aw"
@@ -623,7 +624,8 @@ __end_interrupts:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r14,PACA_EXGEN+EX_R14(r13)
 	bl	program_check_exception
-	b	ret_from_except
+	REST_NVGPRS(r1)
+	b	interrupt_return
 
 /* Floating Point Unavailable Interrupt */
 	START_EXCEPTION(fp_unavailable);
@@ -635,11 +637,11 @@ __end_interrupts:
 	andi.	r0,r12,MSR_PR;
 	beq-	1f
 	bl	load_up_fpu
-	b	fast_exception_return
+	b	fast_interrupt_return
 1:	INTS_DISABLE
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	kernel_fp_unavailable_exception
-	b	ret_from_except
+	b	interrupt_return
 
 /* Altivec Unavailable Interrupt */
 	START_EXCEPTION(altivec_unavailable);
@@ -653,14 +655,14 @@ BEGIN_FTR_SECTION
 	andi.	r0,r12,MSR_PR;
 	beq-	1f
 	bl	load_up_altivec
-	b	fast_exception_return
+	b	fast_interrupt_return
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 #endif
 	INTS_DISABLE
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	altivec_unavailable_exception
-	b	ret_from_except
+	b	interrupt_return
 
 /* AltiVec Assist */
 	START_EXCEPTION(altivec_assist);
@@ -674,10 +676,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 BEGIN_FTR_SECTION
 	bl	altivec_assist_exception
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
+	REST_NVGPRS(r1)
 #else
 	bl	unknown_exception
 #endif
-	b	ret_from_except
+	b	interrupt_return
 
 
 /* Decrementer Interrupt */
@@ -719,7 +722,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	INTS_DISABLE
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unknown_exception
-	b	ret_from_except
+	b	interrupt_return
 
 /* Debug exception as a critical interrupt*/
 	START_EXCEPTION(debug_crit);
@@ -786,7 +789,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	ld	r14,PACA_EXCRIT+EX_R14(r13)
 	ld	r15,PACA_EXCRIT+EX_R15(r13)
 	bl	DebugException
-	b	ret_from_except
+	REST_NVGPRS(r1)
+	b	interrupt_return
 
 kernel_dbg_exc:
 	b	.	/* NYI */
@@ -857,7 +861,8 @@ kernel_dbg_exc:
 	ld	r14,PACA_EXDBG+EX_R14(r13)
 	ld	r15,PACA_EXDBG+EX_R15(r13)
 	bl	DebugException
-	b	ret_from_except
+	REST_NVGPRS(r1)
+	b	interrupt_return
 
 	START_EXCEPTION(perfmon);
 	NORMAL_EXCEPTION_PROLOG(0x260, BOOKE_INTERRUPT_PERFORMANCE_MONITOR,
@@ -867,7 +872,7 @@ kernel_dbg_exc:
 	CHECK_NAPPING()
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	performance_monitor_exception
-	b	ret_from_except_lite
+	b	interrupt_return
 
 /* Doorbell interrupt */
 	MASKABLE_EXCEPTION(0x280, BOOKE_INTERRUPT_DOORBELL,
@@ -895,7 +900,7 @@ kernel_dbg_exc:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	INTS_RESTORE_HARD
 	bl	unknown_exception
-	b	ret_from_except
+	b	interrupt_return
 
 /* Guest Doorbell critical Interrupt */
 	START_EXCEPTION(guest_doorbell_crit);
@@ -916,7 +921,7 @@ kernel_dbg_exc:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	INTS_RESTORE_HARD
 	bl	unknown_exception
-	b	ret_from_except
+	b	interrupt_return
 
 /* Embedded Hypervisor priviledged  */
 	START_EXCEPTION(ehpriv);
@@ -926,7 +931,7 @@ kernel_dbg_exc:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	INTS_RESTORE_HARD
 	bl	unknown_exception
-	b	ret_from_except
+	b	interrupt_return
 
 /* LRAT Error interrupt */
 	START_EXCEPTION(lrat_error);
@@ -936,7 +941,7 @@ kernel_dbg_exc:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	INTS_RESTORE_HARD
 	bl	unknown_exception
-	b	ret_from_except
+	b	interrupt_return
 
 /*
  * An interrupt came in while soft-disabled; We mark paca->irq_happened
@@ -998,11 +1003,11 @@ storage_fault_common:
 	bl	do_page_fault
 	cmpdi	r3,0
 	bne-	1f
-	b	ret_from_except_lite
+	b	interrupt_return
 	mr	r4,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	__bad_page_fault
-	b	ret_from_except
+	b	interrupt_return
 
 /*
  * Alignment exception doesn't fit entirely in the 0x100 bytes so it
@@ -1016,284 +1021,8 @@ alignment_more:
 	ld	r15,PACA_EXGEN+EX_R15(r13)
 	INTS_RESTORE_HARD
 	bl	alignment_exception
-	b	ret_from_except
-
-	.align	7
-_GLOBAL(ret_from_except)
 	REST_NVGPRS(r1)
-
-_GLOBAL(ret_from_except_lite)
-	/*
-	 * Disable interrupts so that current_thread_info()->flags
-	 * can't change between when we test it and when we return
-	 * from the interrupt.
-	 */
-	wrteei	0
-
-	ld	r9, PACA_THREAD_INFO(r13)
-	ld	r3,_MSR(r1)
-	ld	r10,PACACURRENT(r13)
-	ld	r4,TI_FLAGS(r9)
-	andi.	r3,r3,MSR_PR
-	beq	resume_kernel
-	lwz	r3,(THREAD+THREAD_DBCR0)(r10)
-
-	/* Check current_thread_info()->flags */
-	andi.	r0,r4,_TIF_USER_WORK_MASK
-	bne	1f
-	/*
-	 * Check to see if the dbcr0 register is set up to debug.
-	 * Use the internal debug mode bit to do this.
-	 */
-	andis.	r0,r3,DBCR0_IDM@h
-	beq	restore
-	mfmsr	r0
-	rlwinm	r0,r0,0,~MSR_DE	/* Clear MSR.DE */
-	mtmsr	r0
-	mtspr	SPRN_DBCR0,r3
-	li	r10, -1
-	mtspr	SPRN_DBSR,r10
-	b	restore
-1:	andi.	r0,r4,_TIF_NEED_RESCHED
-	beq	2f
-	bl	restore_interrupts
-	SCHEDULE_USER
-	b	ret_from_except_lite
-2:
-	/*
-	 * Use a non volatile GPR to save and restore our thread_info flags
-	 * across the call to restore_interrupts.
-	 */
-	mr	r30,r4
-	bl	restore_interrupts
-	mr	r4,r30
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	do_notify_resume
-	b	ret_from_except
-
-resume_kernel:
-	/* check current_thread_info, _TIF_EMULATE_STACK_STORE */
-	andis.	r8,r4,_TIF_EMULATE_STACK_STORE@h
-	beq+	1f
-
-	addi	r8,r1,INT_FRAME_SIZE	/* Get the kprobed function entry */
-
-	ld	r3,GPR1(r1)
-	subi	r3,r3,INT_FRAME_SIZE	/* dst: Allocate a trampoline exception frame */
-	mr	r4,r1			/* src:  current exception frame */
-	mr	r1,r3			/* Reroute the trampoline frame to r1 */
-
-	/* Copy from the original to the trampoline. */
-	li	r5,INT_FRAME_SIZE/8	/* size: INT_FRAME_SIZE */
-	li	r6,0			/* start offset: 0 */
-	mtctr	r5
-2:	ldx	r0,r6,r4
-	stdx	r0,r6,r3
-	addi	r6,r6,8
-	bdnz	2b
-
-	/* Do real store operation to complete stdu */
-	ld	r5,GPR1(r1)
-	std	r8,0(r5)
-
-	/* Clear _TIF_EMULATE_STACK_STORE flag */
-	lis	r11,_TIF_EMULATE_STACK_STORE@h
-	addi	r5,r9,TI_FLAGS
-0:	ldarx	r4,0,r5
-	andc	r4,r4,r11
-	stdcx.	r4,0,r5
-	bne-	0b
-1:
-
-#ifdef CONFIG_PREEMPT
-	/* Check if we need to preempt */
-	andi.	r0,r4,_TIF_NEED_RESCHED
-	beq+	restore
-	/* Check that preempt_count() == 0 and interrupts are enabled */
-	lwz	r8,TI_PREEMPT(r9)
-	cmpwi	cr0,r8,0
-	bne	restore
-	ld	r0,SOFTE(r1)
-	andi.	r0,r0,IRQS_DISABLED
-	bne	restore
-
-	/*
-	 * Here we are preempting the current task. We want to make
-	 * sure we are soft-disabled first and reconcile irq state.
-	 */
-	RECONCILE_IRQ_STATE(r3,r4)
-	bl	preempt_schedule_irq
-
-	/*
-	 * arch_local_irq_restore() from preempt_schedule_irq above may
-	 * enable hard interrupt but we really should disable interrupts
-	 * when we return from the interrupt, and so that we don't get
-	 * interrupted after loading SRR0/1.
-	 */
-	wrteei	0
-#endif /* CONFIG_PREEMPT */
-
-restore:
-	/*
-	 * This is the main kernel exit path. First we check if we
-	 * are about to re-enable interrupts
-	 */
-	ld	r5,SOFTE(r1)
-	lbz	r6,PACAIRQSOFTMASK(r13)
-	andi.	r5,r5,IRQS_DISABLED
-	bne	.Lrestore_irq_off
-
-	/* We are enabling, were we already enabled ? Yes, just return */
-	andi.	r6,r6,IRQS_DISABLED
-	beq	cr0,fast_exception_return
-
-	/*
-	 * We are about to soft-enable interrupts (we are hard disabled
-	 * at this point). We check if there's anything that needs to
-	 * be replayed first.
-	 */
-	lbz	r0,PACAIRQHAPPENED(r13)
-	cmpwi	cr0,r0,0
-	bne-	.Lrestore_check_irq_replay
-
-	/*
-	 * Get here when nothing happened while soft-disabled, just
-	 * soft-enable and move-on. We will hard-enable as a side
-	 * effect of rfi
-	 */
-.Lrestore_no_replay:
-	TRACE_ENABLE_INTS
-	li	r0,IRQS_ENABLED
-	stb	r0,PACAIRQSOFTMASK(r13);
-
-/* This is the return from load_up_fpu fast path which could do with
- * less GPR restores in fact, but for now we have a single return path
- */
-fast_exception_return:
-	wrteei	0
-1:	mr	r0,r13
-	ld	r10,_MSR(r1)
-	REST_4GPRS(2, r1)
-	andi.	r6,r10,MSR_PR
-	REST_2GPRS(6, r1)
-	beq	1f
-	ACCOUNT_CPU_USER_EXIT(r13, r10, r11)
-	ld	r0,GPR13(r1)
-
-1:	stdcx.	r0,0,r1		/* to clear the reservation */
-
-	ld	r8,_CCR(r1)
-	ld	r9,_LINK(r1)
-	ld	r10,_CTR(r1)
-	ld	r11,_XER(r1)
-	mtcr	r8
-	mtlr	r9
-	mtctr	r10
-	mtxer	r11
-	REST_2GPRS(8, r1)
-	ld	r10,GPR10(r1)
-	ld	r11,GPR11(r1)
-	ld	r12,GPR12(r1)
-	mtspr	SPRN_SPRG_GEN_SCRATCH,r0
-
-	std	r10,PACA_EXGEN+EX_R10(r13);
-	std	r11,PACA_EXGEN+EX_R11(r13);
-	ld	r10,_NIP(r1)
-	ld	r11,_MSR(r1)
-	ld	r0,GPR0(r1)
-	ld	r1,GPR1(r1)
-	mtspr	SPRN_SRR0,r10
-	mtspr	SPRN_SRR1,r11
-	ld	r10,PACA_EXGEN+EX_R10(r13)
-	ld	r11,PACA_EXGEN+EX_R11(r13)
-	mfspr	r13,SPRN_SPRG_GEN_SCRATCH
-	rfi
-
-	/*
-	 * We are returning to a context with interrupts soft disabled.
-	 *
-	 * However, we may also about to hard enable, so we need to
-	 * make sure that in this case, we also clear PACA_IRQ_HARD_DIS
-	 * or that bit can get out of sync and bad things will happen
-	 */
-.Lrestore_irq_off:
-	ld	r3,_MSR(r1)
-	lbz	r7,PACAIRQHAPPENED(r13)
-	andi.	r0,r3,MSR_EE
-	beq	1f
-	rlwinm	r7,r7,0,~PACA_IRQ_HARD_DIS
-	stb	r7,PACAIRQHAPPENED(r13)
-1:
-#if defined(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG) && defined(CONFIG_BUG)
-	/* The interrupt should not have soft enabled. */
-	lbz	r7,PACAIRQSOFTMASK(r13)
-1:	tdeqi	r7,IRQS_ENABLED
-	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,BUGFLAG_WARNING
-#endif
-	b	fast_exception_return
-
-	/*
-	 * Something did happen, check if a re-emit is needed
-	 * (this also clears paca->irq_happened)
-	 */
-.Lrestore_check_irq_replay:
-	/* XXX: We could implement a fast path here where we check
-	 * for irq_happened being just 0x01, in which case we can
-	 * clear it and return. That means that we would potentially
-	 * miss a decrementer having wrapped all the way around.
-	 *
-	 * Still, this might be useful for things like hash_page
-	 */
-	bl	__check_irq_replay
-	cmpwi	cr0,r3,0
-	beq	.Lrestore_no_replay
-
-	/*
-	 * We need to re-emit an interrupt. We do so by re-using our
-	 * existing exception frame. We first change the trap value,
-	 * but we need to ensure we preserve the low nibble of it
-	 */
-	ld	r4,_TRAP(r1)
-	clrldi	r4,r4,60
-	or	r4,r4,r3
-	std	r4,_TRAP(r1)
-
-	/*
-	 * PACA_IRQ_HARD_DIS won't always be set here, so set it now
-	 * to reconcile the IRQ state. Tracing is already accounted for.
-	 */
-	lbz	r4,PACAIRQHAPPENED(r13)
-	ori	r4,r4,PACA_IRQ_HARD_DIS
-	stb	r4,PACAIRQHAPPENED(r13)
-
-	/*
-	 * Then find the right handler and call it. Interrupts are
-	 * still soft-disabled and we keep them that way.
-	*/
-	cmpwi	cr0,r3,0x500
-	bne	1f
-	addi	r3,r1,STACK_FRAME_OVERHEAD;
-	bl	do_IRQ
-	b	ret_from_except
-1:	cmpwi	cr0,r3,0x900
-	bne	1f
-	addi	r3,r1,STACK_FRAME_OVERHEAD;
-	bl	timer_interrupt
-	b	ret_from_except
-#ifdef CONFIG_PPC_DOORBELL
-1:
-	cmpwi	cr0,r3,0x280
-	bne	1f
-	addi	r3,r1,STACK_FRAME_OVERHEAD;
-	bl	doorbell_exception
-#endif /* CONFIG_PPC_DOORBELL */
-1:	b	ret_from_except /* What else to do here ? */
-
-_ASM_NOKPROBE_SYMBOL(ret_from_except);
-_ASM_NOKPROBE_SYMBOL(ret_from_except_lite);
-_ASM_NOKPROBE_SYMBOL(resume_kernel);
-_ASM_NOKPROBE_SYMBOL(restore);
-_ASM_NOKPROBE_SYMBOL(fast_exception_return);
+	b	interrupt_return
 
 /*
  * Trampolines used when spotting a bad kernel stack pointer in
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index fbabb49888d3..ae7b058b2970 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -235,6 +235,10 @@ static notrace void booke_load_dbcr0(void)
 #endif
 }
 
+/* temporary hack for context tracking, removed in later patch */
+#include <linux/sched/debug.h>
+asmlinkage __visible void __sched schedule_user(void);
+
 /*
  * This should be called after a syscall returns, with r3 the return value
  * from the syscall. If this function returns non-zero, the system call
@@ -292,7 +296,11 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
 		local_irq_enable();
 		if (ti_flags & _TIF_NEED_RESCHED) {
+#ifdef CONFIG_PPC_BOOK3E_64
+			schedule_user();
+#else
 			schedule();
+#endif
 		} else {
 			/*
 			 * SIGPENDING must restore signal handler function
@@ -360,7 +368,6 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	return ret;
 }
 
-#ifndef CONFIG_PPC_BOOK3E_64 /* BOOK3E not yet using this */
 notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr)
 {
 	unsigned long ti_flags;
@@ -372,7 +379,9 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	BUG_ON(!(regs->msr & MSR_PR));
 	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(arch_irq_disabled_regs(regs));
+#ifdef CONFIG_PPC_BOOK3S_64
 	CT_WARN_ON(ct_state() == CONTEXT_USER);
+#endif
 
 	/*
 	 * We don't need to restore AMR on the way back to userspace for KUAP.
@@ -387,7 +396,11 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
 		local_irq_enable(); /* returning to user: may enable */
 		if (ti_flags & _TIF_NEED_RESCHED) {
+#ifdef CONFIG_PPC_BOOK3E_64
+			schedule_user();
+#else
 			schedule();
+#endif
 		} else {
 			if (ti_flags & _TIF_SIGPENDING)
 				ret |= _TIF_RESTOREALL;
@@ -435,7 +448,10 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	/*
 	 * We do this at the end so that we do context switch with KERNEL AMR
 	 */
+#ifndef CONFIG_PPC_BOOK3E_64
 	kuap_user_restore(regs);
+#endif
+
 	return ret;
 }
 
@@ -445,7 +461,9 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 {
 	unsigned long flags;
 	unsigned long ret = 0;
+#ifndef CONFIG_PPC_BOOK3E_64
 	unsigned long kuap;
+#endif
 
 	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x) &&
 	    unlikely(!(regs->msr & MSR_RI)))
@@ -456,10 +474,12 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	 * CT_WARN_ON comes here via program_check_exception,
 	 * so avoid recursion.
 	 */
-	if (TRAP(regs) != 0x700)
+	if (IS_ENABLED(CONFIG_BOOKS) && TRAP(regs) != 0x700)
 		CT_WARN_ON(ct_state() == CONTEXT_USER);
 
+#ifndef CONFIG_PPC_BOOK3E_64
 	kuap = kuap_get_and_assert_locked();
+#endif
 
 	if (unlikely(current_thread_info()->flags & _TIF_EMULATE_STACK_STORE)) {
 		clear_bits(_TIF_EMULATE_STACK_STORE, &current_thread_info()->flags);
@@ -501,8 +521,9 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	 * which would cause Read-After-Write stalls. Hence, we take the AMR
 	 * value from the check above.
 	 */
+#ifndef CONFIG_PPC_BOOK3E_64
 	kuap_kernel_restore(regs, kuap);
+#endif
 
 	return ret;
 }
-#endif
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 5b72abbff96c..08a747b92735 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -104,82 +104,6 @@ static inline notrace unsigned long get_irq_happened(void)
 	return happened;
 }
 
-#ifdef CONFIG_PPC_BOOK3E
-
-/* This is called whenever we are re-enabling interrupts
- * and returns either 0 (nothing to do) or 500/900/280 if
- * there's an EE, DEC or DBELL to generate.
- *
- * This is called in two contexts: From arch_local_irq_restore()
- * before soft-enabling interrupts, and from the exception exit
- * path when returning from an interrupt from a soft-disabled to
- * a soft enabled context. In both case we have interrupts hard
- * disabled.
- *
- * We take care of only clearing the bits we handled in the
- * PACA irq_happened field since we can only re-emit one at a
- * time and we don't want to "lose" one.
- */
-notrace unsigned int __check_irq_replay(void)
-{
-	/*
-	 * We use local_paca rather than get_paca() to avoid all
-	 * the debug_smp_processor_id() business in this low level
-	 * function
-	 */
-	unsigned char happened = local_paca->irq_happened;
-
-	/*
-	 * We are responding to the next interrupt, so interrupt-off
-	 * latencies should be reset here.
-	 */
-	trace_hardirqs_on();
-	trace_hardirqs_off();
-
-	if (happened & PACA_IRQ_DEC) {
-		local_paca->irq_happened &= ~PACA_IRQ_DEC;
-		return 0x900;
-	}
-
-	if (happened & PACA_IRQ_EE) {
-		local_paca->irq_happened &= ~PACA_IRQ_EE;
-		return 0x500;
-	}
-
-	if (happened & PACA_IRQ_DBELL) {
-		local_paca->irq_happened &= ~PACA_IRQ_DBELL;
-		return 0x280;
-	}
-
-	if (happened & PACA_IRQ_HARD_DIS)
-		local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
-
-	/* There should be nothing left ! */
-	BUG_ON(local_paca->irq_happened != 0);
-
-	return 0;
-}
-
-/*
- * This is specifically called by assembly code to re-enable interrupts
- * if they are currently disabled. This is typically called before
- * schedule() or do_signal() when returning to userspace. We do it
- * in C to avoid the burden of dealing with lockdep etc...
- *
- * NOTE: This is called with interrupts hard disabled but not marked
- * as such in paca->irq_happened, so we need to resync this.
- */
-void notrace restore_interrupts(void)
-{
-	if (irqs_disabled()) {
-		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
-		local_irq_enable();
-	} else
-		__hard_irq_enable();
-}
-
-#endif /* CONFIG_PPC_BOOK3E */
-
 void replay_soft_interrupts(void)
 {
 	struct pt_regs regs;
-- 
2.23.0

