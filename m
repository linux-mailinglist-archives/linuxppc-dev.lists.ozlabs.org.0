Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F84F566652
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 11:42:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lcd5F4Gbtz3c1L
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 19:42:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lcd4p23p9z302S
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Jul 2022 19:42:30 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CE6823A;
	Tue,  5 Jul 2022 02:41:57 -0700 (PDT)
Received: from [10.57.86.91] (unknown [10.57.86.91])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2EAD3F792;
	Tue,  5 Jul 2022 02:41:54 -0700 (PDT)
Message-ID: <90fdcd19-30fc-1c9f-b8ca-e3cc7403f898@arm.com>
Date: Tue, 5 Jul 2022 10:41:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH kernel] powerpc/iommu: Add simple iommu_ops to report
 capabilities
Content-Language: en-GB
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20220705062235.2276125-1-aik@ozlabs.ru>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220705062235.2276125-1-aik@ozlabs.ru>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <jroedel@suse.de>, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, Alex Williamson <alex.williamson@redhat.com>, kvm-ppc@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux-foundation.org, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-07-05 07:22, Alexey Kardashevskiy wrote:
> Historically PPC64 managed to avoid using iommu_ops. The VFIO driver
> uses a SPAPR TCE sub-driver and all iommu_ops uses were kept in
> the Type1 VFIO driver. Recent development though has added a coherency
> capability check to the generic part of VFIO and essentially disabled
> VFIO on PPC64.
> 
> This adds a simple iommu_ops stub which reports support for cache
> coherency. Because bus_set_iommu() triggers IOMMU probing of PCI devices,
> this provides minimum code for the probing to not crash.

No more bus_set_iommu() please - I'll be sending a new version of this 
series very soon:

https://lore.kernel.org/linux-iommu/cover.1650890638.git.robin.murphy@arm.com/

Cheers,
Robin.

> The previous discussion is here:
> https://patchwork.ozlabs.org/project/kvm-ppc/patch/20220701061751.1955857-1-aik@ozlabs.ru/
> 
> Fixes: e8ae0e140c05 ("vfio: Require that devices support DMA cache coherence")
> Fixes: 70693f470848 ("vfio: Set DMA ownership for VFIO devices")
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> 
> I have not looked into the domains for ages, what is missing here? With this
> on top of 5.19-rc1 VFIO works again on my POWER9 box. Thanks,
> 
> ---
>   arch/powerpc/include/asm/iommu.h |  2 +
>   arch/powerpc/kernel/iommu.c      | 70 ++++++++++++++++++++++++++++++++
>   arch/powerpc/kernel/pci_64.c     |  3 ++
>   3 files changed, 75 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
> index 7e29c73e3dd4..4bdae0ee29d0 100644
> --- a/arch/powerpc/include/asm/iommu.h
> +++ b/arch/powerpc/include/asm/iommu.h
> @@ -215,6 +215,8 @@ extern long iommu_tce_xchg_no_kill(struct mm_struct *mm,
>   		enum dma_data_direction *direction);
>   extern void iommu_tce_kill(struct iommu_table *tbl,
>   		unsigned long entry, unsigned long pages);
> +
> +extern const struct iommu_ops spapr_tce_iommu_ops;
>   #else
>   static inline void iommu_register_group(struct iommu_table_group *table_group,
>   					int pci_domain_number,
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index 7e56ddb3e0b9..2205b448f7d5 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -1176,4 +1176,74 @@ void iommu_del_device(struct device *dev)
>   	iommu_group_remove_device(dev);
>   }
>   EXPORT_SYMBOL_GPL(iommu_del_device);
> +
> +/*
> + * A simple iommu_ops to allow less cruft in generic VFIO code.
> + */
> +static bool spapr_tce_iommu_capable(enum iommu_cap cap)
> +{
> +	switch (cap) {
> +	case IOMMU_CAP_CACHE_COHERENCY:
> +		return true;
> +	default:
> +		break;
> +	}
> +
> +	return false;
> +}
> +
> +static struct iommu_domain *spapr_tce_iommu_domain_alloc(unsigned int type)
> +{
> +	struct iommu_domain *domain = kzalloc(sizeof(*domain), GFP_KERNEL);
> +
> +	if (!domain)
> +		return NULL;
> +
> +	domain->geometry.aperture_start = 0;
> +	domain->geometry.aperture_end = ~0ULL;
> +	domain->geometry.force_aperture = true;
> +
> +	return domain;
> +}
> +
> +static struct iommu_device *spapr_tce_iommu_probe_device(struct device *dev)
> +{
> +	struct iommu_device *iommu_dev = kzalloc(sizeof(struct iommu_device), GFP_KERNEL);
> +
> +	iommu_dev->dev = dev;
> +	iommu_dev->ops = &spapr_tce_iommu_ops;
> +
> +	return iommu_dev;
> +}
> +
> +static void spapr_tce_iommu_release_device(struct device *dev)
> +{
> +}
> +
> +static int spapr_tce_iommu_attach_dev(struct iommu_domain *dom,
> +				      struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static struct iommu_group *spapr_tce_iommu_device_group(struct device *dev)
> +{
> +	struct iommu_group *grp = dev->iommu_group;
> +
> +	if (!grp)
> +		grp = ERR_PTR(-ENODEV);
> +	return grp;
> +}
> +
> +const struct iommu_ops spapr_tce_iommu_ops = {
> +	.capable = spapr_tce_iommu_capable,
> +	.domain_alloc = spapr_tce_iommu_domain_alloc,
> +	.probe_device = spapr_tce_iommu_probe_device,
> +	.release_device = spapr_tce_iommu_release_device,
> +	.device_group = spapr_tce_iommu_device_group,
> +	.default_domain_ops = &(const struct iommu_domain_ops) {
> +		.attach_dev = spapr_tce_iommu_attach_dev,
> +	}
> +};
> +
>   #endif /* CONFIG_IOMMU_API */
> diff --git a/arch/powerpc/kernel/pci_64.c b/arch/powerpc/kernel/pci_64.c
> index 19b03ddf5631..04bc0c52e45c 100644
> --- a/arch/powerpc/kernel/pci_64.c
> +++ b/arch/powerpc/kernel/pci_64.c
> @@ -20,6 +20,7 @@
>   #include <linux/irq.h>
>   #include <linux/vmalloc.h>
>   #include <linux/of.h>
> +#include <linux/iommu.h>
>   
>   #include <asm/processor.h>
>   #include <asm/io.h>
> @@ -27,6 +28,7 @@
>   #include <asm/byteorder.h>
>   #include <asm/machdep.h>
>   #include <asm/ppc-pci.h>
> +#include <asm/iommu.h>
>   
>   /* pci_io_base -- the base address from which io bars are offsets.
>    * This is the lowest I/O base address (so bar values are always positive),
> @@ -69,6 +71,7 @@ static int __init pcibios_init(void)
>   		ppc_md.pcibios_fixup();
>   
>   	printk(KERN_DEBUG "PCI: Probing PCI hardware done\n");
> +	bus_set_iommu(&pci_bus_type, &spapr_tce_iommu_ops);
>   
>   	return 0;
>   }
