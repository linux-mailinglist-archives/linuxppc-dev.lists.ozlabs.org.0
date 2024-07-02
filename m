Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D91E7923FC7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 16:00:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD4LY4sFgz7BjJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 00:00:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD4BH3HBrz3gC7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 23:53:27 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4WD48Q1q3Xz9v4H;
	Tue,  2 Jul 2024 15:51:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1aogaygGae49; Tue,  2 Jul 2024 15:51:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4WD4890zSLz9tZl;
	Tue,  2 Jul 2024 15:51:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1CAB18B775;
	Tue,  2 Jul 2024 15:51:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id KrwMFsqEwazi; Tue,  2 Jul 2024 15:51:37 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.12])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 790BC8B764;
	Tue,  2 Jul 2024 15:51:36 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v7 22/23] powerpc/mm: Remove hugepd leftovers
Date: Tue,  2 Jul 2024 15:51:34 +0200
Message-ID: <39c0d0adee6790fc42cee9f458e05fb95136c3dd.1719928057.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1719928057.git.christophe.leroy@csgroup.eu>
References: <cover.1719928057.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719928275; l=18716; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=hRfDLIZLnNuYyLyTuuY10TaUMZmvM7CY+ONZE5z7zuE=; b=mWwzBBaiNM3igxxIKRqIYsMUG+ENPCanPxJ2URvsFUHYCowrxPG9Y+se2vsAp8QPPpBw88+eU EuoAIdr5/NxDj2yqEKR2Ll9w6GbrpMRDZZgVIYCdZXFw0phqSYc6VVA
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

All targets have now opted out of CONFIG_ARCH_HAS_HUGEPD so
remove left over code.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Oscar Salvador <osalvador@suse.de>
---
v5: Fix a forgotten #endif which ended up in following patch
---
 arch/powerpc/include/asm/hugetlb.h          |   7 -
 arch/powerpc/include/asm/page.h             |   6 -
 arch/powerpc/include/asm/pgtable-be-types.h |  10 -
 arch/powerpc/include/asm/pgtable-types.h    |   9 -
 arch/powerpc/mm/hugetlbpage.c               | 413 --------------------
 arch/powerpc/mm/init-common.c               |   8 +-
 arch/powerpc/mm/pgtable.c                   |  27 +-
 7 files changed, 3 insertions(+), 477 deletions(-)

diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index e959c26c0b52..18a3028ac3b6 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -30,13 +30,6 @@ static inline int is_hugepage_only_range(struct mm_struct *mm,
 }
 #define is_hugepage_only_range is_hugepage_only_range
 
-#ifdef CONFIG_ARCH_HAS_HUGEPD
-#define __HAVE_ARCH_HUGETLB_FREE_PGD_RANGE
-void hugetlb_free_pgd_range(struct mmu_gather *tlb, unsigned long addr,
-			    unsigned long end, unsigned long floor,
-			    unsigned long ceiling);
-#endif
-
 #define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 		     pte_t pte, unsigned long sz);
diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index c0af246a64ff..83d0a4fc5f75 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -269,12 +269,6 @@ static inline const void *pfn_to_kaddr(unsigned long pfn)
 #define is_kernel_addr(x)	((x) >= TASK_SIZE)
 #endif
 
-/*
- * Some number of bits at the level of the page table that points to
- * a hugepte are used to encode the size.  This masks those bits.
- */
-#define HUGEPD_SHIFT_MASK     0x3f
-
 #ifndef __ASSEMBLY__
 
 #ifdef CONFIG_PPC_BOOK3S_64
diff --git a/arch/powerpc/include/asm/pgtable-be-types.h b/arch/powerpc/include/asm/pgtable-be-types.h
index 82633200b500..6bd8f89b25dc 100644
--- a/arch/powerpc/include/asm/pgtable-be-types.h
+++ b/arch/powerpc/include/asm/pgtable-be-types.h
@@ -101,14 +101,4 @@ static inline bool pmd_xchg(pmd_t *pmdp, pmd_t old, pmd_t new)
 	return pmd_raw(old) == prev;
 }
 
