Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9296F1D385F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 19:34:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NJYp6qhfzDqw0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 03:34:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=dUZXTQMh; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NHyK07GPzDqMW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 03:06:49 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D275A20767;
 Thu, 14 May 2020 17:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589476006;
 bh=j7oiVzXSjvBXHJnUzsYYohsPpXrbXDP0q1fLbgvZfJ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dUZXTQMhOfwr+pt2yuVp7ZGiMYARuxBUDJp5ZyIqox2Eh2ftaIANdQYGpRGbctzN+
 Aj9BL4Csa/W4e6CaLFVEMAOUUw9jpLXpwGI/CJMQEFRTDMQCRdILbX3ERaCALGTHF3
 pNPDY0aK+MT/etNJ4LT+dxx3ZCKwUEWSP8R78Tvo=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/12] mm: consolidate pgd_index() and pgd_offset{_k}()
 definitions
Date: Thu, 14 May 2020 20:03:27 +0300
Message-Id: <20200514170327.31389-13-rppt@kernel.org>
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

All architectures tables define pgd_offset() as an entry in the array of
PGDs indexed by the pgd_index(), where pgd_index() is

	(address >> PGD_SHIFT) & (PTRS_PER_PGD - 1)

For the most cases, the pgd_offset() uses mm->pgd as the pointer to the
top-level page directory and the pgd_offset_k() is a helper that presumes
that mm == &init_mm.

Use x86 implementation as the generic one and remove redundant definitions
of PGD accessors in most of arch/*/include/asm/pgtable.h

The generic implementation can be overridden by an architecture and this
ability is currently in use by there architectures:
* ia64 has custom implementation of pgd_index()
* s390 has custom definitions of all page table accessors

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/alpha/include/asm/pgtable.h             |  9 ----
 arch/arc/include/asm/pgtable.h               |  7 ---
 arch/arm/include/asm/pgtable.h               |  8 ----
 arch/arm64/include/asm/pgtable.h             | 10 ----
 arch/arm64/kernel/hibernate.c                |  4 +-
 arch/arm64/mm/kasan_init.c                   |  2 +-
 arch/arm64/mm/mmu.c                          |  8 ++--
 arch/csky/include/asm/pgtable.h              | 11 -----
 arch/hexagon/include/asm/pgtable.h           | 18 -------
 arch/ia64/include/asm/pgtable.h              | 14 +-----
 arch/m68k/include/asm/mcf_pgtable.h          | 11 -----
 arch/m68k/include/asm/motorola_pgtable.h     | 16 -------
 arch/m68k/include/asm/sun3_pgtable.h         |  9 ----
 arch/microblaze/include/asm/pgtable.h        |  7 ---
 arch/mips/include/asm/pgtable-32.h           |  8 ----
 arch/mips/include/asm/pgtable-64.h           |  8 ----
 arch/nds32/include/asm/pgtable.h             |  6 ---
 arch/nios2/include/asm/pgtable.h             |  8 ----
 arch/openrisc/include/asm/pgtable.h          | 10 ----
 arch/parisc/include/asm/pgtable.h            |  9 ----
 arch/powerpc/include/asm/book3s/32/pgtable.h |  7 ---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 13 -----
 arch/powerpc/include/asm/nohash/32/pgtable.h |  7 ---
 arch/powerpc/include/asm/nohash/64/pgtable.h | 12 -----
 arch/riscv/include/asm/pgtable.h             | 10 ----
 arch/riscv/mm/init.c                         | 12 ++---
 arch/s390/include/asm/pgtable.h              |  1 -
 arch/sh/include/asm/pgtable_32.h             |  7 ---
 arch/sh/include/asm/pgtable_64.h             | 11 -----
 arch/sparc/include/asm/pgtable_32.h          |  8 ----
 arch/sparc/include/asm/pgtable_64.h          |  7 ---
 arch/um/include/asm/pgtable.h                | 50 ++++++--------------
 arch/unicore32/include/asm/pgtable.h         |  8 ----
 arch/x86/include/asm/pgtable.h               | 24 ----------
 arch/xtensa/include/asm/pgtable.h            |  8 ----
 include/linux/pgtable.h                      | 26 ++++++++++
 36 files changed, 55 insertions(+), 339 deletions(-)

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 314973d2810d..162c17b2631f 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -276,15 +276,6 @@ extern inline pte_t pte_mkwrite(pte_t pte)	{ pte_val(pte) &= ~_PAGE_FOW; return
 extern inline pte_t pte_mkdirty(pte_t pte)	{ pte_val(pte) |= __DIRTY_BITS; return pte; }
 extern inline pte_t pte_mkyoung(pte_t pte)	{ pte_val(pte) |= __ACCESS_BITS; return pte; }
 
-#define PAGE_DIR_OFFSET(tsk,address) pgd_offset((tsk),(address))
-
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(address) pgd_offset(&init_mm, (address))
-
-/* to find an entry in a page-table-directory. */
-#define pgd_index(address)	(((address) >> PGDIR_SHIFT) & (PTRS_PER_PGD-1))
-#define pgd_offset(mm, address)	((mm)->pgd+pgd_index(address))
-
 /*
  * The smp_read_barrier_depends() in the following functions are required to
  * order the load of *dir (the pointer in the top level page table) with any
diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index 1146905f594b..f1ed17edb085 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -316,13 +316,6 @@ static inline void set_pte_at(struct mm_struct *mm, unsigned long addr,
 	set_pte(ptep, pteval);
 }
 
-/*
- * All kernel related VM pages are in init's mm.
- */
-#define pgd_offset_k(address)	pgd_offset(&init_mm, address)
-#define pgd_index(addr)		((addr) >> PGDIR_SHIFT)
-#define pgd_offset(mm, addr)	(((mm)->pgd)+pgd_index(addr))
-
 /*
  * Macro to quickly access the PGD entry, utlising the fact that some
  * arch may cache the pointer to Page Directory of "current" task
diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
index 41543bc47660..c02f24400369 100644
--- a/arch/arm/include/asm/pgtable.h
+++ b/arch/arm/include/asm/pgtable.h
@@ -166,14 +166,6 @@ extern struct page *empty_zero_page;
 
 extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 
-/* to find an entry in a page-table-directory */
-#define pgd_index(addr)		((addr) >> PGDIR_SHIFT)
-
-#define pgd_offset(mm, addr)	((mm)->pgd + pgd_index(addr))
-
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(addr)	pgd_offset(&init_mm, addr)
-
 #define pmd_none(pmd)		(!pmd_val(pmd))
 
 static inline pte_t *pmd_page_vaddr(pmd_t pmd)
diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index c0155814b374..6dbd267ab931 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -659,16 +659,6 @@ static inline unsigned long p4d_page_vaddr(p4d_t p4d)
 
 #define pgd_ERROR(pgd)		__pgd_error(__FILE__, __LINE__, pgd_val(pgd))
 
-/* to find an entry in a page-table-directory */
-#define pgd_index(addr)		(((addr) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
-
-#define pgd_offset_raw(pgd, addr)	((pgd) + pgd_index(addr))
-
-#define pgd_offset(mm, addr)	(pgd_offset_raw((mm)->pgd, (addr)))
-
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(addr)	pgd_offset(&init_mm, addr)
-
 #define pgd_set_fixmap(addr)	((pgd_t *)set_fixmap_offset(FIX_PGD, addr))
 #define pgd_clear_fixmap()	clear_fixmap(FIX_PGD)
 
diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 668903c94a2b..68e14152d6e9 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -188,7 +188,7 @@ static int trans_pgd_map_page(pgd_t *trans_pgd, void *page,
 	pmd_t *pmdp;
 	pte_t *ptep;
 
-	pgdp = pgd_offset_raw(trans_pgd, dst_addr);
+	pgdp = pgd_offset_pgd(trans_pgd, dst_addr);
 	if (pgd_none(READ_ONCE(*pgdp))) {
 		pudp = (void *)get_safe_page(GFP_ATOMIC);
 		if (!pudp)
@@ -490,7 +490,7 @@ static int copy_page_tables(pgd_t *dst_pgdp, unsigned long start,
 	unsigned long addr = start;
 	pgd_t *src_pgdp = pgd_offset_k(start);
 
-	dst_pgdp = pgd_offset_raw(dst_pgdp, start);
+	dst_pgdp = pgd_offset_pgd(dst_pgdp, start);
 	do {
 		next = pgd_addr_end(addr, end);
 		if (pgd_none(READ_ONCE(*src_pgdp)))
diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index ca77eb8a0ccd..7291b26ce788 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -190,7 +190,7 @@ void __init kasan_copy_shadow(pgd_t *pgdir)
 
 	pgdp = pgd_offset_k(KASAN_SHADOW_START);
 	pgdp_end = pgd_offset_k(KASAN_SHADOW_END);
-	pgdp_new = pgd_offset_raw(pgdir, KASAN_SHADOW_START);
+	pgdp_new = pgd_offset_pgd(pgdir, KASAN_SHADOW_START);
 	do {
 		set_pgd(pgdp_new, READ_ONCE(*pgdp));
 	} while (pgdp++, pgdp_new++, pgdp != pgdp_end);
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index e7fbc6275329..990929c8837e 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -341,7 +341,7 @@ static void __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
 				 int flags)
 {
 	unsigned long addr, end, next;
-	pgd_t *pgdp = pgd_offset_raw(pgdir, virt);
+	pgd_t *pgdp = pgd_offset_pgd(pgdir, virt);
 
 	/*
 	 * If the virtual and physical address don't have the same offset
@@ -663,13 +663,13 @@ static void __init map_kernel(pgd_t *pgdp)
 			   &vmlinux_initdata, 0, VM_NO_GUARD);
 	map_kernel_segment(pgdp, _data, _end, PAGE_KERNEL, &vmlinux_data, 0, 0);
 
-	if (!READ_ONCE(pgd_val(*pgd_offset_raw(pgdp, FIXADDR_START)))) {
+	if (!READ_ONCE(pgd_val(*pgd_offset_pgd(pgdp, FIXADDR_START)))) {
 		/*
 		 * The fixmap falls in a separate pgd to the kernel, and doesn't
 		 * live in the carveout for the swapper_pg_dir. We can simply
 		 * re-use the existing dir for the fixmap.
 		 */
-		set_pgd(pgd_offset_raw(pgdp, FIXADDR_START),
+		set_pgd(pgd_offset_pgd(pgdp, FIXADDR_START),
 			READ_ONCE(*pgd_offset_k(FIXADDR_START)));
 	} else if (CONFIG_PGTABLE_LEVELS > 3) {
 		pgd_t *bm_pgdp;
@@ -682,7 +682,7 @@ static void __init map_kernel(pgd_t *pgdp)
 		 * entry instead.
 		 */
 		BUG_ON(!IS_ENABLED(CONFIG_ARM64_16K_PAGES));
-		bm_pgdp = pgd_offset_raw(pgdp, FIXADDR_START);
+		bm_pgdp = pgd_offset_pgd(pgdp, FIXADDR_START);
 		bm_p4dp = p4d_offset(bm_pgdp, FIXADDR_START);
 		bm_pudp = pud_set_fixmap_offset(bm_p4dp, FIXADDR_START);
 		pud_populate(&init_mm, bm_pudp, lm_alias(bm_pmd));
diff --git a/arch/csky/include/asm/pgtable.h b/arch/csky/include/asm/pgtable.h
index c5ab20970857..2002cb7f1053 100644
--- a/arch/csky/include/asm/pgtable.h
+++ b/arch/csky/include/asm/pgtable.h
@@ -220,11 +220,6 @@ static inline pte_t pte_mkyoung(pte_t pte)
 	return pte;
 }
 
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(address)	pgd_offset(&init_mm, address)
-
-#define pgd_index(address)	((address) >> PGDIR_SHIFT)
-
 #define __HAVE_PHYS_MEM_ACCESS_PROT
 struct file;
 extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
@@ -268,12 +263,6 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 		     (pgprot_val(newprot)));
 }
 
-/* to find an entry in a page-table-directory */
-static inline pgd_t *pgd_offset(struct mm_struct *mm, unsigned long address)
-{
-	return mm->pgd + pgd_index(address);
-}
-
 extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 extern void paging_init(void);
 
diff --git a/arch/hexagon/include/asm/pgtable.h b/arch/hexagon/include/asm/pgtable.h
index eb95e9f60cf0..dbb22b80b8c4 100644
--- a/arch/hexagon/include/asm/pgtable.h
+++ b/arch/hexagon/include/asm/pgtable.h
@@ -206,24 +206,6 @@ static inline void pte_clear(struct mm_struct *mm, unsigned long addr,
 	pte_val(*ptep) = _NULL_PTE;
 }
 
-/**
- * pgd_index - returns the index of the entry in the PGD page
- * which would control the given virtual address
- *
- * This returns the *index* for the address in the pgd_t
- */
-#define pgd_index(address) (((address) >> PGDIR_SHIFT) & (PTRS_PER_PGD-1))
-
-/*
- * pgd_offset - find an offset in a page-table-directory
- */
-#define pgd_offset(mm, addr) ((mm)->pgd + pgd_index(addr))
-
-/*
- * pgd_offset_k - get kernel (init_mm) pgd entry pointer for addr
- */
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
-
 /**
  * pmd_none - check if pmd_entry is mapped
  * @pmd_entry:  pmd entry
diff --git a/arch/ia64/include/asm/pgtable.h b/arch/ia64/include/asm/pgtable.h
index 4c24e5e18bff..10850897a91c 100644
--- a/arch/ia64/include/asm/pgtable.h
+++ b/arch/ia64/include/asm/pgtable.h
@@ -364,19 +364,7 @@ pgd_index (unsigned long address)
 
 	return (region << (PAGE_SHIFT - 6)) | l1index;
 }
-
-/* The offset in the 1-level directory is given by the 3 region bits
-   (61..63) and the level-1 bits.  */
-static inline pgd_t*
-pgd_offset (const struct mm_struct *mm, unsigned long address)
-{
-	return mm->pgd + pgd_index(address);
-}
-
-/* In the kernel's mapped region we completely ignore the region number
-   (since we know it's in region number 5). */
-#define pgd_offset_k(addr) \
-	(init_mm.pgd + (((addr) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1)))
+#define pgd_index pgd_index
 
 /* Look up a pgd entry in the gate area.  On IA-64, the gate-area
    resides in the kernel-mapped segment, hence we use pgd_offset_k()
diff --git a/arch/m68k/include/asm/mcf_pgtable.h b/arch/m68k/include/asm/mcf_pgtable.h
index 59f7d5fca378..8d4ec05996c5 100644
--- a/arch/m68k/include/asm/mcf_pgtable.h
+++ b/arch/m68k/include/asm/mcf_pgtable.h
@@ -310,17 +310,6 @@ static inline pte_t pte_mkcache(pte_t pte)
 #define swapper_pg_dir kernel_pg_dir
 extern pgd_t kernel_pg_dir[PTRS_PER_PGD];
 
-/*
- * Find an entry in a pagetable directory.
- */
-#define pgd_index(address)	((address) >> PGDIR_SHIFT)
-#define pgd_offset(mm, address)	((mm)->pgd + pgd_index(address))
-
-/*
- * Find an entry in a kernel pagetable directory.
- */
-#define pgd_offset_k(address)	pgd_offset(&init_mm, address)
-
 /*
  * Encode and de-code a swap entry (must be !pte_none(e) && !pte_present(e))
  */
diff --git a/arch/m68k/include/asm/motorola_pgtable.h b/arch/m68k/include/asm/motorola_pgtable.h
index eb97ea70886e..8076467eff4b 100644
--- a/arch/m68k/include/asm/motorola_pgtable.h
+++ b/arch/m68k/include/asm/motorola_pgtable.h
@@ -192,25 +192,9 @@ static inline pte_t pte_mkcache(pte_t pte)
 	return pte;
 }
 
-#define PAGE_DIR_OFFSET(tsk,address) pgd_offset((tsk),(address))
-
-#define pgd_index(address)     ((address) >> PGDIR_SHIFT)
-
-/* to find an entry in a page-table-directory */
-static inline pgd_t *pgd_offset(const struct mm_struct *mm,
-				unsigned long address)
-{
-	return mm->pgd + pgd_index(address);
-}
-
 #define swapper_pg_dir kernel_pg_dir
 extern pgd_t kernel_pg_dir[128];
 
-static inline pgd_t *pgd_offset_k(unsigned long address)
-{
-	return kernel_pg_dir + (address >> PGDIR_SHIFT);
-}
-
 /* Encode and de-code a swap entry (must be !pte_none(e) && !pte_present(e)) */
 #define __swp_type(x)		(((x).val >> 4) & 0xff)
 #define __swp_offset(x)		((x).val >> 12)
diff --git a/arch/m68k/include/asm/sun3_pgtable.h b/arch/m68k/include/asm/sun3_pgtable.h
index 1414fc363743..5b24283a0a42 100644
--- a/arch/m68k/include/asm/sun3_pgtable.h
+++ b/arch/m68k/include/asm/sun3_pgtable.h
@@ -174,15 +174,6 @@ static inline pte_t pte_mkcache(pte_t pte)	{ return pte; }
 extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 extern pgd_t kernel_pg_dir[PTRS_PER_PGD];
 
-/* Find an entry in a pagetable directory. */
-#define pgd_index(address)     ((address) >> PGDIR_SHIFT)
-
-#define pgd_offset(mm, address) \
-((mm)->pgd + pgd_index(address))
-
-/* Find an entry in a kernel pagetable directory. */
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
-
 /* Macros to (de)construct the fake PTEs representing swap pages. */
 #define __swp_type(x)		((x).val & 0x7F)
 #define __swp_offset(x)		(((x).val) >> 7)
diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/include/asm/pgtable.h
index 927ccba161ec..3fa1df90925e 100644
--- a/arch/microblaze/include/asm/pgtable.h
+++ b/arch/microblaze/include/asm/pgtable.h
@@ -445,13 +445,6 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 /* returns struct *page of the pmd entry*/
 #define pmd_page(pmd)	(pfn_to_page(__pa(pmd_val(pmd)) >> PAGE_SHIFT))
 
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
-
-/* to find an entry in a page-table-directory */
-#define pgd_index(address)	 ((address) >> PGDIR_SHIFT)
-#define pgd_offset(mm, address)	 ((mm)->pgd + pgd_index(address))
-
 /* Find an entry in the third-level page table.. */
 
 extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
diff --git a/arch/mips/include/asm/pgtable-32.h b/arch/mips/include/asm/pgtable-32.h
index 9c0e7a5ffc75..a950fc1ddb4d 100644
--- a/arch/mips/include/asm/pgtable-32.h
+++ b/arch/mips/include/asm/pgtable-32.h
@@ -195,14 +195,6 @@ static inline pte_t pfn_pte(unsigned long pfn, pgprot_t prot)
 
 #define pte_page(x)		pfn_to_page(pte_pfn(x))
 
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
-
-#define pgd_index(address)	(((address) >> PGDIR_SHIFT) & (PTRS_PER_PGD-1))
-
-/* to find an entry in a page-table-directory */
-#define pgd_offset(mm, addr)	((mm)->pgd + pgd_index(addr))
-
 #if defined(CONFIG_CPU_R3K_TLB)
 
 /* Swap entries must have VALID bit cleared. */
diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index 38170fdac5bf..1e7d6ce9d8d6 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -313,14 +313,6 @@ static inline void pud_clear(pud_t *pudp)
 #define pfn_pmd(pfn, prot)	__pmd(((pfn) << _PFN_SHIFT) | pgprot_val(prot))
 #endif
 
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
-
-#define pgd_index(address)	(((address) >> PGDIR_SHIFT) & (PTRS_PER_PGD-1))
-
-/* to find an entry in a page-table-directory */
-#define pgd_offset(mm, addr)	((mm)->pgd + pgd_index(addr))
-
 #ifndef __PAGETABLE_PMD_FOLDED
 static inline unsigned long pud_page_vaddr(pud_t pud)
 {
diff --git a/arch/nds32/include/asm/pgtable.h b/arch/nds32/include/asm/pgtable.h
index fc97480cbdd5..419f984eef70 100644
--- a/arch/nds32/include/asm/pgtable.h
+++ b/arch/nds32/include/asm/pgtable.h
@@ -340,12 +340,6 @@ static inline pmd_t __mk_pmd(pte_t * ptep, unsigned long prot)
  *
 */
 
-/* to find an entry in a page-table-directory */
-#define pgd_index(address)      (((address) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
-#define pgd_offset(mm, address)	((mm)->pgd + pgd_index(address))
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(addr)      pgd_offset(&init_mm, addr)
-
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
 	const unsigned long mask = 0xfff;
diff --git a/arch/nios2/include/asm/pgtable.h b/arch/nios2/include/asm/pgtable.h
index e93e17caf965..2600d76c310c 100644
--- a/arch/nios2/include/asm/pgtable.h
+++ b/arch/nios2/include/asm/pgtable.h
@@ -102,10 +102,6 @@ static inline void set_pmd(pmd_t *pmdptr, pmd_t pmdval)
 	*pmdptr = pmdval;
 }
 
-/* to find an entry in a page-table-directory */
-#define pgd_index(addr)		(((addr) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
-#define pgd_offset(mm, addr)	((mm)->pgd + pgd_index(addr))
-
 static inline int pte_write(pte_t pte)		\
 	{ return pte_val(pte) & _PAGE_WRITE; }
 static inline int pte_dirty(pte_t pte)		\
@@ -248,10 +244,6 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 	return pmd_val(pmd);
 }
 
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(addr)	pgd_offset(&init_mm, addr)
-
-
 #define pte_ERROR(e) \
 	pr_err("%s:%d: bad pte %08lx.\n", \
 		__FILE__, __LINE__, pte_val(e))
