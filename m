Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF5A1F98A8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 15:32:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lshJ4B04zDqYh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 23:32:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lrwY3CC2zDqPQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 22:58:03 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49lrwR2NKkz9v1fm;
 Mon, 15 Jun 2020 14:57:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id IlY2ZH6Ulfbe; Mon, 15 Jun 2020 14:57:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49lrwR1XZlz9v1fM;
 Mon, 15 Jun 2020 14:57:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 961138B792;
 Mon, 15 Jun 2020 14:57:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4D5CXE9zWnFa; Mon, 15 Jun 2020 14:57:59 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4317D8B75F;
 Mon, 15 Jun 2020 14:57:59 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3DDA165B0E; Mon, 15 Jun 2020 12:57:59 +0000 (UTC)
Message-Id: <341688399c1b102756046d19ea6ce39db1ae4742.1592225558.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1592225557.git.christophe.leroy@csgroup.eu>
References: <cover.1592225557.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 3/3] powerpc/8xx: Provide ptep_get() with 16k pages
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Will Deacon <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Date: Mon, 15 Jun 2020 12:57:59 +0000 (UTC)
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

READ_ONCE() now enforces atomic read, which leads to:

  CC      mm/gup.o
In file included from ./include/linux/kernel.h:11:0,
                 from mm/gup.c:2:
In function 'gup_hugepte.constprop',
    inlined from 'gup_huge_pd.isra.79' at mm/gup.c:2465:8:
./include/linux/compiler.h:392:38: error: call to '__compiletime_assert_222' declared with attribute error: Unsupported access size for {READ,WRITE}_ONCE().
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                      ^
./include/linux/compiler.h:373:4: note: in definition of macro '__compiletime_assert'
    prefix ## suffix();    \
    ^
./include/linux/compiler.h:392:2: note: in expansion of macro '_compiletime_assert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
  ^
./include/linux/compiler.h:405:2: note: in expansion of macro 'compiletime_assert'
  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
  ^
./include/linux/compiler.h:291:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
  compiletime_assert_rwonce_type(x);    \
  ^
mm/gup.c:2428:8: note: in expansion of macro 'READ_ONCE'
  pte = READ_ONCE(*ptep);
        ^
In function 'gup_get_pte',
    inlined from 'gup_pte_range' at mm/gup.c:2228:9,
    inlined from 'gup_pmd_range' at mm/gup.c:2613:15,
    inlined from 'gup_pud_range' at mm/gup.c:2641:15,
    inlined from 'gup_p4d_range' at mm/gup.c:2666:15,
    inlined from 'gup_pgd_range' at mm/gup.c:2694:15,
    inlined from 'internal_get_user_pages_fast' at mm/gup.c:2795:3:
./include/linux/compiler.h:392:38: error: call to '__compiletime_assert_219' declared with attribute error: Unsupported access size for {READ,WRITE}_ONCE().
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                      ^
./include/linux/compiler.h:373:4: note: in definition of macro '__compiletime_assert'
    prefix ## suffix();    \
    ^
./include/linux/compiler.h:392:2: note: in expansion of macro '_compiletime_assert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
  ^
./include/linux/compiler.h:405:2: note: in expansion of macro 'compiletime_assert'
  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
  ^
./include/linux/compiler.h:291:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
  compiletime_assert_rwonce_type(x);    \
  ^
mm/gup.c:2199:9: note: in expansion of macro 'READ_ONCE'
  return READ_ONCE(*ptep);
         ^
make[2]: *** [mm/gup.o] Error 1

Define ptep_get() on 8xx when using 16k pages.

Fixes: 2ab3a0a02905 ("READ_ONCE: Enforce atomicity for {READ,WRITE}_ONCE() memory accesses")
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index b56f14160ae5..77addb599ce7 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -286,6 +286,16 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 	return __pte(pte_update(mm, addr, ptep, ~0, 0, 0));
 }
 
+#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PPC_16K_PAGES)
+#define __HAVE_ARCH_PTEP_GET
+static inline pte_t ptep_get(pte_t *ptep)
+{
+	pte_t pte = {READ_ONCE(ptep->pte), 0, 0, 0};
+
+	return pte;
+}
+#endif
+
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
 static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 				      pte_t *ptep)
-- 
2.25.0

