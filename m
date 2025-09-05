Return-Path: <linuxppc-dev+bounces-11804-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E5CB45F54
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 18:51:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJMmn6Zvrz3dLj;
	Sat,  6 Sep 2025 02:51:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757091065;
	cv=none; b=W2hoyWAi02g23hC/sRkCDwZq2nWCeLQ0pXGA3fl20ZAUOdFf0FbsU6bc4n5y0+eW1onr3VLvAusQydzfSqHXdg44DY2y5GcP/Zmyys/yacRqancJnEqkQO/8VrnIqflNbr0r3f8R3iw8lg35tzYqjT1i++88Pm0m+3irDcRS4ZBIvxd4MgIEo59sqP2sjmHM2UGBjmYJozOfFS44RDvBVSncpX1FZ9+UozaVO6etKVqgIgXl1xFm5cRoyF7mU2neGE+mmX/grybmItiOEG85YV1ssPl43ZnF0XeHg5nVAwtFrXrFpa4W1ZWGj/ECORPuobyq5kzPR6/w5i9ibgl47g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757091065; c=relaxed/relaxed;
	bh=jPSEH+AzhLnejyJgvUoX+DOy/Gpz5ytBdInrHhyhk2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YotJH56UzX5Wki1XHPmnpk4PI9X8Z2JZm7BtcEPA1IKe6T8ZLptneW2dyRPC4j6vWwKLl2BEkm3AB/jaMASLJgaC/nbjj/egeXCQAvG7vZAOCAjINr2Tiw0Tu7IYLqOelN0uOdcSxNmyttdhpgg4ApEuLg8thNEMEJ1JcY30LOLRfZs8k1e6OcYSDfwSTrlk12yC9jGIYwlf6TRIXhMZSywjdKXl1ZyPplBmkrS86sVR14ygWna2dO0uxCX6/zFRAMP/KJ1KFYJeudPA2SaFXXX3kbezR/9uteFYNn+G3QxQnH1Lo5JHKecScXmQWSjns3Hbh7LzHKDf6q0OqwhVRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hkj6jwvL; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hkj6jwvL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJMmh1g42z3dKy
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Sep 2025 02:51:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C43F43A6C;
	Fri,  5 Sep 2025 16:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291F0C4CEF1;
	Fri,  5 Sep 2025 16:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757091058;
	bh=ed7tjh37WUsiWKbFsXU4Fz4LWP9OYuSxI0T6PtehL5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hkj6jwvLxKggBm5BaYRmXNHFJSTzS4j//v2v297B9zbvAb6zaXk3ye+d7kJpzYt+i
	 pVjGPf+glYmCMY8ZXxKqFzfErZn5vYpuxstgE5z7K6bWjnB52Zu2pWhWX8YpcE0TZ3
	 wqpQ/atJ+vA0oyDRUVNRdo8I0NXlm4wfllQDaEaUhi9U9aEo4xqnHh2mcEuBjTyxog
	 A1t4vtOjJmcxMXWsrEs0iDeQq9drkmd4Whjs7cSHTOvVKn09EIzsL7m+VCMmXlxsZx
	 LFVA53bS5HpTQKBuuE67ybcB5j6vm/3A//si20RgKUC4Z6Fe/u+7Z/FKOCjsOXLxSF
	 Mdr++eBA7BRQw==
Date: Fri, 5 Sep 2025 19:50:51 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@redhat.com>, iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>, kasan-dev@googlegroups.com,
	Keith Busch <kbusch@kernel.org>, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v5 07/16] dma-mapping: convert dma_direct_*map_page to be
 phys_addr_t based
Message-ID: <20250905165051.GA25881@unreal>
References: <cover.1756822782.git.leon@kernel.org>
 <CGME20250902144935eucas1p253de9e94315de54325cc61dea9c76490@eucas1p2.samsung.com>
 <6b2f4cb436c98d6342db69e965a5621707b9711f.1756822782.git.leon@kernel.org>
 <087e7f3d-1e0d-4efe-822f-72d16d161a60@samsung.com>
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
In-Reply-To: <087e7f3d-1e0d-4efe-822f-72d16d161a60@samsung.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 05, 2025 at 06:21:44PM +0200, Marek Szyprowski wrote:
> On 02.09.2025 16:48, Leon Romanovsky wrote:
> > From: Leon Romanovsky <leonro@nvidia.com>
> >
> > Convert the DMA direct mapping functions to accept physical addresses
> > directly instead of page+offset parameters. The functions were already
> > operating on physical addresses internally, so this change eliminates
> > the redundant page-to-physical conversion at the API boundary.
> >
> > The functions dma_direct_map_page() and dma_direct_unmap_page() are
> > renamed to dma_direct_map_phys() and dma_direct_unmap_phys() respectively,
> > with their calling convention changed from (struct page *page,
> > unsigned long offset) to (phys_addr_t phys).
> >
> > Architecture-specific functions arch_dma_map_page_direct() and
> > arch_dma_unmap_page_direct() are similarly renamed to
> > arch_dma_map_phys_direct() and arch_dma_unmap_phys_direct().
> >
> > The is_pci_p2pdma_page() checks are replaced with DMA_ATTR_MMIO checks
> > to allow integration with dma_direct_map_resource and dma_direct_map_phys()
> > is extended to support MMIO path either.
> >
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > ---
> >   arch/powerpc/kernel/dma-iommu.c |  4 +--
> >   include/linux/dma-map-ops.h     |  8 ++---
> >   kernel/dma/direct.c             |  6 ++--
> >   kernel/dma/direct.h             | 57 +++++++++++++++++++++------------
> >   kernel/dma/mapping.c            |  8 ++---
> >   5 files changed, 49 insertions(+), 34 deletions(-)

<...>

> > -	if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||
> > -	    dma_kmalloc_needs_bounce(dev, size, dir)) {
> > -		if (is_pci_p2pdma_page(page))
> > -			return DMA_MAPPING_ERROR;
> > -		if (is_swiotlb_active(dev))
> > -			return swiotlb_map(dev, phys, size, dir, attrs);
> > -
> > -		dev_WARN_ONCE(dev, 1,
> > -			     "DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
> > -			     &dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
> > -		return DMA_MAPPING_ERROR;
> > +	if (attrs & DMA_ATTR_MMIO) {
> > +		dma_addr = phys;
> > +		if (unlikely(dma_capable(dev, dma_addr, size, false)))
> 
> "!dma_capable(dev, dma_addr, size, false)" in the above line.
> 
> It took me a while to find this after noticing that this patchset breaks booting some of me test systems.

Ohh, sorry, I overlooked it. Do you expect from me v6?

Thanks

