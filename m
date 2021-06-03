Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2918399DCC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 11:30:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fwgc75PXzz3c8r
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 19:30:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwgZp00TRz308v
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 19:29:21 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FwgZW25FZzBCW2;
 Thu,  3 Jun 2021 11:29:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wxMEu_3Qm_fF; Thu,  3 Jun 2021 11:29:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FwgZV55bMzBCVY;
 Thu,  3 Jun 2021 11:29:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A59B8B849;
 Thu,  3 Jun 2021 11:29:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WQB8SC5HBjyM; Thu,  3 Jun 2021 11:29:06 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E5AB48B848;
 Thu,  3 Jun 2021 11:29:05 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C39636493B; Thu,  3 Jun 2021 09:29:05 +0000 (UTC)
Message-Id: <6fe2b88956db53f8d6ee221525b2c5dc6aec82c6.1622712515.git.christophe.leroy@csgroup.eu>
In-Reply-To: <4c54997edd3548fa54717915e7c6ebaf60f208c0.1622712515.git.christophe.leroy@csgroup.eu>
References: <4c54997edd3548fa54717915e7c6ebaf60f208c0.1622712515.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 4/6] powerpc/nohash: Remove DEBUG_MAP_CONSISTENCY
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  3 Jun 2021 09:29:05 +0000 (UTC)
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

mmu_context handling has been there for years, so we
would know if there was problems with maps.

DEBUG_MAP_CONSISTENCY is not user selectable, remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/nohash/mmu_context.c | 47 +---------------------------
 1 file changed, 1 insertion(+), 46 deletions(-)

diff --git a/arch/powerpc/mm/nohash/mmu_context.c b/arch/powerpc/mm/nohash/mmu_context.c
index 437940d191d6..78369580b9ff 100644
--- a/arch/powerpc/mm/nohash/mmu_context.c
+++ b/arch/powerpc/mm/nohash/mmu_context.c
@@ -21,7 +21,6 @@
  *     also clear mm->cpu_vm_mask bits when processes are migrated
  */
 
-//#define DEBUG_MAP_CONSISTENCY
 //#define DEBUG_CLAMP_LAST_CONTEXT   31
 //#define DEBUG_HARDER
 
@@ -180,9 +179,6 @@ static unsigned int steal_all_contexts(void)
 		if (id != FIRST_CONTEXT) {
 			context_mm[id] = NULL;
 			__clear_bit(id, context_map);
-#ifdef DEBUG_MAP_CONSISTENCY
-			mm->context.active = 0;
-#endif
 		}
 		if (IS_ENABLED(CONFIG_SMP))
 			__clear_bit(id, stale_map[cpu]);
@@ -224,37 +220,6 @@ static unsigned int steal_context_up(unsigned int id)
 	return id;
 }
 
-#ifdef DEBUG_MAP_CONSISTENCY
-static void context_check_map(void)
-{
-	unsigned int id, nrf, nact;
-
-	nrf = nact = 0;
-	for (id = FIRST_CONTEXT; id <= LAST_CONTEXT; id++) {
-		int used = test_bit(id, context_map);
-		if (!used)
-			nrf++;
-		if (used != (context_mm[id] != NULL))
-			pr_err("MMU: Context %d is %s and MM is %p !\n",
-			       id, used ? "used" : "free", context_mm[id]);
-		if (context_mm[id] != NULL)
-			nact += context_mm[id]->context.active;
-	}
-	if (nrf != nr_free_contexts) {
-		pr_err("MMU: Free context count out of sync ! (%d vs %d)\n",
-		       nr_free_contexts, nrf);
-		nr_free_contexts = nrf;
-	}
-	if (nact > num_online_cpus())
-		pr_err("MMU: More active contexts than CPUs ! (%d vs %d)\n",
-		       nact, num_online_cpus());
-	if (FIRST_CONTEXT > 0 && !test_bit(0, context_map))
-		pr_err("MMU: Context 0 has been freed !!!\n");
-}
-#else
-static void context_check_map(void) { }
-#endif
-
 static void set_context(unsigned long id, pgd_t *pgd)
 {
 	if (IS_ENABLED(CONFIG_PPC_8xx)) {
@@ -306,14 +271,8 @@ void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next,
 
 	/* If we already have a valid assigned context, skip all that */
 	id = next->context.id;
-	if (likely(id != MMU_NO_CONTEXT)) {
-#ifdef DEBUG_MAP_CONSISTENCY
-		if (context_mm[id] != next)
-			pr_err("MMU: mm 0x%p has id %d but context_mm[%d] says 0x%p\n",
-			       next, id, id, context_mm[id]);
-#endif
+	if (likely(id != MMU_NO_CONTEXT))
 		goto ctxt_ok;
-	}
 
 	/* We really don't have a context, let's try to acquire one */
 	id = next_context;
@@ -349,7 +308,6 @@ void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next,
 	next->context.id = id;
 	pr_hardcont(" | new id=%d,nrf=%d", id, nr_free_contexts);
 
-	context_check_map();
  ctxt_ok:
 
 	/* If that context got marked stale on this CPU, then flush the
@@ -418,9 +376,6 @@ void destroy_context(struct mm_struct *mm)
 	if (id != MMU_NO_CONTEXT) {
 		__clear_bit(id, context_map);
 		mm->context.id = MMU_NO_CONTEXT;
-#ifdef DEBUG_MAP_CONSISTENCY
-		mm->context.active = 0;
-#endif
 		context_mm[id] = NULL;
 		nr_free_contexts++;
 	}
-- 
2.25.0

