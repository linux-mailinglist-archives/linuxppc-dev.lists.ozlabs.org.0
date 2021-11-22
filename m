Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A706458AE0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 09:52:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyLcm0l4cz3ds8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 19:52:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyLYG0JQVz30Qx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Nov 2021 19:49:22 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HyLXl2nWhz9sSn;
 Mon, 22 Nov 2021 09:48:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ih0I3WktSzN3; Mon, 22 Nov 2021 09:48:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HyLXc1lz9z9sSL;
 Mon, 22 Nov 2021 09:48:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2573C8B778;
 Mon, 22 Nov 2021 09:48:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Fn5pN27teuLv; Mon, 22 Nov 2021 09:48:48 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9E2B28B775;
 Mon, 22 Nov 2021 09:48:47 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1AM8mdxS631716
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 09:48:39 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1AM8mcd9631715;
 Mon, 22 Nov 2021 09:48:38 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, alex@ghiti.fr
Subject: [PATCH 2/8] powerpc/mm: Remove CONFIG_PPC_MM_SLICES
Date: Mon, 22 Nov 2021 09:48:22 +0100
Message-Id: <7d9c279c717ebf4146f750a0cfb640bd7ab05c51.1637570556.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637570556.git.christophe.leroy@csgroup.eu>
References: <cover.1637570556.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1637570905; l=7966; s=20211009;
 h=from:subject:message-id; bh=0AdXUYZ4GBhup/Mkl/7pfeGAGCQVzhXp9Imqvzu5GRo=;
 b=FWDmHBIPA9VRo21BHvV6WtwYNvbbQqyS5xVoejtQbwTiPFE0ywJL7xd0Z4MsInIMrS6A1axbF0v0
 UvkdaFPRAuak7T7NDlHWbt++dlwiagxQR6N0FgvmCCdp0UIwiaWW
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CONFIG_PPC_MM_SLICES is always selected by book3s/64.
CONFIG_PPC_MM_SLICES is never selected by other platforms.

Remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/hash.h |  2 --
 arch/powerpc/include/asm/hugetlb.h        |  2 +-
 arch/powerpc/include/asm/paca.h           |  5 -----
 arch/powerpc/include/asm/slice.h          | 13 ++-----------
 arch/powerpc/kernel/paca.c                |  5 -----
 arch/powerpc/mm/book3s64/Makefile         |  3 +--
 arch/powerpc/mm/book3s64/hash_utils.c     | 14 --------------
 arch/powerpc/mm/hugetlbpage.c             |  4 ++--
 arch/powerpc/platforms/Kconfig.cputype    |  4 ----
 9 files changed, 6 insertions(+), 46 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
index 674fe0e890dc..25f8e90985eb 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -99,10 +99,8 @@
  * Defines the address of the vmemap area, in its own region on
  * hash table CPUs.
  */
-#ifdef CONFIG_PPC_MM_SLICES
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
-#endif /* CONFIG_PPC_MM_SLICES */
 
 /* PTEIDX nibble */
 #define _PTEIDX_SECONDARY	0x8
diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index f18c543bc01d..83f067d4d2f3 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -24,7 +24,7 @@ static inline int is_hugepage_only_range(struct mm_struct *mm,
 					 unsigned long addr,
 					 unsigned long len)
 {
-	if (IS_ENABLED(CONFIG_PPC_MM_SLICES) && !radix_enabled())
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !radix_enabled())
 		return slice_is_hugepage_only_range(mm, addr, len);
 	return 0;
 }
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index dc05a862e72a..20bef2e8533b 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -149,13 +149,8 @@ struct paca_struct {
 #endif /* CONFIG_PPC_BOOK3E */
 
 #ifdef CONFIG_PPC_BOOK3S
-#ifdef CONFIG_PPC_MM_SLICES
 	unsigned char mm_ctx_low_slices_psize[BITS_PER_LONG / BITS_PER_BYTE];
 	unsigned char mm_ctx_high_slices_psize[SLICE_ARRAY_SIZE];
-#else
-	u16 mm_ctx_user_psize;
-	u16 mm_ctx_sllp;
-#endif
 #endif
 
 	/*
diff --git a/arch/powerpc/include/asm/slice.h b/arch/powerpc/include/asm/slice.h
index 0bdd9c62eca0..be4acc52e8ec 100644
--- a/arch/powerpc/include/asm/slice.h
+++ b/arch/powerpc/include/asm/slice.h
@@ -10,7 +10,7 @@
 
 struct mm_struct;
 
-#ifdef CONFIG_PPC_MM_SLICES
+#ifdef CONFIG_PPC_BOOK3S_64
 
 #ifdef CONFIG_HUGETLB_PAGE
 #define HAVE_ARCH_HUGETLB_UNMAPPED_AREA
@@ -30,16 +30,7 @@ void slice_set_range_psize(struct mm_struct *mm, unsigned long start,
 void slice_init_new_context_exec(struct mm_struct *mm);
 void slice_setup_new_exec(void);
 
-#else /* CONFIG_PPC_MM_SLICES */
-
-static inline void slice_init_new_context_exec(struct mm_struct *mm) {}
-
-static inline unsigned int get_slice_psize(struct mm_struct *mm, unsigned long addr)
-{
-	return 0;
-}
-
-#endif /* CONFIG_PPC_MM_SLICES */
+#endif /* CONFIG_PPC_BOOK3S_64 */
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index 4208b4044d12..a61f6fdcfb00 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -346,16 +346,11 @@ void copy_mm_to_paca(struct mm_struct *mm)
 #ifdef CONFIG_PPC_BOOK3S
 	mm_context_t *context = &mm->context;
 
-#ifdef CONFIG_PPC_MM_SLICES
 	VM_BUG_ON(!mm_ctx_slb_addr_limit(context));
 	memcpy(&get_paca()->mm_ctx_low_slices_psize, mm_ctx_low_slices(context),
 	       LOW_SLICE_ARRAY_SZ);
 	memcpy(&get_paca()->mm_ctx_high_slices_psize, mm_ctx_high_slices(context),
 	       TASK_SLICE_ARRAY_SZ(context));
-#else /* CONFIG_PPC_MM_SLICES */
-	get_paca()->mm_ctx_user_psize = context->user_psize;
-	get_paca()->mm_ctx_sllp = context->sllp;
-#endif
 #else /* !CONFIG_PPC_BOOK3S */
 	return;
 #endif
diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
index 30951668c684..f8562c79c59f 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -4,7 +4,7 @@ ccflags-y	:= $(NO_MINIMAL_TOC)
 
 CFLAGS_REMOVE_slb.o = $(CC_FLAGS_FTRACE)
 
-obj-y				+= hash_pgtable.o hash_utils.o slb.o \
+obj-y				+= hash_pgtable.o hash_utils.o slb.o slice.o \
 				   mmu_context.o pgtable.o hash_tlb.o
 obj-$(CONFIG_PPC_NATIVE)	+= hash_native.o
 obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_pgtable.o radix_tlb.o
@@ -18,7 +18,6 @@ obj-$(CONFIG_TRANSPARENT_HUGEPAGE) += hash_hugepage.o
 obj-$(CONFIG_PPC_SUBPAGE_PROT)	+= subpage_prot.o
 obj-$(CONFIG_SPAPR_TCE_IOMMU)	+= iommu_api.o
 obj-$(CONFIG_PPC_PKEY)	+= pkeys.o
-obj-$(CONFIG_PPC_MM_SLICES)	+= slice.o
 
 # Instrumenting the SLB fault path can lead to duplicate SLB entries
 KCOV_INSTRUMENT_slb.o := n
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index cfd45245d009..1d09d4aeddbf 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1165,7 +1165,6 @@ unsigned int hash_page_do_lazy_icache(unsigned int pp, pte_t pte, int trap)
 	return pp;
 }
 
-#ifdef CONFIG_PPC_MM_SLICES
 static unsigned int get_paca_psize(unsigned long addr)
 {
 	unsigned char *psizes;
@@ -1182,12 +1181,6 @@ static unsigned int get_paca_psize(unsigned long addr)
 	return (psizes[index >> 1] >> (mask_index * 4)) & 0xF;
 }
 
-#else
-unsigned int get_paca_psize(unsigned long addr)
-{
-	return get_paca()->mm_ctx_user_psize;
-}
-#endif
 
 /*
  * Demote a segment to using 4k pages.
@@ -1611,7 +1604,6 @@ DEFINE_INTERRUPT_HANDLER_RAW(do_hash_fault)
 	return 0;
 }
 
-#ifdef CONFIG_PPC_MM_SLICES
 static bool should_hash_preload(struct mm_struct *mm, unsigned long ea)
 {
 	int psize = get_slice_psize(mm, ea);
@@ -1628,12 +1620,6 @@ static bool should_hash_preload(struct mm_struct *mm, unsigned long ea)
 
 	return true;
 }
-#else
-static bool should_hash_preload(struct mm_struct *mm, unsigned long ea)
-{
-	return true;
-}
-#endif
 
 static void hash_preload(struct mm_struct *mm, pte_t *ptep, unsigned long ea,
 			 bool is_exec, unsigned long trap)
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 82d8b368ca6d..10c3b2b8e9d8 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -542,7 +542,7 @@ struct page *follow_huge_pd(struct vm_area_struct *vma,
 	return page;
 }
 
-#ifdef CONFIG_PPC_MM_SLICES
+#ifdef CONFIG_PPC_BOOK3S_64
 unsigned long hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 					unsigned long len, unsigned long pgoff,
 					unsigned long flags)
@@ -562,7 +562,7 @@ unsigned long hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
 {
 	/* With radix we don't use slice, so derive it from vma*/
-	if (IS_ENABLED(CONFIG_PPC_MM_SLICES) && !radix_enabled()) {
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !radix_enabled()) {
 		unsigned int psize = get_slice_psize(vma->vm_mm, vma->vm_start);
 
 		return 1UL << mmu_psize_to_shift(psize);
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index a208997ade88..580339c0c5bc 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -105,7 +105,6 @@ config PPC_BOOK3S_64
 	select HAVE_MOVE_PMD
 	select HAVE_MOVE_PUD
 	select IRQ_WORK
-	select PPC_MM_SLICES
 	select PPC_HAVE_KUEP
 	select PPC_HAVE_KUAP
 
@@ -432,9 +431,6 @@ config PPC_BOOK3E_MMU
 	def_bool y
 	depends on FSL_BOOKE || PPC_BOOK3E
 
-config PPC_MM_SLICES
-	bool
-
 config PPC_HAVE_PMU_SUPPORT
 	bool
 
-- 
2.33.1

