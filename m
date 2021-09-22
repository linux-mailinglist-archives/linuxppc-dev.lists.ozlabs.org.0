Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71810414C85
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 16:56:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF1bW2BcVz2yxV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 00:56:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LU8ugVOQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LU8ugVOQ; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF1YM60ghz2ydk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 00:55:03 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id n2so1905137plk.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AMX/oAjKv6f9mK3Ss6/qBHj+dyG1ST4BoPobFtbYM4k=;
 b=LU8ugVOQsIBhbnJI6DKE/mb+bw/EP7QYx7tb3shYM1UrNe4nVqaBcOC8tIfdTJ+TWA
 vvMEE1oFsq5s8D4GVtviD1pCasiDsxQWJ7cHqFdjcvII5SQsvUl7PfEocAwz3If1ZSHZ
 kwSwsX8NbwSeyuvTt26tHBIKTzyGHpsDxXC3uL9yRzTDSi6wSYVzTl3qDCp0TB2enNvL
 NWyHBvCLv7dCH5sRM0/QRh8Kg6siwpaZYSsxlarNpdH7+bvMnjlHJB44gNG/SAek/i8x
 8hBAmGBrXB0jSwfzx68wWN7gQkHRdXybQt6Xt8xbxoGCZp2EShB3jfrNdZLJbaiftLDS
 wmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AMX/oAjKv6f9mK3Ss6/qBHj+dyG1ST4BoPobFtbYM4k=;
 b=7GSoroICi/J3xThqzRHKzheUmRKMM/BcNutid4JOTF+DGKTzj8r1oV4dhXynrvpDmO
 40Q+uj2aCWvbbmYzH3dLe1TpNAyrJxDTQrJHUx/7TNX5b7SbBEBYG9yQFKXrmKI0kRGc
 OwxjCsPFlOtMWXMqHdaaymQUeFJAv1nMhNbMoeqaZYWUsF3kKxCnRDcsQ/s3MmmwgRKI
 5d9KVs9fQmIEiGwoVEqXjYPG6FBZ4VkLjQhUqrz5uIlVYQy0YyaVzKP2KS5n94SurmHp
 XRzS+RsTiqP3pawKSVsaLsbiWigml7C+jwHlpDTlwfBYnpNEBnQi8eYelWiwesAr1ew9
 7s3w==
X-Gm-Message-State: AOAM533s3/Oc7tW+A4fO3IHDBnT+1ef65N2z/DT81YxDXX++gxplzcSR
 KQv4BmxVnoeSOzuXGT3qA8XcN/bPoWY=
X-Google-Smtp-Source: ABdhPJxo/UH0LUP+6Hr7/E48uV/MXKozqgb0DYvSo99IE3gGLVBhReQJ0bxglvM/bNswiaIQNRiBig==
X-Received: by 2002:a17:90a:1942:: with SMTP id
 2mr11770500pjh.36.1632322501338; 
 Wed, 22 Sep 2021 07:55:01 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id o14sm2856211pfh.145.2021.09.22.07.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 07:55:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/6] powerpc/64s/interrupt: handle MSR EE and RI in
 interrupt entry wrapper
Date: Thu, 23 Sep 2021 00:54:48 +1000
Message-Id: <20210922145452.352571-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210922145452.352571-1-npiggin@gmail.com>
References: <20210922145452.352571-1-npiggin@gmail.com>
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

The mtmsrd to enable MSR[RI] can be combined with the mtmsrd to enable
MSR[EE] in interrupt entry code, for those interrupts which enable EE.
This helps performance of important synchronous interrupts (e.g., page
faults).

