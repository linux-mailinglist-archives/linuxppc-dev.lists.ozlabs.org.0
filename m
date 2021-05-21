Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D2A38C5FF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 13:49:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmlJ32Hc3z3c85
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 21:49:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IXUDWY4u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IXUDWY4u; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmlCB4LkKz3bty
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 21:44:54 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id a7so2142961plh.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 04:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jKBLKbTL/paPO2FwgAKP+94tHeiniX65QBApQUMf3UI=;
 b=IXUDWY4u1Y6KF9NEWuic7exVDl8/YoA6T241kHAg8PYK3ieYcIxQKMD1LG2XnRjAhg
 6R2JgmMtM9f6HMl1OyHexchcP0sdy7MxdhFFe2YRgKFHoHsE0cUaiYWMvM4StofqRCwi
 qHmcPPBeuPBfM2dK4vRAtLlNBON2shd6o1ybXHBLQjBigystbWxkTHYpNqiS2GRzNUMu
 cvGdqPrU9K0U2ctmlGcMV65HjfjbUFSw1uNwBMFRUl691fZJ6AZ+GR3i7MMKnvPq6Wbu
 Qpju8mSRpwTQG51ULZycVMqN2YGOsa8LsBKDY5Lazw0ZcC+yaLaAivtaMwiOQZBGYR/U
 2Uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jKBLKbTL/paPO2FwgAKP+94tHeiniX65QBApQUMf3UI=;
 b=Af/jnlXyhyVydPL8F7SSwMt8ATmqq0V9Y4uOLCUjjyu+wrvdswo3f03dIda3fYHvaj
 umF47DKjjqkvR5wgI9nBy/egWixNTD7F94cglQ/HZPoyuJFAMwqD8YX1/358VY+ooxQ2
 fW0QK/41Z54wx3c/DWLsdODd6xNaJjOjuxsObN2M0JdvncnK96VQzeL4RW1sw+dJFdKX
 Sog1D15KlOVORo9OuOj4JxIWKbo0bf3jQ5sT/qyLwOl+YTXorJMh8GNdGxxJkUnynxov
 R7Cla2SWiFZ7suoy15jg/yqYm/Cfq4bCyE4JbqHjKqPKNTg2+JAPTvhC6O+a0/uh8uxm
 bkHg==
X-Gm-Message-State: AOAM532HXIZjpdoA8klwQCDS3Myc8mrcECDZIrngf1RkmB8Zh9VyjCyr
 gI/EiSD/ClM/8jRLcr7i1FlGlPyutBY=
X-Google-Smtp-Source: ABdhPJzXztTwuj+9VGYn4lheAkCJ15AklwcDOjHJ7DMExW7xLbNIGkhKB3LXcbBo6SleVikBhUlofA==
X-Received: by 2002:a17:90a:ab8c:: with SMTP id
 n12mr10355089pjq.201.1621597492231; 
 Fri, 21 May 2021 04:44:52 -0700 (PDT)
Received: from bobo.ibm.com (60-241-27-127.tpgi.com.au. [60.241.27.127])
 by smtp.gmail.com with ESMTPSA id f5sm8681390pjp.37.2021.05.21.04.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 04:44:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 09/11] powerpc/64: interrupt soft-enable race fix
Date: Fri, 21 May 2021 21:44:20 +1000
Message-Id: <20210521114422.3179350-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210521114422.3179350-1-npiggin@gmail.com>
References: <20210521114422.3179350-1-npiggin@gmail.com>
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

Prevent interrupt restore from allowing racing hard interrupts going
ahead of previous soft-pending ones, by using the soft-masked restart
handler to allow a store to clear the soft-mask while knowing nothing
is soft-pending.

This probably doesn't matter much in practice, but it's a simple
demonstrator / test case to exercise the restart table logic.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/irq.c | 95 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 72cb45393ef2..8428caf3194e 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -217,6 +217,100 @@ static inline void replay_soft_interrupts_irqrestore(void)
 #define replay_soft_interrupts_irqrestore() replay_soft_interrupts()
 #endif
 
+#ifdef CONFIG_CC_HAS_ASM_GOTO
+notrace void arch_local_irq_restore(unsigned long mask)
+{
+	unsigned char irq_happened;
+
+	/* Write the new soft-enabled value if it is a disable */
+	if (mask) {
+		irq_soft_mask_set(mask);
+		return;
+	}
+
+	/*
+	 * After the stb, interrupts are unmasked and there are no interrupts
+	 * pending replay. The restart sequence makes this atomic with
+	 * respect to soft-masked interrupts. If this was just a simple code
+	 * sequence, a soft-masked interrupt could become pending right after
+	 * the comparison and before the stb.
+	 *
+	 * This allows interrupts to be unmasked without hard disabling, and
+	 * also without new hard interrupts coming in ahead of pending ones.
+	 */
+	asm_volatile_goto(
+"1:					\n"
+"		lbz	9,%0(13)	\n"
+"		cmpwi	9,0		\n"
+"		bne	%l[happened]	\n"
+"		stb	9,%1(13)	\n"
+"2:					\n"
+		RESTART_TABLE(1b, 2b, 1b)
+	: : "i" (offsetof(struct paca_struct, irq_happened)),
+	    "i" (offsetof(struct paca_struct, irq_soft_mask))
+	: "cr0", "r9"
+	: happened);
+
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+		WARN_ON_ONCE(!(mfmsr() & MSR_EE));
+
+	return;
+
+happened:
+	irq_happened = get_irq_happened();
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+		WARN_ON_ONCE(!irq_happened);
+
+	if (irq_happened == PACA_IRQ_HARD_DIS) {
+		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+			WARN_ON_ONCE(mfmsr() & MSR_EE);
+		irq_soft_mask_set(IRQS_ENABLED);
+		local_paca->irq_happened = 0;
+		__hard_irq_enable();
+		return;
+	}
+
+	/* Have interrupts to replay, need to hard disable first */
+	if (!(irq_happened & PACA_IRQ_HARD_DIS)) {
+		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
+			if (!(mfmsr() & MSR_EE)) {
+				/*
+				 * An interrupt could have come in and cleared
+				 * MSR[EE] and set IRQ_HARD_DIS, so check
+				 * IRQ_HARD_DIS again and warn if it is still
+				 * clear.
+				 */
+				irq_happened = get_irq_happened();
+				WARN_ON_ONCE(!(irq_happened & PACA_IRQ_HARD_DIS));
+			}
+		}
+		__hard_irq_disable();
+		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+	} else {
+		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
+			if (WARN_ON_ONCE(mfmsr() & MSR_EE))
+				__hard_irq_disable();
+		}
+	}
+
+	/*
+	 * Disable preempt here, so that the below preempt_enable will
+	 * perform resched if required (a replayed interrupt may set
+	 * need_resched).
+	 */
+	preempt_disable();
+	irq_soft_mask_set(IRQS_ALL_DISABLED);
+	trace_hardirqs_off();
+
+	replay_soft_interrupts_irqrestore();
+	local_paca->irq_happened = 0;
+
+	trace_hardirqs_on();
+	irq_soft_mask_set(IRQS_ENABLED);
+	__hard_irq_enable();
+	preempt_enable();
+}
+#else
 notrace void arch_local_irq_restore(unsigned long mask)
 {
 	unsigned char irq_happened;
@@ -288,6 +382,7 @@ notrace void arch_local_irq_restore(unsigned long mask)
 	__hard_irq_enable();
 	preempt_enable();
 }
+#endif
 EXPORT_SYMBOL(arch_local_irq_restore);
 
 /*
-- 
2.23.0

