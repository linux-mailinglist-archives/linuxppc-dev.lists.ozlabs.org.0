Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 634F3DC37
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 08:51:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44swLS6GqwzDqLk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 16:51:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="e9F/ei0r"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44swJx5yQkzDqLk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 16:50:24 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id h5so4856089pfo.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 23:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3nIoAVq8OubA6jKOhldirUznC+0bAeJb/lc6XTSTQaw=;
 b=e9F/ei0r79CZD8FOQyW2hXPa44u2tgFvzxZDS93YWLrkfkGB0tLd13w1QfZENwdCyO
 +PMosu8aYoZaRhWmHjsOE3d9R6j2euWM/MOQioyH/qhnLC5W9+klz96NhXppxRpQn8T/
 UFYvHZqDB8R6R+E0asjrft3Qdtg+sCuLf/4CYpF2bPBtzo0VbCRcV74coorTvlsxMmYB
 OTbwYdnyHHwk/UKumpPQ3zVi8GQjyopJmGN1Y48AfOljciZlL+dbPhcix7bQDWJzpLCY
 mzRFDpv7CzNA39dIo2Cy8epa2UCs7CvTj5xnFHqJNXm0cNkg1bm1Z0i70dsM8nSOf9g3
 GaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3nIoAVq8OubA6jKOhldirUznC+0bAeJb/lc6XTSTQaw=;
 b=UqP38Ub/NJ1uKr7TO3A+cNU2gFgffU7QPkEuukmBveDx/acCYzccryTS6bpz1gMJJV
 Qkd557iA092Q63ABHXfbdyGwTWSo48gV5DH+AoVSd44sFm4PLQd3EqdEiCoUWtL8ODn+
 MNzHdprfKNy9zO1Vs2WMHqyt+7vnnLTWf6Jx4G+JNi076ETbkF+RsuXAZP/Xq7kg3cI1
 D2Z2B6EETWx0XqW6sr4Y/T9SlbKA0wIAcxe88ZVEG7JY70L9S9Wt2nraS928M8RZAlSW
 6DN23T55jmB3nBE//DOTFPHWc29J5quDadFYNiA5w5BHiCmtzVXfK+z9qDTox1H3+C3B
 odaw==
X-Gm-Message-State: APjAAAWT3b/y+GgKrS6tPsfBlwLcxtKdyJM9XkWAU8u0GDK7oz0PvAvK
 L0FvROXr5rY4C4Z9mhR2i3Q/sg==
X-Google-Smtp-Source: APXvYqzihnlkF/B/C8oRafg2yI6viVoCBsuRKGbPOd+9LCCsqHQidjpXAo/J652uTCwY+s6l9pxvDQ==
X-Received: by 2002:a63:fd0c:: with SMTP id d12mr34374002pgh.172.1556520622360; 
 Sun, 28 Apr 2019 23:50:22 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id q20sm40669622pfi.166.2019.04.28.23.50.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Apr 2019 23:50:21 -0700 (PDT)
Subject: Re: [PATCH kernel v3] powerpc/powernv: Isolate NVLinks between
 GV100GL on Witherspoon
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: Alex Williamson <alex.williamson@redhat.com>
References: <20190411064844.8241-1-aik@ozlabs.ru>
 <20190411105251.20165f1d@x1.home>
 <4f7069cf-8c25-6fe1-42df-3b4af2d52172@ozlabs.ru>
Openpgp: preference=signencrypt
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <da41cd35-32f6-043e-13ab-9a225c4e910a@ozlabs.ru>
Date: Mon, 29 Apr 2019 16:50:16 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4f7069cf-8c25-6fe1-42df-3b4af2d52172@ozlabs.ru>
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
Cc: Jose Ricardo Ziviani <joserz@linux.ibm.com>, kvm@vger.kernel.org,
 Sam Bobroff <sbobroff@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm-ppc@vger.kernel.org,
 Piotr Jaroszynski <pjaroszynski@nvidia.com>,
 =?UTF-8?Q?Leonardo_Augusto_Guimar=c3=a3es_Garcia?= <lagarcia@br.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/04/2019 13:48, Alexey Kardashevskiy wrote:
