Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBAE8CF320
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2024 11:32:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VnCxg6NnBz79Dv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 May 2024 19:23:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VnCww0d0Vz3fsf
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 May 2024 19:22:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4VnCwh3cGJz9sx4;
	Sun, 26 May 2024 11:22:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2hScOgdmlG8K; Sun, 26 May 2024 11:22:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4VnCwh2cMQz9sgJ;
	Sun, 26 May 2024 11:22:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4BC5E8B774;
	Sun, 26 May 2024 11:22:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vdh24kCSHDYJ; Sun, 26 May 2024 11:22:28 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.45])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7A24C8B773;
	Sun, 26 May 2024 11:22:27 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [RFC PATCH v3 01/16] powerpc/64e: Remove unused IBM HTW code [SQUASHED]
Date: Sun, 26 May 2024 11:22:21 +0200
Message-ID: <0345e831c9bf0d3d482677277e6b976bcc51de6b.1716714720.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1716714720.git.christophe.leroy@csgroup.eu>
References: <cover.1716714720.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716715343; l=40864; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=7P5m5qnsOOzOIX3zvYc63487z05AhuMULzMhzjcBwYs=; b=IX8/Znba5UBqXpE9wlVa5ThxGbssIh0VGG35Ts8wWSdrMgueRZs7iIREnPgxTEgfgzN3jhtLW PgoCFVpvVjSAv7xpHeWWyQtXWdKMFsOp87UnAB1gPKmhXJOuhHqhrGa
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

From: Michael Ellerman <mpe@ellerman.id.au>

This is a squash of series from Michael https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20240524073141.1637736-1-mpe@ellerman.id.au/

The nohash HTW_IBM (Hardware Table Walk) code is unused since support
for A2 was removed in commit fb5a515704d7 ("powerpc: Remove platforms/
wsp and associated pieces") (2014).

The remaining supported CPUs use either no HTW (data_tlb_miss_bolted),
or the e6500 HTW (data_tlb_miss_e6500).

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

powerpc/64e: Split out nohash Book3E 64-bit code

A reasonable chunk of nohash/tlb.c is 64-bit only code, split it out
into a separate file.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

powerpc/64e: Drop E500 ifdefs in 64-bit code

All 64-bit Book3E have E500=y, so drop the unneeded ifdefs.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

powerpc/64e: Drop MMU_FTR_TYPE_FSL_E checks in 64-bit code

All 64-bit Book3E have MMU_FTR_TYPE_FSL_E, since A2 was removed, so
remove checks for it in 64-bit only code.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

powerpc/64e: Consolidate TLB miss handler patching

The 64e TLB miss handler patching is done in setup_mmu_htw(), and then
again immediately afterward in early_init_mmu_global(). Consolidate it
into a single location.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

powerpc/64e: Drop unused TLB miss handlers

There are two possibilities for book3e_htw_mode, PPC_HTW_E6500 or
PPC_HTW_NONE.

The TLB miss handlers are patched to use, respectively:
  - exc_[data|indstruction]_tlb_miss_e6500_book3e
  - exc_[data|indstruction]_tlb_miss_bolted_book3e

Which means the default handlers are never used. Remove those, and use
the bolted handlers (PPC_HTW_NONE) by default.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/mmu-e500.h |   3 +-
 arch/powerpc/kernel/exceptions-64e.S       |   4 +-
 arch/powerpc/kernel/setup_64.c             |   6 +-
 arch/powerpc/mm/nohash/Makefile            |   2 +-
 arch/powerpc/mm/nohash/tlb.c               | 398 +------------------
 arch/powerpc/mm/nohash/tlb_64e.c           | 314 +++++++++++++++
 arch/powerpc/mm/nohash/tlb_low_64e.S       | 421 ---------------------
 7 files changed, 320 insertions(+), 828 deletions(-)
 create mode 100644 arch/powerpc/mm/nohash/tlb_64e.c

diff --git a/arch/powerpc/include/asm/nohash/mmu-e500.h b/arch/powerpc/include/asm/nohash/mmu-e500.h
index 6ddced0415cb..7dc24b8632d7 100644
--- a/arch/powerpc/include/asm/nohash/mmu-e500.h
+++ b/arch/powerpc/include/asm/nohash/mmu-e500.h
@@ -303,8 +303,7 @@ extern unsigned long linear_map_top;
 extern int book3e_htw_mode;
 
 #define PPC_HTW_NONE	0
-#define PPC_HTW_IBM	1
-#define PPC_HTW_E6500	2
+#define PPC_HTW_E6500	1
 
 /*
  * 64-bit booke platforms don't load the tlb in the tlb miss handler code.
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index dcf0591ad3c2..63f6b9f513a4 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -485,8 +485,8 @@ interrupt_base_book3e:					/* fake trap */
 	EXCEPTION_STUB(0x160, decrementer)		/* 0x0900 */
 	EXCEPTION_STUB(0x180, fixed_interval)		/* 0x0980 */
 	EXCEPTION_STUB(0x1a0, watchdog)			/* 0x09f0 */
-	EXCEPTION_STUB(0x1c0, data_tlb_miss)
-	EXCEPTION_STUB(0x1e0, instruction_tlb_miss)
+	EXCEPTION_STUB(0x1c0, data_tlb_miss_bolted)
+	EXCEPTION_STUB(0x1e0, instruction_tlb_miss_bolted)
 	EXCEPTION_STUB(0x200, altivec_unavailable)
 	EXCEPTION_STUB(0x220, altivec_assist)
 	EXCEPTION_STUB(0x260, perfmon)
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index ae36a129789f..22f83fbbc762 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -696,11 +696,7 @@ __init u64 ppc64_bolted_size(void)
 {
 #ifdef CONFIG_PPC_BOOK3E_64
 	/* Freescale BookE bolts the entire linear mapping */
-	/* XXX: BookE ppc64_rma_limit setup seems to disagree? */
-	if (early_mmu_has_feature(MMU_FTR_TYPE_FSL_E))
-		return linear_map_top;
-	/* Other BookE, we assume the first GB is bolted */
-	return 1ul << 30;
+	return linear_map_top;
 #else
 	/* BookS radix, does not take faults on linear mapping */
 	if (early_radix_enabled())
diff --git a/arch/powerpc/mm/nohash/Makefile b/arch/powerpc/mm/nohash/Makefile
index b3f0498dd42f..90e846f0c46c 100644
--- a/arch/powerpc/mm/nohash/Makefile
+++ b/arch/powerpc/mm/nohash/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-y				+= mmu_context.o tlb.o tlb_low.o kup.o
-obj-$(CONFIG_PPC_BOOK3E_64)  	+= tlb_low_64e.o book3e_pgtable.o
+obj-$(CONFIG_PPC_BOOK3E_64)  	+= tlb_64e.o tlb_low_64e.o book3e_pgtable.o
 obj-$(CONFIG_40x)		+= 40x.o
 obj-$(CONFIG_44x)		+= 44x.o
 obj-$(CONFIG_PPC_8xx)		+= 8xx.o
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 5ffa0af4328a..f57dc721d063 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -110,28 +110,6 @@ struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT] = {
 };
 #endif
 
-/* The variables below are currently only used on 64-bit Book3E
- * though this will probably be made common with other nohash
- * implementations at some point
- */
-#ifdef CONFIG_PPC64
-
-int mmu_pte_psize;		/* Page size used for PTE pages */
-int mmu_vmemmap_psize;		/* Page size used for the virtual mem map */
-int book3e_htw_mode;		/* HW tablewalk?  Value is PPC_HTW_* */
-unsigned long linear_map_top;	/* Top of linear mapping */
-
-
-/*
- * Number of bytes to add to SPRN_SPRG_TLB_EXFRAME on crit/mcheck/debug
- * exceptions.  This is used for bolted and e6500 TLB miss handlers which
- * do not modify this SPRG in the TLB miss code; for other TLB miss handlers,
- * this is set to zero.
- */
-int extlb_level_exc;
-
-#endif /* CONFIG_PPC64 */
-
 #ifdef CONFIG_PPC_E500
 /* next_tlbcam_idx is used to round-robin tlbcam entry assignment */
 DEFINE_PER_CPU(int, next_tlbcam_idx);
@@ -358,381 +336,7 @@ void tlb_flush(struct mmu_gather *tlb)
 	flush_tlb_mm(tlb->mm);
 }
 
