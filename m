Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BB294E654
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 07:59:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Mn/3E8Fx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wj3kG1zRLz2yGq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2024 15:59:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Mn/3E8Fx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=ptesarik@suse.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wj3ZW61Y1z2xbY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 15:52:34 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5bd13ea7604so1939751a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Aug 2024 22:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723441951; x=1724046751; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xLZ35+IU8yTpW/0qUhS27F2h1YLsbUiAnfQoXC1WVeQ=;
        b=Mn/3E8FxdCwXSsGtQ2cLNbWyE05HXkN/p+K+lgjcji8VUsqL3ezbCzAQ9Dvv1kqzmo
         K/MeqF38vFKVSX2X8pN5IpM/HW3mbAnbyj0G1VFn0wEFXIpxjdm6B84LFtk+G9HH4FQp
         eItBYeBHng1YbrseLJtl3C5mdyBmwCoLRDYXsMTdSnXMcVac+hQrd2fyAPx/ULGHb6dy
         causXNuAMFCoPhFGJpH8kV3RFqd62rkgWpon9dSy4vtjs5ZCBfcpWQOdk15062MjrZhq
         sCzSHwl9FlwL9eg2C4uw9G2nk+aVVx2iN2ny61gW5438L0Xes0iZvNyWlPRlanprOSZh
         IU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723441951; x=1724046751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xLZ35+IU8yTpW/0qUhS27F2h1YLsbUiAnfQoXC1WVeQ=;
        b=QIJR2k6PyGS6Hy43K1Un+8dxt/uPP8+gq2cjhJTF43c00jaPfbkL0GqPZSuoCZoKdg
         1dHrBVqu1Ae4dic2mhO7Nl0K830YEIugIlIKJeTtySrWjOXc1A41feov4/C1vfQESJsv
         itytX/fqOG1Cj3PCqK8D6d5I3uPveP9Q0KyZEHHT+wMVc9mWx0AIk8PrvZjF5TUQALQN
         7K88s7qi3sGbDESUrrjr0rhVC/FtPhAVJjpmZ3Lnyh6NjP8gy4Rn5cOlAd3mBXavIMb1
         qYdqoTJVAAHsSZDp8vOAZ5vej2HPsVVE99R43gLblIQZQBdGTUm7VgZyW4Rbt9xk0Tfj
         uywQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd0KcPZd21D8a2CvfIAL5IyQVXX8OuMe4S//CV2J8dC+Nwp1hWBwBXuhQdeLZAfNT2O/jpIkZ+g4HuOfWjJtX5vtGXZ5ebi3Mgrv5G9A==
X-Gm-Message-State: AOJu0YwYWPvjBDXxF/AGuqlA3CzyqLj3g7CIwpqGo2z8EdajOV8/SU2h
	83y9sllW5ebRT551o785ucgCF5zM21+8uwlBpCYAF31HefTUSw+Ve5Bdzars2Lk=
X-Google-Smtp-Source: AGHT+IFMvEB3G12c8wLUv6Tbdwb0/ALbjS7/MCfQmLzvHgcVkX7XPyPkeillfb+dwuofuhmb3Ikxng==
X-Received: by 2002:a17:907:846:b0:a7a:bae8:f29e with SMTP id a640c23a62f3a-a80aa5dae5bmr689141666b.29.1723441951081;
        Sun, 11 Aug 2024 22:52:31 -0700 (PDT)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb11c75asm200467366b.97.2024.08.11.22.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 22:52:30 -0700 (PDT)
Date: Mon, 12 Aug 2024 07:52:29 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH v6 RESED 1/2] dma: replace zone_dma_bits by
 zone_dma_limit
Message-ID: <20240812075229.7caf7bab@mordecai.tesarici.cz>
In-Reply-To: <17c067618b93e5d71f19c37826d54db4299621a3.1723359916.git.baruch@tkos.co.il>
References: <cover.1723359916.git.baruch@tkos.co.il>
	<17c067618b93e5d71f19c37826d54db4299621a3.1723359916.git.baruch@tkos.co.il>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 12 Aug 2024 15:58:03 +1000
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
Cc: linux-s390@vger.kernel.org, Ramon Fried <ramon@neureality.ai>, Will Deacon <will@kernel.org>, Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 11 Aug 2024 10:09:35 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

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

LGTM.

Reviewed-by: Petr Tesarik <ptesarik@suse.com>

