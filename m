Return-Path: <linuxppc-dev+bounces-11608-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 448CFB3FA5B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Sep 2025 11:29:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGL6d6gtgz2ypW;
	Tue,  2 Sep 2025 19:29:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756805369;
	cv=none; b=kLhwgNBp5lKthYNYuXstd4WMgBZknYf48ZDgKawODT7VgKqYV4/1UiHQjmA6lLQ0kO2TLY2J+InsffzQIYMuV1O4HJN48qQpSTn2ST+Z9/CxrsHRVvEeBmZgCZ07kStSIaqYi2QPGaNzwZPzMupRD50UsdF4vYv8rM9ABZouKvTLqaMaZAngZ3NYstr8xkQGSCcJMcWroAwdyM7axY7CxC9uxMOfDfkHzUdImRRrghIQdmS17WSA1NK4eawRjuosXKNJFnFSGJip19TH1twhf4q5/uhYZ2W7n41hDVlDQkLtzsvepzjFKCQJk1DJY4bpH5HVsVtbXScJcLZxqXHbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756805369; c=relaxed/relaxed;
	bh=RUP9TtL1xAhoFb9CaSEK22nm8Sa8vb9894tliSqEP4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sdiu6nqXqh4jKNVYqusdOQ2TjnJ1zjC84jRnxFReJ9fU8o1l3RNHuRKxASRtWC/5RIJUttx/6S2BCI5JXTBOXTadpn21P3UA+2tXFRSu4nLSP2yDU2D1Qu9CBfr/BBSCFF0HQmK4MTETdF5txYBEvksdR+2HTnO2yGvMv6r82LT7n8kJODSyOhzv49k9Z3FWacf4Z9/UqjRgyiBXsFr5O9Z86Frkaz7TdV2yQtlPofbLc1ZgbVIIqdNOq0jsEZP7fuG8OLZkOrDeXxjHIe7AjMGQvIy1T4ICsBvEgjDuFnqiuu2qjAFkoncCzNGu7w74KefpmEdK+dSUVZmuyHqTrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u+YP0LKc; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u+YP0LKc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGL6d1Gzqz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 19:29:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6678F43E7E;
	Tue,  2 Sep 2025 09:29:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793FEC4CEED;
	Tue,  2 Sep 2025 09:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756805367;
	bh=DnDVES5Jg8WrIGoMPMfvxV9Wox20mcRcpnotwmcTmTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+YP0LKc7Ca9KSEGyhHI9LWKXOpYxDkmlx+xi/d94i28PXwnbkADYdG/kMj0eiK5B
	 zd/GooYAccyXKqdo2LtN0swNMmhiizGQIgjHrkSZ2IAXK/1jBPSRk3StbcZycbdrVP
	 g5quZtmGQMVEWVOV9clnOLPmMIcFNqak1dVeFhnzWaY1VIAyIlM9TCnw1bUSOb10fT
	 eYPBFQEGyOkOZzS7K5YPtS3dmkawe2LLvJU33SWPAwVjDdMQDDLsS8LD6Qfe4rZdHI
	 wki/IP/V+av0oWZTHcazqMPHDSPlXAIhw9qhWxKa10uhggFEbKZZEF+GYaHO+zcGYb
	 634HFrNZvr1dg==
Date: Tue, 2 Sep 2025 12:29:20 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
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
Message-ID: <20250902092920.GE10073@unreal>
References: <cover.1755624249.git.leon@kernel.org>
 <CGME20250828115738eucas1p24f3c17326b318c95a5569a2c9651ff92@eucas1p2.samsung.com>
 <20250828115729.GA10073@unreal>
 <26bd901a-0812-492d-9736-4a7bb2e6d6b4@samsung.com>
 <20250901222302.GA186519@nvidia.com>
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
In-Reply-To: <20250901222302.GA186519@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 01, 2025 at 07:23:02PM -0300, Jason Gunthorpe wrote:
> On Mon, Sep 01, 2025 at 11:47:59PM +0200, Marek Szyprowski wrote:
> > I would like to give those patches a try in linux-next, but in meantime 
> > I tested it on my test farm and found a regression in dma_map_resource() 
> > handling. Namely the dma_map_resource() is no longer possible with size 
> > not aligned to kmalloc()'ed buffer, as dma_direct_map_phys() calls 
> > dma_kmalloc_needs_bounce(),
> 
> Hmm, it's this bit:
> 
> 	capable = dma_capable(dev, dma_addr, size, !(attrs & DMA_ATTR_MMIO));
> 	if (unlikely(!capable) || dma_kmalloc_needs_bounce(dev, size, dir)) {
> 		if (is_swiotlb_active(dev) && !(attrs & DMA_ATTR_MMIO))
> 			return swiotlb_map(dev, phys, size, dir, attrs);
> 
> 		goto err_overflow;
> 	}
> 
> We shouldn't be checking dma_kmalloc_needs_bounce() on mmio as there
> is no cache flushing so the "dma safe alignment" for non-coherent DMA
> does not apply.
> 
> Like you say looks good to me, and more of the surrouding code can be
> pulled in too, no sense in repeating the boolean logic:
> 
> 	if (attrs & DMA_ATTR_MMIO) {
> 		dma_addr = phys;
> 		if (unlikely(!dma_capable(dev, dma_addr, size, false)))
> 			goto err_overflow;
> 	} else {
> 		dma_addr = phys_to_dma(dev, phys);
> 		if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||

I tried to reuse same code as much as possible :(

> 		    dma_kmalloc_needs_bounce(dev, size, dir)) {
> 			if (is_swiotlb_active(dev))
> 				return swiotlb_map(dev, phys, size, dir, attrs);
> 
> 			goto err_overflow;
> 		}
> 		if (!dev_is_dma_coherent(dev) &&
> 		    !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
> 			arch_sync_dma_for_device(phys, size, dir);
> 	}

Like Jason wrote, but in diff format:

diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
index 92dbadcd3b2f..3f4792910604 100644
--- a/kernel/dma/direct.h
+++ b/kernel/dma/direct.h
@@ -85,7 +85,6 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
                unsigned long attrs)
 {
        dma_addr_t dma_addr;
-       bool capable;

        if (is_swiotlb_force_bounce(dev)) {
                if (attrs & DMA_ATTR_MMIO)
@@ -94,17 +93,19 @@ static inline dma_addr_t dma_direct_map_phys(struct device *dev,
                return swiotlb_map(dev, phys, size, dir, attrs);
        }

-       if (attrs & DMA_ATTR_MMIO)
+       if (attrs & DMA_ATTR_MMIO) {
                dma_addr = phys;
-       else
+               if (unlikely(dma_capable(dev, dma_addr, size, false)))
+                       goto err_overflow;
+       } else {
                dma_addr = phys_to_dma(dev, phys);
+               if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||
+                   dma_kmalloc_needs_bounce(dev, size, dir)) {
+                       if (is_swiotlb_active(dev))
+                               return swiotlb_map(dev, phys, size, dir, attrs);

-       capable = dma_capable(dev, dma_addr, size, !(attrs & DMA_ATTR_MMIO));
-       if (unlikely(!capable) || dma_kmalloc_needs_bounce(dev, size, dir)) {
-               if (is_swiotlb_active(dev) && !(attrs & DMA_ATTR_MMIO))
-                       return swiotlb_map(dev, phys, size, dir, attrs);
-
-               goto err_overflow;
+                       goto err_overflow;
+               }
        }

        if (!dev_is_dma_coherent(dev) &&


I created new tag with fixed code.
https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/tag/?h=dma-phys-Sep-2

Thanks

> 
> Jason

