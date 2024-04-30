Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 879938B76AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 15:13:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qt/OpG9o;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qt/OpG9o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTLHl1jdJz3cYH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 23:13:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qt/OpG9o;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qt/OpG9o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTLGz0fWfz3bpN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 23:13:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714482789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oWuqOsXifT7Zmvx2sEqXndtkJ5mO0uhVIU3UoDEgjcQ=;
	b=Qt/OpG9ofaUoe13sct1LKnPY6QVF0uPVlY9W6sPyoxJfQAaLeL+asxbFuyO6i1fLC5sVJN
	aNWTAS4svk67gpiM/hGEds9x76JtnoH1YvtlTHJvzFW6iIDiavmPLa1B8SbekWcrVFMI6j
	4Tq3MEVjhWfZawNuIprquFLDqcrQnVg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714482789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oWuqOsXifT7Zmvx2sEqXndtkJ5mO0uhVIU3UoDEgjcQ=;
	b=Qt/OpG9ofaUoe13sct1LKnPY6QVF0uPVlY9W6sPyoxJfQAaLeL+asxbFuyO6i1fLC5sVJN
	aNWTAS4svk67gpiM/hGEds9x76JtnoH1YvtlTHJvzFW6iIDiavmPLa1B8SbekWcrVFMI6j
	4Tq3MEVjhWfZawNuIprquFLDqcrQnVg=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-ORyAFXGoMZiuRXCMH8heig-1; Tue, 30 Apr 2024 09:13:07 -0400
X-MC-Unique: ORyAFXGoMZiuRXCMH8heig-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6ee53b652f6so312571a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 06:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714482786; x=1715087586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oWuqOsXifT7Zmvx2sEqXndtkJ5mO0uhVIU3UoDEgjcQ=;
        b=PgqSWJuNCxJyFXOHmWaJ+M9vLPBnw/GJZ97jMqktk+NLiAbClvmDrRLoBjWCYyDXnI
         pAQc6isJKsOZZOZJhiac6HGKduoF51SmKR7aVahSw32PFD+iUITfhXAavqpHIQzeVnDE
         Jiz0U2QEvXit+l+uIyx7UxhaPB2AYycmonaBDXEed30iWR0IqVJ5CmysRGULj2FwnknQ
         OAmTpsCVVBVdnTZwMn0ZteMAYX2DQ5/rJy4dX7lIZGebiurmiu0ycUj4fi9u5M8Mv1ik
         kzka3KDMLrTjksJbcRfPLQRBmK86vbsEAmwt1E4fCm83Xotqio+GjwxKBh0R7LBrGL/K
         g4Xw==
X-Forwarded-Encrypted: i=1; AJvYcCU/tRssE28nC4f6mvtU+0NnHOgmrruyPWkhXiD5H1G42LMJD4Nfb41g9y6RXjXAgAZrwlMc6twuKoSUx1P1yJaqnJv035zkEvS2IlBkcw==
X-Gm-Message-State: AOJu0YyNudulC1NXZ/Rgyzg+85LTw3p+3ovRe076dDso1BD3pyLKkT/S
	Osis5KEgNb34fTeqUBTJLYi5ZhvpbNe/aU3qzzB+7mjcgtL1TVoPpE0TgPSuthkM/3nHcPPbsEC
	EsxEjgzQqjpNH9v6DUE/Jz4Qtl4S/adi0SwVH8Ri1aUbmlg7wdK/VIqz0MZypGNgjG1KUIzs=
X-Received: by 2002:a05:6830:100f:b0:6ee:29b2:c2c5 with SMTP id a15-20020a056830100f00b006ee29b2c2c5mr6823531otp.1.1714482785883;
        Tue, 30 Apr 2024 06:13:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6fWhVkCw/NAkBxI5mhCww2FCWhCtQ7223L4ixmBRvipLfoa6GDPyCxArc1sm1kF/OD00lJQ==
X-Received: by 2002:a05:6830:100f:b0:6ee:29b2:c2c5 with SMTP id a15-20020a056830100f00b006ee29b2c2c5mr6823485otp.1.1714482785270;
        Tue, 30 Apr 2024 06:13:05 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id mk11-20020a056214580b00b006a0cd28f98dsm2008123qvb.25.2024.04.30.06.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 06:13:04 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2] mm/gup: Fix hugepd handling in hugetlb rework
