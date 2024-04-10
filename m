Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 357AE8A00F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 21:59:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D/pED3XP;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D/pED3XP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFDF20KyLz3vZw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 05:59:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D/pED3XP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D/pED3XP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFDDK4Nh9z3d2B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 05:58:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712779133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxs+2ga91aRZGeZs4inMwPcuYTjJzWrBvKW8/ZIuNzA=;
	b=D/pED3XPzuVAx3i/ucgy3FKgEoQczaorNR0kiIi5ViBSexiRTmvR3+mF898M0p2oxsCNTv
	7uNrrnb58HrzP8Hyms9fs7+D7cgQnAMVA3nVIHfwzwt4ervIQ+E3adZkBXVOOY8fY23nfo
	UlB9/G10hGJ+WV2O0rkcY5Uk3t8XvqU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712779133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxs+2ga91aRZGeZs4inMwPcuYTjJzWrBvKW8/ZIuNzA=;
	b=D/pED3XPzuVAx3i/ucgy3FKgEoQczaorNR0kiIi5ViBSexiRTmvR3+mF898M0p2oxsCNTv
	7uNrrnb58HrzP8Hyms9fs7+D7cgQnAMVA3nVIHfwzwt4ervIQ+E3adZkBXVOOY8fY23nfo
	UlB9/G10hGJ+WV2O0rkcY5Uk3t8XvqU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-OUu8LlFsOU-e0Zkprtl2-Q-1; Wed, 10 Apr 2024 15:58:51 -0400
X-MC-Unique: OUu8LlFsOU-e0Zkprtl2-Q-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-69b147e856aso15026916d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 12:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712779131; x=1713383931;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxs+2ga91aRZGeZs4inMwPcuYTjJzWrBvKW8/ZIuNzA=;
        b=MrpHuG1In7S4rqmwKbv48CvAFZamKb71F7sGPzdK2Hj4EA1a+iELoY9EohPmDofgSZ
         Xm0ViYl/pAa28qXfV7E7RdQfqRASsO3Dm9ytBaWOCJdS8PpcVJvd6G3/MTrIRmkjJH2A
         tHGAARUsQbmLnHReH+kOEpmB/tazrEULXQQeBNKAdf28Qvzq8HzxLOiTgXVz2iBesE1E
         UvE7q1/p0d+fn39MP8Psnu8bz8LA4FxuFDeIkK6HSkdNWsh3xECDja/MJ9WIg+pSayt5
         UtKuHuimnBMu8wO8aK62I5dqSY8ZTB+ZwfduDRF/Zxs87sD3rpe06BKBFHJGaNR1TJjn
         Yy7A==
X-Forwarded-Encrypted: i=1; AJvYcCV7C0r8So3alzy/XRwAOBMlDkS7uQscYWaVO2otRmJYdIb9+kLwTWdcU/c6TAIMzZALPE+f6PvLr26oyp9uUCYjC/S+2NR1rOKMS3rCig==
X-Gm-Message-State: AOJu0Yy39qXkCv8exgQ6qGtSup+IBtFAMtHOyjpTY3OfsHE8OPLWevU+
	wXfoYYJ2Uw2rDixHvI3gsR3vlAdzL/QFj9Kal3i0t/CBxuKnfmunywjHKhBNQw32fiMU3ZhBNca
	ETooq/s/+61Rf5xsbMKW5QORJSdi4M2KiWGTCODba98x6xTUksV847A4VmM9qGbU=
X-Received: by 2002:a05:620a:4bc9:b0:78d:7760:e797 with SMTP id sw9-20020a05620a4bc900b0078d7760e797mr2835611qkn.2.1712779130643;
        Wed, 10 Apr 2024 12:58:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv1bdfgwWalbeb7W8lw1wQ8AyOawE9AJrFWRW0xu4CX1VzWDIy7HrETiPCNEoM1hdJNWYFiA==
X-Received: by 2002:a05:620a:4bc9:b0:78d:7760:e797 with SMTP id sw9-20020a05620a4bc900b0078d7760e797mr2835572qkn.2.1712779129838;
        Wed, 10 Apr 2024 12:58:49 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id vy23-20020a05620a491700b0078d66e2ac1bsm1043qkn.61.2024.04.10.12.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 12:58:49 -0700 (PDT)
