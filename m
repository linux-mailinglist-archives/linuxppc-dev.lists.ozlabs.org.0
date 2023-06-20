Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AAA736569
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:55:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=J8nzRWA0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qlf862T7bz2xqw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 17:55:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=J8nzRWA0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::735; helo=mail-qk1-x735.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qlf7F2fVKz2xFm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 17:55:05 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-763a360868aso120754785a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687247701; x=1689839701;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EoggPrivOwaF6YYpZ0mcfv9qnK5xaGr29ovQpplAZx8=;
        b=J8nzRWA0uvpss9wXeQOicc8Ot9y4/UFuc6plZhigByzD/E6z56SmcPuzuWHVg6RLIr
         zeSwVuKlgmRjiVprT2c29o+LY/xl0mKSG7EI+HK+ZmF9VRuRMDrYHfurcBSQUvbGMDJM
         BrTznrXs5U8ERPP2CrQPh2E6mB/xxogY+UVNmpVE8mP4PFPg1/HAfaCo5DqPYBJr1jNU
         jJBNI0/yqplj0fpPoW7vqJFOdNB1zyVXocOEAXeD5BoEwwZ8uu8OHUDQYXH1raSp0ip4
         Z7eB2HLsP8hFBVrCu74QJhwf7v/CbG+Ae1Bf3UqUxfhWUQfg52/Gluq44YXQQXKCwSWh
         Wn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687247701; x=1689839701;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EoggPrivOwaF6YYpZ0mcfv9qnK5xaGr29ovQpplAZx8=;
        b=Qxgpfq+hmqlwWGTUj++ZAIU44mnyAV/+Qg4nVkN5Ou7Vu6IWR9YR0l90hHVFp86s05
         kra7pGonlIPlpsR3npb1CzpyS/lR0SQOrRC7OQXhbf2bZn3MpwkT/vCQnAhk24BG8J5V
         YopHNBMNNWqavCk2znQys/mmzhcG/MfK7PDdAWC/jN+9rULgrwJGjJNfpD6qLfpMzizC
         g5QYZrbXGQC1RymPv8uWW5HIFgAqXy/7i01DKqVdkoUjbgskcxTEwnWSo2VuipL/X9/2
         5exHzO/ngc1p4+M856h7zPLHt4MT41Or1HOx+5XiBIqTJ8Ij/VDXYoFwSWChu24KAPVd
         drXg==
X-Gm-Message-State: AC+VfDxGyzVOZMgi9vSdUSBC+fHNiKHFJ4WT9/PXEnGHvd07n4rh5Nde
	7McSY1xDxkvSh+OQtj7jbEAQ0Q==
X-Google-Smtp-Source: ACHHUZ4DJO4EDwJbG0wgrFZYngaLjP4vE5bfDEN/dCam98OaAjzy+Vc4NRjPKMFiq2LjNC4HChBWFA==
X-Received: by 2002:a05:620a:2890:b0:75d:4145:154e with SMTP id j16-20020a05620a289000b0075d4145154emr12424317qkp.65.1687247701263;
        Tue, 20 Jun 2023 00:55:01 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id j1-20020a0df901000000b0054f50f71834sm368662ywf.124.2023.06.20.00.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 00:55:00 -0700 (PDT)
Date: Tue, 20 Jun 2023 00:54:56 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 09/12] mm/khugepaged: retract_page_tables() without mmap
 or vma lock
In-Reply-To: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
Message-ID: <f03ea9a-5386-eb78-50d7-b6a93959d01e@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Simplify shmem and file THP collapse's retract_page_tables(), and relax
its locking: to improve its success rate and to lessen impact on others.

Instead of its MADV_COLLAPSE case doing set_huge_pmd() at target_addr of
target_mm, leave that part of the work to madvise_collapse() calling
collapse_pte_mapped_thp() afterwards: just adjust collapse_file()'s
result code to arrange for that.  That spares retract_page_tables() four
arguments; and since it will be successful in retracting all of the page
tables expected of it, no need to track and return a result code itself.

It needs i_mmap_lock_read(mapping) for traversing the vma interval tree,
but it does not need i_mmap_lock_write() for that: page_vma_mapped_walk()
allows for pte_offset_map_lock() etc to fail, and uses pmd_lock() for
THPs.  retract_page_tables() just needs to use those same spinlocks to
exclude it briefly, while transitioning pmd from page table to none: so
restore its use of pmd_lock() inside of which pte lock is nested.

Users of pte_offset_map_lock() etc all now allow for them to fail:
so retract_page_tables() now has no use for mmap_write_trylock() or
vma_try_start_write().  In common with rmap and page_vma_mapped_walk(),
it does not even need the mmap_read_lock().

