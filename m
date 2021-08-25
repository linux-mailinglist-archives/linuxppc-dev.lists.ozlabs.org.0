Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBAF3F7532
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 14:38:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gvlrp3Qvkz2yn2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 22:38:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=gml94f/j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gml94f/j; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvlqT44Twz2yHY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 22:37:25 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id g14so21154433pfm.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 05:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3rIDXIwggUsf4BGXQ+hlSn7tVsc4pMtC37z3zVitz4o=;
 b=gml94f/j/GVH2Ii52Ubff6eDhD00VIX3MOJjTbOl/GUnT4nUcAc0InfVAONDXLVRvE
 IepH+D7lQ2Mqbonjl9TexjVlAWiEqnx86wXTvXi1JfpB8eGJecocW9L1X/lsvrm0SSLk
 XDQJtUuUDAG3wnvxwX3r3Wa/pp2AyloOdniZPV3o+i9O7KXTvl6TXn84JKYSLvaO3Nba
 qnLUiLS24wWPfQooVt0CMLfpC4+FbvCKxXCDFKngxKknYmYqzk/xjV75oqPbuhBI4Zmi
 OMx3m05bgYVoeghOtGO6SALCpyjjKQBtMkheUKKBvBsaAw3ovEPGmevbON46Krv3dl3+
 XU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3rIDXIwggUsf4BGXQ+hlSn7tVsc4pMtC37z3zVitz4o=;
 b=PiNGhr3ql/v45RDTvSqVb4eq71qQfoaskjgBEr/HAbaGFnoyb8d9Hlzln99JlfouDs
 Youca+o30mW1jJZGdAGt5bGFgS2XPVzJV6pm0sHMYW2Y4I+NDpi0jLbaf3Lq/KQb8lS9
 hVfCXXJCj03VWEOeN2R6l+/fi7TCjHJOK6CYXpBkwhJhesOcAOI9EsMPSEooYibpaFL5
 QPC8s7CQnPEHX+5mdb+eaXTDYcqrQvQPUoWzacJPoJf0PpLg+mB1zRB5PpjbpezR+uGW
 lRB5myyLBul44f96zmN/Bzqv6KjTmNWWEI+Fe8mCJS4OPR5kz/4oLqlziHgLM8RYHGHK
 JKuA==
X-Gm-Message-State: AOAM530DqyJrrPzA8BCOHmLb4jWicsTzj6kSxhzg81jVZOUXGFhpxpJW
 hGTsEGh5ZkWczmY56kM5IJwIFrTaHwo=
X-Google-Smtp-Source: ABdhPJz6buRSm6LUep4Jm1VcZlYZ/vB9W2tzJKKx0Auv7vDEgxK8ri1Ks9VcDqjJwjg20s5NQ6e1PQ==
X-Received: by 2002:a62:864b:0:b029:3c7:7197:59fc with SMTP id
 x72-20020a62864b0000b02903c7719759fcmr44125267pfd.59.1629895042008; 
 Wed, 25 Aug 2021 05:37:22 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-119-33.tpgi.com.au.
 [193.116.119.33])
 by smtp.gmail.com with ESMTPSA id j6sm22043162pfi.220.2021.08.25.05.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 05:37:21 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/4] powerpc/64: handle MSR EE and RI in interrupt entry
 wrapper
Date: Wed, 25 Aug 2021 22:37:11 +1000
Message-Id: <20210825123714.706201-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210825123714.706201-1-npiggin@gmail.com>
References: <20210825123714.706201-1-npiggin@gmail.com>
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

