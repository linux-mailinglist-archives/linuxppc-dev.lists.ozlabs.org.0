Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A2E8182FB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 09:06:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dqucutUZ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XzDJkbFg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvTmM5jH6z3dC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 19:06:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dqucutUZ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XzDJkbFg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvTb83ZzSz3cY0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 18:58:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702972705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z9BJA067XqZpd3Nf7GBMDnnzZoziQMnRZVuO9/Z3c+Q=;
	b=dqucutUZVUtIxKsIN81J8ZObFl+lY8+RwFrbZkiFEpkzXuYC+AliCZ/qZpSkQBShH2DRDa
	9GMP3wVDUEUqFAvyM7IzAl8CfWIAey/+ao5Gf7J7OPSJ9+0ow5sLj/e3mrR6KDGa0m0HFa
	q8n8wvUbv2S2ron6pvT46bERACv2LxA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702972706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z9BJA067XqZpd3Nf7GBMDnnzZoziQMnRZVuO9/Z3c+Q=;
	b=XzDJkbFgb+f0YofQURlVp5jNsS8ozik4QeEZNAXeYMXfudbfpE873yxuzijsfwC24bwlQI
	C3sA+0op+wvFH5FeyJZAl9qVvcosQY5qVKRk3OcLrly29UJZOYDla2uWfM7WDgP9PPbj29
	pEd9hGYTMMGh638bvxZXuYH0ccqxptU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175-dRyYBC1tOkeHiKu36YFQHw-1; Tue,
 19 Dec 2023 02:58:18 -0500
X-MC-Unique: dRyYBC1tOkeHiKu36YFQHw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D4B63806720;
	Tue, 19 Dec 2023 07:58:16 +0000 (UTC)
Received: from x1n.redhat.com (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 528C52026D66;
	Tue, 19 Dec 2023 07:58:04 +0000 (UTC)
From: peterx@redhat.com
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 12/13] mm/gup: Handle hugepd for follow_page()
Date: Tue, 19 Dec 2023 15:55:37 +0800
Message-ID: <20231219075538.414708-13-peterx@redhat.com>
In-Reply-To: <20231219075538.414708-1-peterx@redhat.com>
References: <20231219075538.414708-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, peterx@redhat.com, Andrew Jones <andrew.jones@linux.dev>, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

Hugepd is only used in PowerPC so far on 4K page size kernels where hash
mmu is used.  follow_page_mask() used to leverage hugetlb APIs to access
hugepd entries.  Teach follow_page_mask() itself on hugepd.

With previous refactors on fast-gup gup_huge_pd(), most of the code can be
easily leveraged.  There's something not needed for follow page, for
example, gup_hugepte() tries to detect pgtable entry change which will
never happen with slow gup (which has the pgtable lock held), but that's
not a problem to check.

Since follow_page() always only fetch one page, set the end to "address +
PAGE_SIZE" should suffice.  We will still do the pgtable walk once for each
hugetlb page by setting ctx->page_mask properly.

One thing worth mentioning is that some level of pgtable's _bad() helper
will report is_hugepd() entries as TRUE on Power8 hash MMUs.  I think it at
least applies to PUD on Power8 with 4K pgsize.  It means feeding a hugepd
entry to pud_bad() will report a false positive. Let's leave that for now
because it can be arch-specific where I am a bit declined to touch.  In
this patch it's not a problem as long as hugepd is detected before any bad
pgtable entries.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 78 +++++++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 69 insertions(+), 9 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 080dff79b650..14a7d13e7bd6 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -30,6 +30,11 @@ struct follow_page_context {
 	unsigned int page_mask;
 };
 
