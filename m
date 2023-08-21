Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCBD7831A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 21:52:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=NndR0ksI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RV3676xZjz30hY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 05:52:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=NndR0ksI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RV35F18X3z2yVR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 05:51:28 +1000 (AEST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-591ba8bd094so21523177b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Aug 2023 12:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692647486; x=1693252286;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K/XGDkPeLVVPvfADvrmUj6hQsONcx7CAy/VBzqur6kA=;
        b=NndR0ksIoZBQcWmrMd/NDLEjSSelCSPs4qSBgLV5/C51jeq2YQI/BO5s8EuPCsYHjs
         4mhgu+/VYY1ieT3LJ0uTF/r6mi2mMgzwPQnofwMFXd6+du7XYuTrt3C2BYB+UE+W0jMt
         LfrgtW+JUtLFySySFAz+YqlRvr8/f/9GBp2imfas7GgMalU7cxn/4kyBOQp+mzr+dF9G
         xOG2JDQDTu8p0jj5hmk4xhjc0te0MfHUfNbwBf3dOWE1AZGzkH1lK7uKp3ZJA3J7W+fQ
         FAE2q4E77CqUNRImAVXU6LnPqDtsvyddu2WPFAC564jeeoZhspAiYe8QVcp5mjTUFaoF
         80bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692647486; x=1693252286;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K/XGDkPeLVVPvfADvrmUj6hQsONcx7CAy/VBzqur6kA=;
        b=Q6SA5NnNlOfhh6Wf8VfF/hWHKA5zLHDVKnSZ76HPj7GkjwIjkHwLFyrVWYVvxa+aFs
         D2/HiddLFMVpYOaIhjr/07+p4Cn4aqKkODPyoHMAS+CC5Ne+7BBZxq6D6dJBuRAvLgp5
         LN54bP1FHHgXLZnK6j3nwKejfQqHMj+YdUGkeLPCSvTXg6eYAeOgRUVL8umZ71Ccq5re
         Q6W+tEFnhNpfEAB4jXYQUivbaLH5xTzvX924MRJfN8juRqRzc3HvaFFqmZSz56DeSohy
         /GXShrKIZhmXNfeI0CXKp6V75RpSf+YrJL9jGcQ6IpngfbsXno+4ZFpk+pfM8xZ7C6/8
         stkQ==
X-Gm-Message-State: AOJu0YwWg1mQi52zYrg5obhLRNYzoL+4rg9iDBK1L3q1QzYdjzeXpHnv
	8+wTjRLqWvIDd7aDoSDsSdD1uA==
X-Google-Smtp-Source: AGHT+IHkJ6q4xN1gFoj/dTBPdmg8L1RSRYwXvYCwJUuzq7cZqNfZCZl8UnATk59vGQ4CcJPeIgwl5A==
X-Received: by 2002:a0d:d145:0:b0:581:5cb9:6c2b with SMTP id t66-20020a0dd145000000b005815cb96c2bmr7782127ywd.45.1692647485613;
        Mon, 21 Aug 2023 12:51:25 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id o63-20020a817342000000b0058fc7604f45sm1401786ywc.130.2023.08.21.12.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 12:51:25 -0700 (PDT)
Date: Mon, 21 Aug 2023 12:51:20 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH mm-unstable] mm/khugepaged: fix collapse_pte_mapped_thp()
 versus uffd
Message-ID: <4d31abf5-56c0-9f3d-d12f-c9317936691@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Anshuman Khandual <anshuman.khandual@arm.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, kernel list <linux-kernel@vger.kernel.org>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntr
 aeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Jann Horn <jannh@google.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Linux-MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Zach O'Keefe <zokeefe@google.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jann Horn demonstrated how userfaultfd ioctl UFFDIO_COPY into a private
shmem mapping can add valid PTEs to page table collapse_pte_mapped_thp()
thought it had emptied: page lock on the huge page is enough to protect
against WP faults (which find the PTE has been cleared), but not enough
to protect against userfaultfd.  "BUG: Bad rss-counter state" followed.

