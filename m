Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2B1704236
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:17:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxdt4M6Bz3fvP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:17:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rtfhEEwf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::629; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rtfhEEwf;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxH16p9Vz3f77
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsVMe31kWsrKK7LT/gqrNh3PwdNx1HLOG/DqYjVk3EKUYyjHikalNdcIJ8/ezKDnbcmPMsRC5P2qK0OoSa3c2+a8476yZ4+TP/9OcGAb/QIsXv9lkRS1dOlPH02s6GyrPF2AD8JW8INb3GSloOLELZeEfl0/cxxLPW8aRVGgIN5X6299/OEnXviBQ85YP4a9OQlWSBCRz7TanxAJDB9T3sGNRsqb6h7g0QHgF52GJKmK9jp/0Ju6tGgj/afw6P+QHel20sNFU4M185TDQfqg40cHHDflilYzjHLj2Ez5Zye6LpkbSPDoePh8OBvyPplvlPze+zS5ZMdcliZG6mjLFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uv0CbnhuusVbcOQbrdgh1dsj8zUj0/vqXk7veWhnycc=;
 b=aWP/ryXNbIFbrlfBN83lWdzc/cpJpub/wu0+0VqwVU9H4cz4c9AENe6Bi5OPqf2Z/WRC9dHpRYVjXRD3L9ig/47qQf2+OjVCZ66qLc86Z1aX5/qtk0uT3roxQmHAJR9iSLly3SWZVC9hzl/Vm7mR9etLQl1e6pi6Yiz9H3ivo96ptKaPojPULl2RZUn2ypwA+FTmZHi4SYVWDpMY+wijduHDUJ8qO7/DezE17GJtFTGUDPT1t7+luQkcM6KfievJpUOPYQoZJ/KTZdZ8N4zWLK/Knm7ozpRVZKfzpTT61X0o0qEMMSFzZ50hepoyZjZRz9z0XPd/oqDTIurS02jEgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uv0CbnhuusVbcOQbrdgh1dsj8zUj0/vqXk7veWhnycc=;
 b=rtfhEEwfGyT3UDBmeoZHyP58cqwFydiUc+V6dGrZg2OW3TeCW1MY3ff/CukRWWKtMDTUVDHBUL8OqJOSkQ8kRJ3AQwEZW49m2sF3nldLG+8yuu+36mEgbkwavzyDsQLyLVYG9Sd7eV3SrxtsMGYEjJSfqe8eSxgH12ozm/sFsmlKUoXMkPSk2z0RWDAgt6gLZ1DnfHj5JRtK2BnabJWwGPTGyf7Qw9W4M+3+Wi8B72fa5uYTDC94GIHiLnTbFlMkjwo8xtwBt0sxjori/2wbJz70VA6sjtQekjS/oJBQRdpm3rbIL0dHbKdV9E/4s39nzNrwTmTNCWz1iaJHfx8XPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:15 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:15 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Andy Gross <agross@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	linuxppc-dev@lists.ozlabs.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH v2 21/25] iommu: Require a default_domain for all iommu drivers
