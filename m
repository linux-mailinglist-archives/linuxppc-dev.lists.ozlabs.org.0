Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A488C8C88
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2024 21:05:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgxHN0c7Zz3vXS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2024 05:05:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgxCR3Jzqz3d89
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2024 05:01:55 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Vgx9f4dvCz9tFS;
	Fri, 17 May 2024 21:00:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0Xw8Rt1U-Kp; Fri, 17 May 2024 21:00:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Vgx9T3DyMz9t0H;
	Fri, 17 May 2024 21:00:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6A2598B783;
	Fri, 17 May 2024 21:00:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id lrWpK9BI_C-q; Fri, 17 May 2024 21:00:13 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.121])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BBF558B766;
	Fri, 17 May 2024 21:00:12 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC PATCH v2 18/20] powerpc/64s: Use contiguous PMD/PUD instead of HUGEPD
Date: Fri, 17 May 2024 21:00:12 +0200
Message-ID: <ac9f4f2d6e571e4579a8125b81eaa88fbddd6187.1715971869.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1715971869.git.christophe.leroy@csgroup.eu>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715972397; l=16118; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=a9SpGO4QNdjgO+Zh3dzMei0so+5x/YA0zQVCIPPpoF0=; b=vI7G7Jta7navLBTYazCe7XbUVf7nMFmcG+OKnSA7J9Qj/vHr8qu0dK11IdeQwnPcVeBD8Lkr9 tkN4nPa1GGJC9ulDm9sOJMK5E1sWYAwmrjiwEEfjIFZxXFAyyVPtwPQ
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

On book3s/64, the only user of hugepd is hash in 4k mode.

All other setups (hash-64, radix-4, radix-64) use leaf PMD/PUD.

Rework hash-4k to use contiguous PMD and PUD instead.

In that setup there are only two huge page sizes: 16M and 16G.

16M sits at PMD level and 16G at PUD level.

pte_update doesn't know page size, lets use the same trick as
hpte_need_flush() to get page size from segment properties. That's
not the most efficient way but let's do that until callers of
pte_update() provide page size instead of just a huge flag.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/hash-4k.h  | 15 --------
 arch/powerpc/include/asm/book3s/64/hash.h     | 38 +++++++++++++++----
 arch/powerpc/include/asm/book3s/64/hugetlb.h  | 38 -------------------
 .../include/asm/book3s/64/pgtable-4k.h        | 34 -----------------
 .../include/asm/book3s/64/pgtable-64k.h       | 20 ----------
 arch/powerpc/include/asm/hugetlb.h            |  4 ++
 .../include/asm/nohash/32/hugetlb-8xx.h       |  4 --
 .../powerpc/include/asm/nohash/hugetlb-e500.h |  4 --
 arch/powerpc/include/asm/page.h               |  8 ----
 arch/powerpc/mm/book3s64/hash_utils.c         | 11 ++++--
 arch/powerpc/mm/book3s64/pgtable.c            | 12 ------
 arch/powerpc/mm/hugetlbpage.c                 | 19 ----------
 arch/powerpc/mm/pgtable.c                     |  2 +-
 arch/powerpc/platforms/Kconfig.cputype        |  1 -
 14 files changed, 43 insertions(+), 167 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/include/asm/book3s/64/hash-4k.h
index 6472b08fa1b0..c654c376ef8b 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
@@ -74,21 +74,6 @@
 #define remap_4k_pfn(vma, addr, pfn, prot)	\
 	remap_pfn_range((vma), (addr), (pfn), PAGE_SIZE, (prot))
 
-#ifdef CONFIG_HUGETLB_PAGE
-static inline int hash__hugepd_ok(hugepd_t hpd)
-{
-	unsigned long hpdval = hpd_val(hpd);
-	/*
-	 * if it is not a pte and have hugepd shift mask
-	 * set, then it is a hugepd directory pointer
-	 */
-	if (!(hpdval & _PAGE_PTE) && (hpdval & _PAGE_PRESENT) &&
-	    ((hpdval & HUGEPD_SHIFT_MASK) != 0))
-		return true;
-	return false;
-}
-#endif
-
 /*
  * 4K PTE format is different from 64K PTE format. Saving the hash_slot is just
  * a matter of returning the PTE bits that need to be modified. On 64K PTE,
diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
index faf3e3b4e4b2..509811ca7695 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -4,6 +4,7 @@
 #ifdef __KERNEL__
 
 #include <asm/asm-const.h>
+#include <asm/book3s/64/slice.h>
 
 /*
  * Common bits between 4K and 64K pages in a linux-style PTE.
@@ -161,14 +162,10 @@ extern void hpte_need_flush(struct mm_struct *mm, unsigned long addr,
 			    pte_t *ptep, unsigned long pte, int huge);
 unsigned long htab_convert_pte_flags(unsigned long pteflags, unsigned long flags);
 /* Atomic PTE updates */
