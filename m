Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28287822A3C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jan 2024 10:24:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FzhbjYHH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FzhbjYHH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4knL5y22z3vX5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jan 2024 20:24:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FzhbjYHH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FzhbjYHH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4kcs6L49z3dBX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jan 2024 20:17:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704273419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=08fh3W0fLOF7uiwfuql/fhnzNEx5JUzK5pzA1eiVeOg=;
	b=FzhbjYHH/FymkEw3ykCz4N1AzxnxUZevdicSKm+C1P4+PwTbnLtNupsAKDh5mhKmW8sWTw
	OOorc2Liu+QLwaz1RUqJHXXGVbLXhkcnP3pZ37j9PPMGKHqCXgMR6RM8uAK4ARYgzl/mj6
	bPzdzkn2bkzRNr7YbLSZgq9p0tosWpw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704273419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=08fh3W0fLOF7uiwfuql/fhnzNEx5JUzK5pzA1eiVeOg=;
	b=FzhbjYHH/FymkEw3ykCz4N1AzxnxUZevdicSKm+C1P4+PwTbnLtNupsAKDh5mhKmW8sWTw
	OOorc2Liu+QLwaz1RUqJHXXGVbLXhkcnP3pZ37j9PPMGKHqCXgMR6RM8uAK4ARYgzl/mj6
	bPzdzkn2bkzRNr7YbLSZgq9p0tosWpw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-325-_WTwnjDAMc2GdAFTOXr2IA-1; Wed,
 03 Jan 2024 04:16:53 -0500
X-MC-Unique: _WTwnjDAMc2GdAFTOXr2IA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D792C29AA38D;
	Wed,  3 Jan 2024 09:16:52 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CE8D492BF0;
	Wed,  3 Jan 2024 09:16:40 +0000 (UTC)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/13] mm/gup: Handle huge pmd for follow_pmd_mask()
Date: Wed,  3 Jan 2024 17:14:21 +0800
Message-ID: <20240103091423.400294-12-peterx@redhat.com>
In-Reply-To: <20240103091423.400294-1-peterx@redhat.com>
References: <20240103091423.400294-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, peterx@redhat.com, Andrew Jones <andrew.jones@linux.dev>, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

Replace pmd_trans_huge() with pmd_thp_or_huge() to also cover pmd_huge() as
long as enabled.

FOLL_TOUCH and FOLL_SPLIT_PMD only apply to THP, not yet huge.

Since now follow_trans_huge_pmd() can process hugetlb pages, renaming it
into follow_huge_pmd() to match what it does.  Move it into gup.c so not
depend on CONFIG_THP.

When at it, move the ctx->page_mask setup into follow_huge_pmd(), only set
it when the page is valid.  It was not a bug to set it before even if GUP
failed (page==NULL), because follow_page_mask() callers always ignores
page_mask if so.  But doing so makes the code cleaner.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c         | 107 ++++++++++++++++++++++++++++++++++++++++++++---
 mm/huge_memory.c |  86 +------------------------------------
 mm/internal.h    |   5 +--
 3 files changed, 105 insertions(+), 93 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 760406180222..d96429b6fc55 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -580,6 +580,93 @@ static struct page *follow_huge_pud(struct vm_area_struct *vma,
 
 	return page;
 }
