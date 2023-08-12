Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDC4779C68
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 03:53:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UZN6QFXk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RN3Zy0NRQz3cN8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 11:52:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UZN6QFXk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mgamail.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RN3Z36Jxkz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Aug 2023 11:52:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691805132; x=1723341132;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eUUEU5LEbeviw+Tdt86pjS6LMPIps7FsAMnnYjoKRyE=;
  b=UZN6QFXkJu+bouzAW/U0dN6PbqgsL7qfMxWvh1wsxjaWTd5Ajxswjpq6
   aW9pVPY1lRDK3G2yKn91SG0pI8D7QU3/ftAT0FPXy+w7bPNYVgNPghSY1
   0nwYnMi1dKpWeq2sZ7AentbBtG/NRADCR8u6iqZ3Pf052iT+xnl8O02zq
   cnQYc+hd4HsdKnBrA06qm0PXq+z59J7vzrdteANNYvwXI9PP1NM/VgcJU
   7Dl6L3p5QFD6VeovONXhRQ6OdPrsrGtHko2L+q4L7eaQuzVBCZ5tB/qd0
   9N000sH+P/PCW8fcf1CSOHeRIYNdZN/iwLZytEKNW/lKHaD+WzRBCq01O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="352121588"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="352121588"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 18:52:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="876364144"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.215.79]) ([10.254.215.79])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 18:51:57 -0700
Message-ID: <6bb11581-4b24-1e54-d3f6-674cde3e4539@linux.intel.com>
Date: Sat, 12 Aug 2023 09:51:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 06/25] iommu/tegra-gart: Remove tegra-gart
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
References: <6-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <6-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
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
> Thierry says this is not used anymore, and doesn't think it makes sense as
> an iommu driver. The HW it supports is about 10 years old now and newer HW
> uses different IOMMU drivers.
> 
> As this is the only driver with a GART approach, and it doesn't really
> meet the driver expectations from the IOMMU core, let's just remove it
> so we don't have to think about how to make it fit in.
> 
> It has a number of identified problems:
>   - The assignment of iommu_groups doesn't match the HW behavior
> 
>   - It claims to have an UNMANAGED domain but it is really an IDENTITY
>     domain with a translation aperture. This is inconsistent with the core
>     expectation for security sensitive operations
> 
>   - It doesn't implement a SW page table under struct iommu_domain so
>     * It can't accept a map until the domain is attached
>     * It forgets about all maps after the domain is detached
>     * It doesn't clear the HW of maps once the domain is detached
>       (made worse by having the wrong groups)
> 
> Cc: Thierry Reding<treding@nvidia.com>
> Cc: Dmitry Osipenko<digetx@gmail.com>
> Acked-by: Thierry Reding<treding@nvidia.com>
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   arch/arm/configs/multi_v7_defconfig |   1 -
>   arch/arm/configs/tegra_defconfig    |   1 -
>   drivers/iommu/Kconfig               |  11 -
>   drivers/iommu/Makefile              |   1 -
>   drivers/iommu/tegra-gart.c          | 371 ----------------------------
>   drivers/memory/tegra/mc.c           |  34 ---
>   drivers/memory/tegra/tegra20.c      |  28 ---
>   include/soc/tegra/mc.h              |  26 --
>   8 files changed, 473 deletions(-)
>   delete mode 100644 drivers/iommu/tegra-gart.c

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