-static inline unsigned long hash__pte_update(struct mm_struct *mm,
-					 unsigned long addr,
-					 pte_t *ptep, unsigned long clr,
-					 unsigned long set,
-					 int huge)
+static inline unsigned long hash__pte_update_one(pte_t *ptep, unsigned long clr,
+						 unsigned long set)
 {
 	__be64 old_be, tmp_be;
-	unsigned long old;
 
 	__asm__ __volatile__(
 	"1:	ldarx	%0,0,%3		# pte_update\n\
@@ -182,11 +179,38 @@ static inline unsigned long hash__pte_update(struct mm_struct *mm,
 	: "r" (ptep), "r" (cpu_to_be64(clr)), "m" (*ptep),
 	  "r" (cpu_to_be64(H_PAGE_BUSY)), "r" (cpu_to_be64(set))
 	: "cc" );
+
+	return be64_to_cpu(old_be);
+}
+
+static inline unsigned long hash__pte_update(struct mm_struct *mm,
+					 unsigned long addr,
+					 pte_t *ptep, unsigned long clr,
+					 unsigned long set,
+					 int huge)
+{
+	unsigned long old;
+
+	old = hash__pte_update_one(ptep, clr, set);
+
+	if (huge && IS_ENABLED(CONFIG_PPC_4K_PAGES)) {
+		unsigned int psize = get_slice_psize(mm, addr);
+		int nb, i;
+
+		if (psize == MMU_PAGE_16M)
+			nb = SZ_16M / PMD_SIZE;
+		else if (psize == MMU_PAGE_16G)
+			nb = SZ_16G / PUD_SIZE;
+		else
+			nb = 1;
+
+		for (i = 1; i < nb; i++)
+			hash__pte_update_one(ptep + i, clr, set);
+	}
 	/* huge pages use the old page table lock */
 	if (!huge)
 		assert_pte_locked(mm, addr);
 
-	old = be64_to_cpu(old_be);
 	if (old & H_PAGE_HASHPTE)
 		hpte_need_flush(mm, addr, ptep, old, huge);
 
diff --git a/arch/powerpc/include/asm/book3s/64/hugetlb.h b/arch/powerpc/include/asm/book3s/64/hugetlb.h
index aa1c67c8bfc8..f0bba9c5f9c3 100644
--- a/arch/powerpc/include/asm/book3s/64/hugetlb.h
+++ b/arch/powerpc/include/asm/book3s/64/hugetlb.h
@@ -49,9 +49,6 @@ static inline bool gigantic_page_runtime_supported(void)
 	return true;
 }
 
-/* hugepd entry valid bit */
-#define HUGEPD_VAL_BITS		(0x8000000000000000UL)
-
 #define huge_ptep_modify_prot_start huge_ptep_modify_prot_start
 extern pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma,
 					 unsigned long addr, pte_t *ptep);
@@ -60,29 +57,7 @@ extern pte_t huge_ptep_modify_prot_start(struct vm_area_struct *vma,
 extern void huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
 					 unsigned long addr, pte_t *ptep,
 					 pte_t old_pte, pte_t new_pte);
-/*
- * This should work for other subarchs too. But right now we use the
- * new format only for 64bit book3s
- */
-static inline pte_t *hugepd_page(hugepd_t hpd)
-{
-	BUG_ON(!hugepd_ok(hpd));
-	/*
-	 * We have only four bits to encode, MMU page size
-	 */
-	BUILD_BUG_ON((MMU_PAGE_COUNT - 1) > 0xf);
-	return __va(hpd_val(hpd) & HUGEPD_ADDR_MASK);
-}
-
-static inline unsigned int hugepd_mmu_psize(hugepd_t hpd)
-{
-	return (hpd_val(hpd) & HUGEPD_SHIFT_MASK) >> 2;
-}
 
-static inline unsigned int hugepd_shift(hugepd_t hpd)
-{
-	return mmu_psize_to_shift(hugepd_mmu_psize(hpd));
-}
 static inline void flush_hugetlb_page(struct vm_area_struct *vma,
 				      unsigned long vmaddr)
 {
@@ -90,19 +65,6 @@ static inline void flush_hugetlb_page(struct vm_area_struct *vma,
 		return radix__flush_hugetlb_page(vma, vmaddr);
 }
 
-static inline pte_t *hugepte_offset(hugepd_t hpd, unsigned long addr,
-				    unsigned int pdshift)
-{
-	unsigned long idx = (addr & ((1UL << pdshift) - 1)) >> hugepd_shift(hpd);
-
-	return hugepd_page(hpd) + idx;
-}
-
-static inline void hugepd_populate(hugepd_t *hpdp, pte_t *new, unsigned int pshift)
-{
-	*hpdp = __hugepd(__pa(new) | HUGEPD_VAL_BITS | (shift_to_mmu_psize(pshift) << 2));
-}
-
 void flush_hugetlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
 
 static inline int check_and_get_huge_psize(int shift)
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h b/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
index 48f21820afe2..2b985bfbe863 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
@@ -26,40 +26,6 @@ static inline int pud_huge(pud_t pud)
 	return 0;
 }
 
