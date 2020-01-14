Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3159313B177
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 18:58:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xyqV48hjzDqJT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 04:58:14 +1100 (AEDT)
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
 header.s=mail header.b=TNvgsk56; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xykl0zFpzDqRb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 04:54:06 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47xykd4BXTz9txgy;
 Tue, 14 Jan 2020 18:54:01 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=TNvgsk56; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5lOsJDYHaxU2; Tue, 14 Jan 2020 18:54:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47xykd2ybqz9txgv;
 Tue, 14 Jan 2020 18:54:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579024441; bh=NDoHlqPwlBNpLNoc61s6LOMRRHtVzZVZMHu1UPfR0fY=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=TNvgsk56BWefPm8l3glW6KCYLikrEfZVoMdpy72g7v+VYgQFpzs5mSZpWPhdxIka9
 Tbr5WTHAyN+ZtNJ3CCPMKh1asmMS+0byxbgjVmoIv6uVjchmgc1aF1dAwoimE3i+5B
 jNGUtQTuqWCsfDqvD5j1TORbBl8GnS4VeFS93d2Q=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 205008B7EB;
 Tue, 14 Jan 2020 18:54:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UQUJdClR7uyP; Tue, 14 Jan 2020 18:54:03 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D125C8B7E8;
 Tue, 14 Jan 2020 18:54:02 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A3DBD6381C; Tue, 14 Jan 2020 17:54:02 +0000 (UTC)
Message-Id: <f909da11aecb59ab7f32ba01fae6f356eaa4d7bc.1579024426.git.christophe.leroy@c-s.fr>
In-Reply-To: <031dec5487bde9b2181c8b3c9800e1879cf98c1a.1579024426.git.christophe.leroy@c-s.fr>
References: <031dec5487bde9b2181c8b3c9800e1879cf98c1a.1579024426.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 3/5] powerpc/32: force KASAN_VMALLOC for modules
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 erhard_f@mailbox.org, dja@axtens.net
Date: Tue, 14 Jan 2020 17:54:02 +0000 (UTC)
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

Unloading/Reloading of modules seems to fail with KASAN_VMALLOC
but works properly with it.

Force selection of KASAN_VMALLOC when MODULES are selected, and
drop module_alloc() which was dedicated to KASAN for modules.

Reported-by: <erhard_f@mailbox.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=205283
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/kasan/kasan_init_32.c  | 31 +++++--------------------------
 arch/powerpc/platforms/Kconfig.cputype |  1 +
 2 files changed, 6 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index 88036fb88350..b782d92622b4 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -12,7 +12,7 @@
 #include <asm/code-patching.h>
 #include <mm/mmu_decl.h>
 
-static pgprot_t kasan_prot_ro(void)
+static pgprot_t __init kasan_prot_ro(void)
 {
 	if (early_mmu_has_feature(MMU_FTR_HPTE_TABLE))
 		return PAGE_READONLY;
@@ -20,7 +20,7 @@ static pgprot_t kasan_prot_ro(void)
 	return PAGE_KERNEL_RO;
 }
 
-static void kasan_populate_pte(pte_t *ptep, pgprot_t prot)
+static void __init kasan_populate_pte(pte_t *ptep, pgprot_t prot)
 {
 	unsigned long va = (unsigned long)kasan_early_shadow_page;
 	phys_addr_t pa = __pa(kasan_early_shadow_page);
@@ -30,7 +30,7 @@ static void kasan_populate_pte(pte_t *ptep, pgprot_t prot)
 		__set_pte_at(&init_mm, va, ptep, pfn_pte(PHYS_PFN(pa), prot), 0);
 }
 
-static int __ref kasan_init_shadow_page_tables(unsigned long k_start, unsigned long k_end)
+static int __init kasan_init_shadow_page_tables(unsigned long k_start, unsigned long k_end)
 {
 	pmd_t *pmd;
 	unsigned long k_cur, k_next;
@@ -70,7 +70,7 @@ static int __ref kasan_init_shadow_page_tables(unsigned long k_start, unsigned l
 	return 0;
 }
 
-static void __ref *kasan_get_one_page(void)
+static void __init *kasan_get_one_page(void)
 {
 	if (slab_is_available())
 		return (void *)__get_free_page(GFP_KERNEL | __GFP_ZERO);
@@ -78,7 +78,7 @@ static void __ref *kasan_get_one_page(void)
 	return memblock_alloc(PAGE_SIZE, PAGE_SIZE);
 }
 
-static int __ref kasan_init_region(void *start, size_t size)
+static int __init kasan_init_region(void *start, size_t size)
 {
 	unsigned long k_start = (unsigned long)kasan_mem_to_shadow(start);
 	unsigned long k_end = (unsigned long)kasan_mem_to_shadow(start + size);
@@ -196,27 +196,6 @@ void __init kasan_late_init(void)
 		kasan_unmap_early_shadow_vmalloc();
 }
 
-#if defined(CONFIG_MODULES) && !defined(CONFIG_KASAN_VMALLOC)
-void *module_alloc(unsigned long size)
-{
-	void *base;
-
-	base = __vmalloc_node_range(size, MODULE_ALIGN, VMALLOC_START, VMALLOC_END,
-				    GFP_KERNEL, PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS,
-				    NUMA_NO_NODE, __builtin_return_address(0));
-
-	if (!base)
-		return NULL;
-
-	if (!kasan_init_region(base, size))
-		return base;
-
-	vfree(base);
-
-	return NULL;
-}
-#endif
-
 #ifdef CONFIG_PPC_BOOK3S_32
 u8 __initdata early_hash[256 << 10] __aligned(256 << 10) = {0};
 
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 536a2efcb7f0..851a92ffe290 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -2,6 +2,7 @@
 config PPC32
 	bool
 	default y if !PPC64
+	select KASAN_VMALLOC if KASAN && MODULES
 
 config PPC64
 	bool "64-bit kernel"
-- 
2.13.3

