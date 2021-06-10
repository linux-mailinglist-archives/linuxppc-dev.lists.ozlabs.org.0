Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B93B43A2C9D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 15:14:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G14Dp20f6z3c8p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 23:14:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ftGZaFbS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ftGZaFbS; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G14855fVrz3bx4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 23:09:57 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id g24so3618889pji.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 06:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jKBLKbTL/paPO2FwgAKP+94tHeiniX65QBApQUMf3UI=;
 b=ftGZaFbS0s8rF1xoTgrb3cFRVyHu8Ww7bNcEEc6oloySlVplBJk+fhGZHqaDRxrn32
 pRwGG1FyW8Mp+v5wdXhhg9fSS6U7+IRCCQEDB/L065fud48EX75lJ0EKJaH7RVDRiHfb
 dxzjJfe/eYWZwC/RfYcV0R2L57gbamYmTJBXABLly0KLxgyKsh4ejUFxY0jydDBndtZ6
 uslSJbevHDeyAH6VRyxAm/9oRhZB6IqBwcunIOO9gXyB3mBh3CMJPA+tMYlfElbPIKHW
 mHWTVmHK1kvGmZzvvU26N01OVgFGmD/LzRUK3AJgh+qRkkoeHV7wxm8Jf3xGtITTDwsa
 UVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jKBLKbTL/paPO2FwgAKP+94tHeiniX65QBApQUMf3UI=;
 b=EyT2Icb5/g3X4HZGrSFf7myJfrgDqade9Nu4Blg466h71CU5+B4uUNEe/oVlENUHlR
 NoUq7vkxZRQqxLEM2ifs52cEJdaGqGAGvS4Fc72oPadMcvrKl+1oL+zVx7NOoVkYe0Ze
 AbPwHLlSdimOnPxAxewZygpvotLWAnTeUvzlJczwje2Qezpe/7qPWRrGgCkS1BBjTX46
 aOYv0giN80fJ/M30AL1fIchC6RIcezr7eFvK2FV5sQ/rHnx6eQSynzZQTG7fHSBPki5X
 sHel8O77HaB8/KnLFeSxx3arW8E++RageR5vuUmhTegtUbWiRb8tuclUM04BmTMkCi1j
 j6dQ==
X-Gm-Message-State: AOAM531p0I2+oFDMVEicdVKj6dNAkoDHLoB/xTYWfKguLDet9ksFeD+X
 BHTcwInUngdXeX4TEzLebqLBi039V2w=
X-Google-Smtp-Source: ABdhPJx2wwy/KsbociCv0GXLcnBkjgehDqLjj+bWN38v2yKGtrzOr5XfShV3cIE3HVoCC4KZU3yxzw==
X-Received: by 2002:a17:90b:1e09:: with SMTP id
 pg9mr3349910pjb.208.1623330594541; 
 Thu, 10 Jun 2021 06:09:54 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id bv3sm7012173pjb.1.2021.06.10.06.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 06:09:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 09/11] powerpc/64: interrupt soft-enable race fix
Date: Thu, 10 Jun 2021 23:09:19 +1000
Message-Id: <20210610130921.706938-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210610130921.706938-1-npiggin@gmail.com>
References: <20210610130921.706938-1-npiggin@gmail.com>
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

