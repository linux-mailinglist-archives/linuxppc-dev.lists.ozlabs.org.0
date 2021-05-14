Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0B5380543
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 10:29:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhMC24Tl8z3017
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 18:29:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhMBQ5Tkqz3066
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 18:29:02 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FhMBC17yVz9sbZ;
 Fri, 14 May 2021 10:28:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hLarUM30odUm; Fri, 14 May 2021 10:28:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FhMBC0FJhz9sbQ;
 Fri, 14 May 2021 10:28:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CC7888B7F7;
 Fri, 14 May 2021 10:28:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nX5bHsORzjHH; Fri, 14 May 2021 10:28:50 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 880E98B7F6;
 Fri, 14 May 2021 10:28:50 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6854D64BE0; Fri, 14 May 2021 08:28:50 +0000 (UTC)
Message-Id: <7ee7f4ff8fdad034dd2d89ed439d72e2966663c3.1620980916.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cd0634769e5fea397411a0f833db52749852c6f8.1620980916.git.christophe.leroy@csgroup.eu>
References: <cd0634769e5fea397411a0f833db52749852c6f8.1620980916.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/2] powerpc/interrupt: Use msr instead of regs->msr
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Fri, 14 May 2021 08:28:50 +0000 (UTC)
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

interrupt_exit_user_prepare() and interrupt_exit_kernel_prepare()
get msr as second parameter from ASM. Use it instead of reading
it again.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/interrupt.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index d896fc6ed0be..9541328a97b1 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -231,8 +231,8 @@ static notrace void booke_load_dbcr0(void)
 #endif
 }
 
-static notrace unsigned long __interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long ret,
-							   bool is_not_scv)
+static notrace unsigned long __interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr,
+							   unsigned long ret, bool is_not_scv)
 {
 	unsigned long ti_flags;
 
@@ -281,7 +281,7 @@ static notrace unsigned long __interrupt_exit_user_prepare(struct pt_regs *regs,
 			 * may decide to restore them (to avoid taking an FP
 			 * fault).
 			 */
-			if ((regs->msr & mathflags) != mathflags)
+			if ((msr & mathflags) != mathflags)
 				restore_math(regs);
 		}
 	}
@@ -297,7 +297,7 @@ static notrace unsigned long __interrupt_exit_user_prepare(struct pt_regs *regs,
 	}
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	local_paca->tm_scratch = regs->msr;
+	local_paca->tm_scratch = msr;
 #endif
 
 	booke_load_dbcr0();
@@ -357,17 +357,17 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		ret |= _TIF_RESTOREALL;
 	}
 
-	return __interrupt_exit_user_prepare(regs, ret, is_not_scv);
+	return __interrupt_exit_user_prepare(regs, regs->msr, ret, is_not_scv);
 }
 
 notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr)
 {
 	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
-		BUG_ON(!(regs->msr & MSR_RI));
-	BUG_ON(!(regs->msr & MSR_PR));
+		BUG_ON(!(msr & MSR_RI));
+	BUG_ON(!(msr & MSR_PR));
 	BUG_ON(arch_irq_disabled_regs(regs));
 
-	return __interrupt_exit_user_prepare(regs, 0, true);
+	return __interrupt_exit_user_prepare(regs, msr, 0, true);
 }
 
 void preempt_schedule_irq(void);
@@ -379,9 +379,9 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	unsigned long kuap;
 
 	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x) &&
-	    unlikely(!(regs->msr & MSR_RI)))
+	    unlikely(!(msr & MSR_RI)))
 		unrecoverable_exception(regs);
-	BUG_ON(regs->msr & MSR_PR);
+	BUG_ON(msr & MSR_PR);
 	/*
 	 * CT_WARN_ON comes here via program_check_exception,
 	 * so avoid recursion.
@@ -400,7 +400,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 
 	if (!arch_irq_disabled_regs(regs)) {
 		/* Returning to a kernel context with local irqs enabled. */
-		WARN_ON_ONCE(!(regs->msr & MSR_EE));
+		WARN_ON_ONCE(!(msr & MSR_EE));
 again:
 		if (IS_ENABLED(CONFIG_PREEMPT)) {
 			/* Return to preemptible kernel context */
@@ -416,14 +416,14 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 		/* Returning to a kernel context with local irqs disabled. */
 		__hard_EE_RI_disable();
 #ifdef CONFIG_PPC64
-		if (regs->msr & MSR_EE)
+		if (msr & MSR_EE)
 			local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
 #endif
 	}
 
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	local_paca->tm_scratch = regs->msr;
+	local_paca->tm_scratch = msr;
 #endif
 
 	/*
-- 
2.25.0

