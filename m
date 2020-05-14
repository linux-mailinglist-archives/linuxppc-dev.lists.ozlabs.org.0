Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 318741D3837
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 19:30:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NJTH0sY5zDqd3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 03:30:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=fL0N1KNZ; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NHxn1GWMzDqGF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 03:06:21 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B032F20727;
 Thu, 14 May 2020 17:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589475976;
 bh=na+woAr1Rb/Lbbk03AUz/L3J6fAEndCBFoSpnnyUKaU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fL0N1KNZmA6s5Ubf3GVJL9IP3tSYr1uvNzhyV77c29VHFlOFsFTz8KceUKlkyrNl3
 y8tr6Meh7lGdfB+RKuQ1zJL02OBYckoSc+0z1fGWDi7s0XQmwyTGvsdnTROT2jZqUt
 fg+08iD0H1uZZNJuXfUw5Ietx8dBaDOE04CUbeDw=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/12] mm: consolidate pmd_index() and pmd_offset()
 definitions
Date: Thu, 14 May 2020 20:03:25 +0300
Message-Id: <20200514170327.31389-11-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514170327.31389-1-rppt@kernel.org>
References: <20200514170327.31389-1-rppt@kernel.org>
MIME-Version: 1.0
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Brian Cain <bcain@codeaurora.org>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-parisc@vger.kernel.org,
 Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, linux-csky@vger.kernel.org,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Thomas Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

All architectures define pmd_index() as

	(address >> PMD_SHIFT) & (PTRS_PER_PMD - 1)

and all architectures that have at least three-level page tables define
pmd_offset() as an entry in the array of PMDs indexed by the pmd_index().

For the most architectures the pmd_offset() implementation relies on
the availability of pud_page_vaddr() that converts a PMD entry value to the
virtual address of the page containing PMD array.

Let's use such implementation as a generic and drop most of the definitions
of pmd_index() and pmd_offset() in <asm/pgtable.h> files.

The architectures that didn't provide pud_page_vaddr() are updated to
have that defined.

The generic implementation can be overridden by an architecture and this
ability is currently in use by there architectures:
* alpha has special requirements for memory access ordering
* arm has custom definition of folded 2-level page tables
* s390 has custom definitions of all page table accessors

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/alpha/include/asm/pgtable.h             |  1 +
 arch/arm/include/asm/pgtable-2level.h        |  1 +
 arch/arm/include/asm/pgtable-3level.h        |  7 -----
 arch/arm/include/asm/pgtable-nommu.h         |  1 -
 arch/arm64/include/asm/pgtable.h             |  8 ++++--
 arch/c6x/include/asm/pgtable.h               |  1 -
 arch/csky/include/asm/pgtable.h              |  1 -
 arch/hexagon/include/asm/pgtable.h           |  9 ------
 arch/ia64/include/asm/pgtable.h              |  4 ---
 arch/m68k/include/asm/motorola_pgtable.h     |  7 -----
 arch/microblaze/include/asm/pgtable.h        |  1 -
 arch/mips/include/asm/pgtable-32.h           |  1 -
 arch/mips/include/asm/pgtable-64.h           |  6 ----
 arch/parisc/include/asm/pgtable.h            |  8 ------
 arch/parisc/kernel/pci-dma.c                 |  2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h |  3 --
 arch/powerpc/include/asm/nohash/64/pgtable.h |  3 --
 arch/riscv/include/asm/pgtable-64.h          |  7 -----
 arch/riscv/mm/init.c                         | 12 ++++----
 arch/s390/include/asm/pgtable.h              |  1 +
 arch/sh/include/asm/pgtable-3level.h         |  7 -----
 arch/sh/include/asm/pgtable_32.h             |  1 -
 arch/sh/include/asm/pgtable_64.h             |  1 -
 arch/sparc/include/asm/pgtable_32.h          |  9 +-----
 arch/sparc/include/asm/pgtable_64.h          |  7 +----
 arch/um/include/asm/pgtable-3level.h         |  4 ---
 arch/um/include/asm/pgtable.h                |  4 ---
 arch/x86/include/asm/pgtable.h               | 17 ------------
 include/asm-generic/pgtable-nopmd.h          |  1 +
 include/linux/pgtable.h                      | 29 ++++++++++++++++++--
 30 files changed, 44 insertions(+), 120 deletions(-)

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index dac20d03b727..314973d2810d 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -305,6 +305,7 @@ extern inline pmd_t * pmd_offset(pud_t * dir, unsigned long address)
 	smp_read_barrier_depends(); /* see above */
 	return ret;
 }
