Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FF572AA7E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 11:11:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdXJL56TRz3fCb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 19:11:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y12awBuz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y12awBuz;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Sat, 10 Jun 2023 19:10:57 AEST
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdXHP59nqz3dw2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 19:10:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686388257; x=1717924257;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KMjYJVV7xhJAbECrd8n0Me/3xdA4SvuInu4GPED6Yho=;
  b=Y12awBuzjkPAk8RzgAn8jQCYWe4DZj1ZKdZAUI/Utyc4D4UHLLhD9o8S
   l2A5cWyrA13L/zBG/4nRbQVDTxluv1CutHD8Cde4HJL6PSbSLcYSMgEYx
   lXLiqjNSZWvbPP/K4QbUSGu4ha6a+VjxtzwpIsknW9UUUXrQzb+hKhU4W
   rOChwNe8iQSIzDgARMpBHNscaDdxEJn7/zFux6ZChHYIuhsA5R0oImK4e
   iIpho6oj3XoBXem6gB9VbcD1gsUFj8J38nhbBtVSZe+Y78ArbGEsDNRGG
   5BMAACExcOHarLEmrTCBxBeo/GitG388cp45GJ5PjM3y82wfzdaiDskvP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="342425674"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="342425674"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 02:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="710623673"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="710623673"
Received: from allen-box.sh.intel.com (HELO [10.239.159.127]) ([10.239.159.127])
  by orsmga002.jf.intel.com with ESMTP; 10 Jun 2023 02:09:34 -0700
Message-ID: <b1225451-2a2d-0f06-da37-d476342db365@linux.intel.com>
Date: Sat, 10 Jun 2023 17:08:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 23/25] iommu: Add ops->domain_alloc_paging()
Content-Language: en-US
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
References: <23-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <23-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
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

On 6/10/23 3:56 AM, Jason Gunthorpe wrote:
> This callback requests the driver to create only a __IOMMU_DOMAIN_PAGING
> domain, so it saves a few lines in a lot of drivers needlessly checking
> the type.
> 
> More critically, this allows us to sweep out all the
> IOMMU_DOMAIN_UNMANAGED and IOMMU_DOMAIN_DMA checks from a lot of the
> drivers, simplifying what is going on in the code and ultimately removing
> the now-unused special cases in drivers where they did not support
> IOMMU_DOMAIN_DMA.
> 
> domain_alloc_paging() should return a struct iommu_domain that is
> functionally compatible with ARM_DMA_USE_IOMMU, dma-iommu.c and iommufd.
> 
> Be forwards looking and pass in a 'struct device *' argument. We can
> provide this when allocating the default_domain. No drivers will look at
> this.

I like this idea. :-)

> 
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 13 ++++++++++---
>   include/linux/iommu.h |  3 +++
>   2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 0346c05e108438..2cf523ff9c6f55 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1985,6 +1985,7 @@ void iommu_set_fault_handler(struct iommu_domain *domain,
>   EXPORT_SYMBOL_GPL(iommu_set_fault_handler);
>   
>   static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
> +						 struct device *dev,
>   						 unsigned int type)
>   {
>   	struct iommu_domain *domain;
> @@ -1992,8 +1993,13 @@ static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
>   
>   	if (alloc_type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
>   		return ops->identity_domain;
> +	else if (type & __IOMMU_DOMAIN_PAGING) {
> +		domain = ops->domain_alloc_paging(dev);

This might be problematic because not all IOMMU drivers implement this
callback now. In the missing cases, the code will always result in a
null pointer reference issue?

> +	} else if (ops->domain_alloc)
> +		domain = ops->domain_alloc(alloc_type);
> +	else
> +		return NULL;
>   
> -	domain = ops->domain_alloc(alloc_type);
>   	if (!domain)
>   		return NULL;
>   
> @@ -2024,14 +2030,15 @@ __iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
>   
>   	lockdep_assert_held(&group->mutex);
>   
> -	return __iommu_domain_alloc(dev_iommu_ops(dev), type);
> +	return __iommu_domain_alloc(dev_iommu_ops(dev), dev, type);
>   }
>   
>   struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
>   {
>   	if (bus == NULL || bus->iommu_ops == NULL)
>   		return NULL;
> -	return __iommu_domain_alloc(bus->iommu_ops, IOMMU_DOMAIN_UNMANAGED);
> +	return __iommu_domain_alloc(bus->iommu_ops, NULL,
> +				    IOMMU_DOMAIN_UNMANAGED);

Suppose that iommu_domain_alloc() is always called from device drivers
where device pointer is always available. Is it possible to convert it
to a real device pointer?

>   }
>   EXPORT_SYMBOL_GPL(iommu_domain_alloc);
>   
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 49331573f1d1f5..8e4d178c49c417 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -233,6 +233,8 @@ struct iommu_iotlb_gather {
>    * struct iommu_ops - iommu ops and capabilities
>    * @capable: check capability
>    * @domain_alloc: allocate iommu domain
> + * @domain_alloc_paging: Allocate an iommu_domain that can be used for
> + *                       UNMANAGED, DMA, and DMA_FQ domain types.
>    * @probe_device: Add device to iommu driver handling
>    * @release_device: Remove device from iommu driver handling
>    * @probe_finalize: Do final setup work after the device is added to an IOMMU
> @@ -264,6 +266,7 @@ struct iommu_ops {
>   
>   	/* Domain allocation and freeing by the iommu driver */
>   	struct iommu_domain *(*domain_alloc)(unsigned iommu_domain_type);
> +	struct iommu_domain *(*domain_alloc_paging)(struct device *dev);
>   
>   	struct iommu_device *(*probe_device)(struct device *dev);
>   	void (*release_device)(struct device *dev);

Best regards,
baolu
