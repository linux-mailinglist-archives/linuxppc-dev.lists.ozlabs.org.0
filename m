Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A02394A86A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 15:14:08 +0200 (CEST)
Received: from lists.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf9cG2FTFz3dLn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 23:14:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wf9bt5spsz3c3g
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 23:13:44 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69630FEC;
	Wed,  7 Aug 2024 06:13:36 -0700 (PDT)
Received: from [10.57.48.153] (unknown [10.57.48.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCDBE3F5A1;
	Wed,  7 Aug 2024 06:13:08 -0700 (PDT)
Message-ID: <8230985e-1581-411f-895c-b49065234520@arm.com>
Date: Wed, 7 Aug 2024 14:13:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dma: improve DMA zone selection
To: Baruch Siach <baruch@tkos.co.il>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <cover.1722578375.git.baruch@tkos.co.il>
 <5200f289af1a9b80dfd329b6ed3d54e1d4a02876.1722578375.git.baruch@tkos.co.il>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <5200f289af1a9b80dfd329b6ed3d54e1d4a02876.1722578375.git.baruch@tkos.co.il>
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
Cc: linux-s390@vger.kernel.org, Ramon Fried <ramon@neureality.ai>, =?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024-08-02 7:03 am, Baruch Siach wrote:
> When device DMA limit does not fit in DMA32 zone it should use DMA zone,
> even when DMA zone is stricter than needed.
> 
> Same goes for devices that can't allocate from the entire normal zone.
> Limit to DMA32 in that case.

Per the bot report this only works for CONFIG_ARCH_KEEP_MEMBLOCK, 
however the whole concept looks wrong anyway. The logic here is that 
we're only forcing a particular zone if there's *no* chance of the 
higher zone being usable. For example, ignoring offsets for simplicity, 
if we have a 40-bit DMA mask then we *do* want to initially try 
allocating from ZONE_NORMAL even if max_pfn is above 40 bits, since we 
still might get a usable allocation from between 32 and 40 bits, and if 
we don't, then we'll fall back to retrying from the DMA zone(s) anyway.

I'm not sure if the rest of the series functionally depends on this 
change, but I think it would be too needlessly restrictive in the 
general case to be justified.

Thanks,
Robin.

> Reported-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>   kernel/dma/direct.c  | 6 +++---
>   kernel/dma/swiotlb.c | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 4480a3cd92e0..3b4be4ca3b08 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -4,7 +4,7 @@
>    *
>    * DMA operations that map physical memory directly without using an IOMMU.
>    */
> -#include <linux/memblock.h> /* for max_pfn */
> +#include <linux/memblock.h>
>   #include <linux/export.h>
>   #include <linux/mm.h>
>   #include <linux/dma-map-ops.h>
> @@ -59,9 +59,9 @@ static gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 *phys_limit)
>   	 * zones.
>   	 */
>   	*phys_limit = dma_to_phys(dev, dma_limit);
> -	if (*phys_limit <= DMA_BIT_MASK(zone_dma_bits))
> +	if (*phys_limit < DMA_BIT_MASK(32))
>   		return GFP_DMA;
> -	if (*phys_limit <= DMA_BIT_MASK(32))
> +	if (*phys_limit < memblock_end_of_DRAM())
>   		return GFP_DMA32;
>   	return 0;
>   }
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index df68d29740a0..043b0ecd3e8d 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -629,9 +629,9 @@ static struct page *swiotlb_alloc_tlb(struct device *dev, size_t bytes,
>   	}
>   
>   	gfp &= ~GFP_ZONEMASK;
> -	if (phys_limit <= DMA_BIT_MASK(zone_dma_bits))
> +	if (phys_limit < DMA_BIT_MASK(32))
>   		gfp |= __GFP_DMA;
> -	else if (phys_limit <= DMA_BIT_MASK(32))
> +	else if (phys_limit < memblock_end_of_DRAM())
>   		gfp |= __GFP_DMA32;
>   
>   	while (IS_ERR(page = alloc_dma_pages(gfp, bytes, phys_limit))) {