+#define pmd_offset pmd_offset
 
 /* Find an entry in the third-level page table.. */
 extern inline pte_t * pte_offset_kernel(pmd_t * dir, unsigned long address)
diff --git a/arch/arm/include/asm/pgtable-2level.h b/arch/arm/include/asm/pgtable-2level.h
index 9e084a464a97..3502c2f746ca 100644
--- a/arch/arm/include/asm/pgtable-2level.h
+++ b/arch/arm/include/asm/pgtable-2level.h
@@ -187,6 +187,7 @@ static inline pmd_t *pmd_offset(pud_t *pud, unsigned long addr)
 {
 	return (pmd_t *)pud;
 }
+#define pmd_offset pmd_offset
 
 #define pmd_large(pmd)		(pmd_val(pmd) & 2)
 #define pmd_leaf(pmd)		(pmd_val(pmd) & 2)
diff --git a/arch/arm/include/asm/pgtable-3level.h b/arch/arm/include/asm/pgtable-3level.h
index 1933aed9f68d..fbb6693c3352 100644
--- a/arch/arm/include/asm/pgtable-3level.h
+++ b/arch/arm/include/asm/pgtable-3level.h
@@ -133,13 +133,6 @@ static inline pmd_t *pud_page_vaddr(pud_t pud)
 	return __va(pud_val(pud) & PHYS_MASK & (s32)PAGE_MASK);
 }
 
-/* Find an entry in the second-level page table.. */
-#define pmd_index(addr)		(((addr) >> PMD_SHIFT) & (PTRS_PER_PMD - 1))
-static inline pmd_t *pmd_offset(pud_t *pud, unsigned long addr)
-{
-	return (pmd_t *)pud_page_vaddr(*pud) + pmd_index(addr);
-}
-
 #define pmd_bad(pmd)		(!(pmd_val(pmd) & 2))
 
 #define copy_pmd(pmdpd,pmdps)		\
diff --git a/arch/arm/include/asm/pgtable-nommu.h b/arch/arm/include/asm/pgtable-nommu.h
index 1a758f14e0c3..d16aba48fa0a 100644
--- a/arch/arm/include/asm/pgtable-nommu.h
+++ b/arch/arm/include/asm/pgtable-nommu.h
@@ -22,7 +22,6 @@
 #define pgd_bad(pgd)		(0)
 #define pgd_clear(pgdp)
 #define kern_addr_valid(addr)	(1)
-#define	pmd_offset(a, b)	((void *)0)
 /* FIXME */
 /*
  * PMD_SHIFT determines the size of the area a second-level page table can map
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 5e3ef4cb855a..d0175335a2f2 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -566,11 +566,13 @@ static inline phys_addr_t pud_page_paddr(pud_t pud)
 	return __pud_to_phys(pud);
 }
 
-/* Find an entry in the second-level page table. */
-#define pmd_index(addr)		(((addr) >> PMD_SHIFT) & (PTRS_PER_PMD - 1))
+static inline unsigned long pud_page_vaddr(pud_t pud)
+{
+	return (unsigned long)__va(pud_page_paddr(pud));
+}
 
+/* Find an entry in the second-level page table. */
 #define pmd_offset_phys(dir, addr)	(pud_page_paddr(READ_ONCE(*(dir))) + pmd_index(addr) * sizeof(pmd_t))
-#define pmd_offset(dir, addr)		((pmd_t *)__va(pmd_offset_phys((dir), (addr))))
 
 #define pmd_set_fixmap(addr)		((pmd_t *)set_fixmap_offset(FIX_PMD, addr))
 #define pmd_set_fixmap_offset(pud, addr)	pmd_set_fixmap(pmd_offset_phys(pud, addr))
diff --git a/arch/c6x/include/asm/pgtable.h b/arch/c6x/include/asm/pgtable.h
index 60a67d833989..8a91ceda39fa 100644
--- a/arch/c6x/include/asm/pgtable.h
+++ b/arch/c6x/include/asm/pgtable.h
@@ -26,7 +26,6 @@
 #define pgd_clear(pgdp)
 #define kern_addr_valid(addr) (1)
 
