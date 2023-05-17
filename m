Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C29C8707597
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 00:43:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QM7SW4DQ2z3fBG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 08:43:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=EaO4Kw7y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=EaO4Kw7y;
	dkim-atps=neutral
X-Greylist: delayed 72 seconds by postgrey-1.36 at boromir; Thu, 18 May 2023 08:43:07 AEST
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QM7Rb17D8z30QS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 08:43:07 +1000 (AEST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230517224257euoutp01a6b4694033a0b3119371221b095c0dbf~gD5Fbuhh81658316583euoutp01e;
	Wed, 17 May 2023 22:42:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230517224257euoutp01a6b4694033a0b3119371221b095c0dbf~gD5Fbuhh81658316583euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1684363377;
	bh=MM3+qPbAfH/ZKaZBejHniISc0eX5MmJZmSGjD/SXFpU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=EaO4Kw7y8EDGUGR934cmeVvYPOc9m6NPooOO1Q5op9EOddITBuUMdWWEsm8uN5jK+
	 zM0L672ET0zUAHhIFW7rHuYOTzv9MQiYtE44GhxZPlra5SjlF5r/+eXJw9yh+OuIyR
	 UtUo+jivCQxUTox7rlLBXZNa6N1Z5snUdYQrOtLM=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20230517224257eucas1p1ed1da7df9807315231c345b1ffee3827~gD5FMjpDX0327003270eucas1p1N;
	Wed, 17 May 2023 22:42:57 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id DC.56.42423.17855646; Wed, 17
	May 2023 23:42:57 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20230517224256eucas1p25e3b58d492b58b440b1aa0fb467fa7bc~gD5EWfep60455704557eucas1p2V;
	Wed, 17 May 2023 22:42:56 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20230517224256eusmtrp2671486061b7284c13c57d0967952a90c~gD5EUhWir3236532365eusmtrp23;
	Wed, 17 May 2023 22:42:56 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-2c-646558715bcf
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id 8E.21.10549.07855646; Wed, 17
	May 2023 23:42:56 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20230517224254eusmtip187f238847c66c6e277e4d3e17211ade8~gD5CWtW0G2837028370eusmtip1Z;
	Wed, 17 May 2023 22:42:54 +0000 (GMT)
Message-ID: <584c65a9-305b-3174-a59b-93effc8a4c85@samsung.com>
Date: Thu, 18 May 2023 00:42:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
	Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v2 00/25] iommu: Make default_domain's mandatory
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Andy Gross <agross@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Bjorn Andersson <andersson@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Baolin
	Wang <baolin.wang@linux.alibaba.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Gerald Schaefer
	<gerald.schaefer@linux.ibm.com>, Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan
	Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>, Kevin Tian
	<kevin.tian@intel.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof
	Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, Russell King
	<linux@armlinux.org.uk>, linuxppc-dev@lists.ozlabs.org, Matthias Brugger
	<matthias.bgg@gmail.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Michael
	Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Orson
	Zhai <orsonzhai@gmail.com>, Rob Clark <robdclark@gmail.com>, Robin Murphy
	<robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>, Thierry Reding
	<thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai
	<wens@csie.org>, Will Deacon <will@kernel.org>, Yong Wu
	<yong.wu@mediatek.com>, Chunyan Zhang <zhang.lyra@gmail.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0wUVxTGe2dmZxYKOCwgt7Qo2QJqDQhVkmt4xIIJU20CNq1t7csVpkh4
	78pDY3SRbQsbQwF5DvIQqVgQRZY3CwJayJawFqFE6Cpvl4dEoFYFGrYsgy3//c4538n3nZtc
	IS76ibIThkaeYqWRknAxaUrUdS5pXWI+Z4PdhrLNkHZ8hUAjhXUkqkv2Qg9+gcjQ0gmQKr2W
	RLoMPYUqFsYBepb0DTKMzQrQ8nOE9EU3AepfVQOk4EoIlJJfRaGf52oplHypnkAts2tUPT4g
	QOl3eijUl9QL0OKIAUdpV5JwlHu/FUOZrU0kSnnOkagjqwWglZerAnRBsRdVXc3HUY28g0Qt
	k+MkWpp6SKCc+XyA9Fde4ah9fkKA9GMpJMq98IREifeerUmaCgn054oFSm35GC113MeQQueB
	hjNUBCobaaIOuDIT7YUYc6PwBmD6BnpxpuFRKWD+HtRiTNVYhYApmZYTTCP3iGKuqqcxpro8
	hWR0A2qSaRzdz6SVtAGmUHOEUZWeZ6ZUeSDQ9pipVzAbHhrHSvf4HDc92Z3cTEW3+SZMaDKB
	HGTuVQITIaT3wVzdDKYEpkIRfR3AvNUGii+eA5icrcb54i8AaxefYq9XqnIrSX5QBmBO/8SG
	agHAkbKXpFFlTvvAP6b+ERiZoJ3gxWo1xvctoSZvgjCyDc3CclUvbmQr+iDsKXtBGRmnbeHQ
	RNF6KGtaaQYr713E+ME0gAP5LkYmaXeonFOumQmFJmvLTU/EvGQ7rJ+7vB4I0qVvwvpmHcHH
	PgjLFM0bbAVnumoont+BhkbeDNI/Ali8MrxRpAEo1w8BXuUJddrldTec3gVvNe3h2x/AqnSl
	wNiGtAV8OGfJh7CAGXU5ON82h8k/iHi1M+S6bv5n2/77AzwNiLlNz8JtOp/bdA73v28xIMqB
	LRsriwhhZe6RbLyrTBIhi40McQ2KiqgGa3+me7VrsQEUzCy4dgBMCDoAFOJia/MjqUHBIvNg
	yekzrDTqW2lsOCvrAG8LCbGt+W5vTZCIDpGcYsNYNpqVvp5iQhM7ORZ6bUeqQrXrcJjXpKMN
	58TVe/qWOdjn+pyNSxstIrS7+7dvKcGSCqjeu9479RX2Vp/Y6V/ZhNQKAxOKKzQH5EGJpw8N
	z7g2HOscf1r8ZfaLwJm57HKPsNmqEsfSu+c8Hmca3La2OkltdsQl9bUuB5wwkxgs5/3Lp377
	vnj564CoE6Ivstomvf1KB7ccHf3KXXMoTS/3jgovUOyfPetsFXXr0zMxH7bbXfbv2efZIxFt
	07rb+3kWJ163/s5j1tTxuKPJ1se3ox3er8vgxvqDst5KsAnwjv4ofuf5SrN340fdPtPcOfyr
	uNLhHDcILvm6+B29Vhjbzb7hpvaL0Tl32fjPr267XSMmZCcl7u/hUpnkXyCZbmOiBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xTdxTH9+u9vS1ksEsp4SdxbqtbZhYsFCg7TGTL5ra7TRMQspHpdC3c
	AOFpH4szMXZATOkIgsKAYipP3QQnofIQCkKzqawIOhiyCfJo5WV46kQewlpgCf99fr/z/X7P
	ycnhE4JSyosfl6RiFUmyBBHlTFpWbw3sTolko31NZQLotC6TMGSoo6BOGwx//oJhrfkmAmNO
	LQX9Z8d4UDlnRTCTdgTWRh5zYekpwNiFXxH0rJoQpOtLScgoquZBxVQtD7Tn6klofmynGmsv
	F3Ju3OFBd9o9BPNDawRkl6QRUNDVwoHclkYKMp7qKTDnNSNYXljlQmq6P1SXFRFwTWOmoPmR
	lYLF8T4S8meLEIyVPCegbdbGhbGRDAoKUkcp+OG3Gbuk0UDCg2VXyGo+CIvmLg6k90th8KyR
	hEtDjbwPxIytzcBhqgxViOnuvUcwDQPliPn3704OUz1SyWVKJzQkc10/wGPKTBMcpuZyBsX0
	95oo5vpwEJNd2ooYQ3sYYyw/xYwbC1Go59fiYEWyWsW+HpusVO0VHZKAn1gSBGK/gCCxxP/d
	b97zk4p8QoKj2YS471iFT8i34liLtomX0vrhcVt7LtKgXH8dcuJjOgBXF1yhdMiZL6ArEG7o
	6KE2Cttx+08a7ga745Ve3aZoBuH0knqOo+BCh+C/xlfWRST9Fs6sMW3+u+H2QhvpYA+axe0V
	fevsTu/Ddy494zmYoD3xP7YLHEeokD77Mp4v7uI5HgQ9gfDVc2mb7fIRbqp6tG6haAnWTTnm
	4POd7FGNo6KNpECsq9WhDX4N10+dJ7KRQL9lEP2WhvotFv0WSzEiLyMhq1YmxiQqJWKlLFGp
	TooRRyUn1iD7sdbdXDQ2IMPknNiMOHxkRphPiIQuYVlR0QKXaNn3J1hF8lGFOoFVmpHUvo0c
	wssjKtl+7Umqo5JAX6kkIDDIVxoU6C/ydPksRSsT0DEyFRvPsims4n8fh+/kpeF8kXPyZDpv
	l8nno/iWEw+v7lx5sX3P3cgzth0/c/CPnZFLbdMdU3zZaWv3YM+1cMvd20dc+L+/r9123j31
	iTq+p0UntLTuOIYtEVIh+wk5ThIHzKF5097y8Olhq9serwO+n1q0DIvnXRczX8odjnxxLGr0
	0BWJrcPJ++IS5Ro2HTJYvve5fH/r8cp9t5yH6pryTrs1hC8fzsx4oJRUpo58XrjN+czYal6c
	9/37s5n735BelM+t/KGatPr7ux8UvumhIZp2e76d5Mx75l78pbFvbvKGa37odIHHgFogly2x
	6gin22rvrxS7FqANnvSkkfqFrIhXJB8f3vlQ/io9fkomk4tIZaxM8g6hUMr+A4UQ+lk1BAAA