+
+/* FOLL_FORCE can write to even unwritable PMDs in COW mappings. */
+static inline bool can_follow_write_pmd(pmd_t pmd, struct page *page,
+					struct vm_area_struct *vma,
+					unsigned int flags)
+{
+	/* If the pmd is writable, we can write to the page. */
+	if (pmd_write(pmd))
+		return true;
+
+	/* Maybe FOLL_FORCE is set to override it? */
+	if (!(flags & FOLL_FORCE))
+		return false;
+
+	/* But FOLL_FORCE has no effect on shared mappings */
+	if (vma->vm_flags & (VM_MAYSHARE | VM_SHARED))
+		return false;
+
+	/* ... or read-only private ones */
+	if (!(vma->vm_flags & VM_MAYWRITE))
+		return false;
+
+	/* ... or already writable ones that just need to take a write fault */
+	if (vma->vm_flags & VM_WRITE)
+		return false;
+
+	/*
+	 * See can_change_pte_writable(): we broke COW and could map the page
+	 * writable if we have an exclusive anonymous page ...
+	 */
+	if (!page || !PageAnon(page) || !PageAnonExclusive(page))
+		return false;
+
+	/* ... and a write-fault isn't required for other reasons. */
+	if (vma_soft_dirty_enabled(vma) && !pmd_soft_dirty(pmd))
+		return false;
+	return !userfaultfd_huge_pmd_wp(vma, pmd);
+}
+
+static struct page *follow_huge_pmd(struct vm_area_struct *vma,
+				    unsigned long addr, pmd_t *pmd,
+				    unsigned int flags,
+				    struct follow_page_context *ctx)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	pmd_t pmdval = *pmd;
+	struct page *page;
+	int ret;
+
+	assert_spin_locked(pmd_lockptr(mm, pmd));
+
+	page = pmd_page(pmdval);
+	VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
+
+	if ((flags & FOLL_WRITE) &&
+	    !can_follow_write_pmd(pmdval, page, vma, flags))
+		return NULL;
+
+	/* Avoid dumping huge zero page */
+	if ((flags & FOLL_DUMP) && is_huge_zero_pmd(pmdval))
+		return ERR_PTR(-EFAULT);
+
+	if (pmd_protnone(*pmd) && !gup_can_follow_protnone(vma, flags))
+		return NULL;
+
+	if (!pmd_write(pmdval) && gup_must_unshare(vma, flags, page))
+		return ERR_PTR(-EMLINK);
+
+	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
+			!PageAnonExclusive(page), page);
+
+	ret = try_grab_page(page, flags);
+	if (ret)
+		return ERR_PTR(ret);
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	if (pmd_trans_huge(pmdval) && (flags & FOLL_TOUCH))
+		touch_pmd(vma, addr, pmd, flags & FOLL_WRITE);
+#endif	/* CONFIG_TRANSPARENT_HUGEPAGE */
+
+	page += (addr & ~HPAGE_PMD_MASK) >> PAGE_SHIFT;
+	ctx->page_mask = HPAGE_PMD_NR - 1;
+	VM_BUG_ON_PAGE(!PageCompound(page) && !is_zone_device_page(page), page);
+
+	return page;
+}
+
 #else  /* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
 static struct page *follow_huge_pud(struct vm_area_struct *vma,
 				    unsigned long addr, pud_t *pudp,
@@ -587,6 +674,14 @@ static struct page *follow_huge_pud(struct vm_area_struct *vma,
 {
 	return NULL;
 }
+
+static struct page *follow_huge_pmd(struct vm_area_struct *vma,
+				    unsigned long addr, pmd_t *pmd,
+				    unsigned int flags,
+				    struct follow_page_context *ctx)
+{
+	return NULL;
+}
 #endif	/* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
 
 static int follow_pfn_pte(struct vm_area_struct *vma, unsigned long address,
@@ -784,31 +879,31 @@ static struct page *follow_pmd_mask(struct vm_area_struct *vma,
 			return page;
 		return no_page_table(vma, flags, address);
 	}
-	if (likely(!pmd_trans_huge(pmdval)))
+	if (likely(!pmd_thp_or_huge(pmdval)))
 		return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
 
 	if (pmd_protnone(pmdval) && !gup_can_follow_protnone(vma, flags))
 		return no_page_table(vma, flags, address);
 
 	ptl = pmd_lock(mm, pmd);
-	if (unlikely(!pmd_present(*pmd))) {
+	pmdval = *pmd;
+	if (unlikely(!pmd_present(pmdval))) {
 		spin_unlock(ptl);
 		return no_page_table(vma, flags, address);
 	}
-	if (unlikely(!pmd_trans_huge(*pmd))) {
+	if (unlikely(!pmd_thp_or_huge(pmdval))) {
 		spin_unlock(ptl);
 		return follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
 	}
-	if (flags & FOLL_SPLIT_PMD) {
+	if (pmd_trans_huge(pmdval) && (flags & FOLL_SPLIT_PMD)) {
 		spin_unlock(ptl);
 		split_huge_pmd(vma, pmd, address);
 		/* If pmd was left empty, stuff a page table in there quickly */
 		return pte_alloc(mm, pmd) ? ERR_PTR(-ENOMEM) :
 			follow_page_pte(vma, address, pmd, flags, &ctx->pgmap);
 	}
-	page = follow_trans_huge_pmd(vma, address, pmd, flags);
+	page = follow_huge_pmd(vma, address, pmd, flags, ctx);
 	spin_unlock(ptl);
-	ctx->page_mask = HPAGE_PMD_NR - 1;
 	return page;
 }
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 9993d2b18809..317cb445c442 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1216,8 +1216,8 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
 EXPORT_SYMBOL_GPL(vmf_insert_pfn_pud);
 #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 
-static void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
-		      pmd_t *pmd, bool write)
+void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
+	       pmd_t *pmd, bool write)
 {
 	pmd_t _pmd;
 
@@ -1572,88 +1572,6 @@ static inline bool can_change_pmd_writable(struct vm_area_struct *vma,
 	return pmd_dirty(pmd);
 }
 
-/* FOLL_FORCE can write to even unwritable PMDs in COW mappings. */
-static inline bool can_follow_write_pmd(pmd_t pmd, struct page *page,
-					struct vm_area_struct *vma,
-					unsigned int flags)
-{
-	/* If the pmd is writable, we can write to the page. */
-	if (pmd_write(pmd))
-		return true;
-
-	/* Maybe FOLL_FORCE is set to override it? */
-	if (!(flags & FOLL_FORCE))
-		return false;
-
-	/* But FOLL_FORCE has no effect on shared mappings */
-	if (vma->vm_flags & (VM_MAYSHARE | VM_SHARED))
-		return false;
-
-	/* ... or read-only private ones */
-	if (!(vma->vm_flags & VM_MAYWRITE))
-		return false;
-
-	/* ... or already writable ones that just need to take a write fault */
-	if (vma->vm_flags & VM_WRITE)
-		return false;
-
-	/*
-	 * See can_change_pte_writable(): we broke COW and could map the page
-	 * writable if we have an exclusive anonymous page ...
-	 */
-	if (!page || !PageAnon(page) || !PageAnonExclusive(page))
-		return false;
-
-	/* ... and a write-fault isn't required for other reasons. */
-	if (vma_soft_dirty_enabled(vma) && !pmd_soft_dirty(pmd))
-		return false;
-	return !userfaultfd_huge_pmd_wp(vma, pmd);
-}
-
-struct page *follow_trans_huge_pmd(struct vm_area_struct *vma,
-				   unsigned long addr,
-				   pmd_t *pmd,
-				   unsigned int flags)
-{
-	struct mm_struct *mm = vma->vm_mm;
-	struct page *page;
-	int ret;
-
-	assert_spin_locked(pmd_lockptr(mm, pmd));
-
-	page = pmd_page(*pmd);
-	VM_BUG_ON_PAGE(!PageHead(page) && !is_zone_device_page(page), page);
-
-	if ((flags & FOLL_WRITE) &&
-	    !can_follow_write_pmd(*pmd, page, vma, flags))
-		return NULL;
-
-	/* Avoid dumping huge zero page */
-	if ((flags & FOLL_DUMP) && is_huge_zero_pmd(*pmd))
-		return ERR_PTR(-EFAULT);
-
-	if (pmd_protnone(*pmd) && !gup_can_follow_protnone(vma, flags))
-		return NULL;
-
-	if (!pmd_write(*pmd) && gup_must_unshare(vma, flags, page))
-		return ERR_PTR(-EMLINK);
-
-	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
-			!PageAnonExclusive(page), page);
-
-	ret = try_grab_page(page, flags);
-	if (ret)
-		return ERR_PTR(ret);
-
-	if (flags & FOLL_TOUCH)
-		touch_pmd(vma, addr, pmd, flags & FOLL_WRITE);
-
-	page += (addr & ~HPAGE_PMD_MASK) >> PAGE_SHIFT;
-	VM_BUG_ON_PAGE(!PageCompound(page) && !is_zone_device_page(page), page);
-
-	return page;
-}
-
 /* NUMA hinting page fault entry point for trans huge pmds */
 vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
 {
diff --git a/mm/internal.h b/mm/internal.h
index 5821b7a14b62..99994b41a220 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1009,9 +1009,8 @@ int __must_check try_grab_page(struct page *page, unsigned int flags);
  */
 void touch_pud(struct vm_area_struct *vma, unsigned long addr,
 	       pud_t *pud, bool write);
-struct page *follow_trans_huge_pmd(struct vm_area_struct *vma,
-				   unsigned long addr, pmd_t *pmd,
-				   unsigned int flags);
+void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
+	       pmd_t *pmd, bool write);
 
 /*
  * mm/mmap.c
-- 
2.41.0

