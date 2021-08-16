Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED64B3ECF6C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 09:32:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp5Tp6Kyfz3clW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 17:32:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=S/Heptm5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=S/Heptm5; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp5R465Lgz30GM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 17:30:08 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id c17so14477798plz.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 00:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7GadVQQRrzX+1v+kXASOTj2MVldaYiqCbg+yv07J9dA=;
 b=S/Heptm5N624QLLVYB3iSEAGXlHWbBTEnudqomD+afHVCjMdN0Fk8CQqLiMgbwM+PG
 xyD8IA2zrQ5BCXpY4V8kyuUNDvlRwl16l4WSzA+JEcdxFY9cVtRKXBTiu9lElA+WCZNu
 ThClsF/upEhqNvK+YwJk3KfYuLtbUK2sw1Dg9Eu9EnPNWvZuPaTMT2HLLlDypU9Cy9/x
 dK8+G4LoEXjrviJBd9xnIl8ojBl4rKJBjToZ0QUvnHg7jOzCmYp0RwRd64AxCzieyQEv
 SzxU/nFmE7Ek7bnubeamJqsd/IHCxQ/fGoWcEgpINQ0HdhEfC3PD+18NbApmw72YmJ6Y
 luzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7GadVQQRrzX+1v+kXASOTj2MVldaYiqCbg+yv07J9dA=;
 b=GArLh8v3Zea2eXoiZ9b40hlSv1kM0lvtvTxrtcgOc6sxTM4w7AN7cBn1jY0bLZFmCI
 Jjt1iuxZjYhs664Xq3fRqfs5GhMRkDPS6nCDxj+gzesf4wHd3V7n9tEoeLg8LpgFo4H+
 D5GYDMEGLDJ0f6n09PfLM5Fjio6qFuygBeMC9zDzCW9Kvbj6qSMURRLz5B0wTxXSd7yu
 I7cfwWMqlQoHSD4TKdTGaLpplqBPK9+xVpZhNUcC25F/kqTZ0U+qDLsJN8aIOzSTU06h
 PPhuZ+xhzD0rQQezE1jdfHeoAOVPIEb/oAlssJWOJKFbWOGfzoGRPN2LRvVrophphtzn
 KYHQ==
X-Gm-Message-State: AOAM531IkHTytMCG8sAtC9ivVpWjt+hYbzok+lTeDOH9K91l65uLQe2+
 PTntqZS2i16GZ7PDtymAD43bjIE4o68=
X-Google-Smtp-Source: ABdhPJx76bZZkNKL273MpKlw91ekO604uFj5QVNR4/vo049tlff4f5VIvbnzw+g2p+R/rS4YWcwD2g==
X-Received: by 2002:aa7:98da:0:b029:3e0:8b98:df83 with SMTP id
 e26-20020aa798da0000b02903e08b98df83mr15041691pfm.63.1629099006278; 
 Mon, 16 Aug 2021 00:30:06 -0700 (PDT)
Received: from bobo.ibm.com (203-219-120-52.tpgi.com.au. [203.219.120.52])
 by smtp.gmail.com with ESMTPSA id e7sm10543887pfc.145.2021.08.16.00.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 00:30:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 3/4] powerpc/64s/interrupt: Don't enable MSR[EE] in irq
 handlers unless perf is in use
Date: Mon, 16 Aug 2021 17:29:52 +1000
Message-Id: <20210816072953.1165964-4-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
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
Replayed interrupts drop from 1.4% of interrupts to 0.003%.

This does prevent the soft-nmi interrupt being taken in these handlers,
but that's not too reliable anyway. The SMP watchdog will continue to be
the reliable way to catch lockups.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hw_irq.h | 47 +++++++++++++++++++++++++------
 arch/powerpc/kernel/dbell.c       |  3 +-
 arch/powerpc/kernel/irq.c         |  3 +-
 arch/powerpc/kernel/time.c        | 30 ++++++++++----------
 4 files changed, 57 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 2d5c0d3ccbb6..e6644509c7af 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -309,17 +309,46 @@ static inline bool lazy_irq_pending_nocheck(void)
 bool power_pmu_running(void);
 
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
+static inline bool may_hard_irq_enable(void)
 {
-	if (!(get_paca()->irq_happened & PACA_IRQ_MUST_HARD_MASK)) {
-		get_paca()->irq_happened &= ~PACA_IRQ_HARD_DIS;
-		__hard_irq_enable();
-	}
+#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
+	BUG_ON(mfmsr() & MSR_EE);
+#endif
+#ifdef CONFIG_PERF_EVENTS
+	if (!power_pmu_running())
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
+ * Do the hard enabling, only call this if may_hard_irq_enable is true.
+ */
+static inline void do_hard_irq_enable(void)
+{
+#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
+	WARN_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
+	WARN_ON(get_paca()->irq_happened & PACA_IRQ_MUST_HARD_MASK);
+	BUG_ON(mfmsr() & MSR_EE);
+#endif
+	/*
+	 * This allows PMI interrupts (and watchdog soft-NMIs) through.
+	 * There is no other reason to enable this way.
+	 */
+	get_paca()->irq_happened &= ~PACA_IRQ_HARD_DIS;
+	__hard_irq_enable();
 }
 
 static inline bool arch_irq_disabled_regs(struct pt_regs *regs)
diff --git a/arch/powerpc/kernel/dbell.c b/arch/powerpc/kernel/dbell.c
index 5545c9cd17c1..0edeb5e9fede 100644
--- a/arch/powerpc/kernel/dbell.c
+++ b/arch/powerpc/kernel/dbell.c
@@ -27,7 +27,8 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(doorbell_exception)
 
 	ppc_msgsync();
 
-	may_hard_irq_enable();
+	if (may_hard_irq_enable())
+		do_hard_irq_enable();
 
 	kvmppc_clear_host_ipi(smp_processor_id());
 	__this_cpu_inc(irq_stat.doorbell_irqs);
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 551b653228c4..745becbcd1ad 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -739,7 +739,8 @@ void __do_irq(struct pt_regs *regs)
 	irq = ppc_md.get_irq();
 
 	/* We can hard enable interrupts now to allow perf interrupts */
-	may_hard_irq_enable();
+	if (may_hard_irq_enable())
+		do_hard_irq_enable();
 
 	/* And finally process it */
 	if (unlikely(!irq))
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index c487ba5a6e11..ac67ec57f129 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -567,22 +567,22 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
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
+	if (may_hard_irq_enable()) {
+		/* Ensure a positive value is written to the decrementer, or
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

