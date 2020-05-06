Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9721C7814
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 19:36:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HNzw0BWkzDql6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 03:36:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HMwt2W2HzDqjM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 02:48:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49HMwn3Sh6z9v4kL;
 Wed,  6 May 2020 18:48:25 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Ai21YN3X9K52; Wed,  6 May 2020 18:48:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49HMwn2dYbz9v4kF;
 Wed,  6 May 2020 18:48:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 31FA88B7C6;
 Wed,  6 May 2020 18:48:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ktowJtsNjcdn; Wed,  6 May 2020 18:48:27 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C61B78B7C5;
 Wed,  6 May 2020 18:48:26 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 9558065911; Wed,  6 May 2020 16:48:26 +0000 (UTC)
Message-Id: <38716727583b4ba15d586883d37ff1a2ba0d904f.1588783498.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1588783498.git.christophe.leroy@csgroup.eu>
References: <cover.1588783498.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 21/45] powerpc/mm: Standardise pte_update() prototype
 between PPC32 and PPC64
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed,  6 May 2020 16:48:26 +0000 (UTC)
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

PPC64 takes 3 additional parameters compared to PPC32:
- mm
- address
- huge

These 3 parameters will be needed in order to perform different
action depending on the page size on the 8xx.

Make pte_update() prototype identical for PPC32 and PPC64.

This allows dropping an #ifdef in huge_ptep_get_and_clear().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h | 15 ++++++++-------
 arch/powerpc/include/asm/hugetlb.h           |  4 ----
 arch/powerpc/include/asm/nohash/32/pgtable.h | 13 +++++++------
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 8122f0b55d21..f5eab98c4e41 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -218,7 +218,7 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
  */
 
 #define pte_clear(mm, addr, ptep) \
-	do { pte_update(ptep, ~_PAGE_HASHPTE, 0); } while (0)
+	do { pte_update(mm, addr, ptep, ~_PAGE_HASHPTE, 0, 0); } while (0)
 
 #define pmd_none(pmd)		(!pmd_val(pmd))
 #define	pmd_bad(pmd)		(pmd_val(pmd) & _PMD_BAD)
@@ -254,7 +254,8 @@ extern void flush_hash_entry(struct mm_struct *mm, pte_t *ptep,
  * when using atomic updates, only the low part of the PTE is
  * accessed atomically.
  */
-static inline pte_basic_t pte_update(pte_t *p, unsigned long clr, unsigned long set)
+static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, pte_t *p,
+				     unsigned long clr, unsigned long set, int huge)
 {
 	pte_basic_t old;
 	unsigned long tmp;
@@ -292,7 +293,7 @@ static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
 					      unsigned long addr, pte_t *ptep)
 {
 	unsigned long old;
-	old = pte_update(ptep, _PAGE_ACCESSED, 0);
+	old = pte_update(mm, addr, ptep, _PAGE_ACCESSED, 0, 0);
 	if (old & _PAGE_HASHPTE) {
 		unsigned long ptephys = __pa(ptep) & PAGE_MASK;
 		flush_hash_pages(mm->context.id, addr, ptephys, 1);
@@ -306,14 +307,14 @@ static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 				       pte_t *ptep)
 {
-	return __pte(pte_update(ptep, ~_PAGE_HASHPTE, 0));
+	return __pte(pte_update(mm, addr, ptep, ~_PAGE_HASHPTE, 0, 0));
 }
 
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
 static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 				      pte_t *ptep)
 {
-	pte_update(ptep, _PAGE_RW, 0);
+	pte_update(mm, addr, ptep, _PAGE_RW, 0, 0);
 }
 
 static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
@@ -324,7 +325,7 @@ static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
 	unsigned long set = pte_val(entry) &
 		(_PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_RW | _PAGE_EXEC);
 
-	pte_update(ptep, 0, set);
+	pte_update(vma->vm_mm, address, ptep, 0, set, 0);
 
 	flush_tlb_page(vma, address);
 }
@@ -522,7 +523,7 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 		*ptep = __pte((pte_val(*ptep) & _PAGE_HASHPTE)
 			      | (pte_val(pte) & ~_PAGE_HASHPTE));
 	else
-		pte_update(ptep, ~_PAGE_HASHPTE, pte_val(pte));
+		pte_update(mm, addr, ptep, ~_PAGE_HASHPTE, pte_val(pte), 0);
 
 #elif defined(CONFIG_PTE_64BIT)
 	/* Second case is 32-bit with 64-bit PTE.  In this case, we
diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index bd6504c28c2f..e4276af034e9 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -40,11 +40,7 @@ void hugetlb_free_pgd_range(struct mmu_gather *tlb, unsigned long addr,
 static inline pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 					    unsigned long addr, pte_t *ptep)
 {
-#ifdef CONFIG_PPC64
 	return __pte(pte_update(mm, addr, ptep, ~0UL, 0, 1));
-#else
-	return __pte(pte_update(ptep, ~0UL, 0));
-#endif
 }
 
 #define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index ddf681ceb860..75880eb1cb91 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -166,7 +166,7 @@ int map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot);
 #ifndef __ASSEMBLY__
 
 #define pte_clear(mm, addr, ptep) \
-	do { pte_update(ptep, ~0, 0); } while (0)
+	do { pte_update(mm, addr, ptep, ~0, 0, 0); } while (0)
 
 #ifndef pte_mkwrite
 static inline pte_t pte_mkwrite(pte_t pte)
@@ -222,7 +222,8 @@ static inline void pmd_clear(pmd_t *pmdp)
  * to properly flush the virtually tagged instruction cache of
  * those implementations.
  */
-static inline pte_basic_t pte_update(pte_t *p, unsigned long clr, unsigned long set)
+static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, pte_t *p,
+				     unsigned long clr, unsigned long set, int huge)
 {
 #if defined(PTE_ATOMIC_UPDATES) && !defined(CONFIG_PTE_64BIT)
 	unsigned long old, tmp;
@@ -260,7 +261,7 @@ static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
 					      unsigned long addr, pte_t *ptep)
 {
 	unsigned long old;
-	old = pte_update(ptep, _PAGE_ACCESSED, 0);
+	old = pte_update(mm, addr, ptep, _PAGE_ACCESSED, 0, 0);
 	return (old & _PAGE_ACCESSED) != 0;
 }
 #define ptep_test_and_clear_young(__vma, __addr, __ptep) \
@@ -270,7 +271,7 @@ static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 				       pte_t *ptep)
 {
-	return __pte(pte_update(ptep, ~0, 0));
+	return __pte(pte_update(mm, addr, ptep, ~0, 0, 0));
 }
 
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
@@ -280,7 +281,7 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 	unsigned long clr = ~pte_val(pte_wrprotect(__pte(~0)));
 	unsigned long set = pte_val(pte_wrprotect(__pte(0)));
 
-	pte_update(ptep, clr, set);
+	pte_update(mm, addr, ptep, clr, set, 0);
 }
 
 static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
@@ -293,7 +294,7 @@ static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
 	unsigned long set = pte_val(entry) & pte_val(pte_set);
 	unsigned long clr = ~pte_val(entry) & ~pte_val(pte_clr);
 
-	pte_update(ptep, clr, set);
+	pte_update(vma->vm_mm, address, ptep, clr, set, 0);
 
 	flush_tlb_page(vma, address);
 }
-- 
2.25.0

