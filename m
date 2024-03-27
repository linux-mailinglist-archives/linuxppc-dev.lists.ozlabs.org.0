Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F48788E91C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:32:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TfsyBFxE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TfsyBFxE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4Vz45s32z3w7N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:32:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TfsyBFxE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TfsyBFxE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4Vnd75Q8z3vc7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:24:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cjVJdBQT9/0ffkgcc4+ae3LmOxlOj4cpHe90WMWbkEY=;
	b=TfsyBFxEFrT6b4KrBNyvRlxbsZp4OZkyKTCpTtCBk8ymfeZAveKqzgIMEyCAe3HhiFN1iX
	9RPvS+k4j1WEOo2hE5L/0oIrkRDWMr+YkbUWM4w1nfFimtZmvcBrt70q80HZ+Y8FQ/WyPf
	csy8AmVY5hwQZnLx30zb+Bx3vBcGXiE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cjVJdBQT9/0ffkgcc4+ae3LmOxlOj4cpHe90WMWbkEY=;
	b=TfsyBFxEFrT6b4KrBNyvRlxbsZp4OZkyKTCpTtCBk8ymfeZAveKqzgIMEyCAe3HhiFN1iX
	9RPvS+k4j1WEOo2hE5L/0oIrkRDWMr+YkbUWM4w1nfFimtZmvcBrt70q80HZ+Y8FQ/WyPf
	csy8AmVY5hwQZnLx30zb+Bx3vBcGXiE=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-nBykaSeTMom4uSCWf4L8hA-1; Wed, 27 Mar 2024 11:24:02 -0400
X-MC-Unique: nBykaSeTMom4uSCWf4L8hA-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3c3c43470d7so1243364b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 08:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553041; x=1712157841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjVJdBQT9/0ffkgcc4+ae3LmOxlOj4cpHe90WMWbkEY=;
        b=fgwXGOh0GRCHv0/2CZ0elrVu2z4DsXZwdIed716arOWfAeAJTpq9hAE+dh6nq9M6qz
         93W3AcflVyD3YcXbRY67NxpNqID3rAPB1rN4tnZtRbTUfYLl18LytssvsuDWEBUxWZxx
         QuMzj52DOiG7V50Qc/uIywDr0eBKqtGJ3QkaHmRqaMjsFIGrdTdgDWraKWgbHTHw7xC7
         mTtGOg8P3r/OFkKD3YtM5sz5Zh0uI2ZcbMmdwbG/r2iLbveyVefvkws3P9LoYf3ORx9B
         mOjcGQTGZHTJtJ240sQv4YKWr/4mMSYTAjQeUhBrCCM2cIbtNVhZ7aeS0ncnRFpyxF7L
         oZow==
X-Forwarded-Encrypted: i=1; AJvYcCUf8wTqhU7bNHzrqJqedS+kg98iGI+/+ZYBBIuU9ZKEU2JziAL+e+99vj4EC1rIiYH+FIw2Qq4O10fh77r+DTj/htPxTICkG8CrprZtVw==
X-Gm-Message-State: AOJu0Ywo2ZS49CL77pfErqOw5iBGcg1H0AozWn65NWnFzh21FjXh41Fa
	gB3iuBz77crOt7qoc9UwHjpIqwDfGMlofVm3igXJ60uRqXhaSImT8sO19Cj9/6TzvK4iJ7p+slC
	TIiLQ0ABaBBpTSnEwZov81RLDQKQ4dKNdcsfwKdO3efNtVvncpCnDlajud9/B3pY=
X-Received: by 2002:a05:6808:1829:b0:3c3:c913:2709 with SMTP id bh41-20020a056808182900b003c3c9132709mr293785oib.2.1711553041206;
        Wed, 27 Mar 2024 08:24:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAanQflKq3pmTo1+xDGdmPcZlLuONtp7wiA2xhvVSTNiy0v1ZL/DhUjtngy2OWwjyBQX1+lw==
