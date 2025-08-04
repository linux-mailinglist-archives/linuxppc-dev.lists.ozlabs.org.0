Return-Path: <linuxppc-dev+bounces-10551-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A60B19A86
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 05:38:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwMjC3szNz30Wn;
	Mon,  4 Aug 2025 13:38:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754278719;
	cv=none; b=MEVhuqgxXNK9mZ8dwJS57U8SjtHGRuhqqrveD7c7Je0RU3QtCNdcjfFfL9B+uF9SlxDOi/yNzCEW8j08qEiB+RFi3VsULpBODIQN1G12q/DK9Ei2E93CZ6ki6av5emkpG9y7+GEgtFFxLxDuwqsUaHQNKtqzlvI0b6dZhy7lMFZuWH594UDGxi08PyH8d3F7Cdr8C0udKWN6CTNA06EEy1OYYILmi004QqPSANas7sQJi/+vVUQS5/SBr5wUOSVBaIO3U/A+XwDPWMpC1TtmB1wo5Dw/bBTW+47D1LgL/YBzSR1T34FsA+WEgFi5M8aWGOYL86zuo9ROX5FDbwu6KA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754278719; c=relaxed/relaxed;
	bh=SmxoINSQKVJVK+Bn4i2QXaigutnESsGDJWcnHJouMq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hV1eiTzF3GeUKYRlIN8kKXZEZGonUT1d04VA3fm6bpJWy/from2vZ/htk5s8ngg9C7OeUxgQINo8qkMrPaI5z0bNpfmYuFknkk+zkHTWheSpKWrxsPlIA9eXEXiqS5YSRjt8OtjvM3TvOT1Sj5cGh1NJuWlYg6Z+6a0C1Cv3W7k0AKWJhLgit1gAZiQnNGc2CwhG94EJ9BW027KyaGquzfw2PHZucWssjUXvZ39yGfhm3mu245TrcjR/IuXU9pqpoFWRJjw/kIrc9AjewaUKnHXL/TZObIhQ7KRy0+6dlQRfKDy+6z0aiQf+ns8ufnUxDf0dFSXcVtvjCQMZRBK1LQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwMj44mMbz2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 13:38:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SmxoINSQKVJVK+Bn4i2QXaigutnESsGDJWcnHJouMq8=; b=vIsLKdYFH8YXGskFCYuFxM0Kri
	4LEo9ReJIfgKFC95xymdzIuZHgWmCy4G3xVF1JqLP/afdrq9I84T2Y/HuFvZL4VO6QmU21lsUX/J7
	vabemJeVXNbK57caQoIcupupdF5BH7q6dfJPU0J/aad1iPWgFP1Pta6YnAxGVC/HxIlB76K9yRSGM
	9j3b/WmA+tZKaDnoC39qDIVxVYX23JxNjVp20InQWi7XyuBDNDCOuusdG9eda9qGfK1Uki2htTbQ5
	+Xwy3IqaT9W3uDTeg3KYHyV0grcCXOdru7B95ajExnsHQEygus1gpnlTvvukrNJXtwkIJZ4HcTmaN
	wXIAK1ig==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uim1N-000000099Z0-0JOE;
	Mon, 04 Aug 2025 03:37:57 +0000
Date: Mon, 4 Aug 2025 04:37:56 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
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
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 0/8] dma-mapping: migrate to physical address-based API
Message-ID: <aJArFNkuP8DJIdMY@casper.infradead.org>
References: <CGME20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf@eucas1p2.samsung.com>
 <cover.1750854543.git.leon@kernel.org>
 <35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com>
 <20250627170213.GL17401@unreal>
 <20250630133839.GA26981@lst.de>
 <69b177dc-c149-40d3-bbde-3f6bad0efd0e@samsung.com>
 <f912c446-1ae9-4390-9c11-00dce7bf0fd3@arm.com>
 <aIupx_8vOg8wQh6w@casper.infradead.org>
 <20250803155906.GM26511@ziepe.ca>
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
In-Reply-To: <20250803155906.GM26511@ziepe.ca>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Aug 03, 2025 at 12:59:06PM -0300, Jason Gunthorpe wrote:
> Matthew, do you think it makes sense to introduce types to make this
> clearer? We have two kinds of values that a phys_addr_t can store -
> something compatible with kmap_XX_phys(), and something that isn't.

I was with you up until this point.  And then you said "What if we have
a raccoon that isn't a raccoon" and my brain derailed.

> This was recently a long discussion in ARM KVM as well which had a
> similar confusion that a phys_addr_t was actually two very different
> things inside its logic.

No.  A phys_addr_t is a phys_addr_t.  If something's abusing a
phys_addr_t to store something entirely different then THAT is what
should be using a different type.  We've defined what a phys_addr_t
is.  That was in Documentation/core-api/bus-virt-phys-mapping.rst
before Arnd removed it; to excerpt the relevant bit:

---

- CPU untranslated.  This is the "physical" address.  Physical address
  0 is what the CPU sees when it drives zeroes on the memory bus.

[...]
So why do we care about the physical address at all? We do need the physical
address in some cases, it's just not very often in normal code.  The physical
address is needed if you use memory mappings, for example, because the
"remap_pfn_range()" mm function wants the physical address of the memory to
be remapped as measured in units of pages, a.k.a. the pfn.

---

So if somebody is stuffing something else into phys_addr_t, *THAT* is
what needs to be fixed, not adding a new sub-type of phys_addr_t for
things which are actually phys_addr_t.

> We clearly have these two different ideas floating around in code,
> page tables, etc.

No.  No, we don't.  I've never heard of this asininity before.


