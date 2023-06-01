Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DACB71F330
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 21:48:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXGsW6gFGz3f1K
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 05:48:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXGs36pscz3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 05:48:22 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D19C71063;
	Thu,  1 Jun 2023 12:48:36 -0700 (PDT)
Received: from [10.57.84.85] (unknown [10.57.84.85])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 788933F7BD;
	Thu,  1 Jun 2023 12:47:43 -0700 (PDT)
Message-ID: <67a01c3f-9495-d586-1fee-4fd6161cadd9@arm.com>
Date: Thu, 1 Jun 2023 20:47:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 25/25] iommu: Convert remaining simple drivers to
 domain_alloc_paging()
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
References: <25-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <25-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
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
> These drivers don't support IOMMU_DOMAIN_DMA, so this commit effectively
> allows them to support that mode.
> 
> The prior work to require default_domains makes this safe because every
> one of these drivers is either compilation incompatible with dma-iommu.c,
> or already establishing a default_domain. In both cases alloc_domain()
> will never be called with IOMMU_DOMAIN_DMA for these drivers so it is safe
> to drop the test.
> 
> Removing these tests clarifies that the domain allocation path is only
> about the functionality of a paging domain and has nothing to do with
> policy of how the paging domain is used for UNMANAGED/DMA/DMA_FQ.
> 
> Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/fsl_pamu_domain.c | 7 ++-----
>   drivers/iommu/msm_iommu.c       | 7 ++-----
>   drivers/iommu/mtk_iommu_v1.c    | 7 ++-----
>   drivers/iommu/omap-iommu.c      | 7 ++-----
>   drivers/iommu/s390-iommu.c      | 7 ++-----
>   5 files changed, 10 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
> index ca4f5ebf028783..8d5d6a3acf9dfd 100644
> --- a/drivers/iommu/fsl_pamu_domain.c
> +++ b/drivers/iommu/fsl_pamu_domain.c
> @@ -192,13 +192,10 @@ static void fsl_pamu_domain_free(struct iommu_domain *domain)
>   	kmem_cache_free(fsl_pamu_domain_cache, dma_domain);
>   }
>   
> -static struct iommu_domain *fsl_pamu_domain_alloc(unsigned type)
> +static struct iommu_domain *fsl_pamu_domain_alloc_paging(struct device *dev)

This isn't a paging domain - it doesn't support map/unmap, and AFAICT 
all it has ever been intended to do is "isolate" accesses to within an 
aperture which is never set to anything less than the entire physical 
address space :/

I hate to imagine what the VFIO userspace applications looked like...

Thanks,
Robin.

