Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE465F699B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:31:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjv5Y5Xcpz3cB8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 01:31:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hMbRV8fT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hMbRV8fT;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjv4b0cDcz2yhy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 01:30:54 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id y8so2170505pfp.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=jklZ1ugrUO8pCT6uHqyq6Ryx8S+s16MhreTX6h/53Sc=;
        b=hMbRV8fTMqbASoYzQaiyA7vaJUKKRlar9ehWfsZGe8G1qhg5kncarAPAw1W7UX+BUp
         TR/GQ0BvdqSIeB3x976msO8W4ErdFDRHRtMyw9JFL3IoiOrn/ocGoZUv+yuQDdNApg9u
         aHiq8xT5PNiomhNMqELDF943uYiEvce0bdYONK5KY/cGHj3xfikZmQqBm95n/h0ozw6W
         bCEEuCGWbq88686sSTXSOGbP/tggsVOgLOyUSlXeDQWRlZYKFcJrKXNXrbd9EhYAe0Hu
         zn8oF1/XS0Cg+jlm8s6YI0QoXIi1/4Z1wmsWyJNL3Nut0OkVz7Dufdr4UhSXJMGEPlgX
         mECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=jklZ1ugrUO8pCT6uHqyq6Ryx8S+s16MhreTX6h/53Sc=;
        b=MHVTFH/SBeGKa2p5T1W/5TyQEteFsw1PCyNL5TESwqfdAY5vrb6GDBCPIuXHT8rhE5
         kxPvtcB6xwee7tqHTVtAzSPvn080w7kDUGtqFDmmPJ0pTmhnMSsko6RqNQgfyJYtrzD0
         J4pRzAdI+3I8wFJBFr613wQhd2l1aBGBpbQB3zT1RcUMq0uctwuJyy7UbOwN0fr6LxYT
         3+Te5/xoYWMLVwGaMmwGWK6t9Ig3Og2/5ky5SIThBsmOacCp6sRdml5OR3FohpzWYsv8
         XA3TWC2FPEwZwNEoUhPZB/+z2BCz+uz6cZPOIrLcuFouX6rgNzfa4EHq24eVSvQxp4B+
         n6Zg==
X-Gm-Message-State: ACrzQf1A0XGQmjVcbNdd1fmaeLFdnJONRY4Ha9AcnWJSlQgVcb0dDuNE
	xsQhmnFn7P58UwqSYYEFz2H9roQc3U0=
X-Google-Smtp-Source: AMsMyM6BCU7CntBHvrIej3vOeNyEwySMPBQpztJxLv6I1Idfvz/KvFthX8df1jOQuhRn80v5C2l7/Q==
X-Received: by 2002:a05:6a02:303:b0:458:1e4b:1e89 with SMTP id bn3-20020a056a02030300b004581e4b1e89mr160304pgb.123.1665066650762;
        Thu, 06 Oct 2022 07:30:50 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id g18-20020a17090ace9200b0020a8ed65df3sm2934540pju.45.2022.10.06.07.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:30:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] powerpc/64: Don't recurse irq replay
Date: Fri,  7 Oct 2022 00:30:42 +1000
Message-Id: <20221006143042.128735-1-npiggin@gmail.com>
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

Use irq_enter/irq_exit around irq replay to prevent softirqs running
while interrupts are being replayed. Instead they run at the irq_exit()
call where reentrancy is less problematic. A new PACA_IRQ_REPLAYING is
added to prevent interrupt handlers hard-enabling EE while being
replayed.
---
I finally might have worked out a way to do this without surgery to
other parts of the kernel - use a nested irq_enter around replay,
which seems to do the right thing. Almost seems a bit too easy.
I think we probably want to do this even though it adds a bit of
complexity itself and yet more soft-masking churn. But it is
debatable. I will post again with more discussion some tie later
probably for next merge window.

Thanks,
Nick

 arch/powerpc/include/asm/hw_irq.h |   6 +-
 arch/powerpc/kernel/irq_64.c      | 101 +++++++++++++++++++-----------
 2 files changed, 70 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 265d0eb7ed79..5ffe5c63dc82 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -36,15 +36,17 @@
 #define PACA_IRQ_DEC		0x08 /* Or FIT */
 #define PACA_IRQ_HMI		0x10
 #define PACA_IRQ_PMI		0x20
