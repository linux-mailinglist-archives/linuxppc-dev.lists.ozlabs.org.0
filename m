Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E4088A593
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:00:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3GM93gn8z3w5H
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 02:00:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3GHk6QtYz3vfT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 01:57:22 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4V3GGV1FJXz9scH;
	Mon, 25 Mar 2024 15:56:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nH7Vfrfaa2ZA; Mon, 25 Mar 2024 15:56:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4V3GGK70w2z9sp5;
	Mon, 25 Mar 2024 15:56:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EC8388B76C;
	Mon, 25 Mar 2024 15:56:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id QA_1DeYfNxEI; Mon, 25 Mar 2024 15:56:09 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BC3628B76D;
	Mon, 25 Mar 2024 15:56:09 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>
Subject: [RFC PATCH 7/8] powerpc/8xx: Remove support for 8M pages
Date: Mon, 25 Mar 2024 15:56:00 +0100
Message-ID: <288f26f487648d21fd9590e40b390934eaa5d24a.1711377230.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1711377230.git.christophe.leroy@csgroup.eu>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711378567; l=10673; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=labbSdniQY4vn+lZfsrEeIYYZsv2QN4tTkOicuIW48w=; b=U5BUojPoZDtbPOrG9bTpBn2FDaaj2rTI+jywJDEdI56knFc8sY3VXSuGVg7FUKxU0436ZmjH+ utytvLE3nVvBmMGx3phA/erGn+nMxsF+DheFAPeqNJdrQb+w1x3UrIn
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

Remove support for 8M pages in order to stop using hugepd.

Support for 8M pages will be added back later using the same
approach as for 512k pages, in extenso using contiguous page
entries in the regular page table.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                          |  1 -
 .../include/asm/nohash/32/hugetlb-8xx.h       | 30 -------------------
 arch/powerpc/include/asm/nohash/32/pte-8xx.h  | 14 +--------
 arch/powerpc/include/asm/nohash/pgtable.h     |  4 ---
 arch/powerpc/include/asm/page.h               |  5 ----
 arch/powerpc/kernel/head_8xx.S                |  9 +-----
 arch/powerpc/mm/hugetlbpage.c                 |  3 --
 arch/powerpc/mm/nohash/8xx.c                  | 28 ++---------------
 arch/powerpc/mm/nohash/tlb.c                  |  3 --
 arch/powerpc/platforms/Kconfig.cputype        |  2 ++
 10 files changed, 7 insertions(+), 92 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index a68b9e637eda..74c038cf770c 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -135,7 +135,6 @@ config PPC
 	select ARCH_HAS_DMA_MAP_DIRECT 		if PPC_PSERIES
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
-	select ARCH_HAS_HUGEPD			if HUGETLB_PAGE
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
diff --git a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
index 92df40c6cc6b..178ed9fdd353 100644
--- a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
@@ -4,42 +4,12 @@
 
 #define PAGE_SHIFT_8M		23
 
-static inline pte_t *hugepd_page(hugepd_t hpd)
-{
-	BUG_ON(!hugepd_ok(hpd));
-
-	return (pte_t *)__va(hpd_val(hpd) & ~HUGEPD_SHIFT_MASK);
-}
-
-static inline unsigned int hugepd_shift(hugepd_t hpd)
-{
-	return PAGE_SHIFT_8M;
-}
-
-static inline pte_t *hugepte_offset(hugepd_t hpd, unsigned long addr,
-				    unsigned int pdshift)
-{
-	unsigned long idx = (addr & (SZ_4M - 1)) >> PAGE_SHIFT;
-
-	return hugepd_page(hpd) + idx;
-}
-
 static inline void flush_hugetlb_page(struct vm_area_struct *vma,
 				      unsigned long vmaddr)
 {
 	flush_tlb_page(vma, vmaddr);
 }
 
