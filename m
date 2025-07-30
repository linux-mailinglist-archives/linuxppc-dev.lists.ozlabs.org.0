Return-Path: <linuxppc-dev+bounces-10464-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 383BDB162C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 16:28:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsZMF67jHz30Vs;
	Thu, 31 Jul 2025 00:28:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753885705;
	cv=none; b=hH7/DHuw5ViWUXyVrCe3titTpsiqnXwg+xJninOVcD2tII2w/UQ2DnhgNk2a4d0RX42RQUrODpWe7hi8e+4nEhNsXeo9Zgosc97C9g+PVZWdHH5ACbpcbmKuuN9M4TLINo78IKgPKYA0+0Ns/MUx202nMUNA2r1zF4j3XATXAg78+eZ2wCZwuLLBrryyKCMS2R59rneguy4byRLFBP7NIQrj+P58BVtsUk+PjnDCiprPnFJ4qwH4I3lX+GQl3qz77scaQJlinmaWJqCOk0zOPokgbOfAnsVwYirH2498+Yxr8FEpFiQqR2TzIIckHS8QcHpriTA5CTdHfuXZdUwkiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753885705; c=relaxed/relaxed;
	bh=yXicpotvi3lyQ9AOXQWfwG3KeaAtrSGGP0WC4PeRJ0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdxEV7kap5TDvMzLFBkdTfo9giCtA+j24jI9U0W41s8JrsWJ+C8HUnLxAAfYw4CM3B8XY5ZB92p+5bP3LgBw7PY66yTL7rASv05QVh2eIbnTrUg5yKmI9wtgYo+e/MngEA4RB+1Q+WzCJafeXUHz19gHkID/6WXbMzCYA69+x7wvARLP9DCWXIsMSCJR1TqMGipFDhvbIocMveiTrvqUjBIHYk2Qfqnw9TmBFiHs4O6gjStjvSlPtliG1RsuJEicE7B+sRchiNiGCQvuggsF8iyF5cIkv19BkKJS9RJ0gpPjvkF2WjjqUfJyqSLYcxpHt+8KY+tMDVnnDq6CSKt5uw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=EPkZ2en8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org) smtp.mailfrom=ziepe.ca
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=EPkZ2en8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=jgg@ziepe.ca; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsZMD22c4z2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 00:28:23 +1000 (AEST)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4ab61ecc1e8so53617571cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 07:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1753885701; x=1754490501; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yXicpotvi3lyQ9AOXQWfwG3KeaAtrSGGP0WC4PeRJ0I=;
        b=EPkZ2en8oSeEQZPBv9jL02IFJXM8djSKZRVhPZpcDVrCYyJUqmmbnvKe10tw1o6E6J
         VsxTZJx0sf0NQ8o4T6BW8/VhORAvN6OAWo44p4Vz9/35ip+Sbf/habYG/9e2oyzZnvHJ
         91OeM/163Oc5iIpqalEJ/OvTQaow7+HwfH+ae/0pZyqXE3RYiaxLPzgNpzOyk35GUi7C
         XuFNcJIFg539Yg6OhABUJzvBDC78KZMB8EEvvp8l7qlc7sfkSBsuvEnRgSjpkNB/i/ww
         V9J3sKHcMgi6QhwQUqUW7Sq6xB90h0XyfS4gCJ8PwT/xGehgKbIXfA9+o4Jv9YON6tmA
         HCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753885701; x=1754490501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXicpotvi3lyQ9AOXQWfwG3KeaAtrSGGP0WC4PeRJ0I=;
        b=oigpLGJB262OoBKzDIbk49tzsNEkroIDj8HdMTask4tzaaznzA8eEjxMJlWtcR2ZRt
         kg9Lz1Sii0az1VFTY4pXczZ0T14CU2NJRe4I0PlvS/ZxJqVJpcdiwSfDzrs7PMu1R7G2
         57ja64LFtJORniaAPzAHunXjwe3se1hWogMm8ZDELNzqTp38CueHyARbDBrxwVhlMBMe
         mp5dUMs5tgidQLPXLjvy93YiyQGpv/yeFqmu7YwSe5OjVNV9qz/yBjP6ZfLAjTspMoJG
         U7ose+XWvNJcawiYbKOAdp8k/mswJCpgNBShmgckH/uvbs5m8Q1TdAgXrcAEqaWtCIMP
         yxiw==
