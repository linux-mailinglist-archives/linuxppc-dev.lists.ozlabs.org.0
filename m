Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 527F4414C8F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 16:58:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF1d01PtKz3cHC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 00:58:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EBkSdQLo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EBkSdQLo; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF1YR75JTz2yn9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 00:55:07 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id w11so1892265plz.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DLpRcJwVD7fqRatawwbVA1YseRUsxILEU/SYZwd52qw=;
 b=EBkSdQLoe38kSk/S4jeNZVJKkdsZqDbVYYor3TnHXfBwrqHj5JjLdyV0a9ESEacwFL
 nDTWglhMpMNcxdvdfWeD0za+QLACiSFGL4uWYvHhvjgouABplLbyUlaPqWPgXx91EnZv
 ox5IrevavGrdAXdkP7Qcjxyh8XUnWzxDH9fS+pFbhLlS1+ylrxtbb/eunnrBOUH7mkby
 UcUwP1/Glo6mqI89t6whRbUeHJ8ubWGkfP6uBHGEN8h4fWWYjTrsYJYpB0EUOqTNPWx7
 ufwf4f6OkZakFSHKOv9Vaz7Og1yQt4GEBLREQRbxqiL+Pqr4KTgXHArg72WgluHW9k8J
 We7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DLpRcJwVD7fqRatawwbVA1YseRUsxILEU/SYZwd52qw=;
 b=t8TVDA6EnMogXCThd1NL5d5cntTxqPJOLlKTQz+3Q3wSDpeKpRo8iulbdSvyg7td70
 Zqc5gtONGt5zQ6K03vHPGGI/8+ZFJrSFG5t9mVp+SlYXc107Kk0640JSVLMq8v2YF0xJ
 mZy5PphsbymgQH88yGl0fia527W1oZtoKu11azskx2/jzlBl+rFvZUha7XCkFMW5q6hP
 X+o0mmqr0UteaZZ1//l4yqZo7nnAzDMSIrqZPvBgUY+GTtU3gmFMEdhO193Bn9A9s4Aw
 VotSB2dwpncAExfZhCO8Es58kAGu+YDKrl+DTOD/077g3iurmEk6dHWoFbEPbTf8LyVR
 n6Hg==
X-Gm-Message-State: AOAM531AZ+jLCxWL/rICePbgBrwQ3ufiCK55xueYzKDxQB8DJJLHi/+8
 DzsCT63b0lY6h57M+ADCjqZG90svg58=
X-Google-Smtp-Source: ABdhPJx/d/aKZXfRxEZ87gwVcr+MdNJ8VKcDPsIOAGLKfoKgnhP809Q7LQ0INXo/XcF7N9VwpBfHYw==
X-Received: by 2002:a17:90a:e2cb:: with SMTP id
 fr11mr12139115pjb.1.1632322505662; 
 Wed, 22 Sep 2021 07:55:05 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id o14sm2856211pfh.145.2021.09.22.07.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 07:55:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/6] powerpc/64s/interrupt: Don't enable MSR[EE] in irq
 handlers unless perf is in use
Date: Thu, 23 Sep 2021 00:54:50 +1000
Message-Id: <20210922145452.352571-5-npiggin@gmail.com>
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

Enabling MSR[EE] in interrupt handlers while interrupts are still soft
masked allows PMIs to profile interrupt handlers to some degree, beyond
what SIAR latching allows.

When perf is not being used, this is almost useless work. It requires an
extra mtmsrd in the irq handler, and it also opens the door to masked
interrupts hitting and requiring replay, which is more expensive than
just taking them directly. This effect can be noticable in high IRQ
workloads.

Avoid enabling MSR[EE] unless perf is currently in use. This saves about
60 cycles (or 8%) on a simple decrementer interrupt microbenchmark.
Replayed interrupts drop from 1.4% of all interrupts taken, to 0.003%.

This does prevent the soft-nmi interrupt being taken in these handlers,
but that's not too reliable anyway. The SMP watchdog will continue to be
the reliable way to catch lockups.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hw_irq.h | 57 +++++++++++++++++++++++++------
 arch/powerpc/kernel/dbell.c       |  3 +-
 arch/powerpc/kernel/irq.c         |  3 +-
 arch/powerpc/kernel/time.c        | 31 +++++++++--------
 4 files changed, 67 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index b987822e552e..55e3fa44f280 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -309,17 +309,54 @@ static inline bool lazy_irq_pending_nocheck(void)
 bool power_pmu_wants_prompt_pmi(void);
 
 /*
- * This is called by asynchronous interrupts to conditionally
- * re-enable hard interrupts after having cleared the source
- * of the interrupt. They are kept disabled if there is a different
- * soft-masked interrupt pending that requires hard masking.
+ * This is called by asynchronous interrupts to check whether to
+ * conditionally re-enable hard interrupts after having cleared
+ * the source of the interrupt. They are kept disabled if there
+ * is a different soft-masked interrupt pending that requires hard
+ * masking.
  */
