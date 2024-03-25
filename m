Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C30088AF20
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 19:59:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hm65WFqY;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hm65WFqY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3MgH73gNz3vYW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 05:59:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hm65WFqY;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hm65WFqY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3MfW171mz2xX4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 05:58:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711393135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lGdQaCGcBkbZ2z9bjtfUzgfe0ZmyyKivIRm0X4ayYz0=;
	b=Hm65WFqYPhB3yfRhsgsOohyet6vCN+TWqhbvFYZCYTTDlDHUqDAa/xfzn0WNoSA49wdK53
	vO9aoq7myZV1Bj+kyJO7fcio0j1IPtsJy4XiLlqx8TNZoAyZ/rKSHUehfsKgo8qFqBPXV7
	s7hhtvYWYf7Ooz3+EpkPkX2fZCcDGyI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711393135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lGdQaCGcBkbZ2z9bjtfUzgfe0ZmyyKivIRm0X4ayYz0=;
	b=Hm65WFqYPhB3yfRhsgsOohyet6vCN+TWqhbvFYZCYTTDlDHUqDAa/xfzn0WNoSA49wdK53
	vO9aoq7myZV1Bj+kyJO7fcio0j1IPtsJy4XiLlqx8TNZoAyZ/rKSHUehfsKgo8qFqBPXV7
	s7hhtvYWYf7Ooz3+EpkPkX2fZCcDGyI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-LpQKkT9dNQKPl69uag82Zg-1; Mon, 25 Mar 2024 14:58:53 -0400
X-MC-Unique: LpQKkT9dNQKPl69uag82Zg-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6968eb0a7dfso5048256d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 11:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711393133; x=1711997933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGdQaCGcBkbZ2z9bjtfUzgfe0ZmyyKivIRm0X4ayYz0=;
        b=mp3cbmaShN5UIEuQbkkFR4WOdc4ekelDe7hybdJnl3dye0lL8NpwL3aRXtV6TodmNd
         n/9um8Z5amFdBvyMa+6wPLqOzT46Te/GXgFs9KuiU3Us0uxfLfF10db7dV9hM7mMO7pb
         xjw3qzjwqxD0AifHb3OIMiz0+JKuiwXhgRPSQFWlpZd5kIVARhRRFv+zPvvMdRdTkgsE
         M9Gx6U2+idpYIESLO1eHmEGe2euGpDqOqRe7L2f535ihgejFABpv+qgdFbV+9oi+zXLH
         YjDLQZqHwcixVXRysB0mOlfMrSwGUpSSpgWH2LiAp6qn5bT2K9KAA2/r54k6wPSy5P6L
         ih0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxkqLsviKHdbjaBhg0h9V1zFsk5VLMHX2Gl0EDodA+tdKCAz5LMRRE4NqKoNfjjMtvg4dQJkWDMpDWL09PVwtsSIDnp1bP2/tpCgWrYw==
X-Gm-Message-State: AOJu0YwrO60n3suAF6j//qpikiClHRmXUKgCNDY11lQ5sKWCljEM1URX
	VW+z7gPpQD8lH6ej12WiWVz5oM/C/wCFLbqqEroS6atQtSB+AcDxDrMRuxQ0p9T+1Z5q8F000xS
	EwSisZkceiqeYAJMM3/DLWjFD+H654G+8MuqRVb4qzcjp4W9Xmnj+o6lbT7QMwQ0=
X-Received: by 2002:a05:6214:3d13:b0:696:7b12:3744 with SMTP id ol19-20020a0562143d1300b006967b123744mr8189332qvb.0.1711393132761;
        Mon, 25 Mar 2024 11:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE4pfdS6Owjbbcw6cCZoeZVpTG6xXlLRqHsMW/sJVGfLOPBLf6CMPjo5ntIkMeQpg5wPfu7g==
X-Received: by 2002:a05:6214:3d13:b0:696:7b12:3744 with SMTP id ol19-20020a0562143d1300b006967b123744mr8189311qvb.0.1711393132312;
        Mon, 25 Mar 2024 11:58:52 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id kd26-20020a056214401a00b006968e1bed43sm1380686qvb.79.2024.03.25.11.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 11:58:51 -0700 (PDT)
