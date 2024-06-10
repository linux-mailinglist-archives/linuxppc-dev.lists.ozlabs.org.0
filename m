Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBECE901A9D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 07:56:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VyLfN5Yjbz3fql
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 15:56:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VyLcm4xBxz3cQL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2024 15:55:20 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4VyLcN2Tz1z9v7S;
	Mon, 10 Jun 2024 07:55:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jRHq5yDLIVKD; Mon, 10 Jun 2024 07:55:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4VyLcK6Lmfz9tZT;
	Mon, 10 Jun 2024 07:54:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D59378B770;
	Mon, 10 Jun 2024 07:54:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5gFy3Q6R-HwI; Mon, 10 Jun 2024 07:54:57 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D47E8B764;
	Mon, 10 Jun 2024 07:54:57 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v5 03/18] mm: Provide mm_struct and address to huge_ptep_get()
Date: Mon, 10 Jun 2024 07:54:48 +0200
Message-ID: <ea9c5cdb50d7bdf8f847dd2b9f0ffa139bd56561.1717955558.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1717955558.git.christophe.leroy@csgroup.eu>
References: <cover.1717955558.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717998886; l=23999; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=faOuWxpCRQUuqw22MEr4iI6XPbRRLkWwwydiwhFysKM=; b=dgnIgeUpIx613WMiN/C098P0AxaGbbm6vtv5rsXOCOpRIvEIt1MbNt+32pn89ulDPuaRQn/PE RF0DZjFbll1Be4gms16xFMkhwffWXz+7yqAqthxxSPktlzQ1kRSCLBt
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

On powerpc 8xx huge_ptep_get() will need to know whether the given
ptep is a PTE entry or a PMD entry. This cannot be known with the
PMD entry itself because there is no easy way to know it from the
content of the entry.

So huge_ptep_get() will need to know either the size of the page
or get the pmd.

In order to be consistent with huge_ptep_get_and_clear(), give
mm and address to huge_ptep_get().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
---
v2: Add missing changes in arch implementations
v3: Fixed a comment in ARM and missing changes in S390
v4: Fix missing or bad changes in mm/hugetlb.c and rebased on v6.10-rc1
v5: Fix vma->mm to vma->vm_mm
---
 arch/arm/include/asm/hugetlb-3level.h |  4 +--
 arch/arm64/include/asm/hugetlb.h      |  2 +-
 arch/arm64/mm/hugetlbpage.c           |  2 +-
 arch/riscv/include/asm/hugetlb.h      |  2 +-
 arch/riscv/mm/hugetlbpage.c           |  2 +-
 arch/s390/include/asm/hugetlb.h       |  4 +--
 arch/s390/mm/hugetlbpage.c            |  4 +--
 fs/hugetlbfs/inode.c                  |  2 +-
 fs/proc/task_mmu.c                    | 10 +++---
 fs/userfaultfd.c                      |  2 +-
 include/asm-generic/hugetlb.h         |  2 +-
 include/linux/swapops.h               |  4 +--
 mm/damon/vaddr.c                      |  6 ++--
 mm/gup.c                              |  2 +-
 mm/hmm.c                              |  2 +-
 mm/hugetlb.c                          | 44 +++++++++++++--------------
 mm/memory-failure.c                   |  2 +-
 mm/mempolicy.c                        |  2 +-
 mm/migrate.c                          |  4 +--
 mm/mincore.c                          |  2 +-
 mm/userfaultfd.c                      |  2 +-
 21 files changed, 53 insertions(+), 53 deletions(-)

diff --git a/arch/arm/include/asm/hugetlb-3level.h b/arch/arm/include/asm/hugetlb-3level.h
index a30be5505793..87d48e2d90ad 100644
--- a/arch/arm/include/asm/hugetlb-3level.h
+++ b/arch/arm/include/asm/hugetlb-3level.h
@@ -13,12 +13,12 @@
 
 /*
  * If our huge pte is non-zero then mark the valid bit.
- * This allows pte_present(huge_ptep_get(ptep)) to return true for non-zero
+ * This allows pte_present(huge_ptep_get(mm,addr,ptep)) to return true for non-zero
  * ptes.
  * (The valid bit is automatically cleared by set_pte_at for PROT_NONE ptes).
  */
 #define __HAVE_ARCH_HUGE_PTEP_GET