-#define pmd_offset(a, b)	((void *)0)
 #define pmd_none(x)		(!pmd_val(x))
 #define pmd_present(x)		(pmd_val(x))
 #define pmd_clear(xp)		do { set_pmd(xp, __pmd(0)); } while (0)
diff --git a/arch/csky/include/asm/pgtable.h b/arch/csky/include/asm/pgtable.h
index bcef7e67ac2f..dc613f20e2e1 100644
--- a/arch/csky/include/asm/pgtable.h
+++ b/arch/csky/include/asm/pgtable.h
@@ -221,7 +221,6 @@ static inline pte_t pte_mkyoung(pte_t pte)
 }
 
 #define pud_index(address)	(((address) >> PUD_SHIFT) & (PTRS_PER_PUD-1))
-#define pmd_index(address)	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
 
 /* to find an entry in a kernel page-table-directory */
 #define pgd_offset_k(address)	pgd_offset(&init_mm, address)
diff --git a/arch/hexagon/include/asm/pgtable.h b/arch/hexagon/include/asm/pgtable.h
index f15bbaa88ba8..eb95e9f60cf0 100644
--- a/arch/hexagon/include/asm/pgtable.h
+++ b/arch/hexagon/include/asm/pgtable.h
@@ -206,15 +206,6 @@ static inline void pte_clear(struct mm_struct *mm, unsigned long addr,
 	pte_val(*ptep) = _NULL_PTE;
 }
 
-#ifdef NEED_PMD_INDEX_DESPITE_BEING_2_LEVEL
-/**
- * pmd_index - returns the index of the entry in the PMD page
- * which would control the given virtual address
- */
-#define pmd_index(address) (((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
-
-#endif
-
 /**
  * pgd_index - returns the index of the entry in the PGD page
  * which would control the given virtual address
diff --git a/arch/ia64/include/asm/pgtable.h b/arch/ia64/include/asm/pgtable.h
index b9ce7d78a33f..d75d981e6ee1 100644
--- a/arch/ia64/include/asm/pgtable.h
+++ b/arch/ia64/include/asm/pgtable.h
@@ -389,10 +389,6 @@ pgd_offset (const struct mm_struct *mm, unsigned long address)
 	((pud_t *) p4d_page_vaddr(*(dir)) + (((addr) >> PUD_SHIFT) & (PTRS_PER_PUD - 1)))
 #endif
 
-/* Find an entry in the third-level page table.. */
-#define pmd_offset(dir,addr) \
-	((pmd_t *) pud_page_vaddr(*(dir)) + (((addr) >> PMD_SHIFT) & (PTRS_PER_PMD - 1)))
-
 /* atomic versions of the some PTE manipulations: */
 
 static inline int
diff --git a/arch/m68k/include/asm/motorola_pgtable.h b/arch/m68k/include/asm/motorola_pgtable.h
index 345abf4d4e50..eb97ea70886e 100644
--- a/arch/m68k/include/asm/motorola_pgtable.h
+++ b/arch/m68k/include/asm/motorola_pgtable.h
@@ -211,13 +211,6 @@ static inline pgd_t *pgd_offset_k(unsigned long address)
 	return kernel_pg_dir + (address >> PGDIR_SHIFT);
 }
 
-
-/* Find an entry in the second-level page table.. */
-static inline pmd_t *pmd_offset(pud_t *dir, unsigned long address)
-{
-	return (pmd_t *)pud_page_vaddr(*dir) + ((address >> PMD_SHIFT) & (PTRS_PER_PMD-1));
-}
-
 /* Encode and de-code a swap entry (must be !pte_none(e) && !pte_present(e)) */
 #define __swp_type(x)		(((x).val >> 4) & 0xff)
 #define __swp_offset(x)		((x).val >> 12)
diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/include/asm/pgtable.h
index e53eb962fbed..927ccba161ec 100644
--- a/arch/microblaze/include/asm/pgtable.h
+++ b/arch/microblaze/include/asm/pgtable.h
@@ -21,7 +21,6 @@ extern int mem_init_done;
 #define pgd_bad(pgd)		(0)
 #define pgd_clear(pgdp)
 #define kern_addr_valid(addr)	(1)
