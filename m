Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA035E98F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 07:47:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbWxl6lYqz3fFm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 15:47:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BWZnXz4k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BWZnXz4k;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbWrf3vYyz3c5v
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 15:43:30 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so5658641pjh.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 22:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=MYDXvHWVqlFaxJDDMXiyCj4gN/S0APV5VGQxUE3ephc=;
        b=BWZnXz4kgAC5AvUOIL7No/c7/ElDnDrlpWGppCkPUERaay6/serJrYbqA9waPSSORZ
         zr8jCRzVGo7558Uq6Sav9dl3pmdCiOj0yDSd/YaMIzzr93R+6KvIIR6NMZZlPdiSMPuk
         /6bO6MbhT/GIIrqjwLzeRcHOfqUSc3JImd+O86V20by9FwUCfW200ToCPRiJvxk/JUpK
         GRotMrEA62e7cSwcwyjaEhlwJQ5ovdXonc8dhT9Yz1hMTt6P4PsFZ6rIa9kESJ6P9v+Z
         XhkuIS2HvyGw5oGARH1u3bMvEwnc4OBJdKuSCTZZqyEadCSKrL2BEdMyq+ExDWRxoUKB
         flRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=MYDXvHWVqlFaxJDDMXiyCj4gN/S0APV5VGQxUE3ephc=;
        b=3wdvJdMBtCmNSVuaXAWsXOqNkFd+3+UzEfGvICsaauUJzr7fMvZDezE9F2+bY87ySQ
         04GAUP/TXvXbnl7l+OY1xUHLapqtrX7Nx6INV5SNuANbwmUlYwvuANjjQGEhzPpTTUfX
         xIlLz+Cfb1d+apqwxLXcqNbFv9FG7A/Ij5izjoaSAJe9PDEiZ6ImH2k3JoMi4k+MFaIU
         cjqeVhoTaTzvVDF53rbKT8gHxX9CGNIDl26of0w8jBclmZNaMUqcRBlDhsbyCcd5V7tS
         ft92uNzO67/HWfdBPLTJxWJNhAIWTgxxExrG4JAJYZP+zA40rEMSGof84zW0MFjjLgnd
         1Lfw==
X-Gm-Message-State: ACrzQf1165bK9IGwfPNFMdpS0nJUvCdViAP9h7Rjjz4Awvf4NDify0ml
	as7ZNECcb2lXzZevBIIR2St29w09kYEkWA==
X-Google-Smtp-Source: AMsMyM7XzO57FbdjTsEDGwmzhn/wtg5xseuZiN1WmfnmF0La0vdcg3hKsSyJ+RRRIKy4cy8oQ4e4LQ==
X-Received: by 2002:a17:90b:4a43:b0:202:7706:73d7 with SMTP id lb3-20020a17090b4a4300b00202770673d7mr22613425pjb.137.1664171008015;
        Sun, 25 Sep 2022 22:43:28 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (203-219-181-119.static.tpgi.com.au. [203.219.181.119])
        by smtp.gmail.com with ESMTPSA id o90-20020a17090a0a6300b002001c9bf22esm5676553pjo.8.2022.09.25.22.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 22:43:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 7/7] powerpc/64/irq: tidy soft-masked irq replay and improve documentation
Date: Mon, 26 Sep 2022 15:43:05 +1000
Message-Id: <20220926054305.2671436-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220926054305.2671436-1-npiggin@gmail.com>
References: <20220926054305.2671436-1-npiggin@gmail.com>
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

irq replay is quite complicated because of softirq processing which
itself enables and disables irqs. Several considerations need to be
accounted for due to this, and they are not clearly documented.

Refactor the irq replay code a bit to tidy and deduplicate some common
functions. Add comments, debug checks.

This has a minor functional change that irq tracing enable/disable is
done after each interrupt replayed, rather than after a batch. It also
re-sets state to IRQS_ALL_DISABLED after an interrupt, which doesn't
matter much because interrupts are hard disabled at this point, but it
is more consistent with how interrupt handlers are called.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/irq_64.c | 93 +++++++++++++++++++++++-------------
 1 file changed, 61 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/kernel/irq_64.c b/arch/powerpc/kernel/irq_64.c
index 01645e03e9f0..eb2b380e52a0 100644
--- a/arch/powerpc/kernel/irq_64.c
+++ b/arch/powerpc/kernel/irq_64.c
@@ -68,6 +68,35 @@
 
 int distribute_irqs = 1;
 
