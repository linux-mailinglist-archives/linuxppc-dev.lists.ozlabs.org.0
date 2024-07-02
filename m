Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D19923FA5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 15:56:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD4FY3B8xz3fwb
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 23:56:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD48w2kj5z3fmj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 23:52:16 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4WD4884Xg2z9v7m;
	Tue,  2 Jul 2024 15:51:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ohgMrFKa0jB3; Tue,  2 Jul 2024 15:51:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4WD4826yDHz9v49;
	Tue,  2 Jul 2024 15:51:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E9E718B775;
	Tue,  2 Jul 2024 15:51:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id YnHixkjwPp5Q; Tue,  2 Jul 2024 15:51:30 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.12])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6834B8B774;
	Tue,  2 Jul 2024 15:51:30 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v7 11/23] powerpc/mm: Allow hugepages without hugepd
Date: Tue,  2 Jul 2024 15:51:23 +0200
Message-ID: <ada097ca8a4fa85a77f51719516ef2478800d77a.1719928057.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1719928057.git.christophe.leroy@csgroup.eu>
References: <cover.1719928057.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719928274; l=6864; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=OHpbr2EW8Ehxc4cGWtKirj+0lOuzXeICYvz9BBmzSDA=; b=UUTS4m+0kGxoR7F+40eCTAcfPSd1Ierr8L2y6YOzUEMTf+3WVm1xVUuo4A9pnvI9UqY1rcnsx Wv/fSraJnj1AAABHMvT9B9A+aqHDTkbNzsSIH94CoVRgqUm2zSCuNvv
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

In preparation of implementing huge pages on powerpc 8xx
without hugepd, enclose hugepd related code inside an
ifdef CONFIG_ARCH_HAS_HUGEPD

This also allows removing some stubs.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
---
v3:
- Prepare huge_pte_alloc() for full standard topology, not only for 2-level
- Reordered last part of huge_pte_alloc()

v4:
- Rebased of v6.10-rc1

v5:
- Moved the Kconfig split in this patch.
---
 arch/powerpc/Kconfig                         |  1 -
 arch/powerpc/include/asm/book3s/32/pgalloc.h |  2 --
 arch/powerpc/include/asm/hugetlb.h           | 10 ++----
 arch/powerpc/include/asm/nohash/pgtable.h    |  2 +-
 arch/powerpc/mm/hugetlbpage.c                | 33 ++++++++++++++++++++
 arch/powerpc/mm/pgtable.c                    |  2 ++
 arch/powerpc/platforms/Kconfig.cputype       |  3 ++
 7 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c88c6d46a5bc..b60b6e991227 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -135,7 +135,6 @@ config PPC
 	select ARCH_HAS_DMA_MAP_DIRECT 		if PPC_PSERIES
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
-	select ARCH_HAS_HUGEPD			if HUGETLB_PAGE
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_KERNEL_FPU_SUPPORT	if PPC64 && PPC_FPU
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
diff --git a/arch/powerpc/include/asm/book3s/32/pgalloc.h b/arch/powerpc/include/asm/book3s/32/pgalloc.h
index dc5c039eb28e..dd4eb3063175 100644
--- a/arch/powerpc/include/asm/book3s/32/pgalloc.h
+++ b/arch/powerpc/include/asm/book3s/32/pgalloc.h
@@ -47,8 +47,6 @@ static inline void pgtable_free(void *table, unsigned index_size)
 	}
 }
 
