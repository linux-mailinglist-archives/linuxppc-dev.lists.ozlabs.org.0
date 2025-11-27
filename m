Return-Path: <linuxppc-dev+bounces-14528-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D020C90094
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 20:43:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dHRgb0ShXz2yrQ;
	Fri, 28 Nov 2025 06:43:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764272618;
	cv=none; b=MhvYY185fQVrzguG/WBia8aOFd0Zw0f5QuCD2tXlxCr5ttGfdQRzuVBg28CAJh9146kxjvPHAe5cq9Wmv/K6nBXTy5crUKsqtuTb2zAx8zt8NQuYpbPw+/mdlpZzemnYpqvZ130qQpkIuHE0JfWkwNr9c2EPeqYFEDSy+neVrcfHALmszbdRH3z1bepp6/ME42KNgsQsLOgTDYeB/gxkQU46Lqp5eju3J0nXzJNPEJdMNLKPEmYU4ygXpASJMFaw12IugSSJRHWk00e2aC9Gzus825ynr+HcfyO9I56mAdQvygFC8+BGbdokytzag8fJW8kkCxasstcw10LE1M0xtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764272618; c=relaxed/relaxed;
	bh=JQe+g5ZvR6KeivPEwk1LBLbeVJ2/39tSJLB6nZ8TM10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D+/P+1K7oqkG8jfXnY+GJSKA6e4RXGbNj8QAQHSKt7i7zAh2/JrhU/BEOpSkTGy5nDKAK1qnXd8a3Vkg3GM0omIRc1IBsXRxCpyAJjskjrEWrnmxbAl91c8dUNFA4FPzm7s8SMYqBqWPfD64lkdj06O3hze4AYzqqNERqSj9ACtSTE33xfh+6WuAh+78jlNlpIH29v+Zy51/3FgMS+abjLawLA3tionMqOEp93Nr2C4IDzmwIuBttwduw0C0aqG8adtdXTR3cQfBpTMVuuvIrQZRC9jq86jkippOEcyUnfDnpJi43C877opuHQQGXDTlAO7ECT1Ud5t0n0KgFBVpKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dHRgR2v2pz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Nov 2025 06:43:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JQe+g5ZvR6KeivPEwk1LBLbeVJ2/39tSJLB6nZ8TM10=; b=bLoT/FglVGFQTp6ZQ56Yle6fs8
	ptqzHTWL95KXuhjuxl7XPt2gLgIOgk1wweluHsPyQ38cpDssH97HG3X9erEgS+i3X/bNy+BrSNtZX
	0Nx+1/7AoEl05gpR3MVH+L9M0aocNk7ibz8QPD2KslaJzakC7Ok8gfVaNO2YEVazZb2xxnmCHFpPF
	IGRfMUCoFpNAy2XF/qaFP5T/vm4M4wGNn6/Yp6Tnduny8zxbeHx1WOFYhR2vZjAP7vXkPR/loRBbS
	yrzAGHclbg4deP4UOsDu2voNxG+3XLZD1UdKAL75EZWsX6Dwl59DS2irr+1duhO8HSc3s96oSDErT
	Uno8xeEw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhti-0000000CBWb-3MlU;
	Thu, 27 Nov 2025 19:43:22 +0000
Date: Thu, 27 Nov 2025 19:43:22 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
Message-ID: <aSip2mWX13sqPW_l@casper.infradead.org>
References: <20251127011438.6918-1-21cnbao@gmail.com>
 <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
X-Spam-Status: No, score=1.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
	SUSPICIOUS_RECIPS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

[dropping individuals, leaving only mailing lists.  please don't send
this kind of thing to so many people in future]

On Thu, Nov 27, 2025 at 12:22:16PM +0800, Barry Song wrote:
> On Thu, Nov 27, 2025 at 12:09 PM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Thu, Nov 27, 2025 at 09:14:36AM +0800, Barry Song wrote:
> > > There is no need to always fall back to mmap_lock if the per-VMA
> > > lock was released only to wait for pagecache or swapcache to
> > > become ready.
> >
> > Something I've been wondering about is removing all the "drop the MM
> > locks while we wait for I/O" gunk.  It's a nice amount of code removed:
> 
> I think the point is that page fault handlers should avoid holding the VMA
> lock or mmap_lock for too long while waiting for I/O. Otherwise, those
> writers and readers will be stuck for a while.

There's a usecase some of us have been discussing off-list for a few
weeks that our current strategy pessimises.  It's a process with
thousands (maybe tens of thousands) of threads.  It has much more mapped
files than it has memory that cgroups will allow it to use.  So on a
page fault, we drop the vma lock, allocate a page of ram, kick off the
read, sleep waiting for the folio to come uptodate, once it is return,
expecting the page to still be there when we reenter filemap_fault.
But it's under so much memory pressure that it's already been reclaimed
by the time we get back to it.  So all the threads just batter the
storage re-reading data.

If we don't drop the vma lock, we can insert the pages in the page table
and return, maybe getting some work done before this thread is
descheduled.

This use case also manages to get utterly hung-up trying to do reclaim
today with the mmap_lock held.  SO it manifests somewhat similarly to
your problem (everybody ends up blocked on mmap_lock) but it has a
rather different root cause.

> I agree there’s room for improvement, but merely removing the "drop the MM
> locks while waiting for I/O" code is unlikely to improve performance.

I'm not sure it'd hurt performance.  The "drop mmap locks for I/O" code
was written before the VMA locking code was written.  I don't know that
it's actually helping these days.

> The change would be much more complex, so I’d prefer to land the current
> patchset first. At least this way, we avoid falling back to mmap_lock and
> causing contention or priority inversion, with minimal changes.

Uh, this is an RFC patchset.  I'm giving you my comment, which is that I
don't think this is the right direction to go in.  Any talk of "landing"
these patches is extremely premature.

