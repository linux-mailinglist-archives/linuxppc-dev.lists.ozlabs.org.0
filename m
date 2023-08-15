Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B24DD77C501
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 03:21:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DkKfvE1g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPtkr4Ng2z3cbH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 11:21:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DkKfvE1g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.100; helo=mgamail.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPthj5K5Mz3cLl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 11:19:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692062358; x=1723598358;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QvD+OczAXQfY3EnI/faV3RaAbFUkc5kfqnTaF1n9e4M=;
  b=DkKfvE1gr8DPG8nvr7FwEf4VCpy6h7fVBZ8/Qj4VWQFTGwAKSKD7D/cd
   QscHwJ1sRdK5BXOx7Qvc24co32fsfGfyzOFELh3aNKNSFx9oB2bRNr0sv
   f780fcTwTYIwbqeMOrADLihm1mGxrXReapYeiUMKd4eamZXfcfoz95Rgf
   0XCGnwFylEh7MLGAPu6+HVMZz/jUtlR7TWkYoCJLz58al6uAAMYEEtipR
   h7V9iNonOWFleq3HPc/YvFI6N12x4x7Po+wPYfXdaYnZVzk++OmvY5QrG
   5P5XWf+dKnmRiKGsimXIgLXDVdZC0GTwGYXgRzM2ozAkIhVp/KJ4NbNUE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="438516174"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="438516174"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 18:19:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="823667919"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="823667919"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.215.149]) ([10.254.215.149])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 18:19:01 -0700
Message-ID: <c24e7eff-b28c-8152-6022-325ca89c8074@linux.intel.com>
Date: Tue, 15 Aug 2023 09:18:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 08/25] iommu: Reorganize
 iommu_get_default_domain_type() to respect def_domain_type()
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <8-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <b50a464a-fa28-e359-1bc5-4f2b105326ad@linux.intel.com>
 <ZNpjmiBLneBC9oWe@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <ZNpjmiBLneBC9oWe@nvidia.com>
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
Cc: Heiko Stuebner <heiko@sntech.de>, Matthew Rosato <mjrosato@linux.ibm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, Andy Gross <agross@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>, Yong Wu <yong.wu@mediatek.com>, Orson Zhai <orsonzhai@gmail.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Thierry Reding <treding@nvidia.com>, linux-sunxi@lists.linux.dev, Rob Clark <robdclark@gmail.com>, Kevin Tian <kevin.tian@intel.com>, Niklas Schnelle
  <schnelle@linux.ibm.com>, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, linuxppc-dev@lists.ozlabs.org, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023/8/15 1:25, Jason Gunthorpe wrote:
> Ah, I went over all this again and decided to try again, it is too
> complicated. This patch can do what the commit message says and the
> following patches are even simpler:

Yes. This method is more concise. Some nits below.

> 
> /*
>   * Combine the driver's choosen def_domain_type across all the devices in a
>   * group. Drivers must give a consistent result.
>   */
> static int iommu_get_def_domain_type(struct iommu_group *group,
> 				     struct device *dev, int cur_type)
> {
> 	const struct iommu_ops *ops = group_iommu_ops(group);
> 	int type;
> 
> 	if (!ops->def_domain_type)
> 		return cur_type;
> 
> 	type = ops->def_domain_type(dev);
> 	if (!type || cur_type == type)
> 		return cur_type;
> 	if (!cur_type)
> 		return type;
> 
> 	dev_err_ratelimited(
> 		dev,
> 		"IOMMU driver error, requesting conflicting def_domain_type, %s and %s, for devices in group %u.\n",
> 		iommu_domain_type_str(cur_type), iommu_domain_type_str(type),
> 		group->id);
> 
> 	/*
> 	 * Try to recover, drivers are allowed to force IDENITY or DMA, IDENTITY
> 	 * takes precedence.
> 	 */
> 	if (cur_type || type == IOMMU_DOMAIN_IDENTITY)
> 		return IOMMU_DOMAIN_IDENTITY;

No need to check cur_type. It already returned if cur_type is 0.

> 	return cur_type;
> }
> 
> /*
>   * A target_type of 0 will select the best domain type. 0 can be returned in
>   * this case meaning the global default should be used.
>   */
> static int iommu_get_default_domain_type(struct iommu_group *group,
> 					 int target_type)
> {
> 	struct device *untrusted = NULL;
> 	struct group_device *gdev;
> 	int driver_type = 0;
> 
> 	lockdep_assert_held(&group->mutex);
> 
> 	/*
> 	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
> 	 * identity_domain and it will automatically become their default
> 	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
> 	 * Override the selection to IDENTITY.
> 	 */
> 	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
> 		static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
> 				IS_ENABLED(CONFIG_IOMMU_DMA)));

IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) is duplicate with the condition in 
the if statement. So only
		static_assert(!IS_ENABLED(CONFIG_IOMMU_DMA));
?

> 		driver_type = IOMMU_DOMAIN_IDENTITY;
> 	}
> 
> 	for_each_group_device(group, gdev) {
> 		driver_type = iommu_get_def_domain_type(group, gdev->dev,
> 							driver_type);

No need to call this in the loop body?

> 
> 		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
> 			/*
> 			 * No ARM32 using systems will set untrusted, it cannot
> 			 * work.
> 			 */
> 			if (WARN_ON(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)))
> 				return -1;
> 			untrusted = gdev->dev;
> 		}
> 	}
> 
> 	if (untrusted) {
> 		if (driver_type && driver_type != IOMMU_DOMAIN_DMA) {
> 			dev_err_ratelimited(
> 				untrusted,
> 				"Device is not trusted, but driver is overriding group %u to %s, refusing to probe.\n",
> 				group->id, iommu_domain_type_str(driver_type));
> 			return -1;
> 		}
> 		driver_type = IOMMU_DOMAIN_DMA;
> 	}
> 
> 	if (target_type) {
> 		if (driver_type && target_type != driver_type)
> 			return -1;
> 		return target_type;
> 	}
> 	return driver_type;
> }

Best regards,
baolu
