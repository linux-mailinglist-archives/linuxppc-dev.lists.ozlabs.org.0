Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 113804617E1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 15:20:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2nZD07K7z3cl4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 01:20:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2nYM4dHMz2xKT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 01:19:51 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J2nYC05KBz9sSg;
 Mon, 29 Nov 2021 15:19:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qnXv8bfMgao4; Mon, 29 Nov 2021 15:19:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J2nY408G2z9sSh;
 Mon, 29 Nov 2021 15:19:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E8BB88B763;
 Mon, 29 Nov 2021 15:19:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id C4ve4NBqXP7A; Mon, 29 Nov 2021 15:19:35 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 92F278B7AA;
 Mon, 29 Nov 2021 15:19:35 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1ATEJRqi959548
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 15:19:28 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1ATEJR0t959547;
 Mon, 29 Nov 2021 15:19:27 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, alex@ghiti.fr
Subject: [PATCH v3 01/10] powerpc/mm: Make slice specific to book3s/64
Date: Mon, 29 Nov 2021 15:19:15 +0100
Message-Id: <1fa5cf0888b27d6229771a9c4767753f654b4b39.1638195388.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1638195388.git.christophe.leroy@csgroup.eu>
References: <cover.1638195388.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1638195562; l=3818; s=20211009;
 h=from:subject:message-id; bh=C643iyxZKWZyqkmJqRwDOIshEmeVaDYpF3rzIQW8MwI=;
 b=vhNsssc9Mxwl5yZ3ioVfuRFkGf32WWssnly+KE67NMuy8nejYdad49eKPxCtK9O7tuYxJSV74sOL
 nOI3P1c0Bqx08aulkKJX1cJXbjIp83TNNtBCGrHtQ5sjcxjDh1LW
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

Since commit 555904d07eef ("powerpc/8xx: MM_SLICE is not needed
anymore") only book3s/64 selects CONFIG_PPC_MM_SLICES.

Move slice.c into mm/book3s64/

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Remove now unnecessary #ifdef CONFIG_PPC_BOOK3S_64 in slice.c
---
 arch/powerpc/mm/Makefile               | 1 -
 arch/powerpc/mm/book3s64/Makefile      | 1 +
 arch/powerpc/mm/{ => book3s64}/slice.c | 2 --
 arch/powerpc/mm/nohash/mmu_context.c   | 9 ---------
 arch/powerpc/mm/nohash/tlb.c           | 4 ----
 5 files changed, 1 insertion(+), 16 deletions(-)
 rename arch/powerpc/mm/{ => book3s64}/slice.c (99%)

diff --git a/arch/powerpc/mm/Makefile b/arch/powerpc/mm/Makefile
index df8172da2301..d4c20484dad9 100644
--- a/arch/powerpc/mm/Makefile
+++ b/arch/powerpc/mm/Makefile
@@ -14,7 +14,6 @@ obj-$(CONFIG_PPC_MMU_NOHASH)	+= nohash/
 obj-$(CONFIG_PPC_BOOK3S_32)	+= book3s32/
 obj-$(CONFIG_PPC_BOOK3S_64)	+= book3s64/
 obj-$(CONFIG_NUMA) += numa.o
-obj-$(CONFIG_PPC_MM_SLICES)	+= slice.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_NOT_COHERENT_CACHE) += dma-noncoherent.o
 obj-$(CONFIG_PPC_COPRO_BASE)	+= copro_fault.o
diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
index 2d50cac499c5..af2f3e75d458 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_hugetlbpage.o
 endif
 obj-$(CONFIG_SPAPR_TCE_IOMMU)	+= iommu_api.o
 obj-$(CONFIG_PPC_PKEY)	+= pkeys.o
+obj-$(CONFIG_PPC_MM_SLICES)	+= slice.o
 
 # Instrumenting the SLB fault path can lead to duplicate SLB entries
 KCOV_INSTRUMENT_slb.o := n
diff --git a/arch/powerpc/mm/slice.c b/arch/powerpc/mm/book3s64/slice.c
similarity index 99%
rename from arch/powerpc/mm/slice.c
rename to arch/powerpc/mm/book3s64/slice.c
index 82b45b1cb973..c83be371c6e7 100644
--- a/arch/powerpc/mm/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -712,7 +712,6 @@ void slice_init_new_context_exec(struct mm_struct *mm)
 		bitmap_fill(mask->high_slices, SLICE_NUM_HIGH);
 }
 
-#ifdef CONFIG_PPC_BOOK3S_64
 void slice_setup_new_exec(void)
 {
 	struct mm_struct *mm = current->mm;
@@ -724,7 +723,6 @@ void slice_setup_new_exec(void)
 
 	mm_ctx_set_slb_addr_limit(&mm->context, DEFAULT_MAP_WINDOW);
 }
-#endif
 
 void slice_set_range_psize(struct mm_struct *mm, unsigned long start,
 			   unsigned long len, unsigned int psize)
diff --git a/arch/powerpc/mm/nohash/mmu_context.c b/arch/powerpc/mm/nohash/mmu_context.c
index 44b2b5e7cabe..dc3528e815b9 100644
--- a/arch/powerpc/mm/nohash/mmu_context.c
+++ b/arch/powerpc/mm/nohash/mmu_context.c
@@ -313,15 +313,6 @@ void switch_mmu_context(struct mm_struct *prev, struct mm_struct *next,
  */
 int init_new_context(struct task_struct *t, struct mm_struct *mm)
 {
-	/*
-	 * We have MMU_NO_CONTEXT set to be ~0. Hence check
-	 * explicitly against context.id == 0. This ensures that we properly
-	 * initialize context slice details for newly allocated mm's (which will
-	 * have id == 0) and don't alter context slice inherited via fork (which
-	 * will have id != 0).
-	 */
-	if (mm->context.id == 0)
-		slice_init_new_context_exec(mm);
 	mm->context.id = MMU_NO_CONTEXT;
 	mm->context.active = 0;
 	pte_frag_set(&mm->context, NULL);
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 311281063d48..3359cf7c2a61 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -773,9 +773,5 @@ void __init early_init_mmu(void)
 #ifdef CONFIG_PPC_47x
 	early_init_mmu_47x();
 #endif
-
-#ifdef CONFIG_PPC_MM_SLICES
-	mm_ctx_set_slb_addr_limit(&init_mm.context, SLB_ADDR_LIMIT_DEFAULT);
-#endif
 }
 #endif /* CONFIG_PPC64 */
-- 
2.33.1