-#ifdef CONFIG_ARCH_HAS_HUGEPD
-typedef struct { __be64 pdbe; } hugepd_t;
-#define __hugepd(x) ((hugepd_t) { cpu_to_be64(x) })
-
-static inline unsigned long hpd_val(hugepd_t x)
-{
-	return be64_to_cpu(x.pdbe);
-}
-#endif
-
 #endif /* _ASM_POWERPC_PGTABLE_BE_TYPES_H */
diff --git a/arch/powerpc/include/asm/pgtable-types.h b/arch/powerpc/include/asm/pgtable-types.h
index db965d98e0ae..7b3d4c592a10 100644
--- a/arch/powerpc/include/asm/pgtable-types.h
+++ b/arch/powerpc/include/asm/pgtable-types.h
@@ -87,13 +87,4 @@ static inline bool pte_xchg(pte_t *ptep, pte_t old, pte_t new)
 }
 #endif
 
-#ifdef CONFIG_ARCH_HAS_HUGEPD
-typedef struct { unsigned long pd; } hugepd_t;
-#define __hugepd(x) ((hugepd_t) { (x) })
-static inline unsigned long hpd_val(hugepd_t x)
-{
-	return x.pd;
-}
-#endif
-
 #endif /* _ASM_POWERPC_PGTABLE_TYPES_H */
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 1fe2843f5b12..6b043180220a 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -28,8 +28,6 @@
 
 bool hugetlb_disabled = false;
 
-#define hugepd_none(hpd)	(hpd_val(hpd) == 0)
-
 #define PTE_T_ORDER	(__builtin_ffs(sizeof(pte_basic_t)) - \
 			 __builtin_ffs(sizeof(void *)))
 
@@ -42,156 +40,6 @@ pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr, unsigned long s
 	return __find_linux_pte(mm->pgd, addr, NULL, NULL);
 }
 