-static inline pte_t huge_ptep_get(pte_t *ptep)
+static inline pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
 	pte_t retval = *ptep;
 	if (pte_val(retval))
diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 3954cbd2ff56..293f880865e8 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -46,7 +46,7 @@ extern pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 			   pte_t *ptep, unsigned long sz);
 #define __HAVE_ARCH_HUGE_PTEP_GET
-extern pte_t huge_ptep_get(pte_t *ptep);
+extern pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
 
 void __init arm64_hugetlb_cma_reserve(void);
 
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 3f09ac73cce3..5f1e2103888b 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -127,7 +127,7 @@ static inline int num_contig_ptes(unsigned long size, size_t *pgsize)
 	return contig_ptes;
 }
 
-pte_t huge_ptep_get(pte_t *ptep)
+pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
 	int ncontig, i;
 	size_t pgsize;
diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
index b1ce97a9dbfc..faf3624d8057 100644
--- a/arch/riscv/include/asm/hugetlb.h
+++ b/arch/riscv/include/asm/hugetlb.h
@@ -44,7 +44,7 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 			       pte_t pte, int dirty);
 
 #define __HAVE_ARCH_HUGE_PTEP_GET
-pte_t huge_ptep_get(pte_t *ptep);
+pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
 
 pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
 #define arch_make_huge_pte arch_make_huge_pte
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index 0ebd968b33c9..42314f093922 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -3,7 +3,7 @@
 #include <linux/err.h>
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
-pte_t huge_ptep_get(pte_t *ptep)
+pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
 	unsigned long pte_num;
 	int i;
diff --git a/arch/s390/include/asm/hugetlb.h b/arch/s390/include/asm/hugetlb.h
index ce5f4fe8be4d..cf1b5d6fb1a6 100644
--- a/arch/s390/include/asm/hugetlb.h
+++ b/arch/s390/include/asm/hugetlb.h
@@ -19,7 +19,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 		     pte_t *ptep, pte_t pte, unsigned long sz);
 void __set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 		     pte_t *ptep, pte_t pte);
-pte_t huge_ptep_get(pte_t *ptep);
+pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
 pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 			      unsigned long addr, pte_t *ptep);
 
@@ -64,7 +64,7 @@ static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 					     unsigned long addr, pte_t *ptep,
 					     pte_t pte, int dirty)
 {
-	int changed = !pte_same(huge_ptep_get(ptep), pte);
+	int changed = !pte_same(huge_ptep_get(vma->vm_mm, addr, ptep), pte);
 	if (changed) {
 		huge_ptep_get_and_clear(vma->vm_mm, addr, ptep);
 		__set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
diff --git a/arch/s390/mm/hugetlbpage.c b/arch/s390/mm/hugetlbpage.c
index 2675aab4acc7..1be481672f4a 100644
--- a/arch/s390/mm/hugetlbpage.c
+++ b/arch/s390/mm/hugetlbpage.c
@@ -169,7 +169,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 	__set_huge_pte_at(mm, addr, ptep, pte);
 }
 
-pte_t huge_ptep_get(pte_t *ptep)
+pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
 	return __rste_to_pte(pte_val(*ptep));
 }
