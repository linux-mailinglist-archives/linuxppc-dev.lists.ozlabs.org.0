Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E42165B0C0F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 20:03:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MN98f1mYDz3c5v
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 04:02:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Doko71dt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=shy828301@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Doko71dt;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN97P1Zs3z2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 04:01:51 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id pj10so4873588pjb.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Sep 2022 11:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=UHYrwEcXPbGBhfii4X3ydQ5bpddbyvYjPSHAsGv/lH4=;
        b=Doko71dtNVKu/BhyMmGhby+5UUD7eQNqxwNLK82EUfGX5hRVsaHhveHIiLbtb455zC
         5uQiezT061WGQLtnac/5oxTDVM2pExBgYyuIce4gXxFM4emRXhvHbHtg0mHipn7ADiq6
         +Vu5BgfJSWzgqC/tK9ekDstxD8caurkZlnJ7oyYh0MWUXOTS5xdxMwCo3/vLM0UL0hF1
         ljoxl+9/DhCrjm1Ou72naIcIWhli5dUKKQp7XGpExD/rL3JFasi1izq2tUiB8ML8tQSa
         nkZZWQ8I4b3C/kYqqPSJhkPdB8icbFAZ/XNlARpcMUsOp4CJCZ6ZeHfO+oroBOA3TtLN
         atmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=UHYrwEcXPbGBhfii4X3ydQ5bpddbyvYjPSHAsGv/lH4=;
        b=DTg3XTdlIFQaabvKuMxAab0P/NbeDNi0/6rx4cXKEvcXxW74kl4cWkNdDDB8/H4HB8
         Rns7qKRVuGqrOGxJjqrs36H5NF+f4gGlxRiMxbPZYdmpIm2mQSagm1pQLVSSmSRD6TnM
         3MXmqp4NjeHDIr7qjAqYv2l40FlEHLwU1qQSNBrbQzIVo15nzM7JBaNueGLAuYQSwDYe
         4AMS04T8egXaQfwQNmFrDMW0+x8ccX06PF3jm3y0d61Q8XgG9AUFah2yxnLSYgHe3ZMY
         Ew3y1z3IXTVQuJmDOBEVZBgN9II+HXYIe8uIRTPhyO68s1YukGCzakidErqWHjaVl3gl
         qKEw==
X-Gm-Message-State: ACgBeo2gJMvXTSVY932Z71ma92p6MACislIaVa1yfe7ccSBUNBi5QkYC
	6BZsZ8G5rfAI1SLHL+Fqhsg=
X-Google-Smtp-Source: AA6agR6+7Dm7eIkNWnpZLwRV6pSc8CxeNaPaeJzHXSnuuWgT/UX831Yvo6fd3ymvW7WSe7CjhGk3uQ==
X-Received: by 2002:a17:90b:4a4b:b0:202:5bbb:b7b6 with SMTP id lb11-20020a17090b4a4b00b002025bbbb7b6mr1513741pjb.161.1662573708142;
        Wed, 07 Sep 2022 11:01:48 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-241-145.hsd1.ca.comcast.net. [67.174.241.145])
        by smtp.gmail.com with ESMTPSA id t17-20020a170902e85100b0017312bfca95sm12801664plg.253.2022.09.07.11.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 11:01:46 -0700 (PDT)
From: Yang Shi <shy828301@gmail.com>
To: david@redhat.com,
	peterx@redhat.com,
	kirill.shutemov@linux.intel.com,
	jhubbard@nvidia.com,
	jgg@nvidia.com,
	hughd@google.com,
	akpm@linux-foundation.org,
	aneesh.kumar@linux.ibm.com
