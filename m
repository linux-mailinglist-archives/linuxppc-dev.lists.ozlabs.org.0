Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B94041CD98E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 14:22:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LKp56m7kzDqKH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 22:22:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LJXC5L9BzDqg5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 21:25:47 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49LJX20v6gz9ty3j;
 Mon, 11 May 2020 13:25:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NqNxRUCBBwBn; Mon, 11 May 2020 13:25:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49LJX2054Fz9ty3g;
 Mon, 11 May 2020 13:25:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AFE2B8B7AE;
 Mon, 11 May 2020 13:25:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6q_Lt9UBIjVo; Mon, 11 May 2020 13:25:44 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FFEC8B7AD;
 Mon, 11 May 2020 13:25:44 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 60FBE65A09; Mon, 11 May 2020 11:25:44 +0000 (UTC)
Message-Id: <bdafc1ecebbf47df0289e5433e5dc060555d0228.1589196133.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1589196133.git.christophe.leroy@csgroup.eu>
References: <cover.1589196133.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 18/45] powerpc/mm: Refactor pte_update() on nohash/32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 11 May 2020 11:25:44 +0000 (UTC)
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

When CONFIG_PTE_64BIT is set, pte_update() operates on
'unsigned long long'
When CONFIG_PTE_64BIT is not set, pte_update() operates on
'unsigned long'

In asm/page.h, we have pte_basic_t which is 'unsigned long long'
when CONFIG_PTE_64BIT is set and 'unsigned long' otherwise.

Refactor pte_update() using pte_basic_t.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h | 26 +++-----------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 523c4c3876c5..9eaf386a747b 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -222,12 +222,9 @@ static inline void pmd_clear(pmd_t *pmdp)
  * to properly flush the virtually tagged instruction cache of
  * those implementations.
  */
-#ifndef CONFIG_PTE_64BIT
-static inline unsigned long pte_update(pte_t *p,
-				       unsigned long clr,
-				       unsigned long set)
+static inline pte_basic_t pte_update(pte_t *p, unsigned long clr, unsigned long set)
 {
-#ifdef PTE_ATOMIC_UPDATES
+#if defined(PTE_ATOMIC_UPDATES) && !defined(CONFIG_PTE_64BIT)
 	unsigned long old, tmp;
 
 	__asm__ __volatile__("\
@@ -241,8 +238,8 @@ static inline unsigned long pte_update(pte_t *p,
 	: "r" (p), "r" (clr), "r" (set), "m" (*p)
 	: "cc" );
 #else /* PTE_ATOMIC_UPDATES */
-	unsigned long old = pte_val(*p);
-	unsigned long new = (old & ~clr) | set;
+	pte_basic_t old = pte_val(*p);
+	pte_basic_t new = (old & ~(pte_basic_t)clr) | set;
 
 #if defined(CONFIG_PPC_8xx) && defined(CONFIG_PPC_16K_PAGES)
 	p->pte = p->pte1 = p->pte2 = p->pte3 = new;
@@ -257,21 +254,6 @@ static inline unsigned long pte_update(pte_t *p,
 #endif
 	return old;
 }
-#else /* CONFIG_PTE_64BIT */
-static inline unsigned long long pte_update(pte_t *p,
-					    unsigned long clr,
-					    unsigned long set)
-{
-	unsigned long long old = pte_val(*p);
-	*p = __pte((old & ~(unsigned long long)clr) | set);
-
-#ifdef CONFIG_44x
-	if ((old & _PAGE_USER) && (old & _PAGE_EXEC))
-		icache_44x_need_flush = 1;
-#endif
-	return old;
-}
-#endif /* CONFIG_PTE_64BIT */
 
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 static inline int __ptep_test_and_clear_young(unsigned int context, unsigned long addr, pte_t *ptep)
-- 
2.25.0