Date: Mon, 25 Mar 2024 14:58:48 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 00/12] mm/gup: Unify hugetlb, part 2
Message-ID: <ZgHJaJSpoeJVEccN@x1n>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240322161000.GJ159172@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240322161000.GJ159172@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-arm-kernel@lists.infradead.org, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 22, 2024 at 01:10:00PM -0300, Jason Gunthorpe wrote:
> On Thu, Mar 21, 2024 at 06:07:50PM -0400, peterx@redhat.com wrote:
> > From: Peter Xu <peterx@redhat.com>
> > 
> > v3:
> > - Rebased to latest mm-unstalbe (a824831a082f, of March 21th)
> > - Dropped patch to introduce pmd_thp_or_huge(), replace such uses (and also
> >   pXd_huge() users) with pXd_leaf() [Jason]
> > - Add a comment for CONFIG_PGTABLE_HAS_HUGE_LEAVES [Jason]
> > - Use IS_ENABLED() in follow_huge_pud() [Jason]
> > - Remove redundant none pud check in follow_pud_mask() [Jason]
> > 
> > rfc: https://lore.kernel.org/r/20231116012908.392077-1-peterx@redhat.com
> > v1:  https://lore.kernel.org/r/20231219075538.414708-1-peterx@redhat.com
> > v2:  https://lore.kernel.org/r/20240103091423.400294-1-peterx@redhat.com
> > 
> > The series removes the hugetlb slow gup path after a previous refactor work
> > [1], so that slow gup now uses the exact same path to process all kinds of
> > memory including hugetlb.
> > 
> > For the long term, we may want to remove most, if not all, call sites of
> > huge_pte_offset().  It'll be ideal if that API can be completely dropped
> > from arch hugetlb API.  This series is one small step towards merging
> > hugetlb specific codes into generic mm paths.  From that POV, this series
> > removes one reference to huge_pte_offset() out of many others.
> 
> This remark would be a little easier to understand if you refer to
> hugetlb_walk() not huge_pte_offset() - the latter is only used to
> implement hugetlb_walk() and isn't removed by this series, while a
> single hugetlb_walk() was removed.

Right.  Here huge_pte_offset() is the arch API that I hope we can remove,
the hugetlb_walk() is simply the wrapper.

> 
> Regardless, I think the point is spot on, the direction should be to
> make the page table reading generic with minimal/no interaction with
> hugetlbfs in the generic code.

Yes, and I also like your terms on calling them "pgtable readers".  It's a
better way to describe the difference in that regard between
huge_pte_offset() v.s. huge_pte_alloc().  Exactly that's my goal, that we
should start with the "readers".

The writters might change semantics when merge, and can be more
challenging, I'll need to look into details of each one, like page fault
handlers.  Such work may need to be analyzed case by case, and this GUP
part is definitely the low hanging fruit comparing to the rest.

> 
> After this series I would suggest doing the pagewalk.c stuff as it is
> very parallel to GUP slow (indeed it would be amazing to figure out a
> way to make GUP slow and pagewalk.c use the same code without a
> performance cost)

Yes.  I hope there shouldn't be much perf degrade, I can do some more
measurements too when getting there.  And btw, IIUC the major challenge of
pagewalk.c is not the removal of walk_hugetlb_range() alone - that may not
be that hard if that's the solo purpose.  The better way to go is to remove
mm_walk_ops.hugetlb_entry() altogether, which will cause a change in all
callers; that's "the challenge".. pretty much labor works, not a major
technical challenge it seems.  Not sure if it's a good news or bad..

One thing I'll soon look into is to allow huge mappings for PFNMAP; there's
one request from VFIO side for MMIO. Dropping mm_walk_ops.hugetlb_entry()
seems to be good for all such purposes; well, I may need to bite the bullet
here.. for either of the purposes to move on.

> 
> Some of the other core mm callers don't look too bad either, getting
> to the point where hugetlb_walk() is internal to hugetlb.c would be a
> nice step that looks reasonable size.

Agree.

> 
> > One goal of such a route is that we can reconsider merging hugetlb features
> > like High Granularity Mapping (HGM).  It was not accepted in the past
> > because it may add lots of hugetlb specific codes and make the mm code even
> > harder to maintain.  With a merged codeset, features like HGM can hopefully
> > share some code with THP, legacy (PMD+) or modern (continuous PTEs).
> 
> Yeah, if all the special hugetlb stuff is using generic arch code and
> generic page walkers (maybe with that special vma locking hook) it is
> much easier to swallow than adding yet another special class of code
> to all the page walkers.
> 
> > To make it work, the generic slow gup code will need to at least understand
> > hugepd, which is already done like so in fast-gup.  Due to the specialty of
> > hugepd to be software-only solution (no hardware recognizes the hugepd
> > format, so it's purely artificial structures), there's chance we can merge
> > some or all hugepd formats with cont_pte in the future.  That question is
> > yet unsettled from Power side to have an acknowledgement.  
> 
> At a minimum, I think we have a concurrence that the reading of the
> hugepd entries should be fine through the standard contig pte APIs and
> so all the page walkers doing read side operations could stop having
> special hugepd code. It is just an implementation of contig pte with
> the new property that the size of a PTE can be larger than a PMD
> entry.
> 
> If, or how much, the hugepd write side remains special is the open
> question, I think.

It seems balls are rolling in that aspect, I haven't looked in depth there
in Christophe's series but it's great to have started!

> 
> > this series, I kept the hugepd handling because we may still need to do so
> > before getting a clearer picture of the future of hugepd.  The other reason
> > is simply that we did it already for fast-gup and most codes are still
> > around to be reused.  It'll make more sense to keep slow/fast gup behave
> > the same before a decision is made to remove hugepd.
> 
> Yeah, I think that is right for this series. Lets get this done and
> then try to remove hugepd read side.

Thanks a bunch for the reviews.

-- 
Peter Xu

