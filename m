Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA9A77B1E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 08:59:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c9qZqxe2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPQHb0hSdz3cCr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 16:59:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c9qZqxe2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.65; helo=mgamail.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPQGf3CPcz2yW5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 16:58:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691996314; x=1723532314;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pa/NYcFW5ouBdif+FG84sip7NAyNlNfKz3i1h077D5I=;
  b=c9qZqxe2W52gZdNEbUbVtlzn1rC+uzrL2SE8fwECCTmcBjW0bVGB8FRe
   X1Jwyczlz/JqwvUZVR3sqJVSPiVsjFlovcSmlEImJhm94dfd5AFa4ulC8
   gzMp7Vht4zJh0uSbCEqjrI0SZ1yI8W1q+gyjOP/KOZd0uToItnTIe0l7p
   nIMNwlYwa/Qi5KI0vaWpiNnufYnmyZSlQPmoz3SVEuhnduk6wUAy5HEpS
   r6wz63+RO1XhapR2xyY9VsEfVr0GbO9vkOG4Fi1Q9ViGblRouzns35bue
   j18Roxl4sfDGVgJJbXEre/3Bvz7C+VJveVpUZgdKkNEYio9BVBj4ecKUv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="375682855"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="375682855"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 23:58:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="798721368"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="798721368"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.215.205]) ([10.254.215.205])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 23:58:17 -0700
Message-ID: <90d3070b-a3ff-7007-9b55-aef1e9b472aa@linux.intel.com>
Date: Mon, 14 Aug 2023 14:58:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 24/25] iommu: Convert simple drivers with DOMAIN_DMA to
 domain_alloc_paging()
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
References: <24-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <24-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
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
> These drivers are all trivially converted since the function is only
> called if the domain type is going to be
> IOMMU_DOMAIN_UNMANAGED/DMA.
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/arm/arm-smmu/qcom_iommu.c | 6 ++----
>   drivers/iommu/exynos-iommu.c            | 7 ++-----
>   drivers/iommu/ipmmu-vmsa.c              | 7 ++-----
>   drivers/iommu/mtk_iommu.c               | 7 ++-----
>   drivers/iommu/rockchip-iommu.c          | 7 ++-----
>   drivers/iommu/sprd-iommu.c              | 7 ++-----
>   drivers/iommu/sun50i-iommu.c            | 9 +++------
>   drivers/iommu/tegra-smmu.c              | 7 ++-----
>   8 files changed, 17 insertions(+), 40 deletions(-)

[...]

> diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
> index 0bf08b120cf105..056832a367c2af 100644
> --- a/drivers/iommu/sun50i-iommu.c
> +++ b/drivers/iommu/sun50i-iommu.c
> @@ -667,14 +667,11 @@ static phys_addr_t sun50i_iommu_iova_to_phys(struct iommu_domain *domain,
>   		sun50i_iova_get_page_offset(iova);
>   }
>   
> -static struct iommu_domain *sun50i_iommu_domain_alloc(unsigned type)
> +static struct iommu_domain *
> +sun50i_iommu_domain_alloc_paging(struct device *paging)

Why not "struct device *dev"?

Typo? Or anything I missed?

>   {
>   	struct sun50i_iommu_domain *sun50i_domain;
>   
> -	if (type != IOMMU_DOMAIN_DMA &&
> -	    type != IOMMU_DOMAIN_UNMANAGED)
> -		return NULL;
> -
>   	sun50i_domain = kzalloc(sizeof(*sun50i_domain), GFP_KERNEL);
>   	if (!sun50i_domain)
>   		return NULL;
> @@ -840,7 +837,7 @@ static const struct iommu_ops sun50i_iommu_ops = {
>   	.identity_domain = &sun50i_iommu_identity_domain,
>   	.pgsize_bitmap	= SZ_4K,
>   	.device_group	= sun50i_iommu_device_group,
> -	.domain_alloc	= sun50i_iommu_domain_alloc,
> +	.domain_alloc_paging = sun50i_iommu_domain_alloc_paging,
>   	.of_xlate	= sun50i_iommu_of_xlate,
>   	.probe_device	= sun50i_iommu_probe_device,
>   	.default_domain_ops = &(const struct iommu_domain_ops) {
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 6cba034905edbf..69c40c191ce4f0 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -272,13 +272,10 @@ static void tegra_smmu_free_asid(struct tegra_smmu *smmu, unsigned int id)
>   	clear_bit(id, smmu->asids);
>   }
>   
> -static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
> +static struct iommu_domain *tegra_smmu_domain_alloc_paging(struct device *dev)
>   {
>   	struct tegra_smmu_as *as;
>   
> -	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
> -		return NULL;
> -
>   	as = kzalloc(sizeof(*as), GFP_KERNEL);
>   	if (!as)
>   		return NULL;
> @@ -997,7 +994,7 @@ static const struct iommu_ops tegra_smmu_ops = {
>   	.default_domain = &tegra_smmu_identity_domain,
>   	.identity_domain = &tegra_smmu_identity_domain,
>   	.def_domain_type = &tegra_smmu_def_domain_type,
> -	.domain_alloc = tegra_smmu_domain_alloc,
> +	.domain_alloc_paging = tegra_smmu_domain_alloc_paging,
>   	.probe_device = tegra_smmu_probe_device,
>   	.device_group = tegra_smmu_device_group,
>   	.of_xlate = tegra_smmu_of_xlate,

Anyway,

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
