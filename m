Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD5A946F7A
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Aug 2024 17:07:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q9bqMHcK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q9bqMHcK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WcNFt48Bsz3cbW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2024 01:06:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q9bqMHcK;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q9bqMHcK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WcNF71t6dz30Wh
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Aug 2024 01:06:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722783971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SvbvcFjU58ktq+KRI5iYfFYfuh6LM7bmOviBHt03oLI=;
	b=Q9bqMHcKQ3vGFx4oo0ujLHiRdYIOGlyLmr4NbSFznzuupBzaSInM70xwWxWDxEE9wSnzmd
	MD7bxuZj+offm4sJSpsg9Kt1PmwhZVegZxa6WfdDl2LItJJ1vasIB4EBScol9lK+T5GKKe
	1D1Qyq6JHOqvpFFs36nKEJggZXKUlgM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722783971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SvbvcFjU58ktq+KRI5iYfFYfuh6LM7bmOviBHt03oLI=;
	b=Q9bqMHcKQ3vGFx4oo0ujLHiRdYIOGlyLmr4NbSFznzuupBzaSInM70xwWxWDxEE9wSnzmd
	MD7bxuZj+offm4sJSpsg9Kt1PmwhZVegZxa6WfdDl2LItJJ1vasIB4EBScol9lK+T5GKKe
	1D1Qyq6JHOqvpFFs36nKEJggZXKUlgM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-_0HEBMchMq6AZCsV1EG94g-1; Sun, 04 Aug 2024 11:06:10 -0400
X-MC-Unique: _0HEBMchMq6AZCsV1EG94g-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6b7973ab9cbso24769446d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Aug 2024 08:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722783969; x=1723388769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvbvcFjU58ktq+KRI5iYfFYfuh6LM7bmOviBHt03oLI=;
        b=vuHE0GtPC4/gJH5PtktFyZNPxvl9D1OS6SCJR+0uBKSl4gwnhcrrkutgpjR0DdRQPf
         WCySLn1xEFiH7dH0QJGTzsVXwZJM6+GiOuNy2Rdw/mxWHhNmbcrVJKAWP6TNdfrceE00
         nq6Pultwvt/btfmJR+Op3zXIu6tKQf1UX85C1MGhQsGY1hQKDaH5pMinrzYV0seEMyJT
         pPWOgsMcZSYEojF0jGhgcxXsZO+eCad5ttwwzTOju0P6dqDZnG7KDcEfVHfNLDDIsmEF
         okdrXf40+Uv3Ynekjxs0BDpOfv8ViwVt/QJWp9gPnXWMgpXSEQhMCD7sYOZQ7DjXL2RX
         Hitw==
X-Forwarded-Encrypted: i=1; AJvYcCVrZARqbOjbqLd4fIKuolDTLB6sRzcl/4xp6U0LoPwLTqrmCIaRxBlMOouQKpkJ9mX/AhEbQPRI/M3pXXjxmX0efrEsPfQEakqCM174bw==
X-Gm-Message-State: AOJu0Yybdwz8/YLlmeOhlDTTIDr+DDaqU0SZ0tUEgOzbempO8pUjOuKc
	uqluGj0NnLUrhjHwn/A9xUF7tVs1gwm8yjIWuJAOwuqJpbcn8XgrWLKXDx7wXjCZ2RbtPAor2rJ
	/J7BZWMl6Hg5wHmIucFjqAM0OhWvo1ySM8w78Rbh7akSJZR2HUVI3xlPvkMnouXw=
X-Received: by 2002:ad4:4ee1:0:b0:6b7:b2fb:7dcd with SMTP id 6a1803df08f44-6bb98408bc3mr68328726d6.8.1722783969534;
        Sun, 04 Aug 2024 08:06:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAHSZ75g6qzRAE6XgtCfAsaJachILokCvd/ttfnqNGQLClyVvD5fN6U4DiFXAwrTwReCdoYA==
X-Received: by 2002:ad4:4ee1:0:b0:6b7:b2fb:7dcd with SMTP id 6a1803df08f44-6bb98408bc3mr68328306d6.8.1722783969070;
        Sun, 04 Aug 2024 08:06:09 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c797741sm26466216d6.44.2024.08.04.08.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 08:06:08 -0700 (PDT)
Date: Sun, 4 Aug 2024 11:06:06 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 2/8] mm/mprotect: Remove NUMA_HUGE_PTE_UPDATES
Message-ID: <Zq-Y3qs5_PZW04bt@x1n>
References: <20240715192142.3241557-1-peterx@redhat.com>
 <20240715192142.3241557-3-peterx@redhat.com>
 <added2d0-b8be-4108-82ca-1367a388d0b1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <added2d0-b8be-4108-82ca-1367a388d0b1@redhat.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Alex Thorlton <athorlton@sgi.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 31, 2024 at 02:18:26PM +0200, David Hildenbrand wrote:
> On 15.07.24 21:21, Peter Xu wrote:
> > In 2013, commit 72403b4a0fbd ("mm: numa: return the number of base pages
> > altered by protection changes") introduced "numa_huge_pte_updates" vmstat
> > entry, trying to capture how many huge ptes (in reality, PMD thps at that
> > time) are marked by NUMA balancing.
> > 
> > This patch proposes to remove it for some reasons.
> > 
> > Firstly, the name is misleading. We can have more than one way to have a
> > "huge pte" at least nowadays, and that's also the major goal of this patch,
> > where it paves way for PUD handling in change protection code paths.
> > 
> > PUDs are coming not only for dax (which has already came and yet broken..),
> > but also for pfnmaps and hugetlb pages.  The name will simply stop making
> > sense when PUD will start to be involved in mprotect() world.
> > 
> > It'll also make it not reasonable either if we boost the counter for both
> > pmd/puds.  In short, current accounting won't be right when PUD comes, so
> > the scheme was only suitable at that point in time where PUD wasn't even
> > possible.
> > 
> > Secondly, the accounting was simply not right from the start as long as it
> > was also affected by other call sites besides NUMA.  mprotect() is one,
> > while userfaultfd-wp also leverages change protection path to modify
> > pgtables.  If it wants to do right it needs to check the caller but it
> > never did; at least mprotect() should be there even in 2013.
> > 
> > It gives me the impression that nobody is seriously using this field, and
> > it's also impossible to be serious.
> 
> It's weird and the implementation is ugly. The intention really was to only
> consider MM_CP_PROT_NUMA, but that apparently is not the case.
> 
> hugetlb/mprotect/... should have never been accounted.
> 
> [...]
> 
> > diff --git a/mm/vmstat.c b/mm/vmstat.c
> > index 73d791d1caad..53656227f70d 100644
> > --- a/mm/vmstat.c
> > +++ b/mm/vmstat.c
> > @@ -1313,7 +1313,6 @@ const char * const vmstat_text[] = {
> >   #ifdef CONFIG_NUMA_BALANCING
> >   	"numa_pte_updates",
> > -	"numa_huge_pte_updates",
> >   	"numa_hint_faults",
> >   	"numa_hint_faults_local",
> >   	"numa_pages_migrated",
> 
> It's a user-visible update. I assume most tools should be prepared for this
> stat missing (just like handling !CONFIG_NUMA_BALANCING).
> 
> Apparently it's documented [1][2] for some distros:

Yes, and AFAIU, [2] is a document to explain an issue relevant to numa
balancing, and I'd highly doubt [2] referenced [1] here; even the order of
the parameters are the same to be listed.

> 
> "The amount of transparent huge pages that were marked for NUMA hinting
> faults. In combination with numa_pte_updates the total address space that
> was marked can be calculated."
> 
> And now I realize that change_prot_numa() would account these PMD updates as
> well in numa_pte_updates and I am confused about the SUSE documentation: "In
> combination with numa_pte_updates" doesn't really apply, right?
> 
> At this point I don't know what's right or wrong.

Me neither, even without PUD involvement.

Talking about numa_pte_updates, hugetlb_change_protection() returns "number
of huge ptes", so one 2M hugetlb page is accounted once; while comparing to
the generic THP (change_protection_range()) it's HPAGE_PUD_NR.  It'll make
more sense to me if it sticks with PAGE_SIZE.  So all these counters look a
bit confusing.

> 
> If we'd want to fix it instead, the right thing to do would be doing the
> accounting only with MM_CP_PROT_NUMA. But then, numa_pte_updates is also
> wrongly updated I believe :(

Right.

I don't have a reason to change numa_pte_updates semantics yet so far, but
here there's the problem where numa_huge_pte_updates can be ambiguous when
there is even PUD involved.

In general, I don't know how I should treat this counter in PUD path even
if NUMA isn't involved in dax yet; it can be soon involved if we move on
with using this same path for hugetlb, or when 1G thp can be possible (with
Yu Zhao's TAO?).

One other thing I can do is I drop this patch, ignore NUMA_HUGE_PTE_UPDATES
in PUD dax processing for now.  It'll work for this series, but it'll still
be a problem later.  I figured maybe we should simply drop it from now.

Thanks,

> 
> 
> [1] https://documentation.suse.com/de-de/sles/12-SP5/html/SLES-all/cha-tuning-numactl.html
> [2] https://support.oracle.com/knowledge/Oracle%20Linux%20and%20Virtualization/2749259_1.html
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 

-- 
Peter Xu

