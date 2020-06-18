Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D15471FF157
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 14:11:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nglR1xrrzDr3V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 22:11:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nggH4GTjzDr37
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 22:07:51 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49ngg51Nfpz9ty2M;
 Thu, 18 Jun 2020 14:07:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id weV8YGAlCQNx; Thu, 18 Jun 2020 14:07:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49ngg46vb0z9ty2L;
 Thu, 18 Jun 2020 14:07:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B53888B844;
 Thu, 18 Jun 2020 14:07:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id G-wrZjpdqkPL; Thu, 18 Jun 2020 14:07:46 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [10.25.210.22])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 833A48B843;
 Thu, 18 Jun 2020 14:07:46 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4FF8D65AC9; Thu, 18 Jun 2020 12:07:46 +0000 (UTC)
Message-Id: <9f2df6621fcaf9eba15fadc61c169d0c8e2fb849.1592481938.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/8xx: Modify ptep_get()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Date: Thu, 18 Jun 2020 12:07:46 +0000 (UTC)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move ptep_get() close to pte_update(), in an ifdef section already
dedicated to powerpc 8xx. This section contains explanation about
the layout of page table entries.

Also modify it to return 4 times the pte value instead of padding
with zeroes.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h | 22 +++++++++++---------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index b0afbdd07740..b9e134d0f03a 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -249,6 +249,18 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
 
 	return old;
 }
+
+#ifdef CONFIG_PPC_16K_PAGES
+#define __HAVE_ARCH_PTEP_GET
+static inline pte_t ptep_get(pte_t *ptep)
+{
+	pte_basic_t val = READ_ONCE(ptep->pte);
+	pte_t pte = {val, val, val, val};
+
+	return pte;
+}
+#endif /* CONFIG_PPC_16K_PAGES */
+
 #else
 static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, pte_t *p,
 				     unsigned long clr, unsigned long set, int huge)
@@ -284,16 +296,6 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 	return __pte(pte_update(mm, addr, ptep, ~0, 0, 0));
 }
 
-#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PPC_16K_PAGES)
-#define __HAVE_ARCH_PTEP_GET
-static inline pte_t ptep_get(pte_t *ptep)
-{
-	pte_t pte = {READ_ONCE(ptep->pte), 0, 0, 0};
-
-	return pte;
-}
-#endif
-
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
 static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 				      pte_t *ptep)
-- 
2.25.0

