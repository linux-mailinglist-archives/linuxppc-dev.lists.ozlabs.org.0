Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AEC369125
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 13:35:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRXJn142Fz302S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 21:35:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=steven.price@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FRXJN1svKz2yRT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 21:34:42 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 204A413A1;
 Fri, 23 Apr 2021 04:34:39 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D48233F694;
 Fri, 23 Apr 2021 04:34:32 -0700 (PDT)
Subject: Re: [PATCH v5 05/16] swiotlb: Add restricted DMA pool initialization
To: Claire Chang <tientzu@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20210422081508.3942748-1-tientzu@chromium.org>
 <20210422081508.3942748-6-tientzu@chromium.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <c9abca62-328d-d0d6-a8a6-a67475171f92@arm.com>
Date: Fri, 23 Apr 2021 12:34:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422081508.3942748-6-tientzu@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, mingo@kernel.org, jxgao@google.com,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 xypron.glpk@gmx.de, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 nouveau@lists.freedesktop.org, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22/04/2021 09:14, Claire Chang wrote:
> Add the initialization function to create restricted DMA pools from
> matching reserved-memory nodes.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>   include/linux/device.h  |  4 +++
>   include/linux/swiotlb.h |  3 +-
>   kernel/dma/swiotlb.c    | 80 +++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 86 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 38a2071cf776..4987608ea4ff 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -416,6 +416,7 @@ struct dev_links_info {
>    * @dma_pools:	Dma pools (if dma'ble device).
>    * @dma_mem:	Internal for coherent mem override.
>    * @cma_area:	Contiguous memory area for dma allocations
> + * @dma_io_tlb_mem: Internal for swiotlb io_tlb_mem override.
>    * @archdata:	For arch-specific additions.
>    * @of_node:	Associated device tree node.
>    * @fwnode:	Associated device node supplied by platform firmware.
> @@ -521,6 +522,9 @@ struct device {
>   #ifdef CONFIG_DMA_CMA
>   	struct cma *cma_area;		/* contiguous memory area for dma
>   					   allocations */
> +#endif
> +#ifdef CONFIG_DMA_RESTRICTED_POOL
> +	struct io_tlb_mem *dma_io_tlb_mem;
>   #endif
>   	/* arch specific additions */
>   	struct dev_archdata	archdata;
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 216854a5e513..03ad6e3b4056 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -72,7 +72,8 @@ extern enum swiotlb_force swiotlb_force;
>    *		range check to see if the memory was in fact allocated by this
>    *		API.
>    * @nslabs:	The number of IO TLB blocks (in groups of 64) between @start and
> - *		@end. This is command line adjustable via setup_io_tlb_npages.
> + *		@end. For default swiotlb, this is command line adjustable via
> + *		setup_io_tlb_npages.
>    * @used:	The number of used IO TLB block.
>    * @list:	The free list describing the number of free entries available
>    *		from each index.
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 57a9adb920bf..ffbb8724e06c 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -39,6 +39,13 @@
>   #ifdef CONFIG_DEBUG_FS
>   #include <linux/debugfs.h>
>   #endif
> +#ifdef CONFIG_DMA_RESTRICTED_POOL
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/slab.h>
> +#endif
>   
>   #include <asm/io.h>
>   #include <asm/dma.h>
> @@ -681,3 +688,76 @@ static int __init swiotlb_create_default_debugfs(void)
>   late_initcall(swiotlb_create_default_debugfs);
>   
>   #endif
> +
> +#ifdef CONFIG_DMA_RESTRICTED_POOL
> +static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
> +				    struct device *dev)
> +{
> +	struct io_tlb_mem *mem = rmem->priv;
> +	unsigned long nslabs = rmem->size >> IO_TLB_SHIFT;
> +
> +	if (dev->dma_io_tlb_mem)
> +		return 0;
> +
> +	/* Since multiple devices can share the same pool, the private data,
> +	 * io_tlb_mem struct, will be initialized by the first device attached
> +	 * to it.
> +	 */
> +	if (!mem) {
> +		mem = kzalloc(struct_size(mem, slots, nslabs), GFP_KERNEL);
> +		if (!mem)
> +			return -ENOMEM;
> +#ifdef CONFIG_ARM
> +		if (!PageHighMem(pfn_to_page(PHYS_PFN(rmem->base)))) {
> +			kfree(mem);
> +			return -EINVAL;
> +		}
> +#endif /* CONFIG_ARM */
> +		swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, false);
> +
> +		rmem->priv = mem;
> +	}
> +
> +#ifdef CONFIG_DEBUG_FS
> +	if (!io_tlb_default_mem->debugfs)
> +		io_tlb_default_mem->debugfs =
> +			debugfs_create_dir("swiotlb", NULL);

At this point it's possible for io_tlb_default_mem to be NULL, leading 
to a splat.

But even then if it's not and we have the situation where debugfs==NULL 
then the debugfs_create_dir() here will cause a subsequent attempt in 
swiotlb_create_debugfs() to fail (directory already exists) leading to 
mem->debugfs being assigned an error value. I suspect the creation of 
the debugfs directory needs to be separated from io_tlb_default_mem 
being set.

Other than that I gave this series a go with our prototype of Arm's 
Confidential Computer Architecture[1] - since the majority of the 
guest's memory is protected from the host the restricted DMA pool allows 
(only) a small area to be shared with the host.

After fixing (well hacking round) the above it all seems to be working 
fine with virtio drivers.

Thanks,

Steve

[1] 
https://www.arm.com/why-arm/architecture/security-features/arm-confidential-compute-architecture
