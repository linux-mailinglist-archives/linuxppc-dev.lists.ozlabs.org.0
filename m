Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BC771F1BD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 20:26:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXF2w271Yz3dyB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 04:26:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXF2P6jhgz3c7g
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 04:26:19 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B9511063;
	Thu,  1 Jun 2023 11:26:31 -0700 (PDT)
Received: from [10.57.84.85] (unknown [10.57.84.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B053E3F663;
	Thu,  1 Jun 2023 11:25:38 -0700 (PDT)
Message-ID: <914124dd-c319-15c5-cc03-c5db0e4002f4@arm.com>
Date: Thu, 1 Jun 2023 19:25:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 04/25] iommu: Add IOMMU_DOMAIN_PLATFORM for S390
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
References: <4-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <4-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
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
> The PLATFORM domain will be set as the default domain and attached as
> normal during probe. The driver will ignore the initial attach from a NULL
> domain to the PLATFORM domain.
> 
> After this, the PLATFORM domain's attach_dev will be called whenever we
> detach from an UNMANAGED domain (eg for VFIO). This is the same time the
> original design would have called op->detach_dev().
> 
> This is temporary until the S390 dma-iommu.c conversion is merged.

If we do need a stopgap here, can we please just call the current 
situation an identity domain? It's true enough in the sense that the 
IOMMU API is not offering any translation or guarantee of isolation, so 
the semantics of an identity domain - from the point of view of anything 
inside the IOMMU API that would be looking - are no weaker or less 
useful than a "platform" domain whose semantics are intentionally unknown.

Then similarly for patch #3 - since we already know s390 is temporary, 
it seems an anathema to introduce a whole domain type with its own weird 
ops->default_domain mechanism solely for POWER to not actually use 
domains with.

In terms of reasoning, I don't see that IOMMU_DOMAIN_PLATFORM is any 
more useful than a NULL default domain, it just renames the problem, and 
gives us more code to maintain for the privilege. As I say, though, we 
don't actually need to juggle the semantic of a "we don't know what's 
happening here" domain around any further, since it works out that a 
"we're not influencing anything here" domain actually suffices for what 
we want to reason about, and those are already well-defined. Sure, the 
platform DMA ops *might* be doing more, but that's beyond the scope of 
the IOMMU API either way. At that point, lo and behold, s390 and POWER 
now look just like ARM and the core code only needs a single special 
case for arch-specific default identity domains, lovely!

Thanks,
Robin.

> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/s390-iommu.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
> index fbf59a8db29b11..f0c867c57a5b9b 100644
> --- a/drivers/iommu/s390-iommu.c
> +++ b/drivers/iommu/s390-iommu.c
> @@ -142,14 +142,31 @@ static int s390_iommu_attach_device(struct iommu_domain *domain,
>   	return 0;
>   }
>   
> -static void s390_iommu_set_platform_dma(struct device *dev)
> +/*
> + * Switch control over the IOMMU to S390's internal dma_api ops
> + */
> +static int s390_iommu_platform_attach(struct iommu_domain *platform_domain,
> +				      struct device *dev)
>   {
>   	struct zpci_dev *zdev = to_zpci_dev(dev);
>   
> +	if (!zdev->s390_domain)
> +		return 0;
> +
>   	__s390_iommu_detach_device(zdev);
>   	zpci_dma_init_device(zdev);
> +	return 0;
>   }
>   
> +static struct iommu_domain_ops s390_iommu_platform_ops = {
> +	.attach_dev = s390_iommu_platform_attach,
> +};
> +
> +static struct iommu_domain s390_iommu_platform_domain = {
> +	.type = IOMMU_DOMAIN_PLATFORM,
> +	.ops = &s390_iommu_platform_ops,
> +};
> +
>   static void s390_iommu_get_resv_regions(struct device *dev,
>   					struct list_head *list)
>   {
> @@ -428,12 +445,12 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
>   }
>   
>   static const struct iommu_ops s390_iommu_ops = {
> +	.default_domain = &s390_iommu_platform_domain,
>   	.capable = s390_iommu_capable,
>   	.domain_alloc = s390_domain_alloc,
>   	.probe_device = s390_iommu_probe_device,
>   	.release_device = s390_iommu_release_device,
>   	.device_group = generic_device_group,
> -	.set_platform_dma_ops = s390_iommu_set_platform_dma,
>   	.pgsize_bitmap = SZ_4K,
>   	.get_resv_regions = s390_iommu_get_resv_regions,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
