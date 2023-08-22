Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBC1784975
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 20:35:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=CqKdw30W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVdM05ZfGz3c4r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 04:35:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=CqKdw30W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVdL339RKz2xdK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 04:34:34 +1000 (AEST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-58caaedb20bso53897007b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 11:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692729271; x=1693334071;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1WMcORuWW+xF6gY7IBQ8Ihi596ledfzVY2HvWzF69bs=;
        b=CqKdw30WIbzK4C9BVl49dnPtQXsgCMK0Fwag7SfAQ7kJ3tRw3a7cCtAS2xlL+AAHPv
         r4CyCLMJ96e3fzvi6KQ2+Mk2O4mxYTfynjOc4lp8n2WAusPnJ0mJQFK7v37QkqTuklZU
         tnqIswyE/oOd6pufMG74u6bbYZve+ApM3b7Zli+E8Pyg6W+tz1RxcHGcTmcykMK316cc
         LUBM256+2HbMmx9hRSmMDeQiyL3Rq3sOsZSKyAj8s8Z/mqaB/WaY7mvAo/e/OzP+iP5y
         9dZszyvUph+0J7RUe79fX1n/CELkDCL8vwhLU2dWg1KmyLTTud17ZRZdF97E/T8sm0bz
         yJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692729271; x=1693334071;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1WMcORuWW+xF6gY7IBQ8Ihi596ledfzVY2HvWzF69bs=;
        b=VMn8Ye+FRx/FV17aSpgXGg199Z8F45amrDb9EcHtGKqCnikXmaOFJoxMfm+PZufrnx
         drt8lALW0VuBjkKjGxpacyXjVL4BXBygU+iNRzZGe0HT+iHFrBAIyBmqi7jbcZ+X/GSu
         kDnP9IOz2PfcfqJjkO6vltatoeNo7mBn3iu2KOrIkrOovG6CGu0Cv292xejRYdxg+03Z
         piBxl0LxdYB7snTIrNcoJt+I0rL0bSrqOu69haf7+Oh3B488lpmzpJCJ4CTnKOARLDJ7
         pK2o9d8VdXCWkAoEnJgDeNvHPDLA+brfr4W9dKAhIKyXJ/CWTyPdgGLsP6PSRwybj7uV
         p9EA==
X-Gm-Message-State: AOJu0YxQ2v8BOCWYGzXAas2CxobRYCDZY7GWeUVIorR5t3Ajrumf8ZIs
	uX+Qgbd+2azHU64WwnNALz00zA==
X-Google-Smtp-Source: AGHT+IHKsobp5e7zqoup7VzvHJTcsGRbS8zrGrBX3SoF5xm7qcy+ngOpN9zqdPkzqj75WfGQt5eHpQ==
X-Received: by 2002:a81:6009:0:b0:582:5527:ddc with SMTP id u9-20020a816009000000b0058255270ddcmr10163921ywb.34.1692729270534;
        Tue, 22 Aug 2023 11:34:30 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id j1-20020a0dc701000000b0058ddb62f99bsm2956436ywd.38.2023.08.22.11.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 11:34:29 -0700 (PDT)
Date: Tue, 22 Aug 2023 11:34:19 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH mm-unstable] mm/khugepaged: fix collapse_pte_mapped_thp()
 versus uffd
In-Reply-To: <ZOTGvfO31pleXrPF@x1n>
Message-ID: <1b7c7056-d742-86bf-fec-fdb024b2381@google.com>
References: <4d31abf5-56c0-9f3d-d12f-c9317936691@google.com> <CAG48ez1XAePj5MUG8AUmnTjRLcxKre-NGYV82kB68-X8Rh6fxA@mail.gmail.com> <f2dc6d6b-c516-932-1598-a58e2afffe9a@google.com> <ZOTGvfO31pleXrPF@x1n>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Anshuman Khandual <anshuman.khandual@arm.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Qi Zheng <zhengqi.arch@bytedance.com>, kernel list <linux-kernel@vger.kernel.org>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@lin
 ux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Jann Horn <jannh@google.com>, Heiko Carstens <hca@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Linux-MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Zach O'Keefe <zokeefe@google.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@or
 acle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 22 Aug 2023, Peter Xu wrote:
