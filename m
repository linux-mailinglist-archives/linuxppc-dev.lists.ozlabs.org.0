Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34097164890
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 16:28:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48N1p81cczzDqZp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 02:28:32 +1100 (AEDT)
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
 header.s=mail header.b=fdHtc56h; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48N1m50PXWzDqVB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 02:26:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48N1lv0SrCz9tyQn;
 Wed, 19 Feb 2020 16:26:35 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=fdHtc56h; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jLL-SHKze0rm; Wed, 19 Feb 2020 16:26:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48N1lt58cNz9tyQm;
 Wed, 19 Feb 2020 16:26:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582125994; bh=ANsJXuSKlChP4U6TweIOeXKVKq1C+AyTaodXPsf6gjo=;
 h=From:Subject:To:Cc:Date:From;
 b=fdHtc56hE7xsF0Gd2iEvJerODfV8CbFDWZQInllNwz+HtGQH1drVpJgPaYC4wc9Ac
 oW0reD3L1o04zCu/1Q8TMy4gu1U9ezPTb6i/ugIWT8zdATcUKfipZdcyGoXAANoK2O
 +5WpvIi9VHX23EFvaOEoMv3ClEa1sySld7fFhvmg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E4CF8B858;
 Wed, 19 Feb 2020 16:26:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KHUId65zjbJL; Wed, 19 Feb 2020 16:26:36 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 14B578B856;
 Wed, 19 Feb 2020 16:26:36 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A6EF765326; Wed, 19 Feb 2020 15:26:35 +0000 (UTC)
Message-Id: <f7a1dfea2a4e20e9d19089c86cceb31d00df2b66.1582125960.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/kasan: Fix shadow memory protection with
 CONFIG_KASAN_VMALLOC
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 19 Feb 2020 15:26:35 +0000 (UTC)
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

With CONFIG_KASAN_VMALLOC, new page tables are created at the time
shadow memory for vmalloc area in unmapped. If some parts of the
page table still has entries to the zero page shadow memory, the
entries are wrongly marked RW.

Make sure new page tables are populated with RO entries once
kasan_remap_early_shadow_ro() has run.

Fixes: 3d4247fcc938 ("powerpc/32: Add support of KASAN_VMALLOC")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/kasan/kasan_init_32.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index 16dd95bd0749..b533e7a8319d 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -30,11 +30,13 @@ static void __init kasan_populate_pte(pte_t *ptep, pgprot_t prot)
 		__set_pte_at(&init_mm, va, ptep, pfn_pte(PHYS_PFN(pa), prot), 0);
 }
 
-static int __init kasan_init_shadow_page_tables(unsigned long k_start, unsigned long k_end)
+static int __init
+kasan_init_shadow_page_tables(unsigned long k_start, unsigned long k_end, bool is_late)
 {
 	pmd_t *pmd;
 	unsigned long k_cur, k_next;
 	pte_t *new = NULL;
+	pgprot_t prot = is_late ? kasan_prot_ro() : PAGE_KERNEL;
 
 	pmd = pmd_offset(pud_offset(pgd_offset_k(k_start), k_start), k_start);
 
@@ -48,7 +50,7 @@ static int __init kasan_init_shadow_page_tables(unsigned long k_start, unsigned
 
 		if (!new)
 			return -ENOMEM;
-		kasan_populate_pte(new, PAGE_KERNEL);
+		kasan_populate_pte(new, prot);
 
 		smp_wmb(); /* See comment in __pte_alloc */
 
@@ -71,7 +73,7 @@ static int __init kasan_init_region(void *start, size_t size)
 	int ret;
 	void *block;
 
-	ret = kasan_init_shadow_page_tables(k_start, k_end);
+	ret = kasan_init_shadow_page_tables(k_start, k_end, false);
 	if (ret)
 		return ret;
 
@@ -121,7 +123,7 @@ static void __init kasan_unmap_early_shadow_vmalloc(void)
 	phys_addr_t pa = __pa(kasan_early_shadow_page);
 
 	if (!early_mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
-		int ret = kasan_init_shadow_page_tables(k_start, k_end);
+		int ret = kasan_init_shadow_page_tables(k_start, k_end, true);
 
 		if (ret)
 			panic("kasan: kasan_init_shadow_page_tables() failed");
@@ -144,7 +146,8 @@ void __init kasan_mmu_init(void)
 	struct memblock_region *reg;
 
 	if (early_mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
-		ret = kasan_init_shadow_page_tables(KASAN_SHADOW_START, KASAN_SHADOW_END);
+		ret = kasan_init_shadow_page_tables(KASAN_SHADOW_START, KASAN_SHADOW_END,
+						    false);
 
 		if (ret)
 			panic("kasan: kasan_init_shadow_page_tables() failed");
-- 
2.25.0

