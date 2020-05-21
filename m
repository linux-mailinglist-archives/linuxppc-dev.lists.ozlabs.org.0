Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 295431DD224
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 17:41:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SYkF1DVqzDqrj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 01:41:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=141.146.126.78; helo=aserp2120.oracle.com;
 envelope-from=daniel.m.jordan@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=Ynhk/XlE; 
 dkim-atps=neutral
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SYff2NqJzDqjL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 01:38:01 +1000 (AEST)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04LFMc8i153674;
 Thu, 21 May 2020 15:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=r4Spg8NbR5mwKyiThKHk+kYyowBB0R04t7axGsdKwjQ=;
 b=Ynhk/XlE/b2prhMoeo56S16uIAAZbgYxZHC7p/dWVBlBoL3pDDI4kc0uln5u0l6mWOUl
 L+C1pz248BVU8ZpUTuS3kyJwq5UxldM4nXZrwyIHoIbDf4PIOR9befq6JaMV1K1UiOpB
 2iEoOBRbCOlH4d4StpU6lCJxv2vZfb0pHQFqGEdJ4jfJ4eqyRJrcV+0X1ipVslkVcIxz
 7mTivThBS5vq1yQnJSoCq4+BbcdlEjYzdpl3sSjRfnRxOA4Lji63WhUORLvy4tcXbJDF
 wmh+0rJyAmhKG8XvfXq2vINeUcTMoS1uYH+wUyLiy2A3Ozu5FJVWQDv5b0dxglRkOXbL Kg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 31284m974t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 21 May 2020 15:37:28 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04LFNHAe056066;
 Thu, 21 May 2020 15:37:28 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 312t3bggqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 May 2020 15:37:28 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04LFbKZr013731;
 Thu, 21 May 2020 15:37:20 GMT
Received: from ca-dmjordan1.us.oracle.com (/10.211.9.48)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 21 May 2020 08:37:20 -0700
Date: Thu, 21 May 2020 11:37:43 -0400
From: Daniel Jordan <daniel.m.jordan@oracle.com>
To: Alexander Duyck <alexander.duyck@gmail.com>
Subject: Re: [PATCH v2 5/7] mm: parallelize deferred_init_memmap()
Message-ID: <20200521153743.ymrwhgceazzc6ccb@ca-dmjordan1.us.oracle.com>
References: <20200520182645.1658949-1-daniel.m.jordan@oracle.com>
 <20200520182645.1658949-6-daniel.m.jordan@oracle.com>
 <CAKgT0UfWOe-_rA+o5Uh-mTKSodsv9pFvApun=oYeAsOpMpP83Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKgT0UfWOe-_rA+o5Uh-mTKSodsv9pFvApun=oYeAsOpMpP83Q@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9628
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=2 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005210113
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9628
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 mlxscore=0
 cotscore=-2147483648 impostorscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005210113
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

On Wed, May 20, 2020 at 06:29:32PM -0700, Alexander Duyck wrote:
> On Wed, May 20, 2020 at 11:27 AM Daniel Jordan
> > @@ -1814,16 +1815,44 @@ deferred_init_maxorder(u64 *i, struct zone *zone, unsigned long *start_pfn,
> >         return nr_pages;
> >  }
> >
> > +struct definit_args {
> > +       struct zone *zone;
> > +       atomic_long_t nr_pages;
> > +};
> > +
> > +static void __init
> > +deferred_init_memmap_chunk(unsigned long start_pfn, unsigned long end_pfn,
> > +                          void *arg)
> > +{
> > +       unsigned long spfn, epfn, nr_pages = 0;
> > +       struct definit_args *args = arg;
> > +       struct zone *zone = args->zone;
> > +       u64 i;
> > +
> > +       deferred_init_mem_pfn_range_in_zone(&i, zone, &spfn, &epfn, start_pfn);
> > +
> > +       /*
> > +        * Initialize and free pages in MAX_ORDER sized increments so that we
> > +        * can avoid introducing any issues with the buddy allocator.
> > +        */
> > +       while (spfn < end_pfn) {
> > +               nr_pages += deferred_init_maxorder(&i, zone, &spfn, &epfn);
> > +               cond_resched();
> > +       }
> > +
> > +       atomic_long_add(nr_pages, &args->nr_pages);
> > +}
> > +
> 
> Personally I would get rid of nr_pages entirely. It isn't worth the
> cache thrash to have this atomic variable bouncing around.

One of the things I tried to optimize was the managed_pages atomic adds in
__free_pages_core, but performance stayed the same on the biggest machine I
tested when it was done once at the end of page init instead of in every thread
for every pageblock.

I'm not sure this atomic would matter either, given it's less frequent.

