Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D948A88E928
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 16:33:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RsLSW90A;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RsLSW90A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4W0g4Ybwz3vs8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 02:33:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RsLSW90A;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RsLSW90A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4Vnk1rHdz3vZs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 02:24:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eqT6FBXOR6azzagmtpaiz+BS8+Dy8n2ikly9Wvyy/LU=;
	b=RsLSW90As0nEILGr2wKa+3XD95vBW+Z7kfZAD9fUfUl90vSAlWfJbsdPW94qOSRFVtO8HO
	1UO1yTxihBsQW2Z/FleXzc+jCZ4YGqveaevgPA5DVXFgTTkH5GyQhMEXFjX7w3ScTTLPOl
	/fbQEhFZiEbVfwg5yyhtZUiwzNhqlfU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711553047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eqT6FBXOR6azzagmtpaiz+BS8+Dy8n2ikly9Wvyy/LU=;
	b=RsLSW90As0nEILGr2wKa+3XD95vBW+Z7kfZAD9fUfUl90vSAlWfJbsdPW94qOSRFVtO8HO
	1UO1yTxihBsQW2Z/FleXzc+jCZ4YGqveaevgPA5DVXFgTTkH5GyQhMEXFjX7w3ScTTLPOl
	/fbQEhFZiEbVfwg5yyhtZUiwzNhqlfU=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-H0KD6tNCMpS4aVVBwdoznA-1; Wed, 27 Mar 2024 11:24:05 -0400
X-MC-Unique: H0KD6tNCMpS4aVVBwdoznA-1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6dde25ac92fso3181983a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 08:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711553043; x=1712157843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqT6FBXOR6azzagmtpaiz+BS8+Dy8n2ikly9Wvyy/LU=;
        b=cUk+3kuiaAXZIZHK6Lab/5dMdHKoeX3zW+y3S+ueGwCjAvKiYA1d3AErlKFNgIbfw0
         vMWs/W0T4AGGz+VV2khwNqRMbS5RT+L9egzQXLXUzGiOkikoXn3vVpiN7A/OombgD5C7
         9GBYZsA/6GcQNpqDbpBd4fdviNvby+6CUj6G7I1BcJdFrd/E4W+edsV8SE2SerLI45Be
         DGX4SPx3T0JCn/Gj5yiXcraVM45MICrvs9tdxp7QMmQ58sxjmJpPfhDp/mQyqWI/BNCu
         QrOlCYf5oVNHS6srSDx8ZECTMlVOalAH0/zLVGJU+g8psjdqsQ+MfGn1C96eBphU99Q+
         S8ig==
X-Forwarded-Encrypted: i=1; AJvYcCW4uVFAIWpF4NI5emqcNRodtnWAxOlBMWG4rsVv/Krsb4oInIKzyTgEkPZYIgPvtoGQYoG+9my/u3KWhDGUfZPT8dw5PnYGXhM9UcBjkg==
X-Gm-Message-State: AOJu0Yzh9sY8CDKj82wNbiRvv4mRvF7nqHcvV01H4EFmtQsFgul7QPmu
	GdOGXsGhEBNwa8SaJPRn12lWiMXqiKeuGXc4UZ6de5ZTPnBS4982cu/vn3w2jsRIN3WcAMV3lqY
	DcCObsAmz0cRN0L2Hom1TBjaiVn16PoENlL0S3UZnz23udQtL9n+v65i237orfBg=
X-Received: by 2002:a05:6808:1381:b0:3c3:d815:b670 with SMTP id c1-20020a056808138100b003c3d815b670mr278660oiw.2.1711553043459;
        Wed, 27 Mar 2024 08:24:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2f7pSTtNK/4lDxloQcNJtvLkvUR42Ph4fHUFnW1nCtEkqTm3cUEoT3r9uMsOerfq/WsXhuA==
X-Received: by 2002:a05:6808:1381:b0:3c3:d815:b670 with SMTP id c1-20020a056808138100b003c3d815b670mr278609oiw.2.1711553042809;
        Wed, 27 Mar 2024 08:24:02 -0700 (PDT)
Received: from x1n.redhat.com ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id hu4-20020a056214234400b00690dd47a41csm6412639qvb.86.2024.03.27.08.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 08:24:02 -0700 (PDT)
From: peterx@redhat.com
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 13/13] mm/gup: Handle hugetlb in the generic follow_page_mask code
Date: Wed, 27 Mar 2024 11:23:32 -0400
Message-ID: <20240327152332.950956-14-peterx@redhat.com>
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

Now follow_page() is ready to handle hugetlb pages in whatever form, and
over all architectures.  Switch to the generic code path.

Time to retire hugetlb_follow_page_mask(), following the previous
retirement of follow_hugetlb_page() in 4849807114b8.

There may be a slight difference of how the loops run when processing slow
GUP over a large hugetlb range on cont_pte/cont_pmd supported archs: each
loop of __get_user_pages() will resolve one pgtable entry with the patch
applied, rather than relying on the size of hugetlb hstate, the latter may
cover multiple entries in one loop.

