Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C8856A54D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 16:23:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdzDN1Zg4z3cFY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 00:23:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdzCx65krz3bt4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 00:23:23 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LdzCq6PM7z9tGf;
	Thu,  7 Jul 2022 16:23:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g8uEF7phv1fN; Thu,  7 Jul 2022 16:23:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LdzCq5XRRz9tGb;
	Thu,  7 Jul 2022 16:23:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AE4DF8B79F;
	Thu,  7 Jul 2022 16:23:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 3zsjNxXH00Jn; Thu,  7 Jul 2022 16:23:19 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.174])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 724EC8B768;
	Thu,  7 Jul 2022 16:23:19 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 267ENB1a537062
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 7 Jul 2022 16:23:11 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 267EN9WS537057;
	Thu, 7 Jul 2022 16:23:09 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] powerpc: Merge hardirq stack and softirq stack
Date: Thu,  7 Jul 2022 16:23:03 +0200
Message-Id: <6cd9d8bb2258d8b51999c2584eac74423d2b5e29.1657203774.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657203782; l=4880; s=20211009; h=from:subject:message-id; bh=BlBLt+cQJWmMavBMTU04gXXdsfd8eXA2BvSu7Z4YQ1c=; b=suEKQCrDr+Ise3R6cNF3nFYCedGfHliqGLwzAscPZZPspWGG+pNOcDpSD1TSgusC5qBWEZjJ/Ebd rIUUMdAjAsD7w/fCuSMWKx1n1RnyHhBc/sOHJl/M48x7xznZEHTD
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__do_IRQ() doesn't switch on hardirq stack if we are on softirq stack.

do_softirq() bail out early without doing anything when already in
an interrupt.

invoke_softirq() is on task_stack when it calls do_softirq_own_stack().

So there are neither situation where we switch from hardirq stack to
softirq stack nor from softirq stack to hardirq stack.

It is therefore not necessary to have two stacks because they are
never used at the same time.

Merge both stacks into a new one called normirq_ctx.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/irq.h |  3 +--
 arch/powerpc/kernel/irq.c      | 18 +++++++-----------
 arch/powerpc/kernel/process.c  |  6 +-----
 arch/powerpc/kernel/setup_32.c |  6 ++----
 arch/powerpc/kernel/setup_64.c |  6 ++----
 5 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
index 5c1516a5ba8f..137909a6e0c1 100644
--- a/arch/powerpc/include/asm/irq.h
+++ b/arch/powerpc/include/asm/irq.h
@@ -49,8 +49,7 @@ extern void *mcheckirq_ctx[NR_CPUS];
 /*
  * Per-cpu stacks for handling hard and soft interrupts.
  */
-extern void *hardirq_ctx[NR_CPUS];
-extern void *softirq_ctx[NR_CPUS];
+extern void *normirq_ctx[NR_CPUS];
 
 void __do_IRQ(struct pt_regs *regs);
 extern void __init init_IRQ(void);
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index d50a18888bd9..0ac0e7ddf8ac 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -274,15 +274,14 @@ static __always_inline void call_do_irq(struct pt_regs *regs, void *sp)
 void __do_IRQ(struct pt_regs *regs)
 {
 	struct pt_regs *old_regs = set_irq_regs(regs);
-	void *cursp, *irqsp, *sirqsp;
+	void *cursp, *irqsp;
 
 	/* Switch to the irq stack to handle this */
 	cursp = (void *)(current_stack_pointer & ~(THREAD_SIZE - 1));
-	irqsp = hardirq_ctx[raw_smp_processor_id()];
-	sirqsp = softirq_ctx[raw_smp_processor_id()];
+	irqsp = normirq_ctx[raw_smp_processor_id()];
 
 	/* Already there ? If not switch stack and call */
-	if (unlikely(cursp == irqsp || cursp == sirqsp))
+	if (unlikely(cursp == irqsp))
 		__do_irq(regs, current_stack_pointer);
 	else
 		call_do_irq(regs, irqsp);
@@ -305,10 +304,8 @@ static void __init vmap_irqstack_init(void)
 {
 	int i;
 
-	for_each_possible_cpu(i) {
-		softirq_ctx[i] = alloc_vm_stack();
-		hardirq_ctx[i] = alloc_vm_stack();
-	}
+	for_each_possible_cpu(i)
+		normirq_ctx[i] = alloc_vm_stack();
 }
 
 
@@ -330,12 +327,11 @@ void    *dbgirq_ctx[NR_CPUS] __read_mostly;
 void *mcheckirq_ctx[NR_CPUS] __read_mostly;
 #endif
 
-void *softirq_ctx[NR_CPUS] __read_mostly;
-void *hardirq_ctx[NR_CPUS] __read_mostly;
+void *normirq_ctx[NR_CPUS] __read_mostly;
 
 void do_softirq_own_stack(void)
 {
-	call_do_softirq(softirq_ctx[smp_processor_id()]);
+	call_do_softirq(normirq_ctx[smp_processor_id()]);
 }
 
 irq_hw_number_t virq_to_hw(unsigned int virq)
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 0fbda89cd1bb..c17c974e5723 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -2089,11 +2089,7 @@ static inline int valid_irq_stack(unsigned long sp, struct task_struct *p,
 	unsigned long stack_page;
 	unsigned long cpu = task_cpu(p);
 
-	stack_page = (unsigned long)hardirq_ctx[cpu];
-	if (sp >= stack_page && sp <= stack_page + THREAD_SIZE - nbytes)
-		return 1;
-
-	stack_page = (unsigned long)softirq_ctx[cpu];
+	stack_page = (unsigned long)normirq_ctx[cpu];
 	if (sp >= stack_page && sp <= stack_page + THREAD_SIZE - nbytes)
 		return 1;
 
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index 813261789303..cad0e4fbdd4b 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -158,10 +158,8 @@ void __init irqstack_early_init(void)
 
 	/* interrupt stacks must be in lowmem, we get that for free on ppc32
 	 * as the memblock is limited to lowmem by default */
-	for_each_possible_cpu(i) {
-		softirq_ctx[i] = alloc_stack();
-		hardirq_ctx[i] = alloc_stack();
-	}
+	for_each_possible_cpu(i)
+		normirq_ctx[i] = alloc_stack();
 }
 
 #ifdef CONFIG_VMAP_STACK
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 2b2d0b0fbb30..2fe727e01937 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -717,10 +717,8 @@ void __init irqstack_early_init(void)
 	 * cannot afford to take SLB misses on them. They are not
 	 * accessed in realmode.
 	 */
-	for_each_possible_cpu(i) {
-		softirq_ctx[i] = alloc_stack(limit, i);
-		hardirq_ctx[i] = alloc_stack(limit, i);
-	}
+	for_each_possible_cpu(i)
+		normirq_ctx[i] = alloc_stack(limit, i);
 }
 
 #ifdef CONFIG_PPC_BOOK3E
-- 
2.36.1

