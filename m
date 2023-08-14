Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4AA77B1CF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 08:46:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=inVQ2lwm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPQ0P2BMVz3bYc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 16:46:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=inVQ2lwm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.93; helo=mgamail.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPPzR1HFXz2yW5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 16:45:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691995525; x=1723531525;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=s7w4QvLN+a+X+nJOo1ALAurEypsMjxpw55DQNKza1DY=;
  b=inVQ2lwmgQjIL5U6PX10fqoTK14/XHceu8iWCCXZblf3ig+JxBh1DJX7
   KvLaqwzfSgmOTJeHKH+E6F0RSiCYicK6pMZJPdxg4SwyYXCeJlEuhZRp4
   ZxlOGzLoQQpZVfH9NXJWbJM8w5FPe4siCFDxF1k7VGjH4ztUGhK00+Bol
   eIi0IbUSxUazeUSTronKYldNpZGqKS5ZxJ73hST/+S7EnFYop63vCVpFg
   7UxKujDeXnoPuklsTatYe3/JH9WJQDNUlPnVaAwSHBEF4Qm3mTswEvWql
   oBcKFCE+iRrQicneSpkWyc6Rt75MUDkUleSbtYkhEIADAULhFcmZuj0Lp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="369445399"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="369445399"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 23:45:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="856979583"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="856979583"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.215.205]) ([10.254.215.205])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 23:44:52 -0700
Message-ID: <be5ce6ed-f078-a466-1d03-867e3cc4d6ee@linux.intel.com>
Date: Mon, 14 Aug 2023 14:44:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 20/25] iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
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
References: <20-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
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
> Prior to commit 1b932ceddd19 ("iommu: Remove detach_dev callbacks") the
> sun50i_iommu_detach_device() function was being called by
> ops->detach_dev().
> 
> This is an IDENTITY domain so convert sun50i_iommu_detach_device() into
> sun50i_iommu_identity_attach() and a full IDENTITY domain and thus hook it
> back up the same was as the old ops->detach_dev().
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   drivers/iommu/sun50i-iommu.c | 26 +++++++++++++++++++-------
>   1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
> index 74c5cb93e90027..0bf08b120cf105 100644
> --- a/drivers/iommu/sun50i-iommu.c
> +++ b/drivers/iommu/sun50i-iommu.c
> @@ -757,21 +757,32 @@ static void sun50i_iommu_detach_domain(struct sun50i_iommu *iommu,
>   	iommu->domain = NULL;
>   }
>   
> -static void sun50i_iommu_detach_device(struct iommu_domain *domain,
> -				       struct device *dev)
> +static int sun50i_iommu_identity_attach(struct iommu_domain *identity_domain,
> +					struct device *dev)
>   {
> -	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
>   	struct sun50i_iommu *iommu = dev_iommu_priv_get(dev);
> +	struct sun50i_iommu_domain *sun50i_domain;
>   
>   	dev_dbg(dev, "Detaching from IOMMU domain\n");
>   
> -	if (iommu->domain != domain)
> -		return;
> +	if (iommu->domain == identity_domain)
> +		return 0;
>   
> +	sun50i_domain = to_sun50i_domain(iommu->domain);
>   	if (refcount_dec_and_test(&sun50i_domain->refcnt))
>   		sun50i_iommu_detach_domain(iommu, sun50i_domain);
> +	return 0;
>   }

Does iommu->domain need to be set to identity_domain before returning?

Best regards,
baolu

