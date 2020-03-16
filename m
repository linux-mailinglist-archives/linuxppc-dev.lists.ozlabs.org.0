Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0EA186C9C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 14:54:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gyTY5gTgzDqKj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 00:54:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=YBHsm6Wh; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gwlD5JtlzDqLJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 23:36:08 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48gwl46c8lz9v02p;
 Mon, 16 Mar 2020 13:36:00 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=YBHsm6Wh; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id R-NZpdYz0vBx; Mon, 16 Mar 2020 13:36:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48gwl45bgrz9v02f;
 Mon, 16 Mar 2020 13:36:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584362160; bh=0tJ0WB/5uzTckZ9SMU6pQ/bfE9wsFb+7jM/11D7Mn1c=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=YBHsm6WhoAaOichbtG+iBHQjZjzrWyJIVEDsiTLXXiEwYogqMnjX+Dzndm+Y88SKF
 YGMeyt1jIjK+8mgREAaGU9+YlMphf21ijUb9Wc5zJB/wIA1kJE106e8mnMmwvq0kzs
 XTR3sLjPw+QsiKXuGvZwimS4++/0QvzX45n0wZjQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BCD0A8B7D0;
 Mon, 16 Mar 2020 13:36:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id x7ik7fBzb_6O; Mon, 16 Mar 2020 13:36:05 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9FAF78B7CB;
 Mon, 16 Mar 2020 13:36:05 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9613965595; Mon, 16 Mar 2020 12:36:05 +0000 (UTC)
Message-Id: <837fabbbced9974dc557ec66eeafd3b2cddd0a47.1584360344.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1584360343.git.christophe.leroy@c-s.fr>
References: <cover.1584360343.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 20/46] powerpc/mm: Refactor pte_update() on book3s/32
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Mar 2020 12:36:05 +0000 (UTC)
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

While we are at it, drop the comment on 44x which is not applicable
to book3s version of pte_update().

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h | 58 +++++++-------------
 1 file changed, 20 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 7549393c4c43..d1108d25e2e5 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -253,53 +253,35 @@ extern void flush_hash_entry(struct mm_struct *mm, pte_t *ptep,
  * and the PTE may be either 32 or 64 bit wide. In the later case,
  * when using atomic updates, only the low part of the PTE is
  * accessed atomically.
- *
- * In addition, on 44x, we also maintain a global flag indicating
- * that an executable user mapping was modified, which is needed
- * to properly flush the virtually tagged instruction cache of
- * those implementations.
  */
-#ifndef CONFIG_PTE_64BIT
-static inline unsigned long pte_update(pte_t *p,
-				       unsigned long clr,
-				       unsigned long set)
+static inline pte_basic_t pte_update(pte_t *p, unsigned long clr, unsigned long set)
 {
-	unsigned long old, tmp;
-
-	__asm__ __volatile__("\
-1:	lwarx	%0,0,%3\n\
-	andc	%1,%0,%4\n\
-	or	%1,%1,%5\n"
-"	stwcx.	%1,0,%3\n\
-	bne-	1b"
-	: "=&r" (old), "=&r" (tmp), "=m" (*p)
-	: "r" (p), "r" (clr), "r" (set), "m" (*p)
-	: "cc" );
-
-	return old;
-}
-#else /* CONFIG_PTE_64BIT */
-static inline unsigned long long pte_update(pte_t *p,
-					    unsigned long clr,
-					    unsigned long set)
-{
-	unsigned long long old;
+	pte_basic_t old;
 	unsigned long tmp;
 
-	__asm__ __volatile__("\
-1:	lwarx	%L0,0,%4\n\
-	lwzx	%0,0,%3\n\
-	andc	%1,%L0,%5\n\
-	or	%1,%1,%6\n"
-"	stwcx.	%1,0,%4\n\
-	bne-	1b"
+	__asm__ __volatile__(
+#ifndef CONFIG_PTE_64BIT
+"1:	lwarx	%0, 0, %3\n"
+"	andc	%1, %0, %4\n"
+#else
+"1:	lwarx	%L0, 0, %3\n"
+"	lwz	%0, -4(%3)\n"
+"	andc	%1, %L0, %4\n"
+#endif
+"	or	%1, %1, %5\n"
+"	stwcx.	%1, 0, %3\n"
+"	bne-	1b"
 	: "=&r" (old), "=&r" (tmp), "=m" (*p)
-	: "r" (p), "r" ((unsigned long)(p) + 4), "r" (clr), "r" (set), "m" (*p)
+#ifndef CONFIG_PTE_64BIT
+	: "r" (p),
+#else
+	: "b" ((unsigned long)(p) + 4),
+#endif
+	  "r" (clr), "r" (set), "m" (*p)
 	: "cc" );
 
 	return old;
 }
-#endif /* CONFIG_PTE_64BIT */
 
 /*
  * 2.6 calls this without flushing the TLB entry; this is wrong
-- 
2.25.0

