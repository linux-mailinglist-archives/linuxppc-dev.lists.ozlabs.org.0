Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6750A2F4611
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 09:17:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG0gP1vsHzDqm6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 19:17:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JGxocBZ7; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFzgs3MsvzDqnp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 18:33:13 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id h10so696632pfo.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 23:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3nwArMRYO+i3/lr144CFU8V+NYfuqjUPGI8o6fvxjT4=;
 b=JGxocBZ7QMHWJbua5ZSCp6BymOEoqdXQOiEtIiLb4lzKX5F28QhCvNymeoBJDb1j0s
 mCLtCrfy/XS44A6sZEMF1RpRyUsZXNJkJXPx5hJ4pkTcXhSTF3/mANsbXnzUe4bPKsRd
 S0MugAZrJIVR2OwPOTXUvCXoWQZ5YBDAHNplZvOX8wSlMmQpJNMoPniTZHmm2Hlt0KOY
 mwn5xv+Rf3sLQNW93D3bMjq2IzV13y63fsCj3creibp88cj3QZWLgFoD93a0XZShiopF
 HLGPgoSW2t9rgfYMU4r9Uetf+Ab399FodOajcHuXEuOkYqj+anjVfIHBxbQyWVE/eK3d
 wnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3nwArMRYO+i3/lr144CFU8V+NYfuqjUPGI8o6fvxjT4=;
 b=SolrlZMzIXufCyOw3Vh88ANkf2DAxE0KauzxnfA0/GdEv1F+pCRIjDrmjpkMEHkknB
 hzZDV41jmpVtBabM58ncNtsspo2dRdt+exTjZ6XkXskfAQatuJQATF/T6z3GJ4ONkXMj
 ZYQjGpjfPRDiluGwSEvCsrG8HDUyp8t14DRurG4CC6Vj9qlyXcVvDhEyoJMvNIQSRiIv
 P/7uXjpXj6/1xFwO3iY4DqPOIhiBUtleCEpIZR+zM1K1pphkFfhW9OQpEscWHagNGMGl
 tiTa478MlUgaI2YjdGaORWku8Uf6TI3tbI3fLI/HvkkZ/sRdMiA+uUgy2QLx+nzF3cKR
 nEgg==
X-Gm-Message-State: AOAM530579jMDjXA+6MGItxnY+4X/Rqq/Di+paI+XbJzWn/IrRbM2clp
 hov0XDOP68A3Zr8IPZmLcxsIdk2kLQE=
X-Google-Smtp-Source: ABdhPJyvJizbUsU1xMeowxoTsi3Ul6W1oeIHy/KXjya210Z9h0L5tYPyPuU67Pg3KOHLijyGw/cJFw==
X-Received: by 2002:a63:4563:: with SMTP id u35mr904126pgk.162.1610523188226; 
 Tue, 12 Jan 2021 23:33:08 -0800 (PST)
Received: from bobo.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id m77sm1394264pfd.105.2021.01.12.23.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:33:07 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 19/21] powerpc/64s: move NMI soft-mask handling to C
Date: Wed, 13 Jan 2021 17:32:13 +1000
Message-Id: <20210113073215.516986-20-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210113073215.516986-1-npiggin@gmail.com>
References: <20210113073215.516986-1-npiggin@gmail.com>
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

Saving and restoring soft-mask state can now be done in C using the
interrupt handler wrapper functions.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 26 ++++++++++++
 arch/powerpc/kernel/exceptions-64s.S | 60 ----------------------------
 2 files changed, 26 insertions(+), 60 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 01192e213f9a..db89ecfef762 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -96,6 +96,10 @@ static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct int
 
 struct interrupt_nmi_state {
 #ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3S_64
+	u8 irq_soft_mask;
+	u8 irq_happened;
+#endif
 	u8 ftrace_enabled;
 #endif
 };
