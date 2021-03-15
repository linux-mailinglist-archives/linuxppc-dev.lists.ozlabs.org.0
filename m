Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6562133C90E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 23:08:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzrCd2szdz3d3G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 09:08:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=FtISHNh6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FtISHNh6; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzr780dfCz30FQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 09:04:35 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id bt4so9549264pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 15:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W6P4dhgnXWUcYz8c6ZkwqVI/06S/oT8BLJahk5kAuzk=;
 b=FtISHNh6jP0xJhBOt2f66Vt6S535HvitQVPaBM8XMVYCZ2c5yoQUOPjoGgL+0kqEPX
 rEEOzLFhR3Mu8mKIvhngqnDoN+4QxqkmPpza4Vo7KtKEmJnu7+JOG6V9U31nr6lcxA6J
 6vT8L1xjK9cOzstS8JnGL7RTif1sBPx22ITgEpLDGd43/C0u0nSVpyyZp5nO6KpMHyKy
 +bNJN8dmWJt/EKCfWPunwfFiRbeWbinf8D5ofdRNzi9J99FjWpKPB9Xl2JQD04MSSQcl
 HIl/lsWdxo0BcHs6q6vTZDyPZ2t9Md5zjfm0FodB2IL8PxQSTrx+Z4bbOAnL5C7zKqYC
 cNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W6P4dhgnXWUcYz8c6ZkwqVI/06S/oT8BLJahk5kAuzk=;
 b=egapQOqNZwSRAxxcr3eKJnJX1MTfpviWlm5K47MUxICJzkMTBc/kZfgkWzFJ+wwV+t
 TJ/jsrZqQDaqzINpMIN0PxzaY5XnapshEkmGfySgtrECJ/ByiJC8TLko5x4moogDYboI
 uvACHGSB8DAmolkRUfRboY7z8hfAKoKbrIgExe6Iervwi3uYT/uHnjuxT8dUryJRcNfG
 e6qUkDqDS9qJoyQAjG2rvGurfu+TVqJum4AO41XBX09y8C9Xx/KmlK1NPFVGzC9Qo/iY
 lU9tC7oIZgg43O97u5xBXajcpakkJATBN2CRgpmX6bGg0Vxg9OvuZ3RWSvesalQh3DmU
 /OlQ==
X-Gm-Message-State: AOAM532J9nu+3WHehrUkzateiqdBJplabIf6gp5dE64b3aKwoo1TLX7A
 ftZV/X6cluOXr7pOUStIleVXHTK+Aiw=
X-Google-Smtp-Source: ABdhPJzQOuULTf7p9sU3eNnXltqhErMkSEN0IMgx53vF7236QjFJayRTncVdwuxUUVEvIK9Sjsmm0A==
X-Received: by 2002:a17:902:b7cb:b029:e4:55cd:ddf0 with SMTP id
 v11-20020a170902b7cbb02900e455cdddf0mr13381003plz.45.1615845873145; 
 Mon, 15 Mar 2021 15:04:33 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 y9sm14740338pgc.9.2021.03.15.15.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 15:04:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/14] powerpc/64: interrupt soft-enable race fix
Date: Tue, 16 Mar 2021 08:03:56 +1000
Message-Id: <20210315220402.260594-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210315220402.260594-1-npiggin@gmail.com>
References: <20210315220402.260594-1-npiggin@gmail.com>
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
 arch/powerpc/kernel/irq.c | 81 ++++++++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 08a747b92735..a032701e81be 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -224,54 +224,75 @@ notrace void arch_local_irq_restore(unsigned long mask)
 {
 	unsigned char irq_happened;
 
-	/* Write the new soft-enabled value */
-	irq_soft_mask_set(mask);
-	if (mask)
+	/* Write the new soft-enabled value if it is a disable */
+	if (mask) {
+		irq_soft_mask_set(mask);
 		return;
+	}
 
 	/*
-	 * From this point onward, we can take interrupts, preempt,
-	 * etc... unless we got hard-disabled. We check if an event
-	 * happened. If none happened, we know we can just return.
-	 *
-	 * We may have preempted before the check below, in which case
-	 * we are checking the "new" CPU instead of the old one. This
-	 * is only a problem if an event happened on the "old" CPU.
+	 * After the stb, interrupts are unmasked and there are no interrupts
+	 * pending replay. The restart sequence makes this atomic with
+	 * respect to soft-masked interrupts. If this was just a simple code
+	 * sequence, a soft-masked interrupt could become pending right after
+	 * the comparison and before the stb.
 	 *
-	 * External interrupt events will have caused interrupts to
-	 * be hard-disabled, so there is no problem, we
-	 * cannot have preempted.
+	 * This allows interrupts to be unmasked without hard disabling, and
+	 * also without new hard interrupts coming in ahead of pending ones.
 	 */
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
 	irq_happened = get_irq_happened();
-	if (!irq_happened) {
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+		WARN_ON_ONCE(!irq_happened);
+
+	if (irq_happened == PACA_IRQ_HARD_DIS) {
 		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-			WARN_ON_ONCE(!(mfmsr() & MSR_EE));
+			WARN_ON_ONCE(mfmsr() & MSR_EE);
+		irq_soft_mask_set(IRQS_ENABLED);
+		local_paca->irq_happened = 0;
+		__hard_irq_enable();
 		return;
 	}
 
-	/* We need to hard disable to replay. */
+	/* Have interrupts to replay, need to hard disable first */
 	if (!(irq_happened & PACA_IRQ_HARD_DIS)) {
-		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
-			WARN_ON_ONCE(!(mfmsr() & MSR_EE));
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
 		__hard_irq_disable();
 		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 	} else {
-		/*
-		 * We should already be hard disabled here. We had bugs
-		 * where that wasn't the case so let's dbl check it and
-		 * warn if we are wrong. Only do that when IRQ tracing
-		 * is enabled as mfmsr() can be costly.
-		 */
 		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
 			if (WARN_ON_ONCE(mfmsr() & MSR_EE))
 				__hard_irq_disable();
 		}
-
-		if (irq_happened == PACA_IRQ_HARD_DIS) {
-			local_paca->irq_happened = 0;
-			__hard_irq_enable();
-			return;
-		}
 	}
 
 	/*
-- 
2.23.0

