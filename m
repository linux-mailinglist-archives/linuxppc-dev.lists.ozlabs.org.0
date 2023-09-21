Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C05A7AAB01
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 09:59:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsPmL6PCLz3fNk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 17:58:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs16L0xXpz3cCT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 02:28:08 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 914391762;
	Thu, 21 Sep 2023 09:21:28 -0700 (PDT)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C22D3F59C;
	Thu, 21 Sep 2023 09:20:46 -0700 (PDT)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Lorenzo Stoakes <lstoakes@gmail.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Peter Xu <peterx@redhat.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v1 6/8] mm: hugetlb: Convert set_huge_pte_at() to take vma
Date: Thu, 21 Sep 2023 17:20:05 +0100
Message-Id: <20230921162007.1630149-7-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230921162007.1630149-1-ryan.roberts@arm.com>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Sep 2023 17:56:48 +1000
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
Cc: linux-s390@vger.kernel.org, Ryan Roberts <ryan.roberts@arm.com>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to fix a bug, arm64 needs access to the vma inside it's
implementation of set_huge_pte_at(). Provide for this by converting the
mm parameter to be a vma. Any implementations that require the mm can
access it via vma->vm_mm.

This commit makes the required modifications to the core mm. Separate
commits update the arches, before the actual bug is fixed in arm64.

No behavioral changes intended.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/asm-generic/hugetlb.h |  6 +++---
 include/linux/hugetlb.h       |  6 +++---
 mm/damon/vaddr.c              |  2 +-
 mm/hugetlb.c                  | 30 +++++++++++++++---------------
 mm/migrate.c                  |  2 +-
 mm/rmap.c                     | 10 +++++-----
 mm/vmalloc.c                  |  5 ++++-
 7 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/include/asm-generic/hugetlb.h b/include/asm-generic/hugetlb.h
index 4da02798a00b..515e4777fb65 100644
--- a/include/asm-generic/hugetlb.h
+++ b/include/asm-generic/hugetlb.h
@@ -75,10 +75,10 @@ static inline void hugetlb_free_pgd_range(struct mmu_gather *tlb,
 #endif
 
 #ifndef __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
-static inline void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
-		pte_t *ptep, pte_t pte)
+static inline void set_huge_pte_at(struct vm_area_struct *vma,
+		unsigned long addr, pte_t *ptep, pte_t pte)
 {
-	set_pte_at(mm, addr, ptep, pte);
+	set_pte_at(vma->vm_mm, addr, ptep, pte);
 }
 #endif
 
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 5b2626063f4f..08184f32430c 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -984,7 +984,7 @@ static inline void huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
 						unsigned long addr, pte_t *ptep,
 						pte_t old_pte, pte_t pte)
 {
-	set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
+	set_huge_pte_at(vma, addr, ptep, pte);
 }
 #endif
 
@@ -1172,8 +1172,8 @@ static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 #endif
 }
 
-static inline void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
-				   pte_t *ptep, pte_t pte)
+static inline void set_huge_pte_at(struct vm_area_struct *vma,
+				   unsigned long addr, pte_t *ptep, pte_t pte)
 {
 }
 
diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
index 4c81a9dbd044..55da8cee8fbc 100644
--- a/mm/damon/vaddr.c
+++ b/mm/damon/vaddr.c
@@ -347,7 +347,7 @@ static void damon_hugetlb_mkold(pte_t *pte, struct mm_struct *mm,
 	if (pte_young(entry)) {
 		referenced = true;
 		entry = pte_mkold(entry);
-		set_huge_pte_at(mm, addr, pte, entry);
+		set_huge_pte_at(vma, addr, pte, entry);
 	}
 
 #ifdef CONFIG_MMU_NOTIFIER
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ba6d39b71cb1..bcc30cd62586 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4988,7 +4988,7 @@ hugetlb_install_folio(struct vm_area_struct *vma, pte_t *ptep, unsigned long add
 	hugepage_add_new_anon_rmap(new_folio, vma, addr);
 	if (userfaultfd_wp(vma) && huge_pte_uffd_wp(old))
 		newpte = huge_pte_mkuffd_wp(newpte);
-	set_huge_pte_at(vma->vm_mm, addr, ptep, newpte);
+	set_huge_pte_at(vma, addr, ptep, newpte);
 	hugetlb_count_add(pages_per_huge_page(hstate_vma(vma)), vma->vm_mm);
 	folio_set_hugetlb_migratable(new_folio);
 }
@@ -5065,7 +5065,7 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 		} else if (unlikely(is_hugetlb_entry_hwpoisoned(entry))) {
 			if (!userfaultfd_wp(dst_vma))
 				entry = huge_pte_clear_uffd_wp(entry);
-			set_huge_pte_at(dst, addr, dst_pte, entry);
+			set_huge_pte_at(dst_vma, addr, dst_pte, entry);
 		} else if (unlikely(is_hugetlb_entry_migration(entry))) {
 			swp_entry_t swp_entry = pte_to_swp_entry(entry);
 			bool uffd_wp = pte_swp_uffd_wp(entry);
@@ -5080,17 +5080,17 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 				entry = swp_entry_to_pte(swp_entry);
 				if (userfaultfd_wp(src_vma) && uffd_wp)
 					entry = pte_swp_mkuffd_wp(entry);
-				set_huge_pte_at(src, addr, src_pte, entry);
+				set_huge_pte_at(src_vma, addr, src_pte, entry);
 			}
 			if (!userfaultfd_wp(dst_vma))
 				entry = huge_pte_clear_uffd_wp(entry);
