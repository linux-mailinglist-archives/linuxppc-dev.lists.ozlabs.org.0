Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7270C4D3832
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 18:50:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDKVb2NTvz3c3y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 04:50:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDKP339srz3bgh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 04:45:59 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KDKND34Fqz9sTR;
 Wed,  9 Mar 2022 18:45:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vUE12mIGNtHT; Wed,  9 Mar 2022 18:45:16 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KDKN05rCxz9sTT;
 Wed,  9 Mar 2022 18:45:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AE3F28B763;
 Wed,  9 Mar 2022 18:45:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ebhRHuSMbydx; Wed,  9 Mar 2022 18:45:04 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.27])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D6A968B781;
 Wed,  9 Mar 2022 18:45:02 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 229Hiw7r3619046
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 9 Mar 2022 18:44:58 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 229HiwDs3619045;
 Wed, 9 Mar 2022 18:44:58 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, alex@ghiti.fr
Subject: [PATCH v8 08/14] powerpc/mm: Remove CONFIG_PPC_MM_SLICES
Date: Wed,  9 Mar 2022 18:44:42 +0100
Message-Id: <7d4ed01f5425fcd4083e402fd74052115c5dd843.1646847562.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1646847561.git.christophe.leroy@csgroup.eu>
References: <cover.1646847561.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1646847882; l=7009; s=20211009;
 h=from:subject:message-id; bh=xCZrv1mmpIOWXul1KGoNbcqIe0WAzcWiFaOPQ13u8gQ=;
 b=r1ciVDVEgCjtwxa/9+Yl/xVl1WJPMI5wLQk3HjHHj0LxXeLX+ztXJdKWe6F5ZZktZYPAk1Xit1tH
 kwssDvYpA6pbjAr2nljoLsHMYgUQ2xKoKtwHus8gsJgKhWi9klRD
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
Cc: will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Nicholas Piggin <npiggin@gmail.com>,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CONFIG_PPC_MM_SLICES is always selected by hash book3s/64.
CONFIG_PPC_MM_SLICES is never selected by other platforms.

Remove it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/hugetlb.h     |  2 +-
 arch/powerpc/include/asm/paca.h        |  7 -------
 arch/powerpc/kernel/paca.c             |  5 -----
 arch/powerpc/mm/book3s64/Makefile      |  3 +--
 arch/powerpc/mm/book3s64/hash_utils.c  | 14 --------------
 arch/powerpc/mm/hugetlbpage.c          |  2 +-
 arch/powerpc/mm/mmap.c                 |  4 ++--
 arch/powerpc/platforms/Kconfig.cputype |  4 ----
 8 files changed, 5 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index 6a1a1ac5743b..ef86197d1c0a 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -24,7 +24,7 @@ static inline int is_hugepage_only_range(struct mm_struct *mm,
 					 unsigned long addr,
 					 unsigned long len)
 {
-	if (IS_ENABLED(CONFIG_PPC_MM_SLICES) && !radix_enabled())
+	if (IS_ENABLED(CONFIG_PPC_64S_HASH_MMU) && !radix_enabled())
 		return slice_is_hugepage_only_range(mm, addr, len);
 	return 0;
 }
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 8330968ca346..03330b7d835f 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -152,16 +152,9 @@ struct paca_struct {
 	struct tlb_core_data tcd;
 #endif /* CONFIG_PPC_BOOK3E */
 
-#ifdef CONFIG_PPC_BOOK3S
 #ifdef CONFIG_PPC_64S_HASH_MMU
-#ifdef CONFIG_PPC_MM_SLICES
 	unsigned char mm_ctx_low_slices_psize[BITS_PER_LONG / BITS_PER_BYTE];
 	unsigned char mm_ctx_high_slices_psize[SLICE_ARRAY_SIZE];
-#else
-	u16 mm_ctx_user_psize;
-	u16 mm_ctx_sllp;
-#endif
-#endif
 #endif
 
 	/*
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index 39da688a9455..ba593fd60124 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -344,15 +344,10 @@ void copy_mm_to_paca(struct mm_struct *mm)
 {
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
 }
 #endif /* CONFIG_PPC_64S_HASH_MMU */
diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
index af2f3e75d458..d527dc8e30a8 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -5,7 +5,7 @@ ccflags-y	:= $(NO_MINIMAL_TOC)
 obj-y				+= mmu_context.o pgtable.o trace.o
 ifdef CONFIG_PPC_64S_HASH_MMU
 CFLAGS_REMOVE_slb.o = $(CC_FLAGS_FTRACE)
-obj-y				+= hash_pgtable.o hash_utils.o hash_tlb.o slb.o
+obj-y				+= hash_pgtable.o hash_utils.o hash_tlb.o slb.o slice.o
 obj-$(CONFIG_PPC_HASH_MMU_NATIVE)	+= hash_native.o
 obj-$(CONFIG_PPC_4K_PAGES)	+= hash_4k.o
 obj-$(CONFIG_PPC_64K_PAGES)	+= hash_64k.o
@@ -21,7 +21,6 @@ obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_hugetlbpage.o
 endif
 obj-$(CONFIG_SPAPR_TCE_IOMMU)	+= iommu_api.o
 obj-$(CONFIG_PPC_PKEY)	+= pkeys.o
-obj-$(CONFIG_PPC_MM_SLICES)	+= slice.o
 
 # Instrumenting the SLB fault path can lead to duplicate SLB entries
 KCOV_INSTRUMENT_slb.o := n
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 985cabdd7f67..43ecad8f9564 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1264,7 +1264,6 @@ unsigned int hash_page_do_lazy_icache(unsigned int pp, pte_t pte, int trap)
 	return pp;
 }
 
