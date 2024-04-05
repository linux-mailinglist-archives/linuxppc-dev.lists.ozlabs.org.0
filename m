Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D462189A644
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 23:43:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZnnysDkV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZnnysDkV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VBBnK6lRZz3vb5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Apr 2024 08:43:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZnnysDkV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZnnysDkV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VBBmc0TMbz3cGY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Apr 2024 08:42:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712353371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nh8AZu/36vuzSfX/Je7NxWoNvpcer/hOQkOAQFaqnk4=;
	b=ZnnysDkV95d3IkZdTauVM8cFRBBoqq9y3PdiELk4lqvlnNWeBNLPE37OLq8KMpvsR+FmDj
	8kCti2lgZp9OCMg6qb2hnNvF1RagS4wNhD42eHq/ZS4Fv4whb7lGbYtRUUhfluofRNGLJj
	t6zeFeNaLQeq27wsHHGAX67eEzrL8fc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712353371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nh8AZu/36vuzSfX/Je7NxWoNvpcer/hOQkOAQFaqnk4=;
	b=ZnnysDkV95d3IkZdTauVM8cFRBBoqq9y3PdiELk4lqvlnNWeBNLPE37OLq8KMpvsR+FmDj
	8kCti2lgZp9OCMg6qb2hnNvF1RagS4wNhD42eHq/ZS4Fv4whb7lGbYtRUUhfluofRNGLJj
	t6zeFeNaLQeq27wsHHGAX67eEzrL8fc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28--B-OIPbwO7OePj2CM9fbhQ-1; Fri, 05 Apr 2024 17:42:49 -0400
X-MC-Unique: -B-OIPbwO7OePj2CM9fbhQ-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-78d438954abso37597185a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 14:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712353369; x=1712958169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nh8AZu/36vuzSfX/Je7NxWoNvpcer/hOQkOAQFaqnk4=;
        b=uXbqkTZvPfzwaTM+4hPh0yjM9RE/+VVoDTQR2c/QRedKpeLMXXagVH2kEJqdLGzK3S
         j4OK1048bYmJgHhPkMhAZ/z3FUS9ZTzLY5kwnP0KG1sTJnTaeDPlzFPHGfRneF67xBpf
         9raXKTVGkE3V0eXtjjRIJVK2Fbg2PxTSCGZTxtpTfBP3EgJZhW20T2kKdyJ8NTwKLNPP
         2olEcqK2/41WK5h3g+5iW8GYpnsoUkVdgLDwW3tJUEhpgae7si0wR6S0JBTKW/C+JBOY
         Xbc+8KQx+0EymvZGaUSCgf6ZNm7qaaMmS2HkRVCIXD7cxsBNAnveWFPRauUt586NufLd
         o72w==
X-Forwarded-Encrypted: i=1; AJvYcCXZhR7UAxIo3q0E76xcAoeS4rQ6DCMJBB1AUNuVqUIJUqt0mJx3yILL3CkQ7MOx4AHoSu5Ci/JK02gSel12edHneT8kFdLg2rC2j4NWQw==
X-Gm-Message-State: AOJu0Ywz1ivy6+gK78I9DDgQetNnclPuXAgu20xDvdKthAAYX0U6CKHb
	m+50E4WuZB7Vr4zVAz+zHoQuA238rLPbZtIsxDd3qIAtPQP669mZ4WNxza4DRinlA5lHC+k3JXl
	h6VWXyFb/4ViScuf2l46232oVrtPQD90+mhXfNes0djiyCNobheLiVtG6sYLhAK0=
X-Received: by 2002:a05:620a:24cb:b0:78b:ead0:4e98 with SMTP id m11-20020a05620a24cb00b0078bead04e98mr2827319qkn.5.1712353368792;
        Fri, 05 Apr 2024 14:42:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYTCLlC89IJBPyweOipCCmgbTuVze3tgI8H3RxcclvMtkthTW+/IyM+0zA0bT9pfKklVWVNA==
