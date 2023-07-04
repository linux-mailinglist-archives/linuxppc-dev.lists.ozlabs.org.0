Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3741B74776C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 19:04:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=In/HPs//;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwTg90nPTz3bw9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 03:04:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=In/HPs//;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwTfH1F5lz30MD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 03:04:05 +1000 (AEST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5703d12ab9aso70830397b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jul 2023 10:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688490242; x=1691082242;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o5CkhYNN16WNUQJu71BeSwdzRNxPgL/gs2UX0urk5eQ=;
        b=In/HPs//bUn+2tgW3AmtAl5dxW/ADGV2YA56prULm3E/vdfno08a8tljcsPueGrFwv
         jqarDMxpAnYo9aMI5Mb54mMD0rJ8CZohyLEima6tkL05J+cSnzXMAc1rCu3B7NnhNLQl
         ZvVWe49F0YiOX95QlRJtsrnvcRJ4qDr/z3uf8RXLQDyMLLM3K+NeYbv+E3W8yR9z4V2c
         WTkreLz7srWoSO6EVx02fhhtx9sRWBvRmIBi/UDAvsanUA+rvGltjBmFivqq6iRGLfxg
         0Is7JP64PK57hxtBi5rB3DxXAUc/nlIHjgsphR/2KftHY0traJeP5nIjkP89b4sp+32J
         RUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688490242; x=1691082242;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o5CkhYNN16WNUQJu71BeSwdzRNxPgL/gs2UX0urk5eQ=;
        b=VU/m8d9SdzYlCdvWiRxWtnSUDoprDByCN2Zu7LiBRo1LLSIfobKZGfGt25VE7HQn1Z
         s0Tago6QjxlmC8jsTusuqoxaWdNAS5kinagcmNCYP8RwW6Y0tPHj3JQGLy8luQUsZntb
         uAk6JcgBFr4wAHxncjgyQM53IbCwBWqy6PgbYrCXNNUn0MbxCaypHV36nI8qy4O7yzh0
         O49f7899OBostzSWmY70knLO1X5/XIV2/AnI7AWqhYxcEUe0P/rncMVE8Aayy42NKDQs
         wsAYqQxMt/M00N7FVamLZ/tV/4jllTrr9KLMOakL1KBkh7x+vspAfiv4staIYsISrRxT
         ea/w==
X-Gm-Message-State: ABy/qLZUc58V5AfrxgAqPagMZQ9JzC15sma6Xk4HCMnAt9mYm8CQ4/qV
	DTkyB4DXEUvbQkLSQLOiCoBFmA==
X-Google-Smtp-Source: APBJJlEujSIy21mB6q57p7XiiokfNCFL+rCQls/CklTtga65bPCnY5wMW8YqJmU/LAIKTHdSHjCBvg==
X-Received: by 2002:a0d:dd02:0:b0:55a:3ce9:dc3d with SMTP id g2-20020a0ddd02000000b0055a3ce9dc3dmr13990263ywe.13.1688490242129;
        Tue, 04 Jul 2023 10:04:02 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id n20-20020a819c54000000b00577632aa85esm2323151ywa.3.2023.07.04.10.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 10:04:01 -0700 (PDT)
Date: Tue, 4 Jul 2023 10:03:57 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables sharing
 page
In-Reply-To: <20230704171905.1263478f@thinkpad-T15>
Message-ID: <e678affb-5eee-a055-7af1-1d29a965663b@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com> <a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com> <20230628211624.531cdc58@thinkpad-T15> <cd7c2851-1440-7220-6c53-16b343b1474@google.com> <ZJ2hsM5Tn+yUZ5ZV@ziepe.ca> <20230629175645.7654d0a8@thinkpad-T15>
 <edaa96f-80c1-1252-acbb-71c4f045b035@google.com> <7bef5695-fa4a-7215-7e9d-d4a83161c7ab@google.com> <20230704171905.1263478f@thinkpad-T15>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, P
 asha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 Jul 2023, Gerald Schaefer wrote:
> On Sat, 1 Jul 2023 21:32:38 -0700 (PDT)
> Hugh Dickins <hughd@google.com> wrote:
> > On Thu, 29 Jun 2023, Hugh Dickins wrote:
> > > 
> > > I've grown to dislike the (ab)use of pt_frag_refcount even more, to the
> > > extent that I've not even tried to verify it; but I think I do get the
> > > point now, that we need further info than just PPHHAA to know whether
> > > the page is on the list or not.  But I think that if we move where the
> > > call_rcu() is done, then the page can stay on or off the list by same
> > > rules as before (but need to check HH bits along with PP when deciding
> > > whether to allocate, and whether to list_add_tail() when freeing).  
> > 
> > No, not quite the same rules as before: I came to realize that using
> > list_add_tail() for the HH pages would be liable to put a page on the
> > list which forever blocked reuse of PP list_add_tail() pages after it
> > (could be solved by a list_move() somewhere, but we have agreed to
> > prefer simplicity).
> > 
> > I've dropped the HH bits, I'm using PageActive like we did on powerpc,
> > I've dropped most of the pte_free_*() helpers, and list_del_init() is
> > an easier way of dealing with those "is it on the list" questions.
> > I expect that we shall be close to reaching agreement on...
> 
> This looks really nice, almost too good and easy to be true. I did not
> find any obvious flaw, just some comments below. It also survived LTP
> without any visible havoc, so I guess this approach is the best so far.

Phew! I'm of course glad to hear this: thanks for your efforts on it.