But those users do expect the page table to remain a good page table,
until they unlock and rcu_read_unlock(): so the page table cannot be
freed immediately, but rather by the recently added pte_free_defer().

Use the (usually a no-op) pmdp_get_lockless_sync() to send an interrupt
when PAE, and pmdp_collapse_flush() did not already do so: to make sure
that the start,pmdp_get_lockless(),end sequence in __pte_offset_map()
cannot pick up a pmd entry with mismatched pmd_low and pmd_high.

retract_page_tables() can be enhanced to replace_page_tables(), which
inserts the final huge pmd without mmap lock: going through an invalid
state instead of pmd_none() followed by fault.  But that enhancement
does raise some more questions: leave it until a later release.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/khugepaged.c | 184 ++++++++++++++++++++----------------------------
 1 file changed, 75 insertions(+), 109 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 1083f0e38a07..f7a0f7673127 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1617,9 +1617,8 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 		break;
 	case SCAN_PMD_NONE:
 		/*
-		 * In MADV_COLLAPSE path, possible race with khugepaged where
-		 * all pte entries have been removed and pmd cleared.  If so,
-		 * skip all the pte checks and just update the pmd mapping.
+		 * All pte entries have been removed and pmd cleared.
+		 * Skip all the pte checks and just update the pmd mapping.
 		 */
 		goto maybe_install_pmd;
 	default:
@@ -1748,123 +1747,88 @@ static void khugepaged_collapse_pte_mapped_thps(struct khugepaged_mm_slot *mm_sl
 	mmap_write_unlock(mm);
 }
 
