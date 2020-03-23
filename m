Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D80D18F45F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 13:21:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mD4c2kFkzDqkL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 23:21:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48mCyp5n0WzDqjG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 23:16:00 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08FFB1FB;
 Mon, 23 Mar 2020 05:15:57 -0700 (PDT)
Received: from [192.168.1.123] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC7BC3F52E;
 Mon, 23 Mar 2020 05:15:45 -0700 (PDT)
Subject: Re: [PATCH 1/2] dma-mapping: add a dma_ops_bypass flag to struct
 device
To: Christoph Hellwig <hch@lst.de>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>
References: <20200320141640.366360-1-hch@lst.de>
 <20200320141640.366360-2-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <0a6003e5-8003-4509-4014-4b286d5e8fe0@arm.com>
Date: Mon, 23 Mar 2020 12:14:08 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320141640.366360-2-hch@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-03-20 2:16 pm, Christoph Hellwig wrote:
> Several IOMMU drivers have a bypass mode where they can use a direct
> mapping if the devices DMA mask is large enough.  Add generic support
> to the core dma-mapping code to do that to switch those drivers to
> a common solution.

Hmm, this is _almost_, but not quite the same as the case where drivers 
are managing their own IOMMU mappings, but still need to use streaming 
DMA for cache maintenance on the underlying pages. For that we need the 
ops bypass to be a "true" bypass and also avoid SWIOTLB regardless of 
the device's DMA mask. That behaviour should in fact be fine for the 
opportunistic bypass case here as well, since the mask being "big 
enough" implies by definition that this should never need to bounce either.

For the (hopefully less common) third case where, due to groups or user 
overrides, we end up giving an identity DMA domain to a device with 
limited DMA masks which _does_ need SWIOTLB, I'd like to think we can 
solve that by not giving the device IOMMU DMA ops in the first place, 
such that it never needs to engage the bypass mechanism at all.

Thoughts?

