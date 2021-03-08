Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A880B330AA6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 10:55:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvDH43SGyz3ddW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 20:55:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gAhmpKEj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gAhmpKEj; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvDDZ0qD1z3cc8
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Mar 2021 20:53:17 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id j6so4607792plx.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Mar 2021 01:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UANMNwbZnDlPmr1/kIccAcMEq8S50aqwl9BrD/qKMeA=;
 b=gAhmpKEjw9CFcZXVqDaH0bFfz5tF8YvXZoePzBpU8vcLs29hkCL0xMDWgJDarCFrWg
 ujl9l6A818RLFo99sgyY9fiBYjn5b1SykH4Daaf2Z52+r7UDPmJrRLHDrDrh2CTVesHi
 ztZlnTtMMzapPp4zQAngeaWZnvbvcMWIgTHfHUAQehL7v1N1tSRzHVUEbytbcg89rm1A
 wes2AI3dv8g/5U1aV//UitOKyfhRB7WISkb4rTEFa3muAYM7BtuKn/SXnK5cdHRZQv/u
 01dioH11E+Usg8LMjfrx0le3C54sA1jvS2n0SMNNDPfcN11ng65VTBLOJ90Wfj5/sUz0
 j4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UANMNwbZnDlPmr1/kIccAcMEq8S50aqwl9BrD/qKMeA=;
 b=ALeb06iaD8UDtkq/tVg9aiUic7tFuIgZjyeEgNzH8xvlF+R6CRDjQEWOxODrikClE8
 UO+X+xFE8JPudcNtStYVcHpDrGWo0xJ8UOyer57wTTp5VoetAwu+vMK0Xpd0R1+fSgFr
 Kn+y0nbkTGpsAxZwhwqCZTZC4jFNIbf+aF8GcjU5ULGNlkR8W4ZLfiekdkISuklqwOBr
 m/IuHqsnpqApwxQV8N2/jxaNqs6Hd9mbZpVkG+AP6O/7iqXqmJmpm600WZm/CfX+C3hE
 dcb98AvL6+GyRAYsyUb3DwQHeiOovTUB3lbT0e5VVSCwf1WeL9KRY4Y7E1r7fhoGMOwC
 x8cQ==
X-Gm-Message-State: AOAM533mQb/Y7QCY1WL1FVgjvt/BDomRwwCWFUnsC9l8XMHr2JL8crI8
 ccK2W+6DrybhMgVPU+YX0PBikLueo74=
X-Google-Smtp-Source: ABdhPJxQYhN7OAEgsEgCJo28+bflZOO6k7xNpe3X8sus0oKQtZXT9DXie+aoN4hsns84zmfpM9zcjQ==
X-Received: by 2002:a17:90a:bc4c:: with SMTP id
 t12mr24271309pjv.223.1615197195156; 
 Mon, 08 Mar 2021 01:53:15 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 e63sm1326850pfe.208.2021.03.08.01.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 01:53:14 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 4/7] powerpc/64e/interrupt: reconcile irq soft-mask state
 in C
Date: Mon,  8 Mar 2021 19:52:41 +1000
Message-Id: <20210308095244.3195782-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210308095244.3195782-1-npiggin@gmail.com>
References: <20210308095244.3195782-1-npiggin@gmail.com>
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

Use existing 64s interrupt entry wrapper code to reconcile irqs in C.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h |  7 ++---
 arch/powerpc/kernel/entry_64.S       | 18 ++++++------
 arch/powerpc/kernel/exceptions-64e.S | 42 +---------------------------
 3 files changed, 12 insertions(+), 55 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index aedfba29e43a..a57db901c16d 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -29,14 +29,13 @@ static inline void booke_restore_dbcr0(void)
 
 static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
-	/*
-	 * Book3E reconciles irq soft mask in asm
-	 */
-#ifdef CONFIG_PPC_BOOK3S_64
+#ifdef CONFIG_PPC64
 	if (irq_soft_mask_set_return(IRQS_ALL_DISABLED) == IRQS_ENABLED)
 		trace_hardirqs_off();
 	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+#endif
 
