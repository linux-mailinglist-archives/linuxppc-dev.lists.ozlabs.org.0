Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F60C9770B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 12:22:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46D3cQ1XkLzDqWX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 20:21:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="us8KRV1p"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D3ZD6r3gzDqVS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 20:20:04 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46D3Z72hmWz9v00g;
 Wed, 21 Aug 2019 12:19:59 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=us8KRV1p; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id G1E9CU2g0wqj; Wed, 21 Aug 2019 12:19:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46D3Z71dJkz9v00d;
 Wed, 21 Aug 2019 12:19:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566382799; bh=xDYhhs3T9MhvJ3o+CKz0QaKc20kGSLf+G3rlFys1FoQ=;
 h=From:Subject:To:Cc:Date:From;
 b=us8KRV1pvST1w+Htunph9jmY90A1n/bbYI9xELv1WHYl75d7+vlKbszLQTpDaRNIs
 JrJ/oBu6iu/Hr6WSBhgwUqZ75qTSbupfoN/iFRFs6u6JMZzOLZYpWpYPvcNgd+G1eR
 sl2TPZxAtnfL8hjx+ge2w/Bks9+ZcXzgovcSrrmw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 27B968B7E2;
 Wed, 21 Aug 2019 12:20:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7YsohuUVL4fM; Wed, 21 Aug 2019 12:20:01 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 061528B7E0;
 Wed, 21 Aug 2019 12:20:01 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 080166B73E; Wed, 21 Aug 2019 10:20:00 +0000 (UTC)
Message-Id: <9f33f44b9cd741c4a02b3dce7b8ef9438fe2cd2a.1566382750.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 1/2] powerpc/mm: Add a helper to select PAGE_KERNEL_RO or
 PAGE_READONLY
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 21 Aug 2019 10:20:00 +0000 (UTC)
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

In a couple of places there is a need to select whether read-only
protection of shadow pages is performed with PAGE_KERNEL_RO or with
PAGE_READONLY.

Add a helper to avoid duplicating the choice.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: stable@vger.kernel.org

---
This small series applies on top of patch "powerpc/kasan: fix parallele
loading of modules" (https://patchwork.ozlabs.org/patch/1144757/).
Otherwise a manual merge has to be done (the modifications are
independant but close to each other in the file.)
---
 arch/powerpc/mm/kasan/kasan_init_32.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index 802387b231ad..e8ab3cc5f6e4 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -12,6 +12,14 @@
 #include <asm/code-patching.h>
 #include <mm/mmu_decl.h>
 
+static pgprot_t kasan_prot_ro(void)
+{
+	if (early_mmu_has_feature(MMU_FTR_HPTE_TABLE))
+		return PAGE_READONLY;
+
+	return PAGE_KERNEL_RO;
+}
+
 static void kasan_populate_pte(pte_t *ptep, pgprot_t prot)
 {
 	unsigned long va = (unsigned long)kasan_early_shadow_page;
@@ -26,6 +34,7 @@ static int __ref kasan_init_shadow_page_tables(unsigned long k_start, unsigned l
 {
 	pmd_t *pmd;
 	unsigned long k_cur, k_next;
+	pgprot_t prot = kasan_prot_ro();
 
 	pmd = pmd_offset(pud_offset(pgd_offset_k(k_start), k_start), k_start);
 
@@ -43,10 +52,7 @@ static int __ref kasan_init_shadow_page_tables(unsigned long k_start, unsigned l
 
 		if (!new)
 			return -ENOMEM;
-		if (early_mmu_has_feature(MMU_FTR_HPTE_TABLE))
-			kasan_populate_pte(new, PAGE_READONLY);
-		else
-			kasan_populate_pte(new, PAGE_KERNEL_RO);
+		kasan_populate_pte(new, prot);
 
 		smp_wmb(); /* See comment in __pte_alloc */
 
@@ -103,10 +109,9 @@ static int __ref kasan_init_region(void *start, size_t size)
 
 static void __init kasan_remap_early_shadow_ro(void)
 {
-	if (early_mmu_has_feature(MMU_FTR_HPTE_TABLE))
-		kasan_populate_pte(kasan_early_shadow_pte, PAGE_READONLY);
-	else
-		kasan_populate_pte(kasan_early_shadow_pte, PAGE_KERNEL_RO);
+	pgprot_t prot = kasan_prot_ro();
+
+	kasan_populate_pte(kasan_early_shadow_pte, prot);
 
 	flush_tlb_kernel_range(KASAN_SHADOW_START, KASAN_SHADOW_END);
 }
-- 
2.13.3

