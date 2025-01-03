Return-Path: <linuxppc-dev+bounces-4630-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5CEA00869
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 12:15:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPgwW1kCcz30TP;
	Fri,  3 Jan 2025 22:15:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735902923;
	cv=none; b=J2i6ZAJ4FxAGzs7/bK5MZCN+Tmb20+tE0NPngKNAtfXxKbX93lb3VaGxyyqQfhwktfjewevevaiyCi+s9gNERWzhTOogl6MehG5UkP3qKqzY3drvvhGIyOScMzaSdQMjc4MpDeIpPSYlV+5xXVyY1idifxWv3DDEkqNfnEm8GWgdQezWyWBek2wJmgdNMx5IdmVa1lUusSMfyLLa00IIIvYA6fMfuTTPudQav6XTtH9qYX2yVJzzCuv5lVJ2wNYqU0X3w1n7kYYNG5VamTyJjlbROhPIbEg6DjtMAh4C0rMqgSVwRkOjcR9Eyubduks72LNrnHNnt5cBtXy4PB+rSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735902923; c=relaxed/relaxed;
	bh=CPGOdr/jsXJNO5Wu3fEBGF99GP73lSQF/IKxQW4k0R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWP7d3urgsQlyl7rFgBTZQMGjZYtU1bqhkRZbPsp8HQgLP+SdvU4SZIhex1uC+AkKZVvKEyKjAnK0sKUrSe7tI2BJNmLYGv23f9OhDiow61Bwj3sXmETvEH82iJUkpPLB2+3AiDYioK0FdckXyg9+iZi0Mt2G6R7wINCy71LvCSxNvPzU+6nlizObAC3kNAFmA94JuVXleVuhULRGuVd8aLrgaaGwLPK3Gt/6opnsITj97b8f/KluKYq9R4aO787/AeLp20Kv2/zkQ5DjUFVSnJk0ZsZFDqMWkZXFjk01huMLZ9fLlEqnGJsPYm7YZQZOR/5Ys5OAvEXQxQCD3LtrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Tf96QP1n; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Tf96QP1n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPgwR2Dbgz30TC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 22:15:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CPGOdr/jsXJNO5Wu3fEBGF99GP73lSQF/IKxQW4k0R4=; b=Tf96QP1nI5zee8m+i5u3CA94h9
	3PVNNoLdvhSBk2t6LZQP6KHn1+Y/Ig9kK3lwT2hFjHWgZiqq3VK4SzqQBmD6A0e29acKD8NJDsAzp
	PBklhel75TRoOCf5VTzc00lXza1eWj1sW19Tjleo1fc/L5i9P5juDXyKQY9kHKExje/1wAmmZkrHj
	FdESUWBGwWEamk3EA3c0+gwV4EPoveBGXJo3r+051uO72Cz+2Bir5nMUbKQ2FfpEvF0r1gyVxRelx
	Ro4i1hRHlfJmHnjxqwmbD1SaYDgPeAH7HhcAneWE1IcOwP7nCEbEkp2xJxpa8O/6L3gNZJN11KFqb
	fYAj5NUQ==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tTfdp-00000005j4l-1npS;
	Fri, 03 Jan 2025 11:14:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3EDFC3003AF; Fri,  3 Jan 2025 12:14:57 +0100 (CET)
Date: Fri, 3 Jan 2025 12:14:57 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Qi Zheng <zhengqi.arch@bytedance.com>, agordeev@linux.ibm.com,
	kevin.brodsky@arm.com, tglx@linutronix.de, david@redhat.com,
	jannh@google.com, hughd@google.com, yuzhao@google.com,
	willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
	lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
	rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de,
	will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
	dave.hansen@linux.intel.com, ryan.roberts@arm.com,
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: Re: [PATCH v3 15/17] mm: pgtable: remove tlb_remove_page_ptdesc()
Message-ID: <20250103111457.GC22934@noisy.programming.kicks-ass.net>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
 <b37435768345e0fcf7ea358f69b4a71767f0f530.1734945104.git.zhengqi.arch@bytedance.com>
 <Z2_EPmOTUHhcBegW@kernel.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2_EPmOTUHhcBegW@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Dec 28, 2024 at 11:26:22AM +0200, Mike Rapoport wrote:
> On Mon, Dec 23, 2024 at 05:41:01PM +0800, Qi Zheng wrote:
> > Here we are explicitly dealing with struct page, and the following logic
> > semms strange:
> > 
> > tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));
> > 
> > tlb_remove_page_ptdesc
> > --> tlb_remove_page(tlb, ptdesc_page(pt));
> > 
> > So remove tlb_remove_page_ptdesc() and make callers call tlb_remove_page()
> > directly.
> 
> Please don't. The ptdesc wrappers are there as a part of reducing the size
> of struct page project [1]. 
> 
> For now struct ptdesc overlaps struct page, but the goal is to have them
> separate and always operate on struct ptdesc when working with page tables.

I don't see how the current idiotic code helps with that at all.

Fundamentally tlb_remove_page() is about removing *pages* as from a PTE,
there should not be a page-table anywhere near here *ever*.

Yes, some architectures use tlb_remove_page() for page-tables too, but
that is more or less an implementation detail that can be fixed.

So no, please keep these patches and kill this utterly idiotic code.

The only thing that should eventually care about page-tables is
tlb_remove_table(), and that takes a 'void *' and is expected to match
whatever __tlb_remove_table() does.

Flipping those to pgdesc, once its actually a thing, should be fairly
straight forward.

