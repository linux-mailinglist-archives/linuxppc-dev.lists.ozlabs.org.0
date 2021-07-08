Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E9D3C176F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 18:51:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLMkR4Vd1z3bqW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jul 2021 02:51:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLMj56W7Cz30K3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jul 2021 02:50:00 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GLMhl6bVtzBF3Q;
 Thu,  8 Jul 2021 18:49:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O2M-KEPMrU1i; Thu,  8 Jul 2021 18:49:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GLMhl5hdCzBF3J;
 Thu,  8 Jul 2021 18:49:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BB01F8B801;
 Thu,  8 Jul 2021 18:49:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LJkU6zeZlgBu; Thu,  8 Jul 2021 18:49:43 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 68B548B7E3;
 Thu,  8 Jul 2021 18:49:43 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 48C076640E; Thu,  8 Jul 2021 16:49:43 +0000 (UTC)
Message-Id: <03166d569526be70214fe9370a7bad219d2f41c8.1625762907.git.christophe.leroy@csgroup.eu>
In-Reply-To: <b864a92693ca8413ef0b19f0c12065c212899b6e.1625762905.git.christophe.leroy@csgroup.eu>
References: <b864a92693ca8413ef0b19f0c12065c212899b6e.1625762905.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 4/4] powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  8 Jul 2021 16:49:43 +0000 (UTC)
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

This patch converts powerpc to the generic PTDUMP implementation.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v4: Reworked init of ptdump range
---
 arch/powerpc/Kconfig            |   2 +
 arch/powerpc/Kconfig.debug      |  30 -------
 arch/powerpc/mm/Makefile        |   2 +-
 arch/powerpc/mm/mmu_decl.h      |   2 +-
 arch/powerpc/mm/ptdump/Makefile |   9 +-
 arch/powerpc/mm/ptdump/ptdump.c | 146 ++++++++------------------------
 6 files changed, 47 insertions(+), 144 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 0104345d0a65..dc1ab533a1cf 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -123,6 +123,7 @@ config PPC
 	select ARCH_HAS_COPY_MC			if PPC64
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
+	select ARCH_HAS_DEBUG_WX		if STRICT_KERNEL_RWX
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_DMA_MAP_DIRECT 		if PPC_PSERIES
 	select ARCH_HAS_ELF_RANDOMIZE
@@ -182,6 +183,7 @@ config PPC
 	select GENERIC_IRQ_SHOW
 	select GENERIC_IRQ_SHOW_LEVEL
 	select GENERIC_PCI_IOMAP		if PCI
+	select GENERIC_PTDUMP
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_STRNCPY_FROM_USER
 	select GENERIC_STRNLEN_USER
diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index 205cd77f321f..192f0ed0097f 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -365,36 +365,6 @@ config FAIL_IOMMU
 
 	  If you are unsure, say N.
 
-config PPC_PTDUMP
-	bool "Export kernel pagetable layout to userspace via debugfs"
-	depends on DEBUG_KERNEL && DEBUG_FS
-	help
-	  This option exports the state of the kernel pagetables to a
-	  debugfs file. This is only useful for kernel developers who are
-	  working in architecture specific areas of the kernel - probably
-	  not a good idea to enable this feature in a production kernel.
-
-	  If you are unsure, say N.
-
-config PPC_DEBUG_WX
-	bool "Warn on W+X mappings at boot"
-	depends on PPC_PTDUMP && STRICT_KERNEL_RWX
-	help
-	  Generate a warning if any W+X mappings are found at boot.
-
-	  This is useful for discovering cases where the kernel is leaving
-	  W+X mappings after applying NX, as such mappings are a security risk.
-
-	  Note that even if the check fails, your kernel is possibly
-	  still fine, as W+X mappings are not a security hole in
-	  themselves, what they do is that they make the exploitation
-	  of other unfixed kernel bugs easier.
-
-	  There is no runtime or memory usage effect of this option
-	  once the kernel has booted up - it's a one time check.
-
-	  If in doubt, say "Y".
-
 config PPC_FAST_ENDIAN_SWITCH
 	bool "Deprecated fast endian-switch syscall"
 	depends on DEBUG_KERNEL && PPC_BOOK3S_64
diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
index eae4ec2988fc..df8172da2301 100644
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -18,5 +18,5 @@ obj-$(CONFIG_PPC_MM_SLICES)	+= slice.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_NOT_COHERENT_CACHE) += dma-noncoherent.o
 obj-$(CONFIG_PPC_COPRO_BASE)	+= copro_fault.o
-obj-$(CONFIG_PPC_PTDUMP)	+= ptdump/
+obj-$(CONFIG_PTDUMP_CORE)	+= ptdump/
 obj-$(CONFIG_KASAN)		+= kasan/
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 7dac910c0b21..dd1cabc2ea0f 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -180,7 +180,7 @@ static inline void mmu_mark_rodata_ro(void) { }
 void __init mmu_mapin_immr(void);
 #endif
 
