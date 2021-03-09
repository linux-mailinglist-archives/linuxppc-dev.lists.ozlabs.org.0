Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45740332504
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 13:13:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvvHS23wmz3fGh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 23:13:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvvCR1WWBz3cQc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 23:09:39 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DvvCL2lv3z9tyjG;
 Tue,  9 Mar 2021 13:09:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Zs09QRLurLaM; Tue,  9 Mar 2021 13:09:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DvvCL205nz9tyjF;
 Tue,  9 Mar 2021 13:09:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8CDE18B7FC;
 Tue,  9 Mar 2021 13:09:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id CzX61RGB4lFf; Tue,  9 Mar 2021 13:09:35 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 167908B800;
 Tue,  9 Mar 2021 13:09:35 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id EF96C67555; Tue,  9 Mar 2021 12:09:34 +0000 (UTC)
Message-Id: <386f4f6f0160ad5d822dc0737d2de629210c512b.1615291472.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615291471.git.christophe.leroy@csgroup.eu>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 09/43] powerpc/32: Reconcile interrupts in C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Mar 2021 12:09:34 +0000 (UTC)
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

There is no need for this to be in asm anymore,
use the new interrupt entry wrapper.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/interrupt.h |  4 ++
 arch/powerpc/kernel/entry_32.S       | 58 ----------------------------
 2 files changed, 4 insertions(+), 58 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 232a4847f596..b2f69e5dcb50 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -29,6 +29,10 @@ static inline void booke_restore_dbcr0(void)
 
 static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
+#ifdef CONFIG_PPC32
+	if (!arch_irq_disabled_regs(regs))
+		trace_hardirqs_off();
+#endif
 	/*
 	 * Book3E reconciles irq soft mask in asm
 	 */
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 535c55f4393a..0f18fe14649c 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -202,22 +202,6 @@ transfer_to_handler_cont:
 	lwz	r9,4(r9)		/* where to go when done */
 #if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
 	mtspr	SPRN_NRI, r0
-#endif
-#ifdef CONFIG_TRACE_IRQFLAGS
-	/*
-	 * When tracing IRQ state (lockdep) we enable the MMU before we call
-	 * the IRQ tracing functions as they might access vmalloc space or
-	 * perform IOs for console output.
-	 *
-	 * To speed up the syscall path where interrupts stay on, let's check
-	 * first if we are changing the MSR value at all.
-	 */
-	tophys_novmstack r12, r1
-	lwz	r12,_MSR(r12)
-	andi.	r12,r12,MSR_EE
-	bne	1f
-
-	/* MSR isn't changing, just transition directly */
 #endif
 	mtspr	SPRN_SRR0,r11
 	mtspr	SPRN_SRR1,r10
@@ -244,48 +228,6 @@ transfer_to_handler_cont:
 _ASM_NOKPROBE_SYMBOL(transfer_to_handler)
 _ASM_NOKPROBE_SYMBOL(transfer_to_handler_cont)
 
-#ifdef CONFIG_TRACE_IRQFLAGS
-1:	/* MSR is changing, re-enable MMU so we can notify lockdep. We need to
-	 * keep interrupts disabled at this point otherwise we might risk
-	 * taking an interrupt before we tell lockdep they are enabled.
-	 */
-	lis	r12,reenable_mmu@h
-	ori	r12,r12,reenable_mmu@l
-	LOAD_REG_IMMEDIATE(r0, MSR_KERNEL)
-	mtspr	SPRN_SRR0,r12
-	mtspr	SPRN_SRR1,r0
-	rfi
-#ifdef CONFIG_40x
-	b .	/* Prevent prefetch past rfi */
-#endif
-
-reenable_mmu:
-	/*
-	 * We save a bunch of GPRs,
-	 * r3 can be different from GPR3(r1) at this point, r9 and r11
-	 * contains the old MSR and handler address respectively,
-	 * r0, r4-r8, r12, CCR, CTR, XER etc... are left
-	 * clobbered as they aren't useful past this point.
-	 */
-
-	stwu	r1,-32(r1)
-	stw	r9,8(r1)
-	stw	r11,12(r1)
-	stw	r3,16(r1)
-
-	/* If we are disabling interrupts (normal case), simply log it with
-	 * lockdep
-	 */
-1:	bl	trace_hardirqs_off
-	lwz	r3,16(r1)
-	lwz	r11,12(r1)
-	lwz	r9,8(r1)
-	addi	r1,r1,32
-	mtctr	r11
-	mtlr	r9
-	bctr				/* jump to handler */
-#endif /* CONFIG_TRACE_IRQFLAGS */
-
 #ifndef CONFIG_VMAP_STACK
 /*
  * On kernel stack overflow, load up an initial stack pointer
-- 
2.25.0