>   {
>   	struct fsl_dma_domain *dma_domain;
>   
> -	if (type != IOMMU_DOMAIN_UNMANAGED)
> -		return NULL;
> -
>   	dma_domain = kmem_cache_zalloc(fsl_pamu_domain_cache, GFP_KERNEL);
>   	if (!dma_domain)
>   		return NULL;
> @@ -476,7 +473,7 @@ static const struct iommu_ops fsl_pamu_ops = {
>   	.identity_domain = &fsl_pamu_identity_domain,
>   	.def_domain_type = &fsl_pamu_def_domain_type,
>   	.capable	= fsl_pamu_capable,
> -	.domain_alloc	= fsl_pamu_domain_alloc,
> +	.domain_alloc_paging = fsl_pamu_domain_alloc_paging,
>   	.probe_device	= fsl_pamu_probe_device,
>   	.device_group   = fsl_pamu_device_group,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
> diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
> index 26ed81cfeee897..a163cee0b7242d 100644
> --- a/drivers/iommu/msm_iommu.c
> +++ b/drivers/iommu/msm_iommu.c
> @@ -302,13 +302,10 @@ static void __program_context(void __iomem *base, int ctx,
>   	SET_M(base, ctx, 1);
>   }
>   
> -static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
> +static struct iommu_domain *msm_iommu_domain_alloc_paging(struct device *dev)
>   {
>   	struct msm_priv *priv;
>   
> -	if (type != IOMMU_DOMAIN_UNMANAGED)
> -		return NULL;
> -
>   	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>   	if (!priv)
>   		goto fail_nomem;
> @@ -691,7 +688,7 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
>   
>   static struct iommu_ops msm_iommu_ops = {
>   	.identity_domain = &msm_iommu_identity_domain,
> -	.domain_alloc = msm_iommu_domain_alloc,
> +	.domain_alloc_paging = msm_iommu_domain_alloc_paging,
>   	.probe_device = msm_iommu_probe_device,
>   	.device_group = generic_device_group,
>   	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index 7c0c1d50df5f75..67e044c1a7d93b 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -270,13 +270,10 @@ static int mtk_iommu_v1_domain_finalise(struct mtk_iommu_v1_data *data)
>   	return 0;
>   }
>   
> -static struct iommu_domain *mtk_iommu_v1_domain_alloc(unsigned type)
> +static struct iommu_domain *mtk_iommu_v1_domain_alloc_paging(struct device *dev)
>   {
>   	struct mtk_iommu_v1_domain *dom;
>   
> -	if (type != IOMMU_DOMAIN_UNMANAGED)
> -		return NULL;
> -
>   	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
>   	if (!dom)
>   		return NULL;
> @@ -585,7 +582,7 @@ static int mtk_iommu_v1_hw_init(const struct mtk_iommu_v1_data *data)
>   
>   static const struct iommu_ops mtk_iommu_v1_ops = {
>   	.identity_domain = &mtk_iommu_v1_identity_domain,
> -	.domain_alloc	= mtk_iommu_v1_domain_alloc,
> +	.domain_alloc_paging = mtk_iommu_v1_domain_alloc_paging,
>   	.probe_device	= mtk_iommu_v1_probe_device,
>   	.probe_finalize = mtk_iommu_v1_probe_finalize,
>   	.release_device	= mtk_iommu_v1_release_device,
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> index 34340ef15241bc..fcf99bd195b32e 100644
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -1580,13 +1580,10 @@ static struct iommu_domain omap_iommu_identity_domain = {
>   	.ops = &omap_iommu_identity_ops,
>   };
>   
> -static struct iommu_domain *omap_iommu_domain_alloc(unsigned type)
> +static struct iommu_domain *omap_iommu_domain_alloc_paging(struct device *dev)
>   {
>   	struct omap_iommu_domain *omap_domain;
>   
> -	if (type != IOMMU_DOMAIN_UNMANAGED)
> -		return NULL;
> -
>   	omap_domain = kzalloc(sizeof(*omap_domain), GFP_KERNEL);
>   	if (!omap_domain)
>   		return NULL;
> @@ -1748,7 +1745,7 @@ static struct iommu_group *omap_iommu_device_group(struct device *dev)
>   
>   static const struct iommu_ops omap_iommu_ops = {
>   	.identity_domain = &omap_iommu_identity_domain,
> -	.domain_alloc	= omap_iommu_domain_alloc,
> +	.domain_alloc_paging = omap_iommu_domain_alloc_paging,
>   	.probe_device	= omap_iommu_probe_device,
>   	.release_device	= omap_iommu_release_device,
>   	.device_group	= omap_iommu_device_group,
> diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
> index f0c867c57a5b9b..5695ad71d60e24 100644
> --- a/drivers/iommu/s390-iommu.c
> +++ b/drivers/iommu/s390-iommu.c
> @@ -39,13 +39,10 @@ static bool s390_iommu_capable(struct device *dev, enum iommu_cap cap)
>   	}
>   }
>   
> -static struct iommu_domain *s390_domain_alloc(unsigned domain_type)
> +static struct iommu_domain *s390_domain_alloc_paging(struct device *dev)
>   {
>   	struct s390_domain *s390_domain;
>   
> -	if (domain_type != IOMMU_DOMAIN_UNMANAGED)
> -		return NULL;
> -
>   	s390_domain = kzalloc(sizeof(*s390_domain), GFP_KERNEL);
>   	if (!s390_domain)
>   		return NULL;
> @@ -447,7 +444,7 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
>   static const struct iommu_ops s390_iommu_ops = {
>   	.default_domain = &s390_iommu_platform_domain,
>   	.capable = s390_iommu_capable,
> -	.domain_alloc = s390_domain_alloc,
> +	.domain_alloc_paging = s390_domain_alloc_paging,
>   	.probe_device = s390_iommu_probe_device,
>   	.release_device = s390_iommu_release_device,
>   	.device_group = generic_device_group,
