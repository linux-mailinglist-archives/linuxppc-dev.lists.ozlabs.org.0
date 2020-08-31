Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 631B5257579
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 10:34:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bg3QH5nkrzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 18:33:59 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bg3Ld1fs9zDqQm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 18:30:47 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bg3LR36qlz9v477;
 Mon, 31 Aug 2020 10:30:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id K6lQaRa8maTz; Mon, 31 Aug 2020 10:30:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bg3LR1m3Hz9v470;
 Mon, 31 Aug 2020 10:30:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 49AD48B79B;
 Mon, 31 Aug 2020 10:30:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zLN717HQK_Vm; Mon, 31 Aug 2020 10:30:44 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0F8548B799;
 Mon, 31 Aug 2020 10:30:44 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7D05B65D48; Mon, 31 Aug 2020 08:30:43 +0000 (UTC)
Message-Id: <f6ea2483c2c389567b007945948f704d18cfaeea.1598862623.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/2] powerpc/8xx: Refactor calculation of number of entries
 per PTE in page tables
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 31 Aug 2020 08:30:43 +0000 (UTC)
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

On 8xx, the number of entries occupied by a PTE in the page tables
depends on the size of the page. At the time being, this calculation
is done in two places: in pte_update() and in set_huge_pte_at()

Refactor this calculation into a helper called
number_of_cells_per_pte(). For the time being, the val param is
unused. It will be used by following patch.

Instead of opencoding is_hugepd(), use hugepd_ok() with a forward
declaration.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h | 18 ++++++++++++------
 arch/powerpc/mm/pgtable.c                    |  6 ++++--
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index b9e134d0f03a..80bbc21b87f0 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -227,6 +227,17 @@ static inline void pmd_clear(pmd_t *pmdp)
  */
 #ifdef CONFIG_PPC_8xx
 static pmd_t *pmd_off(struct mm_struct *mm, unsigned long addr);
+static int hugepd_ok(hugepd_t hpd);
+
+static int number_of_cells_per_pte(pmd_t *pmd, pte_basic_t val, int huge)
+{
+	if (!huge)
+		return PAGE_SIZE / SZ_4K;
+	else if (hugepd_ok(*((hugepd_t *)pmd)))
+		return 1;
+	else
+		return SZ_512K / SZ_4K;
+}
 
 static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, pte_t *p,
 				     unsigned long clr, unsigned long set, int huge)
@@ -237,12 +248,7 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
 	int num, i;
 	pmd_t *pmd = pmd_off(mm, addr);
 
-	if (!huge)
-		num = PAGE_SIZE / SZ_4K;
-	else if ((pmd_val(*pmd) & _PMD_PAGE_MASK) != _PMD_PAGE_8M)
-		num = SZ_512K / SZ_4K;
-	else
-		num = 1;
+	num = number_of_cells_per_pte(pmd, new, huge);
 
 	for (i = 0; i < num; i++, entry++, new += SZ_4K)
 		*entry = new;
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 9c0547d77af3..2dcad640b869 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -266,8 +266,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_
 	pmd_t *pmd = pmd_off(mm, addr);
 	pte_basic_t val;
 	pte_basic_t *entry = &ptep->pte;
-	int num = is_hugepd(*((hugepd_t *)pmd)) ? 1 : SZ_512K / SZ_4K;
-	int i;
+	int num, i;
 
 	/*
 	 * Make sure hardware valid bit is not set. We don't do
@@ -280,6 +279,9 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_
 	pte = set_pte_filter(pte);
 
 	val = pte_val(pte);
+
+	num = number_of_cells_per_pte(pmd, val, 1);
+
 	for (i = 0; i < num; i++, entry++, val += SZ_4K)
 		*entry = val;
 }
-- 
2.25.0

