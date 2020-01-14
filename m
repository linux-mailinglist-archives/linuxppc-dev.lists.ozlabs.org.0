Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 767BD13B198
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 19:02:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xywF3cJszDqSM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 05:02:21 +1100 (AEDT)
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
 header.s=mail header.b=qd0qrayg; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xykl3QZYzDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 04:54:07 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47xykf3hsjz9txh0;
 Tue, 14 Jan 2020 18:54:02 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=qd0qrayg; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id GrcxG9YlSurd; Tue, 14 Jan 2020 18:54:02 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47xykf2YX9z9txgv;
 Tue, 14 Jan 2020 18:54:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579024442; bh=Yr+rOwjm12MPfnMrRm677aZjNlYzK/jKvcaQ0UIMbBU=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=qd0qraygO7Uzlqxdi6TBN3BTtA9YqypOdVs/19BhysOWnlAKXjxfUe0eTHxN9BWmE
 sMNXox3q7VwR2hQGM3lnE/kcFf4wwumncPweZYdNZw3RyIx5/0v5y5R24DrSBcgePI
 It8QiEeY87b4SEJeggn/ZXsgdvDnRHfg7iHcAQ64=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 153758B7EB;
 Tue, 14 Jan 2020 18:54:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EWujLzpkxmUv; Tue, 14 Jan 2020 18:54:04 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D32788B7E8;
 Tue, 14 Jan 2020 18:54:03 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id AC0A36381C; Tue, 14 Jan 2020 17:54:03 +0000 (UTC)
Message-Id: <84b27bf08b41c8343efd88e10f2eccd8e9f85593.1579024426.git.christophe.leroy@c-s.fr>
In-Reply-To: <031dec5487bde9b2181c8b3c9800e1879cf98c1a.1579024426.git.christophe.leroy@c-s.fr>
References: <031dec5487bde9b2181c8b3c9800e1879cf98c1a.1579024426.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 4/5] powerpc/32: Simplify KASAN init
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 erhard_f@mailbox.org, dja@axtens.net
Date: Tue, 14 Jan 2020 17:54:03 +0000 (UTC)
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

Since kasan_init_region() is not used anymore for modules,
KASAN init is done while slab_is_available() is false.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/kasan/kasan_init_32.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index b782d92622b4..c4bf9ed04f88 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -34,7 +34,6 @@ static int __init kasan_init_shadow_page_tables(unsigned long k_start, unsigned
 {
 	pmd_t *pmd;
 	unsigned long k_cur, k_next;
-	pgprot_t prot = slab_is_available() ? kasan_prot_ro() : PAGE_KERNEL;
 
 	pmd = pmd_offset(pud_offset(pgd_offset_k(k_start), k_start), k_start);
 
@@ -45,14 +44,11 @@ static int __init kasan_init_shadow_page_tables(unsigned long k_start, unsigned
 		if ((void *)pmd_page_vaddr(*pmd) != kasan_early_shadow_pte)
 			continue;
 
-		if (slab_is_available())
-			new = pte_alloc_one_kernel(&init_mm);
-		else
-			new = memblock_alloc(PTE_FRAG_SIZE, PTE_FRAG_SIZE);
+		new = memblock_alloc(PTE_FRAG_SIZE, PTE_FRAG_SIZE);
 
 		if (!new)
 			return -ENOMEM;
-		kasan_populate_pte(new, prot);
+		kasan_populate_pte(new, PAGE_KERNEL);
 
 		smp_wmb(); /* See comment in __pte_alloc */
 
@@ -63,39 +59,27 @@ static int __init kasan_init_shadow_page_tables(unsigned long k_start, unsigned
 			new = NULL;
 		}
 		spin_unlock(&init_mm.page_table_lock);
-
-		if (new && slab_is_available())
-			pte_free_kernel(&init_mm, new);
 	}
 	return 0;
 }
 
-static void __init *kasan_get_one_page(void)
-{
-	if (slab_is_available())
-		return (void *)__get_free_page(GFP_KERNEL | __GFP_ZERO);
-
-	return memblock_alloc(PAGE_SIZE, PAGE_SIZE);
-}
-
 static int __init kasan_init_region(void *start, size_t size)
 {
 	unsigned long k_start = (unsigned long)kasan_mem_to_shadow(start);
 	unsigned long k_end = (unsigned long)kasan_mem_to_shadow(start + size);
 	unsigned long k_cur;
 	int ret;
-	void *block = NULL;
+	void *block;
 
 	ret = kasan_init_shadow_page_tables(k_start, k_end);
 	if (ret)
 		return ret;
 
-	if (!slab_is_available())
-		block = memblock_alloc(k_end - k_start, PAGE_SIZE);
+	block = memblock_alloc(k_end - k_start, PAGE_SIZE);
 
 	for (k_cur = k_start & PAGE_MASK; k_cur < k_end; k_cur += PAGE_SIZE) {
 		pmd_t *pmd = pmd_offset(pud_offset(pgd_offset_k(k_cur), k_cur), k_cur);
-		void *va = block ? block + k_cur - k_start : kasan_get_one_page();
+		void *va = block + k_cur - k_start;
 		pte_t pte = pfn_pte(PHYS_PFN(__pa(va)), PAGE_KERNEL);
 
 		if (!va)
-- 
2.13.3