-#ifdef CONFIG_PPC_MM_SLICES
 static unsigned int get_paca_psize(unsigned long addr)
 {
 	unsigned char *psizes;
@@ -1281,12 +1280,6 @@ static unsigned int get_paca_psize(unsigned long addr)
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
@@ -1680,7 +1673,6 @@ DEFINE_INTERRUPT_HANDLER(do_hash_fault)
 	}
 }
 
-#ifdef CONFIG_PPC_MM_SLICES
 static bool should_hash_preload(struct mm_struct *mm, unsigned long ea)
 {
 	int psize = get_slice_psize(mm, ea);
@@ -1697,12 +1689,6 @@ static bool should_hash_preload(struct mm_struct *mm, unsigned long ea)
 
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
index 7b89f0799d82..f71ac14018e2 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -558,7 +558,7 @@ unsigned long hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 		return radix__hugetlb_get_unmapped_area(file, addr, len,
 						       pgoff, flags);
 #endif
-#ifdef CONFIG_PPC_MM_SLICES
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	return slice_get_unmapped_area(addr, len, flags, file_to_psize(file), 1);
 #endif
 	BUG();
diff --git a/arch/powerpc/mm/mmap.c b/arch/powerpc/mm/mmap.c
index c475cf810aa8..9b0d6e395bc0 100644
--- a/arch/powerpc/mm/mmap.c
+++ b/arch/powerpc/mm/mmap.c
@@ -190,7 +190,7 @@ unsigned long arch_get_unmapped_area(struct file *filp,
 				     unsigned long pgoff,
 				     unsigned long flags)
 {
-#ifdef CONFIG_PPC_MM_SLICES
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	return slice_get_unmapped_area(addr, len, flags,
 				       mm_ctx_user_psize(&current->mm->context), 0);
 #else
@@ -204,7 +204,7 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp,
 					     const unsigned long pgoff,
 					     const unsigned long flags)
 {
-#ifdef CONFIG_PPC_MM_SLICES
+#ifdef CONFIG_PPC_64S_HASH_MMU
 	return slice_get_unmapped_area(addr0, len, flags,
 				       mm_ctx_user_psize(&current->mm->context), 1);
 #else
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index e2e1fec91c6e..9d099dc75e8b 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -377,7 +377,6 @@ config SPE
 config PPC_64S_HASH_MMU
 	bool "Hash MMU Support"
 	depends on PPC_BOOK3S_64
-	select PPC_MM_SLICES
 	default y
 	help
 	  Enable support for the Power ISA Hash style MMU. This is implemented
@@ -451,9 +450,6 @@ config PPC_BOOK3E_MMU
 	def_bool y
 	depends on FSL_BOOKE || PPC_BOOK3E
 
-config PPC_MM_SLICES
-	bool
-
 config PPC_HAVE_PMU_SUPPORT
 	bool
 
-- 
2.34.1

