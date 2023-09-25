Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C59487AD4CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 11:49:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=8bytes.org header.i=@8bytes.org header.a=rsa-sha256 header.s=default header.b=GA2roFK1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvJ455Jd7z3cC9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 19:49:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=8bytes.org header.i=@8bytes.org header.a=rsa-sha256 header.s=default header.b=GA2roFK1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=8bytes.org (client-ip=85.214.250.239; helo=mail.8bytes.org; envelope-from=joro@8bytes.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 388 seconds by postgrey-1.37 at boromir; Mon, 25 Sep 2023 19:48:19 AEST
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvJ374jLZz2yh7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Sep 2023 19:48:18 +1000 (AEST)
Received: from 8bytes.org (pd9fe9df8.dip0.t-ipconnect.de [217.254.157.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 77E231A21FF;
	Mon, 25 Sep 2023 11:41:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1695634900;
	bh=NxrKhr6WG806XBJKBm2IQBKy1pD2rNt9qo9c3PhenPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GA2roFK14T/HQ96iZoC9nQCcCo2VMXnhAiD8ufn22sBjj4nGQjiI9eN19UQ841ll3
	 tvmwuAznroYnlkDSX8YTdeSVvZ5KpTzjXvuSOcVi3oi86ErBR5VUYuyHP/MA5BOWAU
	 2wX/3AeQvi06bRFniHUSbxMlOYWJVwrevTN+8G/rCRuZXK0/Oah1SMzErVPnQM/e2T
	 NUJCJaJ6P7HXKFeguW86oDlRl/R1XGiBrT/L/fsslL6xPva/C12AXKWxwIS06iDf1G
	 mjJRMv3x6qjDMx6PAdu3wlyXUnjfaKVtb3KqzO0YfjGfzBDGWx9Kyiat+OEkROq8qK
	 VOyZFET5SBvfw==
Date: Mon, 25 Sep 2023 11:41:38 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v8 00/24] iommu: Make default_domain's mandatory
Message-ID: <ZRFV0vxoexLu-CWJ@8bytes.org>
References: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
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
Cc: Heiko Stuebner <heiko@sntech.de>, Matthew Rosato <mjrosato@linux.ibm.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, Andy Gross <agross@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>, Yong Wu <yong.wu@mediatek.com>, Orson Zhai <orsonzhai@gmail.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Thierry Reding <treding@nvidia.com>, linux-sunxi@lists.linux.dev, Rob Clark <robdclark@gmail.com>, Kevin Tian <kevin.tian@intel.com>, Niklas 
 Schnelle <schnelle@linux.ibm.com>, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, linuxppc-dev@lists.ozlabs.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 13, 2023 at 10:43:33AM -0300, Jason Gunthorpe wrote:
> Jason Gunthorpe (24):
>   iommu: Add iommu_ops->identity_domain
>   iommu: Add IOMMU_DOMAIN_PLATFORM
>   powerpc/iommu: Setup a default domain and remove set_platform_dma_ops
>   iommu: Add IOMMU_DOMAIN_PLATFORM for S390
>   iommu/fsl_pamu: Implement a PLATFORM domain
>   iommu/tegra-gart: Remove tegra-gart
>   iommu/mtk_iommu_v1: Implement an IDENTITY domain
>   iommu: Reorganize iommu_get_default_domain_type() to respect
>     def_domain_type()
>   iommu: Allow an IDENTITY domain as the default_domain in ARM32
>   iommu/exynos: Implement an IDENTITY domain
>   iommu/tegra-smmu: Implement an IDENTITY domain
>   iommu/tegra-smmu: Support DMA domains in tegra
>   iommu/omap: Implement an IDENTITY domain
>   iommu/msm: Implement an IDENTITY domain
>   iommu: Remove ops->set_platform_dma_ops()
>   iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
>   iommu/ipmmu: Add an IOMMU_IDENTITIY_DOMAIN
>   iommu/mtk_iommu: Add an IOMMU_IDENTITIY_DOMAIN
>   iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
>   iommu: Require a default_domain for all iommu drivers
>   iommu: Add __iommu_group_domain_alloc()
>   iommu: Add ops->domain_alloc_paging()
>   iommu: Convert simple drivers with DOMAIN_DMA to domain_alloc_paging()
>   iommu: Convert remaining simple drivers to domain_alloc_paging()

Applied, thanks.
