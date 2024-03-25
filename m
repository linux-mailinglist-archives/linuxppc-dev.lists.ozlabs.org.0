Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC8788A578
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 15:58:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3GJw5P1Zz3vqp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 01:58:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3GHB4wHhz3vZm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 01:56:54 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4V3GGR5XzZz9sr6;
	Mon, 25 Mar 2024 15:56:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqjE_cfuK08a; Mon, 25 Mar 2024 15:56:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4V3GGK5Fzmz9sjs;
	Mon, 25 Mar 2024 15:56:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B0DE68B770;
	Mon, 25 Mar 2024 15:56:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id qP-I5BmsK7sT; Mon, 25 Mar 2024 15:56:09 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 53A098B76D;
	Mon, 25 Mar 2024 15:56:09 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>
Subject: [RFC PATCH 4/8] mm: Provide mm_struct and address to huge_ptep_get()
Date: Mon, 25 Mar 2024 15:55:57 +0100
Message-ID: <1abe6cfaba2ad41a9deb705a4d3de8d1a9b6d5ca.1711377230.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1711377230.git.christophe.leroy@csgroup.eu>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711378567; l=18435; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=WR9OVHGFiV54vVPSUXvghSAnRwewayw3cf217moexVA=; b=xEUD/lUcLiU9V6GE2m2YsyFeG1/EHoGfkQckZ++0SnKodrrkujAcXnjcRt9fjXZemrFP7OD02 jzx67AauV5IBYAsXcrNUmEXeoIFZn1vkUp6DVI/BY/ZlLu9PCYShSuI
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
---
 arch/arm64/include/asm/hugetlb.h |  2 +-
 fs/hugetlbfs/inode.c             |  2 +-
 fs/proc/task_mmu.c               |  8 +++---
 fs/userfaultfd.c                 |  2 +-
 include/asm-generic/hugetlb.h    |  2 +-
 include/linux/swapops.h          |  2 +-
 mm/damon/vaddr.c                 |  6 ++---
 mm/gup.c                         |  2 +-
 mm/hmm.c                         |  2 +-
 mm/hugetlb.c                     | 46 ++++++++++++++++----------------
 mm/memory-failure.c              |  2 +-
 mm/mempolicy.c                   |  2 +-
 mm/migrate.c                     |  4 +--
 mm/mincore.c                     |  2 +-
 mm/userfaultfd.c                 |  2 +-
 15 files changed, 43 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/include/asm/hugetlb.h b/arch/arm64/include/asm/hugetlb.h
index 2ddc33d93b13..1af39a74e791 100644
--- a/arch/arm64/include/asm/hugetlb.h
+++ b/arch/arm64/include/asm/hugetlb.h
@@ -46,7 +46,7 @@ extern pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 extern void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
 			   pte_t *ptep, unsigned long sz);
 #define __HAVE_ARCH_HUGE_PTEP_GET
