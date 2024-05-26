Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1758CF327
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2024 11:37:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VnD4f1Xvsz8BXL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2024 19:29:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VnCyf62lBz87fB
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 May 2024 19:24:10 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4VnCx01J55z9sx4;
	Sun, 26 May 2024 11:22:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e43tbkECTMAR; Sun, 26 May 2024 11:22:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4VnCwr6429z9tCB;
	Sun, 26 May 2024 11:22:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CC2628B773;
	Sun, 26 May 2024 11:22:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id BWs5MIGftZLi; Sun, 26 May 2024 11:22:36 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.45])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 405F18B764;
	Sun, 26 May 2024 11:22:36 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC PATCH v3 16/16] mm: Remove CONFIG_ARCH_HAS_HUGEPD
Date: Sun, 26 May 2024 11:22:36 +0200
Message-ID: <4655a5bb3ed235f8a9f22c0c539a289669f9db78.1716714720.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1716714720.git.christophe.leroy@csgroup.eu>
References: <cover.1716714720.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716715344; l=9686; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=YBZKKmp3eD7Iomi12QR3QcSdbF4Q6xzuY14thrUhQoI=; b=0r4IhBGW/Ne1WYtt05SHsuCc8GlLS81x6sfkFW0OII2AS/3V7Z2yhqfj1WxiSOgFIQ9SUvvGY hLbH3ScpIi7DgGxii/MaXDw+6SHVYzL6vn1a9EtZrqHBV8A6IIDEjLQ
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc was the only user of CONFIG_ARCH_HAS_HUGEPD and doesn't
use it anymore, so remove all related code.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/hugetlbpage.c |   1 -
 include/linux/hugetlb.h       |   6 --
 mm/Kconfig                    |  10 ----
 mm/gup.c                      | 105 +---------------------------------
 mm/pagewalk.c                 |  57 ++----------------
 5 files changed, 5 insertions(+), 174 deletions(-)

diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 76846c6014e4..6b043180220a 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -78,7 +78,6 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 
 	return pte_alloc_huge(mm, pmd, addr);
 }
-#endif
 
 #ifdef CONFIG_PPC_BOOK3S_64
 /*
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 77b30a8c6076..f6a509487773 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -20,12 +20,6 @@ struct user_struct;
 struct mmu_gather;
 struct node;
 
-#ifndef CONFIG_ARCH_HAS_HUGEPD
-typedef struct { unsigned long pd; } hugepd_t;
-#define is_hugepd(hugepd) (0)
-#define __hugepd(x) ((hugepd_t) { (x) })
-#endif
-
 void free_huge_folio(struct folio *folio);
 
 #ifdef CONFIG_HUGETLB_PAGE
diff --git a/mm/Kconfig b/mm/Kconfig
index b1448aa81e15..a52f8e3224fb 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1114,16 +1114,6 @@ config DMAPOOL_TEST
 config ARCH_HAS_PTE_SPECIAL
 	bool
 
-#
-# Some architectures require a special hugepage directory format that is
-# required to support multiple hugepage sizes. For example a4fe3ce76
-# "powerpc/mm: Allow more flexible layouts for hugepage pagetables"
-# introduced it on powerpc.  This allows for a more flexible hugepage
-# pagetable layouts.
-#
-config ARCH_HAS_HUGEPD
-	bool
-
 config MAPPING_DIRTY_HELPERS
         bool
 
diff --git a/mm/gup.c b/mm/gup.c
index 86b5105b82a1..95f121223f04 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2790,89 +2790,6 @@ static int record_subpages(struct page *page, unsigned long addr,
 	return nr;
 }
 
-#ifdef CONFIG_ARCH_HAS_HUGEPD
-static unsigned long hugepte_addr_end(unsigned long addr, unsigned long end,
-				      unsigned long sz)
-{
-	unsigned long __boundary = (addr + sz) & ~(sz-1);
-	return (__boundary - 1 < end - 1) ? __boundary : end;
-}
-
-static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
-		       unsigned long end, unsigned int flags,
-		       struct page **pages, int *nr)
-{
-	unsigned long pte_end;
-	struct page *page;
-	struct folio *folio;
-	pte_t pte;
-	int refs;
-
-	pte_end = (addr + sz) & ~(sz-1);
-	if (pte_end < end)
-		end = pte_end;
-
-	pte = huge_ptep_get(NULL, addr, ptep);
-
-	if (!pte_access_permitted(pte, flags & FOLL_WRITE))
-		return 0;
-
-	/* hugepages are never "special" */
-	VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
-
-	page = nth_page(pte_page(pte), (addr & (sz - 1)) >> PAGE_SHIFT);
-	refs = record_subpages(page, addr, end, pages + *nr);
-
-	folio = try_grab_folio(page, refs, flags);
-	if (!folio)
-		return 0;
-
-	if (unlikely(pte_val(pte) != pte_val(ptep_get(ptep)))) {
-		gup_put_folio(folio, refs, flags);
-		return 0;
-	}
-
-	if (!folio_fast_pin_allowed(folio, flags)) {
-		gup_put_folio(folio, refs, flags);
-		return 0;
-	}
-
-	if (!pte_write(pte) && gup_must_unshare(NULL, flags, &folio->page)) {
-		gup_put_folio(folio, refs, flags);
-		return 0;
-	}
-
-	*nr += refs;
-	folio_set_referenced(folio);
-	return 1;
-}
-
-static int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
-		unsigned int pdshift, unsigned long end, unsigned int flags,
-		struct page **pages, int *nr)
-{
-	pte_t *ptep;
-	unsigned long sz = 1UL << hugepd_shift(hugepd);
-	unsigned long next;
-
-	ptep = hugepte_offset(hugepd, addr, pdshift);
-	do {
-		next = hugepte_addr_end(addr, end, sz);
-		if (!gup_hugepte(ptep, sz, addr, end, flags, pages, nr))
-			return 0;
-	} while (ptep++, addr = next, addr != end);
-
-	return 1;
-}
-#else
-static inline int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
-		unsigned int pdshift, unsigned long end, unsigned int flags,
-		struct page **pages, int *nr)
-{
-	return 0;
-}
-#endif /* CONFIG_ARCH_HAS_HUGEPD */
-
 static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
 			unsigned long end, unsigned int flags,
 			struct page **pages, int *nr)
