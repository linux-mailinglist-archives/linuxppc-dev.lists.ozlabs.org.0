Return-Path: <linuxppc-dev+bounces-10491-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B8CB175B0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Jul 2025 19:37:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btGWM42tmz30Wn;
	Fri,  1 Aug 2025 03:37:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753983471;
	cv=none; b=DroHcER1+E6AOTbe3ufqsCn90JxupV0wgvqvU86dIYp3vv13al7kN/bo/qn78w/UlDhqtcGRnX9qbZIuPz7a+ACuN21zxlrdZMnGPG/wtVNJhte48Yr3j8gusPJG0J3Q8RUxY+eZT2aKzv2xr58nQL0lXucxmPtyCXpJgKbknUI51y8mvTwVakT0xNwm82ePr8VM5uLPN2u7bgMhlMhmkOeOjIpYHnBjVIX4C3ZPmSxZR9q3Nn4hWlJ+PqaJr3S1QJIrJX9H3pd6PRn1ey1cxvZOabeURqMpBdLMw4To6wzw9FpsG5GKVVnyw/HdSXBwINvoWfwrXKdQnazEtvR+Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753983471; c=relaxed/relaxed;
	bh=p81bLGAEXCTve0S2bSlDolWBTWQ0gkC1ozZDbrTl9gw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjYJdE/4PCEpVzOOCsWfEGQ0Emx4sjMjz64jUE13WvzL+5EzvSgCmpnzpbbOvFZ0tObXXlGKMInk6HvkJCEZl+/WdWtBsgk33wNWyfS6bKkpBzwvMxx4U+pvDS7nfsut9uSU1Rh8XtyOAG0pFswSUOFKtZrtnsrGjaLE6XezHJC2YNL4If3aPsf5ut1uOWolwEOBI8jYiB2C3LAzIesMALpRs6XDYNLY+k/LXxsqBOMn6/UB9KYPNuKQ+cYGmyWhtBmquRDUV0s2Hcnh0FEw2gVdkCMqcHnC4gY4y7+lx03Oq49sMc2kotEZq0A1phedmWzUggePzJtYzP5H13FRlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btGWD3Shgz306l
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 03:37:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=p81bLGAEXCTve0S2bSlDolWBTWQ0gkC1ozZDbrTl9gw=; b=iKWwh1a88Q0pAf4bvxfAD5Txdc
	EE90MjrkC8Uduz8SZ6vXiansbV8frsRKlWXThc48w73PhEqccyoX4tMljfHq+8Rhz9i2ceiiTpnNQ
	7hjsoOf+OUPX+pHbDNVQLDykrMSNBfUePqaONzx/4EcyEuzR/wo0kYwvkbEPCkU9M1bzxAWY1d2bj
	ohP5kNlKgUTJVA9ZUQHkyV+nsX3SWV9d4/YDSTVwIwFe2VNJRwzXwJ/sEIwEa9qaSxvuX+eYykKKV
	Yo/BB2cxQ9KFglR+QaHCwdd6BFZFTPe+0RrFxYMe0Vnzv0Y1POwKGhi1jrFc7WsVSY+Z/IRvpV2Bt
	sXEcrVpw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhXDL-0000000H6sX-2SDg;
	Thu, 31 Jul 2025 17:37:11 +0000
Date: Thu, 31 Jul 2025 18:37:11 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leon@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, iommu@lists.linux.dev,
	virtualization@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 0/8] dma-mapping: migrate to physical address-based API
Message-ID: <aIupx_8vOg8wQh6w@casper.infradead.org>
References: <CGME20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf@eucas1p2.samsung.com>
 <cover.1750854543.git.leon@kernel.org>
 <35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com>
 <20250627170213.GL17401@unreal>
 <20250630133839.GA26981@lst.de>
 <69b177dc-c149-40d3-bbde-3f6bad0efd0e@samsung.com>
 <f912c446-1ae9-4390-9c11-00dce7bf0fd3@arm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f912c446-1ae9-4390-9c11-00dce7bf0fd3@arm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Robin,

I don't know the DMA mapping code well and haven't reviewed this
patch set in particular, but I wanted to comment on some of the things
you say here.

> Marek, I'm surprised that even you aren't seeing why that would at best be
> pointless churn. The fundamental design of dma_map_page() operating on
> struct page is that it sits in between alloc_pages() at the caller and
> kmap_atomic() deep down in the DMA API implementation (which also subsumes
> any dependencies on having a kernel virtual address at the implementation
> end). The natural working unit for whatever replaces dma_map_page() will be
> whatever the replacement for alloc_pages() returns, and the replacement for
> kmap_atomic() operates on. Until that exists (and I simply cannot believe it
> would be an unadorned physical address) there cannot be any *meaningful*
> progress made towards removing the struct page dependency from the DMA API.
> If there is also a goal to kill off highmem before then, then logically we
> should just wait for that to land, then revert back to dma_map_single()
> being the first-class interface, and dma_map_page() can turn into a trivial
> page_to_virt() wrapper for the long tail of caller conversions.

While I'm sure we'd all love to kill off highmem, that's not a realistic
goal for another ten years or so.  There are meaningful improvements we
can make, for example pulling page tables out of highmem, but we need to
keep file data and anonymous memory in highmem, so we'll need to support
DMA to highmem for the foreseeable future.

The replacement for kmap_atomic() is already here -- it's
kmap_(atomic|local)_pfn().  If a simple wrapper like kmap_local_phys()
would make this more palatable, that would be fine by me.  Might save
a bit of messing around with calculating offsets in each caller.

As far as replacing alloc_pages() goes, some callers will still use
alloc_pages().  Others will use folio_alloc() or have used kmalloc().
Or maybe the caller won't have used any kind of page allocation because
they're doing I/O to something that isn't part of Linux's memory at all.
Part of the Grand Plan here is for Linux to catch up with Xen's ability
to do I/O to guests without allocating struct pages for every page of
memory in the guests.

You say that a physical address will need some adornment -- can you
elaborate on that for me?  It may be that I'm missing something
important here.

