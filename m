Return-Path: <linuxppc-dev+bounces-10128-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6C2AFA33C
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jul 2025 08:01:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bZcD04xJdz2yRD;
	Sun,  6 Jul 2025 16:00:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751781616;
	cv=none; b=dO/xPCYn95SnqDLB77ZYv24uBjcKYGyMTqua9xx2DzchjdAMkFBqUtS6ZPhOC4yZB804MwYbZLNxlsGBWObQ0MuC2cJ5Jo6n7nnI118Nbvmld4nBCZX9dfIVKS9+IbnZFLBbTey1Jt9PZ62MJ7usw1WPtSXQ5lQ794uLnd2KvhH4J7UyG7VVhEwu+xGpWxzRahqMwdNfIV/vRhS18dYrOWUxjKc3AdPtaoepPeVbvhvKCMDT+LMNcwiQ2fohzGQVpCQrr/WzkVuJkNtFZJ4QYAWlAVsftFKCqRUHO8XSiv4IsRZEA9Xn8bNg39c85oHbqMWHInbHSAKrnskcibGqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751781616; c=relaxed/relaxed;
	bh=fIoE9h1Ttmus+8dX+kExs7d3ndPa3iTpWbO6DspI45k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQ8vQvTdecOgi9qh64dmV32shyIVX9ljzpuHwXUQg/06Akrlb3PPGMqMwZ0dueq2Hl4vczcdpOooTGFA8uyvTRbiLzQQkMEplmgRbOTLcnU3NQxS17InSLaHyy9UDtR8lP5k6iWaLbG9XshPNVYkx3MH7NxkppFpaWAiLMq+WA+bQv2DhUR+jsEip3H6pCnBwPfvuWDBVJqoFSJKGfu7tH3GeKYPFH5P7ism0ZsM5IN2Ut8kSQAs7afCvHnsYoS31hQVfYd4DrS88gmusk4zp25Drdbp2sczVthfLy/lcsh0B1TgN8KqaVNr5QblmtoHp39Qd/hIt8LhepRzBtRgPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rGudv65b; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rGudv65b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bZcCy5Zmtz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jul 2025 16:00:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 697605C4B3B;
	Sun,  6 Jul 2025 06:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5853DC4CEED;
	Sun,  6 Jul 2025 06:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751781612;
	bh=6LXeYQHiR9KdMFnH25UR1nczxh0conAegX4pfPWuIkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rGudv65bW/I8lfKVqqK+2DB/GumrSqAs4KGqsf9lwb5vIM0lf5rqwLOiBIWp47ysv
	 4r0WG7tURWg1tGnjjq79aeVVQsZyXGj8cR1nXlmSb/tIyQdxWa5jBPwYgk4Ibn8/K9
	 8aclrjMylHDqCzPAf4qXddw9XneKJKYKYM0CiGX5G6xkO/XRKoQ3qrE6gYkXOWmNgu
	 3ThVFn2essmngu1U6ie6u/JjbUhg1oKvSHUs8gt+5x+lYChW6F8Iwx5TWrOW2nYZQ7
	 U+zyKgjP6FtLwjG/hLHgAU67WZV0PzQ/Jx8mTjGv1yy23vzA7uiG8kCNLs0kGzeagw
	 h+sF92nUwh5Nw==
