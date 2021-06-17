Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C98A23AB7EF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:53:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5RRz3kVRz3dD6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:53:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Tl5RZ9Rq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Tl5RZ9Rq; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5RPQ4hJZz3byv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 01:51:38 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id c15so3078626pls.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 08:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JXaMtH38ojJxkTePBFZRHqsQEo1av/H9xt6bLdKfnI0=;
 b=Tl5RZ9RqFCpU8PQHQnKFijEbDau8GWEaaFREGCF1QCowPtRBQJ8OVE1GmmdngYxS6c
 fCQhXXCE1Gf28edaLPjIWcKmWBKvBA0dt8Yx9IoCi1FMkq7Tvx2z1Rv4pHGqyZk1/MzL
 q6mK0+6fPU8tL0C4fx2MlFMHvZD2SjbEjIIiuBmnZEEkdGdG9yFew/D8d6KlppXaJ0TV
 MXf4i0eSWKdObv6SSAjuUQUabZU268TMO2dwydgA3voZHuRhMkREHDlvZKk736JtFXMp
 M3YR2MAA27PFTZQ3/xTh56e53sNZ63yRceP8zz0/6/JTyzfOOUEek2bkNAUGTs8CrwAr
 Racw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JXaMtH38ojJxkTePBFZRHqsQEo1av/H9xt6bLdKfnI0=;
 b=jtJuFYAxEgEg0BvmowEo2l3I7A4aWy8p7BNmsigLqorp1rRO5IWoOU+eba5r/YBPYy
 JxEhb/D7j/JTKGepYmf7gVjj5v5eeZ6Xe/lbE/4xTWe/t2t5LVIEyV88e6o0dODO4Njr
 GxdmgA2WVoxJsq2mf3IaiNP4WyisSuydGkoE4q87jpLtEyLS2akeGw/T5KmCmbuueFlM
 4noTGvRJXetTk/BL2LsfDVECH7klmuMfktn6SL/J8o7YPBT3Gy7gKQLj512Vfw6khwVu
 8nZeayrhSTijIoFg22FcgS0SwDosdJ8UCsTovSVK0jTjOjGeOfXjWtJnmGlr1VaB65xX
 +MIA==
X-Gm-Message-State: AOAM530QWLpMirvkjOLErr4SZtcGlwrFjYU/4q0SI53rgPzRMBculC2m
 jtVPG/VPAur6q6+wCrPhV5VFE7vCLss=
X-Google-Smtp-Source: ABdhPJzajVJzqFiG5KMci/o7RTyfrXC+wG+c8V2hOoS6H3/wANi8QW2ZCjHfMh/jI3NlZmnqgApI7w==
X-Received: by 2002:a17:90b:3b92:: with SMTP id
 pc18mr6076311pjb.100.1623945095354; 
 Thu, 17 Jun 2021 08:51:35 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id a15sm5749733pfl.100.2021.06.17.08.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:51:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 05/17] powerpc/64: handle MSR EE and RI in interrupt entry
 wrapper
Date: Fri, 18 Jun 2021 01:51:04 +1000
Message-Id: <20210617155116.2167984-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210617155116.2167984-1-npiggin@gmail.com>
References: <20210617155116.2167984-1-npiggin@gmail.com>
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

Similarly to the system call change in the previous patch, the mtmsrd to
enable RI can be combined with the mtmsrd to enable EE for interrupts
which enable the latter, which tends to be the important synchronous
interrupts (i.e., page faults).

Do this by enabling EE and RI together at the beginning of the entry
wrapper if PACA_IRQ_HARD_DIS is clear, and just enabling RI if it is set
(which means something wanted EE=0).

Asynchronous interrupts set PACA_IRQ_HARD_DIS, but synchronous ones
leave it unchanged, so by default they always get EE=1 unless they
interrupt a caller that has hard disabled. When the sync interrupt
later calls interrupt_cond_local_irq_enable(), that will not require
another mtmsrd because we already enabled here.

This tends to save one mtmsrd L=1 for synchronous interrupts on 64s.
64e is conceptually unchanged, but it also sets MSR[EE]=1 now in the
interrupt wrapper for synchronous interrupts with the same code.

From: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 22 ++++++++++++++++++--
 arch/powerpc/kernel/exceptions-64s.S | 30 ----------------------------
 2 files changed, 20 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 6e9d18838d56..b9c510187b58 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -126,9 +126,21 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 #endif
 
 #ifdef CONFIG_PPC64
-	if (irq_soft_mask_set_return(IRQS_ALL_DISABLED) == IRQS_ENABLED)
+	bool trace_enable = false;
+
+	if (IS_ENABLED(CONFIG_TRACE_IRQFLAGS)) {
+		if (irq_soft_mask_set_return(IRQS_DISABLED) == IRQS_ENABLED)
+			trace_enable = true;
+	} else {
+		irq_soft_mask_set(IRQS_DISABLED);
+	}
+	/* If the interrupt was taken with HARD_DIS set, don't enable MSR[EE] */
+	if (local_paca->irq_happened & PACA_IRQ_HARD_DIS)
+		__hard_RI_enable();
+	else
+		__hard_irq_enable();
+	if (trace_enable)
 		trace_hardirqs_off();
