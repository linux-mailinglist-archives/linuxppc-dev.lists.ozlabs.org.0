Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5CA89FB8C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 17:29:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H46YB+to;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H46YB+to;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF6FM6PQNz3vXM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 01:29:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H46YB+to;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=H46YB+to;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF6Df6VCFz3bs0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 01:28:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712762926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ci1baLlwDbOm6Wup8/nHleUUTbOV/R7CG6mxApYjz0M=;
	b=H46YB+to2jmBuWQ8iXD81PAplnTxQhy4xP2ps2K6cIakExX1lAYR1QbCjrKkfdm14OYJuz
	zZ+wwV4coKm3fH43pOC9FYmSDcqWZUkOPVDSoiDve7YLw0A1KVNzHwh1mHsAUMy6cQpjaJ
	aFSgw0SDCJKHqubrgyjsd7QJS7qbtcI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712762926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ci1baLlwDbOm6Wup8/nHleUUTbOV/R7CG6mxApYjz0M=;
	b=H46YB+to2jmBuWQ8iXD81PAplnTxQhy4xP2ps2K6cIakExX1lAYR1QbCjrKkfdm14OYJuz
	zZ+wwV4coKm3fH43pOC9FYmSDcqWZUkOPVDSoiDve7YLw0A1KVNzHwh1mHsAUMy6cQpjaJ
	aFSgw0SDCJKHqubrgyjsd7QJS7qbtcI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-39DLB4ttPpeIKwi0AN_y5Q-1; Wed, 10 Apr 2024 11:28:44 -0400
X-MC-Unique: 39DLB4ttPpeIKwi0AN_y5Q-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4311d908f3cso29912151cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Apr 2024 08:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712762923; x=1713367723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ci1baLlwDbOm6Wup8/nHleUUTbOV/R7CG6mxApYjz0M=;
        b=nNYXaELdTuICuTy0uYyN1nq1A5Fbi8Fs8yHm0MA8l9MRhGuQTdi+OoRoWy2qOAAcn1
         gvJpeRPun4e0RmhL/29chUSchOkezjiMwQNK/8sELThHxHSYAJY19sXHhq2HT0z1EG0u
         bKR3DkQ6ha9HiUzQKN8GnkVJE+a6KYBSIH2ihHjKES/EoC5LI+SnWvQDZD8JASMQbEx8
         WW+dk7dT8y73Rz0JkPdLDkN02NHHj6XLOnxXsYT93mWqAhOyRe6smr0H3Cd7h3La0QvY
         Ex3QqLMK89FV3jUbCFphpL4Q3MKQ+/EMshKCub1qchQiCHm5tN5G0bfx92IIVV569GLs
         Aj1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzB1Ti5p2lb5rM17YHMy05htDDCnAhvLR4U50HWPyBuFI1XDUtaqlOOiUwqMFXriWt6t66J5lL3n6+8Vf2SEhs0KieFKX2+idtbWzNRQ==
X-Gm-Message-State: AOJu0YwxWDQ2ajuIt2NVDFGOVEYL6Z9Y+IJHGeZ38vkms0EdqfqdSWGj
	hXLmG06jAxUzSHNtGM62D8sPVO1wrnGUJlsytHxFbF4sfA29luM6VrJ9bO0BPpw2pl5vVR2KsPe
	J/5FT0BrwZyJqNZZDQpK65lPDrKpvQmhheuYNlrR7ASmBC3AZr+DOaX95FB4c9fk=
X-Received: by 2002:a05:6214:5090:b0:69b:ce6:271b with SMTP id kk16-20020a056214509000b0069b0ce6271bmr3168086qvb.2.1712762923247;
        Wed, 10 Apr 2024 08:28:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZs5MCkL0IJwntJvXwMvElTS5kl/yk1ExPO6tDqr2NK62DfB6pdbW0p2/DjTaMvJz9lDcKPw==
X-Received: by 2002:a05:6214:5090:b0:69b:ce6:271b with SMTP id kk16-20020a056214509000b0069b0ce6271bmr3168047qvb.2.1712762922544;
        Wed, 10 Apr 2024 08:28:42 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id ek1-20020ad45981000000b00699032e555bsm5208543qvb.127.2024.04.10.08.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 08:28:42 -0700 (PDT)
Date: Wed, 10 Apr 2024 11:28:39 -0400
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v3 00/12] mm/gup: Unify hugetlb, part 2
Message-ID: <ZhawJ-VD6DtLZ2Zm@x1n>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240322161000.GJ159172@nvidia.com>
 <ZgHJaJSpoeJVEccN@x1n>
 <20240326140252.GH6245@nvidia.com>
 <Zg8gEyE4o_VJsTmx@x1n>
 <20240405181633.GH5383@nvidia.com>
 <ZhBwVLyHr8WEKSx2@x1n>
 <20240409234355.GJ5383@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240409234355.GJ5383@nvidia.com>
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

