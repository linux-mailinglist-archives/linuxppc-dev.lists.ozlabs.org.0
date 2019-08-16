Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 611D48FA71
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 07:43:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468sgC485VzDrC7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 15:43:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="C5lhLwpl"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468sdP5MYRzDqft
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 15:41:44 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 468sdH60FGz9txsx;
 Fri, 16 Aug 2019 07:41:39 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=C5lhLwpl; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id gExlPo0f7j56; Fri, 16 Aug 2019 07:41:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 468sdH4rX9z9tygC;
 Fri, 16 Aug 2019 07:41:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565934099; bh=WYMNLBFh6ch1zZnLludHa1zT7jT6U/Npzey3DZ406rk=;
 h=From:Subject:To:Cc:Date:From;
 b=C5lhLwpleju2b8lyT+L27+zEbj+avXjLCfBBxMxmRpMFKuXZydNZzww35RD4suPNt
 A3/llx9A6wn0EMy3RhP3sdb9eKB/W2Q/xysEX1PKITP1ElUoNpO6MifhOzZWQPEIZG
 TPpC6D5Gi7SHldu/E7cq2Dc8inzkXkGoxTk0Qhqw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D6898B776;
 Fri, 16 Aug 2019 07:41:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YQUxJCzoC-E9; Fri, 16 Aug 2019 07:41:40 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7AB1C8B754;
 Fri, 16 Aug 2019 07:41:40 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 49DDE6B6CC; Fri, 16 Aug 2019 05:41:40 +0000 (UTC)
Message-Id: <668aba4db6b9af6d8a151174e11a4289f1a6bbcd.1565933217.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 1/5] powerpc/mm: define empty update_mmu_cache() as static
 inline
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 16 Aug 2019 05:41:40 +0000 (UTC)
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

Only BOOK3S and FSL_BOOK3E have a usefull update_mmu_cache().

For the others, just define it static inline.

In the meantime, simplify the FSL_BOOK3E related ifdef as
book3e_hugetlb_preload() only exists when CONFIG_PPC_FSL_BOOK3E
is selected.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/book3s/pgtable.h | 11 +++++++++++
 arch/powerpc/include/asm/nohash/pgtable.h | 13 +++++++++++++
 arch/powerpc/include/asm/pgtable.h        | 12 ------------
 arch/powerpc/mm/mem.c                     | 11 +++++++----
 4 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/pgtable.h b/arch/powerpc/include/asm/book3s/pgtable.h
index 6436b65ac7bc..0e1263455d73 100644
--- a/arch/powerpc/include/asm/book3s/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/pgtable.h
@@ -26,5 +26,16 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 				     unsigned long size, pgprot_t vma_prot);
 #define __HAVE_PHYS_MEM_ACCESS_PROT
 
+/*
+ * This gets called at the end of handling a page fault, when
+ * the kernel has put a new PTE into the page table for the process.
+ * We use it to ensure coherency between the i-cache and d-cache
+ * for the page which has just been mapped in.
+ * On machines which use an MMU hash table, we use this to put a
+ * corresponding HPTE into the hash table ahead of time, instead of
+ * waiting for the inevitable extra hash-table miss exception.
+ */
+void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep);
+
 #endif /* __ASSEMBLY__ */
 #endif
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 1ca1c1864b32..7fed9dc0f147 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -293,5 +293,18 @@ static inline int pgd_huge(pgd_t pgd)
 #define is_hugepd(hpd)		(hugepd_ok(hpd))
 #endif
 
+/*
+ * This gets called at the end of handling a page fault, when
+ * the kernel has put a new PTE into the page table for the process.
+ * We use it to ensure coherency between the i-cache and d-cache
+ * for the page which has just been mapped in.
+ */
+#if defined(CONFIG_PPC_FSL_BOOK3E) && defined(CONFIG_HUGETLB_PAGE)
+void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep);
+#else
+static inline
+void update_mmu_cache(struct vm_area_struct *vma, unsigned long address, pte_t *ptep) {}
+#endif
+
 #endif /* __ASSEMBLY__ */
 #endif
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index c58ba7963688..c70916a7865a 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -77,18 +77,6 @@ extern void paging_init(void);
 
 #include <asm-generic/pgtable.h>
 
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
-extern void update_mmu_cache(struct vm_area_struct *, unsigned long, pte_t *);
-
 #ifndef CONFIG_TRANSPARENT_HUGEPAGE
 #define pmd_large(pmd)		0
 #endif
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 9191a66b3bc5..582ad728ac9d 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -414,10 +414,10 @@ EXPORT_SYMBOL(flush_icache_user_range);
  * 
  * This must always be called with the pte lock held.
  */
+#ifdef CONFIG_PPC_BOOK3S
 void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
 		      pte_t *ptep)
 {
-#ifdef CONFIG_PPC_BOOK3S
 	/*
 	 * We don't need to worry about _PAGE_PRESENT here because we are
 	 * called with either mm->page_table_lock held or ptl lock held
@@ -455,13 +455,16 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
 	}
 
 	hash_preload(vma->vm_mm, address, is_exec, trap);
+}
 #endif /* CONFIG_PPC_BOOK3S */
-#if (defined(CONFIG_PPC_BOOK3E_64) || defined(CONFIG_PPC_FSL_BOOK3E)) \
-	&& defined(CONFIG_HUGETLB_PAGE)
+#if defined(CONFIG_PPC_FSL_BOOK3E) && defined(CONFIG_HUGETLB_PAGE)
+void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
+		      pte_t *ptep)
+{
 	if (is_vm_hugetlb_page(vma))
 		book3e_hugetlb_preload(vma, address, *ptep);
-#endif
 }
+#endif
 
 /*
  * System memory should not be in /proc/iomem but various tools expect it
-- 
2.13.3