Subject: [v2 PATCH 1/2] mm: gup: fix the fast GUP race against THP collapse
Date: Wed,  7 Sep 2022 11:01:43 -0700
Message-Id: <20220907180144.555485-1-shy828301@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-mm@kvack.org, shy828301@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since general RCU GUP fast was introduced in commit 2667f50e8b81 ("mm:
introduce a general RCU get_user_pages_fast()"), a TLB flush is no longer
sufficient to handle concurrent GUP-fast in all cases, it only handles
traditional IPI-based GUP-fast correctly.  On architectures that send
an IPI broadcast on TLB flush, it works as expected.  But on the
architectures that do not use IPI to broadcast TLB flush, it may have
the below race:

   CPU A                                          CPU B
THP collapse                                     fast GUP
                                              gup_pmd_range() <-- see valid pmd
                                                  gup_pte_range() <-- work on pte
pmdp_collapse_flush() <-- clear pmd and flush
__collapse_huge_page_isolate()
    check page pinned <-- before GUP bump refcount
                                                      pin the page
                                                      check PTE <-- no change
__collapse_huge_page_copy()
    copy data to huge page
    ptep_clear()
install huge pmd for the huge page
                                                      return the stale page
discard the stale page

The race could be fixed by checking whether PMD is changed or not after
taking the page pin in fast GUP, just like what it does for PTE.  If the
PMD is changed it means there may be parallel THP collapse, so GUP
should back off.

Also update the stale comment about serializing against fast GUP in
khugepaged.

Fixes: 2667f50e8b81 ("mm: introduce a general RCU get_user_pages_fast()")
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Yang Shi <shy828301@gmail.com>
---
v2: * Incorporated the comment from Peter about the comment.
    * Moved the comment right before gup_pte_range() instead of in the
      body of the function, per John.
    * Added patch 2/2 per Aneesh.

 mm/gup.c        | 34 ++++++++++++++++++++++++++++------
 mm/khugepaged.c | 10 ++++++----
 2 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index f3fc1f08d90c..40aa1c937212 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2380,8 +2380,28 @@ static void __maybe_unused undo_dev_pagemap(int *nr, int nr_start,
 }
 
 #ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
-static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
-			 unsigned int flags, struct page **pages, int *nr)
+/*
+ * Fast-gup relies on pte change detection to avoid concurrent pgtable
+ * operations.
+ *
+ * To pin the page, fast-gup needs to do below in order:
+ * (1) pin the page (by prefetching pte), then (2) check pte not changed.
+ *
+ * For the rest of pgtable operations where pgtable updates can be racy
+ * with fast-gup, we need to do (1) clear pte, then (2) check whether page
+ * is pinned.
+ *
+ * Above will work for all pte-level operations, including THP split.
+ *
+ * For THP collapse, it's a bit more complicated because fast-gup may be
+ * walking a pgtable page that is being freed (pte is still valid but pmd
+ * can be cleared already).  To avoid race in such condition, we need to
+ * also check pmd here to make sure pmd doesn't change (corresponds to
+ * pmdp_collapse_flush() in the THP collapse code path).
+ */
+static int gup_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
+			 unsigned long end, unsigned int flags,
+			 struct page **pages, int *nr)
 {
 	struct dev_pagemap *pgmap = NULL;
 	int nr_start = *nr, ret = 0;
@@ -2423,7 +2443,8 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
 			goto pte_unmap;
 		}
 
-		if (unlikely(pte_val(pte) != pte_val(*ptep))) {
+		if (unlikely(pmd_val(pmd) != pmd_val(*pmdp)) ||
+		    unlikely(pte_val(pte) != pte_val(*ptep))) {
 			gup_put_folio(folio, 1, flags);
 			goto pte_unmap;
 		}
@@ -2470,8 +2491,9 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
  * get_user_pages_fast_only implementation that can pin pages. Thus it's still
  * useful to have gup_huge_pmd even if we can't operate on ptes.
  */
-static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
-			 unsigned int flags, struct page **pages, int *nr)
+static int gup_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
+			 unsigned long end, unsigned int flags,
+			 struct page **pages, int *nr)
 {
 	return 0;
 }
@@ -2791,7 +2813,7 @@ static int gup_pmd_range(pud_t *pudp, pud_t pud, unsigned long addr, unsigned lo
 			if (!gup_huge_pd(__hugepd(pmd_val(pmd)), addr,
 					 PMD_SHIFT, next, flags, pages, nr))
 				return 0;
-		} else if (!gup_pte_range(pmd, addr, next, flags, pages, nr))
+		} else if (!gup_pte_range(pmd, pmdp, addr, next, flags, pages, nr))
 			return 0;
 	} while (pmdp++, addr = next, addr != end);
 
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 2d74cf01f694..518b49095db3 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1049,10 +1049,12 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
 
 	pmd_ptl = pmd_lock(mm, pmd); /* probably unnecessary */
 	/*
-	 * After this gup_fast can't run anymore. This also removes
-	 * any huge TLB entry from the CPU so we won't allow
-	 * huge and small TLB entries for the same virtual address
-	 * to avoid the risk of CPU bugs in that area.
+	 * This removes any huge TLB entry from the CPU so we won't allow
+	 * huge and small TLB entries for the same virtual address to
+	 * avoid the risk of CPU bugs in that area.
+	 *
+	 * Parallel fast GUP is fine since fast GUP will back off when
+	 * it detects PMD is changed.
 	 */
 	_pmd = pmdp_collapse_flush(vma, address, pmd);
 	spin_unlock(pmd_ptl);
-- 
2.26.3

