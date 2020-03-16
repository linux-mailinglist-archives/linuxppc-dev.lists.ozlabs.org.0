Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4144186C15
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 14:31:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gxzV0dHszDqP6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 00:31:50 +1100 (AEDT)
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
 header.s=mail header.b=RSSO8TPK; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gwl92h1LzDqLJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 23:36:05 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48gwkx66Gpz9v02h;
 Mon, 16 Mar 2020 13:35:53 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=RSSO8TPK; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Hja4kzBlAaGA; Mon, 16 Mar 2020 13:35:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48gwkx523Mz9v02g;
 Mon, 16 Mar 2020 13:35:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584362153; bh=58rfjZahjqar+Bs/L8k5MbBDqVxxpbXTMhnkBU5JBXg=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=RSSO8TPKq3GkxMA3nPVzRAsOYOUT4q0nLBGJYEkc8DrDrO6m/CHWg5VONSa/xk+87
 b6emhPvzzloX60mpDP/D8DGdGcGQ4uCEgwRhLI5q3C+r5jHkU01r1pMbjJoP5Ma/p2
 LHmqOdtYdD8I1mrmFWuwOp7pLiidWzdmB6Nz9yu8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A79068B7D0;
 Mon, 16 Mar 2020 13:35:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KuWFnRklsRFg; Mon, 16 Mar 2020 13:35:58 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 622098B7CB;
 Mon, 16 Mar 2020 13:35:58 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 58DAE65595; Mon, 16 Mar 2020 12:35:58 +0000 (UTC)
Message-Id: <879a5d42ddd8c48df106a85211f843dceafbc2d7.1584360344.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1584360343.git.christophe.leroy@c-s.fr>
References: <cover.1584360343.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 13/46] powerpc/ptdump: Properly handle non standard page
 size
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Mar 2020 12:35:58 +0000 (UTC)
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

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Fixes: cabe8138b23c ("powerpc: dump as a single line areas mapping a single physical page.")
Cc: stable@vger.kernel.org
---
 arch/powerpc/mm/ptdump/ptdump.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 1f97668853e3..64434b66f240 100644
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
@@ -195,10 +196,11 @@ static void note_prot_wx(struct pg_state *st, unsigned long addr)
 }
 
 static void note_page(struct pg_state *st, unsigned long addr,
-	       unsigned int level, u64 val)
+	       unsigned int level, u64 val, int shift)
 {
 	u64 flag = val & pg_level[level].mask;
 	u64 pa = val & PTE_RPN_MASK;
+	unsigned long page_size = 1 << shift;
 
 	/* At first no level is set */
 	if (!st->level) {
@@ -207,6 +209,7 @@ static void note_page(struct pg_state *st, unsigned long addr,
 		st->start_address = addr;
 		st->start_pa = pa;
 		st->last_pa = pa;
+		st->page_size = page_size;
 		pt_dump_seq_printf(st->seq, "---[ %s ]---\n", st->marker->name);
 	/*
 	 * Dump the section of virtual memory when:
@@ -218,7 +221,7 @@ static void note_page(struct pg_state *st, unsigned long addr,
 	 */
 	} else if (flag != st->current_flags || level != st->level ||
 		   addr >= st->marker[1].start_address ||
-		   (pa != st->last_pa + PAGE_SIZE &&
+		   (pa != st->last_pa + st->page_size &&
 		    (pa != st->start_pa || st->start_pa != st->last_pa))) {
 
 		/* Check the PTE flags */
@@ -246,6 +249,7 @@ static void note_page(struct pg_state *st, unsigned long addr,
 		st->start_address = addr;
 		st->start_pa = pa;
 		st->last_pa = pa;
+		st->page_size = page_size;
 		st->current_flags = flag;
 		st->level = level;
 	} else {
@@ -261,7 +265,7 @@ static void walk_pte(struct pg_state *st, pmd_t *pmd, unsigned long start)
 
 	for (i = 0; i < PTRS_PER_PTE; i++, pte++) {
 		addr = start + i * PAGE_SIZE;
-		note_page(st, addr, 4, pte_val(*pte));
+		note_page(st, addr, 4, pte_val(*pte), PAGE_SHIFT);
 
 	}
 }
@@ -278,7 +282,7 @@ static void walk_pmd(struct pg_state *st, pud_t *pud, unsigned long start)
 			/* pmd exists */
 			walk_pte(st, pmd, addr);
 		else
-			note_page(st, addr, 3, pmd_val(*pmd));
+			note_page(st, addr, 3, pmd_val(*pmd), PTE_SHIFT);
 	}
 }
 
@@ -294,7 +298,7 @@ static void walk_pud(struct pg_state *st, pgd_t *pgd, unsigned long start)
 			/* pud exists */
 			walk_pmd(st, pud, addr);
 		else
-			note_page(st, addr, 2, pud_val(*pud));
+			note_page(st, addr, 2, pud_val(*pud), PMD_SHIFT);
 	}
 }
 
@@ -313,7 +317,7 @@ static void walk_pagetables(struct pg_state *st)
 			/* pgd exists */
 			walk_pud(st, pgd, addr);
 		else
-			note_page(st, addr, 1, pgd_val(*pgd));
+			note_page(st, addr, 1, pgd_val(*pgd), PUD_SHIFT);
 	}
 }
 
@@ -368,7 +372,7 @@ static int ptdump_show(struct seq_file *m, void *v)
 
 	/* Traverse kernel page tables */
 	walk_pagetables(&st);
-	note_page(&st, 0, 0, 0);
+	note_page(&st, 0, 0, 0, 0);
 	return 0;
 }
 
-- 
2.25.0