Date: Tue, 30 Apr 2024 09:13:03 -0400
Message-ID: <20240430131303.264331-1-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Muchun Song <muchun.song@linux.dev>, peterx@redhat.com, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit a12083d721d7 added hugepd handling for gup-slow, reusing gup-fast
functions.  follow_hugepd() correctly took the vma pointer in, however
didn't pass it over into the lower functions, which was overlooked.

The issue is gup_fast_hugepte() uses the vma pointer to make the correct
decision on whether an unshare is needed for a FOLL_PIN|FOLL_LONGTERM.  Now
without vma ponter it will constantly return "true" (needs an unshare) for
a page cache, even though in the SHARED case it will be wrong to unshare.

The other problem is, even if an unshare is needed, it now returns 0 rather
than -EMLINK, which will not trigger a follow up FAULT_FLAG_UNSHARE fault.
That will need to be fixed too when the unshare is wanted.

gup_longterm test didn't expose this issue in the past because it didn't
yet test R/O unshare in this case, another separate patch will enable that
in future tests.

Fix it by passing vma correctly to the bottom, rename gup_fast_hugepte()
back to gup_hugepte() as it is shared between the fast/slow paths, and also
allow -EMLINK to be returned properly by gup_hugepte() even though gup-fast
will take it the same as zero.

Reported-by: David Hildenbrand <david@redhat.com>
Fixes: a12083d721d7 ("mm/gup: handle hugepd for follow_page()")
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---

v1: https://lore.kernel.org/r/20240428190151.201002-1-peterx@redhat.com

This is v2 and dropped the 2nd test patch as a better one can come later,
this patch alone is kept untouched, added David's R-b.  Should apply to
both mm-stable and mm-unstable.  The target commit to be fixed should just
been moved into mm-stable, so no need to cc stable.
---
 mm/gup.c | 64 ++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 2f7baf96f655..ca0f5cedce9b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -525,9 +525,17 @@ static unsigned long hugepte_addr_end(unsigned long addr, unsigned long end,
 	return (__boundary - 1 < end - 1) ? __boundary : end;
 }
 
-static int gup_fast_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
-		unsigned long end, unsigned int flags, struct page **pages,
-		int *nr)
+/*
+ * Returns 1 if succeeded, 0 if failed, -EMLINK if unshare needed.
+ *
+ * NOTE: for the same entry, gup-fast and gup-slow can return different
+ * results (0 v.s. -EMLINK) depending on whether vma is available.  This is
+ * the expected behavior, where we simply want gup-fast to fallback to
+ * gup-slow to take the vma reference first.
+ */
+static int gup_hugepte(struct vm_area_struct *vma, pte_t *ptep, unsigned long sz,
+		       unsigned long addr, unsigned long end, unsigned int flags,
+		       struct page **pages, int *nr)
 {
 	unsigned long pte_end;
 	struct page *page;
@@ -559,9 +567,9 @@ static int gup_fast_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 		return 0;
 	}
 
-	if (!pte_write(pte) && gup_must_unshare(NULL, flags, &folio->page)) {
+	if (!pte_write(pte) && gup_must_unshare(vma, flags, &folio->page)) {
 		gup_put_folio(folio, refs, flags);
-		return 0;
+		return -EMLINK;
 	}
 
 	*nr += refs;
@@ -577,19 +585,22 @@ static int gup_fast_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
  * of the other folios. See writable_file_mapping_allowed() and
  * gup_fast_folio_allowed() for more information.
  */
-static int gup_fast_hugepd(hugepd_t hugepd, unsigned long addr,
-		unsigned int pdshift, unsigned long end, unsigned int flags,
-		struct page **pages, int *nr)
+static int gup_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
+		      unsigned long addr, unsigned int pdshift,
+		      unsigned long end, unsigned int flags,
+		      struct page **pages, int *nr)
 {
 	pte_t *ptep;
 	unsigned long sz = 1UL << hugepd_shift(hugepd);
 	unsigned long next;
+	int ret;
 
 	ptep = hugepte_offset(hugepd, addr, pdshift);
 	do {
 		next = hugepte_addr_end(addr, end, sz);
-		if (!gup_fast_hugepte(ptep, sz, addr, end, flags, pages, nr))
-			return 0;
+		ret = gup_hugepte(vma, ptep, sz, addr, end, flags, pages, nr);
+		if (ret != 1)
+			return ret;
 	} while (ptep++, addr = next, addr != end);
 
 	return 1;
@@ -613,22 +624,25 @@ static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
 	h = hstate_vma(vma);
 	ptep = hugepte_offset(hugepd, addr, pdshift);
 	ptl = huge_pte_lock(h, vma->vm_mm, ptep);
-	ret = gup_fast_hugepd(hugepd, addr, pdshift, addr + PAGE_SIZE,
-			      flags, &page, &nr);
+	ret = gup_hugepd(vma, hugepd, addr, pdshift, addr + PAGE_SIZE,
+			 flags, &page, &nr);
 	spin_unlock(ptl);
 
-	if (ret) {
+	if (ret == 1) {
+		/* GUP succeeded */
 		WARN_ON_ONCE(nr != 1);
 		ctx->page_mask = (1U << huge_page_order(h)) - 1;
 		return page;
 	}
 
-	return NULL;
+	/* ret can be either 0 (translates to NULL) or negative */
+	return ERR_PTR(ret);
 }
 #else /* CONFIG_ARCH_HAS_HUGEPD */
-static inline int gup_fast_hugepd(hugepd_t hugepd, unsigned long addr,
-		unsigned int pdshift, unsigned long end, unsigned int flags,
-		struct page **pages, int *nr)
+static inline int gup_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
+			     unsigned long addr, unsigned int pdshift,
+			     unsigned long end, unsigned int flags,
+			     struct page **pages, int *nr)
 {
 	return 0;
 }
