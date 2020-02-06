Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E7513154576
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2020 14:52:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48D0Hr35NzzDqXm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 00:52:56 +1100 (AEDT)
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
 header.s=mail header.b=kLr9YHP0; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48D0F75twJzDqXf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 00:50:34 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48D0F03DN3z9v995;
 Thu,  6 Feb 2020 14:50:28 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=kLr9YHP0; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id wtA-ON8Bgv8n; Thu,  6 Feb 2020 14:50:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48D0F01zYPz9v994;
 Thu,  6 Feb 2020 14:50:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580997028; bh=0bH7Q8+ZCms42huP9MeIAQx+Q6qVGMr1gRSJSDwrjGU=;
 h=From:Subject:To:Cc:Date:From;
 b=kLr9YHP0JPqaJb7IyJSKyCkLltCvd/qg1dd/t8EfgAmFAVV8xI9PyWHXL1dE/AsuD
 wAWZaUgPeHARvDoEpGNNlBC0OKmazuQ+Yj1a2iz206hkdBY0QvpWcWXYSADydAs9ov
 hjWo3VqoCeglpbDRVm8IXZZSwjRniwMwpP9Pzi90=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9FBBB8B887;
 Thu,  6 Feb 2020 14:50:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JhwneTyJXOp4; Thu,  6 Feb 2020 14:50:29 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 50AFB8B864;
 Thu,  6 Feb 2020 14:50:29 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id CD126652B7; Thu,  6 Feb 2020 13:50:28 +0000 (UTC)
Message-Id: <90ec56a2315be602494619ed0223bba3b0b8d619.1580997007.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/hugetlb: Fix 512k hugepages on 8xx with 16k page size
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 aneesh.kumar@linux.ibm.com
Date: Thu,  6 Feb 2020 13:50:28 +0000 (UTC)
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

Commit 55c8fc3f4930 ("powerpc/8xx: reintroduce 16K pages with HW
assistance") redefined pte_t as a struct of 4 pte_basic_t, because
in 16K pages mode there are four identical entries in the
page table. But the size of hugepage tables is calculated based
of the size of (void *). Therefore, we end up with page tables
of size 1k instead of 4k for 512k pages.

As 512k hugepage tables are the same size as standard page tables,
ie 4k, use the standard page tables instead of PGT_CACHE tables.

Fixes: 3fb69c6a1a13 ("powerpc/8xx: Enable 512k hugepage support with HW assistance")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/hugetlbpage.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index c61032580185..edf511c2a30a 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -54,20 +54,24 @@ static int __hugepte_alloc(struct mm_struct *mm, hugepd_t *hpdp,
 	if (pshift >= pdshift) {
 		cachep = PGT_CACHE(PTE_T_ORDER);
 		num_hugepd = 1 << (pshift - pdshift);
+		new = NULL;
 	} else if (IS_ENABLED(CONFIG_PPC_8xx)) {
-		cachep = PGT_CACHE(PTE_INDEX_SIZE);
+		cachep = NULL;
 		num_hugepd = 1;
+		new = pte_alloc_one(mm);
 	} else {
 		cachep = PGT_CACHE(pdshift - pshift);
 		num_hugepd = 1;
+		new = NULL;
 	}
 
-	if (!cachep) {
+	if (!cachep && !new) {
 		WARN_ONCE(1, "No page table cache created for hugetlb tables");
 		return -ENOMEM;
 	}
 
-	new = kmem_cache_alloc(cachep, pgtable_gfp_flags(mm, GFP_KERNEL));
+	if (cachep)
+		new = kmem_cache_alloc(cachep, pgtable_gfp_flags(mm, GFP_KERNEL));
 
 	BUG_ON(pshift > HUGEPD_SHIFT_MASK);
 	BUG_ON((unsigned long)new & HUGEPD_SHIFT_MASK);
@@ -98,7 +102,10 @@ static int __hugepte_alloc(struct mm_struct *mm, hugepd_t *hpdp,
 	if (i < num_hugepd) {
 		for (i = i - 1 ; i >= 0; i--, hpdp--)
 			*hpdp = __hugepd(0);
-		kmem_cache_free(cachep, new);
+		if (cachep)
+			kmem_cache_free(cachep, new);
+		else
+			pte_free(mm, new);
 	} else {
 		kmemleak_ignore(new);
 	}
@@ -325,8 +332,7 @@ static void free_hugepd_range(struct mmu_gather *tlb, hugepd_t *hpdp, int pdshif
 	if (shift >= pdshift)
 		hugepd_free(tlb, hugepte);
 	else if (IS_ENABLED(CONFIG_PPC_8xx))
-		pgtable_free_tlb(tlb, hugepte,
-				 get_hugepd_cache_index(PTE_INDEX_SIZE));
+		pgtable_free_tlb(tlb, hugepte, 0);
 	else
 		pgtable_free_tlb(tlb, hugepte,
 				 get_hugepd_cache_index(pdshift - shift));
@@ -640,12 +646,13 @@ static int __init hugetlbpage_init(void)
 		 * if we have pdshift and shift value same, we don't
 		 * use pgt cache for hugepd.
 		 */
-		if (pdshift > shift && IS_ENABLED(CONFIG_PPC_8xx))
-			pgtable_cache_add(PTE_INDEX_SIZE);
-		else if (pdshift > shift)
-			pgtable_cache_add(pdshift - shift);
-		else if (IS_ENABLED(CONFIG_PPC_FSL_BOOK3E) || IS_ENABLED(CONFIG_PPC_8xx))
+		if (pdshift > shift) {
+			if (!IS_ENABLED(CONFIG_PPC_8xx))
+				pgtable_cache_add(pdshift - shift);
+		} else if (IS_ENABLED(CONFIG_PPC_FSL_BOOK3E) ||
+			   IS_ENABLED(CONFIG_PPC_8xx)) {
 			pgtable_cache_add(PTE_T_ORDER);
+		}
 
 		configured = true;
 	}
-- 
2.25.0

