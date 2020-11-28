Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2265A2C6FBE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 16:12:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cjw353jM9zF1rY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 02:12:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i8KJZERf; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjvMt3QjTzDsRF
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 01:42:02 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id x24so6974691pfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 06:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LsHRTuAm08jD6ZjvVu/iF5Wj1kbeclgOvmSVUI6pCO8=;
 b=i8KJZERfnmRxokosBSrKFc/yRFdrepzskJqS/tNArVH5VJIfDfLKOXVNfafkIF0EmR
 hU7NcZ1CKitlMHWfRjItUFG7yFnX/urfIQg85/vhEprvrqWhzs3JZkREI0fJ668pDflB
 qr/Nn7zvI38LO63jpr904XxQ3EYPMRxEzgzo9UQxtMqGAMSBlGJAJsNONnU7G4U0VJzR
 usNjzzPcIRf7w5MqAS9v08srZBp5LhlzAo7U4TmPmqpl+v/1gvSgheBKiY33kHQtSeWn
 51d2sNV+jakCviTzJcQD+P0xa/YMyOAtTR4V7QWhxwGMGj1eGqvpZk4Pce9ccTX4lWJv
 3yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LsHRTuAm08jD6ZjvVu/iF5Wj1kbeclgOvmSVUI6pCO8=;
 b=PEkaLqMLeJtuD3hkUWov2a9Eq/hdV5z+kYBkMZJmCdA0xZu1UySTnir0x+YwuT85VU
 9+o/Z7HqRTsQ9mql1SbGl9OVAtvgXAlgi9DlhlsIQIYPJO7sU07dxBRIxrBsQL7oUT1j
 um1ryaONcVGsYuJnb9a2Zzj/peLL7qekd78JzsPkpNZCVM4MYTIH/Sp4WufN2pmdNace
 +3lmb2q8p+ah0vX8H0tZz3EiXIDIy8608VMpoW4yCbD3UCEk64XCV8NUQM2l3wiuYi99
 jgcH+V5s/hqZkDrNxzZtA5sbGGkc+uqqeoQtIur7U3gPEUN8Ho9KJGpRwK+TJBN4XsOI
 J43w==
X-Gm-Message-State: AOAM533/V7+20e+fdrPQDFZAun2Bq6JPz2wBVDJ4LEaNHKYvCiYrxk30
 MgrCA+5q4nZlkew0rFD7V5dhHpOMGZs=
X-Google-Smtp-Source: ABdhPJxoo4PL8aYEjWnLsIti+9zK3w8WkPS1SKc8EavbBIgC0oR2p2DC7qYZxXJ4t7V8oiSb9R6xiQ==
X-Received: by 2002:a63:540d:: with SMTP id i13mr10953533pgb.37.1606574519619; 
 Sat, 28 Nov 2020 06:41:59 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-103-132.tpgi.com.au.
 [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id y201sm10750764pfb.2.2020.11.28.06.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 06:41:59 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 17/19] powerpc/64s: move NMI soft-mask handling to C
Date: Sun, 29 Nov 2020 00:41:12 +1000
Message-Id: <20201128144114.944000-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128144114.944000-1-npiggin@gmail.com>
References: <20201128144114.944000-1-npiggin@gmail.com>
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
index 8508b99d3455..5da7b0de545e 100644
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
index 2b447dd15d4c..b6d914db01da 100644
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
 	kuap_restore_amr r9, r10
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
 	kuap_restore_amr r9, r10
 	EXCEPTION_RESTORE_REGS hsrr=0
 	RFI_TO_KERNEL
-- 
2.23.0

