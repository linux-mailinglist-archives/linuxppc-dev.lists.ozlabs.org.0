Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 062AD736582
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:59:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=jjSq9aTI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlfCm6LlWz2xpp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 17:59:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=jjSq9aTI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QlfBv4RCRz2xFm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 17:58:14 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5701eaf0d04so46505627b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687247892; x=1689839892;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oZY6w9J7toyiTSnrDYdTl/iZtQ4DwvkRvcpzIuD6Z/M=;
        b=jjSq9aTI2DDqxscN4pq6tIW2t1oB2Us2M+ybVjj+WbNNuPa0SHl8anbtzK7Rjar1SY
         FtbdELwb+qm7aZfRDGlas9htldGEgGJo8EUel1IgLBRhuOjybXZ2JhWFWoNydWhWnLoe
         sDikPgviTF+F9BLGHUmNHshe9jLjcHp4eHYN78AHXDshMx1gmgi0lwXRrXrymzvfy1oS
         sSS/SWZGOylcmqt/OOyH7yW5jIVhDF2myOH5nmIHjTp4hCoBYxyIV0dBLcoGfKjX+nSm
         SCqmPcSA1OfsDZ4JORRyiDnJMkamZlwDweNLYjOmQrj5114Aq+ZG9d2oxbylEIDpX6zC
         XvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687247892; x=1689839892;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZY6w9J7toyiTSnrDYdTl/iZtQ4DwvkRvcpzIuD6Z/M=;
        b=XXYZDaqfFDuKOEDnfSXV6FQRxJXGiOaZuQDSM0+cl4drAzCP9S5/PwZZi4x3BrMr0t
         /dMuQLjrUAVLKWsgo/ZFND1uYajaJyaALSVOZkodveucvSMekg8MEiTy1OxINXyhlFou
         BbAQL5FRSTkNrDG1FGeviqPNt8BzaMWmOiur9dr1cLk1ZXT0KVDQV8Z3qtgYqs4gwRKS
         XYN/lQtczUeuBVtlsJAH/MpwSrj0VBRqAs1I8WovtlULh7Nemy362hzJlShorGbDQrOx
         tlNHU4jJDYphs8RaEvrYQiw2I1KVKikrypqdY7JZf8AiVRJW+uRO4Akt7RbZt71PAR+H
         IeWA==
X-Gm-Message-State: AC+VfDxFm+8q+3I3Rel/wZPTdlM3ZFgQIg5QXQq+wRMYh1QpXvo2C2+c
	cAaIUn0d2Xt5abvjIehiz96iIg==
X-Google-Smtp-Source: ACHHUZ6WOKlFi1AP0MbqxWtb/dOy1NBeYqPcXgHn95ddmUtg48jpbqy+Ay6U+MoHnAVEhjTgTFamZg==
X-Received: by 2002:a81:9157:0:b0:570:8802:ec9f with SMTP id i84-20020a819157000000b005708802ec9fmr10023541ywg.19.1687247892063;
        Tue, 20 Jun 2023 00:58:12 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id a133-20020a81668b000000b00569ff2d94f6sm385736ywc.19.2023.06.20.00.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 00:58:11 -0700 (PDT)
Date: Tue, 20 Jun 2023 00:58:07 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 11/12] mm/khugepaged: delete
 khugepaged_collapse_pte_mapped_thps()
In-Reply-To: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
Message-ID: <90cd6860-eb92-db66-9a8-5fa7b494a10@google.com>
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

Now that retract_page_tables() can retract page tables reliably, without
depending on trylocks, delete all the apparatus for khugepaged to try
again later: khugepaged_collapse_pte_mapped_thps() etc; and free up the
per-mm memory which was set aside for that in the khugepaged_mm_slot.