-extern pte_t huge_ptep_get(pte_t *ptep);
+extern pte_t huge_ptep_get(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
 
 void __init arm64_hugetlb_cma_reserve(void);
 
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 6502c7e776d1..ec3ec87d29e7 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -425,7 +425,7 @@ static bool hugetlb_vma_maps_page(struct vm_area_struct *vma,
 	if (!ptep)
 		return false;
 
-	pte = huge_ptep_get(ptep);
+	pte = huge_ptep_get(vma->vm_mm, addr, ptep);
 	if (huge_pte_none(pte) || !pte_present(pte))
 		return false;
 
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 23fbab954c20..b14081bcdafe 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -1572,7 +1572,7 @@ static int pagemap_hugetlb_range(pte_t *ptep, unsigned long hmask,
 	if (vma->vm_flags & VM_SOFTDIRTY)
 		flags |= PM_SOFT_DIRTY;
 
-	pte = huge_ptep_get(ptep);
+	pte = huge_ptep_get(walk->mm, addr, ptep);
 	if (pte_present(pte)) {
 		struct page *page = pte_page(pte);
 
@@ -2256,7 +2256,7 @@ static int pagemap_scan_hugetlb_entry(pte_t *ptep, unsigned long hmask,
 	if (~p->arg.flags & PM_SCAN_WP_MATCHING) {
 		/* Go the short route when not write-protecting pages. */
 
-		pte = huge_ptep_get(ptep);
+		pte = huge_ptep_get(walk->mm, start, ptep);
 		categories = p->cur_vma_category | pagemap_hugetlb_category(pte);
 
 		if (!pagemap_scan_is_interesting_page(categories, p))
@@ -2268,7 +2268,7 @@ static int pagemap_scan_hugetlb_entry(pte_t *ptep, unsigned long hmask,
 	i_mmap_lock_write(vma->vm_file->f_mapping);
 	ptl = huge_pte_lock(hstate_vma(vma), vma->vm_mm, ptep);
 
-	pte = huge_ptep_get(ptep);
+	pte = huge_ptep_get(walk->mm, start, ptep);
 	categories = p->cur_vma_category | pagemap_hugetlb_category(pte);
 
 	if (!pagemap_scan_is_interesting_page(categories, p))
@@ -2663,7 +2663,7 @@ static int gather_pte_stats(pmd_t *pmd, unsigned long addr,
 static int gather_hugetlb_stats(pte_t *pte, unsigned long hmask,
 		unsigned long addr, unsigned long end, struct mm_walk *walk)
 {
-	pte_t huge_pte = huge_ptep_get(pte);
+	pte_t huge_pte = huge_ptep_get(walk->mm, addr, pte);
 	struct numa_maps *md;
 	struct page *page;
 
diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
index 60dcfafdc11a..177fe1ff14d7 100644
--- a/fs/userfaultfd.c
+++ b/fs/userfaultfd.c
@@ -256,7 +256,7 @@ static inline bool userfaultfd_huge_must_wait(struct userfaultfd_ctx *ctx,
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
index 48b700ba1d18..b9a9f5003bf5 100644
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
index df83182ec72d..ae3f27fc9cc5 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2800,7 +2800,7 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 	if (pte_end < end)
 		end = pte_end;
 
-	pte = huge_ptep_get(ptep);
+	pte = huge_ptep_get(NULL, addr, ptep);
 
 	if (!pte_access_permitted(pte, flags & FOLL_WRITE))
 		return 0;
diff --git a/mm/hmm.c b/mm/hmm.c
index 277ddcab4947..91a0b57fcb2e 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -485,7 +485,7 @@ static int hmm_vma_walk_hugetlb_entry(pte_t *pte, unsigned long hmask,
 	pte_t entry;
 
 	ptl = huge_pte_lock(hstate_vma(vma), walk->mm, pte);
-	entry = huge_ptep_get(pte);
+	entry = huge_ptep_get(walk->mm, addr, pte);
 
 	i = (start - range->start) >> PAGE_SHIFT;
 	pfn_req_flags = range->hmm_pfns[i];
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 23ef240ba48a..cfe1cf2f30dc 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5334,7 +5334,7 @@ static void set_huge_ptep_writable(struct vm_area_struct *vma,
 {
 	pte_t entry;
 
-	entry = huge_pte_mkwrite(huge_pte_mkdirty(huge_ptep_get(ptep)));
+	entry = huge_pte_mkwrite(huge_pte_mkdirty(huge_ptep_get(vma->vm_mm, address, ptep)));
 	if (huge_ptep_set_access_flags(vma, address, ptep, entry, 1))
 		update_mmu_cache(vma, address, ptep);
 }
@@ -5442,7 +5442,7 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 		dst_ptl = huge_pte_lock(h, dst, dst_pte);
 		src_ptl = huge_pte_lockptr(h, src, src_pte);
 		spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
-		entry = huge_ptep_get(src_pte);
+		entry = huge_ptep_get(src_vma->vm_mm, addr, src_pte);
 again:
 		if (huge_pte_none(entry)) {
 			/*
@@ -5480,7 +5480,7 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 				set_huge_pte_at(dst, addr, dst_pte,
 						make_pte_marker(marker), sz);
 		} else {
-			entry = huge_ptep_get(src_pte);
+			entry = huge_ptep_get(src_vma->vm_mm, addr, src_pte);
 			pte_folio = page_folio(pte_page(entry));
 			folio_get(pte_folio);
 
@@ -5522,7 +5522,7 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 				dst_ptl = huge_pte_lock(h, dst, dst_pte);
 				src_ptl = huge_pte_lockptr(h, src, src_pte);
 				spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
-				entry = huge_ptep_get(src_pte);
+				entry = huge_ptep_get(src_vma->vm_mm, addr, src_pte);
 				if (!pte_same(src_pte_old, entry)) {
 					restore_reserve_on_error(h, dst_vma, addr,
 								new_folio);
@@ -5632,7 +5632,7 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 			new_addr |= last_addr_mask;
 			continue;
 		}
-		if (huge_pte_none(huge_ptep_get(src_pte)))
+		if (huge_pte_none(huge_ptep_get(mm, old_addr, src_pte)))
 			continue;
 
 		if (huge_pmd_unshare(mm, vma, old_addr, src_pte)) {
@@ -5705,7 +5705,7 @@ void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct *vma,
 			continue;
 		}
 
-		pte = huge_ptep_get(ptep);
+		pte = huge_ptep_get(mm, address, ptep);
 		if (huge_pte_none(pte)) {
 			spin_unlock(ptl);
 			continue;
@@ -5942,7 +5942,7 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
 		       struct vm_fault *vmf)
 {
 	const bool unshare = flags & FAULT_FLAG_UNSHARE;
-	pte_t pte = huge_ptep_get(ptep);
+	pte_t pte = huge_ptep_get(mm, address, ptep);
 	struct hstate *h = hstate_vma(vma);
 	struct folio *old_folio;
 	struct folio *new_folio;
@@ -6055,7 +6055,7 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
 			spin_lock(ptl);
 			ptep = hugetlb_walk(vma, haddr, huge_page_size(h));
 			if (likely(ptep &&
-				   pte_same(huge_ptep_get(ptep), pte)))
+				   pte_same(huge_ptep_get(mm, haddr, ptep), pte)))
 				goto retry_avoidcopy;
 			/*
 			 * race occurs while re-acquiring page table
@@ -6093,7 +6093,7 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
 	 */
 	spin_lock(ptl);
 	ptep = hugetlb_walk(vma, haddr, huge_page_size(h));
-	if (likely(ptep && pte_same(huge_ptep_get(ptep), pte))) {
+	if (likely(ptep && pte_same(huge_ptep_get(mm, haddr, ptep), pte))) {
 		pte_t newpte = make_huge_pte(vma, &new_folio->page, !unshare);
 
 		/* Break COW or unshare */
@@ -6193,14 +6193,14 @@ static inline vm_fault_t hugetlb_handle_userfault(struct vm_fault *vmf,
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
@@ -6265,7 +6265,7 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
 			 * never happen on the page after UFFDIO_COPY has
 			 * correctly installed the page and returned.
 			 */
-			if (!hugetlb_pte_stable(h, mm, ptep, old_pte)) {
+			if (!hugetlb_pte_stable(h, mm, haddr, ptep, old_pte)) {
 				ret = 0;
 				goto out;
 			}
@@ -6288,7 +6288,7 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
 			 * here.  Before returning error, get ptl and make
 			 * sure there really is no pte entry.
 			 */
-			if (hugetlb_pte_stable(h, mm, ptep, old_pte))
+			if (hugetlb_pte_stable(h, mm, haddr, ptep, old_pte))
 				ret = vmf_error(PTR_ERR(folio));
 			else
 				ret = 0;
@@ -6338,7 +6338,7 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
 			folio_unlock(folio);
 			folio_put(folio);
 			/* See comment in userfaultfd_missing() block above */
-			if (!hugetlb_pte_stable(h, mm, ptep, old_pte)) {
+			if (!hugetlb_pte_stable(h, mm, haddr, ptep, old_pte)) {
 				ret = 0;
 				goto out;
 			}
@@ -6365,7 +6365,7 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
 	ptl = huge_pte_lock(h, mm, ptep);
 	ret = 0;
 	/* If pte changed from under us, retry */
-	if (!pte_same(huge_ptep_get(ptep), old_pte))
+	if (!pte_same(huge_ptep_get(mm, address, ptep), old_pte))
 		goto backout;
 
 	if (anon_rmap)
@@ -6488,7 +6488,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 		return VM_FAULT_OOM;
 	}
 
-	entry = huge_ptep_get(ptep);
+	entry = huge_ptep_get(mm, address, ptep);
 	if (huge_pte_none_mostly(entry)) {
 		if (is_pte_marker(entry)) {
 			pte_marker marker =
@@ -6529,7 +6529,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 			 * be released there.
 			 */
 			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
-			migration_entry_wait_huge(vma, ptep);
+			migration_entry_wait_huge(vma, haddr, ptep);
 			return 0;
 		} else if (unlikely(is_hugetlb_entry_hwpoisoned(entry)))
 			ret = VM_FAULT_HWPOISON_LARGE |
@@ -6562,11 +6562,11 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 	ptl = huge_pte_lock(h, mm, ptep);
 
 	/* Check for a racing update before calling hugetlb_wp() */
-	if (unlikely(!pte_same(entry, huge_ptep_get(ptep))))
+	if (unlikely(!pte_same(entry, huge_ptep_get(mm, address, ptep))))
 		goto out_ptl;
 
 	/* Handle userfault-wp first, before trying to lock more pages */
-	if (userfaultfd_wp(vma) && huge_pte_uffd_wp(huge_ptep_get(ptep)) &&
+	if (userfaultfd_wp(vma) && huge_pte_uffd_wp(huge_ptep_get(mm, address, ptep)) &&
 	    (flags & FAULT_FLAG_WRITE) && !huge_pte_write(entry)) {
 		if (!userfaultfd_wp_async(vma)) {
 			spin_unlock(ptl);
@@ -6689,7 +6689,7 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
 		ptl = huge_pte_lock(h, dst_mm, dst_pte);
 
 		/* Don't overwrite any existing PTEs (even markers) */
-		if (!huge_pte_none(huge_ptep_get(dst_pte))) {
+		if (!huge_pte_none(huge_ptep_get(mm, dst_addr, dst_pte))) {
 			spin_unlock(ptl);
 			return -EEXIST;
 		}
@@ -6826,7 +6826,7 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
 	 * page backing it, then access the page.
 	 */
 	ret = -EEXIST;
-	if (!huge_pte_none_mostly(huge_ptep_get(dst_pte)))
+	if (!huge_pte_none_mostly(huge_ptep_get(mm, dst_addr, dst_pte)))
 		goto out_release_unlock;
 
 	if (folio_in_pagecache)
@@ -6901,7 +6901,7 @@ struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
 		goto out_unlock;
 
 	ptl = huge_pte_lock(h, mm, pte);
-	entry = huge_ptep_get(pte);
+	entry = huge_ptep_get(mm, address, pte);
 	if (pte_present(entry)) {
 		page = pte_page(entry);
 
@@ -7018,7 +7018,7 @@ long hugetlb_change_protection(struct vm_area_struct *vma,
 			address |= last_addr_mask;
 			continue;
 		}
-		pte = huge_ptep_get(ptep);
+		pte = huge_ptep_get(mm, address, ptep);
 		if (unlikely(is_hugetlb_entry_hwpoisoned(pte))) {
 			/* Nothing to do. */
 		} else if (unlikely(is_hugetlb_entry_migration(pte))) {
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 9349948f1abf..7c65340b1adb 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -820,7 +820,7 @@ static int hwpoison_hugetlb_range(pte_t *ptep, unsigned long hmask,
 			    struct mm_walk *walk)
 {
 	struct hwpoison_walk *hwp = walk->private;
-	pte_t pte = huge_ptep_get(ptep);
+	pte_t pte = huge_ptep_get(walk->mm, addr, ptep);
 	struct hstate *h = hstate_vma(walk->vma);
 
 	return check_hwpoisoned_entry(pte, addr, huge_page_shift(h),
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 0fe77738d971..50a79700f496 100644
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
index 73a052a382f1..87f7aedb8ee2 100644
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
index 9baf507ce193..2b2ce329552e 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -555,7 +555,7 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
 		}
 
 		if (!uffd_flags_mode_is(flags, MFILL_ATOMIC_CONTINUE) &&
-		    !huge_pte_none_mostly(huge_ptep_get(dst_pte))) {
+		    !huge_pte_none_mostly(huge_ptep_get(dst_mm, dst_addr, dst_pte))) {
 			err = -EEXIST;
 			hugetlb_vma_unlock_read(dst_vma);
 			mutex_unlock(&hugetlb_fault_mutex_table[hash]);
-- 
2.43.0