-#ifdef CONFIG_ARCH_HAS_HUGEPD
-static int __hugepte_alloc(struct mm_struct *mm, hugepd_t *hpdp,
-			   unsigned long address, unsigned int pdshift,
-			   unsigned int pshift, spinlock_t *ptl)
-{
-	struct kmem_cache *cachep;
-	pte_t *new;
-	int i;
-	int num_hugepd;
-
-	if (pshift >= pdshift) {
-		cachep = PGT_CACHE(PTE_T_ORDER);
-		num_hugepd = 1 << (pshift - pdshift);
-	} else {
-		cachep = PGT_CACHE(pdshift - pshift);
-		num_hugepd = 1;
-	}
-
-	if (!cachep) {
-		WARN_ONCE(1, "No page table cache created for hugetlb tables");
-		return -ENOMEM;
-	}
-
-	new = kmem_cache_alloc(cachep, pgtable_gfp_flags(mm, GFP_KERNEL));
-
-	BUG_ON(pshift > HUGEPD_SHIFT_MASK);
-	BUG_ON((unsigned long)new & HUGEPD_SHIFT_MASK);
-
-	if (!new)
-		return -ENOMEM;
-
-	/*
-	 * Make sure other cpus find the hugepd set only after a
-	 * properly initialized page table is visible to them.
-	 * For more details look for comment in __pte_alloc().
-	 */
-	smp_wmb();
-
-	spin_lock(ptl);
-	/*
-	 * We have multiple higher-level entries that point to the same
-	 * actual pte location.  Fill in each as we go and backtrack on error.
-	 * We need all of these so the DTLB pgtable walk code can find the
-	 * right higher-level entry without knowing if it's a hugepage or not.
-	 */
-	for (i = 0; i < num_hugepd; i++, hpdp++) {
-		if (unlikely(!hugepd_none(*hpdp)))
-			break;
-		hugepd_populate(hpdp, new, pshift);
-	}
-	/* If we bailed from the for loop early, an error occurred, clean up */
-	if (i < num_hugepd) {
-		for (i = i - 1 ; i >= 0; i--, hpdp--)
-			*hpdp = __hugepd(0);
-		kmem_cache_free(cachep, new);
-	} else {
-		kmemleak_ignore(new);
-	}
-	spin_unlock(ptl);
-	return 0;
-}
-
-/*
- * At this point we do the placement change only for BOOK3S 64. This would
- * possibly work on other subarchs.
- */
-pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
-		      unsigned long addr, unsigned long sz)
-{
-	pgd_t *pg;
-	p4d_t *p4;
-	pud_t *pu;
-	pmd_t *pm;
-	hugepd_t *hpdp = NULL;
-	unsigned pshift = __ffs(sz);
-	unsigned pdshift = PGDIR_SHIFT;
-	spinlock_t *ptl;
-
-	addr &= ~(sz-1);
-	pg = pgd_offset(mm, addr);
-	p4 = p4d_offset(pg, addr);
-
-#ifdef CONFIG_PPC_BOOK3S_64
-	if (pshift == PGDIR_SHIFT)
-		/* 16GB huge page */
-		return (pte_t *) p4;
-	else if (pshift > PUD_SHIFT) {
-		/*
-		 * We need to use hugepd table
-		 */
-		ptl = &mm->page_table_lock;
-		hpdp = (hugepd_t *)p4;
-	} else {
-		pdshift = PUD_SHIFT;
-		pu = pud_alloc(mm, p4, addr);
-		if (!pu)
-			return NULL;
-		if (pshift == PUD_SHIFT)
-			return (pte_t *)pu;
-		else if (pshift > PMD_SHIFT) {
-			ptl = pud_lockptr(mm, pu);
-			hpdp = (hugepd_t *)pu;
-		} else {
-			pdshift = PMD_SHIFT;
-			pm = pmd_alloc(mm, pu, addr);
-			if (!pm)
-				return NULL;
-			if (pshift == PMD_SHIFT)
-				/* 16MB hugepage */
-				return (pte_t *)pm;
-			else {
-				ptl = pmd_lockptr(mm, pm);
-				hpdp = (hugepd_t *)pm;
-			}
-		}
-	}
-#else
-	if (pshift >= PGDIR_SHIFT) {
-		ptl = &mm->page_table_lock;
-		hpdp = (hugepd_t *)p4;
-	} else {
-		pdshift = PUD_SHIFT;
-		pu = pud_alloc(mm, p4, addr);
-		if (!pu)
-			return NULL;
-		if (pshift >= PUD_SHIFT) {
-			ptl = pud_lockptr(mm, pu);
-			hpdp = (hugepd_t *)pu;
-		} else {
-			pdshift = PMD_SHIFT;
-			pm = pmd_alloc(mm, pu, addr);
-			if (!pm)
-				return NULL;
-			ptl = pmd_lockptr(mm, pm);
-			hpdp = (hugepd_t *)pm;
-		}
-	}
-#endif
-	if (!hpdp)
-		return NULL;
-
-	BUG_ON(!hugepd_none(*hpdp) && !hugepd_ok(*hpdp));
-
-	if (hugepd_none(*hpdp) && __hugepte_alloc(mm, hpdp, addr,
-						  pdshift, pshift, ptl))
-		return NULL;
-
-	return hugepte_offset(*hpdp, addr, pdshift);
-}
-#else
 pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 		      unsigned long addr, unsigned long sz)
 {
@@ -230,7 +78,6 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 
 	return pte_alloc_huge(mm, pmd, addr);
 }