X-Received: by 2002:a05:6808:1829:b0:3c3:c913:2709 with SMTP id bh41-20020a056808182900b003c3c9132709mr293761oib.2.1711553040651;
        Wed, 27 Mar 2024 08:24:00 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:24:00 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/13] mm/gup: Handle hugepd for follow_page()
Date: Wed, 27 Mar 2024 11:23:31 -0400
Message-ID: <20240327152332.950956-13-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240327152332.950956-1-peterx@redhat.com>
References: <20240327152332.950956-1-peterx@redhat.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, peterx@redhat.com, Andrew Jones <andrew.jones@linux.dev>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Xu <peterx@redhat.com>

Hugepd is only used in PowerPC so far on 4K page size kernels where hash
mmu is used.  follow_page_mask() used to leverage hugetlb APIs to access
hugepd entries.  Teach follow_page_mask() itself on hugepd.

With previous refactors on fast-gup gup_huge_pd(), most of the code can be
leveraged.  There's something not needed for follow page, for example,
gup_hugepte() tries to detect pgtable entry change which will never happen
with slow gup (which has the pgtable lock held), but that's not a problem
to check.

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

To allow slow gup like follow_*_page() to access hugepd helpers, hugepd
codes are moved to the top.  Besides that, the helper record_subpages()
will be used by either hugepd or fast-gup now. To avoid "unused function"
warnings we must provide a "#ifdef" for it, unfortunately.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/gup.c | 269 +++++++++++++++++++++++++++++++++----------------------
 1 file changed, 163 insertions(+), 106 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index a81184b01276..a02463c9420e 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -500,6 +500,149 @@ static inline void mm_set_has_pinned_flag(unsigned long *mm_flags)
 }
 
 #ifdef CONFIG_MMU
