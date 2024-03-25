Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA6588A576
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 15:58:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3GJV4VvPz3dTG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 01:58:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3GH126F2z3vYd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 01:56:45 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4V3GGP1D5Qz9sqT;
	Mon, 25 Mar 2024 15:56:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 70e8zKdeppRM; Mon, 25 Mar 2024 15:56:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4V3GGK36JTz9sfW;
	Mon, 25 Mar 2024 15:56:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6731A8B765;
	Mon, 25 Mar 2024 15:56:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ZS39sT5H_ogC; Mon, 25 Mar 2024 15:56:09 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A48B8B770;
	Mon, 25 Mar 2024 15:56:09 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>
Subject: [RFC PATCH 3/8] mm: Provide pmd to pte_leaf_size()
Date: Mon, 25 Mar 2024 15:55:56 +0100
Message-ID: <32921d5b2767fe7d6f16ec09afe1bf8a571cb538.1711377230.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1711377230.git.christophe.leroy@csgroup.eu>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711378567; l=4399; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=4ts0uoP1Urxiva7aePDf1AHFQE/7fSObtY1zE6Z2IwU=; b=a05y8ni8WptI6RYZT/NgealekJsHbCYwBgmtjyMtZc/BKP6kcg4jNxmDeoGDUWSnnyYi3u2Op 17yI9VGc556Aj1+EarKB2yZYxn8f5BXklKDyWXoNYXVM9tCfIpuXUrt
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On powerpc 8xx, when a page is 8M size, the information is in the PMD
entry. So provide it to pte_leaf_size().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/arm64/include/asm/pgtable.h             | 2 +-
 arch/powerpc/include/asm/nohash/32/pte-8xx.h | 2 +-
 arch/riscv/include/asm/pgtable.h             | 2 +-
 arch/sparc/include/asm/pgtable_64.h          | 2 +-
 arch/sparc/mm/hugetlbpage.c                  | 2 +-
 include/linux/pgtable.h                      | 2 +-
 kernel/events/core.c                         | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index afdd56d26ad7..57c40f2498ab 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -624,7 +624,7 @@ extern pgprot_t phys_mem_access_prot(struct file *file, unsigned long pfn,
 #define pmd_bad(pmd)		(!pmd_table(pmd))
 
 #define pmd_leaf_size(pmd)	(pmd_cont(pmd) ? CONT_PMD_SIZE : PMD_SIZE)
-#define pte_leaf_size(pte)	(pte_cont(pte) ? CONT_PTE_SIZE : PAGE_SIZE)
+#define pte_leaf_size(pmd, pte)	(pte_cont(pte) ? CONT_PTE_SIZE : PAGE_SIZE)
 
 #if defined(CONFIG_ARM64_64K_PAGES) || CONFIG_PGTABLE_LEVELS < 3
 static inline bool pud_sect(pud_t pud) { return false; }
diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
index 137dc3c84e45..07df6b664861 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -151,7 +151,7 @@ static inline unsigned long pgd_leaf_size(pgd_t pgd)
 
 #define pgd_leaf_size pgd_leaf_size
 
-static inline unsigned long pte_leaf_size(pte_t pte)
+static inline unsigned long pte_leaf_size(pmd_t pmd, pte_t pte)
 {
 	pte_basic_t val = pte_val(pte);
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 20242402fc11..45fa27810f25 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -439,7 +439,7 @@ static inline pte_t pte_mkhuge(pte_t pte)
 	return pte;
 }
 
-#define pte_leaf_size(pte)	(pte_napot(pte) ?				\
+#define pte_leaf_size(pmd, pte)	(pte_napot(pte) ?				\
 					napot_cont_size(napot_cont_order(pte)) :\
 					PAGE_SIZE)
 
diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 4d1bafaba942..67063af2ff8f 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -1175,7 +1175,7 @@ extern unsigned long pud_leaf_size(pud_t pud);
 extern unsigned long pmd_leaf_size(pmd_t pmd);
 
 #define pte_leaf_size pte_leaf_size
-extern unsigned long pte_leaf_size(pte_t pte);
+extern unsigned long pte_leaf_size(pmd_t pmd, pte_t pte);
 
 #endif /* CONFIG_HUGETLB_PAGE */
 
diff --git a/arch/sparc/mm/hugetlbpage.c b/arch/sparc/mm/hugetlbpage.c
index 5a342199e837..60c845a15bee 100644
--- a/arch/sparc/mm/hugetlbpage.c
+++ b/arch/sparc/mm/hugetlbpage.c
@@ -276,7 +276,7 @@ static unsigned long huge_tte_to_size(pte_t pte)
 
 unsigned long pud_leaf_size(pud_t pud) { return 1UL << tte_to_shift(*(pte_t *)&pud); }
 unsigned long pmd_leaf_size(pmd_t pmd) { return 1UL << tte_to_shift(*(pte_t *)&pmd); }
-unsigned long pte_leaf_size(pte_t pte) { return 1UL << tte_to_shift(pte); }
+unsigned long pte_leaf_size(pmd_t pmd, pte_t pte) { return 1UL << tte_to_shift(pte); }
 
 pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 			unsigned long addr, unsigned long sz)
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 85fc7554cd52..e605a4149fc7 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1802,7 +1802,7 @@ typedef unsigned int pgtbl_mod_mask;
 #define pmd_leaf_size(x) PMD_SIZE
 #endif
 #ifndef pte_leaf_size
-#define pte_leaf_size(x) PAGE_SIZE
+#define pte_leaf_size(x, y) PAGE_SIZE
 #endif
 
 /*
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 724e6d7e128f..5c1c083222b2 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7585,7 +7585,7 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
 
 	pte = ptep_get_lockless(ptep);
 	if (pte_present(pte))
-		size = pte_leaf_size(pte);
+		size = pte_leaf_size(pmd, pte);
 	pte_unmap(ptep);
 #endif /* CONFIG_HAVE_FAST_GUP */
 
-- 
2.43.0