> You could
> probably just have this function return void since all nr_pages is
> used for is a pr_info  statement at the end of the initialization
> which will be completely useless now anyway since we really have the
> threads running in parallel anyway.

The timestamp is still useful for observability, page init is a significant
part of kernel boot on big machines, over 10% sometimes with these patches.

It's mostly the time that matters though, I agree the number of pages is less
important and is probably worth removing just to simplify the code.  I'll do it
if no one sees a reason to keep it.

> We only really need the nr_pages logic in deferred_grow_zone in order
> to track if we have freed enough pages to allow us to go back to what
> we were doing.
>
> > @@ -1863,11 +1892,32 @@ static int __init deferred_init_memmap(void *data)
> >                 goto zone_empty;
> >
> >         /*
> > -        * Initialize and free pages in MAX_ORDER sized increments so
> > -        * that we can avoid introducing any issues with the buddy
> > -        * allocator.
> > +        * More CPUs always led to greater speedups on tested systems, up to
> > +        * all the nodes' CPUs.  Use all since the system is otherwise idle now.
> >          */
> > +       max_threads = max(cpumask_weight(cpumask), 1u);
> > +
> >         while (spfn < epfn) {
> > +               epfn_align = ALIGN_DOWN(epfn, PAGES_PER_SECTION);
> > +
> > +               if (IS_ALIGNED(spfn, PAGES_PER_SECTION) &&
> > +                   epfn_align - spfn >= PAGES_PER_SECTION) {
> > +                       struct definit_args arg = { zone, ATOMIC_LONG_INIT(0) };
> > +                       struct padata_mt_job job = {
> > +                               .thread_fn   = deferred_init_memmap_chunk,
> > +                               .fn_arg      = &arg,
> > +                               .start       = spfn,
> > +                               .size        = epfn_align - spfn,
> > +                               .align       = PAGES_PER_SECTION,
> > +                               .min_chunk   = PAGES_PER_SECTION,
> > +                               .max_threads = max_threads,
> > +                       };
> > +
> > +                       padata_do_multithreaded(&job);
> > +                       nr_pages += atomic_long_read(&arg.nr_pages);
> > +                       spfn = epfn_align;
> > +               }
> > +
> >                 nr_pages += deferred_init_maxorder(&i, zone, &spfn, &epfn);
> >                 cond_resched();
> >         }
> 
> This doesn't look right. You are basically adding threads in addition
> to calls to deferred_init_maxorder.

The deferred_init_maxorder call is there to do the remaining, non-section
aligned part of a range.  It doesn't have to be done this way.

> In addition you are spawning one
> job per section instead of per range.

That's not what's happening, all the above is doing is aligning the end of the
range down to a section.  Each thread is working on way more than a section at
a time.

> Really you should be going for
> something more along the lines of:
> 
>         while (spfn < epfn) {
>                 unsigned long epfn_align = ALIGN(epfn,
> PAGE_PER_SECTION);
>                 struct definit_args arg = { zone, ATOMIC_LONG_INIT(0)
> };
>                 struct padata_mt_job job = {
>                         .thread_fn   = deferred_init_memmap_chunk,
>                         .fn_arg      = &arg,
>                         .start       = spfn,
>                         .size        = epfn_align - spfn,
>                         .align       = PAGES_PER_SECTION,
>                         .min_chunk   = PAGES_PER_SECTION,
>                         .max_threads = max_threads,
>                 };
> 
>                 padata_do_multithreaded(&job);
> 
>                 for_each_free_mem_pfn_range_in_zone_from(i, zone,
> spfn, epfn) {
>                         if (epfn_align <= spfn)
>                                 break;
>                 }
>         }

I can see what you're getting at even though I think this can leave ranges
uninitialized.  Starting with range [a,b), b is aligned up to d and the inner
loop skips [c,e).

a    b  c d        e
|         |         |   section boundaries
[    )  [          )

We could use deferred_init_mem_pfn_range_in_zone() instead of the for_each
loop.

What I was trying to avoid by aligning down is creating a discontiguous pfn
range that get passed to padata.  We already discussed how those are handled
by the zone iterator in the thread function, but job->size can be exaggerated
to include parts of the range that are never touched.  Thinking more about it
though, it's a small fraction of the total work and shouldn't matter.

> This should accomplish the same thing, but much more efficiently.

Well, more cleanly.  I'll give it a try.

> The
> only thing you really lose is the tracking of nr_pages which really
> doesn't add anything anyway since the value could shift around
> depending on how many times deferred_grow_zone got called anyway.
> 
> Also the spfn should already be sectioned aligned, or at least be in a
> new section unrelated to the one we just scheduled, so there is no
> need for the extra checks you had.

I was doing it to be robust to future changes.  Otherwise epfn_align - spfn
could be huge when aligning down, but with aligning up it won't matter and can
be removed.
