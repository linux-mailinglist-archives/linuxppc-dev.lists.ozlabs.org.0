Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E538277AFDF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 05:07:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HGWB5CsY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPK7s5rGkz3cJl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 13:07:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HGWB5CsY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.93; helo=mgamail.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPK6w713Hz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 13:06:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691982393; x=1723518393;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gy0wdGHdwqfhCuqKLzj0CQNWQFqYcsM4kuaHT4waVN4=;
  b=HGWB5CsYZXLaTzeIDkCsak9Nw/2ClE3J1NDHFclNw56jp80j6aBvCb98
   7A7WNitmBPAZPBbpH9GoF9rnYv8b2W844MegfsHuyiuxQdAF8zXobCOGD
   ITGeHoBexpTYM7vg0g/m32mG+/02mZj28mbQWzOenpdSNnTY3TvIXFtuI
   FbZMuOVzhDxTt7NXdHf6oYETK9gdjGb67D3hys6caTH+8KzrqFaJJ0Mms
   GpYEQcaxicEREPXcK+JSO2pX0M2AnjFNLGCpq7UdKXA9EenruCgjVOUtN
   i2WFRKwQkPR1zxOyId1uHWK1aaSLJlHu8TnOu+cK8fp1d1BNQEN5FPEQ1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="369422538"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="369422538"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 20:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="856923909"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="856923909"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.255.29.49]) ([10.255.29.49])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 20:06:14 -0700
Message-ID: <7b6b8118-813a-f4cd-1067-d209d2b40025@linux.intel.com>
Date: Mon, 14 Aug 2023 11:06:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 07/25] iommu/mtk_iommu_v1: Implement an IDENTITY domain
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
References: <7-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <7-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
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
> What mtk does during mtk_iommu_v1_set_platform_dma() is actually putting
> the iommu into identity mode. Make this available as a proper IDENTITY
> domain.
> 
> The mtk_iommu_v1_def_domain_type() from
> commit 8bbe13f52cb7 ("iommu/mediatek-v1: Add def_domain_type") explains
> this was needed to allow probe_finalize() to be called, but now the
> IDENTITY domain will do the same job so change the returned
> def_domain_type.
> 
> mkt_v1 is the only driver that returns IOMMU_DOMAIN_UNMANAGED from
> def_domain_type().  This allows the next patch to enforce an IDENTITY
> domain policy for this driver.

This code seems to be not working properly.

  * @def_domain_type: device default domain type, return value:
  *              - IOMMU_DOMAIN_IDENTITY: must use an identity domain
  *              - IOMMU_DOMAIN_DMA: must use a dma domain
  *              - 0: use the default setting

The core code is not ready to accept any other return value.

> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/mtk_iommu_v1.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
> index 8a0a5e5d049f4a..cc3e7d53d33ad9 100644
> --- a/drivers/iommu/mtk_iommu_v1.c
> +++ b/drivers/iommu/mtk_iommu_v1.c
> @@ -319,11 +319,27 @@ static int mtk_iommu_v1_attach_device(struct iommu_domain *domain, struct device
>   	return 0;
>   }
>   
> -static void mtk_iommu_v1_set_platform_dma(struct device *dev)
> +static int mtk_iommu_v1_identity_attach(struct iommu_domain *identity_domain,
> +					struct device *dev)
>   {
>   	struct mtk_iommu_v1_data *data = dev_iommu_priv_get(dev);
>   
>   	mtk_iommu_v1_config(data, dev, false);
> +	return 0;
> +}
> +
> +static struct iommu_domain_ops mtk_iommu_v1_identity_ops = {
> +	.attach_dev = mtk_iommu_v1_identity_attach,
> +};
> +
> +static struct iommu_domain mtk_iommu_v1_identity_domain = {
> +	.type = IOMMU_DOMAIN_IDENTITY,
> +	.ops = &mtk_iommu_v1_identity_ops,
> +};
> +
> +static void mtk_iommu_v1_set_platform_dma(struct device *dev)
> +{
> +	mtk_iommu_v1_identity_attach(&mtk_iommu_v1_identity_domain, dev);

This callback seems to be a dead code now.

>   }
>   
>   static int mtk_iommu_v1_map(struct iommu_domain *domain, unsigned long iova,
> @@ -443,7 +459,7 @@ static int mtk_iommu_v1_create_mapping(struct device *dev, struct of_phandle_arg
>   
>   static int mtk_iommu_v1_def_domain_type(struct device *dev)
>   {
> -	return IOMMU_DOMAIN_UNMANAGED;
> +	return IOMMU_DOMAIN_IDENTITY;

def_domain_type can't be used for this purpose. But this seems to be a
temporary code, as it will be removed in patch 09/25.

>   }
>   
>   static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
> @@ -578,6 +594,7 @@ static int mtk_iommu_v1_hw_init(const struct mtk_iommu_v1_data *data)
>   }
>   
>   static const struct iommu_ops mtk_iommu_v1_ops = {
> +	.identity_domain = &mtk_iommu_v1_identity_domain,
>   	.domain_alloc	= mtk_iommu_v1_domain_alloc,
>   	.probe_device	= mtk_iommu_v1_probe_device,
>   	.probe_finalize = mtk_iommu_v1_probe_finalize,

Best regards,
baolu
