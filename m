Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4978713421
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 12:43:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSz0469grz3fJG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 May 2023 20:43:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qtjpACU3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qtjpACU3;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSyz83q7Hz3f5c
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 May 2023 20:42:12 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9F50861072;
	Sat, 27 May 2023 10:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE11AC433EF;
	Sat, 27 May 2023 10:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685184129;
	bh=Z4TeIapFpeS1e5WxOMUpOrDg87Rxe8ydQavxJsO0vug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qtjpACU3i7FVjLT023Ddg5iX1Sm9mYGyR9BAcAldcZGtkGi1IgPSjR20Gkom5YVFi
	 9GqwWTqSe6aCGE+Jk6r1lk9ASI1BqwfpG0h2HSrQ1BaMlG84/DZwyIoKGVbNuFJs46
	 KM/CX4KgN01bs8ctMAmNzdH3P/7vJMOVtl/spQpp1NeNWLVBfmoG8tubTTHEz78nbM
	 Mi5TzSK4O/LtfJpDtvhI5QLWzSn68VROvh7bVsKVmfCA0L8DXw2EUj7uC78b19+5Rx
	 6iPjAV5tMRrgS7SBBOhhGo75UiSObo7waKqxJ5uuMYjPYcI7MRtTbdg+ba8TB9jNgs
	 b+IpYHQpsYW9A==
Date: Sat, 27 May 2023 13:41:44 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vishal Moola <vishal.moola@gmail.com>
Subject: Re: [PATCH v2 05/34] mm: add utility functions for ptdesc
Message-ID: <20230527104144.GH4967@kernel.org>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-6-vishal.moola@gmail.com>
 <20230525090956.GX4967@kernel.org>
 <CAOzc2pxSH6GhBnAoSOjvYJk2VdMDFZi3H_1qGC5Cdyp3j4AzPQ@mail.gmail.com>
 <20230525202537.GA4967@kernel.org>
 <CAOzc2pxD21mxisy-M5b_SDUv0MYwNHqaVDJnJpARuDG_HjCbOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOzc2pxD21mxisy-M5b_SDUv0MYwNHqaVDJnJpARuDG_HjCbOg@mail.gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 25, 2023 at 01:53:24PM -0700, Vishal Moola wrote:
> On Thu, May 25, 2023 at 1:26 PM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Thu, May 25, 2023 at 11:04:28AM -0700, Vishal Moola wrote:
> > > On Thu, May 25, 2023 at 2:10 AM Mike Rapoport <rppt@kernel.org> wrote:
> > > > > +
> > > > > +static inline struct ptdesc *ptdesc_alloc(gfp_t gfp, unsigned int order)
> > > > > +{
> > > > > +     struct page *page = alloc_pages(gfp | __GFP_COMP, order);
> > > > > +
> > > > > +     return page_ptdesc(page);
> > > > > +}
> > > > > +
> > > > > +static inline void ptdesc_free(struct ptdesc *pt)
> > > > > +{
> > > > > +     struct page *page = ptdesc_page(pt);
> > > > > +
> > > > > +     __free_pages(page, compound_order(page));
> > > > > +}
> > > >
> > > > The ptdesc_{alloc,free} API does not sound right to me. The name
> > > > ptdesc_alloc() implies the allocation of the ptdesc itself, rather than
> > > > allocation of page table page. The same goes for free.
> > >
> > > I'm not sure I see the difference. Could you elaborate?
> >
> > I read ptdesc_alloc() as "allocate a ptdesc" rather than as "allocate a
> > page for page table and return ptdesc pointing to that page". Seems very
> > confusing to me already and it will be even more confusion when we'll start
> > allocating actual ptdescs.
> 
> Hmm, I see what you're saying. I'm envisioning this function evolving into
> one that allocates a ptdesc later. I don't see why we would need to have both a
> page table page AND ptdesc at any point, but that may be a lack of knowledge
> from my part.

Sorry if I wasn't clear, by "page table page" I meant the page (or memory
for that matter) for actual page table rather than struct page describing
that memory.

So what we allocate here is the actual memory for the page tables and not
the memory for the metadata. That's why I think the name ptdesc_alloc is
confusing.
 
> I was thinking later, if necessary, we could make another function
> (only to be used internally) to allocate page table pages.

-- 
Sincerely yours,
Mike.
