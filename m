Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B19519150AD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 16:47:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W79mr26Ttz3g4Y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2024 00:47:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W79l33mylz3dLh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2024 00:46:23 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4W79kg0xhbz9vF1;
	Mon, 24 Jun 2024 16:46:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8GGeSU0PQGmk; Mon, 24 Jun 2024 16:46:03 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4W79kc6R90z9vDw;
	Mon, 24 Jun 2024 16:46:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D89758B768;
	Mon, 24 Jun 2024 16:46:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id wCEZkRupK3zt; Mon, 24 Jun 2024 16:46:00 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.33])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 50C608B763;
	Mon, 24 Jun 2024 16:46:00 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v6 04/23] powerpc/64e: Drop MMU_FTR_TYPE_FSL_E checks in 64-bit code
Date: Mon, 24 Jun 2024 16:45:30 +0200
Message-ID: <1b82eb3216cc6586ddb018303e1038fddc2775b6.1719240269.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1719240269.git.christophe.leroy@csgroup.eu>
References: <cover.1719240269.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719240333; l=7160; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=AHd2YOhqPsn0mmn3bUFrvBRmVpZgpV/7pvx5aQBWlRU=; b=yXqY1lJuXSLGmqvFYww+onwRxJ2Ff6HNWVnGJemuq+uEou2udUl4JpX3v/PWekIuDO9rJYJh5 gBGTGNTE18+D64VNKQwun4n0MFSGmMI1NkluengPubmBDCTplBr4j3B
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

All 64-bit Book3E have MMU_FTR_TYPE_FSL_E, since A2 was removed, so
remove checks for it in 64-bit only code.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/setup_64.c   |  6 +-
 arch/powerpc/mm/nohash/tlb_64e.c | 97 ++++++++++++--------------------
 2 files changed, 38 insertions(+), 65 deletions(-)

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
diff --git a/arch/powerpc/mm/nohash/tlb_64e.c b/arch/powerpc/mm/nohash/tlb_64e.c
index 9db85ee9ba5b..21c4b2442fcf 100644
--- a/arch/powerpc/mm/nohash/tlb_64e.c
+++ b/arch/powerpc/mm/nohash/tlb_64e.c
@@ -86,9 +86,8 @@ static void __init setup_page_sizes(void)
 	int psize;
 
 	unsigned int mmucfg = mfspr(SPRN_MMUCFG);
-	int fsl_mmu = mmu_has_feature(MMU_FTR_TYPE_FSL_E);
 
