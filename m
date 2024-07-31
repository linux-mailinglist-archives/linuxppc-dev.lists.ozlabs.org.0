Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AB3943500
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 19:26:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYzY51MNgz3dXP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 03:26:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYzXg6ptLz2y8n
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 03:26:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BA8762521;
	Wed, 31 Jul 2024 17:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 718B9C116B1;
	Wed, 31 Jul 2024 17:26:22 +0000 (UTC)
Date: Wed, 31 Jul 2024 18:26:20 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v3 2/3] dma-mapping: replace zone_dma_bits by
 zone_dma_limit
Message-ID: <ZqpzvHXBHXMt9IAZ@arm.com>
References: <cover.1722249878.git.baruch@tkos.co.il>
 <053fa4806a2c63efcde80caca473a8b670a2701c.1722249878.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <053fa4806a2c63efcde80caca473a8b670a2701c.1722249878.git.baruch@tkos.co.il>
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

On Mon, Jul 29, 2024 at 01:51:25PM +0300, Baruch Siach wrote:
> From: Catalin Marinas <catalin.marinas@arm.com>
> 
> Hardware DMA limit might not be power of 2. When RAM range starts above
> 0, say 4GB, DMA limit of 30 bits should end at 5GB. A single high bit
> can not encode this limit.
> 
> Use direct phys_addr_t limit address for DMA zone limit.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

You should add your Co-developed-by line, the patch evolved a bit from
initial my partial diff.

> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 9b5ab6818f7f..870fd967c610 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -114,36 +114,28 @@ static void __init arch_reserve_crashkernel(void)
>  				    low_size, high);
>  }
>  
> -/*
> - * Return the maximum physical address for a zone accessible by the given bits
> - * limit. If DRAM starts above 32-bit, expand the zone to the maximum
> - * available memory, otherwise cap it at 32-bit.
> - */
> -static phys_addr_t __init max_zone_phys(unsigned int zone_bits)
> +static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
>  {
> -	phys_addr_t zone_mask = DMA_BIT_MASK(zone_bits);
> -	phys_addr_t phys_start = memblock_start_of_DRAM();
> -
> -	if (phys_start > U32_MAX)
> -		zone_mask = PHYS_ADDR_MAX;
> -	else if (phys_start > zone_mask)
> -		zone_mask = U32_MAX;
> +	/* We have RAM in low 32-bit area, keep DMA zone there */
> +	if (memblock_start_of_DRAM() < U32_MAX)
> +		zone_limit = min(U32_MAX, zone_limit);

Does this matter anymore? Or is it to keep ZONE_DMA below (or equal to)
the ZONE_DMA32 limit?

Anyway, since this patch is about replacing zone_dma_bits with
zone_dma_limit, we should not introduce functional changes. AFAICT, we
need zone_limit to be set to memblock_end_of_DRAM() when phys_start is
above U32_MAX. You can do the functional change in a subsequent patch
once all the other refactoring has been handled.

>  
> -	return min(zone_mask, memblock_end_of_DRAM() - 1) + 1;
> +	return min(zone_limit, memblock_end_of_DRAM() - 1) + 1;
>  }
[...]
> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> index edbe13d00776..98b7d8015043 100644
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@ -12,7 +12,7 @@
>  #include <linux/mem_encrypt.h>
>  #include <linux/swiotlb.h>
>  
> -extern unsigned int zone_dma_bits;
> +extern phys_addr_t zone_dma_limit;
>  
>  /*
>   * Record the mapping of CPU physical to DMA addresses for a given region.
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 3b4be4ca3b08..3dbc0b89d6fb 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -20,7 +20,7 @@
>   * it for entirely different regions. In that case the arch code needs to
>   * override the variable below for dma-direct to work properly.
>   */
> -unsigned int zone_dma_bits __ro_after_init = 24;
> +phys_addr_t zone_dma_limit __ro_after_init = DMA_BIT_MASK(24);
>  
>  static inline dma_addr_t phys_to_dma_direct(struct device *dev,
>  		phys_addr_t phys)
> @@ -580,7 +580,7 @@ int dma_direct_supported(struct device *dev, u64 mask)
>  	 * part of the check.
>  	 */
>  	if (IS_ENABLED(CONFIG_ZONE_DMA))
> -		min_mask = min_t(u64, min_mask, DMA_BIT_MASK(zone_dma_bits));
> +		min_mask = min_t(u64, min_mask, zone_dma_limit);
>  	return mask >= phys_to_dma_unencrypted(dev, min_mask);
>  }
>  
> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
> index d10613eb0f63..410a7b40e496 100644
> --- a/kernel/dma/pool.c
> +++ b/kernel/dma/pool.c
> @@ -70,7 +70,7 @@ static bool cma_in_zone(gfp_t gfp)
>  	/* CMA can't cross zone boundaries, see cma_activate_area() */
>  	end = cma_get_base(cma) + size - 1;
>  	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA))
> -		return end <= DMA_BIT_MASK(zone_dma_bits);
> +		return end <= zone_dma_limit;
>  	if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp & GFP_DMA32))
>  		return end <= DMA_BIT_MASK(32);
>  	return true;

I haven't got to the third patch yet but with this series we can have
zone_dma_limit above DMA_BIT_MASK(32). The above function could return
false for GFP_DMA32 when 'end' is perfectly valid within ZONE_DMA (which
implies safe for GFP_DMA32).

> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index df68d29740a0..dfd83e5ee0b3 100644
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
>  	else
> @@ -629,7 +629,7 @@ static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
>  	}
>  
>  	gfp &= ~GFP_ZONEMASK;
> -	if (phys_limit <= DMA_BIT_MASK(zone_dma_bits))
> +	if (phys_limit <= zone_dma_limit)
>  		gfp |= __GFP_DMA;
>  	else if (phys_limit <= DMA_BIT_MASK(32))
>  		gfp |= __GFP_DMA32;

I think this has the same issue as dma_direct_optimal_gfp_mask(). If
the requested limit is strictly smaller than DMA_BIT_MASK(32) (but
potentially bigger than zone_dma_limit), we should go for __GFP_DMA
rather than __GFP_DMA32. You should probably fix this in the first patch
as well.

As above, with this series we can end up with zone_dma_limit above
DMA_BIT_MASK(32) and all these checks become confusing. Even the
swiotlb_init_late() above if called with GFP_DMA32 will set a phys_limit
that may not be accessible at all if the DRAM starts above 4GB.
Similarly, cma_in_zone() could return false with GFP_DMA32 in similar
hardware configurations.

So we either introduce a zone_dma32_limit variable and allow a 32-bit
range above the start of DRAM or sanitise these sites to make sure
passing GFP_DMA32 is safe - i.e. assume we only have ZONE_DMA if
zone_dma_limit is above 32-bit. I prefer the latter without introducing
a zone_dma32_limit.

-- 
Catalin
