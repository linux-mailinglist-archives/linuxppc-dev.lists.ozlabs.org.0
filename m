Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2BC1D3815
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 May 2020 19:26:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NJNQ5jf3zDqSc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 03:25:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=qYuGnVPk; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NHx903XWzDqqK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 03:05:49 +1000 (AEST)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1DDC620727;
 Thu, 14 May 2020 17:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589475947;
 bh=3LW49w1l0p01gsnm3LP0+1vRXAKhhSAd1ng4BpgT36Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qYuGnVPkVuV2n3YizeLTxgOb+WilQf4vxkvJXoDv+L20oj+p7oG1ART+UCxdNzcL1
 sEP8XuRV2h2BrzIE6GUQjuGJivosS7mjKA/VBSo4E4vcSu+OaokPtoyZYL82D5yW4v
 YobAQ+IEnDWWTbu4B7gYV+2hk20w4324/WhN9y7U=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/12] mm: pgtable: add shortcuts for accessing kernel PMD
 and PTE
Date: Thu, 14 May 2020 20:03:23 +0300
Message-Id: <20200514170327.31389-9-rppt@kernel.org>
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

The powerpc 32-bit implementation of pgtable has nice shortcuts for
accessing kernel PMD and PTE for a given virtual address.
Make this helpers available for all architectures.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arc/mm/highmem.c                 | 10 +-------
 arch/arm/mach-sa1100/assabet.c        |  2 +-
 arch/arm/mm/highmem.c                 |  4 ++--
 arch/arm/mm/ioremap.c                 | 31 ++++--------------------
 arch/arm/mm/mm.h                      |  5 ----
 arch/arm/mm/mmu.c                     |  7 +-----
 arch/hexagon/include/asm/fixmap.h     |  4 ----
 arch/m68k/mm/motorola.c               | 26 ++++----------------
 arch/microblaze/kernel/signal.c       |  8 +------
 arch/microblaze/mm/init.c             |  9 -------
 arch/mips/include/asm/fixmap.h        |  3 ---
 arch/mips/mm/c-r3k.c                  | 10 ++------
 arch/mips/mm/c-r4k.c                  | 10 ++------
 arch/mips/mm/c-tx39.c                 | 10 ++------
 arch/mips/mm/highmem.c                |  2 +-
 arch/nds32/include/asm/pgtable.h      |  2 --
 arch/nds32/mm/init.c                  | 13 ++--------
 arch/nds32/mm/proc.c                  |  6 +----
 arch/parisc/mm/fixmap.c               |  6 +----
 arch/powerpc/include/asm/pgtable.h    | 19 ---------------
 arch/powerpc/mm/book3s32/mmu.c        |  2 +-
 arch/powerpc/mm/book3s32/tlb.c        |  4 ++--
 arch/powerpc/mm/kasan/kasan_init_32.c |  8 +++----
 arch/powerpc/mm/nohash/40x.c          |  4 ++--
 arch/powerpc/mm/pgtable_32.c          |  2 +-
 arch/s390/mm/pageattr.c               | 10 +-------
 arch/sh/mm/cache-sh4.c                |  8 +------
 arch/sh/mm/kmap.c                     |  5 +---
 arch/sparc/mm/highmem.c               | 12 ++--------
 arch/sparc/mm/init_64.c               |  6 +----
 arch/sparc/mm/io-unit.c               | 10 ++------
 arch/sparc/mm/iommu.c                 |  8 +------
 arch/sparc/mm/srmmu.c                 | 34 +++------------------------
 arch/um/kernel/mem.c                  | 10 +-------
 arch/um/kernel/trap.c                 |  8 +------
 arch/unicore32/mm/mm.h                | 10 --------
 arch/x86/mm/init_32.c                 | 26 +++-----------------
 arch/xtensa/include/asm/fixmap.h      |  8 -------
 arch/xtensa/mm/highmem.c              |  2 +-
 arch/xtensa/mm/kasan_init.c           | 10 ++------
 arch/xtensa/mm/mmu.c                  |  5 +---
 include/linux/pgtable.h               | 24 +++++++++++++++++++
 42 files changed, 80 insertions(+), 323 deletions(-)

diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
index d6b74883fd1f..1b9f473c6369 100644
--- a/arch/arc/mm/highmem.c
+++ b/arch/arc/mm/highmem.c
@@ -92,17 +92,9 @@ EXPORT_SYMBOL(kunmap_atomic_high);
 
 static noinline pte_t * __init alloc_kmap_pgtable(unsigned long kvaddr)
 {
-	pgd_t *pgd_k;
-	p4d_t *p4d_k;
-	pud_t *pud_k;
-	pmd_t *pmd_k;
+	pmd_t *pmd_k = pmd_off_k(kvaddr);
 	pte_t *pte_k;
 
-	pgd_k = pgd_offset_k(kvaddr);
-	p4d_k = p4d_offset(pgd_k, kvaddr);
-	pud_k = pud_offset(p4d_k, kvaddr);
-	pmd_k = pmd_offset(pud_k, kvaddr);
-
 	pte_k = (pte_t *)memblock_alloc_low(PAGE_SIZE, PAGE_SIZE);
 	if (!pte_k)
 		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
diff --git a/arch/arm/mach-sa1100/assabet.c b/arch/arm/mach-sa1100/assabet.c
index 8e3f5fdb4883..aa265ede5730 100644
--- a/arch/arm/mach-sa1100/assabet.c
+++ b/arch/arm/mach-sa1100/assabet.c
@@ -632,7 +632,7 @@ static void __init map_sa1100_gpio_regs( void )
 	int prot = PMD_TYPE_SECT | PMD_SECT_AP_WRITE | PMD_DOMAIN(DOMAIN_IO);
 	pmd_t *pmd;
 
-	pmd = pmd_offset(pud_offset(p4d_offset(pgd_offset_k(virt), virt), virt), virt);
+	pmd = pmd_off_k(virt);
 	*pmd = __pmd(phys | prot);
 	flush_pmd_entry(pmd);
 }
