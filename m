Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 430A91DD940
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 23:17:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SjBX0BLCzDqwD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 07:17:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=daniel.m.jordan@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=FZOdjLCa; 
 dkim-atps=neutral
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Sj8j5tVXzDqv6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 07:16:05 +1000 (AEST)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04LLDLdS189952;
 Thu, 21 May 2020 21:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=oM8Es6K5pkRd0qqsMz2to573Wv/UCPaCE9SdfSMSHsw=;
 b=FZOdjLCa719010dd3unN8HErtqPGVX3nQO8T/6FuUQesuNDThdaY21F8zdOEFO5lymBE
 mEg4P+osg9P//7jVwybpp4Mqrwg7oTxURN2ZlRhFmAe2L1a7wTZf5JU/rjqxFBEj51Oy
 jH4BXYZ+sP+0g+T6RPBR7F4C9yYPcc/H6gGxcb90k3nW26O5ySawkOR4n+FyULD7hAaR
 nf3d83sDE/MwymjR/+bUgu/GBZQa9+31niEJ2NuiBYBTuno5I3bC0TCr7eXIYTd/Db+l
 cvXNu3P+xkxb+PRZKc3Fl6x+Tts/9q8ebFQ8+xYNKYP0L6+0oSeQW2RfAukZJJewllvy 7Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 3127krjtac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 21 May 2020 21:15:14 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04LLEW4v140932;
 Thu, 21 May 2020 21:15:14 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 314gm9xv1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 May 2020 21:15:13 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04LLExav010435;
 Thu, 21 May 2020 21:14:59 GMT
Received: from ca-dmjordan1.us.oracle.com (/10.211.9.48)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 21 May 2020 14:14:58 -0700
Date: Thu, 21 May 2020 17:15:20 -0400
From: Daniel Jordan <daniel.m.jordan@oracle.com>
To: Alexander Duyck <alexander.duyck@gmail.com>
Subject: Re: [PATCH v2 5/7] mm: parallelize deferred_init_memmap()
Message-ID: <20200521211520.sqkwg4qbvx4oviob@ca-dmjordan1.us.oracle.com>
References: <20200520182645.1658949-1-daniel.m.jordan@oracle.com>
 <20200520182645.1658949-6-daniel.m.jordan@oracle.com>
 <CAKgT0UfWOe-_rA+o5Uh-mTKSodsv9pFvApun=oYeAsOpMpP83Q@mail.gmail.com>
 <20200521153743.ymrwhgceazzc6ccb@ca-dmjordan1.us.oracle.com>
 <CAKgT0Uc_LNe+KuyYxFnQ44GAfygEOQNubxwzxmTDVBvFA=WZkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKgT0Uc_LNe+KuyYxFnQ44GAfygEOQNubxwzxmTDVBvFA=WZkA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9628
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 adultscore=0 phishscore=0 mlxscore=0 spamscore=0 suspectscore=2
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005210158
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9628
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 spamscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 mlxscore=0 impostorscore=0
 suspectscore=2 mlxlogscore=999 malwarescore=0 cotscore=-2147483648
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005210158
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm <linux-mm@kvack.org>, Steven Sistare <steven.sistare@oracle.com>,
 Pavel Machek <pavel@ucw.cz>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Steffen Klassert <steffen.klassert@secunet.com>, linux-s390@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Jordan <daniel.m.jordan@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Zi Yan <ziy@nvidia.com>, Robert Elliott <elliott@hpe.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Shile Zhang <shile.zhang@linux.alibaba.com>,
 Josh Triplett <josh@joshtriplett.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kirill Tkhai <ktkhai@virtuozzo.com>, Dan Williams <dan.j.williams@intel.com>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-crypto@vger.kernel.org, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 21, 2020 at 09:46:35AM -0700, Alexander Duyck wrote:
> It is more about not bothering with the extra tracking. We don't
> really need it and having it doesn't really add much in the way of
> value.

Yeah, it can probably go.

