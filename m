Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB66779D2A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 07:00:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C2n67pHs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RN7l75kSdz3cLX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 15:00:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C2n67pHs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mgamail.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RN7kC62rXz2yTN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Aug 2023 14:59:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691816372; x=1723352372;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+iNjZB2u/KnDtQIHQv6xVfauWGpLAEIKP+FIowSusMs=;
  b=C2n67pHsXdjs91mI1AYu42KGE1UIxxFb6cf2A2lWf9NRtaGTD1HeENpq
   yH77668rvBRfnw0HjW3L/7G3ostYjP4cwuz+R+vg6c/Ntzw2iwxzXG+HU
   y081/9z3m4kmR8m6Ggb+JdP3s2Ow6hvlSh6bGLTWWKd23yNMTkEWHQOT1
   34P62iZnUir2aPi4Kui49LYjHnBmQTsNRxArR94o5/B0oMAw06KqE+1hf
   0ruMZcqUOqT8tzOvjKWw98aFB3i/6f/ir9FyElcKahMUcBejr/6Dy4RHs
   jJZN8OLaBZpvevriMTiWitz7ggoWpd2GtrMCCXAS/j+fDlY6PgjHwj9Gb
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="374569552"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="374569552"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 21:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="856493438"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="856493438"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.214.60]) ([10.254.214.60])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 21:57:18 -0700
Message-ID: <0e47dc9e-1cee-c1c5-5d1a-5f861095b5a0@linux.intel.com>
Date: Sat, 12 Aug 2023 12:57:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 15/25] iommufd/selftest: Make the mock iommu driver
 into a real driver
To: Jason Gunthorpe <jgg@nvidia.com>, Andy Gross <agross@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Bjorn Andersson
 <andersson@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linuxppc-dev@lists.ozlabs.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy
 <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
References: <15-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <15-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
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
Cc: Thierry Reding <treding@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, baolu.lu@linux.intel.com, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023/8/3 8:08, Jason Gunthorpe wrote:
> I've avoided doing this because there is no way to make this happen
> without an intrusion into the core code. Up till now this has avoided
> needing the core code's probe path with some hackery - but now that
> default domains are becoming mandatory it is unavoidable. The core probe
> path must be run to set the default_domain, only it can do it. Without
> a default domain iommufd can't use the group.
> 
> Make it so that iommufd selftest can create a real iommu driver and bind
> it only to is own private bus. Add iommu_device_register_bus() as a core
> code helper to make this possible. It simply sets the right pointers and
> registers the notifier block. The mock driver then works like any normal
> driver should, with probe triggered by the bus ops
> 
> When the bus->iommu_ops stuff is fully unwound we can probably do better
> here and remove this special case.
> 
> Remove set_platform_dma_ops from selftest and make it use a BLOCKED
> default domain.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/iommu-priv.h              |  16 +++
>   drivers/iommu/iommu.c                   |  43 +++++++
>   drivers/iommu/iommufd/iommufd_private.h |   5 +-
>   drivers/iommu/iommufd/main.c            |   8 +-
>   drivers/iommu/iommufd/selftest.c        | 149 +++++++++++++-----------
>   5 files changed, 152 insertions(+), 69 deletions(-)
>   create mode 100644 drivers/iommu/iommu-priv.h
> 
> diff --git a/drivers/iommu/iommu-priv.h b/drivers/iommu/iommu-priv.h
> new file mode 100644
> index 00000000000000..1cbc04b9cf7297
> --- /dev/null
> +++ b/drivers/iommu/iommu-priv.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (c) 2023, NVIDIA CORPORATION & AFFILIATES.
> + */
> +#ifndef __IOMMU_PRIV_H
> +#define __IOMMU_PRIV_H
> +
> +#include <linux/iommu.h>
> +
> +int iommu_device_register_bus(struct iommu_device *iommu,
> +			      const struct iommu_ops *ops, struct bus_type *bus,
> +			      struct notifier_block *nb);
> +void iommu_device_unregister_bus(struct iommu_device *iommu,
> +				 struct bus_type *bus,
> +				 struct notifier_block *nb);
> +
> +#endif
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index a1a93990b3a211..7fae866af0db7a 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -36,6 +36,7 @@
>   #include "dma-iommu.h"
>   
>   #include "iommu-sva.h"
> +#include "iommu-priv.h"
>   
>   static struct kset *iommu_group_kset;
>   static DEFINE_IDA(iommu_group_ida);
> @@ -290,6 +291,48 @@ void iommu_device_unregister(struct iommu_device *iommu)
>   }
>   EXPORT_SYMBOL_GPL(iommu_device_unregister);
>   
> +#if IS_ENABLED(CONFIG_IOMMUFD_TEST)
> +void iommu_device_unregister_bus(struct iommu_device *iommu,
> +				 struct bus_type *bus,
> +				 struct notifier_block *nb)
> +{
> +	bus_unregister_notifier(bus, nb);
> +	iommu_device_unregister(iommu);
> +}
> +EXPORT_SYMBOL_GPL(iommu_device_unregister_bus);
> +
> +/*
> + * Register an iommu driver against a single bus. This is only used by iommufd
> + * selftest to create a mock iommu driver. The caller must provide
> + * some memory to hold a notifier_block.
> + */
> +int iommu_device_register_bus(struct iommu_device *iommu,
> +			      const struct iommu_ops *ops, struct bus_type *bus,
> +			      struct notifier_block *nb)
> +{
> +	int err;
> +
> +	iommu->ops = ops;
> +	nb->notifier_call = iommu_bus_notifier;
> +	err = bus_register_notifier(bus, nb);
> +	if (err)
> +		return err;
> +
> +	spin_lock(&iommu_device_lock);
> +	list_add_tail(&iommu->list, &iommu_device_list);
> +	spin_unlock(&iommu_device_lock);
> +
> +	bus->iommu_ops = ops;
> +	err = bus_iommu_probe(bus);
> +	if (err) {
> +		iommu_device_unregister_bus(iommu, bus, nb);
> +		return err;
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(iommu_device_register_bus);
> +#endif

Although

#if IS_ENABLED(CONFIG_IOMMUFD_TEST)
... ...
#endif

doesn't look so comfortable, this is also the most concise method that I
can think of.

So,

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
