Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABEA857A22
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 11:18:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tbntz6wm0z3vcr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 21:18:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tbntb5s16z3bt2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 21:17:43 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4TbntX62hBz9syV;
	Fri, 16 Feb 2024 11:17:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 96PLKNcv9rew; Fri, 16 Feb 2024 11:17:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4TbntX5RjJz9syQ;
	Fri, 16 Feb 2024 11:17:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B67728B787;
	Fri, 16 Feb 2024 11:17:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kAu6F8SI1VKn; Fri, 16 Feb 2024 11:17:40 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.102])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5BB9A8B765;
	Fri, 16 Feb 2024 11:17:40 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 1/2] powerpc: Refactor __kernel_map_pages()
Date: Fri, 16 Feb 2024 11:17:33 +0100
Message-ID: <3656d47c53bff577739dac536dbae31fff52f6d8.1708078640.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708078656; l=4475; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Wkah7ddA+jWIQ090hY7AxP5yG+d19l5Rtgg0SellYbQ=; b=3ndOEs/ZRpaNi4SMb1xvZ8joNAwRFVJQBfiAR/AO2F81xbTxZIk2/KSXbeEvXFn6dZuXBKDvX cngc0l+o6ZvA+jzBOkOb7qkXQRoXfj0Flv/BW7tqh1+REVw8b2rUDsV
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__kernel_map_pages() is almost identical for PPC32 and RADIX.

Refactor it.

On PPC32 it is not needed for KFENCE, but to keep it simple
just make it similar to PPC64.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ----------
 arch/powerpc/include/asm/book3s/64/radix.h   |  2 --
 arch/powerpc/mm/book3s64/radix_pgtable.c     | 14 --------------
 arch/powerpc/mm/pageattr.c                   | 19 +++++++++++++++++++
 arch/powerpc/mm/pgtable_32.c                 | 15 ---------------
 5 files changed, 19 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 927d585652bc..62c43d3d80ec 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1027,16 +1027,6 @@ static inline void vmemmap_remove_mapping(unsigned long start,
 }
 #endif
 
-#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
-static inline void __kernel_map_pages(struct page *page, int numpages, int enable)
-{
-	if (radix_enabled())
-		radix__kernel_map_pages(page, numpages, enable);
-	else
-		hash__kernel_map_pages(page, numpages, enable);
-}
-#endif
-
 static inline pte_t pmd_pte(pmd_t pmd)
 {
 	return __pte_raw(pmd_raw(pmd));
diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index 357e23a403d3..8f55ff74bb68 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -362,8 +362,6 @@ int radix__create_section_mapping(unsigned long start, unsigned long end,
 int radix__remove_section_mapping(unsigned long start, unsigned long end);
 #endif /* CONFIG_MEMORY_HOTPLUG */
 
-void radix__kernel_map_pages(struct page *page, int numpages, int enable);
-
 #ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 #define vmemmap_can_optimize vmemmap_can_optimize
 bool vmemmap_can_optimize(struct vmem_altmap *altmap, struct dev_pagemap *pgmap);
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index c6a4ac766b2b..e16e2fd104c5 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1339,20 +1339,6 @@ void __ref radix__vmemmap_free(unsigned long start, unsigned long end,
 #endif
 #endif
 
-#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
-void radix__kernel_map_pages(struct page *page, int numpages, int enable)
-{
-	unsigned long addr;
-
-	addr = (unsigned long)page_address(page);
-
-	if (enable)
-		set_memory_p(addr, numpages);
-	else
-		set_memory_np(addr, numpages);
-}
-#endif
-
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 
 unsigned long radix__pmd_hugepage_update(struct mm_struct *mm, unsigned long addr,
diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
index 421db7c4f2a4..16b8d20d6ca8 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -101,3 +101,22 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
 	return apply_to_existing_page_range(&init_mm, start, size,
 					    change_page_attr, (void *)action);
 }
+
+#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
+#ifdef CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC
+void __kernel_map_pages(struct page *page, int numpages, int enable)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+
+	if (PageHighMem(page))
+		return;
+
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !radix_enabled())
+		hash__kernel_map_pages(page, numpages, enable);
+	else if (enable)
+		set_memory_p(addr, numpages);
+	else
+		set_memory_np(addr, numpages);
+}
+#endif
+#endif
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index e94919853ca3..4be97b4a44f9 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -188,18 +188,3 @@ void mark_rodata_ro(void)
 	ptdump_check_wx();
 }
 #endif
-
-#if defined(CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC) && defined(CONFIG_DEBUG_PAGEALLOC)
-void __kernel_map_pages(struct page *page, int numpages, int enable)
-{
-	unsigned long addr = (unsigned long)page_address(page);
-
-	if (PageHighMem(page))
-		return;
-
-	if (enable)
-		set_memory_p(addr, numpages);
-	else
-		set_memory_np(addr, numpages);
-}
-#endif /* CONFIG_DEBUG_PAGEALLOC */
-- 
2.43.0

