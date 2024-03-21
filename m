Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC7888631C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 23:15:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hB4+bvBN;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hB4+bvBN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V10BX3y6wz3cPR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 09:15:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hB4+bvBN;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hB4+bvBN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V10301D28z3dVx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 09:08:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JwtVKmcef1NV2SEc6Dd7pe+XzH6c3RDiTdVw8lXpTc0=;
	b=hB4+bvBNOg9naYc25t9fXECr0IEmJ1v/tdJ54roV7oq+7hRL2LFS6zyNOG/9q0tfZHUZAJ
	xxj7d+Hss6T3Jmyncrd3dP/naobb7ELqmMNdxt9+zeANP2Zned/3GRzziONicJ2bhIzsPl
	sjysMEO4CA6sU2kdOtFPaWjxhInum/w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711058905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JwtVKmcef1NV2SEc6Dd7pe+XzH6c3RDiTdVw8lXpTc0=;
	b=hB4+bvBNOg9naYc25t9fXECr0IEmJ1v/tdJ54roV7oq+7hRL2LFS6zyNOG/9q0tfZHUZAJ
	xxj7d+Hss6T3Jmyncrd3dP/naobb7ELqmMNdxt9+zeANP2Zned/3GRzziONicJ2bhIzsPl
	sjysMEO4CA6sU2kdOtFPaWjxhInum/w=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-obuVAx7RMfiD2f7XTXRW3Q-1; Thu, 21 Mar 2024 18:08:23 -0400
X-MC-Unique: obuVAx7RMfiD2f7XTXRW3Q-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-690d3f5af86so3057126d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 15:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711058903; x=1711663703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwtVKmcef1NV2SEc6Dd7pe+XzH6c3RDiTdVw8lXpTc0=;
        b=ZXcw2R/F/HPhhVFEUxc93IVIRpNwetZKX7K1tcIH23M4VcKy2dvxwml9kV+iWez+d9
         3BgNEourFEY90v71lPWXdav9IX+z1WDL2j3rq3dJRLESBBu8vH41ZIlfiEV3YSChIuO0
         gygDOJQIk+Hp5/O6exQy0rMuEPFoSiAb8fFdTCw9Hrt39x0W8cLrMuSf8M4bQJg2ZRgj
         b55nKG6jKztenKSYBSIvN2Ek8klCQA5gCYuQv4o8Ijf1t+vuGts0vg8txkqQvdrAUS7r
         T60oR9rzrv67VmQwOl9qy9vaDOOoZ4JGkOcSzA2ibP7jLml2YFfg4klnDdntlxQBwbWk
         zTMw==
X-Gm-Message-State: AOJu0YywS5A1OSTe31VyApxo/PZABJpXUbmM3r0T1cekKFbIG3tz4Hvb
	50Ampc4607V2ZV3gDhrHMWFAwnrCuHzD/vVjorTx7B5neREIZqIhnUTxX737f9MM1Ku10XeTaGM
	nq+l4dWBXUiwHZXFHMNE/xptcpXbz66fHE5dbncz2mAX17DL/XcXEVYZiDelhlkw=
X-Received: by 2002:a05:6214:4403:b0:690:b47e:60e3 with SMTP id oj3-20020a056214440300b00690b47e60e3mr171632qvb.5.1711058902740;
        Thu, 21 Mar 2024 15:08:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFefVkn71VpIW4uNQ3LlUv67q0iftDvBfI3myHkSibZanv1/17GTXunJ1XxyTP0oQ7cl/tpbA==
X-Received: by 2002:a05:6214:4403:b0:690:b47e:60e3 with SMTP id oj3-20020a056214440300b00690b47e60e3mr171615qvb.5.1711058902326;
        Thu, 21 Mar 2024 15:08:22 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id o6-20020a0562140e4600b00690baf5cde9sm351663qvc.118.2024.03.21.15.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 15:08:21 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/12] mm/gup: Handle huge pud for follow_pud_mask()
Date: Thu, 21 Mar 2024 18:07:59 -0400
Message-ID: <20240321220802.679544-10-peterx@redhat.com>
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

Teach follow_pud_mask() to be able to handle normal PUD pages like hugetlb.

