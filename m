Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ED618EDA5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 02:30:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lxfD6SY2zDqXC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 12:30:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=DEnNwepo; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48lxby5KGdzDq9T
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 12:28:43 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id np9so5401632pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 18:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EwgK0L4cl4l7KkAyMjH+XgiGhnPNrrjuTsf1/mFdSlo=;
 b=DEnNwepotofFPsQsfkVxITWQCCmjGMPImFzDVLYc4Wh80aZRKJ7aI4+kmxWJojzVDX
 JLg95aG59YVRNKv5xtrhKMgpjFPQYzgw8bPvsDfPFVTYCG/bE+r4ebG6L9jOcCor90qj
 Rz0+L5InG1tvI5loK0n7Z8wjhU7PGe3zTvWbm0T18dW3qOdhabuN6hz8yICxo8m7ZpO0
 Rotrolk2OiQ0PyEiSOOPl2wuxzjqc0kHQG4CbwZrzzmuEuQ0spTGTPtaYJ/QdjcOzh4y
 rYZTaZNwm4IKGOVKFWxCKgWWyeovW91suP8Fklx8EQcoHTi3Or+o0LFPVGsFURRvjhuQ
 Hoig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=EwgK0L4cl4l7KkAyMjH+XgiGhnPNrrjuTsf1/mFdSlo=;
 b=B4pUgWbrb07y9dFtDlWuqUV9DmNNavCgcewQd4FF74JrLKDw3iJsYe1//Uhp2iUGtz
 4bMV11dCnJuUX4HWM9cY0vlgNE8RX7tb1YsL2MpLQce9LUNm0gKrqJXSzurahH4nMa7E
 mWmQuyG1oV/BTn/SeJlsL7mz7XaWXT72vnoZ6RJeOBQ51kUpDdgd/3P29kyViqbIW/g/
 EoTF+T3ubutpFzahEknsPjs4asguQWl3wZDYcpR6TMdpvavk7mpeyngQMrMYv+sdBb2J
 IU7haPF8UluD8IY5fvPCrRf+MXz7IABJNY5NBfvG5FZRA6Tau8IHEpO1Jga8xELPbWhR
 mNLQ==
X-Gm-Message-State: ANhLgQ3gNIuYhU9EDd5ll68PaWB498JbgOlAHxq8BXiCnXCS3Nii9ZPU
 gbMLZvjXit/zY6W08/hX9WuV7w==
X-Google-Smtp-Source: ADFU+vvQBuyMFVVSR8lgO3arpSDAHWxHIGE+sB9I+yMkE5KJA7fOLD036sEBGgQ0IqPba1QeRQUxnA==
X-Received: by 2002:a17:90a:1784:: with SMTP id
 q4mr22453558pja.111.1584926921610; 
 Sun, 22 Mar 2020 18:28:41 -0700 (PDT)
Received: from [192.168.10.21] (ppp121-45-221-81.bras1.cbr2.internode.on.net.
 [121.45.221.81])
 by smtp.gmail.com with ESMTPSA id o5sm1319722pgm.70.2020.03.22.18.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Mar 2020 18:28:40 -0700 (PDT)
Subject: Re: [PATCH 1/2] dma-mapping: add a dma_ops_bypass flag to struct
 device
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org
References: <20200320141640.366360-1-hch@lst.de>
 <20200320141640.366360-2-hch@lst.de>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <2f31d0dd-aa7e-8b76-c8a1-5759fda5afc9@ozlabs.ru>