-#define	pmd_offset(a, b)	((void *) 0)
 
 #define PAGE_NONE		__pgprot(0) /* these mean nothing to non MMU */
 #define PAGE_SHARED		__pgprot(0) /* these mean nothing to non MMU */
diff --git a/arch/mips/include/asm/pgtable-32.h b/arch/mips/include/asm/pgtable-32.h
index c04c5238261a..05b51c344939 100644
--- a/arch/mips/include/asm/pgtable-32.h
+++ b/arch/mips/include/asm/pgtable-32.h
@@ -200,7 +200,6 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
 
 #define pgd_index(address)	(((address) >> PGDIR_SHIFT) & (PTRS_PER_PGD-1))
 #define pud_index(address)	(((address) >> PUD_SHIFT) & (PTRS_PER_PUD-1))
-#define pmd_index(address)	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
 
 /* to find an entry in a page-table-directory */
 #define pgd_offset(mm, addr)	((mm)->pgd + pgd_index(addr))
diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index 430abb19ce82..21fb55510d35 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -324,7 +324,6 @@ static inline void pud_clear(pud_t *pudp)
 #define pgd_offset_k(address) pgd_offset(&init_mm, address)
 
 #define pgd_index(address)	(((address) >> PGDIR_SHIFT) & (PTRS_PER_PGD-1))
-#define pmd_index(address)	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
 
 /* to find an entry in a page-table-directory */
 #define pgd_offset(mm, addr)	((mm)->pgd + pgd_index(addr))
@@ -337,11 +336,6 @@ static inline unsigned long pud_page_vaddr(pud_t pud)
 #define pud_phys(pud)		virt_to_phys((void *)pud_val(pud))
 #define pud_page(pud)		(pfn_to_page(pud_phys(pud) >> PAGE_SHIFT))
 
-/* Find an entry in the second-level page table.. */
-static inline pmd_t *pmd_offset(pud_t * pud, unsigned long address)
-{
-	return (pmd_t *) pud_page_vaddr(*pud) + pmd_index(address);
-}
 #endif
 
 /*
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 3eb34953b60a..76488809a111 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -448,14 +448,6 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 
 /* Find an entry in the second-level page table.. */
 
-#if CONFIG_PGTABLE_LEVELS == 3
-#define pmd_index(addr)         (((addr) >> PMD_SHIFT) & (PTRS_PER_PMD - 1))
-#define pmd_offset(dir,address) \
-((pmd_t *) pud_page_vaddr(*(dir)) + pmd_index(address))
-#else
-#define pmd_offset(dir,addr) ((pmd_t *) dir)
-#endif
-
 extern void paging_init (void);
 
 /* Used for deferring calls to flush_dcache_page() */
diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
index 0f1b460ee715..70cd24bdcfec 100644
--- a/arch/parisc/kernel/pci-dma.c
+++ b/arch/parisc/kernel/pci-dma.c
@@ -201,7 +201,7 @@ static inline void unmap_uncached_pmd(pgd_t * dir, unsigned long vaddr,
 		pgd_clear(dir);
 		return;
 	}
-	pmd = pmd_offset(dir, vaddr);
+	pmd = pmd_offset(pud_offset(p4d_offset(dir, vaddr), vaddr), vaddr);
 	vaddr &= ~PGDIR_MASK;
 	end = vaddr + size;
 	if (end > PGDIR_SIZE)
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 0a968074eae5..fbb5d12c6214 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1010,7 +1010,6 @@ extern struct page *p4d_page(p4d_t p4d);
 
 #define pgd_index(address) (((address) >> (PGDIR_SHIFT)) & (PTRS_PER_PGD - 1))
 #define pud_index(address) (((address) >> (PUD_SHIFT)) & (PTRS_PER_PUD - 1))
-#define pmd_index(address) (((address) >> (PMD_SHIFT)) & (PTRS_PER_PMD - 1))
 
 /*
  * Find an entry in a page-table-directory.  We combine the address region
@@ -1021,8 +1020,6 @@ extern struct page *p4d_page(p4d_t p4d);
 
 #define pud_offset(p4dp, addr)	\
 	(((pud_t *) p4d_page_vaddr(*(p4dp))) + pud_index(addr))
-#define pmd_offset(pudp,addr) \
-	(((pmd_t *) pud_page_vaddr(*(pudp))) + pmd_index(addr))
 
 /* to find an entry in a kernel page-table-directory */
 /* This now only contains the vmalloc pages */
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index b964cdac2dae..210e064ede54 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -190,9 +190,6 @@ static inline void p4d_set(p4d_t *p4dp, unsigned long val)
 
 #define pgd_offset(mm, address)	 ((mm)->pgd + pgd_index(address))
 