-#ifdef CONFIG_PPC_DEBUG_WX
+#ifdef CONFIG_DEBUG_WX
 void ptdump_check_wx(void);
 #else
 static inline void ptdump_check_wx(void) { }
diff --git a/arch/powerpc/mm/ptdump/Makefile b/arch/powerpc/mm/ptdump/Makefile
index 712762be3cb1..4050cbb55acf 100644
--- a/arch/powerpc/mm/ptdump/Makefile
+++ b/arch/powerpc/mm/ptdump/Makefile
@@ -5,5 +5,10 @@ obj-y	+= ptdump.o
 obj-$(CONFIG_4xx)		+= shared.o
 obj-$(CONFIG_PPC_8xx)		+= 8xx.o
 obj-$(CONFIG_PPC_BOOK3E_MMU)	+= shared.o
-obj-$(CONFIG_PPC_BOOK3S_32)	+= shared.o bats.o segment_regs.o
-obj-$(CONFIG_PPC_BOOK3S_64)	+= book3s64.o hashpagetable.o
+obj-$(CONFIG_PPC_BOOK3S_32)	+= shared.o
+obj-$(CONFIG_PPC_BOOK3S_64)	+= book3s64.o
+
+ifdef CONFIG_PTDUMP_DEBUGFS
+obj-$(CONFIG_PPC_BOOK3S_32)	+= bats.o segment_regs.o
+obj-$(CONFIG_PPC_BOOK3S_64)	+= hashpagetable.o
+endif
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index fb531bc64fc5..2d80d775d15e 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -16,6 +16,7 @@
 #include <linux/io.h>
 #include <linux/mm.h>
 #include <linux/highmem.h>
+#include <linux/ptdump.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
 #include <asm/fixmap.h>
