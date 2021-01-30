Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2533309601
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:47:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DScVr0my4zDsbP
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:47:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qTLnN+lO; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSZNF04fLzDrS4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:11:25 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id md11so7232355pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IMi9jv4ICj/haZzHtAnOeKCyCgsHmO/BGSCXL064HWI=;
 b=qTLnN+lOEHPg1Af3EgA2Xpmde+lnx4FLg4mB/AuvfDq1oMnuCDmVbrLk42gjhF/prq
 I6NZvK1xZpsoNxwEVxRIR9MNpDAlW9x1virRqaLm8YRUAsmvbUgCGIN+04wBrahVIQNb
 hQgWpSIb9mbd32WEgGMhmoqIcEW/w8dBFEIZUqDQlW0RvD0XJ2AkwQx/3ubF1C8X7AOk
 KHBSmlIZPAmgcqoX+9OrMnv2DPU+T9nl6YC+MX1YsvmAX5HDL99KGinFOMHbounCfMkv
 G0c3BE4Hy601jvJhFZTqKahxU4Jt6hlqoe44tCVBQtOXKYP7jPI3zFOSVLaSAVK9SvZy
 IhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IMi9jv4ICj/haZzHtAnOeKCyCgsHmO/BGSCXL064HWI=;
 b=iSUqDzx0lFp9HB+Rxtv2EqIkcwK2KKDikpm5E6ACNYjWEXxMgaw+PICoimYhPt57AN
 KjVuHSxoM7CuPil6Duz2pRuBVHZvhwCTZI+vkWEPaHmYciXhItmDd3ziRqii0/859IMq
 ay5KJG+vUQOp8rkP5XUPbz1tERQTzfPcce5B+eC8VZaDgn9EC49CSR9LW8YMopMFAHz/
 FsTyFISdFkeMMJmRzH7SsnqxbuBg3sgUsM3qLU7TpZiGPOfDf9vQL/jfkavAGNP2/3YT
 x8v3mvg5QDNZr5AAD12vsnSYkpc3QUnQPbiWMFMKyJ5TsbnBsqfrRhhfNjcg6E5bAPA5
 IWWA==
X-Gm-Message-State: AOAM533eTYhaJDwCINfjONdASzx4dS+i5g7YUv3Zfoh/QalUHXAzPiaJ
 K5s2oIUIYT7RkM/QLLPlPHYF0hDtEfA=
X-Google-Smtp-Source: ABdhPJxMSlqZx/KGP2OrKfTLNiBRkTHTo8giyNOdIZLO5Zpw0fYg30okUjOXWEUBxWiApuyoaKf+EQ==
X-Received: by 2002:a17:902:eb12:b029:df:f561:c06b with SMTP id
 l18-20020a170902eb12b02900dff561c06bmr9638847plb.39.1612012282707; 
 Sat, 30 Jan 2021 05:11:22 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id y16sm12102240pgg.20.2021.01.30.05.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:11:22 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 40/42] powerpc/64s: move NMI soft-mask handling to C
Date: Sat, 30 Jan 2021 23:08:50 +1000
Message-Id: <20210130130852.2952424-41-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210130130852.2952424-1-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Saving and restoring soft-mask state can now be done in C using the
interrupt handler wrapper functions.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 25 ++++++++++++
 arch/powerpc/kernel/exceptions-64s.S | 60 ----------------------------
 2 files changed, 25 insertions(+), 60 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index cd819d42573c..72a585084066 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -95,6 +95,10 @@ static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct int
 
 struct interrupt_nmi_state {
 #ifdef CONFIG_PPC64
+#ifdef CONFIG_PPC_BOOK3S_64
+	u8 irq_soft_mask;
+	u8 irq_happened;
+#endif
 	u8 ftrace_enabled;
 #endif
 };
@@ -102,6 +106,20 @@ struct interrupt_nmi_state {
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
+#endif
 	/* Allow DEC and PMI to be traced when they are soft-NMI */
 	if (TRAP(regs) != 0x900 && TRAP(regs) != 0xf00 && TRAP(regs) != 0x260) {
 		state->ftrace_enabled = this_cpu_get_ftrace_enabled();
@@ -129,6 +147,13 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 #ifdef CONFIG_PPC64
 	if (TRAP(regs) != 0x900 && TRAP(regs) != 0xf00 && TRAP(regs) != 0x260)
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
index 94b89ea123f3..2fca2bad6b02 100644
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
@@ -2818,17 +2777,6 @@ EXC_COMMON_BEGIN(soft_nmi_common)
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
 
@@ -2836,14 +2784,6 @@ EXC_COMMON_BEGIN(soft_nmi_common)
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