diff --git a/arch/openrisc/include/asm/pgtable.h b/arch/openrisc/include/asm/pgtable.h
index 7de061304b6d..9425bedab4fc 100644
--- a/arch/openrisc/include/asm/pgtable.h
+++ b/arch/openrisc/include/asm/pgtable.h
@@ -369,16 +369,6 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 	return ((unsigned long) __va(pmd_val(pmd) & PAGE_MASK));
 }
 
-/* to find an entry in a page-table-directory. */
-#define pgd_index(address)      ((address >> PGDIR_SHIFT) & (PTRS_PER_PGD-1))
-
-#define __pgd_offset(address)   pgd_index(address)
-
-#define pgd_offset(mm, address) ((mm)->pgd+pgd_index(address))
-
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
-
 #define __pmd_offset(address) \
 	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
 
diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index 76488809a111..097d19007f2e 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -437,15 +437,6 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 #define __pmd_page(pmd) ((unsigned long) __va(pmd_address(pmd)))
 #define pmd_page(pmd)	virt_to_page((void *)__pmd_page(pmd))
 
-#define pgd_index(address) ((address) >> PGDIR_SHIFT)
-
-/* to find an entry in a page-table-directory */
-#define pgd_offset(mm, address) \
-((mm)->pgd + ((address) >> PGDIR_SHIFT))
-
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
-
 /* Find an entry in the second-level page table.. */
 
 extern void paging_init (void);
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index fc54227363b5..9756a6d657c5 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -354,13 +354,6 @@ static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
 #define pmd_page(pmd)		\
 	pfn_to_page(pmd_val(pmd) >> PAGE_SHIFT)
 
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
-
-/* to find an entry in a page-table-directory */
-#define pgd_index(address)	 ((address) >> PGDIR_SHIFT)
-#define pgd_offset(mm, address)	 ((mm)->pgd + pgd_index(address))
-
 /*
  * Encode and decode a swap entry.
  * Note that the bits we use in a PTE for representing a swap entry
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index fffe28d52c02..27a884624304 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1008,19 +1008,6 @@ extern struct page *p4d_page(p4d_t p4d);
 #define pud_page_vaddr(pud)	__va(pud_val(pud) & ~PUD_MASKED_BITS)
 #define p4d_page_vaddr(p4d)	__va(p4d_val(p4d) & ~P4D_MASKED_BITS)
 
-#define pgd_index(address) (((address) >> (PGDIR_SHIFT)) & (PTRS_PER_PGD - 1))
-
-/*
- * Find an entry in a page-table-directory.  We combine the address region
- * (the high order N bits) and the pgd portion of the address.
- */
-
-#define pgd_offset(mm, address)	 ((mm)->pgd + pgd_index(address))
-
-/* to find an entry in a kernel page-table-directory */
-/* This now only contains the vmalloc pages */
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
-
 #define pte_ERROR(e) \
 	pr_err("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, pte_val(e))
 #define pmd_ERROR(e) \
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index cc2ed08d6424..889feaec0a0e 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -358,13 +358,6 @@ static inline int pte_young(pte_t pte)
 	pfn_to_page((__pa(pmd_val(pmd)) >> PAGE_SHIFT))
 #endif
 
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
-
-/* to find an entry in a page-table-directory */
-#define pgd_index(address)	 ((address) >> PGDIR_SHIFT)
-#define pgd_offset(mm, address)	 ((mm)->pgd + pgd_index(address))
-
 /*
  * Encode and decode a swap entry.
  * Note that the bits we use in a PTE for representing a swap entry
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 210e064ede54..9dd9df567efb 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -182,18 +182,6 @@ static inline void p4d_set(p4d_t *p4dp, unsigned long val)
 	*p4dp = __p4d(val);
 }
 
-/*
- * Find an entry in a page-table-directory.  We combine the address region
- * (the high order N bits) and the pgd portion of the address.
- */
-#define pgd_index(address) (((address) >> (PGDIR_SHIFT)) & (PTRS_PER_PGD - 1))
-
-#define pgd_offset(mm, address)	 ((mm)->pgd + pgd_index(address))
-
-/* to find an entry in a kernel page-table-directory */
-/* This now only contains the vmalloc pages */
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
-
 /* Atomic PTE updates */
 static inline unsigned long pte_update(struct mm_struct *mm,
 				       unsigned long addr,
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 8daa362419d8..04fb583769b4 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -173,16 +173,6 @@ static inline unsigned long _pgd_pfn(pgd_t pgd)
 	return pgd_val(pgd) >> _PAGE_PFN_SHIFT;
 }
 
-#define pgd_index(addr) (((addr) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
-
-/* Locate an entry in the page global directory */
-static inline pgd_t *pgd_offset(const struct mm_struct *mm, unsigned long addr)
-{
-	return mm->pgd + pgd_index(addr);
-}
-/* Locate an entry in the kernel page global directory */
-#define pgd_offset_k(addr)      pgd_offset(&init_mm, (addr))
-
 static inline struct page *pmd_page(pmd_t pmd)
 {
 	return pfn_to_page(pmd_val(pmd) >> _PAGE_PFN_SHIFT);
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 1c8698ff1a94..078b629750c0 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -325,21 +325,21 @@ static void __init create_pgd_mapping(pgd_t *pgdp,
 {
 	pgd_next_t *nextp;
 	phys_addr_t next_phys;
-	uintptr_t pgd_index = pgd_index(va);
+	uintptr_t pgd_idx = pgd_index(va);
 
 	if (sz == PGDIR_SIZE) {
-		if (pgd_val(pgdp[pgd_index]) == 0)
-			pgdp[pgd_index] = pfn_pgd(PFN_DOWN(pa), prot);
+		if (pgd_val(pgdp[pgd_idx]) == 0)
+			pgdp[pgd_idx] = pfn_pgd(PFN_DOWN(pa), prot);
 		return;
 	}
 
-	if (pgd_val(pgdp[pgd_index]) == 0) {
+	if (pgd_val(pgdp[pgd_idx]) == 0) {
 		next_phys = alloc_pgd_next(va);
-		pgdp[pgd_index] = pfn_pgd(PFN_DOWN(next_phys), PAGE_TABLE);
+		pgdp[pgd_idx] = pfn_pgd(PFN_DOWN(next_phys), PAGE_TABLE);
 		nextp = get_pgd_next_virt(next_phys);
 		memset(nextp, 0, PAGE_SIZE);
 	} else {
-		next_phys = PFN_PHYS(_pgd_pfn(pgdp[pgd_index]));
+		next_phys = PFN_PHYS(_pgd_pfn(pgdp[pgd_idx]));
 		nextp = get_pgd_next_virt(next_phys);
 	}
 
diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index e1eef67a0877..19d603bd1f36 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1259,7 +1259,6 @@ static inline pgd_t *pgd_offset_raw(pgd_t *pgd, unsigned long address)
 }
 
 #define pgd_offset(mm, address) pgd_offset_raw(READ_ONCE((mm)->pgd), address)
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
 
 static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
 {
diff --git a/arch/sh/include/asm/pgtable_32.h b/arch/sh/include/asm/pgtable_32.h
index ccc032e89f75..41be43e99cff 100644
--- a/arch/sh/include/asm/pgtable_32.h
+++ b/arch/sh/include/asm/pgtable_32.h
@@ -408,13 +408,6 @@ static inline unsigned long pmd_page_vaddr(pmd_t pmd)
 
 #define pmd_page(pmd)		(virt_to_page(pmd_val(pmd)))
 
-/* to find an entry in a page-table-directory. */
-#define pgd_index(address)	(((address) >> PGDIR_SHIFT) & (PTRS_PER_PGD-1))
-#define pgd_offset(mm, address)	((mm)->pgd + pgd_index(address))
-
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(address)	pgd_offset(&init_mm, address)
-
 #ifdef CONFIG_X2TLB
 #define pte_ERROR(e) \
 	printk("%s:%d: bad pte %p(%08lx%08lx).\n", __FILE__, __LINE__, \
diff --git a/arch/sh/include/asm/pgtable_64.h b/arch/sh/include/asm/pgtable_64.h
index 60aef1191784..50335686f1e5 100644
--- a/arch/sh/include/asm/pgtable_64.h
+++ b/arch/sh/include/asm/pgtable_64.h
@@ -40,17 +40,6 @@ static __inline__ void set_pte(pte_t *pteptr, pte_t pteval)
 }
 #define set_pte_at(mm,addr,ptep,pteval) set_pte(ptep,pteval)
 
-/*
- * PGD defines. Top level.
- */
-
-/* To find an entry in a generic PGD. */
-#define pgd_index(address) (((address) >> PGDIR_SHIFT) & (PTRS_PER_PGD-1))
-#define pgd_offset(mm, address) ((mm)->pgd+pgd_index(address))
-
-/* To find an entry in a kernel PGD. */
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
-
 /*
  * PMD level access routines. Same notes as above.
  */
diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
index ae45812336ed..823099fb32d3 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -309,14 +309,6 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 		pgprot_val(newprot));
 }
 
-#define pgd_index(address) ((address) >> PGDIR_SHIFT)
-
-/* to find an entry in a page-table-directory */
-#define pgd_offset(mm, address) ((mm)->pgd + pgd_index(address))
-
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
-
 struct seq_file;
 void mmu_info(struct seq_file *m);
 
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index f546ea46d41b..7ef6affa105e 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -889,13 +889,6 @@ static inline unsigned long pud_pfn(pud_t pud)
 #define p4d_set(p4dp, pudp)	\
 	(p4d_val(*(p4dp)) = (__pa((unsigned long) (pudp))))
 
-/* to find an entry in a page-table-directory. */
-#define pgd_index(address)	(((address) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
-#define pgd_offset(mm, address)	((mm)->pgd + pgd_index(address))
-
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
-
 /* We cannot include <linux/mm_types.h> at this point yet: */
 extern struct mm_struct init_mm;
 
diff --git a/arch/um/include/asm/pgtable.h b/arch/um/include/asm/pgtable.h
index ea2d3e6f46dd..def376194dce 100644
--- a/arch/um/include/asm/pgtable.h
+++ b/arch/um/include/asm/pgtable.h
@@ -1,5 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/* 
+/*
  * Copyright (C) 2000 - 2007 Jeff Dike (jdike@{addtoit,linux.intel}.com)
  * Copyright 2003 PathScale, Inc.
  * Derived from include/asm-i386/pgtable.h
@@ -131,7 +131,7 @@ static inline int pte_none(pte_t pte)
  * Undefined behaviour if not..
  */
 static inline int pte_read(pte_t pte)
-{ 
+{
 	return((pte_get_bits(pte, _PAGE_USER)) &&
 	       !(pte_get_bits(pte, _PAGE_PROTNONE)));
 }
@@ -163,7 +163,7 @@ static inline int pte_newpage(pte_t pte)
 }
 
 static inline int pte_newprot(pte_t pte)
-{ 
+{
 	return(pte_present(pte) && (pte_get_bits(pte, _PAGE_NEWPROT)));
 }
 
@@ -185,31 +185,31 @@ static inline pte_t pte_mkclean(pte_t pte)
 	return(pte);
 }
 
-static inline pte_t pte_mkold(pte_t pte)	
-{ 
+static inline pte_t pte_mkold(pte_t pte)
+{
 	pte_clear_bits(pte, _PAGE_ACCESSED);
 	return(pte);
 }
 
 static inline pte_t pte_wrprotect(pte_t pte)
-{ 
+{
 	if (likely(pte_get_bits(pte, _PAGE_RW)))
 		pte_clear_bits(pte, _PAGE_RW);
 	else
 		return pte;
-	return(pte_mknewprot(pte)); 
+	return(pte_mknewprot(pte));
 }
 
 static inline pte_t pte_mkread(pte_t pte)
-{ 
+{
 	if (unlikely(pte_get_bits(pte, _PAGE_USER)))
 		return pte;
 	pte_set_bits(pte, _PAGE_USER);
-	return(pte_mknewprot(pte)); 
+	return(pte_mknewprot(pte));
 }
 
 static inline pte_t pte_mkdirty(pte_t pte)
-{ 
+{
 	pte_set_bits(pte, _PAGE_DIRTY);
 	return(pte);
 }
@@ -220,20 +220,20 @@ static inline pte_t pte_mkyoung(pte_t pte)
 	return(pte);
 }
 
-static inline pte_t pte_mkwrite(pte_t pte)	
+static inline pte_t pte_mkwrite(pte_t pte)
 {
 	if (unlikely(pte_get_bits(pte,  _PAGE_RW)))
 		return pte;
 	pte_set_bits(pte, _PAGE_RW);
-	return(pte_mknewprot(pte)); 
+	return(pte_mknewprot(pte));
 }
 
-static inline pte_t pte_mkuptodate(pte_t pte)	
+static inline pte_t pte_mkuptodate(pte_t pte)
 {
 	pte_clear_bits(pte, _PAGE_NEWPAGE);
 	if(pte_present(pte))
 		pte_clear_bits(pte, _PAGE_NEWPROT);
-	return(pte); 
+	return(pte);
 }
 
 static inline pte_t pte_mknewpage(pte_t pte)
@@ -288,29 +288,9 @@ static inline int pte_same(pte_t pte_a, pte_t pte_b)
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
 	pte_set_val(pte, (pte_val(pte) & _PAGE_CHG_MASK), newprot);
-	return pte; 
+	return pte;
 }
 
-/*
- * the pgd page can be thought of an array like this: pgd_t[PTRS_PER_PGD]
- *
- * this macro returns the index of the entry in the pgd page which would
- * control the given virtual address
- */
-#define pgd_index(address) (((address) >> PGDIR_SHIFT) & (PTRS_PER_PGD-1))
-
-/*
- * pgd_offset() returns a (pgd_t *)
- * pgd_index() is used get the offset into the pgd page's array of pgd_t's;
- */
-#define pgd_offset(mm, address) ((mm)->pgd+pgd_index(address))
-
-/*
- * a shortcut which implies the use of the kernel's pgd, instead
- * of a process's
- */
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
-
 /*
  * the pmd page can be thought of an array like this: pmd_t[PTRS_PER_PMD]
  *
diff --git a/arch/unicore32/include/asm/pgtable.h b/arch/unicore32/include/asm/pgtable.h
index a2b264cc8c68..97f564c8ecba 100644
--- a/arch/unicore32/include/asm/pgtable.h
+++ b/arch/unicore32/include/asm/pgtable.h
@@ -215,14 +215,6 @@ PTE_BIT_FUNC(mkyoung,   |= PTE_YOUNG);
  */
 #define mk_pte(page, prot)	pfn_pte(page_to_pfn(page), prot)
 
-/* to find an entry in a page-table-directory */
-#define pgd_index(addr)		((addr) >> PGDIR_SHIFT)
-
-#define pgd_offset(mm, addr)	((mm)->pgd+pgd_index(addr))
-
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(addr)	pgd_offset(&init_mm, addr)
-
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 {
 	const unsigned long mask = PTE_EXEC | PTE_WRITE | PTE_READ;
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 97efdc62e740..a2692cf1c8c3 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -989,30 +989,6 @@ static inline int pgd_none(pgd_t pgd)
 
 #endif	/* __ASSEMBLY__ */
 
-/*
- * the pgd page can be thought of an array like this: pgd_t[PTRS_PER_PGD]
- *
- * this macro returns the index of the entry in the pgd page which would
- * control the given virtual address
- */
-#define pgd_index(address) (((address) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
-
-/*
- * pgd_offset() returns a (pgd_t *)
- * pgd_index() is used get the offset into the pgd page's array of pgd_t's;
- */
-#define pgd_offset_pgd(pgd, address) (pgd + pgd_index((address)))
-/*
- * a shortcut to get a pgd_t in a given mm
- */
-#define pgd_offset(mm, address) pgd_offset_pgd((mm)->pgd, (address))
-/*
- * a shortcut which implies the use of the kernel's pgd, instead
- * of a process's
- */
-#define pgd_offset_k(address) pgd_offset(&init_mm, (address))
-
-
 #define KERNEL_PGD_BOUNDARY	pgd_index(PAGE_OFFSET)
 #define KERNEL_PGD_PTRS		(PTRS_PER_PGD - KERNEL_PGD_BOUNDARY)
 
diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/pgtable.h
index d08b7be6649e..fa054a1772e1 100644
--- a/arch/xtensa/include/asm/pgtable.h
+++ b/arch/xtensa/include/asm/pgtable.h
@@ -359,14 +359,6 @@ ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 	update_pte(ptep, pte_wrprotect(pte));
 }
 
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(address)	pgd_offset(&init_mm, address)
-
-/* to find an entry in a page-table-directory */
-#define pgd_offset(mm,address)	((mm)->pgd + pgd_index(address))
-
-#define pgd_index(address)	((address) >> PGDIR_SHIFT)
-
 /*
  * Encode and decode a swap and file entry.
  */
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 09b86ce20a65..b8da67ac4075 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -61,6 +61,14 @@ static inline unsigned long pud_index(unsigned long address)
 #define pud_index pud_index
 #endif
 
+#ifndef pgd_index
+static inline unsigned long pgd_index(unsigned long address)
+{
+	return ((address >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1));
+}
+#define pgd_index pgd_index
+#endif
+
 #ifndef pte_offset_kernel
 static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
 {
@@ -96,6 +104,24 @@ static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
 #define pud_offset pud_offset
 #endif
 
+static inline pgd_t *pgd_offset_pgd(pgd_t *pgd, unsigned long address)
+{
+	return (pgd + pgd_index(address));
+};
+
+/*
+ * a shortcut to get a pgd_t in a given mm
+ */
+#ifndef pgd_offset
+#define pgd_offset(mm, address)		pgd_offset_pgd((mm)->pgd, (address))
+#endif
+
+/*
+ * a shortcut which implies the use of the kernel's pgd, instead
+ * of a process's
+ */
+#define pgd_offset_k(address)		pgd_offset(&init_mm, (address))
+
 /*
  * In many cases it is known that a virtual address is mapped at PMD or PTE
  * level, so instead of traversing all the page table levels, we can get a
-- 
2.26.2