@@ -3026,14 +2943,6 @@ static int gup_pmd_range(pud_t *pudp, pud_t pud, unsigned long addr, unsigned lo
 				pages, nr))
 				return 0;
 
-		} else if (unlikely(is_hugepd(__hugepd(pmd_val(pmd))))) {
-			/*
-			 * architecture have different format for hugetlbfs
-			 * pmd format and THP pmd format
-			 */
-			if (!gup_huge_pd(__hugepd(pmd_val(pmd)), addr,
-					 PMD_SHIFT, next, flags, pages, nr))
-				return 0;
 		} else if (!gup_pte_range(pmd, pmdp, addr, next, flags, pages, nr))
 			return 0;
 	} while (pmdp++, addr = next, addr != end);
@@ -3058,10 +2967,6 @@ static int gup_pud_range(p4d_t *p4dp, p4d_t p4d, unsigned long addr, unsigned lo
 			if (!gup_huge_pud(pud, pudp, addr, next, flags,
 					  pages, nr))
 				return 0;
-		} else if (unlikely(is_hugepd(__hugepd(pud_val(pud))))) {
-			if (!gup_huge_pd(__hugepd(pud_val(pud)), addr,
-					 PUD_SHIFT, next, flags, pages, nr))
-				return 0;
 		} else if (!gup_pmd_range(pudp, pud, addr, next, flags, pages, nr))
 			return 0;
 	} while (pudp++, addr = next, addr != end);
@@ -3083,11 +2988,7 @@ static int gup_p4d_range(pgd_t *pgdp, pgd_t pgd, unsigned long addr, unsigned lo
 		if (p4d_none(p4d))
 			return 0;
 		BUILD_BUG_ON(p4d_huge(p4d));
-		if (unlikely(is_hugepd(__hugepd(p4d_val(p4d))))) {
-			if (!gup_huge_pd(__hugepd(p4d_val(p4d)), addr,
-					 P4D_SHIFT, next, flags, pages, nr))
-				return 0;
-		} else if (!gup_pud_range(p4dp, p4d, addr, next, flags, pages, nr))
+		if (!gup_pud_range(p4dp, p4d, addr, next, flags, pages, nr))
 			return 0;
 	} while (p4dp++, addr = next, addr != end);
 
