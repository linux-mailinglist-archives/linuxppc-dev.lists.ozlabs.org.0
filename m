Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 254E977B09D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 07:03:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f3463P7G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPMjG0LxKz3cJ0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 15:02:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f3463P7G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mgamail.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPMhP2rQGz2xHK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 15:02:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691989333; x=1723525333;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=qwK+HZvZ0fxHQu3F1Z1BO2CvSFGyEyEeAyWPyrYe3b0=;
  b=f3463P7GzKC2MyP+7uiqMXHLquK/s0Vvkep0szzCXgMCHfrvxag7oDHH
   HLcZnzAP85DcF7cMMoqDiUlosfyN7wVclJfdnJvqfNpN8X8mKQwI2SjId
   Sywv2WiMFrUp1C2aG2LTiqsFduDWmrjZFe8qtY769BeGslx4n80TGbXxm
   lrRIRuoxeMS/fK4YcH3T60re8IuFO3I/qeupiDSK/5EPHRTQuCvy4Fwim
   3hFBiCxQ9JJYEi2kTSV2ZLuTxprS5NQDM9g3UPZh5DIFySveBbAjczvT1
   kgiiz2oWoBjcvmGmdrTiEgmdWSLFWRaF1Ddr/50WGAoQRej0cCU3NLz9Q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="402945793"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="402945793"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 22:02:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="1063930020"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="1063930020"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.255.29.49]) ([10.255.29.49])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 22:01:57 -0700
Message-ID: <682666dc-3b43-5866-1025-0d0170eb4d86@linux.intel.com>
Date: Mon, 14 Aug 2023 13:01:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 11/25] iommu/tegra-smmu: Implement an IDENTITY domain
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
References: <11-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <11-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
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
> What tegra-smmu does during tegra_smmu_set_platform_dma() is actually
> putting the iommu into identity mode.
> 
> Move to the new core support for ARM_DMA_USE_IOMMU by defining
> ops->identity_domain.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/tegra-smmu.c | 37 ++++++++++++++++++++++++++++++++-----
>   1 file changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> index 1cbf063ccf147a..f63f1d4f0bd10f 100644
> --- a/drivers/iommu/tegra-smmu.c
> +++ b/drivers/iommu/tegra-smmu.c
> @@ -511,23 +511,39 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
>   	return err;
>   }
>   
> -static void tegra_smmu_set_platform_dma(struct device *dev)
> +static int tegra_smmu_identity_attach(struct iommu_domain *identity_domain,
> +				      struct device *dev)
>   {
>   	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
>   	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> -	struct tegra_smmu_as *as = to_smmu_as(domain);
> -	struct tegra_smmu *smmu = as->smmu;
> +	struct tegra_smmu_as *as;
> +	struct tegra_smmu *smmu;
>   	unsigned int index;
>   
>   	if (!fwspec)
> -		return;
> +		return -ENODEV;
>   
> +	if (domain == identity_domain || !domain)
> +		return 0;
> +
> +	as = to_smmu_as(domain);
> +	smmu = as->smmu;
>   	for (index = 0; index < fwspec->num_ids; index++) {
>   		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
>   		tegra_smmu_as_unprepare(smmu, as);
>   	}
> +	return 0;
>   }
>   
> +static struct iommu_domain_ops tegra_smmu_identity_ops = {
> +	.attach_dev = tegra_smmu_identity_attach,
> +};
> +
> +static struct iommu_domain tegra_smmu_identity_domain = {
> +	.type = IOMMU_DOMAIN_IDENTITY,
> +	.ops = &tegra_smmu_identity_ops,
> +};
> +
>   static void tegra_smmu_set_pde(struct tegra_smmu_as *as, unsigned long iova,
>   			       u32 value)
>   {
> @@ -962,11 +978,22 @@ static int tegra_smmu_of_xlate(struct device *dev,
>   	return iommu_fwspec_add_ids(dev, &id, 1);
>   }
>   
> +static int tegra_smmu_def_domain_type(struct device *dev)
> +{
> +	/*
> +	 * FIXME: For now we want to run all translation in IDENTITY mode, due
> +	 * to some device quirks. Better would be to just quirk the troubled
> +	 * devices.
> +	 */
> +	return IOMMU_DOMAIN_IDENTITY;
> +}

Hope somebody can fix this later on.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
