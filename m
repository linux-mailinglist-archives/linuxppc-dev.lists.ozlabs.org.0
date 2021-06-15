Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD55A3A8CBA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 01:38:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4PsB3LNvz3bxD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 09:38:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Ln7jqkmZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=korg header.b=Ln7jqkmZ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4Prl0QBDz2ykR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 09:38:13 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5EF7961350;
 Tue, 15 Jun 2021 23:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1623800289;
 bh=rjFPyZTYipWietsDaKtPBbLddpwNP6Naf5zN4Mzp6ZY=;
 h=Date:From:To:Subject:From;
 b=Ln7jqkmZZrk/0sFG6viAeuDnMcO0IUoFId60q0N8MrsduG2pcKdr7YGB+6KurRWDj
 vJbVWL+UeMd/A31+q5maYY4M96gHPzuaYbQn2UDguK7Ow6jJL9W0YFw8HrFYa/NAkh
 NkHKPH1CJviyiNLzTGwp3tCx26ymCT4VYt1fJz6s=
Date: Tue, 15 Jun 2021 16:38:08 -0700
From: akpm@linux-foundation.org
To: aneesh.kumar@linux.ibm.com, linux-alpha@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, mm-commits@vger.kernel.org,
 sparclinux@vger.kernel.org
Subject: +
 mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t.patch
 added to -mm tree
Message-ID: <20210615233808.hzjGO1gF2%akpm@linux-foundation.org>
User-Agent: s-nail v14.8.16
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


The patch titled
     Subject: mm: rename pud_page_vaddr to pud_pgtable and make it return pmd_t *
has been added to the -mm tree.  Its filename is
     mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t.patch

This patch should soon appear at
    https://ozlabs.org/~akpm/mmots/broken-out/mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t.patch
and later at
    https://ozlabs.org/~akpm/mmotm/broken-out/mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t.patch

Before you just go and hit "reply", please:
   a) Consider who else should be cc'ed
   b) Prefer to cc a suitable mailing list as well
   c) Ideally: find the original patch on the mailing list and do a
      reply-to-all to that, adding suitable additional cc's

*** Remember to use Documentation/process/submit-checklist.rst when testing your code ***

The -mm tree is included into linux-next and is updated
there every 3-4 working days

------------------------------------------------------
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: mm: rename pud_page_vaddr to pud_pgtable and make it return pmd_t *

No functional change in this patch.

Link: https://lkml.kernel.org/r/20210615110859.320299-1-aneesh.kumar@linux.ibm.com
Link: https://lore.kernel.org/linuxppc-dev/CAHk-=wi+J+iodze9FtjM3Zi4j4OeS+qqbKxME9QN4roxPEXH9Q@mail.gmail.com/
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: <linux-alpha@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>
Cc: <linux-ia64@vger.kernel.org>
Cc: <linux-m68k@lists.linux-m68k.org>
Cc: <linux-mips@vger.kernel.org>
Cc: <linux-parisc@vger.kernel.org>
Cc: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-riscv@lists.infradead.org>
Cc: <linux-sh@vger.kernel.org>
Cc: <sparclinux@vger.kernel.org>
Cc: <linux-um@lists.infradead.org>
Cc: <linux-arch@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/alpha/include/asm/pgtable.h             |    8 +++++---
 arch/arm/include/asm/pgtable-3level.h        |    2 +-
 arch/arm64/include/asm/pgtable.h             |    4 ++--
 arch/ia64/include/asm/pgtable.h              |    2 +-
 arch/m68k/include/asm/motorola_pgtable.h     |    2 +-
 arch/mips/include/asm/pgtable-64.h           |    4 ++--
 arch/parisc/include/asm/pgtable.h            |    4 ++--
 arch/powerpc/include/asm/book3s/64/pgtable.h |    6 +++++-
 arch/powerpc/include/asm/nohash/64/pgtable.h |    6 +++++-
 arch/powerpc/mm/book3s64/radix_pgtable.c     |    4 ++--
 arch/powerpc/mm/pgtable_64.c                 |    2 +-
 arch/riscv/include/asm/pgtable-64.h          |    4 ++--
 arch/sh/include/asm/pgtable-3level.h         |    4 ++--
 arch/sparc/include/asm/pgtable_32.h          |    4 ++--
 arch/sparc/include/asm/pgtable_64.h          |    6 +++---
 arch/um/include/asm/pgtable-3level.h         |    2 +-
 arch/x86/include/asm/pgtable.h               |    4 ++--
 arch/x86/mm/pat/set_memory.c                 |    4 ++--
 arch/x86/mm/pgtable.c                        |    2 +-
 include/asm-generic/pgtable-nopmd.h          |    2 +-
 include/asm-generic/pgtable-nopud.h          |    2 +-
 include/linux/pgtable.h                      |    2 +-
 22 files changed, 45 insertions(+), 35 deletions(-)

