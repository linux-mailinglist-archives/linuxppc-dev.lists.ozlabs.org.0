Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E214C4AF5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 17:37:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4wRB2X6Mz3cRC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Feb 2022 03:37:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4wQl5Qn7z2yLT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Feb 2022 03:36:44 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K4wQb3fgmz9sSF;
 Fri, 25 Feb 2022 17:36:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8YgDx3wKJhxM; Fri, 25 Feb 2022 17:36:39 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K4wQb2mZcz9sSC;
 Fri, 25 Feb 2022 17:36:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4EC1C8B77E;
 Fri, 25 Feb 2022 17:36:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hAi__97nq34t; Fri, 25 Feb 2022 17:36:39 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.39])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1311B8B763;
 Fri, 25 Feb 2022 17:36:39 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21PGaSh5045790
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 17:36:29 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21PGaRF3045789;
 Fri, 25 Feb 2022 17:36:27 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1] powerpc/interrupt: Remove struct interrupt_state
Date: Fri, 25 Feb 2022 17:36:22 +0100
Message-Id: <1d862ce3eab3da6ca7ac47d4a78a18f154462511.1645806970.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1645806978; l=4263; s=20211009;
 h=from:subject:message-id; bh=qTHND+P0LmWaBimVqQTVXUUhsVy8eL7e5n1A3obaQ8g=;
 b=+PFLUnwGxM1othpVsDf6WET2NOnWDnpu+scL3pd2OViBYDmKLk/yUbqOfVPPxdn3MLYmZ6HjDZGW
 y/hPK6GJAV9PKzvh//3H2wxdZb+GBLRT1tZzftSGwPdS+ov3wYx7
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

Since commit ceff77efa4f8 ("powerpc/64e/interrupt: Use new interrupt
context tracking scheme") struct interrupt_state has been empty and
unused.

Remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/interrupt.h | 32 +++++++++++-----------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index fc28f46d2f9d..984ffceb8f91 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -123,9 +123,6 @@ static inline void nap_adjust_return(struct pt_regs *regs)
 #endif
 }
 
-struct interrupt_state {
-};
-
 static inline void booke_restore_dbcr0(void)
 {
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
@@ -138,7 +135,7 @@ static inline void booke_restore_dbcr0(void)
 #endif
 }
 
-static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
+static inline void interrupt_enter_prepare(struct pt_regs *regs)
 {
 #ifdef CONFIG_PPC32
 	if (!arch_irq_disabled_regs(regs))
@@ -228,17 +225,17 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
  * However interrupt_nmi_exit_prepare does return directly to regs, because
  * NMIs do not do "exit work" or replay soft-masked interrupts.
  */
-static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt_state *state)
+static inline void interrupt_exit_prepare(struct pt_regs *regs)
 {
 }
 
-static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
+static inline void interrupt_async_enter_prepare(struct pt_regs *regs)
 {
 #ifdef CONFIG_PPC64
 	/* Ensure interrupt_enter_prepare does not enable MSR[EE] */
 	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 #endif
-	interrupt_enter_prepare(regs, state);
+	interrupt_enter_prepare(regs);
 #ifdef CONFIG_PPC_BOOK3S_64
 	/*
 	 * RI=1 is set by interrupt_enter_prepare, so this thread flags access
@@ -251,7 +248,7 @@ static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct in
 	irq_enter();
 }
 
-static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct interrupt_state *state)
+static inline void interrupt_async_exit_prepare(struct pt_regs *regs)
 {
 	/*
 	 * Adjust at exit so the main handler sees the true NIA. This must
@@ -262,7 +259,7 @@ static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct int
 	nap_adjust_return(regs);
 
 	irq_exit();
-	interrupt_exit_prepare(regs, state);
+	interrupt_exit_prepare(regs);
 }
 
 struct interrupt_nmi_state {
@@ -447,13 +444,11 @@ static __always_inline void ____##func(struct pt_regs *regs);		\
 									\
 interrupt_handler void func(struct pt_regs *regs)			\
 {									\
-	struct interrupt_state state;					\
-									\
-	interrupt_enter_prepare(regs, &state);				\
+	interrupt_enter_prepare(regs);					\
 									\
 	____##func (regs);						\
 									\
-	interrupt_exit_prepare(regs, &state);				\
+	interrupt_exit_prepare(regs);					\
 }									\
 NOKPROBE_SYMBOL(func);							\
 									\
@@ -482,14 +477,13 @@ static __always_inline long ____##func(struct pt_regs *regs);		\
 									\
 interrupt_handler long func(struct pt_regs *regs)			\
 {									\
-	struct interrupt_state state;					\
 	long ret;							\
 									\
-	interrupt_enter_prepare(regs, &state);				\
+	interrupt_enter_prepare(regs);					\
 									\
 	ret = ____##func (regs);					\
 									\
-	interrupt_exit_prepare(regs, &state);				\
+	interrupt_exit_prepare(regs);					\
 									\
 	return ret;							\
 }									\
@@ -518,13 +512,11 @@ static __always_inline void ____##func(struct pt_regs *regs);		\
 									\
 interrupt_handler void func(struct pt_regs *regs)			\
 {									\
-	struct interrupt_state state;					\
-									\
-	interrupt_async_enter_prepare(regs, &state);			\
+	interrupt_async_enter_prepare(regs);				\
 									\
 	____##func (regs);						\
 									\
-	interrupt_async_exit_prepare(regs, &state);			\
+	interrupt_async_exit_prepare(regs);				\
 }									\
 NOKPROBE_SYMBOL(func);							\
 									\
-- 
2.34.1