This is similar to what commit dd152f70bdc1 ("powerpc/64s: system call
avoid setting MSR[RI] until we set MSR[EE]") does for system calls.

Do this by enabling EE and RI together at the beginning of the entry
wrapper if PACA_IRQ_HARD_DIS is clear, and only enabling RI if it is
set.

Asynchronous interrupts set PACA_IRQ_HARD_DIS, but synchronous ones
leave it unchanged, so by default they always get EE=1 unless they have
interrupted a caller that is hard disabled. When the sync interrupt
later calls interrupt_cond_local_irq_enable(), it will not require
another mtmsrd because MSR[EE] was already enabled here.

This avoids one mtmsrd L=1 for synchronous interrupts on 64s, which
saves about 20 cycles on POWER9. And for kernel-mode interrupts, both
synchronous and asynchronous, this saves an additional 40 cycles due to
the mtmsrd being moved ahead of mfspr SPRN_AMR, which prevents a SPR
scoreboard stall.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h | 27 +++++++++++++++++---
 arch/powerpc/kernel/exceptions-64s.S | 38 +++-------------------------
 arch/powerpc/kernel/fpu.S            |  5 ++++
 arch/powerpc/kernel/vector.S         | 10 ++++++++
 4 files changed, 42 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 3802390d8eea..e178d143671a 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -148,8 +148,14 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 #endif
 
 #ifdef CONFIG_PPC64
-	if (irq_soft_mask_set_return(IRQS_ALL_DISABLED) == IRQS_ENABLED)
-		trace_hardirqs_off();
+	bool trace_enable = false;
+
+	if (IS_ENABLED(CONFIG_TRACE_IRQFLAGS)) {
+		if (irq_soft_mask_set_return(IRQS_ALL_DISABLED) == IRQS_ENABLED)
+			trace_enable = true;
+	} else {
+		irq_soft_mask_set(IRQS_ALL_DISABLED);
+	}
 
 	/*
 	 * If the interrupt was taken with HARD_DIS clear, then enable MSR[EE].
@@ -163,8 +169,14 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 			BUG_ON(!(regs->msr & MSR_EE));
 		__hard_irq_enable();
+	} else {
+		__hard_RI_enable();
 	}
 
+	/* Do this when RI=1 because it can cause SLB faults */
+	if (trace_enable)
+		trace_hardirqs_off();
+
 	if (user_mode(regs)) {
 		CT_WARN_ON(ct_state() != CONTEXT_USER);
 		user_exit_irqoff();
@@ -217,13 +229,16 @@ static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct in
 	/* Ensure interrupt_enter_prepare does not enable MSR[EE] */
 	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 #endif
+	interrupt_enter_prepare(regs, state);
 #ifdef CONFIG_PPC_BOOK3S_64
+	/*
+	 * RI=1 is set by interrupt_enter_prepare, so this thread flags access
+	 * has to come afterward (it can cause SLB faults).
+	 */
 	if (cpu_has_feature(CPU_FTR_CTRL) &&
 	    !test_thread_local_flags(_TLF_RUNLATCH))
 		__ppc64_runlatch_on();
 #endif
-
-	interrupt_enter_prepare(regs, state);
 	irq_enter();
 }
 
@@ -293,6 +308,8 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 		regs->softe = IRQS_ALL_DISABLED;
 	}
 
+	__hard_RI_enable();
+
 	/* Don't do any per-CPU operations until interrupt state is fixed */
 
 	if (nmi_disables_ftrace(regs)) {
@@ -390,6 +407,8 @@ interrupt_handler long func(struct pt_regs *regs)			\
 {									\
 	long ret;							\
 									\
+	__hard_RI_enable();						\
+									\
 	ret = ____##func (regs);					\
 									\
 	return ret;							\
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 37859e62a8dc..4dcc76206f8e 100644
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
@@ -902,11 +893,6 @@ INT_DEFINE_BEGIN(system_reset)
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
@@ -979,16 +965,14 @@ TRAMP_REAL_BEGIN(system_reset_fwnmi)
 EXC_COMMON_BEGIN(system_reset_common)
 	__GEN_COMMON_ENTRY system_reset
 	/*
-	 * Increment paca->in_nmi then enable MSR_RI. SLB or MCE will be able
-	 * to recover, but nested NMI will notice in_nmi and not recover
-	 * because of the use of the NMI stack. in_nmi reentrancy is tested in
-	 * system_reset_exception.
+	 * Increment paca->in_nmi. When the interrupt entry wrapper later
+	 * enable MSR_RI, then SLB or MCE will be able to recover, but a nested
+	 * NMI will notice in_nmi and not recover because of the use of the NMI
+	 * stack. in_nmi reentrancy is tested in system_reset_exception.
 	 */
 	lhz	r10,PACA_IN_NMI(r13)
 	addi	r10,r10,1
 	sth	r10,PACA_IN_NMI(r13)
-	li	r10,MSR_RI
-	mtmsrd 	r10,1
 
 	mr	r10,r1
 	ld	r1,PACA_NMI_EMERG_SP(r13)
@@ -1062,12 +1046,6 @@ INT_DEFINE_BEGIN(machine_check_early)
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
@@ -1078,7 +1056,6 @@ INT_DEFINE_BEGIN(machine_check)
 	IVEC=0x200
 	IAREA=PACA_EXMC
 	IVIRT=0 /* no virt entry point */
-	ISET_RI=0
 	IDAR=1
 	IDSISR=1
 	IKVM_REAL=1
@@ -1148,9 +1125,6 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 BEGIN_FTR_SECTION
 	bl	enable_machine_check
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
-	li	r10,MSR_RI
-	mtmsrd	r10,1
-
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_early
 	std	r3,RESULT(r1)	/* Save result */
@@ -1238,10 +1212,6 @@ EXC_COMMON_BEGIN(machine_check_common)
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
index ba4afe3b5a9c..f71f2bbd4de6 100644
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
index ba03eedfdcd8..5cc24d8cce94 100644
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
@@ -126,6 +130,12 @@ _GLOBAL(load_up_vsx)
 	andis.	r5,r12,MSR_VEC@h
 	beql+	load_up_altivec		/* skip if already loaded */
 
+#ifdef CONFIG_PPC_BOOK3S_64
+	/* interrupt doesn't set MSR[RI] and HPT can fault on current access */
+	li	r5,MSR_RI
+	mtmsrd	r5,1
+#endif
+
 	ld	r4,PACACURRENT(r13)
 	addi	r4,r4,THREAD		/* Get THREAD */
 	li	r6,1
-- 
2.23.0

