Return-Path: <linuxppc-dev+bounces-11805-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FA0B46051
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 19:39:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJNr31mKnz3dKw;
	Sat,  6 Sep 2025 03:38:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757093939;
	cv=none; b=PMtFlkwtl6tYV+vdH93ElJfkeXY6butfiFd0klU4zZ91iWv3skB08OCiz9iHd2FdNbq+n2W+yKrN5X5UBdSzFx9RYHD/I7cKOk0QJvnHr/dw07SI7nkeD3Dkn5YXZKe1y5w+kkXNj0pH6DoDnvtNxiQd+E0teoLdiZqqSzY9TapLZWncuFQRTLPzkASFQk3rcvAqFKB5Ka5AeVdsVRHgjxs2SWDNvhulXywRLXcPOUCXZysGioLYVMPgpKnUeZw3W1hDy4+v95T1O1npfAZ6e3Siq30Y1Yh382543kXcDv0TNCIsDGBqg/pUsIZ0ZwKlPfRNkBclv2SjwSOXIVTlUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757093939; c=relaxed/relaxed;
	bh=Q2ZdB7VokBOK/lOhO1dUKgUR3rSn7R22gOZYkbmWGWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wl3/ftGUDvHWNHZqq1nlYIyRXkD8fK1fxtLCsF0GbshYtkFOFtwLEb8w3IyEmQqJXVLrB8fRrSPoZrGzfB5Mc3ZpRZkruJXsstPmMpZV9djGSIBSK+GAVXSxuU/Fc99GSoF/Vw8ZApjsRQZWiO3p5c6GuFijgeXO4hZwNOyLojf1c8sFB6ZcEy9gNdh2VTPzkeAY8vWG39HO5qnqEf1PD6KH3V/Ksj2HvJmYLRf+KEec5m7rvpuLwvNb/ZbkxdCVpsgUf3wiUbeUxK8TV4jowUCvbvGoZzyPdJQ7+kFyJEB8Rj5EbIpUS/VzPxosSBvRW7fUM0jhOMQD7OrISZFlfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ld3/+CXF; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ld3/+CXF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJNr21Jxzz3dKS
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Sep 2025 03:38:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7274460218;
	Fri,  5 Sep 2025 17:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA22C4CEF1;
	Fri,  5 Sep 2025 17:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757093935;
	bh=RwgI6iOiiGGaVq5ryV0ZWpJOK9YgvvrfbQAyHKlknns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ld3/+CXFzo5ZlgBaEJAAJ7n8ftGIf1vPmYVyQ1Q0lHbk30C+f/zGBCjYcCjqKGMkP
	 ws0j93C+g7AZ/Qe51tbRHlFMkxmG8V2HiTKDDiIWpTC2x67XRe77cJRX2O/0Emokq3
	 empFPEdzGq6Yu1WtRJ7c3H3VguQh/C6NxRnBxnFK+dgTB/PoKfshLNhSffqo96FEeK
	 5gqAp6J/XAgqm8C64dBl5bC3cJKCuXlyMRuLkxNADtvKhMqMkGQ2Y7tGhP772p1Ynd
	 b5DRxNZc712LsAvfWwUYrOIy6AN49OJHPTqpk5krnaWlYW3AAU/MPcrMbpxJdoJz6O
	 DAfHVEkZTDmug==
Date: Fri, 5 Sep 2025 20:38:50 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
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
Subject: Re: [PATCH v4 00/16] dma-mapping: migrate to physical address-based
 API
Message-ID: <20250905173850.GB25881@unreal>
References: <cover.1755624249.git.leon@kernel.org>
 <CGME20250829131641eucas1p2ddd687e4e8c16a2bc64a293b6364fa6f@eucas1p2.samsung.com>
 <20250829131625.GK9469@nvidia.com>
 <7557f31e-1504-4f62-b00b-70e25bb793cb@samsung.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7557f31e-1504-4f62-b00b-70e25bb793cb@samsung.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 05, 2025 at 06:20:51PM +0200, Marek Szyprowski wrote:
> On 29.08.2025 15:16, Jason Gunthorpe wrote:
> > On Tue, Aug 19, 2025 at 08:36:44PM +0300, Leon Romanovsky wrote:
> >
> >> This series does the core code and modern flows. A followup series
> >> will give the same treatment to the legacy dma_ops implementation.
> > I took a quick check over this to see that it is sane.  I think using
> > phys is an improvement for most of the dma_ops implemenations.
> >
> >    arch/sparc/kernel/pci_sun4v.c
> >    arch/sparc/kernel/iommu.c
> >      Uses __pa to get phys from the page, never touches page
> >
> >    arch/alpha/kernel/pci_iommu.c
> >    arch/sparc/mm/io-unit.c
> >    drivers/parisc/ccio-dma.c
> >    drivers/parisc/sba_iommu.c
> >      Does page_addres() and later does __pa on it. Doesn't touch struct page
> >
> >    arch/x86/kernel/amd_gart_64.c
> >    drivers/xen/swiotlb-xen.c
> >    arch/mips/jazz/jazzdma.c
> >      Immediately does page_to_phys(), never touches struct page
> >
> >    drivers/vdpa/vdpa_user/vduse_dev.c
> >      Does page_to_phys() to call iommu_map()
> >
> >    drivers/xen/grant-dma-ops.c
> >      Does page_to_pfn() and nothing else
> >
> >    arch/powerpc/platforms/ps3/system-bus.c
> >     This is a maze but I think it wants only phys and the virt is only
> >     used for debug prints.
> >
> > The above all never touch a KVA and just want a phys_addr_t.
> >
> > The below are touching the KVA somehow:
> >
> >    arch/sparc/mm/iommu.c
> >    arch/arm/mm/dma-mapping.c
> >      Uses page_address to cache flush, would be happy with phys_to_virt()
> >      and a PhysHighMem()
> >
> >    arch/powerpc/kernel/dma-iommu.c
> >    arch/powerpc/platforms/pseries/vio.c
> >     Uses iommu_map_page() which wants phys_to_virt(), doesn't touch
> >     struct page
> >
> >    arch/powerpc/platforms/pseries/ibmebus.c
> >      Returns phys_to_virt() as dma_addr_t.
> >
> > The two PPC ones are weird, I didn't figure out how that was working..
> >
> > It would be easy to make map_phys patches for about half of these, in
> > the first grouping. Doing so would also grant those arches
> > map_resource capability.
> >
> > Overall I didn't think there was any reduction in maintainability in
> > these places. Most are improvements eliminating code, and some are
> > just switching to phys_to_virt() from page_address(), which we could
> > further guard with DMA_ATTR_MMIO and a check for highmem.
> 
> Thanks for this summary.
> 
> However I would still like to get an answer for the simple question - 
> why all this work cannot be replaced by a simple use of dma_map_resource()?
> 
> I've checked the most advertised use case in 
> https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/log/?h=dmabuf-vfio 
> and I still don't see the reason why it cannot be based 
> on dma_map_resource() API? I'm aware of the little asymmetry of the 
> client calls is such case, indeed it is not preety, but this should work 
> even now:
> 
> phys = phys_vec[i].paddr;
> 
> if (is_mmio)
>      dma_map_resource(phys, len, ...);
> else
>      dma_map_page(phys_to_page(phys), offset_in_page(phys), ...);
> 
> What did I miss?

"Even now" can't work mainly because both of these interfaces don't
support p2p case (PCI_P2PDMA_MAP_BUS_ADDR).

It is unclear how to extend them without introducing new functions
and/or changing whole kernel. In PCI_P2PDMA_MAP_BUS_ADDR case, there
is no struct page, so dma_map_page() is unlikely to be possible to
extend and dma_map_resource() has no direct way to access PCI
bus_offset. In theory, it is doable, but will be layer violation as DMA
will need to rely on PCI layer for address calculations.

If we don't extend, in general case (for HMM, RDMA and NVMe) end result will be something like that:
if (...PCI_P2PDMA_MAP_BUS_ADDR)
  pci_p2pdma_bus_addr_map
else if (mmio)
  dma_map_resource
else              <- this case is not applicable to VFIO-DMABUF
  dma_map_page

In case, we will somehow extend these functions to support it, we will
lose very important optimization where we are performing one IOTLB
sync for whole DMABUF region == dma_iova_state, and I was told that
it is very large region.

  103         for (i = 0; i < priv->nr_ranges; i++) {
  <...>
  107                 } else if (dma_use_iova(state)) {
  108                         ret = dma_iova_link(attachment->dev, state,
  109                                             phys_vec[i].paddr, 0,
  110                                             phys_vec[i].len, dir, attrs);
  111                         if (ret)
  112                                 goto err_unmap_dma;
  113
  114                         mapped_len += phys_vec[i].len;
  <...>
  132         }
  133
  134         if (state && dma_use_iova(state)) {
  135                 WARN_ON_ONCE(mapped_len != priv->size);
  136                 ret = dma_iova_sync(attachment->dev, state, 0, mapped_len);

> 
> I'm not against this rework, but I would really like to know the 
> rationale. I know that the 2-step dma-mapping API also use phys 
> addresses and this is the same direction.

This series is continuation of 2-step dma-mapping API. The plan to
provide dma_map_phys() was from the beginning.

Thanks