-#define pmd_offset(pudp,addr) \
-  (((pmd_t *) pud_page_vaddr(*(pudp))) + (((addr) >> PMD_SHIFT) & (PTRS_PER_PMD - 1)))
-
 /* to find an entry in a kernel page-table-directory */
 /* This now only contains the vmalloc pages */
 #define pgd_offset_k(address) pgd_offset(&init_mm, address)
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index b15f70a1fdfa..f3b0da64c6c8 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -70,13 +70,6 @@ static inline struct page *pud_page(pud_t pud)
 	return pfn_to_page(pud_val(pud) >> _PAGE_PFN_SHIFT);
 }
 
-#define pmd_index(addr) (((addr) >> PMD_SHIFT) & (PTRS_PER_PMD - 1))
-
-static inline pmd_t *pmd_offset(pud_t *pud, unsigned long addr)
-{
-	return (pmd_t *)pud_page_vaddr(*pud) + pmd_index(addr);
-}
-
 static inline pmd_t pfn_pmd(unsigned long pfn, pgprot_t prot)
 {
 	return __pmd((pfn << _PAGE_PFN_SHIFT) | pgprot_val(prot));
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4016a6e427e9..1c8698ff1a94 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -283,21 +283,21 @@ static void __init create_pmd_mapping(pmd_t *pmdp,
 {
 	pte_t *ptep;
 	phys_addr_t pte_phys;
-	uintptr_t pmd_index = pmd_index(va);
+	uintptr_t pmd_idx = pmd_index(va);
 
 	if (sz == PMD_SIZE) {
-		if (pmd_none(pmdp[pmd_index]))
-			pmdp[pmd_index] = pfn_pmd(PFN_DOWN(pa), prot);
+		if (pmd_none(pmdp[pmd_idx]))
+			pmdp[pmd_idx] = pfn_pmd(PFN_DOWN(pa), prot);
 		return;
 	}
 
-	if (pmd_none(pmdp[pmd_index])) {
+	if (pmd_none(pmdp[pmd_idx])) {
 		pte_phys = alloc_pte(va);
-		pmdp[pmd_index] = pfn_pmd(PFN_DOWN(pte_phys), PAGE_TABLE);
+		pmdp[pmd_idx] = pfn_pmd(PFN_DOWN(pte_phys), PAGE_TABLE);
 		ptep = get_pte_virt(pte_phys);
 		memset(ptep, 0, PAGE_SIZE);
 	} else {
-		pte_phys = PFN_PHYS(_pmd_pfn(pmdp[pmd_index]));
+		pte_phys = PFN_PHYS(_pmd_pfn(pmdp[pmd_idx]));
 		ptep = get_pte_virt(pte_phys);
 	}
 
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 9be3667e3a45..c162e50c7689 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1281,6 +1281,7 @@ static inline pmd_t *pmd_offset(pud_t *pud, unsigned long address)
 		return (pmd_t *) pud_deref(*pud) + pmd_index(address);
 	return (pmd_t *) pud;
 }
+#define pmd_offset pmd_offset
 
 static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 {
diff --git a/arch/sh/include/asm/pgtable-3level.h b/arch/sh/include/asm/pgtable-3level.h
index 0f80097e5c9c..82d74472dfcd 100644
--- a/arch/sh/include/asm/pgtable-3level.h
+++ b/arch/sh/include/asm/pgtable-3level.h
@@ -39,13 +39,6 @@ static inline unsigned long pud_page_vaddr(pud_t pud)
 
 /* only used by the stubbed out hugetlb gup code, should never be called */
 #define pud_page(pud)		NULL
-
-#define pmd_index(address)	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
-static inline pmd_t *pmd_offset(pud_t *pud, unsigned long address)
-{
-	return (pmd_t *)pud_page_vaddr(*pud) + pmd_index(address);
-}
-
 #define pud_none(x)	(!pud_val(x))
 #define pud_present(x)	(pud_val(x))
 #define pud_clear(xp)	do { set_pud(xp, __pud(0)); } while (0)
diff --git a/arch/sh/include/asm/pgtable_32.h b/arch/sh/include/asm/pgtable_32.h
index 263ab5699f96..3023943ce731 100644
--- a/arch/sh/include/asm/pgtable_32.h
+++ b/arch/sh/include/asm/pgtable_32.h
@@ -416,7 +416,6 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 #define pgd_offset_k(address)	pgd_offset(&init_mm, address)
 
 #define pud_index(address)	(((address) >> PUD_SHIFT) & (PTRS_PER_PUD-1))
-#define pmd_index(address)	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
 
 #ifdef CONFIG_X2TLB
 #define pte_ERROR(e) \
diff --git a/arch/sh/include/asm/pgtable_64.h b/arch/sh/include/asm/pgtable_64.h
index 7674d38bea5c..8d5948f92caf 100644
--- a/arch/sh/include/asm/pgtable_64.h
+++ b/arch/sh/include/asm/pgtable_64.h
@@ -52,7 +52,6 @@ static __inline__ void set_pte(pte_t *pteptr, pte_t pteval)
 #define pgd_offset_k(address) pgd_offset(&init_mm, address)
 
 #define pud_index(address)	(((address) >> PUD_SHIFT) & (PTRS_PER_PUD-1))
-/* #define pmd_index(address)	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1)) */
 
 /*
  * PMD level access routines. Same notes as above.
diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
index 2fc29207e254..ae45812336ed 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -317,13 +317,6 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 /* to find an entry in a kernel page-table-directory */
 #define pgd_offset_k(address) pgd_offset(&init_mm, address)
 
-/* Find an entry in the second-level page table.. */
-static inline pmd_t *pmd_offset(pud_t * dir, unsigned long address)
-{
-	return (pmd_t *) pud_page_vaddr(*dir) +
-		((address >> PMD_SHIFT) & (PTRS_PER_PMD - 1));
-}
-
 struct seq_file;
 void mmu_info(struct seq_file *m);
 
@@ -412,7 +405,7 @@ static inline int io_remap_pfn_range(struct vm_area_struct *vma,
 
 	return remap_pfn_range(vma, from, phys_base >> PAGE_SHIFT, size, prot);
 }
-#define io_remap_pfn_range io_remap_pfn_range 
+#define io_remap_pfn_range io_remap_pfn_range
 
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 #define ptep_set_access_flags(__vma, __address, __ptep, __entry, __dirty) \
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 7df72efa4a8d..2da1cec60f4e 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -901,11 +901,6 @@ static inline unsigned long pud_pfn(pud_t pud)
 #define pud_offset(p4dp, address)	\
 	((pud_t *) p4d_page_vaddr(*(p4dp)) + pud_index(address))
 
-/* Find an entry in the second-level page table.. */
-#define pmd_offset(pudp, address)	\
-	((pmd_t *) pud_page_vaddr(*(pudp)) + \
-	 (((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1)))
-
 /* We cannot include <linux/mm_types.h> at this point yet: */
 extern struct mm_struct init_mm;
 
@@ -1070,7 +1065,7 @@ static inline int io_remap_pfn_range(struct vm_area_struct *vma,
 
 	return remap_pfn_range(vma, from, phys_base >> PAGE_SHIFT, size, prot);
 }
-#define io_remap_pfn_range io_remap_pfn_range 
+#define io_remap_pfn_range io_remap_pfn_range
 
 static inline unsigned long __untagged_addr(unsigned long start)
 {
diff --git a/arch/um/include/asm/pgtable-3level.h b/arch/um/include/asm/pgtable-3level.h
index 8a3b689e0f86..36f452957cef 100644
--- a/arch/um/include/asm/pgtable-3level.h
+++ b/arch/um/include/asm/pgtable-3level.h
@@ -89,10 +89,6 @@ static inline void pud_clear (pud_t *pud)
 #define pud_page(pud) phys_to_page(pud_val(pud) & PAGE_MASK)
 #define pud_page_vaddr(pud) ((unsigned long) __va(pud_val(pud) & PAGE_MASK))
 
-/* Find an entry in the second-level page table.. */
-#define pmd_offset(pud, address) ((pmd_t *) pud_page_vaddr(*(pud)) + \
-			pmd_index(address))
-
 static inline unsigned long pte_pfn(pte_t pte)
 {
 	return phys_to_pfn(pte_val(pte));
diff --git a/arch/um/include/asm/pgtable.h b/arch/um/include/asm/pgtable.h
index c57fe228833c..ea2d3e6f46dd 100644
--- a/arch/um/include/asm/pgtable.h
+++ b/arch/um/include/asm/pgtable.h
@@ -318,10 +318,6 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
  * control the given virtual address
  */
 #define pmd_page_vaddr(pmd) ((unsigned long) __va(pmd_val(pmd) & PAGE_MASK))
-#define pmd_index(address) (((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
-
-#define pmd_page_vaddr(pmd) \
-	((unsigned long) __va(pmd_val(pmd) & PAGE_MASK))
 
 struct mm_struct;
 extern pte_t *virt_to_pte(struct mm_struct *mm, unsigned long addr);
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 64be521f562c..35e3bf86df20 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -835,17 +835,6 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
  */
 #define pmd_page(pmd)	pfn_to_page(pmd_pfn(pmd))
 
-/*
- * the pmd page can be thought of an array like this: pmd_t[PTRS_PER_PMD]
- *
- * this macro returns the index of the entry in the pmd page which would
- * control the given virtual address
- */
-static inline unsigned long pmd_index(unsigned long address)
-{
-	return (address >> PMD_SHIFT) & (PTRS_PER_PMD - 1);
-}
-
 /*
  * Conversion functions: convert a page and protection to a page entry,
  * and a page entry and page directory to the page they refer to.
@@ -887,12 +876,6 @@ static inline unsigned long pud_page_vaddr(pud_t pud)
  */
 #define pud_page(pud)	pfn_to_page(pud_pfn(pud))
 
-/* Find an entry in the second-level page table.. */
-static inline pmd_t *pmd_offset(pud_t *pud, unsigned long address)
-{
-	return (pmd_t *)pud_page_vaddr(*pud) + pmd_index(address);
-}
-
 #define pud_leaf	pud_large
 static inline int pud_large(pud_t pud)
 {
diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
index 0d9b28cba16d..3e13acd019ae 100644
--- a/include/asm-generic/pgtable-nopmd.h
+++ b/include/asm-generic/pgtable-nopmd.h
@@ -45,6 +45,7 @@ static inline pmd_t * pmd_offset(pud_t * pud, unsigned long address)
 {
 	return (pmd_t *)pud;
 }
+#define pmd_offset pmd_offset
 
 #define pmd_val(x)				(pud_val((x).pud))
 #define __pmd(x)				((pmd_t) { __pud(x) } )
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 18a81b1e3d0d..f114b51bef18 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -29,16 +29,30 @@
 #endif
 
 /*
- * the pte page can be thought of an array like this: pte_t[PTRS_PER_PTE]
+ * A page table page can be thought of an array like this: pXd_t[PTRS_PER_PxD]
  *
- * this function returns the index of the entry in the pte page which would
- * control the given virtual address
+ * The pXx_index() functions return the index of the entry in the page
+ * table page which would control the given virtual address
+ *
+ * As these functions may be used by the same code for different levels of
+ * the page table folding, they are always available, regardless of
+ * CONFIG_PGTABLE_LEVELS value. For the folded levels they simply return 0
+ * because in such cases PTRS_PER_PxD equals 1.
  */
+
 static inline unsigned long pte_index(unsigned long address)
 {
 	return (address >> PAGE_SHIFT) & (PTRS_PER_PTE - 1);
 }
 
+#ifndef pmd_index
+static inline unsigned long pmd_index(unsigned long address)
+{
+	return (address >> PMD_SHIFT) & (PTRS_PER_PMD - 1);
+}
+#define pmd_index pmd_index
+#endif
+
 #ifndef pte_offset_kernel
 static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
 {
@@ -57,6 +71,15 @@ static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
 #define pte_unmap(pte) ((void)(pte))	/* NOP */
 #endif
 
+/* Find an entry in the second-level page table.. */
+#ifndef pmd_offset
+static inline pmd_t *pmd_offset(pud_t *pud, unsigned long address)
+{
+	return (pmd_t *)pud_page_vaddr(*pud) + pmd_index(address);
+}
+#define pmd_offset pmd_offset
+#endif
+
 /*
  * In many cases it is known that a virtual address is mapped at PMD or PTE
  * level, so instead of traversing all the page table levels, we can get a
-- 
2.26.2