@@ -3111,10 +3012,6 @@ static void gup_pgd_range(unsigned long addr, unsigned long end,
 			if (!gup_huge_pgd(pgd, pgdp, addr, next, flags,
 					  pages, nr))
 				return;
-		} else if (unlikely(is_hugepd(__hugepd(pgd_val(pgd))))) {
-			if (!gup_huge_pd(__hugepd(pgd_val(pgd)), addr,
-					 PGDIR_SHIFT, next, flags, pages, nr))
-				return;
 		} else if (!gup_p4d_range(pgdp, pgd, addr, next, flags, pages, nr))
 			return;
 	} while (pgdp++, addr = next, addr != end);
diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index f46c80b18ce4..ae2f08ce991b 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -73,45 +73,6 @@ static int walk_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	return err;
 }
 
-#ifdef CONFIG_ARCH_HAS_HUGEPD
-static int walk_hugepd_range(hugepd_t *phpd, unsigned long addr,
-			     unsigned long end, struct mm_walk *walk, int pdshift)
-{
-	int err = 0;
-	const struct mm_walk_ops *ops = walk->ops;
-	int shift = hugepd_shift(*phpd);
-	int page_size = 1 << shift;
-
-	if (!ops->pte_entry)
-		return 0;
-
-	if (addr & (page_size - 1))
-		return 0;
-
-	for (;;) {
-		pte_t *pte;
-
-		spin_lock(&walk->mm->page_table_lock);
-		pte = hugepte_offset(*phpd, addr, pdshift);
-		err = ops->pte_entry(pte, addr, addr + page_size, walk);
-		spin_unlock(&walk->mm->page_table_lock);
-
-		if (err)
-			break;
-		if (addr >= end - page_size)
-			break;
-		addr += page_size;
-	}
-	return err;
-}
-#else
-static int walk_hugepd_range(hugepd_t *phpd, unsigned long addr,
-			     unsigned long end, struct mm_walk *walk, int pdshift)
-{
-	return 0;
-}
-#endif
-
 static int walk_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
 			  struct mm_walk *walk)
 {
@@ -159,10 +120,7 @@ static int walk_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
 		if (walk->vma)
 			split_huge_pmd(walk->vma, pmd, addr);
 
-		if (is_hugepd(__hugepd(pmd_val(*pmd))))
-			err = walk_hugepd_range((hugepd_t *)pmd, addr, next, walk, PMD_SHIFT);
-		else
-			err = walk_pte_range(pmd, addr, next, walk);
+		err = walk_pte_range(pmd, addr, next, walk);
 		if (err)
 			break;
 
@@ -215,10 +173,7 @@ static int walk_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
 		if (pud_none(*pud))
 			goto again;
 
-		if (is_hugepd(__hugepd(pud_val(*pud))))
-			err = walk_hugepd_range((hugepd_t *)pud, addr, next, walk, PUD_SHIFT);
-		else
-			err = walk_pmd_range(pud, addr, next, walk);
+		err = walk_pmd_range(pud, addr, next, walk);
 		if (err)
 			break;
 	} while (pud++, addr = next, addr != end);
@@ -250,9 +205,7 @@ static int walk_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
 			if (err)
 				break;
 		}
-		if (is_hugepd(__hugepd(p4d_val(*p4d))))
-			err = walk_hugepd_range((hugepd_t *)p4d, addr, next, walk, P4D_SHIFT);
-		else if (ops->pud_entry || ops->pmd_entry || ops->pte_entry)
+		if (ops->pud_entry || ops->pmd_entry || ops->pte_entry)
 			err = walk_pud_range(p4d, addr, next, walk);
 		if (err)
 			break;
@@ -287,9 +240,7 @@ static int walk_pgd_range(unsigned long addr, unsigned long end,
 			if (err)
 				break;
 		}
-		if (is_hugepd(__hugepd(pgd_val(*pgd))))
-			err = walk_hugepd_range((hugepd_t *)pgd, addr, next, walk, PGDIR_SHIFT);
-		else if (ops->p4d_entry || ops->pud_entry || ops->pmd_entry || ops->pte_entry)
+		if (ops->p4d_entry || ops->pud_entry || ops->pmd_entry || ops->pte_entry)
 			err = walk_p4d_range(pgd, addr, next, walk);
 		if (err)
 			break;
-- 
2.44.0

