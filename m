Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 249FA749309
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 03:21:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=7Bh1w9bv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxJdW6pw1z30hb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 11:21:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=7Bh1w9bv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxJcb2nhBz2yjj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 11:20:30 +1000 (AEST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-57023c9be80so2511157b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 18:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688606427; x=1691198427;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DVKXUnBeMcqK49/nrtTiG3IeuKAx0rEhe8CM4pJyUnI=;
        b=7Bh1w9bvNuQkpD7NMkm4JbcxgWotIzIJFdwu20zUYzvh4i0HSaHcTWouAJUKZ6LDRo
         1yYWWiQFOP4X87yckWv5hBLnixczpqyq5Rmv6nPpqa3DfxYDNVgiQPOFHFK+epG9dl87
         r2AoAVbEkLX12o2CEiZ1sHPhaP/1rUokKhrZzNLHzJnrSWhHtXBF1CRj1O6sxlq9xyS2
         t60FsToEfKrKxFB85mG/al7XfzAj1lnIP+XExanpyiyOQSd1fpc+RF7Ip7pnEm5S+JE8
         WSmkySoCW5Kjr0J4BDBo1WQ9Rwxd1pllRbLcrueaE+bdWsQ9vyc/RkXtiT15X0m+KCF5
         VCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688606427; x=1691198427;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DVKXUnBeMcqK49/nrtTiG3IeuKAx0rEhe8CM4pJyUnI=;
        b=Wi1kXPsrq8nfjuGzc1KViRxABWVfYOHTLQqo+3ky17fcyBOgWnfPgCWvPQE9lVX2bJ
         EeyUoyzRswx5wX7YrRjxwY4c7NDLy3UWWOWwMxiWcxPkfUyPvi7fotRoeJ2yltbOFMWD
         6/7Wc6cUxMNXZ6ccxDhlLSrukA4ZZ6jX7dfK7G5gfLY083KqrPjQqDNH63gyqlVusA4b
         At2L2BQOWtvlX2MGUgLqrQAmPYvVbpCRqvtqU/1PKi75r/S01jftRSJd8fHHjlyeddID
         nAV49QVH227BONrg99dpeE2T85QuhDJQvPD1nINZqT7HmJZ5grjKpvn1IdjxOQUXdRM2
         8Hmw==
X-Gm-Message-State: ABy/qLbGxKpDb8mvOlNn9Xdz7GncmPnCqMjHAZr7ZHpaSgeo5V/1XfQ1
	DNo/uCH6y6QMjSJ3es664LEhiQ==
X-Google-Smtp-Source: APBJJlF7f4icY2GopzJgvwnxS7Zke9XhfxuA2+QBrcyRfbIWhpojCp18qPmjlZgL6ZU1o7A2BO4zfQ==
X-Received: by 2002:a81:83c8:0:b0:56c:e2db:8d07 with SMTP id t191-20020a8183c8000000b0056ce2db8d07mr618942ywf.33.1688606426760;
        Wed, 05 Jul 2023 18:20:26 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id w199-20020a0dd4d0000000b00579e8c7e478sm39380ywd.43.2023.07.05.18.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 18:20:26 -0700 (PDT)
Date: Wed, 5 Jul 2023 18:20:21 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables sharing
 page
In-Reply-To: <20230705145516.7d9d554d@thinkpad-T15>
Message-ID: <1014735-ecc4-b4bc-3ae7-48a4328ed149@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com> <a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com> <20230628211624.531cdc58@thinkpad-T15> <cd7c2851-1440-7220-6c53-16b343b1474@google.com> <ZJ2hsM5Tn+yUZ5ZV@ziepe.ca> <20230629175645.7654d0a8@thinkpad-T15>
 <edaa96f-80c1-1252-acbb-71c4f045b035@google.com> <7bef5695-fa4a-7215-7e9d-d4a83161c7ab@google.com> <20230704171905.1263478f@thinkpad-T15> <e678affb-5eee-a055-7af1-1d29a965663b@google.com> <20230705145516.7d9d554d@thinkpad-T15>
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

On Wed, 5 Jul 2023, Gerald Schaefer wrote:
> On Tue, 4 Jul 2023 10:03:57 -0700 (PDT)
> Hugh Dickins <hughd@google.com> wrote:
> > On Tue, 4 Jul 2023, Gerald Schaefer wrote:
> > > On Sat, 1 Jul 2023 21:32:38 -0700 (PDT)
> > > Hugh Dickins <hughd@google.com> wrote:  
> > > > On Thu, 29 Jun 2023, Hugh Dickins wrote:  
> > ...
> > > > --- a/arch/s390/mm/pgalloc.c
> > > > +++ b/arch/s390/mm/pgalloc.c
> > > > @@ -229,6 +229,15 @@ void page_table_free_pgste(struct page *page)
> > > >   * logic described above. Both AA bits are set to 1 to denote a 4KB-pgtable
> > > >   * while the PP bits are never used, nor such a page is added to or removed
> > > >   * from mm_context_t::pgtable_list.
> > > > + *
> > > > + * pte_free_defer() overrides those rules: it takes the page off pgtable_list,
> > > > + * and prevents both 2K fragments from being reused. pte_free_defer() has to
> > > > + * guarantee that its pgtable cannot be reused before the RCU grace period
> > > > + * has elapsed (which page_table_free_rcu() does not actually guarantee).  
> > > 
> > > Hmm, I think page_table_free_rcu() has to guarantee the same, i.e. not
> > > allow reuse before grace period elapsed. And I hope that it does so, by
> > > setting the PP bits, which would be noticed in page_table_alloc(), in
> > > case the page would be seen there.
> > > 
> > > Unlike pte_free_defer(), page_table_free_rcu() would add pages back to the
> > > end of the list, and so they could be seen in page_table_alloc(), but they
> > > should not be reused before grace period elapsed and __tlb_remove_table()
> > > cleared the PP bits, as far as I understand.
> > > 
> > > So what exactly do you mean with "which page_table_free_rcu() does not actually
> > > guarantee"?  
> > 
> > I'll answer without locating and re-reading what Jason explained earlier,
> > perhaps in a separate thread, about pseudo-RCU-ness in tlb_remove_table():
> > he may have explained it better.  And without working out again all the
> > MMU_GATHER #defines, and which of them do and do not apply to s390 here.
> > 
> > The detail that sticks in my mind is the fallback in tlb_remove_table()
> 
> Ah ok, I was aware of that "semi-RCU" fallback logic in tlb_remove_table(),
> but that is rather a generic issue, and not s390-specific.

Yes.

> I thought you
> meant some s390-oddity here, of which we have a lot, unfortunately...
> Of course, we call tlb_remove_table() from our page_table_free_rcu(), so
> I guess you could say that page_table_free_rcu() cannot guarantee what
> tlb_remove_table() cannot guarantee.
> 
> Maybe change to "which page_table_free_rcu() does not actually guarantee,
> by calling tlb_remove_table()", to make it clear that this is not a problem
> of page_table_free_rcu() itself.

Okay - I'll rephrase slightly to avoid being sued by s390's lawyers :-)

