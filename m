Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 509483693B5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 15:36:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRb0M1LVnz301q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 23:36:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FRb013Jb7z2yRW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 23:35:44 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FD1113A1;
 Fri, 23 Apr 2021 06:35:42 -0700 (PDT)
Received: from [10.57.62.63] (unknown [10.57.62.63])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 492D03F73B;
 Fri, 23 Apr 2021 06:35:34 -0700 (PDT)
Subject: Re: [PATCH v5 16/16] of: Add plumbing for restricted DMA pool
To: Claire Chang <tientzu@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20210422081508.3942748-1-tientzu@chromium.org>
 <20210422081508.3942748-17-tientzu@chromium.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <03c5bc8a-3965-bf1d-01a4-97d074dfbe2b@arm.com>
Date: Fri, 23 Apr 2021 14:35:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210422081508.3942748-17-tientzu@chromium.org>
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
 jani.nikula@linux.intel.com, Nicolas Boichat <drinkcat@chromium.org>,
 rodrigo.vivi@intel.com, bhelgaas@google.com,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 nouveau@lists.freedesktop.org, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-04-22 09:15, Claire Chang wrote:
> If a device is not behind an IOMMU, we look up the device node and set
> up the restricted DMA when the restricted-dma-pool is presented.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>   drivers/of/address.c    | 25 +++++++++++++++++++++++++
>   drivers/of/device.c     |  3 +++
>   drivers/of/of_private.h |  5 +++++
>   3 files changed, 33 insertions(+)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 54f221dde267..fff3adfe4986 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -8,6 +8,7 @@
>   #include <linux/logic_pio.h>
>   #include <linux/module.h>
>   #include <linux/of_address.h>
> +#include <linux/of_reserved_mem.h>
>   #include <linux/pci.h>
>   #include <linux/pci_regs.h>
>   #include <linux/sizes.h>
> @@ -1109,6 +1110,30 @@ bool of_dma_is_coherent(struct device_node *np)
>   }
>   EXPORT_SYMBOL_GPL(of_dma_is_coherent);
>   
> +int of_dma_set_restricted_buffer(struct device *dev)
> +{
> +	struct device_node *node;
> +	int count, i;
> +
> +	if (!dev->of_node)
> +		return 0;
> +
> +	count = of_property_count_elems_of_size(dev->of_node, "memory-region",
> +						sizeof(phandle));
> +	for (i = 0; i < count; i++) {
> +		node = of_parse_phandle(dev->of_node, "memory-region", i);
> +		/* There might be multiple memory regions, but only one
> +		 * restriced-dma-pool region is allowed.
> +		 */

What's the use-case for having multiple regions if the restricted pool 
is by definition the only one accessible?

Robin.

> +		if (of_device_is_compatible(node, "restricted-dma-pool") &&
> +		    of_device_is_available(node))
> +			return of_reserved_mem_device_init_by_idx(
> +				dev, dev->of_node, i);
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * of_mmio_is_nonposted - Check if device uses non-posted MMIO
>    * @np:	device node
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index c5a9473a5fb1..d8d865223e51 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -165,6 +165,9 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
>   
>   	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
>   
> +	if (!iommu)
> +		return of_dma_set_restricted_buffer(dev);
> +
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(of_dma_configure_id);
> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index d717efbd637d..e9237f5eff48 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -163,12 +163,17 @@ struct bus_dma_region;
>   #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
>   int of_dma_get_range(struct device_node *np,
>   		const struct bus_dma_region **map);
> +int of_dma_set_restricted_buffer(struct device *dev);
>   #else
>   static inline int of_dma_get_range(struct device_node *np,
>   		const struct bus_dma_region **map)
>   {
>   	return -ENODEV;
>   }
> +static inline int of_dma_get_restricted_buffer(struct device *dev)
> +{
> +	return -ENODEV;
> +}
>   #endif
>   
>   #endif /* _LINUX_OF_PRIVATE_H */
> 