@@ -3261,8 +3275,8 @@ static int gup_fast_pmd_range(pud_t *pudp, pud_t pud, unsigned long addr,
 			 * architecture have different format for hugetlbfs
 			 * pmd format and THP pmd format
 			 */
-			if (!gup_fast_hugepd(__hugepd(pmd_val(pmd)), addr,
-					     PMD_SHIFT, next, flags, pages, nr))
+			if (gup_hugepd(NULL, __hugepd(pmd_val(pmd)), addr,
+				       PMD_SHIFT, next, flags, pages, nr) != 1)
 				return 0;
 		} else if (!gup_fast_pte_range(pmd, pmdp, addr, next, flags,
 					       pages, nr))
@@ -3291,8 +3305,8 @@ static int gup_fast_pud_range(p4d_t *p4dp, p4d_t p4d, unsigned long addr,
 					       pages, nr))
 				return 0;
 		} else if (unlikely(is_hugepd(__hugepd(pud_val(pud))))) {
-			if (!gup_fast_hugepd(__hugepd(pud_val(pud)), addr,
-					     PUD_SHIFT, next, flags, pages, nr))
+			if (gup_hugepd(NULL, __hugepd(pud_val(pud)), addr,
+				       PUD_SHIFT, next, flags, pages, nr) != 1)
 				return 0;
 		} else if (!gup_fast_pmd_range(pudp, pud, addr, next, flags,
 					       pages, nr))
@@ -3318,8 +3332,8 @@ static int gup_fast_p4d_range(pgd_t *pgdp, pgd_t pgd, unsigned long addr,
 			return 0;
 		BUILD_BUG_ON(p4d_leaf(p4d));
 		if (unlikely(is_hugepd(__hugepd(p4d_val(p4d))))) {
-			if (!gup_fast_hugepd(__hugepd(p4d_val(p4d)), addr,
-					     P4D_SHIFT, next, flags, pages, nr))
+			if (gup_hugepd(NULL, __hugepd(p4d_val(p4d)), addr,
+				       P4D_SHIFT, next, flags, pages, nr) != 1)
 				return 0;
 		} else if (!gup_fast_pud_range(p4dp, p4d, addr, next, flags,
 					       pages, nr))
@@ -3347,8 +3361,8 @@ static void gup_fast_pgd_range(unsigned long addr, unsigned long end,
 					       pages, nr))
 				return;
 		} else if (unlikely(is_hugepd(__hugepd(pgd_val(pgd))))) {
-			if (!gup_fast_hugepd(__hugepd(pgd_val(pgd)), addr,
-					      PGDIR_SHIFT, next, flags, pages, nr))
+			if (gup_hugepd(NULL, __hugepd(pgd_val(pgd)), addr,
+				       PGDIR_SHIFT, next, flags, pages, nr) != 1)
 				return;
 		} else if (!gup_fast_p4d_range(pgdp, pgd, addr, next, flags,
 					       pages, nr))
-- 
2.44.0

