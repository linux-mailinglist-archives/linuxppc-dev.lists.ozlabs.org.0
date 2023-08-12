Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A704D779C46
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 03:37:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AKQnhVK4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RN3FT3fpBz3cP3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 11:37:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AKQnhVK4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mgamail.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RN3DW6GCHz309D
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Aug 2023 11:36:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691804220; x=1723340220;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=InQwijdXw9W+QsSLGg97dJTKcOqeU8+07ewmIVxJV4I=;
  b=AKQnhVK48gEl5JlIwnFhukiSnhL3ufR3KHamw/arZZy5vc+1OU6VFTXY
   14jJyDPC4z6GZtRvEO9IrCAFABv0k2pmbpu9BAf43rA6l32gCMDmYkDLR
   TqsFcsOCtmdKrRVswBanoJoguc+MKCppjIn/QKOSpSgPkZFQD7SX9xU6M
   ENlv5LBw8y4C7LhRSfuPqBk3VdE2VtlE3akk1CClac2cHj2vt5vSgeViw
   sceOv4tpRt3equCdvkfklndfDGKSNVdH6PkH3zIWlbawloC0ZqLHTxZF5
   +T8X6TBxXgs+ntYEEYOathD8LBOmCvhyN18rCrGfrM6cEMhgzfisN4M6p
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371797644"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="371797644"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 18:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="1063472658"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="1063472658"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.215.79]) ([10.254.215.79])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 18:36:35 -0700
Message-ID: <dde32ea5-2b1a-1148-c329-3c52ffcb71a7@linux.intel.com>
Date: Sat, 12 Aug 2023 09:36:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 02/25] iommu: Add IOMMU_DOMAIN_PLATFORM
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
References: <2-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <2-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
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

On 2023/8/3 8:07, Jason Gunthorpe wrote:
> This is used when the iommu driver is taking control of the dma_ops,
> currently only on S390 and power spapr. It is designed to preserve the
> original ops->detach_dev() semantic that these S390 was built around.
> 
> Provide an opaque domain type and a 'default_domain' ops value that allows
> the driver to trivially force any single domain as the default domain.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 14 +++++++++++++-
>   include/linux/iommu.h |  6 ++++++
>   2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 5e3cdc9f3a9e78..c64365169b678d 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1705,6 +1705,17 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
>   
>   	lockdep_assert_held(&group->mutex);
>   
> +	/*
> +	 * Allow legacy drivers to specify the domain that will be the default
> +	 * domain. This should always be either an IDENTITY or PLATFORM domain.
> +	 * Do not use in new drivers.
> +	 */
> +	if (bus->iommu_ops->default_domain) {
> +		if (req_type)
> +			return ERR_PTR(-EINVAL);
> +		return bus->iommu_ops->default_domain;
> +	}
> +
>   	if (req_type)
>   		return __iommu_group_alloc_default_domain(bus, group, req_type);
>   
> @@ -1967,7 +1978,8 @@ void iommu_domain_free(struct iommu_domain *domain)
>   	if (domain->type == IOMMU_DOMAIN_SVA)
>   		mmdrop(domain->mm);
>   	iommu_put_dma_cookie(domain);
> -	domain->ops->free(domain);
> +	if (domain->ops->free)
> +		domain->ops->free(domain);
>   }
>   EXPORT_SYMBOL_GPL(iommu_domain_free);
>   
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index e05c93b6c37fba..87aebba474e093 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -64,6 +64,7 @@ struct iommu_domain_geometry {
>   #define __IOMMU_DOMAIN_DMA_FQ	(1U << 3)  /* DMA-API uses flush queue    */
>   
>   #define __IOMMU_DOMAIN_SVA	(1U << 4)  /* Shared process address space */
> +#define __IOMMU_DOMAIN_PLATFORM	(1U << 5)
>   
>   #define IOMMU_DOMAIN_ALLOC_FLAGS ~__IOMMU_DOMAIN_DMA_FQ
>   /*
> @@ -81,6 +82,8 @@ struct iommu_domain_geometry {
>    *				  invalidation.
>    *	IOMMU_DOMAIN_SVA	- DMA addresses are shared process addresses
>    *				  represented by mm_struct's.
> + *	IOMMU_DOMAIN_PLATFORM	- Legacy domain for drivers that do their own
> + *				  dma_api stuff. Do not use in new drivers.
>    */
>   #define IOMMU_DOMAIN_BLOCKED	(0U)
>   #define IOMMU_DOMAIN_IDENTITY	(__IOMMU_DOMAIN_PT)
> @@ -91,6 +94,7 @@ struct iommu_domain_geometry {
>   				 __IOMMU_DOMAIN_DMA_API |	\
>   				 __IOMMU_DOMAIN_DMA_FQ)
>   #define IOMMU_DOMAIN_SVA	(__IOMMU_DOMAIN_SVA)
> +#define IOMMU_DOMAIN_PLATFORM	(__IOMMU_DOMAIN_PLATFORM)
>   
>   struct iommu_domain {
>   	unsigned type;
> @@ -256,6 +260,7 @@ struct iommu_iotlb_gather {
>    * @owner: Driver module providing these ops
>    * @identity_domain: An always available, always attachable identity
>    *                   translation.
> + * @default_domain: If not NULL this will always be set as the default domain.
>    */
>   struct iommu_ops {
>   	bool (*capable)(struct device *dev, enum iommu_cap);
> @@ -290,6 +295,7 @@ struct iommu_ops {
>   	unsigned long pgsize_bitmap;
>   	struct module *owner;
>   	struct iommu_domain *identity_domain;
> +	struct iommu_domain *default_domain;

I am imaging whether we can merge above two pointers into a single one.
It is either an IDENTITY or PLATFORM domain and the core will choose it
as the default domain of a group if iommu_group_alloc_default_domain()
fails to allocate one through the iommu dev_ops.

Those iommu drivers that could result in a NULL default domain could
provide such domain and guarantee that this domain is always usable for
devices.

Probably we could give it a more meaningful name? For example,
supplemental_domain or rescue_domain?

I am not sure whether this can address the NULL-default-domain issues
of all drivers this series tries to address. So just for discussion
purpose.

Best regards,
baolu
