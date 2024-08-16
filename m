Return-Path: <linuxppc-dev+bounces-138-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D4D9553C7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2024 01:32:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XoCrIZQa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WlyvX5Jv6z2xdw;
	Sat, 17 Aug 2024 09:32:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=145.40.73.55
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XoCrIZQa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=will@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WlgNR0N9vz2xFk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2024 21:52:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AEC7ACE1F2E;
	Fri, 16 Aug 2024 11:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926AFC32782;
	Fri, 16 Aug 2024 11:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723809172;
	bh=edZGKTdhd+JKc9rRo5Mb349EFlR6r0Ya6roKnVmRgy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XoCrIZQaaMoPTy/QY3fFLsXEYVVOsv/rkKX/K07OWS1jIY9LvRwg/IuJteDPq6i0p
	 NQhrXbHFhAghu6o3X18y2OsbE6hiFdkD1XtfgBB1TcFGS2bIqAPvTNjuWqjm2MUImY
	 ti0FklwG/EhlO3RkmzmRXnO1t53XD1yqD6Jve/Emycm2LUl0GwSuOOBy64ooLB2QAR
	 Zjik+HKBMwG0e9ftVWZsHHlRsA+mR4ObONv8AYCoihtphAJTUdgTe04uVXD8ij3SZO
	 s6B3TnxsMzNqVLFjEugrvUOK70KJdpv4CqwjLP7mU2LNeEWg2EG5pDGeHT3j5I2t+M
	 N7bUUHDGX/LFg==
Date: Fri, 16 Aug 2024 12:52:47 +0100
From: Will Deacon <will@kernel.org>
To: Baruch Siach <baruch@tkos.co.il>
Cc: Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>,
	Ramon Fried <ramon@neureality.ai>,
	Elad Nachman <enachman@marvell.com>
Subject: Re: [PATCH v6 RESED 1/2] dma: replace zone_dma_bits by zone_dma_limit
Message-ID: <20240816115246.GA24137@willie-the-truck>
References: <cover.1723359916.git.baruch@tkos.co.il>
 <17c067618b93e5d71f19c37826d54db4299621a3.1723359916.git.baruch@tkos.co.il>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17c067618b93e5d71f19c37826d54db4299621a3.1723359916.git.baruch@tkos.co.il>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sun, Aug 11, 2024 at 10:09:35AM +0300, Baruch Siach wrote:
> From: Catalin Marinas <catalin.marinas@arm.com>
> 
> Hardware DMA limit might not be power of 2. When RAM range starts above
> 0, say 4GB, DMA limit of 30 bits should end at 5GB. A single high bit
> can not encode this limit.
> 
> Use plain address for DMA zone limit.
> 
> Since DMA zone can now potentially span beyond 4GB physical limit of
> DMA32, make sure to use DMA zone for GFP_DMA32 allocations in that case.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Co-developed-by: Baruch Siach <baruch@tkos.co.il>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  arch/arm64/mm/init.c       | 30 +++++++++++++++---------------
>  arch/powerpc/mm/mem.c      |  5 ++++-
>  arch/s390/mm/init.c        |  2 +-
>  include/linux/dma-direct.h |  2 +-
>  kernel/dma/direct.c        |  6 +++---
>  kernel/dma/pool.c          |  4 ++--
>  kernel/dma/swiotlb.c       |  6 +++---
>  7 files changed, 29 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 9b5ab6818f7f..c45e2152ca9e 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -115,35 +115,35 @@ static void __init arch_reserve_crashkernel(void)
>  }
>  
>  /*
> - * Return the maximum physical address for a zone accessible by the given bits
> - * limit. If DRAM starts above 32-bit, expand the zone to the maximum
> + * Return the maximum physical address for a zone given its limit.
> + * If DRAM starts above 32-bit, expand the zone to the maximum
>   * available memory, otherwise cap it at 32-bit.
>   */
> -static phys_addr_t __init max_zone_phys(unsigned int zone_bits)
> +static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
>  {
> -	phys_addr_t zone_mask = DMA_BIT_MASK(zone_bits);
>  	phys_addr_t phys_start = memblock_start_of_DRAM();
>  
>  	if (phys_start > U32_MAX)
> -		zone_mask = PHYS_ADDR_MAX;
> -	else if (phys_start > zone_mask)
> -		zone_mask = U32_MAX;
> +		zone_limit = PHYS_ADDR_MAX;
> +	else if (phys_start > zone_limit)
> +		zone_limit = U32_MAX;
>  
> -	return min(zone_mask, memblock_end_of_DRAM() - 1) + 1;
> +	return min(zone_limit, memblock_end_of_DRAM() - 1) + 1;

Why do we need to adjust +-1 now that we're no longer using a mask?

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

Maybe move this block into a helper function so we can avoid three
__maybe_unused variables?

Will

