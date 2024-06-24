Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 740499150FB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 16:54:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W79wt0K81z7B5n
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 00:54:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W79mc2bzLz3g0V
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 00:47:44 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4W79lC0NDpz9vGT;
	Mon, 24 Jun 2024 16:46:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g2dHISHThZS9; Mon, 24 Jun 2024 16:46:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4W79ks0HZ6z9vFn;
	Mon, 24 Jun 2024 16:46:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EDE1B8B766;
	Mon, 24 Jun 2024 16:46:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id y73lp4be_T7m; Mon, 24 Jun 2024 16:46:12 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.33])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 293D38B763;
	Mon, 24 Jun 2024 16:46:12 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v6 23/23] mm: Remove CONFIG_ARCH_HAS_HUGEPD
Date: Mon, 24 Jun 2024 16:45:49 +0200
Message-ID: <66892aed25ad48d40cf712a4bc9ef6adf66a3df3.1719240269.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1719240269.git.christophe.leroy@csgroup.eu>
References: <cover.1719240269.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719240335; l=13586; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Y1XVRHwCVZ8xeJIn07qpa+DttHLbfiXuhJi5QGHmEdM=; b=g6ECU2ZsSRru8kwNAW+iMOee6Ocm4qSkGI2dQql6xdE22XtQEDIS/D3vqu3z/IflThCNh4aFW 1YGM6sFNdaeCtuw5w+DR6jPXDxUELRGMLB79bIUoRfdP6Svhzq+Tncb
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc was the only user of CONFIG_ARCH_HAS_HUGEPD and doesn't
use it anymore, so remove all related code.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Oscar Salvador <osalvador@suse.de>
---
v4: Rebased on v6.10-rc1
---
 include/linux/hugetlb.h |   6 --
 mm/Kconfig              |  10 ---
 mm/gup.c                | 183 ++--------------------------------------
 mm/pagewalk.c           |  57 +------------
 4 files changed, 9 insertions(+), 247 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 2b3c3a404769..58daf7d14bf4 100644
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
index b4cb45255a54..049d29ec6e20 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1119,16 +1119,6 @@ config DMAPOOL_TEST
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
index 43491246f39d..f8e982a42bba 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -501,7 +501,7 @@ static inline void mm_set_has_pinned_flag(unsigned long *mm_flags)
 
 #ifdef CONFIG_MMU
 
-#if defined(CONFIG_ARCH_HAS_HUGEPD) || defined(CONFIG_HAVE_GUP_FAST)
+#ifdef CONFIG_HAVE_GUP_FAST
 static int record_subpages(struct page *page, unsigned long sz,
 			   unsigned long addr, unsigned long end,
 			   struct page **pages)
@@ -515,147 +515,7 @@ static int record_subpages(struct page *page, unsigned long sz,
 
 	return nr;
 }