+static inline void next_interrupt(struct pt_regs *regs)
+{
+	/*
+	 * Softirq processing can enable/disable irqs, which will leave
+	 * MSR[EE] enabled and the soft mask set to IRQS_DISABLED. Fix
+	 * this up.
+	 */
+	if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
+		hard_irq_disable();
+	else
+		irq_soft_mask_set(IRQS_ALL_DISABLED);
+
+	/*
+	 * We are responding to the next interrupt, so interrupt-off
+	 * latencies should be reset here.
+	 */
+	trace_hardirqs_on();
+	trace_hardirqs_off();
+}
+
+static inline bool irq_happened_test_and_clear(u8 irq)
+{
+	if (local_paca->irq_happened & irq) {
+		local_paca->irq_happened &= ~irq;
+		return true;
+	}
+	return false;
+}
+
 void replay_soft_interrupts(void)
 {
 	struct pt_regs regs;
@@ -79,18 +108,25 @@ void replay_soft_interrupts(void)
 	 * recurse into this function. Don't keep any state across
 	 * interrupt handler calls which may change underneath us.
 	 *
+	 * Softirqs can not be disabled over replay to stop this recursion
+	 * because interrupts taken in idle code may require RCU softirq
+	 * to run in the irq RCU tracking context. This is a hard problem
+	 * to fix without changes to the softirq or idle layer.
+	 *
 	 * We use local_paca rather than get_paca() to avoid all the
 	 * debug_smp_processor_id() business in this low level function.
 	 */
 
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
+		WARN_ON_ONCE(mfmsr() & MSR_EE);
+		WARN_ON(!(local_paca->irq_happened & PACA_IRQ_HARD_DIS));
+	}
+
 	ppc_save_regs(&regs);
 	regs.softe = IRQS_ENABLED;
 	regs.msr |= MSR_EE;
 
 again:
-	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-		WARN_ON_ONCE(mfmsr() & MSR_EE);
-
 	/*
 	 * Force the delivery of pending soft-disabled interrupts on PS3.
 	 * Any HV call will have this side effect.
@@ -105,56 +141,47 @@ void replay_soft_interrupts(void)
 	 * This is a higher priority interrupt than the others, so
 	 * replay it first.
 	 */
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (local_paca->irq_happened & PACA_IRQ_HMI)) {
-		local_paca->irq_happened &= ~PACA_IRQ_HMI;
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S) &&
+	    irq_happened_test_and_clear(PACA_IRQ_HMI)) {
 		regs.trap = INTERRUPT_HMI;
 		handle_hmi_exception(&regs);
-		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
-			hard_irq_disable();
+		next_interrupt(&regs);
 	}
 
-	if (local_paca->irq_happened & PACA_IRQ_DEC) {
-		local_paca->irq_happened &= ~PACA_IRQ_DEC;
+	if (irq_happened_test_and_clear(PACA_IRQ_DEC)) {
 		regs.trap = INTERRUPT_DECREMENTER;
 		timer_interrupt(&regs);
-		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
-			hard_irq_disable();
+		next_interrupt(&regs);
 	}
 
-	if (local_paca->irq_happened & PACA_IRQ_EE) {
-		local_paca->irq_happened &= ~PACA_IRQ_EE;
+	if (irq_happened_test_and_clear(PACA_IRQ_EE)) {
 		regs.trap = INTERRUPT_EXTERNAL;
 		do_IRQ(&regs);
-		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
-			hard_irq_disable();
+		next_interrupt(&regs);
 	}
 
-	if (IS_ENABLED(CONFIG_PPC_DOORBELL) && (local_paca->irq_happened & PACA_IRQ_DBELL)) {
-		local_paca->irq_happened &= ~PACA_IRQ_DBELL;
+	if (IS_ENABLED(CONFIG_PPC_DOORBELL) &&
+	    irq_happened_test_and_clear(PACA_IRQ_DBELL)) {
 		regs.trap = INTERRUPT_DOORBELL;
 		doorbell_exception(&regs);
-		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
-			hard_irq_disable();
+		next_interrupt(&regs);
 	}
 
 	/* Book3E does not support soft-masking PMI interrupts */
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (local_paca->irq_happened & PACA_IRQ_PMI)) {
-		local_paca->irq_happened &= ~PACA_IRQ_PMI;
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S) &&
+	    irq_happened_test_and_clear(PACA_IRQ_PMI)) {
 		regs.trap = INTERRUPT_PERFMON;
 		performance_monitor_exception(&regs);
-		if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS))
-			hard_irq_disable();
+		next_interrupt(&regs);
 	}
 
-	if (local_paca->irq_happened & ~PACA_IRQ_HARD_DIS) {
-		/*
-		 * We are responding to the next interrupt, so interrupt-off
-		 * latencies should be reset here.
-		 */
-		trace_hardirqs_on();
-		trace_hardirqs_off();
+	/*
+	 * Softirq processing can enable and disable interrupts, which can
+	 * result in new irqs becoming pending. Must keep looping until we
+	 * have cleared out all pending interrupts.
+	 */
+	if (local_paca->irq_happened & ~PACA_IRQ_HARD_DIS)
 		goto again;
-	}
 }
 
 #if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_PPC_KUAP)
@@ -270,10 +297,12 @@ notrace void arch_local_irq_restore(unsigned long mask)
 	trace_hardirqs_off();
 
 	replay_soft_interrupts_irqrestore();
-	local_paca->irq_happened = 0;
 
 	trace_hardirqs_on();
 	irq_soft_mask_set(IRQS_ENABLED);
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+		WARN_ON(local_paca->irq_happened != PACA_IRQ_HARD_DIS);
+	local_paca->irq_happened = 0;
 	__hard_irq_enable();
 	preempt_enable();
 }
-- 
2.37.2