But one part of that is worth keeping: when hpage_collapse_scan_file()
found SCAN_PTE_MAPPED_HUGEPAGE, that address was noted in the mm_slot
to be tried for retraction later - catching, for example, page tables
where a reversible mprotect() of a portion had required splitting the
pmd, but now it can be recollapsed.  Call collapse_pte_mapped_thp()
directly in this case (why was it deferred before?  I assume an issue
with needing mmap_lock for write, but now it's only needed for read).

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/khugepaged.c | 125 +++++++-----------------------------------------
 1 file changed, 16 insertions(+), 109 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 060ac8789a1e..06c659e6a89e 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -92,8 +92,6 @@ static __read_mostly DEFINE_HASHTABLE(mm_slots_hash, MM_SLOTS_HASH_BITS);
 
 static struct kmem_cache *mm_slot_cache __read_mostly;
 
-#define MAX_PTE_MAPPED_THP 8
-
 struct collapse_control {
 	bool is_khugepaged;
 
@@ -107,15 +105,9 @@ struct collapse_control {
 /**
  * struct khugepaged_mm_slot - khugepaged information per mm that is being scanned
  * @slot: hash lookup from mm to mm_slot
- * @nr_pte_mapped_thp: number of pte mapped THP
- * @pte_mapped_thp: address array corresponding pte mapped THP
  */
 struct khugepaged_mm_slot {
 	struct mm_slot slot;
-
-	/* pte-mapped THP in this mm */
-	int nr_pte_mapped_thp;
-	unsigned long pte_mapped_thp[MAX_PTE_MAPPED_THP];
 };
 
 /**
@@ -1441,50 +1433,6 @@ static void collect_mm_slot(struct khugepaged_mm_slot *mm_slot)
 }
 
 #ifdef CONFIG_SHMEM
-/*
- * Notify khugepaged that given addr of the mm is pte-mapped THP. Then
- * khugepaged should try to collapse the page table.
- *
- * Note that following race exists:
- * (1) khugepaged calls khugepaged_collapse_pte_mapped_thps() for mm_struct A,
- *     emptying the A's ->pte_mapped_thp[] array.
- * (2) MADV_COLLAPSE collapses some file extent with target mm_struct B, and
- *     retract_page_tables() finds a VMA in mm_struct A mapping the same extent
- *     (at virtual address X) and adds an entry (for X) into mm_struct A's
- *     ->pte-mapped_thp[] array.
- * (3) khugepaged calls khugepaged_collapse_scan_file() for mm_struct A at X,
- *     sees a pte-mapped THP (SCAN_PTE_MAPPED_HUGEPAGE) and adds an entry
- *     (for X) into mm_struct A's ->pte-mapped_thp[] array.
- * Thus, it's possible the same address is added multiple times for the same
- * mm_struct.  Should this happen, we'll simply attempt
- * collapse_pte_mapped_thp() multiple times for the same address, under the same
- * exclusive mmap_lock, and assuming the first call is successful, subsequent
- * attempts will return quickly (without grabbing any additional locks) when
- * a huge pmd is found in find_pmd_or_thp_or_none().  Since this is a cheap
- * check, and since this is a rare occurrence, the cost of preventing this
- * "multiple-add" is thought to be more expensive than just handling it, should
- * it occur.
- */
-static bool khugepaged_add_pte_mapped_thp(struct mm_struct *mm,
-					  unsigned long addr)
-{
-	struct khugepaged_mm_slot *mm_slot;
-	struct mm_slot *slot;
-	bool ret = false;
-
-	VM_BUG_ON(addr & ~HPAGE_PMD_MASK);
-
-	spin_lock(&khugepaged_mm_lock);
-	slot = mm_slot_lookup(mm_slots_hash, mm);
-	mm_slot = mm_slot_entry(slot, struct khugepaged_mm_slot, slot);
-	if (likely(mm_slot && mm_slot->nr_pte_mapped_thp < MAX_PTE_MAPPED_THP)) {
-		mm_slot->pte_mapped_thp[mm_slot->nr_pte_mapped_thp++] = addr;
-		ret = true;
-	}
-	spin_unlock(&khugepaged_mm_lock);
-	return ret;
-}
-
 /* hpage must be locked, and mmap_lock must be held */
 static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
 			pmd_t *pmdp, struct page *hpage)
@@ -1706,29 +1654,6 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	return result;
 }
 
-static void khugepaged_collapse_pte_mapped_thps(struct khugepaged_mm_slot *mm_slot)
-{
-	struct mm_slot *slot = &mm_slot->slot;
-	struct mm_struct *mm = slot->mm;
-	int i;
-
-	if (likely(mm_slot->nr_pte_mapped_thp == 0))
-		return;
-
-	if (!mmap_write_trylock(mm))
-		return;
-
-	if (unlikely(hpage_collapse_test_exit(mm)))
-		goto out;
-
-	for (i = 0; i < mm_slot->nr_pte_mapped_thp; i++)
-		collapse_pte_mapped_thp(mm, mm_slot->pte_mapped_thp[i], false);
-
-out:
-	mm_slot->nr_pte_mapped_thp = 0;
-	mmap_write_unlock(mm);
-}
-
 static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 {
 	struct vm_area_struct *vma;
@@ -2372,16 +2297,6 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
 {
 	BUILD_BUG();
 }
-
-static void khugepaged_collapse_pte_mapped_thps(struct khugepaged_mm_slot *mm_slot)
-{
-}
-
-static bool khugepaged_add_pte_mapped_thp(struct mm_struct *mm,
-					  unsigned long addr)
-{
-	return false;
-}
 #endif
 
 static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
@@ -2411,7 +2326,6 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 		khugepaged_scan.mm_slot = mm_slot;
 	}
 	spin_unlock(&khugepaged_mm_lock);
-	khugepaged_collapse_pte_mapped_thps(mm_slot);
 
 	mm = slot->mm;
 	/*
@@ -2464,36 +2378,29 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int *result,
 						khugepaged_scan.address);
 
 				mmap_read_unlock(mm);
-				*result = hpage_collapse_scan_file(mm,
-								   khugepaged_scan.address,
-								   file, pgoff, cc);
 				mmap_locked = false;
+				*result = hpage_collapse_scan_file(mm,
+					khugepaged_scan.address, file, pgoff, cc);
+				if (*result == SCAN_PTE_MAPPED_HUGEPAGE) {
+					mmap_read_lock(mm);
+					mmap_locked = true;
+					if (hpage_collapse_test_exit(mm)) {
+						fput(file);
+						goto breakouterloop;
+					}
+					*result = collapse_pte_mapped_thp(mm,
+						khugepaged_scan.address, false);
+					if (*result == SCAN_PMD_MAPPED)
+						*result = SCAN_SUCCEED;
+				}
 				fput(file);
 			} else {
 				*result = hpage_collapse_scan_pmd(mm, vma,
-								  khugepaged_scan.address,
-								  &mmap_locked,
-								  cc);
+					khugepaged_scan.address, &mmap_locked, cc);
 			}
-			switch (*result) {
-			case SCAN_PTE_MAPPED_HUGEPAGE: {
-				pmd_t *pmd;
 
-				*result = find_pmd_or_thp_or_none(mm,
-								  khugepaged_scan.address,
-								  &pmd);
-				if (*result != SCAN_SUCCEED)
-					break;
-				if (!khugepaged_add_pte_mapped_thp(mm,
-								   khugepaged_scan.address))
-					break;
-			} fallthrough;
-			case SCAN_SUCCEED:
+			if (*result == SCAN_SUCCEED)
 				++khugepaged_pages_collapsed;
-				break;
-			default:
-				break;
-			}
 
 			/* move to next address */
 			khugepaged_scan.address += HPAGE_PMD_SIZE;
-- 
2.35.3

