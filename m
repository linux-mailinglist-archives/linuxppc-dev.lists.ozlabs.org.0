Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6ED8CE1AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 09:42:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FNtKR7aq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vlxdt5N3Tz88rM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 17:35:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FNtKR7aq;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlxYt0gKQz87Yd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 17:31:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716535906;
	bh=e3NLwcwe4qyeTGgyXXQKdVkkNQCupTkB6t1JEctq4YM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FNtKR7aqzetknCipldKo22AbMjSTFnKLW5IaHYoXJc36mYAYLryTet6/qw4zk2Qx3
	 1owxpTwy/SXR6cX7zLMHPRaksa9Wsxuyemzw5azTbY2jLWTv7oFDIfmY035uB1lO5F
	 NaasfwkPVrQw66p3+Hb6hgNku/iX/IUtJc+wKLBA4BjoJHGB92xI7x1rsJecOO8c3B
	 mtLL9YoDEDE7CYHHf5tDRIylEb+zZGY6Xyun9Uv1FfLlJWgd4//OUcU/qoGCTIV0Kk
	 Hmp5wU13LEp8Dy/tVp6SgAEeBNK5vtgJR13Tv/tLhXcog7WbCelkb2AiKjGB/QYge2
	 VbJBo3megTDkA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VlxYt1Xznz4wp3;
	Fri, 24 May 2024 17:31:46 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 5/6] powerpc/64e: Consolidate TLB miss handler patching
Date: Fri, 24 May 2024 17:31:40 +1000
Message-ID: <20240524073141.1637736-5-mpe@ellerman.id.au>
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

The 64e TLB miss handler patching is done in setup_mmu_htw(), and then
again immediately afterward in early_init_mmu_global(). Consolidate it
into a single location.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/mm/nohash/tlb_64e.c | 38 +++++++++++++-------------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/mm/nohash/tlb_64e.c b/arch/powerpc/mm/nohash/tlb_64e.c
index 21c4b2442fcf..d83ecf466929 100644
--- a/arch/powerpc/mm/nohash/tlb_64e.c
+++ b/arch/powerpc/mm/nohash/tlb_64e.c
@@ -169,24 +169,6 @@ static void __init setup_page_sizes(void)
 	}
 }
 
-static void __init setup_mmu_htw(void)
-{
-	/*
-	 * If we want to use HW tablewalk, enable it by patching the TLB miss
-	 * handlers to branch to the one dedicated to it.
-	 */
-
-	switch (book3e_htw_mode) {
-	case PPC_HTW_E6500:
-		extlb_level_exc = EX_TLB_SIZE;
-		patch_exception(0x1c0, exc_data_tlb_miss_e6500_book3e);
-		patch_exception(0x1e0, exc_instruction_tlb_miss_e6500_book3e);
-		break;
-	}
-	pr_info("MMU: Book3E HW tablewalk %s\n",
-		book3e_htw_mode != PPC_HTW_NONE ? "enabled" : "not supported");
-}
-
 /*
  * Early initialization of the MMU TLB code
  */
@@ -252,15 +234,25 @@ static void __init early_init_mmu_global(void)
 	/* Look for supported page sizes */
 	setup_page_sizes();
 
-	/* Look for HW tablewalk support */
-	setup_mmu_htw();
-
-	if (book3e_htw_mode == PPC_HTW_NONE) {
-		extlb_level_exc = EX_TLB_SIZE;
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
+	case PPC_HTW_NONE:
 		patch_exception(0x1c0, exc_data_tlb_miss_bolted_book3e);
 		patch_exception(0x1e0, exc_instruction_tlb_miss_bolted_book3e);
+		break;
 	}
 
+	pr_info("MMU: Book3E HW tablewalk %s\n",
+		book3e_htw_mode != PPC_HTW_NONE ? "enabled" : "not supported");
+
 	/* Set the global containing the top of the linear mapping
 	 * for use by the TLB miss code
 	 */
-- 
2.45.1

