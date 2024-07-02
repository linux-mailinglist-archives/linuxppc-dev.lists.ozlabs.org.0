Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C16F2923FC6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 16:00:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD4L04hMXz7Bb3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 00:00:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD4BB5CX2z3g9f
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 23:53:22 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4WD48P18qWz9v7L;
	Tue,  2 Jul 2024 15:51:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BcwQTwacX8AA; Tue,  2 Jul 2024 15:51:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4WD4883x3Tz9v7h;
	Tue,  2 Jul 2024 15:51:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 82C888B775;
	Tue,  2 Jul 2024 15:51:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id DJAGjaOAeV4z; Tue,  2 Jul 2024 15:51:36 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.12])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DD5DA8B774;
	Tue,  2 Jul 2024 15:51:35 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v7 21/23] powerpc/64s: Use contiguous PMD/PUD instead of HUGEPD
Date: Tue,  2 Jul 2024 15:51:33 +0200
Message-ID: <7448f60a9b3efd396595f4f735d1e0babc5ae379.1719928057.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1719928057.git.christophe.leroy@csgroup.eu>
References: <cover.1719928057.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719928275; l=18279; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=2G8oJpcNtkRBG4yqaxrMfZ/soZsLaajV0a3G73z3lRk=; b=0csDV/KGH7+sBc/SYMKVY22MpAHPsV5G2PXVQre8Qgz/Yc0cBfG9WMJYQFaV3glH4WpuDZvcd 2i6EilDIp6oCQSEg1NWjHFTVG8zYmYBLa4ZhKyWW4yiJvCM8IGmoiEY
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
Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
---
v3:
- Add missing pmd_leaf_size() and pud_leaf_size()
- More cleanup in hugetlbpage_init()
- Take a page fault when DIRTY or ACCESSED is missing on hash-4 hugepage

v4: Rebased on v6.10-rc1

