Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFFB52B4AA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 10:33:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L35qC1mvlz3ch1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 18:33:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L35pR69Jgz3c7S
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 18:32:47 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4L35pK6dtpz9srZ;
 Wed, 18 May 2022 10:32:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id asZI8wdTz7_S; Wed, 18 May 2022 10:32:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4L35pK5lL1z9srY;
 Wed, 18 May 2022 10:32:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B65398B77B;
 Wed, 18 May 2022 10:32:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id C1zaX-77-LYm; Wed, 18 May 2022 10:32:41 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 949B18B763;
 Wed, 18 May 2022 10:32:41 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 24I8WXG72962124
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 18 May 2022 10:32:33 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 24I8WTP22962123;
 Wed, 18 May 2022 10:32:29 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/2] powerpc/irq: Replace #ifdefs by IS_ENABLED()
Date: Wed, 18 May 2022 10:32:28 +0200
Message-Id: <c1ded642f8d9002767f8fed48ed6d1e76254ed73.1652862729.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <e2454434992cc932a5a34b695ae981c0b2f4c28e.1652862729.git.christophe.leroy@csgroup.eu>
References: <e2454434992cc932a5a34b695ae981c0b2f4c28e.1652862729.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1652862747; l=3411; s=20211009;
 h=from:subject:message-id; bh=LH4UR/Yo7A3/ZMZPI2cOjU7g3lOq9tyKbnxyOai1sxE=;
 b=5nhel9tpLKQ8hG4PsKHXw1L4QgwDPtFqkIKqtYIlAjPtPEQsRgLXC4zWnwSqlgDoZme0rynO/YV/
 7WALbKhrBcluFoEh/GKD6KsZTraSPZ2+835EO9TGI5pVZMjM78Jr
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace
  #ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG and
  #ifdef CONFIG_PERF_EVENTS
by IS_ENABLED() in hw_irq.h and plpar_wrappers.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/hw_irq.h         | 30 +++++++++++------------
 arch/powerpc/include/asm/plpar_wrappers.h |  5 ++--
 2 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index edc569481faf..6efab00aa1c8 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -123,7 +123,6 @@ static inline notrace unsigned long irq_soft_mask_return(void)
  */
 static inline notrace void irq_soft_mask_set(unsigned long mask)
 {
-#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
 	/*
 	 * The irq mask must always include the STD bit if any are set.
 	 *
@@ -138,8 +137,8 @@ static inline notrace void irq_soft_mask_set(unsigned long mask)
 	 * unmasks to be replayed, among other things. For now, take
 	 * the simple approach.
 	 */
-	WARN_ON(mask && !(mask & IRQS_DISABLED));
-#endif
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
+		WARN_ON(mask && !(mask & IRQS_DISABLED));
 
 	WRITE_ONCE(local_paca->irq_soft_mask, mask);
 	barrier();
@@ -324,11 +323,13 @@ bool power_pmu_wants_prompt_pmi(void);
  */
 static inline bool should_hard_irq_enable(void)
 {
-#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
-	WARN_ON(irq_soft_mask_return() == IRQS_ENABLED);
-	WARN_ON(mfmsr() & MSR_EE);
-#endif
-#ifdef CONFIG_PERF_EVENTS
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
+		WARN_ON(irq_soft_mask_return() == IRQS_ENABLED);
+		WARN_ON(mfmsr() & MSR_EE);
+	}
+
+	if (!IS_ENABLED(CONFIG_PERF_EVENTS))
+		return false;
 	/*
 	 * If the PMU is not running, there is not much reason to enable
 	 * MSR[EE] in irq handlers because any interrupts would just be
@@ -343,9 +344,6 @@ static inline bool should_hard_irq_enable(void)
 		return false;
 
 	return true;
-#else
-	return false;
-#endif
 }
 
 /*
@@ -353,11 +351,11 @@ static inline bool should_hard_irq_enable(void)
  */
 static inline void do_hard_irq_enable(void)
 {
-#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
-	WARN_ON(irq_soft_mask_return() == IRQS_ENABLED);
-	WARN_ON(get_paca()->irq_happened & PACA_IRQ_MUST_HARD_MASK);
-	WARN_ON(mfmsr() & MSR_EE);
-#endif
+	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
+		WARN_ON(irq_soft_mask_return() == IRQS_ENABLED);
+		WARN_ON(get_paca()->irq_happened & PACA_IRQ_MUST_HARD_MASK);
+		WARN_ON(mfmsr() & MSR_EE);
+	}
 	/*
 	 * This allows PMI interrupts (and watchdog soft-NMIs) through.
 	 * There is no other reason to enable this way.
diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index 83e0f701ebc6..8239c0af5eb2 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -43,11 +43,10 @@ static inline long extended_cede_processor(unsigned long latency_hint)
 	set_cede_latency_hint(latency_hint);
 
 	rc = cede_processor();
-#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
+
 	/* Ensure that H_CEDE returns with IRQs on */
-	if (WARN_ON(!(mfmsr() & MSR_EE)))
+	if (WARN_ON(IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG) && !(mfmsr() & MSR_EE)))
 		__hard_irq_enable();
-#endif
 
 	set_cede_latency_hint(old_latency_hint);
 
-- 
2.35.3

