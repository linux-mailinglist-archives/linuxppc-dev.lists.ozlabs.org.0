Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD7170423F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:21:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxjk3py9z3fNY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:21:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=alvl5yAz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::629; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=alvl5yAz;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxH4481lz3c7s
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hp6JoeiPrlDJrZ0TAt17E3jLu46Msap1QY1aeq9a0bgkQhUrhqCbjfbOsGrbQVOe+gTvdy+p66QYZktW0OP5jmNvXP2Rbp+kjPCucDUJ1TwXDnl5xv18CpvV9kjkdH1rSHKF9DCakPnDKBO7NKKKBwwYBgpbkUDctoR7fpJViO7nVVeULJp2KPI8aLf7s1VaA866bvrDiUENRgrPM0cLb4X/CH9TgWi8IercyYABzxNyhaiHWkftsRtcYI9Q3wFaVtMIwKVn2t56o1GGkeUrPq3YbWvXY5baDnj1Fo0XUMt4vpcK20grMy2HY2/RmTEHYn+gIgP7s5L9K5ZhuZyfaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuHl5OGu6yyxpw5I6xc3ti11rRRjiol5X+KWhzxRDY4=;
 b=G3i5N+ezQGwAKztNULHODuPJdw5pMh3IEGUw2YDdqWXpKWQMVk6VL9ncjDK8TCAAq8LwR79XUZB4a34J9IZMTzlubpjMrNTvAmqSr/Zf64VyqAQO8Fs+uF/XsxYZG6ZNCj8mOVwLJzIR37UO2Sis/9kHqEc36RoATS2EWrAOWNWu2RE1ObxtxeCCHvFMSfMtq6wRwl/n924DEuzICVLK7XAVVC9zpPrLcfgSjj/i/WiR+fLfUxJweQ9BIemAdplgROL42BvItVxhNQQ7kc0tZEjItunwDpM3VTsGPj9+2tBpCjp9wXheRe+1LaWoWAsLZHKrUW15MJmV0Czq3VVDPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuHl5OGu6yyxpw5I6xc3ti11rRRjiol5X+KWhzxRDY4=;
 b=alvl5yAz908MZUDnf0hstoTBcGaGzwHuxtOyTqgebr3m7HCwhFf21U4dI03Dr2SY22ir1RUu/Q/S6iFanWZ4saS5Kz7ZKMHmBfCqI7SmJOr9XE2s8+gL5c8aQAkpneF3g9vNi+lTFq7kV4pESmyV2zJRjX9/Fp33mW8EC5R9ngg7BSQ3SV0wzUSA5pir3eNVSZNCmqbj6lZBw739kXPOr9n7c+Lk9FVqFUjpfRLb0l+0vMFHLpdrL6FsQav8/yWZqaXct+6Cu09c6/U7gG9C5hCA7xNOkqVKAPJPHHVIahUNhlDBI80V4RzmnMAp6oF0QBdDJPr23o9DLHD7ART9Fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:18 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:18 +0000
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
Subject: [PATCH v2 08/25] iommu: Allow an IDENTITY domain as the default_domain in ARM32
Date: Mon, 15 May 2023 21:00:41 -0300
Message-Id: <8-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR17CA0036.namprd17.prod.outlook.com
 (2603:10b6:208:15e::49) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: 56e658a2-2100-4cdf-c40b-08db55a0a44c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	wj3Od7PlPMBNJ7ddb3NhWAJF25lFG15PI2Eza1U/WNSSpgVxXNB+u7bqWUpGuq74NROT7HSsG1G5uoyeP+8R7T1GA68HM+pABhFu1BnGhH3iSptkyIcaVJmglzdTJ7XPjJgLOvytpzKKdk9i6O+h228a4K+0upBVOLjVF3fdCouoVkQ+lPVL3eeVh0/0SnYquJ6UZJxgqzBpWrOur4bOua5DvGO2wJj7WTjhsceVcWDGrE/7A94ohzvNSswEOu/PCWAiVYkCVHLjyEqWhLHK2hAjtVkcfZDdpH0M0+Hx5QBTe/4zmVeSjTFfUTn586O1tZS0Bu7boeQLBCbEtZUNWzxbitbwksJEqTeJ03vD2yM/plnxteAnisCatCd4KBISXPbt+dRlBJct9tDa1Ylp4XiEOubJDWlZKJv9aE5N2kD1UvqNuB2f5Alv7eqO7Kj82XzC7FpJqk273rHiCxKppmpnKIcP5eU0MBP0qTNeItJfP85sxr5K3ikbpKG67wecOpvEp5F0/nVIdkzbRy/s+vGzTC5dbs2neC5XzBMPfHJhDCed486DuHSStrgFamZOaVVBsB5C+6r5ii/H9Kbp5Uamt8tt7xCRdGpzt8c+HQBhAJMxeY0GxkvLwIdTE8Vs
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(36756003)(110136005)(54906003)(478600001)(38100700002)(41300700001)(7416002)(7406005)(8676002)(8936002)(5660300002)(2906002)(316002)(921005)(4326008)(66476007)(66946007)(66556008)(6506007)(6512007)(107886003)(86362001)(26005)(186003)(83380400001)(2616005)(6486002)(6666004)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?uR6E003Jq5A0A4pMDi/6jEoD0+2sAXlYZ+j40vixwo79CsgAEgo96nIg8GUR?=
 =?us-ascii?Q?qqI1o6r4gLyKzwHCnGiQeOigqKIW2ZHJh91n5ihpkxxZMD8oGKUpv+yrLstt?=
 =?us-ascii?Q?1aL5ud9lXIQ4sJayMvnXToaBAak9qdXvon6aYvno3j0wn1CT8oWX11UF5qKT?=
 =?us-ascii?Q?DiZxYjOvZLrk0QpxISZRVHfbSxvp9wsH4RhM9tFJKCH6BMvg0/7EKOojpV0S?=
 =?us-ascii?Q?yHv/J8lhXlTBHHIhMdiA6m7+yuw3TOYVsSPg1pOIoqCr+PRaXgFtTkuWMiCR?=
 =?us-ascii?Q?wOZl10nebtEWGjpLX7b4gZKB/BhA0QYlg+D/HLncHsQJYMxi1/q+XiwNyY2w?=
 =?us-ascii?Q?l3Pw46gqndKATe7ZLZH+Zqb6nhtN7RGkYYRHckY8503mx1IesFy4wfwBslw5?=
 =?us-ascii?Q?KtwkXfP28ho16bakNOsc95zAg85uuwigoKZZhb18VXTWfxxvuOzfhl3R62a+?=
 =?us-ascii?Q?suBSUDpu+RW7wWpZALnsnTs8vD13G/cyT6l0zimp/mFC+N3+x4Vtu+m+wZRE?=
 =?us-ascii?Q?vDxt2bByPZfh3RFKduK2MBGiPhnNIbBcWZTJoet3IuXSv2oRLLJ4xUI70XvX?=
 =?us-ascii?Q?0elMAuXGaWwqMjKLt31P8s36ZDROBg5z7DBuotwf+CW4vZZFDJwxrcoMlzbp?=
 =?us-ascii?Q?mk0tfvyA1o4tjYXkC7C1Fcw0PHr/jHy99awmPJ56kqStRuvjqMr+HLLJ/WLH?=
 =?us-ascii?Q?TWChQce+G7sWW3C2OMErvE1+J21YFTyibETxHttqPNL5Gw4P0Ky4DcukXLLY?=
 =?us-ascii?Q?NFX8nEozOOt5/kbyiJ6V8AhkAcOgCuJVz8ff2BjFu2hKeIIRs4nAgX6YNike?=
 =?us-ascii?Q?NUb/BiubXq+7xrxsgna1N+cLIdcIVkNeRLbUZVEKvvnrePlphtex/7H8gpFo?=
 =?us-ascii?Q?YRJqAO4unrO0jr2M7n2fxUMblEKWIZr91+FEQCD+y21t6i1H740JcbpiwuZL?=
 =?us-ascii?Q?Gc7YriQ6IhlnE3BqXhkTs/qPg5VAAHSC9zhLoOy/Tkd5oZzTxitDKZAYuElS?=
 =?us-ascii?Q?Un12fkTM2i0PbqGwtjoNra6upvK4XCciTUTabThEaPaSEzzTsosK88yXxFT/?=
 =?us-ascii?Q?3gsYOoaw0u95cioiJEuv+0xUh1w7+IiwCU6F8NiUQpnyH/u6Civpc6bjQPza?=
 =?us-ascii?Q?Z6QuCcPf12ICTFTLJndtPNWBEYwpuHi29ocktiblnM8jLKIlbg+iRT7c0za0?=
 =?us-ascii?Q?SCLQ6eiQpzkMCH4+l+PgTHsStePVUTk/0/UkeB2snAbIJ2p4f1GrBP+xG/jk?=
 =?us-ascii?Q?Y4le89xQkPLmzCdmZjAhcMiqbg85tSl+oQJcwMnLZ7DA4FIqfeM1vPV9ngzj?=
 =?us-ascii?Q?nayuixT7W3EuAtT6512ZcHGcxWM5EGbwsglGmIYekATpbYcaYWTqV2eS0aPA?=
 =?us-ascii?Q?0PtjvFGFsR4StLsWM6XE0zjUeCPCxvGg+3JKP4E+T/Q697Ul9lmkzroYqsZb?=
 =?us-ascii?Q?3MheMap+Dr/tLcc66rWD2lARfFCwHmumJ7hI/L/CrtCxMJH8jQJaWUMnUI2m?=
 =?us-ascii?Q?2JwGN89YAH8Khb3ndBN9WRUU0hOusnwzXOAMC1wfhnSVRpyPW/n9BipW+x34?=
 =?us-ascii?Q?5QmuDSVpNdyUTroXLZ/4859/kXAghTLa43jumgtc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e658a2-2100-4cdf-c40b-08db55a0a44c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:04.4990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Uj60vVvqy5L39uV0Wp0GHm4GKrHZM70LwetdGtdqwheDGuZ2Rz0B8w9HYXbbYO9
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

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c          | 40 +++++++++++++++++++++++++++++-----
 drivers/iommu/mtk_iommu_v1.c   | 12 ----------
 drivers/iommu/rockchip-iommu.c | 10 ---------
 3 files changed, 35 insertions(+), 27 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 8ba90571449cec..bed7cb6e5ee65b 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1757,18 +1757,48 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
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
+			goto err;
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
 
 		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
-			type = IOMMU_DOMAIN_DMA;
-			if (best_type && type && best_type != type)
-				goto err;
+			/*
+			 * We don't have any way for the iommu core code to
+			 * force arm_iommu to activate so we can't enforce
+			 * trusted. Log it and keep going with the IDENTITY
+			 * default domain.
+			 */
+			if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
+				dev_warn(
+					gdev->dev,
+					"PCI device is untrusted but ARM32 does not support secure IOMMU operation, continuing anyway.\n");
+			} else {
+				type = IOMMU_DOMAIN_DMA;
+				if (best_type && type && best_type != type)
+					goto err;
+			}
 		}
 		best_type = type;
 		last_dev = gdev->dev;
@@ -1790,7 +1820,7 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
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
index ebce56d6e9c634..9e1296a856ac4c 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1026,13 +1026,6 @@ static struct iommu_domain rk_identity_domain = {
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
@@ -1211,9 +1204,6 @@ static const struct iommu_ops rk_iommu_ops = {
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
2.40.1