-/*
- * Below are functions specific to the 64-bit variant of Book3E though that
- * may change in the future
- */
-
-#ifdef CONFIG_PPC64
-
-/*
- * Handling of virtual linear page tables or indirect TLB entries
- * flushing when PTE pages are freed
- */
-void tlb_flush_pgtable(struct mmu_gather *tlb, unsigned long address)
-{
-	int tsize = mmu_psize_defs[mmu_pte_psize].enc;
-
-	if (book3e_htw_mode != PPC_HTW_NONE) {
-		unsigned long start = address & PMD_MASK;
-		unsigned long end = address + PMD_SIZE;
-		unsigned long size = 1UL << mmu_psize_defs[mmu_pte_psize].shift;
-
-		/* This isn't the most optimal, ideally we would factor out the
-		 * while preempt & CPU mask mucking around, or even the IPI but
-		 * it will do for now
-		 */
-		while (start < end) {
-			__flush_tlb_page(tlb->mm, start, tsize, 1);
-			start += size;
-		}
-	} else {
-		unsigned long rmask = 0xf000000000000000ul;
-		unsigned long rid = (address & rmask) | 0x1000000000000000ul;
-		unsigned long vpte = address & ~rmask;
-
-		vpte = (vpte >> (PAGE_SHIFT - 3)) & ~0xffful;
-		vpte |= rid;
-		__flush_tlb_page(tlb->mm, vpte, tsize, 0);
-	}
-}
-
-static void __init setup_page_sizes(void)
-{
-	unsigned int tlb0cfg;
-	unsigned int tlb0ps;
-	unsigned int eptcfg;
-	int i, psize;
-
-#ifdef CONFIG_PPC_E500
-	unsigned int mmucfg = mfspr(SPRN_MMUCFG);
-	int fsl_mmu = mmu_has_feature(MMU_FTR_TYPE_FSL_E);
-
-	if (fsl_mmu && (mmucfg & MMUCFG_MAVN) == MMUCFG_MAVN_V1) {
-		unsigned int tlb1cfg = mfspr(SPRN_TLB1CFG);
-		unsigned int min_pg, max_pg;
-
-		min_pg = (tlb1cfg & TLBnCFG_MINSIZE) >> TLBnCFG_MINSIZE_SHIFT;
-		max_pg = (tlb1cfg & TLBnCFG_MAXSIZE) >> TLBnCFG_MAXSIZE_SHIFT;
-
-		for (psize = 0; psize < MMU_PAGE_COUNT; ++psize) {
-			struct mmu_psize_def *def;
-			unsigned int shift;
-
-			def = &mmu_psize_defs[psize];
-			shift = def->shift;
-
-			if (shift == 0 || shift & 1)
-				continue;
-
-			/* adjust to be in terms of 4^shift Kb */
-			shift = (shift - 10) >> 1;
-
-			if ((shift >= min_pg) && (shift <= max_pg))
-				def->flags |= MMU_PAGE_SIZE_DIRECT;
-		}
-
-		goto out;
-	}
-
-	if (fsl_mmu && (mmucfg & MMUCFG_MAVN) == MMUCFG_MAVN_V2) {
-		u32 tlb1cfg, tlb1ps;
-
-		tlb0cfg = mfspr(SPRN_TLB0CFG);
-		tlb1cfg = mfspr(SPRN_TLB1CFG);
-		tlb1ps = mfspr(SPRN_TLB1PS);
-		eptcfg = mfspr(SPRN_EPTCFG);
-
-		if ((tlb1cfg & TLBnCFG_IND) && (tlb0cfg & TLBnCFG_PT))
-			book3e_htw_mode = PPC_HTW_E6500;
-
-		/*
-		 * We expect 4K subpage size and unrestricted indirect size.
-		 * The lack of a restriction on indirect size is a Freescale
-		 * extension, indicated by PSn = 0 but SPSn != 0.
-		 */
-		if (eptcfg != 2)
-			book3e_htw_mode = PPC_HTW_NONE;
-
-		for (psize = 0; psize < MMU_PAGE_COUNT; ++psize) {
-			struct mmu_psize_def *def = &mmu_psize_defs[psize];
-
-			if (!def->shift)
-				continue;
-
-			if (tlb1ps & (1U << (def->shift - 10))) {
-				def->flags |= MMU_PAGE_SIZE_DIRECT;
-
-				if (book3e_htw_mode && psize == MMU_PAGE_2M)
-					def->flags |= MMU_PAGE_SIZE_INDIRECT;
-			}
-		}
-
-		goto out;
-	}
-#endif
-
-	tlb0cfg = mfspr(SPRN_TLB0CFG);
-	tlb0ps = mfspr(SPRN_TLB0PS);
-	eptcfg = mfspr(SPRN_EPTCFG);
-
-	/* Look for supported direct sizes */
-	for (psize = 0; psize < MMU_PAGE_COUNT; ++psize) {
-		struct mmu_psize_def *def = &mmu_psize_defs[psize];
-
-		if (tlb0ps & (1U << (def->shift - 10)))
-			def->flags |= MMU_PAGE_SIZE_DIRECT;
-	}
-
-	/* Indirect page sizes supported ? */
-	if ((tlb0cfg & TLBnCFG_IND) == 0 ||
-	    (tlb0cfg & TLBnCFG_PT) == 0)
-		goto out;
-
-	book3e_htw_mode = PPC_HTW_IBM;
-
-	/* Now, we only deal with one IND page size for each
-	 * direct size. Hopefully all implementations today are
-	 * unambiguous, but we might want to be careful in the
-	 * future.
-	 */
-	for (i = 0; i < 3; i++) {
-		unsigned int ps, sps;
-
-		sps = eptcfg & 0x1f;
-		eptcfg >>= 5;
-		ps = eptcfg & 0x1f;
-		eptcfg >>= 5;
-		if (!ps || !sps)
-			continue;
-		for (psize = 0; psize < MMU_PAGE_COUNT; psize++) {
-			struct mmu_psize_def *def = &mmu_psize_defs[psize];
-
-			if (ps == (def->shift - 10))
-				def->flags |= MMU_PAGE_SIZE_INDIRECT;
-			if (sps == (def->shift - 10))
-				def->ind = ps + 10;
-		}
-	}
-
-out:
-	/* Cleanup array and print summary */
-	pr_info("MMU: Supported page sizes\n");
-	for (psize = 0; psize < MMU_PAGE_COUNT; ++psize) {
-		struct mmu_psize_def *def = &mmu_psize_defs[psize];
-		const char *__page_type_names[] = {
-			"unsupported",
-			"direct",
-			"indirect",
-			"direct & indirect"
-		};
-		if (def->flags == 0) {
-			def->shift = 0;	
-			continue;
-		}
-		pr_info("  %8ld KB as %s\n", 1ul << (def->shift - 10),
-			__page_type_names[def->flags & 0x3]);
-	}
-}
-
-static void __init setup_mmu_htw(void)
-{
-	/*
-	 * If we want to use HW tablewalk, enable it by patching the TLB miss
-	 * handlers to branch to the one dedicated to it.
-	 */
-
-	switch (book3e_htw_mode) {
-	case PPC_HTW_IBM:
-		patch_exception(0x1c0, exc_data_tlb_miss_htw_book3e);
-		patch_exception(0x1e0, exc_instruction_tlb_miss_htw_book3e);
-		break;
-#ifdef CONFIG_PPC_E500
-	case PPC_HTW_E6500:
-		extlb_level_exc = EX_TLB_SIZE;
-		patch_exception(0x1c0, exc_data_tlb_miss_e6500_book3e);
-		patch_exception(0x1e0, exc_instruction_tlb_miss_e6500_book3e);
-		break;
-#endif
-	}
-	pr_info("MMU: Book3E HW tablewalk %s\n",
-		book3e_htw_mode != PPC_HTW_NONE ? "enabled" : "not supported");
-}
-
-/*
- * Early initialization of the MMU TLB code
- */
-static void early_init_this_mmu(void)
-{
-	unsigned int mas4;
-
-	/* Set MAS4 based on page table setting */
-
-	mas4 = 0x4 << MAS4_WIMGED_SHIFT;
-	switch (book3e_htw_mode) {
-	case PPC_HTW_E6500:
-		mas4 |= MAS4_INDD;
-		mas4 |= BOOK3E_PAGESZ_2M << MAS4_TSIZED_SHIFT;
-		mas4 |= MAS4_TLBSELD(1);
-		mmu_pte_psize = MMU_PAGE_2M;
-		break;
-
-	case PPC_HTW_IBM:
-		mas4 |= MAS4_INDD;
-		mas4 |=	BOOK3E_PAGESZ_1M << MAS4_TSIZED_SHIFT;
-		mmu_pte_psize = MMU_PAGE_1M;
-		break;
-
-	case PPC_HTW_NONE:
-		mas4 |=	BOOK3E_PAGESZ_4K << MAS4_TSIZED_SHIFT;
-		mmu_pte_psize = mmu_virtual_psize;
-		break;
-	}
-	mtspr(SPRN_MAS4, mas4);
-
-#ifdef CONFIG_PPC_E500
-	if (mmu_has_feature(MMU_FTR_TYPE_FSL_E)) {
-		unsigned int num_cams;
-		bool map = true;
-
-		/* use a quarter of the TLBCAM for bolted linear map */
-		num_cams = (mfspr(SPRN_TLB1CFG) & TLBnCFG_N_ENTRY) / 4;
-
-		/*
-		 * Only do the mapping once per core, or else the
-		 * transient mapping would cause problems.
-		 */
-#ifdef CONFIG_SMP
-		if (hweight32(get_tensr()) > 1)
-			map = false;
-#endif
-
-		if (map)
-			linear_map_top = map_mem_in_cams(linear_map_top,
-							 num_cams, false, true);
-	}
-#endif
-
-	/* A sync won't hurt us after mucking around with
-	 * the MMU configuration
-	 */
-	mb();
-}
-
-static void __init early_init_mmu_global(void)
-{
-	/* XXX This should be decided at runtime based on supported
-	 * page sizes in the TLB, but for now let's assume 16M is
-	 * always there and a good fit (which it probably is)
-	 *
-	 * Freescale booke only supports 4K pages in TLB0, so use that.
-	 */
-	if (mmu_has_feature(MMU_FTR_TYPE_FSL_E))
-		mmu_vmemmap_psize = MMU_PAGE_4K;
-	else
-		mmu_vmemmap_psize = MMU_PAGE_16M;
-
-	/* XXX This code only checks for TLB 0 capabilities and doesn't
-	 *     check what page size combos are supported by the HW. It
-	 *     also doesn't handle the case where a separate array holds
-	 *     the IND entries from the array loaded by the PT.
-	 */
-	/* Look for supported page sizes */
-	setup_page_sizes();
-
-	/* Look for HW tablewalk support */
-	setup_mmu_htw();
-
-#ifdef CONFIG_PPC_E500
-	if (mmu_has_feature(MMU_FTR_TYPE_FSL_E)) {
-		if (book3e_htw_mode == PPC_HTW_NONE) {
-			extlb_level_exc = EX_TLB_SIZE;
-			patch_exception(0x1c0, exc_data_tlb_miss_bolted_book3e);
-			patch_exception(0x1e0,
-				exc_instruction_tlb_miss_bolted_book3e);
-		}
-	}
-#endif
-
-	/* Set the global containing the top of the linear mapping
-	 * for use by the TLB miss code
-	 */
-	linear_map_top = memblock_end_of_DRAM();
-
-	ioremap_bot = IOREMAP_BASE;
-}
-
-static void __init early_mmu_set_memory_limit(void)
-{
-#ifdef CONFIG_PPC_E500
-	if (mmu_has_feature(MMU_FTR_TYPE_FSL_E)) {
-		/*
-		 * Limit memory so we dont have linear faults.
-		 * Unlike memblock_set_current_limit, which limits
-		 * memory available during early boot, this permanently
-		 * reduces the memory available to Linux.  We need to
-		 * do this because highmem is not supported on 64-bit.
-		 */
-		memblock_enforce_memory_limit(linear_map_top);
-	}
-#endif
-
-	memblock_set_current_limit(linear_map_top);
-}
-
-/* boot cpu only */
-void __init early_init_mmu(void)
-{
-	early_init_mmu_global();
-	early_init_this_mmu();
-	early_mmu_set_memory_limit();
-}
-
-void early_init_mmu_secondary(void)
-{
-	early_init_this_mmu();
-}
-
-void setup_initial_memory_limit(phys_addr_t first_memblock_base,
-				phys_addr_t first_memblock_size)
-{
-	/* On non-FSL Embedded 64-bit, we adjust the RMA size to match
-	 * the bolted TLB entry. We know for now that only 1G
-	 * entries are supported though that may eventually
-	 * change.
-	 *
-	 * on FSL Embedded 64-bit, usually all RAM is bolted, but with
-	 * unusual memory sizes it's possible for some RAM to not be mapped
-	 * (such RAM is not used at all by Linux, since we don't support
-	 * highmem on 64-bit).  We limit ppc64_rma_size to what would be
-	 * mappable if this memblock is the only one.  Additional memblocks
-	 * can only increase, not decrease, the amount that ends up getting
-	 * mapped.  We still limit max to 1G even if we'll eventually map
-	 * more.  This is due to what the early init code is set up to do.
-	 *
-	 * We crop it to the size of the first MEMBLOCK to
-	 * avoid going over total available memory just in case...
-	 */
-#ifdef CONFIG_PPC_E500
-	if (early_mmu_has_feature(MMU_FTR_TYPE_FSL_E)) {
-		unsigned long linear_sz;
-		unsigned int num_cams;
-
-		/* use a quarter of the TLBCAM for bolted linear map */
-		num_cams = (mfspr(SPRN_TLB1CFG) & TLBnCFG_N_ENTRY) / 4;
-
-		linear_sz = map_mem_in_cams(first_memblock_size, num_cams,
-					    true, true);
-
-		ppc64_rma_size = min_t(u64, linear_sz, 0x40000000);
-	} else
-#endif
-		ppc64_rma_size = min_t(u64, first_memblock_size, 0x40000000);
-
-	/* Finally limit subsequent allocations */
-	memblock_set_current_limit(first_memblock_base + ppc64_rma_size);
-}
-#else /* ! CONFIG_PPC64 */
+#ifndef CONFIG_PPC64
 void __init early_init_mmu(void)
 {
 	unsigned long root = of_get_flat_dt_root();
diff --git a/arch/powerpc/mm/nohash/tlb_64e.c b/arch/powerpc/mm/nohash/tlb_64e.c
new file mode 100644
index 000000000000..053128a5636c
--- /dev/null
+++ b/arch/powerpc/mm/nohash/tlb_64e.c
@@ -0,0 +1,314 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2008,2009 Ben Herrenschmidt <benh@kernel.crashing.org>
+ *                     IBM Corp.
+ *
+ *  Derived from arch/ppc/mm/init.c:
+ *    Copyright (C) 1995-1996 Gary Thomas (gdt@linuxppc.org)
+ *
+ *  Modifications by Paul Mackerras (PowerMac) (paulus@cs.anu.edu.au)
+ *  and Cort Dougan (PReP) (cort@cs.nmt.edu)
+ *    Copyright (C) 1996 Paul Mackerras
+ *
+ *  Derived from "arch/i386/mm/init.c"
+ *    Copyright (C) 1991, 1992, 1993, 1994  Linus Torvalds
+ */
+
+#include <linux/kernel.h>
+#include <linux/export.h>
+#include <linux/mm.h>
+#include <linux/init.h>
+#include <linux/pagemap.h>
+#include <linux/memblock.h>
+
+#include <asm/pgalloc.h>
+#include <asm/tlbflush.h>
+#include <asm/tlb.h>
+#include <asm/code-patching.h>
+#include <asm/cputhreads.h>
+
+#include <mm/mmu_decl.h>
+
+/* The variables below are currently only used on 64-bit Book3E
+ * though this will probably be made common with other nohash
+ * implementations at some point
+ */
+int mmu_pte_psize;		/* Page size used for PTE pages */
+int mmu_vmemmap_psize;		/* Page size used for the virtual mem map */
+int book3e_htw_mode;		/* HW tablewalk?  Value is PPC_HTW_* */
+unsigned long linear_map_top;	/* Top of linear mapping */
+
+
+/*
+ * Number of bytes to add to SPRN_SPRG_TLB_EXFRAME on crit/mcheck/debug
+ * exceptions.  This is used for bolted and e6500 TLB miss handlers which
+ * do not modify this SPRG in the TLB miss code; for other TLB miss handlers,
+ * this is set to zero.
+ */
+int extlb_level_exc;
+
+/*
+ * Handling of virtual linear page tables or indirect TLB entries
+ * flushing when PTE pages are freed
+ */
+void tlb_flush_pgtable(struct mmu_gather *tlb, unsigned long address)
+{
+	int tsize = mmu_psize_defs[mmu_pte_psize].enc;
+
+	if (book3e_htw_mode != PPC_HTW_NONE) {
+		unsigned long start = address & PMD_MASK;
+		unsigned long end = address + PMD_SIZE;
+		unsigned long size = 1UL << mmu_psize_defs[mmu_pte_psize].shift;
+
+		/* This isn't the most optimal, ideally we would factor out the
+		 * while preempt & CPU mask mucking around, or even the IPI but
+		 * it will do for now
+		 */
+		while (start < end) {
+			__flush_tlb_page(tlb->mm, start, tsize, 1);
+			start += size;
+		}
+	} else {
+		unsigned long rmask = 0xf000000000000000ul;
+		unsigned long rid = (address & rmask) | 0x1000000000000000ul;
+		unsigned long vpte = address & ~rmask;
+
+		vpte = (vpte >> (PAGE_SHIFT - 3)) & ~0xffful;
+		vpte |= rid;
+		__flush_tlb_page(tlb->mm, vpte, tsize, 0);
+	}
+}
+
+static void __init setup_page_sizes(void)
+{
+	unsigned int tlb0cfg;
+	unsigned int eptcfg;
+	int psize;
+
+	unsigned int mmucfg = mfspr(SPRN_MMUCFG);
+
+	if ((mmucfg & MMUCFG_MAVN) == MMUCFG_MAVN_V1) {
+		unsigned int tlb1cfg = mfspr(SPRN_TLB1CFG);
+		unsigned int min_pg, max_pg;
+
+		min_pg = (tlb1cfg & TLBnCFG_MINSIZE) >> TLBnCFG_MINSIZE_SHIFT;
+		max_pg = (tlb1cfg & TLBnCFG_MAXSIZE) >> TLBnCFG_MAXSIZE_SHIFT;
+
+		for (psize = 0; psize < MMU_PAGE_COUNT; ++psize) {
+			struct mmu_psize_def *def;
+			unsigned int shift;
+
+			def = &mmu_psize_defs[psize];
+			shift = def->shift;
+
+			if (shift == 0 || shift & 1)
+				continue;
+
+			/* adjust to be in terms of 4^shift Kb */
+			shift = (shift - 10) >> 1;
+
+			if ((shift >= min_pg) && (shift <= max_pg))
+				def->flags |= MMU_PAGE_SIZE_DIRECT;
+		}
+
+		goto out;
+	}
+
+	if ((mmucfg & MMUCFG_MAVN) == MMUCFG_MAVN_V2) {
+		u32 tlb1cfg, tlb1ps;
+
+		tlb0cfg = mfspr(SPRN_TLB0CFG);
+		tlb1cfg = mfspr(SPRN_TLB1CFG);
+		tlb1ps = mfspr(SPRN_TLB1PS);
+		eptcfg = mfspr(SPRN_EPTCFG);
+
+		if ((tlb1cfg & TLBnCFG_IND) && (tlb0cfg & TLBnCFG_PT))
+			book3e_htw_mode = PPC_HTW_E6500;
+
+		/*
+		 * We expect 4K subpage size and unrestricted indirect size.
+		 * The lack of a restriction on indirect size is a Freescale
+		 * extension, indicated by PSn = 0 but SPSn != 0.
+		 */
+		if (eptcfg != 2)
+			book3e_htw_mode = PPC_HTW_NONE;
+
+		for (psize = 0; psize < MMU_PAGE_COUNT; ++psize) {
+			struct mmu_psize_def *def = &mmu_psize_defs[psize];
+
+			if (!def->shift)
+				continue;
+
+			if (tlb1ps & (1U << (def->shift - 10))) {
+				def->flags |= MMU_PAGE_SIZE_DIRECT;
+
+				if (book3e_htw_mode && psize == MMU_PAGE_2M)
+					def->flags |= MMU_PAGE_SIZE_INDIRECT;
+			}
+		}
+
+		goto out;
+	}
+out:
+	/* Cleanup array and print summary */
+	pr_info("MMU: Supported page sizes\n");
+	for (psize = 0; psize < MMU_PAGE_COUNT; ++psize) {
+		struct mmu_psize_def *def = &mmu_psize_defs[psize];
+		const char *__page_type_names[] = {
+			"unsupported",
+			"direct",
+			"indirect",
+			"direct & indirect"
+		};
+		if (def->flags == 0) {
+			def->shift = 0;	
+			continue;
+		}
+		pr_info("  %8ld KB as %s\n", 1ul << (def->shift - 10),
+			__page_type_names[def->flags & 0x3]);
+	}
+}
+
+/*
+ * Early initialization of the MMU TLB code
+ */
+static void early_init_this_mmu(void)
+{
+	unsigned int mas4;
+
+	/* Set MAS4 based on page table setting */
+
+	mas4 = 0x4 << MAS4_WIMGED_SHIFT;
+	switch (book3e_htw_mode) {
+	case PPC_HTW_E6500:
+		mas4 |= MAS4_INDD;
+		mas4 |= BOOK3E_PAGESZ_2M << MAS4_TSIZED_SHIFT;
+		mas4 |= MAS4_TLBSELD(1);
+		mmu_pte_psize = MMU_PAGE_2M;
+		break;
+
+	case PPC_HTW_NONE:
+		mas4 |=	BOOK3E_PAGESZ_4K << MAS4_TSIZED_SHIFT;
+		mmu_pte_psize = mmu_virtual_psize;
+		break;
+	}
+	mtspr(SPRN_MAS4, mas4);
+
+	unsigned int num_cams;
+	bool map = true;
+
+	/* use a quarter of the TLBCAM for bolted linear map */
+	num_cams = (mfspr(SPRN_TLB1CFG) & TLBnCFG_N_ENTRY) / 4;
+
+	/*
+	 * Only do the mapping once per core, or else the
+	 * transient mapping would cause problems.
+	 */
+#ifdef CONFIG_SMP
+	if (hweight32(get_tensr()) > 1)
+		map = false;
+#endif
+
+	if (map)
+		linear_map_top = map_mem_in_cams(linear_map_top,
+						 num_cams, false, true);
+
+	/* A sync won't hurt us after mucking around with
+	 * the MMU configuration
+	 */
+	mb();
+}
+
+static void __init early_init_mmu_global(void)
+{
+	/*
+	 * Freescale booke only supports 4K pages in TLB0, so use that.
+	 */
+	mmu_vmemmap_psize = MMU_PAGE_4K;
+
+	/* XXX This code only checks for TLB 0 capabilities and doesn't
+	 *     check what page size combos are supported by the HW. It
+	 *     also doesn't handle the case where a separate array holds
+	 *     the IND entries from the array loaded by the PT.
+	 */
+	/* Look for supported page sizes */
+	setup_page_sizes();
+
+	/*
+	 * If we want to use HW tablewalk, enable it by patching the TLB miss
+	 * handlers to branch to the one dedicated to it.
+	 */
+	extlb_level_exc = EX_TLB_SIZE;
+	switch (book3e_htw_mode) {
+	case PPC_HTW_E6500:
+		patch_exception(0x1c0, exc_data_tlb_miss_e6500_book3e);
+		patch_exception(0x1e0, exc_instruction_tlb_miss_e6500_book3e);
+		break;
+	}
+
+	pr_info("MMU: Book3E HW tablewalk %s\n",
+		book3e_htw_mode != PPC_HTW_NONE ? "enabled" : "not supported");
+
+	/* Set the global containing the top of the linear mapping
+	 * for use by the TLB miss code
+	 */
+	linear_map_top = memblock_end_of_DRAM();
+
+	ioremap_bot = IOREMAP_BASE;
+}
+
+static void __init early_mmu_set_memory_limit(void)
+{
+	/*
+	 * Limit memory so we dont have linear faults.
+	 * Unlike memblock_set_current_limit, which limits
+	 * memory available during early boot, this permanently
+	 * reduces the memory available to Linux.  We need to
+	 * do this because highmem is not supported on 64-bit.
+	 */
+	memblock_enforce_memory_limit(linear_map_top);
+
+	memblock_set_current_limit(linear_map_top);
+}
+
+/* boot cpu only */
+void __init early_init_mmu(void)
+{
+	early_init_mmu_global();
+	early_init_this_mmu();
+	early_mmu_set_memory_limit();
+}
+
+void early_init_mmu_secondary(void)
+{
+	early_init_this_mmu();
+}
+
+void setup_initial_memory_limit(phys_addr_t first_memblock_base,
+				phys_addr_t first_memblock_size)
+{
+	/*
+	 * On FSL Embedded 64-bit, usually all RAM is bolted, but with
+	 * unusual memory sizes it's possible for some RAM to not be mapped
+	 * (such RAM is not used at all by Linux, since we don't support
+	 * highmem on 64-bit).  We limit ppc64_rma_size to what would be
+	 * mappable if this memblock is the only one.  Additional memblocks
+	 * can only increase, not decrease, the amount that ends up getting
+	 * mapped.  We still limit max to 1G even if we'll eventually map
+	 * more.  This is due to what the early init code is set up to do.
+	 *
+	 * We crop it to the size of the first MEMBLOCK to
+	 * avoid going over total available memory just in case...
+	 */
+	unsigned long linear_sz;
+	unsigned int num_cams;
+
+	/* use a quarter of the TLBCAM for bolted linear map */
+	num_cams = (mfspr(SPRN_TLB1CFG) & TLBnCFG_N_ENTRY) / 4;
+
+	linear_sz = map_mem_in_cams(first_memblock_size, num_cams, true, true);
+	ppc64_rma_size = min_t(u64, linear_sz, 0x40000000);
+
+	/* Finally limit subsequent allocations */
+	memblock_set_current_limit(first_memblock_base + ppc64_rma_size);
+}
diff --git a/arch/powerpc/mm/nohash/tlb_low_64e.S b/arch/powerpc/mm/nohash/tlb_low_64e.S
index 7e0b8fe1c279..a54e7d6c3d0b 100644
--- a/arch/powerpc/mm/nohash/tlb_low_64e.S
+++ b/arch/powerpc/mm/nohash/tlb_low_64e.S
@@ -511,232 +511,6 @@ itlb_miss_fault_e6500:
 	tlb_epilog_bolted
 	b	exc_instruction_storage_book3e
 
-/**********************************************************************
- *                                                                    *
- * TLB miss handling for Book3E with TLB reservation and HES support  *
- *                                                                    *
- **********************************************************************/
-
-
-/* Data TLB miss */
-	START_EXCEPTION(data_tlb_miss)
-	TLB_MISS_PROLOG
-
-	/* Now we handle the fault proper. We only save DEAR in normal
-	 * fault case since that's the only interesting values here.
-	 * We could probably also optimize by not saving SRR0/1 in the
-	 * linear mapping case but I'll leave that for later
-	 */
-	mfspr	r14,SPRN_ESR
-	mfspr	r16,SPRN_DEAR		/* get faulting address */
-	srdi	r15,r16,44		/* get region */
-	xoris	r15,r15,0xc
-	cmpldi	cr0,r15,0		/* linear mapping ? */
-	beq	tlb_load_linear		/* yes -> go to linear map load */
-	cmpldi	cr1,r15,1		/* vmalloc mapping ? */
-
-	/* The page tables are mapped virtually linear. At this point, though,
-	 * we don't know whether we are trying to fault in a first level
-	 * virtual address or a virtual page table address. We can get that
-	 * from bit 0x1 of the region ID which we have set for a page table
-	 */
-	andis.	r10,r15,0x1
-	bne-	virt_page_table_tlb_miss
-
-	std	r14,EX_TLB_ESR(r12);	/* save ESR */
-	std	r16,EX_TLB_DEAR(r12);	/* save DEAR */
-
-	 /* We need _PAGE_PRESENT and  _PAGE_ACCESSED set */
-	li	r11,_PAGE_PRESENT
-	oris	r11,r11,_PAGE_ACCESSED@h
-
-	/* We do the user/kernel test for the PID here along with the RW test
-	 */
-	srdi.	r15,r16,60		/* Check for user region */
-
-	/* We pre-test some combination of permissions to avoid double
-	 * faults:
-	 *
-	 * We move the ESR:ST bit into the position of _PAGE_BAP_SW in the PTE
-	 * ESR_ST   is 0x00800000
-	 * _PAGE_BAP_SW is 0x00000010
-	 * So the shift is >> 19. This tests for supervisor writeability.
-	 * If the page happens to be supervisor writeable and not user
-	 * writeable, we will take a new fault later, but that should be
-	 * a rare enough case.
-	 *
-	 * We also move ESR_ST in _PAGE_DIRTY position
-	 * _PAGE_DIRTY is 0x00001000 so the shift is >> 11
-	 *
-	 * MAS1 is preset for all we need except for TID that needs to
-	 * be cleared for kernel translations
-	 */
-	rlwimi	r11,r14,32-19,27,27
-	rlwimi	r11,r14,32-16,19,19
-	beq	normal_tlb_miss_user
-	/* XXX replace the RMW cycles with immediate loads + writes */
-1:	mfspr	r10,SPRN_MAS1
-	rlwinm	r10,r10,0,16,1		/* Clear TID */
-	mtspr	SPRN_MAS1,r10
-	beq+	cr1,normal_tlb_miss
-
-	/* We got a crappy address, just fault with whatever DEAR and ESR
-	 * are here
-	 */
-	TLB_MISS_EPILOG_ERROR
-	b	exc_data_storage_book3e
-
-/* Instruction TLB miss */
-	START_EXCEPTION(instruction_tlb_miss)
-	TLB_MISS_PROLOG
-
-	/* If we take a recursive fault, the second level handler may need
-	 * to know whether we are handling a data or instruction fault in
-	 * order to get to the right store fault handler. We provide that
-	 * info by writing a crazy value in ESR in our exception frame
-	 */
-	li	r14,-1	/* store to exception frame is done later */
-
-	/* Now we handle the fault proper. We only save DEAR in the non
-	 * linear mapping case since we know the linear mapping case will
-	 * not re-enter. We could indeed optimize and also not save SRR0/1
-	 * in the linear mapping case but I'll leave that for later
-	 *
-	 * Faulting address is SRR0 which is already in r16
-	 */
-	srdi	r15,r16,44		/* get region */
-	xoris	r15,r15,0xc
-	cmpldi	cr0,r15,0		/* linear mapping ? */
-	beq	tlb_load_linear		/* yes -> go to linear map load */
-	cmpldi	cr1,r15,1		/* vmalloc mapping ? */
-
-	/* We do the user/kernel test for the PID here along with the RW test
-	 */
-	li	r11,_PAGE_PRESENT|_PAGE_BAP_UX	/* Base perm */
-	oris	r11,r11,_PAGE_ACCESSED@h
-
-	srdi.	r15,r16,60			/* Check for user region */
-	std	r14,EX_TLB_ESR(r12)		/* write crazy -1 to frame */
-	beq	normal_tlb_miss_user
-
-	li	r11,_PAGE_PRESENT|_PAGE_BAP_SX	/* Base perm */
-	oris	r11,r11,_PAGE_ACCESSED@h
-	/* XXX replace the RMW cycles with immediate loads + writes */
-	mfspr	r10,SPRN_MAS1
-	rlwinm	r10,r10,0,16,1			/* Clear TID */
-	mtspr	SPRN_MAS1,r10
-	beq+	cr1,normal_tlb_miss
-
-	/* We got a crappy address, just fault */
-	TLB_MISS_EPILOG_ERROR
-	b	exc_instruction_storage_book3e
-
-/*
- * This is the guts of the first-level TLB miss handler for direct
- * misses. We are entered with:
- *
- * r16 = faulting address
- * r15 = region ID
- * r14 = crap (free to use)
- * r13 = PACA
- * r12 = TLB exception frame in PACA
- * r11 = PTE permission mask
- * r10 = crap (free to use)
- */
-normal_tlb_miss_user:
-#ifdef CONFIG_PPC_KUAP
-	mfspr	r14,SPRN_MAS1
-	rlwinm.	r14,r14,0,0x3fff0000
-	beq-	normal_tlb_miss_access_fault /* KUAP fault */
-#endif
-normal_tlb_miss:
-	/* So we first construct the page table address. We do that by
-	 * shifting the bottom of the address (not the region ID) by
-	 * PAGE_SHIFT-3, clearing the bottom 3 bits (get a PTE ptr) and
-	 * or'ing the fourth high bit.
-	 *
-	 * NOTE: For 64K pages, we do things slightly differently in
-	 * order to handle the weird page table format used by linux
-	 */
-	srdi	r15,r16,44
-	oris	r10,r15,0x1
-	rldicl	r14,r16,64-(PAGE_SHIFT-3),PAGE_SHIFT-3+4
-	sldi	r15,r10,44
-	clrrdi	r14,r14,19
-	or	r10,r15,r14
-
-	ld	r14,0(r10)
-
-finish_normal_tlb_miss:
-	/* Check if required permissions are met */
-	andc.	r15,r11,r14
-	bne-	normal_tlb_miss_access_fault
-
-	/* Now we build the MAS:
-	 *
-	 * MAS 0   :	Fully setup with defaults in MAS4 and TLBnCFG
-	 * MAS 1   :	Almost fully setup
-	 *               - PID already updated by caller if necessary
-	 *               - TSIZE need change if !base page size, not
-	 *                 yet implemented for now
-	 * MAS 2   :	Defaults not useful, need to be redone
-	 * MAS 3+7 :	Needs to be done
-	 *
-	 * TODO: mix up code below for better scheduling
-	 */
-	clrrdi	r10,r16,12		/* Clear low crap in EA */
-	rlwimi	r10,r14,32-19,27,31	/* Insert WIMGE */
-	mtspr	SPRN_MAS2,r10
-
-	/* Check page size, if not standard, update MAS1 */
-	rldicl	r10,r14,64-8,64-8
-	cmpldi	cr0,r10,BOOK3E_PAGESZ_4K
-	beq-	1f
-	mfspr	r11,SPRN_MAS1
-	rlwimi	r11,r14,31,21,24
-	rlwinm	r11,r11,0,21,19
-	mtspr	SPRN_MAS1,r11
-1:
-	/* Move RPN in position */
-	rldicr	r11,r14,64-(PTE_RPN_SHIFT-PAGE_SHIFT),63-PAGE_SHIFT
-	clrldi	r15,r11,12		/* Clear crap at the top */
-	rlwimi	r15,r14,32-8,22,25	/* Move in U bits */
-	rlwimi	r15,r14,32-2,26,31	/* Move in BAP bits */
-
-	/* Mask out SW and UW if !DIRTY (XXX optimize this !) */
-	andi.	r11,r14,_PAGE_DIRTY
-	bne	1f
-	li	r11,MAS3_SW|MAS3_UW
-	andc	r15,r15,r11
-1:
-	srdi	r16,r15,32
-	mtspr	SPRN_MAS3,r15
-	mtspr	SPRN_MAS7,r16
-
-	tlbwe
-
-normal_tlb_miss_done:
-	/* We don't bother with restoring DEAR or ESR since we know we are
-	 * level 0 and just going back to userland. They are only needed
-	 * if you are going to take an access fault
-	 */
-	TLB_MISS_EPILOG_SUCCESS
-	rfi
-
-normal_tlb_miss_access_fault:
-	/* We need to check if it was an instruction miss */
-	andi.	r10,r11,_PAGE_BAP_UX
-	bne	1f
-	ld	r14,EX_TLB_DEAR(r12)
-	ld	r15,EX_TLB_ESR(r12)
-	mtspr	SPRN_DEAR,r14
-	mtspr	SPRN_ESR,r15
-	TLB_MISS_EPILOG_ERROR
-	b	exc_data_storage_book3e
-1:	TLB_MISS_EPILOG_ERROR
-	b	exc_instruction_storage_book3e
-
-
 /*
  * This is the guts of the second-level TLB miss handler for direct
  * misses. We are entered with:
@@ -893,201 +667,6 @@ virt_page_table_tlb_miss_whacko_fault:
 	TLB_MISS_EPILOG_ERROR
 	b	exc_data_storage_book3e
 
-
-/**************************************************************
- *                                                            *
- * TLB miss handling for Book3E with hw page table support    *
- *                                                            *
- **************************************************************/
-
-
-/* Data TLB miss */
-	START_EXCEPTION(data_tlb_miss_htw)
-	TLB_MISS_PROLOG
-
-	/* Now we handle the fault proper. We only save DEAR in normal
-	 * fault case since that's the only interesting values here.
-	 * We could probably also optimize by not saving SRR0/1 in the
-	 * linear mapping case but I'll leave that for later
-	 */
-	mfspr	r14,SPRN_ESR
-	mfspr	r16,SPRN_DEAR		/* get faulting address */
-	srdi	r11,r16,44		/* get region */
-	xoris	r11,r11,0xc
-	cmpldi	cr0,r11,0		/* linear mapping ? */
-	beq	tlb_load_linear		/* yes -> go to linear map load */
-	cmpldi	cr1,r11,1		/* vmalloc mapping ? */
-
-	/* We do the user/kernel test for the PID here along with the RW test
-	 */
-	srdi.	r11,r16,60		/* Check for user region */
-	ld	r15,PACAPGD(r13)	/* Load user pgdir */
-	beq	htw_tlb_miss
-
-	/* XXX replace the RMW cycles with immediate loads + writes */
-1:	mfspr	r10,SPRN_MAS1
-	rlwinm	r10,r10,0,16,1		/* Clear TID */
-	mtspr	SPRN_MAS1,r10
-	ld	r15,PACA_KERNELPGD(r13)	/* Load kernel pgdir */
-	beq+	cr1,htw_tlb_miss
-
-	/* We got a crappy address, just fault with whatever DEAR and ESR
-	 * are here
-	 */
-	TLB_MISS_EPILOG_ERROR
-	b	exc_data_storage_book3e
-
-/* Instruction TLB miss */
-	START_EXCEPTION(instruction_tlb_miss_htw)
-	TLB_MISS_PROLOG
-
-	/* If we take a recursive fault, the second level handler may need
-	 * to know whether we are handling a data or instruction fault in
-	 * order to get to the right store fault handler. We provide that
-	 * info by keeping a crazy value for ESR in r14
-	 */
-	li	r14,-1	/* store to exception frame is done later */
-
-	/* Now we handle the fault proper. We only save DEAR in the non
-	 * linear mapping case since we know the linear mapping case will
-	 * not re-enter. We could indeed optimize and also not save SRR0/1
-	 * in the linear mapping case but I'll leave that for later
-	 *
-	 * Faulting address is SRR0 which is already in r16
-	 */
-	srdi	r11,r16,44		/* get region */
-	xoris	r11,r11,0xc
-	cmpldi	cr0,r11,0		/* linear mapping ? */
-	beq	tlb_load_linear		/* yes -> go to linear map load */
-	cmpldi	cr1,r11,1		/* vmalloc mapping ? */
-
-	/* We do the user/kernel test for the PID here along with the RW test
-	 */
-	srdi.	r11,r16,60		/* Check for user region */
-	ld	r15,PACAPGD(r13)		/* Load user pgdir */
-	beq	htw_tlb_miss
-
-	/* XXX replace the RMW cycles with immediate loads + writes */
-1:	mfspr	r10,SPRN_MAS1
-	rlwinm	r10,r10,0,16,1			/* Clear TID */
-	mtspr	SPRN_MAS1,r10
-	ld	r15,PACA_KERNELPGD(r13)		/* Load kernel pgdir */
-	beq+	htw_tlb_miss
-
-	/* We got a crappy address, just fault */
-	TLB_MISS_EPILOG_ERROR
-	b	exc_instruction_storage_book3e
-
-
-/*
- * This is the guts of the second-level TLB miss handler for direct
- * misses. We are entered with:
- *
- * r16 = virtual page table faulting address
- * r15 = PGD pointer
- * r14 = ESR
- * r13 = PACA
- * r12 = TLB exception frame in PACA
- * r11 = crap (free to use)
- * r10 = crap (free to use)
- *
- * It can be re-entered by the linear mapping miss handler. However, to
- * avoid too much complication, it will save/restore things for us
- */
-htw_tlb_miss:
-#ifdef CONFIG_PPC_KUAP
-	mfspr	r10,SPRN_MAS1
-	rlwinm.	r10,r10,0,0x3fff0000
-	beq-	htw_tlb_miss_fault /* KUAP fault */
-#endif
-	/* Search if we already have a TLB entry for that virtual address, and
-	 * if we do, bail out.
-	 *
-	 * MAS1:IND should be already set based on MAS4
-	 */
-	PPC_TLBSRX_DOT(0,R16)
-	beq	htw_tlb_miss_done
-
-	/* Now, we need to walk the page tables. First check if we are in
-	 * range.
-	 */
-	rldicl.	r10,r16,64-PGTABLE_EADDR_SIZE,PGTABLE_EADDR_SIZE+4
-	bne-	htw_tlb_miss_fault
-
-	/* Get the PGD pointer */
-	cmpldi	cr0,r15,0
-	beq-	htw_tlb_miss_fault
-
-	/* Get to PGD entry */
-	rldicl	r11,r16,64-(PGDIR_SHIFT-3),64-PGD_INDEX_SIZE-3
-	clrrdi	r10,r11,3
-	ldx	r15,r10,r15
-	cmpdi	cr0,r15,0
-	bge	htw_tlb_miss_fault
-
-	/* Get to PUD entry */
-	rldicl	r11,r16,64-(PUD_SHIFT-3),64-PUD_INDEX_SIZE-3
-	clrrdi	r10,r11,3
-	ldx	r15,r10,r15
-	cmpdi	cr0,r15,0
-	bge	htw_tlb_miss_fault
-
-	/* Get to PMD entry */
-	rldicl	r11,r16,64-(PMD_SHIFT-3),64-PMD_INDEX_SIZE-3
-	clrrdi	r10,r11,3
-	ldx	r15,r10,r15
-	cmpdi	cr0,r15,0
-	bge	htw_tlb_miss_fault
-
-	/* Ok, we're all right, we can now create an indirect entry for
-	 * a 1M or 256M page.
-	 *
-	 * The last trick is now that because we use "half" pages for
-	 * the HTW (1M IND is 2K and 256M IND is 32K) we need to account
-	 * for an added LSB bit to the RPN. For 64K pages, there is no
-	 * problem as we already use 32K arrays (half PTE pages), but for
-	 * 4K page we need to extract a bit from the virtual address and
-	 * insert it into the "PA52" bit of the RPN.
-	 */
-	rlwimi	r15,r16,32-9,20,20
-	/* Now we build the MAS:
-	 *
-	 * MAS 0   :	Fully setup with defaults in MAS4 and TLBnCFG
-	 * MAS 1   :	Almost fully setup
-	 *               - PID already updated by caller if necessary
-	 *               - TSIZE for now is base ind page size always
-	 * MAS 2   :	Use defaults
-	 * MAS 3+7 :	Needs to be done
-	 */
-	ori	r10,r15,(BOOK3E_PAGESZ_4K << MAS3_SPSIZE_SHIFT)
-
-	srdi	r16,r10,32
-	mtspr	SPRN_MAS3,r10
-	mtspr	SPRN_MAS7,r16
-
-	tlbwe
-
-htw_tlb_miss_done:
-	/* We don't bother with restoring DEAR or ESR since we know we are
-	 * level 0 and just going back to userland. They are only needed
-	 * if you are going to take an access fault
-	 */
-	TLB_MISS_EPILOG_SUCCESS
-	rfi
-
-htw_tlb_miss_fault:
-	/* We need to check if it was an instruction miss. We know this
-	 * though because r14 would contain -1
-	 */
-	cmpdi	cr0,r14,-1
-	beq	1f
-	mtspr	SPRN_DEAR,r16
-	mtspr	SPRN_ESR,r14
-	TLB_MISS_EPILOG_ERROR
-	b	exc_data_storage_book3e
-1:	TLB_MISS_EPILOG_ERROR
-	b	exc_instruction_storage_book3e
-
 /*
  * This is the guts of "any" level TLB miss handler for kernel linear
  * mapping misses. We are entered with:
-- 
2.44.0