Date: Mon, 23 Mar 2020 12:28:34 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200320141640.366360-2-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 21/03/2020 01:16, Christoph Hellwig wrote:
> Several IOMMU drivers have a bypass mode where they can use a direct
> mapping if the devices DMA mask is large enough.  Add generic support
> to the core dma-mapping code to do that to switch those drivers to
> a common solution.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/device.h      |  6 ++++++
>  include/linux/dma-mapping.h | 30 ++++++++++++++++++------------
>  kernel/dma/mapping.c        | 36 +++++++++++++++++++++++++++---------
>  3 files changed, 51 insertions(+), 21 deletions(-)
> 
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 0cd7c647c16c..09be8bb2c4a6 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -525,6 +525,11 @@ struct dev_links_info {
>   *		  sync_state() callback.
>   * @dma_coherent: this particular device is dma coherent, even if the
>   *		architecture supports non-coherent devices.
> + * @dma_ops_bypass: If set to %true then the dma_ops are bypassed for the
> + *		streaming DMA operations (->map_* / ->unmap_* / ->sync_*),
> + *		and optionall (if the coherent mask is large enough) also
> + *		for dma allocations.  This flag is managed by the dma ops
> + *		instance from ->dma_supported.
>   *
>   * At the lowest level, every device in a Linux system is represented by an
>   * instance of struct device. The device structure contains the information
> @@ -625,6 +630,7 @@ struct device {
>      defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
>  	bool			dma_coherent:1;
>  #endif
> +	bool			dma_ops_bypass : 1;
>  };
>  
>  static inline struct device *kobj_to_dev(struct kobject *kobj)
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 330ad58fbf4d..c3af0cf5e435 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -188,9 +188,15 @@ static inline int dma_mmap_from_global_coherent(struct vm_area_struct *vma,
>  }
>  #endif /* CONFIG_DMA_DECLARE_COHERENT */
>  
> -static inline bool dma_is_direct(const struct dma_map_ops *ops)
> +/*
> + * Check if the devices uses a direct mapping for streaming DMA operations.
> + * This allows IOMMU drivers to set a bypass mode if the DMA mask is large
> + * enough.
> + */
> +static inline bool dma_map_direct(struct device *dev,
> +		const struct dma_map_ops *ops)
>  {
> -	return likely(!ops);
> +	return likely(!ops) || dev->dma_ops_bypass;
>  }
>  
>  /*
> @@ -279,7 +285,7 @@ static inline dma_addr_t dma_map_page_attrs(struct device *dev,
>  	dma_addr_t addr;
>  
>  	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>  		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
>  	else
>  		addr = ops->map_page(dev, page, offset, size, dir, attrs);
> @@ -294,7 +300,7 @@ static inline void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr,
>  	const struct dma_map_ops *ops = get_dma_ops(dev);
>  
>  	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>  		dma_direct_unmap_page(dev, addr, size, dir, attrs);
>  	else if (ops->unmap_page)
>  		ops->unmap_page(dev, addr, size, dir, attrs);
> @@ -313,7 +319,7 @@ static inline int dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
>  	int ents;
>  
>  	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>  		ents = dma_direct_map_sg(dev, sg, nents, dir, attrs);
>  	else
>  		ents = ops->map_sg(dev, sg, nents, dir, attrs);
> @@ -331,7 +337,7 @@ static inline void dma_unmap_sg_attrs(struct device *dev, struct scatterlist *sg
>  
>  	BUG_ON(!valid_dma_direction(dir));
>  	debug_dma_unmap_sg(dev, sg, nents, dir);
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>  		dma_direct_unmap_sg(dev, sg, nents, dir, attrs);
>  	else if (ops->unmap_sg)
>  		ops->unmap_sg(dev, sg, nents, dir, attrs);
> @@ -352,7 +358,7 @@ static inline dma_addr_t dma_map_resource(struct device *dev,
>  	if (WARN_ON_ONCE(pfn_valid(PHYS_PFN(phys_addr))))
>  		return DMA_MAPPING_ERROR;
>  
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>  		addr = dma_direct_map_resource(dev, phys_addr, size, dir, attrs);
>  	else if (ops->map_resource)
>  		addr = ops->map_resource(dev, phys_addr, size, dir, attrs);
> @@ -368,7 +374,7 @@ static inline void dma_unmap_resource(struct device *dev, dma_addr_t addr,
>  	const struct dma_map_ops *ops = get_dma_ops(dev);
>  
>  	BUG_ON(!valid_dma_direction(dir));
> -	if (!dma_is_direct(ops) && ops->unmap_resource)
> +	if (!dma_map_direct(dev, ops) && ops->unmap_resource)
>  		ops->unmap_resource(dev, addr, size, dir, attrs);
>  	debug_dma_unmap_resource(dev, addr, size, dir);
>  }
> @@ -380,7 +386,7 @@ static inline void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
>  	const struct dma_map_ops *ops = get_dma_ops(dev);
>  
>  	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>  		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
>  	else if (ops->sync_single_for_cpu)
>  		ops->sync_single_for_cpu(dev, addr, size, dir);
> @@ -394,7 +400,7 @@ static inline void dma_sync_single_for_device(struct device *dev,
>  	const struct dma_map_ops *ops = get_dma_ops(dev);
>  
>  	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>  		dma_direct_sync_single_for_device(dev, addr, size, dir);
>  	else if (ops->sync_single_for_device)
>  		ops->sync_single_for_device(dev, addr, size, dir);
> @@ -408,7 +414,7 @@ dma_sync_sg_for_cpu(struct device *dev, struct scatterlist *sg,
>  	const struct dma_map_ops *ops = get_dma_ops(dev);
>  
>  	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>  		dma_direct_sync_sg_for_cpu(dev, sg, nelems, dir);
>  	else if (ops->sync_sg_for_cpu)
>  		ops->sync_sg_for_cpu(dev, sg, nelems, dir);
> @@ -422,7 +428,7 @@ dma_sync_sg_for_device(struct device *dev, struct scatterlist *sg,
>  	const struct dma_map_ops *ops = get_dma_ops(dev);
>  
>  	BUG_ON(!valid_dma_direction(dir));
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>  		dma_direct_sync_sg_for_device(dev, sg, nelems, dir);
>  	else if (ops->sync_sg_for_device)
>  		ops->sync_sg_for_device(dev, sg, nelems, dir);
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index 12ff766ec1fa..fdea45574345 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -105,6 +105,24 @@ void *dmam_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
>  }
>  EXPORT_SYMBOL(dmam_alloc_attrs);
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


Why not do this in dma_map_direct() as well?
Or simply have just one dma_map_direct()?

And one more general question - we need a way to use non-direct IOMMU
for RAM above certain limit.

Let's say we have a system with:
0 .. 0x1.0000.0000
0x100.0000.0000 .. 0x101.0000.0000

2x4G, each is 1TB aligned. And we can map directly only the first 4GB
(because of the maximum IOMMU table size) but not the other. And 1:1 on
that "pseries" is done with offset=0x0800.0000.0000.0000.

So we want to check every bus address against dev->bus_dma_limit, not
dev->coherent_dma_mask. In the example above I'd set bus_dma_limit to
0x0800.0001.0000.0000 and 1:1 mapping for the second 4GB would not be
tried. Does this sound reasonable? Thanks,


> +
> +	return false;
> +}
> +
>  /*
>   * Create scatter-list for the already allocated DMA buffer.
>   */
> @@ -138,7 +156,7 @@ int dma_get_sgtable_attrs(struct device *dev, struct sg_table *sgt,
>  {
>  	const struct dma_map_ops *ops = get_dma_ops(dev);
>  
> -	if (dma_is_direct(ops))
> +	if (dma_alloc_direct(dev, ops))
>  		return dma_direct_get_sgtable(dev, sgt, cpu_addr, dma_addr,
>  				size, attrs);
>  	if (!ops->get_sgtable)
> @@ -206,7 +224,7 @@ bool dma_can_mmap(struct device *dev)
>  {
>  	const struct dma_map_ops *ops = get_dma_ops(dev);
>  
> -	if (dma_is_direct(ops))
> +	if (dma_alloc_direct(dev, ops))
>  		return dma_direct_can_mmap(dev);
>  	return ops->mmap != NULL;
>  }
> @@ -231,7 +249,7 @@ int dma_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
>  {
>  	const struct dma_map_ops *ops = get_dma_ops(dev);
>  
> -	if (dma_is_direct(ops))
> +	if (dma_alloc_direct(dev, ops))
>  		return dma_direct_mmap(dev, vma, cpu_addr, dma_addr, size,
>  				attrs);
>  	if (!ops->mmap)
> @@ -244,7 +262,7 @@ u64 dma_get_required_mask(struct device *dev)
>  {
>  	const struct dma_map_ops *ops = get_dma_ops(dev);
>  
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>  		return dma_direct_get_required_mask(dev);
>  	if (ops->get_required_mask)
>  		return ops->get_required_mask(dev);
> @@ -275,7 +293,7 @@ void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
>  	/* let the implementation decide on the zone to allocate from: */
>  	flag &= ~(__GFP_DMA | __GFP_DMA32 | __GFP_HIGHMEM);
>  
> -	if (dma_is_direct(ops))
> +	if (dma_alloc_direct(dev, ops))
>  		cpu_addr = dma_direct_alloc(dev, size, dma_handle, flag, attrs);
>  	else if (ops->alloc)
>  		cpu_addr = ops->alloc(dev, size, dma_handle, flag, attrs);
> @@ -307,7 +325,7 @@ void dma_free_attrs(struct device *dev, size_t size, void *cpu_addr,
>  		return;
>  
>  	debug_dma_free_coherent(dev, size, cpu_addr, dma_handle);
> -	if (dma_is_direct(ops))
> +	if (dma_alloc_direct(dev, ops))
>  		dma_direct_free(dev, size, cpu_addr, dma_handle, attrs);
>  	else if (ops->free)
>  		ops->free(dev, size, cpu_addr, dma_handle, attrs);
> @@ -318,7 +336,7 @@ int dma_supported(struct device *dev, u64 mask)
>  {
>  	const struct dma_map_ops *ops = get_dma_ops(dev);
>  
> -	if (dma_is_direct(ops))
> +	if (!ops)
>  		return dma_direct_supported(dev, mask);
>  	if (!ops->dma_supported)
>  		return 1;
> @@ -374,7 +392,7 @@ void dma_cache_sync(struct device *dev, void *vaddr, size_t size,
>  
>  	BUG_ON(!valid_dma_direction(dir));
>  
> -	if (dma_is_direct(ops))
> +	if (dma_alloc_direct(dev, ops))
>  		arch_dma_cache_sync(dev, vaddr, size, dir);
>  	else if (ops->cache_sync)
>  		ops->cache_sync(dev, vaddr, size, dir);
> @@ -386,7 +404,7 @@ size_t dma_max_mapping_size(struct device *dev)
>  	const struct dma_map_ops *ops = get_dma_ops(dev);
>  	size_t size = SIZE_MAX;
>  
> -	if (dma_is_direct(ops))
> +	if (dma_map_direct(dev, ops))
>  		size = dma_direct_max_mapping_size(dev);
>  	else if (ops && ops->max_mapping_size)
>  		size = ops->max_mapping_size(dev);
> 

-- 
Alexey
