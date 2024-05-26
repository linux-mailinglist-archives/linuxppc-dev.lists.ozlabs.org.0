Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id C1BAD8CF31C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2024 11:31:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VnD024dwSz88Gl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2024 19:25:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VnCxK6fTxz3gL0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 May 2024 19:23:01 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4VnCwn2Pl5z9tFS;
	Sun, 26 May 2024 11:22:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f1D6EIRUfxuc; Sun, 26 May 2024 11:22:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4VnCwl1D2Yz9t0b;
	Sun, 26 May 2024 11:22:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 24B418B773;
	Sun, 26 May 2024 11:22:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ya-yDRxmODXU; Sun, 26 May 2024 11:22:31 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.45])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 934238B774;
	Sun, 26 May 2024 11:22:30 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC PATCH v3 06/16] powerpc/mm: Allow hugepages without hugepd
Date: Sun, 26 May 2024 11:22:26 +0200
Message-ID: <f1f0466e04a048333f1d15867553eba5ef83c1de.1716714720.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1716714720.git.christophe.leroy@csgroup.eu>
References: <cover.1716714720.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716715343; l=5578; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=YHXXAKikz+yjGFibh8EtpvNY8BY3AGFWEQEdIqI/W5w=; b=Reo2Iwi+5ogLBzkg9BmijAEDu1YJsF6H2Kiorghv0PXTSCBm+4p5pPvaI4hLB7EqhUDW9brzI fIM+G/T6ssBC4lHvJjU39XD1N3l2mMyDJJ/MtojpJNjbCD/yaKq/wKJ
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

In preparation of implementing huge pages on powerpc 8xx
without hugepd, enclose hugepd related code inside an
ifdef CONFIG_ARCH_HAS_HUGEPD

This also allows removing some stubs.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3:
- Prepare huge_pte_alloc() for full standard topology, not only for 2-level
- Reordered last part of huge_pte_alloc()
---
 arch/powerpc/include/asm/book3s/32/pgalloc.h |  2 --
 arch/powerpc/include/asm/hugetlb.h           | 10 ++----
 arch/powerpc/include/asm/nohash/pgtable.h    |  8 +++--
 arch/powerpc/mm/hugetlbpage.c                | 33 ++++++++++++++++++++
 arch/powerpc/mm/pgtable.c                    |  2 ++
 5 files changed, 42 insertions(+), 13 deletions(-)

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
index 427db14292c9..ac3353f7f2ac 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -340,7 +340,7 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 
 #define pgprot_writecombine pgprot_noncached_wc
 
-#ifdef CONFIG_HUGETLB_PAGE
+#ifdef CONFIG_ARCH_HAS_HUGEPD
 static inline int hugepd_ok(hugepd_t hpd)
 {
 #ifdef CONFIG_PPC_8xx
@@ -351,6 +351,10 @@ static inline int hugepd_ok(hugepd_t hpd)
 #endif
 }
 
+#define is_hugepd(hpd)		(hugepd_ok(hpd))
+#endif
+
+#ifdef CONFIG_HUGETLB_PAGE
 static inline int pmd_huge(pmd_t pmd)
 {
 	return 0;
@@ -360,8 +364,6 @@ static inline int pud_huge(pud_t pud)
 {
 	return 0;
 }
-
-#define is_hugepd(hpd)		(hugepd_ok(hpd))
 #endif
 
 int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
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
index 10adef5967a3..c56593f568a2 100644
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
-- 
2.44.0