-/*
- * With radix , we have hugepage ptes in the pud and pmd entries. We don't
- * need to setup hugepage directory for them. Our pte and page directory format
- * enable us to have this enabled.
- */
-static inline int hugepd_ok(hugepd_t hpd)
-{
-	if (radix_enabled())
-		return 0;
-	return hash__hugepd_ok(hpd);
-}
-#define is_hugepd(hpd)		(hugepd_ok(hpd))
-
-/*
- * 16M and 16G huge page directory tables are allocated from slab cache
- *
- */
-#define H_16M_CACHE_INDEX (PAGE_SHIFT + H_PTE_INDEX_SIZE + H_PMD_INDEX_SIZE - 24)
-#define H_16G_CACHE_INDEX                                                      \
-	(PAGE_SHIFT + H_PTE_INDEX_SIZE + H_PMD_INDEX_SIZE + H_PUD_INDEX_SIZE - 34)
-
-static inline int get_hugepd_cache_index(int index)
-{
-	switch (index) {
-	case H_16M_CACHE_INDEX:
-		return HTLB_16M_INDEX;
-	case H_16G_CACHE_INDEX:
-		return HTLB_16G_INDEX;
-	default:
-		BUG();
-	}
-	/* should not reach */
-}
-
 #endif /* CONFIG_HUGETLB_PAGE */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable-64k.h b/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
index ced7ee8b42fc..02a1e3ec7cbe 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
@@ -30,26 +30,6 @@ static inline int pud_huge(pud_t pud)
 	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
 }
 
-/*
- * With 64k page size, we have hugepage ptes in the pgd and pmd entries. We don't
- * need to setup hugepage directory for them. Our pte and page directory format
- * enable us to have this enabled.
- */
-static inline int hugepd_ok(hugepd_t hpd)
-{
-	return 0;
-}
-
-#define is_hugepd(pdep)			0
-
-/*
- * This should never get called
- */
-static __always_inline int get_hugepd_cache_index(int index)
-{
-	BUILD_BUG();
-}
-
 #endif /* CONFIG_HUGETLB_PAGE */
 
 static inline int remap_4k_pfn(struct vm_area_struct *vma, unsigned long addr,
diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index 36ed6d976cf9..d022722e6530 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -37,6 +37,10 @@ void hugetlb_free_pgd_range(struct mmu_gather *tlb, unsigned long addr,
 			    unsigned long ceiling);
 #endif
 
+#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
+void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
+		     pte_t pte, unsigned long sz);
+
 #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
 static inline pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 					    unsigned long addr, pte_t *ptep)
diff --git a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
index 1414cfd28987..4cba84776a7d 100644
--- a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
@@ -25,10 +25,6 @@ static inline pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_
 	return ptep_get(ptep);
 }
 
-#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
-void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
-		     pte_t pte, unsigned long sz);
-
 #define __HAVE_ARCH_HUGE_PTE_CLEAR
 static inline void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 				  pte_t *ptep, unsigned long sz)
diff --git a/arch/powerpc/include/asm/nohash/hugetlb-e500.h b/arch/powerpc/include/asm/nohash/hugetlb-e500.h
index d30e2a3f129d..aea4c462e494 100644
--- a/arch/powerpc/include/asm/nohash/hugetlb-e500.h
+++ b/arch/powerpc/include/asm/nohash/hugetlb-e500.h
@@ -2,10 +2,6 @@
 #ifndef _ASM_POWERPC_NOHASH_HUGETLB_E500_H
 #define _ASM_POWERPC_NOHASH_HUGETLB_E500_H
 
-#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
-void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
-		     pte_t pte, unsigned long sz);
-
 void flush_hugetlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
 
 static inline int check_and_get_huge_psize(int shift)
diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index 7d3c3bc40e6a..c0af246a64ff 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -269,14 +269,6 @@ static inline const void *pfn_to_kaddr(unsigned long pfn)
 #define is_kernel_addr(x)	((x) >= TASK_SIZE)
 #endif
 