+#ifdef CONFIG_PPC_BOOK3S_64
 	if (user_mode(regs)) {
 		CT_WARN_ON(ct_state() != CONTEXT_USER);
 		user_exit_irqoff();
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 555b3d0a3f38..03727308d8cc 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -117,13 +117,12 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
 	/*
-	 * RECONCILE_IRQ_STATE without calling trace_hardirqs_off(), which
-	 * would clobber syscall parameters. Also we always enter with IRQs
-	 * enabled and nothing pending. system_call_exception() will call
-	 * trace_hardirqs_off().
-	 *
-	 * scv enters with MSR[EE]=1, so don't set PACA_IRQ_HARD_DIS. The
-	 * entry vector already sets PACAIRQSOFTMASK to IRQS_ALL_DISABLED.
+	 * scv enters with MSR[EE]=1 and is immediately considered soft-masked.
+	 * The entry vector already sets PACAIRQSOFTMASK to IRQS_ALL_DISABLED,
+	 * and interrupts may be masked and pending already.
+	 * system_call_exception() will call trace_hardirqs_off() which means
+	 * interrupts could already have been blocked before trace_hardirqs_off,
+	 * but this is the best we can do.
 	 */
 
 	/* Calling convention has r9 = orig r0, r10 = regs */
@@ -288,9 +287,8 @@ END_BTB_FLUSH_SECTION
 	std	r11,-16(r10)		/* "regshere" marker */
 
 	/*
-	 * RECONCILE_IRQ_STATE without calling trace_hardirqs_off(), which
-	 * would clobber syscall parameters. Also we always enter with IRQs
-	 * enabled and nothing pending. system_call_exception() will call
+	 * We always enter kernel from userspace with irq soft-mask enabled and
+	 * nothing pending. system_call_exception() will call
 	 * trace_hardirqs_off().
 	 */
 	li	r11,IRQS_ALL_DISABLED
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 1bb4e9b37748..eef8b5bc3cc8 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -63,9 +63,6 @@
 	ld	reg, (SPECIAL_EXC_##name * 8 + SPECIAL_EXC_FRAME_OFFS)(r1)
 
 special_reg_save:
-	lbz	r9,PACAIRQHAPPENED(r13)
-	RECONCILE_IRQ_STATE(r3,r4)
-
 	/*
 	 * We only need (or have stack space) to save this stuff if
 	 * we interrupted the kernel.
@@ -437,28 +434,6 @@ exc_##n##_common:							    \
 #define EXCEPTION_COMMON_DBG(n) \
 	EXCEPTION_COMMON_LVL(n, SPRN_SPRG_DBG_SCRATCH, PACA_EXDBG)
 
-/*
- * This is meant for exceptions that don't immediately hard-enable.  We
- * set a bit in paca->irq_happened to ensure that a subsequent call to
- * arch_local_irq_restore() will properly hard-enable and avoid the
- * fast-path, and then reconcile irq state.
- */
-#define INTS_DISABLE	RECONCILE_IRQ_STATE(r3,r4)
-
-/*
- * This is called by exceptions that don't use INTS_DISABLE (that did not
- * touch irq indicators in the PACA).  This will restore MSR:EE to it's
- * previous value
- *
- * XXX In the long run, we may want to open-code it in order to separate the
- *     load from the wrtee, thus limiting the latency caused by the dependency
- *     but at this point, I'll favor code clarity until we have a near to final
- *     implementation
- */
-#define INTS_RESTORE_HARD						    \
-	ld	r11,_MSR(r1);						    \
-	wrtee	r11;
-
 /* XXX FIXME: Restore r14/r15 when necessary */
 #define BAD_STACK_TRAMPOLINE(n)						    \
 exc_##n##_bad_stack:							    \
@@ -507,7 +482,6 @@ exc_##n##_bad_stack:							    \
 	START_EXCEPTION(label);						\
 	NORMAL_EXCEPTION_PROLOG(trapnum, intnum, PROLOG_ADDITION_MASKABLE)\
 	EXCEPTION_COMMON(trapnum)					\
-	INTS_DISABLE;							\
 	ack(r8);							\
 	CHECK_NAPPING();						\
 	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
@@ -587,7 +561,6 @@ __end_interrupts:
 	mfspr	r14,SPRN_DEAR
 	mfspr	r15,SPRN_ESR
 	EXCEPTION_COMMON(0x300)
-	INTS_DISABLE
 	b	storage_fault_common
 
 /* Instruction Storage Interrupt */
@@ -597,7 +570,6 @@ __end_interrupts:
 	li	r15,0
 	mr	r14,r10
 	EXCEPTION_COMMON(0x400)
-	INTS_DISABLE
 	b	storage_fault_common
 
 /* External Input Interrupt */
@@ -619,7 +591,6 @@ __end_interrupts:
 				PROLOG_ADDITION_1REG)
 	mfspr	r14,SPRN_ESR
 	EXCEPTION_COMMON(0x700)
-	INTS_DISABLE
 	std	r14,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r14,PACA_EXGEN+EX_R14(r13)
@@ -638,8 +609,7 @@ __end_interrupts:
 	beq-	1f
 	bl	load_up_fpu
 	b	fast_interrupt_return
-1:	INTS_DISABLE
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+1:	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	kernel_fp_unavailable_exception
 	b	interrupt_return
 
@@ -659,7 +629,6 @@ BEGIN_FTR_SECTION
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 #endif
-	INTS_DISABLE
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	altivec_unavailable_exception
 	b	interrupt_return
@@ -670,7 +639,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 				BOOKE_INTERRUPT_ALTIVEC_ASSIST,
 				PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x220)
