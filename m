Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EB790DB8E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 20:26:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3Zvn6s7zz3cVW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 04:26:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3ZvN4QMvz3bZ3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 04:26:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC65161A3E;
	Tue, 18 Jun 2024 18:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 716D2C3277B;
	Tue, 18 Jun 2024 18:26:04 +0000 (UTC)
Date: Tue, 18 Jun 2024 19:26:02 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH RFC v2 1/5] dma-mapping: replace zone_dma_bits by
 zone_dma_limit
Message-ID: <ZnHROk1Xs7KcR4I0@arm.com>
References: <cover.1712642324.git.baruch@tkos.co.il>
 <fda45c91f69e65ec14b9aaec9aa053e6982e5b87.1712642324.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fda45c91f69e65ec14b9aaec9aa053e6982e5b87.1712642324.git.baruch@tkos.co.il>
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
Cc: Rob Herring <robh@kernel.org>, linux-s390@vger.kernel.org, Ramon Fried <ramon@neureality.ai>, Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>, Will Deacon <will@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(finally getting around to looking at this series, sorry for the delay)

On Tue, Apr 09, 2024 at 09:17:54AM +0300, Baruch Siach wrote:
> From: Catalin Marinas <catalin.marinas@arm.com>
> 
> Hardware DMA limit might not be power of 2. When RAM range starts above
> 0, say 4GB, DMA limit of 30 bits should end at 5GB. A single high bit
> can not encode this limit.
> 
> Use direct phys_addr_t limit address for DMA zone limit.
> 
> Following commits will add explicit base address to DMA zone.
> 
> ---
> Catalin,
> 
> This is taken almost verbatim from your email:
> 
>   https://lore.kernel.org/all/ZZ2HnHJV3gdzu1Aj@arm.com/
> 
> Would you provide your sign-off?

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks for writing a commit log. However, I think more work is needed.
See below.

> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 03efd86dce0a..00508c69ca9e 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -113,36 +113,24 @@ static void __init arch_reserve_crashkernel(void)
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
> -
> -	return min(zone_mask, memblock_end_of_DRAM() - 1) + 1;
> +	return min(zone_limit, memblock_end_of_DRAM() - 1) + 1;
>  }
>  
>  static void __init zone_sizes_init(void)
>  {
>  	unsigned long max_zone_pfns[MAX_NR_ZONES]  = {0};
> -	unsigned int __maybe_unused acpi_zone_dma_bits;
> -	unsigned int __maybe_unused dt_zone_dma_bits;
> -	phys_addr_t __maybe_unused dma32_phys_limit = max_zone_phys(32);
> +	phys_addr_t __maybe_unused acpi_zone_dma_limit;
> +	phys_addr_t __maybe_unused dt_zone_dma_limit;
> +	phys_addr_t __maybe_unused dma32_phys_limit =
> +		max_zone_phys(DMA_BIT_MASK(32));
>  
>  #ifdef CONFIG_ZONE_DMA
> -	acpi_zone_dma_bits = fls64(acpi_iort_dma_get_max_cpu_address());
> -	dt_zone_dma_bits = fls64(of_dma_get_max_cpu_address(NULL));
> -	zone_dma_bits = min3(32U, dt_zone_dma_bits, acpi_zone_dma_bits);
> -	arm64_dma_phys_limit = max_zone_phys(zone_dma_bits);
> +	acpi_zone_dma_limit = acpi_iort_dma_get_max_cpu_address();
> +	dt_zone_dma_limit = of_dma_get_max_cpu_address(NULL);
> +	zone_dma_limit = min(dt_zone_dma_limit, acpi_zone_dma_limit);
> +	arm64_dma_phys_limit = max_zone_phys(zone_dma_limit);
>  	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);
>  #endif
>  #ifdef CONFIG_ZONE_DMA32

I think this goes wrong if zone_dma_limit ends up above 32-bit (e.g. no
restrictive dma-ranges properties) but the start of RAM is below 4G.
We'd simply reduce ZONE_DMA32 to zero and ZONE_DMA potentially covering
the whole RAM. Prior to this change, we capped zone_dma_bits to 32 via
min3(). I think we should maintain this cap if memblock_start_of_DRAM()
is below 4G.

We could fix this up in max_zone_phys() above:

	if (memblock_start_of_DRAM() < U32_MAX)
		zone_limit = min(U32_MAX, zone_limit);

	return min(zone_limit, memblock_end_of_DRAM() - 1) + 1;

> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 4d543b1e9d57..3b2ebcd4f576 100644
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
> @@ -59,7 +59,7 @@ static gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 *phys_limit)
>  	 * zones.
>  	 */
>  	*phys_limit = dma_to_phys(dev, dma_limit);
> -	if (*phys_limit <= DMA_BIT_MASK(zone_dma_bits))
> +	if (*phys_limit <= zone_dma_limit)
>  		return GFP_DMA;
>  	if (*phys_limit <= DMA_BIT_MASK(32))
>  		return GFP_DMA32;

It's worth noting that if ZONE_DMA ends up entirely above 32-bit, there
won't be any ZONE_DMA32. Thinking about it, this could be a potential
problem. For example, if a device has a 32-bit DMA mask and an offset
that lifts this into the 32-36G range, the above may fail to set
GFP_DMA32.

Actually, I think these checks can go wrong even with the current
implementation, assuming RAM below 4G and no DMA offsets. For example,
we have two devices, one with a coherent mask of 30 bits, the other 31
bits. zone_dma_bits would be set to the smaller of the two, so 30 bit
(as per of_dma_get_max_cpu_address()). For the second device, phys_limit
would be ((1 << 31) - 1) but that's higher than DMA_BIT_MASK(30) so we
fail to set GFP_DMA. We do set GFP_DMA32 because of the second test but
that's not sufficient since that's 32-bit rather than 31-bit as the
device needs. Similarly if we have some weird device with a 33-bit DMA
coherent mask but the RAM is addressed by more bits. We'd fail to set
GFP_DMA32.

Ignoring this patch, I think the checks above in mainline should be
something like:

	if (*phys_limit < DMA_BIT_MASK(32))
		return GFP_DMA;
	if (*phys_limit < memblock_end_of_DRAM())
		return GFP_DMA32;

IOW, zone_dma_bits is pretty useless for this check IMHO. It gives us
the minimum hence not sufficient to test for devices that fall between
ZONE_DMA and ZONE_DMA32 coherent masks.

With your series, the above test wouldn't work since we don't have a
zone_dma32_limit and zone_dma_limit is above DMA_BIT_MASK(32). We might
need to introduce zone_dma32_limit and maybe drop zone_dma_limit
altogether.

-- 
Catalin