X-CMS-MailID: 20230517224256eucas1p25e3b58d492b58b440b1aa0fb467fa7bc
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230516000132eucas1p2d20a1c49d4711fda942a3c3a842384e6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230516000132eucas1p2d20a1c49d4711fda942a3c3a842384e6
References: <CGME20230516000132eucas1p2d20a1c49d4711fda942a3c3a842384e6@eucas1p2.samsung.com>
	<0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
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

On 16.05.2023 02:00, Jason Gunthorpe wrote:
> [ There was alot of unexpected complication after rc1 with this series,
> several new patches were needed ]
>
> It has been a long time coming, this series completes the default_domain
> transition and makes it so that the core IOMMU code will always have a
> non-NULL default_domain for every driver on every
> platform. set_platform_dma_ops() turned out to be a bad idea, and so
> completely remove it.
>
> This is achieved by changing each driver to either:
>
> 1 - Convert the existing (or deleted) ops->detach_dev() into an
>      op->attach_dev() of an IDENTITY domain.
>
>      This is based on the theory that the ARM32 HW is able to function when
>      the iommu is turned off as so the turned off state is an IDENTITY
>      translation.
>
> 2 - Use a new PLATFORM domain type. This is a hack to accommodate drivers
>      that we don't really know WTF they do. S390 is legitimately using this
>      to switch to it's platform dma_ops implementation, which is where the
>      name comes from.
>
> 3 - Do #1 and force the default domain to be IDENTITY, this corrects
>      the tegra-smmu case where even an ARM64 system would have a NULL
>      default_domain.
>
> Using this we can apply the rules:
>
> a) ARM_DMA_USE_IOMMU mode always uses either the driver's
>     ops->default_domain, ops->def_domain_type(), or an IDENTITY domain.
>     All ARM32 drivers provide one of these three options.
>
> b) dma-iommu.c mode uses either the driver's ops->default_domain,
>     ops->def_domain_type or the usual DMA API policy logic based on the
>     command line/etc to pick IDENTITY/DMA domain types
>
> c) All other arch's (PPC/S390) use ops->default_domain always.
>
> See the patch "Require a default_domain for all iommu drivers" for a
> per-driver breakdown.
>
> The conversion broadly teaches a bunch of ARM32 drivers that they can do
> IDENTITY domains. There is some educated guessing involved that these are
> actual IDENTITY domains. If this turns out to be wrong the driver can be
> trivially changed to use a BLOCKING domain type instead. Further, the
> domain type only matters for drivers using ARM64's dma-iommu.c mode as it
> will select IDENTITY based on the command line and expect IDENTITY to
> work. For ARM32 and other arch cases it is purely documentation.
>
> Finally, based on all the analysis in this series, we can purge
> IOMMU_DOMAIN_UNMANAGED/DMA constants from most of the drivers. This
> greatly simplifies understanding the driver contract to the core
> code. IOMMU drivers should not be involved in policy for how the DMA API
> works, that should be a core core decision.
>
> The main gain from this work is to remove alot of ARM_DMA_USE_IOMMU
> specific code and behaviors from drivers. All that remains in iommu
> drivers after this series is the calls to arm_iommu_create_mapping().
>
> This is a step toward removing ARM_DMA_USE_IOMMU.
>
> The IDENTITY domains added to the ARM64 supporting drivers can be tested
> by booting in ARM64 mode and enabling CONFIG_IOMMU_DEFAULT_PASSTHROUGH. If
> the system still boots then most likely the implementation is an IDENTITY
> domain. If not we can trivially change it to BLOCKING or at worst PLATFORM
> if there is no detail what is going on in the HW.
>
> I think this is pretty safe for the ARM32 drivers as they don't really
> change, the code that was in detach_dev continues to be called in the same
> places it was called before.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Works fine on ARM 32bit Exynos based boards.

