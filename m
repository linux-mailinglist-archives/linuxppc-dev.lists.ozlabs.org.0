Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D44273958B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 04:37:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=O3tP+byB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qmkzl11B3z30PJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 12:37:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=O3tP+byB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qmkyq4K5Cz2xFm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 12:36:34 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-bc40d4145feso6278722276.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 19:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687401389; x=1689993389;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v95kJuIKZOvwX2VyzbcG9p4WcOSZqpPbckNEDTbMqbw=;
        b=O3tP+byBHyqrVuzTTEu8WRLDc/8A9uAf+TdWk4s+4iRKfQ5KOSa7bvLkBzTYKr0W8M
         j3sRCXur+WjZ9BeHD+FncbDp1prKZ/qXqo9vRO5qA8AQSnrPS9w22qXk+xnyoij9+QY4
         Acm9ERBt0JMUlTv5p8Jp0yNYMVl5d341AvRtjPFDRxez8WAwHgXzS6SBOEkhSkDpkgzA
         FicxTEqozjAq1pC+B+ZdlXfR0aFh6Inz+lQvgqOR+F9yGjspH8iPGFbJTwEd3pnnSvO5
         lsJm1UV477OB7Dih1OhkfIqmAM0XwW9HFmiv+LGL2kzkOO0DnreoAdIjNdFX9CO4XaoS
         SsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401389; x=1689993389;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v95kJuIKZOvwX2VyzbcG9p4WcOSZqpPbckNEDTbMqbw=;
        b=iNkqibIzgRhcZEDfRzi6bil/5jzcHcvlj7z4gcds8SfXCMssyd2QC7GxYVoZAzWaGX
         0JIYYGrJqFz8AMfAjlIYSjs/PXbcfSmYSNxt/qE9DEi2o+v3aEwr4ZOiPYWmmfE4txi/
         xCV8gsPwqrqk+Z5oG4ssMdySjD7AjGrYZHhVFUa0PkpnqI8lLAdU7RhpqXEWe21yldAJ
         YUs0OoN9I1p9EdqSRrpz3alzcyAHNzLt8y8cQaIs3BpjPv8CK3BhH1EUE6N2LxVFinYl
         q7/duwNrZNKrlrZ9NxOra1UntikrPGlW0w8l2n2ob7pD/kYkXGyjF5JtaHGnE01XZAMR
         wstw==
X-Gm-Message-State: AC+VfDz1+w+qDytZQDGYDyPhaEeQDUL3VmZBnem1mUmKT4lZBOpEDGPB
	d+o6mkqzFbWBNnDAgBTtAlMx7w==
X-Google-Smtp-Source: ACHHUZ7nNc0KOSzPxWDeH97+s3XtTQiSXAf5QSy+8GGNP+KxVnc2GWHN4WSyWChzR7EoY+E3ZvtVZQ==
X-Received: by 2002:a0d:e6d3:0:b0:56d:ffa:f3b0 with SMTP id p202-20020a0de6d3000000b0056d0ffaf3b0mr14905560ywe.52.1687401389086;
        Wed, 21 Jun 2023 19:36:29 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id e65-20020a0dc244000000b0056cffe97a11sm1564690ywd.13.2023.06.21.19.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:27 -0700 (PDT)
Date: Wed, 21 Jun 2023 19:36:11 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 05/12] powerpc: add pte_free_defer() for pgtables
 sharing page
In-Reply-To: <ZJI7xkXWmjrE1yY3@ziepe.ca>
Message-ID: <c8284d0-91cb-b65e-4c95-bfeb627234f@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com> <5cd9f442-61da-4c3d-eca-b7f44d22aa5f@google.com> <ZJGRa4zvsXfc43vB@ziepe.ca> <2ad8b6cf-692a-ff89-ecc-586c20c5e07f@google.com> <ZJI7xkXWmjrE1yY3@ziepe.ca>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbe
 ll@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David Sc. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 20 Jun 2023, Jason Gunthorpe wrote:
> On Tue, Jun 20, 2023 at 12:54:25PM -0700, Hugh Dickins wrote:
> > On Tue, 20 Jun 2023, Jason Gunthorpe wrote:
> > > On Tue, Jun 20, 2023 at 12:47:54AM -0700, Hugh Dickins wrote:
> > > > Add powerpc-specific pte_free_defer(), to call pte_free() via call_rcu().
> > > > pte_free_defer() will be called inside khugepaged's retract_page_tables()
> > > > loop, where allocating extra memory cannot be relied upon.  This precedes
> > > > the generic version to avoid build breakage from incompatible pgtable_t.
> > > > 
> > > > This is awkward because the struct page contains only one rcu_head, but
> > > > that page may be shared between PTE_FRAG_NR pagetables, each wanting to
> > > > use the rcu_head at the same time: account concurrent deferrals with a
> > > > heightened refcount, only the first making use of the rcu_head, but
> > > > re-deferring if more deferrals arrived during its grace period.
> > > 
> > > You didn't answer my question why we can't just move the rcu to the
> > > actual free page?
> > 
> > I thought that I had answered it, perhaps not to your satisfaction:
> > 
> > https://lore.kernel.org/linux-mm/9130acb-193-6fdd-f8df-75766e663978@google.com/
> > 
> > My conclusion then was:
> > Not very good reasons: good enough, or can you supply a better patch?
> 
> Oh, I guess I didn't read that email as answering the question..
> 
> I was saying to make pte_fragment_free() unconditionally do the
> RCU. It is the only thing that uses the page->rcu_head, and it means
> PPC would double RCU the final free on the TLB path, but that is
> probably OK for now. This means pte_free_defer() won't do anything
> special on PPC as PPC will always RCU free these things, this address
> the defer concern too, I think. Overall it is easier to reason about.
> 
> I looked at fixing the TLB stuff to avoid the double rcu but quickly
> got scared that ppc was using a kmem_cache to allocate other page
> table sizes so there is not a reliable struct page to get a rcu_head
> from. This looks like the main challenge for ppc... We'd have to teach
> the tlb code to not do its own RCU stuff for table levels that the
> arch is already RCU freeing - and that won't get us to full RCU
> freeing on PPC.

Sorry for being so dense all along: yes, your way is unquestionably
much better than mine.  I guess I must have been obsessive about
keeping pte_free_defer()+pte_free_now() "on the outside", as they
were on x86, and never perceived how much easier it is with a small
tweak inside pte_fragment_free(); and never reconsidered it since.

But I'm not so keen on the double-RCU, extending this call_rcu() to
all the normal cases, while still leaving the TLB batching in place:
here is the replacement patch I'd prefer us to go forward with now.

Many thanks!

[PATCH v3 05/12] powerpc: add pte_free_defer() for pgtables sharing page

Add powerpc-specific pte_free_defer(), to free table page via call_rcu().
pte_free_defer() will be called inside khugepaged's retract_page_tables()
loop, where allocating extra memory cannot be relied upon.  This precedes
the generic version to avoid build breakage from incompatible pgtable_t.

This is awkward because the struct page contains only one rcu_head, but
that page may be shared between PTE_FRAG_NR pagetables, each wanting to
use the rcu_head at the same time.  But powerpc never reuses a fragment
once it has been freed: so mark the page Active in pte_free_defer(),
before calling pte_fragment_free() directly; and there call_rcu() to
pte_free_now() when last fragment is freed and the page is PageActive.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/powerpc/include/asm/pgalloc.h |  4 ++++
 arch/powerpc/mm/pgtable-frag.c     | 29 ++++++++++++++++++++++++++---
 2 files changed, 30 insertions(+), 3 deletions(-)

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
index 20652daa1d7e..0c6b68130025 100644
--- a/arch/powerpc/mm/pgtable-frag.c
+++ b/arch/powerpc/mm/pgtable-frag.c
@@ -106,6 +106,15 @@ pte_t *pte_fragment_alloc(struct mm_struct *mm, int kernel)
 	return __alloc_for_ptecache(mm, kernel);
 }
 
+static void pte_free_now(struct rcu_head *head)
+{
+	struct page *page;
+
+	page = container_of(head, struct page, rcu_head);
+	pgtable_pte_page_dtor(page);
+	__free_page(page);
+}
+
 void pte_fragment_free(unsigned long *table, int kernel)
 {
 	struct page *page = virt_to_page(table);
@@ -115,8 +124,22 @@ void pte_fragment_free(unsigned long *table, int kernel)
 
 	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
 	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
-		if (!kernel)
-			pgtable_pte_page_dtor(page);
-		__free_page(page);
+		if (kernel)
+			__free_page(page);
+		else if (TestClearPageActive(page))
+			call_rcu(&page->rcu_head, pte_free_now);
+		else
+			pte_free_now(&page->rcu_head);
 	}
 }
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
+{
+	struct page *page;
+
+	page = virt_to_page(pgtable);
+	SetPageActive(page);
+	pte_fragment_free((unsigned long *)pgtable, 0);
+}
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
-- 
2.35.3

