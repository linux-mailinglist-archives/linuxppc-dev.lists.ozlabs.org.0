Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0D771445B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 08:23:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QV57l6kmQz3fGC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 16:23:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=JnCv5o3g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=JnCv5o3g;
	dkim-atps=neutral
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QV56x6Lwvz3bTf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 16:22:49 +1000 (AEST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-565c7399afaso27085277b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 May 2023 23:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685341366; x=1687933366;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MHjeymamXVEDQ3Kw25JCka7yLmkzZOMAvMVAEydeLzM=;
        b=JnCv5o3gZCSjIaRpRDj860LJkDOANHqriyLGSv5pPF/RAyg9m3lQdupCXaTyei8DMf
         e3KqZBCpZIzZeMjk/yaxPctH6c49veiWRbUeGgx17gSNxkwyxqN1QFATHf6q6YutmR3t
         HvT+zDNBDGXXzqUl/LmcNCNapCFXfgc8yyTJIwdBnMkvFfp9LdRJqcRYSLqq8ynJ3LiF
         LXxpx3gFYAZnedKKq/SPuYQMj/8ol6u4/3db6BOFo/ME2oJub0w8Z8IEMye4507Zx0Ui
         smMsg0FV9ON+iRDLGBbSQlzdjRNF2P0/vV32Ee1vXvhsjJhpzkmQMG6hoZRiP5zjDNGY
         IC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685341366; x=1687933366;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MHjeymamXVEDQ3Kw25JCka7yLmkzZOMAvMVAEydeLzM=;
        b=CIg6W8VgSwAP8YXtA4NlX2mK/Sz9eWRkYuHfjOy+gd3em+a/c/nbmQzRZj59F6SZeX
         5U1BDv5QUS4Tj1kBG6rcrjbUwvlMofJrZEq7i5pYDj4EFPJJ0vyt8xg0GCEjnJ75IKqb
         GNIbNjWdoUiVZWc4zNJFyob/6buZTdLNt6GXhgiD07Om3BZCKA0qsSBRzuVmpS7zioDJ
         6ClTozzJZUUwe3bgXAFprCvLhFxWY81hMmLH20cSCgCMp0ZCYlEqHi7vIwNEpgfqqSVG
         MTDhYj3MMBHGR98Om5WOj8hNu/6iAeUZBN7mbxlSOhcLaJ94zYX3OKcP9zZhmDp3Ac2i
         xAsw==
X-Gm-Message-State: AC+VfDzoDiBDVLVMc91+djOVL3H4w0GhT8KazcksQPXvPsL8ilb2LEGJ
	Q2eyJ71Vt+wY5CldfxX4B7wqFw==
X-Google-Smtp-Source: ACHHUZ4SIMI4er/AF0deXgjHIDsOF79qc5oA7wlkFnZQpWYe4q0dmwzIjbUF/Ql+fhbfUc3dtFgx4A==
X-Received: by 2002:a81:a043:0:b0:560:beeb:6fc1 with SMTP id x64-20020a81a043000000b00560beeb6fc1mr13114394ywg.16.1685341365991;
        Sun, 28 May 2023 23:22:45 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id t66-20020a818345000000b00568938ca41bsm405426ywf.53.2023.05.28.23.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 23:22:45 -0700 (PDT)
Date: Sun, 28 May 2023 23:22:40 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 07/12] s390: add pte_free_defer(), with use of
 mmdrop_async()
In-Reply-To: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
Message-ID: <6dd63b39-e71f-2e8b-7e0-83e02f3bcb39@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Ca
 rstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add s390-specific pte_free_defer(), to call pte_free() via call_rcu().
pte_free_defer() will be called inside khugepaged's retract_page_tables()
loop, where allocating extra memory cannot be relied upon.  This precedes
the generic version to avoid build breakage from incompatible pgtable_t.

This version is more complicated than others: because page_table_free()
needs to know which fragment is being freed, and which mm to link it to.

page_table_free()'s fragment handling is clever, but I could too easily
break it: what's done here in pte_free_defer() and pte_free_now() might
be better integrated with page_table_free()'s cleverness, but not by me!