X-Received: by 2002:a05:620a:24cb:b0:78b:ead0:4e98 with SMTP id m11-20020a05620a24cb00b0078bead04e98mr2827279qkn.5.1712353368024;
        Fri, 05 Apr 2024 14:42:48 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id bl40-20020a05620a1aa800b00789e8405843sm971843qkb.32.2024.04.05.14.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 14:42:47 -0700 (PDT)
Date: Fri, 5 Apr 2024 17:42:44 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 00/12] mm/gup: Unify hugetlb, part 2
Message-ID: <ZhBwVLyHr8WEKSx2@x1n>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240322161000.GJ159172@nvidia.com>
 <ZgHJaJSpoeJVEccN@x1n>
 <20240326140252.GH6245@nvidia.com>
 <Zg8gEyE4o_VJsTmx@x1n>
 <20240405181633.GH5383@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240405181633.GH5383@nvidia.com>
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

On Fri, Apr 05, 2024 at 03:16:33PM -0300, Jason Gunthorpe wrote:
> On Thu, Apr 04, 2024 at 05:48:03PM -0400, Peter Xu wrote:
> > On Tue, Mar 26, 2024 at 11:02:52AM -0300, Jason Gunthorpe wrote:
> > > The more I look at this the more I think we need to get to Matthew's
> > > idea of having some kind of generic page table API that is not tightly
> > > tied to level. Replacing the hugetlb trick of 'everything is a PTE'
> > > with 5 special cases in every place seems just horrible.
> > > 
> > >    struct mm_walk_ops {
> > >        int (*leaf_entry)(struct mm_walk_state *state, struct mm_walk *walk);
> > >    }
> > > 
> > > And many cases really want something like:
> > >    struct mm_walk_state state;
> > > 
> > >    if (!mm_walk_seek_leaf(state, mm, address))
> > >           goto no_present
> > >    if (mm_walk_is_write(state)) ..
> > > 
> > > And detailed walking:
> > >    for_each_pt_leaf(state, mm, address) {
> > >        if (mm_walk_is_write(state)) ..
> > >    }
> > > 
> > > Replacing it with a mm_walk_state that retains the level or otherwise
> > > to allow decoding any entry composes a lot better. Forced Loop
> > > unrolling can get back to the current code gen in alot of places.
> > > 
> > > It also makes the power stuff a bit nicer as the mm_walk_state could
> > > automatically retain back pointers to the higher levels in the state
> > > struct too...
> > > 
> > > The puzzle is how to do it and still get reasonable efficient codegen,
> > > many operations are going to end up switching on some state->level to
> > > know how to decode the entry.
> > 
> > These discussions are definitely constructive, thanks Jason.  Very helpful.
> > 
> > I thought about this last week but got interrupted.  It does make sense to
> > me; it looks pretty generic and it is flexible enough as a top design.  At
> > least that's what I thought.
> 
> Yeah, exactly..
> 
> > However now when I rethink about it, and look more into the code when I got
> > the chance, it turns out this will be a major rewrite of mostly every
> > walkers..  
> 
> Indeed, it is why it may not be reasonable.
> 
> > Consider that what we (or.. I) want to teach the pXd layers are two things
> > right now: (1) hugetlb mappings (2) MMIO (PFN) mappings.  That mostly
> > shares the generic concept when working on the mm walkers no matter which
> > way to go, just different treatment on different type of mem.  (2) is on
> > top of current code and new stuff, while (1) is a refactoring to drop
> > hugetlb_entry() hook point as the goal.
> 
> Right, I view this as a two pronged attack
> 
> One one front you teach the generic pXX_* macros to process huge pages
> and push that around to the performance walkers like GUP
> 
> On another front you want to replace use of the hugepte with the new
> walkers.
> 
> The challenge with the hugepte code is that it is all structured to
> assume one API that works at all levels and that may be a hard fit to
> replace with pXX_* functions.

That's the core of problem, or otherwise I feel like I might be doing
something else already.  I had a feeling even if it's currently efficient
for hugetlb, we'll drop that sooner or later.

The issue is at least hugetlb pgtable format is exactly the same as the
rest, as large folio grows it will reach the point that we complain more
than before on having hugetlb does its smart things on its own.