+#define PACA_IRQ_REPLAYING	0x40
 
 /*
  * Some soft-masked interrupts must be hard masked until they are replayed
  * (e.g., because the soft-masked handler does not clear the exception).
+ * Interrupt replay itself must remain hard masked too.
  */
 #ifdef CONFIG_PPC_BOOK3S
-#define PACA_IRQ_MUST_HARD_MASK	(PACA_IRQ_EE|PACA_IRQ_PMI)
+#define PACA_IRQ_MUST_HARD_MASK	(PACA_IRQ_EE|PACA_IRQ_PMI|PACA_IRQ_REPLAYING)
 #else
-#define PACA_IRQ_MUST_HARD_MASK	(PACA_IRQ_EE)
+#define PACA_IRQ_MUST_HARD_MASK	(PACA_IRQ_EE|PACA_IRQ_REPLAYING)
 #endif
 
 #endif /* CONFIG_PPC64 */
diff --git a/arch/powerpc/kernel/irq_64.c b/arch/powerpc/kernel/irq_64.c
index eb2b380e52a0..9dc0ad3c533a 100644
--- a/arch/powerpc/kernel/irq_64.c
+++ b/arch/powerpc/kernel/irq_64.c
@@ -70,22 +70,19 @@ int distribute_irqs = 1;
 
 static inline void next_interrupt(struct pt_regs *regs)
 {
-	/*
-	 * Softirq processing can enable/disable irqs, which will leave
-	 * MSR[EE] enabled and the soft mask set to IRQS_DISABLED. Fix
-	 * this up.
-	 */
-	if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
-		hard_irq_disable();
-	else
-		irq_soft_mask_set(IRQS_ALL_DISABLED);
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
+		WARN_ON(!(local_paca->irq_happened & PACA_IRQ_HARD_DIS));
+		WARN_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
+	}
 
 	/*
 	 * We are responding to the next interrupt, so interrupt-off
 	 * latencies should be reset here.
 	 */
+	lockdep_hardirq_exit();
 	trace_hardirqs_on();
 	trace_hardirqs_off();
+	lockdep_hardirq_enter();
 }
 
 static inline bool irq_happened_test_and_clear(u8 irq)
@@ -97,22 +94,11 @@ static inline bool irq_happened_test_and_clear(u8 irq)
 	return false;
 }
 
-void replay_soft_interrupts(void)
+static void __replay_soft_interrupts(void)
 {
 	struct pt_regs regs;
 
 	/*
-	 * Be careful here, calling these interrupt handlers can cause
-	 * softirqs to be raised, which they may run when calling irq_exit,
-	 * which will cause local_irq_enable() to be run, which can then
-	 * recurse into this function. Don't keep any state across
-	 * interrupt handler calls which may change underneath us.
-	 *
-	 * Softirqs can not be disabled over replay to stop this recursion
-	 * because interrupts taken in idle code may require RCU softirq
-	 * to run in the irq RCU tracking context. This is a hard problem
-	 * to fix without changes to the softirq or idle layer.
-	 *
 	 * We use local_paca rather than get_paca() to avoid all the
 	 * debug_smp_processor_id() business in this low level function.
 	 */
@@ -120,13 +106,20 @@ void replay_soft_interrupts(void)
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
 		WARN_ON_ONCE(mfmsr() & MSR_EE);
 		WARN_ON(!(local_paca->irq_happened & PACA_IRQ_HARD_DIS));
+		WARN_ON(local_paca->irq_happened & PACA_IRQ_REPLAYING);
 	}
 
+	/*
+	 * PACA_IRQ_REPLAYING prevents interrupt handlers from enabling
+	 * MSR[EE] to get PMIs, which can result in more IRQs becoming
+	 * pending.
+	 */
+	local_paca->irq_happened |= PACA_IRQ_REPLAYING;
+
 	ppc_save_regs(&regs);
 	regs.softe = IRQS_ENABLED;
 	regs.msr |= MSR_EE;
 