-	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 
 	if (user_mode(regs)) {
 		CT_WARN_ON(ct_state() != CONTEXT_USER);
@@ -175,6 +187,10 @@ static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct in
 		__ppc64_runlatch_on();
 #endif
 
+#ifdef CONFIG_PPC64
+	/* Ensure interrupt_enter_prepare does not enable MSR[EE] */
+	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+#endif
 	interrupt_enter_prepare(regs, state);
 	irq_enter();
 }
@@ -239,6 +255,8 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 		regs->softe = IRQS_ALL_DISABLED;
 	}
 
+	__hard_RI_enable();
+
 	/* Don't do any per-CPU operations until interrupt state is fixed */
 
 	if (nmi_disables_ftrace(regs)) {
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 5c18a2a3058d..a2ae14d0600e 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -129,7 +129,6 @@ name:
 #define IISIDE		.L_IISIDE_\name\()	/* Uses SRR0/1 not DAR/DSISR */
 #define IDAR		.L_IDAR_\name\()	/* Uses DAR (or SRR0) */
 #define IDSISR		.L_IDSISR_\name\()	/* Uses DSISR (or SRR1) */
-#define ISET_RI		.L_ISET_RI_\name\()	/* Run common code w/ MSR[RI]=1 */
 #define IBRANCH_TO_COMMON	.L_IBRANCH_TO_COMMON_\name\() /* ENTRY branch to common */
 #define IREALMODE_COMMON	.L_IREALMODE_COMMON_\name\() /* Common runs in realmode */
 #define IMASK		.L_IMASK_\name\()	/* IRQ soft-mask bit */
@@ -174,9 +173,6 @@ do_define_int n
 	.ifndef IDSISR
 		IDSISR=0
 	.endif
-	.ifndef ISET_RI
-		ISET_RI=1
-	.endif
 	.ifndef IBRANCH_TO_COMMON
 		IBRANCH_TO_COMMON=1
 	.endif
@@ -581,11 +577,6 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 	stb	r10,PACASRR_VALID(r13)
 	.endif
 
-	.if ISET_RI
-	li	r10,MSR_RI
-	mtmsrd	r10,1			/* Set MSR_RI */
-	.endif
-
 	.if ISTACK
 	.if IKUAP
 	kuap_save_amr_and_lock r9, r10, cr1, cr0
@@ -906,11 +897,6 @@ INT_DEFINE_BEGIN(system_reset)
 	IVEC=0x100
 	IAREA=PACA_EXNMI
 	IVIRT=0 /* no virt entry point */
-	/*
-	 * MSR_RI is not enabled, because PACA_EXNMI and nmi stack is
-	 * being used, so a nested NMI exception would corrupt it.
-	 */
-	ISET_RI=0
 	ISTACK=0
 	IKVM_REAL=1
 INT_DEFINE_END(system_reset)
@@ -991,8 +977,6 @@ EXC_COMMON_BEGIN(system_reset_common)
 	lhz	r10,PACA_IN_NMI(r13)
 	addi	r10,r10,1
 	sth	r10,PACA_IN_NMI(r13)
-	li	r10,MSR_RI
-	mtmsrd 	r10,1
 
 	mr	r10,r1
 	ld	r1,PACA_NMI_EMERG_SP(r13)
@@ -1068,12 +1052,6 @@ INT_DEFINE_BEGIN(machine_check_early)
 	IAREA=PACA_EXMC
 	IVIRT=0 /* no virt entry point */
 	IREALMODE_COMMON=1
-	/*
-	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
-	 * nested machine check corrupts it. machine_check_common enables
-	 * MSR_RI.
-	 */
-	ISET_RI=0
 	ISTACK=0
 	IDAR=1
 	IDSISR=1
@@ -1084,7 +1062,6 @@ INT_DEFINE_BEGIN(machine_check)
 	IVEC=0x200
 	IAREA=PACA_EXMC
 	IVIRT=0 /* no virt entry point */
-	ISET_RI=0
 	IDAR=1
 	IDSISR=1
 	IKVM_SKIP=1
@@ -1155,9 +1132,6 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 BEGIN_FTR_SECTION
 	bl	enable_machine_check
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
-	li	r10,MSR_RI
-	mtmsrd	r10,1
-
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_early
 	std	r3,RESULT(r1)	/* Save result */
@@ -1245,10 +1219,6 @@ EXC_COMMON_BEGIN(machine_check_common)
 	 * save area: PACA_EXMC instead of PACA_EXGEN.
 	 */
 	GEN_COMMON machine_check
-
-	/* Enable MSR_RI when finished with PACA_EXMC */
-	li	r10,MSR_RI
-	mtmsrd 	r10,1
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_exception
 	b	interrupt_return_srr
-- 
2.23.0