--- a/arch/alpha/include/asm/pgtable.h~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/alpha/include/asm/pgtable.h
@@ -236,8 +236,10 @@ pmd_page_vaddr(pmd_t pmd)
 #define pmd_page(pmd)	(pfn_to_page(pmd_val(pmd) >> 32))
 #define pud_page(pud)	(pfn_to_page(pud_val(pud) >> 32))
 
-extern inline unsigned long pud_page_vaddr(pud_t pgd)
-{ return PAGE_OFFSET + ((pud_val(pgd) & _PFN_MASK) >> (32-PAGE_SHIFT)); }
+static inline pmd_t *pud_pgtable(pud_t pgd)
+{
+	return (pmd_t *)(PAGE_OFFSET + ((pud_val(pgd) & _PFN_MASK) >> (32-PAGE_SHIFT)));
+}
 
 extern inline int pte_none(pte_t pte)		{ return !pte_val(pte); }
 extern inline int pte_present(pte_t pte)	{ return pte_val(pte) & _PAGE_VALID; }
@@ -287,7 +289,7 @@ extern inline pte_t pte_mkyoung(pte_t pt
 /* Find an entry in the second-level page table.. */
 extern inline pmd_t * pmd_offset(pud_t * dir, unsigned long address)
 {
-	pmd_t *ret = (pmd_t *) pud_page_vaddr(*dir) + ((address >> PMD_SHIFT) & (PTRS_PER_PAGE - 1));
+	pmd_t *ret = pud_pgtable(*dir) + ((address >> PMD_SHIFT) & (PTRS_PER_PAGE - 1));
 	smp_rmb(); /* see above */
 	return ret;
 }
--- a/arch/arm64/include/asm/pgtable.h~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/arm64/include/asm/pgtable.h
@@ -633,9 +633,9 @@ static inline phys_addr_t pud_page_paddr
 	return __pud_to_phys(pud);
 }
 
-static inline unsigned long pud_page_vaddr(pud_t pud)
+static inline pmd_t *pud_pgtable(pud_t pud)
 {
-	return (unsigned long)__va(pud_page_paddr(pud));
+	return (pmd_t *)__va(pud_page_paddr(pud));
 }
 
 /* Find an entry in the second-level page table. */
--- a/arch/arm/include/asm/pgtable-3level.h~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/arm/include/asm/pgtable-3level.h
@@ -130,7 +130,7 @@
 		flush_pmd_entry(pudp);	\
 	} while (0)
 
-static inline pmd_t *pud_page_vaddr(pud_t pud)
+static inline pmd_t *pud_pgtable(pud_t pud)
 {
 	return __va(pud_val(pud) & PHYS_MASK & (s32)PAGE_MASK);
 }
