Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F29F48B4110
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 23:21:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K+Z1ADEJ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K+Z1ADEJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VR5Ht4jvYz3cgd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2024 07:21:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K+Z1ADEJ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=K+Z1ADEJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VR5H63Dnzz3cXn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2024 07:20:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714166429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YE+xroN3MSFRA2YVeljr0pVRi5jEiA/gyhgABPdlML0=;
	b=K+Z1ADEJ9rSuIz5AQhh4VxCOrbjvoOZGBNavLWxE121+rFBS9Me4U/E7H0fRFKi+iek+5n
	wszxQ7RP6oXLASSBN+SZo4mVCRRibUCcd8t5ni9g52WnQB/47QWwaAlNeRstTBLUAL6vPW
	Gd5SQ2dDiK5pmV6dil5JMAu9USigrQs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714166429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YE+xroN3MSFRA2YVeljr0pVRi5jEiA/gyhgABPdlML0=;
	b=K+Z1ADEJ9rSuIz5AQhh4VxCOrbjvoOZGBNavLWxE121+rFBS9Me4U/E7H0fRFKi+iek+5n
	wszxQ7RP6oXLASSBN+SZo4mVCRRibUCcd8t5ni9g52WnQB/47QWwaAlNeRstTBLUAL6vPW
	Gd5SQ2dDiK5pmV6dil5JMAu9USigrQs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-DLslwRx9PbGyWsJAfbsPQw-1; Fri, 26 Apr 2024 17:20:28 -0400
X-MC-Unique: DLslwRx9PbGyWsJAfbsPQw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-69b147e856aso6540216d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 14:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714166428; x=1714771228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YE+xroN3MSFRA2YVeljr0pVRi5jEiA/gyhgABPdlML0=;
        b=wKcYnbAogIG8FOUrdkWoZmQiHt3k1POAvrYSVlmcc1s7t+XUOvCVC6IRkMYdrE19UK
         HY8qM+QIh5abvNALOQrCg80AvRAX7+Mwx8ohsuD3uHrzoKJkq5EjWPbRA7SQ/yc+wjmp
         FawIhJWot2Rak+6FoJm4gWpsBW9KMaBRPlhhSDSs4fLd/Fxyt16KiffgjJLDUhvqEHuk
         MgTvQY51Q0MxCSxl3FlmSGkPFnJzapE1b/FaU42Q/dv2kmZHWkOCvXlGQNkHhSRwdUBk
         GikFgpS0GV50zA7PXz5L67b7++1At86uXabnJE84Ka0YnlvrYowkiaVLR4HSSEl0hogI
         oqvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgBno5I2Y5EeZUwwxS/DgLFgC9HtuE0hfL3bvOegJMbGdNWjYRFew62onQB1aMMCIjAd4RlKRaL1DO8n8H0ltG+RGgQwMxDYND6NP9Xw==
X-Gm-Message-State: AOJu0Yyp/7f8A048m8lySb16qhBUKyD3Nkyd6AiiLi1mWUZ2kOi12V0J
	KhbnmDgVfBAtk3x61Sr8sHqhjSfB/8IuO4hBDD+5p7GgFTSb/EOiKX3lzaiSusagSJB8DipjKCl
	lU7rJ5YBTi5lLGl/I9e3EL1hDv7CTy3fn4lR2vhc/p2DA8TD2BraxrkmUnyZcl/w=
X-Received: by 2002:a05:620a:4089:b0:790:8c20:e281 with SMTP id f9-20020a05620a408900b007908c20e281mr4399212qko.4.1714166427252;
        Fri, 26 Apr 2024 14:20:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfzashahVyLrvAJ9qdUfNGidrRIiANL3lMVu3kzLvmX9ZvfaFZoyGy8b+LUj3RVEq076HTsg==
X-Received: by 2002:a05:620a:4089:b0:790:8c20:e281 with SMTP id f9-20020a05620a408900b007908c20e281mr4399166qko.4.1714166426469;
        Fri, 26 Apr 2024 14:20:26 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id oo8-20020a05620a530800b0078d693c0b4bsm8243842qkn.135.2024.04.26.14.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 14:20:26 -0700 (PDT)