> 
> The places that are easy to switch from hugetlb to pXX_* may as well
> do so.
> 
> Other places maybe need a hugetlb replacement that has a similar
> abstraction level of pointing to any page table level.

IMHO this depends.

Per my current knowledge, hugetlb is only special in three forms:

- huge mapping (well, this isn't that special..)
- cont pte/pmd/...
- hugepd

The most fancy one is actually hugepd.. but I plan to put that temporarily
aside - I haven't look at Christophe's series yet, however I think we're
going to solve orthogonal issues but his work will definitely help me on
reaching mine, and I want to think through first on my end of things to
know a plan.  If hugepd has its chance to be generalized, the worst case is
I'll leverage CONFIG_ARCH_HAS_HUGEPD and only keep hugetlb_entry() for them
until hugepd became some cont-pxx variance.  Then when I put HAS_HUGEPD
aside, I don't think it's very complicated, perhaps?

In short, hugetlb mappings shouldn't be special comparing to other huge pXd
and large folio (cont-pXd) mappings for most of the walkers in my mind, if
not all.  I need to look at all the walkers and there can be some tricky
ones, but I believe that applies in general.  It's actually similar to what
I did with slow gup here.

Like this series, for cont-pXd we'll need multiple walks comparing to
before (when with hugetlb_entry()), but for that part I'll provide some
performance tests too, and we also have a fallback plan, which is to detect
cont-pXd existance, which will also work for large folios.

> 
> I think if you do the easy places for pXX conversion you will have a
> good idea about what is needed for the hard places.

Here IMHO we don't need to understand "what is the size of this hugetlb
vma", or "which level of pgtable does this hugetlb vma pages locate",
because we may not need that, e.g., when we only want to collect some smaps
statistics.  "whether it's hugetlb" may matter, though. E.g. in the mm
walker we see a huge pmd, it can be a thp, it can be a hugetlb (when
hugetlb_entry removed), we may need extra check later to put things into
the right bucket, but for the walker itself it doesn't necessarily need
hugetlb_entry().

> 
> > Now the important question I'm asking myself is: do we really need huge p4d
> > or even bigger?
> 
> Do we need huge p4d support with folios? Probably not..
> 
> huge p4d support for pfnmap, eg in VFIO. Yes I think that is possibly
> interesting - but I wouldn't ask anyone to do the work :)

Considering it does not yet exist, and we don't have plan to work it out
(so far), maybe I can see this as a very implicit ack that I can put that
aside at least of now. :)

> 
> But then again we come back to power and its big list of page sizes
> and variety :( Looks like some there have huge sizes at the pgd level
> at least.

Yeah this is something I want to be super clear, because I may miss
something: we don't have real pgd pages, right?  Powerpc doesn't even
define p4d_leaf(), AFAICT.

$ git grep p4d_leaf
arch/powerpc/mm/book3s64/radix_pgtable.c:               if (p4d_leaf(*p4d)) {
arch/powerpc/mm/pgtable.c:      if (p4d_leaf(p4d)) {
arch/powerpc/mm/pgtable_64.c:   if (p4d_leaf(p4d)) {
arch/powerpc/mm/pgtable_64.c:                   VM_WARN_ON(!p4d_leaf(p4d));
arch/powerpc/xmon/xmon.c:       if (p4d_leaf(*p4dp)) {

They all constantly return false (which is the fallback)?

> 
> > So, can we over-engineer too much if we go the generic route now?
> 
> Yes we can, and it will probably be slow as well. The pXX macros are
> the most efficient if code can be adapted to use them.
> 
> > Considering that we already have most of pmd/pud entries around in the mm
> > walker ops.
> 
> Yeah, so you add pgd and maybe p4d and then we can don't need any
> generic thing. If it is easy it would be nice.

I want to double check on above on PowerPC first, otherwise I'd consider
leaving p4d+ alone, if that looks ok.  It could be that I missed something
important, Christophe may want to chim in if he has any thoughts or just to
clarify my mistakes.

Thanks,

-- 
Peter Xu