-#endif
 
 #ifdef CONFIG_PPC_BOOK3S_64
 /*
@@ -286,266 +133,6 @@ int __init alloc_bootmem_huge_page(struct hstate *h, int nid)
 	return __alloc_bootmem_huge_page(h, nid);
 }
 
-#ifdef CONFIG_ARCH_HAS_HUGEPD
-#ifndef CONFIG_PPC_BOOK3S_64
-#define HUGEPD_FREELIST_SIZE \
-	((PAGE_SIZE - sizeof(struct hugepd_freelist)) / sizeof(pte_t))
-
-struct hugepd_freelist {
-	struct rcu_head	rcu;
-	unsigned int index;
-	void *ptes[];
-};
-
-static DEFINE_PER_CPU(struct hugepd_freelist *, hugepd_freelist_cur);
-
-static void hugepd_free_rcu_callback(struct rcu_head *head)
-{
-	struct hugepd_freelist *batch =
-		container_of(head, struct hugepd_freelist, rcu);
-	unsigned int i;
-
-	for (i = 0; i < batch->index; i++)
-		kmem_cache_free(PGT_CACHE(PTE_T_ORDER), batch->ptes[i]);
-
-	free_page((unsigned long)batch);
-}
-
-static void hugepd_free(struct mmu_gather *tlb, void *hugepte)
-{
-	struct hugepd_freelist **batchp;
-
-	batchp = &get_cpu_var(hugepd_freelist_cur);
-
-	if (atomic_read(&tlb->mm->mm_users) < 2 ||
-	    mm_is_thread_local(tlb->mm)) {
-		kmem_cache_free(PGT_CACHE(PTE_T_ORDER), hugepte);
-		put_cpu_var(hugepd_freelist_cur);
-		return;
-	}
-
-	if (*batchp == NULL) {
-		*batchp = (struct hugepd_freelist *)__get_free_page(GFP_ATOMIC);
-		(*batchp)->index = 0;
-	}
-
-	(*batchp)->ptes[(*batchp)->index++] = hugepte;
-	if ((*batchp)->index == HUGEPD_FREELIST_SIZE) {
-		call_rcu(&(*batchp)->rcu, hugepd_free_rcu_callback);
-		*batchp = NULL;
-	}
-	put_cpu_var(hugepd_freelist_cur);
-}
-#else
-static inline void hugepd_free(struct mmu_gather *tlb, void *hugepte) {}
-#endif
-
-/* Return true when the entry to be freed maps more than the area being freed */
-static bool range_is_outside_limits(unsigned long start, unsigned long end,
-				    unsigned long floor, unsigned long ceiling,
-				    unsigned long mask)
-{
-	if ((start & mask) < floor)
-		return true;
-	if (ceiling) {
-		ceiling &= mask;
-		if (!ceiling)
-			return true;
-	}
-	return end - 1 > ceiling - 1;
-}
-
-static void free_hugepd_range(struct mmu_gather *tlb, hugepd_t *hpdp, int pdshift,
-			      unsigned long start, unsigned long end,
-			      unsigned long floor, unsigned long ceiling)
-{
-	pte_t *hugepte = hugepd_page(*hpdp);
-	int i;
-
-	unsigned long pdmask = ~((1UL << pdshift) - 1);
-	unsigned int num_hugepd = 1;
-	unsigned int shift = hugepd_shift(*hpdp);
-
-	/* Note: On fsl the hpdp may be the first of several */
-	if (shift > pdshift)
-		num_hugepd = 1 << (shift - pdshift);
-
-	if (range_is_outside_limits(start, end, floor, ceiling, pdmask))
-		return;
-
-	for (i = 0; i < num_hugepd; i++, hpdp++)
-		*hpdp = __hugepd(0);
-
-	if (shift >= pdshift)
-		hugepd_free(tlb, hugepte);
-	else
-		pgtable_free_tlb(tlb, hugepte,
-				 get_hugepd_cache_index(pdshift - shift));
-}
-
-static void hugetlb_free_pte_range(struct mmu_gather *tlb, pmd_t *pmd,
-				   unsigned long addr, unsigned long end,
-				   unsigned long floor, unsigned long ceiling)
-{
-	pgtable_t token = pmd_pgtable(*pmd);
-
-	if (range_is_outside_limits(addr, end, floor, ceiling, PMD_MASK))
-		return;
-
-	pmd_clear(pmd);
-	pte_free_tlb(tlb, token, addr);
-	mm_dec_nr_ptes(tlb->mm);
-}
-
-static void hugetlb_free_pmd_range(struct mmu_gather *tlb, pud_t *pud,
-				   unsigned long addr, unsigned long end,
-				   unsigned long floor, unsigned long ceiling)
-{
-	pmd_t *pmd;
-	unsigned long next;
-	unsigned long start;
-
-	start = addr;
-	do {
-		unsigned long more;
-
-		pmd = pmd_offset(pud, addr);
-		next = pmd_addr_end(addr, end);
-		if (!is_hugepd(__hugepd(pmd_val(*pmd)))) {
-			if (pmd_none_or_clear_bad(pmd))
-				continue;
-
-			/*
-			 * if it is not hugepd pointer, we should already find
-			 * it cleared.
-			 */
-			WARN_ON(!IS_ENABLED(CONFIG_PPC_8xx));
-
-			hugetlb_free_pte_range(tlb, pmd, addr, end, floor, ceiling);
-
-			continue;
-		}
-		/*
-		 * Increment next by the size of the huge mapping since
-		 * there may be more than one entry at this level for a
-		 * single hugepage, but all of them point to
-		 * the same kmem cache that holds the hugepte.
-		 */
-		more = addr + (1UL << hugepd_shift(*(hugepd_t *)pmd));
-		if (more > next)
-			next = more;
-
-		free_hugepd_range(tlb, (hugepd_t *)pmd, PMD_SHIFT,
-				  addr, next, floor, ceiling);
-	} while (addr = next, addr != end);
-
-	if (range_is_outside_limits(start, end, floor, ceiling, PUD_MASK))
-		return;
-
-	pmd = pmd_offset(pud, start & PUD_MASK);
-	pud_clear(pud);
-	pmd_free_tlb(tlb, pmd, start & PUD_MASK);
-	mm_dec_nr_pmds(tlb->mm);
-}
-
-static void hugetlb_free_pud_range(struct mmu_gather *tlb, p4d_t *p4d,
-				   unsigned long addr, unsigned long end,
-				   unsigned long floor, unsigned long ceiling)
-{
-	pud_t *pud;
-	unsigned long next;
-	unsigned long start;
-
-	start = addr;
-	do {
-		pud = pud_offset(p4d, addr);
-		next = pud_addr_end(addr, end);
-		if (!is_hugepd(__hugepd(pud_val(*pud)))) {
-			if (pud_none_or_clear_bad(pud))
-				continue;
-			hugetlb_free_pmd_range(tlb, pud, addr, next, floor,
-					       ceiling);
-		} else {
-			unsigned long more;
-			/*
-			 * Increment next by the size of the huge mapping since
-			 * there may be more than one entry at this level for a
-			 * single hugepage, but all of them point to
-			 * the same kmem cache that holds the hugepte.
-			 */
-			more = addr + (1UL << hugepd_shift(*(hugepd_t *)pud));
-			if (more > next)
-				next = more;
-
-			free_hugepd_range(tlb, (hugepd_t *)pud, PUD_SHIFT,
-					  addr, next, floor, ceiling);
-		}
-	} while (addr = next, addr != end);
-
-	if (range_is_outside_limits(start, end, floor, ceiling, PGDIR_MASK))
-		return;
-
-	pud = pud_offset(p4d, start & PGDIR_MASK);
-	p4d_clear(p4d);
-	pud_free_tlb(tlb, pud, start & PGDIR_MASK);
-	mm_dec_nr_puds(tlb->mm);
-}
-
-/*
- * This function frees user-level page tables of a process.
- */
-void hugetlb_free_pgd_range(struct mmu_gather *tlb,
-			    unsigned long addr, unsigned long end,
-			    unsigned long floor, unsigned long ceiling)
-{
-	pgd_t *pgd;
-	p4d_t *p4d;
-	unsigned long next;
-
-	/*
-	 * Because there are a number of different possible pagetable
-	 * layouts for hugepage ranges, we limit knowledge of how
-	 * things should be laid out to the allocation path
-	 * (huge_pte_alloc(), above).  Everything else works out the
-	 * structure as it goes from information in the hugepd
-	 * pointers.  That means that we can't here use the
-	 * optimization used in the normal page free_pgd_range(), of
-	 * checking whether we're actually covering a large enough
-	 * range to have to do anything at the top level of the walk
-	 * instead of at the bottom.
-	 *
-	 * To make sense of this, you should probably go read the big
-	 * block comment at the top of the normal free_pgd_range(),
-	 * too.
-	 */
-
-	do {
-		next = pgd_addr_end(addr, end);
-		pgd = pgd_offset(tlb->mm, addr);
-		p4d = p4d_offset(pgd, addr);
-		if (!is_hugepd(__hugepd(pgd_val(*pgd)))) {
-			if (p4d_none_or_clear_bad(p4d))
-				continue;
-			hugetlb_free_pud_range(tlb, p4d, addr, next, floor, ceiling);
-		} else {
-			unsigned long more;
-			/*
-			 * Increment next by the size of the huge mapping since
-			 * there may be more than one entry at the pgd level
-			 * for a single hugepage, but all of them point to the
-			 * same kmem cache that holds the hugepte.
-			 */
-			more = addr + (1UL << hugepd_shift(*(hugepd_t *)pgd));
-			if (more > next)
-				next = more;
-
-			free_hugepd_range(tlb, (hugepd_t *)p4d, PGDIR_SHIFT,
-					  addr, next, floor, ceiling);
-		}
-	} while (addr = next, addr != end);
-}
-#endif
-
 bool __init arch_hugetlb_valid_size(unsigned long size)
 {
 	int shift = __ffs(size);
diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index d3a7726ecf51..024e95c62a2d 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -120,12 +120,8 @@ void pgtable_cache_add(unsigned int shift)
 	/* When batching pgtable pointers for RCU freeing, we store
 	 * the index size in the low bits.  Table alignment must be
 	 * big enough to fit it.
-	 *
-	 * Likewise, hugeapge pagetable pointers contain a (different)
-	 * shift value in the low bits.  All tables must be aligned so
-	 * as to leave enough 0 bits in the address to contain it. */
-	unsigned long minalign = max(MAX_PGTABLE_INDEX_SIZE + 1,
-				     HUGEPD_SHIFT_MASK + 1);
+	 */
+	unsigned long minalign = MAX_PGTABLE_INDEX_SIZE + 1;
 	struct kmem_cache *new = NULL;
 
 	/* It would be nice if this was a BUILD_BUG_ON(), but at the
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 218792cb2c47..ab0656115424 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -409,11 +409,10 @@ unsigned long vmalloc_to_phys(void *va)
 EXPORT_SYMBOL_GPL(vmalloc_to_phys);
 
 /*
- * We have 4 cases for pgds and pmds:
+ * We have 3 cases for pgds and pmds:
  * (1) invalid (all zeroes)
  * (2) pointer to next table, as normal; bottom 6 bits == 0
  * (3) leaf pte for huge page _PAGE_PTE set
- * (4) hugepd pointer, _PAGE_PTE = 0 and bits [2..6] indicate size of table
  *
  * So long as we atomically load page table pointers we are safe against teardown,
  * we can follow the address down to the page and take a ref on it.
@@ -430,7 +429,6 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 #endif
 	pmd_t pmd, *pmdp;
 	pte_t *ret_pte;
-	hugepd_t *hpdp = NULL;
 	unsigned pdshift;
 
 	if (hpage_shift)
@@ -463,11 +461,6 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 		goto out;
 	}
 
-	if (is_hugepd(__hugepd(p4d_val(p4d)))) {
-		hpdp = (hugepd_t *)&p4d;
-		goto out_huge;
-	}
-
 	/*
 	 * Even if we end up with an unmap, the pgtable will not
 	 * be freed, because we do an rcu free and here we are
@@ -485,11 +478,6 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 		goto out;
 	}
 
-	if (is_hugepd(__hugepd(pud_val(pud)))) {
-		hpdp = (hugepd_t *)&pud;
-		goto out_huge;
-	}
-
 	pmdp = pmd_offset(&pud, ea);
 #else
 	pmdp = pmd_offset(pud_offset(p4d_offset(pgdp, ea), ea), ea);
@@ -527,21 +515,8 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 		goto out;
 	}
 
-	if (is_hugepd(__hugepd(pmd_val(pmd)))) {
-		hpdp = (hugepd_t *)&pmd;
-		goto out_huge;
-	}
-
 	return pte_offset_kernel(&pmd, ea);
 
-out_huge:
-	if (!hpdp)
-		return NULL;
-
-#ifdef CONFIG_ARCH_HAS_HUGEPD
-	ret_pte = hugepte_offset(*hpdp, ea, pdshift);
-	pdshift = hugepd_shift(*hpdp);
-#endif
 out:
 	if (hpage_shift)
 		*hpage_shift = pdshift;
-- 
2.44.0

