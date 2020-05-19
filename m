Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B4F1D8FE1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 08:17:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R5Jm5BtdzDqSy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 16:17:28 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R4gv2hKpzDqQs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 15:48:59 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49R4gq2Z7Vz9txm3;
 Tue, 19 May 2020 07:48:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bOGbi5QSJxKh; Tue, 19 May 2020 07:48:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49R4gq1l0wz9txm1;
 Tue, 19 May 2020 07:48:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 523B98B767;
 Tue, 19 May 2020 07:48:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5wejxcLrHeo6; Tue, 19 May 2020 07:48:56 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 130568B7A7;
 Tue, 19 May 2020 07:48:56 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E78F565A4A; Tue, 19 May 2020 05:48:55 +0000 (UTC)
Message-Id: <630728289158dcfeb06b14d40ed7c4c4e7148cf1.1589866984.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1589866984.git.christophe.leroy@csgroup.eu>
References: <cover.1589866984.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 13/45] powerpc/ptdump: Handle hugepd at PGD level
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 19 May 2020 05:48:55 +0000 (UTC)
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

The 8xx is about to map kernel linear space and IMMR using huge
pages.

In order to display those pages properly, ptdump needs to handle
hugepd tables at PGD level.

For the time being do it only at PGD level. Further patches may
add handling of hugepd tables at lower level for other platforms
when needed in the future.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: notepage() now takes page size instead of page shift
---
 arch/powerpc/mm/ptdump/ptdump.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 98d82dcf6f0b..5fc880e30175 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -23,6 +23,7 @@
 #include <linux/const.h>
 #include <asm/page.h>
 #include <asm/pgalloc.h>
+#include <asm/hugetlb.h>
 
 #include <mm/mmu_decl.h>
 
@@ -269,6 +270,26 @@ static void walk_pte(struct pg_state *st, pmd_t *pmd, unsigned long start)
 	}
 }
 
+static void walk_hugepd(struct pg_state *st, hugepd_t *phpd, unsigned long start,
+			int pdshift, int level)
+{
+#ifdef CONFIG_ARCH_HAS_HUGEPD
+	unsigned int i;
+	int shift = hugepd_shift(*phpd);
+	int ptrs_per_hpd = pdshift - shift > 0 ? 1 << (pdshift - shift) : 1;
+
+	if (start & ((1 << shift) - 1))
+		return;
+
+	for (i = 0; i < ptrs_per_hpd; i++) {
+		unsigned long addr = start + (i << shift);
+		pte_t *pte = hugepte_offset(*phpd, addr, pdshift);
+
+		note_page(st, addr, level + 1, pte_val(*pte), 1 << shift);
+	}
+#endif
+}
+
 static void walk_pmd(struct pg_state *st, pud_t *pud, unsigned long start)
 {
 	pmd_t *pmd = pmd_offset(pud, 0);
@@ -312,11 +333,13 @@ static void walk_pagetables(struct pg_state *st)
 	 * the hash pagetable.
 	 */
 	for (i = pgd_index(addr); i < PTRS_PER_PGD; i++, pgd++, addr += PGDIR_SIZE) {
-		if (!pgd_none(*pgd) && !pgd_is_leaf(*pgd))
+		if (pgd_none(*pgd) || pgd_is_leaf(*pgd))
+			note_page(st, addr, 1, pgd_val(*pgd), PGDIR_SIZE);
+		else if (is_hugepd(__hugepd(pgd_val(*pgd))))
+			walk_hugepd(st, (hugepd_t *)pgd, addr, PGDIR_SHIFT, 1);
+		else
 			/* pgd exists */
 			walk_pud(st, pgd, addr);
-		else
-			note_page(st, addr, 1, pgd_val(*pgd), PGDIR_SIZE);
 	}
 }
 
-- 
2.25.0

