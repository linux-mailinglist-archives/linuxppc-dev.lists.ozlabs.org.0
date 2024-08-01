Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB498944955
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 12:31:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZQH65fnDz3fVZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 20:31:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZQGk6JYtz3cj7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 20:30:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 273CCCE16AC;
	Thu,  1 Aug 2024 10:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030D1C32786;
	Thu,  1 Aug 2024 10:30:48 +0000 (UTC)
Date: Thu, 1 Aug 2024 11:30:46 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v4 2/2] dma: replace zone_dma_bits by zone_dma_limit
Message-ID: <Zqtj1iCyRJqh_xeL@arm.com>
References: <cover.1722499975.git.baruch@tkos.co.il>
 <f05178048096908a13379a61ca56f0035a5cdb2d.1722499975.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f05178048096908a13379a61ca56f0035a5cdb2d.1722499975.git.baruch@tkos.co.il>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-s390@vger.kernel.org, Ramon Fried <ramon@neureality.ai>, Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>, Will Deacon <will@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 01, 2024 at 11:25:07AM +0300, Baruch Siach wrote:
> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
> index d10613eb0f63..a6e15db9d1e7 100644
> --- a/kernel/dma/pool.c
> +++ b/kernel/dma/pool.c
> @@ -70,9 +70,10 @@ static bool cma_in_zone(gfp_t gfp)
>  	/* CMA can't cross zone boundaries, see cma_activate_area() */
>  	end = cma_get_base(cma) + size - 1;
>  	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA))
> -		return end <= DMA_BIT_MASK(zone_dma_bits);
> +		return end <= zone_dma_limit;
> +	/* Account for possible zone_dma_limit > DMA_BIT_MASK(32) */
>  	if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp & GFP_DMA32))
> -		return end <= DMA_BIT_MASK(32);
> +		return end <= DMA_BIT_MASK(32) || end <= zone_dma_limit;
>  	return true;
>  }
>  
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 043b0ecd3e8d..53595eb41922 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -450,7 +450,7 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  	if (!remap)
>  		io_tlb_default_mem.can_grow = true;
>  	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp_mask & __GFP_DMA))
> -		io_tlb_default_mem.phys_limit = DMA_BIT_MASK(zone_dma_bits);
> +		io_tlb_default_mem.phys_limit = zone_dma_limit;
>  	else if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp_mask & __GFP_DMA32))
>  		io_tlb_default_mem.phys_limit = DMA_BIT_MASK(32);

I think this needs some adjustment as the cma_in_zone() case. Maybe just
use max(DMA_BIT_MASK(32), zone_dma_limit) in both cases for consistency.

-- 
Catalin
