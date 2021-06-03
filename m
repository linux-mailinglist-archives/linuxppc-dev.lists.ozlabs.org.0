Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE7399DCA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 11:30:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fwgbn4t1Kz3c1l
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 19:30:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwgZj6FgWz307q
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 19:29:17 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FwgZV59BwzBCVx;
 Thu,  3 Jun 2021 11:29:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NSC25gnQe1Sv; Thu,  3 Jun 2021 11:29:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FwgZT20TtzBCVQ;
 Thu,  3 Jun 2021 11:29:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 37BF88B848;
 Thu,  3 Jun 2021 11:29:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cn5TX91H1r_H; Thu,  3 Jun 2021 11:29:05 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E02148B849;
 Thu,  3 Jun 2021 11:29:04 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BDBD06493B; Thu,  3 Jun 2021 09:29:04 +0000 (UTC)
Message-Id: <cc13b87b0f750a538621876ecc24c22a07e7c8be.1622712515.git.christophe.leroy@csgroup.eu>
In-Reply-To: <4c54997edd3548fa54717915e7c6ebaf60f208c0.1622712515.git.christophe.leroy@csgroup.eu>
References: <4c54997edd3548fa54717915e7c6ebaf60f208c0.1622712515.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 3/6] powerpc/nohash: Remove CONFIG_SMP #ifdefery in
 mmu_context.h
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  3 Jun 2021 09:29:04 +0000 (UTC)
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

Everything can be done even when CONFIG_SMP is not selected.

Just use IS_ENABLED() where relevant and rely on GCC to
opt out unneeded code and variables when CONFIG_SMP is not set.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/nohash/mmu_context.c | 66 ++++++++++------------------
 1 file changed, 24 insertions(+), 42 deletions(-)

diff --git a/arch/powerpc/mm/nohash/mmu_context.c b/arch/powerpc/mm/nohash/mmu_context.c
index 75dafec50d19..437940d191d6 100644
--- a/arch/powerpc/mm/nohash/mmu_context.c
+++ b/arch/powerpc/mm/nohash/mmu_context.c
@@ -47,6 +47,7 @@
 
 #include <asm/mmu_context.h>
 #include <asm/tlbflush.h>
+#include <asm/smp.h>
 
 #include <mm/mmu_decl.h>
 
@@ -86,9 +87,7 @@ void *abatron_pteptrs[2];
 
 static unsigned int next_context, nr_free_contexts;
 static unsigned long *context_map;
-#ifdef CONFIG_SMP
 static unsigned long *stale_map[NR_CPUS];
-#endif
 static struct mm_struct **context_mm;
 static DEFINE_RAW_SPINLOCK(context_lock);
 
@@ -111,7 +110,6 @@ static DEFINE_RAW_SPINLOCK(context_lock);
  * the stale map as we can just flush the local CPU
  *  -- benh
  */
-#ifdef CONFIG_SMP
 static unsigned int steal_context_smp(unsigned int id)
 {
 	struct mm_struct *mm;
@@ -164,14 +162,11 @@ static unsigned int steal_context_smp(unsigned int id)
 	/* This will cause the caller to try again */
 	return MMU_NO_CONTEXT;
 }
-#endif  /* CONFIG_SMP */
 
 static unsigned int steal_all_contexts(void)
 {
 	struct mm_struct *mm;
-#ifdef CONFIG_SMP
 	int cpu = smp_processor_id();
-#endif
 	unsigned int id;
 
 	for (id = FIRST_CONTEXT; id <= LAST_CONTEXT; id++) {
@@ -189,9 +184,8 @@ static unsigned int steal_all_contexts(void)
 			mm->context.active = 0;
 #endif
 		}
-#ifdef CONFIG_SMP
-		__clear_bit(id, stale_map[cpu]);
-#endif
+		if (IS_ENABLED(CONFIG_SMP))
+			__clear_bit(id, stale_map[cpu]);
 	}
 
 	/* Flush the TLB for all contexts (not to be used on SMP) */
@@ -210,9 +204,7 @@ static unsigned int steal_all_contexts(void)
 static unsigned int steal_context_up(unsigned int id)
 {
 	struct mm_struct *mm;
-#ifdef CONFIG_SMP
 	int cpu = smp_processor_id();
-#endif
 
 	/* Pick up the victim mm */
 	mm = context_mm[id];
@@ -226,9 +218,8 @@ static unsigned int steal_context_up(unsigned int id)
 	mm->context.id = MMU_NO_CONTEXT;
 
 	/* XXX This clear should ultimately be part of local_flush_tlb_mm */
-#ifdef CONFIG_SMP
-	__clear_bit(id, stale_map[cpu]);
-#endif
+	if (IS_ENABLED(CONFIG_SMP))
+		__clear_bit(id, stale_map[cpu]);
 
 	return id;
 }
