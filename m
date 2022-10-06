Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AB75F6926
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:09:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjtbK6Smrz3cht
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 01:09:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mLygP+DE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mLygP+DE;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjtVK1X2Xz3cfQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 01:04:40 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id b5so1969820pgb.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 07:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=s0m93dLQyxJZ+6WRBzVYmqE/UubQiYHdvVFA9xt2Q1s=;
        b=mLygP+DEjRC2awzixF8Pt/Re+ttb5AnajNl+aG+xx1wjGNnpR4pbKb0buPPZpUktgi
         36UNWJ6sb2mhJd+94zxwBKOqToYNBOsoapzWJ5BDUx6d91jwEM4WiPBvK/ZSbKnitbfh
         DX3FaBT0oBgUX1/3Bk+ZjmC4/A2qW7KG3GoXR8FhS+Ny36T/tz6cCZT4mMoQo2Yy40e1
         rlLI0PFNh20GsehovMT2fAQV8D0CVgOg0YCA3U4lN2toH9BiFEkjFRv+TuyqcgSk/N/H
         yi7VJRZq6Tt1O8YFhSiBkKEJEZTg63+47W+LmNfId++fzUd+Eu6GpEB4Ny0YpEcWTiuS
         +Z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=s0m93dLQyxJZ+6WRBzVYmqE/UubQiYHdvVFA9xt2Q1s=;
        b=fbr/TQE8xt7LpHM+SUbpUeG/5ElddXT91oyoyERB9NNo8YaQ4VxMHvuivvLdBL2agO
         SdwXZLUhkQl5IcspUOcpEZZFLfBhqPmpIpOoJRDUS/OsywYvQ3LnKDXHZXIbqukjwfGp
         FPeTR745st++c1QK9i+Q5EO8ch/+kjpmMlcEgoTicGVeeCO+TuKSRPYGk2t9RmkKXIp7
         OVop9APDcpSjF67kWJ4is5JyrF5A2Kf/kj/T4RzzkH4XHfFVh4GBlhyyV3t4ozpgO4lb
         Ur619Lpq/voEFx/Oj+kXnX/xxN448pnD4ozcVoK0JKgQ88AtmExMbhhB52FcJk7MhMBd
         Z4ew==
X-Gm-Message-State: ACrzQf19xjrqcjEZi2JxpBRB7mSH6Xhm958aTnBniynDzucBUZsU2Ote
	N/Ka5j62rx0Otacuf3lE58Ov+UyHW1Q=
X-Google-Smtp-Source: AMsMyM7Mti59UXpdF3g0OUXMIf1ZkN3SqgM69gUkJpNr5eXS2g8Cnd68seyxgOhA0EYPXpX3JdjkEw==
X-Received: by 2002:a05:6a00:acc:b0:530:e79e:fc27 with SMTP id c12-20020a056a000acc00b00530e79efc27mr5290755pfl.61.1665065078515;
        Thu, 06 Oct 2022 07:04:38 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902bb8100b0017bf6061ee4sm4602901pls.117.2022.10.06.07.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:04:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/4] powerpc/64: Fix perf profiling asynchronous interrupt handlers
Date: Fri,  7 Oct 2022 00:04:13 +1000
Message-Id: <20221006140413.126443-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221006140413.126443-1-npiggin@gmail.com>
References: <20221006140413.126443-1-npiggin@gmail.com>
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
hard irq disabled state. So when should_hard_irq_enable() reutrns true
because we want PMI interrupts in irq handlers, MSR[EE] is enabled but
any PMI just gets masked. Fix this by clearing IRQS_PMI_DISABLED before
enabling MSR[EE].

This also tidies some of the warnings, no need to duplicate them in
both should_hard_irq_enable() and do_hard_irq_enable().

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hw_irq.h | 41 ++++++++++++++++++++++---------
 arch/powerpc/kernel/dbell.c       |  2 +-
 arch/powerpc/kernel/irq.c         |  2 +-
 arch/powerpc/kernel/time.c        |  2 +-
 4 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 77fa88c2aed0..265d0eb7ed79 100644
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
@@ -331,10 +340,11 @@ bool power_pmu_wants_prompt_pmi(void);
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
 
@@ -347,8 +357,17 @@ static inline bool should_hard_irq_enable(void)
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
@@ -358,18 +377,16 @@ static inline bool should_hard_irq_enable(void)
 
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
@@ -452,7 +469,7 @@ static inline bool arch_irq_disabled_regs(struct pt_regs *regs)
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
index 0f17268c1f0b..58e8774793b8 100644
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

