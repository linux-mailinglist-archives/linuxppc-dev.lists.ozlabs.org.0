Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D07275FDC9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:32:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Z90j9sMo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nKs04MVz3cWZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:32:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Z90j9sMo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8c::629; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6Z3B9Gz2yGg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5eX7IWH4DUwVI3joMNrxfOz0x8jU9v7p5e6ipAXlTrzxsd9eV6+8lXK2kLOU18Fw5cwHQEmtA4TM8HGRZ/lqMVQn5UTM5RGeD0xmz4cC2NVLhFazw7YZlCSYKI/0RiB6QUoK8tUMl3jesERZnPfpPOP7YxCapFZZ7V9gGHOAs1qP4NY8h6bGUlU4X3JaSlXXunTgDSeXuOKlZMzcxm0PirlgbpocP1YGKdgR9qNNm9V7xLynLAWZff2yDmSnmZV44tqtGpnS3jKzUTRuMrKEnd4a8DkKK1X/uFis/Jzta2Yyt934d2HiZ15Iac3KgJh4i17+QXaoiHvMFD1yPUsVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eopBiMSqCw6AUiHv1xpZ0ZPeA3x+XCX2w/wkIKizTT4=;
 b=Fp97QhxiKP9wMklaocJ4bQhuHmCs6YD3Wjh0A/IltMJRT8U3fYPPyOohZ7tJiy5H7qUV0PsHk2gRYtGfOxxaWm1DciLKJBYAS0rKxAeqTrBfszPaQ7lMsIqDVW2ILEugOZSvHAFIhMWk9eEI5qQEYlwhzD951MpMlj+TLR044ASiLiwdAvaZkdRT+lgQVLDLNTQ4tXmikJIV7WkFuAUoIuDrSKWu5BPtO87VyEyj9I5gZHmW8qsIcqjc7PQNw58coRpQYTqqLD7LzjUTqFTOe3BBTps9HaCFL27u9/9YpDkMJmnirGLT6LOfEa1NfczK00BXhksE7rVea09SfzTBeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eopBiMSqCw6AUiHv1xpZ0ZPeA3x+XCX2w/wkIKizTT4=;
 b=Z90j9sMoeU/UEyeWMVxB7PzGAcX2UPaYOTobWGVvgfGroO4zYPUTr4g7Pm05rIzZ6QIj9eFd4/qUlEi3mSOrzX2lWoVekIjta5GQ4dhMq7FZYtVcaeFQGMwDrlG1uxUIkPieSM1tN/bdYDajeZDICzAMLhpFRy3gNYFvFItlXwOyE7eXTa2hPH95BBzI0bvK9n/c8q8WCl0mM7QMr6uhu7HBiuwiNzLcvxdX7qXM00mmrmhNk0P8I/d+v9phBBMu/ZLbVxpHyFY1TEztNCVoWmFZUG3FpSBCCn8zAU63/3TM7g/W6aX/tHOdWlm2TJSZ+TMGZ/ZMtxTQ6eQWXHrXIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5252.namprd12.prod.outlook.com (2603:10b6:610:d3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:25 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:25 +0000
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
Subject: [PATCH v5 09/25] iommu: Allow an IDENTITY domain as the default_domain in ARM32
Date: Mon, 24 Jul 2023 14:21:59 -0300
Message-ID: <9-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0001.namprd22.prod.outlook.com
 (2603:10b6:208:238::6) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b3cd54-ee91-4a3b-c617-08db8c6a8882
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	j85hj6icfCPn386bw9HkGNj9e6/T/OHJPVPT0GEr1U06XKE1vyfcC9JrubRSBsx2vKdiY5T4zAo5Wgg39jj0n/BwuJyoo98W44TXls3yJQNm6w50xTI55HR7yyfvC200jfkQT7KcIrfIjy0s5NDVLD5h0n0cQOyJmgEv7m95wb1QlU2267NcabJqyelbYtSYSAMjSOT7l/G9oQBgYJe5JmVB8TDleojd1OfNnMHj7L+ChlDkdrdMspFJlUX3lTHq6133EaeFX8t8NAcecj25GtaJfNFqcQ6CSEh5hS7/bLCWuQznZ7oHv2D9iCkbn38mHuYIbmlW7pzMfqJJHmQNxy243aYmT+97JIhfvyxOJJ199WbyJP3Cf10iEFzCZVKani4s+TqHdbWpnHCKlawMrbHwjy57fODg9k/SupojoKPyNkwjJVO8Ssn5fuUs/hhPrhP4jr8N0TwbVysSL3BGYshap9xjoVqnpm/rjtsxH4M3E2DBdL8BmWoLyTCREvYBIMOj/RjJA+5+Z3oSbfSqyNOeduv7YTXXfUUHNCTuPbU+dFo3aHvXj9KGCiB2IFB3d3ZsDwNa48T37/uLUxcpR392almIOYtzLi5s+XlSzjjR5F0TfB3DDV2jZt1xUDo6
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(2906002)(2616005)(83380400001)(4326008)(316002)(6512007)(66476007)(66556008)(66946007)(107886003)(41300700001)(6486002)(36756003)(478600001)(6666004)(86362001)(110136005)(54906003)(921005)(38100700002)(186003)(7406005)(7416002)(8676002)(8936002)(6506007)(5660300002)(26005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?sdCdRDNcrootdGys3HTF2HRPAnbt7iNZ8TC/O08fMGdwzT45q2houTv9ywgU?=
 =?us-ascii?Q?NGDLBAPBYFS3pC0TeEWs46YIicBWEHD3MGLZ8cQYYpuJW5BA8eH5/jxKlumA?=
 =?us-ascii?Q?qOEN1gzJkOM+n67LVIafFtMxQetpLLAi2d4b0sf34F02hhbe82KH9ZE2K3dg?=
 =?us-ascii?Q?Ux5FOFx38c6RNHJdx7KSrHtI6WRSHess8AQhLZLCqlCibEylg6aZfCG3fE1G?=
 =?us-ascii?Q?9J3PpMx9aLfpQdip4YPjAko++B7kCECbgHys7LwV4sWdmgeZbyFRDec/UW/u?=
 =?us-ascii?Q?7BCoVHJFi5J8nMJ+l8rVsj2AOZswhjn01jWMZdho9SGuFZFF4/YvvVi4TtGW?=
 =?us-ascii?Q?92QXyCMEr4mihaPkexNu7+uo8FvD27bn/dEpxMNC1lA2LclUGPRQvCw9bEsm?=
 =?us-ascii?Q?tVENq2P5sIt+Y7qL0sPGaVPLSgKVkhT7fyPCDOUoFtdnFxtFl/P9S1jVHOHL?=
 =?us-ascii?Q?4yV0TpI8LYmFTcp9P+QRYJDVvVWlzmmD6COPj/c5cH4wE2S9Zi7nKBd3edrF?=
 =?us-ascii?Q?fn8PPXozxXYD9ocUBFRWTv800KtHgvTz38ceoTMxkqOyGC/kETMcjPxSS6uW?=
 =?us-ascii?Q?6SJoNPYInlcPUTsxX6GP36z74r31fsmuH3UrvpuQw3gXC2iEaq4RfcQL8U3p?=
 =?us-ascii?Q?pE0hvHl8GvHcg1PXlV2vUSfg3OAsP+o0VZ4tG4iIN3ViJZ9A7tJpHNdDKMV2?=
 =?us-ascii?Q?WhBRZiv0PIw0uGzCDnIkIAj8SyAoY/c+8r7o5GPJ0XayiI7IOYUQCjtkmu94?=
 =?us-ascii?Q?zfVB8p8nmCdZFvhJb4Hpz/LwNJlzGGH2hp9GYu/VSh/kD9QlAe3HTW6e+XGs?=
 =?us-ascii?Q?jjDxq5VGRp3896VB8RZuacW+qm/x79Xdg3OQ115j80eE4PebBqZNVBu140fq?=
 =?us-ascii?Q?YNy/Lqj3+hZ+M0ub6Xnag9D3ZpraZ2f4lHC3b28Hc70AppP9S8iwbmQQou1B?=
 =?us-ascii?Q?OEF9S3clD2/96FTGpWP0ppxneEwlNh8Vqna9wIrQx1a1MwiIEFeLvJ/zipHn?=
 =?us-ascii?Q?b6O0gz8du4rGBR1+V60nrUvG6l/98eQsvg1AMzPQZgSwfM3ydOlaCUlJ6lJT?=
 =?us-ascii?Q?5qE4IL3d48YEhkqgxSH4eV0OZNr2KOgm2ZvTkfXQCzz0qHXuiavWiL57SwFn?=
 =?us-ascii?Q?/1VY0Rxf4WeQ5vyWovkI/Y5GwxQL5waHp+lnmte1AL85tty7KYIIsvKbbl7Q?=
 =?us-ascii?Q?dBCthU7naIt22RuO6rBfQi0/kTp50+jhWXwTga5L+NpQroYVBbR76GuB/mtr?=
 =?us-ascii?Q?xwJZrDmyQmkqrCaKUWtiA+hoJl2mIZ6re0Xybz/axp2ptC1lRIpLUi8WRDaP?=
 =?us-ascii?Q?J1Ma+tmFKSzgMTcaqQ5P8WMuxH6JOexbm35WhwZUO67d0CDPDXgnIRo4J1hP?=
 =?us-ascii?Q?TW7pU5k9ESn5G5fKePSg7I6ZxssS7GeA51cL+1969BTmQxLu91j3Xv0qHTlL?=
 =?us-ascii?Q?i0gmlur8cyp88MML941kLELwxpwylYeBw5zNIHWFtjQCBRU5zYovxfEc+qfW?=
 =?us-ascii?Q?AINiqkOiFpsg35XvoWHR2fvuoF/YA/AmDl5CGtUNJvI73oh7O5Hw+tPcFr6q?=
 =?us-ascii?Q?R05/hq0WyhNpyPgfOzy/D2OpBwGYUAddXy4SpPeW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b3cd54-ee91-4a3b-c617-08db8c6a8882
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:18.8994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHJu+Z6LHwxHxRTfsIAMQL5mQqmych2mX9R5zK19zHBVpE12Gqa4Ikirb8Ohe6Fm
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

Even though dma-iommu.c and CONFIG_ARM_DMA_USE_IOMMU do approximately the
same stuff, the way they relate to the IOMMU core is quiet different.

dma-iommu.c expects the core code to setup an UNMANAGED domain (of type
IOMMU_DOMAIN_DMA) and then configures itself to use that domain. This
becomes the default_domain for the group.

ARM_DMA_USE_IOMMU does not use the default_domain, instead it directly
allocates an UNMANAGED domain and operates it just like an external
driver. In this case group->default_domain is NULL.

If the driver provides a global static identity_domain then automatically
use it as the default_domain when in ARM_DMA_USE_IOMMU mode.

This allows drivers that implemented default_domain == NULL as an IDENTITY
translation to trivially get a properly labeled non-NULL default_domain on
ARM32 configs.

With this arrangment when ARM_DMA_USE_IOMMU wants to disconnect from the
device the normal detach_domain flow will restore the IDENTITY domain as
the default domain. Overall this makes attach_dev() of the IDENTITY domain
called in the same places as detach_dev().

This effectively migrates these drivers to default_domain mode. For
drivers that support ARM64 they will gain support for the IDENTITY
translation mode for the dma_api and behave in a uniform way.

Drivers use this by setting ops->identity_domain to a static singleton
iommu_domain that implements the identity attach. If the core detects
ARM_DMA_USE_IOMMU mode then it automatically attaches the IDENTITY domain
during probe.

Drivers can continue to prevent the use of DMA translation by returning
IOMMU_DOMAIN_IDENTITY from def_domain_type, this will completely prevent
IOMMU_DMA from running but will not impact ARM_DMA_USE_IOMMU.

This allows removing the set_platform_dma_ops() from every remaining
driver.

Remove the set_platform_dma_ops from rockchip and mkt_v1 as all it does
is set an existing global static identity domain. mkt_v1 does not support
IOMMU_DOMAIN_DMA and it does not compile on ARM64 so this transformation
is safe.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c          | 26 +++++++++++++++++++++++---
 drivers/iommu/mtk_iommu_v1.c   | 12 ------------
 drivers/iommu/rockchip-iommu.c | 10 ----------
 3 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 53174179102d17..a1a93990b3a211 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1771,15 +1771,35 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
 	int type;
 
 	lockdep_assert_held(&group->mutex);
+
+	/*
+	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
+	 * identity_domain and it will automatically become their default
+	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
+	 * Override the selection to IDENTITY if we are sure the driver supports
+	 * it.
+	 */
+	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && ops->identity_domain) {
+		type = IOMMU_DOMAIN_IDENTITY;
+		if (best_type && type && best_type != type)
+			return -1;
+		best_type = target_type = IOMMU_DOMAIN_IDENTITY;
+	}
+
 	for_each_group_device(group, gdev) {
 		type = best_type;
 		if (ops->def_domain_type) {
 			type = ops->def_domain_type(gdev->dev);
-			if (best_type && type && best_type != type)
+			if (best_type && type && best_type != type) {
+				/* Stick with the last driver override we saw */
+				best_type = type;
 				goto err;
+			}
 		}
 
-		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
+		/* No ARM32 using systems will set untrusted, it cannot work. */
+		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted &&
+		    !WARN_ON(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))) {
 			type = IOMMU_DOMAIN_DMA;
 			if (best_type && type && best_type != type)
 				goto err;
@@ -1804,7 +1824,7 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
 		"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
 		iommu_domain_type_str(type), dev_name(last_dev),
 		iommu_domain_type_str(best_type));
