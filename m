Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B66EA88A5A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:02:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3GPQ3Qbzz3vr7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 02:02:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3GHv5gBFz3vgl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 01:57:31 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4V3GGW13Shz9srg;
	Mon, 25 Mar 2024 15:56:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YV9edRV4Wprd; Mon, 25 Mar 2024 15:56:19 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4V3GGL0SFcz9sps;
	Mon, 25 Mar 2024 15:56:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0B7A98B76C;
	Mon, 25 Mar 2024 15:56:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id YZtrcU0fiEBw; Mon, 25 Mar 2024 15:56:09 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D80E18B765;
	Mon, 25 Mar 2024 15:56:09 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>
Subject: [RFC PATCH 8/8] powerpc/8xx: Add back support for 8M pages using contiguous PTE entries
Date: Mon, 25 Mar 2024 15:56:01 +0100
Message-ID: <57c49d8be1e3f1546474ab7cbe2cce37919305d5.1711377230.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1711377230.git.christophe.leroy@csgroup.eu>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711378567; l=14498; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=YOa3daFZCi+KeLNEZDEArooCNTMCHGXoSUjhT3Ixq1k=; b=EGYoXEf+OsOEXz4DddK0itsdaNhDO9VBOjnNDwnxq13VHxCfcNAlhW9RAs1Wb5Xs70z5bROmg 6uNfeWreaIVDl+r/VjcaqB7O6TkGafYFbKED2RTLpkPfwPTo0l1QFRL
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

In order to fit better with standard Linux page tables layout, add
support for 8M pages using contiguous PTE entries in a standard
page table. Page tables will then be populated with 1024 similar
entries and two PMD entries will point to that page table.

The PMD entries also get a flag to tell it is addressing an 8M page,
this is required for the HW tablewalk assistance.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/hugetlb.h            | 11 ++++-
 .../include/asm/nohash/32/hugetlb-8xx.h       | 28 +++++++++++-
 arch/powerpc/include/asm/nohash/32/pgalloc.h  |  2 +
 arch/powerpc/include/asm/nohash/32/pte-8xx.h  | 43 +++++++++++++++++--
 arch/powerpc/include/asm/pgtable.h            |  1 +
 arch/powerpc/kernel/head_8xx.S                |  1 +
 arch/powerpc/mm/hugetlbpage.c                 | 12 +++++-
 arch/powerpc/mm/nohash/8xx.c                  | 31 ++++++++++---
 arch/powerpc/mm/nohash/tlb.c                  |  3 ++
 arch/powerpc/mm/pgtable.c                     | 24 +++++++----
 arch/powerpc/mm/pgtable_32.c                  |  2 +-
 11 files changed, 134 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index a05657e5701b..bd60ea134f8e 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -41,7 +41,16 @@ void hugetlb_free_pgd_range(struct mmu_gather *tlb, unsigned long addr,
 static inline pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 					    unsigned long addr, pte_t *ptep)
 {
-	return __pte(pte_update(mm, addr, ptep, ~0UL, 0, 1));
+	pmd_t *pmdp = (pmd_t *)ptep;
+	pte_t pte;
+
+	if (pmdp == pmd_off(mm, ALIGN_DOWN(addr, SZ_8M))) {
+		pte = __pte(pte_update(mm, addr, pte_offset_kernel(pmdp, 0), ~0UL, 0, 1));
+		pte_update(mm, addr, pte_offset_kernel(pmdp + 1, 0), ~0UL, 0, 1);
+	} else {
+		pte = __pte(pte_update(mm, addr, ptep, ~0UL, 0, 1));
+	}
+	return pte;
 }
 
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
diff --git a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
index 178ed9fdd353..1414cfd28987 100644
--- a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
@@ -15,6 +15,16 @@ static inline int check_and_get_huge_psize(int shift)
 	return shift_to_mmu_psize(shift);
 }
 
+#define __HAVE_ARCH_HUGE_PTEP_GET
+static inline pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
+{
+	pmd_t *pmdp = (pmd_t *)ptep;
+
+	if (pmdp == pmd_off(mm, ALIGN_DOWN(addr, SZ_8M)))
+		ptep = pte_offset_kernel(pmdp, 0);
+	return ptep_get(ptep);
+}
+
 #define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
 void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 		     pte_t pte, unsigned long sz);