--- a/arch/ia64/include/asm/pgtable.h~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/ia64/include/asm/pgtable.h
@@ -273,7 +273,7 @@ ia64_phys_addr_valid (unsigned long addr
 #define pud_bad(pud)			(!ia64_phys_addr_valid(pud_val(pud)))
 #define pud_present(pud)		(pud_val(pud) != 0UL)
 #define pud_clear(pudp)			(pud_val(*(pudp)) = 0UL)
-#define pud_page_vaddr(pud)		((unsigned long) __va(pud_val(pud) & _PFN_MASK))
+#define pud_pgtable(pud)		((pmd_t *) __va(pud_val(pud) & _PFN_MASK))
 #define pud_page(pud)			virt_to_page((pud_val(pud) + PAGE_OFFSET))
 
 #if CONFIG_PGTABLE_LEVELS == 4
--- a/arch/m68k/include/asm/motorola_pgtable.h~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/m68k/include/asm/motorola_pgtable.h
@@ -131,7 +131,7 @@ static inline void pud_set(pud_t *pudp,
 
 #define __pte_page(pte) ((unsigned long)__va(pte_val(pte) & PAGE_MASK))
 #define pmd_page_vaddr(pmd) ((unsigned long)__va(pmd_val(pmd) & _TABLE_MASK))
-#define pud_page_vaddr(pud) ((unsigned long)__va(pud_val(pud) & _TABLE_MASK))
+#define pud_pgtable(pud) ((pmd_t *)__va(pud_val(pud) & _TABLE_MASK))
 
 
 #define pte_none(pte)		(!pte_val(pte))
--- a/arch/mips/include/asm/pgtable-64.h~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/mips/include/asm/pgtable-64.h
@@ -313,9 +313,9 @@ static inline void pud_clear(pud_t *pudp
 #endif
 
 #ifndef __PAGETABLE_PMD_FOLDED
-static inline unsigned long pud_page_vaddr(pud_t pud)
+static inline pmd_t *pud_pgtable(pud_t pud)
 {
-	return pud_val(pud);
+	return (pmd_t *)pud_val(pud);
 }
 #define pud_phys(pud)		virt_to_phys((void *)pud_val(pud))
 #define pud_page(pud)		(pfn_to_page(pud_phys(pud) >> PAGE_SHIFT))
--- a/arch/parisc/include/asm/pgtable.h~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/parisc/include/asm/pgtable.h
@@ -322,8 +322,8 @@ static inline void pmd_clear(pmd_t *pmd)
 
 
 #if CONFIG_PGTABLE_LEVELS == 3
-#define pud_page_vaddr(pud) ((unsigned long) __va(pud_address(pud)))
-#define pud_page(pud)	virt_to_page((void *)pud_page_vaddr(pud))
+#define pud_pgtable(pud) ((pmd_t *) __va(pud_address(pud)))
+#define pud_page(pud)	virt_to_page((void *)pud_pgtable(pud))
 
 /* For 64 bit we have three level tables */
 
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1048,9 +1048,13 @@ extern struct page *p4d_page(p4d_t p4d);
 /* Pointers in the page table tree are physical addresses */
 #define __pgtable_ptr_val(ptr)	__pa(ptr)
 
-#define pud_page_vaddr(pud)	__va(pud_val(pud) & ~PUD_MASKED_BITS)
 #define p4d_page_vaddr(p4d)	__va(p4d_val(p4d) & ~P4D_MASKED_BITS)
 
+static inline pmd_t *pud_pgtable(pud_t pud)
+{
+	return (pmd_t *)__va(pud_val(pud) & ~PUD_MASKED_BITS);
+}
+
 #define pte_ERROR(e) \
 	pr_err("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
 #define pmd_ERROR(e) \
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -162,7 +162,11 @@ static inline void pud_clear(pud_t *pudp
 #define	pud_bad(pud)		(!is_kernel_addr(pud_val(pud)) \
 				 || (pud_val(pud) & PUD_BAD_BITS))
 #define pud_present(pud)	(pud_val(pud) != 0)
-#define pud_page_vaddr(pud)	(pud_val(pud) & ~PUD_MASKED_BITS)
+
+static inline pmd_t *pud_pgtable(pud_t pud)
+{
+	return (pmd_t *)(pud_val(pud) & ~PUD_MASKED_BITS);
+}
 
 extern struct page *pud_page(pud_t pud);
 
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -826,7 +826,7 @@ static void __meminit remove_pud_table(p
 			continue;
 		}
 
-		pmd_base = (pmd_t *)pud_page_vaddr(*pud);
+		pmd_base = pud_pgtable(*pud);
 		remove_pmd_table(pmd_base, addr, next);
 		free_pmd_table(pmd_base, pud);
 	}
@@ -1111,7 +1111,7 @@ int pud_free_pmd_page(pud_t *pud, unsign
 	pmd_t *pmd;
 	int i;
 
-	pmd = (pmd_t *)pud_page_vaddr(*pud);
+	pmd = pud_pgtable(*pud);
 	pud_clear(pud);
 
 	flush_tlb_kernel_range(addr, addr + PUD_SIZE);
--- a/arch/powerpc/mm/pgtable_64.c~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/powerpc/mm/pgtable_64.c
@@ -115,7 +115,7 @@ struct page *pud_page(pud_t pud)
 		VM_WARN_ON(!pud_huge(pud));
 		return pte_page(pud_pte(pud));
 	}
-	return virt_to_page(pud_page_vaddr(pud));
+	return virt_to_page(pud_pgtable(pud));
 }
 
 /*
--- a/arch/riscv/include/asm/pgtable-64.h~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/riscv/include/asm/pgtable-64.h
@@ -59,9 +59,9 @@ static inline void pud_clear(pud_t *pudp
 	set_pud(pudp, __pud(0));
 }
 
-static inline unsigned long pud_page_vaddr(pud_t pud)
+static inline pmd_t *pud_pgtable(pud_t pud)
 {
-	return (unsigned long)pfn_to_virt(pud_val(pud) >> _PAGE_PFN_SHIFT);
+	return (pmd_t *)pfn_to_virt(pud_val(pud) >> _PAGE_PFN_SHIFT);
 }
 
 static inline struct page *pud_page(pud_t pud)
--- a/arch/sh/include/asm/pgtable-3level.h~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/sh/include/asm/pgtable-3level.h
@@ -32,9 +32,9 @@ typedef struct { unsigned long long pmd;
 #define pmd_val(x)	((x).pmd)
 #define __pmd(x)	((pmd_t) { (x) } )
 
-static inline unsigned long pud_page_vaddr(pud_t pud)
+static inline pmd_t *pud_pgtable(pud_t pud)
 {
-	return pud_val(pud);
+	return (pmd_t *)pud_val(pud);
 }
 
 /* only used by the stubbed out hugetlb gup code, should never be called */
--- a/arch/sparc/include/asm/pgtable_32.h~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/sparc/include/asm/pgtable_32.h
@@ -151,13 +151,13 @@ static inline unsigned long pmd_page_vad
 	return (unsigned long)__nocache_va(v << 4);
 }
 
-static inline unsigned long pud_page_vaddr(pud_t pud)
+static inline pmd_t *pud_pgtable(pud_t pud)
 {
 	if (srmmu_device_memory(pud_val(pud))) {
 		return ~0;
 	} else {
 		unsigned long v = pud_val(pud) & SRMMU_PTD_PMASK;
-		return (unsigned long)__nocache_va(v << 4);
+		return (pmd_t *)__nocache_va(v << 4);
 	}
 }
 
--- a/arch/sparc/include/asm/pgtable_64.h~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/sparc/include/asm/pgtable_64.h
@@ -841,18 +841,18 @@ static inline unsigned long pmd_page_vad
 	return ((unsigned long) __va(pfn << PAGE_SHIFT));
 }
 
