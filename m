Return-Path: <linuxppc-dev+bounces-14552-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD1FC94BBF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Nov 2025 07:25:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dJxqg3qmvz2yr9;
	Sun, 30 Nov 2025 17:25:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b4"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764481674;
	cv=none; b=XRS0iIV5lXGrCzjaLlvli3mj+eQ8eW0917JA+B39/25QA7tgR5hnMcbYSl5OhcMkRfz4+lZgOXVti2MYGUjFxTt5yxqxk/PAgaN8e1Vu9ZXp3uvHDIOLsFSpSyrsIhGxEj1EHDalRnmjmZWsPDrqBpbAvvtHD/96EzyYK+/q8CXxaa/SIdy/n2z1B50avzHKKtKFvwqULxGPREnDJ28g+zVw33x4oNDuxHV3N2V8sFs1SXDTi4Xd7SX9H3Pa+qMmiw647nDnBrTbKvZW2kSLLz1IaLrMrhXUwFHP3dVAfFNCmTtWwn49NvjzABKuxwRV/F9BVMB1nNq+NPswIptKoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764481674; c=relaxed/relaxed;
	bh=WMFM3mZm3tfpZm9opFnIUzFCaL9Wf3MxVqcMizCNUwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0m7/ytGau0FrQtCl/LrfwkiQ+vBtuw+rDDVA9dPSQBwHzyfs+WMZtiYkTAHYsfwc/AHsMgwjyFrzJYMCZ+nOVHKJ/m7XGXbbPI1jV2mncrU5oEgvd+9iC2znk6EAicxvBkaILYm0g2JE10ykmDASY+H1iMQO4poXFx3GTT7wDDxMDMl5Omn6OQ/nILBmylp1dmS55CIin3XdJZQ7I/to/bVdPyyCcHy/ZYHEqA5ydt/lb+Cc+DBDZU3Pe7exAIXnGAWzhjHmNcwORpuBLmpXRkr39EI9Xr18JZjHHsBOPIPAZLMsVTTn8CHD7uyJtWGjDf/K0LG9MMDN5eicapGdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mzyQTml2; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b4; helo=out-180.mta0.migadu.com; envelope-from=shakeel.butt@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mzyQTml2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b4; helo=out-180.mta0.migadu.com; envelope-from=shakeel.butt@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 535 seconds by postgrey-1.37 at boromir; Sun, 30 Nov 2025 16:47:51 AEDT
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dJwzq4dDVz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Nov 2025 16:47:51 +1100 (AEDT)
Date: Sat, 29 Nov 2025 21:38:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764481106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WMFM3mZm3tfpZm9opFnIUzFCaL9Wf3MxVqcMizCNUwo=;
	b=mzyQTml2HeLVP/7KkNdTn5q52aTUXfw24UVLKCemUVyERxGGs6BfXps44VPj/aI0p2bjyv
	KMjhAOW0HBu+NVi0mdYKElpoDb/9sqzgpso500188A+9PEXABE1B4WxKsO43Lp+jFHQO1d
	m7bA8X9LFJTjAWdANdBQuTczyx3HC7g=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Matthew Wilcox <willy@infradead.org>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] mm: continue using per-VMA lock when retrying
 page faults after I/O
Message-ID: <6xwf5rtl6ccmeera55oz6xsubsljibxb7gfv63ul4locgfiipd@dhjxr6gqrfvh>
References: <20251127011438.6918-1-21cnbao@gmail.com>
 <aSfO7fA-04SBtTug@casper.infradead.org>
 <CAGsJ_4zyZeLtxVe56OSYQx0OcjETw2ru1FjZjBOnTszMe_MW2g@mail.gmail.com>
 <aSip2mWX13sqPW_l@casper.infradead.org>
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
In-Reply-To: <aSip2mWX13sqPW_l@casper.infradead.org>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 27, 2025 at 07:43:22PM +0000, Matthew Wilcox wrote:
> [dropping individuals, leaving only mailing lists.  please don't send
> this kind of thing to so many people in future]
> 
> On Thu, Nov 27, 2025 at 12:22:16PM +0800, Barry Song wrote:
> > On Thu, Nov 27, 2025 at 12:09 PM Matthew Wilcox <willy@infradead.org> wrote:
> > >
> > > On Thu, Nov 27, 2025 at 09:14:36AM +0800, Barry Song wrote:
> > > > There is no need to always fall back to mmap_lock if the per-VMA
> > > > lock was released only to wait for pagecache or swapcache to
> > > > become ready.
> > >
> > > Something I've been wondering about is removing all the "drop the MM
> > > locks while we wait for I/O" gunk.  It's a nice amount of code removed:
> > 
> > I think the point is that page fault handlers should avoid holding the VMA
> > lock or mmap_lock for too long while waiting for I/O. Otherwise, those
> > writers and readers will be stuck for a while.
> 
> There's a usecase some of us have been discussing off-list for a few
> weeks that our current strategy pessimises.  It's a process with
> thousands (maybe tens of thousands) of threads.  It has much more mapped
> files than it has memory that cgroups will allow it to use.  So on a
> page fault, we drop the vma lock, allocate a page of ram, kick off the
> read, sleep waiting for the folio to come uptodate, once it is return,
> expecting the page to still be there when we reenter filemap_fault.
> But it's under so much memory pressure that it's already been reclaimed
> by the time we get back to it.  So all the threads just batter the
> storage re-reading data.

I would caution against changing kernel for such usecase. Actually I
would call it a misconfigured system instead of a usecase. If a
workload is under that much memory pressure that its refaulted pages
are getting reclaimed then it means its workingset is larger than the
available memory and is thrashing. The only option here is to either
increase the memory limits or kill the workload and reschedule on the
system with enough memory available.