@@ -103,6 +107,21 @@ struct interrupt_nmi_state {
 static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
 {
 #ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3S_64
+	state->irq_soft_mask = local_paca->irq_soft_mask;
+	state->irq_happened = local_paca->irq_happened;
+
+	/*
+	 * Set IRQS_ALL_DISABLED unconditionally so irqs_disabled() does
+	 * the right thing, and set IRQ_HARD_DIS. We do not want to reconcile
+	 * because that goes through irq tracing which we don't want in NMI.
+	 */
+	local_paca->irq_soft_mask = IRQS_ALL_DISABLED;
+	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+
+	/* Don't do any per-CPU operations until interrupt state is fixed */
+	state->ftrace_enabled = this_cpu_get_ftrace_enabled();
+#endif
 	state->ftrace_enabled = this_cpu_get_ftrace_enabled();
 	this_cpu_set_ftrace_enabled(0);
 #endif
@@ -126,6 +145,13 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 
 #ifdef CONFIG_PPC64
 	this_cpu_set_ftrace_enabled(state->ftrace_enabled);
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	/* Check we didn't change the pending interrupt mask. */
+	WARN_ON_ONCE((state->irq_happened | PACA_IRQ_HARD_DIS) != local_paca->irq_happened);
+	local_paca->irq_happened = state->irq_happened;
+	local_paca->irq_soft_mask = state->irq_soft_mask;
+#endif
 #endif
 }
 
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 68505e35bcf7..ceea3f3c5619 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1008,20 +1008,6 @@ EXC_COMMON_BEGIN(system_reset_common)
 	ld	r1,PACA_NMI_EMERG_SP(r13)
 	subi	r1,r1,INT_FRAME_SIZE
 	__GEN_COMMON_BODY system_reset
-	/*
-	 * Set IRQS_ALL_DISABLED unconditionally so irqs_disabled() does
-	 * the right thing. We do not want to reconcile because that goes
-	 * through irq tracing which we don't want in NMI.
-	 *
-	 * Save PACAIRQHAPPENED to RESULT (otherwise unused), and set HARD_DIS
-	 * as we are running with MSR[EE]=0.
-	 */
-	li	r10,IRQS_ALL_DISABLED
-	stb	r10,PACAIRQSOFTMASK(r13)
-	lbz	r10,PACAIRQHAPPENED(r13)
-	std	r10,RESULT(r1)
-	ori	r10,r10,PACA_IRQ_HARD_DIS
-	stb	r10,PACAIRQHAPPENED(r13)
 
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	system_reset_exception
@@ -1037,14 +1023,6 @@ EXC_COMMON_BEGIN(system_reset_common)
 	subi	r10,r10,1
 	sth	r10,PACA_IN_NMI(r13)
 
-	/*
-	 * Restore soft mask settings.
-	 */
-	ld	r10,RESULT(r1)
-	stb	r10,PACAIRQHAPPENED(r13)
-	ld	r10,SOFTE(r1)
-	stb	r10,PACAIRQSOFTMASK(r13)
-
 	kuap_kernel_restore r9, r10
 	EXCEPTION_RESTORE_REGS
 	RFI_TO_USER_OR_KERNEL
@@ -1190,30 +1168,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	li	r10,MSR_RI
 	mtmsrd	r10,1
 
-	/*
-	 * Set IRQS_ALL_DISABLED and save PACAIRQHAPPENED (see
-	 * system_reset_common)
-	 */
-	li	r10,IRQS_ALL_DISABLED
-	stb	r10,PACAIRQSOFTMASK(r13)
-	lbz	r10,PACAIRQHAPPENED(r13)
-	std	r10,RESULT(r1)
-	ori	r10,r10,PACA_IRQ_HARD_DIS
-	stb	r10,PACAIRQHAPPENED(r13)
-
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_early
 	std	r3,RESULT(r1)	/* Save result */
 	ld	r12,_MSR(r1)
 
-	/*
-	 * Restore soft mask settings.
-	 */
-	ld	r10,RESULT(r1)
-	stb	r10,PACAIRQHAPPENED(r13)
-	ld	r10,SOFTE(r1)
-	stb	r10,PACAIRQSOFTMASK(r13)
-
 #ifdef CONFIG_PPC_P7_NAP
 	/*
 	 * Check if thread was in power saving mode. We come here when any
@@ -2815,17 +2774,6 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	subi	r1,r1,INT_FRAME_SIZE
 	__GEN_COMMON_BODY soft_nmi
 
-	/*
-	 * Set IRQS_ALL_DISABLED and save PACAIRQHAPPENED (see
-	 * system_reset_common)
-	 */
-	li	r10,IRQS_ALL_DISABLED
-	stb	r10,PACAIRQSOFTMASK(r13)
-	lbz	r10,PACAIRQHAPPENED(r13)
-	std	r10,RESULT(r1)
-	ori	r10,r10,PACA_IRQ_HARD_DIS
-	stb	r10,PACAIRQHAPPENED(r13)
-
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	soft_nmi_interrupt
 
@@ -2833,14 +2781,6 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	li	r9,0
 	mtmsrd	r9,1
 
-	/*
-	 * Restore soft mask settings.
-	 */
-	ld	r10,RESULT(r1)
-	stb	r10,PACAIRQHAPPENED(r13)
-	ld	r10,SOFTE(r1)
-	stb	r10,PACAIRQSOFTMASK(r13)
-
 	kuap_kernel_restore r9, r10
 	EXCEPTION_RESTORE_REGS hsrr=0
 	RFI_TO_KERNEL
-- 
2.23.0

