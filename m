Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 513FA3A791C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 10:34:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G41p96vv4z3cRv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 18:34:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G41n26Dkmz3bwn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 18:33:42 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G41ml04yfzB8nC;
 Tue, 15 Jun 2021 10:33:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VQ1aJTc6i_i3; Tue, 15 Jun 2021 10:33:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G41mh70RgzB8jC;
 Tue, 15 Jun 2021 10:33:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DB2AE8B7AE;
 Tue, 15 Jun 2021 10:33:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HD906iKgInjG; Tue, 15 Jun 2021 10:33:24 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 878028B7A5;
 Tue, 15 Jun 2021 10:33:24 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 661EF66264; Tue, 15 Jun 2021 08:33:24 +0000 (UTC)
Message-Id: <23f37090b43f4d92abbc7781617213518a41cf93.1623745950.git.christophe.leroy@csgroup.eu>
In-Reply-To: <8071cd2e2f2bdc0711e6ac435dff4a09ff21fee2.1623745949.git.christophe.leroy@csgroup.eu>
References: <8071cd2e2f2bdc0711e6ac435dff4a09ff21fee2.1623745949.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 4/5] powerpc/interrupt: Refactor
 prep_irq_for_{user/kernel_enabled}_exit()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue, 15 Jun 2021 08:33:24 +0000 (UTC)
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

prep_irq_for_user_exit() is a superset of
prep_irq_for_kernel_enabled_exit().

Rename prep_irq_for_kernel_enabled_exit() as prep_irq_for_enabled_exit()
and have prep_irq_for_user_exit() use it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt.c | 29 +++++++----------------------
 1 file changed, 7 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 9780c26f19cf..05831d99bf26 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -50,7 +50,7 @@ static inline bool exit_must_hard_disable(void)
  * restartable is true then EE/RI can be left on because interrupts are handled
  * with a restart sequence.
  */
-static notrace __always_inline bool prep_irq_for_kernel_enabled_exit(bool restartable)
+static notrace __always_inline bool prep_irq_for_enabled_exit(bool restartable)
 {
 	/* This must be done with RI=1 because tracing may touch vmaps */
 	trace_hardirqs_on();
@@ -77,29 +77,14 @@ static notrace __always_inline bool prep_irq_for_kernel_enabled_exit(bool restar
 
 static notrace __always_inline bool prep_irq_for_user_exit(void)
 {
-	user_enter_irqoff();
-	/* This must be done with RI=1 because tracing may touch vmaps */
-	trace_hardirqs_on();
-
-#ifdef CONFIG_PPC32
-	__hard_EE_RI_disable();
-#else
-	if (exit_must_hard_disable())
-		__hard_EE_RI_disable();
+	bool ret;
 
-	/* This pattern matches prep_irq_for_idle */
-	if (unlikely(lazy_irq_pending_nocheck())) {
-		if (exit_must_hard_disable()) {
-			local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
-			__hard_RI_enable();
-		}
-		trace_hardirqs_off();
+	user_enter_irqoff();
+	ret = prep_irq_for_enabled_exit(true);
+	if (!ret)
 		user_exit_irqoff();
 
-		return false;
-	}
-#endif
-	return true;
+	return ret;
 }
 
 /* Has to run notrace because it is entered not completely "reconciled" */
@@ -465,7 +450,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 		 * Stack store exit can't be restarted because the interrupt
 		 * stack frame might have been clobbered.
 		 */
-		if (!prep_irq_for_kernel_enabled_exit(unlikely(stack_store))) {
+		if (!prep_irq_for_enabled_exit(unlikely(stack_store))) {
 			/*
 			 * Replay pending soft-masked interrupts now. Don't
 			 * just local_irq_enabe(); local_irq_disable(); because
-- 
2.25.0