v6: Added a WARN_ON_ONCE() in hash__pte_update() in case the pagesize is unexpected.
---
 arch/powerpc/include/asm/book3s/64/hash-4k.h  | 15 ------
 arch/powerpc/include/asm/book3s/64/hash.h     | 40 +++++++++++++---
 arch/powerpc/include/asm/book3s/64/hugetlb.h  | 38 ---------------
 .../include/asm/book3s/64/pgtable-4k.h        | 47 -------------------
 .../include/asm/book3s/64/pgtable-64k.h       | 20 --------
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 22 +++++++--
 arch/powerpc/include/asm/hugetlb.h            |  4 ++
 .../powerpc/include/asm/nohash/hugetlb-e500.h |  4 --
 arch/powerpc/include/asm/page.h               |  8 ----
 arch/powerpc/mm/book3s64/hash_utils.c         | 11 +++--
 arch/powerpc/mm/book3s64/hugetlbpage.c        | 10 ++++
 arch/powerpc/mm/book3s64/pgtable.c            | 12 -----
 arch/powerpc/mm/hugetlbpage.c                 | 26 ----------
 arch/powerpc/mm/pgtable.c                     |  2 +-
 arch/powerpc/platforms/Kconfig.cputype        |  1 -
 15 files changed, 74 insertions(+), 186 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/book3s/64/pgtable-4k.h

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
index faf3e3b4e4b2..0755f2567021 100644
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
@@ -182,11 +179,40 @@ static inline unsigned long hash__pte_update(struct mm_struct *mm,
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
+	if (IS_ENABLED(CONFIG_PPC_4K_PAGES) && huge) {
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
+		WARN_ON_ONCE(nb == 1);	/* Should never happen */
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
deleted file mode 100644
index baf934578c3a..000000000000
--- a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
+++ /dev/null
@@ -1,47 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_BOOK3S_64_PGTABLE_4K_H
-#define _ASM_POWERPC_BOOK3S_64_PGTABLE_4K_H
-/*
- * hash 4k can't share hugetlb and also doesn't support THP
- */
-#ifndef __ASSEMBLY__
-#ifdef CONFIG_HUGETLB_PAGE
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
-#endif /* CONFIG_HUGETLB_PAGE */
-
-#endif /* __ASSEMBLY__ */
-
-#endif /*_ASM_POWERPC_BOOK3S_64_PGTABLE_4K_H */
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable-64k.h b/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
index 6ac73da7b80e..4d8d7b4ea16b 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
@@ -5,26 +5,6 @@
 #ifndef __ASSEMBLY__
 #ifdef CONFIG_HUGETLB_PAGE
 
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
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 8f9432e3855a..519b1743a0f4 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -274,6 +274,24 @@ static inline bool pud_leaf(pud_t pud)
 {
 	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
 }
+
+#define pmd_leaf_size pmd_leaf_size
+static inline unsigned long pmd_leaf_size(pmd_t pmd)
+{
+	if (IS_ENABLED(CONFIG_PPC_4K_PAGES) && !radix_enabled())
+		return SZ_16M;
+	else
+		return PMD_SIZE;
+}
+
+#define pud_leaf_size pud_leaf_size
+static inline unsigned long pud_leaf_size(pud_t pud)
+{
+	if (IS_ENABLED(CONFIG_PPC_4K_PAGES) && !radix_enabled())
+		return SZ_16G;
+	else
+		return PUD_SIZE;
+}
 #endif /* __ASSEMBLY__ */
 
 #include <asm/book3s/64/hash.h>
@@ -285,11 +303,9 @@ static inline bool pud_leaf(pud_t pud)
 #define  MAX_PHYSMEM_BITS	R_MAX_PHYSMEM_BITS
 #endif
 
-
+/* hash 4k can't share hugetlb and also doesn't support THP */
 #ifdef CONFIG_PPC_64K_PAGES
 #include <asm/book3s/64/pgtable-64k.h>
-#else
-#include <asm/book3s/64/pgtable-4k.h>
 #endif
 
 #include <asm/barrier.h>
diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index 79176a499763..e959c26c0b52 100644
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
diff --git a/arch/powerpc/include/asm/nohash/hugetlb-e500.h b/arch/powerpc/include/asm/nohash/hugetlb-e500.h
index 812c71fc5eb1..cab0e1f1eea0 100644
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
diff --git a/arch/powerpc/mm/book3s64/hugetlbpage.c b/arch/powerpc/mm/book3s64/hugetlbpage.c
index 5a2e512e96db..83c3361b358b 100644
--- a/arch/powerpc/mm/book3s64/hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/hugetlbpage.c
@@ -53,6 +53,16 @@ int __hash_page_huge(unsigned long ea, unsigned long access, unsigned long vsid,
 		/* If PTE permissions don't match, take page fault */
 		if (unlikely(!check_pte_access(access, old_pte)))
 			return 1;
+		/*
+		 * If hash-4k, hugepages use seeral contiguous PxD entries
+		 * so bail out and let mm make the page young or dirty
+		 */
+		if (IS_ENABLED(CONFIG_PPC_4K_PAGES)) {
+			if (!(old_pte & _PAGE_ACCESSED))
+				return 1;
+			if ((access & _PAGE_WRITE) && !(old_pte & _PAGE_DIRTY))
+				return 1;
+		}
 
 		/*
 		 * Try to lock the PTE, add ACCESSED and DIRTY if it was
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 2975ea0841ba..f4d8d3c40e5c 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -461,18 +461,6 @@ static inline void pgtable_free(void *table, int index)
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
index 9e692d96f9e1..1fe2843f5b12 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -592,40 +592,14 @@ static int __init hugetlbpage_init(void)
 
 	for (psize = 0; psize < MMU_PAGE_COUNT; ++psize) {
 		unsigned shift;
-		unsigned pdshift;
 
 		if (!mmu_psize_defs[psize].shift)
 			continue;
 
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
-		if (shift < PUD_SHIFT)
-			pdshift = PMD_SHIFT;
-		else if (shift < PGDIR_SHIFT)
-			pdshift = PUD_SHIFT;
-		else
-			pdshift = PGDIR_SHIFT;
-#endif
-
 		if (add_huge_page_size(1ULL << shift) < 0)
 			continue;
-		/*
-		 * if we have pdshift and shift value same, we don't
-		 * use pgt cache for hugepd.
-		 */
-		if (pdshift > shift) {
-			pgtable_cache_add(pdshift - shift);
-		}
 
 		configured = true;
 	}
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 6498454959f3..218792cb2c47 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -331,7 +331,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
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