Petr T

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
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index d325217ab201..05b7f702b3f7 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -216,7 +216,7 @@ static int __init mark_nonram_nosave(void)
>   * everything else. GFP_DMA32 page allocations automatically fall back to
>   * ZONE_DMA.
>   *
> - * By using 31-bit unconditionally, we can exploit zone_dma_bits to inform the
> + * By using 31-bit unconditionally, we can exploit zone_dma_limit to inform the
>   * generic DMA mapping code.  32-bit only devices (if not handled by an IOMMU
>   * anyway) will take a first dip into ZONE_NORMAL and get otherwise served by
>   * ZONE_DMA.
> @@ -230,6 +230,7 @@ void __init paging_init(void)
>  {
>  	unsigned long long total_ram = memblock_phys_mem_size();
>  	phys_addr_t top_of_ram = memblock_end_of_DRAM();
> +	int zone_dma_bits;
>  
>  #ifdef CONFIG_HIGHMEM
>  	unsigned long v = __fix_to_virt(FIX_KMAP_END);
> @@ -256,6 +257,8 @@ void __init paging_init(void)
>  	else
>  		zone_dma_bits = 31;
>  
> +	zone_dma_limit = DMA_BIT_MASK(zone_dma_bits);
> +
>  #ifdef CONFIG_ZONE_DMA
>  	max_zone_pfns[ZONE_DMA]	= min(max_low_pfn,
>  				      1UL << (zone_dma_bits - PAGE_SHIFT));
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index ddcd39ef4346..91fc2b91adfc 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -97,7 +97,7 @@ void __init paging_init(void)
>  
>  	vmem_map_init();
>  	sparse_init();
> -	zone_dma_bits = 31;
> +	zone_dma_limit = DMA_BIT_MASK(31);
>  	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
>  	max_zone_pfns[ZONE_DMA] = virt_to_pfn(MAX_DMA_ADDRESS);
>  	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> index edbe13d00776..d7e30d4f7503 100644
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@ -12,7 +12,7 @@
>  #include <linux/mem_encrypt.h>
>  #include <linux/swiotlb.h>
>  
> -extern unsigned int zone_dma_bits;
> +extern u64 zone_dma_limit;
>  
>  /*
>   * Record the mapping of CPU physical to DMA addresses for a given region.
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 4480a3cd92e0..f2ba074a6a54 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -20,7 +20,7 @@
>   * it for entirely different regions. In that case the arch code needs to
>   * override the variable below for dma-direct to work properly.
>   */
> -unsigned int zone_dma_bits __ro_after_init = 24;
> +u64 zone_dma_limit __ro_after_init = DMA_BIT_MASK(24);
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
> index d10613eb0f63..7b04f7575796 100644
> --- a/kernel/dma/pool.c
> +++ b/kernel/dma/pool.c
> @@ -70,9 +70,9 @@ static bool cma_in_zone(gfp_t gfp)
>  	/* CMA can't cross zone boundaries, see cma_activate_area() */
>  	end = cma_get_base(cma) + size - 1;
>  	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA))
> -		return end <= DMA_BIT_MASK(zone_dma_bits);
> +		return end <= zone_dma_limit;
>  	if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp & GFP_DMA32))
> -		return end <= DMA_BIT_MASK(32);
> +		return end <= max(DMA_BIT_MASK(32), zone_dma_limit);
>  	return true;
>  }
>  
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index df68d29740a0..abcf3fa63a56 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -450,9 +450,9 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
>  	if (!remap)
>  		io_tlb_default_mem.can_grow = true;
>  	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp_mask & __GFP_DMA))
> -		io_tlb_default_mem.phys_limit = DMA_BIT_MASK(zone_dma_bits);
> +		io_tlb_default_mem.phys_limit = zone_dma_limit;
>  	else if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp_mask & __GFP_DMA32))
> -		io_tlb_default_mem.phys_limit = DMA_BIT_MASK(32);
> +		io_tlb_default_mem.phys_limit = max(DMA_BIT_MASK(32), zone_dma_limit);
>  	else
>  		io_tlb_default_mem.phys_limit = virt_to_phys(high_memory - 1);
>  #endif
> @@ -629,7 +629,7 @@ static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
>  	}
>  
>  	gfp &= ~GFP_ZONEMASK;
> -	if (phys_limit <= DMA_BIT_MASK(zone_dma_bits))
> +	if (phys_limit <= zone_dma_limit)
>  		gfp |= __GFP_DMA;
>  	else if (phys_limit <= DMA_BIT_MASK(32))
>  		gfp |= __GFP_DMA32;