-	INTS_DISABLE
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_ALTIVEC
 BEGIN_FTR_SECTION
@@ -719,7 +687,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	NORMAL_EXCEPTION_PROLOG(0xf20, BOOKE_INTERRUPT_AP_UNAVAIL,
 				PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0xf20)
-	INTS_DISABLE
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unknown_exception
 	b	interrupt_return
@@ -855,7 +822,6 @@ kernel_dbg_exc:
 	 */
 	mfspr	r14,SPRN_DBSR
 	EXCEPTION_COMMON_DBG(0xd08)
-	INTS_DISABLE
 	std	r14,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r14,PACA_EXDBG+EX_R14(r13)
@@ -868,7 +834,6 @@ kernel_dbg_exc:
 	NORMAL_EXCEPTION_PROLOG(0x260, BOOKE_INTERRUPT_PERFORMANCE_MONITOR,
 				PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x260)
-	INTS_DISABLE
 	CHECK_NAPPING()
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	performance_monitor_exception
@@ -898,7 +863,6 @@ kernel_dbg_exc:
 			        PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x2c0)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	INTS_RESTORE_HARD
 	bl	unknown_exception
 	b	interrupt_return
 
@@ -919,7 +883,6 @@ kernel_dbg_exc:
 			        PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x310)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	INTS_RESTORE_HARD
 	bl	unknown_exception
 	b	interrupt_return
 
@@ -929,7 +892,6 @@ kernel_dbg_exc:
 			        PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x320)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	INTS_RESTORE_HARD
 	bl	unknown_exception
 	b	interrupt_return
 
@@ -939,7 +901,6 @@ kernel_dbg_exc:
 			        PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x340)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	INTS_RESTORE_HARD
 	bl	unknown_exception
 	b	interrupt_return
 
@@ -1019,7 +980,6 @@ alignment_more:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r14,PACA_EXGEN+EX_R14(r13)
 	ld	r15,PACA_EXGEN+EX_R15(r13)
-	INTS_RESTORE_HARD
 	bl	alignment_exception
 	REST_NVGPRS(r1)
 	b	interrupt_return
-- 
2.23.0

