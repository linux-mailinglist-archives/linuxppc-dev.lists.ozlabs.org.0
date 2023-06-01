Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C02471F27A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 20:58:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXFld171qz3f0f
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 04:58:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXFl74dZdz3cBV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 04:58:10 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69B4A1063;
	Thu,  1 Jun 2023 11:58:24 -0700 (PDT)
Received: from [10.57.84.85] (unknown [10.57.84.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F213C3F7BD;
	Thu,  1 Jun 2023 11:57:30 -0700 (PDT)
Message-ID: <d3edc0d4-7fc6-fb7e-a3aa-2dba2ad86303@arm.com>
Date: Thu, 1 Jun 2023 19:57:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 08/25] iommu: Allow an IDENTITY domain as the
 default_domain in ARM32
Content-Language: en-GB
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
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy
 <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
References: <8-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <8-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
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
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-05-16 01:00, Jason Gunthorpe wrote:
> Even though dma-iommu.c and CONFIG_ARM_DMA_USE_IOMMU do approximately the
> same stuff, the way they relate to the IOMMU core is quiet different.
> 
> dma-iommu.c expects the core code to setup an UNMANAGED domain (of type
> IOMMU_DOMAIN_DMA) and then configures itself to use that domain. This
> becomes the default_domain for the group.
> 
> ARM_DMA_USE_IOMMU does not use the default_domain, instead it directly
> allocates an UNMANAGED domain and operates it just like an external
> driver. In this case group->default_domain is NULL.
> 
> If the driver provides a global static identity_domain then automatically
> use it as the default_domain when in ARM_DMA_USE_IOMMU mode.
> 
> This allows drivers that implemented default_domain == NULL as an IDENTITY
> translation to trivially get a properly labeled non-NULL default_domain on
> ARM32 configs.
> 
> With this arrangment when ARM_DMA_USE_IOMMU wants to disconnect from the
> device the normal detach_domain flow will restore the IDENTITY domain as
> the default domain. Overall this makes attach_dev() of the IDENTITY domain
> called in the same places as detach_dev().
> 
> This effectively migrates these drivers to default_domain mode. For
> drivers that support ARM64 they will gain support for the IDENTITY
> translation mode for the dma_api and behave in a uniform way.
> 
> Drivers use this by setting ops->identity_domain to a static singleton
> iommu_domain that implements the identity attach. If the core detects
> ARM_DMA_USE_IOMMU mode then it automatically attaches the IDENTITY domain
> during probe.
> 
> Drivers can continue to prevent the use of DMA translation by returning
> IOMMU_DOMAIN_IDENTITY from def_domain_type, this will completely prevent
> IOMMU_DMA from running but will not impact ARM_DMA_USE_IOMMU.
> 
> This allows removing the set_platform_dma_ops() from every remaining
> driver.
> 
> Remove the set_platform_dma_ops from rockchip and mkt_v1 as all it does
> is set an existing global static identity domain. mkt_v1 does not support
> IOMMU_DOMAIN_DMA and it does not compile on ARM64 so this transformation
> is safe.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/iommu.c          | 40 +++++++++++++++++++++++++++++-----
>   drivers/iommu/mtk_iommu_v1.c   | 12 ----------
>   drivers/iommu/rockchip-iommu.c | 10 ---------
>   3 files changed, 35 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 8ba90571449cec..bed7cb6e5ee65b 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1757,18 +1757,48 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
>   	int type;
>   
>   	lockdep_assert_held(&group->mutex);
> +
> +	/*
> +	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
> +	 * identity_domain and it will automatically become their default
> +	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
> +	 * Override the selection to IDENTITY if we are sure the driver supports
> +	 * it.
> +	 */
> +	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && ops->identity_domain) {

If I cared about arm-smmu on 32-bit, I'd bring that up again, but 
honestly I'm not sure that I do... I think it might end up working after 
patch #21, and it's currently still broken for lack of .set_platform_dma 
anyway, so meh.

> +		type = IOMMU_DOMAIN_IDENTITY;
> +		if (best_type && type && best_type != type)
> +			goto err;
> +		best_type = target_type = IOMMU_DOMAIN_IDENTITY;
> +	}
> +
>   	for_each_group_device(group, gdev) {
>   		type = best_type;
>   		if (ops->def_domain_type) {
>   			type = ops->def_domain_type(gdev->dev);
> -			if (best_type && type && best_type != type)
> +			if (best_type && type && best_type != type) {
> +				/* Stick with the last driver override we saw */
> +				best_type = type;
>   				goto err;
> +			}
>   		}
>   
>   		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
> -			type = IOMMU_DOMAIN_DMA;
> -			if (best_type && type && best_type != type)
> -				goto err;
> +			/*
> +			 * We don't have any way for the iommu core code to
> +			 * force arm_iommu to activate so we can't enforce
> +			 * trusted. Log it and keep going with the IDENTITY
> +			 * default domain.
> +			 */
> +			if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
> +				dev_warn(
> +					gdev->dev,
> +					"PCI device is untrusted but ARM32 does not support secure IOMMU operation, continuing anyway.\n");

To within experimental error, this is dead code. The ARM DMA ops don't 
even understand groups, so already have the much bigger problem of being 
broken for any non-trivial PCI setup anyway. That's if you could even 
find a 32-bit SoC with both PCI(e) and a relevant IOMMU. None of those 
will have Thunderbolt, and I expect even fewer would be using the 
"external-facing" DT property (which is likely newer than they are) for 
any other reason.

Thanks,
Robin.

> +			} else {
> +				type = IOMMU_DOMAIN_DMA;
> +				if (best_type && type && best_type != type)
> +					goto err;
> +			}
>   		}
>   		best_type = type;
>   		last_dev = gdev->dev;
> @@ -1790,7 +1820,7 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
>   		"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
>   		iommu_domain_type_str(type), dev_name(last_dev),
>   		iommu_domain_type_str(best_type));
> -	return 0;
> +	return best_type;
>   }
>   
>   static void iommu_group_do_probe_finalize(struct device *dev)
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index cc3e7d53d33ad9..7c0c1d50df5f75 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -337,11 +337,6 @@ static struct iommu_domain mtk_iommu_v1_identity_domain = {
>   	.ops = &mtk_iommu_v1_identity_ops,
>   };
>   
> -static void mtk_iommu_v1_set_platform_dma(struct device *dev)
> -{
> -	mtk_iommu_v1_identity_attach(&mtk_iommu_v1_identity_domain, dev);
> -}
> -
>   static int mtk_iommu_v1_map(struct iommu_domain *domain, unsigned long iova,
>   			    phys_addr_t paddr, size_t pgsize, size_t pgcount,
>   			    int prot, gfp_t gfp, size_t *mapped)
> @@ -457,11 +452,6 @@ static int mtk_iommu_v1_create_mapping(struct device *dev, struct of_phandle_arg
>   	return 0;
>   }
>   
> -static int mtk_iommu_v1_def_domain_type(struct device *dev)
> -{
> -	return IOMMU_DOMAIN_IDENTITY;
> -}
> -
>   static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
>   {
>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> @@ -599,10 +589,8 @@ static const struct iommu_ops mtk_iommu_v1_ops = {
>   	.probe_device	= mtk_iommu_v1_probe_device,
>   	.probe_finalize = mtk_iommu_v1_probe_finalize,
>   	.release_device	= mtk_iommu_v1_release_device,
> -	.def_domain_type = mtk_iommu_v1_def_domain_type,
>   	.device_group	= generic_device_group,
>   	.pgsize_bitmap	= MT2701_IOMMU_PAGE_SIZE,
> -	.set_platform_dma_ops = mtk_iommu_v1_set_platform_dma,
>   	.owner          = THIS_MODULE,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
>   		.attach_dev	= mtk_iommu_v1_attach_device,
> diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
> index ebce56d6e9c634..9e1296a856ac4c 100644
> --- a/drivers/iommu/rockchip-iommu.c
> +++ b/drivers/iommu/rockchip-iommu.c
> @@ -1026,13 +1026,6 @@ static struct iommu_domain rk_identity_domain = {
>   	.ops = &rk_identity_ops,
>   };
>   
> -#ifdef CONFIG_ARM
> -static void rk_iommu_set_platform_dma(struct device *dev)
> -{
> -	WARN_ON(rk_iommu_identity_attach(&rk_identity_domain, dev));
> -}
> -#endif
> -
>   static int rk_iommu_attach_device(struct iommu_domain *domain,
>   		struct device *dev)
>   {
> @@ -1211,9 +1204,6 @@ static const struct iommu_ops rk_iommu_ops = {
>   	.probe_device = rk_iommu_probe_device,
>   	.release_device = rk_iommu_release_device,
>   	.device_group = rk_iommu_device_group,
> -#ifdef CONFIG_ARM
> -	.set_platform_dma_ops = rk_iommu_set_platform_dma,
> -#endif
>   	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
>   	.of_xlate = rk_iommu_of_xlate,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