...
> > --- a/arch/s390/mm/pgalloc.c
> > +++ b/arch/s390/mm/pgalloc.c
> > @@ -229,6 +229,15 @@ void page_table_free_pgste(struct page *page)
> >   * logic described above. Both AA bits are set to 1 to denote a 4KB-pgtable
> >   * while the PP bits are never used, nor such a page is added to or removed
> >   * from mm_context_t::pgtable_list.
> > + *
> > + * pte_free_defer() overrides those rules: it takes the page off pgtable_list,
> > + * and prevents both 2K fragments from being reused. pte_free_defer() has to
> > + * guarantee that its pgtable cannot be reused before the RCU grace period
> > + * has elapsed (which page_table_free_rcu() does not actually guarantee).
> 
> Hmm, I think page_table_free_rcu() has to guarantee the same, i.e. not
> allow reuse before grace period elapsed. And I hope that it does so, by
> setting the PP bits, which would be noticed in page_table_alloc(), in
> case the page would be seen there.
> 
> Unlike pte_free_defer(), page_table_free_rcu() would add pages back to the
> end of the list, and so they could be seen in page_table_alloc(), but they
> should not be reused before grace period elapsed and __tlb_remove_table()
> cleared the PP bits, as far as I understand.
> 
> So what exactly do you mean with "which page_table_free_rcu() does not actually
> guarantee"?

I'll answer without locating and re-reading what Jason explained earlier,
perhaps in a separate thread, about pseudo-RCU-ness in tlb_remove_table():
he may have explained it better.  And without working out again all the
MMU_GATHER #defines, and which of them do and do not apply to s390 here.

The detail that sticks in my mind is the fallback in tlb_remove_table()
in mm/mmu_gather.c: if its __get_free_page(GFP_NOWAIT) fails, it cannot
batch the tables for freeing by RCU, and resorts instead to an immediate 
TLB flush (I think: that again involves chasing definitions) followed by
tlb_remove_table_sync_one() - which just delivers an interrupt to each CPU,
and is commented: 
/*
 * This isn't an RCU grace period and hence the page-tables cannot be
 * assumed to be actually RCU-freed.
 *
 * It is however sufficient for software page-table walkers that rely on
 * IRQ disabling.
 */

Whether that's good for your PP pages or not, I've given no thought:
I've just taken it on trust that what s390 has working today is good.

If that __get_free_page(GFP_NOWAIT) fallback instead used call_rcu(),
then I would not have written "(which page_table_free_rcu() does not
actually guarantee)".  But it cannot use call_rcu() because it does
not have an rcu_head to work with - it's in some generic code, and
there is no MMU_GATHER_CAN_USE_PAGE_RCU_HEAD for architectures to set.

And Jason would have much preferred us to address the issue from that
angle; but not only would doing so destroy my sanity, I'd also destroy
20 architectures TLB-flushing, unbuilt and untested, in the attempt.

...
> > @@ -325,10 +346,17 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
> >  		 */
> >  		mask = atomic_xor_bits(&page->_refcount, 0x11U << (bit + 24));
> >  		mask >>= 24;
> > -		if (mask & 0x03U)
> > +		if ((mask & 0x03U) && !PageActive(page)) {
> > +			/*
> > +			 * Other half is allocated, and neither half has had
> > +			 * its free deferred: add page to head of list, to make
> > +			 * this freed half available for immediate reuse.
> > +			 */
> >  			list_add(&page->lru, &mm->context.pgtable_list);
> > -		else
> > -			list_del(&page->lru);
> > +		} else {
> > +			/* If page is on list, now remove it. */
> > +			list_del_init(&page->lru);
> > +		}
> 
> Ok, we might end up with some unnecessary list_del_init() here, e.g. if
> other half is still allocated, when called from pte_free_defer() on a
> fully allocated page, which was not on the list (and with PageActive, and
> (mask & 0x03U) true).
> Not sure if adding an additional mask check to the else path would be
> needed, but it seems that list_del_init() should also be able to handle
> this.

list_del_init() is very cheap in the unnecessary case: the cachelines
required are already there.  You don't want a flag to say whether to
call it or not, it is already the efficient approach.

(But you were right not to use it in your pt_frag_refcount version,
because there we were still trying to do the call_rcu() per fragment
rather than per page, so page->lru could have been on the RCU queue.)

> 
> Same thought applies to the similar logic in page_table_free_rcu()
> below.
> 
> >  		spin_unlock_bh(&mm->context.lock);
> >  		mask = atomic_xor_bits(&page->_refcount, 0x10U << (bit + 24));
> >  		mask >>= 24;
> > @@ -342,8 +370,10 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
> >  	}
> >  
> >  	page_table_release_check(page, table, half, mask);
> > -	pgtable_pte_page_dtor(page);
> > -	__free_page(page);
> > +	if (TestClearPageActive(page))
> > +		call_rcu(&page->rcu_head, pte_free_now);
> > +	else
> > +		pte_free_now(&page->rcu_head);
> 
> This ClearPageActive, and the similar thing in __tlb_remove_table() below,
> worries me a bit, because it is done outside the spin_lock. It "feels" like
> there could be some race with the PageActive checks inside the spin_lock,
> but when drawing some pictures, I could not find any such scenario yet.
> Also, our existing spin_lock is probably not supposed to protect against
> PageActive changes anyway, right?

Here (and similarly in __tlb_remove_table()) is where we are about to free
the page table page: both of the fragments have already been released,
there is nobody left who could be racing against us to set PageActive.

I chose PageActive for its name, not for any special behaviour of that
flag: nothing else could be setting or clearing it while we own the page.

Hugh