-static inline unsigned long pud_page_vaddr(pud_t pud)
+static inline pmd_t *pud_pgtable(pud_t pud)
 {
 	pte_t pte = __pte(pud_val(pud));
 	unsigned long pfn;
 
 	pfn = pte_pfn(pte);
 
-	return ((unsigned long) __va(pfn << PAGE_SHIFT));
+	return ((pmd_t *) __va(pfn << PAGE_SHIFT));
 }
 
 #define pmd_page(pmd) 			virt_to_page((void *)pmd_page_vaddr(pmd))
-#define pud_page(pud) 			virt_to_page((void *)pud_page_vaddr(pud))
+#define pud_page(pud)			virt_to_page((void *)pud_pgtable(pud))
 #define pmd_clear(pmdp)			(pmd_val(*(pmdp)) = 0UL)
 #define pud_present(pud)		(pud_val(pud) != 0U)
 #define pud_clear(pudp)			(pud_val(*(pudp)) = 0UL)
--- a/arch/um/include/asm/pgtable-3level.h~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/um/include/asm/pgtable-3level.h
@@ -83,7 +83,7 @@ static inline void pud_clear (pud_t *pud
 }
 
 #define pud_page(pud) phys_to_page(pud_val(pud) & PAGE_MASK)
-#define pud_page_vaddr(pud) ((unsigned long) __va(pud_val(pud) & PAGE_MASK))
+#define pud_pgtable(pud) ((pmd_t *) __va(pud_val(pud) & PAGE_MASK))
 
 static inline unsigned long pte_pfn(pte_t pte)
 {
--- a/arch/x86/include/asm/pgtable.h~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/x86/include/asm/pgtable.h
@@ -865,9 +865,9 @@ static inline int pud_present(pud_t pud)
 	return pud_flags(pud) & _PAGE_PRESENT;
 }
 