diff --git a/arch/arm/mm/highmem.c b/arch/arm/mm/highmem.c
index e013f6b81328..187fab227b50 100644
--- a/arch/arm/mm/highmem.c
+++ b/arch/arm/mm/highmem.c
@@ -18,7 +18,7 @@
 static inline void set_fixmap_pte(int idx, pte_t pte)
 {
 	unsigned long vaddr = __fix_to_virt(idx);
-	pte_t *ptep = pte_offset_kernel(pmd_off_k(vaddr), vaddr);
+	pte_t *ptep = virt_to_kpte(vaddr);
 
 	set_pte_ext(ptep, pte, 0);
 	local_flush_tlb_kernel_page(vaddr);
@@ -26,7 +26,7 @@ static inline void set_fixmap_pte(int idx, pte_t pte)
 
 static inline pte_t get_fixmap_pte(unsigned long vaddr)
 {
-	pte_t *ptep = pte_offset_kernel(pmd_off_k(vaddr), vaddr);
+	pte_t *ptep = virt_to_kpte(vaddr);
 
 	return *ptep;
 }
diff --git a/arch/arm/mm/ioremap.c b/arch/arm/mm/ioremap.c
index 75529d76d28c..000e8210000b 100644
--- a/arch/arm/mm/ioremap.c
+++ b/arch/arm/mm/ioremap.c
@@ -141,16 +141,8 @@ void __check_vmalloc_seq(struct mm_struct *mm)
 static void unmap_area_sections(unsigned long virt, unsigned long size)
 {
 	unsigned long addr = virt, end = virt + (size & ~(SZ_1M - 1));
-	pgd_t *pgd;
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmdp;
-
-	flush_cache_vunmap(addr, end);
-	pgd = pgd_offset_k(addr);
-	p4d = p4d_offset(pgd, addr);
-	pud = pud_offset(p4d, addr);
-	pmdp = pmd_offset(pud, addr);
+	pmd_t *pmdp = pmd_off_k(addr);
+
 	do {
 		pmd_t pmd = *pmdp;
 
@@ -191,10 +183,7 @@ remap_area_sections(unsigned long virt, unsigned long pfn,
 		    size_t size, const struct mem_type *type)
 {
 	unsigned long addr = virt, end = virt + size;
-	pgd_t *pgd;
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmd;
+	pmd_t *pmd = pmd_off_k(addr);
 
 	/*
 	 * Remove and free any PTE-based mapping, and
@@ -202,10 +191,6 @@ remap_area_sections(unsigned long virt, unsigned long pfn,
 	 */
 	unmap_area_sections(virt, size);
 
-	pgd = pgd_offset_k(addr);
-	p4d = p4d_offset(pgd, addr);
-	pud = pud_offset(p4d, addr);
-	pmd = pmd_offset(pud, addr);
 	do {
 		pmd[0] = __pmd(__pfn_to_phys(pfn) | type->prot_sect);
 		pfn += SZ_1M >> PAGE_SHIFT;
@@ -225,21 +210,13 @@ remap_area_supersections(unsigned long virt, unsigned long pfn,
 			 size_t size, const struct mem_type *type)
 {
 	unsigned long addr = virt, end = virt + size;
-	pgd_t *pgd;
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmd;
+	pmd_t *pmd = pmd_off_k(addr);
 
 	/*
 	 * Remove and free any PTE-based mapping, and
 	 * sync the current kernel mapping.
 	 */
 	unmap_area_sections(virt, size);
-
-	pgd = pgd_offset_k(virt);
-	p4d = p4d_offset(pgd, addr);
-	pud = pud_offset(p4d, addr);
-	pmd = pmd_offset(pud, addr);
 	do {
 		unsigned long super_pmd_val, i;
 
diff --git a/arch/arm/mm/mm.h b/arch/arm/mm/mm.h
index f9587d5fa8a4..9ff683612f2a 100644
--- a/arch/arm/mm/mm.h
+++ b/arch/arm/mm/mm.h
@@ -35,11 +35,6 @@ static inline pte_t get_top_pte(unsigned long va)
 	return *ptep;
 }
 
-static inline pmd_t *pmd_off_k(unsigned long virt)
-{
-	return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(virt), virt), virt), virt);
-}
-
 struct mem_type {
 	pteval_t prot_pte;
 	pteval_t prot_pte_s2;
diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index c425288f1a86..628028bfbb92 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -356,12 +356,7 @@ static pte_t *pte_offset_late_fixmap(pmd_t *dir, unsigned long addr)
 
 static inline pmd_t * __init fixmap_pmd(unsigned long addr)
 {
-	pgd_t *pgd = pgd_offset_k(addr);
-	p4d_t *p4d = p4d_offset(pgd, addr);
-	pud_t *pud = pud_offset(p4d, addr);
-	pmd_t *pmd = pmd_offset(pud, addr);
-
-	return pmd;
+	return pmd_off_k(addr);
 }
 
 void __init early_fixmap_init(void)
diff --git a/arch/hexagon/include/asm/fixmap.h b/arch/hexagon/include/asm/fixmap.h
index 97b1b062e750..920660a04aa4 100644
--- a/arch/hexagon/include/asm/fixmap.h
+++ b/arch/hexagon/include/asm/fixmap.h
@@ -15,8 +15,4 @@
 
 #include <asm-generic/fixmap.h>
 
-#define kmap_get_fixmap_pte(vaddr) \
-	pte_offset_kernel(pmd_offset(pud_offset(p4d_offset(pgd_offset_k(vaddr), \
-				(vaddr)), (vaddr)), (vaddr)), (vaddr))
-
 #endif
diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
index 8e5e74121a78..2bb006bdc31c 100644
--- a/arch/m68k/mm/motorola.c
+++ b/arch/m68k/mm/motorola.c
@@ -54,17 +54,8 @@ static inline void nocache_page(void *vaddr)
 	unsigned long addr = (unsigned long)vaddr;
 
 	if (CPU_IS_040_OR_060) {
-		pgd_t *dir;
-		p4d_t *p4dp;
-		pud_t *pudp;
-		pmd_t *pmdp;
-		pte_t *ptep;
-
-		dir = pgd_offset_k(addr);
-		p4dp = p4d_offset(dir, addr);
-		pudp = pud_offset(p4dp, addr);
-		pmdp = pmd_offset(pudp, addr);
-		ptep = pte_offset_kernel(pmdp, addr);
+		pte_t *ptep = virt_to_kpte(addr);
+
 		*ptep = pte_mknocache(*ptep);
 	}
 }
@@ -74,17 +65,8 @@ static inline void cache_page(void *vaddr)
 	unsigned long addr = (unsigned long)vaddr;
 
 	if (CPU_IS_040_OR_060) {
-		pgd_t *dir;
-		p4d_t *p4dp;
-		pud_t *pudp;
-		pmd_t *pmdp;
-		pte_t *ptep;
-
-		dir = pgd_offset_k(addr);
-		p4dp = p4d_offset(dir, addr);
-		pudp = pud_offset(p4dp, addr);
-		pmdp = pmd_offset(pudp, addr);
-		ptep = pte_offset_kernel(pmdp, addr);
+		pte_t *ptep = virt_to_kpte(addr);
+
 		*ptep = pte_mkcache(*ptep);
 	}
 }
diff --git a/arch/microblaze/kernel/signal.c b/arch/microblaze/kernel/signal.c
index 7dcd2e4d430e..28b1ec4b4e79 100644
--- a/arch/microblaze/kernel/signal.c
+++ b/arch/microblaze/kernel/signal.c
@@ -159,9 +159,6 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 	int err = 0, sig = ksig->sig;
 	unsigned long address = 0;
 #ifdef CONFIG_MMU
-	pgd_t *pgdp;
-	p4d_t *p4dp;
-	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
 #endif
@@ -197,10 +194,7 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 
 	address = ((unsigned long)frame->tramp);
 #ifdef CONFIG_MMU
-	pgdp = pgd_offset(current->mm, address);
-	p4dp = p4d_offset(pgdp, address);
-	pudp = pud_offset(p4dp, address);
-	pmdp = pmd_offset(pudp, address);
+	pmdp = pmd_off_k(address);
 
 	preempt_disable();
 	ptep = pte_offset_map(pmdp, address);
diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
index d943f69784b1..521b59ba716c 100644
--- a/arch/microblaze/mm/init.c
+++ b/arch/microblaze/mm/init.c
@@ -50,15 +50,6 @@ unsigned long lowmem_size;
 pte_t *kmap_pte;
 EXPORT_SYMBOL(kmap_pte);
 
-static inline pte_t *virt_to_kpte(unsigned long vaddr)
-{
-	pgd_t *pgd = pgd_offset_k(vaddr);
-	p4d_t *p4d = p4d_offset(pgd, vaddr);
-	pud_t *pud = pud_offset(p4d, vaddr);
-
-	return pte_offset_kernel(pmd_offset(pud, vaddr), vaddr);
-}
-
 static void __init highmem_init(void)
 {
 	pr_debug("%x\n", (u32)PKMAP_BASE);
diff --git a/arch/mips/include/asm/fixmap.h b/arch/mips/include/asm/fixmap.h
index 1784d4348c36..743535be7528 100644
--- a/arch/mips/include/asm/fixmap.h
+++ b/arch/mips/include/asm/fixmap.h
@@ -69,9 +69,6 @@ enum fixed_addresses {
 
 #include <asm-generic/fixmap.h>
 
-#define kmap_get_fixmap_pte(vaddr)					\
-	pte_offset_kernel(pmd_offset(pud_offset(p4d_offset(pgd_offset_k(vaddr), (vaddr)), (vaddr)), (vaddr)), (vaddr))
-
 /*
  * Called from pgtable_init()
  */
diff --git a/arch/mips/mm/c-r3k.c b/arch/mips/mm/c-r3k.c
index 9f4a93f8b996..df6755ca1892 100644
--- a/arch/mips/mm/c-r3k.c
+++ b/arch/mips/mm/c-r3k.c
@@ -239,9 +239,6 @@ static void r3k_flush_cache_page(struct vm_area_struct *vma,
 	unsigned long kaddr = KSEG0ADDR(pfn << PAGE_SHIFT);
 	int exec = vma->vm_flags & VM_EXEC;
 	struct mm_struct *mm = vma->vm_mm;
-	pgd_t *pgdp;
-	p4d_t *p4dp;
-	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
 
@@ -252,11 +249,8 @@ static void r3k_flush_cache_page(struct vm_area_struct *vma,
 	if (cpu_context(smp_processor_id(), mm) == 0)
 		return;
 
-	pgdp = pgd_offset(mm, addr);
-	p4dp = p4d_offset(pgdp, addr);
-	pudp = pud_offset(p4dp, addr);
-	pmdp = pmd_offset(pudp, addr);
-	ptep = pte_offset(pmdp, addr);
+	pmdp = pmd_off(mm, addr);
+	ptep = pte_offset_kernel(pmdp, addr);
 
 	/* Invalid => no such page in the cache.  */
 	if (!(pte_val(*ptep) & _PAGE_PRESENT))
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 5fe840c1b897..3722292e0b65 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -652,9 +652,6 @@ static inline void local_r4k_flush_cache_page(void *args)
 	int exec = vma->vm_flags & VM_EXEC;
 	struct mm_struct *mm = vma->vm_mm;
 	int map_coherent = 0;
-	pgd_t *pgdp;
-	p4d_t *p4dp;
-	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
 	void *vaddr;
@@ -667,11 +664,8 @@ static inline void local_r4k_flush_cache_page(void *args)
 		return;
 
 	addr &= PAGE_MASK;
-	pgdp = pgd_offset(mm, addr);
-	p4dp = p4d_offset(pgdp, addr);
-	pudp = pud_offset(p4dp, addr);
-	pmdp = pmd_offset(pudp, addr);
-	ptep = pte_offset(pmdp, addr);
+	pmdp = pmd_off(mm, addr);
+	ptep = pte_offset_kernel(pmdp, addr);
 
 	/*
 	 * If the page isn't marked valid, the page cannot possibly be
diff --git a/arch/mips/mm/c-tx39.c b/arch/mips/mm/c-tx39.c
index 204059d28f21..03dfbb40ec73 100644
--- a/arch/mips/mm/c-tx39.c
+++ b/arch/mips/mm/c-tx39.c
@@ -168,9 +168,6 @@ static void tx39_flush_cache_page(struct vm_area_struct *vma, unsigned long page
 {
 	int exec = vma->vm_flags & VM_EXEC;
 	struct mm_struct *mm = vma->vm_mm;
-	pgd_t *pgdp;
-	p4d_t *p4dp;
-	pud_t *pudp;
 	pmd_t *pmdp;
 	pte_t *ptep;
 
@@ -182,11 +179,8 @@ static void tx39_flush_cache_page(struct vm_area_struct *vma, unsigned long page
 		return;
 
 	page &= PAGE_MASK;
-	pgdp = pgd_offset(mm, page);
-	p4dp = p4d_offset(pgdp, page);
-	pudp = pud_offset(p4dp, page);
-	pmdp = pmd_offset(pudp, page);
-	ptep = pte_offset(pmdp, page);
+	pmdp = pmd_off(mm, page);
+	ptep = pte_offset_kernel(pmdp, page);
 
 	/*
 	 * If the page isn't marked valid, the page cannot possibly be
diff --git a/arch/mips/mm/highmem.c b/arch/mips/mm/highmem.c
index 37e244cdb14e..ae882ed18b2b 100644
--- a/arch/mips/mm/highmem.c
+++ b/arch/mips/mm/highmem.c
@@ -93,5 +93,5 @@ void __init kmap_init(void)
 
 	/* cache the first kmap pte */
 	kmap_vstart = __fix_to_virt(FIX_KMAP_BEGIN);
-	kmap_pte = kmap_get_fixmap_pte(kmap_vstart);
+	kmap_pte = virt_to_kpte(kmap_vstart);
 }
diff --git a/arch/nds32/include/asm/pgtable.h b/arch/nds32/include/asm/pgtable.h
index 51fe1c567702..95c75282cb47 100644
--- a/arch/nds32/include/asm/pgtable.h
+++ b/arch/nds32/include/asm/pgtable.h
@@ -195,8 +195,6 @@ extern void paging_init(void);
 #define pte_unmap(pte)		do { } while (0)
 #define pte_unmap_nested(pte)	do { } while (0)
 
-#define pmd_off_k(address)	pmd_offset(pud_offset(p4d_offset(pgd_offset_k(address), (address)), (address)), (address))
-
 #define set_pte_at(mm,addr,ptep,pteval) set_pte(ptep,pteval)
 /*
  * Set a level 1 translation table entry, and clean it out of
diff --git a/arch/nds32/mm/init.c b/arch/nds32/mm/init.c
index 91147cca4b64..fa86f7b2f416 100644
--- a/arch/nds32/mm/init.c
+++ b/arch/nds32/mm/init.c
@@ -98,9 +98,6 @@ static pmd_t *fixmap_pmd_p;
 static void __init fixedrange_init(void)
 {
 	unsigned long vaddr;
-	pgd_t *pgd;
-	p4d_t *p4d;
-	pud_t *pud;
 	pmd_t *pmd;
 #ifdef CONFIG_HIGHMEM
 	pte_t *pte;
@@ -110,10 +107,7 @@ static void __init fixedrange_init(void)
 	 * Fixed mappings:
 	 */
 	vaddr = __fix_to_virt(__end_of_fixed_addresses - 1);
-	pgd = swapper_pg_dir + pgd_index(vaddr);
-	p4d = p4d_offset(pgd, vaddr);
-	pud = pud_offset(p4d, vaddr);
-	pmd = pmd_offset(pud, vaddr);
+	pmd = pmd_off_k(vaddr);
 	fixmap_pmd_p = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
 	if (!fixmap_pmd_p)
 		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
@@ -126,10 +120,7 @@ static void __init fixedrange_init(void)
 	 */
 	vaddr = PKMAP_BASE;
 
-	pgd = swapper_pg_dir + pgd_index(vaddr);
-	p4d = p4d_offset(pgd, vaddr);
-	pud = pud_offset(p4d, vaddr);
-	pmd = pmd_offset(pud, vaddr);
+	pmd = pmd_off_k(vaddr);
 	pte = memblock_alloc(PAGE_SIZE, PAGE_SIZE);
 	if (!pte)
 		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
diff --git a/arch/nds32/mm/proc.c b/arch/nds32/mm/proc.c
index a2b9aacc5f89..848c845f5f33 100644
--- a/arch/nds32/mm/proc.c
+++ b/arch/nds32/mm/proc.c
@@ -15,14 +15,10 @@ extern struct cache_info L1_cache_info[2];
 
 int va_kernel_present(unsigned long addr)
 {
-	p4d_t *p4d;
-	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *ptep, pte;
 
-	p4d = p4d_offset(pgd_offset_k(addr), addr);
-	pud = pud_offset(p4d, addr);
-	pmd = pmd_offset(pud, addr);
+	pmd = pmd_off_k(addr);
 	if (!pmd_none(*pmd)) {
 		ptep = pte_offset_map(pmd, addr);
 		pte = *ptep;
diff --git a/arch/parisc/mm/fixmap.c b/arch/parisc/mm/fixmap.c
index e2d8b0a857ee..24426a7e1a5e 100644
--- a/arch/parisc/mm/fixmap.c
+++ b/arch/parisc/mm/fixmap.c
@@ -33,11 +33,7 @@ void notrace set_fixmap(enum fixed_addresses idx, phys_addr_t phys)
 void notrace clear_fixmap(enum fixed_addresses idx)
 {
 	unsigned long vaddr = __fix_to_virt(idx);
-	pgd_t *pgd = pgd_offset_k(vaddr);
-	p4d_t *p4d = p4d_offset(pgd, vaddr);
-	pud_t *pud = pud_offset(p4d, vaddr);
-	pmd_t *pmd = pmd_offset(pud, vaddr);
-	pte_t *pte = pte_offset_kernel(pmd, vaddr);
+	pte_t *pte = virt_to_kpte(vaddr);
 
 	if (WARN_ON(pte_none(*pte)))
 		return;
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index a928bdad982f..d917c41b5c62 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -41,25 +41,6 @@ struct mm_struct;
 
 #ifndef __ASSEMBLY__
 
-#ifdef CONFIG_PPC32
-static inline pmd_t *pmd_ptr(struct mm_struct *mm, unsigned long va)
-{
-	return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
-}
-
-static inline pmd_t *pmd_ptr_k(unsigned long va)
-{
-	return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
-}
-
-static inline pte_t *virt_to_kpte(unsigned long vaddr)
-{
-	pmd_t *pmd = pmd_ptr_k(vaddr);
-
-	return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
-}
-#endif
-
 #include <asm/tlbflush.h>
 
 /* Keep these as a macros to avoid include dependency mess */
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 39ba53ca5bb5..afd8caf3f8f5 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -312,7 +312,7 @@ void hash_preload(struct mm_struct *mm, unsigned long ea)
 
 	if (!Hash)
 		return;
-	pmd = pmd_ptr(mm, ea);
+	pmd = pmd_off(mm, ea);
 	if (!pmd_none(*pmd))
 		add_hash_page(mm->context.id, ea, pmd_val(*pmd));
 }
diff --git a/arch/powerpc/mm/book3s32/tlb.c b/arch/powerpc/mm/book3s32/tlb.c
index dc9039a170aa..157f98f6aea9 100644
--- a/arch/powerpc/mm/book3s32/tlb.c
+++ b/arch/powerpc/mm/book3s32/tlb.c
@@ -90,7 +90,7 @@ static void flush_range(struct mm_struct *mm, unsigned long start,
 	if (start >= end)
 		return;
 	end = (end - 1) | ~PAGE_MASK;
-	pmd = pmd_ptr(mm, start);
+	pmd = pmd_off(mm, start);
 	for (;;) {
 		pmd_end = ((start + PGDIR_SIZE) & PGDIR_MASK) - 1;
 		if (pmd_end > end)
@@ -148,7 +148,7 @@ void flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
 		return;
 	}
 	mm = (vmaddr < TASK_SIZE)? vma->vm_mm: &init_mm;
-	pmd = pmd_ptr(mm, vmaddr);
+	pmd = pmd_off(mm, vmaddr);
 	if (!pmd_none(*pmd))
 		flush_hash_pages(mm->context.id, vmaddr, pmd_val(*pmd), 1);
 }
diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index c99aa8cbaac5..16a359ae1686 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -36,7 +36,7 @@ static int __init kasan_init_shadow_page_tables(unsigned long k_start, unsigned
 	unsigned long k_cur, k_next;
 	pte_t *new = NULL;
 
-	pmd = pmd_ptr_k(k_start);
+	pmd = pmd_off_k(k_start);
 
 	for (k_cur = k_start; k_cur != k_end; k_cur = k_next, pmd++) {
 		k_next = pgd_addr_end(k_cur, k_end);
@@ -78,7 +78,7 @@ static int __init kasan_init_region(void *start, size_t size)
 	block = memblock_alloc(k_end - k_start, PAGE_SIZE);
 
 	for (k_cur = k_start & PAGE_MASK; k_cur < k_end; k_cur += PAGE_SIZE) {
-		pmd_t *pmd = pmd_ptr_k(k_cur);
+		pmd_t *pmd = pmd_off_k(k_cur);
 		void *va = block + k_cur - k_start;
 		pte_t pte = pfn_pte(PHYS_PFN(__pa(va)), PAGE_KERNEL);
 
@@ -102,7 +102,7 @@ static void __init kasan_remap_early_shadow_ro(void)
 	kasan_populate_pte(kasan_early_shadow_pte, prot);
 
 	for (k_cur = k_start & PAGE_MASK; k_cur != k_end; k_cur += PAGE_SIZE) {
-		pmd_t *pmd = pmd_ptr_k(k_cur);
+		pmd_t *pmd = pmd_off_k(k_cur);
 		pte_t *ptep = pte_offset_kernel(pmd, k_cur);
 
 		if ((pte_val(*ptep) & PTE_RPN_MASK) != pa)
@@ -196,7 +196,7 @@ void __init kasan_early_init(void)
 	unsigned long addr = KASAN_SHADOW_START;
 	unsigned long end = KASAN_SHADOW_END;
 	unsigned long next;
-	pmd_t *pmd = pmd_ptr_k(addr);
+	pmd_t *pmd = pmd_off_k(addr);
 
 	BUILD_BUG_ON(KASAN_SHADOW_START & ~PGDIR_MASK);
 
diff --git a/arch/powerpc/mm/nohash/40x.c b/arch/powerpc/mm/nohash/40x.c
index 723512b71758..b980e496bdc7 100644
--- a/arch/powerpc/mm/nohash/40x.c
+++ b/arch/powerpc/mm/nohash/40x.c
@@ -103,7 +103,7 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 		pmd_t *pmdp;
 		unsigned long val = p | _PMD_SIZE_16M | _PAGE_EXEC | _PAGE_HWWRITE;
 
-		pmdp = pmd_ptr_k(v);
+		pmdp = pmd_off_k(v);
 		*pmdp++ = __pmd(val);
 		*pmdp++ = __pmd(val);
 		*pmdp++ = __pmd(val);
@@ -118,7 +118,7 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 		pmd_t *pmdp;
 		unsigned long val = p | _PMD_SIZE_4M | _PAGE_EXEC | _PAGE_HWWRITE;
 
-		pmdp = pmd_ptr_k(v);
+		pmdp = pmd_off_k(v);
 		*pmdp = __pmd(val);
 
 		v += LARGE_PAGE_SIZE_4M;
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 738e5e38a4be..3011266c089f 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -62,7 +62,7 @@ int __ref map_kernel_page(unsigned long va, phys_addr_t pa, pgprot_t prot)
 	int err = -ENOMEM;
 
 	/* Use upper 10 bits of VA to index the first level map */
-	pd = pmd_ptr_k(va);
+	pd = pmd_off_k(va);
 	/* Use middle 10 bits of VA to index the second-level map */
 	if (likely(slab_is_available()))
 		pg = pte_alloc_kernel(pd, va);
diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
index 732c12145d04..397944b9906b 100644
--- a/arch/s390/mm/pageattr.c
+++ b/arch/s390/mm/pageattr.c
@@ -337,19 +337,11 @@ void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	unsigned long address;
 	int nr, i, j;
-	pgd_t *pgd;
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmd;
 	pte_t *pte;
 
 	for (i = 0; i < numpages;) {
 		address = page_to_phys(page + i);
-		pgd = pgd_offset_k(address);
-		p4d = p4d_offset(pgd, address);
-		pud = pud_offset(p4d, address);
-		pmd = pmd_offset(pud, address);
-		pte = pte_offset_kernel(pmd, address);
+		pte = virt_to_kpte(address);
 		nr = (unsigned long)pte >> ilog2(sizeof(long));
 		nr = PTRS_PER_PTE - (nr & (PTRS_PER_PTE - 1));
 		nr = min(numpages - i, nr);
diff --git a/arch/sh/mm/cache-sh4.c b/arch/sh/mm/cache-sh4.c
index ed599dadd698..de9e0a60e119 100644
--- a/arch/sh/mm/cache-sh4.c
+++ b/arch/sh/mm/cache-sh4.c
@@ -207,9 +207,6 @@ static void sh4_flush_cache_page(void *args)
 	struct page *page;
 	unsigned long address, pfn, phys;
 	int map_coherent = 0;
-	pgd_t *pgd;
-	p4d_t *p4d;
-	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
 	void *vaddr;
@@ -223,10 +220,7 @@ static void sh4_flush_cache_page(void *args)
 	if (cpu_context(smp_processor_id(), vma->vm_mm) == NO_CONTEXT)
 		return;
 
-	pgd = pgd_offset(vma->vm_mm, address);
-	p4d = p4d_offset(pgd, address);
-	pud = pud_offset(p4d, address);
-	pmd = pmd_offset(pud, address);
+	pmd = pmd_off(vma->vm_mm, address);
 	pte = pte_offset_kernel(pmd, address);
 
 	/* If the page isn't present, there is nothing to do here. */
diff --git a/arch/sh/mm/kmap.c b/arch/sh/mm/kmap.c
index 0e7039137f5a..73fd7cc99430 100644
--- a/arch/sh/mm/kmap.c
+++ b/arch/sh/mm/kmap.c
@@ -14,9 +14,6 @@
 #include <asm/mmu_context.h>
 #include <asm/cacheflush.h>
 
-#define kmap_get_fixmap_pte(vaddr)                                     \
-	pte_offset_kernel(pmd_offset(pud_offset(p4d_offset(pgd_offset_k(vaddr), (vaddr)), (vaddr)), (vaddr)), vaddr)
-
 static pte_t *kmap_coherent_pte;
 
 void __init kmap_coherent_init(void)
@@ -25,7 +22,7 @@ void __init kmap_coherent_init(void)
 
 	/* cache the first coherent kmap pte */
 	vaddr = __fix_to_virt(FIX_CMAP_BEGIN);
-	kmap_coherent_pte = kmap_get_fixmap_pte(vaddr);
+	kmap_coherent_pte = virt_to_kpte(vaddr);
 }
 
 void *kmap_coherent(struct page *page, unsigned long addr)
diff --git a/arch/sparc/mm/highmem.c b/arch/sparc/mm/highmem.c
index d237d902f9c3..625221ec2010 100644
--- a/arch/sparc/mm/highmem.c
+++ b/arch/sparc/mm/highmem.c
@@ -36,18 +36,10 @@ static pte_t *kmap_pte;
 
 void __init kmap_init(void)
 {
-	unsigned long address;
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *dir;
-
-	address = __fix_to_virt(FIX_KMAP_BEGIN);
-	p4d = p4d_offset(pgd_offset_k(address), address);
-	pud = pud_offset(p4d, address);
-	dir = pmd_offset(pud, address);
+	unsigned long address = __fix_to_virt(FIX_KMAP_BEGIN);
 
         /* cache the first kmap pte */
-        kmap_pte = pte_offset_kernel(dir, address);
+        kmap_pte = virt_to_kpte(address);
 }
 
 void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 141614f19084..02e6e5e0f106 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -503,11 +503,7 @@ void __kprobes flush_icache_range(unsigned long start, unsigned long end)
 			if (kaddr >= PAGE_OFFSET)
 				paddr = kaddr & mask;
 			else {
-				pgd_t *pgdp = pgd_offset_k(kaddr);
-				p4d_t *p4dp = p4d_offset(pgdp, kaddr);
-				pud_t *pudp = pud_offset(p4dp, kaddr);
-				pmd_t *pmdp = pmd_offset(pudp, kaddr);
-				pte_t *ptep = pte_offset_kernel(pmdp, kaddr);
+				pte_t *ptep = virt_to_kpte(kaddr);
 
 				paddr = pte_val(*ptep) & mask;
 			}
diff --git a/arch/sparc/mm/io-unit.c b/arch/sparc/mm/io-unit.c
index 4aeed580b4d4..bfcc04bfce54 100644
--- a/arch/sparc/mm/io-unit.c
+++ b/arch/sparc/mm/io-unit.c
@@ -240,21 +240,15 @@ static void *iounit_alloc(struct device *dev, size_t len,
 	while(addr < end) {
 		page = va;
 		{
-			pgd_t *pgdp;
-			p4d_t *p4dp;
-			pud_t *pudp;
 			pmd_t *pmdp;
 			pte_t *ptep;
 			long i;
 
-			pgdp = pgd_offset(&init_mm, addr);
-			p4dp = p4d_offset(pgdp, addr);
-			pudp = pud_offset(p4dp, addr);
-			pmdp = pmd_offset(pudp, addr);
+			pmdp = pmd_off_k(addr);
 			ptep = pte_offset_map(pmdp, addr);
 
 			set_pte(ptep, mk_pte(virt_to_page(page), dvma_prot));
-			
+
 			i = ((addr - IOUNIT_DMA_BASE) >> PAGE_SHIFT);
 
 			iopte = iounit->page_table + i;
diff --git a/arch/sparc/mm/iommu.c b/arch/sparc/mm/iommu.c
index fa9e298fd985..35b002eb312e 100644
--- a/arch/sparc/mm/iommu.c
+++ b/arch/sparc/mm/iommu.c
@@ -348,9 +348,6 @@ static void *sbus_iommu_alloc(struct device *dev, size_t len,
 	while(addr < end) {
 		page = va;
 		{
-			pgd_t *pgdp;
-			p4d_t *p4dp;
-			pud_t *pudp;
 			pmd_t *pmdp;
 			pte_t *ptep;
 
@@ -361,10 +358,7 @@ static void *sbus_iommu_alloc(struct device *dev, size_t len,
 			else
 				__flush_page_to_ram(page);
 
-			pgdp = pgd_offset(&init_mm, addr);
-			p4dp = p4d_offset(pgdp, addr);
-			pudp = pud_offset(p4dp, addr);
-			pmdp = pmd_offset(pudp, addr);
+			pmdp = pmd_off_k(addr);
 			ptep = pte_offset_map(pmdp, addr);
 
 			set_pte(ptep, mk_pte(virt_to_page(page), dvma_prot));
diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 30648c1f8786..906802f0ebe9 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -518,19 +518,10 @@ void switch_mm(struct mm_struct *old_mm, struct mm_struct *mm,
 static inline void srmmu_mapioaddr(unsigned long physaddr,
 				   unsigned long virt_addr, int bus_type)
 {
-	pgd_t *pgdp;
-	p4d_t *p4dp;
-	pud_t *pudp;
-	pmd_t *pmdp;
-	pte_t *ptep;
+	pte_t *ptep = virt_to_kpte(virt_addr);
 	unsigned long tmp;
 
 	physaddr &= PAGE_MASK;
-	pgdp = pgd_offset_k(virt_addr);
-	p4dp = p4d_offset(pgdp, virt_addr);
-	pudp = pud_offset(p4dp, virt_addr);
-	pmdp = pmd_offset(pudp, virt_addr);
-	ptep = pte_offset_kernel(pmdp, virt_addr);
 	tmp = (physaddr >> 4) | SRMMU_ET_PTE;
 
 	/* I need to test whether this is consistent over all
@@ -557,18 +548,7 @@ void srmmu_mapiorange(unsigned int bus, unsigned long xpa,
 
 static inline void srmmu_unmapioaddr(unsigned long virt_addr)
 {
-	pgd_t *pgdp;
-	p4d_t *p4dp;
-	pud_t *pudp;
-	pmd_t *pmdp;
-	pte_t *ptep;
-
-
-	pgdp = pgd_offset_k(virt_addr);
-	p4dp = p4d_offset(pgdp, virt_addr);
-	pudp = pud_offset(p4dp, virt_addr);
-	pmdp = pmd_offset(pudp, virt_addr);
-	ptep = pte_offset_kernel(pmdp, virt_addr);
+	pte_t *ptep = virt_to_kpte(virt_addr);
 
 	/* No need to flush uncacheable page. */
 	__pte_clear(ptep);
@@ -929,10 +909,6 @@ void __init srmmu_paging_init(void)
 	int i;
 	phandle cpunode;
 	char node_str[128];
-	pgd_t *pgd;
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmd;
 	pte_t *pte;
 	unsigned long pages_avail;
 
@@ -992,11 +968,7 @@ void __init srmmu_paging_init(void)
 		__fix_to_virt(__end_of_fixed_addresses - 1), FIXADDR_TOP);
 	srmmu_allocate_ptable_skeleton(PKMAP_BASE, PKMAP_END);
 
-	pgd = pgd_offset_k(PKMAP_BASE);
-	p4d = p4d_offset(pgd, PKMAP_BASE);
-	pud = pud_offset(p4d, PKMAP_BASE);
-	pmd = pmd_offset(pud, PKMAP_BASE);
-	pte = pte_offset_kernel(pmd, PKMAP_BASE);
+	pte = virt_to_kpte(PKMAP_BASE);
 	pkmap_page_table = pte;
 
 	flush_cache_all();
diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
index 401b22f14743..c2ff76c8981e 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -125,10 +125,6 @@ static void __init fixaddr_user_init( void)
 {
 #ifdef CONFIG_ARCH_REUSE_HOST_VSYSCALL_AREA
 	long size = FIXADDR_USER_END - FIXADDR_USER_START;
-	pgd_t *pgd;
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmd;
 	pte_t *pte;
 	phys_t p;
 	unsigned long v, vaddr = FIXADDR_USER_START;
@@ -146,11 +142,7 @@ static void __init fixaddr_user_init( void)
 	p = __pa(v);
 	for ( ; size > 0; size -= PAGE_SIZE, vaddr += PAGE_SIZE,
 		      p += PAGE_SIZE) {
-		pgd = swapper_pg_dir + pgd_index(vaddr);
-		p4d = p4d_offset(pgd, vaddr);
-		pud = pud_offset(p4d, vaddr);
-		pmd = pmd_offset(pud, vaddr);
-		pte = pte_offset_kernel(pmd, vaddr);
+		pte = virt_to_kpte(vaddr);
 		pte_set_val(*pte, p, PAGE_READONLY);
 	}
 #endif
diff --git a/arch/um/kernel/trap.c b/arch/um/kernel/trap.c
index b6ba694923e4..9c4b7e73ab8d 100644
--- a/arch/um/kernel/trap.c
+++ b/arch/um/kernel/trap.c
@@ -26,9 +26,6 @@ int handle_page_fault(unsigned long address, unsigned long ip,
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
-	pgd_t *pgd;
-	p4d_t *p4d;
-	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
 	int err = -EFAULT;
@@ -102,10 +99,7 @@ int handle_page_fault(unsigned long address, unsigned long ip,
 			}
 		}
 
-		pgd = pgd_offset(mm, address);
-		p4d = p4d_offset(pgd, address);
-		pud = pud_offset(p4d, address);
-		pmd = pmd_offset(pud, address);
+		pmd = pmd_off(mm, address);
 		pte = pte_offset_kernel(pmd, address);
 	} while (!pte_present(*pte));
 	err = 0;
diff --git a/arch/unicore32/mm/mm.h b/arch/unicore32/mm/mm.h
index 27127abc95fb..f157f5d249ab 100644
--- a/arch/unicore32/mm/mm.h
+++ b/arch/unicore32/mm/mm.h
@@ -14,16 +14,6 @@ extern int sysctl_overcommit_memory;
 
 #define TOP_PTE(x)	pte_offset_kernel(top_pmd, x)
 
-static inline pmd_t *pmd_off(pgd_t *pgd, unsigned long virt)
-{
-	return pmd_offset((pud_t *)pgd, virt);
-}
-
-static inline pmd_t *pmd_off_k(unsigned long virt)
-{
-	return pmd_off(pgd_offset_k(virt), virt);
-}
-
 struct mem_type {
 	unsigned int prot_pte;
 	unsigned int prot_l1;
diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index 6a821727ceaf..bda909e3e37e 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -395,15 +395,6 @@ kernel_physical_mapping_init(unsigned long start,
 
 pte_t *kmap_pte;
 
-static inline pte_t *kmap_get_fixmap_pte(unsigned long vaddr)
-{
-	pgd_t *pgd = pgd_offset_k(vaddr);
-	p4d_t *p4d = p4d_offset(pgd, vaddr);
-	pud_t *pud = pud_offset(p4d, vaddr);
-	pmd_t *pmd = pmd_offset(pud, vaddr);
-	return pte_offset_kernel(pmd, vaddr);
-}
-
 static void __init kmap_init(void)
 {
 	unsigned long kmap_vstart;
@@ -412,28 +403,17 @@ static void __init kmap_init(void)
 	 * Cache the first kmap pte:
 	 */
 	kmap_vstart = __fix_to_virt(FIX_KMAP_BEGIN);
-	kmap_pte = kmap_get_fixmap_pte(kmap_vstart);
+	kmap_pte = virt_to_kpte(kmap_vstart);
 }
 
 #ifdef CONFIG_HIGHMEM
 static void __init permanent_kmaps_init(pgd_t *pgd_base)
 {
-	unsigned long vaddr;
-	pgd_t *pgd;
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmd;
-	pte_t *pte;
+	unsigned long vaddr = PKMAP_BASE;
 
-	vaddr = PKMAP_BASE;
 	page_table_range_init(vaddr, vaddr + PAGE_SIZE*LAST_PKMAP, pgd_base);
 
-	pgd = swapper_pg_dir + pgd_index(vaddr);
-	p4d = p4d_offset(pgd, vaddr);
-	pud = pud_offset(p4d, vaddr);
-	pmd = pmd_offset(pud, vaddr);
-	pte = pte_offset_kernel(pmd, vaddr);
-	pkmap_page_table = pte;
+	pkmap_page_table = virt_to_kpte(vaddr);
 }
 
 void __init add_highpages_with_active_regions(int nid,
diff --git a/arch/xtensa/include/asm/fixmap.h b/arch/xtensa/include/asm/fixmap.h
index 89a6d1b7994d..a06ffb0c61c7 100644
--- a/arch/xtensa/include/asm/fixmap.h
+++ b/arch/xtensa/include/asm/fixmap.h
@@ -76,12 +76,4 @@ static inline unsigned long virt_to_fix(const unsigned long vaddr)
 
 #endif
 
-#define kmap_get_fixmap_pte(vaddr) \
-	pte_offset_kernel( \
-		pmd_offset(pud_offset(p4d_offset(pgd_offset_k(vaddr), \
-						 (vaddr)), \
-				      (vaddr)), \
-			   (vaddr)), \
-		(vaddr))
-
 #endif
diff --git a/arch/xtensa/mm/highmem.c b/arch/xtensa/mm/highmem.c
index 99b5ad137ab5..673196fe862e 100644
--- a/arch/xtensa/mm/highmem.c
+++ b/arch/xtensa/mm/highmem.c
@@ -86,6 +86,6 @@ void __init kmap_init(void)
 	BUILD_BUG_ON(PKMAP_BASE < TLBTEMP_BASE_1 + TLBTEMP_SIZE);
 	/* cache the first kmap pte */
 	kmap_vstart = __fix_to_virt(FIX_KMAP_BEGIN);
-	kmap_pte = kmap_get_fixmap_pte(kmap_vstart);
+	kmap_pte = virt_to_kpte(kmap_vstart);
 	kmap_waitqueues_init();
 }
diff --git a/arch/xtensa/mm/kasan_init.c b/arch/xtensa/mm/kasan_init.c
index e3baa21ff24c..1fef24db2ff6 100644
--- a/arch/xtensa/mm/kasan_init.c
+++ b/arch/xtensa/mm/kasan_init.c
@@ -19,10 +19,7 @@
 void __init kasan_early_init(void)
 {
 	unsigned long vaddr = KASAN_SHADOW_START;
-	pgd_t *pgd = pgd_offset_k(vaddr);
-	p4d_t *p4d = p4d_offset(pgd, vaddr);
-	pud_t *pud = pud_offset(p4d, vaddr);
-	pmd_t *pmd = pmd_offset(pud, vaddr);
+	pmd_t *pmd = pmd_off_k(vaddr);
 	int i;
 
 	for (i = 0; i < PTRS_PER_PTE; ++i)
@@ -43,10 +40,7 @@ static void __init populate(void *start, void *end)
 	unsigned long n_pmds = n_pages / PTRS_PER_PTE;
 	unsigned long i, j;
 	unsigned long vaddr = (unsigned long)start;
-	pgd_t *pgd = pgd_offset_k(vaddr);
-	p4d_t *p4d = p4d_offset(pgd, vaddr);
-	pud_t *pud = pud_offset(p4d, vaddr);
-	pmd_t *pmd = pmd_offset(pud, vaddr);
+	pmd_t *pmd = pmd_off_k(vaddr);
 	pte_t *pte = memblock_alloc(n_pages * sizeof(pte_t), PAGE_SIZE);
 
 	if (!pte)
diff --git a/arch/xtensa/mm/mmu.c b/arch/xtensa/mm/mmu.c
index 37e478a27877..fd2193df8a14 100644
--- a/arch/xtensa/mm/mmu.c
+++ b/arch/xtensa/mm/mmu.c
@@ -21,10 +21,7 @@
 #if defined(CONFIG_HIGHMEM)
 static void * __init init_pmd(unsigned long vaddr, unsigned long n_pages)
 {
-	pgd_t *pgd = pgd_offset_k(vaddr);
-	p4d_t *p4d = p4d_offset(pgd, vaddr);
-	pud_t *pud = pud_offset(p4d, vaddr);
-	pmd_t *pmd = pmd_offset(pud, vaddr);
+	pmd_t *pmd = pmd_off_k(vaddr);
 	pte_t *pte;
 	unsigned long i;
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 2f71e586aa87..8d092cead6ea 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -28,6 +28,30 @@
 #define USER_PGTABLES_CEILING	0UL
 #endif
 
+/*
+ * In many cases it is known that a virtual address is mapped at PMD or PTE
+ * level, so instead of traversing all the page table levels, we can get a
+ * pointer to the PMD entry in user or kernel page table or translate a virtual
+ * address to the pointer in the PTE in the kernel page tables with simple
+ * helpers.
+ */
+static inline pmd_t *pmd_off(struct mm_struct *mm, unsigned long va)
+{
+	return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
+}
+
+static inline pmd_t *pmd_off_k(unsigned long va)
+{
+	return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
+}
+
+static inline pte_t *virt_to_kpte(unsigned long vaddr)
+{
+	pmd_t *pmd = pmd_off_k(vaddr);
+
+	return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
+}
+
 #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 extern int ptep_set_access_flags(struct vm_area_struct *vma,
 				 unsigned long address, pte_t *ptep,
-- 
2.26.2