Date: Wed, 10 Apr 2024 15:58:47 -0400
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 00/12] mm/gup: Unify hugetlb, part 2
Message-ID: <Zhbvd9WZzWl3IA8Y@x1n>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240322161000.GJ159172@nvidia.com>
 <ZgHJaJSpoeJVEccN@x1n>
 <20240326140252.GH6245@nvidia.com>
 <Zg8gEyE4o_VJsTmx@x1n>
 <20240405181633.GH5383@nvidia.com>
 <ZhBwVLyHr8WEKSx2@x1n>
 <20240409234355.GJ5383@nvidia.com>
 <ZhawJ-VD6DtLZ2Zm@x1n>
 <7b75c4db-9dbe-4ff1-b649-06a9218ae0aa@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <7b75c4db-9dbe-4ff1-b649-06a9218ae0aa@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mike Rapoport <rp
 pt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 10, 2024 at 04:30:41PM +0000, Christophe Leroy wrote:
> 
> 
> Le 10/04/2024 à 17:28, Peter Xu a écrit :
> > On Tue, Apr 09, 2024 at 08:43:55PM -0300, Jason Gunthorpe wrote:
> >> On Fri, Apr 05, 2024 at 05:42:44PM -0400, Peter Xu wrote:
> >>> In short, hugetlb mappings shouldn't be special comparing to other huge pXd
> >>> and large folio (cont-pXd) mappings for most of the walkers in my mind, if
> >>> not all.  I need to look at all the walkers and there can be some tricky
> >>> ones, but I believe that applies in general.  It's actually similar to what
> >>> I did with slow gup here.
> >>
> >> I think that is the big question, I also haven't done the research to
> >> know the answer.
> >>
> >> At this point focusing on moving what is reasonable to the pXX_* API
> >> makes sense to me. Then reviewing what remains and making some
> >> decision.
> >>
> >>> Like this series, for cont-pXd we'll need multiple walks comparing to
> >>> before (when with hugetlb_entry()), but for that part I'll provide some
> >>> performance tests too, and we also have a fallback plan, which is to detect
> >>> cont-pXd existance, which will also work for large folios.
> >>
> >> I think we can optimize this pretty easy.
> >>   
> >>>> I think if you do the easy places for pXX conversion you will have a
> >>>> good idea about what is needed for the hard places.
> >>>
> >>> Here IMHO we don't need to understand "what is the size of this hugetlb
> >>> vma"
> >>
> >> Yeh, I never really understood why hugetlb was linked to the VMA.. The
> >> page table is self describing, obviously.
> > 
> > Attaching to vma still makes sense to me, where we should definitely avoid
> > a mixture of hugetlb and !hugetlb pages in a single vma - hugetlb pages are
> > allocated, managed, ...  totally differently.
> > 
> > And since hugetlb is designed as file-based (which also makes sense to me,
> > at least for now), it's also natural that it's vma-attached.
> > 
> >>
> >>> or "which level of pgtable does this hugetlb vma pages locate",
> >>
> >> Ditto
> >>
> >>> because we may not need that, e.g., when we only want to collect some smaps
> >>> statistics.  "whether it's hugetlb" may matter, though. E.g. in the mm
> >>> walker we see a huge pmd, it can be a thp, it can be a hugetlb (when
> >>> hugetlb_entry removed), we may need extra check later to put things into
> >>> the right bucket, but for the walker itself it doesn't necessarily need
> >>> hugetlb_entry().
> >>
> >> Right, places may still need to know it is part of a huge VMA because we
> >> have special stuff linked to that.
> >>
> >>>> But then again we come back to power and its big list of page sizes
> >>>> and variety :( Looks like some there have huge sizes at the pgd level
> >>>> at least.
> >>>
> >>> Yeah this is something I want to be super clear, because I may miss
> >>> something: we don't have real pgd pages, right?  Powerpc doesn't even
> >>> define p4d_leaf(), AFAICT.
> >>
> >> AFAICT it is because it hides it all in hugepd.
> > 
> > IMHO one thing we can benefit from such hugepd rework is, if we can squash
> > all the hugepds like what Christophe does, then we push it one more layer
> > down, and we have a good chance all things should just work.
> > 
> > So again my Power brain is close to zero, but now I'm referring to what
> > Christophe shared in the other thread:
> > 
> > https://github.com/linuxppc/wiki/wiki/Huge-pages
> > 
> > Together with:
> > 
> > https://lore.kernel.org/r/288f26f487648d21fd9590e40b390934eaa5d24a.1711377230.git.christophe.leroy@csgroup.eu
> > 
> > Where it has:
> > 
> > --- a/arch/powerpc/platforms/Kconfig.cputype
> > +++ b/arch/powerpc/platforms/Kconfig.cputype
> > @@ -98,6 +98,7 @@ config PPC_BOOK3S_64
> >          select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
> >          select ARCH_ENABLE_SPLIT_PMD_PTLOCK
> >          select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
> > +       select ARCH_HAS_HUGEPD if HUGETLB_PAGE
> >          select ARCH_SUPPORTS_HUGETLBFS
> >          select ARCH_SUPPORTS_NUMA_BALANCING
> >          select HAVE_MOVE_PMD
> > @@ -290,6 +291,7 @@ config PPC_BOOK3S
> >   config PPC_E500
> >          select FSL_EMB_PERFMON
> >          bool
> > +       select ARCH_HAS_HUGEPD if HUGETLB_PAGE
> >          select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
> >          select PPC_SMP_MUXED_IPI
> >          select PPC_DOORBELL
> > 
> > So I think it means we have three PowerPC systems that supports hugepd
> > right now (besides the 8xx which Christophe is trying to drop support
> > there), besides 8xx we still have book3s_64 and E500.
> > 
> > Let's check one by one:
> > 
> >    - book3s_64
> > 
> >      - hash
> > 
> >        - 64K: p4d is not used, largest pgsize pgd 16G @pud level.  It
> >          means after squashing it'll be a bunch of cont-pmd, all good.
> > 
> >        - 4K: p4d also not used, largest pgsize pgd 128G, after squashed
> >          it'll be cont-pud. all good.
> > 
> >      - radix
> > 
> >        - 64K: largest 1G @pud, then cont-pmd after squashed. all good.
> > 
> >        - 4K: largest 1G @pud, then cont-pmd, all good.
> > 
> >    - e500 & 8xx
> > 
> >      - both of them use 2-level pgtables (pgd + pte), after squashed hugepd
> >        @pgd level they become cont-pte. all good.
> 
> e500 has two modes: 32 bits and 64 bits.
> 
> For 32 bits:
> 
> 8xx is the only one handling it through HW-assisted pagetable walk hence 
> requiring a 2-level whatever the pagesize is.

Hmm I think maybe finally I get it..

I think the confusion came from when I saw there's always such level-2
table described in Figure 8-5 of the manual:

https://www.nxp.com/docs/en/reference-manual/MPC860UM.pdf

So I suppose you meant for 8M, the PowerPC 8xx system hardware will be
aware of such 8M pgtable (from level-1's entry, where it has bit 28-29 set
011b), then it won't ever read anything starting from "Level-2 Descriptor
1" (but only read the only entry "Level-2 Descriptor 0"), so fundamentally
hugepd format must look like such for 8xx?

But then perhaps it's still compatible with cont-pte because the rest
entries (pte index 1+) will simply be ignored by the hardware?

> 
> On e500 it is all software so pages 2M and larger should be cont-PGD (by 
> the way I'm a bit puzzled that on arches that have only 2 levels, ie PGD 
> and PTE, the PGD entries are populated by a function called PMD_populate()).

Yeah.. I am also wondering whether pgd_populate() could also work there
(perhaps with some trivial changes, or maybe not even needed..), as when
p4d/pud/pmd levels are missing, linux should just do something like an
enforced cast from pgd_t* -> pmd_t* in this case.

I think currently they're already not pgd, as __find_linux_pte() already
skipped pgd unconditionally:

	pgdp = pgdir + pgd_index(ea);
	p4dp = p4d_offset(pgdp, ea);

> 
> Current situation for 8xx is illustrated here: 
> https://github.com/linuxppc/wiki/wiki/Huge-pages#8xx
> 
> I also tried to better illustrate e500/32 here: 
> https://github.com/linuxppc/wiki/wiki/Huge-pages#e500
> 
> For 64 bits:
> We have PTE/PMD/PUD/PGD, no P4D
> 
> See arch/powerpc/include/asm/nohash/64/pgtable-4k.h

We don't have anything that is above pud in this category, right?  That's
what I read from your wiki (and thanks for providing that in the first
place; helps a lot for me to understand how it works on PowerPC).

I want to make sure if I can move on without caring on p4d/pgd leafs like
what we do right now, even after if we can remove hugepd for good, in this
case since p4d always missing, then it's about whether "pud|pmd|pte_leaf()"
can also cover the pgd ones when that day comes, iiuc.

Thanks,

> 
> 
> > 
> > I think the trick here is there'll be no pgd leaves after hugepd squashing
> > to lower levels, then since PowerPC seems to never have p4d, then all
> > things fall into pud or lower.  We seem to be all good there?
> > 
> >>
> >> If the goal is to purge hugepd then some of the options might turn out
> >> to convert hugepd into huge p4d/pgd, as I understand it. It would be
> >> nice to have certainty on this at least.
> > 
> > Right.  I hope the pmd/pud plan I proposed above can already work too with
> > such ambicious goal too.  But review very welcomed from either you or
> > Christophe.
> > 
> > PS: I think I'll also have a closer look at Christophe's series this week
> > or next.
> > 
> >>
> >> We have effectively three APIs to parse a single page table and
> >> currently none of the APIs can return 100% of the data for power.
> > 
> > Thanks,
> > 

-- 
Peter Xu

