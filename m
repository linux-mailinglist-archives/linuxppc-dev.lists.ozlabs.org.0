Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDD86CA503
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:58:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlXtn5Jpyz3g1F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:58:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlXh22bJ1z3fVR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:49:20 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25F414B3;
	Mon, 27 Mar 2023 05:49:31 -0700 (PDT)
Received: from [10.57.53.238] (unknown [10.57.53.238])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0320F3F663;
	Mon, 27 Mar 2023 05:48:40 -0700 (PDT)
Message-ID: <cb9367fb-0897-244d-15b6-fdfafde2a1c0@arm.com>
Date: Mon, 27 Mar 2023 13:48:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 20/21] ARM: dma-mapping: split out arch_dma_mark_clean()
 helper
Content-Language: en-GB
To: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-21-arnd@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230327121317.4081816-21-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Michal Sime
 k <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-03-27 13:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The arm version of the arch_sync_dma_for_cpu() function annotates pages as
> PG_dcache_clean after a DMA, but no other architecture does this here. On
> ia64, the same thing is done in arch_sync_dma_for_cpu(), so it makes sense
> to use the same hook in order to have identical arch_sync_dma_for_cpu()
> semantics as all other architectures.
> 
> Splitting this out has multiple effects:
> 
>   - for dma-direct, this now gets called after arch_sync_dma_for_cpu()
>     for DMA_FROM_DEVICE mappings, but not for DMA_BIDIRECTIONAL. While
>     it would not be harmful to keep doing it for bidirectional mappings,
>     those are apparently not used in any callers that care about the flag.
> 
>   - Since arm has its own dma-iommu abstraction, this now also needs to
>     call the same function, so the calls are added there to mirror the
>     dma-direct version.
> 
>   - Like dma-direct, the dma-iommu version now marks the dcache clean
>     for both coherent and noncoherent devices after a DMA, but it only
>     does this for DMA_FROM_DEVICE, not DMA_BIDIRECTIONAL.
> 
> [ HELP NEEDED: can anyone confirm that it is a correct assumption
>    on arm that a cache-coherent device writing to a page always results
>    in it being in a PG_dcache_clean state like on ia64, or can a device
>    write directly into the dcache?]

In AMBA at least, if a snooping write hits in a cache then the data is 
most likely going to get routed directly into that cache. If it has 
write-back write-allocate attributes it could also land in any cache 
along its normal path to RAM; it wouldn't have to go all the way.

Hence all the fun we have where treating a coherent device as 
non-coherent can still be almost as broken as the other way round :)

