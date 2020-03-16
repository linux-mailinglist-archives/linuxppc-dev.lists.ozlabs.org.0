Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 488C4186BD4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 14:12:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gxXm6XhszDqHr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 00:12:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=CSN883t3; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gwl54VlSzDqLf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 23:36:01 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48gwkq4sSpz9tygT;
 Mon, 16 Mar 2020 13:35:47 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=CSN883t3; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Fc5QqP1ITPzr; Mon, 16 Mar 2020 13:35:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48gwkq3rKgz9tyg5;
 Mon, 16 Mar 2020 13:35:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584362147; bh=XYOdHBpCbWLdf2RVnuSzjw76mAuRmZuvMEgA37zOapw=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=CSN883t3ZVDYvB4xx6Opvz9QFkhmCizuLPXRc+3Rs9r/JdoP9PPXyggvslqpKbP+C
 KdqO8Updn+Ew0Mzy+DIaEkZIe4SvBs7tXyNjQmEM/dibIO3l6KrMRI2yVbsenIjmCo
 Vnai9BKRhmLJSQzlnMdIYjiPFTbYMZFTLfJEWIxM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6600E8B7D2;
 Mon, 16 Mar 2020 13:35:52 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QzkzkZwZq4ol; Mon, 16 Mar 2020 13:35:52 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3294D8B7CB;
 Mon, 16 Mar 2020 13:35:52 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2AAA265595; Mon, 16 Mar 2020 12:35:52 +0000 (UTC)
Message-Id: <ff0a3152180727b02134c065ad31960bdbd2ab0a.1584360344.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1584360343.git.christophe.leroy@c-s.fr>
References: <cover.1584360343.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 07/46] powerpc/kasan: Declare kasan_init_region() weak
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Mar 2020 12:35:52 +0000 (UTC)
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

In order to alloc sub-arches to alloc KASAN regions using optimised
methods (Huge pages on 8xx, BATs on BOOK3S, ...), declare
kasan_init_region() weak.

Also make kasan_init_shadow_page_tables() accessible from outside,
so that it can be called from the specific kasan_init_region()
functions if needed.

And populate remaining KASAN address space only once performed
the region mapping, to allow 8xx to allocate hugepd instead of
standard page tables for mapping via 8M hugepages.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/kasan.h      |  3 +++
 arch/powerpc/mm/kasan/kasan_init_32.c | 21 +++++++++++----------
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
index 4769bbf7173a..107a24c3f7b3 100644
--- a/arch/powerpc/include/asm/kasan.h
+++ b/arch/powerpc/include/asm/kasan.h
@@ -34,5 +34,8 @@ static inline void kasan_init(void) { }
 static inline void kasan_late_init(void) { }
 #endif
 
+int kasan_init_shadow_page_tables(unsigned long k_start, unsigned long k_end);
+int kasan_init_region(void *start, size_t size);
+
 #endif /* __ASSEMBLY */
 #endif
diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index 65fd8b891f8e..03d30ec7a858 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -28,7 +28,7 @@ static void __init kasan_populate_pte(pte_t *ptep, pgprot_t prot)
 		__set_pte_at(&init_mm, va, ptep, pfn_pte(PHYS_PFN(pa), prot), 0);
 }
 
-static int __init kasan_init_shadow_page_tables(unsigned long k_start, unsigned long k_end)
+int __init kasan_init_shadow_page_tables(unsigned long k_start, unsigned long k_end)
 {
 	pmd_t *pmd;
 	unsigned long k_cur, k_next;
@@ -52,7 +52,7 @@ static int __init kasan_init_shadow_page_tables(unsigned long k_start, unsigned
 	return 0;
 }
 
-static int __init kasan_init_region(void *start, size_t size)
+int __init __weak kasan_init_region(void *start, size_t size)
 {
 	unsigned long k_start = (unsigned long)kasan_mem_to_shadow(start);
 	unsigned long k_end = (unsigned long)kasan_mem_to_shadow(start + size);
@@ -122,14 +122,6 @@ static void __init kasan_mmu_init(void)
 	int ret;
 	struct memblock_region *reg;
 
-	if (early_mmu_has_feature(MMU_FTR_HPTE_TABLE) ||
-	    IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
-		ret = kasan_init_shadow_page_tables(KASAN_SHADOW_START, KASAN_SHADOW_END);
-
-		if (ret)
-			panic("kasan: kasan_init_shadow_page_tables() failed");
-	}
-
 	for_each_memblock(memory, reg) {
 		phys_addr_t base = reg->base;
 		phys_addr_t top = min(base + reg->size, total_lowmem);
@@ -141,6 +133,15 @@ static void __init kasan_mmu_init(void)
 		if (ret)
 			panic("kasan: kasan_init_region() failed");
 	}
+
+	if (early_mmu_has_feature(MMU_FTR_HPTE_TABLE) ||
+	    IS_ENABLED(CONFIG_KASAN_VMALLOC)) {
+		ret = kasan_init_shadow_page_tables(KASAN_SHADOW_START, KASAN_SHADOW_END);
+
+		if (ret)
+			panic("kasan: kasan_init_shadow_page_tables() failed");
+	}
+
 }
 
 void __init kasan_init(void)
-- 
2.25.0