+static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
+				  unsigned long addr, unsigned int pdshift,
+				  unsigned int flags,
+				  struct follow_page_context *ctx);
+
 static inline void sanity_check_pinned_pages(struct page **pages,
 					     unsigned long npages)
 {
@@ -871,6 +876,9 @@ static struct page *follow_pmd_mask(struct vm_area_struct *vma,
 		return no_page_table(vma, flags, address);
 	if (!pmd_present(pmdval))
 		return no_page_table(vma, flags, address);
+	if (unlikely(is_hugepd(__hugepd(pmd_val(pmdval)))))
+		return follow_hugepd(vma, __hugepd(pmd_val(pmdval)),
+				     address, PMD_SHIFT, flags, ctx);
 	if (pmd_devmap(pmdval)) {
 		ptl = pmd_lock(mm, pmd);
 		page = follow_devmap_pmd(vma, address, pmd, flags, &ctx->pgmap);
@@ -921,6 +929,9 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
 	pud = *pudp;
 	if (pud_none(pud) || !pud_present(pud))
 		return no_page_table(vma, flags, address);
+	if (unlikely(is_hugepd(__hugepd(pud_val(pud)))))
+		return follow_hugepd(vma, __hugepd(pud_val(pud)),
+				     address, PUD_SHIFT, flags, ctx);
 	if (pud_huge(pud)) {
 		ptl = pud_lock(mm, pudp);
 		page = follow_huge_pud(vma, address, pudp, flags, ctx);
@@ -940,13 +951,17 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
 				    unsigned int flags,
 				    struct follow_page_context *ctx)
 {
-	p4d_t *p4d;
+	p4d_t *p4d, p4dval;
 
 	p4d = p4d_offset(pgdp, address);
-	if (p4d_none(*p4d))
-		return no_page_table(vma, flags, address);
-	BUILD_BUG_ON(p4d_huge(*p4d));
-	if (unlikely(p4d_bad(*p4d)))
+	p4dval = *p4d;
+	BUILD_BUG_ON(p4d_huge(p4dval));
+
+	if (unlikely(is_hugepd(__hugepd(p4d_val(p4dval)))))
+		return follow_hugepd(vma, __hugepd(p4d_val(p4dval)),
+				     address, P4D_SHIFT, flags, ctx);
+
+	if (p4d_none(p4dval) || unlikely(p4d_bad(p4dval)))
 		return no_page_table(vma, flags, address);
 
 	return follow_pud_mask(vma, address, p4d, flags, ctx);
@@ -980,7 +995,7 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 			      unsigned long address, unsigned int flags,
 			      struct follow_page_context *ctx)
 {
-	pgd_t *pgd;
+	pgd_t *pgd, pgdval;
 	struct mm_struct *mm = vma->vm_mm;
 
 	ctx->page_mask = 0;
@@ -995,11 +1010,17 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 						&ctx->page_mask);
 
 	pgd = pgd_offset(mm, address);
+	pgdval = *pgd;
 
-	if (pgd_none(*pgd) || unlikely(pgd_bad(*pgd)))
-		return no_page_table(vma, flags, address);
+	if (unlikely(is_hugepd(__hugepd(pgd_val(pgdval)))))
+		page = follow_hugepd(vma, __hugepd(pgd_val(pgdval)),
+				     address, PGDIR_SHIFT, flags, ctx);
+	else if (pgd_none(*pgd) || unlikely(pgd_bad(*pgd)))
+		page = no_page_table(vma, flags, address);
+	else
+		page = follow_p4d_mask(vma, address, pgd, flags, ctx);
 
-	return follow_p4d_mask(vma, address, pgd, flags, ctx);
+	return page;
 }
 
 struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
@@ -3026,6 +3047,37 @@ static int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
 
 	return 1;
 }
+
+static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
+				  unsigned long addr, unsigned int pdshift,
+				  unsigned int flags,
+				  struct follow_page_context *ctx)
+{
+	struct page *page;
+	struct hstate *h;
+	spinlock_t *ptl;
+	int nr = 0, ret;
+	pte_t *ptep;
+
+	/* Only hugetlb supports hugepd */
+	if (WARN_ON_ONCE(!is_vm_hugetlb_page(vma)))
+		return ERR_PTR(-EFAULT);
+
+	h = hstate_vma(vma);
+	ptep = hugepte_offset(hugepd, addr, pdshift);
+	ptl = huge_pte_lock(h, vma->vm_mm, ptep);
+	ret = gup_huge_pd(hugepd, addr, pdshift, addr + PAGE_SIZE,
+			  flags, &page, &nr);
+	spin_unlock(ptl);
+
+	if (ret) {
+		WARN_ON_ONCE(nr != 1);
+		ctx->page_mask = (1U << huge_page_order(h)) - 1;
+		return page;
+	}
+
+	return NULL;
+}
 #else
 static inline int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
 		unsigned int pdshift, unsigned long end, unsigned int flags,
@@ -3033,6 +3085,14 @@ static inline int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
 {
 	return 0;
 }
+
+static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
+				  unsigned long addr, unsigned int pdshift,
+				  unsigned int flags,
+				  struct follow_page_context *ctx)
+{
+	return NULL;
+}
 #endif /* CONFIG_ARCH_HAS_HUGEPD */
 
 static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
-- 
2.41.0