@@ -23,7 +33,14 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 static inline void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 				  pte_t *ptep, unsigned long sz)
 {
-	pte_update(mm, addr, ptep, ~0UL, 0, 1);
+	pmd_t *pmdp = (pmd_t *)ptep;
+
+	if (pmdp == pmd_off(mm, ALIGN_DOWN(addr, SZ_8M))) {
+		pte_update(mm, addr, pte_offset_kernel(pmdp, 0), ~0UL, 0, 1);
+		pte_update(mm, addr, pte_offset_kernel(pmdp + 1, 0), ~0UL, 0, 1);
+	} else {
+		pte_update(mm, addr, ptep, ~0UL, 0, 1);
+	}
 }
 
 #define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
@@ -33,7 +50,14 @@ static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
 	unsigned long clr = ~pte_val(pte_wrprotect(__pte(~0)));
 	unsigned long set = pte_val(pte_wrprotect(__pte(0)));
 
-	pte_update(mm, addr, ptep, clr, set, 1);
+	pmd_t *pmdp = (pmd_t *)ptep;
+
+	if (pmdp == pmd_off(mm, ALIGN_DOWN(addr, SZ_8M))) {
+		pte_update(mm, addr, pte_offset_kernel(pmdp, 0), clr, set, 1);
+		pte_update(mm, addr, pte_offset_kernel(pmdp + 1, 0), clr, set, 1);
+	} else {
+		pte_update(mm, addr, ptep, clr, set, 1);
+	}
 }
 
 #ifdef CONFIG_PPC_4K_PAGES
diff --git a/arch/powerpc/include/asm/nohash/32/pgalloc.h b/arch/powerpc/include/asm/nohash/32/pgalloc.h
index 11eac371e7e0..ff4f90cfb461 100644
--- a/arch/powerpc/include/asm/nohash/32/pgalloc.h
+++ b/arch/powerpc/include/asm/nohash/32/pgalloc.h
@@ -14,6 +14,7 @@
 #define __pmd_free_tlb(tlb,x,a)		do { } while (0)
 /* #define pgd_populate(mm, pmd, pte)      BUG() */
 
+#ifndef CONFIG_PPC_8xx
 static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmdp,
 				       pte_t *pte)
 {
@@ -31,5 +32,6 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmdp,
 	else
 		*pmdp = __pmd(__pa(pte_page) | _PMD_USER | _PMD_PRESENT);
 }
+#endif
 
 #endif /* _ASM_POWERPC_PGALLOC_32_H */
diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
index 004d7e825af2..b05cc4f87713 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -129,14 +129,23 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 }
 #define ptep_set_wrprotect ptep_set_wrprotect
 
+static pmd_t *pmd_off(struct mm_struct *mm, unsigned long addr);
+static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address);
+
 static inline void __ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
 					   pte_t entry, unsigned long address, int psize)
 {
 	unsigned long set = pte_val(entry) & (_PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_EXEC);
 	unsigned long clr = ~pte_val(entry) & _PAGE_RO;
 	int huge = psize > mmu_virtual_psize ? 1 : 0;
+	pmd_t *pmdp = (pmd_t *)ptep;
 
-	pte_update(vma->vm_mm, address, ptep, clr, set, huge);
+	if (pmdp == pmd_off(vma->vm_mm, ALIGN_DOWN(address, SZ_8M))) {
+		pte_update(vma->vm_mm, address, pte_offset_kernel(pmdp, 0), clr, set, huge);
+		pte_update(vma->vm_mm, address, pte_offset_kernel(pmdp + 1, 0), clr, set, huge);
+	} else {
+		pte_update(vma->vm_mm, address, ptep, clr, set, huge);
+	}
 
 	flush_tlb_page(vma, address);
 }
