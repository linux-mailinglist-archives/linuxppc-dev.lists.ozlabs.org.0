Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD818676590
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 11:02:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NzX404CC6z3fPT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 21:02:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a1KUTTOE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a1KUTTOE;
	dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NzX336QZKz3c9S
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 21:02:06 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id a184so5657022pfa.9
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 02:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PC7lLfWV/4XwBA2Nmf1EgErCPnadQSXO0qQ6m10udYg=;
        b=a1KUTTOEtkFxyjDjAQO54s3yuMWLd5g/mEHo/czEOcGkuCX9bDsx/lJ1GEjbtMSdPX
         fEIjOiuMmosFT8WalVUuieFX6bIlvRiuuzM9ndBfi+TUl/H7BsFvmLsfRY9OkX7EV3fJ
         D4tuCvfsKvuUxGAJkvuVL7DAinkpAcDW+Bjf205Mufm7pd9udhco5j5jt4KWto4PbIKO
         nur/BNuHvVGQi4fTqjsiwzBTsw0R1XlMmb6goA5LkI69MXkcmViVgKD79vH6Eo/sk9mV
         xcjscry9atEF5Q7ieOJ/UR2qkvwWt7kFq+rQCPUlq4I+9FJL2X9XAoU7WsqWGRbk2Njw
         /NPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PC7lLfWV/4XwBA2Nmf1EgErCPnadQSXO0qQ6m10udYg=;
        b=udiZzXYr31pc+zH+DvfjlnfDxDRR1MhfnPvZkgnFrI+jp65/4Fsj/TkWLAJT0jaCgl
         bYKClUc2WRjOaYc3+/VA94o1fPI1rL0so0zER9xUu4NQSV5aoDmULxEBqCwU6DfJbOLe
         CqbmMdWLElIet+DrdBJ5MkekOPQFz5huXpA0bOr0S59nnERHnYrVC2EVrRoh55Enhr81
         hRKH3pIUXBf4QQEQTLquaJEJtsUVYaUjiSfnwjHtKHlmmo6qCypHxyKL8IcYaEldpnmh
         EURTf5jvd/41IvCYdK5upY4vkgoPxGwwksXdzBtOz1zee9wI9FdhWTpg604buVf6xvsG
         WAvA==
X-Gm-Message-State: AFqh2kp1ZNh7sJEZXtkSy+yx+OijEQE0uKgJr1yImfhDTRtEc5WfiQB+
	DoG1C/hV6w+FmxxJHv9Yw3sI+6djt/g=
X-Google-Smtp-Source: AMrXdXu2tH5jEuTHol9nc1PvDm/9lTReSdXiGOjdGdlfu3SaFMHNaypMvp9quLT6KfUQYMDbO6+GcA==
X-Received: by 2002:a62:3385:0:b0:589:d850:7ea5 with SMTP id z127-20020a623385000000b00589d8507ea5mr18429380pfz.6.1674295323576;
        Sat, 21 Jan 2023 02:02:03 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id b18-20020aa78ed2000000b0058bbe1240easm14767876pfr.190.2023.01.21.02.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 02:02:03 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/64: Fix perf profiling asynchronous interrupt handlers
Date: Sat, 21 Jan 2023 20:01:56 +1000
Message-Id: <20230121100156.2824054-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Interrupt entry sets the soft mask to IRQS_ALL_DISABLED to match the
hard irq disabled state. So when should_hard_irq_enable() returns true
because we want PMI interrupts in irq handlers, MSR[EE] is enabled but
PMIs just get soft-masked. Fix this by clearing IRQS_PMI_DISABLED before
enabling MSR[EE].

This also tidies some of the warnings, no need to duplicate them in
both should_hard_irq_enable() and do_hard_irq_enable().

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v1: just a rebase and re-test.

 arch/powerpc/include/asm/hw_irq.h | 41 ++++++++++++++++++++++---------
 arch/powerpc/kernel/dbell.c       |  2 +-
 arch/powerpc/kernel/irq.c         |  2 +-
 arch/powerpc/kernel/time.c        |  2 +-
 4 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 5156fe21284c..c5d0450de055 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -173,6 +173,15 @@ static inline notrace unsigned long irq_soft_mask_or_return(unsigned long mask)
 	return flags;
 }
 
