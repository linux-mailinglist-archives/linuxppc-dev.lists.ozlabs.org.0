Return-Path: <linuxppc-dev+bounces-10459-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5752B161B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 15:40:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsYJ539vqz30Vq;
	Wed, 30 Jul 2025 23:40:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753882837;
	cv=none; b=n60wTO8UZp000zTMzSRl1x9zqf8UAP4l6o3VEmG4AimxmFAF6PdvWWyqV9P8/bf7JmWQCml83bqTo4HNWOsZFFvp1l5Vnf3ZDjamhsykiasBOYJQNYtHzzozk48ZEgIAlmsw76pavzjcW/rZFRxUwCiMgb/5dHEAnMQYyiMHW+5hXWcFf/fKgioqXAjADM4Zxi3JxdBOUKsmEZOBK1T6Y2wlAEMGwKkjdavm8o6UzMYtXK1wiaIDB/f7WiPJyGSQJq/hsGoCGSgkiVzXaqx17tkPYZDSWOcSzADtPJXwrMRp5aKTjho2Dj7YGSGhPr6EyfjTW4hXupFGpAe0QnN8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753882837; c=relaxed/relaxed;
	bh=DwI8HW24x7jyl46fjynmA/WxmX0LnPGEQIHuMkllTKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JLG+S5owFR+dDTyoCMl83SjvVejcPDmZ5bmPF7JnEyfwKclrxQzDpDP6I7PhqVRWzLkt9yMBSeskKU7uRHU8iTmzZEJO9vxKrFBEiM2f6OZh7LUoq4puSn+flrpDS+1CNGpZDtUU7npmyYQbo71If4XDdnPGei71I2TRwlGwokL7QMsG9GqGFuZKrM/IOgn8UV/9OaKCLVV7rmrYlT9CDrJY0A1JHKsqgIzEFsWlo6Gj8LemGiGFGa2bxKz9xKEJe/E8a6ku8eLQjx1aYUomVOlehB+M/m3lLTeqaKHWhxe8aTEi9MhFntsBMwpb1vcHMrw6w++oDJabBYNBDOM53Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m8TgLaML; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m8TgLaML;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsYJ40qc5z30RK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 23:40:35 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 67A16A5525C;
	Wed, 30 Jul 2025 13:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640CCC4CEE7;
	Wed, 30 Jul 2025 13:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753882833;
	bh=r3n99v7PlKiifLXLh9htJtFm2A7cf2OiYGh/qh9Hb1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m8TgLaMLadOIyx04mZ9ZYnn4myaayZRK7kgYZVWg3h0VvggYJqipkE7m8kihbxwWL
	 9jKp14tTw38zaqtxLOs4+wPXQpdk5H5YuytkfRtotal19ho19vtLcN8uhZvhuvLRPX
	 42c7rY/aM1/egztvkzXplhf+9bGFcggtgtx61kTgzCaXar98rSFW3YWyXa/FQaWlYW
	 McArBA1HJxfYyEE59+8qhXBclPjUsdyQKbgOD5cwFnbRV+ycZ6W1VlL0iyN2sxk4Qa
	 lAa5NhJYsRATLyxRQb00fyrj5qoDoGRC6J9qWpf+W0rI4zJpZixNNNgOGnHgjjxYGp
	 gwqKIvjy1EGBw==
Date: Wed, 30 Jul 2025 16:40:26 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
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
Message-ID: <20250730134026.GQ402218@unreal>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 30, 2025 at 12:11:32PM +0100, Robin Murphy wrote:
> On 2025-07-08 11:27 am, Marek Szyprowski wrote:
> > On 30.06.2025 15:38, Christoph Hellwig wrote:
> > > On Fri, Jun 27, 2025 at 08:02:13PM +0300, Leon Romanovsky wrote:
> > > > > Thanks for this rework! I assume that the next step is to add map_phys
> > > > > callback also to the dma_map_ops and teach various dma-mapping providers
> > > > > to use it to avoid more phys-to-page-to-phys conversions.
> > > > Probably Christoph will say yes, however I personally don't see any
> > > > benefit in this. Maybe I wrong here, but all existing .map_page()
> > > > implementation platforms don't support p2p anyway. They won't benefit
> > > > from this such conversion.
> > > I think that conversion should eventually happen, and rather sooner than
> > > later.
> > 
> > Agreed.
> > 
> > Applied patches 1-7 to my dma-mapping-next branch. Let me know if one
> > needs a stable branch with it.
> 
> As the maintainer of iommu-dma, please drop the iommu-dma patch because it
> is broken. It does not in any way remove the struct page dependency from
> iommu-dma, it merely hides it so things can crash more easily in
> circumstances that clearly nobody's bothered to test.
> 
> > Leon, it would be great if You could also prepare an incremental patch
> > adding map_phys callback to the dma_maps_ops, so the individual
> > arch-specific dma-mapping providers can be then converted (or simplified
> > in many cases) too.
> 
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
> 
> Simply obfuscating the struct page dependency today by dressing it up as a
> phys_addr_t with implicit baggage is not not in any way helpful. It only
> makes the code harder to understand and more bug-prone. Despite the
> disingenuous claims, it is quite blatantly the opposite of "efficient" for
> callers to do extra work to throw away useful information with
> page_to_phys(), and the implementation then have to re-derive that
> information with pfn_valid()/phys_to_page().
> 
> And by "bug-prone" I also include greater distractions like this misguided
> idea that the same API could somehow work for non-memory addresses too, so
> then everyone can move on bikeshedding VFIO while overlooking the
> fundamental flaws in the whole premise. I mean, besides all the issues I've
> already pointed out in that regard, not least the glaring fact that it's
> literally just a worse version of *an API we already have*, as DMA API
> maintainer do you *really* approve of a design that depends on callers
> abusing DMA_ATTR_SKIP_CPU_SYNC, yet will still readily blow up if they did
> then call a dma_sync op?

Robin, Marek

I would like to ask you to do not drop this series and allow me to
gradually change the code during my VFIO DMABUF adventure.

The most reasonable way to prevent DMA_ATTR_SKIP_CPU_SYNC leakage is to
introduce new DMA attribute (let's call it DMA_ATTR_MMIO for now) and
pass it to both dma_map_phys() and dma_iova_link(). This flag will
indicate that p2p type is PCI_P2PDMA_MAP_THRU_HOST_BRIDGE and call to
right callbacks which will set IOMMU_MMIO flag and skip CPU sync,

dma_map_phys() isn't entirely wrong, it just needs an extra tweaks.

Thanks

> 
> Thanks,
> Robin.
> 

