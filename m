Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BAB399DCF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 11:31:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fwgcr6bXBz3cTk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 19:31:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwgZx3Kr8z300C
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 19:29:29 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FwgZY1n27zBCW7;
 Thu,  3 Jun 2021 11:29:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u1vUvj-3ih22; Thu,  3 Jun 2021 11:29:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FwgZX4KxCzBCVQ;
 Thu,  3 Jun 2021 11:29:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 519708B849;
 Thu,  3 Jun 2021 11:29:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NZ9C6Wng-c58; Thu,  3 Jun 2021 11:29:08 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0366D8B848;
 Thu,  3 Jun 2021 11:29:08 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id D3C616493B; Thu,  3 Jun 2021 09:29:07 +0000 (UTC)
Message-Id: <0f25109b0e12fdd1e6541dedbb2212cc53526a57.1622712515.git.christophe.leroy@csgroup.eu>
In-Reply-To: <4c54997edd3548fa54717915e7c6ebaf60f208c0.1622712515.git.christophe.leroy@csgroup.eu>
References: <4c54997edd3548fa54717915e7c6ebaf60f208c0.1622712515.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 6/6] powerpc/nohash: Remove DEBUG_HARDER
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  3 Jun 2021 09:29:07 +0000 (UTC)
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

DEBUG_HARDER is not user selectable.

Remove it together with related messages.

Also remove two pr_devel() messages that should
likely have been pr_hard().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/nohash/mmu_context.c | 32 ----------------------------
 1 file changed, 32 deletions(-)

diff --git a/arch/powerpc/mm/nohash/mmu_context.c b/arch/powerpc/mm/nohash/mmu_context.c
index d9f590b9e636..920b5b8c770d 100644
--- a/arch/powerpc/mm/nohash/mmu_context.c
+++ b/arch/powerpc/mm/nohash/mmu_context.c
@@ -21,19 +21,6 @@
  *     also clear mm->cpu_vm_mask bits when processes are migrated
  */
 
-//#define DEBUG_HARDER
-
-/* We don't use DEBUG because it tends to be compiled in always nowadays
- * and this would generate way too much output
- */
-#ifdef DEBUG_HARDER
-#define pr_hard(args...)	printk(KERN_DEBUG args)
-#define pr_hardcont(args...)	printk(KERN_CONT args)
-#else
-#define pr_hard(args...)	do { } while(0)
-#define pr_hardcont(args...)	do { } while(0)
-#endif
-
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/init.h>
@@ -127,7 +114,6 @@ static unsigned int steal_context_smp(unsigned int id)
 				id = FIRST_CONTEXT;
 			continue;
 		}
-		pr_hardcont(" | steal %d from 0x%p", id, mm);
 
 		/* Mark this mm has having no context anymore */
 		mm->context.id = MMU_NO_CONTEXT;
@@ -169,8 +155,6 @@ static unsigned int steal_all_contexts(void)
 		/* Pick up the victim mm */
 		mm = context_mm[id];
 
-		pr_hardcont(" | steal %d from 0x%p", id, mm);
-
 		/* Mark this mm as having no context anymore */
 		mm->context.id = MMU_NO_CONTEXT;
 		if (id != FIRST_CONTEXT) {
@@ -202,8 +186,6 @@ static unsigned int steal_context_up(unsigned int id)
 	/* Pick up the victim mm */
 	mm = context_mm[id];
 
-	pr_hardcont(" | steal %d from 0x%p", id, mm);
-
 	/* Flush the TLB for that context */
 	local_flush_tlb_mm(mm);
 
@@ -251,14 +233,10 @@ void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next,
 	/* No lockless fast path .. yet */
 	raw_spin_lock(&context_lock);
 
-	pr_hard("[%d] activating context for mm @%p, active=%d, id=%d",
-		cpu, next, next->context.active, next->context.id);
-
 	if (IS_ENABLED(CONFIG_SMP)) {
 		/* Mark us active and the previous one not anymore */
 		next->context.active++;
 		if (prev) {
-			pr_hardcont(" (old=0x%p a=%d)", prev, prev->context.active);
 			WARN_ON(prev->context.active < 1);
 			prev->context.active--;
 		}
@@ -303,7 +281,6 @@ void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next,
 	next_context = id + 1;
 	context_mm[id] = next;
 	next->context.id = id;
-	pr_hardcont(" | new id=%d,nrf=%d", id, nr_free_contexts);
 
  ctxt_ok:
 
@@ -311,10 +288,6 @@ void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next,
 	 * local TLB for it and unmark it before we use it
 	 */
 	if (IS_ENABLED(CONFIG_SMP) && test_bit(id, stale_map[cpu])) {
-		pr_hardcont(" | stale flush %d [%d..%d]",
-			    id, cpu_first_thread_sibling(cpu),
-			    cpu_last_thread_sibling(cpu));
-
 		local_flush_tlb_mm(next);
 
 		/* XXX This clear should ultimately be part of local_flush_tlb_mm */
@@ -326,7 +299,6 @@ void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next,
 	}
 
 	/* Flick the MMU and release lock */
-	pr_hardcont(" -> %d\n", id);
 	if (IS_ENABLED(CONFIG_BDI_SWITCH))
 		abatron_pteptrs[1] = next->pgd;
 	set_context(id, next->pgd);
@@ -338,8 +310,6 @@ void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next,
  */
 int init_new_context(struct task_struct *t, struct mm_struct *mm)
 {
-	pr_hard("initing context for mm @%p\n", mm);
-
 	/*
 	 * We have MMU_NO_CONTEXT set to be ~0. Hence check
 	 * explicitly against context.id == 0. This ensures that we properly
@@ -387,7 +357,6 @@ static int mmu_ctx_cpu_prepare(unsigned int cpu)
 	if (cpu == boot_cpuid)
 		return 0;
 
-	pr_devel("MMU: Allocating stale context map for CPU %d\n", cpu);
 	stale_map[cpu] = kzalloc(CTX_MAP_SIZE, GFP_KERNEL);
 	return 0;
 }
@@ -398,7 +367,6 @@ static int mmu_ctx_cpu_dead(unsigned int cpu)
 	if (cpu == boot_cpuid)
 		return 0;
 
-	pr_devel("MMU: Freeing stale context map for CPU %d\n", cpu);
 	kfree(stale_map[cpu]);
 	stale_map[cpu] = NULL;
 
-- 
2.25.0

