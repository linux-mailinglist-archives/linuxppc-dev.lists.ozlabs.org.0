Return-Path: <linuxppc-dev+bounces-11802-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6518B45DE3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 18:22:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJM7B5Ws4z3dPs;
	Sat,  6 Sep 2025 02:21:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757089318;
	cv=none; b=Y59cN6Vp2pB0OPXAhVHsgP6FNiraZz+CmLdg42PekqAM6HNr85RLR/+pYInD7Q+9lbvmTpHOiBAluWycOkGbrylV+eumk8p/vTqXBXXwlr3cvFQzxkosScG7GxvUs7Dnl3zxfh4OM4NLoPgSoDm4dkUkkpYZEQvkUHTcYXt25SxJ+Wy50zYlO4ODadHBv15ObGO2o7Y/+K+C8qQ4e/GNFO7pJmYLBHXFrMfkDWmd0niaZWQrA+3aeiVNrQq/xmPnP2+ztyXsRnNnJhg3GjcgRTE0nW0V40lc0uLoG8RMbNISfHCr8SHhnLg1ah2812GwfU/sa8q29ecphIFqOG0cVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757089318; c=relaxed/relaxed;
	bh=SihwygswkUbDkI6TEnNcbeL2/U8m9DIalmjgcknmvOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=dQKd5AE18KXpWU4gWlAI1ElYToTkxaElJLuFjFuYxIyQzGWANlXsldIRWZzohhPg+zrh966Dk7A97NO08OlyyvV4aePSYDwBcEAIkwLkJY6MOiW3hM/0XDXo4PE5HkEib6XurD9rjY0YkFyVUk0IgKms9kgUiS41N53guTYLo6Mw60nKW5/50e3jlmGu4OnPFSaYxS1cTNFAZmveqPYj2BhVZyie5D40tAPhlTCM66btdc4SW6v3TH4r1gGmIs8wcN39SlWWORuAL8C2NeiVKURMkWkHP/1WkC5iI3bKs2Ft/+roSLztbNlFGuaPR03IH9lVicdLUzphdJBsX1YMvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=TMub8T2A; dkim-atps=neutral; spf=pass (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=TMub8T2A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJM796Kn7z3dM1
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Sep 2025 02:21:57 +1000 (AEST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250905162148euoutp02604d107873dc75c605be1c2733dda215~ib2qaX6dY1912019120euoutp02_;
	Fri,  5 Sep 2025 16:21:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250905162148euoutp02604d107873dc75c605be1c2733dda215~ib2qaX6dY1912019120euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757089308;
	bh=SihwygswkUbDkI6TEnNcbeL2/U8m9DIalmjgcknmvOM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=TMub8T2AywFu0rH6DpstDybTJowRFDNOBYLDkp6Xzd7qGqwZ8ouj39Pirm529DkBN
	 NnHkZVznzmV8UpKTT429M04YfUlrnl7jwCyuT5my78L0ccVnDyJcAFZshVqjrwHKoZ
	 N2bRFb+07AkY+pQ3ta9ua+sPeKgv85ar3t0gyurM=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250905162147eucas1p221ca4e33b0e6396d02908377c6c5b919~ib2pcEwbH0974409744eucas1p2p;
	Fri,  5 Sep 2025 16:21:47 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250905162145eusmtip2342879dbc38ddfe0bbff0062e179f725~ib2nn8yb40979609796eusmtip2i;
	Fri,  5 Sep 2025 16:21:45 +0000 (GMT)
Message-ID: <087e7f3d-1e0d-4efe-822f-72d16d161a60@samsung.com>
Date: Fri, 5 Sep 2025 18:21:44 +0200
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
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v5 07/16] dma-mapping: convert dma_direct_*map_page to
 be phys_addr_t based
To: Leon Romanovsky <leon@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Alexander Potapenko
	<glider@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, Danilo
	Krummrich <dakr@kernel.org>, David Hildenbrand <david@redhat.com>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>, Jens Axboe
	<axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>, Jonathan Corbet
	<corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Michael
	Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, Miguel
	Ojeda <ojeda@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	rust-for-linux@vger.kernel.org, Sagi Grimberg <sagi@grimberg.me>, Stefano
	Stabellini <sstabellini@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <6b2f4cb436c98d6342db69e965a5621707b9711f.1756822782.git.leon@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250905162147eucas1p221ca4e33b0e6396d02908377c6c5b919
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250902144935eucas1p253de9e94315de54325cc61dea9c76490
X-EPHeader: CA
X-CMS-RootMailID: 20250902144935eucas1p253de9e94315de54325cc61dea9c76490
References: <cover.1756822782.git.leon@kernel.org>
	<CGME20250902144935eucas1p253de9e94315de54325cc61dea9c76490@eucas1p2.samsung.com>
	<6b2f4cb436c98d6342db69e965a5621707b9711f.1756822782.git.leon@kernel.org>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 02.09.2025 16:48, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
>
> Convert the DMA direct mapping functions to accept physical addresses
> directly instead of page+offset parameters. The functions were already
> operating on physical addresses internally, so this change eliminates
> the redundant page-to-physical conversion at the API boundary.
>
> The functions dma_direct_map_page() and dma_direct_unmap_page() are
> renamed to dma_direct_map_phys() and dma_direct_unmap_phys() respectively,
> with their calling convention changed from (struct page *page,
> unsigned long offset) to (phys_addr_t phys).
>
> Architecture-specific functions arch_dma_map_page_direct() and
> arch_dma_unmap_page_direct() are similarly renamed to
> arch_dma_map_phys_direct() and arch_dma_unmap_phys_direct().
>
> The is_pci_p2pdma_page() checks are replaced with DMA_ATTR_MMIO checks
> to allow integration with dma_direct_map_resource and dma_direct_map_phys()
> is extended to support MMIO path either.
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>   arch/powerpc/kernel/dma-iommu.c |  4 +--
>   include/linux/dma-map-ops.h     |  8 ++---
>   kernel/dma/direct.c             |  6 ++--
>   kernel/dma/direct.h             | 57 +++++++++++++++++++++------------
>   kernel/dma/mapping.c            |  8 ++---
>   5 files changed, 49 insertions(+), 34 deletions(-)
>
> diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
> index 4d64a5db50f3..0359ab72cd3b 100644
> --- a/arch/powerpc/kernel/dma-iommu.c
> +++ b/arch/powerpc/kernel/dma-iommu.c
> @@ -14,7 +14,7 @@
>   #define can_map_direct(dev, addr) \
>   	((dev)->bus_dma_limit >= phys_to_dma((dev), (addr)))
>   
> -bool arch_dma_map_page_direct(struct device *dev, phys_addr_t addr)
> +bool arch_dma_map_phys_direct(struct device *dev, phys_addr_t addr)
>   {
>   	if (likely(!dev->bus_dma_limit))
>   		return false;
> @@ -24,7 +24,7 @@ bool arch_dma_map_page_direct(struct device *dev, phys_addr_t addr)
>   
>   #define is_direct_handle(dev, h) ((h) >= (dev)->archdata.dma_offset)
>   
> -bool arch_dma_unmap_page_direct(struct device *dev, dma_addr_t dma_handle)
> +bool arch_dma_unmap_phys_direct(struct device *dev, dma_addr_t dma_handle)
>   {
>   	if (likely(!dev->bus_dma_limit))
>   		return false;
> diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
> index f48e5fb88bd5..71f5b3025415 100644
> --- a/include/linux/dma-map-ops.h
> +++ b/include/linux/dma-map-ops.h
> @@ -392,15 +392,15 @@ void *arch_dma_set_uncached(void *addr, size_t size);
>   void arch_dma_clear_uncached(void *addr, size_t size);
>   
>   #ifdef CONFIG_ARCH_HAS_DMA_MAP_DIRECT
> -bool arch_dma_map_page_direct(struct device *dev, phys_addr_t addr);
> -bool arch_dma_unmap_page_direct(struct device *dev, dma_addr_t dma_handle);
> +bool arch_dma_map_phys_direct(struct device *dev, phys_addr_t addr);
> +bool arch_dma_unmap_phys_direct(struct device *dev, dma_addr_t dma_handle);
>   bool arch_dma_map_sg_direct(struct device *dev, struct scatterlist *sg,
>   		int nents);
>   bool arch_dma_unmap_sg_direct(struct device *dev, struct scatterlist *sg,
>   		int nents);
>   #else
> -#define arch_dma_map_page_direct(d, a)		(false)
> -#define arch_dma_unmap_page_direct(d, a)	(false)
> +#define arch_dma_map_phys_direct(d, a)		(false)
> +#define arch_dma_unmap_phys_direct(d, a)	(false)
>   #define arch_dma_map_sg_direct(d, s, n)		(false)
>   #define arch_dma_unmap_sg_direct(d, s, n)	(false)
>   #endif
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 24c359d9c879..fa75e3070073 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -453,7 +453,7 @@ void dma_direct_unmap_sg(struct device *dev, struct scatterlist *sgl,
>   		if (sg_dma_is_bus_address(sg))
>   			sg_dma_unmark_bus_address(sg);
>   		else
> -			dma_direct_unmap_page(dev, sg->dma_address,
> +			dma_direct_unmap_phys(dev, sg->dma_address,
>   					      sg_dma_len(sg), dir, attrs);
>   	}
>   }
> @@ -476,8 +476,8 @@ int dma_direct_map_sg(struct device *dev, struct scatterlist *sgl, int nents,
>   			 */
>   			break;
>   		case PCI_P2PDMA_MAP_NONE:
> -			sg->dma_address = dma_direct_map_page(dev, sg_page(sg),
> -					sg->offset, sg->length, dir, attrs);
> +			sg->dma_address = dma_direct_map_phys(dev, sg_phys(sg),
> +					sg->length, dir, attrs);
>   			if (sg->dma_address == DMA_MAPPING_ERROR) {
>   				ret = -EIO;
>   				goto out_unmap;
> diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
> index d2c0b7e632fc..3f4792910604 100644
> --- a/kernel/dma/direct.h
> +++ b/kernel/dma/direct.h
> @@ -80,42 +80,57 @@ static inline void dma_direct_sync_single_for_cpu(struct device *dev,
>   		arch_dma_mark_clean(paddr, size);
>   }
>   
> -static inline dma_addr_t dma_direct_map_page(struct device *dev,
> -		struct page *page, unsigned long offset, size_t size,
> -		enum dma_data_direction dir, unsigned long attrs)
> +static inline dma_addr_t dma_direct_map_phys(struct device *dev,
> +		phys_addr_t phys, size_t size, enum dma_data_direction dir,
> +		unsigned long attrs)
>   {
> -	phys_addr_t phys = page_to_phys(page) + offset;
> -	dma_addr_t dma_addr = phys_to_dma(dev, phys);
> +	dma_addr_t dma_addr;
>   
>   	if (is_swiotlb_force_bounce(dev)) {
> -		if (is_pci_p2pdma_page(page))
> -			return DMA_MAPPING_ERROR;
> +		if (attrs & DMA_ATTR_MMIO)
> +			goto err_overflow;
> +
>   		return swiotlb_map(dev, phys, size, dir, attrs);
>   	}
>   
> -	if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||
> -	    dma_kmalloc_needs_bounce(dev, size, dir)) {
> -		if (is_pci_p2pdma_page(page))
> -			return DMA_MAPPING_ERROR;
> -		if (is_swiotlb_active(dev))
> -			return swiotlb_map(dev, phys, size, dir, attrs);
> -
> -		dev_WARN_ONCE(dev, 1,
> -			     "DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
> -			     &dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
> -		return DMA_MAPPING_ERROR;
> +	if (attrs & DMA_ATTR_MMIO) {
> +		dma_addr = phys;
> +		if (unlikely(dma_capable(dev, dma_addr, size, false)))

"!dma_capable(dev, dma_addr, size, false)" in the above line.

It took me a while to find this after noticing that this patchset breaks booting some of me test systems.


> +			goto err_overflow;
> +	} else {
> +		dma_addr = phys_to_dma(dev, phys);
> +		if (unlikely(!dma_capable(dev, dma_addr, size, true)) ||
> +		    dma_kmalloc_needs_bounce(dev, size, dir)) {
> +			if (is_swiotlb_active(dev))
> +				return swiotlb_map(dev, phys, size, dir, attrs);
> +
> +			goto err_overflow;
> +		}
>   	}
>   
> -	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
> +	if (!dev_is_dma_coherent(dev) &&
> +	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
>   		arch_sync_dma_for_device(phys, size, dir);
>   	return dma_addr;
> +
> +err_overflow:
> +	dev_WARN_ONCE(
> +		dev, 1,
> +		"DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
> +		&dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
> +	return DMA_MAPPING_ERROR;
>   }
>   
> -static inline void dma_direct_unmap_page(struct device *dev, dma_addr_t addr,
> +static inline void dma_direct_unmap_phys(struct device *dev, dma_addr_t addr,
>   		size_t size, enum dma_data_direction dir, unsigned long attrs)
>   {
> -	phys_addr_t phys = dma_to_phys(dev, addr);
> +	phys_addr_t phys;
> +
> +	if (attrs & DMA_ATTR_MMIO)
> +		/* nothing to do: uncached and no swiotlb */
> +		return;
>   
> +	phys = dma_to_phys(dev, addr);
>   	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
>   		dma_direct_sync_single_for_cpu(dev, addr, size, dir);
>   
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index 58482536db9b..80481a873340 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -166,8 +166,8 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
>   		return DMA_MAPPING_ERROR;
>   
>   	if (dma_map_direct(dev, ops) ||
> -	    arch_dma_map_page_direct(dev, phys + size))
> -		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
> +	    arch_dma_map_phys_direct(dev, phys + size))
> +		addr = dma_direct_map_phys(dev, phys, size, dir, attrs);
>   	else if (use_dma_iommu(dev))
>   		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
>   	else
> @@ -187,8 +187,8 @@ void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr, size_t size,
>   
>   	BUG_ON(!valid_dma_direction(dir));
>   	if (dma_map_direct(dev, ops) ||
> -	    arch_dma_unmap_page_direct(dev, addr + size))
> -		dma_direct_unmap_page(dev, addr, size, dir, attrs);
> +	    arch_dma_unmap_phys_direct(dev, addr + size))
> +		dma_direct_unmap_phys(dev, addr, size, dir, attrs);
>   	else if (use_dma_iommu(dev))
>   		iommu_dma_unmap_phys(dev, addr, size, dir, attrs);
>   	else

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