Robin.

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   include/linux/device.h      |  6 ++++++
>   include/linux/dma-mapping.h | 30 ++++++++++++++++++------------
>   kernel/dma/mapping.c        | 36 +++++++++++++++++++++++++++---------
>   3 files changed, 51 insertions(+), 21 deletions(-)
> 
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 0cd7c647c16c..09be8bb2c4a6 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -525,6 +525,11 @@ struct dev_links_info {
>    *		  sync_state() callback.
>    * @dma_coherent: this particular device is dma coherent, even if the
>    *		architecture supports non-coherent devices.
> + * @dma_ops_bypass: If set to %true then the dma_ops are bypassed for the
> + *		streaming DMA operations (->map_* / ->unmap_* / ->sync_*),
> + *		and optionall (if the coherent mask is large enough) also
> + *		for dma allocations.  This flag is managed by the dma ops
> + *		instance from ->dma_supported.
>    *
>    * At the lowest level, every device in a Linux system is represented by an
>    * instance of struct device. The device structure contains the information
> @@ -625,6 +630,7 @@ struct device {
>       defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
>   	bool			dma_coherent:1;
>   #endif
> +	bool			dma_ops_bypass : 1;
>   };
>   
>   static inline struct device *kobj_to_dev(struct kobject *kobj)
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 330ad58fbf4d..c3af0cf5e435 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -188,9 +188,15 @@ static inline int dma_mmap_from_global_coherent(struct vm_area_struct *vma,
>   }
>   #endif /* CONFIG_DMA_DECLARE_COHERENT */
>   
> -static inline bool dma_is_direct(const struct dma_map_ops *ops)
> +/*
> + * Check if the devices uses a direct mapping for streaming DMA operations.
> + * This allows IOMMU drivers to set a bypass mode if the DMA mask is large
> + * enough.
> + */
> +static inline bool dma_map_direct(struct device *dev,
> +		const struct dma_map_ops *ops)
>   {
> -	return likely(!ops);
> +	return likely(!ops) || dev->dma_ops_bypass;
>   }
>   
>   /*
> @@ -279,7 +285,7 @@ static inline dma_addr_t dma_map_page_attrs(struct device *dev,
>   	dma_addr_t addr;
>   
>   	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>   		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
>   	else
>   		addr = ops->map_page(dev, page, offset, size, dir, attrs);
> @@ -294,7 +300,7 @@ static inline void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr,
>   	const struct dma_map_ops *ops = get_dma_ops(dev);
>   
>   	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>   		dma_direct_unmap_page(dev, addr, size, dir, attrs);
>   	else if (ops->unmap_page)
>   		ops->unmap_page(dev, addr, size, dir, attrs);
> @@ -313,7 +319,7 @@ static inline int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
>   	int ents;
>   
>   	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>   		ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
>   	else
>   		ents = ops->map_sg(dev, sg, nents, dir, attrs);
> @@ -331,7 +337,7 @@ static inline void dma_unmap_sg_attrs(struct device *dev, struct scatterlist *sg
>   
>   	BUG_ON(!valid_dma_direction(dir));
>   	debug_dma_unmap_sg(dev, sg, nents, dir);
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>   		dma_direct_unmap_sg(dev, sg, nents, dir, attrs);
>   	else if (ops->unmap_sg)
>   		ops->unmap_sg(dev, sg, nents, dir, attrs);
> @@ -352,7 +358,7 @@ static inline dma_addr_t dma_map_resource(struct device *dev,
>   	if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
>   		return DMA_MAPPING_ERROR;
>   
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>   		addr = dma_direct_map_resource(dev, phys_addr, size, dir, attrs);
>   	else if (ops->map_resource)
>   		addr = ops->map_resource(dev, phys_addr, size, dir, attrs);
> @@ -368,7 +374,7 @@ static inline void dma_unmap_resource(struct device *dev, dma_addr_t addr,
>   	const struct dma_map_ops *ops = get_dma_ops(dev);
>   
>   	BUG_ON(!valid_dma_direction(dir));
> -	if (!dma_is_direct(ops) && ops->unmap_resource)
> +	if (!dma_map_direct(dev, ops) && ops->unmap_resource)
>   		ops->unmap_resource(dev, addr, size, dir, attrs);
>   	debug_dma_unmap_resource(dev, addr, size, dir);
>   }
> @@ -380,7 +386,7 @@ static inline void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
>   	const struct dma_map_ops *ops = get_dma_ops(dev);
>   
>   	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>   		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
>   	else if (ops->sync_single_for_cpu)
>   		ops->sync_single_for_cpu(dev, addr, size, dir);
> @@ -394,7 +400,7 @@ static inline void dma_sync_single_for_device(struct device *dev,
>   	const struct dma_map_ops *ops = get_dma_ops(dev);
>   
>   	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>   		dma_direct_sync_single_for_device(dev, addr, size, dir);
>   	else if (ops->sync_single_for_device)
>   		ops->sync_single_for_device(dev, addr, size, dir);
> @@ -408,7 +414,7 @@ dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg,
>   	const struct dma_map_ops *ops = get_dma_ops(dev);
>   
>   	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>   		dma_direct_sync_sg_for_cpu(dev, sg, nelems, dir);
>   	else if (ops->sync_sg_for_cpu)
>   		ops->sync_sg_for_cpu(dev, sg, nelems, dir);
> @@ -422,7 +428,7 @@ dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg,
>   	const struct dma_map_ops *ops = get_dma_ops(dev);
>   
>   	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>   		dma_direct_sync_sg_for_device(dev, sg, nelems, dir);
>   	else if (ops->sync_sg_for_device)
>   		ops->sync_sg_for_device(dev, sg, nelems, dir);
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index 12ff766ec1fa..fdea45574345 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -105,6 +105,24 @@ void *dmam_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
>   }
>   EXPORT_SYMBOL(dmam_alloc_attrs);
>   
> +static bool dma_alloc_direct(struct device *dev, const struct dma_map_ops *ops)
> +{
> +	if (!ops)
> +		return true;
> +
> +	/*
> +	 * Allows IOMMU drivers to bypass dynamic translations if the DMA mask
> +	 * is large enough.
> +	 */
> +	if (dev->dma_ops_bypass) {
> +		if (min_not_zero(dev->coherent_dma_mask, dev->bus_dma_limit) >=
> +				dma_direct_get_required_mask(dev))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>   /*
>    * Create scatter-list for the already allocated DMA buffer.
>    */
> @@ -138,7 +156,7 @@ int dma_get_sgtable_attrs(struct device *dev, struct sg_table *sgt,
>   {
>   	const struct dma_map_ops *ops = get_dma_ops(dev);
>   
> -	if (dma_is_direct(ops))
> +	if (dma_alloc_direct(dev, ops))
>   		return dma_direct_get_sgtable(dev, sgt, cpu_addr, dma_addr,
>   				size, attrs);
>   	if (!ops->get_sgtable)
> @@ -206,7 +224,7 @@ bool dma_can_mmap(struct device *dev)
>   {
>   	const struct dma_map_ops *ops = get_dma_ops(dev);
>   
> -	if (dma_is_direct(ops))
> +	if (dma_alloc_direct(dev, ops))
>   		return dma_direct_can_mmap(dev);
>   	return ops->mmap != NULL;
>   }
> @@ -231,7 +249,7 @@ int dma_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
>   {
>   	const struct dma_map_ops *ops = get_dma_ops(dev);
>   
> -	if (dma_is_direct(ops))
> +	if (dma_alloc_direct(dev, ops))
>   		return dma_direct_mmap(dev, vma, cpu_addr, dma_addr, size,
>   				attrs);
>   	if (!ops->mmap)
> @@ -244,7 +262,7 @@ u64 dma_get_required_mask(struct device *dev)
>   {
>   	const struct dma_map_ops *ops = get_dma_ops(dev);
>   
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>   		return dma_direct_get_required_mask(dev);
>   	if (ops->get_required_mask)
>   		return ops->get_required_mask(dev);
> @@ -275,7 +293,7 @@ void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
>   	/* let the implementation decide on the zone to allocate from: */
>   	flag &= ~(__GFP_DMA | __GFP_DMA32 | __GFP_HIGHMEM);
>   
> -	if (dma_is_direct(ops))
> +	if (dma_alloc_direct(dev, ops))
>   		cpu_addr = dma_direct_alloc(dev, size, dma_handle, flag, attrs);
>   	else if (ops->alloc)
>   		cpu_addr = ops->alloc(dev, size, dma_handle, flag, attrs);
> @@ -307,7 +325,7 @@ void dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
>   		return;
>   
>   	debug_dma_free_coherent(dev, size, cpu_addr, dma_handle);
> -	if (dma_is_direct(ops))
> +	if (dma_alloc_direct(dev, ops))
>   		dma_direct_free(dev, size, cpu_addr, dma_handle, attrs);
>   	else if (ops->free)
>   		ops->free(dev, size, cpu_addr, dma_handle, attrs);
> @@ -318,7 +336,7 @@ int dma_supported(struct device *dev, u64 mask)
>   {
>   	const struct dma_map_ops *ops = get_dma_ops(dev);
>   
> -	if (dma_is_direct(ops))
> +	if (!ops)
>   		return dma_direct_supported(dev, mask);
>   	if (!ops->dma_supported)
>   		return 1;
> @@ -374,7 +392,7 @@ void dma_cache_sync(struct device *dev, void *vaddr, size_t size,
>   
>   	BUG_ON(!valid_dma_direction(dir));
>   
> -	if (dma_is_direct(ops))
> +	if (dma_alloc_direct(dev, ops))
>   		arch_dma_cache_sync(dev, vaddr, size, dir);
>   	else if (ops->cache_sync)
>   		ops->cache_sync(dev, vaddr, size, dir);
> @@ -386,7 +404,7 @@ size_t dma_max_mapping_size(struct device *dev)
>   	const struct dma_map_ops *ops = get_dma_ops(dev);
>   	size_t size = SIZE_MAX;
>   
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>   		size = dma_direct_max_mapping_size(dev);
>   	else if (ops && ops->max_mapping_size)
>   		size = ops->max_mapping_size(dev);
> 