-	if (fsl_mmu && (mmucfg & MMUCFG_MAVN) == MMUCFG_MAVN_V1) {
+	if ((mmucfg & MMUCFG_MAVN) == MMUCFG_MAVN_V1) {
 		unsigned int tlb1cfg = mfspr(SPRN_TLB1CFG);
 		unsigned int min_pg, max_pg;
 
@@ -115,7 +114,7 @@ static void __init setup_page_sizes(void)
 		goto out;
 	}
 
-	if (fsl_mmu && (mmucfg & MMUCFG_MAVN) == MMUCFG_MAVN_V2) {
+	if ((mmucfg & MMUCFG_MAVN) == MMUCFG_MAVN_V2) {
 		u32 tlb1cfg, tlb1ps;
 
 		tlb0cfg = mfspr(SPRN_TLB0CFG);
@@ -213,26 +212,24 @@ static void early_init_this_mmu(void)
 	}
 	mtspr(SPRN_MAS4, mas4);
 
-	if (mmu_has_feature(MMU_FTR_TYPE_FSL_E)) {
-		unsigned int num_cams;
-		bool map = true;
+	unsigned int num_cams;
+	bool map = true;
 
-		/* use a quarter of the TLBCAM for bolted linear map */
-		num_cams = (mfspr(SPRN_TLB1CFG) & TLBnCFG_N_ENTRY) / 4;
+	/* use a quarter of the TLBCAM for bolted linear map */
+	num_cams = (mfspr(SPRN_TLB1CFG) & TLBnCFG_N_ENTRY) / 4;
 
-		/*
-		 * Only do the mapping once per core, or else the
-		 * transient mapping would cause problems.
-		 */
+	/*
+	 * Only do the mapping once per core, or else the
+	 * transient mapping would cause problems.
+	 */
 #ifdef CONFIG_SMP
-		if (hweight32(get_tensr()) > 1)
-			map = false;
+	if (hweight32(get_tensr()) > 1)
+		map = false;
 #endif
 
-		if (map)
-			linear_map_top = map_mem_in_cams(linear_map_top,
-							 num_cams, false, true);
-	}
+	if (map)
+		linear_map_top = map_mem_in_cams(linear_map_top,
+						 num_cams, false, true);
 
 	/* A sync won't hurt us after mucking around with
 	 * the MMU configuration
@@ -242,16 +239,10 @@ static void early_init_this_mmu(void)
 
 static void __init early_init_mmu_global(void)
 {
-	/* XXX This should be decided at runtime based on supported
-	 * page sizes in the TLB, but for now let's assume 16M is
-	 * always there and a good fit (which it probably is)
-	 *
+	/*
 	 * Freescale booke only supports 4K pages in TLB0, so use that.
 	 */
-	if (mmu_has_feature(MMU_FTR_TYPE_FSL_E))
-		mmu_vmemmap_psize = MMU_PAGE_4K;
-	else
-		mmu_vmemmap_psize = MMU_PAGE_16M;
+	mmu_vmemmap_psize = MMU_PAGE_4K;
 
 	/* XXX This code only checks for TLB 0 capabilities and doesn't
 	 *     check what page size combos are supported by the HW. It
@@ -264,13 +255,10 @@ static void __init early_init_mmu_global(void)
 	/* Look for HW tablewalk support */
 	setup_mmu_htw();
 
-	if (mmu_has_feature(MMU_FTR_TYPE_FSL_E)) {
-		if (book3e_htw_mode == PPC_HTW_NONE) {
-			extlb_level_exc = EX_TLB_SIZE;
-			patch_exception(0x1c0, exc_data_tlb_miss_bolted_book3e);
-			patch_exception(0x1e0,
-				exc_instruction_tlb_miss_bolted_book3e);
-		}
+	if (book3e_htw_mode == PPC_HTW_NONE) {
+		extlb_level_exc = EX_TLB_SIZE;
+		patch_exception(0x1c0, exc_data_tlb_miss_bolted_book3e);
+		patch_exception(0x1e0, exc_instruction_tlb_miss_bolted_book3e);
 	}
 
 	/* Set the global containing the top of the linear mapping
@@ -283,16 +271,14 @@ static void __init early_init_mmu_global(void)
 
 static void __init early_mmu_set_memory_limit(void)
 {
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
+	/*
+	 * Limit memory so we dont have linear faults.
+	 * Unlike memblock_set_current_limit, which limits
+	 * memory available during early boot, this permanently
+	 * reduces the memory available to Linux.  We need to
+	 * do this because highmem is not supported on 64-bit.
+	 */
+	memblock_enforce_memory_limit(linear_map_top);
 
 	memblock_set_current_limit(linear_map_top);
 }
@@ -313,12 +299,8 @@ void early_init_mmu_secondary(void)
 void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 				phys_addr_t first_memblock_size)
 {
-	/* On non-FSL Embedded 64-bit, we adjust the RMA size to match
-	 * the bolted TLB entry. We know for now that only 1G
-	 * entries are supported though that may eventually
-	 * change.
-	 *
-	 * on FSL Embedded 64-bit, usually all RAM is bolted, but with
+	/*
+	 * On FSL Embedded 64-bit, usually all RAM is bolted, but with
 	 * unusual memory sizes it's possible for some RAM to not be mapped
 	 * (such RAM is not used at all by Linux, since we don't support
 	 * highmem on 64-bit).  We limit ppc64_rma_size to what would be
@@ -330,19 +312,14 @@ void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 	 * We crop it to the size of the first MEMBLOCK to
 	 * avoid going over total available memory just in case...
 	 */
-	if (early_mmu_has_feature(MMU_FTR_TYPE_FSL_E)) {
-		unsigned long linear_sz;
-		unsigned int num_cams;
-
-		/* use a quarter of the TLBCAM for bolted linear map */
-		num_cams = (mfspr(SPRN_TLB1CFG) & TLBnCFG_N_ENTRY) / 4;
+	unsigned long linear_sz;
+	unsigned int num_cams;
 
-		linear_sz = map_mem_in_cams(first_memblock_size, num_cams,
-					    true, true);
+	/* use a quarter of the TLBCAM for bolted linear map */
+	num_cams = (mfspr(SPRN_TLB1CFG) & TLBnCFG_N_ENTRY) / 4;
 
-		ppc64_rma_size = min_t(u64, linear_sz, 0x40000000);
-	} else
-		ppc64_rma_size = min_t(u64, first_memblock_size, 0x40000000);
+	linear_sz = map_mem_in_cams(first_memblock_size, num_cams, true, true);
+	ppc64_rma_size = min_t(u64, linear_sz, 0x40000000);
 
 	/* Finally limit subsequent allocations */
 	memblock_set_current_limit(first_memblock_base + ppc64_rma_size);
-- 
2.44.0