Rename follow_devmap_pud() to follow_huge_pud() so that it can process
either huge devmap or hugetlb. Move it out of TRANSPARENT_HUGEPAGE_PUD and
and huge_memory.c (which relies on CONFIG_THP).  Switch to pud_leaf() to
detect both cases in the slow gup.

In the new follow_huge_pud(), taking care of possible CoR for hugetlb if
necessary.  touch_pud() needs to be moved out of huge_memory.c to be
accessable from gup.c even if !THP.

Since at it, optimize the non-present check by adding a pud_present() early
check before taking the pgtable lock, failing the follow_page() early if
PUD is not present: that is required by both devmap or hugetlb.  Use
pud_huge() to also cover the pud_devmap() case.

One more trivial thing to mention is, introduce "pud_t pud" in the code
paths along the way, so the code doesn't dereference *pudp multiple time.
Not only because that looks less straightforward, but also because if the
dereference really happened, it's not clear whether there can be race to
see different *pudp values when it's being modified at the same time.

Setting ctx->page_mask properly for a PUD entry.  As a side effect, this
patch should also be able to optimize devmap GUP on PUD to be able to jump
over the whole PUD range, but not yet verified.  Hugetlb already can do so
prior to this patch.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/huge_mm.h |  8 -----
 mm/gup.c                | 70 +++++++++++++++++++++++++++++++++++++++--
 mm/huge_memory.c        | 47 ++-------------------------
 mm/internal.h           |  2 ++
 4 files changed, 71 insertions(+), 56 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 3bcdfc7e5d57..39195f7c5269 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -346,8 +346,6 @@ static inline bool folio_test_pmd_mappable(struct folio *folio)
 
 struct page *follow_devmap_pmd(struct vm_area_struct *vma, unsigned long addr,
 		pmd_t *pmd, int flags, struct dev_pagemap **pgmap);
-struct page *follow_devmap_pud(struct vm_area_struct *vma, unsigned long addr,
-		pud_t *pud, int flags, struct dev_pagemap **pgmap);
 
 vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf);
 
@@ -504,12 +502,6 @@ static inline struct page *follow_devmap_pmd(struct vm_area_struct *vma,
 	return NULL;
 }
 
