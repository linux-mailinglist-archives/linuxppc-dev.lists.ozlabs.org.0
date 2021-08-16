Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEE83ECF65
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 09:30:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp5Rh67Yrz3cSy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 17:30:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=R4dhYZ7d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=R4dhYZ7d; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp5Qz6xzfz30GQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 17:30:03 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 mq2-20020a17090b3802b0290178911d298bso26013703pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 00:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3rIDXIwggUsf4BGXQ+hlSn7tVsc4pMtC37z3zVitz4o=;
 b=R4dhYZ7dzCtLAxWQFt3tkA1xz43l+OYdfCOrNh912BN/swx6/bVU9LWlQREtsMoxGS
 551DXWp/g33z4HikliZl95SzrRmxh33poM8CQrFaZm7b4AChowuyqmPxt9Y3LxpmOQRF
 aawrtT0WcfOm3TM3o9pmB/973HkWU8wcLvSYEAjFAlAPIN0+a9PubgrZpTVhReIIzCML
 LI7lLIbVUlA63EZJ+LW2tponc9AdkUlsQBsCLWMiH1mU5R5okV4ayEePuuoxZOXYLBt3
 5BCS0owpp/gcllS4A2CrunKVIcFmdXbwFdbJZkzezgv5zyix91v6hO0AKTfSMcXpPRdx
 2BTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3rIDXIwggUsf4BGXQ+hlSn7tVsc4pMtC37z3zVitz4o=;
 b=tdPSUyoN9zyEGpQg/Eyml3cwzOCZt4Wo06ZcsZDi9chvZF5NS9G867ADM7GZdpjGDg
 qwzkUIoijJhhYfaogx2bOhNTkR3MQzhKVEtIPLtTis2W1M7lJEnUtXwo6AuZKkqJra6z
 yvKY0H+yga/pZhNt01pY65UsBA+FaW4UqANAhKxtxiO0iLCQwiLs7hQ/3Vm6HlV1BwLM
 WMz/MKRlkxOfR5u/Tq8i1iJCEweZ2sE/1GjuOh0UA0zAshnS94R7egbrI8PB6wm0j2GP
 NOwD1ynLmaiKPl4hnPT7YBlRZuorhoWpxWej8xizS+9V20tqsD6APJ97atFm+ehg7l0k
 R8iw==
X-Gm-Message-State: AOAM533+Pbz2ytFULMcj7jorCX27Q4zaXS6CvyIO7FCeMKKWd/eRmmqw
 8xCnAmhATcwmVCbIUlLYup71OTNAqgw=
X-Google-Smtp-Source: ABdhPJyrJ+blZrqz9KqmBGuuS63bSvoCHKd3LvCgkIlO+oY4FxQpbCgLJapQrwJSJ2BMGxGD3qQ4sg==
X-Received: by 2002:a17:90b:4c8e:: with SMTP id
 my14mr14957850pjb.234.1629099001474; 
 Mon, 16 Aug 2021 00:30:01 -0700 (PDT)
Received: from bobo.ibm.com (203-219-120-52.tpgi.com.au. [203.219.120.52])
 by smtp.gmail.com with ESMTPSA id e7sm10543887pfc.145.2021.08.16.00.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 00:30:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 1/4] powerpc/64: handle MSR EE and RI in interrupt entry
 wrapper
Date: Mon, 16 Aug 2021 17:29:50 +1000
Message-Id: <20210816072953.1165964-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210816072953.1165964-1-npiggin@gmail.com>
References: <20210816072953.1165964-1-npiggin@gmail.com>
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

64e is conceptually unchanged, but it also sets MSR[EE]=1 now in the
interrupt wrapper for synchronous interrupts with the same code.

On 64s, saves one mtmsrd L=1 for synchronous interrupts on 64s, which
saves about 20 cycles. For kernel-mode interrupts, both synchronous and
asynchronous, this saves an additional ~40 cycles due to the mtmsrd
being moved ahead of mfspr SPRN_AMR, which prevents a SPR scoreboard
stall (on POWER9).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 31 ++++++++++++++++++++++++----
 arch/powerpc/kernel/exceptions-64s.S | 30 ---------------------------
 arch/powerpc/kernel/fpu.S            |  5 +++++
 arch/powerpc/kernel/vector.S         |  8 +++++++
 4 files changed, 40 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 6b800d3e2681..e3228a911b35 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -148,9 +148,21 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
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
@@ -200,13 +212,20 @@ static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt
 
 static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
+#ifdef CONFIG_PPC64
+	/* Ensure interrupt_enter_prepare does not enable MSR[EE] */
+	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+#endif
+	interrupt_enter_prepare(regs, state);
 #ifdef CONFIG_PPC_BOOK3S_64
+	/*
+	 * MSR[RI] is only enabled after interrupt_enter_prepare, so this
+	 * thread flags access has to come afterward.
+	 */
 	if (cpu_has_feature(CPU_FTR_CTRL) &&
 	    !test_thread_local_flags(_TLF_RUNLATCH))
 		__ppc64_runlatch_on();
 #endif
