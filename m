Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89487857A24
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 11:18:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbnvQ2ywGz3vhR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 21:18:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tbntg4rRDz3vYH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 21:17:47 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4TbntY1H9lz9t0H;
	Fri, 16 Feb 2024 11:17:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mi_EVeu5gp-A; Fri, 16 Feb 2024 11:17:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4TbntY0hNgz9syQ;
	Fri, 16 Feb 2024 11:17:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 13E978B765;
	Fri, 16 Feb 2024 11:17:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id d_saBaDgKqUf; Fri, 16 Feb 2024 11:17:40 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.102])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AE7698B786;
	Fri, 16 Feb 2024 11:17:40 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 2/2] powerpc: Don't ignore errors from set_memory_{n}p() in __kernel_map_pages()
Date: Fri, 16 Feb 2024 11:17:34 +0100
Message-ID: <20ef75884aa6a636e8298736f3d1056b0793d3d9.1708078640.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3656d47c53bff577739dac536dbae31fff52f6d8.1708078640.git.christophe.leroy@csgroup.eu>
References: <3656d47c53bff577739dac536dbae31fff52f6d8.1708078640.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708078656; l=3039; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=lYwWiTcbrS7Hlpr3W3PSBMI1bxolZRwLidJEh2BgiBU=; b=4QARmfP/MsmV0cSeFLmXJPnoW3jSj70yLfwQEZm7bgqm/aoOmeUTLZTt5MFHsmyBTPxi4HZBG S35ItvkrnzqARQrxHroqWT2Nb9KgE28JTsCR0mTCqsJOcEmn3QM+Q2A
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

set_memory_p() and set_memory_np() can fail.

As mentioned in linux/mm.h:

/*
 * To support DEBUG_PAGEALLOC architecture must ensure that
 * __kernel_map_pages() never fails
 */

So panic in case set_memory_p() or set_memory_np() fail
in __kernel_map_pages().

Link: https://github.com/KSPP/linux/issues/7
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/hash.h |  2 +-
 arch/powerpc/mm/book3s64/hash_utils.c     |  3 ++-
 arch/powerpc/mm/pageattr.c                | 10 +++++++---
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
index 6e70ae511631..8f47ae79f2a6 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -269,7 +269,7 @@ int hash__create_section_mapping(unsigned long start, unsigned long end,
 				 int nid, pgprot_t prot);
 int hash__remove_section_mapping(unsigned long start, unsigned long end);
 
-void hash__kernel_map_pages(struct page *page, int numpages, int enable);
+int hash__kernel_map_pages(struct page *page, int numpages, int enable);
 
 #endif /* !__ASSEMBLY__ */
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 0626a25b0d72..01c3b4b65241 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -2172,7 +2172,7 @@ static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
 				     mmu_kernel_ssize, 0);
 }
 
-void hash__kernel_map_pages(struct page *page, int numpages, int enable)
+int hash__kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	unsigned long flags, vaddr, lmi;
 	int i;
@@ -2189,6 +2189,7 @@ void hash__kernel_map_pages(struct page *page, int numpages, int enable)
 			kernel_unmap_linear_page(vaddr, lmi);
 	}
 	local_irq_restore(flags);
+	return 0;
 }
 #endif /* CONFIG_DEBUG_PAGEALLOC || CONFIG_KFENCE */
 
diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
index 16b8d20d6ca8..62b678585878 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -106,17 +106,21 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
 #ifdef CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
+	int err;
 	unsigned long addr = (unsigned long)page_address(page);
 
 	if (PageHighMem(page))
 		return;
 
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !radix_enabled())
-		hash__kernel_map_pages(page, numpages, enable);
+		err = hash__kernel_map_pages(page, numpages, enable);
 	else if (enable)
-		set_memory_p(addr, numpages);
+		err = set_memory_p(addr, numpages);
 	else
-		set_memory_np(addr, numpages);
+		err = set_memory_np(addr, numpages);
+
+	if (err)
+		panic("%s: set_memory_%sp() failed\n", enable ? "" : "n");
 }
 #endif
 #endif
-- 
2.43.0

