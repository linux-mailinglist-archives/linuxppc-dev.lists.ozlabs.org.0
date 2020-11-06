Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC012A96F9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 14:25:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSLjg6h1xzDrMF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 00:25:27 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSLcc5hzhzDrGq
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 00:21:00 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CSLcQ3lSGz9v15t;
 Fri,  6 Nov 2020 14:20:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5gvZkFtVHQcI; Fri,  6 Nov 2020 14:20:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CSLcQ2zYkz9v15c;
 Fri,  6 Nov 2020 14:20:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9DCD48B8BF;
 Fri,  6 Nov 2020 14:20:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eTPlQqlIsTlD; Fri,  6 Nov 2020 14:20:55 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3FB808B8BD;
 Fri,  6 Nov 2020 14:20:55 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id F010F66868; Fri,  6 Nov 2020 13:20:54 +0000 (UTC)
Message-Id: <16a571bb32eb6e8cd44bda484c8d81cd8a25e6d7.1604668827.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/mm: Refactor the floor/ceiling check in hugetlb range
 freeing functions
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri,  6 Nov 2020 13:20:54 +0000 (UTC)
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

All hugetlb range freeing functions have a verification like the following,
which only differs by the mask used, depending on the page table level.

	start &= MASK;
	if (start < floor)
		return;
	if (ceiling) {
		ceiling &= MASK;
		if (! ceiling)
			return;
		}
	if (end - 1 > ceiling - 1)
		return;

Refactor that into a helper function which takes the mask as
an argument, returning true when [start;end[ is not fully
contained inside [floor;ceiling[

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/hugetlbpage.c | 56 ++++++++++++-----------------------
 1 file changed, 19 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 36c3800769fb..f8d8a4988e15 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -294,6 +294,21 @@ static void hugepd_free(struct mmu_gather *tlb, void *hugepte)
 static inline void hugepd_free(struct mmu_gather *tlb, void *hugepte) {}
 #endif
 
+/* Return true when the entry to be freed maps more than the area being freed */
+static bool range_is_outside_limits(unsigned long start, unsigned long end,
+				    unsigned long floor, unsigned long ceiling,
+				    unsigned long mask)
+{
+	if ((start & mask) < floor)
+		return true;
+	if (ceiling) {
+		ceiling &= mask;
+		if (!ceiling)
+			return true;
+	}
+	return end - 1 > ceiling - 1;
+}
+
 static void free_hugepd_range(struct mmu_gather *tlb, hugepd_t *hpdp, int pdshift,
 			      unsigned long start, unsigned long end,
 			      unsigned long floor, unsigned long ceiling)
@@ -309,15 +324,7 @@ static void free_hugepd_range(struct mmu_gather *tlb, hugepd_t *hpdp, int pdshif
 	if (shift > pdshift)
 		num_hugepd = 1 << (shift - pdshift);
 
-	start &= pdmask;
-	if (start < floor)
-		return;
-	if (ceiling) {
-		ceiling &= pdmask;
-		if (! ceiling)
-			return;
-	}
-	if (end - 1 > ceiling - 1)
+	if (range_is_outside_limits(start, end, floor, ceiling, pdmask))
 		return;
 
 	for (i = 0; i < num_hugepd; i++, hpdp++)
@@ -334,18 +341,9 @@ static void hugetlb_free_pte_range(struct mmu_gather *tlb, pmd_t *pmd,
 				   unsigned long addr, unsigned long end,
 				   unsigned long floor, unsigned long ceiling)
 {
-	unsigned long start = addr;
 	pgtable_t token = pmd_pgtable(*pmd);
 
-	start &= PMD_MASK;
-	if (start < floor)
-		return;
-	if (ceiling) {
-		ceiling &= PMD_MASK;
-		if (!ceiling)
-			return;
-	}
-	if (end - 1 > ceiling - 1)
+	if (range_is_outside_limits(addr, end, floor, ceiling, PMD_MASK))
 		return;
 
 	pmd_clear(pmd);
@@ -395,15 +393,7 @@ static void hugetlb_free_pmd_range(struct mmu_gather *tlb, pud_t *pud,
 				  addr, next, floor, ceiling);
 	} while (addr = next, addr != end);
 
-	start &= PUD_MASK;
-	if (start < floor)
-		return;
-	if (ceiling) {
-		ceiling &= PUD_MASK;
-		if (!ceiling)
-			return;
-	}
-	if (end - 1 > ceiling - 1)
+	if (range_is_outside_limits(start, end, floor, ceiling, PUD_MASK))
 		return;
 
 	pmd = pmd_offset(pud, start);
@@ -446,15 +436,7 @@ static void hugetlb_free_pud_range(struct mmu_gather *tlb, p4d_t *p4d,
 		}
 	} while (addr = next, addr != end);
 
-	start &= PGDIR_MASK;
-	if (start < floor)
-		return;
-	if (ceiling) {
-		ceiling &= PGDIR_MASK;
-		if (!ceiling)
-			return;
-	}
-	if (end - 1 > ceiling - 1)
+	if (range_is_outside_limits(start, end, floor, ceiling, PGDIR_MASK))
 		return;
 
 	pud = pud_offset(p4d, start);
-- 
2.25.0