-
-	interrupt_enter_prepare(regs, state);
 	irq_enter();
 }
 
@@ -273,6 +292,8 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		BUG_ON(!arch_irq_disabled_regs(regs) && !(regs->msr & MSR_EE));
 
+	__hard_RI_enable();
+
 	/* Don't do any per-CPU operations until interrupt state is fixed */
 
 	if (nmi_disables_ftrace(regs)) {
@@ -370,6 +391,8 @@ interrupt_handler long func(struct pt_regs *regs)			\
 {									\
 	long ret;							\
 									\
+	__hard_RI_enable();						\
+									\
 	ret = ____##func (regs);					\
 									\
 	return ret;							\
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 4aec59a77d4c..69a472c38f62 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -113,7 +113,6 @@ name:
 #define IISIDE		.L_IISIDE_\name\()	/* Uses SRR0/1 not DAR/DSISR */
 #define IDAR		.L_IDAR_\name\()	/* Uses DAR (or SRR0) */
 #define IDSISR		.L_IDSISR_\name\()	/* Uses DSISR (or SRR1) */
-#define ISET_RI		.L_ISET_RI_\name\()	/* Run common code w/ MSR[RI]=1 */
 #define IBRANCH_TO_COMMON	.L_IBRANCH_TO_COMMON_\name\() /* ENTRY branch to common */
 #define IREALMODE_COMMON	.L_IREALMODE_COMMON_\name\() /* Common runs in realmode */
 #define IMASK		.L_IMASK_\name\()	/* IRQ soft-mask bit */
@@ -157,9 +156,6 @@ do_define_int n
 	.ifndef IDSISR
 		IDSISR=0
 	.endif
-	.ifndef ISET_RI
-		ISET_RI=1
-	.endif
 	.ifndef IBRANCH_TO_COMMON
 		IBRANCH_TO_COMMON=1
 	.endif
@@ -512,11 +508,6 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
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
@@ -901,11 +892,6 @@ INT_DEFINE_BEGIN(system_reset)
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
@@ -986,8 +972,6 @@ EXC_COMMON_BEGIN(system_reset_common)
 	lhz	r10,PACA_IN_NMI(r13)
 	addi	r10,r10,1
 	sth	r10,PACA_IN_NMI(r13)
-	li	r10,MSR_RI
-	mtmsrd 	r10,1
 
 	mr	r10,r1
 	ld	r1,PACA_NMI_EMERG_SP(r13)
@@ -1061,12 +1045,6 @@ INT_DEFINE_BEGIN(machine_check_early)
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
@@ -1077,7 +1055,6 @@ INT_DEFINE_BEGIN(machine_check)
 	IVEC=0x200
 	IAREA=PACA_EXMC
 	IVIRT=0 /* no virt entry point */
-	ISET_RI=0
 	IDAR=1
 	IDSISR=1
 	IKVM_REAL=1
@@ -1147,9 +1124,6 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 BEGIN_FTR_SECTION
 	bl	enable_machine_check
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
-	li	r10,MSR_RI
-	mtmsrd	r10,1
-
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_early
 	std	r3,RESULT(r1)	/* Save result */
@@ -1237,10 +1211,6 @@ EXC_COMMON_BEGIN(machine_check_common)
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
diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
index 6010adcee16e..eabd578cb772 100644
--- a/arch/powerpc/kernel/fpu.S
+++ b/arch/powerpc/kernel/fpu.S
@@ -81,7 +81,12 @@ EXPORT_SYMBOL(store_fp_state)
  */
 _GLOBAL(load_up_fpu)
 	mfmsr	r5
+#ifdef CONFIG_PPC_BOOK3S_64
+	/* interrupt doesn't set MSR[RI] and HPT can fault on current access */
+	ori	r5,r5,MSR_FP|MSR_RI
+#else
 	ori	r5,r5,MSR_FP
+#endif
 #ifdef CONFIG_VSX
 BEGIN_FTR_SECTION
 	oris	r5,r5,MSR_VSX@h
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index fc120fac1910..ead2900d9bb0 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -47,6 +47,10 @@ EXPORT_SYMBOL(store_vr_state)
  */
 _GLOBAL(load_up_altivec)
 	mfmsr	r5			/* grab the current MSR */
+#ifdef CONFIG_PPC_BOOK3S_64
+	/* interrupt doesn't set MSR[RI] and HPT can fault on current access */
+	ori	r5,r5,MSR_RI
+#endif
 	oris	r5,r5,MSR_VEC@h
 	MTMSRD(r5)			/* enable use of AltiVec now */
 	isync
@@ -128,6 +132,10 @@ _GLOBAL(load_up_vsx)
 	andis.	r5,r12,MSR_VEC@h
 	beql+	load_up_altivec		/* skip if already loaded */
 
+	/* interrupt doesn't set MSR[RI] and HPT can fault on current access */
+	li	r5,MSR_RI
+	mtmsrd	r5,1
+
 	ld	r4,PACACURRENT(r13)
 	addi	r4,r4,THREAD		/* Get THREAD */
 	li	r6,1
-- 
2.23.0

