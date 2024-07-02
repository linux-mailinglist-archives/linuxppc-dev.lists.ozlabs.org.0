Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD660923F92
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 15:53:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD4Bp5bbKz3gKR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 23:53:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD48S43v3z3dJM
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 23:51:52 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4WD48240Jwz9v5V;
	Tue,  2 Jul 2024 15:51:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xDCoEvjglLhs; Tue,  2 Jul 2024 15:51:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4WD47z5CPhz9v49;
	Tue,  2 Jul 2024 15:51:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AE8408B764;
	Tue,  2 Jul 2024 15:51:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id NEcuTvm6G5kf; Tue,  2 Jul 2024 15:51:27 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.12])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 38AE58B774;
	Tue,  2 Jul 2024 15:51:27 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v7 05/23] powerpc/64e: Consolidate TLB miss handler patching
Date: Tue,  2 Jul 2024 15:51:17 +0200
Message-ID: <7033b37493fb48a3e5245b59d0a42afb75dabfc1.1719928057.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1719928057.git.christophe.leroy@csgroup.eu>
References: <cover.1719928057.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719928274; l=2333; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=yAiKCEuhEewOEpS5oDWNvn73wPUuV/itXZW+PYTcfsA=; b=TDg00DJl8BMpbdKmH0JPgZA0p/L2BdM0sYrVLzMQBcfw6y8h3qPYgMNYRUjb/jh4PmJE9dAWH QW9L/WqQjhuBNIUq6oDbJDlVXJMprhCOVas0KOxpHwHtq5wt8x/4/ao
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

The 64e TLB miss handler patching is done in setup_mmu_htw(), and then
again immediately afterward in early_init_mmu_global(). Consolidate it
into a single location.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
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
2.44.0

