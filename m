Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3BF79EA09
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:48:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VZHvgYZn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm1xj660Tz3cPN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:48:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VZHvgYZn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::62b; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1s41nrtz3bTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2swBTy71igDdcP/ArQUUIIXO6RwQWA+IifypUWS+vLoDafnRBLH0mZOqikS5y51mleQve1Ct2uRe828piHB820FKX061upD/une5YVPhSqpSyhHPmpT9f7bCPbd3bO7NKpRemYNTE5qyA3poNf+y6bE6VgM/FVjws0ejNQ+4GH6zkrViPuhf2sZr65wZhzezmXbqom3q69l7qrEUklTw/6kAkRCNqa9xdszr65yI1/BQsaGk+zfc1NPda/O6BQO+KQj9rhLikaMW0ub8flq+kyl54NkqHWqZj67MdJDeyogX/w2bxQMNJZPUrur12BpPZ7j3JJ2rVN5aL45vacqSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Yp17b1+YGfHmRu9squL+jbgoSCGQpmY/LBE6FPjHgE=;
 b=IphcyjNqOHW0hpU/0SnQ+DxmzySK7sZvw2Nop0wjB92yH5VIvUUYYoO8ttbBUUFdq4DV7feo99w4tRKaojo307eIxuSNwB6oBoHphMY+5ooPbmlxJtPxcwv4RBKcVqpNZ48Fi55EOOhC81Bc5O/5GFdUsnbNG1HuFjdWV3tidliL6OBte9rJBJ3gQudfTs7QgQa7cTlRBgM/3B0H0dAMh54cWRlgNoUcU67CBEi0/VoZSJuXg2Bu1E+VDrLiV0oTzgWYP5Lg2Gfz0naZHJcEna503/WmGgflkrMzT5wxb5Lge/lBQMFb3K7lKG0QdCud8nwEDoHvHIvSd2uA3ZRBvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Yp17b1+YGfHmRu9squL+jbgoSCGQpmY/LBE6FPjHgE=;
 b=VZHvgYZnaf800ZE8mMoRaEMFIcmUsCue+8FuzbRpde/zrQ3hXQq0F8cTYGIIecf3BHs/0XwbCE4lsuQ85MSsfldF9tjZ6Cckj4ZSWwHRaNkw+XtCCyX2pTNHc+6VTa46L5jCR+XyH+GMS1YcHxhWtwAo47/S6T3ZF9+r3vxGBbBQo8L73/TUmlQqNiBZ5i/1SEq0VVFoPwnMDUQf1x5g5LztbLiAzF6B2WEwf7fhEPoEj8/XhXWp2KGISN1iRfZCeaXpHI5+DWAPqlrzTSqq9rzqqdpX4EPX3kstBRfqi68ntb9yAoJ12zWPr9bE9ZczlEgh4pn7J4RE8PgMgKPgAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5955.namprd12.prod.outlook.com (2603:10b6:208:37e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Wed, 13 Sep
 2023 13:44:04 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:04 +0000
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
Subject: [PATCH v8 20/24] iommu: Require a default_domain for all iommu drivers
Date: Wed, 13 Sep 2023 10:43:53 -0300
Message-ID: <20-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0030.namprd20.prod.outlook.com
 (2603:10b6:208:e8::43) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e86fdf-eb6c-4ea7-db36-08dbb45f7cb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	00sHmgMbT2dm7IaH6tOshfLP2G9u6a2ECtb6DtSo/AZmsuqRdEk6KXZr9IVckOSc1czWsMZV2jwhRw5bDpLhU31tpK6lCtKYUiAScSKNbn1nEHtWcsYwwRie1/rJ6EXIMLVZUc2hJhuCxnUJvEH+4s6ImmmzhcF4tT7qRda3Fy6HtOH/EDwfPzoTsygChhL06hIH9L7wzh655bt1mDvHVnI1SucHCt9fM6tgXBB2d8KhVXrPHW5zK5qXm0wFuhzpltxFCFlHsjq+bgVO2lJUsIenyR0G9mG37WzukD/osFakJoPe3i5xa0MMXIpJqhtX/OHnmGO5freL14+C35bggIwqpdXcDGBhO4XL77iN1tX8hNN0XXjkUV4zs2IsJ1YZQH+4DK9ITyUeAPGNfkJHexgWiMI2P5wbx98UaE/qouWRYdJNwZUtUDJWZFy0w/ipWYdvm7NyXcuSfprFNc5n3Cg+Qf8QO2TaS4X1EZvSQrcLNOmYWHBYCpowvp5S2B4o5cS9FgdfneZpmFhy5/ylbTJGoY0pMS8x/H/hlNJBnHD3vWCZlznTzBI/WyKLXHfEEcm6MquuhgY+rDJQiR+RKyfLhNsLcBlOwlqW17qBqj0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(346002)(366004)(376002)(1800799009)(186009)(451199024)(5660300002)(41300700001)(8936002)(316002)(8676002)(4326008)(921005)(2616005)(26005)(86362001)(107886003)(38100700002)(36756003)(54906003)(83380400001)(7416002)(7406005)(2906002)(6486002)(6506007)(6512007)(110136005)(66556008)(66946007)(66476007)(478600001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?iry/4R2RBKq8LEoQXQlXHf8cNNLVgajaVLvBwBmC7ZP2siOCdyWmsq+QOErH?=
 =?us-ascii?Q?wtI683KzTqp+Ywfo3Iqo2FnJ1DH7kuZFk6CVosc7NwPaQRb2/6YT3/sWNzih?=
 =?us-ascii?Q?YTWnXT1Zl+AM1jORKSakLbsO2QaoqpcYIES8WPZGvtLcXSBChq6ZboeeBZrO?=
 =?us-ascii?Q?/LadUUEJmQLBWg1UJP2WLrhnWb9d2c+2bRzQABelIUJKBFzWGL+tebn4o8lR?=
 =?us-ascii?Q?tOadXIjOZW79BxMU7YR/is6+TtswrnMaudtm9dwU456MhEdrf/tGert0NhXP?=
 =?us-ascii?Q?TIBWlFN8lxN+xMLY1LyMvjQf7ufB0cIE73r2Ut1xY+dyTw9MdQ2/L+zeLVBt?=
 =?us-ascii?Q?fJEx1JxwQRyDxc0OZ1r01/BDE5sSCCXbRVb9ayXIq+uxdyy+IOPc+J6vuVAQ?=
 =?us-ascii?Q?B6hk3hK/IKPQRw/yDY/9ZKiSQ5iPgkop7tbl+BxktFLxD6HrR0pkXfDFsLCG?=
 =?us-ascii?Q?oONvwYdTRha2jiyfd0wpFMkLChIjE4anmLpwsWzgzbiVCsmbStMMlV6Q4p9F?=
 =?us-ascii?Q?hfJeVD3QXteuSAkXUB3R+jm02ihyw0XymDUzXtzqdbhUkHP/MY0nXsUeETch?=
 =?us-ascii?Q?S+qv2XuLWOiiYQMlHZ/3N4JsU/TX/g6CyVVSlR3noK1BpGn2bRq0pfnmfquG?=
 =?us-ascii?Q?qmaqS2gwzofXgCXItCXkvsclG0roBGArsWzCRCoADa7fFBqU3xigLksqybTS?=
 =?us-ascii?Q?bpUIp2+JXiMkFQxtzYs7mvthMEbcb8XKgeJ0nN2hJcol2b254sV7cofdLEjA?=
 =?us-ascii?Q?pWqHLTD3YhT1jPi1WM9cdrH7GQGR7GlezEVITMhpQnhXYUMBp4cB35Cgdu8V?=
 =?us-ascii?Q?OCf5qj0mh3KphXx7nqx9VF6pknNXMeiL1m9ADI1JBVcjzQqVfRViM0RmYZSL?=
 =?us-ascii?Q?XE/FaHaIk6cXH8QsTYqwEYlhouBohVCvOs1PVxTZBCmGP9dsDWeslOfl2SLk?=
 =?us-ascii?Q?PPxtgZg1cxOyAUVRAZEzShGCTytqOmiHEvJefyNTiNbrqlJXykrZQqYQzi3e?=
 =?us-ascii?Q?fLodJ7yOBVUNnnNPg8tUDJiuKg8YabtOXWCUumGfkJYYs/2x8HfiHUV0lQ6H?=
 =?us-ascii?Q?1PCphhlJpBqNP2nCL1IYpqeeUp9Az3qNNvUyxILjSrD+mzHdWNgeaJiJeH9P?=
 =?us-ascii?Q?3ZBS4xX4jpAS6nDIye98sHRmyoTtpOuom9bSnzZm7yPNdow7J7BA44LyhuRc?=
 =?us-ascii?Q?FHwoeNHawWp2yhQ+j861W4/9uJz6bBL6N0AQnprXtth0cVloz0SlJbuFYfR2?=
 =?us-ascii?Q?6T2Au+k5aJOVkC3QeKr8/s8SEPM1AylBZA4+lh4GOLxD7J1lN9hVF1nb8uYc?=
 =?us-ascii?Q?UNjpphb0JPPaNVN2pTvQGfzUSk57d5bdSxV9ayMyTdxcuRu21gmCUQatSD/T?=
 =?us-ascii?Q?uD+iNKnfJ2FxpimxL1Gp+Hka1lDFvSnyX6vyKQYyKt3WHforYKbpvNBJSR8z?=
 =?us-ascii?Q?y2gGCKQw0+G9st7pLls89qqknG/8wwlqpuJ94o1tqeQ5Z2AZfh1gzHIknnnH?=
 =?us-ascii?Q?jX1XqLZKCdt99DXwGD7yo3byoF8ULAtE1ZL9wvf3niy43R1QVP651O17LnZz?=
 =?us-ascii?Q?wyDGGTjFMIInaSg3Lt5ZeFr/ergqyaCDGWc5K/mL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e86fdf-eb6c-4ea7-db36-08dbb45f7cb2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:44:01.2281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZB3zx9q/zjlJISTMj9uT5Grf9U2oQcn4m7ACetW/F+eRTs7P08cVn4YiYopq0+ox
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5955
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
Cc: Thierry Reding <treding@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
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
fsl_pamu_domain.c                       Y       Y       N/A             N/A     PLATFORM
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

fsl_pamu uses an PLATFORM domain.

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
Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 42a4585dd76da6..cfb597751f5bad 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1865,7 +1865,6 @@ static int iommu_get_def_domain_type(struct iommu_group *group,
 static int iommu_get_default_domain_type(struct iommu_group *group,
 					 int target_type)
 {
-	const struct iommu_ops *ops = group_iommu_ops(group);
 	struct device *untrusted = NULL;
 	struct group_device *gdev;
 	int driver_type = 0;
@@ -1876,11 +1875,13 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
 	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
 	 * identity_domain and it will automatically become their default
 	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
-	 * Override the selection to IDENTITY if we are sure the driver supports
-	 * it.
+	 * Override the selection to IDENTITY.
 	 */
-	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && ops->identity_domain)
+	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
+		static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
+				IS_ENABLED(CONFIG_IOMMU_DMA)));
 		driver_type = IOMMU_DOMAIN_IDENTITY;
+	}
 
 	for_each_group_device(group, gdev) {
 		driver_type = iommu_get_def_domain_type(group, gdev->dev,
@@ -3016,18 +3017,9 @@ static int iommu_setup_default_domain(struct iommu_group *group,
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
2.42.0

