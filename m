Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 316D433A9ED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 04:20:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzM9k0SDZz3dZm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 14:20:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FBdff3di;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FBdff3di; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzM6v0p2qz3cGq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 14:17:42 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id v14so12710449pgq.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 20:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pOlzm6ROiviRW2kKSiLwrDOVCDcxhXyStoK24codu3s=;
 b=FBdff3dio1W6pVFr0Q61/Bl2fkdTsrAEvvqiA0FjBPRlAmZjx5yKUKAVm7ADUo6wsq
 dYTZ2NVSiMxtNh2LPUvrhkHlA+y1WOiTFs18HZv6M2v7eRbZl9mSISVxxHxenXxms7iB
 SaBQAD1M+WPfs3Z0d+hxOPXiKnT0tk+KG6wIwpym3nHUlnZ9PwjYp8GcS0H5FlqWrr3M
 ls/sm7o/8tOieolgZVT1rb7OLxbxAVIZh9aFT9TogTcHfeMzz0ezzjhd13DifTorMxG/
 1F7IXI/Om8RmdZ/v5MpwtWR4odGZ1yu9OmA7Mlh1zJ0gXLdgtSJ5ED38RQVCdiTWNBf/
 KOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pOlzm6ROiviRW2kKSiLwrDOVCDcxhXyStoK24codu3s=;
 b=OGUQJuVb1tDjV8zDFm5ZnbszcrNjIolS4tR8rxeYra9zpDKg7ckgtBY4bHYS8mr0YJ
 BAIyeOJ65a69rxtrVxIekRpb4ip6taiqNo4hPJyEr8cXg1f7ncTqQre3a357yhs7U0FO
 RtTYq8l6ylVVOgRDES01XcZ5ejYvmV36ZcwDU56PqttFSSQRbnsFRAxr1P9ZGNC2A5Jd
 almZiGooY389Pw45HQhMS4YClwAxDdgQfjumPZ1hF7zK8a33inCyxh8rQDRiMSpVahas
 3AJfsDZhy85geDQEJ21uGbwoerB5LiP+nhH940QTEnZ4J5QlfwK+LtzNlMED0HWgyQMa
 N+Dw==
X-Gm-Message-State: AOAM530Byn41kFVH58A1mnzex4lGyjBIgmcoo3QENqX8d29Thmw2FcRs
 s1dtDU+EB2MCSo3E0JTkhP3SFoNYQSY=
X-Google-Smtp-Source: ABdhPJzqajktKWAeYsDRBlF3u+pdu95BQPETqrU+87zG+q8kFEFaC1ugccEzOf0m2QkeqbpjqN4W2g==
X-Received: by 2002:a63:ce48:: with SMTP id r8mr4372799pgi.62.1615778260438;
 Sun, 14 Mar 2021 20:17:40 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 j22sm8517740pjz.3.2021.03.14.20.17.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 20:17:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/10] powerpc/64e/interrupt: reconcile irq soft-mask state in
 C
Date: Mon, 15 Mar 2021 13:17:11 +1000
Message-Id: <20210315031716.3940350-6-npiggin@gmail.com>
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

Use existing 64s interrupt entry wrapper code to reconcile irqs in C.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h |  8 +++---
 arch/powerpc/kernel/entry_64.S       | 18 ++++++-------
 arch/powerpc/kernel/exceptions-64e.S | 39 +---------------------------
 3 files changed, 13 insertions(+), 52 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 305d7c17a4cf..29b48d083156 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -40,14 +40,14 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 		kuap_save_and_lock(regs);
 	}
 #endif
-	/*
-	 * Book3E reconciles irq soft mask in asm
-	 */
-#ifdef CONFIG_PPC_BOOK3S_64
+
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
index 2074a1e41ae2..a059ab3542c2 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -409,28 +409,6 @@ exc_##n##_common:							    \
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
@@ -479,7 +457,6 @@ exc_##n##_bad_stack:							    \
 	START_EXCEPTION(label);						\
 	NORMAL_EXCEPTION_PROLOG(trapnum, intnum, PROLOG_ADDITION_MASKABLE)\
 	EXCEPTION_COMMON(trapnum)					\