Date: Fri, 26 Apr 2024 17:20:23 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/3] mm/gup: consistently name GUP-fast functions
Message-ID: <Ziwal-SucIye3hPM@x1n>
References: <20240402125516.223131-1-david@redhat.com>
 <20240402125516.223131-2-david@redhat.com>
 <e685c532-8330-4a57-bc08-c67845e0c352@redhat.com>
 <Ziuv2jLY1wgBITiP@x1n>
 <ZivScN8-Uoi9eye8@x1n>
 <8b42a24d-caf0-46ef-9e15-0f88d47d2f21@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8b42a24d-caf0-46ef-9e15-0f88d47d2f21@redhat.com>
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
Cc: linux-s390@vger.kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 26, 2024 at 07:28:31PM +0200, David Hildenbrand wrote:
> On 26.04.24 18:12, Peter Xu wrote:
> > On Fri, Apr 26, 2024 at 09:44:58AM -0400, Peter Xu wrote:
> > > On Fri, Apr 26, 2024 at 09:17:47AM +0200, David Hildenbrand wrote:
> > > > On 02.04.24 14:55, David Hildenbrand wrote:
> > > > > Let's consistently call the "fast-only" part of GUP "GUP-fast" and rename
> > > > > all relevant internal functions to start with "gup_fast", to make it
> > > > > clearer that this is not ordinary GUP. The current mixture of
> > > > > "lockless", "gup" and "gup_fast" is confusing.
> > > > > 
> > > > > Further, avoid the term "huge" when talking about a "leaf" -- for
> > > > > example, we nowadays check pmd_leaf() because pmd_huge() is gone. For the
> > > > > "hugepd"/"hugepte" stuff, it's part of the name ("is_hugepd"), so that
> > > > > stays.
> > > > > 
> > > > > What remains is the "external" interface:
> > > > > * get_user_pages_fast_only()
> > > > > * get_user_pages_fast()
> > > > > * pin_user_pages_fast()
> > > > > 
> > > > > The high-level internal functions for GUP-fast (+slow fallback) are now:
> > > > > * internal_get_user_pages_fast() -> gup_fast_fallback()
> > > > > * lockless_pages_from_mm() -> gup_fast()
> > > > > 
> > > > > The basic GUP-fast walker functions:
> > > > > * gup_pgd_range() -> gup_fast_pgd_range()
> > > > > * gup_p4d_range() -> gup_fast_p4d_range()
> > > > > * gup_pud_range() -> gup_fast_pud_range()
> > > > > * gup_pmd_range() -> gup_fast_pmd_range()
> > > > > * gup_pte_range() -> gup_fast_pte_range()
> > > > > * gup_huge_pgd()  -> gup_fast_pgd_leaf()
> > > > > * gup_huge_pud()  -> gup_fast_pud_leaf()
> > > > > * gup_huge_pmd()  -> gup_fast_pmd_leaf()
> > > > > 
> > > > > The weird hugepd stuff:
> > > > > * gup_huge_pd() -> gup_fast_hugepd()
> > > > > * gup_hugepte() -> gup_fast_hugepte()
> > > > 
> > > > I just realized that we end up calling these from follow_hugepd() as well.
> > > > And something seems to be off, because gup_fast_hugepd() won't have the VMA
> > > > even in the slow-GUP case to pass it to gup_must_unshare().
> > > > 
> > > > So these are GUP-fast functions and the terminology seem correct. But the
> > > > usage from follow_hugepd() is questionable,
> > > > 
> > > > commit a12083d721d703f985f4403d6b333cc449f838f6
> > > > Author: Peter Xu <peterx@redhat.com>
> > > > Date:   Wed Mar 27 11:23:31 2024 -0400
> > > > 
> > > >      mm/gup: handle hugepd for follow_page()
> > > > 
> > > > 
> > > > states "With previous refactors on fast-gup gup_huge_pd(), most of the code
> > > > can be leveraged", which doesn't look quite true just staring the the
> > > > gup_must_unshare() call where we don't pass the VMA. Also,
> > > > "unlikely(pte_val(pte) != pte_val(ptep_get(ptep)" doesn't make any sense for
> > > > slow GUP ...
> > > 
> > > Yes it's not needed, just doesn't look worthwhile to put another helper on
> > > top just for this.  I mentioned this in the commit message here:
> > > 
> > >    There's something not needed for follow page, for example, gup_hugepte()
> > >    tries to detect pgtable entry change which will never happen with slow
> > >    gup (which has the pgtable lock held), but that's not a problem to check.
> > > 
> > > > 
> > > > @Peter, any insights?
> > > 
> > > However I think we should pass vma in for sure, I guess I overlooked that,
> > > and it didn't expose in my tests too as I probably missed ./cow.
> > > 
> > > I'll prepare a separate patch on top of this series and the gup-fast rename
> > > patches (I saw this one just reached mm-stable), and I'll see whether I can
> > > test it too if I can find a Power system fast enough.  I'll probably drop
> > > the "fast" in the hugepd function names too.
> > 
> 
> For the missing VMA parameter, the cow.c test might not trigger it. We never need the VMA to make
> a pinning decision for anonymous memory. We'll trigger an unsharing fault, get an exclusive anonymous page
> and can continue.
> 
> We need the VMA in gup_must_unshare(), when long-term pinning a file hugetlb page. I *think*
> the gup_longterm.c selftest should trigger that, especially:
> 
> # [RUN] R/O longterm GUP-fast pin in MAP_SHARED file mapping ... with memfd hugetlb (2048 kB)
> ...
> # [RUN] R/O longterm GUP-fast pin in MAP_SHARED file mapping ... with memfd hugetlb (1048576 kB)
> 
> 
> We need a MAP_SHARED page where the PTE is R/O that we want to long-term pin R/O.
> I don't remember from the top of my head if the test here might have a R/W-mapped
> folio. If so, we could extend it to cover that.

Let me try both then.