-static inline void may_hard_irq_enable(void)
+static inline bool should_hard_irq_enable(void)
 {
-	if (!(get_paca()->irq_happened & PACA_IRQ_MUST_HARD_MASK)) {
-		get_paca()->irq_happened &= ~PACA_IRQ_HARD_DIS;
-		__hard_irq_enable();
-	}
+#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
+	WARN_ON(irq_soft_mask_return() == IRQS_ENABLED);
+	WARN_ON(mfmsr() & MSR_EE);
+#endif
+#ifdef CONFIG_PERF_EVENTS
+	/*
+	 * If the PMU is not running, there is not much reason to enable
+	 * MSR[EE] in irq handlers because any interrupts would just be
+	 * soft-masked.
+	 *
+	 * TODO: Add test for 64e
+	 */
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !power_pmu_wants_prompt_pmi())
+		return false;
+
+	if (get_paca()->irq_happened & PACA_IRQ_MUST_HARD_MASK)
+		return false;
+
+	return true;
+#else
+	return false;
+#endif
+}
+
+/*
+ * Do the hard enabling, only call this if should_hard_irq_enable is true.
+ */
+static inline void do_hard_irq_enable(void)
+{
+#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
+	WARN_ON(irq_soft_mask_return() == IRQS_ENABLED);
+	WARN_ON(get_paca()->irq_happened & PACA_IRQ_MUST_HARD_MASK);
+	WARN_ON(mfmsr() & MSR_EE);
+#endif
+	/*
+	 * This allows PMI interrupts (and watchdog soft-NMIs) through.
+	 * There is no other reason to enable this way.
+	 */
+	get_paca()->irq_happened &= ~PACA_IRQ_HARD_DIS;
+	__hard_irq_enable();
 }
 
 static inline bool arch_irq_disabled_regs(struct pt_regs *regs)
@@ -400,7 +437,7 @@ static inline bool arch_irq_disabled_regs(struct pt_regs *regs)
 	return !(regs->msr & MSR_EE);
 }
 
-static inline bool may_hard_irq_enable(void)
+static inline bool should_hard_irq_enable(void)
 {
 	return false;
 }
diff --git a/arch/powerpc/kernel/dbell.c b/arch/powerpc/kernel/dbell.c
index 5545c9cd17c1..f55c6fb34a3a 100644
--- a/arch/powerpc/kernel/dbell.c
+++ b/arch/powerpc/kernel/dbell.c
@@ -27,7 +27,8 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(doorbell_exception)
 
 	ppc_msgsync();
 
-	may_hard_irq_enable();
+	if (should_hard_irq_enable())
+		do_hard_irq_enable();
 
 	kvmppc_clear_host_ipi(smp_processor_id());
 	__this_cpu_inc(irq_stat.doorbell_irqs);
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 551b653228c4..f658aa22a21e 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -739,7 +739,8 @@ void __do_irq(struct pt_regs *regs)
 	irq = ppc_md.get_irq();
 
 	/* We can hard enable interrupts now to allow perf interrupts */
-	may_hard_irq_enable();
+	if (should_hard_irq_enable())
+		do_hard_irq_enable();
 
 	/* And finally process it */
 	if (unlikely(!irq))
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 934d8ae66cc6..c3c663ff7c48 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -566,22 +566,23 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 		return;
 	}
 
-	/* Ensure a positive value is written to the decrementer, or else
-	 * some CPUs will continue to take decrementer exceptions. When the
-	 * PPC_WATCHDOG (decrementer based) is configured, keep this at most
-	 * 31 bits, which is about 4 seconds on most systems, which gives
-	 * the watchdog a chance of catching timer interrupt hard lockups.
-	 */
-	if (IS_ENABLED(CONFIG_PPC_WATCHDOG))
-		set_dec(0x7fffffff);
-	else
-		set_dec(decrementer_max);
-
-	/* Conditionally hard-enable interrupts now that the DEC has been
-	 * bumped to its maximum value
-	 */
-	may_hard_irq_enable();
+	/* Conditionally hard-enable interrupts. */
+	if (should_hard_irq_enable()) {
+		/*
+		 * Ensure a positive value is written to the decrementer, or
+		 * else some CPUs will continue to take decrementer exceptions.
+		 * When the PPC_WATCHDOG (decrementer based) is configured,
+		 * keep this at most 31 bits, which is about 4 seconds on most
+		 * systems, which gives the watchdog a chance of catching timer
+		 * interrupt hard lockups.
+		 */
+		if (IS_ENABLED(CONFIG_PPC_WATCHDOG))
+			set_dec(0x7fffffff);
+		else
+			set_dec(decrementer_max);
 
+		do_hard_irq_enable();
+	}
 
 #if defined(CONFIG_PPC32) && defined(CONFIG_PPC_PMAC)
 	if (atomic_read(&ppc_n_lost_interrupts) != 0)
-- 
2.23.0

