Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 512DF5ADA4E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 22:36:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MM0f81qSmz3bq5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 06:36:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UY/kLXhS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=94.23.1.103; helo=out0.migadu.com; envelope-from=kent.overstreet@linux.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UY/kLXhS;
	dkim-atps=neutral
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MM0dX3rbSz2xrX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Sep 2022 06:35:28 +1000 (AEST)
Date: Mon, 5 Sep 2022 16:35:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1662410110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OpP1uXm6ca6XBc1ONEJL5gkifMHj5fs70rHCFRmvOy8=;
	b=UY/kLXhSCop8V5EbyM6Vo2PNPn4IQk8/GFRnAap21SYUxPj2i6gjs8KI50f80Fsp8Xa6FE
	uuVJigYWXX7+vuoCs4T9565L2O1YZd4x8iWg9nweGuKJUkJg7Zaus5YpeaFA7mCLzRdbg2
	1pMuKrhGTAly+U+OkQj6pwMjKTI/v3w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [RFC PATCH RESEND 00/28] per-VMA locks proposal
Message-ID: <20220905203503.tqtr36fsfg4guk4j@moria.home.lan>
References: <20220901173516.702122-1-surenb@google.com>
 <YxXsQKoQ0URIRuKi@dhcp22.suse.cz>
 <CAJuCfpG3bMLzNhP5wt8my8j7_9wW=darLegd6WPV6tddtCKGAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpG3bMLzNhP5wt8my8j7_9wW=darLegd6WPV6tddtCKGAA@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
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
Cc: Michel Lespinasse <michel@lespinasse.org>, Joel Fernandes <joelaf@google.com>, Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Xu <peterx@redhat.com>, dhowells@redhat.com, linux-mm <linux-mm@kvack.org>, Jerome Glisse <jglisse@google.com>, Davidlohr Bueso <dave@stgolabs.net>, Minchan Kim <minchan@google.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kernel-team <kernel-team@android.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, Andy Lutomirski <luto@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, LKML <linux-kerne
 l@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 05, 2022 at 11:32:48AM -0700, Suren Baghdasaryan wrote:
> On Mon, Sep 5, 2022 at 5:32 AM 'Michal Hocko' via kernel-team
> <kernel-team@android.com> wrote:
> >
> > Unless I am missing something, this is not based on the Maple tree
> > rewrite, right? Does the change in the data structure makes any
> > difference to the approach? I remember discussions at LSFMM where it has
> > been pointed out that some issues with the vma tree are considerably
> > simpler to handle with the maple tree.
> 
> Correct, this does not use the Maple tree yet but once Maple tree
> transition happens and it supports RCU-safe lookups, my code in
> find_vma_under_rcu() becomes really simple.
> 
> >
> > On Thu 01-09-22 10:34:48, Suren Baghdasaryan wrote:
> > [...]
> > > One notable way the implementation deviates from the proposal is the way
> > > VMAs are marked as locked. Because during some of mm updates multiple
> > > VMAs need to be locked until the end of the update (e.g. vma_merge,
> > > split_vma, etc).
> >
> > I think it would be really helpful to spell out those issues in a greater
> > detail. Not everybody is aware of those vma related subtleties.
> 
> Ack. I'll expand the description of the cases when multiple VMAs need
> to be locked in the same update. The main difficulties are:
> 1. Multiple VMAs might need to be locked within one
> mmap_write_lock/mmap_write_unlock session (will call it an update
> transaction).
> 2. Figuring out when it's safe to unlock a previously locked VMA is
> tricky because that might be happening in different functions and at
> different call levels.
> 
> So, instead of the usual lock/unlock pattern, the proposed solution
> marks a VMA as locked and provides an efficient way to:
> 1. Identify locked VMAs.
> 2. Unlock all locked VMAs in bulk.
> 
> We also postpone unlocking the locked VMAs until the end of the update
> transaction, when we do mmap_write_unlock. Potentially this keeps a
> VMA locked for longer than is absolutely necessary but it results in a
> big reduction of code complexity.

Correct me if I'm wrong, but it looks like any time multiple VMAs need to be
locked we need mmap_lock anyways, which is what makes your approach so sweet.

If however we ever want to lock multiple VMAs without taking mmap_lock, then
deadlock avoidance algorithms aren't that bad - there's the ww_mutex approach,
which is simple and works well when there isn't much expected contention (the
advantage of the ww_mutex approach is that it doesn't have to track all held
locks). I've also written full cycle detection; that approcah gets you fewer
restarts, at the cost of needing a list of all currently held locks.