-static inline unsigned long pud_page_vaddr(pud_t pud)
+static inline pmd_t *pud_pgtable(pud_t pud)
 {
-	return (unsigned long)__va(pud_val(pud) & pud_pfn_mask(pud));
+	return (pmd_t *)__va(pud_val(pud) & pud_pfn_mask(pud));
 }
 
 /*
--- a/arch/x86/mm/pat/set_memory.c~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/x86/mm/pat/set_memory.c
@@ -1134,7 +1134,7 @@ static void __unmap_pmd_range(pud_t *pud
 			      unsigned long start, unsigned long end)
 {
 	if (unmap_pte_range(pmd, start, end))
-		if (try_to_free_pmd_page((pmd_t *)pud_page_vaddr(*pud)))
+		if (try_to_free_pmd_page(pud_pgtable(*pud)))
 			pud_clear(pud);
 }
 
@@ -1178,7 +1178,7 @@ static void unmap_pmd_range(pud_t *pud,
 	 * Try again to free the PMD page if haven't succeeded above.
 	 */
 	if (!pud_none(*pud))
-		if (try_to_free_pmd_page((pmd_t *)pud_page_vaddr(*pud)))
+		if (try_to_free_pmd_page(pud_pgtable(*pud)))
 			pud_clear(pud);
 }
 
--- a/arch/x86/mm/pgtable.c~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/arch/x86/mm/pgtable.c
@@ -801,7 +801,7 @@ int pud_free_pmd_page(pud_t *pud, unsign
 	pte_t *pte;
 	int i;
 
-	pmd = (pmd_t *)pud_page_vaddr(*pud);
+	pmd = pud_pgtable(*pud);
 	pmd_sv = (pmd_t *)__get_free_page(GFP_KERNEL);
 	if (!pmd_sv)
 		return 0;
--- a/include/asm-generic/pgtable-nopmd.h~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/include/asm-generic/pgtable-nopmd.h
@@ -51,7 +51,7 @@ static inline pmd_t * pmd_offset(pud_t *
 #define __pmd(x)				((pmd_t) { __pud(x) } )
 
 #define pud_page(pud)				(pmd_page((pmd_t){ pud }))
-#define pud_page_vaddr(pud)			(pmd_page_vaddr((pmd_t){ pud }))
+#define pud_pgtable(pud)			((pmd_t *)(pmd_page_vaddr((pmd_t){ pud })))
 
 /*
  * allocating and freeing a pmd is trivial: the 1-entry pmd is
--- a/include/asm-generic/pgtable-nopud.h~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/include/asm-generic/pgtable-nopud.h
@@ -49,7 +49,7 @@ static inline pud_t *pud_offset(p4d_t *p
 #define __pud(x)				((pud_t) { __p4d(x) })
 
 #define p4d_page(p4d)				(pud_page((pud_t){ p4d }))
-#define p4d_page_vaddr(p4d)			(pud_page_vaddr((pud_t){ p4d }))
+#define p4d_page_vaddr(p4d)			(pud_pgtable((pud_t){ p4d }))
 
 /*
  * allocating and freeing a pud is trivial: the 1-entry pud is
--- a/include/linux/pgtable.h~mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t
+++ a/include/linux/pgtable.h
@@ -106,7 +106,7 @@ static inline pte_t *pte_offset_kernel(p
 #ifndef pmd_offset
 static inline pmd_t *pmd_offset(pud_t *pud, unsigned long address)
 {
-	return (pmd_t *)pud_page_vaddr(*pud) + pmd_index(address);
+	return pud_pgtable(*pud) + pmd_index(address);
 }
 #define pmd_offset pmd_offset
 #endif
_

Patches currently in -mm which might be from aneesh.kumar@linux.ibm.com are

mm-rename-pud_page_vaddr-to-pud_pgtable-and-make-it-return-pmd_t.patch
mm-rename-p4d_page_vaddr-to-p4d_pgtable-and-make-it-return-pud_t.patch