-	return 0;
+	return best_type;
 }
 
 static void iommu_group_do_probe_finalize(struct device *dev)
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index cc3e7d53d33ad9..7c0c1d50df5f75 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -337,11 +337,6 @@ static struct iommu_domain mtk_iommu_v1_identity_domain = {
 	.ops = &mtk_iommu_v1_identity_ops,
 };
 
-static void mtk_iommu_v1_set_platform_dma(struct device *dev)
-{
-	mtk_iommu_v1_identity_attach(&mtk_iommu_v1_identity_domain, dev);
-}
-
 static int mtk_iommu_v1_map(struct iommu_domain *domain, unsigned long iova,
 			    phys_addr_t paddr, size_t pgsize, size_t pgcount,
 			    int prot, gfp_t gfp, size_t *mapped)
@@ -457,11 +452,6 @@ static int mtk_iommu_v1_create_mapping(struct device *dev, struct of_phandle_arg
 	return 0;
 }
 
-static int mtk_iommu_v1_def_domain_type(struct device *dev)
-{
-	return IOMMU_DOMAIN_IDENTITY;
-}
-
 static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
@@ -599,10 +589,8 @@ static const struct iommu_ops mtk_iommu_v1_ops = {
 	.probe_device	= mtk_iommu_v1_probe_device,
 	.probe_finalize = mtk_iommu_v1_probe_finalize,
 	.release_device	= mtk_iommu_v1_release_device,
-	.def_domain_type = mtk_iommu_v1_def_domain_type,
 	.device_group	= generic_device_group,
 	.pgsize_bitmap	= MT2701_IOMMU_PAGE_SIZE,
-	.set_platform_dma_ops = mtk_iommu_v1_set_platform_dma,
 	.owner          = THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= mtk_iommu_v1_attach_device,
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 033678f2f8b3ab..a582525d36f8cc 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -998,13 +998,6 @@ static struct iommu_domain rk_identity_domain = {
 	.ops = &rk_identity_ops,
 };
 
-#ifdef CONFIG_ARM
-static void rk_iommu_set_platform_dma(struct device *dev)
-{
-	WARN_ON(rk_iommu_identity_attach(&rk_identity_domain, dev));
-}
-#endif
-
 static int rk_iommu_attach_device(struct iommu_domain *domain,
 		struct device *dev)
 {
@@ -1183,9 +1176,6 @@ static const struct iommu_ops rk_iommu_ops = {
 	.probe_device = rk_iommu_probe_device,
 	.release_device = rk_iommu_release_device,
 	.device_group = rk_iommu_device_group,
-#ifdef CONFIG_ARM
-	.set_platform_dma_ops = rk_iommu_set_platform_dma,
-#endif
 	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
 	.of_xlate = rk_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.41.0