> This follows the prior series:
>
> https://lore.kernel.org/r/0-v5-1b99ae392328+44574-iommu_err_unwind_jgg@nvidia.com
>
> This is on github: https://protect2.fireeye.com/v1/url?k=773809ed-1645e36e-773982a2-74fe48600158-bd3a7b89de1f2061&q=1&e=7f176af7-9cf3-429b-a0ce-8812c59dfb5c&u=https%3A%2F%2Fgithub.com%2Fjgunthorpe%2Flinux%2Fcommits%2Fiommu_all_defdom
>
> v2:
>   - FSL is an IDENTITY domain
>   - Delete terga-gart instead of trying to carry it
>   - Use the policy determination from iommu_get_default_domain_type() to
>     drive the arm_iommu mode
>   - Reorganize and introduce new patches to do the above:
>      * Split the ops->identity_domain to an independent earlier patch
>      * Remove the UNMANAGED return from def_domain_type in mtk_v1 earlier
>        so the new iommu_get_default_domain_type() can work
>      * Make the driver's def_domain_type have higher policy priority than
>        untrusted
>      * Merge the set_platfom_dma_ops hunk from mtk_v1 along with rockchip
>        into the patch that forced IDENTITY on ARM32
>   - Revise sun50i to be cleaner and have a non-NULL internal domain
>   - Reword logging in exynos
>   - Remove the gdev from the group alloc path, instead add a new
>     function __iommu_group_domain_alloc() that takes in the group
>     and uses the first device. Split this to its own patch
>   - New patch to make iommufd's mock selftest into a real driver
>   - New patch to fix power's partial iommu driver
> v1: https://lore.kernel.org/r/0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com
>
> Jason Gunthorpe (25):
>    iommu: Add iommu_ops->identity_domain
>    iommu: Add IOMMU_DOMAIN_PLATFORM
>    powerpc/iommu: Setup a default domain and remove set_platform_dma_ops
>    iommu: Add IOMMU_DOMAIN_PLATFORM for S390
>    iommu/tegra-gart: Remove tegra-gart
>    iommu/mtk_iommu_v1: Implement an IDENTITY domain
>    iommu: Reorganize iommu_get_default_domain_type() to respect
>      def_domain_type()
>    iommu: Allow an IDENTITY domain as the default_domain in ARM32
>    iommu/fsl_pamu: Implement an IDENTITY domain
>    iommu/exynos: Implement an IDENTITY domain
>    iommu/tegra-smmu: Implement an IDENTITY domain
>    iommu/tegra-smmu: Support DMA domains in tegra
>    iommu/omap: Implement an IDENTITY domain
>    iommu/msm: Implement an IDENTITY domain
>    iommufd/selftest: Make the mock iommu driver into a real driver
>    iommu: Remove ops->set_platform_dma_ops()
>    iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
>    iommu/ipmmu: Add an IOMMU_IDENTITIY_DOMAIN
>    iommu/mtk_iommu: Add an IOMMU_IDENTITIY_DOMAIN
>    iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
>    iommu: Require a default_domain for all iommu drivers
>    iommu: Add __iommu_group_domain_alloc()
>    iommu: Add ops->domain_alloc_paging()
>    iommu: Convert simple drivers with DOMAIN_DMA to domain_alloc_paging()
>    iommu: Convert remaining simple drivers to domain_alloc_paging()
>
>   arch/arm/configs/multi_v7_defconfig     |   1 -
>   arch/arm/configs/tegra_defconfig        |   1 -
>   arch/powerpc/kernel/iommu.c             |  38 ++-
>   drivers/iommu/Kconfig                   |  11 -
>   drivers/iommu/Makefile                  |   1 -
>   drivers/iommu/arm/arm-smmu/qcom_iommu.c |  45 ++-
>   drivers/iommu/exynos-iommu.c            |  73 +++--
>   drivers/iommu/fsl_pamu_domain.c         |  39 ++-
>   drivers/iommu/iommu-priv.h              |  16 +
>   drivers/iommu/iommu.c                   | 263 +++++++++++------
>   drivers/iommu/iommufd/iommufd_private.h |   5 +-
>   drivers/iommu/iommufd/main.c            |   8 +-
>   drivers/iommu/iommufd/selftest.c        | 141 ++++-----
>   drivers/iommu/ipmmu-vmsa.c              |  50 +++-
>   drivers/iommu/msm_iommu.c               |  30 +-
>   drivers/iommu/mtk_iommu.c               |  30 +-
>   drivers/iommu/mtk_iommu_v1.c            |  28 +-
>   drivers/iommu/omap-iommu.c              |  28 +-
>   drivers/iommu/rockchip-iommu.c          |  26 +-
>   drivers/iommu/s390-iommu.c              |  28 +-
>   drivers/iommu/sprd-iommu.c              |   7 +-
>   drivers/iommu/sun50i-iommu.c            |  35 ++-
>   drivers/iommu/tegra-gart.c              | 371 ------------------------
>   drivers/iommu/tegra-smmu.c              |  50 +++-
>   drivers/memory/tegra/mc.c               |  34 ---
>   drivers/memory/tegra/tegra20.c          |  28 --
>   include/linux/iommu.h                   |  16 +-
>   include/soc/tegra/mc.h                  |  26 --
>   28 files changed, 622 insertions(+), 807 deletions(-)
>   create mode 100644 drivers/iommu/iommu-priv.h
>   delete mode 100644 drivers/iommu/tegra-gart.c
>
>
> base-commit: 0b355ade2baf262f213da274411c0e05d8232a21

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