Date: Mon, 15 May 2023 21:00:54 -0300
Message-Id: <21-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0060.namprd15.prod.outlook.com
 (2603:10b6:208:237::29) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a53a241-0166-4093-3504-08db55a0a3b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	hjNHLPfR2CHxrKaskYLuBsOcw2bPYRmuc1c2gwgtmmlzeehG0hoVNZ3+oYd7RMdEvlnC5qhrnUud9v9SGWI8EYDKbRLa+q6wHe2CIm7pS1XS43HiLU5JW9d33D3zt1mdxhydYhtM/YmsFHjBPFIqZGHUD/TahNHeg6c+QpxmfAIq280gqsh4jgqtEOVl12mEdXcBhvvuK7VauBEjWAnhF8WiAznxoLy1KG/PzwfZO6wTpMhpdHncTE1UgEb4xdwcktgSpvk2/N7FSNcQVLlAw6aQoUbQNSBgGVdfqV16uZdnnwq4qA6mlKXCafWlk7Soqbx6RilD707Ce1kmGERod0S82AYXp+BYeFj3t06J0yXhU4vABhRtH2wUW0uQIU6HOZV83tS1SZlWeDiyDkwK/xCnz6LXCvSNqoNvkC7F3ItBmbqO6YUM2a0RhjOLXoLOEHktnw4U5ys3GOuUibfgbwNcS3vXlTSEMAee5UkMis6SIcprjVuiF0pJbyo+fFwCJbadsZZwN83ejkLezILgS/Nn4q/pfo2bksmgekku1uXCaxWZYHB6H0G6wZAWHYNSTUJDy7j8NQJODg4c6MznK+r5t+FyU6VgDWvHKMBRNRk=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(36756003)(110136005)(54906003)(478600001)(38100700002)(41300700001)(7416002)(7406005)(8676002)(8936002)(5660300002)(2906002)(316002)(921005)(4326008)(66476007)(66946007)(66556008)(6506007)(6512007)(107886003)(86362001)(26005)(186003)(83380400001)(2616005)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?PIAKMmKSRP1nUMr7A9U7CXNjNP6WLAXUEf1kJ5OmS0uhytF7MbkF1QCKeebx?=
 =?us-ascii?Q?qnzIR+QvnSClsS33Gn7fc4fXlM8a3ynA8RM0EzzXDHsZs5R2mCTSrvl5UWZ3?=
 =?us-ascii?Q?OG9gpmyg1/gDfyTOgogPcRWOSHsQW7bWyvWsQfGYujfx0tWeuWmivqYMOrgY?=
 =?us-ascii?Q?QfDTxxIOR27yspLNmYb1wFIOfCto+eH/gPSwabdlMUzqU3x3uzdgqO/OxR/R?=
 =?us-ascii?Q?/VfuhaBpdhPb0RoH0xZv1DCnzXXq5kp+yJYJu3xFjh1+wxDcmYAAJycFK7iU?=
 =?us-ascii?Q?IV1UN9EgxB/ZxeTmO2xzB4us3JtaKn/FsyYN+m33fcFDo25mkA7pXaQYlH/M?=
 =?us-ascii?Q?ZaJmWC1nRQDtspKU13l71OOCBmmhHO2F2ovtT67UnI3TFVwQWFzOvi8d2dF5?=
 =?us-ascii?Q?vvGYGdCyMoJgEZKV/042bED4IUtykiLuw/1FCcWLHzJOgsVqBA9b3rI3oTEZ?=
 =?us-ascii?Q?jh//9eChg9gTyZ0/xffFEkK3Q0fetG5tIImTqgyOtdUTGMzSGcD434ZbOYcB?=
 =?us-ascii?Q?63qQU7HBJ0PqCC/fwlDascPptKtAHYrqK3HqzJiaQm8bwVxV2/2A8S3cCJ41?=
 =?us-ascii?Q?Sbe1dYCuGKBoY3Y3TbMzdHnmIpuPLuRilXkV8pNsEApwvfsZYrqDXHPywX0B?=
 =?us-ascii?Q?1iBy9IecG65EC4Am7SPwA8Dc1xXsDRUKBZBuj0VgRmvkuaFi7BsyaCb6Tfsn?=
 =?us-ascii?Q?dB3XZVrZyHLCqxfo1U53j55WubvsVOb27otG+RLXwUT8r0O6/kvaAVb8JONI?=
 =?us-ascii?Q?DP9jgLdeaHtme3cqYY4Ika58bnpBUM+uHhiVMfydiOb+zGVtNlCncdEfCMxH?=
 =?us-ascii?Q?AOJFsfY2U/DeCQMQ+u78e+dxS6NN3Qhp7TiHpex8JPPVLuzfD+AFGmYOsjw4?=
 =?us-ascii?Q?TCZy1TW/TUkZOezt5/cfUCh7B0MWl+ZM8jfhJ9PsbMOJFrpxfDFPNTZQbpy4?=
 =?us-ascii?Q?4B3FJ2GClidPfCyUZnhBI+zYHpiIWuM2JuIFaACtoCR5c3p9wjfvl/Qs1ALG?=
 =?us-ascii?Q?ncx6N+HGVrnt1Qj6j2dZZVtP5J/S4aaUekOxPWoChkfrRj5mvqmYkMB5IWwB?=
 =?us-ascii?Q?YZdJ8kK+Ydi8EKoKDC63fZYK4afovElqWrelFHlrs5WDQFjP0YWUFj/rIhkk?=
 =?us-ascii?Q?aK+NS+PJvPstMWEKORLOh0cMUJY3KdlJg+lDysSsw9bymXwXj0nCgbhonRTL?=
 =?us-ascii?Q?SoUtCTUSB0i/saNeU0L1XmWe7UQzFDnMamRDxH9cR6LvYeI5QdxMyeUvg4js?=
 =?us-ascii?Q?dSD/XA7G1VqqaWpSGK9gDeLgzzyk2s450Iubb/LI8rPEwPeUvw9GebMq/YvJ?=
 =?us-ascii?Q?nDFsoLkS9HR7RY215wxkNq3x9LXCpe513JhLsmNJCi9x7uSH+7x7vaTnbIrt?=
 =?us-ascii?Q?os04pO283U9eh29T20pr5yHB+HtnnJco2a4DPHoKDr1mHGes73UHHIiaezJb?=
 =?us-ascii?Q?KxKpnebJ1yFXfVvy7j3+BPGSJMYsPKb88aSB2/pqJcP1UYUIzxqbHNvW/+G2?=
 =?us-ascii?Q?gafny5hqf2xUZA8MuGOvbus0HZnYKjtbn2dBh57kzCwp5AoFBy4yzCK0MKpT?=
 =?us-ascii?Q?0KYJa5Oon3O+qiCk6yn6aigwfPOUgsZDjO8MnHc4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a53a241-0166-4093-3504-08db55a0a3b4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:03.5158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KfMReOKWR4oRVWXn2LEN/BY5gC2cPPN00kageBdYcMuENl+bZUXGW4ledpHrqRG5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6634
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