-#ifdef CONFIG_PPC_BOOK3S_64
-/*
- * Book3S 64 stores real addresses in the hugepd entries to
- * avoid overlaps with _PAGE_PRESENT and _PAGE_PTE.
- */
-#define HUGEPD_ADDR_MASK	(0x0ffffffffffffffful & ~HUGEPD_SHIFT_MASK)
-#endif /* CONFIG_PPC_BOOK3S_64 */
-
 /*
  * Some number of bits at the level of the page table that points to
  * a hugepte are used to encode the size.  This masks those bits.
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 01c3b4b65241..6727a15ab94f 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1233,10 +1233,6 @@ void __init hash__early_init_mmu(void)
 	__pmd_table_size = H_PMD_TABLE_SIZE;
 	__pud_table_size = H_PUD_TABLE_SIZE;
 	__pgd_table_size = H_PGD_TABLE_SIZE;
-	/*
-	 * 4k use hugepd format, so for hash set then to
-	 * zero
-	 */
 	__pmd_val_bits = HASH_PMD_VAL_BITS;
 	__pud_val_bits = HASH_PUD_VAL_BITS;
 	__pgd_val_bits = HASH_PGD_VAL_BITS;
@@ -1546,6 +1542,13 @@ int hash_page_mm(struct mm_struct *mm, unsigned long ea,
 		goto bail;
 	}
 
+	if (IS_ENABLED(CONFIG_PPC_4K_PAGES) && !radix_enabled()) {
+		if (hugeshift == PMD_SHIFT && psize == MMU_PAGE_16M)
+			hugeshift = mmu_psize_defs[MMU_PAGE_16M].shift;
+		if (hugeshift == PUD_SHIFT && psize == MMU_PAGE_16G)
+			hugeshift = mmu_psize_defs[MMU_PAGE_16G].shift;
+	}
+
 	/*
 	 * Add _PAGE_PRESENT to the required access perm. If there are parallel
 	 * updates to the pte that can possibly clear _PAGE_PTE, catch that too.
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 83823db3488b..e4a1e3feefce 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -460,18 +460,6 @@ static inline void pgtable_free(void *table, int index)
 	case PUD_INDEX:
 		__pud_free(table);
 		break;
-#if defined(CONFIG_PPC_4K_PAGES) && defined(CONFIG_HUGETLB_PAGE)
-		/* 16M hugepd directory at pud level */
-	case HTLB_16M_INDEX:
-		BUILD_BUG_ON(H_16M_CACHE_INDEX <= 0);
-		kmem_cache_free(PGT_CACHE(H_16M_CACHE_INDEX), table);
-		break;
-		/* 16G hugepd directory at the pgd level */
-	case HTLB_16G_INDEX:
-		BUILD_BUG_ON(H_16G_CACHE_INDEX <= 0);
-		kmem_cache_free(PGT_CACHE(H_16G_CACHE_INDEX), table);
-		break;
-#endif
 		/* We don't free pgd table via RCU callback */
 	default:
 		BUG();
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 1401587578fc..64b9029d86de 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -600,34 +600,15 @@ static int __init hugetlbpage_init(void)
 
 		shift = mmu_psize_to_shift(psize);
 
-#ifdef CONFIG_PPC_BOOK3S_64
-		if (shift > PGDIR_SHIFT)
-			continue;
-		else if (shift > PUD_SHIFT)
-			pdshift = PGDIR_SHIFT;
-		else if (shift > PMD_SHIFT)
-			pdshift = PUD_SHIFT;
-		else
-			pdshift = PMD_SHIFT;
-#else
 		if (shift < PUD_SHIFT)
 			pdshift = PMD_SHIFT;
 		else if (shift < PGDIR_SHIFT)
 			pdshift = PUD_SHIFT;
 		else
 			pdshift = PGDIR_SHIFT;
-#endif
 
 		if (add_huge_page_size(1ULL << shift) < 0)
 			continue;
-		/*
-		 * if we have pdshift and shift value same, we don't
-		 * use pgt cache for hugepd.
-		 */
-		if (pdshift > shift) {
-			if (!IS_ENABLED(CONFIG_PPC_8xx))
-				pgtable_cache_add(pdshift - shift);
-		}
 
 		configured = true;
 	}
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index d68c0fcffe80..7d4c004cbc75 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -328,7 +328,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 		__set_huge_pte_at(pmdp, ptep, pte_val(pte));
 	}
 }
-#elif defined(CONFIG_PPC_E500)
+#else
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 		     pte_t pte, unsigned long sz)
 {
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 30a78e99663e..b2d8c0da2ad9 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -98,7 +98,6 @@ config PPC_BOOK3S_64
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
-	select ARCH_HAS_HUGEPD if HUGETLB_PAGE
 	select ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select HAVE_MOVE_PMD
-- 
2.44.0

