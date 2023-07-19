Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DE7758CDA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 07:05:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=bsfPCapy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5Nzq3VgYz3bx1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 15:05:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=bsfPCapy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5Nyw31QRz2yFC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 15:04:23 +1000 (AEST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5835388d632so16106877b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 22:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689743060; x=1692335060;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f4gbnMS0W6E9Awn5g41KlL6GZi3HN5/R/yFQL1nQXJg=;
        b=bsfPCapysjnAZODvh7VQx88fm7IvMM72XC0oEOupCXke50rzUpxBzJjYQpi6er51fb
         D4bBL8Bh1D+h6gJQCrL3ilyuQNC5vtgJJbqXXVdUX3wGIHEmUxC4mo1pR0Z+lwJSnYwK
         meVLK3418dgqsYosj9vCSuNEJNkdRzYHJy0dpVlfsGSOV8HIHO4e1UNyCrc3kkrhsuYl
         F7Nsl4WNKMNEHKdGgWak0LJ4fwxrpogQk/dx/JNial3Rw8ApbYcti+VqcZ3cqR3TmrjR
         HLyZAxKWibz4mBf1B911Dg5ToxkxCT+TuKgSTuRLqJQNqiyCWpJGUeH03fYVv65KsNEv
         GKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689743060; x=1692335060;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f4gbnMS0W6E9Awn5g41KlL6GZi3HN5/R/yFQL1nQXJg=;
        b=OdOvO4p7DX2dQkk97RilmmKqZjbaLY+8BrVK6D1p1k1WzlVkK+TeqIv8m2RR5CuDTS
         94e8TPTkCTz8d+7D+E+i+3uamkVP1UeFGvJoRNXCISpiFERWCYEOfjzr3s7eNbWVzlnU
         O9MyvhkQ0W9Gk+yI4WPt0b29zFbl7XwOucsVALzyTNqi8sz1Yp8elgr8JOGes20hwiwq
         TTUhHDiG9qDntoQsviYxe2YA2oeTceXrUlBTw3KxmmtTKP9HR8Um4zhCeKI0sXWSvBai
         B5f2hqR8yzcG3MGzF64atc5CsjgQvxyl3cckVSjLR8TmXWf8iSKyexg8mhtn73Z93jLa
         C9Mg==
X-Gm-Message-State: ABy/qLYYz9WVtTzWACJoYGC/NxFSI0AWtIqXjgtk5wFxhgFhWSL0pl9w
	L+0Mii5lkiTAGWLlUZ7Bvpuvkw==
X-Google-Smtp-Source: APBJJlFfOyYeGiVCuczZwoUNyN9JCPq13oUH5g6h02u0hokVq61z1GN7QWMboOKVDLBaFX+57WnbTA==
X-Received: by 2002:a81:a00d:0:b0:573:d3cd:3d2a with SMTP id x13-20020a81a00d000000b00573d3cd3d2amr19838242ywg.28.1689743060542;
        Tue, 18 Jul 2023 22:04:20 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id b125-20020a0df283000000b0056d304e224dsm847329ywf.90.2023.07.18.22.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 22:04:19 -0700 (PDT)
Date: Tue, 18 Jul 2023 22:04:08 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v3 04/13] powerpc: assert_pte_locked() use
 pte_offset_map_nolock()
In-Reply-To: <87msztbiy8.fsf@linux.ibm.com>
Message-ID: <392f311f-83ac-a5a2-d16e-2c7736d1b577@google.com>
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com> <e8d56c95-c132-a82e-5f5f-7bb1b738b057@google.com> <87msztbiy8.fsf@linux.ibm.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hells
 trom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 18 Jul 2023, Aneesh Kumar K.V wrote:
> Hugh Dickins <hughd@google.com> writes:
> 
> > Instead of pte_lockptr(), use the recently added pte_offset_map_nolock()
> > in assert_pte_locked().  BUG if pte_offset_map_nolock() fails: this is
> > stricter than the previous implementation, which skipped when pmd_none()
> > (with a comment on khugepaged collapse transitions): but wouldn't we want
> > to know, if an assert_pte_locked() caller can be racing such transitions?
> >
> 
> The reason we had that pmd_none check there was to handle khugpaged. In
> case of khugepaged we do pmdp_collapse_flush and then do a ptep_clear.
> ppc64 had the assert_pte_locked check inside that ptep_clear.
> 
> _pmd = pmdp_collapse_flush(vma, address, pmd);
> ..
> ptep_clear()
> -> asset_ptep_locked()
> ---> pmd_none
> -----> BUG
> 
> 
> The problem is how assert_pte_locked() verify whether we are holding
> ptl. It does that by walking the page table again and in this specific
> case by the time we call the function we already had cleared pmd .

Aneesh, please clarify, I've spent hours on this.

From all your use of past tense ("had"), I thought you were Acking my
patch; but now, after looking again at v3.11 source and today's,
I think you are NAKing my patch in its present form.

You are pointing out that anon THP's __collapse_huge_page_copy_succeeded()
uses ptep_clear() at a point after pmdp_collapse_flush() already cleared
*pmd, so my patch now leads that one use of assert_pte_locked() to BUG.
Is that your point?

I can easily restore that khugepaged comment (which had appeared to me
out of date at the time, but now looks still relevant) and pmd_none(*pmd)
check: but please clarify.

Thanks,
Hugh

> >
> > This mod might cause new crashes: which either expose my ignorance, or
> > indicate issues to be fixed, or limit the usage of assert_pte_locked().
> >
> > Signed-off-by: Hugh Dickins <hughd@google.com>
> > ---
> >  arch/powerpc/mm/pgtable.c | 16 ++++++----------
> >  1 file changed, 6 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> > index cb2dcdb18f8e..16b061af86d7 100644
> > --- a/arch/powerpc/mm/pgtable.c
> > +++ b/arch/powerpc/mm/pgtable.c
> > @@ -311,6 +311,8 @@ void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
> >  	p4d_t *p4d;
> >  	pud_t *pud;
> >  	pmd_t *pmd;
> > +	pte_t *pte;
> > +	spinlock_t *ptl;
> >  
> >  	if (mm == &init_mm)
> >  		return;
> > @@ -321,16 +323,10 @@ void assert_pte_locked(struct mm_struct *mm, unsigned long addr)
> >  	pud = pud_offset(p4d, addr);
> >  	BUG_ON(pud_none(*pud));
> >  	pmd = pmd_offset(pud, addr);
> > -	/*
> > -	 * khugepaged to collapse normal pages to hugepage, first set
> > -	 * pmd to none to force page fault/gup to take mmap_lock. After
> > -	 * pmd is set to none, we do a pte_clear which does this assertion
> > -	 * so if we find pmd none, return.
> > -	 */
> > -	if (pmd_none(*pmd))
> > -		return;
> > -	BUG_ON(!pmd_present(*pmd));
> > -	assert_spin_locked(pte_lockptr(mm, pmd));
> > +	pte = pte_offset_map_nolock(mm, pmd, addr, &ptl);
> > +	BUG_ON(!pte);
> > +	assert_spin_locked(ptl);
> > +	pte_unmap(pte);
> >  }
> >  #endif /* CONFIG_DEBUG_VM */
> >  
> > -- 
> > 2.35.3
