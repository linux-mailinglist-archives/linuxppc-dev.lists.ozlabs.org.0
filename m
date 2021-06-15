Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB67A3A791B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 10:34:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G41nr2nb5z3cDW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 18:34:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G41mz2JCFz30NR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 18:33:39 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G41mj0mBDzB8nN;
 Tue, 15 Jun 2021 10:33:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D0bhppiUnCbn; Tue, 15 Jun 2021 10:33:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G41mg5w40zB8hP;
 Tue, 15 Jun 2021 10:33:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B9B2E8B7A5;
 Tue, 15 Jun 2021 10:33:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vWn6E5pBcIEZ; Tue, 15 Jun 2021 10:33:23 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7F8438B7B5;
 Tue, 15 Jun 2021 10:33:23 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5BA0966264; Tue, 15 Jun 2021 08:33:23 +0000 (UTC)
Message-Id: <65529943d40f82efb3a9c0d1ab4cdd542f0ca163.1623745949.git.christophe.leroy@csgroup.eu>
In-Reply-To: <8071cd2e2f2bdc0711e6ac435dff4a09ff21fee2.1623745949.git.christophe.leroy@csgroup.eu>
References: <8071cd2e2f2bdc0711e6ac435dff4a09ff21fee2.1623745949.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 3/5] powerpc/interrupt: Interchange
 prep_irq_for_{kernel_enabled/user}_exit()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue, 15 Jun 2021 08:33:23 +0000 (UTC)
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
prep_irq_for_kernel_enabled_exit(). In order to allow refactoring in
following patch, interchange the two. This will allow
prep_irq_for_user_exit() to call a renamed version of
prep_irq_for_kernel_enabled_exit().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/interrupt.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index b9558372adc0..9780c26f19cf 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -46,27 +46,28 @@ static inline bool exit_must_hard_disable(void)
  * This should be called with local irqs disabled, but if they were previously
  * enabled when the interrupt handler returns (indicating a process-context /
  * synchronous interrupt) then irqs_enabled should be true.
+ *
+ * restartable is true then EE/RI can be left on because interrupts are handled
+ * with a restart sequence.
  */
-static notrace __always_inline bool prep_irq_for_user_exit(void)
+static notrace __always_inline bool prep_irq_for_kernel_enabled_exit(bool restartable)
 {
-	user_enter_irqoff();
 	/* This must be done with RI=1 because tracing may touch vmaps */
 	trace_hardirqs_on();
 
 #ifdef CONFIG_PPC32
 	__hard_EE_RI_disable();
 #else
-	if (exit_must_hard_disable())
+	if (exit_must_hard_disable() || !restartable)
 		__hard_EE_RI_disable();
 
 	/* This pattern matches prep_irq_for_idle */
 	if (unlikely(lazy_irq_pending_nocheck())) {
-		if (exit_must_hard_disable()) {
+		if (exit_must_hard_disable() || !restartable) {
 			local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 			__hard_RI_enable();
 		}
 		trace_hardirqs_off();
-		user_exit_irqoff();
 
 		return false;
 	}
@@ -74,28 +75,26 @@ static notrace __always_inline bool prep_irq_for_user_exit(void)
 	return true;
 }
 
-/*
- * restartable is true then EE/RI can be left on because interrupts are handled
- * with a restart sequence.
- */
-static notrace __always_inline bool prep_irq_for_kernel_enabled_exit(bool restartable)
+static notrace __always_inline bool prep_irq_for_user_exit(void)
 {
+	user_enter_irqoff();
 	/* This must be done with RI=1 because tracing may touch vmaps */
 	trace_hardirqs_on();
 
 #ifdef CONFIG_PPC32
 	__hard_EE_RI_disable();
 #else
-	if (exit_must_hard_disable() || !restartable)
+	if (exit_must_hard_disable())
 		__hard_EE_RI_disable();
 
 	/* This pattern matches prep_irq_for_idle */
 	if (unlikely(lazy_irq_pending_nocheck())) {
-		if (exit_must_hard_disable() || !restartable) {
+		if (exit_must_hard_disable()) {
 			local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
 			__hard_RI_enable();
 		}
 		trace_hardirqs_off();
+		user_exit_irqoff();
 
 		return false;
 	}
-- 
2.25.0