-			set_huge_pte_at(dst, addr, dst_pte, entry);
+			set_huge_pte_at(dst_vma, addr, dst_pte, entry);
 		} else if (unlikely(is_pte_marker(entry))) {
 			pte_marker marker = copy_pte_marker(
 				pte_to_swp_entry(entry), dst_vma);
 
 			if (marker)
-				set_huge_pte_at(dst, addr, dst_pte,
+				set_huge_pte_at(dst_vma, addr, dst_pte,
 						make_pte_marker(marker));
 		} else {
 			entry = huge_ptep_get(src_pte);
@@ -5166,7 +5166,7 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 			if (!userfaultfd_wp(dst_vma))
 				entry = huge_pte_clear_uffd_wp(entry);
 
-			set_huge_pte_at(dst, addr, dst_pte, entry);
+			set_huge_pte_at(dst_vma, addr, dst_pte, entry);
 			hugetlb_count_add(npages, dst);
 		}
 		spin_unlock(src_ptl);
@@ -5202,7 +5202,7 @@ static void move_huge_pte(struct vm_area_struct *vma, unsigned long old_addr,
 		spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
 
 	pte = huge_ptep_get_and_clear(mm, old_addr, src_pte);
-	set_huge_pte_at(mm, new_addr, dst_pte, pte);
+	set_huge_pte_at(vma, new_addr, dst_pte, pte);
 
 	if (src_ptl != dst_ptl)
 		spin_unlock(src_ptl);
@@ -5336,7 +5336,7 @@ static void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct
 			 */
 			if (pte_swp_uffd_wp_any(pte) &&
 			    !(zap_flags & ZAP_FLAG_DROP_MARKER))
-				set_huge_pte_at(mm, address, ptep,
+				set_huge_pte_at(vma, address, ptep,
 						make_pte_marker(PTE_MARKER_UFFD_WP));
 			else
 				huge_pte_clear(mm, address, ptep, sz);
@@ -5370,7 +5370,7 @@ static void __unmap_hugepage_range(struct mmu_gather *tlb, struct vm_area_struct
 		/* Leave a uffd-wp pte marker if needed */
 		if (huge_pte_uffd_wp(pte) &&
 		    !(zap_flags & ZAP_FLAG_DROP_MARKER))
-			set_huge_pte_at(mm, address, ptep,
+			set_huge_pte_at(vma, address, ptep,
 					make_pte_marker(PTE_MARKER_UFFD_WP));
 		hugetlb_count_sub(pages_per_huge_page(h), mm);
 		page_remove_rmap(page, vma, true);
@@ -5676,7 +5676,7 @@ static vm_fault_t hugetlb_wp(struct mm_struct *mm, struct vm_area_struct *vma,
 		hugepage_add_new_anon_rmap(new_folio, vma, haddr);
 		if (huge_pte_uffd_wp(pte))
 			newpte = huge_pte_mkuffd_wp(newpte);
-		set_huge_pte_at(mm, haddr, ptep, newpte);
+		set_huge_pte_at(vma, haddr, ptep, newpte);
 		folio_set_hugetlb_migratable(new_folio);
 		/* Make the old page be freed below */
 		new_folio = old_folio;
@@ -5972,7 +5972,7 @@ static vm_fault_t hugetlb_no_page(struct mm_struct *mm,
 	 */
 	if (unlikely(pte_marker_uffd_wp(old_pte)))
 		new_pte = huge_pte_mkuffd_wp(new_pte);
-	set_huge_pte_at(mm, haddr, ptep, new_pte);
+	set_huge_pte_at(vma, haddr, ptep, new_pte);
 
 	hugetlb_count_add(pages_per_huge_page(h), mm);
 	if ((flags & FAULT_FLAG_WRITE) && !(vma->vm_flags & VM_SHARED)) {
@@ -6261,7 +6261,7 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
 		}
 
 		_dst_pte = make_pte_marker(PTE_MARKER_POISONED);
-		set_huge_pte_at(dst_mm, dst_addr, dst_pte, _dst_pte);
+		set_huge_pte_at(dst_vma, dst_addr, dst_pte, _dst_pte);
 
 		/* No need to invalidate - it was non-present before */
 		update_mmu_cache(dst_vma, dst_addr, dst_pte);
@@ -6412,7 +6412,7 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
 	if (wp_enabled)
 		_dst_pte = huge_pte_mkuffd_wp(_dst_pte);
 
-	set_huge_pte_at(dst_mm, dst_addr, dst_pte, _dst_pte);
+	set_huge_pte_at(dst_vma, dst_addr, dst_pte, _dst_pte);
 
 	hugetlb_count_add(pages_per_huge_page(h), dst_mm);
 
@@ -6598,7 +6598,7 @@ long hugetlb_change_protection(struct vm_area_struct *vma,
 			else if (uffd_wp_resolve)
 				newpte = pte_swp_clear_uffd_wp(newpte);
 			if (!pte_same(pte, newpte))
-				set_huge_pte_at(mm, address, ptep, newpte);
+				set_huge_pte_at(vma, address, ptep, newpte);
 		} else if (unlikely(is_pte_marker(pte))) {
 			/* No other markers apply for now. */
 			WARN_ON_ONCE(!pte_marker_uffd_wp(pte));
@@ -6622,7 +6622,7 @@ long hugetlb_change_protection(struct vm_area_struct *vma,
 			/* None pte */
 			if (unlikely(uffd_wp))
 				/* Safe to modify directly (none->non-present). */
-				set_huge_pte_at(mm, address, ptep,
+				set_huge_pte_at(vma, address, ptep,
 						make_pte_marker(PTE_MARKER_UFFD_WP));
 		}
 		spin_unlock(ptl);
diff --git a/mm/migrate.c b/mm/migrate.c
index b7fa020003f3..6aa752984f32 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -251,7 +251,7 @@ static bool remove_migration_pte(struct folio *folio,
 						       rmap_flags);
 			else
 				page_dup_file_rmap(new, true);
-			set_huge_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
+			set_huge_pte_at(vma, pvmw.address, pvmw.pte, pte);
 		} else
 #endif
 		{
diff --git a/mm/rmap.c b/mm/rmap.c
index ec7f8e6c9e48..a6353a0c67e8 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1628,7 +1628,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
 			if (folio_test_hugetlb(folio)) {
 				hugetlb_count_sub(folio_nr_pages(folio), mm);
-				set_huge_pte_at(mm, address, pvmw.pte, pteval);
+				set_huge_pte_at(vma, address, pvmw.pte, pteval);
 			} else {
 				dec_mm_counter(mm, mm_counter(&folio->page));
 				set_pte_at(mm, address, pvmw.pte, pteval);
@@ -2020,7 +2020,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			pteval = swp_entry_to_pte(make_hwpoison_entry(subpage));
 			if (folio_test_hugetlb(folio)) {
 				hugetlb_count_sub(folio_nr_pages(folio), mm);
-				set_huge_pte_at(mm, address, pvmw.pte, pteval);
+				set_huge_pte_at(vma, address, pvmw.pte, pteval);
 			} else {
 				dec_mm_counter(mm, mm_counter(&folio->page));
 				set_pte_at(mm, address, pvmw.pte, pteval);
@@ -2044,7 +2044,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 
 			if (arch_unmap_one(mm, vma, address, pteval) < 0) {
 				if (folio_test_hugetlb(folio))
-					set_huge_pte_at(mm, address, pvmw.pte, pteval);
+					set_huge_pte_at(vma, address, pvmw.pte, pteval);
 				else
 					set_pte_at(mm, address, pvmw.pte, pteval);
 				ret = false;
@@ -2058,7 +2058,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			if (anon_exclusive &&
 			    page_try_share_anon_rmap(subpage)) {
 				if (folio_test_hugetlb(folio))
-					set_huge_pte_at(mm, address, pvmw.pte, pteval);
+					set_huge_pte_at(vma, address, pvmw.pte, pteval);
 				else
 					set_pte_at(mm, address, pvmw.pte, pteval);
 				ret = false;
@@ -2090,7 +2090,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 			if (pte_uffd_wp(pteval))
 				swp_pte = pte_swp_mkuffd_wp(swp_pte);
 			if (folio_test_hugetlb(folio))
-				set_huge_pte_at(mm, address, pvmw.pte, swp_pte);
+				set_huge_pte_at(vma, address, pvmw.pte, swp_pte);
 			else
 				set_pte_at(mm, address, pvmw.pte, swp_pte);
 			trace_set_migration_pte(address, pte_val(swp_pte),
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index ef8599d394fd..10fa40222f30 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -94,6 +94,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
 			unsigned int max_page_shift, pgtbl_mod_mask *mask)
 {
+#ifdef CONFIG_HUGETLB_PAGE
+	struct vm_area_struct vma = TLB_FLUSH_VMA(&init_mm, 0);
+#endif
 	pte_t *pte;
 	u64 pfn;
 	unsigned long size = PAGE_SIZE;
@@ -111,7 +114,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			pte_t entry = pfn_pte(pfn, prot);
 
 			entry = arch_make_huge_pte(entry, ilog2(size), 0);
-			set_huge_pte_at(&init_mm, addr, pte, entry);
+			set_huge_pte_at(&vma, addr, pte, entry);
 			pfn += PFN_DOWN(size);
 			continue;
 		}
-- 
2.25.1