@@ -292,9 +283,7 @@ void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next,
 			struct task_struct *tsk)
 {
 	unsigned int id;
-#ifdef CONFIG_SMP
 	unsigned int i, cpu = smp_processor_id();
-#endif
 	unsigned long *map;
 
 	/* No lockless fast path .. yet */
@@ -303,17 +292,17 @@ void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next,
 	pr_hard("[%d] activating context for mm @%p, active=%d, id=%d",
 		cpu, next, next->context.active, next->context.id);
 
-#ifdef CONFIG_SMP
-	/* Mark us active and the previous one not anymore */
-	next->context.active++;
-	if (prev) {
-		pr_hardcont(" (old=0x%p a=%d)", prev, prev->context.active);
-		WARN_ON(prev->context.active < 1);
-		prev->context.active--;
+	if (IS_ENABLED(CONFIG_SMP)) {
+		/* Mark us active and the previous one not anymore */
+		next->context.active++;
+		if (prev) {
+			pr_hardcont(" (old=0x%p a=%d)", prev, prev->context.active);
+			WARN_ON(prev->context.active < 1);
+			prev->context.active--;
+		}
 	}
 
  again:
-#endif /* CONFIG_SMP */
 
 	/* If we already have a valid assigned context, skip all that */
 	id = next->context.id;
@@ -334,14 +323,12 @@ void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next,
 
 	/* No more free contexts, let's try to steal one */
 	if (nr_free_contexts == 0) {
-#ifdef CONFIG_SMP
 		if (num_online_cpus() > 1) {
 			id = steal_context_smp(id);
 			if (id == MMU_NO_CONTEXT)
 				goto again;
 			goto stolen;
 		}
-#endif /* CONFIG_SMP */
 		if (IS_ENABLED(CONFIG_PPC_8xx))
 			id = steal_all_contexts();
 		else
@@ -368,8 +355,7 @@ void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next,
 	/* If that context got marked stale on this CPU, then flush the
 	 * local TLB for it and unmark it before we use it
 	 */
-#ifdef CONFIG_SMP
-	if (test_bit(id, stale_map[cpu])) {
+	if (IS_ENABLED(CONFIG_SMP) && test_bit(id, stale_map[cpu])) {
 		pr_hardcont(" | stale flush %d [%d..%d]",
 			    id, cpu_first_thread_sibling(cpu),
 			    cpu_last_thread_sibling(cpu));
@@ -383,7 +369,6 @@ void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next,
 				__clear_bit(id, stale_map[i]);
 		}
 	}
-#endif
 
 	/* Flick the MMU and release lock */
 	pr_hardcont(" -> %d\n", id);
@@ -442,7 +427,6 @@ void destroy_context(struct mm_struct *mm)
 	raw_spin_unlock_irqrestore(&context_lock, flags);
 }
 
-#ifdef CONFIG_SMP
 static int mmu_ctx_cpu_prepare(unsigned int cpu)
 {
 	/* We don't touch CPU 0 map, it's allocated at aboot and kept
@@ -472,8 +456,6 @@ static int mmu_ctx_cpu_dead(unsigned int cpu)
 	return 0;
 }
 
-#endif /* CONFIG_SMP */
-
 /*
  * Initialize the context management stuff.
  */
@@ -497,16 +479,16 @@ void __init mmu_context_init(void)
 	if (!context_mm)
 		panic("%s: Failed to allocate %zu bytes\n", __func__,
 		      sizeof(void *) * (LAST_CONTEXT + 1));
-#ifdef CONFIG_SMP
-	stale_map[boot_cpuid] = memblock_alloc(CTX_MAP_SIZE, SMP_CACHE_BYTES);
-	if (!stale_map[boot_cpuid])
-		panic("%s: Failed to allocate %zu bytes\n", __func__,
-		      CTX_MAP_SIZE);
-
-	cpuhp_setup_state_nocalls(CPUHP_POWERPC_MMU_CTX_PREPARE,
-				  "powerpc/mmu/ctx:prepare",
-				  mmu_ctx_cpu_prepare, mmu_ctx_cpu_dead);
-#endif
+	if (IS_ENABLED(CONFIG_SMP)) {
+		stale_map[boot_cpuid] = memblock_alloc(CTX_MAP_SIZE, SMP_CACHE_BYTES);
+		if (!stale_map[boot_cpuid])
+			panic("%s: Failed to allocate %zu bytes\n", __func__,
+			      CTX_MAP_SIZE);
+
+		cpuhp_setup_state_nocalls(CPUHP_POWERPC_MMU_CTX_PREPARE,
+					  "powerpc/mmu/ctx:prepare",
+					  mmu_ctx_cpu_prepare, mmu_ctx_cpu_dead);
+	}
 
 	printk(KERN_INFO
 	       "MMU: Allocated %zu bytes of context maps for %d contexts\n",
-- 
2.25.0

