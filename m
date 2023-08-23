Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D9A785E01
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 19:01:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PKP1P0MW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWCD96mnWz3dw9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 03:01:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PKP1P0MW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::62a; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwp1BQzz3c2L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AN7kbVitIw6DlJP/iIC4gk8tiqEspDGWIibSKpRefJJgiFIGHV39H6+K937JpepTfJ4tZl7OKIPvLix/CrvcjX2tQfPl4cTdadpoUQB+z6Off/fzgtrk8S5LiVGFafsQQ8I0DUCoQ270EQFhoPwPFSEWyTs/Z2PamS207mwqE+II7/5WJKk/IpLEEholyvTIFbiWjNnKsfFWpU2DK4JK+GqYqXEUzq6GTB0mrv2Qij92GeuRfZscWHxfbjX8l1buaOWwo5jcJLI/iNLTAiFV7DZKZK83c3J0gp2AyeCxQnejmqv67lff93jE64Vn2P9ncHz3FbMMqLo7WHHbgyf3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNe3NtZUDX6mfKczMEsjrUVsvVRJpjvl8wBdxxG8bGI=;
 b=HnW7OGZKLiN5v+R+8yU3t9fhL6MRhbcFy/xRcEUo641oOxhH1WR39EWm4u2ws26EcI7ddgxkdhpZWuD7mEPeGbBpRQQgMLeJR+H44pzSSB1nDq+57RokdiqYJIOBpTmgw5X8j3kxsURH+vzNwSKy5baRid9U8Q2efiSlTi3HhaRlfvNd+2kd/7XKZTSlpCe8XzXk3x2TroXADCAcaAu+JddE/A4vRqzPQ9sDRKvRn9qVR2zn09VSGkcQye5iCWmezwiutuaMtcAWomzg38iErd4G4IjV/fBGCyRJBy6lY/PeKAn9Us2Y9QP+fS7l2qq02q7t7qwYOR20tURflXIQOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNe3NtZUDX6mfKczMEsjrUVsvVRJpjvl8wBdxxG8bGI=;
 b=PKP1P0MWXfdeUeOB39i4xA/TPZJR6G8gZs8ViPId9Ld+AthpMzhSxV5+hHQqnA+AQxJZ0Sj9GLckjbsNS6BgVJl5l9cn5kF24HjPYKEAriMwTMk1Z6NtscgDLWcboPanI9F8zqSCOgVYbpWTYFjOqRaZPfOCvabrsU/QcwpTmohaciQZ4CvWBFOH2W1oQiunL33kWKTYj9Nfn9btR+kq/UiUrzy9eXkCWBOEQWQT2jPcBZOJtlT3S7OUWUNvdLruwO+g8QMXSSzvTUB6Klruec16RD9UVR2KLHvstog9Wgl6Ee4uZv4Bjx+FGsVROXfJMKTVwFZsdYtsibwjEpCovw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:55 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:55 +0000
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
Subject: [PATCH v7 20/24] iommu: Require a default_domain for all iommu drivers
Date: Wed, 23 Aug 2023 13:47:34 -0300
Message-ID: <20-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR14CA0045.namprd14.prod.outlook.com
 (2603:10b6:610:56::25) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 6601ec74-7a15-46a1-7574-08dba3f8ac97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3u7GKBsyVc1sBsf1e2u4hqg9g+Ba1xkxbixVU/YVHhLe23HttNmzbJdRZllXhoAP5Mqpxl8q9vnlT7PpVrDTaBLEvl2rsYK3pU/Rr9u77tq7Q02Sa3k2PPdLT8nsFzFboJbO26u6U2bPZ46WZFtK1/pxK0OmnoAprbkTUnGTxwHqoRTJewSi2a5YCthF4D+d3DaM8vqmJsv37U6GKKtFGfKKoW+aJ/tBBbTdjx9e5x4BVyRqbpvfJc756cYPg2DpYAKORFtjzS+WbTcUWdetTS9tPKn/kqBn9udVczkkef0AroJKJ3272AjOHMi/5l71Fcn8YQv4hUz53WN8EnoCx8CwmUW1VCwgPBk0Z9YtoAEKMq+Dr8tSbdOjW/RXmYA3RB5niwPEGJ+hHJmM0ACoins9pwpqi+BjWAHwvUm2bX8tXPFlrAHCfo6ii29RE8cER4Gg6Eq0GgW7jmGbr7S4Jey9NnhSyE5Q55t61+IzX729UPQICjX7lJz5cFABwf5aFvbanSEUcLoB5M9r1B530JySj4+o1d75aSEXQgaMtMCbYCRvM/GOISkE1lZZ1Ln2+0bdEQMxxm/l/I+bTSrcJXaBcr/VNlk/Mll50+HLGG0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?0KMWfxZUkD4n2VPgpou8SydY/CTDDm6bPjrlv7u1bUGj6NzC4y9IG8oMM6E/?=
 =?us-ascii?Q?XmePkznd6dP5ITZoPKcG3YjmiyNKYUWQrIjAkYus9JW+1o7Rzo/mGEPf7O6W?=
 =?us-ascii?Q?WkRAJnsEjfnQCPZTeHlrTVCPO+N6FqUbp/Ure0Tnj9tVb0dy8eGvS4sZwqcR?=
 =?us-ascii?Q?fEjjIm+WBqNb1e55rzGEvJ+IDSHkmGzlZ7vhzT1bDwKHkEoyPI6qMvplJs9o?=
 =?us-ascii?Q?kKUifCWoiiBArV+ldV2T1dgIua57OcmKwY9HBcQX++TlH6Iso9jDAQhKvnEA?=
 =?us-ascii?Q?ATre7rQe0D/tPCrWquxOZ6Nel/gDhQ5Q4Yqre5dM5jqpTgUN5gJWCPKbOn6g?=
 =?us-ascii?Q?nD1UsUitXHdNOFOok78qbQ9Ld9KmBPsp+SRP0HQnynni05U+oEYz9CE1CAOh?=
 =?us-ascii?Q?KeT9c34b1PcIDIeyQxbsP2FMeLLSKWNWpxwpyciJSoOQBoFaRg5Oaj9F8W/U?=
 =?us-ascii?Q?Fl1xPPUxlb8/E9yiEmF/mI+8LcPSg4uNYmghyAe20r+FGlGMHTMkkv7Lm5Cr?=
 =?us-ascii?Q?VFxAl8PnX5Lb/dKGKuy4j9ETrI7dGCTyS0JvtDDkmrboVrOR+oOQAvy/COSd?=
 =?us-ascii?Q?RvtFx4BLECMt2DDmTZH94QhnBcHfbo7SjMZRucmgxF01WtirUA/9J/2DLxBe?=
 =?us-ascii?Q?1DtUiY8gYuqjrhWTOh5bhcGhKEynRQAGFHUMY2qAezmslE5Zj9loflSTSb8d?=
 =?us-ascii?Q?qoC0PJXzDOAeyOVXrYZTNcSkagZj8gw45Ud3ERSijwrfpTc/FfWdNAuY0MEh?=
 =?us-ascii?Q?fVIQ5oTLDQo+JO2DoL8IWEkZQ9P9YlkuK5xDJW52tM6BV6xXGhxuOSbb0X2l?=
 =?us-ascii?Q?qHenZHqGBf3FlHQKhlP4IC7Do6ACpu1LSezgH+A0xXghianfffVR4XFMWy9M?=
 =?us-ascii?Q?rQdsaKPLp6gHPS+p+katp05+4PBLPUwUY0xvKKcL9G2frsALz4g8nyR0m8d+?=
 =?us-ascii?Q?mco55/DqwyqL4vAdFr/cFSZbOS1eeDH4WysK6J7nCyEc9EmSfmwPZ40m6G9R?=
 =?us-ascii?Q?CUwksAKHhqkSJfBgJcAAHBHxNd/5uCPVhu6jdNLTBSW1eBkyL58xRQb7yszb?=
 =?us-ascii?Q?YeWCDaSM0VfcfSey4WFDB+R2DynzPB9Bqbdk0GM6WnK9hEXnxw4gxrJCl5CC?=
 =?us-ascii?Q?FIBlX3pJ9J+iT4nRuIlZHR+RhpVi4IABH4vJ0YgcKMVP1Lx/OJxBvdbb3Otg?=
 =?us-ascii?Q?ph2ems8m5/695L93s0EKaLlpYDnN5g225F7Qj6hxKdD8LmS2wmzpmf/I5l3C?=
 =?us-ascii?Q?9b/ewoqLGgKH02QC8pfwjd4VmXTo+Dtv1JJYKsfBKrTcJELA95gIxJ3AdqXp?=
 =?us-ascii?Q?1/hd9yFHW4bpsldjia/qHF7vkTJ73csC6rhkxXyCuFlL6dPmyykNfDfM4ZBT?=
 =?us-ascii?Q?fmc3sYqGEvOdACXkLhJiEGAj/kVSW1SP4vMJTjq1ptyJ3E1QneVWs2FR4gyW?=
 =?us-ascii?Q?ufb6Mys9g+HM0Sl0ysWIlK0s/ahvRUGQfHFzn7wkGV8auTRWp1cKCXNCcUhy?=
 =?us-ascii?Q?RnNBb4vgL7Zg7JRIUZPwkjiyAX2Qbzqh6vQknBXIPhWi4R0FqOAR2hkJKLDL?=
 =?us-ascii?Q?UQYFJglSNRLNQRX3XCwM3ZQd6WrT7OcbC8RcoeCQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6601ec74-7a15-46a1-7574-08dba3f8ac97
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:44.9410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0Ch1qiCbDevx9rBL2t2BZ2taFUPUySF4l3KPHjJUWyiPUVw4QIdXRsCBvFkbk0U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6346
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
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index a3b016543fad00..3003c249ab9b8e 100644
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
2.41.0

