Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A8C77C525
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 03:35:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=czJP0+mW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPv3b5hWxz3cN2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 11:35:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=czJP0+mW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.31; helo=mgamail.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPv2f2WT5z2y1d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 11:34:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692063290; x=1723599290;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jkr/6uy80FBJ1zVM9rO0oVAo4kuNs+82saVQaD5txn0=;
  b=czJP0+mWwgr9y7kdbwI0Iio2wE38B0Y6+ttQZMnxDq3ItbXL9NB936dF
   M6YyXO0VGp4gtsDBGgKqXzi+GUBohocymuSANI/Xrd9fHorg/DOsjACr4
   lCWPhVvZVodTFp7sFNri/VmVjwA41H3ij0CQ2TlifIfAMdFRRwXhC5Yud
   ZX/fWqinfuCDQU/DFx/+XMdp67p6LrZdpiocPfeFNXzm4XI8IS3SYpfn1
   8xMFU1J6WHFbRPczHRyaqtoCB8PNkIP6aTKJJW0BB5DkzUSMGP/iV58C9
   WMIBgwPj5QtVT/zsB0xxqX3esqVKRYhQNLyRI2fwQFtxvDT6Y8SeSioaY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="436073300"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="436073300"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 18:34:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="768654964"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="768654964"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.215.149]) ([10.254.215.149])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 18:34:30 -0700
Message-ID: <7fdbf6a5-87a2-65c1-7c1e-d7b936dd3a67@linux.intel.com>
Date: Tue, 15 Aug 2023 09:34:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 00/25] iommu: Make default_domain's mandatory
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <50feed07-f89a-dfc2-d8a8-16f9bf0fe937@linux.intel.com>
 <ZNpksUtIY+3N1Hn3@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <ZNpksUtIY+3N1Hn3@nvidia.com>
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

On 2023/8/15 1:30, Jason Gunthorpe wrote:
> On Mon, Aug 14, 2023 at 04:43:23PM +0800, Baolu Lu wrote:
> 
>>> This is on github:https://github.com/jgunthorpe/linux/commits/iommu_all_defdom
>> It seems that after this series, all ARM iommu drivers are able to
>> support the IDENTITY default domain, hence perhaps we can remove below
>> code?
> Yes, but this code is still used
> 
>> If I remember it correctly, the background of this part of code is
>> that some arm drivers didn't support IDENTITY domain, so fall back to
>> DMA domain if IDENTITY domain allocation fails.
> Not quite..
> 
> 	if (req_type)
> 		return __iommu_group_alloc_default_domain(group, req_type);
> 
> req_type == 0 can still happen because it depends on what
> def_domain_type returns, which is still 0 in alot of cases
> 
> 	/* The driver gave no guidance on what type to use, try the default */
> 	dom = __iommu_group_alloc_default_domain(group, iommu_def_domain_type);
> 	if (dom)
> 		return dom;
> 
> So we try the default which might be IDENTITY/DMA/DMA_FQ - still have
> to do this.
> 
> 	/* Otherwise IDENTITY and DMA_FQ defaults will try DMA */
> 	if (iommu_def_domain_type == IOMMU_DOMAIN_DMA)
> 		return NULL;
> 	dom = __iommu_group_alloc_default_domain(group, IOMMU_DOMAIN_DMA);
> 	if (!dom)
> 		return NULL;
> 
> 	pr_warn("Failed to allocate default IOMMU domain of type %u for group %s - Falling back to IOMMU_DOMAIN_DMA",
> 		iommu_def_domain_type, group->name);
> 
> And this hunk is primarily a fallback in case the DMA_FQ didn't
> work. Then we try normal DMA.
> 
> That it also protected against not implementing IDENTITY is a side
> effect, so I think we have to keep all of this still.

Okay, fair enough. Thanks for the explanation.

Best regards,
baolu