At this point every iommu driver will cause a default_domain to be
selected, so we can finally remove this gap from the core code.

The following table explains what each driver supports and what the
resulting default_domain will be:

                                        ops->defaut_domain
                    IDENTITY   DMA  PLATFORM    v      ARM32          dma-iommu  ARCH
amd/iommu.c             Y       Y                       N/A             either
apple-dart.c            Y       Y                       N/A             either
arm-smmu.c              Y       Y                       IDENTITY        either
qcom_iommu.c            G       Y                       IDENTITY        either
arm-smmu-v3.c           Y       Y                       N/A             either
exynos-iommu.c          G       Y                       IDENTITY        either
fsl_pamu_domain.c       Y                               N/A             N/A     PLATFORM
intel/iommu.c           Y       Y                       N/A             either
ipmmu-vmsa.c            G       Y                       IDENTITY        either
msm_iommu.c             G                               IDENTITY        N/A
mtk_iommu.c             G       Y                       IDENTITY        either
mtk_iommu_v1.c          G                               IDENTITY        N/A
omap-iommu.c            G                               IDENTITY        N/A
rockchip-iommu.c        G       Y                       IDENTITY        either
s390-iommu.c                            Y       Y       N/A             N/A     PLATFORM
sprd-iommu.c                    Y                       N/A             DMA
sun50i-iommu.c          G       Y                       IDENTITY        either
tegra-smmu.c            G       Y                       IDENTITY        IDENTITY
virtio-iommu.c          Y       Y                       N/A             either
spapr                                   Y       Y       N/A             N/A     PLATFORM
 * G means ops->identity_domain is used
 * N/A means the driver will not compile in this configuration

ARM32 drivers select an IDENTITY default domain through either the
ops->identity_domain or directly requesting an IDENTIY domain through
alloc_domain().

In ARM64 mode tegra-smmu will still block the use of dma-iommu.c and
forces an IDENTITY domain.

S390 uses a PLATFORM domain to represent when the dma_ops are set to the
s390 iommu code.

fsl_pamu uses an IDENTITY domain.

POWER SPAPR uses PLATFORM and blocking to enable its weird VFIO mode.

The x86 drivers continue unchanged.

After this patch group->default_domain is only NULL for a short period
during bus iommu probing while all the groups are constituted. Otherwise
it is always !NULL.

This completes changing the iommu subsystem driver contract to a system
where the current iommu_domain always represents some form of translation
and the driver is continuously asserting a definable translation mode.

It resolves the confusion that the original ops->detach_dev() caused
around what translation, exactly, is the IOMMU performing after
detach. There were at least three different answers to that question in
the tree, they are all now clearly named with domain types.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index af8b91d15462f3..15cdfca4011ef2 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1805,10 +1805,12 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
 	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
 	 * identity_domain and it will automatically become their default
 	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
-	 * Override the selection to IDENTITY if we are sure the driver supports
-	 * it.
+	 * Override the selection to IDENTITY.
 	 */
-	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && ops->identity_domain) {
+	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
+		static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
+				IS_ENABLED(CONFIG_IOMMU_DMA)));
+
 		type = IOMMU_DOMAIN_IDENTITY;
 		if (best_type && type && best_type != type)
 			goto err;
@@ -2915,18 +2917,9 @@ static int iommu_setup_default_domain(struct iommu_group *group,
 	if (req_type < 0)
 		return -EINVAL;
 
-	/*
-	 * There are still some drivers which don't support default domains, so
-	 * we ignore the failure and leave group->default_domain NULL.
-	 */
 	dom = iommu_group_alloc_default_domain(group, req_type);
-	if (!dom) {
-		/* Once in default_domain mode we never leave */
-		if (group->default_domain)
-			return -ENODEV;
-		group->default_domain = NULL;
-		return 0;
-	}
+	if (!dom)
+		return -ENODEV;
 
 	if (group->default_domain == dom)
 		return 0;
-- 
2.40.1

