Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8AD3605C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 11:32:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLYys3sW2z30DG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 19:32:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLYyY07TXz2yxY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 19:32:00 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FLYyN3yNnz9tyJB;
 Thu, 15 Apr 2021 11:31:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jYLUuz7htGs8; Thu, 15 Apr 2021 11:31:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FLYyN32rjz9tyHy;
 Thu, 15 Apr 2021 11:31:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 879A98B7F5;
 Thu, 15 Apr 2021 11:31:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AeQRkRJL5mAJ; Thu, 15 Apr 2021 11:31:57 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 374FA8B7F3;
 Thu, 15 Apr 2021 11:31:57 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id ED028679F6; Thu, 15 Apr 2021 09:31:56 +0000 (UTC)
Message-Id: <912b349e2bcaa88939904815ca0af945740c6bd4.1618478922.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] mm: ptdump: Fix build failure
To: Andrew Morton <akpm@linux-foundation.org>,
 Steven Price <steven.price@arm.com>
Date: Thu, 15 Apr 2021 09:31:56 +0000 (UTC)
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

	  CC      mm/ptdump.o
	In file included from <command-line>:
	mm/ptdump.c: In function 'ptdump_pte_entry':
	././include/linux/compiler_types.h:320:38: error: call to '__compiletime_assert_207' declared with attribute error: Unsupported access size for {READ,WRITE}_ONCE().
	  320 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
	      |                                      ^
	././include/linux/compiler_types.h:301:4: note: in definition of macro '__compiletime_assert'
	  301 |    prefix ## suffix();    \
	      |    ^~~~~~
	././include/linux/compiler_types.h:320:2: note: in expansion of macro '_compiletime_assert'
	  320 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
	      |  ^~~~~~~~~~~~~~~~~~~
	./include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
	   36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
	      |  ^~~~~~~~~~~~~~~~~~
	./include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
	   49 |  compiletime_assert_rwonce_type(x);    \
	      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	mm/ptdump.c:114:14: note: in expansion of macro 'READ_ONCE'
	  114 |  pte_t val = READ_ONCE(*pte);
	      |              ^~~~~~~~~
	make[2]: *** [mm/ptdump.o] Error 1

READ_ONCE() cannot be used for reading PTEs. Use ptep_get()
instead. See commit 481e980a7c19 ("mm: Allow arches to provide ptep_get()")
and commit c0e1c8c22beb ("powerpc/8xx: Provide ptep_get() with 16k pages")
for details.

Fixes: 30d621f6723b ("mm: add generic ptdump")
Cc: Steven Price <steven.price@arm.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 mm/ptdump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/ptdump.c b/mm/ptdump.c
index 4354c1422d57..da751448d0e4 100644
--- a/mm/ptdump.c
+++ b/mm/ptdump.c
@@ -111,7 +111,7 @@ static int ptdump_pte_entry(pte_t *pte, unsigned long addr,
 			    unsigned long next, struct mm_walk *walk)
 {
 	struct ptdump_state *st = walk->private;
-	pte_t val = READ_ONCE(*pte);
+	pte_t val = ptep_get(pte);
 
 	if (st->effective_prot)
 		st->effective_prot(st, 4, pte_val(val));
-- 
2.25.0