Date: Sun, 6 Jul 2025 09:00:07 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
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
Message-ID: <20250706060007.GP6278@unreal>
References: <CGME20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf@eucas1p2.samsung.com>
 <cover.1750854543.git.leon@kernel.org>
 <35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com>
 <20250627170213.GL17401@unreal>
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
In-Reply-To: <20250627170213.GL17401@unreal>
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jun 27, 2025 at 08:02:13PM +0300, Leon Romanovsky wrote:
> On Fri, Jun 27, 2025 at 03:44:10PM +0200, Marek Szyprowski wrote:
> > On 25.06.2025 15:18, Leon Romanovsky wrote:
> > > This series refactors the DMA mapping to use physical addresses
> > > as the primary interface instead of page+offset parameters. This
> > > change aligns the DMA API with the underlying hardware reality where
> > > DMA operations work with physical addresses, not page structures.
> > >
> > > The series consists of 8 patches that progressively convert the DMA
> > > mapping infrastructure from page-based to physical address-based APIs:
> > >
> > > The series maintains backward compatibility by keeping the old
> > > page-based API as wrapper functions around the new physical
> > > address-based implementations.
> > 
> > Thanks for this rework! I assume that the next step is to add map_phys 
> > callback also to the dma_map_ops and teach various dma-mapping providers 
> > to use it to avoid more phys-to-page-to-phys conversions.
> 
> Probably Christoph will say yes, however I personally don't see any
> benefit in this. Maybe I wrong here, but all existing .map_page()
> implementation platforms don't support p2p anyway. They won't benefit
> from this such conversion.
> 
> > 
> > I only wonder if this newly introduced dma_map_phys()/dma_unmap_phys() 
> > API is also suitable for the recently discussed PCI P2P DMA? While 
> > adding a new API maybe we should take this into account?
> 
> First, immediate user (not related to p2p) is blk layer:
> https://lore.kernel.org/linux-nvme/bcdcb5eb-17ed-412f-bf5c-303079798fe2@nvidia.com/T/#m7e715697d4b2e3997622a3400243477c75cab406
> 
> +static bool blk_dma_map_direct(struct request *req, struct device *dma_dev,
> +		struct blk_dma_iter *iter, struct phys_vec *vec)
> +{
> +	iter->addr = dma_map_page(dma_dev, phys_to_page(vec->paddr),
> +			offset_in_page(vec->paddr), vec->len, rq_dma_dir(req));
> +	if (dma_mapping_error(dma_dev, iter->addr)) {
> +		iter->status = BLK_STS_RESOURCE;
> +		return false;
> +	}
> +	iter->len = vec->len;
> +	return true;
> +}
> 
> Block layer started to store phys addresses instead of struct pages and
> this phys_to_page() conversion in data-path will be avoided.

I almost completed main user of this dma_map_phys() callback. It is
rewrite of this patch [PATCH v3 3/3] vfio/pci: Allow MMIO regions to be exported through dma-buf
https://lore.kernel.org/all/20250307052248.405803-4-vivek.kasireddy@intel.com/

Whole populate_sgt()->dma_map_resource() block looks differently now and
it is relying on dma_map_phys() as we are exporting memory without
struct pages. It will be something like this:

   89         for (i = 0; i < priv->nr_ranges; i++) {
   90                 phys = pci_resource_start(priv->vdev->pdev,
   91                                           dma_ranges[i].region_index);
   92                 phys += dma_ranges[i].offset;
   93
   94                 if (priv->bus_addr) {
   95                         addr = pci_p2pdma_bus_addr_map(&p2pdma_state, phys);
   96                         fill_sg_entry(sgl, dma_ranges[i].length, addr);
   97                         sgl = sg_next(sgl);
   98                 } else if (dma_use_iova(&priv->state)) {
   99                         ret = dma_iova_link(attachment->dev, &priv->state, phys,
  100                                             priv->mapped_len,
  101                                             dma_ranges[i].length, dir, attrs);
  102                         if (ret)
  103                                 goto err_unmap_dma;
  104
  105                         priv->mapped_len += dma_ranges[i].length;
  106                 } else {
  107                         addr = dma_map_phys(attachment->dev, phys, 0,
  108                                             dma_ranges[i].length, dir, attrs);
  109                         ret = dma_mapping_error(attachment->dev, addr);
  110                         if (ret)
  111                                 goto unmap_dma_buf;
  112
  113                         fill_sg_entry(sgl, dma_ranges[i].length, addr);
  114                         sgl = sg_next(sgl);
  115                 }
  116         }
  117
  118         if (dma_use_iova(&priv->state) && !priv->bus_addr) {
  119                 ret = dma_iova_sync(attachment->dev, &pri->state, 0,
  120                                     priv->mapped_len);
  121                 if (ret)
  122                         goto err_unmap_dma;
  123
  124                 fill_sg_entry(sgl, priv->mapped_len, priv->state.addr);
  125         }

> 
> > My main concern is the lack of the source phys addr passed to the dma_unmap_phys() 
> > function and I'm aware that this might complicate a bit code conversion 
> > from old dma_map/unmap_page() API.

It is not needed for now, all p2p logic is external to DMA API.

Thanks

> > 
> > Best regards
> > -- 
> > Marek Szyprowski, PhD
> > Samsung R&D Institute Poland
> > 
> > 
> 

