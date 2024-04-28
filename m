Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7078B4D94
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2024 21:04:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B82VAc50;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B82VAc50;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSG8n3PD2z3cR8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2024 05:04:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B82VAc50;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B82VAc50;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSG6N56sKz3btX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2024 05:02:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714330918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1t4UcvVVCt+Lz5av6btBnWLmCHNkWkDBAkPZW0Lpq7g=;
	b=B82VAc5093u7dHlEp2LqIeli5wsF6qqmCMtFU8V+ZG2oe0pCxFjJSqL4sw3nMhQVuDF1gx
	7XBSBpdixQ5DtEvm3QwB/lyp7kYin8SC2td1kKYNIFrqVxUL+bwDjdWPgOZqIlUUdXbSin
	mgfmA6bMiHgn8aEE5TzltVdcuuuaDUE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714330918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1t4UcvVVCt+Lz5av6btBnWLmCHNkWkDBAkPZW0Lpq7g=;
	b=B82VAc5093u7dHlEp2LqIeli5wsF6qqmCMtFU8V+ZG2oe0pCxFjJSqL4sw3nMhQVuDF1gx
	7XBSBpdixQ5DtEvm3QwB/lyp7kYin8SC2td1kKYNIFrqVxUL+bwDjdWPgOZqIlUUdXbSin
	mgfmA6bMiHgn8aEE5TzltVdcuuuaDUE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-KqDlQBnvO3-QAQL8iqVd_A-1; Sun, 28 Apr 2024 15:01:56 -0400
X-MC-Unique: KqDlQBnvO3-QAQL8iqVd_A-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-790f387bd46so248485a.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2024 12:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714330915; x=1714935715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1t4UcvVVCt+Lz5av6btBnWLmCHNkWkDBAkPZW0Lpq7g=;
        b=KvkNlecyih9YaCX/jwUpBh5hsjkniBnBpAUyTni4YA72nOnx2pDC/FVYvOG4QO087e
         WsZLycs5ztBnBN21ppDYzjz15ieXOyWqOelrAOXDDDLnoa2LrLy/RUwugmkFpSoc5+Iw
         TfJfTY5bUJ3bCcd2Yb0eZ5+gzRX39RH4yb9jstNLoIIQZcwtkTAWrU1Uv8HUs1XrZSYz
         yopl3ITcxMh3DIJ3uyNbMYZpBu+Q/jFQMUmcK0AUTt0m1qW28sT2Gj34Ljn7tVlzQXcs
         564tzRFr+QRR08HisLuV7hGytdQ6SGlgPiJkM8KZEJwAXXtsB6q0cJ1PWuCOqc7cFuJJ
         rkNw==
X-Forwarded-Encrypted: i=1; AJvYcCUTxQdT6gQoL1X1X76dMBVsNGEzeJJjhenCdNeUid79G9Vvv9pdQqG0LgvLHJDc7EnwvqNIs2gTB6zL39lwIVT3SxOTX0WGCuUJ/7+FDg==
X-Gm-Message-State: AOJu0YydRzMF2XjjhkN7yPYxCsyB4q8joTrDxt73E1UnnN3dkmLvd+05
	47wb5J6fUpa2fTpbeMt0M5PthFP05RIBlEpxYDR1BEq50x+Ck4ozfLjjxqVxPD2daPuwtTegBFK
	gEbeAG+h5AueDR4rh6gJAiMf3AFOi6KiM8M8q6dxcydLDo2L3xIxD3L7B/gBIbAA=
X-Received: by 2002:a05:620a:17a0:b0:790:e83a:e6eb with SMTP id ay32-20020a05620a17a000b00790e83ae6ebmr4022691qkb.5.1714330915149;
        Sun, 28 Apr 2024 12:01:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEq4u33yQLthyJZ4VKOCA3UIJSHLI7n1RNa/Jea7Dll1CjPi5vBpPXi0aewsChF2WFetPSb5Q==
X-Received: by 2002:a05:620a:17a0:b0:790:e83a:e6eb with SMTP id ay32-20020a05620a17a000b00790e83ae6ebmr4022657qkb.5.1714330914396;
        Sun, 28 Apr 2024 12:01:54 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id oo8-20020a05620a530800b0078d693c0b4bsm9818152qkn.135.2024.04.28.12.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 12:01:53 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 1/2] mm/gup: Fix hugepd handling in hugetlb rework
Date: Sun, 28 Apr 2024 15:01:50 -0400
Message-ID: <20240428190151.201002-2-peterx@redhat.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240428190151.201002-1-peterx@redhat.com>
References: <20240428190151.201002-1-peterx@redhat.com>
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
Signed-off-by: Peter Xu <peterx@redhat.com>
---

Note: The target commit to be fixed should just been moved into mm-stable,
so no need to cc stable.
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