> 
> > in mm/mmu_gather.c: if its __get_free_page(GFP_NOWAIT) fails, it cannot
> > batch the tables for freeing by RCU, and resorts instead to an immediate 
> > TLB flush (I think: that again involves chasing definitions) followed by
> > tlb_remove_table_sync_one() - which just delivers an interrupt to each CPU,
> > and is commented: 
> > /*
> >  * This isn't an RCU grace period and hence the page-tables cannot be
> >  * assumed to be actually RCU-freed.
> >  *
> >  * It is however sufficient for software page-table walkers that rely on
> >  * IRQ disabling.
> >  */
> > 
> > Whether that's good for your PP pages or not, I've given no thought:
> > I've just taken it on trust that what s390 has working today is good.
> 
> Yes, we should be fine with that, current code can be trusted :-)

Glad to hear it :-)  Yes, I think it's not actually relying on the "rcu"
implied by the function name.

> 
> > 
> > If that __get_free_page(GFP_NOWAIT) fallback instead used call_rcu(),
> > then I would not have written "(which page_table_free_rcu() does not
> > actually guarantee)".  But it cannot use call_rcu() because it does
> > not have an rcu_head to work with - it's in some generic code, and
> > there is no MMU_GATHER_CAN_USE_PAGE_RCU_HEAD for architectures to set.
> > 
> > And Jason would have much preferred us to address the issue from that
> > angle; but not only would doing so destroy my sanity, I'd also destroy
> > 20 architectures TLB-flushing, unbuilt and untested, in the attempt.
> 
> Oh yes, if your changes would have allowed to get rid of that "semi RCU"
> logic, that would really be a major boost in popularity, I guess. But
> it probably is as it is, because it is not so easily fixed...

I'm hoping that this series might help stir someone else to get into that.

