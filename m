Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D4D363FDD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 12:48:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP3Sq6vyRz30DG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 20:48:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP3Rp4Tytz2xMd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 20:47:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FP3RY1X1szB09b2;
 Mon, 19 Apr 2021 12:47:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lvOGjcietf29; Mon, 19 Apr 2021 12:47:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FP3RY0ZBbzB09Zy;
 Mon, 19 Apr 2021 12:47:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EE5228B7BB;
 Mon, 19 Apr 2021 12:47:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zWUgjsugP1YO; Mon, 19 Apr 2021 12:47:25 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B97448B7B4;
 Mon, 19 Apr 2021 12:47:25 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B0552679FC; Mon, 19 Apr 2021 10:47:25 +0000 (UTC)
Message-Id: <db6981c69f96a8c9c6dcf688b7f485e15993ddef.1618828806.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1618828806.git.christophe.leroy@csgroup.eu>
References: <cover.1618828806.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 1/4] mm: pagewalk: Fix walk for hugepage tables
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 Steven Price <steven.price@arm.com>, akpm@linux-foundation.org, dja@axtens.net
Date: Mon, 19 Apr 2021 10:47:25 +0000 (UTC)
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Oliver O'Halloran <oohall@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pagewalk ignores hugepd entries and walk down the tables
as if it was traditionnal entries, leading to crazy result.

Add walk_hugepd_range() and use it to walk hugepage tables.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2:
- Add a guard for NULL ops->pte_entry
- Take mm->page_table_lock when walking hugepage table, as suggested by follow_huge_pd()
---
 mm/pagewalk.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index e81640d9f177..9b3db11a4d1d 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -58,6 +58,45 @@ static int walk_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	return err;
 }
 
+#ifdef CONFIG_ARCH_HAS_HUGEPD
+static int walk_hugepd_range(hugepd_t *phpd, unsigned long addr,
+			     unsigned long end, struct mm_walk *walk, int pdshift)
+{
+	int err = 0;
+	const struct mm_walk_ops *ops = walk->ops;
+	int shift = hugepd_shift(*phpd);
+	int page_size = 1 << shift;
+
+	if (!ops->pte_entry)
+		return 0;
+
+	if (addr & (page_size - 1))
+		return 0;
+
+	for (;;) {
+		pte_t *pte;
+
+		spin_lock(&walk->mm->page_table_lock);
+		pte = hugepte_offset(*phpd, addr, pdshift);
+		err = ops->pte_entry(pte, addr, addr + page_size, walk);
+		spin_unlock(&walk->mm->page_table_lock);
+
+		if (err)
+			break;
+		if (addr >= end - page_size)
+			break;
+		addr += page_size;
+	}
+	return err;
+}
+#else
+static int walk_hugepd_range(hugepd_t *phpd, unsigned long addr,
+			     unsigned long end, struct mm_walk *walk, int pdshift)
+{
+	return 0;
+}
+#endif
+
 static int walk_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
 			  struct mm_walk *walk)
 {
@@ -108,7 +147,10 @@ static int walk_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
 				goto again;
 		}
 
-		err = walk_pte_range(pmd, addr, next, walk);
+		if (is_hugepd(__hugepd(pmd_val(*pmd))))
+			err = walk_hugepd_range((hugepd_t *)pmd, addr, next, walk, PMD_SHIFT);
+		else
+			err = walk_pte_range(pmd, addr, next, walk);
 		if (err)
 			break;
 	} while (pmd++, addr = next, addr != end);
@@ -157,7 +199,10 @@ static int walk_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
 		if (pud_none(*pud))
 			goto again;
 
-		err = walk_pmd_range(pud, addr, next, walk);
+		if (is_hugepd(__hugepd(pud_val(*pud))))
+			err = walk_hugepd_range((hugepd_t *)pud, addr, next, walk, PUD_SHIFT);
+		else
+			err = walk_pmd_range(pud, addr, next, walk);
 		if (err)
 			break;
 	} while (pud++, addr = next, addr != end);
@@ -189,7 +234,9 @@ static int walk_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
 			if (err)
 				break;
 		}
-		if (ops->pud_entry || ops->pmd_entry || ops->pte_entry)
+		if (is_hugepd(__hugepd(p4d_val(*p4d))))
+			err = walk_hugepd_range((hugepd_t *)p4d, addr, next, walk, P4D_SHIFT);
+		else if (ops->pud_entry || ops->pmd_entry || ops->pte_entry)
 			err = walk_pud_range(p4d, addr, next, walk);
 		if (err)
 			break;
@@ -224,8 +271,9 @@ static int walk_pgd_range(unsigned long addr, unsigned long end,
 			if (err)
 				break;
 		}
-		if (ops->p4d_entry || ops->pud_entry || ops->pmd_entry ||
-		    ops->pte_entry)
+		if (is_hugepd(__hugepd(pgd_val(*pgd))))
+			err = walk_hugepd_range((hugepd_t *)pgd, addr, next, walk, PGDIR_SHIFT);
+		else if (ops->p4d_entry || ops->pud_entry || ops->pmd_entry || ops->pte_entry)
 			err = walk_p4d_range(pgd, addr, next, walk);
 		if (err)
 			break;
-- 
2.25.0