By the time that page_table_free() gets called via RCU, it's conceivable
that mm would already have been freed: so mmgrab() in pte_free_defer()
and mmdrop() in pte_free_now().  No, that is not a good context to call
mmdrop() from, so make mmdrop_async() public and use that.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/s390/include/asm/pgalloc.h |  4 ++++
 arch/s390/mm/pgalloc.c          | 34 +++++++++++++++++++++++++++++++++
 include/linux/mm_types.h        |  2 +-
 include/linux/sched/mm.h        |  1 +
 kernel/fork.c                   |  2 +-
 5 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/s390/include/asm/pgalloc.h b/arch/s390/include/asm/pgalloc.h
index 17eb618f1348..89a9d5ef94f8 100644
--- a/arch/s390/include/asm/pgalloc.h
+++ b/arch/s390/include/asm/pgalloc.h
@@ -143,6 +143,10 @@ static inline void pmd_populate(struct mm_struct *mm,
 #define pte_free_kernel(mm, pte) page_table_free(mm, (unsigned long *) pte)
 #define pte_free(mm, pte) page_table_free(mm, (unsigned long *) pte)
 
+/* arch use pte_free_defer() implementation in arch/s390/mm/pgalloc.c */
+#define pte_free_defer pte_free_defer
+void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
+
 void vmem_map_init(void);
 void *vmem_crst_alloc(unsigned long val);
 pte_t *vmem_pte_alloc(void);
diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index 66ab68db9842..0129de9addfd 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -346,6 +346,40 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
 	__free_page(page);
 }
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static void pte_free_now(struct rcu_head *head)
+{
+	struct page *page;
+	unsigned long mm_bit;
+	struct mm_struct *mm;
+	unsigned long *table;
+
+	page = container_of(head, struct page, rcu_head);
+	table = (unsigned long *)page_to_virt(page);
+	mm_bit = (unsigned long)page->pt_mm;
+	/* 4K page has only two 2K fragments, but alignment allows eight */
+	mm = (struct mm_struct *)(mm_bit & ~7);
+	table += PTRS_PER_PTE * (mm_bit & 7);
+	page_table_free(mm, table);
+	mmdrop_async(mm);
+}
+
+void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
+{
+	struct page *page;
+	unsigned long mm_bit;
+
+	mmgrab(mm);
+	page = virt_to_page(pgtable);
+	/* Which 2K page table fragment of a 4K page? */
+	mm_bit = ((unsigned long)pgtable & ~PAGE_MASK) /
+			(PTRS_PER_PTE * sizeof(pte_t));
+	mm_bit += (unsigned long)mm;
+	page->pt_mm = (struct mm_struct *)mm_bit;
+	call_rcu(&page->rcu_head, pte_free_now);
+}
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
 void page_table_free_rcu(struct mmu_gather *tlb, unsigned long *table,
 			 unsigned long vmaddr)
 {
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 306a3d1a0fa6..1667a1bdb8a8 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -146,7 +146,7 @@ struct page {
 			pgtable_t pmd_huge_pte; /* protected by page->ptl */
 			unsigned long _pt_pad_2;	/* mapping */
 			union {
-				struct mm_struct *pt_mm; /* x86 pgds only */
+				struct mm_struct *pt_mm; /* x86 pgd, s390 */
 				atomic_t pt_frag_refcount; /* powerpc */
 			};
 #if ALLOC_SPLIT_PTLOCKS
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 8d89c8c4fac1..a9043d1a0d55 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -41,6 +41,7 @@ static inline void smp_mb__after_mmgrab(void)
 	smp_mb__after_atomic();
 }
 
+extern void mmdrop_async(struct mm_struct *mm);
 extern void __mmdrop(struct mm_struct *mm);
 
 static inline void mmdrop(struct mm_struct *mm)
diff --git a/kernel/fork.c b/kernel/fork.c
index ed4e01daccaa..fa4486b65c56 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -942,7 +942,7 @@ static void mmdrop_async_fn(struct work_struct *work)
 	__mmdrop(mm);
 }
 
-static void mmdrop_async(struct mm_struct *mm)
+void mmdrop_async(struct mm_struct *mm)
 {
 	if (unlikely(atomic_dec_and_test(&mm->mm_count))) {
 		INIT_WORK(&mm->async_put_work, mmdrop_async_fn);
-- 
2.35.3

