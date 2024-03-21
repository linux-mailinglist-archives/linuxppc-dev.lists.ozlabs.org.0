Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB6D886320
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 23:16:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GVXnj9Ck;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GVXnj9Ck;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V10DD14v4z3vty
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 09:16:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GVXnj9Ck;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GVXnj9Ck;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V103173Wpz3dTm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 09:08:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ESTHlGxPxGuUFdX3p2oamk2h4NMABnT27/X9cpNES3o=;
	b=GVXnj9Ckm80zVguA9+LlKknu6DyFn+RzheXegfbuvO7XNvPDejVroweD0lryLpGf25BYY2
	gsZTZBkwKAZsU0m/xqo2y5FUGFXgRfoYd9e+KI2B9Jx1oIQSw85n42J8q3MxdKMy1GPWbL
	9yKLMnHcNzZEe8KCt+ysvdswMJQKFoo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ESTHlGxPxGuUFdX3p2oamk2h4NMABnT27/X9cpNES3o=;
	b=GVXnj9Ckm80zVguA9+LlKknu6DyFn+RzheXegfbuvO7XNvPDejVroweD0lryLpGf25BYY2
	gsZTZBkwKAZsU0m/xqo2y5FUGFXgRfoYd9e+KI2B9Jx1oIQSw85n42J8q3MxdKMy1GPWbL
	9yKLMnHcNzZEe8KCt+ysvdswMJQKFoo=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-IJRq4RQIPEKgPu7uwqpXAA-1; Thu, 21 Mar 2024 18:08:25 -0400
X-MC-Unique: IJRq4RQIPEKgPu7uwqpXAA-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6e67ee38ce7so413864a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 15:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058905; x=1711663705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESTHlGxPxGuUFdX3p2oamk2h4NMABnT27/X9cpNES3o=;
        b=mbA6SPWZwxDMtSE9kI/eWOwHVDceui3r5MA925xDLy828nUN8d87WA3WlWYmIrIRtH
         mfWQbbiplFq6ze3dzi8f3GX6mqzqKWNEro79nxMWZ3QoqVGzhQfBnhjKmWqNJNg1t2bx
         rEUMSKI8EcGnGUlrR/oDlVrma7kWvDBpB0gIf82bB/yCIL6DV8p3qgYL3uze3l+fT2h/
         8DTsvAlYmFFGP4RuUVRaBqZptbbv0ACo/XybSU4vmG0akUHmzRQucvUEj25jrchGm1Mp
         neAMabwe4ZW+SkZe3R3r5xH/OpHt2WlMxlpFoaH4j0Om6mUYUfmmA6gT52zfK1SEB7IX
         1uCA==
X-Gm-Message-State: AOJu0Ywh9ANgl76TwlMvWYdYK2Uvz9ZGwg0vLNp2nXijMpKFiBJ9AMHi
	1ilHdprP7uxH2WTPS1Y/wKHhhAur9j3Q5K585MsIj0ipjAtH8i7vF7Yx2It7BWzckB5JoiUgS2j
	TgCj8K9tBYetWnLxyUOYjXcRNBbg8puvc2bZPOXi/qFZwIvG0x7cznZoGUMTM7X8=
X-Received: by 2002:a4a:ca85:0:b0:5a5:1645:90f4 with SMTP id x5-20020a4aca85000000b005a5164590f4mr622755ooq.1.1711058904597;
        Thu, 21 Mar 2024 15:08:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4H/bBBZLy/REcdrgCXmaDlClCIl1Ey/SRhhRBkoU7cfytCZoQGoym/o3YpdiOnUWtv8D4UQ==
X-Received: by 2002:a4a:ca85:0:b0:5a5:1645:90f4 with SMTP id x5-20020a4aca85000000b005a5164590f4mr622720ooq.1.1711058904123;
        Thu, 21 Mar 2024 15:08:24 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:23 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/12] mm/gup: Handle huge pmd for follow_pmd_mask()
Date: Thu, 21 Mar 2024 18:08:00 -0400
Message-ID: <20240321220802.679544-11-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240321220802.679544-1-peterx@redhat.com>
References: <20240321220802.679544-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, peterx@redhat.com, Andrew Jones <andrew.jones@linux.dev>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

Replace pmd_trans_huge() with pmd_leaf() to also cover pmd_huge() as long
as enabled.

FOLL_TOUCH and FOLL_SPLIT_PMD only apply to THP, not yet huge.

Since now follow_trans_huge_pmd() can process hugetlb pages, renaming it
into follow_huge_pmd() to match what it does.  Move it into gup.c so not
depend on CONFIG_THP.

When at it, move the ctx->page_mask setup into follow_huge_pmd(), only set
it when the page is valid.  It was not a bug to set it before even if GUP
failed (page==NULL), because follow_page_mask() callers always ignores
page_mask if so.  But doing so makes the code cleaner.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c         | 107 ++++++++++++++++++++++++++++++++++++++++++++---
 mm/huge_memory.c |  86 +------------------------------------
 mm/internal.h    |   5 +--
 3 files changed, 105 insertions(+), 93 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index ae21afb9434e..00cdf4cb0cd4 100644
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
+	if (likely(!pmd_leaf(pmdval)))
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
+	if (unlikely(!pmd_leaf(pmdval))) {
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
index f8bd2012bc27..e747dacb5051 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1206,8 +1206,8 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
 EXPORT_SYMBOL_GPL(vmf_insert_pfn_pud);
 #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 
-static void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
-		      pmd_t *pmd, bool write)
+void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
+	       pmd_t *pmd, bool write)
 {
 	pmd_t _pmd;
 
@@ -1562,88 +1562,6 @@ static inline bool can_change_pmd_writable(struct vm_area_struct *vma,
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
index 63e4f6e001be..d47862e6d968 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1104,9 +1104,8 @@ int __must_check try_grab_page(struct page *page, unsigned int flags);
  */
 void touch_pud(struct vm_area_struct *vma, unsigned long addr,
 	       pud_t *pud, bool write);
-struct page *follow_trans_huge_pmd(struct vm_area_struct *vma,
-				   unsigned long addr, pmd_t *pmd,
-				   unsigned int flags);
+void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
+	       pmd_t *pmd, bool write);
 
 #ifdef CONFIG_MEMCG
 static inline
-- 
2.44.0

