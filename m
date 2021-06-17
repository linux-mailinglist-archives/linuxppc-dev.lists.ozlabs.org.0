Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D923AB7FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 17:55:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5RVG6cGmz3drZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:55:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UPGjAWzo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UPGjAWzo; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5RPd0sGcz3c1Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 01:51:48 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id h12so5365801pfe.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 08:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jKBLKbTL/paPO2FwgAKP+94tHeiniX65QBApQUMf3UI=;
 b=UPGjAWzojqtkLsTrh5K1S7K60u7QyIZCWceQWwgnXT37tWTsdrp9UuWAkbpXJwVUgW
 nGp4IWEaCUOG/WX4bXKHQBjpg1NMVpEwZdZbqYPb4ZmECCjBR2Zcu2/qR1GJ2lC9oosE
 QO5LSNftFDwukh0q35Qi2I3gsYLp4busKy9sX0BDkmcL3HYy/qSi062rq/6oeXhygDWo
 lAN3J/g0/33nUaa4vucnMjdLb7neJ3x98EGLI1LQqPD94ecXK8a7XCZ/PE5mls9MqsxN
 Zk42wGrlbxbL8DVJgbum1Y1Iwm2Y5d8fswg8vCgZbGKcOwInSlQvWXq/tcdPPsVWf85i
 pYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jKBLKbTL/paPO2FwgAKP+94tHeiniX65QBApQUMf3UI=;
 b=OhPUk0EeH48pU9wfDAoZJ+0L/4UBokL+Am9cFiCS8A+iuy2PgCPw2+tkn6CcTiG/Jn
 x/gCEhTdcpnWMs+fkaRI/Tsz5HGuQSbbtvDfypALUXRXgNM9V6geu5hWcE3y/SlusuON
 9Uql+nsYLkeoYLjeea/K3L/65h6Aa7iJiLSylQv77of7WmbMuIbnfLp14whsIrXJjAYQ
 Qtj5JKoO+s81RekXxRN+G4h0RvqCYa9rnaDorkqPg+e6OF8BjosoJMdwmr0eE0Jq2YQX
 Bk4FTS7OcKb5J+TsmjEcmpVv69qca+aP67IJvg5T0G3nfin7+wOzC2LCFTDAUGLCBEFt
 Clig==
X-Gm-Message-State: AOAM5304rN00bhBFX4uWDyQKMX049no/y2b81wMY6KPL22O2/EGhPPph
 He7VNcajc/vXWpPAdOgfDn1d/eQxcHo=
X-Google-Smtp-Source: ABdhPJzJlSi0bcsBBAVx5Z0BwmkjyRa8mhpJS4aJ4l2kCQKGHG7OfggfnNF50dW06ovTdz/u0BZX5g==
X-Received: by 2002:a63:e44e:: with SMTP id i14mr5622530pgk.80.1623945106132; 
 Thu, 17 Jun 2021 08:51:46 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id a15sm5749733pfl.100.2021.06.17.08.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:51:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 10/17] powerpc/64: interrupt soft-enable race fix
Date: Fri, 18 Jun 2021 01:51:09 +1000
Message-Id: <20210617155116.2167984-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210617155116.2167984-1-npiggin@gmail.com>
References: <20210617155116.2167984-1-npiggin@gmail.com>
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

