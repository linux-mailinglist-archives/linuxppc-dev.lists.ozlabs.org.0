Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3F55B038E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 14:04:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MN1C72nw9z3bgQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 22:04:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=arQHzWD1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=arQHzWD1;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN1BV471Nz2xk6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 22:04:02 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id o126so5404084pfb.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Sep 2022 05:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=MYDXvHWVqlFaxJDDMXiyCj4gN/S0APV5VGQxUE3ephc=;
        b=arQHzWD1LAH4Fc4wNBAJwf5Cu3KwReNulExfQn6kfdTBLOkQYlKbEzq78TRTpnECmZ
         4XyejyLYMCzmOWHz+v5REY53OYSG7seuhjzBZ5xes8+/m4LTujeVR0yi+5zsZ6H4UvVD
         gmAxnncGByPrnSYxQuruJU+YsljvhsBBWn1r1sfNTMLDiWLPPPNucT5uuBMnm2v81sQ7
         sG+Cypj8fgRqUd2R04MlgEG+Aixj/UOsUEsUr7ghGxEt2ScOOeSaxxrsTbsspQ3tKMxn
         vq6yRgX+THSHvTDLRbBioz5ZrXpuMe29iG5eq2c++RV8eGigLWW9zxdeCxtLuDGzbv+c
         cL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=MYDXvHWVqlFaxJDDMXiyCj4gN/S0APV5VGQxUE3ephc=;
        b=qmZLkHEEorxNfZqY+rej9HTfQ+fUCtLexCHP/m6SquDc8a6ktss3qrr0BbwZc2lFbD
         MVIfds319062yrp31zYLGJV6aB1EhMTAyOO6CZwZ1wd5i0jzZcskWZ+EQ96T8gbJWy6j
         WGHhUa7W0VmYvGel7mE+SPlvm+HzcINFuT6OxMyH63H+XcIeQGbHcARGjSb0EDQOICNV
         LdY7QIEZIEPSyoTw1RSSclO8Df0gsGRtvws3QQrNggQL5nlpluaG5Bi35MWuL6/NdXe/
         KYsjln7AhdpG8tw5GDJNB3vRI8+m1ffC8LETbbYzcTHI7sCT8e+qVPHNG1ntkPljgEbj
         Jdkg==
X-Gm-Message-State: ACgBeo2UmcpxuTFG1gw6K8QOsRrRfQ26RRq6OaYsGupVU7RmAtS6O3EM
	ddpvBCGW3nOP9GiOSoV8r88iPxlfB8I=
X-Google-Smtp-Source: AA6agR4dgHuRw556gfm766ybOcHQtEw0UFyBiJ1pRsoz26LGKflY8gWOoG30ge/25/X2vQS0rSPFGg==
X-Received: by 2002:a63:ee55:0:b0:429:88cf:78df with SMTP id n21-20020a63ee55000000b0042988cf78dfmr3044764pgk.301.1662552239428;
        Wed, 07 Sep 2022 05:03:59 -0700 (PDT)
Received: from bobo.ibm.com ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id h10-20020a17090acf0a00b0020061f4c907sm6320212pju.7.2022.09.07.05.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 05:03:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/64/irq: tidy soft-masked irq replay and improve documentation
Date: Wed,  7 Sep 2022 22:03:47 +1000
Message-Id: <20220907120347.3684283-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907120347.3684283-1-npiggin@gmail.com>
References: <20220907120347.3684283-1-npiggin@gmail.com>
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