@@ -54,6 +55,7 @@
  *
  */
 struct pg_state {
+	struct ptdump_state ptdump;
 	struct seq_file *seq;
 	const struct addr_marker *marker;
 	unsigned long start_address;
@@ -102,6 +104,11 @@ static struct addr_marker address_markers[] = {
 	{ -1,	NULL },
 };
 
+static struct ptdump_range ptdump_range[] __ro_after_init = {
+	{TASK_SIZE_MAX, ~0UL},
+	{0, 0}
+};
+
 #define pt_dump_seq_printf(m, fmt, args...)	\
 ({						\
 	if (m)					\
@@ -204,10 +211,10 @@ static void note_page_update_state(struct pg_state *st, unsigned long addr, int
 	}
 }
 
-static void note_page(struct pg_state *st, unsigned long addr,
-		      int level, u64 val, unsigned long page_size)
+static void note_page(struct ptdump_state *pt_st, unsigned long addr, int level, u64 val)
 {
 	u64 flag = level >= 0 ? val & pg_level[level].mask : 0;
+	struct pg_state *st = container_of(pt_st, struct pg_state, ptdump);
 
 	/* At first no level is set */
 	if (st->level == -1) {
@@ -245,94 +252,6 @@ static void note_page(struct pg_state *st, unsigned long addr,
 	}
 }
 
-static void walk_pte(struct pg_state *st, pmd_t *pmd, unsigned long start)
-{
-	pte_t *pte = pte_offset_kernel(pmd, 0);
-	unsigned long addr;
-	unsigned int i;
-
-	for (i = 0; i < PTRS_PER_PTE; i++, pte++) {
-		addr = start + i * PAGE_SIZE;
-		note_page(st, addr, 4, pte_val(*pte), PAGE_SIZE);
-
-	}
-}
-
-static void walk_hugepd(struct pg_state *st, hugepd_t *phpd, unsigned long start,
-			int pdshift, int level)
-{
-#ifdef CONFIG_ARCH_HAS_HUGEPD
-	unsigned int i;
-	int shift = hugepd_shift(*phpd);
-	int ptrs_per_hpd = pdshift - shift > 0 ? 1 << (pdshift - shift) : 1;
-
-	if (start & ((1 << shift) - 1))
-		return;
-
-	for (i = 0; i < ptrs_per_hpd; i++) {
-		unsigned long addr = start + (i << shift);
-		pte_t *pte = hugepte_offset(*phpd, addr, pdshift);
-
-		note_page(st, addr, level + 1, pte_val(*pte), 1 << shift);
-	}
-#endif
-}
-
-static void walk_pmd(struct pg_state *st, pud_t *pud, unsigned long start)
-{
-	pmd_t *pmd = pmd_offset(pud, 0);
-	unsigned long addr;
-	unsigned int i;
-
-	for (i = 0; i < PTRS_PER_PMD; i++, pmd++) {
-		addr = start + i * PMD_SIZE;
-		if (!pmd_none(*pmd) && !pmd_is_leaf(*pmd))
-			/* pmd exists */
-			walk_pte(st, pmd, addr);
-		else
-			note_page(st, addr, 3, pmd_val(*pmd), PMD_SIZE);
-	}
-}
-
-static void walk_pud(struct pg_state *st, p4d_t *p4d, unsigned long start)
-{
-	pud_t *pud = pud_offset(p4d, 0);
-	unsigned long addr;
-	unsigned int i;
-
-	for (i = 0; i < PTRS_PER_PUD; i++, pud++) {
-		addr = start + i * PUD_SIZE;
-		if (!pud_none(*pud) && !pud_is_leaf(*pud))
-			/* pud exists */
-			walk_pmd(st, pud, addr);
-		else
-			note_page(st, addr, 2, pud_val(*pud), PUD_SIZE);
-	}
-}
-
-static void walk_pagetables(struct pg_state *st)
-{
-	unsigned int i;
-	unsigned long addr = st->start_address & PGDIR_MASK;
-	pgd_t *pgd = pgd_offset_k(addr);
-
-	/*
-	 * Traverse the linux pagetable structure and dump pages that are in
-	 * the hash pagetable.
-	 */
-	for (i = pgd_index(addr); i < PTRS_PER_PGD; i++, pgd++, addr += PGDIR_SIZE) {
-		p4d_t *p4d = p4d_offset(pgd, 0);
-
-		if (p4d_none(*p4d) || p4d_is_leaf(*p4d))
-			note_page(st, addr, 1, p4d_val(*p4d), PGDIR_SIZE);
-		else if (is_hugepd(__hugepd(p4d_val(*p4d))))
-			walk_hugepd(st, (hugepd_t *)p4d, addr, PGDIR_SHIFT, 1);
-		else
-			/* p4d exists */
-			walk_pud(st, p4d, addr);
-	}
-}
-
 static void populate_markers(void)
 {
 	int i = 0;
@@ -383,17 +302,14 @@ static int ptdump_show(struct seq_file *m, void *v)
 		.seq = m,
 		.marker = address_markers,
 		.level = -1,
-		.start_address = IS_ENABLED(CONFIG_PPC64) ? PAGE_OFFSET : TASK_SIZE,
+		.ptdump = {
+			.note_page = note_page,
+			.range = ptdump_range,
+		}
 	};
 
-#ifdef CONFIG_PPC64
-	if (!radix_enabled())
-		st.start_address = KERN_VIRT_START;
-#endif
-
 	/* Traverse kernel page tables */
-	walk_pagetables(&st);
-	note_page(&st, 0, -1, 0, 0);
+	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
 	return 0;
 }
 
@@ -409,23 +325,24 @@ static void build_pgtable_complete_mask(void)
 				pg_level[i].mask |= pg_level[i].flag[j].mask;
 }
 
-#ifdef CONFIG_PPC_DEBUG_WX
+#ifdef CONFIG_DEBUG_WX
 void ptdump_check_wx(void)
 {
 	struct pg_state st = {
 		.seq = NULL,
-		.marker = address_markers,
+		.marker = (struct addr_marker[]) {
+			{ 0, NULL},
+			{ -1, NULL},
+		},
 		.level = -1,
 		.check_wx = true,
-		.start_address = IS_ENABLED(CONFIG_PPC64) ? PAGE_OFFSET : TASK_SIZE,
+		.ptdump = {
+			.note_page = note_page,
+			.range = ptdump_range,
+		}
 	};
 
-#ifdef CONFIG_PPC64
-	if (!radix_enabled())
-		st.start_address = KERN_VIRT_START;
-#endif
-
-	walk_pagetables(&st);
+	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
 
 	if (st.wx_pages)
 		pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found\n",
@@ -435,12 +352,21 @@ void ptdump_check_wx(void)
 }
 #endif
 
-static int ptdump_init(void)
+static int __init ptdump_init(void)
 {
+#ifdef CONFIG_PPC64
+	if (!radix_enabled())
+		ptdump_range[0].start = KERN_VIRT_START;
+	else
+		ptdump_range[0].start = PAGE_OFFSET;
+#endif
+
 	populate_markers();
 	build_pgtable_complete_mask();
-	debugfs_create_file("kernel_page_tables", 0400, NULL, NULL,
-			    &ptdump_fops);
+
+	if (IS_ENABLED(CONFIG_PTDUMP_DEBUGFS))
+		debugfs_create_file("kernel_page_tables", 0400, NULL, NULL, &ptdump_fops);
+
 	return 0;
 }
 device_initcall(ptdump_init);
-- 
2.25.0