-#define get_hugepd_cache_index(x)  (x)
-
 static inline void pgtable_free_tlb(struct mmu_gather *tlb,
 				    void *table, int shift)
 {
diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index ea71f7245a63..79176a499763 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -30,10 +30,12 @@ static inline int is_hugepage_only_range(struct mm_struct *mm,
 }
 #define is_hugepage_only_range is_hugepage_only_range
 
+#ifdef CONFIG_ARCH_HAS_HUGEPD
 #define __HAVE_ARCH_HUGETLB_FREE_PGD_RANGE
 void hugetlb_free_pgd_range(struct mmu_gather *tlb, unsigned long addr,
 			    unsigned long end, unsigned long floor,
 			    unsigned long ceiling);
+#endif
 
 #define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
 static inline pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
@@ -67,14 +69,6 @@ static inline void flush_hugetlb_page(struct vm_area_struct *vma,
 {
 }
 
-#define hugepd_shift(x) 0
-static inline pte_t *hugepte_offset(hugepd_t hpd, unsigned long addr,
-				    unsigned pdshift)
-{
-	return NULL;
-}
-
-
 static inline void __init gigantic_hugetlb_cma_reserve(void)
 {
 }
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index f5f39d4f03c8..e7fc1314c23e 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -340,7 +340,7 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 
 #define pgprot_writecombine pgprot_noncached_wc
 
-#ifdef CONFIG_HUGETLB_PAGE
+#ifdef CONFIG_ARCH_HAS_HUGEPD
 static inline int hugepd_ok(hugepd_t hpd)
 {
 #ifdef CONFIG_PPC_8xx
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 594a4b7b2ca2..20fad59ff9f5 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -42,6 +42,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr, unsigned long s
 	return __find_linux_pte(mm->pgd, addr, NULL, NULL);
 }
 
+#ifdef CONFIG_ARCH_HAS_HUGEPD
 static int __hugepte_alloc(struct mm_struct *mm, hugepd_t *hpdp,
 			   unsigned long address, unsigned int pdshift,
 			   unsigned int pshift, spinlock_t *ptl)
@@ -193,6 +194,36 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 
 	return hugepte_offset(*hpdp, addr, pdshift);
 }
+#else
+pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
+		      unsigned long addr, unsigned long sz)
+{
+	p4d_t *p4d;
+	pud_t *pud;
+	pmd_t *pmd;
+
+	addr &= ~(sz - 1);
+
+	p4d = p4d_offset(pgd_offset(mm, addr), addr);
+	if (!mm_pud_folded(mm) && sz >= P4D_SIZE)
+		return (pte_t *)p4d;
+
+	pud = pud_alloc(mm, p4d, addr);
+	if (!pud)
+		return NULL;
+	if (!mm_pmd_folded(mm) && sz >= PUD_SIZE)
+		return (pte_t *)pud;
+
+	pmd = pmd_alloc(mm, pud, addr);
+	if (!pmd)
+		return NULL;
+
+	if (sz >= PMD_SIZE)
+		return (pte_t *)pmd;
+
+	return pte_alloc_huge(mm, pmd, addr);
+}
+#endif
 
 #ifdef CONFIG_PPC_BOOK3S_64
 /*
@@ -248,6 +279,7 @@ int __init alloc_bootmem_huge_page(struct hstate *h, int nid)
 	return __alloc_bootmem_huge_page(h, nid);
 }
 
+#ifdef CONFIG_ARCH_HAS_HUGEPD
 #ifndef CONFIG_PPC_BOOK3S_64
 #define HUGEPD_FREELIST_SIZE \
 	((PAGE_SIZE - sizeof(struct hugepd_freelist)) / sizeof(pte_t))
@@ -505,6 +537,7 @@ void hugetlb_free_pgd_range(struct mmu_gather *tlb,
 		}
 	} while (addr = next, addr != end);
 }
+#endif
 
 bool __init arch_hugetlb_valid_size(unsigned long size)
 {
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index bce8a8619589..9010973f036c 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -496,8 +496,10 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 	if (!hpdp)
 		return NULL;
 
+#ifdef CONFIG_ARCH_HAS_HUGEPD
 	ret_pte = hugepte_offset(*hpdp, ea, pdshift);
 	pdshift = hugepd_shift(*hpdp);
+#endif
 out:
 	if (hpage_shift)
 		*hpage_shift = pdshift;
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index b2d8c0da2ad9..0c3c69ebf19f 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -37,6 +37,7 @@ config PPC_85xx
 
 config PPC_8xx
 	bool "Freescale 8xx"
+	select ARCH_HAS_HUGEPD if HUGETLB_PAGE
 	select ARCH_SUPPORTS_HUGETLBFS
 	select FSL_SOC
 	select PPC_KUEP
@@ -98,6 +99,7 @@ config PPC_BOOK3S_64
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
+	select ARCH_HAS_HUGEPD if HUGETLB_PAGE
 	select ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select HAVE_MOVE_PMD
@@ -290,6 +292,7 @@ config PPC_BOOK3S
 config PPC_E500
 	select FSL_EMB_PERFMON
 	bool
+	select ARCH_HAS_HUGEPD if HUGETLB_PAGE
 	select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
 	select PPC_SMP_MUXED_IPI
 	select PPC_DOORBELL
-- 
2.44.0