+
+#if defined(CONFIG_ARCH_HAS_HUGEPD) || defined(CONFIG_HAVE_FAST_GUP)
+static int record_subpages(struct page *page, unsigned long sz,
+			   unsigned long addr, unsigned long end,
+			   struct page **pages)
+{
+	struct page *start_page;
+	int nr;
+
+	start_page = nth_page(page, (addr & (sz - 1)) >> PAGE_SHIFT);
+	for (nr = 0; addr != end; nr++, addr += PAGE_SIZE)
+		pages[nr] = nth_page(start_page, nr);
+
+	return nr;
+}
+#endif	/* CONFIG_ARCH_HAS_HUGEPD || CONFIG_HAVE_FAST_GUP */
+
+#ifdef CONFIG_ARCH_HAS_HUGEPD
+static unsigned long hugepte_addr_end(unsigned long addr, unsigned long end,
+				      unsigned long sz)
+{
+	unsigned long __boundary = (addr + sz) & ~(sz-1);
+	return (__boundary - 1 < end - 1) ? __boundary : end;
+}
+
+static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
+		       unsigned long end, unsigned int flags,
+		       struct page **pages, int *nr)
+{
+	unsigned long pte_end;
+	struct page *page;
+	struct folio *folio;
+	pte_t pte;
+	int refs;
+
+	pte_end = (addr + sz) & ~(sz-1);
+	if (pte_end < end)
+		end = pte_end;
+
+	pte = huge_ptep_get(ptep);
+
+	if (!pte_access_permitted(pte, flags & FOLL_WRITE))
+		return 0;
+
+	/* hugepages are never "special" */
+	VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
+
+	page = pte_page(pte);
+	refs = record_subpages(page, sz, addr, end, pages + *nr);
+
+	folio = try_grab_folio(page, refs, flags);
+	if (!folio)
+		return 0;
+
+	if (unlikely(pte_val(pte) != pte_val(ptep_get(ptep)))) {
+		gup_put_folio(folio, refs, flags);
+		return 0;
+	}
+
+	if (!pte_write(pte) && gup_must_unshare(NULL, flags, &folio->page)) {
+		gup_put_folio(folio, refs, flags);
+		return 0;
+	}
+
+	*nr += refs;
+	folio_set_referenced(folio);
+	return 1;
+}
+
+/*
+ * NOTE: currently GUP for a hugepd is only possible on hugetlbfs file
+ * systems on Power, which does not have issue with folio writeback against
+ * GUP updates.  When hugepd will be extended to support non-hugetlbfs or
+ * even anonymous memory, we need to do extra check as what we do with most
+ * of the other folios. See writable_file_mapping_allowed() and
+ * folio_fast_pin_allowed() for more information.
+ */
+static int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
+		unsigned int pdshift, unsigned long end, unsigned int flags,
+		struct page **pages, int *nr)
+{
+	pte_t *ptep;
+	unsigned long sz = 1UL << hugepd_shift(hugepd);
+	unsigned long next;
+
+	ptep = hugepte_offset(hugepd, addr, pdshift);
+	do {
+		next = hugepte_addr_end(addr, end, sz);
+		if (!gup_hugepte(ptep, sz, addr, end, flags, pages, nr))
+			return 0;
+	} while (ptep++, addr = next, addr != end);
+
+	return 1;
+}
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
+#else /* CONFIG_ARCH_HAS_HUGEPD */
+static inline int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
+		unsigned int pdshift, unsigned long end, unsigned int flags,
+		struct page **pages, int *nr)
+{
+	return 0;
+}
+
+static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
+				  unsigned long addr, unsigned int pdshift,
+				  unsigned int flags,
+				  struct follow_page_context *ctx)
+{
+	return NULL;
+}
+#endif /* CONFIG_ARCH_HAS_HUGEPD */
+
+
 static struct page *no_page_table(struct vm_area_struct *vma,
 				  unsigned int flags, unsigned long address)
 {
@@ -871,6 +1014,9 @@ static struct page *follow_pmd_mask(struct vm_area_struct *vma,
 		return no_page_table(vma, flags, address);
 	if (!pmd_present(pmdval))
 		return no_page_table(vma, flags, address);
+	if (unlikely(is_hugepd(__hugepd(pmd_val(pmdval)))))
+		return follow_hugepd(vma, __hugepd(pmd_val(pmdval)),
+				     address, PMD_SHIFT, flags, ctx);
 	if (pmd_devmap(pmdval)) {
 		ptl = pmd_lock(mm, pmd);
 		page = follow_devmap_pmd(vma, address, pmd, flags, &ctx->pgmap);
@@ -921,6 +1067,9 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
 	pud = READ_ONCE(*pudp);
 	if (!pud_present(pud))
 		return no_page_table(vma, flags, address);
+	if (unlikely(is_hugepd(__hugepd(pud_val(pud)))))
+		return follow_hugepd(vma, __hugepd(pud_val(pud)),
+				     address, PUD_SHIFT, flags, ctx);
 	if (pud_leaf(pud)) {
 		ptl = pud_lock(mm, pudp);
 		page = follow_huge_pud(vma, address, pudp, flags, ctx);
@@ -944,10 +1093,13 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
 
 	p4dp = p4d_offset(pgdp, address);
 	p4d = READ_ONCE(*p4dp);
-	if (!p4d_present(p4d))
-		return no_page_table(vma, flags, address);
 	BUILD_BUG_ON(p4d_leaf(p4d));
-	if (unlikely(p4d_bad(p4d)))
+
+	if (unlikely(is_hugepd(__hugepd(p4d_val(p4d)))))
+		return follow_hugepd(vma, __hugepd(p4d_val(p4d)),
+				     address, P4D_SHIFT, flags, ctx);
+
+	if (!p4d_present(p4d) || p4d_bad(p4d))
 		return no_page_table(vma, flags, address);
 
 	return follow_pud_mask(vma, address, p4dp, flags, ctx);
@@ -997,10 +1149,15 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 
 	pgd = pgd_offset(mm, address);
 
-	if (pgd_none(*pgd) || unlikely(pgd_bad(*pgd)))
-		return no_page_table(vma, flags, address);
+	if (unlikely(is_hugepd(__hugepd(pgd_val(*pgd)))))
+		page = follow_hugepd(vma, __hugepd(pgd_val(*pgd)),
+				     address, PGDIR_SHIFT, flags, ctx);
+	else if (pgd_none(*pgd) || unlikely(pgd_bad(*pgd)))
+		page = no_page_table(vma, flags, address);
+	else
+		page = follow_p4d_mask(vma, address, pgd, flags, ctx);
 
-	return follow_p4d_mask(vma, address, pgd, flags, ctx);
+	return page;
 }
 
 struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
@@ -2947,106 +3104,6 @@ static int __gup_device_huge_pud(pud_t pud, pud_t *pudp, unsigned long addr,
 }
 #endif
 
-static int record_subpages(struct page *page, unsigned long sz,
-			   unsigned long addr, unsigned long end,
-			   struct page **pages)
-{
-	struct page *start_page;
-	int nr;
-
-	start_page = nth_page(page, (addr & (sz - 1)) >> PAGE_SHIFT);
-	for (nr = 0; addr != end; nr++, addr += PAGE_SIZE)
-		pages[nr] = nth_page(start_page, nr);
-
-	return nr;
-}
-
-#ifdef CONFIG_ARCH_HAS_HUGEPD
-static unsigned long hugepte_addr_end(unsigned long addr, unsigned long end,
-				      unsigned long sz)
-{
-	unsigned long __boundary = (addr + sz) & ~(sz-1);
-	return (__boundary - 1 < end - 1) ? __boundary : end;
-}
-
-static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
-		       unsigned long end, unsigned int flags,
-		       struct page **pages, int *nr)
-{
-	unsigned long pte_end;
-	struct page *page;
-	struct folio *folio;
-	pte_t pte;
-	int refs;
-
-	pte_end = (addr + sz) & ~(sz-1);
-	if (pte_end < end)
-		end = pte_end;
-
-	pte = huge_ptep_get(ptep);
-
-	if (!pte_access_permitted(pte, flags & FOLL_WRITE))
-		return 0;
-
-	/* hugepages are never "special" */
-	VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
-
-	page = pte_page(pte);
-	refs = record_subpages(page, sz, addr, end, pages + *nr);
-
-	folio = try_grab_folio(page, refs, flags);
-	if (!folio)
-		return 0;
-
-	if (unlikely(pte_val(pte) != pte_val(ptep_get(ptep)))) {
-		gup_put_folio(folio, refs, flags);
-		return 0;
-	}
-
-	if (!pte_write(pte) && gup_must_unshare(NULL, flags, &folio->page)) {
-		gup_put_folio(folio, refs, flags);
-		return 0;
-	}
-
-	*nr += refs;
-	folio_set_referenced(folio);
-	return 1;
-}
-
-/*
- * NOTE: currently GUP for a hugepd is only possible on hugetlbfs file
- * systems on Power, which does not have issue with folio writeback against
- * GUP updates.  When hugepd will be extended to support non-hugetlbfs or
- * even anonymous memory, we need to do extra check as what we do with most
- * of the other folios. See writable_file_mapping_allowed() and
- * folio_fast_pin_allowed() for more information.
- */
-static int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
-		unsigned int pdshift, unsigned long end, unsigned int flags,
-		struct page **pages, int *nr)
-{
-	pte_t *ptep;
-	unsigned long sz = 1UL << hugepd_shift(hugepd);
-	unsigned long next;
-
-	ptep = hugepte_offset(hugepd, addr, pdshift);
-	do {
-		next = hugepte_addr_end(addr, end, sz);
-		if (!gup_hugepte(ptep, sz, addr, end, flags, pages, nr))
-			return 0;
-	} while (ptep++, addr = next, addr != end);
-
-	return 1;
-}
-#else
-static inline int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
-		unsigned int pdshift, unsigned long end, unsigned int flags,
-		struct page **pages, int *nr)
-{
-	return 0;
-}
-#endif /* CONFIG_ARCH_HAS_HUGEPD */
-
 static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
 			unsigned long end, unsigned int flags,
 			struct page **pages, int *nr)
-- 
2.44.0

