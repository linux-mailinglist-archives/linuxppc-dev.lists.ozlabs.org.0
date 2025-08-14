Return-Path: <linuxppc-dev+bounces-11007-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D693B26577
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 14:35:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2l7l52RLz30T9;
	Thu, 14 Aug 2025 22:35:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755174915;
	cv=none; b=HkXlXMrfRs3LZ5de07xjB/CBVem29s47V+E8xFz0g+9XSdYEDY/QHc94YxqZMLhJJCwmESgZFEuhrpSX1Z4NjCm8zYRu9s80pglpPsa6CK1llGQJQF3ELG5QgQ6Yl3qvktNFtVtE3XUQ7MbUGqTE6yKrD7EiZebm9ttX16MdBYRAtI+89hOVne4HWpYXJXZikD8KmEt4xcFHP8RBlGXc9hg+8BzdzsUE8obLP6QRdqNowGHQzxBVTpW3F5rN7aFPNhn0BK1SPA6F84Dyk4rglP4o5kw0clX6ZS6a7dCDSlWXh0zWJbyjN8DfHdyu1bk8cbDbwY9rmz4cBAEOEUH4Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755174915; c=relaxed/relaxed;
	bh=B3LuiEZXTU5HOjRdk69N6t/53G6b/PJMIeTc2G5XpW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEk/YiOoYrAizm9KF4lJ/ax35cR2tlgdrXxq3/lhp9a2kZUUGYb3rUOGqQFsvE8gc0K92igI5Sk+V1JN4bSHCcwgU4tSvgP859eKSpd5l4O1TP0U6+dXHYfKv82VFJiK8DNeJBdzsjZIHaDFjOLV0962DCBByIzxBNI9XH31bbenFKVXIcHbUfM0OlzPGPUQBjk/fdzvGqii5h9ARmrq9a6fCVGsPmdFE809rlAkfRfdbOeytIDI/gfLDdT7rEJZPMQy4Ao0tV/6eRwCI4FxUgL8N14ihF1J9r4eGyS5gUGPsPFTyXK1LAttbqRud97uPJHZccQtJPL2CzjW4Uo12A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N2g2BIJ8; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N2g2BIJ8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2l7k1mhRz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 22:35:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2039F40C46;
	Thu, 14 Aug 2025 12:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3623FC4CEED;
	Thu, 14 Aug 2025 12:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755174912;
	bh=5hXrpmcmtYiZJx4oU8qkI207P6Gx3hYundw5EKylrIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2g2BIJ8YPB3KdUqlIQ+3sf88XYTAU5YzXsxCIMkq+b9inEW2vgp9A4ivccGvjwfF
	 AV/wNRHN7Rl4BZfB83b4YqKem1VH+FiuolX5SiQ0hmKku6kJ9fzYlnSHRYR/hZfo4A
	 t7RgKyvSz54/20bp9OQxBJ3FdHTZ28zI3/O5nihwLrWH4XxMFsh7ImLJrid7kdNvXc
	 dxHzSoTZ0eAkBFydpLdrAEROqaFVHC+xn4DDTCz/hN4fLyFBvzVlWYglA0CvtcModo
	 8sk1zeTQvWBfTVENe6sc6PZjsbCDpigaPftEIsijKrs4a0DqSYC9HgT0MWUqY4ie5R
	 dAHYa4zIponFg==
Date: Thu, 14 Aug 2025 15:35:06 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 08/16] kmsan: convert kmsan_handle_dma to use physical
 addresses
Message-ID: <20250814123506.GD310013@unreal>
References: <cover.1754292567.git.leon@kernel.org>
 <5b40377b621e49ff4107fa10646c828ccc94e53e.1754292567.git.leon@kernel.org>
 <20250807122115.GH184255@nvidia.com>
 <20250813150718.GB310013@unreal>
 <20250814121316.GC699432@nvidia.com>
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
In-Reply-To: <20250814121316.GC699432@nvidia.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 14, 2025 at 09:13:16AM -0300, Jason Gunthorpe wrote:
> On Wed, Aug 13, 2025 at 06:07:18PM +0300, Leon Romanovsky wrote:
> > > >  /* Helper function to handle DMA data transfers. */
> > > > -void kmsan_handle_dma(struct page *page, size_t offset, size_t size,
> > > > +void kmsan_handle_dma(phys_addr_t phys, size_t size,
> > > >  		      enum dma_data_direction dir)
> > > >  {
> > > >  	u64 page_offset, to_go, addr;
> > > > +	struct page *page;
> > > > +	void *kaddr;
> > > >  
> > > > -	if (PageHighMem(page))
> > > > +	if (!pfn_valid(PHYS_PFN(phys)))
> > > >  		return;
> > > 
> > > Not needed, the caller must pass in a phys that is kmap
> > > compatible. Maybe just leave a comment. FWIW today this is also not
> > > checking for P2P or DEVICE non-kmap struct pages either, so it should
> > > be fine without checks.
> > 
> > It is not true as we will call to kmsan_handle_dma() unconditionally in
> > dma_map_phys(). The reason to it is that kmsan_handle_dma() is guarded
> > with debug kconfig options and cost of pfn_valid() can be accommodated
> > in that case. It gives more clean DMA code.
> 
> Then check attrs here, not pfn_valid.

attrs are not available in kmsan_handle_dma(). I can add it if you prefer.

> 
> > So let's keep this patch as is.
> 
> Still need to fix the remarks you clipped, do not check PageHighMem
> just call kmap_local_pfn(). All thie PageHighMem stuff is new to this
> patch and should not be here, it is the wrong way to use highmem.

Sure, thanks

> 
> Jason
> 

