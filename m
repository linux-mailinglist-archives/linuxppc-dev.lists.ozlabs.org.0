Return-Path: <linuxppc-dev+bounces-10158-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C167AFC915
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jul 2025 13:00:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbynC1D66z3bTf;
	Tue,  8 Jul 2025 21:00:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751972415;
	cv=none; b=IPq8ACPK4UFq8fxpb0NwvePhcEAk5r3QTf+Rquv2/VXJ4JJ86+Z6NiOdsWrHEmML3QjQPNKt4DGnox6O+w0VMU9Ka3cJW6/xQhLgG6+MX+ytZNe3cCi90IWTBZfyjpOzf585O72nEDPdBYd13VE+pDi+sF+0uvIHvmFOPGyx+cd4QmsEUhGHvMjufZiHTgncRhn8wKvNOe7L2HWDxJoxImpjvQFnIKvKIT4c5LADP6U8+Mh7JFP/kv8WHol9kZ27kTJBrUQc+06fXD8W/ZiQ89kWSHQvHdTfO1et9TH/DWGKfL3B2CpiK+nppszYGpQ2d8N/tzPVW1M9DsUfURPDxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751972415; c=relaxed/relaxed;
	bh=5KW2QIC6jmGHY1Ben2OZlkSykbNXUJ+rne80QQUMlFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnGTvBqrUX6XcwFApX0ALOPRhR1TQTKYDje6krExrRm0KpNH5e0qW0mFfa4/VOE7yF9hpePjNOyrmYuxreHRFDk77Yk4S//U2T28yPXHy+tvkkUdwbKabBrvuSeoovYwopkGdcq5yQQdc/pSHRZqVVfpyw/qqsJUN5nJ+2wqozPxGkbpm+x7HzurI7MO4GCJX8P8Rue3WM353/Ql9w8oLJ7+f9SXPT3KUndncp2kwRGUwA5oxLE3mWqlrvkFMoVsWMT02dzBd0y7HSd+tmK8T28OF/8YP6ynIpO7AasXWADLqjYQJUqAOacYpxBTAbtx3pC7Zm3q5OwSe5HUSWqOKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uN8tyuqT; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uN8tyuqT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbynB1xrvz30Vf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jul 2025 21:00:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D46E15C5ADD;
	Tue,  8 Jul 2025 11:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91044C4CEED;
	Tue,  8 Jul 2025 11:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751972411;
	bh=5KL6rrIwnrg38ZqhQ6AB+QdSfe6gyMAir5Sbq2Mfv3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uN8tyuqTvou8o+R/mOO7Yg6n7PNJtUdZ+ZUyob65HmWP0T0yfwWgfI24HMU0r7HN3
	 Iv/9p5Qz7yq0z6SfYzlZ8O2jah6vPR/66HY1GS8sn0oA5aCV40mCMlXhKGhFKpd9Gw
	 Yph0pSgvARTjakjLBRtoXJw/nf2FE8wmvZmAoLV7nUPfAwX721yMnt+1OjeZvHyC1T
	 bIwx5u1WR+ImqC7oRVd+WsK/GJVIJvuKAO2RfbXeHnmDDi/HpwuTz/p5FXQ0xPx0Ct
	 90/w7Kne0qNm0Sy8IV//jt9S9XVQk4W6wzdF4ltAHTLfCKmlrEIN9liVg613NYj5yK
	 29yiJVGsn+RvQ==
Date: Tue, 8 Jul 2025 14:00:07 +0300
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
Message-ID: <20250708110007.GF592765@unreal>
References: <CGME20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf@eucas1p2.samsung.com>
 <cover.1750854543.git.leon@kernel.org>
 <35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com>
 <20250627170213.GL17401@unreal>
 <20250630133839.GA26981@lst.de>
 <69b177dc-c149-40d3-bbde-3f6bad0efd0e@samsung.com>
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
In-Reply-To: <69b177dc-c149-40d3-bbde-3f6bad0efd0e@samsung.com>
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 08, 2025 at 12:27:09PM +0200, Marek Szyprowski wrote:
> On 30.06.2025 15:38, Christoph Hellwig wrote:
> > On Fri, Jun 27, 2025 at 08:02:13PM +0300, Leon Romanovsky wrote:
> >>> Thanks for this rework! I assume that the next step is to add map_phys
> >>> callback also to the dma_map_ops and teach various dma-mapping providers
> >>> to use it to avoid more phys-to-page-to-phys conversions.
> >> Probably Christoph will say yes, however I personally don't see any
> >> benefit in this. Maybe I wrong here, but all existing .map_page()
> >> implementation platforms don't support p2p anyway. They won't benefit
> >> from this such conversion.
> > I think that conversion should eventually happen, and rather sooner than
> > later.
> 
> Agreed.
> 
> Applied patches 1-7 to my dma-mapping-next branch. Let me know if one 
> needs a stable branch with it.

Thanks a lot, I don't think that stable branch is needed. Realistically
speaking, my VFIO DMA work won't be merged this cycle, We are in -rc5,
it is complete rewrite from RFC version and touches pci-p2p code (to
remove dependency on struct page) in addition to VFIO, so it will take
time.

Regarding, last patch (hmm), it will be great if you can take it.
We didn't touch anything in hmm.c this cycle and have no plans to send PR.
It can safely go through your tree.

> 
> Leon, it would be great if You could also prepare an incremental patch 
> adding map_phys callback to the dma_maps_ops, so the individual 
> arch-specific dma-mapping providers can be then converted (or simplified 
> in many cases) too.

Sure, will do.

> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

