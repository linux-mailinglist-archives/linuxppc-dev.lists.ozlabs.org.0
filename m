Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 862D73324D1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 13:10:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvvDQ4FXNz3dPx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 23:10:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvvCJ6tydz3bPK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 23:09:30 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DvvC96L15z9tyjF;
 Tue,  9 Mar 2021 13:09:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id wQHYjtF11liV; Tue,  9 Mar 2021 13:09:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DvvC95RwWz9tyjG;
 Tue,  9 Mar 2021 13:09:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 278208B802;
 Tue,  9 Mar 2021 13:09:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YAi1Sz2wvQKq; Tue,  9 Mar 2021 13:09:27 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CF5988B801;
 Tue,  9 Mar 2021 13:09:26 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A8C3067555; Tue,  9 Mar 2021 12:09:26 +0000 (UTC)
Message-Id: <ae96c59fa2cb7f24a8929c58cfa2c909cb8ff1f1.1615291471.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615291471.git.christophe.leroy@csgroup.eu>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 01/43] powerpc/traps: unrecoverable_exception() is not an
 interrupt handler
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Mar 2021 12:09:26 +0000 (UTC)
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

unrecoverable_exception() is called from interrupt handlers or
after an interrupt handler has failed.

Make it a standard function to avoid doubling the actions
performed on interrupt entry (e.g.: user time accounting).

Fixes: 3a96570ffceb ("powerpc: convert interrupt handlers to use wrappers")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/interrupt.h | 3 ++-
 arch/powerpc/kernel/interrupt.c      | 1 -
 arch/powerpc/kernel/traps.c          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index aedfba29e43a..e8d09a841373 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -410,7 +410,6 @@ DECLARE_INTERRUPT_HANDLER(altivec_assist_exception);
 DECLARE_INTERRUPT_HANDLER(CacheLockingException);
 DECLARE_INTERRUPT_HANDLER(SPEFloatingPointException);
 DECLARE_INTERRUPT_HANDLER(SPEFloatingPointRoundException);
-DECLARE_INTERRUPT_HANDLER(unrecoverable_exception);
 DECLARE_INTERRUPT_HANDLER(WatchdogException);
 DECLARE_INTERRUPT_HANDLER(kernel_bad_stack);
 
@@ -437,6 +436,8 @@ DECLARE_INTERRUPT_HANDLER_NMI(hmi_exception_realmode);
 
 DECLARE_INTERRUPT_HANDLER_ASYNC(TAUException);
 
+void unrecoverable_exception(struct pt_regs *regs);
+
 void replay_system_reset(void);
 void replay_soft_interrupts(void);
 
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 398cd86b6ada..b8e7d25be31b 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -436,7 +436,6 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	return ret;
 }
 
-void unrecoverable_exception(struct pt_regs *regs);
 void preempt_schedule_irq(void);
 
 notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr)
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 1583fd1c6010..a44a30b0688c 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -2170,7 +2170,7 @@ DEFINE_INTERRUPT_HANDLER(SPEFloatingPointRoundException)
  * in the MSR is 0.  This indicates that SRR0/1 are live, and that
  * we therefore lost state by taking this exception.
  */
-DEFINE_INTERRUPT_HANDLER(unrecoverable_exception)
+void unrecoverable_exception(struct pt_regs *regs)
 {
 	pr_emerg("Unrecoverable exception %lx at %lx (msr=%lx)\n",
 		 regs->trap, regs->nip, regs->msr);
-- 
2.25.0

