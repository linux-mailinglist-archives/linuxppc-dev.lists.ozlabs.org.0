Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5796F73393E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:09:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=V0n/5+R+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTHD1jlqz3cWx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:09:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=V0n/5+R+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7ea9::60b; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7ea9::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT8B0Lcdz3bmZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wb7Yn+8+apISWwRD/1GcDAEYLLUSIN1ynPp0VFBKJzgeSzBJ6VqROYPGc/q2tvlPcZNPfY4ZmbYIS6msYVvEUmt9R1k/QbbQEtCBC4fvEmF/NynrdTJ8WEvo0AdD4/k6oRisSbL+z5JfDJk2WdsgNrnKkMLVyEq3R2s/sMnYuiGlhXcv6XpDDVcadMVyPJC2cZdK5k3oZKkZRRcq2soONWZi7OVuBHbeFVUyU6OaVMfWCORENP1csRDjlywgqG29nRqM5gYzro8KJeov3M1mBeqkPHUklIysKDLV/Kf7TJ8jz5IaM/WI2yNhlWp9ZCirrRtZqp+1VlPDzoY0uTWVyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTyavZJIyqr4bzkZ78lJsHJ+7Og9ytKqwQ0syxXa+K4=;
 b=iQpTVigddQ3W1bvpxs9sZ1ZsGLS41PkyGIqEgROO10uFYEA0ZGMWUx+SNilfdqJd4s863rDQp4GphYMP32Uk7RQkCarPc1QOWFpkKkLJYtfq099aB9vkAqvSRzRlI9pmRsjCO54aoMNr/ICNQkdEbzin/iGwDOXJXY4w0j5SIDYPlszTKx77gMjWlWCgKHjWu6WVomSGDRMLuvsVGGDyxL0/C52AmiJzS4EBmJ8tKseQbzoIfZspEa5hWOO6fP+DgSqA5ScowcVE2CHVYClO9AgwMcvLcPGPBvfZefAntWkC8xD2yaClXsyTdEcgARFZzUCo94C6vVycQNYqRRtutQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTyavZJIyqr4bzkZ78lJsHJ+7Og9ytKqwQ0syxXa+K4=;
 b=V0n/5+R+0FViFScxxs8W05wMBwG7YYInHsPO/52mVT5bE44trSaLk/hWejunwAIHN2Xx0rgXIVdgRLCX40NI+7a1K0o4J65P+gM9vgUjJ2zf1Ccqntf4rI+aVTKtPOTxFHFkJEE2JMOUMpJyVSztSiuhyH/X+USbMjKQBSI83I08ddKISafFw3z4gGeiZKvvQzvo0Ug4FuI3x1Uvf6/9iwecpdLoy+Aj9p5RCXIGVqbFM9C0ZkKrBUKK+R1BJMOrhvCNIk1DrVrR/wMck10uiebIEnR6PJmRQ76B36K+RLFdvJBD25JSDnYEEjZXq1nct0AvRXJ0d0Dcj1cDpFS2kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS7PR12MB5912.namprd12.prod.outlook.com (2603:10b6:8:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 19:03:09 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:03:09 +0000
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
Subject: [PATCH v4 13/25] iommu/omap: Implement an IDENTITY domain
Date: Fri, 16 Jun 2023 16:02:42 -0300
Message-Id: <13-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0044.namprd20.prod.outlook.com
 (2603:10b6:208:235::13) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS7PR12MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: e15153d6-da58-4770-3404-08db6e9c4c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	uu4S2mUnHhscO0uGBY+MQu1YJu5VIIZZa3GiO7Zviq+PBMazSfLDVWbCD68f/DINXMPuDMuXZY/Ge5o0rlYKu8a3ZuiEK2HKkrbvdYr8qh2gQ0VHWf3EnFW6MgTlwIP5fxbGbL8AzQq0DIQoQ/zzUzwMBBAVni7zCR9/BEp2xzkAxB3Nss/AP2VY30Tg9yqWCGGRVNkcDWhO06eN7tHAA45zRhV4vv8pn3EjCgRjfyAhX+NPi+6zA78I6nPDoSzfHsqw8CFbMqDVmu+Bze1lrI4LZjcxabNG4jEJCe0BdHBsjDj3XrPUjx1N9YbYcsO6yS9fJUkpWoDVhw8tS5XFJelNpK2XnoK9i+VFaSXGvnr7XnIhhzWvJAzbyTMO7bDOHFEziS9NEFJrPTVurvErcz6LGufMzHU7mcvkbsqqBgJPe8x6AGwv2NhA8tTNy5p4ARJRrRK+/i+2ALJaIPpp5JgSveKbFpvuhcWytstoQgRe3blEr2riLCWh0N4PWW1kpfxnSyWTFa3asagsRH3XVImXHTEONeg4J8SeynZOlnEmyjU3Ilc+/2GpTg8D3nAcXM8tK3lLQTBpv9czwjtQkOOuLWdEsf5pCgtoOrb3xDw=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(36756003)(86362001)(110136005)(66556008)(66476007)(54906003)(4326008)(316002)(66946007)(107886003)(478600001)(6666004)(6486002)(7416002)(41300700001)(5660300002)(8936002)(8676002)(7406005)(2906002)(38100700002)(921005)(2616005)(83380400001)(6512007)(6506007)(186003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?v02JbY16jTCFtltKjqx6yHgbTZKQGxkUbaFt3DZXk6V+5qgIsDje6CD+tmUV?=
 =?us-ascii?Q?4q6YD8C64SGeUEystgChlqJ8v5gTnGc3aNY10Ciroer49arShxPiXpeofrXL?=
 =?us-ascii?Q?LlbFQu69BWSEgcMtiS+Z/FWn/VLBoDHMO7ovMIZAlbr9S8CY8oD+4Z9fCQLP?=
 =?us-ascii?Q?l8aimVYM5OZ2QJRguqKSPz33nnGT1sSldooFJP78+jALi0any3DhaSqyzQ5c?=
 =?us-ascii?Q?71WDfodFdPN77Wpayl4LNsgRI3dWVi0OLQpxIcN6fB5yHkKbeANwNKX429Tb?=
 =?us-ascii?Q?3adSdQQ5DEQhy2rwDwSQD5cJqs4pcUVkRptKETsF/w81PVItW1q5fpmV0//u?=
 =?us-ascii?Q?PEf5psgz/drcde24QctD7/JVM3G3ye7TVCBSFIs0Uwg55qjHBnCz+vp9Aqnl?=
 =?us-ascii?Q?yOq5FdkNU0jTY3RH8IJaMmGMe4L45fYxTpE69h9u6ifTi0qYjDH0HzY8RbU8?=
 =?us-ascii?Q?w9J4Zw+QQfk2ytKP5r2b3HWQl0BeQSkeULsemNw2scaPpE8pqI5dc7rqBosM?=
 =?us-ascii?Q?MfMy1DHdiSQxUTOjVCt73qTirQD2yQb9Ea4njSPq+l2uStMsOug49PY64S/W?=
 =?us-ascii?Q?vBGOMMfY9ZixhYwla9h0HbdzJ/Hpdi01hp/gtB8EZX0/A9fJcuCKg2Ld8eCJ?=
 =?us-ascii?Q?qjABP78Q/OapnAl9JURLiMuP4uTdJCzN8QJzMwOUO4c23F+xcKj469jjoPEA?=
 =?us-ascii?Q?LKQ27ZTNrQRQWzcdYtSJUn3pQe01VeP3Kqq7S5QMijt4oCgivsYix/lR0Dtb?=
 =?us-ascii?Q?a/kFwH7o1OT1W2bMTUVd10nU1avORE3XXg8r6XYmO/sKss++pNrQlrQTekal?=
 =?us-ascii?Q?uXT+AACkCwIUugbN5hNCygGlGnXhhgPHCEBN5GstTZongcwrNfJAuTzQ0ZGa?=
 =?us-ascii?Q?TmzVD3SXxEVszQJKv/fl+sNvR1SS3TsTyL+JR2wnl5ln4P8PcLOTOpDjdRKQ?=
 =?us-ascii?Q?ZA6ERTBJmSBqc5edt0WGAiR67AjN8PU1xGLq5C6UKbYDPETzv/AlWJnRHHif?=
 =?us-ascii?Q?uIHkNdIAqP/1whBk70VD1r75B2rxS77BVIxScnw1QCnS8TaOP77bmQlx5r8J?=
 =?us-ascii?Q?Tnbxs2ph3z9nDhBOdxYq4pj+7cUDofCP0Xg9xemPKN1K0qAo54/1CcRoHwIG?=
 =?us-ascii?Q?2YwvwJpAbIy4zcuHVBhj3OKLRQ6F/wdQkk8f4BPAOExhoADAO/oYDnHlCuAB?=
 =?us-ascii?Q?3nyr01iVrkD38MhVL0Z0yD3hlPgAMxZhR51yiVWlp/VvAoWi6PlWOPpCZZu9?=
 =?us-ascii?Q?Zh1usKyRf72qsx8pRouybQ216Wv7ETVvcIlZ4l9pV2F5cDB82+S1rZ/NIowZ?=
 =?us-ascii?Q?zA5+RCkNkE5t3iF2+VHHgSRiJXQYwY74Jv0GhQ399yHOrB7lAhKHAwM/qqCg?=
 =?us-ascii?Q?3OVHI7DM2ynl6reBUujArwfHrsnY/o2vmQ6e/d0rSSRqxGYs2Hy0MaJKW9J+?=
 =?us-ascii?Q?DYqNgPfYBTaPqf0HjcyI7Wi8qhDNJ0UNNFKJr+T+E5sAUGMapWYl4obuX2Bv?=
 =?us-ascii?Q?lxnc2JqGN046OWnK3mX++ILhvXYE6xMSlTcfEI3eru/WWyqtIjE6WkN+G00C?=
 =?us-ascii?Q?nYZixDRhAgcKXhLQRYiKZA5n6EhvXlJWmVU3xFrn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e15153d6-da58-4770-3404-08db6e9c4c38
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:57.7178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VSipxwvi8jAscsPkljHGjmlz6rYZAdnvitxnyl8+NhFFXY22uHdPo8rjPrWBq7/5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5912
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

What omap does during omap_iommu_set_platform_dma() is actually putting
the iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
compiled on ARM64 either. Most likely it is fine to support dma-iommu.c

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/omap-iommu.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 537e402f9bba97..34340ef15241bc 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1555,16 +1555,31 @@ static void _omap_iommu_detach_dev(struct omap_iommu_domain *omap_domain,
 	omap_domain->dev = NULL;
 }
 
-static void omap_iommu_set_platform_dma(struct device *dev)
+static int omap_iommu_identity_attach(struct iommu_domain *identity_domain,
+				      struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct omap_iommu_domain *omap_domain = to_omap_domain(domain);
+	struct omap_iommu_domain *omap_domain;
 
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	omap_domain = to_omap_domain(domain);
 	spin_lock(&omap_domain->lock);
 	_omap_iommu_detach_dev(omap_domain, dev);
 	spin_unlock(&omap_domain->lock);
+	return 0;
 }
 
+static struct iommu_domain_ops omap_iommu_identity_ops = {
+	.attach_dev = omap_iommu_identity_attach,
+};
+
+static struct iommu_domain omap_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &omap_iommu_identity_ops,
+};
+
 static struct iommu_domain *omap_iommu_domain_alloc(unsigned type)
 {
 	struct omap_iommu_domain *omap_domain;
@@ -1732,11 +1747,11 @@ static struct iommu_group *omap_iommu_device_group(struct device *dev)
 }
 
 static const struct iommu_ops omap_iommu_ops = {
+	.identity_domain = &omap_iommu_identity_domain,
 	.domain_alloc	= omap_iommu_domain_alloc,
 	.probe_device	= omap_iommu_probe_device,
 	.release_device	= omap_iommu_release_device,
 	.device_group	= omap_iommu_device_group,
-	.set_platform_dma_ops = omap_iommu_set_platform_dma,
 	.pgsize_bitmap	= OMAP_IOMMU_PGSIZES,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= omap_iommu_attach_dev,
-- 
2.40.1

