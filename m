Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 273C233D216
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 11:45:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F090V6Qvwz3cDR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 21:44:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=iUPt76gI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iUPt76gI; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F08xy08f8z30LR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 21:42:45 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id j6so16736702plx.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 03:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8tas6DdL07+xDffS87lgRXfDLe52u+MFtvNI2eJ4D0Y=;
 b=iUPt76gIF9+WwVUkeqOx6yPZfA8AUff6K0SljBwnp4Ss3oP1uVzLqvAtlYYeL1y1T7
 9pAk9lSIdt+YqZATarcHusUvSSt5hx9JDWDCZe8/ogH69qzdQCDXedF+x5nGuCbJnmLN
 HHqbAJeYkSn0/+Llt6K9l37cCboknaPO0/vIfYYE9nttqDt/XeimBxDRpAypbJQ985ub
 qIHMRCNlTHlgcWgbeQjBps2GAY6BWn+yWh2zv8oZyj5lEGbZbOxVWrmeGQGevmeY2UNN
 R7EUr0fs+kV6uBJv+EAQx4o76cptKu/1CcyAr3OIN3KCTl1nAYcvZqJWAcURuTkXRlhr
 GAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8tas6DdL07+xDffS87lgRXfDLe52u+MFtvNI2eJ4D0Y=;
 b=UxV9hCbXI9JK9DwuZKF+cUY01JEzQGZRg0mvKMnUFrpa/uo5+4MZEA0ZEIc/9/P745
 TqpqUBxxzheWbBbAYGhOh2EVP/8DXI63TWv9TcDkVbm5XsigTcGWikXpKsZrcA/GyrWi
 lSDmled52i24RPxktNYFcbZ80UTZVS2OneeOQfkMJrec2ie69o6jCksl705RksvAY2zQ
 BHFs9yY07GdPVP1E/juepVvgbtp1Hn4sIzKk5LrihwaoZkUnbkhx+6arUd57FwlKON6R
 okSQ2H+eb3P23ECwOwNjZHeAcQ+TP24E65+OLBCKL6c5IovFKDWtoM24oM1Wx79m/RTn
 zq5w==
X-Gm-Message-State: AOAM53071BLuUHcgYkbSGdjVOfcuR9zPTHwr1anlODyBP9l3yeizV3b5
 d4pxJ17yUUd+wfnEjHVicbXd9J37hss=
X-Google-Smtp-Source: ABdhPJwFbCZ6De8zafs32xT7FzlJhftMUfmv3s2KvzlDHLBLlewnxLpvJvRan8Jn6FIngCvYLQwnuw==
X-Received: by 2002:a17:90b:228c:: with SMTP id
 kx12mr4058549pjb.7.1615891363000; 
 Tue, 16 Mar 2021 03:42:43 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 r30sm15828489pgu.86.2021.03.16.03.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 03:42:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/11] powerpc/64e/interrupt: NMI save irq soft-mask state
 in C
Date: Tue, 16 Mar 2021 20:41:59 +1000
Message-Id: <20210316104206.407354-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210316104206.407354-1-npiggin@gmail.com>
References: <20210316104206.407354-1-npiggin@gmail.com>
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

64e non-maskable interrupts save the state of the irq soft-mask in
asm. This can be done in C in interrupt wrappers as 64s does.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

I haven't been able to test this with qemu because it doesn't seem
to cause FSL bookE WDT interrupts.

This makes WatchdogException an NMI interrupt, which affects 32-bit
as well (okay, or create a new handler?)
---
 arch/powerpc/include/asm/interrupt.h | 32 +++++++++++++++++--------
 arch/powerpc/kernel/exceptions-64e.S | 36 ++++------------------------
 arch/powerpc/kernel/traps.c          | 13 +++++++++-
 3 files changed, 38 insertions(+), 43 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 7c633896d758..305d7c17a4cf 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -130,18 +130,32 @@ static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct int
 
 struct interrupt_nmi_state {
 #ifdef CONFIG_PPC64
-#ifdef CONFIG_PPC_BOOK3S_64
 	u8 irq_soft_mask;
 	u8 irq_happened;
-#endif
 	u8 ftrace_enabled;
 #endif
 };
 