@@ -146,6 +155,8 @@ static inline unsigned long pte_leaf_size(pmd_t pmd, pte_t pte)
 {
 	pte_basic_t val = pte_val(pte);
 
+	if (pmd_val(pmd) & _PMD_PAGE_8M)
+		return SZ_8M;
 	if (val & _PAGE_HUGE)
 		return SZ_512K;
 	if (val & _PAGE_SPS)
@@ -159,14 +170,16 @@ static inline unsigned long pte_leaf_size(pmd_t pmd, pte_t pte)
  * On the 8xx, the page tables are a bit special. For 16k pages, we have
  * 4 identical entries. For 512k pages, we have 128 entries as if it was
  * 4k pages, but they are flagged as 512k pages for the hardware.
- * For other page sizes, we have a single entry in the table.
+ * For 8M pages, we have 1024 entries as if it was
+ * 4M pages, but they are flagged as 8M pages for the hardware.
+ * For 4k pages, we have a single entry in the table.
  */
-static pmd_t *pmd_off(struct mm_struct *mm, unsigned long addr);
-
 static inline int number_of_cells_per_pte(pmd_t *pmd, pte_basic_t val, int huge)
 {
 	if (!huge)
 		return PAGE_SIZE / SZ_4K;
+	else if ((pmd_val(*pmd) & _PMD_PAGE_MASK) == _PMD_PAGE_8M)
+		return SZ_4M / SZ_4K;
 	else if (IS_ENABLED(CONFIG_PPC_4K_PAGES) && !(val & _PAGE_HUGE))
 		return SZ_16K / SZ_4K;
 	else
@@ -209,6 +222,28 @@ static inline pte_t ptep_get(pte_t *ptep)
 }
 #endif /* CONFIG_PPC_16K_PAGES */
 
+static inline void pmd_populate_kernel_size(struct mm_struct *mm, pmd_t *pmdp,
+					    pte_t *pte, unsigned long sz)
+{
+	if (sz == SZ_8M)
+		*pmdp = __pmd(__pa(pte) | _PMD_PRESENT | _PMD_PAGE_8M);
+	else
+		*pmdp = __pmd(__pa(pte) | _PMD_PRESENT);
+}
+
+static inline void pmd_populate_size(struct mm_struct *mm, pmd_t *pmdp,
+				     pgtable_t pte_page, unsigned long sz)
+{
+	if (sz == SZ_8M)
+		*pmdp = __pmd(__pa(pte_page) | _PMD_USER | _PMD_PRESENT | _PMD_PAGE_8M);
+	else
+		*pmdp = __pmd(__pa(pte_page) | _PMD_USER | _PMD_PRESENT);
+}
+#define pmd_populate_size pmd_populate_size
+
+#define pmd_populate(mm, pmdp, pte) pmd_populate_size(mm, pmdp, pte, PAGE_SIZE)
+#define pmd_populate_kernel(mm, pmdp, pte) pmd_populate_kernel_size(mm, pmdp, pte, PAGE_SIZE)
+
 #endif
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 239709a2f68e..005dad336565 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -106,6 +106,7 @@ unsigned long vmalloc_to_phys(void *vmalloc_addr);
 
 void pgtable_cache_add(unsigned int shift);
 
+void __init *early_alloc_pgtable(unsigned long size);
 pte_t *early_pte_alloc_kernel(pmd_t *pmdp, unsigned long va);
 
 #if defined(CONFIG_STRICT_KERNEL_RWX) || defined(CONFIG_PPC32)
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index b53af565b132..43919ae0bd11 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -415,6 +415,7 @@ FixupDAR:/* Entry point for dcbx workaround. */
 	oris	r11, r11, (swapper_pg_dir - PAGE_OFFSET)@ha
 3:
 	lwz	r11, (swapper_pg_dir-PAGE_OFFSET)@l(r11)	/* Get the level 1 entry */
+	rlwinm	r11, r11, 0, ~_PMD_PAGE_8M
 	mtspr	SPRN_MD_TWC, r11
 	mfspr	r11, SPRN_MD_TWC
 	lwz	r11, 0(r11)	/* Get the pte */
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 4e9fbd5b895d..dd29845ce0ce 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -195,7 +195,17 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 		      unsigned long addr, unsigned long sz)
 {
-	return pte_alloc_huge(mm, pmd_off(mm, addr), addr, sz);
+	pmd_t *pmd = pmd_off(mm, addr);
+
+	if (sz == SZ_512M)
+		return pte_alloc_huge(mm, pmd, addr, sz);
+	if (sz != SZ_8M)
+		return NULL;
+	if (!pte_alloc_huge(mm, pmd, addr, sz))
+		return NULL;
+	if (!pte_alloc_huge(mm, pmd + 1, addr, sz))
+		return NULL;
+	return (pte_t *)pmd;
 }
 #endif
 
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index fc10e08bcb85..b416bfc161d4 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -54,25 +54,40 @@ static int __ref __early_map_kernel_hugepage(unsigned long va, phys_addr_t pa,
 	pmd_t *pmdp = pmd_off_k(va);
 	pte_t *ptep;
 
-	if (WARN_ON(psize != MMU_PAGE_512K))
+	if (WARN_ON(psize != MMU_PAGE_512K && psize != MMU_PAGE_8M))
 		return -EINVAL;
 
 	if (new) {
 		if (WARN_ON(slab_is_available()))
 			return -EINVAL;
 
-		ptep = early_pte_alloc_kernel(pmdp, va);
+		if (psize == MMU_PAGE_8M) {
+			if (WARN_ON(!pmd_none(*pmdp) || !pmd_none(*(pmdp + 1))))
+				return -EINVAL;
+
+			ptep = early_alloc_pgtable(PTE_FRAG_SIZE);
+			pmd_populate_kernel_size(&init_mm, pmdp, ptep, SZ_8M);
+
+			ptep = early_alloc_pgtable(PTE_FRAG_SIZE);
+			pmd_populate_kernel_size(&init_mm, pmdp + 1, ptep, SZ_8M);
+
+			ptep = (pte_t *)pmdp;
+		} else {
+			ptep = early_pte_alloc_kernel(pmdp, va);
+			/* The PTE should never be already present */
+			if (WARN_ON(pte_present(*ptep) && pgprot_val(prot)))
+				return -EINVAL;
+		}
 	} else {
-		ptep = pte_offset_kernel(pmdp, va);
+		if (psize == MMU_PAGE_8M)
+			ptep = (pte_t *)pmdp;
+		else
+			ptep = pte_offset_kernel(pmdp, va);
 	}
 
 	if (WARN_ON(!ptep))
 		return -ENOMEM;
 
-	/* The PTE should never be already present */
-	if (new && WARN_ON(pte_present(*ptep) && pgprot_val(prot)))
-		return -EINVAL;
-
 	set_huge_pte_at(&init_mm, va, ptep,
 			pte_mkhuge(pfn_pte(pa >> PAGE_SHIFT, prot)),
 			1UL << mmu_psize_to_shift(psize));
@@ -110,6 +125,8 @@ static void mmu_mapin_ram_chunk(unsigned long offset, unsigned long top,
 
 	for (; p < ALIGN(p, SZ_8M) && p < top; p += SZ_512K, v += SZ_512K)
 		__early_map_kernel_hugepage(v, p, prot, MMU_PAGE_512K, new);
+	for (; p < ALIGN_DOWN(top, SZ_8M) && p < top; p += SZ_8M, v += SZ_8M)
+		__early_map_kernel_hugepage(v, p, prot, MMU_PAGE_8M, new);
 	for (; p < ALIGN_DOWN(top, SZ_512K) && p < top; p += SZ_512K, v += SZ_512K)
 		__early_map_kernel_hugepage(v, p, prot, MMU_PAGE_512K, new);
 
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index cb2afe39cee5..5ffa0af4328a 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -104,6 +104,9 @@ struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT] = {
 	[MMU_PAGE_512K] = {
 		.shift	= 19,
 	},
+	[MMU_PAGE_8M] = {
+		.shift	= 23,
+	},
 };
 #endif
 
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index acdf64c9b93e..59f0d7706d2f 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -297,11 +297,8 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 }
 
 #if defined(CONFIG_PPC_8xx)