X-Forwarded-Encrypted: i=1; AJvYcCVo+OV081D2HOTthOzfhYqRBozS+b+NZpoATn0k6IyrdQwyEiJ+DWsnHZQZpZxjSfDM/IJSL/FYVBZUby8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxiD8ptRdUweWJ1hS4/unTGk4n0ak9EAe8enE2ZlPaOG4zFter7
	VisJSha1xAqytvmvvgBB9QrZbRHb/AQh849UzAVRKdh2tFJWh1rIlBBHqlVWkM0E6Rk=
X-Gm-Gg: ASbGncvKtFd0U7xHV0M7SMrNzOuiRdMNgaBuwKEWwhkikmUUqvoy802iyhNi8pcXSwB
	6uxEj7ml8Id8/wSNW1zS92wNGdoF+OWEWmZzAHyX1t/47oZioX3Czg7OLWx0Dvop70Kx3WSj28P
	dpbkTDw3c+UnU1cxpjznhSuCSzPWxH3AGRV+QKyhUuzRfQJPK6N5eRtFTArqUHBzhYcXoUJhu/z
	vZfkfRaPfjoqLi8lG/dRReo6M1YMCP43JsHQqBWwfs8lKZxCh7GgjUB+lGObFyx2+ekv4/ZhLsJ
	zQSMr+9tE6Pd/J6jsIAewtk/XFl18QZqWJOKeYAEnsjR4Y/KHNw2szA/lU8Azp1x31ftOIG9Ush
	tt/QRizEGcAaeyW0CMvHMjrYzhB6QzSB3Wt6mDe1Vj/utVCmTwjogBZI9D0OggdXQBrGA
X-Google-Smtp-Source: AGHT+IHCzPfwaMM+aIDs6tu6c39/KdwhCla3PbAO01xs1vOnpsn8EpRRsdfpw4N6uvD5MCuSC49wxQ==
X-Received: by 2002:a05:622a:48:b0:4a9:cff3:68a2 with SMTP id d75a77b69052e-4aedbc3c0dbmr55369321cf.37.1753885700213;
        Wed, 30 Jul 2025 07:28:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae9963b6f9sm67178931cf.35.2025.07.30.07.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 07:28:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uh7n0-00000000RbZ-432A;
	Wed, 30 Jul 2025 11:28:18 -0300
Date: Wed, 30 Jul 2025 11:28:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>, Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	=?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, iommu@lists.linux.dev,
	virtualization@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 0/8] dma-mapping: migrate to physical address-based API
Message-ID: <20250730142818.GL26511@ziepe.ca>
References: <CGME20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf@eucas1p2.samsung.com>
 <cover.1750854543.git.leon@kernel.org>
 <35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com>
 <20250627170213.GL17401@unreal>
 <20250630133839.GA26981@lst.de>
 <69b177dc-c149-40d3-bbde-3f6bad0efd0e@samsung.com>
 <f912c446-1ae9-4390-9c11-00dce7bf0fd3@arm.com>
 <20250730134026.GQ402218@unreal>
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
In-Reply-To: <20250730134026.GQ402218@unreal>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 30, 2025 at 04:40:26PM +0300, Leon Romanovsky wrote:

> > The natural working unit for whatever replaces dma_map_page() will be
> > whatever the replacement for alloc_pages() returns, and the replacement for
> > kmap_atomic() operates on. Until that exists (and I simply cannot believe it
> > would be an unadorned physical address) there cannot be any
> > *meaningful*

alloc_pages becomes legacy.

There will be some new API 'memdesc alloc'. If I understand Matthew's
plan properly - here is a sketch of changing iommu-pages:

--- a/drivers/iommu/iommu-pages.c
+++ b/drivers/iommu/iommu-pages.c
@@ -36,9 +36,10 @@ static_assert(sizeof(struct ioptdesc) <= sizeof(struct page));
  */
 void *iommu_alloc_pages_node_sz(int nid, gfp_t gfp, size_t size)
 {
+       struct ioptdesc *desc;
        unsigned long pgcnt;
-       struct folio *folio;
        unsigned int order;
+       void *addr;
 
        /* This uses page_address() on the memory. */
        if (WARN_ON(gfp & __GFP_HIGHMEM))
@@ -56,8 +57,8 @@ void *iommu_alloc_pages_node_sz(int nid, gfp_t gfp, size_t size)
        if (nid == NUMA_NO_NODE)
                nid = numa_mem_id();
 
-       folio = __folio_alloc_node(gfp | __GFP_ZERO, order, nid);
-       if (unlikely(!folio))
+       addr = memdesc_alloc_pages(&desc, gfp | __GFP_ZERO, order, nid);
+       if (unlikely(!addr))
                return NULL;
 
        /*
@@ -73,7 +74,7 @@ void *iommu_alloc_pages_node_sz(int nid, gfp_t gfp, size_t size)
        mod_node_page_state(folio_pgdat(folio), NR_IOMMU_PAGES, pgcnt);
        lruvec_stat_mod_folio(folio, NR_SECONDARY_PAGETABLE, pgcnt);
 
-       return folio_address(folio);
+       return addr;
 }

Where the memdesc_alloc_pages() will kmalloc a 'struct ioptdesc' and
some other change so that virt_to_ioptdesc() indirects through a new
memdesc. See here:

https://kernelnewbies.org/MatthewWilcox/Memdescs

We don't end up with some kind of catch-all struct to mean 'cachable
CPU memory' anymore because every user gets their own unique "struct
XXXdesc". So the thinking has been that the phys_addr_t is the best
option. I guess the alternative would be the memdesc as a handle, but
I'm not sure that is such a good idea. 

People still express a desire to be able to do IO to cachable memory
that has a KVA through phys_to_virt but no memdesc/page allocation. I
don't know if this will happen but it doesn't seem like a good idea to
make it impossible by forcing memdesc types into low level APIs that
don't use them.

Also, the bio/scatterlist code between pin_user_pages() and DMA
mapping is consolidating physical contiguity. This runs faster if you
don't have to to page_to_phys() because everything is already
phys_addr_t.

> > progress made towards removing the struct page dependency from the DMA API.
> > If there is also a goal to kill off highmem before then, then logically we
> > should just wait for that to land, then revert back to dma_map_single()
> > being the first-class interface, and dma_map_page() can turn into a trivial
> > page_to_virt() wrapper for the long tail of caller conversions.

As I said there are many many projects related here and we can
meaningfully make progress in parts. It is not functionally harmful to
do the phys to page conversion before calling the legacy
dma_ops/SWIOTLB etc. This avoids creating patch dependencies with
highmem removal and other projects.

So long as the legacy things (highmem, dma_ops, etc) continue to work
I think it is OK to accept some obfuscation to allow the modern things
to work better. The majority flow - no highmem, no dma ops, no
swiotlb, does not require struct page. Having to do

  PTE -> phys -> page -> phys -> DMA

Does have a cost.

> The most reasonable way to prevent DMA_ATTR_SKIP_CPU_SYNC leakage is to
> introduce new DMA attribute (let's call it DMA_ATTR_MMIO for now) and
> pass it to both dma_map_phys() and dma_iova_link(). This flag will
> indicate that p2p type is PCI_P2PDMA_MAP_THRU_HOST_BRIDGE and call to
> right callbacks which will set IOMMU_MMIO flag and skip CPU sync,

So the idea is if the memory is non-cachable, no-KVA you'd call
dma_iova_link(phys_addr, DMA_ATTR_MMIO) and dma_map_phys(phys_addr,
DMA_ATTR_MMIO) ?

And then internally the dma_ops and dma_iommu would use the existing
map_page/map_resource variations based on the flag, thus ensuring that
MMIO is never kmap'd or cache flushed?

dma_map_resource is really then just
dma_map_phys(phys_addr, DMA_ATTR_MMIO)?

I like this, I think it well addresses the concerns.

Jason