-static inline void hugepd_populate(hugepd_t *hpdp, pte_t *new, unsigned int pshift)
-{
-	*hpdp = __hugepd(__pa(new) | _PMD_USER | _PMD_PRESENT | _PMD_PAGE_8M);
-}
-
-static inline void hugepd_populate_kernel(hugepd_t *hpdp, pte_t *new, unsigned int pshift)
-{
-	*hpdp = __hugepd(__pa(new) | _PMD_PRESENT | _PMD_PAGE_8M);
-}
-
 static inline int check_and_get_huge_psize(int shift)
 {
 	return shift_to_mmu_psize(shift);
diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
index 07df6b664861..004d7e825af2 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -142,15 +142,6 @@ static inline void __ptep_set_access_flags(struct vm_area_struct *vma, pte_t *pt
 }
 #define __ptep_set_access_flags __ptep_set_access_flags
 
-static inline unsigned long pgd_leaf_size(pgd_t pgd)
-{
-	if (pgd_val(pgd) & _PMD_PAGE_8M)
-		return SZ_8M;
-	return SZ_4M;
-}
-
-#define pgd_leaf_size pgd_leaf_size
-
 static inline unsigned long pte_leaf_size(pmd_t pmd, pte_t pte)
 {
 	pte_basic_t val = pte_val(pte);
@@ -171,14 +162,11 @@ static inline unsigned long pte_leaf_size(pmd_t pmd, pte_t pte)
  * For other page sizes, we have a single entry in the table.
  */
 static pmd_t *pmd_off(struct mm_struct *mm, unsigned long addr);
-static int hugepd_ok(hugepd_t hpd);
 
 static inline int number_of_cells_per_pte(pmd_t *pmd, pte_basic_t val, int huge)
 {
 	if (!huge)
 		return PAGE_SIZE / SZ_4K;
-	else if (hugepd_ok(*((hugepd_t *)pmd)))
-		return 1;
 	else if (IS_ENABLED(CONFIG_PPC_4K_PAGES) && !(val & _PAGE_HUGE))
 		return SZ_16K / SZ_4K;
 	else
@@ -198,7 +186,7 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
 
 	for (i = 0; i < num; i += PAGE_SIZE / SZ_4K, new += PAGE_SIZE) {
 		*entry++ = new;
-		if (IS_ENABLED(CONFIG_PPC_16K_PAGES) && num != 1) {
+		if (IS_ENABLED(CONFIG_PPC_16K_PAGES)) {
 			*entry++ = new;
 			*entry++ = new;
 			*entry++ = new;
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index ac3353f7f2ac..c4be7754e96f 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -343,12 +343,8 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 #ifdef CONFIG_ARCH_HAS_HUGEPD
 static inline int hugepd_ok(hugepd_t hpd)
 {
-#ifdef CONFIG_PPC_8xx
-	return ((hpd_val(hpd) & _PMD_PAGE_MASK) == _PMD_PAGE_8M);
-#else
 	/* We clear the top bit to indicate hugepd */
 	return (hpd_val(hpd) && (hpd_val(hpd) & PD_HUGE) == 0);
-#endif
 }
 
 #define is_hugepd(hpd)		(hugepd_ok(hpd))
diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
index e411e5a70ea3..018c3d55232c 100644
--- a/arch/powerpc/include/asm/page.h
+++ b/arch/powerpc/include/asm/page.h
@@ -293,13 +293,8 @@ static inline const void *pfn_to_kaddr(unsigned long pfn)
 /*
  * Some number of bits at the level of the page table that points to
  * a hugepte are used to encode the size.  This masks those bits.
- * On 8xx, HW assistance requires 4k alignment for the hugepte.
  */
-#ifdef CONFIG_PPC_8xx
-#define HUGEPD_SHIFT_MASK     0xfff
-#else
 #define HUGEPD_SHIFT_MASK     0x3f
-#endif
 
 #ifndef __ASSEMBLY__
 
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 647b0b445e89..b53af565b132 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -416,13 +416,11 @@ FixupDAR:/* Entry point for dcbx workaround. */
 3:
 	lwz	r11, (swapper_pg_dir-PAGE_OFFSET)@l(r11)	/* Get the level 1 entry */
 	mtspr	SPRN_MD_TWC, r11
-	mtcrf	0x01, r11
 	mfspr	r11, SPRN_MD_TWC
 	lwz	r11, 0(r11)	/* Get the pte */
-	bt	28,200f		/* bit 28 = Large page (8M) */
 	/* concat physical page address(r11) and page offset(r10) */
 	rlwimi	r11, r10, 0, 32 - PAGE_SHIFT, 31
-201:	lwz	r11,0(r11)
+	lwz	r11,0(r11)
 /* Check if it really is a dcbx instruction. */
 /* dcbt and dcbtst does not generate DTLB Misses/Errors,
  * no need to include them here */
@@ -441,11 +439,6 @@ FixupDAR:/* Entry point for dcbx workaround. */
 141:	mfspr	r10,SPRN_M_TW
 	b	DARFixed	/* Nope, go back to normal TLB processing */
 
-200:
-	/* concat physical page address(r11) and page offset(r10) */
-	rlwimi	r11, r10, 0, 32 - PAGE_SHIFT_8M, 31
-	b	201b
-
 144:	mfspr	r10, SPRN_DSISR
 	rlwinm	r10, r10,0,7,5	/* Clear store bit for buggy dcbst insn */
 	mtspr	SPRN_DSISR, r10
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index db73ad845a2a..4e9fbd5b895d 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -183,9 +183,6 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 	if (!hpdp)
 		return NULL;
 
-	if (IS_ENABLED(CONFIG_PPC_8xx) && pshift < PMD_SHIFT)
-		return pte_alloc_huge(mm, (pmd_t *)hpdp, addr, sz);
-
 	BUG_ON(!hugepd_none(*hpdp) && !hugepd_ok(*hpdp));
 
 	if (hugepd_none(*hpdp) && __hugepte_alloc(mm, hpdp, addr,
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 70b4d807fda5..fc10e08bcb85 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -48,42 +48,22 @@ unsigned long p_block_mapped(phys_addr_t pa)
 	return 0;
 }
 
-static pte_t __init *early_hugepd_alloc_kernel(hugepd_t *pmdp, unsigned long va)
-{
-	if (hpd_val(*pmdp) == 0) {
-		pte_t *ptep = memblock_alloc(sizeof(pte_basic_t), SZ_4K);
-
-		if (!ptep)
-			return NULL;
-
-		hugepd_populate_kernel((hugepd_t *)pmdp, ptep, PAGE_SHIFT_8M);
-		hugepd_populate_kernel((hugepd_t *)pmdp + 1, ptep, PAGE_SHIFT_8M);
-	}
-	return hugepte_offset(*(hugepd_t *)pmdp, va, PGDIR_SHIFT);
-}
-
 static int __ref __early_map_kernel_hugepage(unsigned long va, phys_addr_t pa,
 					     pgprot_t prot, int psize, bool new)
 {
 	pmd_t *pmdp = pmd_off_k(va);
 	pte_t *ptep;
 
-	if (WARN_ON(psize != MMU_PAGE_512K && psize != MMU_PAGE_8M))
+	if (WARN_ON(psize != MMU_PAGE_512K))
 		return -EINVAL;
 
 	if (new) {
 		if (WARN_ON(slab_is_available()))
 			return -EINVAL;
 
-		if (psize == MMU_PAGE_512K)
-			ptep = early_pte_alloc_kernel(pmdp, va);
-		else
-			ptep = early_hugepd_alloc_kernel((hugepd_t *)pmdp, va);
+		ptep = early_pte_alloc_kernel(pmdp, va);
 	} else {
-		if (psize == MMU_PAGE_512K)
-			ptep = pte_offset_kernel(pmdp, va);
-		else
-			ptep = hugepte_offset(*(hugepd_t *)pmdp, va, PGDIR_SHIFT);
+		ptep = pte_offset_kernel(pmdp, va);
 	}
 
 	if (WARN_ON(!ptep))
@@ -130,8 +110,6 @@ static void mmu_mapin_ram_chunk(unsigned long offset, unsigned long top,
 
 	for (; p < ALIGN(p, SZ_8M) && p < top; p += SZ_512K, v += SZ_512K)
 		__early_map_kernel_hugepage(v, p, prot, MMU_PAGE_512K, new);
-	for (; p < ALIGN_DOWN(top, SZ_8M) && p < top; p += SZ_8M, v += SZ_8M)
-		__early_map_kernel_hugepage(v, p, prot, MMU_PAGE_8M, new);
 	for (; p < ALIGN_DOWN(top, SZ_512K) && p < top; p += SZ_512K, v += SZ_512K)
 		__early_map_kernel_hugepage(v, p, prot, MMU_PAGE_512K, new);
 
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 5ffa0af4328a..cb2afe39cee5 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -104,9 +104,6 @@ struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT] = {
 	[MMU_PAGE_512K] = {
 		.shift	= 19,
 	},
-	[MMU_PAGE_8M] = {
-		.shift	= 23,
-	},
 };
 #endif
 
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index b2d8c0da2ad9..fa4bb096b3ae 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -98,6 +98,7 @@ config PPC_BOOK3S_64
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
+	select ARCH_HAS_HUGEPD if HUGETLB_PAGE
 	select ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select HAVE_MOVE_PMD
@@ -290,6 +291,7 @@ config PPC_BOOK3S
 config PPC_E500
 	select FSL_EMB_PERFMON
 	bool
+	select ARCH_HAS_HUGEPD if HUGETLB_PAGE
 	select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
 	select PPC_SMP_MUXED_IPI
 	select PPC_DOORBELL
-- 
2.43.0