-static inline struct page *follow_devmap_pud(struct vm_area_struct *vma,
-	unsigned long addr, pud_t *pud, int flags, struct dev_pagemap **pgmap)
-{
-	return NULL;
-}
-
 static inline bool thp_migration_supported(void)
 {
 	return false;
diff --git a/mm/gup.c b/mm/gup.c
index a338944e4425..ae21afb9434e 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -525,6 +525,70 @@ static struct page *no_page_table(struct vm_area_struct *vma,
 	return NULL;
 }
 
+#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
+static struct page *follow_huge_pud(struct vm_area_struct *vma,
+				    unsigned long addr, pud_t *pudp,
+				    int flags, struct follow_page_context *ctx)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	struct page *page;
+	pud_t pud = *pudp;
+	unsigned long pfn = pud_pfn(pud);
+	int ret;
+
+	assert_spin_locked(pud_lockptr(mm, pudp));
+
+	if ((flags & FOLL_WRITE) && !pud_write(pud))
+		return NULL;
+
+	if (!pud_present(pud))
+		return NULL;
+
+	pfn += (addr & ~PUD_MASK) >> PAGE_SHIFT;
+
+	if (IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) &&
+	    pud_devmap(pud)) {
+		/*
+		 * device mapped pages can only be returned if the caller
+		 * will manage the page reference count.
+		 *
+		 * At least one of FOLL_GET | FOLL_PIN must be set, so
+		 * assert that here:
+		 */
+		if (!(flags & (FOLL_GET | FOLL_PIN)))
+			return ERR_PTR(-EEXIST);
+
+		if (flags & FOLL_TOUCH)
+			touch_pud(vma, addr, pudp, flags & FOLL_WRITE);
+
+		ctx->pgmap = get_dev_pagemap(pfn, ctx->pgmap);
+		if (!ctx->pgmap)
+			return ERR_PTR(-EFAULT);
+	}
+
+	page = pfn_to_page(pfn);
+
+	if (!pud_devmap(pud) && !pud_write(pud) &&
+	    gup_must_unshare(vma, flags, page))
+		return ERR_PTR(-EMLINK);
+
+	ret = try_grab_page(page, flags);
+	if (ret)
+		page = ERR_PTR(ret);
+	else
+		ctx->page_mask = HPAGE_PUD_NR - 1;
+
+	return page;
+}
+#else  /* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
+static struct page *follow_huge_pud(struct vm_area_struct *vma,
+				    unsigned long addr, pud_t *pudp,
+				    int flags, struct follow_page_context *ctx)
+{
+	return NULL;
+}
+#endif	/* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
+
 static int follow_pfn_pte(struct vm_area_struct *vma, unsigned long address,
 		pte_t *pte, unsigned int flags)
 {
@@ -760,11 +824,11 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
 
 	pudp = pud_offset(p4dp, address);
 	pud = READ_ONCE(*pudp);
-	if (pud_none(pud))
+	if (!pud_present(pud))
 		return no_page_table(vma, flags, address);
-	if (pud_devmap(pud)) {
+	if (pud_leaf(pud)) {
 		ptl = pud_lock(mm, pudp);
-		page = follow_devmap_pud(vma, address, pudp, flags, &ctx->pgmap);
+		page = follow_huge_pud(vma, address, pudp, flags, ctx);
 		spin_unlock(ptl);
 		if (page)
 			return page;
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index c77cedf45f3a..f8bd2012bc27 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1363,8 +1363,8 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 }
 
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
-static void touch_pud(struct vm_area_struct *vma, unsigned long addr,
-		      pud_t *pud, bool write)
+void touch_pud(struct vm_area_struct *vma, unsigned long addr,
+	       pud_t *pud, bool write)
 {
 	pud_t _pud;
 
@@ -1376,49 +1376,6 @@ static void touch_pud(struct vm_area_struct *vma, unsigned long addr,
 		update_mmu_cache_pud(vma, addr, pud);
 }
 
-struct page *follow_devmap_pud(struct vm_area_struct *vma, unsigned long addr,
-		pud_t *pud, int flags, struct dev_pagemap **pgmap)
-{
-	unsigned long pfn = pud_pfn(*pud);
-	struct mm_struct *mm = vma->vm_mm;
-	struct page *page;
-	int ret;
-
-	assert_spin_locked(pud_lockptr(mm, pud));
-
-	if (flags & FOLL_WRITE && !pud_write(*pud))
-		return NULL;
-
-	if (pud_present(*pud) && pud_devmap(*pud))
-		/* pass */;
-	else
-		return NULL;
-
-	if (flags & FOLL_TOUCH)
-		touch_pud(vma, addr, pud, flags & FOLL_WRITE);
-
-	/*
-	 * device mapped pages can only be returned if the
-	 * caller will manage the page reference count.
-	 *
-	 * At least one of FOLL_GET | FOLL_PIN must be set, so assert that here:
-	 */
-	if (!(flags & (FOLL_GET | FOLL_PIN)))
-		return ERR_PTR(-EEXIST);
-
-	pfn += (addr & ~PUD_MASK) >> PAGE_SHIFT;
-	*pgmap = get_dev_pagemap(pfn, *pgmap);
-	if (!*pgmap)
-		return ERR_PTR(-EFAULT);
-	page = pfn_to_page(pfn);
-
-	ret = try_grab_page(page, flags);
-	if (ret)
-		page = ERR_PTR(ret);
-
-	return page;
-}
-
 int copy_huge_pud(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		  pud_t *dst_pud, pud_t *src_pud, unsigned long addr,
 		  struct vm_area_struct *vma)
diff --git a/mm/internal.h b/mm/internal.h
index f8b31234c130..63e4f6e001be 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1102,6 +1102,8 @@ int __must_check try_grab_page(struct page *page, unsigned int flags);
 /*
  * mm/huge_memory.c
  */
+void touch_pud(struct vm_area_struct *vma, unsigned long addr,
+	       pud_t *pud, bool write);
 struct page *follow_trans_huge_pmd(struct vm_area_struct *vma,
 				   unsigned long addr, pmd_t *pmd,
 				   unsigned int flags);
-- 
2.44.0

