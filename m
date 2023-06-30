Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 352287442B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 21:23:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=qrvgu39+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qt4xL120Qz3c1J
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jul 2023 05:23:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=qrvgu39+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qt4wQ0Kb2z30fw
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jul 2023 05:23:00 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-c15a5ed884dso2178039276.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 12:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688152975; x=1690744975;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UpA/3MkDA4Bbb6eJ6xeemnz64HxyzKE7wrEAQ570pfY=;
        b=qrvgu39+Pjzc0ty+cMKIrH7Eni71vn8ej746goZG1tt82sCTsmWg6sBEtMY5CYHkvc
         xclnmytvO77Jk7WZZk/il6ovWRv1QJV2T5YBR38m1fpA60DTf2h7Xd6BRbHgj9AvET1p
         tRCXjgGhJ6lxaDD/J1iU2O9lhqpC8W/NCc+eL3bbCVdX54HfuY4wUAcwYj6APMOTcz4G
         f66Hj1VDT8JxouLBXxbgSCkSfpv2cMeVkvsNVflvvYlmarJ0nMeAwtFB3YcpKUnimWJd
         M0kxVMaVqi4PmA2kSbzsqFbGlI4UBRtOwklt4JjwKtiq8VRHxGS9MYdDm87KrkMzPwwX
         AxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688152975; x=1690744975;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UpA/3MkDA4Bbb6eJ6xeemnz64HxyzKE7wrEAQ570pfY=;
        b=ZApULzGu8W6wLK6mlIQrTZ2euagji6e1T2r99UzufowhPVwsS9GIa8oF9l9KID8VA4
         B3WrRsfNQhn1/MBAjbCf+8KPL5gGa2nmoYHTQPl2ysOp9c5mRfeB8WJIkNjDSKhKgwUv
         kPsR+YuqAJga/N6nWkIUuKmvDRLioPl0q+dQh8bMnC4g1Hxtfb9+pzZM/oI6t4I3pVSs
         /46GgMz28LTy7eUcW5pLNGmSZd3tBYoJOHjfuuUo9HKueH2ph4UgA/RgYbNB+DfI2p1h
         7dmLjxcBPVTPoLbnZ4UngDPDTldnlPjvkzeEeqFJ/XAY5y6+Z1uwjgBoABoPXcyKKEoD
         oYsQ==
X-Gm-Message-State: ABy/qLYN6XzGkacvOcfyexS2UhlD8dlPQSRxl8VnASjb8SvbCmKMyLnD
	WUtjbt+UF4EOj4ZOGKFmLPr98A==
X-Google-Smtp-Source: APBJJlEeRudcWa5iit7A1oAKHz4BndX5rtVzOZ4hnmAKD3Z6cXWQLvZ24j/5LxRaPlyEpIMC7jurbQ==
X-Received: by 2002:a25:ce04:0:b0:c22:82b1:17ee with SMTP id x4-20020a25ce04000000b00c2282b117eemr3233485ybe.63.1688152975093;
        Fri, 30 Jun 2023 12:22:55 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id t4-20020a259ac4000000b00bb144da7d68sm2968477ybo.13.2023.06.30.12.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 12:22:54 -0700 (PDT)
Date: Fri, 30 Jun 2023 12:22:43 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables sharing
 page
In-Reply-To: <20230630182556.7727ef50@p-imbrenda>
Message-ID: <7f6d399b-c47-1faa-f7f6-9932b9811f8c@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com> <a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com> <20230630153852.31163592@p-imbrenda> <062b19-4cf1-261-a9bf-9cefd32382fc@google.com> <20230630182556.7727ef50@p-imbrenda>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.c
 om>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 30 Jun 2023, Claudio Imbrenda wrote:
