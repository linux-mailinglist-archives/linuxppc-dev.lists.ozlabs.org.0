Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A67CD1CD937
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 14:01:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LKKV16Z5zDqHh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 22:01:34 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LJX54XgdzDqgF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 May 2020 21:25:41 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49LJWv6b2Lz9ty3h;
 Mon, 11 May 2020 13:25:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QFv7dH11kbB6; Mon, 11 May 2020 13:25:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49LJWv5pGhz9ty3g;
 Mon, 11 May 2020 13:25:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 60D5B8B7AE;
 Mon, 11 May 2020 13:25:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1foeZj4515Cf; Mon, 11 May 2020 13:25:38 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 216618B7AD;
 Mon, 11 May 2020 13:25:38 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1831765A0A; Mon, 11 May 2020 11:25:38 +0000 (UTC)
Message-Id: <c1d50ceacf532a65efe032bc61e59596d6f76d25.1589196133.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1589196133.git.christophe.leroy@csgroup.eu>
References: <cover.1589196133.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 12/45] powerpc/ptdump: Properly handle non standard page
 size
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 11 May 2020 11:25:38 +0000 (UTC)
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

In order to properly display information regardless of the page size,
it is necessary to take into account real page size.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Fixes: cabe8138b23c ("powerpc: dump as a single line areas mapping a single physical page.")
Cc: stable@vger.kernel.org
---
v3: Fixed sizes which were shifted one level (went unoticed on PPC32 as PMD and PUD level don't exist)
---
 arch/powerpc/mm/ptdump/ptdump.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 1f97668853e3..98d82dcf6f0b 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -60,6 +60,7 @@ struct pg_state {
 	unsigned long start_address;
 	unsigned long start_pa;
 	unsigned long last_pa;
+	unsigned long page_size;
 	unsigned int level;
 	u64 current_flags;
 	bool check_wx;
@@ -168,9 +169,9 @@ static void dump_addr(struct pg_state *st, unsigned long addr)
 #endif
 
 	pt_dump_seq_printf(st->seq, REG "-" REG " ", st->start_address, addr - 1);
-	if (st->start_pa == st->last_pa && st->start_address + PAGE_SIZE != addr) {
+	if (st->start_pa == st->last_pa && st->start_address + st->page_size != addr) {
 		pt_dump_seq_printf(st->seq, "[" REG "]", st->start_pa);
-		delta = PAGE_SIZE >> 10;
+		delta = st->page_size >> 10;
 	} else {
 		pt_dump_seq_printf(st->seq, " " REG " ", st->start_pa);
 		delta = (addr - st->start_address) >> 10;
@@ -195,7 +196,7 @@ static void note_prot_wx(struct pg_state *st, unsigned long addr)
 }
 
 static void note_page(struct pg_state *st, unsigned long addr,
-	       unsigned int level, u64 val)
+	       unsigned int level, u64 val, unsigned long page_size)
 {
 	u64 flag = val & pg_level[level].mask;
 	u64 pa = val & PTE_RPN_MASK;
@@ -207,6 +208,7 @@ static void note_page(struct pg_state *st, unsigned long addr,
 		st->start_address = addr;
 		st->start_pa = pa;
 		st->last_pa = pa;
+		st->page_size = page_size;
 		pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
 	/*
 	 * Dump the section of virtual memory when:
@@ -218,7 +220,7 @@ static void note_page(struct pg_state *st, unsigned long addr,
 	 */
 	} else if (flag != st->current_flags || level != st->level ||
 		   addr >= st->marker[1].start_address ||
-		   (pa != st->last_pa + PAGE_SIZE &&
+		   (pa != st->last_pa + st->page_size &&
 		    (pa != st->start_pa || st->start_pa != st->last_pa))) {
 
 		/* Check the PTE flags */
@@ -246,6 +248,7 @@ static void note_page(struct pg_state *st, unsigned long addr,
 		st->start_address = addr;
 		st->start_pa = pa;
 		st->last_pa = pa;
+		st->page_size = page_size;
 		st->current_flags = flag;
 		st->level = level;
 	} else {
@@ -261,7 +264,7 @@ static void walk_pte(struct pg_state *st, pmd_t *pmd, unsigned long start)
 
 	for (i = 0; i < PTRS_PER_PTE; i++, pte++) {
 		addr = start + i * PAGE_SIZE;
-		note_page(st, addr, 4, pte_val(*pte));
+		note_page(st, addr, 4, pte_val(*pte), PAGE_SIZE);
 
 	}
 }
@@ -278,7 +281,7 @@ static void walk_pmd(struct pg_state *st, pud_t *pud, unsigned long start)
 			/* pmd exists */
 			walk_pte(st, pmd, addr);
 		else
-			note_page(st, addr, 3, pmd_val(*pmd));
+			note_page(st, addr, 3, pmd_val(*pmd), PMD_SIZE);
 	}
 }
 
@@ -294,7 +297,7 @@ static void walk_pud(struct pg_state *st, pgd_t *pgd, unsigned long start)
 			/* pud exists */
 			walk_pmd(st, pud, addr);
 		else
-			note_page(st, addr, 2, pud_val(*pud));
+			note_page(st, addr, 2, pud_val(*pud), PUD_SIZE);
 	}
 }
 
@@ -313,7 +316,7 @@ static void walk_pagetables(struct pg_state *st)
 			/* pgd exists */
 			walk_pud(st, pgd, addr);
 		else
-			note_page(st, addr, 1, pgd_val(*pgd));
+			note_page(st, addr, 1, pgd_val(*pgd), PGDIR_SIZE);
 	}
 }
 
@@ -368,7 +371,7 @@ static int ptdump_show(struct seq_file *m, void *v)
 
 	/* Traverse kernel page tables */
 	walk_pagetables(&st);
-	note_page(&st, 0, 0, 0);
+	note_page(&st, 0, 0, 0, 0);
 	return 0;
 }
 
-- 
2.25.0