-	INTS_DISABLE;							\
 	ack(r8);							\
 	CHECK_NAPPING();						\
 	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
@@ -559,7 +536,6 @@ __end_interrupts:
 	mfspr	r14,SPRN_DEAR
 	mfspr	r15,SPRN_ESR
 	EXCEPTION_COMMON(0x300)
-	INTS_DISABLE
 	b	storage_fault_common
 
 /* Instruction Storage Interrupt */
@@ -569,7 +545,6 @@ __end_interrupts:
 	li	r15,0
 	mr	r14,r10
 	EXCEPTION_COMMON(0x400)
-	INTS_DISABLE
 	b	storage_fault_common
 
 /* External Input Interrupt */
@@ -591,7 +566,6 @@ __end_interrupts:
 				PROLOG_ADDITION_1REG)
 	mfspr	r14,SPRN_ESR
 	EXCEPTION_COMMON(0x700)
-	INTS_DISABLE
 	std	r14,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r14,PACA_EXGEN+EX_R14(r13)
@@ -610,8 +584,7 @@ __end_interrupts:
 	beq-	1f
 	bl	load_up_fpu
 	b	fast_interrupt_return
-1:	INTS_DISABLE
-	addi	r3,r1,STACK_FRAME_OVERHEAD
+1:	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	kernel_fp_unavailable_exception
 	b	interrupt_return
 
@@ -631,7 +604,6 @@ BEGIN_FTR_SECTION
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 #endif
-	INTS_DISABLE
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	altivec_unavailable_exception
 	b	interrupt_return
@@ -642,7 +614,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 				BOOKE_INTERRUPT_ALTIVEC_ASSIST,
 				PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x220)
-	INTS_DISABLE
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_ALTIVEC
 BEGIN_FTR_SECTION
@@ -691,7 +662,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	NORMAL_EXCEPTION_PROLOG(0xf20, BOOKE_INTERRUPT_AP_UNAVAIL,
 				PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0xf20)
-	INTS_DISABLE
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unknown_exception
 	b	interrupt_return
@@ -827,7 +797,6 @@ kernel_dbg_exc:
 	 */
 	mfspr	r14,SPRN_DBSR
 	EXCEPTION_COMMON_DBG(0xd08)
-	INTS_DISABLE
 	std	r14,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r14,PACA_EXDBG+EX_R14(r13)
@@ -840,7 +809,6 @@ kernel_dbg_exc:
 	NORMAL_EXCEPTION_PROLOG(0x260, BOOKE_INTERRUPT_PERFORMANCE_MONITOR,
 				PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x260)
-	INTS_DISABLE
 	CHECK_NAPPING()
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	performance_monitor_exception
@@ -870,7 +838,6 @@ kernel_dbg_exc:
 			        PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x2c0)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	INTS_RESTORE_HARD
 	bl	unknown_exception
 	b	interrupt_return
 
@@ -891,7 +858,6 @@ kernel_dbg_exc:
 			        PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x310)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	INTS_RESTORE_HARD
 	bl	unknown_exception
 	b	interrupt_return
 
@@ -901,7 +867,6 @@ kernel_dbg_exc:
 			        PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x320)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	INTS_RESTORE_HARD
 	bl	unknown_exception
 	b	interrupt_return
 
@@ -911,7 +876,6 @@ kernel_dbg_exc:
 			        PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x340)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	INTS_RESTORE_HARD
 	bl	unknown_exception
 	b	interrupt_return
 
@@ -991,7 +955,6 @@ alignment_more:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r14,PACA_EXGEN+EX_R14(r13)
 	ld	r15,PACA_EXGEN+EX_R15(r13)
-	INTS_RESTORE_HARD
 	bl	alignment_exception
 	REST_NVGPRS(r1)
 	b	interrupt_return
-- 
2.23.0