> 
> 
> On 12/04/2019 02:52, Alex Williamson wrote:
>> On Thu, 11 Apr 2019 16:48:44 +1000
>> Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>
>>> The NVIDIA V100 SXM2 GPUs are connected to the CPU via PCIe links and
>>> (on POWER9) NVLinks. In addition to that, GPUs themselves have direct
>>> peer-to-peer NVLinks in groups of 2 to 4 GPUs with no buffers/latches
>>> between GPUs.
>>>
>>> Because of these interconnected NVLinks, the POWERNV platform puts such
>>> interconnected GPUs to the same IOMMU group. However users want to pass
>>> GPUs through individually which requires separate IOMMU groups.
>>>
>>> Thankfully V100 GPUs implement an interface to disable arbitrary links
>>> by programming link disabling mask via the GPU's BAR0. Once a link is
>>> disabled, it only can be enabled after performing the secondary bus reset
>>> (SBR) on the GPU. Since these GPUs do not advertise any other type of
>>> reset, it is reset by the platform's SBR handler.
>>>
>>> This adds an extra step to the POWERNV's SBR handler to block NVLinks to
>>> GPUs which do not belong to the same group as the GPU being reset.
>>>
>>> This adds a new "isolate_nvlink" kernel parameter to force GPU isolation;
>>> when enabled, every GPU gets placed in its own IOMMU group. The new
>>> parameter is off by default to preserve the existing behaviour.
>>>
>>> Before isolating:
>>> [nvdbg ~]$ nvidia-smi topo -m
>>>         GPU0    GPU1    GPU2    CPU Affinity
>>> GPU0     X      NV2     NV2     0-0
>>> GPU1    NV2      X      NV2     0-0
>>> GPU2    NV2     NV2      X      0-0
>>>
>>> After isolating:
>>> [nvdbg ~]$ nvidia-smi topo -m
>>>         GPU0    GPU1    GPU2    CPU Affinity
>>> GPU0     X      PHB     PHB     0-0
>>> GPU1    PHB      X      PHB     0-0
>>> GPU2    PHB     PHB      X      0-0
>>>
>>> Where:
>>>   X    = Self
>>>   PHB  = Connection traversing PCIe as well as a PCIe Host Bridge (typically the CPU)
>>>   NV#  = Connection traversing a bonded set of # NVLinks
>>>
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> ---
>>> Changes:
>>> v3:
>>> * added pci_err() for failed ioremap
>>> * reworked commit log
>>>
>>> v2:
>>> * this is rework of [PATCH kernel RFC 0/2] vfio, powerpc/powernv: Isolate GV100GL
>>> but this time it is contained in the powernv platform
>>> ---
>>>  arch/powerpc/platforms/powernv/Makefile      |   2 +-
>>>  arch/powerpc/platforms/powernv/pci.h         |   1 +
>>>  arch/powerpc/platforms/powernv/eeh-powernv.c |   1 +
>>>  arch/powerpc/platforms/powernv/npu-dma.c     |  24 +++-
>>>  arch/powerpc/platforms/powernv/nvlinkgpu.c   | 137 +++++++++++++++++++
>>>  5 files changed, 162 insertions(+), 3 deletions(-)
>>>  create mode 100644 arch/powerpc/platforms/powernv/nvlinkgpu.c
>>>
>>> diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
>>> index da2e99efbd04..60a10d3b36eb 100644
>>> --- a/arch/powerpc/platforms/powernv/Makefile
>>> +++ b/arch/powerpc/platforms/powernv/Makefile
>>> @@ -6,7 +6,7 @@ obj-y			+= opal-msglog.o opal-hmi.o opal-power.o opal-irqchip.o
>>>  obj-y			+= opal-kmsg.o opal-powercap.o opal-psr.o opal-sensor-groups.o
>>>  
>>>  obj-$(CONFIG_SMP)	+= smp.o subcore.o subcore-asm.o
>>> -obj-$(CONFIG_PCI)	+= pci.o pci-ioda.o npu-dma.o pci-ioda-tce.o
>>> +obj-$(CONFIG_PCI)	+= pci.o pci-ioda.o npu-dma.o pci-ioda-tce.o nvlinkgpu.o
>>>  obj-$(CONFIG_CXL_BASE)	+= pci-cxl.o
>>>  obj-$(CONFIG_EEH)	+= eeh-powernv.o
>>>  obj-$(CONFIG_PPC_SCOM)	+= opal-xscom.o
>>> diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
>>> index 8e36da379252..9fd3f391482c 100644
>>> --- a/arch/powerpc/platforms/powernv/pci.h
>>> +++ b/arch/powerpc/platforms/powernv/pci.h
>>> @@ -250,5 +250,6 @@ extern void pnv_pci_unlink_table_and_group(struct iommu_table *tbl,
>>>  extern void pnv_pci_setup_iommu_table(struct iommu_table *tbl,
>>>  		void *tce_mem, u64 tce_size,
>>>  		u64 dma_offset, unsigned int page_shift);
>>> +extern void pnv_try_isolate_nvidia_v100(struct pci_dev *gpdev);
>>>  
>>>  #endif /* __POWERNV_PCI_H */
>>> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
>>> index f38078976c5d..464b097d9635 100644
>>> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
>>> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
>>> @@ -937,6 +937,7 @@ void pnv_pci_reset_secondary_bus(struct pci_dev *dev)
>>>  		pnv_eeh_bridge_reset(dev, EEH_RESET_HOT);
>>>  		pnv_eeh_bridge_reset(dev, EEH_RESET_DEACTIVATE);
>>>  	}
>>> +	pnv_try_isolate_nvidia_v100(dev);
>>>  }
>>>  
>>>  static void pnv_eeh_wait_for_pending(struct pci_dn *pdn, const char *type,
>>> diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
>>> index dc23d9d2a7d9..d4f9ee6222b5 100644
>>> --- a/arch/powerpc/platforms/powernv/npu-dma.c
>>> +++ b/arch/powerpc/platforms/powernv/npu-dma.c
>>> @@ -22,6 +22,23 @@
>>>  
>>>  #include "pci.h"
>>>  
>>> +static bool isolate_nvlink;
>>> +
>>> +static int __init parse_isolate_nvlink(char *p)
>>> +{
>>> +	bool val;
>>> +
>>> +	if (!p)
>>> +		val = true;
>>> +	else if (kstrtobool(p, &val))
>>> +		return -EINVAL;
>>> +
>>> +	isolate_nvlink = val;
>>> +
>>> +	return 0;
>>> +}
>>> +early_param("isolate_nvlink", parse_isolate_nvlink);
>>> +
>>>  /*
>>>   * spinlock to protect initialisation of an npu_context for a particular
>>>   * mm_struct.
>>> @@ -549,7 +566,7 @@ struct iommu_table_group *pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
>>>  
>>>  	hose = pci_bus_to_host(npdev->bus);
>>>  
>>> -	if (hose->npu) {
>>> +	if (hose->npu && !isolate_nvlink) {
>>>  		table_group = &hose->npu->npucomp.table_group;
>>>  
>>>  		if (!table_group->group) {
>>> @@ -559,7 +576,10 @@ struct iommu_table_group *pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
>>>  					pe->pe_number);
>>>  		}
>>>  	} else {
>>> -		/* Create a group for 1 GPU and attached NPUs for POWER8 */
>>> +		/*
>>> +		 * Create a group for 1 GPU and attached NPUs for
>>> +		 * POWER8 (always) or POWER9 (when isolate_nvlink).
>>> +		 */
>>>  		pe->npucomp = kzalloc(sizeof(*pe->npucomp), GFP_KERNEL);
>>>  		table_group = &pe->npucomp->table_group;
>>>  		table_group->ops = &pnv_npu_peers_ops;
>>> diff --git a/arch/powerpc/platforms/powernv/nvlinkgpu.c b/arch/powerpc/platforms/powernv/nvlinkgpu.c
>>> new file mode 100644
>>> index 000000000000..2a97cb15b6d0
>>> --- /dev/null
>>> +++ b/arch/powerpc/platforms/powernv/nvlinkgpu.c
>>> @@ -0,0 +1,137 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +/*
>>> + * A helper to disable NVLinks between GPUs on IBM Withersponn platform.
>>> + *
>>> + * Copyright (C) 2019 IBM Corp.  All rights reserved.
>>> + *     Author: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License version 2 as
>>> + * published by the Free Software Foundation.
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include <linux/device.h>
>>> +#include <linux/of.h>
>>> +#include <linux/iommu.h>
>>> +#include <linux/pci.h>
>>> +
>>> +static int nvlinkgpu_is_ph_in_group(struct device *dev, void *data)
>>> +{
>>> +	return dev->of_node->phandle == *(phandle *) data;
>>> +}
>>> +
>>> +static u32 nvlinkgpu_get_disable_mask(struct device *dev)
>>> +{
>>> +	int npu, peer;
>>> +	u32 mask;
>>> +	struct device_node *dn;
>>> +	struct iommu_group *group;
>>> +
>>> +	dn = dev->of_node;
>>> +	if (!of_find_property(dn, "ibm,nvlink-peers", NULL))
>>> +		return 0;
>>> +
>>> +	group = iommu_group_get(dev);
>>> +	if (!group)
>>> +		return 0;
>>> +
>>> +	/*
>>> +	 * Collect links to keep which includes links to NPU and links to
>>> +	 * other GPUs in the same IOMMU group.
>>> +	 */
>>> +	for (npu = 0, mask = 0; ; ++npu) {
>>> +		u32 npuph = 0;
>>> +
>>> +		if (of_property_read_u32_index(dn, "ibm,npu", npu, &npuph))
>>> +			break;
>>> +
>>> +		for (peer = 0; ; ++peer) {
>>> +			u32 peerph = 0;
>>> +
>>> +			if (of_property_read_u32_index(dn, "ibm,nvlink-peers",
>>> +					peer, &peerph))
>>> +				break;
>>> +
>>> +			if (peerph != npuph &&
>>> +				!iommu_group_for_each_dev(group, &peerph,
>>> +					nvlinkgpu_is_ph_in_group))
>>> +				continue;
>>> +
>>> +			mask |= 1 << (peer + 16);
>>> +		}
>>> +	}
>>> +	iommu_group_put(group);
>>> +
>>> +	/* Disabling mechanism takes links to disable so invert it here */
>>> +	mask = ~mask & 0x3F0000;
>>> +
>>> +	return mask;
>>> +}
>>> +
>>> +void pnv_try_isolate_nvidia_v100(struct pci_dev *bridge)
>>> +{
>>> +	u32 mask, val;
>>> +	void __iomem *bar0_0, *bar0_120000, *bar0_a00000;
>>> +	struct pci_dev *pdev;
>>> +	u16 cmd = 0, cmdmask = PCI_COMMAND_MEMORY;
>>> +
>>> +	if (!bridge->subordinate)
>>> +		return;
>>> +
>>> +	pdev = list_first_entry_or_null(&bridge->subordinate->devices,
>>> +			struct pci_dev, bus_list);
>>> +	if (!pdev)
>>> +		return;
>>> +
>>> +	if (pdev->vendor != PCI_VENDOR_ID_NVIDIA)
>>> +		return;
>>> +
>>> +	mask = nvlinkgpu_get_disable_mask(&pdev->dev);
>>> +	if (!mask)
>>> +		return;
>>> +
>>> +	bar0_0 = pci_iomap_range(pdev, 0, 0, 0x10000);
>>> +	if (!bar0_0) {
>>> +		pci_err(pdev, "Error mapping BAR0 @0\n");
>>> +		return;
>>> +	}
>>> +	bar0_120000 = pci_iomap_range(pdev, 0, 0x120000, 0x10000);
>>> +	if (!bar0_120000) {
>>> +		pci_err(pdev, "Error mapping BAR0 @120000\n");
>>> +		goto bar0_0_unmap;
>>> +	}
>>> +	bar0_a00000 = pci_iomap_range(pdev, 0, 0xA00000, 0x10000);
>>> +	if (!bar0_a00000) {
>>> +		pci_err(pdev, "Error mapping BAR0 @A00000\n");
>>> +		goto bar0_120000_unmap;
>>> +	}
>>
>> Is it really necessary to do three separate ioremaps vs one that would
>> cover them all here?  I suspect you're just sneaking in PAGE_SIZE with
>> the 0x10000 size mappings anyway.  Seems like it would simplify setup,
>> error reporting, and cleanup to to ioremap to the PAGE_ALIGN'd range
>> of the highest register accessed. Thanks,
> 
> 
> Sure I can map it once, I just do not see the point in mapping/unmapping
> all 0xa10000>>16=161 system pages for a very short period of time while
> we know precisely that we need just 3 pages.
> 
> Repost?

Ping?

Can this go in as it is (i.e. should I ping Michael) or this needs
another round? It would be nice to get some formal acks. Thanks,



> 
> 
> 
>>
>> Alex
>>
>>> +
>>> +	pci_restore_state(pdev);
>>> +	pci_read_config_word(pdev, PCI_COMMAND, &cmd);
>>> +	if ((cmd & cmdmask) != cmdmask)
>>> +		pci_write_config_word(pdev, PCI_COMMAND, cmd | cmdmask);
>>> +
>>> +	/*
>>> +	 * The sequence is from "Tesla P100 and V100 SXM2 NVLink Isolation on
>>> +	 * Multi-Tenant Systems".
>>> +	 * The register names are not provided there either, hence raw values.
>>> +	 */
>>> +	iowrite32(0x4, bar0_120000 + 0x4C);
>>> +	iowrite32(0x2, bar0_120000 + 0x2204);
>>> +	val = ioread32(bar0_0 + 0x200);
>>> +	val |= 0x02000000;
>>> +	iowrite32(val, bar0_0 + 0x200);
>>> +	val = ioread32(bar0_a00000 + 0x148);
>>> +	val |= mask;
>>> +	iowrite32(val, bar0_a00000 + 0x148);
>>> +
>>> +	if ((cmd | cmdmask) != cmd)
>>> +		pci_write_config_word(pdev, PCI_COMMAND, cmd);
>>> +
>>> +	pci_iounmap(pdev, bar0_a00000);
>>> +bar0_120000_unmap:
>>> +	pci_iounmap(pdev, bar0_120000);
>>> +bar0_0_unmap:
>>> +	pci_iounmap(pdev, bar0_0);
>>> +}
>>
> 

-- 
Alexey