-#endif	/* CONFIG_ARCH_HAS_HUGEPD || CONFIG_HAVE_GUP_FAST */
-
-#ifdef CONFIG_ARCH_HAS_HUGEPD
-static unsigned long hugepte_addr_end(unsigned long addr, unsigned long end,
-				      unsigned long sz)
-{
-	unsigned long __boundary = (addr + sz) & ~(sz-1);
-	return (__boundary - 1 < end - 1) ? __boundary : end;
-}
-
-/*
- * Returns 1 if succeeded, 0 if failed, -EMLINK if unshare needed.
- *
- * NOTE: for the same entry, gup-fast and gup-slow can return different
- * results (0 v.s. -EMLINK) depending on whether vma is available.  This is
- * the expected behavior, where we simply want gup-fast to fallback to
- * gup-slow to take the vma reference first.
- */
-static int gup_hugepte(struct vm_area_struct *vma, pte_t *ptep, unsigned long sz,
-		       unsigned long addr, unsigned long end, unsigned int flags,
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
-	pte = huge_ptep_get(vma->vm_mm, addr, ptep);
-
-	if (!pte_access_permitted(pte, flags & FOLL_WRITE))
-		return 0;
-
-	/* hugepages are never "special" */
-	VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
-
-	page = pte_page(pte);
-	refs = record_subpages(page, sz, addr, end, pages + *nr);
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
-	if (!pte_write(pte) && gup_must_unshare(vma, flags, &folio->page)) {
-		gup_put_folio(folio, refs, flags);
-		return -EMLINK;
-	}
-
-	*nr += refs;
-	folio_set_referenced(folio);
-	return 1;
-}
-
-/*
- * NOTE: currently GUP for a hugepd is only possible on hugetlbfs file
- * systems on Power, which does not have issue with folio writeback against
- * GUP updates.  When hugepd will be extended to support non-hugetlbfs or
- * even anonymous memory, we need to do extra check as what we do with most
- * of the other folios. See writable_file_mapping_allowed() and
- * gup_fast_folio_allowed() for more information.
- */
-static int gup_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
-		      unsigned long addr, unsigned int pdshift,
-		      unsigned long end, unsigned int flags,
-		      struct page **pages, int *nr)
-{
-	pte_t *ptep;
-	unsigned long sz = 1UL << hugepd_shift(hugepd);
-	unsigned long next;
-	int ret;
-
-	ptep = hugepte_offset(hugepd, addr, pdshift);
-	do {
-		next = hugepte_addr_end(addr, end, sz);
-		ret = gup_hugepte(vma, ptep, sz, addr, end, flags, pages, nr);
-		if (ret != 1)
-			return ret;
-	} while (ptep++, addr = next, addr != end);
-
-	return 1;
-}
-
-static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
-				  unsigned long addr, unsigned int pdshift,
-				  unsigned int flags,
-				  struct follow_page_context *ctx)
-{
-	struct page *page;
-	struct hstate *h;
-	spinlock_t *ptl;
-	int nr = 0, ret;
-	pte_t *ptep;
-
-	/* Only hugetlb supports hugepd */
-	if (WARN_ON_ONCE(!is_vm_hugetlb_page(vma)))
-		return ERR_PTR(-EFAULT);
-
-	h = hstate_vma(vma);
-	ptep = hugepte_offset(hugepd, addr, pdshift);
-	ptl = huge_pte_lock(h, vma->vm_mm, ptep);
-	ret = gup_hugepd(vma, hugepd, addr, pdshift, addr + PAGE_SIZE,
-			 flags, &page, &nr);
-	spin_unlock(ptl);
-
-	if (ret == 1) {
-		/* GUP succeeded */
-		WARN_ON_ONCE(nr != 1);
-		ctx->page_mask = (1U << huge_page_order(h)) - 1;
-		return page;
-	}
-
-	/* ret can be either 0 (translates to NULL) or negative */
-	return ERR_PTR(ret);
-}
-#else /* CONFIG_ARCH_HAS_HUGEPD */
-static inline int gup_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
-			     unsigned long addr, unsigned int pdshift,
-			     unsigned long end, unsigned int flags,
-			     struct page **pages, int *nr)
-{
-	return 0;
-}
-
-static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
-				  unsigned long addr, unsigned int pdshift,
-				  unsigned int flags,
-				  struct follow_page_context *ctx)
-{
-	return NULL;
-}
-#endif /* CONFIG_ARCH_HAS_HUGEPD */
-
+#endif	/* CONFIG_HAVE_GUP_FAST */
 
 static struct page *no_page_table(struct vm_area_struct *vma,
 				  unsigned int flags, unsigned long address)