-static int retract_page_tables(struct address_space *mapping, pgoff_t pgoff,
-			       struct mm_struct *target_mm,
-			       unsigned long target_addr, struct page *hpage,
-			       struct collapse_control *cc)
+static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 {
 	struct vm_area_struct *vma;
-	int target_result = SCAN_FAIL;
 
-	i_mmap_lock_write(mapping);
+	i_mmap_lock_read(mapping);
 	vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff) {
-		int result = SCAN_FAIL;
-		struct mm_struct *mm = NULL;
-		unsigned long addr = 0;
-		pmd_t *pmd;
-		bool is_target = false;
+		struct mmu_notifier_range range;
+		struct mm_struct *mm;
+		unsigned long addr;
+		pmd_t *pmd, pgt_pmd;
+		spinlock_t *pml;
+		spinlock_t *ptl;
+		bool skipped_uffd = false;
 
 		/*
 		 * Check vma->anon_vma to exclude MAP_PRIVATE mappings that
-		 * got written to. These VMAs are likely not worth investing
-		 * mmap_write_lock(mm) as PMD-mapping is likely to be split
-		 * later.
-		 *
-		 * Note that vma->anon_vma check is racy: it can be set up after
-		 * the check but before we took mmap_lock by the fault path.
-		 * But page lock would prevent establishing any new ptes of the
-		 * page, so we are safe.
-		 *
-		 * An alternative would be drop the check, but check that page
-		 * table is clear before calling pmdp_collapse_flush() under
-		 * ptl. It has higher chance to recover THP for the VMA, but
-		 * has higher cost too. It would also probably require locking
-		 * the anon_vma.
+		 * got written to. These VMAs are likely not worth removing
+		 * page tables from, as PMD-mapping is likely to be split later.
 		 */
-		if (READ_ONCE(vma->anon_vma)) {
-			result = SCAN_PAGE_ANON;
-			goto next;
-		}
+		if (READ_ONCE(vma->anon_vma))
+			continue;
+
 		addr = vma->vm_start + ((pgoff - vma->vm_pgoff) << PAGE_SHIFT);
 		if (addr & ~HPAGE_PMD_MASK ||
-		    vma->vm_end < addr + HPAGE_PMD_SIZE) {
-			result = SCAN_VMA_CHECK;
-			goto next;
-		}
-		mm = vma->vm_mm;
-		is_target = mm == target_mm && addr == target_addr;
-		result = find_pmd_or_thp_or_none(mm, addr, &pmd);
-		if (result != SCAN_SUCCEED)
-			goto next;
-		/*
-		 * We need exclusive mmap_lock to retract page table.
-		 *
-		 * We use trylock due to lock inversion: we need to acquire
-		 * mmap_lock while holding page lock. Fault path does it in
-		 * reverse order. Trylock is a way to avoid deadlock.
-		 *
-		 * Also, it's not MADV_COLLAPSE's job to collapse other
-		 * mappings - let khugepaged take care of them later.
-		 */
-		result = SCAN_PTE_MAPPED_HUGEPAGE;
-		if ((cc->is_khugepaged || is_target) &&
-		    mmap_write_trylock(mm)) {
-			/* trylock for the same lock inversion as above */
-			if (!vma_try_start_write(vma))
-				goto unlock_next;
-
-			/*
-			 * Re-check whether we have an ->anon_vma, because
-			 * collapse_and_free_pmd() requires that either no
-			 * ->anon_vma exists or the anon_vma is locked.
-			 * We already checked ->anon_vma above, but that check
-			 * is racy because ->anon_vma can be populated under the
-			 * mmap lock in read mode.
-			 */
-			if (vma->anon_vma) {
-				result = SCAN_PAGE_ANON;
-				goto unlock_next;
-			}
-			/*
-			 * When a vma is registered with uffd-wp, we can't
-			 * recycle the pmd pgtable because there can be pte
-			 * markers installed.  Skip it only, so the rest mm/vma
-			 * can still have the same file mapped hugely, however
-			 * it'll always mapped in small page size for uffd-wp
-			 * registered ranges.
-			 */
-			if (hpage_collapse_test_exit(mm)) {
-				result = SCAN_ANY_PROCESS;
-				goto unlock_next;
-			}
-			if (userfaultfd_wp(vma)) {
-				result = SCAN_PTE_UFFD_WP;
-				goto unlock_next;
-			}
-			collapse_and_free_pmd(mm, vma, addr, pmd);
-			if (!cc->is_khugepaged && is_target)
-				result = set_huge_pmd(vma, addr, pmd, hpage);
-			else
-				result = SCAN_SUCCEED;
-
-unlock_next:
-			mmap_write_unlock(mm);
-			goto next;
-		}
-		/*
-		 * Calling context will handle target mm/addr. Otherwise, let
-		 * khugepaged try again later.
-		 */
-		if (!is_target) {
-			khugepaged_add_pte_mapped_thp(mm, addr);
+		    vma->vm_end < addr + HPAGE_PMD_SIZE)
 			continue;
+
+		mm = vma->vm_mm;
+		if (find_pmd_or_thp_or_none(mm, addr, &pmd) != SCAN_SUCCEED)
+			continue;
+
+		if (hpage_collapse_test_exit(mm))
+			continue;
+		/*
+		 * When a vma is registered with uffd-wp, we cannot recycle
+		 * the page table because there may be pte markers installed.
+		 * Other vmas can still have the same file mapped hugely, but
+		 * skip this one: it will always be mapped in small page size
+		 * for uffd-wp registered ranges.
+		 */
+		if (userfaultfd_wp(vma))
+			continue;
+
+		/* PTEs were notified when unmapped; but now for the PMD? */
+		mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm,
+					addr, addr + HPAGE_PMD_SIZE);
+		mmu_notifier_invalidate_range_start(&range);
+
+		pml = pmd_lock(mm, pmd);
+		ptl = pte_lockptr(mm, pmd);
+		if (ptl != pml)
+			spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
+
+		/*
+		 * Huge page lock is still held, so normally the page table
+		 * must remain empty; and we have already skipped anon_vma
+		 * and userfaultfd_wp() vmas.  But since the mmap_lock is not
+		 * held, it is still possible for a racing userfaultfd_ioctl()
+		 * to have inserted ptes or markers.  Now that we hold ptlock,
+		 * repeating the anon_vma check protects from one category,
+		 * and repeating the userfaultfd_wp() check from another.
+		 */
+		if (unlikely(vma->anon_vma || userfaultfd_wp(vma))) {
+			skipped_uffd = true;
+		} else {
+			pgt_pmd = pmdp_collapse_flush(vma, addr, pmd);
+			pmdp_get_lockless_sync();
+		}
+
+		if (ptl != pml)
+			spin_unlock(ptl);
+		spin_unlock(pml);
+
+		mmu_notifier_invalidate_range_end(&range);
+
+		if (!skipped_uffd) {
+			mm_dec_nr_ptes(mm);
+			page_table_check_pte_clear_range(mm, addr, pgt_pmd);
+			pte_free_defer(mm, pmd_pgtable(pgt_pmd));
 		}
-next:
-		if (is_target)
-			target_result = result;
 	}
-	i_mmap_unlock_write(mapping);
-	return target_result;
+	i_mmap_unlock_read(mapping);
 }
 
 /**
@@ -2261,9 +2225,11 @@ static int collapse_file(struct mm_struct *mm, unsigned long addr,
 
 	/*
 	 * Remove pte page tables, so we can re-fault the page as huge.
+	 * If MADV_COLLAPSE, adjust result to call collapse_pte_mapped_thp().
 	 */
-	result = retract_page_tables(mapping, start, mm, addr, hpage,
-				     cc);
+	retract_page_tables(mapping, start);
+	if (cc && !cc->is_khugepaged)
+		result = SCAN_PTE_MAPPED_HUGEPAGE;
 	unlock_page(hpage);
 
 	/*
-- 
2.35.3

