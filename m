Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 421A577AF6F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 04:14:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JtABP+gG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPHzH0zTSz3c5b
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 12:14:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JtABP+gG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.115; helo=mgamail.intel.com; envelope-from=baolu.lu@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPHyP3Jhhz2xq1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 12:14:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691979245; x=1723515245;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=D0cMxkzz2W3U1WROUJDub6YFpGLwPPBS6a8Mkd5QN7w=;
  b=JtABP+gGLMb7Y7i/H+/TnlJ1Ps3nS1QIJFU+elz+0nmWUPGlIUVA5DzQ
   9eczUq6RZBqgpyvnUGqTm26UXnhK1NjR01+k021c7ELFmWNFgWd+q463z
   J3vUztAkPk0YiiXHNsmFKb2JhaTmzHll2jPNJTXhUp92DrmPnXdVQyoIR
   BcV8YVqY6ACKrVwXWOmjwaopfcNdk3n2esIi4gJ4gxBvl9GzjCTemKSbV
   5dSzPB5ZovxP4Q082Pstf3tnShVe6CR3/re8TsOxVaH/e7xt1+P4Z/A7v
   0/X3TMbGQ9gJSvYiQBNwqiCIl8mYFGshVtBIq+VXiSJxwhP9lrv0jcoqf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="371948313"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="371948313"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 19:13:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="823277535"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="823277535"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.255.29.49]) ([10.255.29.49])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 19:13:47 -0700
Message-ID: <de9d9270-e510-b888-449c-d936a940d514@linux.intel.com>
Date: Mon, 14 Aug 2023 10:13:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v6 03/25] powerpc/iommu: Setup a default domain and remove
 set_platform_dma_ops
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
References: <3-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <3-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
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
> POWER is using the set_platform_dma_ops() callback to hook up its private
> dma_ops, but this is buired under some indirection and is weirdly
> happening for a BLOCKED domain as well.
> 
> For better documentation create a PLATFORM domain to manage the dma_ops,
> since that is what it is for, and make the BLOCKED domain an alias for
> it. BLOCKED is required for VFIO.
> 
> Also removes the leaky allocation of the BLOCKED domain by using a global
> static.
> 
> Signed-off-by: Jason Gunthorpe<jgg@nvidia.com>
> ---
>   arch/powerpc/kernel/iommu.c | 38 +++++++++++++++++--------------------
>   1 file changed, 17 insertions(+), 21 deletions(-)

Not sure how to fix the fake blocking domain in this driver.

But it's not the purpose of this patch, so

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