-void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
-		     pte_t pte, unsigned long sz)
+static void __set_huge_pte_at(pmd_t *pmd, pte_t *ptep, pte_basic_t val)
 {
-	pmd_t *pmd = pmd_off(mm, addr);
-	pte_basic_t val;
 	pte_basic_t *entry = (pte_basic_t *)ptep;
 	int num, i;
 
@@ -311,15 +308,26 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 	 */
 	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
 
-	pte = set_pte_filter(pte, addr);
-
-	val = pte_val(pte);
-
 	num = number_of_cells_per_pte(pmd, val, 1);
 
 	for (i = 0; i < num; i++, entry++, val += SZ_4K)
 		*entry = val;
 }
+
+void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
+		     pte_t pte, unsigned long sz)
+{
+	pmd_t *pmdp = pmd_off(mm, addr);
+
+	pte = set_pte_filter(pte, addr);
+
+	if (sz == SZ_8M) {
+		__set_huge_pte_at(pmdp, pte_offset_kernel(pmdp, 0), pte_val(pte));
+		__set_huge_pte_at(pmdp, pte_offset_kernel(pmdp + 1, 0), pte_val(pte) + SZ_4M);
+	} else {
+		__set_huge_pte_at(pmdp, ptep, pte_val(pte));
+	}
+}
 #endif
 #endif /* CONFIG_HUGETLB_PAGE */
 
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index face94977cb2..0b1d68ef87cd 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -48,7 +48,7 @@ notrace void __init early_ioremap_init(void)
 	early_ioremap_setup();
 }
 
-static void __init *early_alloc_pgtable(unsigned long size)
+void __init *early_alloc_pgtable(unsigned long size)
 {
 	void *ptr = memblock_alloc(size, size);
 
-- 
2.43.0