On Tue, Apr 09, 2024 at 08:43:55PM -0300, Jason Gunthorpe wrote:
> On Fri, Apr 05, 2024 at 05:42:44PM -0400, Peter Xu wrote:
> > In short, hugetlb mappings shouldn't be special comparing to other huge pXd
> > and large folio (cont-pXd) mappings for most of the walkers in my mind, if
> > not all.  I need to look at all the walkers and there can be some tricky
> > ones, but I believe that applies in general.  It's actually similar to what
> > I did with slow gup here.
> 
> I think that is the big question, I also haven't done the research to
> know the answer.
> 
> At this point focusing on moving what is reasonable to the pXX_* API
> makes sense to me. Then reviewing what remains and making some
> decision.
> 
> > Like this series, for cont-pXd we'll need multiple walks comparing to
> > before (when with hugetlb_entry()), but for that part I'll provide some
> > performance tests too, and we also have a fallback plan, which is to detect
> > cont-pXd existance, which will also work for large folios.
> 
> I think we can optimize this pretty easy.
>  
> > > I think if you do the easy places for pXX conversion you will have a
> > > good idea about what is needed for the hard places.
> > 
> > Here IMHO we don't need to understand "what is the size of this hugetlb
> > vma"
> 
> Yeh, I never really understood why hugetlb was linked to the VMA.. The
> page table is self describing, obviously.

Attaching to vma still makes sense to me, where we should definitely avoid
a mixture of hugetlb and !hugetlb pages in a single vma - hugetlb pages are
allocated, managed, ...  totally differently.

And since hugetlb is designed as file-based (which also makes sense to me,
at least for now), it's also natural that it's vma-attached.

> 
> > or "which level of pgtable does this hugetlb vma pages locate",
> 
> Ditto
> 
> > because we may not need that, e.g., when we only want to collect some smaps
> > statistics.  "whether it's hugetlb" may matter, though. E.g. in the mm
> > walker we see a huge pmd, it can be a thp, it can be a hugetlb (when
> > hugetlb_entry removed), we may need extra check later to put things into
> > the right bucket, but for the walker itself it doesn't necessarily need
> > hugetlb_entry().
> 
> Right, places may still need to know it is part of a huge VMA because we
> have special stuff linked to that.
> 
> > > But then again we come back to power and its big list of page sizes
> > > and variety :( Looks like some there have huge sizes at the pgd level
> > > at least.
> > 
> > Yeah this is something I want to be super clear, because I may miss
> > something: we don't have real pgd pages, right?  Powerpc doesn't even
> > define p4d_leaf(), AFAICT.
> 
> AFAICT it is because it hides it all in hugepd.

IMHO one thing we can benefit from such hugepd rework is, if we can squash
all the hugepds like what Christophe does, then we push it one more layer
down, and we have a good chance all things should just work.

So again my Power brain is close to zero, but now I'm referring to what
Christophe shared in the other thread:

https://github.com/linuxppc/wiki/wiki/Huge-pages

Together with:

https://lore.kernel.org/r/288f26f487648d21fd9590e40b390934eaa5d24a.1711377230.git.christophe.leroy@csgroup.eu

Where it has:

--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -98,6 +98,7 @@ config PPC_BOOK3S_64
        select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
        select ARCH_ENABLE_SPLIT_PMD_PTLOCK
        select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
+       select ARCH_HAS_HUGEPD if HUGETLB_PAGE
        select ARCH_SUPPORTS_HUGETLBFS
        select ARCH_SUPPORTS_NUMA_BALANCING
        select HAVE_MOVE_PMD
@@ -290,6 +291,7 @@ config PPC_BOOK3S
 config PPC_E500
        select FSL_EMB_PERFMON
        bool
+       select ARCH_HAS_HUGEPD if HUGETLB_PAGE
        select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
        select PPC_SMP_MUXED_IPI
        select PPC_DOORBELL

So I think it means we have three PowerPC systems that supports hugepd
right now (besides the 8xx which Christophe is trying to drop support
there), besides 8xx we still have book3s_64 and E500.

Let's check one by one:

  - book3s_64

    - hash

      - 64K: p4d is not used, largest pgsize pgd 16G @pud level.  It
        means after squashing it'll be a bunch of cont-pmd, all good.

      - 4K: p4d also not used, largest pgsize pgd 128G, after squashed
        it'll be cont-pud. all good.

    - radix

      - 64K: largest 1G @pud, then cont-pmd after squashed. all good.

      - 4K: largest 1G @pud, then cont-pmd, all good.

  - e500 & 8xx

    - both of them use 2-level pgtables (pgd + pte), after squashed hugepd
      @pgd level they become cont-pte. all good.

I think the trick here is there'll be no pgd leaves after hugepd squashing
to lower levels, then since PowerPC seems to never have p4d, then all
things fall into pud or lower.  We seem to be all good there?

> 
> If the goal is to purge hugepd then some of the options might turn out
> to convert hugepd into huge p4d/pgd, as I understand it. It would be
> nice to have certainty on this at least.

Right.  I hope the pmd/pud plan I proposed above can already work too with
such ambicious goal too.  But review very welcomed from either you or
Christophe.

PS: I think I'll also have a closer look at Christophe's series this week
or next.

> 
> We have effectively three APIs to parse a single page table and
> currently none of the APIs can return 100% of the data for power.

Thanks,

-- 
Peter Xu