> > > > @@ -1863,11 +1892,32 @@ static int __init deferred_init_memmap(void *data)
> > > >                 goto zone_empty;
> > > >
> > > >         /*
> > > > -        * Initialize and free pages in MAX_ORDER sized increments so
> > > > -        * that we can avoid introducing any issues with the buddy
> > > > -        * allocator.
> > > > +        * More CPUs always led to greater speedups on tested systems, up to
> > > > +        * all the nodes' CPUs.  Use all since the system is otherwise idle now.
> > > >          */
> > > > +       max_threads = max(cpumask_weight(cpumask), 1u);
> > > > +
> > > >         while (spfn < epfn) {
> > > > +               epfn_align = ALIGN_DOWN(epfn, PAGES_PER_SECTION);
> > > > +
> > > > +               if (IS_ALIGNED(spfn, PAGES_PER_SECTION) &&
> > > > +                   epfn_align - spfn >= PAGES_PER_SECTION) {
> > > > +                       struct definit_args arg = { zone, ATOMIC_LONG_INIT(0) };
> > > > +                       struct padata_mt_job job = {
> > > > +                               .thread_fn   = deferred_init_memmap_chunk,
> > > > +                               .fn_arg      = &arg,
> > > > +                               .start       = spfn,
> > > > +                               .size        = epfn_align - spfn,
> > > > +                               .align       = PAGES_PER_SECTION,
> > > > +                               .min_chunk   = PAGES_PER_SECTION,
> > > > +                               .max_threads = max_threads,
> > > > +                       };
> > > > +
> > > > +                       padata_do_multithreaded(&job);
> > > > +                       nr_pages += atomic_long_read(&arg.nr_pages);
> > > > +                       spfn = epfn_align;
> > > > +               }
> > > > +
> > > >                 nr_pages += deferred_init_maxorder(&i, zone, &spfn, &epfn);
> > > >                 cond_resched();
> > > >         }
> > >
> > > This doesn't look right. You are basically adding threads in addition
> > > to calls to deferred_init_maxorder.
> >
> > The deferred_init_maxorder call is there to do the remaining, non-section
> > aligned part of a range.  It doesn't have to be done this way.
> 
> It is also doing the advancing though isn't it?

Yes.  Not sure what you're getting at.  There's the 'spfn = epfn_align' before
so nothing is skipped.  It's true that the nonaligned part is done outside of
padata when it could be done by a thread that'd otherwise be waiting or idle,
which should be addressed in the next version.

> I think I resolved this with the fix for it I described in the other
> email. We just need to swap out spfn for epfn and make sure we align
> spfn with epfn_align. Then I think that takes care of possible skips.

Right, though your fix looks a lot like deferred_init_mem_pfn_range_in_zone().
Seems better to just use that and not repeat ourselves.  Lame that it's
starting at the beginning of the ranges every time, maybe it could be
generalized somehow, but I think it should be fast enough.

> > We could use deferred_init_mem_pfn_range_in_zone() instead of the for_each
> > loop.
> >
> > What I was trying to avoid by aligning down is creating a discontiguous pfn
> > range that get passed to padata.  We already discussed how those are handled
> > by the zone iterator in the thread function, but job->size can be exaggerated
> > to include parts of the range that are never touched.  Thinking more about it
> > though, it's a small fraction of the total work and shouldn't matter.
> 
> So the problem with aligning down is that you are going to be slowed
> up as you have to go single threaded to initialize whatever remains.
> So worst case scenario is that you have a section aligned block and
> you will process all but 1 section in parallel, and then have to
> process the remaining section one max order block at a time.

Yes, aligning up is better.

> > > This should accomplish the same thing, but much more efficiently.
> >
> > Well, more cleanly.  I'll give it a try.
> 
> I agree I am not sure if it will make a big difference on x86, however
> the more ranges you have to process the faster this approach should be
> as it stays parallel the entire time rather than having to drop out
> and process the last section one max order block at a time.

Right.
