Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1683ABF8E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:31:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5dcB4pSgz3c3c
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 09:31:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L3nKu5Hm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sstabellini@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=L3nKu5Hm; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5dbM06Brz3bxh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 09:30:54 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC0DB6117A;
 Thu, 17 Jun 2021 23:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623972652;
 bh=zT1qdWU1gzmRyGeh30JGyHfeH/5dy6E64TCLRTPOMuQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=L3nKu5Hm2ncrIKOEaFTf+2fL0fh6USJhIFnbQA9qkk03x89Y1npCLAh/mGQJh5jgS
 pnnSruyh6mX3z3Is7HGD+08WcJ0DnFnBawbI2rFKKmajFf1FEQ37ybp7Nq3v8pjbh0
 NHrvEDTsIOxk4nTYvYmiUcCNBuL4M/XxImwe4e8lhtE6D3K7hOlD4JIdGP+kIOALnw
 5Scct4vYV5ZtSH09JchbACRHQNDYN1A3YXySJYHgErO3JUbn5qo9xkJbr5DFsapWSj
 o+frwhth6wJ1B4JrC45X+H0+WpZAVkNuIox4TsHm6lkmMwlV+YZDFHxdVI/S5CtGI5
 B7G21AS9iH6ZA==
Date: Thu, 17 Jun 2021 16:30:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v13 03/12] swiotlb: Set dev->dma_io_tlb_mem to the swiotlb
 pool used
In-Reply-To: <20210617062635.1660944-4-tientzu@chromium.org>
Message-ID: <alpine.DEB.2.21.2106171444510.24906@sstabellini-ThinkPad-T480s>
References: <20210617062635.1660944-1-tientzu@chromium.org>
 <20210617062635.1660944-4-tientzu@chromium.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 jxgao@google.com, daniel@ffwll.ch, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, bhelgaas@google.com, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Jun 2021, Claire Chang wrote:
> Always have the pointer to the swiotlb pool used in struct device. This
> could help simplify the code for other pools.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> Tested-by: Will Deacon <will@kernel.org>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  drivers/base/core.c    | 4 ++++
>  include/linux/device.h | 4 ++++
>  kernel/dma/swiotlb.c   | 8 ++++----
>  3 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index f29839382f81..cb3123e3954d 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -27,6 +27,7 @@
>  #include <linux/netdevice.h>
>  #include <linux/sched/signal.h>
>  #include <linux/sched/mm.h>
> +#include <linux/swiotlb.h>
>  #include <linux/sysfs.h>
>  #include <linux/dma-map-ops.h> /* for dma_default_coherent */
>  
> @@ -2736,6 +2737,9 @@ void device_initialize(struct device *dev)
>      defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
>  	dev->dma_coherent = dma_default_coherent;
>  #endif
> +#ifdef CONFIG_SWIOTLB
> +	dev->dma_io_tlb_mem = io_tlb_default_mem;
> +#endif
>  }
>  EXPORT_SYMBOL_GPL(device_initialize);
>  
> diff --git a/include/linux/device.h b/include/linux/device.h
> index ba660731bd25..240d652a0696 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -416,6 +416,7 @@ struct dev_links_info {
>   * @dma_pools:	Dma pools (if dma'ble device).
>   * @dma_mem:	Internal for coherent mem override.
>   * @cma_area:	Contiguous memory area for dma allocations
> + * @dma_io_tlb_mem: Pointer to the swiotlb pool used.  Not for driver use.
>   * @archdata:	For arch-specific additions.
>   * @of_node:	Associated device tree node.
>   * @fwnode:	Associated device node supplied by platform firmware.
> @@ -518,6 +519,9 @@ struct device {
>  #ifdef CONFIG_DMA_CMA
>  	struct cma *cma_area;		/* contiguous memory area for dma
>  					   allocations */
> +#endif
> +#ifdef CONFIG_SWIOTLB
> +	struct io_tlb_mem *dma_io_tlb_mem;
>  #endif
>  	/* arch specific additions */
>  	struct dev_archdata	archdata;
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 2dba659a1e73..de79e9437030 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -340,7 +340,7 @@ void __init swiotlb_exit(void)
>  static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size,
>  			   enum dma_data_direction dir)
>  {
> -	struct io_tlb_mem *mem = io_tlb_default_mem;
> +	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>  	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
>  	unsigned int offset = (tlb_addr - mem->start) & (IO_TLB_SIZE - 1);
>  	phys_addr_t orig_addr = mem->slots[index].orig_addr;
> @@ -431,7 +431,7 @@ static unsigned int wrap_index(struct io_tlb_mem *mem, unsigned int index)
>  static int find_slots(struct device *dev, phys_addr_t orig_addr,
>  		size_t alloc_size)
>  {
> -	struct io_tlb_mem *mem = io_tlb_default_mem;
> +	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>  	unsigned long boundary_mask = dma_get_seg_boundary(dev);
>  	dma_addr_t tbl_dma_addr =
>  		phys_to_dma_unencrypted(dev, mem->start) & boundary_mask;
> @@ -508,7 +508,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
>  		size_t mapping_size, size_t alloc_size,
>  		enum dma_data_direction dir, unsigned long attrs)
>  {
> -	struct io_tlb_mem *mem = io_tlb_default_mem;
> +	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
>  	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
>  	unsigned int i;
>  	int index;
> @@ -559,7 +559,7 @@ void swiotlb_tbl_unmap_single(struct device *hwdev, phys_addr_t tlb_addr,
>  			      size_t mapping_size, enum dma_data_direction dir,
>  			      unsigned long attrs)
>  {
> -	struct io_tlb_mem *mem = io_tlb_default_mem;
> +	struct io_tlb_mem *mem = hwdev->dma_io_tlb_mem;
>  	unsigned long flags;
>  	unsigned int offset = swiotlb_align_offset(hwdev, tlb_addr);
>  	int index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
> -- 
> 2.32.0.288.g62a8d224e6-goog
> 