retract_page_tables() protects against this by checking !vma->anon_vma;
but we know that MADV_COLLAPSE needs to be able to work on private shmem
mappings, even those with an anon_vma prepared for another part of the
mapping; and we know that MADV_COLLAPSE needs to work on shared shmem
mappings which are userfaultfd_armed().  Whether it needs to work on
private shmem mappings which are userfaultfd_armed(), I'm not so sure:
but assume that it does.

Just for this case, take the pmd_lock() two steps earlier: not because
it gives any protection against this case itself, but because ptlock
nests inside it, and it's the dropping of ptlock which let the bug in.
In other cases, continue to minimize the pmd_lock() hold time.

Reported-by: Jann Horn <jannh@google.com>
Closes: https://lore.kernel.org/linux-mm/CAG48ez0FxiRC4d3VTu_a9h=rg5FW-kYD5Rg5xo_RDBM0LTTqZQ@mail.gmail.com/
Fixes: 1043173eb5eb ("mm/khugepaged: collapse_pte_mapped_thp() with mmap_read_lock()")
Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/khugepaged.c | 38 +++++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 40d43eccdee8..d5650541083a 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1476,7 +1476,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	struct page *hpage;
 	pte_t *start_pte, *pte;
 	pmd_t *pmd, pgt_pmd;
-	spinlock_t *pml, *ptl;
+	spinlock_t *pml = NULL, *ptl;
 	int nr_ptes = 0, result = SCAN_FAIL;
 	int i;
 
@@ -1572,9 +1572,25 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 				haddr, haddr + HPAGE_PMD_SIZE);
 	mmu_notifier_invalidate_range_start(&range);
 	notified = true;
-	start_pte = pte_offset_map_lock(mm, pmd, haddr, &ptl);
+
+	/*
+	 * pmd_lock covers a wider range than ptl, and (if split from mm's
+	 * page_table_lock) ptl nests inside pml. The less time we hold pml,
+	 * the better; but userfaultfd's mfill_atomic_pte() on a private VMA
+	 * inserts a valid as-if-COWed PTE without even looking up page cache.
+	 * So page lock of hpage does not protect from it, so we must not drop
+	 * ptl before pgt_pmd is removed, so uffd private needs pml taken now.
+	 */
+	if (userfaultfd_armed(vma) && !(vma->vm_flags & VM_SHARED))
+		pml = pmd_lock(mm, pmd);
+
+	start_pte = pte_offset_map_nolock(mm, pmd, haddr, &ptl);
 	if (!start_pte)		/* mmap_lock + page lock should prevent this */
 		goto abort;
+	if (!pml)
+		spin_lock(ptl);
+	else if (ptl != pml)
+		spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
 
 	/* step 2: clear page table and adjust rmap */
 	for (i = 0, addr = haddr, pte = start_pte;
@@ -1608,7 +1624,9 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 		nr_ptes++;
 	}
 
-	pte_unmap_unlock(start_pte, ptl);
+	pte_unmap(start_pte);
+	if (!pml)
+		spin_unlock(ptl);
 
 	/* step 3: set proper refcount and mm_counters. */
 	if (nr_ptes) {
@@ -1616,12 +1634,12 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 		add_mm_counter(mm, mm_counter_file(hpage), -nr_ptes);
 	}
 
-	/* step 4: remove page table */
-
-	/* Huge page lock is still held, so page table must remain empty */
-	pml = pmd_lock(mm, pmd);
-	if (ptl != pml)
-		spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
+	/* step 4: remove empty page table */
+	if (!pml) {
+		pml = pmd_lock(mm, pmd);
+		if (ptl != pml)
+			spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
+	}
 	pgt_pmd = pmdp_collapse_flush(vma, haddr, pmd);
 	pmdp_get_lockless_sync();
 	if (ptl != pml)
@@ -1648,6 +1666,8 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	}
 	if (start_pte)
 		pte_unmap_unlock(start_pte, ptl);
+	if (pml && pml != ptl)
+		spin_unlock(pml);
 	if (notified)
 		mmu_notifier_invalidate_range_end(&range);
 drop_hpage:
-- 
2.35.3