+static inline notrace unsigned long irq_soft_mask_andc_return(unsigned long mask)
+{
+	unsigned long flags = irq_soft_mask_return();
+
+	irq_soft_mask_set(flags & ~mask);
+
+	return flags;
+}
+
 static inline unsigned long arch_local_save_flags(void)
 {
 	return irq_soft_mask_return();
@@ -334,10 +343,11 @@ bool power_pmu_wants_prompt_pmi(void);
  * is a different soft-masked interrupt pending that requires hard
  * masking.
  */
-static inline bool should_hard_irq_enable(void)
+static inline bool should_hard_irq_enable(struct pt_regs *regs)
 {
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
-		WARN_ON(irq_soft_mask_return() == IRQS_ENABLED);
+		WARN_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
+		WARN_ON(!(get_paca()->irq_happened & PACA_IRQ_HARD_DIS));
 		WARN_ON(mfmsr() & MSR_EE);
 	}
 
@@ -350,8 +360,17 @@ static inline bool should_hard_irq_enable(void)
 	 *
 	 * TODO: Add test for 64e
 	 */
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !power_pmu_wants_prompt_pmi())
-		return false;
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {
+		if (!power_pmu_wants_prompt_pmi())
+			return false;
+		/*
+		 * If PMIs are disabled then IRQs should be disabled as well,
+		 * so we shouldn't see this condition, check for it just in
+		 * case because we are about to enable PMIs.
+		 */
+		if (WARN_ON_ONCE(regs->softe & IRQS_PMI_DISABLED))
+			return false;
+	}
 
 	if (get_paca()->irq_happened & PACA_IRQ_MUST_HARD_MASK)
 		return false;
@@ -361,18 +380,16 @@ static inline bool should_hard_irq_enable(void)
 
 /*
  * Do the hard enabling, only call this if should_hard_irq_enable is true.
+ * This allows PMI interrupts to profile irq handlers.
  */
 static inline void do_hard_irq_enable(void)
 {
-	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
-		WARN_ON(irq_soft_mask_return() == IRQS_ENABLED);
-		WARN_ON(get_paca()->irq_happened & PACA_IRQ_MUST_HARD_MASK);
-		WARN_ON(mfmsr() & MSR_EE);
-	}
 	/*
-	 * This allows PMI interrupts (and watchdog soft-NMIs) through.
-	 * There is no other reason to enable this way.
+	 * Asynch interrupts come in with IRQS_ALL_DISABLED,
+	 * PACA_IRQ_HARD_DIS, and MSR[EE]=0.
 	 */
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
+		irq_soft_mask_andc_return(IRQS_PMI_DISABLED);
 	get_paca()->irq_happened &= ~PACA_IRQ_HARD_DIS;
 	__hard_irq_enable();
 }
@@ -455,7 +472,7 @@ static inline bool arch_irq_disabled_regs(struct pt_regs *regs)
 	return !(regs->msr & MSR_EE);
 }
 
-static __always_inline bool should_hard_irq_enable(void)
+static __always_inline bool should_hard_irq_enable(struct pt_regs *regs)
 {
 	return false;
 }
diff --git a/arch/powerpc/kernel/dbell.c b/arch/powerpc/kernel/dbell.c
index f55c6fb34a3a..5712dd846263 100644
--- a/arch/powerpc/kernel/dbell.c
+++ b/arch/powerpc/kernel/dbell.c
@@ -27,7 +27,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(doorbell_exception)
 
 	ppc_msgsync();
 
-	if (should_hard_irq_enable())
+	if (should_hard_irq_enable(regs))
 		do_hard_irq_enable();
 
 	kvmppc_clear_host_ipi(smp_processor_id());
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index c5b9ce887483..c9535f2760b5 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -238,7 +238,7 @@ static void __do_irq(struct pt_regs *regs, unsigned long oldsp)
 	irq = static_call(ppc_get_irq)();
 
 	/* We can hard enable interrupts now to allow perf interrupts */
-	if (should_hard_irq_enable())
+	if (should_hard_irq_enable(regs))
 		do_hard_irq_enable();
 
 	/* And finally process it */
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index d68de3618741..e26eb6618ae5 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -515,7 +515,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 	}
 
 	/* Conditionally hard-enable interrupts. */
-	if (should_hard_irq_enable()) {
+	if (should_hard_irq_enable(regs)) {
 		/*
 		 * Ensure a positive value is written to the decrementer, or
 		 * else some CPUs will continue to take decrementer exceptions.
-- 
2.37.2

