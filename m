Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C178D743EE3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 17:30:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=OrFdTzSQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QszlV58B2z3bvy
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jul 2023 01:29:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=OrFdTzSQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qszkd34mJz309q
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jul 2023 01:29:12 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-be30cbe88b3so1934807276.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 08:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688138947; x=1690730947;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AjAYnVeboGLbIm0tKT9e16Vsq7Oo9WWm/R7Yf2CYkqU=;
        b=OrFdTzSQQkVcKVrUqqdFxWYPfui4NZ+US05WE6v2rnqFm6OACvYRXXvuvVVn9/WgtH
         IO25JQBx/7LBuF94N8uGWuA7lOqK/g2aZp1o+jdYwvLq2sHeGN6e7HBrH9hoQ4jtcPqs
         90eQkQW0JM+WPNUbFUyKu7cCa3Sn5U5Jf2hFgFgK4apj0UpwkpB4OeYiFgRXknc7EB6e
         QGvEjMl6zgdHa4GtApbCh6wEU0EpLaffyB3TGQ3swbjHsGW/3I5351vpgsD4dqv93K97
         b7yuMuqA/UWI4+PDCNp0ztgzGA9UcYiCsSREvoSv8SCHEvA6U71YyFDKLcORLE5cGOxV
         8bcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688138947; x=1690730947;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AjAYnVeboGLbIm0tKT9e16Vsq7Oo9WWm/R7Yf2CYkqU=;
        b=hRq+zxe0UHvOVF6tM9cJWEDKoGCN4vUqkjeNh5H1r3EfulFlDkLWk3Dav2tNet66NP
         0eprDtMD30oUO+c3cw+U/o/I/X9MLI9+xbSA9789OAyv4sqLojCPr3wWqVrPAH1chYWD
         0N+ZihpzY94AHEOrNxSwIoYJ0RR8SUjQXS82sM09u3kdbrlRRLtCg8rCtHPHQFsCz2BE
         7RS5PaQQA5iiSj48VVRPBDSPA/VA0qDcNzG/lmNxQpkxiCVhpcmANAx6iDusTeG8A7ww
         XD0RctPxEu8EdRoWSnlA2ziTksvMJrNgGMCm6EdthaIwpOU2uH52gk0CGTO7+6YrTbcS
         V5gw==
X-Gm-Message-State: ABy/qLa96KC7VlS7ZFE49YkSqm126gITv7XhilStO4rUd8pZHb+QdXcJ
	ZKmv0pffiILhcwdh1rwUAGqUyw==
X-Google-Smtp-Source: APBJJlF5EFV8fGkahr4C63tlYCJc9C/Ov9as/Fr8WIXMxA7p0Zq+iobFwmSBQKWq4vNdROS9uHFFYw==
X-Received: by 2002:a25:d303:0:b0:ba8:9512:fbc9 with SMTP id e3-20020a25d303000000b00ba89512fbc9mr2919284ybf.11.1688138946703;
        Fri, 30 Jun 2023 08:29:06 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 144-20020a250496000000b00c3da591adbcsm635911ybe.31.2023.06.30.08.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 08:29:06 -0700 (PDT)
Date: Fri, 30 Jun 2023 08:28:54 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables sharing
 page
In-Reply-To: <20230630153852.31163592@p-imbrenda>
Message-ID: <062b19-4cf1-261-a9bf-9cefd32382fc@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com> <a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com> <20230630153852.31163592@p-imbrenda>
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
> On Tue, 20 Jun 2023 00:51:19 -0700 (PDT)
> Hugh Dickins <hughd@google.com> wrote:
> 
> [...]
> 
> > +void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
> > +{
> > +	unsigned int bit, mask;
> > +	struct page *page;
> > +
> > +	page = virt_to_page(pgtable);
> > +	if (mm_alloc_pgste(mm)) {
> > +		call_rcu(&page->rcu_head, pte_free_pgste);
> 
> so is this now going to be used to free page tables
> instead of page_table_free_rcu?

No.

All pte_free_defer() is being used for (in this series; and any future
use beyond this series will have to undertake its own evaluations) is
for the case of removing an empty page table, which used to map a group
of PTE mappings of a file, in order to make way for one PMD mapping of
the huge page which those scattered pages have now been gathered into.

You're worried by that mm_alloc_pgste() block: it's something I didn't
have at all in my first draft, then I thought that perhaps the pgste
case might be able to come this way, so it seemed stupid to leave out
the handling for it.

I hope that you're implying that should be dead code here?  Perhaps,
that the pgste case corresponds to the case in s390 where THPs are
absolutely forbidden?  That would be good news for us.

Gerald, in his version of this block, added a comment asking:
	/*
	 * TODO: Do we need gmap_unlink(mm, pgtable, addr), like in
	 * page_table_free_rcu()?
	 * If yes -> need addr parameter here, like in pte_free_tlb().
	 */
Do you have the answer to that?  Neither of us could work it out.

> 
> or will it be used instead of page_table_free?

Not always; but yes, this case of removing a page table used
page_table_free() before; but now, with the lighter locking, needs
to keep the page table valid until the RCU grace period expires.

> 
> this is actually quite important for KVM on s390

None of us are wanting to break KVM on s390: your guidance appreciated!

Thanks,
Hugh
