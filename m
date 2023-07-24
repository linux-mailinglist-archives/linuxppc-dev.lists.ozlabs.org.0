Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7405775FDED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:39:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WuEHKuHO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nVN2d0sz3dyQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:39:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WuEHKuHO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8c::629; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6d1YvTz2ytd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqujkkzwlHP0oCciMyR4vPi1tVuTPxX3hMrtQhQ3yle2nuxFZG1I1517XpInZrISqH6b1o3FuxRhUUxIcxLwENuESzLNby5Xgvl/utKf7e9z66WyG0zPAIV80y/y3Q+X3uhauSXwnBiml5y63yTpEZIv0aDdK969DbPSRhl/6tJo1eNWDN3MkPlIdAzI2EmP84TwDNwwsefTCiLP5PlKwtNVR4pNjSOCNGCfyEtfOOXfKoUoLR8o0X1oyF6bla+XGMxzmxheZXV6iKTn16qJwvk51wx7ym1/P0aQjypPjUhkdZKfeEFYD1cxwfOaI57RzIxmf5dU8H2agRTuIC84ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5GHXDukFiznG+BAnSybCGYJiW7ONltFgIdytInRrqc=;
 b=Y8YPJLsfOPHrR9+ULssMHADAT73E6Veui18tvDVIisQMTET0ATi93+3tY+N+XIysRlWf1H4NDGfPqnANuL4rb29bSVtK9wL2pN8qm+aIPi8U7slFMZlkbb0gTRrS84IYycTP0ZQmRwhdvBKBIEFvpjoPOH3el01EchxaSiwYbupIJsrTMdBQKKRs5UVcMqo0VHmCf5ZtC3EYITo/eZOYJwPcn2GQqzE/q3YA43t3ZL+V0nZpxiKeWMLD2rrxtBp0aszsqKCLQBfots4jf91sKq3NmRblegngtm6fQi9eRO/9xZXPIVtbTebEKIRtrKNtYF6YNqWgRfjnJT3DZ/etMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5GHXDukFiznG+BAnSybCGYJiW7ONltFgIdytInRrqc=;
 b=WuEHKuHOqZra+9S92CZOlLPyMwUczz8JFohL1ePn/v7LgnFPb2M1iejFNLxZ8JYeyymjUX7w2WZdiGRgfNmpo/pNveIFVEGhHoXZbxqIAi5NRSxFNZSd7c/I2YOGTrjiZdBjiycfUL56CAX3C75p+VREm/qJr+wFpf+SNu/tcw4OAbYEcBRdxCR+4MOTYaJDCgStdf3cnAUXjBLMi6WUVYMbnVC5P9dCI7162kJ/1cs7t93A2H2Uzdzmhb8LmUWpOeJfmgbPlHRQeg+haL4uNjSttPTBpChTwUeeVakQVIsoOjyt1MIs6SBzLRpYBmcHIY2DvU/06BwHwpqRW682qQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5252.namprd12.prod.outlook.com (2603:10b6:610:d3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:27 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:27 +0000
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
Subject: [PATCH v5 21/25] iommu: Require a default_domain for all iommu drivers
Date: Mon, 24 Jul 2023 14:22:11 -0300
Message-ID: <21-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0208.namprd13.prod.outlook.com
 (2603:10b6:208:2be::33) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: 6660280b-5ade-4a49-d0ea-08db8c6a88f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	cCdF6hIqphmlsSQ1TsdyVw7GKBc7IxYaudO+fcFepF0WblehN0UeZiMvoTF1sICAMYr9DFt0W0g7gn2qNbM4b8wachUmLzXHmtcolOg2mdvnKI/ttq8lXSz8s6nFPrarlnR71T8/0J/075VwbDgE9iTVvP0Es6fiXqCkYl4gfZ3jV0aOKy8LTC80yDGV/CqTyCu6x4aBgajDlpUq+KpeSlrmwV8QNAFIvy1t3b4eAISKZ5kOp/9DWz1fo4A9132y6sosnmgPBjn/KmqI7o0yk8TbkodqBbyfL3Dg8GsVra9B4OuZ36mG784eAyi8xL/bOuVOkqifiLVR09pE9hmKxOuTeT2X/tA2ei5c9LVfGodx/1HHRQwhx8PdoUNFD1FyhMEOAlTWFFs+/DgsZqbahLX95yy5KJWM8U2UFdWcXUOjAHdMMZs2xZzWIlCiDk1+cH+usIYOSIPsl9fp1SWaHOZ34KQqQQBbktrNYE73nZaA91svlcFEP24aXWwwhLaGsyWWBj+bhr7yim0UWrwngfgsK4Svb/eBdAz6XTGzlKuleHuHxqhe5vb5m2GQTz1qwcijhbQpyVkB8qIHFQ7o22vEueeKsNE9yqPG1kg2aUo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(2906002)(2616005)(83380400001)(4326008)(316002)(6512007)(66476007)(66556008)(66946007)(107886003)(41300700001)(6486002)(36756003)(478600001)(6666004)(86362001)(110136005)(54906003)(921005)(38100700002)(186003)(7406005)(7416002)(8676002)(8936002)(6506007)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?E9Y7GSXorc9/MenCgNl0Efd+2iGEw9EkCXVu7Mp92haw3me5FS0fTQmKJtgY?=
 =?us-ascii?Q?OEZ+KTldetKckIywRfM5zTH26eYnPBixIhKihGTddl1mbY1O7RJqaVCfiMWP?=
 =?us-ascii?Q?qb0TW8FtqUZa0zFB7jwbzNWVxR92DaQkGGjqAkbwuHi0Ncv6ukjec0k5SDGS?=
 =?us-ascii?Q?H9hado0qXgpjIIV2Q9+6B4w+SYib/PveXp7huibFMDfnpbjBBqhk7Ynx3wPg?=
 =?us-ascii?Q?6RAnv2CSMWkxb+f66THXXFbWrTXMO+iLx4YtOf7uZiJwDil3/0ZLTYf2SeMj?=
 =?us-ascii?Q?bKu/1Rb36he3klWwdIQCwwKYYHkHWMs6dEokiKM+4mgTCWXcU9w6g3MBulJz?=
 =?us-ascii?Q?v5w/K7ZCgdIEPMm46GK9rL+mGBPMiFkmwmPau+5uWfCuCoQv/4+gktVR7i+j?=
 =?us-ascii?Q?r7Nr52ke54o8zGY1vCoh451jIgLtUk/loh75LLnZm0CGQLHXqqma3vroL+3M?=
 =?us-ascii?Q?ntVH/3AWoICQksLsSLyJe4A//ObeMsCcMXjP3flKlX5lxOQKBz7QNh0r233Q?=
 =?us-ascii?Q?70V0eA+GERHoIK91iTzuFvBmvbIyUrtGaU89uvYx2qeY1yXvu5kWGjhXJlvM?=
 =?us-ascii?Q?9SlQVlEMlNqRjxw/jGhvuyJb0ziFnuAEvXj7xQ5fZAkzifWtgwmh60xjuZzl?=
 =?us-ascii?Q?3J8Gue72JYGBqvi08/wYgvCPvhxHYtM7yYZTut51NSiYmqfc+h2zHO92vqnY?=
 =?us-ascii?Q?d7JOCdttLvJkncnOCeWtFRkLbEMTt83wBnU57bXd8pP7jGR03gHQUCFfeZNw?=
 =?us-ascii?Q?He3j8Xi/+NS2WIpENKPnJb77j6K1/p4hZbQT2vC+LSAqO40QGJaF9Cml0I2d?=
 =?us-ascii?Q?x3BY7QrCIJqNp3JGL+PuDZi8uRH5rXyk4BCfGtTyGzjbPV4VuezWKfY5TnJ4?=
 =?us-ascii?Q?MRf5JSCMwC5uz77vSQSO2qxvJUF8AOLJi9t7MQqOLDq3ZLMSsQYDJhIYTdCb?=
 =?us-ascii?Q?jyz7rFCyPWSVd8EFY9dwyPEJ5zOzcgwtSH83vLMGKleAjQ3AMgEYlN5NN9kc?=
 =?us-ascii?Q?+Mqpn2jsoLvsBNzr+2DyW0198bWMKvOHY3xIIKumEbA30XYJwd1oc6Q6WEbL?=
 =?us-ascii?Q?VuUkKxJ7/41eyF70jqEVW86sgj3Kz6y2/3WbNSwU9/UwPXRUW9eZf9Ilofr2?=
 =?us-ascii?Q?DSCEHuZ3ZfvDQ+bbE8SU7IUqPuqSSVn6/77y7iRBB1X2YlXl+tGLh41wfp7V?=
 =?us-ascii?Q?bKPEPdIOa+0TukWiibtq1F4CHKa7g3jxOSuoeKUE80URkBPgDRqgwat81woC?=
 =?us-ascii?Q?U31T2sf8j2uDFrHYSOYgtDkq40JczpttIWBbb8sm7AS7jICr6DugNGfMFsLm?=
 =?us-ascii?Q?9cnYnJl6x3ZOM68F1d3CEjhqNscicqSVR1kw8wEHR3PgBX1klfMjcKW1UBL+?=
 =?us-ascii?Q?HiVzlZOJgTQJAywq2Ly/RZqAEXvy0VUqydUFm9cOldZf8vo0QekyL2PRbaIy?=
 =?us-ascii?Q?EWzm7ZEXgLZ8wGfp0VvkCg6YA6ijnkHVd1+W6dpDT/eU1xrwdLKOm+RWEaCP?=
 =?us-ascii?Q?SNonmYZ8iEJGlqznfkR6ZYCyBRd22VW8Yhiq8og339pnCfmUvX8qmvxDwtl8?=
 =?us-ascii?Q?0G2DXrBoK4coukBX4PYrgmbIx4Sl3q9Z3SlMFJVw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6660280b-5ade-4a49-d0ea-08db8c6a88f2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:19.6438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7W4DX9vpBaiZPPeUxuPcbzapFiVr1Z1j+lOtNmL/iqjpzGshyAo1cuSEvU0nkG5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5252
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
Cc: Thierry Reding <treding@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
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
Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index dada2c00d78ca4..1533e65d075bce 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1819,10 +1819,12 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
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
 			return -1;
@@ -2920,18 +2922,9 @@ static int iommu_setup_default_domain(struct iommu_group *group,
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
2.41.0