@@ -1025,9 +885,6 @@ static struct page *follow_pmd_mask(struct vm_area_struct *vma,
 		return no_page_table(vma, flags, address);
 	if (!pmd_present(pmdval))
 		return no_page_table(vma, flags, address);
-	if (unlikely(is_hugepd(__hugepd(pmd_val(pmdval)))))
-		return follow_hugepd(vma, __hugepd(pmd_val(pmdval)),
-				     address, PMD_SHIFT, flags, ctx);
 	if (pmd_devmap(pmdval)) {
 		ptl = pmd_lock(mm, pmd);
 		page = follow_devmap_pmd(vma, address, pmd, flags, &ctx->pgmap);
@@ -1078,9 +935,6 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
 	pud = READ_ONCE(*pudp);
 	if (!pud_present(pud))
 		return no_page_table(vma, flags, address);
-	if (unlikely(is_hugepd(__hugepd(pud_val(pud)))))
-		return follow_hugepd(vma, __hugepd(pud_val(pud)),
-				     address, PUD_SHIFT, flags, ctx);
 	if (pud_leaf(pud)) {
 		ptl = pud_lock(mm, pudp);
 		page = follow_huge_pud(vma, address, pudp, flags, ctx);
@@ -1106,10 +960,6 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
 	p4d = READ_ONCE(*p4dp);
 	BUILD_BUG_ON(p4d_leaf(p4d));
 
-	if (unlikely(is_hugepd(__hugepd(p4d_val(p4d)))))
-		return follow_hugepd(vma, __hugepd(p4d_val(p4d)),
-				     address, P4D_SHIFT, flags, ctx);
-
 	if (!p4d_present(p4d) || p4d_bad(p4d))
 		return no_page_table(vma, flags, address);
 
@@ -1153,10 +1003,7 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 	ctx->page_mask = 0;
 	pgd = pgd_offset(mm, address);
 
-	if (unlikely(is_hugepd(__hugepd(pgd_val(*pgd)))))
-		page = follow_hugepd(vma, __hugepd(pgd_val(*pgd)),
-				     address, PGDIR_SHIFT, flags, ctx);
-	else if (pgd_none(*pgd) || unlikely(pgd_bad(*pgd)))
+	if (pgd_none(*pgd) || unlikely(pgd_bad(*pgd)))
 		page = no_page_table(vma, flags, address);
 	else
 		page = follow_p4d_mask(vma, address, pgd, flags, ctx);
@@ -3270,14 +3117,6 @@ static int gup_fast_pmd_range(pud_t *pudp, pud_t pud, unsigned long addr,
 				pages, nr))
 				return 0;
 
-		} else if (unlikely(is_hugepd(__hugepd(pmd_val(pmd))))) {
-			/*
-			 * architecture have different format for hugetlbfs
-			 * pmd format and THP pmd format
-			 */
-			if (gup_hugepd(NULL, __hugepd(pmd_val(pmd)), addr,
-				       PMD_SHIFT, next, flags, pages, nr) != 1)
-				return 0;
 		} else if (!gup_fast_pte_range(pmd, pmdp, addr, next, flags,
 					       pages, nr))
 			return 0;
@@ -3304,10 +3143,6 @@ static int gup_fast_pud_range(p4d_t *p4dp, p4d_t p4d, unsigned long addr,
 			if (!gup_fast_pud_leaf(pud, pudp, addr, next, flags,
 					       pages, nr))
 				return 0;
-		} else if (unlikely(is_hugepd(__hugepd(pud_val(pud))))) {
-			if (gup_hugepd(NULL, __hugepd(pud_val(pud)), addr,
-				       PUD_SHIFT, next, flags, pages, nr) != 1)
-				return 0;
 		} else if (!gup_fast_pmd_range(pudp, pud, addr, next, flags,
 					       pages, nr))
 			return 0;
@@ -3331,12 +3166,8 @@ static int gup_fast_p4d_range(pgd_t *pgdp, pgd_t pgd, unsigned long addr,
 		if (!p4d_present(p4d))
 			return 0;
 		BUILD_BUG_ON(p4d_leaf(p4d));
-		if (unlikely(is_hugepd(__hugepd(p4d_val(p4d))))) {
-			if (gup_hugepd(NULL, __hugepd(p4d_val(p4d)), addr,
-				       P4D_SHIFT, next, flags, pages, nr) != 1)
-				return 0;
-		} else if (!gup_fast_pud_range(p4dp, p4d, addr, next, flags,
-					       pages, nr))
+		if (!gup_fast_pud_range(p4dp, p4d, addr, next, flags,
+					pages, nr))
 			return 0;
 	} while (p4dp++, addr = next, addr != end);
 
@@ -3360,10 +3191,6 @@ static void gup_fast_pgd_range(unsigned long addr, unsigned long end,
 			if (!gup_fast_pgd_leaf(pgd, pgdp, addr, next, flags,
 					       pages, nr))
 				return;
-		} else if (unlikely(is_hugepd(__hugepd(pgd_val(pgd))))) {
-			if (gup_hugepd(NULL, __hugepd(pgd_val(pgd)), addr,
-				       PGDIR_SHIFT, next, flags, pages, nr) != 1)
-				return;
 		} else if (!gup_fast_p4d_range(pgdp, pgd, addr, next, flags,
 					       pages, nr))
 			return;
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