> On Fri, 30 Jun 2023 08:28:54 -0700 (PDT)
> Hugh Dickins <hughd@google.com> wrote:
> > On Fri, 30 Jun 2023, Claudio Imbrenda wrote:
> > > On Tue, 20 Jun 2023 00:51:19 -0700 (PDT)
> > > Hugh Dickins <hughd@google.com> wrote:
> > > 
> > > [...]
> > >   
> > > > +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
> > > > +{
> > > > +	unsigned int bit, mask;
> > > > +	struct page *page;
> > > > +
> > > > +	page = virt_to_page(pgtable);
> > > > +	if (mm_alloc_pgste(mm)) {
> > > > +		call_rcu(&page->rcu_head, pte_free_pgste);  
> > > 
> > > so is this now going to be used to free page tables
> > > instead of page_table_free_rcu?  
> > 
> > No.
> > 
> > All pte_free_defer() is being used for (in this series; and any future
> > use beyond this series will have to undertake its own evaluations) is
> > for the case of removing an empty page table, which used to map a group
> > of PTE mappings of a file, in order to make way for one PMD mapping of
> > the huge page which those scattered pages have now been gathered into.
> > 
> > You're worried by that mm_alloc_pgste() block: it's something I didn't
> 
> actually no, but thanks for bringing it up :D
> 
> > have at all in my first draft, then I thought that perhaps the pgste
> > case might be able to come this way, so it seemed stupid to leave out
> > the handling for it.
> > 
> > I hope that you're implying that should be dead code here?  Perhaps,
> > that the pgste case corresponds to the case in s390 where THPs are
> > absolutely forbidden?  That would be good news for us.
> > 
> > Gerald, in his version of this block, added a comment asking:
> > 	/*
> > 	 * TODO: Do we need gmap_unlink(mm, pgtable, addr), like in
> > 	 * page_table_free_rcu()?
> > 	 * If yes -> need addr parameter here, like in pte_free_tlb().
> > 	 */
> > Do you have the answer to that?  Neither of us could work it out.
> 
> this is the thing I'm worried about; removing a page table that was
> used to map a guest will leave dangling pointers in the gmap that will
> cause memory corruption (I actually ran into that problem myself for
> another patchseries).
> 
> gmap_unlink() is needed to clean up the pointers before they become
> dangling (and also potentially do some TLB purging as needed)

That's something I would have expected to be handled already via
mmu_notifiers, rather than buried inside the page table freeing.

If s390 is the only architecture to go that way, and could instead do
it via mmu_notifiers, then I think that will be more easily supported
in the long term.

But I'm writing from a position of very great ignorance: advising
KVM on s390 is many dimensions away from what I'm capable of.

> 
> the point here is: we need that only for page_table_free_rcu(); all
> other users of page_table_free() cannot act on guest page tables

I might be wrong, but I think that most users of page_table_free()
are merely freeing a page table which had to be allocated up front,
but was then found unnecessary (maybe a racing task already inserted
one): page tables which were never exposed to actual use.

> (because we don't allow THP for KVM guests). and that is why
> page_table_free() does not do gmap_unlink() currently.

But THP collapse does (or did before this series) use it to free a
page table which had been exposed to use.  The fact that s390 does
not allow THP for KVM guests makes page_table_free(), and this new
pte_free_defer(), safe for that; but it feels dangerously coincidental.

It's easy to imagine a future change being made, which would stumble
over this issue.  I have imagined that pte_free_defer() will be useful
in future, in the freeing of empty page tables: but s390 may pose a
problem there - though perhaps no more of a problem than additionally
needing to pass a virtual address down the stack.

> 
> > 
> > > 
> > > or will it be used instead of page_table_free?  
> > 
> > Not always; but yes, this case of removing a page table used
> > page_table_free() before; but now, with the lighter locking, needs
> > to keep the page table valid until the RCU grace period expires.
> 
> so if I understand correctly your code will, sometimes, under some
> circumstances, replace what page_table_free() does, but it will never
> replace page_table_free_rcu()?
> 
> because in that case there would be no issues 

Yes, thanks for confirming: we have no issue here at present, but may
do if use of pte_free_defer() is extended to other contexts in future.

Would it be appropriate to add a WARN_ON_ONCE around that
> > > > +	if (mm_alloc_pgste(mm)) {
in pte_free_defer()?

I ask that somewhat rhetorically: that block disappears in the later
version I was working on last night (and will return to shortly), in
which pte_free_defer() just sets a bit and calls page_table_free().

But I'd like to understand the possibilities better: does mm_alloc_pgste()
correspond 1:1 to KVM guest on s390, or does it cover several different
possibilities of which KVM guest is one, or am I just confused to be
thinking there's any relationship?

Thanks,
Hugh

> 
> > 
> > > 
> > > this is actually quite important for KVM on s390  
> > 
> > None of us are wanting to break KVM on s390: your guidance appreciated!
> > 
> > Thanks,
> > Hugh
