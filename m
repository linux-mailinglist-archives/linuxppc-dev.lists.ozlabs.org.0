Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4D5B56FD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 22:29:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XvqN6pNkzF3FG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 06:29:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="tGTrxNkp"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Xvhz2T9kzF36W
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 06:24:17 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46Xvhq3S6bz9vKHb;
 Tue, 17 Sep 2019 22:24:11 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tGTrxNkp; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bTnuu6A5TJVg; Tue, 17 Sep 2019 22:24:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46Xvhq2LDpz9vKHW;
 Tue, 17 Sep 2019 22:24:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568751851; bh=PgW7h/tGRLuy79KUySCnCAqcDGM5n4zLU6TcnXLOhFQ=;
 h=From:Subject:To:Cc:Date:From;
 b=tGTrxNkpUi6ttigOmD6mu1Ry/G3X4XaBMmM3ovs8P6eCiblwuU33cUbUbKuEq/1ov
 gZjhuDQB0e+/NlV3I1euAQPSMdMl4UgkwZ40SI+uGK4pMC68gPLd6x5OGHlbJuTitV
 rs+FokRh7tRuyAtKnZgtDUict20MZqxggSScjdc8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6A0858B8B4;
 Tue, 17 Sep 2019 22:24:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Y-Lt2digccTg; Tue, 17 Sep 2019 22:24:11 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 284248B8B1;
 Tue, 17 Sep 2019 22:24:11 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id D446A69881; Tue, 17 Sep 2019 20:24:10 +0000 (UTC)
Message-Id: <512ec59433470a2dfb0d1168e0c660b843fe92d5.1568751807.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 1/2] powerpc/irq: bring back ksp_limit management in C
 functions.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 segher@kernel.crashing.org
Date: Tue, 17 Sep 2019 20:24:10 +0000 (UTC)
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

Commit cbc9565ee826 ("powerpc: Remove ksp_limit on ppc64") moved
PPC32 ksp_limit handling in assembly functions call_do_softirq()
and call_do_irq() as they are different for PPC32 and PPC64.

In preparation of replacing these functions by inline assembly,
partialy revert that commit to bring back ksp_limit assignment
in the callers.

To get and set ksp_limit without a forest of #ifdefs CONFIG_PPC32,
use helpers that will void on PPC64.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/irq.h | 21 +++++++++++++++++++++
 arch/powerpc/kernel/irq.c      | 14 +++++++++++++-
 arch/powerpc/kernel/misc_32.S  | 14 --------------
 3 files changed, 34 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
index 814dfab7e392..52adec9a379d 100644
--- a/arch/powerpc/include/asm/irq.h
+++ b/arch/powerpc/include/asm/irq.h
@@ -64,5 +64,26 @@ extern void __do_irq(struct pt_regs *regs);
 
 int irq_choose_cpu(const struct cpumask *mask);
 
+#ifdef CONFIG_PPC32
+static inline unsigned long get_ksp_limit(struct task_struct *tsk)
+{
+	return tsk->thread.ksp_limit;
+}
+
+static inline void set_ksp_limit(struct task_struct *tsk, unsigned long limit)
+{
+	tsk->thread.ksp_limit = limit;
+}
+#else
+static inline unsigned long get_ksp_limit(struct task_struct *tsk)
+{
+	return 0;
+}
+
+static inline void set_ksp_limit(struct task_struct *tsk, unsigned long limit)
+{
+}
+#endif
+
 #endif /* _ASM_IRQ_H */
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 5645bc9cbc09..04204be49577 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -646,6 +646,7 @@ void do_IRQ(struct pt_regs *regs)
 {
 	struct pt_regs *old_regs = set_irq_regs(regs);
 	void *cursp, *irqsp, *sirqsp;
+	unsigned long saved_ksp_limit = get_ksp_limit(current);
 
 	/* Switch to the irq stack to handle this */
 	cursp = (void *)(current_stack_pointer() & ~(THREAD_SIZE - 1));
@@ -658,9 +659,15 @@ void do_IRQ(struct pt_regs *regs)
 		set_irq_regs(old_regs);
 		return;
 	}
+	/* Adjust the stack limit */
+	set_ksp_limit(current, (unsigned long)irqsp);
+
 	/* Switch stack and call */
 	call_do_irq(regs, irqsp);
 
+	/* Restore stack limit */
+	set_ksp_limit(current, saved_ksp_limit);
+
 	set_irq_regs(old_regs);
 }
 
@@ -681,7 +688,12 @@ void *hardirq_ctx[NR_CPUS] __read_mostly;
 
 void do_softirq_own_stack(void)
 {
-	call_do_softirq(softirq_ctx[smp_processor_id()]);
+	void *irqsp = softirq_ctx[smp_processor_id()];
+	unsigned long saved_ksp_limit = get_ksp_limit(current);
+
+	set_ksp_limit(current, (unsigned long)irqsp);
+	call_do_softirq(irqsp);
+	set_ksp_limit(current, saved_ksp_limit);
 }
 
 irq_hw_number_t virq_to_hw(unsigned int virq)
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index 82df4b09e79f..a5422f7782b3 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -33,23 +33,14 @@
 
 	.text
 
-/*
- * We store the saved ksp_limit in the unused part
- * of the STACK_FRAME_OVERHEAD
- */
 _GLOBAL(call_do_softirq)
 	mflr	r0
 	stw	r0,4(r1)
-	lwz	r10,THREAD+KSP_LIMIT(r2)
-	stw	r3, THREAD+KSP_LIMIT(r2)
 	stwu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r3)
 	mr	r1,r3
-	stw	r10,8(r1)
 	bl	__do_softirq
-	lwz	r10,8(r1)
 	lwz	r1,0(r1)
 	lwz	r0,4(r1)
-	stw	r10,THREAD+KSP_LIMIT(r2)
 	mtlr	r0
 	blr
 
@@ -59,16 +50,11 @@ _GLOBAL(call_do_softirq)
 _GLOBAL(call_do_irq)
 	mflr	r0
 	stw	r0,4(r1)
-	lwz	r10,THREAD+KSP_LIMIT(r2)
-	stw	r4, THREAD+KSP_LIMIT(r2)
 	stwu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r4)
 	mr	r1,r4
-	stw	r10,8(r1)
 	bl	__do_irq
-	lwz	r10,8(r1)
 	lwz	r1,0(r1)
 	lwz	r0,4(r1)
-	stw	r10,THREAD+KSP_LIMIT(r2)
 	mtlr	r0
 	blr
 
-- 
2.13.3

