Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id DB1008CE1AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 09:41:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QHr8QTnS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlxcL1D72z88Q2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 17:33:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QHr8QTnS;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlxYs0dt8z87Y2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 17:31:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716535905;
	bh=lUzzapvQRBHqU/JK5XA2vKVp/647ZCbivOiZaJhp0iU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QHr8QTnSNXQit5rj4WVwFdTv6u3y88I1HusGaHnosia2bdccNYSvG1k0DrPFZoBSL
	 KjVaYPPEF6g1X/EocjL+5tVqtSltYd5L/jnPxR/J/jnSrmBOZoBItgOJoiuK+X2J4f
	 HXU3/lY+9IP0yxW6F5kJT/Ci0nF/54wE8ocXyz9dKkzlKJOB/WXFfQF3e9pM25MwEX
	 irgtYgyDKnLIqfGoBEeamw8xUjr8235zQCnRR5N5FShVSf4T3XlXkoY3g6Vr4qSmOV
	 pLnghdRr4PJl7k9SqbmnEAzwSvOJtJbxI79rNgBrtF/5ERxYjJNY8O1vT8zUOIJ6qH
	 TtofM2llKNOhg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VlxYs1SPwz4wcq;
	Fri, 24 May 2024 17:31:45 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/6] powerpc/64e: Drop E500 ifdefs in 64-bit code
Date: Fri, 24 May 2024 17:31:38 +1000
Message-ID: <20240524073141.1637736-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524073141.1637736-1-mpe@ellerman.id.au>
References: <20240524073141.1637736-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All 64-bit Book3E have E500=y, so drop the unneeded ifdefs.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/nohash/tlb_64e.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/powerpc/mm/nohash/tlb_64e.c b/arch/powerpc/mm/nohash/tlb_64e.c
index 7d5506d23eab..9db85ee9ba5b 100644
--- a/arch/powerpc/mm/nohash/tlb_64e.c
+++ b/arch/powerpc/mm/nohash/tlb_64e.c
@@ -85,7 +85,6 @@ static void __init setup_page_sizes(void)
 	unsigned int eptcfg;
 	int psize;
 
-#ifdef CONFIG_PPC_E500
 	unsigned int mmucfg = mfspr(SPRN_MMUCFG);
 	int fsl_mmu = mmu_has_feature(MMU_FTR_TYPE_FSL_E);
 
@@ -151,7 +150,6 @@ static void __init setup_page_sizes(void)
 
 		goto out;
 	}
-#endif
 out:
 	/* Cleanup array and print summary */
 	pr_info("MMU: Supported page sizes\n");
@@ -180,13 +178,11 @@ static void __init setup_mmu_htw(void)
 	 */
 
 	switch (book3e_htw_mode) {
-#ifdef CONFIG_PPC_E500
 	case PPC_HTW_E6500:
 		extlb_level_exc = EX_TLB_SIZE;
 		patch_exception(0x1c0, exc_data_tlb_miss_e6500_book3e);
 		patch_exception(0x1e0, exc_instruction_tlb_miss_e6500_book3e);
 		break;
-#endif
 	}
 	pr_info("MMU: Book3E HW tablewalk %s\n",
 		book3e_htw_mode != PPC_HTW_NONE ? "enabled" : "not supported");
@@ -217,7 +213,6 @@ static void early_init_this_mmu(void)
 	}
 	mtspr(SPRN_MAS4, mas4);
 
-#ifdef CONFIG_PPC_E500
 	if (mmu_has_feature(MMU_FTR_TYPE_FSL_E)) {
 		unsigned int num_cams;
 		bool map = true;
@@ -238,7 +233,6 @@ static void early_init_this_mmu(void)
 			linear_map_top = map_mem_in_cams(linear_map_top,
 							 num_cams, false, true);
 	}
-#endif
 
 	/* A sync won't hurt us after mucking around with
 	 * the MMU configuration
@@ -270,7 +264,6 @@ static void __init early_init_mmu_global(void)
 	/* Look for HW tablewalk support */
 	setup_mmu_htw();
 
-#ifdef CONFIG_PPC_E500
 	if (mmu_has_feature(MMU_FTR_TYPE_FSL_E)) {
 		if (book3e_htw_mode == PPC_HTW_NONE) {
 			extlb_level_exc = EX_TLB_SIZE;
@@ -279,7 +272,6 @@ static void __init early_init_mmu_global(void)
 				exc_instruction_tlb_miss_bolted_book3e);
 		}
 	}
-#endif
 
 	/* Set the global containing the top of the linear mapping
 	 * for use by the TLB miss code
@@ -291,7 +283,6 @@ static void __init early_init_mmu_global(void)
 
 static void __init early_mmu_set_memory_limit(void)
 {
-#ifdef CONFIG_PPC_E500
 	if (mmu_has_feature(MMU_FTR_TYPE_FSL_E)) {
 		/*
 		 * Limit memory so we dont have linear faults.
@@ -302,7 +293,6 @@ static void __init early_mmu_set_memory_limit(void)
 		 */
 		memblock_enforce_memory_limit(linear_map_top);
 	}
-#endif
 
 	memblock_set_current_limit(linear_map_top);
 }
@@ -340,7 +330,6 @@ void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 	 * We crop it to the size of the first MEMBLOCK to
 	 * avoid going over total available memory just in case...
 	 */
-#ifdef CONFIG_PPC_E500
 	if (early_mmu_has_feature(MMU_FTR_TYPE_FSL_E)) {
 		unsigned long linear_sz;
 		unsigned int num_cams;
@@ -353,7 +342,6 @@ void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 
 		ppc64_rma_size = min_t(u64, linear_sz, 0x40000000);
 	} else
-#endif
 		ppc64_rma_size = min_t(u64, first_memblock_size, 0x40000000);
 
 	/* Finally limit subsequent allocations */
-- 
2.45.1

