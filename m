Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF20036403B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 13:08:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FP3vw3Ptrz2y88
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 21:08:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gentwo.de (client-ip=161.97.139.209; helo=gentwo.de;
 envelope-from=cl@gentwo.de; receiver=<UNKNOWN>)
X-Greylist: delayed 547 seconds by postgrey-1.36 at boromir;
 Mon, 19 Apr 2021 20:57:15 AEST
Received: from gentwo.de (vmi485042.contaboserver.net [161.97.139.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FP3fz2pjJz2xVt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 20:57:15 +1000 (AEST)
Received: by gentwo.de (Postfix, from userid 1001)
 id D7AF7B00128; Mon, 19 Apr 2021 12:48:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by gentwo.de (Postfix) with ESMTP id D4F82B00049;
 Mon, 19 Apr 2021 12:48:01 +0200 (CEST)
Date: Mon, 19 Apr 2021 12:48:01 +0200 (CEST)
From: Christoph Lameter <cl@gentwo.de>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V2] mm/page_alloc: Ensure that HUGETLB_PAGE_ORDER is less
 than MAX_ORDER
In-Reply-To: <ce4f9838-da4b-1423-4123-23c0941a2198@arm.com>
Message-ID: <alpine.DEB.2.22.394.2104191236500.777076@gentwo.de>
References: <1618199302-29335-1-git-send-email-anshuman.khandual@arm.com>
 <09284b9a-cfe1-fc49-e1f6-3cf0c1b74c76@arm.com>
 <162877dd-e6ba-d465-d301-2956bb034429@redhat.com>
 <ce4f9838-da4b-1423-4123-23c0941a2198@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1783256993-1618829281=:777076"
X-Mailman-Approved-At: Mon, 19 Apr 2021 21:08:11 +1000
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 David Hildenbrand <david@redhat.com>, Mel Gorman <mgorman@techsingularity.net>,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 "linuxppc-dev @ lists . ozlabs . org" <linuxppc-dev@lists.ozlabs.org>,
 Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1783256993-1618829281=:777076
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Mon, 19 Apr 2021, Anshuman Khandual wrote:

> >> Unfortunately the build test fails on both the platforms (powerpc and ia64)
> >> which subscribe HUGETLB_PAGE_SIZE_VARIABLE and where this check would make
> >> sense. I some how overlooked the cross compile build failure that actually
> >> detected this problem.
> >>
> >> But wondering why this assert is not holding true ? and how these platforms
> >> do not see the warning during boot (or do they ?) at mm/vmscan.c:1092 like
> >> arm64 did.
> >>
> >> static int __fragmentation_index(unsigned int order, struct contig_page_info *info)
> >> {
> >>          unsigned long requested = 1UL << order;
> >>
> >>          if (WARN_ON_ONCE(order >= MAX_ORDER))
> >>                  return 0;
> >> ....
> >>
> >> Can pageblock_order really exceed MAX_ORDER - 1 ?

You can have larger blocks but you would need to allocate multiple
contigous max order blocks or do it at boot time before the buddy
allocator is active.

What IA64 did was to do this at boot time thereby avoiding the buddy
lists. And it had a separate virtual address range and page table for the
huge pages.

Looks like the current code does these allocations via CMA which should
also bypass the buddy allocator.


> >     }
> >
> >
> > But it's kind of weird, isn't it? Let's assume we have MAX_ORDER - 1 correspond to 4 MiB and pageblock_order correspond to 8 MiB.
> >
> > Sure, we'd be grouping pages in 8 MiB chunks, however, we cannot even
> > allocate 8 MiB chunks via the buddy. So only alloc_contig_range()
> > could really grab them (IOW: gigantic pages).
>
> Right.

But then you can avoid the buddy allocator.

> > Further, we have code like deferred_free_range(), where we end up
> > calling __free_pages_core()->...->__free_one_page() with
> > pageblock_order. Wouldn't we end up setting the buddy order to
> > something > MAX_ORDER -1 on that path?
>
> Agreed.

We would need to return the supersized block to the huge page pool and not
to the buddy allocator. There is a special callback in the compound page
sos that you can call an alternate free function that is not the buddy
allocator.

>
> >
> > Having pageblock_order > MAX_ORDER feels wrong and looks shaky.
> >
> Agreed, definitely does not look right. Lets see what other folks
> might have to say on this.
>
> + Christoph Lameter <cl@linux.com>
>

It was done for a long time successfully and is running in numerous
configurations.

--8323328-1783256993-1618829281=:777076--
