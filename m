Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15980186CD8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 15:11:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gys35GDWzDqDp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 01:11:19 +1100 (AEDT)
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
 header.s=mail header.b=D68pZqj5; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gwlH6w8ZzDqLx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 23:36:11 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48gwl80qKGz9v02g;
 Mon, 16 Mar 2020 13:36:04 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=D68pZqj5; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Wbg05s2OH7kJ; Mon, 16 Mar 2020 13:36:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48gwl76rbzz9v02f;
 Mon, 16 Mar 2020 13:36:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584362164; bh=UXXhN66QOVxw2T7RY5ZFgbj66+P8FYr90GzX700bw+A=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=D68pZqj5FH9NqkCA6PsCW+uszgwfvvmHx02DBvJO8413I2GE1IyarNo0pGCfOzwZJ
 fYlh9rgeC8EAf6YBBTo18+ytmBkS9molczCN/eUeSEIM4HKv8Ge+TuX0JFZ7XH96pk
 3KWM1IHx4qQChtzIuKzq11fB6gmlYnpQGrdigwVU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CCE1F8B7D0;
 Mon, 16 Mar 2020 13:36:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AT_83QhiTR-S; Mon, 16 Mar 2020 13:36:08 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B34698B7CB;
 Mon, 16 Mar 2020 13:36:08 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A964365595; Mon, 16 Mar 2020 12:36:08 +0000 (UTC)
Message-Id: <5f25b3f373f14fbab26bf1c641ad06d8bb815b77.1584360344.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1584360343.git.christophe.leroy@c-s.fr>
References: <cover.1584360343.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 23/46] powerpc/mm: Create a dedicated pte_update() for 8xx
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Mar 2020 12:36:08 +0000 (UTC)
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

pte_update() is a bit special for the 8xx. At the time
being, that's an #ifdef inside the nohash/32 pte_update().

As we are going to make it even more special in the coming
patches, create a dedicated version for pte_update() for 8xx.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h | 29 +++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 75880eb1cb91..272963a05ab2 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -221,7 +221,31 @@ static inline void pmd_clear(pmd_t *pmdp)
  * that an executable user mapping was modified, which is needed
  * to properly flush the virtually tagged instruction cache of
  * those implementations.
+ *
+ * On the 8xx, the page tables are a bit special. For 16k pages, we have
+ * 4 identical entries. For other page sizes, we have a single entry in the
+ * table.
  */
+#ifdef CONFIG_PPC_8xx
+static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, pte_t *p,
+				     unsigned long clr, unsigned long set, int huge)
+{
+	pte_basic_t *entry = &p->pte;
+	pte_basic_t old = pte_val(*p);
+	pte_basic_t new = (old & ~(pte_basic_t)clr) | set;
+	int num, i;
+
+	if (!huge)
+		num = PAGE_SIZE / SZ_4K;
+	else
+		num = 1;
+
+	for (i = 0; i < num; i++, entry++)
+		*entry = new;
+
+	return old;
+}
+#else
 static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, pte_t *p,
 				     unsigned long clr, unsigned long set, int huge)
 {
@@ -242,11 +266,7 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
 	pte_basic_t old = pte_val(*p);
 	pte_basic_t new = (old & ~(pte_basic_t)clr) | set;
 
-#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PPC_16K_PAGES)
-	p->pte = p->pte1 = p->pte2 = p->pte3 = new;
-#else
 	*p = __pte(new);
-#endif
 #endif /* !PTE_ATOMIC_UPDATES */
 
 #ifdef CONFIG_44x
@@ -255,6 +275,7 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
 #endif
 	return old;
 }
+#endif
 
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
-- 
2.25.0