Cheers,
Robin.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/arm/Kconfig          |  1 +
>   arch/arm/mm/dma-mapping.c | 71 +++++++++++++++++++++++----------------
>   2 files changed, 43 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index e24a9820e12f..125d58c54ab1 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -7,6 +7,7 @@ config ARM
>   	select ARCH_HAS_BINFMT_FLAT
>   	select ARCH_HAS_CURRENT_STACK_POINTER
>   	select ARCH_HAS_DEBUG_VIRTUAL if MMU
> +	select ARCH_HAS_DMA_MARK_CLEAN if MMU
>   	select ARCH_HAS_DMA_WRITE_COMBINE if !ARM_DMA_MEM_BUFFERABLE
>   	select ARCH_HAS_ELF_RANDOMIZE
>   	select ARCH_HAS_FORTIFY_SOURCE
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index cc702cb27ae7..b703cb83d27e 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -665,6 +665,28 @@ static void dma_cache_maint(phys_addr_t paddr,
>   	} while (left);
>   }
>   
> +/*
> + * Mark the D-cache clean for these pages to avoid extra flushing.
> + */
> +void arch_dma_mark_clean(phys_addr_t paddr, size_t size)
> +{
> +	unsigned long pfn = PFN_UP(paddr);
> +	unsigned long off = paddr & (PAGE_SIZE - 1);
> +	size_t left = size;
> +
> +	if (size < PAGE_SIZE)
> +		return;
> +
> +	if (off)
> +		left -= PAGE_SIZE - off;
> +
> +	while (left >= PAGE_SIZE) {
> +		struct page *page = pfn_to_page(pfn++);
> +		set_bit(PG_dcache_clean, &page->flags);
> +		left -= PAGE_SIZE;
> +	}
> +}
> +
>   static bool arch_sync_dma_cpu_needs_post_dma_flush(void)
>   {
>   	if (IS_ENABLED(CONFIG_CPU_V6) ||
> @@ -715,24 +737,6 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
>   		outer_inv_range(paddr, paddr + size);
>   		dma_cache_maint(paddr, size, dmac_inv_range);
>   	}
> -
> -	/*
> -	 * Mark the D-cache clean for these pages to avoid extra flushing.
> -	 */
> -	if (dir != DMA_TO_DEVICE && size >= PAGE_SIZE) {
> -		unsigned long pfn = PFN_UP(paddr);
> -		unsigned long off = paddr & (PAGE_SIZE - 1);
> -		size_t left = size;
> -
> -		if (off)
> -			left -= PAGE_SIZE - off;
> -
> -		while (left >= PAGE_SIZE) {
> -			struct page *page = pfn_to_page(pfn++);
> -			set_bit(PG_dcache_clean, &page->flags);
> -			left -= PAGE_SIZE;
> -		}
> -	}
>   }
>   
>   #ifdef CONFIG_ARM_DMA_USE_IOMMU
> @@ -1294,6 +1298,17 @@ static int arm_iommu_map_sg(struct device *dev, struct scatterlist *sg,
>   	return -EINVAL;
>   }
>   
> +static void arm_iommu_sync_dma_for_cpu(phys_addr_t phys, size_t len,
> +				       enum dma_data_direction dir,
> +				       bool dma_coherent)
> +{
> +	if (!dma_coherent)
> +		arch_sync_dma_for_cpu(phys, s->length, dir);
> +
> +	if (dir == DMA_FROM_DEVICE)
> +		arch_dma_mark_clean(phys, s->length);
> +}
> +
>   /**
>    * arm_iommu_unmap_sg - unmap a set of SG buffers mapped by dma_map_sg
>    * @dev: valid struct device pointer
> @@ -1316,8 +1331,9 @@ static void arm_iommu_unmap_sg(struct device *dev,
>   		if (sg_dma_len(s))
>   			__iommu_remove_mapping(dev, sg_dma_address(s),
>   					       sg_dma_len(s));
> -		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
> -			arch_sync_dma_for_cpu(sg_phys(s), s->length, dir);
> +		if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
> +			arm_iommu_sync_dma_for_cpu(sg_phys(s), s->length, dir,
> +						   dev->dma_coherent);
>   	}
>   }
>   
> @@ -1335,12 +1351,9 @@ static void arm_iommu_sync_sg_for_cpu(struct device *dev,
>   	struct scatterlist *s;
>   	int i;
>   
> -	if (dev->dma_coherent)
> -		return;
> -
>   	for_each_sg(sg, s, nents, i)
> -		arch_sync_dma_for_cpu(sg_phys(s), s->length, dir);
> -
> +		arm_iommu_sync_dma_for_cpu(sg_phys(s), s->length, dir,
> +					   dev->dma_coherent);
>   }
>   
>   /**
> @@ -1425,9 +1438,9 @@ static void arm_iommu_unmap_page(struct device *dev, dma_addr_t handle,
>   	if (!iova)
>   		return;
>   
> -	if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
> +	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
>   		phys = iommu_iova_to_phys(mapping->domain, handle);
> -		arch_sync_dma_for_cpu(phys, size, dir);
> +		arm_iommu_sync_dma_for_cpu(phys, size, dir, dev->dma_coherent);
>   	}
>   
>   	iommu_unmap(mapping->domain, iova, len);
> @@ -1497,11 +1510,11 @@ static void arm_iommu_sync_single_for_cpu(struct device *dev,
>   	struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
>   	phys_addr_t phys;
>   
> -	if (dev->dma_coherent || !(handle & PAGE_MASK))
> +	if (!(handle & PAGE_MASK))
>   		return;
>   
>   	phys = iommu_iova_to_phys(mapping->domain, handle);
> -	arch_sync_dma_for_cpu(phys, size, dir);
> +	arm_iommu_sync_dma_for_cpu(phys, size, dir, dev->dma_coherent);
>   }
>   
>   static void arm_iommu_sync_single_for_device(struct device *dev,