@@ -177,7 +177,7 @@ pte_t huge_ptep_get(pte_t *ptep)
 pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 			      unsigned long addr, pte_t *ptep)
 {
-	pte_t pte = huge_ptep_get(ptep);
+	pte_t pte = huge_ptep_get(mm, addr, ptep);
 	pmd_t *pmdp = (pmd_t *) ptep;
 	pud_t *pudp = (pud_t *) ptep;
 
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 412f295acebe..970c7e6fb144 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -422,7 +422,7 @@ static bool hugetlb_vma_maps_page(struct vm_area_struct *vma,
 	if (!ptep)
 		return false;
 
-	pte = huge_ptep_get(ptep);
+	pte = huge_ptep_get(vma->vm_mm, addr, ptep);
 	if (huge_pte_none(pte) || !pte_present(pte))
 		return false;
 
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index f8d35f993fe5..a74c1e42da0c 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -730,7 +730,7 @@ static int smaps_hugetlb_range(pte_t *pte, unsigned long hmask,
 {
 	struct mem_size_stats *mss = walk->private;
 	struct vm_area_struct *vma = walk->vma;
-	pte_t ptent = huge_ptep_get(pte);
+	pte_t ptent = huge_ptep_get(walk->mm, addr, pte);
 	struct folio *folio = NULL;
 
 	if (pte_present(ptent)) {
@@ -1582,7 +1582,7 @@ static int pagemap_hugetlb_range(pte_t *ptep, unsigned long hmask,
 	if (vma->vm_flags & VM_SOFTDIRTY)
 		flags |= PM_SOFT_DIRTY;
 
-	pte = huge_ptep_get(ptep);
+	pte = huge_ptep_get(walk->mm, addr, ptep);
 	if (pte_present(pte)) {
 		struct folio *folio = page_folio(pte_page(pte));
 
@@ -2271,7 +2271,7 @@ static int pagemap_scan_hugetlb_entry(pte_t *ptep, unsigned long hmask,
 	if (~p->arg.flags & PM_SCAN_WP_MATCHING) {
 		/* Go the short route when not write-protecting pages. */
 
-		pte = huge_ptep_get(ptep);
+		pte = huge_ptep_get(walk->mm, start, ptep);
 		categories = p->cur_vma_category | pagemap_hugetlb_category(pte);
 
 		if (!pagemap_scan_is_interesting_page(categories, p))
@@ -2283,7 +2283,7 @@ static int pagemap_scan_hugetlb_entry(pte_t *ptep, unsigned long hmask,
 	i_mmap_lock_write(vma->vm_file->f_mapping);
 	ptl = huge_pte_lock(hstate_vma(vma), vma->vm_mm, ptep);
 
-	pte = huge_ptep_get(ptep);
+	pte = huge_ptep_get(walk->mm, start, ptep);
 	categories = p->cur_vma_category | pagemap_hugetlb_category(pte);
 
 	if (!pagemap_scan_is_interesting_page(categories, p))
@@ -2679,7 +2679,7 @@ static int gather_pte_stats(pmd_t *pmd, unsigned long addr,
 static int gather_hugetlb_stats(pte_t *pte, unsigned long hmask,
 		unsigned long addr, unsigned long end, struct mm_walk *walk)
 {
-	pte_t huge_pte = huge_ptep_get(pte);
+	pte_t huge_pte = huge_ptep_get(walk->mm, addr, pte);
 	struct numa_maps *md;
 	struct page *page;
 
diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index eee7320ab0b0..bafce25fd676 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -257,7 +257,7 @@ static inline bool userfaultfd_huge_must_wait(struct userfaultfd_ctx *ctx,
 		goto out;
 
 	ret = false;
-	pte = huge_ptep_get(ptep);
+	pte = huge_ptep_get(vma->vm_mm, vmf->address, ptep);
 
 	/*
 	 * Lockless access: we're in a wait_event so it's ok if it
diff --git a/include/asm-generic/hugetlb.h b/include/asm-generic/hugetlb.h
index 6dcf4d576970..594d5905f615 100644
--- a/include/asm-generic/hugetlb.h
+++ b/include/asm-generic/hugetlb.h
@@ -144,7 +144,7 @@ static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 #endif
 
 #ifndef __HAVE_ARCH_HUGE_PTEP_GET
-static inline pte_t huge_ptep_get(pte_t *ptep)
+static inline pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 {
 	return ptep_get(ptep);
 }
diff --git a/include/linux/swapops.h b/include/linux/swapops.h
index a5c560a2f8c2..cb468e418ea1 100644
--- a/include/linux/swapops.h
+++ b/include/linux/swapops.h
@@ -334,7 +334,7 @@ static inline bool is_migration_entry_dirty(swp_entry_t entry)
 
 extern void migration_entry_wait(struct mm_struct *mm, pmd_t *pmd,
 					unsigned long address);
-extern void migration_entry_wait_huge(struct vm_area_struct *vma, pte_t *pte);
+extern void migration_entry_wait_huge(struct vm_area_struct *vma, unsigned long addr, pte_t *pte);
 #else  /* CONFIG_MIGRATION */
 static inline swp_entry_t make_readable_migration_entry(pgoff_t offset)
 {
@@ -359,7 +359,7 @@ static inline int is_migration_entry(swp_entry_t swp)
 static inline void migration_entry_wait(struct mm_struct *mm, pmd_t *pmd,
 					unsigned long address) { }
 static inline void migration_entry_wait_huge(struct vm_area_struct *vma,
-					pte_t *pte) { }
+					     unsigned long addr, pte_t *pte) { }
 static inline int is_writable_migration_entry(swp_entry_t entry)
 {
 	return 0;
diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
index 381559e4a1fa..58829baf8b5d 100644
--- a/mm/damon/vaddr.c
+++ b/mm/damon/vaddr.c
@@ -339,7 +339,7 @@ static void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
 				struct vm_area_struct *vma, unsigned long addr)
 {
 	bool referenced = false;
-	pte_t entry = huge_ptep_get(pte);
+	pte_t entry = huge_ptep_get(mm, addr, pte);
 	struct folio *folio = pfn_folio(pte_pfn(entry));
 	unsigned long psize = huge_page_size(hstate_vma(vma));
 
@@ -373,7 +373,7 @@ static int damon_mkold_hugetlb_entry(pte_t *pte, unsigned long hmask,
 	pte_t entry;
 
 	ptl = huge_pte_lock(h, walk->mm, pte);
-	entry = huge_ptep_get(pte);
+	entry = huge_ptep_get(walk->mm, addr, pte);
 	if (!pte_present(entry))
 		goto out;
 
@@ -509,7 +509,7 @@ static int damon_young_hugetlb_entry(pte_t *pte, unsigned long hmask,
 	pte_t entry;
 
 	ptl = huge_pte_lock(h, walk->mm, pte);
-	entry = huge_ptep_get(pte);
+	entry = huge_ptep_get(walk->mm, addr, pte);
 	if (!pte_present(entry))
 		goto out;
 
diff --git a/mm/gup.c b/mm/gup.c
index ca0f5cedce9b..43491246f39d 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -547,7 +547,7 @@ static int gup_hugepte(struct vm_area_struct *vma, pte_t *ptep, unsigned long sz
 	if (pte_end < end)
 		end = pte_end;
 
-	pte = huge_ptep_get(ptep);
+	pte = huge_ptep_get(vma->vm_mm, addr, ptep);
 
 	if (!pte_access_permitted(pte, flags & FOLL_WRITE))
 		return 0;
diff --git a/mm/hmm.c b/mm/hmm.c
index 93aebd9cc130..7e0229ae4a5a 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -480,7 +480,7 @@ static int hmm_vma_walk_hugetlb_entry(pte_t *pte, unsigned long hmask,
 	pte_t entry;
 
 	ptl = huge_pte_lock(hstate_vma(vma), walk->mm, pte);
-	entry = huge_ptep_get(pte);
+	entry = huge_ptep_get(walk->mm, addr, pte);
 
 	i = (start - range->start) >> PAGE_SHIFT;
 	pfn_req_flags = range->hmm_pfns[i];
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 6be78e7d4f6e..861e304df39c 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5315,7 +5315,7 @@ static void set_huge_ptep_writable(struct vm_area_struct *vma,
 {
 	pte_t entry;
 
-	entry = huge_pte_mkwrite(huge_pte_mkdirty(huge_ptep_get(ptep)));
+	entry = huge_pte_mkwrite(huge_pte_mkdirty(huge_ptep_get(vma->vm_mm, address, ptep)));
 	if (huge_ptep_set_access_flags(vma, address, ptep, entry, 1))
 		update_mmu_cache(vma, address, ptep);
 }
@@ -5423,7 +5423,7 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 		dst_ptl = huge_pte_lock(h, dst, dst_pte);
 		src_ptl = huge_pte_lockptr(h, src, src_pte);
 		spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
-		entry = huge_ptep_get(src_pte);
+		entry = huge_ptep_get(src_vma->vm_mm, addr, src_pte);
 again:
 		if (huge_pte_none(entry)) {
 			/*
@@ -5461,7 +5461,7 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 				set_huge_pte_at(dst, addr, dst_pte,
 						make_pte_marker(marker), sz);
 		} else {
-			entry = huge_ptep_get(src_pte);
+			entry = huge_ptep_get(src_vma->vm_mm, addr, src_pte);
 			pte_folio = page_folio(pte_page(entry));
 			folio_get(pte_folio);
 
@@ -5503,7 +5503,7 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 				dst_ptl = huge_pte_lock(h, dst, dst_pte);
 				src_ptl = huge_pte_lockptr(h, src, src_pte);
 				spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
-				entry = huge_ptep_get(src_pte);
+				entry = huge_ptep_get(src_vma->vm_mm, addr, src_pte);
 				if (!pte_same(src_pte_old, entry)) {
 					restore_reserve_on_error(h, dst_vma, addr,
 								new_folio);
@@ -5613,7 +5613,7 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 			new_addr |= last_addr_mask;
 			continue;
 		}
-		if (huge_pte_none(huge_ptep_get(src_pte)))
+		if (huge_pte_none(huge_ptep_get(mm, old_addr, src_pte)))
 			continue;
 
 		if (huge_pmd_unshare(mm, vma, old_addr, src_pte)) {
@@ -5686,7 +5686,7 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			continue;
 		}
 
-		pte = huge_ptep_get(ptep);
+		pte = huge_ptep_get(mm, address, ptep);
 		if (huge_pte_none(pte)) {
 			spin_unlock(ptl);
 			continue;
@@ -5923,7 +5923,7 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
 	struct vm_area_struct *vma = vmf->vma;
 	struct mm_struct *mm = vma->vm_mm;
 	const bool unshare = vmf->flags & FAULT_FLAG_UNSHARE;
-	pte_t pte = huge_ptep_get(vmf->pte);
+	pte_t pte = huge_ptep_get(mm, vmf->address, vmf->pte);
 	struct hstate *h = hstate_vma(vma);
 	struct folio *old_folio;
 	struct folio *new_folio;
@@ -6044,7 +6044,7 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
 			vmf->pte = hugetlb_walk(vma, vmf->address,
 					huge_page_size(h));
 			if (likely(vmf->pte &&
-				   pte_same(huge_ptep_get(vmf->pte), pte)))
+				   pte_same(huge_ptep_get(mm, vmf->address, vmf->pte), pte)))
 				goto retry_avoidcopy;
 			/*
 			 * race occurs while re-acquiring page table
@@ -6082,7 +6082,7 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
 	 */
 	spin_lock(vmf->ptl);
 	vmf->pte = hugetlb_walk(vma, vmf->address, huge_page_size(h));
-	if (likely(vmf->pte && pte_same(huge_ptep_get(vmf->pte), pte))) {
+	if (likely(vmf->pte && pte_same(huge_ptep_get(mm, vmf->address, vmf->pte), pte))) {
 		pte_t newpte = make_huge_pte(vma, &new_folio->page, !unshare);
 
 		/* Break COW or unshare */
@@ -6183,14 +6183,14 @@ static inline vm_fault_t hugetlb_handle_userfault(struct vm_fault *vmf,
  * Recheck pte with pgtable lock.  Returns true if pte didn't change, or
  * false if pte changed or is changing.
  */
-static bool hugetlb_pte_stable(struct hstate *h, struct mm_struct *mm,
+static bool hugetlb_pte_stable(struct hstate *h, struct mm_struct *mm, unsigned long addr,
 			       pte_t *ptep, pte_t old_pte)
 {
 	spinlock_t *ptl;
 	bool same;
 
 	ptl = huge_pte_lock(h, mm, ptep);
-	same = pte_same(huge_ptep_get(ptep), old_pte);
+	same = pte_same(huge_ptep_get(mm, addr, ptep), old_pte);
 	spin_unlock(ptl);
 
 	return same;
@@ -6251,7 +6251,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 			 * never happen on the page after UFFDIO_COPY has
 			 * correctly installed the page and returned.
 			 */
-			if (!hugetlb_pte_stable(h, mm, vmf->pte, vmf->orig_pte)) {
+			if (!hugetlb_pte_stable(h, mm, vmf->address, vmf->pte, vmf->orig_pte)) {
 				ret = 0;
 				goto out;
 			}
@@ -6280,7 +6280,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 			 * here.  Before returning error, get ptl and make
 			 * sure there really is no pte entry.
 			 */
-			if (hugetlb_pte_stable(h, mm, vmf->pte, vmf->orig_pte))
+			if (hugetlb_pte_stable(h, mm, vmf->address, vmf->pte, vmf->orig_pte))
 				ret = vmf_error(PTR_ERR(folio));
 			else
 				ret = 0;
@@ -6330,7 +6330,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 			folio_unlock(folio);
 			folio_put(folio);
 			/* See comment in userfaultfd_missing() block above */
-			if (!hugetlb_pte_stable(h, mm, vmf->pte, vmf->orig_pte)) {
+			if (!hugetlb_pte_stable(h, mm, vmf->address, vmf->pte, vmf->orig_pte)) {
 				ret = 0;
 				goto out;
 			}
@@ -6357,7 +6357,7 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
 	vmf->ptl = huge_pte_lock(h, mm, vmf->pte);
 	ret = 0;
 	/* If pte changed from under us, retry */
-	if (!pte_same(huge_ptep_get(vmf->pte), vmf->orig_pte))
+	if (!pte_same(huge_ptep_get(mm, vmf->address, vmf->pte), vmf->orig_pte))
 		goto backout;
 
 	if (anon_rmap)
@@ -6478,7 +6478,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 		return VM_FAULT_OOM;
 	}
 
-	vmf.orig_pte = huge_ptep_get(vmf.pte);
+	vmf.orig_pte = huge_ptep_get(mm, vmf.address, vmf.pte);
 	if (huge_pte_none_mostly(vmf.orig_pte)) {
 		if (is_pte_marker(vmf.orig_pte)) {
 			pte_marker marker =
@@ -6519,7 +6519,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 			 * be released there.
 			 */
 			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
-			migration_entry_wait_huge(vma, vmf.pte);
+			migration_entry_wait_huge(vma, vmf.address, vmf.pte);
 			return 0;
 		} else if (unlikely(is_hugetlb_entry_hwpoisoned(vmf.orig_pte)))
 			ret = VM_FAULT_HWPOISON_LARGE |
@@ -6552,11 +6552,11 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 	vmf.ptl = huge_pte_lock(h, mm, vmf.pte);
 
 	/* Check for a racing update before calling hugetlb_wp() */
-	if (unlikely(!pte_same(vmf.orig_pte, huge_ptep_get(vmf.pte))))
+	if (unlikely(!pte_same(vmf.orig_pte, huge_ptep_get(mm, vmf.address, vmf.pte))))
 		goto out_ptl;
 
 	/* Handle userfault-wp first, before trying to lock more pages */
-	if (userfaultfd_wp(vma) && huge_pte_uffd_wp(huge_ptep_get(vmf.pte)) &&
+	if (userfaultfd_wp(vma) && huge_pte_uffd_wp(huge_ptep_get(mm, vmf.address, vmf.pte)) &&
 	    (flags & FAULT_FLAG_WRITE) && !huge_pte_write(vmf.orig_pte)) {
 		if (!userfaultfd_wp_async(vma)) {
 			spin_unlock(vmf.ptl);
@@ -6684,7 +6684,7 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
 		ptl = huge_pte_lock(h, dst_mm, dst_pte);
 
 		/* Don't overwrite any existing PTEs (even markers) */
-		if (!huge_pte_none(huge_ptep_get(dst_pte))) {
+		if (!huge_pte_none(huge_ptep_get(dst_mm, dst_addr, dst_pte))) {
 			spin_unlock(ptl);
 			return -EEXIST;
 		}
@@ -6821,7 +6821,7 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
 	 * page backing it, then access the page.
 	 */
 	ret = -EEXIST;
-	if (!huge_pte_none_mostly(huge_ptep_get(dst_pte)))
+	if (!huge_pte_none_mostly(huge_ptep_get(dst_mm, dst_addr, dst_pte)))
 		goto out_release_unlock;
 
 	if (folio_in_pagecache)
@@ -6942,7 +6942,7 @@ long hugetlb_change_protection(struct vm_area_struct *vma,
 			address |= last_addr_mask;
 			continue;
 		}
-		pte = huge_ptep_get(ptep);
+		pte = huge_ptep_get(mm, address, ptep);
 		if (unlikely(is_hugetlb_entry_hwpoisoned(pte))) {
 			/* Nothing to do. */
 		} else if (unlikely(is_hugetlb_entry_migration(pte))) {
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index d3c830e817e3..b8216b769784 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -834,7 +834,7 @@ static int hwpoison_hugetlb_range(pte_t *ptep, unsigned long hmask,
 			    struct mm_walk *walk)
 {
 	struct hwpoison_walk *hwp = walk->private;
-	pte_t pte = huge_ptep_get(ptep);
+	pte_t pte = huge_ptep_get(walk->mm, addr, ptep);
 	struct hstate *h = hstate_vma(walk->vma);
 
 	return check_hwpoisoned_entry(pte, addr, huge_page_shift(h),
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index aec756ae5637..b01bb1ebfee7 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -624,7 +624,7 @@ static int queue_folios_hugetlb(pte_t *pte, unsigned long hmask,
 	pte_t entry;
 
 	ptl = huge_pte_lock(hstate_vma(walk->vma), walk->mm, pte);
-	entry = huge_ptep_get(pte);
+	entry = huge_ptep_get(walk->mm, addr, pte);
 	if (!pte_present(entry)) {
 		if (unlikely(is_hugetlb_entry_migration(entry)))
 			qp->nr_failed++;
diff --git a/mm/migrate.c b/mm/migrate.c
index dd04f578c19c..4862c5924a9d 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -338,14 +338,14 @@ void migration_entry_wait(struct mm_struct *mm, pmd_t *pmd,
  *
  * This function will release the vma lock before returning.
  */
-void migration_entry_wait_huge(struct vm_area_struct *vma, pte_t *ptep)
+void migration_entry_wait_huge(struct vm_area_struct *vma, unsigned long addr, pte_t *ptep)
 {
 	spinlock_t *ptl = huge_pte_lockptr(hstate_vma(vma), vma->vm_mm, ptep);
 	pte_t pte;
 
 	hugetlb_vma_assert_locked(vma);
 	spin_lock(ptl);
-	pte = huge_ptep_get(ptep);
+	pte = huge_ptep_get(vma->vm_mm, addr, ptep);
 
 	if (unlikely(!is_hugetlb_entry_migration(pte))) {
 		spin_unlock(ptl);
diff --git a/mm/mincore.c b/mm/mincore.c
index dad3622cc963..b5735a4aaa7d 100644
--- a/mm/mincore.c
+++ b/mm/mincore.c
@@ -33,7 +33,7 @@ static int mincore_hugetlb(pte_t *pte, unsigned long hmask, unsigned long addr,
 	 * Hugepages under user process are always in RAM and never
 	 * swapped out, but theoretically it needs to be checked.
 	 */
-	present = pte && !huge_pte_none_mostly(huge_ptep_get(pte));
+	present = pte && !huge_pte_none_mostly(huge_ptep_get(walk->mm, addr, pte));
 	for (; addr != end; vec++, addr += PAGE_SIZE)
 		*vec = present;
 	walk->private = vec;
diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index defa5109cc62..8f1fd5af5909 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -587,7 +587,7 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 		}
 
 		if (!uffd_flags_mode_is(flags, MFILL_ATOMIC_CONTINUE) &&
-		    !huge_pte_none_mostly(huge_ptep_get(dst_pte))) {
+		    !huge_pte_none_mostly(huge_ptep_get(dst_mm, dst_addr, dst_pte))) {
 			err = -EEXIST;
 			hugetlb_vma_unlock_read(dst_vma);
 			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
-- 
2.44.0