-again:
 	/*
 	 * Force the delivery of pending soft-disabled interrupts on PS3.
 	 * Any HV call will have this side effect.
@@ -175,13 +168,14 @@ void replay_soft_interrupts(void)
 		next_interrupt(&regs);
 	}
 
-	/*
-	 * Softirq processing can enable and disable interrupts, which can
-	 * result in new irqs becoming pending. Must keep looping until we
-	 * have cleared out all pending interrupts.
-	 */
-	if (local_paca->irq_happened & ~PACA_IRQ_HARD_DIS)
-		goto again;
+	local_paca->irq_happened &= ~PACA_IRQ_REPLAYING;
+}
+
+void replay_soft_interrupts(void)
+{
+	irq_enter(); /* See comment in arch_local_irq_restore */
+	__replay_soft_interrupts();
+	irq_exit();
 }
 
 #if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_PPC_KUAP)
@@ -200,13 +194,13 @@ static inline void replay_soft_interrupts_irqrestore(void)
 	if (kuap_state != AMR_KUAP_BLOCKED)
 		set_kuap(AMR_KUAP_BLOCKED);
 
-	replay_soft_interrupts();
+	__replay_soft_interrupts();
 
 	if (kuap_state != AMR_KUAP_BLOCKED)
 		set_kuap(kuap_state);
 }
 #else
-#define replay_soft_interrupts_irqrestore() replay_soft_interrupts()
+#define replay_soft_interrupts_irqrestore() __replay_soft_interrupts()
 #endif
 
 notrace void arch_local_irq_restore(unsigned long mask)
@@ -219,9 +213,13 @@ notrace void arch_local_irq_restore(unsigned long mask)
 		return;
 	}
 
-	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-		WARN_ON_ONCE(in_nmi() || in_hardirq());
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
+		WARN_ON_ONCE(in_nmi());
+		WARN_ON_ONCE(in_hardirq());
+		WARN_ON_ONCE(local_paca->irq_happened & PACA_IRQ_REPLAYING);
+	}
 
+again:
 	/*
 	 * After the stb, interrupts are unmasked and there are no interrupts
 	 * pending replay. The restart sequence makes this atomic with
@@ -248,6 +246,12 @@ notrace void arch_local_irq_restore(unsigned long mask)
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		WARN_ON_ONCE(!(mfmsr() & MSR_EE));
 
+	/*
+	 * If we came here from the replay below, we might have a preempt
+	 * pending (due to preempt_enable_no_resched()). Have to check now.
+	 */
+	preempt_check_resched();
+
 	return;
 
 happened:
@@ -261,6 +265,7 @@ notrace void arch_local_irq_restore(unsigned long mask)
 		irq_soft_mask_set(IRQS_ENABLED);
 		local_paca->irq_happened = 0;
 		__hard_irq_enable();
+		preempt_check_resched();
 		return;
 	}
 
@@ -296,12 +301,38 @@ notrace void arch_local_irq_restore(unsigned long mask)
 	irq_soft_mask_set(IRQS_ALL_DISABLED);
 	trace_hardirqs_off();
 
+	/*
+	 * Now enter interrupt context. The interrupt handlers themselves
+	 * also call irq_enter/exit (which is okay, they can nest). But call
+	 * it here now to hold off softirqs until the below irq_exit(). If
+	 * we allowed replayed handlers to run softirqs, that enables irqs,
+	 * which must replay interrupts, which recurses in here and makes
+	 * things more complicated. The recursion is limited to 2, and it can
+	 * be made to work, but it's complicated.
+	 *
+	 * local_bh_disable can not be used here because interrupts taken in
+	 * idle are not in the right context (RCU, tick, etc) to run softirqs
+	 * so irq_enter must be called.
+	 */
+	irq_enter();
+
 	replay_soft_interrupts_irqrestore();
 
+	irq_exit();
+
+	if (unlikely(local_paca->irq_happened != PACA_IRQ_HARD_DIS)) {
+		/*
+		 * The softirq processing in irq_exit() may enable interrupts
+		 * temporarily, which can result in MSR[EE] being enabled and
+		 * more irqs becoming pending. Go around again if that happens.
+		 */
+		trace_hardirqs_on();
+		preempt_enable_no_resched();
+		goto again;
+	}
+
 	trace_hardirqs_on();
 	irq_soft_mask_set(IRQS_ENABLED);
-	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-		WARN_ON(local_paca->irq_happened != PACA_IRQ_HARD_DIS);
 	local_paca->irq_happened = 0;
 	__hard_irq_enable();
 	preempt_enable();
-- 
2.37.2