A quick performance test on an aarch64 VM on M1 chip shows 15% degrade over
a tight loop of slow gup after the path switched.  That shouldn't be a
problem because slow-gup should not be a hot path for GUP in general: when
page is commonly present, fast-gup will already succeed, while when the
page is indeed missing and require a follow up page fault, the slow gup
degrade will probably buried in the fault paths anyway.  It also explains
why slow gup for THP used to be very slow before 57edfcfd3419 ("mm/gup:
accelerate thp gup even for "pages != NULL"") lands, the latter not part of
a performance analysis but a side benefit.  If the performance will be a
concern, we can consider handle CONT_PTE in follow_page().

Before that is justified to be necessary, keep everything clean and simple.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/hugetlb.h |  7 ----
 mm/gup.c                | 15 +++------
 mm/hugetlb.c            | 71 -----------------------------------------
 3 files changed, 5 insertions(+), 88 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 294c78b3549f..a546140f89cd 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -328,13 +328,6 @@ static inline void hugetlb_zap_end(
 {
 }
 
-static inline struct page *hugetlb_follow_page_mask(
-    struct vm_area_struct *vma, unsigned long address, unsigned int flags,
-    unsigned int *page_mask)
-{
-	BUILD_BUG(); /* should never be compiled in if !CONFIG_HUGETLB_PAGE*/
-}
-
 static inline int copy_hugetlb_page_range(struct mm_struct *dst,
 					  struct mm_struct *src,
 					  struct vm_area_struct *dst_vma,
diff --git a/mm/gup.c b/mm/gup.c
index a02463c9420e..c803d0b0f358 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1135,18 +1135,11 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 {
 	pgd_t *pgd;
 	struct mm_struct *mm = vma->vm_mm;
+	struct page *page;
 
-	ctx->page_mask = 0;
-
-	/*
-	 * Call hugetlb_follow_page_mask for hugetlb vmas as it will use
-	 * special hugetlb page table walking code.  This eliminates the
-	 * need to check for hugetlb entries in the general walking code.
-	 */
-	if (is_vm_hugetlb_page(vma))
-		return hugetlb_follow_page_mask(vma, address, flags,
-						&ctx->page_mask);
+	vma_pgtable_walk_begin(vma);
 
+	ctx->page_mask = 0;
 	pgd = pgd_offset(mm, address);
 
 	if (unlikely(is_hugepd(__hugepd(pgd_val(*pgd)))))
@@ -1157,6 +1150,8 @@ static struct page *follow_page_mask(struct vm_area_struct *vma,
 	else
 		page = follow_p4d_mask(vma, address, pgd, flags, ctx);
 
+	vma_pgtable_walk_end(vma);
+
 	return page;
 }
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 65b9c9a48fd2..cc79891a3597 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -6870,77 +6870,6 @@ int hugetlb_mfill_atomic_pte(pte_t *dst_pte,
 }
 #endif /* CONFIG_USERFAULTFD */
 
-struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
-				      unsigned long address, unsigned int flags,
-				      unsigned int *page_mask)
-{
-	struct hstate *h = hstate_vma(vma);
-	struct mm_struct *mm = vma->vm_mm;
-	unsigned long haddr = address & huge_page_mask(h);
-	struct page *page = NULL;
-	spinlock_t *ptl;
-	pte_t *pte, entry;
-	int ret;
-
-	hugetlb_vma_lock_read(vma);
-	pte = hugetlb_walk(vma, haddr, huge_page_size(h));
-	if (!pte)
-		goto out_unlock;
-
-	ptl = huge_pte_lock(h, mm, pte);
-	entry = huge_ptep_get(pte);
-	if (pte_present(entry)) {
-		page = pte_page(entry);
-
-		if (!huge_pte_write(entry)) {
-			if (flags & FOLL_WRITE) {
-				page = NULL;
-				goto out;
-			}
-
-			if (gup_must_unshare(vma, flags, page)) {
-				/* Tell the caller to do unsharing */
-				page = ERR_PTR(-EMLINK);
-				goto out;
-			}
-		}
-
-		page = nth_page(page, ((address & ~huge_page_mask(h)) >> PAGE_SHIFT));
-
-		/*
-		 * Note that page may be a sub-page, and with vmemmap
-		 * optimizations the page struct may be read only.
-		 * try_grab_page() will increase the ref count on the
-		 * head page, so this will be OK.
-		 *
-		 * try_grab_page() should always be able to get the page here,
-		 * because we hold the ptl lock and have verified pte_present().
-		 */
-		ret = try_grab_page(page, flags);
-
-		if (WARN_ON_ONCE(ret)) {
-			page = ERR_PTR(ret);
-			goto out;
-		}
-
-		*page_mask = (1U << huge_page_order(h)) - 1;
-	}
-out:
-	spin_unlock(ptl);
-out_unlock:
-	hugetlb_vma_unlock_read(vma);
-
-	/*
-	 * Fixup retval for dump requests: if pagecache doesn't exist,
-	 * don't try to allocate a new page but just skip it.
-	 */
-	if (!page && (flags & FOLL_DUMP) &&
-	    !hugetlbfs_pagecache_present(h, vma, address))
-		page = ERR_PTR(-EFAULT);
-
-	return page;
-}
-
 long hugetlb_change_protection(struct vm_area_struct *vma,
 		unsigned long address, unsigned long end,
 		pgprot_t newprot, unsigned long cp_flags)
-- 
2.44.0

