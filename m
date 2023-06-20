Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8F3736529
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:48:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=FTDl5iE6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qlf025yYpz3bWQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 17:48:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=FTDl5iE6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qldz75KbGz2yxt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 17:48:02 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-be30cbe88b3so4509743276.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687247279; x=1689839279;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VQ3G/mOw1YDakj6K/QDY3ISJ4AmLryMvPDR0lMuqBuw=;
        b=FTDl5iE634tOzkrqSCVEu9Nf5D7hLqctOZFWgKMkQ3RqUmNsUi/5jC5UBELVK+62a/
         tppQbX64R9NP8cj1gGJ6SvM5CU9vfUE39QVPjAKeWzgQ/S5s5xCa2DCQNDmPIUw76uDU
         docHziNctEA/rKYRNqAAe9o2ycs/Al7k/GvMXYgsm/K5xYfYahKx2SHDAiqufCA//I5i
         fpqnLbMwekkTgKZJTegbsUNCWCDlJKVeWVzpAxM2KcHVartgtsYK5L6lD7NGrGn8gZ8V
         H4EcXMPG6hTq4PUDvh8MLdynIDaaJQky/EdiXCX827BTAn0GvFQ+WeIvsKvPBLKBi8Cj
         Dm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687247279; x=1689839279;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VQ3G/mOw1YDakj6K/QDY3ISJ4AmLryMvPDR0lMuqBuw=;
        b=Py0dDUxKtMK5lATWNlLQMIbHzDAW3lBT0jbK1Ml18WiXLZpvA8gzJNzJLI5G5vGvBF
         /zMtZe/kFkFVlgIb178P0N7vJhYmD7pWnam5zEXVpDTM1NKLaraD14dE8rJ/inRoBxWt
         /eYIZWj5PxUcymrYaZM5wo+7ZAWbUJRtAlpoIZbP4PUs3H7HTTY4p7SqT/GFjx2qkV/Q
         YtJnrM2+k6lzMSN0U/8YhA941ZMYVAjjTW0uEG5RV1fqe0lLd76y8bplXsMb/7vkQZd3
         /7sNYqbGrD1JLMpoOvjfF0U3idhtSZ6YRibSgLOfQM8vP8wFCXDL1UBzacOsTW6O/hDi
         hJUg==
X-Gm-Message-State: AC+VfDyvX0+zA8Ey7A3xfhqgYJcC790BpJQ6y3VsoJRjxJHOUFp4MAEg
	xYK61dhYRlq97f4jQt5PlpnrZA==
X-Google-Smtp-Source: ACHHUZ4S0WdBV687zylMKJcs5BTJOEB/HsGWCswlmI7GBgVKK08qTW3e1TZ6XRwEWVZtJ7HVB5KlNQ==
X-Received: by 2002:a0d:e64d:0:b0:569:74f3:f3e1 with SMTP id p74-20020a0de64d000000b0056974f3f3e1mr11385428ywe.0.1687247279055;
        Tue, 20 Jun 2023 00:47:59 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id j127-20020a0df985000000b005612fc707bfsm364068ywf.120.2023.06.20.00.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 00:47:58 -0700 (PDT)
Date: Tue, 20 Jun 2023 00:47:54 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 05/12] powerpc: add pte_free_defer() for pgtables sharing
 page
In-Reply-To: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
Message-ID: <5cd9f442-61da-4c3d-eca-b7f44d22aa5f@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mel Gorman <mgorman@techsingularity.net>, "David Sc. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add powerpc-specific pte_free_defer(), to call pte_free() via call_rcu().
pte_free_defer() will be called inside khugepaged's retract_page_tables()
loop, where allocating extra memory cannot be relied upon.  This precedes
the generic version to avoid build breakage from incompatible pgtable_t.

This is awkward because the struct page contains only one rcu_head, but
that page may be shared between PTE_FRAG_NR pagetables, each wanting to
use the rcu_head at the same time: account concurrent deferrals with a
heightened refcount, only the first making use of the rcu_head, but
re-deferring if more deferrals arrived during its grace period.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/powerpc/include/asm/pgalloc.h |  4 +++
 arch/powerpc/mm/pgtable-frag.c     | 51 ++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/powerpc/include/asm/pgalloc.h b/arch/powerpc/include/asm/pgalloc.h
index 3360cad78ace..3a971e2a8c73 100644
--- a/arch/powerpc/include/asm/pgalloc.h
+++ b/arch/powerpc/include/asm/pgalloc.h
@@ -45,6 +45,10 @@ static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
 	pte_fragment_free((unsigned long *)ptepage, 0);
 }
 
+/* arch use pte_free_defer() implementation in arch/powerpc/mm/pgtable-frag.c */
+#define pte_free_defer pte_free_defer
+void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
+
 /*
  * Functions that deal with pagetables that could be at any level of
  * the table need to be passed an "index_size" so they know how to
diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
index 20652daa1d7e..e4f58c5fc2ac 100644
--- a/arch/powerpc/mm/pgtable-frag.c
+++ b/arch/powerpc/mm/pgtable-frag.c
@@ -120,3 +120,54 @@ void pte_fragment_free(unsigned long *table, int kernel)
 		__free_page(page);
 	}
 }
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+#define PTE_FREE_DEFERRED 0x10000 /* beyond any PTE_FRAG_NR */
+
+static void pte_free_now(struct rcu_head *head)
+{
+	struct page *page;
+	int refcount;
+
+	page = container_of(head, struct page, rcu_head);
+	refcount = atomic_sub_return(PTE_FREE_DEFERRED - 1,
+				     &page->pt_frag_refcount);
+	if (refcount < PTE_FREE_DEFERRED) {
+		pte_fragment_free((unsigned long *)page_address(page), 0);
+		return;
+	}
+	/*
+	 * One page may be shared between PTE_FRAG_NR pagetables.
+	 * At least one more call to pte_free_defer() came in while we
+	 * were already deferring, so the free must be deferred again;
+	 * but just for one grace period, however many calls came in.
+	 */
+	while (refcount >= PTE_FREE_DEFERRED + PTE_FREE_DEFERRED) {
+		refcount = atomic_sub_return(PTE_FREE_DEFERRED,
+					     &page->pt_frag_refcount);
+	}
+	/* Remove that refcount of 1 left for fragment freeing above */
+	atomic_dec(&page->pt_frag_refcount);
+	call_rcu(&page->rcu_head, pte_free_now);
+}
+
+void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
+{
+	struct page *page;
+
+	page = virt_to_page(pgtable);
+	/*
+	 * One page may be shared between PTE_FRAG_NR pagetables: only queue
+	 * it once for freeing, but note whenever the free must be deferred.
+	 *
+	 * (This would be much simpler if the struct page had an rcu_head for
+	 * each fragment, or if we could allocate a separate array for that.)
+	 *
+	 * Convert our refcount of 1 to a refcount of PTE_FREE_DEFERRED, and
+	 * proceed to call_rcu() only when the rcu_head is not already in use.
+	 */
+	if (atomic_add_return(PTE_FREE_DEFERRED - 1, &page->pt_frag_refcount) <
+			      PTE_FREE_DEFERRED + PTE_FREE_DEFERRED)
+		call_rcu(&page->rcu_head, pte_free_now);
+}
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
-- 
2.35.3

