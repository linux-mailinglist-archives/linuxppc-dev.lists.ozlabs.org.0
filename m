Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C30BA129868
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2019 16:44:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hNtw5vCxzDqHl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 02:44:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="p/lJ6slh"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hNVQ2KR6zDqM5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 02:26:22 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47hNVG0qbvz9vK00;
 Mon, 23 Dec 2019 16:26:14 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=p/lJ6slh; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id XkJv_v2azCC5; Mon, 23 Dec 2019 16:26:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47hNVF6vjQz9vJyp;
 Mon, 23 Dec 2019 16:26:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1577114774; bh=FCKhahnB2DcGBLIsfEPWwuR4+4T2VbdbTyFb5L+i344=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=p/lJ6slhl5G1wz9T1C2GCTbpFWzQaz091UqU3lib2ahPzDBLE0PBamXCso5OIRMFm
 irMdtJhn8w5pwZxl0IMXrg7yNRjO8A+Krjs66QU24fwnpBw7hOBdQuUHUb7qNCA/ba
 WEJCfDAlZJsNTdnzQDaKPI+y8nQPKJCAuJMBAoDU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2585B8B7AB;
 Mon, 23 Dec 2019 16:26:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VtsEhvNyVv-W; Mon, 23 Dec 2019 16:26:19 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0295E8B7A1;
 Mon, 23 Dec 2019 16:26:19 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0C59D637D8; Mon, 23 Dec 2019 15:26:19 +0000 (UTC)
Message-Id: <64e40c302d81b17e567d57fa2cb3b6a7f96271f2.1577114567.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1577114567.git.christophe.leroy@c-s.fr>
References: <cover.1577114567.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH 8/8] powerpc/irq: drop softirq stack
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 23 Dec 2019 15:26:19 +0000 (UTC)
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

There are two IRQ stacks: softirq_ctx and hardirq_ctx

do_softirq_own_stack() switches stack to softirq_ctx
do_IRQ() switches stack to hardirq_ctx

However, when soft and hard IRQs are nested, only one of the two
stacks is used:
- When on softirq stack, do_IRQ() doesn't switch to hardirq stack.
- irq_exit() runs softirqs on hardirq stack.

There is no added value in having two IRQ stacks as only one is
used when hard and soft irqs are nested. Remove softirq_ctx and
use hardirq_ctx for both hard and soft IRQs.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/irq.h | 1 -
 arch/powerpc/kernel/irq.c      | 8 +++-----
 arch/powerpc/kernel/process.c  | 4 ----
 arch/powerpc/kernel/setup_32.c | 4 +---
 arch/powerpc/kernel/setup_64.c | 4 +---
 5 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
index e4a92f0b4ad4..7cb2c76aa3ed 100644
--- a/arch/powerpc/include/asm/irq.h
+++ b/arch/powerpc/include/asm/irq.h
@@ -54,7 +54,6 @@ extern void *mcheckirq_ctx[NR_CPUS];
  * Per-cpu stacks for handling hard and soft interrupts.
  */
 extern void *hardirq_ctx[NR_CPUS];
-extern void *softirq_ctx[NR_CPUS];
 
 #ifdef CONFIG_PPC64
 void call_do_softirq(void *sp);
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index a1122ef4a16c..3af0d1897354 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -680,15 +680,14 @@ void __do_irq(struct pt_regs *regs)
 
 void do_IRQ(struct pt_regs *regs)
 {
-	void *cursp, *irqsp, *sirqsp;
+	void *cursp, *irqsp;
 
 	/* Switch to the irq stack to handle this */
 	cursp = (void *)(stack_pointer() & ~(THREAD_SIZE - 1));
 	irqsp = hardirq_ctx[raw_smp_processor_id()];
-	sirqsp = softirq_ctx[raw_smp_processor_id()];
 
 	/* Already there ? Otherwise switch stack and call */
-	if (unlikely(cursp == irqsp || cursp == sirqsp))
+	if (unlikely(cursp == irqsp))
 		__do_irq(regs);
 	else
 		call_do_irq(regs, irqsp);
@@ -706,12 +705,11 @@ void    *dbgirq_ctx[NR_CPUS] __read_mostly;
 void *mcheckirq_ctx[NR_CPUS] __read_mostly;
 #endif
 
-void *softirq_ctx[NR_CPUS] __read_mostly;
 void *hardirq_ctx[NR_CPUS] __read_mostly;
 
 void do_softirq_own_stack(void)
 {
-	call_do_softirq(softirq_ctx[smp_processor_id()]);
+	call_do_softirq(hardirq_ctx[smp_processor_id()]);
 }
 
 irq_hw_number_t virq_to_hw(unsigned int virq)
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 49d0ebf28ab9..be3e64cf28b4 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1963,10 +1963,6 @@ static inline int valid_irq_stack(unsigned long sp, struct task_struct *p,
 	if (sp >= stack_page && sp <= stack_page + THREAD_SIZE - nbytes)
 		return 1;
 
-	stack_page = (unsigned long)softirq_ctx[cpu];
-	if (sp >= stack_page && sp <= stack_page + THREAD_SIZE - nbytes)
-		return 1;
-
 	return 0;
 }
 
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index dcffe927f5b9..8752aae06177 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -155,10 +155,8 @@ void __init irqstack_early_init(void)
 
 	/* interrupt stacks must be in lowmem, we get that for free on ppc32
 	 * as the memblock is limited to lowmem by default */
-	for_each_possible_cpu(i) {
-		softirq_ctx[i] = alloc_stack();
+	for_each_possible_cpu(i)
 		hardirq_ctx[i] = alloc_stack();
-	}
 }
 
 #if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 6104917a282d..96ee7627eda6 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -652,10 +652,8 @@ void __init irqstack_early_init(void)
 	 * cannot afford to take SLB misses on them. They are not
 	 * accessed in realmode.
 	 */
-	for_each_possible_cpu(i) {
-		softirq_ctx[i] = alloc_stack(limit, i);
+	for_each_possible_cpu(i)
 		hardirq_ctx[i] = alloc_stack(limit, i);
-	}
 }
 
 #ifdef CONFIG_PPC_BOOK3E
-- 
2.13.3

