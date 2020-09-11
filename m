Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52753265893
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 07:07:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnkJk3HybzDqm6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 15:07:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnkH06TMxzDqWJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 15:05:46 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BnkGq5Rzbz9tynY;
 Fri, 11 Sep 2020 07:05:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dI0xBi-CVjY0; Fri, 11 Sep 2020 07:05:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BnkGq2Bbrz9tynX;
 Fri, 11 Sep 2020 07:05:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DBFAF8B832;
 Fri, 11 Sep 2020 07:05:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZU5cwRNYUVST; Fri, 11 Sep 2020 07:05:39 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 413958B75E;
 Fri, 11 Sep 2020 07:05:39 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0D0E265728; Fri, 11 Sep 2020 05:05:38 +0000 (UTC)
Message-Id: <8ae4554357da4882612644a74387ae05525b2aaa.1599800716.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/kasan: Fix CONFIG_KASAN_VMALLOC for 8xx
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 11 Sep 2020 05:05:38 +0000 (UTC)
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

Before the commit identified below, pages tables allocation was
performed after the allocation of final shadow area for linear memory.
But that commit switched the order, leading to page tables being
already allocated at the time 8xx kasan_init_shadow_8M() is called.
Due to this, kasan_init_shadow_8M() doesn't map the needed
shadow entries because there are already page tables.

kasan_init_shadow_8M() installs huge PMD entries instead of page
tables. We could at that time free the page tables, but there is no
point in creating page tables that get freed before being used.

Only book3s/32 hash needs early allocation of page tables. For other
variants, we can keep the initial order and create remaining page
tables after the allocation of final shadow memory for linear mem.

Move back the allocation of shadow page tables for
CONFIG_KASAN_VMALLOC into kasan_init() after the loop which creates
final shadow memory for linear mem.

Fixes: 41ea93cf7ba4 ("powerpc/kasan: Fix shadow pages allocation failure")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/kasan/kasan_init_32.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index fb294046e00e..929716ea21e9 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -127,8 +127,7 @@ void __init kasan_mmu_init(void)
 {
 	int ret;
 
-	if (early_mmu_has_feature(MMU_FTR_HPTE_TABLE) ||
-	    IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
+	if (early_mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
 		ret = kasan_init_shadow_page_tables(KASAN_SHADOW_START, KASAN_SHADOW_END);
 
 		if (ret)
@@ -139,11 +138,11 @@ void __init kasan_mmu_init(void)
 void __init kasan_init(void)
 {
 	struct memblock_region *reg;
+	int ret;
 
 	for_each_memblock(memory, reg) {
 		phys_addr_t base = reg->base;
 		phys_addr_t top = min(base + reg->size, total_lowmem);
-		int ret;
 
 		if (base >= top)
 			continue;
@@ -153,6 +152,13 @@ void __init kasan_init(void)
 			panic("kasan: kasan_init_region() failed");
 	}
 
+	if (IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
+		ret = kasan_init_shadow_page_tables(KASAN_SHADOW_START, KASAN_SHADOW_END);
+
+		if (ret)
+			panic("kasan: kasan_init_shadow_page_tables() failed");
+	}
+
 	kasan_remap_early_shadow_ro();
 
 	clear_page(kasan_early_shadow_page);
-- 
2.25.0

