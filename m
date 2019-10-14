Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A7BD602D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 12:31:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sFGf6cSHzDqjQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 21:31:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46sFDD47zTzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 21:29:31 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDE68337;
 Mon, 14 Oct 2019 03:29:27 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C3363F718;
 Mon, 14 Oct 2019 03:29:25 -0700 (PDT)
Subject: Re: [PATCH 1/2] dma-mapping: Add dma_addr_is_phys_addr()
To: David Gibson <david@gibson.dropbear.id.au>, Ram Pai <linuxram@us.ibm.com>
References: <1570843519-8696-1-git-send-email-linuxram@us.ibm.com>
 <1570843519-8696-2-git-send-email-linuxram@us.ibm.com>
 <20191014045139.GN4080@umbus.fritz.box>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <37609731-5539-b906-aa94-2ef0242795ac@arm.com>
Date: Mon, 14 Oct 2019 11:29:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191014045139.GN4080@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: andmike@us.ibm.com, mdroth@linux.vnet.ibm.com, b.zolnierkie@samsung.com,
 jasowang@redhat.com, aik@linux.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 paul.burton@mips.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14/10/2019 05:51, David Gibson wrote:
> On Fri, Oct 11, 2019 at 06:25:18PM -0700, Ram Pai wrote:
>> From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
>>
>> In order to safely use the DMA API, virtio needs to know whether DMA
>> addresses are in fact physical addresses and for that purpose,
>> dma_addr_is_phys_addr() is introduced.
>>
>> cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> cc: David Gibson <david@gibson.dropbear.id.au>
>> cc: Michael Ellerman <mpe@ellerman.id.au>
>> cc: Paul Mackerras <paulus@ozlabs.org>
>> cc: Michael Roth <mdroth@linux.vnet.ibm.com>
>> cc: Alexey Kardashevskiy <aik@linux.ibm.com>
>> cc: Paul Burton <paul.burton@mips.com>
>> cc: Robin Murphy <robin.murphy@arm.com>
>> cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>> cc: Marek Szyprowski <m.szyprowski@samsung.com>
>> cc: Christoph Hellwig <hch@lst.de>
>> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
>> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> 
> The change itself looks ok, so
> 
> Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
> 
> However, I would like to see the commit message (and maybe the inline
> comments) expanded a bit on what the distinction here is about.  Some
> of the text from the next patch would be suitable, about DMA addresses
> usually being in a different address space but not in the case of
> bounce buffering.

Right, this needs a much tighter definition. "DMA address happens to be 
a valid physical address" is true of various IOMMU setups too, but I 
can't believe it's meaningful in such cases.

If what you actually want is "DMA is direct or SWIOTLB" - i.e. "DMA 
address is physical address of DMA data (not necessarily the original 
buffer)" - wouldn't dma_is_direct() suffice?

Robin.

>> ---
>>   arch/powerpc/include/asm/dma-mapping.h | 21 +++++++++++++++++++++
>>   arch/powerpc/platforms/pseries/Kconfig |  1 +
>>   include/linux/dma-mapping.h            | 20 ++++++++++++++++++++
>>   kernel/dma/Kconfig                     |  3 +++
>>   4 files changed, 45 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/dma-mapping.h b/arch/powerpc/include/asm/dma-mapping.h
>> index 565d6f7..f92c0a4b 100644
>> --- a/arch/powerpc/include/asm/dma-mapping.h
>> +++ b/arch/powerpc/include/asm/dma-mapping.h
>> @@ -5,6 +5,8 @@
>>   #ifndef _ASM_DMA_MAPPING_H
>>   #define _ASM_DMA_MAPPING_H
>>   
>> +#include <asm/svm.h>
>> +
>>   static inline const struct dma_map_ops *get_arch_dma_ops(struct bus_type *bus)
>>   {
>>   	/* We don't handle the NULL dev case for ISA for now. We could
>> @@ -15,4 +17,23 @@ static inline const struct dma_map_ops *get_arch_dma_ops(struct bus_type *bus)
>>   	return NULL;
>>   }
>>   
>> +#ifdef CONFIG_ARCH_HAS_DMA_ADDR_IS_PHYS_ADDR
>> +/**
>> + * dma_addr_is_phys_addr - check whether a device DMA address is a physical
>> + *		address
>> + * @dev:	device to check
>> + *
>> + * Returns %true if any DMA address for this device happens to also be a valid
>> + * physical address (not necessarily of the same page).
>> + */
>> +static inline bool dma_addr_is_phys_addr(struct device *dev)
>> +{
>> +	/*
>> +	 * Secure guests always use the SWIOTLB, therefore DMA addresses are
>> +	 * actually the physical address of the bounce buffer.
>> +	 */
>> +	return is_secure_guest();
>> +}
>> +#endif
>> +
>>   #endif	/* _ASM_DMA_MAPPING_H */
>> diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
>> index 9e35cdd..0108150 100644
>> --- a/arch/powerpc/platforms/pseries/Kconfig
>> +++ b/arch/powerpc/platforms/pseries/Kconfig
>> @@ -152,6 +152,7 @@ config PPC_SVM
>>   	select SWIOTLB
>>   	select ARCH_HAS_MEM_ENCRYPT
>>   	select ARCH_HAS_FORCE_DMA_UNENCRYPTED
>> +	select ARCH_HAS_DMA_ADDR_IS_PHYS_ADDR
>>   	help
>>   	 There are certain POWER platforms which support secure guests using
>>   	 the Protected Execution Facility, with the help of an Ultravisor
>> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
>> index f7d1eea..6df5664 100644
>> --- a/include/linux/dma-mapping.h
>> +++ b/include/linux/dma-mapping.h
>> @@ -693,6 +693,26 @@ static inline bool dma_addressing_limited(struct device *dev)
>>   			    dma_get_required_mask(dev);
>>   }
>>   
>> +#ifndef CONFIG_ARCH_HAS_DMA_ADDR_IS_PHYS_ADDR
>> +/**
>> + * dma_addr_is_phys_addr - check whether a device DMA address is a physical
>> + *		address
>> + * @dev:	device to check
>> + *
>> + * Returns %true if any DMA address for this device happens to also be a valid
>> + * physical address (not necessarily of the same page).
>> + */
>> +static inline bool dma_addr_is_phys_addr(struct device *dev)
>> +{
>> +	/*
>> +	 * Except in very specific setups, DMA addresses exist in a different
>> +	 * address space from CPU physical addresses and cannot be directly used
>> +	 * to reference system memory.
>> +	 */
>> +	return false;
>> +}
>> +#endif
>> +
>>   #ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
>>   void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>>   		const struct iommu_ops *iommu, bool coherent);
>> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
>> index 9decbba..6209b46 100644
>> --- a/kernel/dma/Kconfig
>> +++ b/kernel/dma/Kconfig
>> @@ -51,6 +51,9 @@ config ARCH_HAS_DMA_MMAP_PGPROT
>>   config ARCH_HAS_FORCE_DMA_UNENCRYPTED
>>   	bool
>>   
>> +config ARCH_HAS_DMA_ADDR_IS_PHYS_ADDR
>> +	bool
>> +
>>   config DMA_NONCOHERENT_CACHE_SYNC
>>   	bool
>>   
> 