> On Mon, Aug 21, 2023 at 07:51:38PM -0700, Hugh Dickins wrote:
> > On Mon, 21 Aug 2023, Jann Horn wrote:
...
> > > 
> > > I guess an alternative would be to use a spin_trylock() instead of the
> > > current pmd_lock(), and if that fails, temporarily drop the page table
> > > lock and then restart from step 2 with both locks held - and at that
> > > point the page table scan should be fast since we expect it to usually
> > > be empty.
> > 
> > That's certainly a good idea, if collapse on userfaultfd_armed private
> > is anything of a common case (I doubt, but I don't know).  It may be a
> > better idea anyway (saving a drop and retake of ptlock).
> > 
> > I gave it a try, expecting to end up with something that would lead
> > me to say "I tried it, but it didn't work out well"; but actually it
> > looks okay to me.  I wouldn't say I prefer it, but it seems reasonable,
> > and no more complicated (as Peter rightly observes) than the original.
> > 
> > It's up to you and Peter, and whoever has strong feelings about it,
> > to choose between them: I don't mind (but I shall be sad if someone
> > demands that I indent that comment deeper - I'm not a fan of long
> > multi-line comments near column 80).
> 
> No strong opinion here, either.  Just one trivial comment/question below on
> the new patch (if that will be preferred)..

I'm going to settle for the original v1 for now (I'll explain why in reply
to Jann next) - which already has the blessing of your Acked-by, thanks.

(Yes, the locking is a bit confusing: but mainly for the unrelated reason,
that with the split locking configs, we never quite know whether this lock
is the same as that lock or not, and so have to be rather careful.)

> > [PATCH mm-unstable v2] mm/khugepaged: fix collapse_pte_mapped_thp() versus uffd
...
> > @@ -1572,9 +1572,10 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
> >  				haddr, haddr + HPAGE_PMD_SIZE);
> >  	mmu_notifier_invalidate_range_start(&range);
> >  	notified = true;
> > -	start_pte = pte_offset_map_lock(mm, pmd, haddr, &ptl);
> > -	if (!start_pte)		/* mmap_lock + page lock should prevent this */
> > -		goto abort;
> > +	spin_lock(ptl);
> 
> .. here will the ptl always be valid?
> 
> That comes from the previous round of pte_offset_map_lock(), and I assume
> after this whole "thp collapse without write lock" work landed, it has the
> same lifecycle with the *pte pointer, so can be invalid right after the rcu
> read lock released; mmap read lock isn't strong enough to protect the ptl,
> not anymore.
> 
> Maybe it's all fine because the thp collapse path is the solo path(s) that
> will release the pte pgtable page without write mmap lock (so as to release
> the ptl too when doing so), and we at least still hold the page lock, so
> the worst case is the other concurrent "thp collapse" will still serialize
> with this one on the huge page lock. But that doesn't look as solid as
> fetching again the ptl from another pte_offset_map_nolock().  So still just
> raise this question up.  It's possible I just missed something.

It is safe, as you say because of us holding the hpage lock, which stops
any racing callers of collapse_pte_mapped_thp() or retract_page_tables():
and these are the functions which (currently) make the *pmd transition
which pte_offset_map_lock() etc. are being careful to guard against.

[In future we can imagine empty page table removal making that transition
too: and that wouldn't even have any hpage to lock.  Will it rely on
mmap_lock for write? or pmd_lock? probably both, but no need to design
for it now.]

But I agree that it does *look* more questionable in this patch: there was
a reassuring pte_offset_map_lock() there before, and now I rely more on
the assumptions and just use the "previous" ptl (and that's why I chose
to make the !start_pte case a VM_BUG_ON a few lines later).

I expect, with more time spent, I could cast it back into more reassuring
form: but it's all a bit of a con trick - if you look further down (even
before v2 or v1 fixes) to "step 4", there we have "if (ptl != pml)" which
is also relying on the fact that ptl cannot have changed.  And no doubt
that too could be recast into more reassuring-looking form, but it
wouldn't actually be worthwhile.

Thanks for considering these, Peter: I'll recommend v1 to Andrew.

Hugh