> 
> > 
> > ...
> > > > @@ -325,10 +346,17 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
> > > >  		 */
> > > >  		mask = atomic_xor_bits(&page->_refcount, 0x11U << (bit + 24));
> > > >  		mask >>= 24;
> > > > -		if (mask & 0x03U)
> > > > +		if ((mask & 0x03U) && !PageActive(page)) {
> > > > +			/*
> > > > +			 * Other half is allocated, and neither half has had
> > > > +			 * its free deferred: add page to head of list, to make
> > > > +			 * this freed half available for immediate reuse.
> > > > +			 */
> > > >  			list_add(&page->lru, &mm->context.pgtable_list);
> > > > -		else
> > > > -			list_del(&page->lru);
> > > > +		} else {
> > > > +			/* If page is on list, now remove it. */
> > > > +			list_del_init(&page->lru);
> > > > +		}  
> > > 
> > > Ok, we might end up with some unnecessary list_del_init() here, e.g. if
> > > other half is still allocated, when called from pte_free_defer() on a
> > > fully allocated page, which was not on the list (and with PageActive, and
> > > (mask & 0x03U) true).
> > > Not sure if adding an additional mask check to the else path would be
> > > needed, but it seems that list_del_init() should also be able to handle
> > > this.  
> > 
> > list_del_init() is very cheap in the unnecessary case: the cachelines
> > required are already there.  You don't want a flag to say whether to
> > call it or not, it is already the efficient approach.
> 
> Yes, I also see no functional issue here. Just thought that the extra
> write could be avoided, e.g. by checking for list_empty() or mask first.
> But I guess that is simply the benefit of list_del_init(), that you
> don't have to check, at least if it is guaranteed that rcu_head is
> never in use here.
> 
> Then maybe adjust the comment, because now it makes you wonder, when
> you read (and understand) the code, you see that this list_del_init()
> might also be called for pages not on the list.

Sorry, I don't understand what clarification you're asking for there.
I thought
			/* If page is on list, now remove it. */
			list_del_init(&page->lru);
was good enough comment.

(I certainly don't want to enumerate the cases when it is or is not
already on the list there, that would be misery; but I don't think
that's the adjustment you were asking for either.)

> 
> > 
> > (But you were right not to use it in your pt_frag_refcount version,
> > because there we were still trying to do the call_rcu() per fragment
> > rather than per page, so page->lru could have been on the RCU queue.)
> 
> That is actually the one thing I still try to figure out, by drawing
> pictures, i.e. if we really really never end up here on list_del_init(),
> while using rcu_head, e.g. by racing PageActive.

There is no race with PageActive being seen when the table page is
finally to be freed (by RCU or not).  But there is definitely a harmless
race with pte_free_defer()er of other half setting PageActive an instant
after page_table_free() checked PageActive here.  So maybe this
page_table_free() does a list_add(), which the racer then list_del_init()s
when it gets the mm->context.lock; or maybe they both list_del_init().

> 
> > 
> > > 
> > > Same thought applies to the similar logic in page_table_free_rcu()
> > > below.
> > >   
> > > >  		spin_unlock_bh(&mm->context.lock);
> > > >  		mask = atomic_xor_bits(&page->_refcount, 0x10U << (bit + 24));
> > > >  		mask >>= 24;
> > > > @@ -342,8 +370,10 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
> > > >  	}
> > > >  
> > > >  	page_table_release_check(page, table, half, mask);
> > > > -	pgtable_pte_page_dtor(page);
> > > > -	__free_page(page);
> > > > +	if (TestClearPageActive(page))
> > > > +		call_rcu(&page->rcu_head, pte_free_now);
> > > > +	else
> > > > +		pte_free_now(&page->rcu_head);  
> > > 
> > > This ClearPageActive, and the similar thing in __tlb_remove_table() below,
> > > worries me a bit, because it is done outside the spin_lock. It "feels" like
> > > there could be some race with the PageActive checks inside the spin_lock,
> > > but when drawing some pictures, I could not find any such scenario yet.
> > > Also, our existing spin_lock is probably not supposed to protect against
> > > PageActive changes anyway, right?  
> > 
> > Here (and similarly in __tlb_remove_table()) is where we are about to free
> > the page table page: both of the fragments have already been released,
> > there is nobody left who could be racing against us to set PageActive.
> 
> Yes, that is what makes this approach so nice, i.e. no more checking
> for HH bits or worry about double call_rcu(), simply do the the freeing
> whenever the page is ready. At least in theory, still drawing pictures :-)

Please do keep drawing: and perhaps you can sell them afterwards :-)

> 
> But this really looks very good to me, and also works with LTP not worse
> than the other approaches.

Great, thanks for all your help Gerald.

Hugh