+static inline bool nmi_disables_ftrace(struct pt_regs *regs)
+{
+	/* Allow DEC and PMI to be traced when they are soft-NMI */
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {
+		if (TRAP(regs) == 0x900)
+		       return false;
+		if (TRAP(regs) == 0xf00)
+		       return false;
+	}
+	if (IS_ENABLED(CONFIG_PPC_BOOK3E)) {
+		if (TRAP(regs) == 0x260)
+			return false;
+	}
+
+	return true;
+}
+
 static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
 {
 #ifdef CONFIG_PPC64
-#ifdef CONFIG_PPC_BOOK3S_64
 	state->irq_soft_mask = local_paca->irq_soft_mask;
 	state->irq_happened = local_paca->irq_happened;
 
@@ -154,9 +168,8 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 
 	/* Don't do any per-CPU operations until interrupt state is fixed */
-#endif
-	/* Allow DEC and PMI to be traced when they are soft-NMI */
-	if (TRAP(regs) != 0x900 && TRAP(regs) != 0xf00 && TRAP(regs) != 0x260) {
+
+	if (nmi_disables_ftrace(regs)) {
 		state->ftrace_enabled = this_cpu_get_ftrace_enabled();
 		this_cpu_set_ftrace_enabled(0);
 	}
@@ -180,16 +193,14 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 		nmi_exit();
 
 #ifdef CONFIG_PPC64
-	if (TRAP(regs) != 0x900 && TRAP(regs) != 0xf00 && TRAP(regs) != 0x260)
+	if (nmi_disables_ftrace(regs))
 		this_cpu_set_ftrace_enabled(state->ftrace_enabled);
 
-#ifdef CONFIG_PPC_BOOK3S_64
 	/* Check we didn't change the pending interrupt mask. */
 	WARN_ON_ONCE((state->irq_happened | PACA_IRQ_HARD_DIS) != local_paca->irq_happened);
 	local_paca->irq_happened = state->irq_happened;
 	local_paca->irq_soft_mask = state->irq_soft_mask;
 #endif
-#endif
 }
 
 /*
@@ -402,6 +413,7 @@ DECLARE_INTERRUPT_HANDLER(SMIException);
 DECLARE_INTERRUPT_HANDLER(handle_hmi_exception);
 DECLARE_INTERRUPT_HANDLER(unknown_exception);
 DECLARE_INTERRUPT_HANDLER_ASYNC(unknown_async_exception);
+DECLARE_INTERRUPT_HANDLER_NMI(unknown_nmi_exception);
 DECLARE_INTERRUPT_HANDLER(instruction_breakpoint_exception);
 DECLARE_INTERRUPT_HANDLER(RunModeException);
 DECLARE_INTERRUPT_HANDLER(single_step_exception);
@@ -425,7 +437,7 @@ DECLARE_INTERRUPT_HANDLER(altivec_assist_exception);
 DECLARE_INTERRUPT_HANDLER(CacheLockingException);
 DECLARE_INTERRUPT_HANDLER(SPEFloatingPointException);
 DECLARE_INTERRUPT_HANDLER(SPEFloatingPointRoundException);
-DECLARE_INTERRUPT_HANDLER(WatchdogException);
+DECLARE_INTERRUPT_HANDLER_NMI(WatchdogException);
 DECLARE_INTERRUPT_HANDLER(kernel_bad_stack);
 
 /* slb.c */
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 7a2e7be33092..18be576fc0b3 100644
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
@@ -119,15 +116,11 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_MAS5,r10
 	mtspr	SPRN_MAS8,r10
 END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
-	SPECIAL_EXC_STORE(r9,IRQHAPPENED)
-
 	mfspr	r10,SPRN_DEAR
 	SPECIAL_EXC_STORE(r10,DEAR)
 	mfspr	r10,SPRN_ESR
 	SPECIAL_EXC_STORE(r10,ESR)
 
-	lbz	r10,PACAIRQSOFTMASK(r13)
-	SPECIAL_EXC_STORE(r10,SOFTE)
 	ld	r10,_NIP(r1)
 	SPECIAL_EXC_STORE(r10,CSRR0)
 	ld	r10,_MSR(r1)
@@ -194,27 +187,6 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_MAS8,r10
 END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
 
-	lbz	r6,PACAIRQSOFTMASK(r13)
-	ld	r5,SOFTE(r1)
-
-	/* Interrupts had better not already be enabled... */
-	tweqi	r6,IRQS_ENABLED
-
-	andi.	r6,r5,IRQS_DISABLED
-	bne	1f
-
-	TRACE_ENABLE_INTS
-	stb	r5,PACAIRQSOFTMASK(r13)
-1:
-	/*
-	 * Restore PACAIRQHAPPENED rather than setting it based on
-	 * the return MSR[EE], since we could have interrupted
-	 * interrupt replay or other inconsistent transitory
-	 * states that must remain that way.
-	 */
-	SPECIAL_EXC_LOAD(r10,IRQHAPPENED)
-	stb	r10,PACAIRQHAPPENED(r13)
-
 	SPECIAL_EXC_LOAD(r10,DEAR)
 	mtspr	SPRN_DEAR,r10
 	SPECIAL_EXC_LOAD(r10,ESR)
@@ -566,7 +538,7 @@ __end_interrupts:
 	bl	special_reg_save
 	CHECK_NAPPING();
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	unknown_exception
+	bl	unknown_nmi_exception
 	b	ret_from_crit_except
 
 /* Machine Check Interrupt */
@@ -702,7 +674,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 #ifdef CONFIG_BOOKE_WDT
 	bl	WatchdogException
 #else
-	bl	unknown_exception
+	bl	unknown_nmi_exception
 #endif
 	b	ret_from_crit_except
 
@@ -886,7 +858,7 @@ kernel_dbg_exc:
 	bl	special_reg_save
 	CHECK_NAPPING();
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	unknown_exception
+	bl	unknown_nmi_exception
 	b	ret_from_crit_except
 
 /*
@@ -910,7 +882,7 @@ kernel_dbg_exc:
 	bl	special_reg_save
 	CHECK_NAPPING();
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	unknown_exception
+	bl	unknown_nmi_exception
 	b	ret_from_crit_except
 
 /* Hypervisor call */
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index c74e7727860a..97b5f3d83ff7 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1079,6 +1079,16 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(unknown_async_exception)
 	_exception(SIGTRAP, regs, TRAP_UNK, 0);
 }
 
+DEFINE_INTERRUPT_HANDLER_NMI(unknown_nmi_exception)
+{
+	printk("Bad trap at PC: %lx, SR: %lx, vector=%lx\n",
+	       regs->nip, regs->msr, regs->trap);
+
+	_exception(SIGTRAP, regs, TRAP_UNK, 0);
+
+	return 0;
+}
+
 DEFINE_INTERRUPT_HANDLER(instruction_breakpoint_exception)
 {
 	if (notify_die(DIE_IABR_MATCH, "iabr_match", regs, 5,
@@ -2183,10 +2193,11 @@ void __attribute__ ((weak)) WatchdogHandler(struct pt_regs *regs)
 	return;
 }
 
-DEFINE_INTERRUPT_HANDLER(WatchdogException) /* XXX NMI? async? */
+DEFINE_INTERRUPT_HANDLER_NMI(WatchdogException)
 {
 	printk (KERN_EMERG "PowerPC Book-E Watchdog Exception\n");
 	WatchdogHandler(regs);
+	return 0;
 }
 #endif
 
-- 
2.23.0

