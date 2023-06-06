Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8B77235D8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 05:41:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZx8f1c9cz3bkm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 13:41:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=AaSiNAsI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=AaSiNAsI;
	dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZx7k6dYNz3brK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 13:40:17 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-ba86ea269e0so6621738276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jun 2023 20:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686022813; x=1688614813;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ppdA1HOEm1YrutAbUD+A9qZwrkXnWHAEzQEcPuSUQvw=;
        b=AaSiNAsIPj5e3tOnCQ/aDowLknZMLmU1vqGBzyA4VjJt+CZ0FWqvIx2oN71D86IR0v
         FLViUws5VQumFsM7KuBRwAT9VyLPyIW6vadfXNFCVtZX1vDhmNuhC/0Zy2It8DAerBJ7
         8xLEzAq1ZdtK+acCt5qtqT32IDaYRv8zVMNcJrHWVabmhyjuksDG7D9pQLYr3kwY8eb5
         sFUu+DxLJxSAb/iCrBbAGJGyTG8qDwYsB+chGm1QZBtw3mPwOv5o7/isigAxJcvEVc+8
         uMzKkJ3fuweEFhICAeW4n1QGGYEv+F56c310I8HaydTlCx1+CH3/oUQ5UXKHP1tzbapc
         IwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686022813; x=1688614813;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ppdA1HOEm1YrutAbUD+A9qZwrkXnWHAEzQEcPuSUQvw=;
        b=JJzlK4rt0IDkFkR79zD8Y/Ra6k6UCqbOm/ZYhjmt1kVxWQoU7yUYVXhn1fWA5rpgyf
         YiUpoZp5Rc+iEdlY5lG+6jlKpTzHPug4HXWpwkG9YiY9lM+HZyhD24Y6DrXEJ1hKfIU/
         J2VltBTqai6M2836QmBdxBShAVkBgF2h/7WBJFD6aYTDKRH3Em+UR0hYLZTqWYz4DJg1
         Qt1De9/I8lMLnIObzlmmfVd2Gz7yr3CwgBLaI9uPHzWb95OELcFt1Kr9JwN3omMszdMc
         NlszLlxGREM/LODMzl+2P7tAr2DuUguG+Kmx974Y4Yr2gmuX81VNdHS41shHwb1EeJqR
         vzLg==
X-Gm-Message-State: AC+VfDzmMqjU6fgSof47MDoPHZuAWOtTO90bJfUP44XnhqJCJeqcSZu3
	CT+k77Kto7bZfCy9jXR5/960QA==
X-Google-Smtp-Source: ACHHUZ5z/giZNmIrlQ3cgoOoM3851R87uLopCghqIrYrEcOCft5W4FkKF+LeL6IbE2hJ4M6UbpPI1w==
X-Received: by 2002:a81:7d84:0:b0:565:a8dd:c6f4 with SMTP id y126-20020a817d84000000b00565a8ddc6f4mr535188ywc.33.1686022812680;
        Mon, 05 Jun 2023 20:40:12 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id z128-20020a0dd786000000b00568e5a65698sm3754537ywd.28.2023.06.05.20.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 20:40:11 -0700 (PDT)
Date: Mon, 5 Jun 2023 20:40:01 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 05/12] powerpc: add pte_free_defer() for pgtables sharing
 page
In-Reply-To: <ZHn6n5eVTsr4Wl8x@ziepe.ca>
Message-ID: <4df4909f-f5dd-6f94-9792-8f2949f542b3@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com> <28eb289f-ea2c-8eb9-63bb-9f7d7b9ccc11@google.com> <ZHSwWgLWaEd+zi/g@casper.infradead.org> <ZHn6n5eVTsr4Wl8x@ziepe.ca>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshu
 man.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2 Jun 2023, Jason Gunthorpe wrote:
> On Mon, May 29, 2023 at 03:02:02PM +0100, Matthew Wilcox wrote:
> > On Sun, May 28, 2023 at 11:20:21PM -0700, Hugh Dickins wrote:
> > > +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
> > > +{
> > > +	struct page *page;
> > > +
> > > +	page = virt_to_page(pgtable);
> > > +	call_rcu(&page->rcu_head, pte_free_now);
> > > +}
> > 
> > This can't be safe (on ppc).  IIRC you might have up to 16x4k page
> > tables sharing one 64kB page.  So if you have two page tables from the
> > same page being defer-freed simultaneously, you'll reuse the rcu_head
> > and I cannot imagine things go well from that point.
> > 
> > I have no idea how to solve this problem.
> 
> Maybe power and s390 should allocate a side structure, sort of a
> pre-memdesc thing to store enough extra data?
> 
> If we can get enough bytes then something like this would let a single
> rcu head be shared to manage the free bits.
> 
> struct 64k_page {
>     u8 free_pages;
>     u8 pending_rcu_free_pages;
>     struct rcu_head head;
> }
> 
> free_sub_page(sub_id)
>     if (atomic_fetch_or(1 << sub_id, &64k_page->pending_rcu_free_pages))
>          call_rcu(&64k_page->head)
> 
> rcu_func()
>    64k_page->free_pages |= atomic_xchg(0, &64k_page->pending_rcu_free_pages)
> 
>    if (64k_pages->free_pages == all_ones)
>       free_pgea(64k_page);

Or simply allocate as many rcu_heads as page tables.

I have not thought through your suggestion above, because I'm against
asking s390, or any other architecture, to degrade its page table
implementation by demanding more memory, just for the sake of my patch
series.  In a future memdesc world it might turn out to be reasonable,
but not for this (if I can possibly avoid it).

Below is what I believe to be the correct powerpc patch (built but not
retested).  sparc I thought was going to be an equal problem, but turns
out not: I'll comment on 06/12.  And let's move s390 discussion to 07/12.

[PATCH 05/12] powerpc: add pte_free_defer() for pgtables sharing page

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