> 
> > Hmm, so when I enable 2M hugetlb I found ./cow is even failing on x86.
> > 
> >    # ./cow  | grep -B1 "not ok"
> >    # [RUN] vmsplice() + unmap in child ... with hugetlb (2048 kB)
> >    not ok 161 No leak from parent into child
> >    --
> >    # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with hugetlb (2048 kB)
> >    not ok 215 No leak from parent into child
> >    --
> >    # [RUN] vmsplice() before fork(), unmap in parent after fork() ... with hugetlb (2048 kB)
> >    not ok 269 No leak from child into parent
> >    --
> >    # [RUN] vmsplice() + unmap in parent after fork() ... with hugetlb (2048 kB)
> >    not ok 323 No leak from child into parent
> > 
> > And it looks like it was always failing.. perhaps since the start?  We
> 
> Yes!
> 
> commit 7dad331be7816103eba8c12caeb88fbd3599c0b9
> Author: David Hildenbrand <david@redhat.com>
> Date:   Tue Sep 27 13:01:17 2022 +0200
> 
>     selftests/vm: anon_cow: hugetlb tests
>     Let's run all existing test cases with all hugetlb sizes we're able to
>     detect.
>     Note that some tests cases still fail. This will, for example, be fixed
>     once vmsplice properly uses FOLL_PIN instead of FOLL_GET for pinning.
>     With 2 MiB and 1 GiB hugetlb on x86_64, the expected failures are:
>      # [RUN] vmsplice() + unmap in child ... with hugetlb (2048 kB)
>      not ok 23 No leak from parent into child
>      # [RUN] vmsplice() + unmap in child ... with hugetlb (1048576 kB)
>      not ok 24 No leak from parent into child
>      # [RUN] vmsplice() before fork(), unmap in parent after fork() ... with hugetlb (2048 kB)
>      not ok 35 No leak from child into parent
>      # [RUN] vmsplice() before fork(), unmap in parent after fork() ... with hugetlb (1048576 kB)
>      not ok 36 No leak from child into parent
>      # [RUN] vmsplice() + unmap in parent after fork() ... with hugetlb (2048 kB)
>      not ok 47 No leak from child into parent
>      # [RUN] vmsplice() + unmap in parent after fork() ... with hugetlb (1048576 kB)
>      not ok 48 No leak from child into parent
> 
> As it keeps confusing people (until somebody cares enough to fix vmsplice), I already
> thought about just disabling the test and adding a comment why it happens and
> why nobody cares.

I think we should, and when doing so maybe add a rich comment in
hugetlb_wp() too explaining everything?

> 
> > didn't do the same on hugetlb v.s. normal anon from that regard on the
> > vmsplice() fix.
> > 
> > I drafted a patch to allow refcount>1 detection as the same, then all tests
> > pass for me, as below.
> > 
> > David, I'd like to double check with you before I post anything: is that
> > your intention to do so when working on the R/O pinning or not?
> 
> Here certainly the "if it's easy it would already have done" principle applies. :)
> 
> The issue is the following: hugetlb pages are scarce resources that cannot usually
> be overcommitted. For ordinary memory, we don't care if we COW in some corner case
> because there is an unexpected reference. You temporarily consume an additional page
> that gets freed as soon as the unexpected reference is dropped.
> 
> For hugetlb, it is problematic. Assume you have reserved a single 1 GiB hugetlb page
> and your process uses that in a MAP_PRIVATE mapping. Then it calls fork() and the
> child quits immediately.
> 
> If you decide to COW, you would need a second hugetlb page, which we don't have, so
> you have to crash the program.
> 
> And in hugetlb it's extremely easy to not get folio_ref_count() == 1:
> 
> hugetlb_fault() will do a folio_get(folio) before calling hugetlb_wp()!
> 
> ... so you essentially always copy.

Hmm yes there's one extra refcount. I think this is all fine, we can simply
take all of them into account when making a CoW decision.  However crashing
an userspace can be a problem for sure.

> 
> 
> At that point I walked away from that, letting vmsplice() be fixed at some point. Dave
> Howells was close at some point IIRC ...
> 
> I had some ideas about retrying until the other reference is gone (which cannot be a
> longterm GUP pin), but as vmsplice essentially does without FOLL_PIN|FOLL_LONGTERM,
> it's quit hopeless to resolve that as long as vmsplice holds longterm references the wrong
> way.
> 
> ---
> 
> One could argue that fork() with hugetlb and MAP_PRIVATE is stupid and fragile: assume
> your child MM is torn down deferred, and will unmap the hugetlb page deferred. Or assume
> you access the page concurrently with fork(). You'd have to COW and crash the program.
> BUT, there is a horribly ugly hack in hugetlb COW code where you *steal* the page form
> the child program and crash your child. I'm not making that up, it's horrible.

I didn't notice that code before; doesn't sound like a very responsible
parent..

Looks like either there come a hugetlb guru who can make a decision to
break hugetlb ABI at some point, knowing that nobody will really get
affected by it, or that's the uncharted area whoever needs to introduce
hugetlb v2.

Thanks,

-- 
Peter Xu

