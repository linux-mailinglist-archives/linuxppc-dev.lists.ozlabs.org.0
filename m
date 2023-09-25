Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFA37ADF27
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:41:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvWt95ZhQz3hDN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 04:41:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvWhH3qvGz3dGW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 04:32:47 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RvWgK2H6sz9v9K;
	Mon, 25 Sep 2023 20:31:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OL0izn77Xeqx; Mon, 25 Sep 2023 20:31:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RvWg12T4Bz9v9n;
	Mon, 25 Sep 2023 20:31:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4FD638B78C;
	Mon, 25 Sep 2023 20:31:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ihC-a07ZMgm7; Mon, 25 Sep 2023 20:31:41 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.137])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8961F8B7A7;
	Mon, 25 Sep 2023 20:31:40 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38PIVWiI1499155
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 20:31:32 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38PIVWZs1499154;
	Mon, 25 Sep 2023 20:31:32 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 06/37] powerpc: Refactor update_mmu_cache_range()
Date: Mon, 25 Sep 2023 20:31:20 +0200
Message-ID: <b029842cb6783cbeb43d202e69a90341d65295a4.1695659959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695666674; l=5044; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=algoft7e+i6MTT509hlnw/+e7RZmaJ1/1fTTUSAue0c=; b=lV/TvUlkIYutY/Pmumlg6cRklSes7zsGCPk6Obywa6oFl3EIGH+AqQOIOowfUMH04gv43IKof MFBTurbE7VvD7q5E1fg3bUGjFxjJMJGmG6v8BoPIU5UPsIuEc9erDz8
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

On nohash, this function voids except for E500 with hugepages.

On book3s, this function is for hash MMUs only.

Combine those tests and rename E500 update_mmu_cache_range()
as __update_mmu_cache() which gets called by
update_mmu_cache_range().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Fix the logic
---
 arch/powerpc/include/asm/book3s/pgtable.h | 24 -----------------------
 arch/powerpc/include/asm/nohash/pgtable.h | 15 --------------
 arch/powerpc/include/asm/pgtable.h        | 19 ++++++++++++++++++
 arch/powerpc/mm/nohash/e500_hugetlbpage.c |  3 +--
 4 files changed, 20 insertions(+), 41 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/pgtable.h b/arch/powerpc/include/asm/book3s/pgtable.h
index 6f4578daea6c..f42d68c6b314 100644
--- a/arch/powerpc/include/asm/book3s/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/pgtable.h
@@ -8,28 +8,4 @@
 #include <asm/book3s/32/pgtable.h>
 #endif
 
-#ifndef __ASSEMBLY__
-void __update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep);
-
-/*
- * This gets called at the end of handling a page fault, when
- * the kernel has put a new PTE into the page table for the process.
- * We use it to ensure coherency between the i-cache and d-cache
- * for the page which has just been mapped in.
- * On machines which use an MMU hash table, we use this to put a
- * corresponding HPTE into the hash table ahead of time, instead of
- * waiting for the inevitable extra hash-table miss exception.
- */
-static inline void update_mmu_cache_range(struct vm_fault *vmf,
-		struct vm_area_struct *vma, unsigned long address,
-		pte_t *ptep, unsigned int nr)
-{
-	if (IS_ENABLED(CONFIG_PPC32) && !mmu_has_feature(MMU_FTR_HPTE_TABLE))
-		return;
-	if (radix_enabled())
-		return;
-	__update_mmu_cache(vma, address, ptep);
-}
-
-#endif /* __ASSEMBLY__ */
 #endif
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 5b6647fb398b..a9056f4fad48 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -259,20 +259,5 @@ static inline int pud_huge(pud_t pud)
 #define is_hugepd(hpd)		(hugepd_ok(hpd))
 #endif
 
-/*
- * This gets called at the end of handling a page fault, when
- * the kernel has put a new PTE into the page table for the process.
- * We use it to ensure coherency between the i-cache and d-cache
- * for the page which has just been mapped in.
- */
-#if defined(CONFIG_PPC_E500) && defined(CONFIG_HUGETLB_PAGE)
-void update_mmu_cache_range(struct vm_fault *vmf, struct vm_area_struct *vma,
-		unsigned long address, pte_t *ptep, unsigned int nr);
-#else
-static inline void update_mmu_cache_range(struct vm_fault *vmf,
-		struct vm_area_struct *vma, unsigned long address,
-		pte_t *ptep, unsigned int nr) {}
-#endif
-
 #endif /* __ASSEMBLY__ */
 #endif
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index bcdbdeda65d3..966e7c5119f6 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -119,6 +119,25 @@ pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 			      unsigned long size, pgprot_t vma_prot);
 #define __HAVE_PHYS_MEM_ACCESS_PROT
 
+void __update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep);
+
+/*
+ * This gets called at the end of handling a page fault, when
+ * the kernel has put a new PTE into the page table for the process.
+ * We use it to ensure coherency between the i-cache and d-cache
+ * for the page which has just been mapped in.
+ * On machines which use an MMU hash table, we use this to put a
+ * corresponding HPTE into the hash table ahead of time, instead of
+ * waiting for the inevitable extra hash-table miss exception.
+ */
+static inline void update_mmu_cache_range(struct vm_fault *vmf,
+		struct vm_area_struct *vma, unsigned long address,
+		pte_t *ptep, unsigned int nr)
+{
+	if ((mmu_has_feature(MMU_FTR_HPTE_TABLE) && !radix_enabled()) ||
+	    (IS_ENABLED(CONFIG_PPC_E500) && IS_ENABLED(CONFIG_HUGETLB_PAGE)))
+		__update_mmu_cache(vma, address, ptep);
+}
 
 /*
  * When used, PTE_FRAG_NR is defined in subarch pgtable.h
diff --git a/arch/powerpc/mm/nohash/e500_hugetlbpage.c b/arch/powerpc/mm/nohash/e500_hugetlbpage.c
index 6b30e40d4590..a134d28a0e4d 100644
--- a/arch/powerpc/mm/nohash/e500_hugetlbpage.c
+++ b/arch/powerpc/mm/nohash/e500_hugetlbpage.c
@@ -178,8 +178,7 @@ book3e_hugetlb_preload(struct vm_area_struct *vma, unsigned long ea, pte_t pte)
  *
  * This must always be called with the pte lock held.
  */
-void update_mmu_cache_range(struct vm_fault *vmf, struct vm_area_struct *vma,
-		unsigned long address, pte_t *ptep, unsigned int nr)
+void __update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep)
 {
 	if (is_vm_hugetlb_page(vma))
 		book3e_hugetlb_preload(vma, address, *ptep);
-- 
2.41.0

