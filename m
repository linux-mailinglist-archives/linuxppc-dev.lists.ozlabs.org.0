Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBB9785DD9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 18:48:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=btxXwF9V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWBxZ2J6bz3cJ0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 02:48:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=btxXwF9V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eb2::621; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20621.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwg3KH4z3bZM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1/4SPi53tvCjkLsJZ9Wy/g/8a4UlzX/OPha1EuEQ5S/amQLuI6IC1oOtetOvBpJo+8H14PZZlHfOnFCb0JDp7DS+peusz66U6u8+z1i2K4TvdqNpTwzsMPYLR3XBZkVbD14YvVJVe6aHOYqvLUw7/Ih8jdu8j7aqd4bceSE1s/Tqto0uHlra9VaWbCJiYU8PUsR4mqSHidQ9ObL7vZiA9Ff7bQzX1gVg4DvWM9es6ayi2PyhbVP2s/qvprp0NbqtezbQvJzVOnT1awIkwd872N0nKIEJzC8RD7hfltPTFmJGtHi+0qR74XYB42jesnc5Bc6YCTfc7CosjfWuLYahw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8i1/nr4BZ72rdgQlfM4bhM6VAGgmmnzEdUflAW1+U/M=;
 b=fcX2cMqENQrGc5KB9mszGUhDGsHuwrld785wg8UWm9hVe6aSdxBhk89R3jBU/nPv0GRqX58qkLxz7BSXH8P0LPc4zvuzDLxlFsReh6D0KEdPVVTPR5TnpkkcOYKdniImgHXZCR1nkGd+YQqyHggbRN/VU/twmIG7yCm6hL0Ol+Ior3JiYv/BwwWRU32uWIBT1qReOyR0D2cddZK/7UqgTROi09pJl9bwA32UkZRSVgPPNWgqI+H9l058X7etigGKl5yueeldtbmc5ufmSE9gACpvyvUDhhQ3wwxEeI5bfRSseGesYdQQg2EcAQbA5V4+Bh1ZvOa7cmURAkUFJM0z1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8i1/nr4BZ72rdgQlfM4bhM6VAGgmmnzEdUflAW1+U/M=;
 b=btxXwF9VXiGFDSwbNiytD/00vKC6DR/xcKjGRj/YMUdICc8TEIWzMu6fqkt4PR2lZDd2N4kWl0jErQ+3dH0A8h+3ZCl1ROtfm1HDk7OhbnAB1jE8svaXOaGUib+x7FwtR5ql9YqmjU7PwM38OCqpJqztMKOLQLZDaDoPkHj7a4CFseEM0r+pCFS1tqOOJ43vYH1n8KTKyCWJYHhokAr64m5NXJxpwc8jP6JGl1FOwJMC2i1BVK4XDRhqZRiQpgCk/JzVvv8CO30Jaf1MIhfFUuXk83MBSekH2EcBqqQ8ktR93wB68i4U4N6O5mWZqD4wm0lI9l9JIwRAk5X1dKGGhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6459.namprd12.prod.outlook.com (2603:10b6:208:3a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 16:47:41 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:40 +0000
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
Subject: [PATCH v7 03/24] powerpc/iommu: Setup a default domain and remove set_platform_dma_ops
Date: Wed, 23 Aug 2023 13:47:17 -0300
Message-ID: <3-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0419.namprd03.prod.outlook.com
 (2603:10b6:610:11b::8) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: ee25eebd-9ec4-4942-c7f9-08dba3f8aa00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	9QmUv7AQmHuiZTLWskn45qphkWnw3jm+53GJDKoYa0pkR70mYs/GJtf1R5s/EA/i2zWSxKv9CF1R+HEm6pn2+8qbO6sFGiCco/7/1F3nb2IDpGyvTzsUE2ctEcWWceO3AAzh10cZN8z2zrW0oVY5kG39IB4MxKVHa9C/qjZXSnTSGOwUnq/QEmceFVIb6BtUj8rzqkASoqghZGuQyPpqsA2pn+CqFClGMFWHD3sPB1zeBMUCMZ8eCHEx/UHMnu5/OPVZQvRXFeHgwsfEY5zeKx4WWtmX9Xwm2xHp9gJJ0nIzFzmPM71WHY59geEzfMt+b0nkcCTeC3Se/DiB1bXH6TBDqC/RxLt+V15MmKqun528WtmFN9u6hbRQwRBE+cl5ZJ7/b9BsHwFPU5m86kmxu28t/UI/P+y0JBdOR9j5bh0NkM87OYFPIofXC3r5CbwwrQHU0anm11UVWXXtefehGqgMtcIIj87ugireynBXRxsStBTY/5saxFLr2Hk8AnXrT4adXLpJqcVaEvptwPSWwijwEvtJvlMDtsHK8sxdDvJnwh5iM0Zn9p9lpYRkspYwmnCwG2ls7VUtk2oj8oJXQ+ajLdFrBHJ8PbByRHkHIss95/IPPQn3Kh3wPaNRCbC0
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199024)(186009)(1800799009)(36756003)(478600001)(86362001)(6486002)(6506007)(66476007)(66556008)(316002)(54906003)(110136005)(66946007)(6666004)(41300700001)(6512007)(38100700002)(8676002)(4326008)(8936002)(5660300002)(107886003)(921005)(26005)(2616005)(7406005)(7416002)(83380400001)(2906002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?IoZIr+l0Z7n4irMu7mwMpt1tJjzsEA+n2/U1smioZW2CGhDREejM2gpeBMbb?=
 =?us-ascii?Q?yDSvMQi+vuCeuEtXKf3I7oG2nXp+x6ICcP7Pp0UWABEMiNW66q7YCS0rLFP3?=
 =?us-ascii?Q?LQaFKzZlcWOilIGo+/fcQFGTfDxEAvPU6dCY54Ny45Y5yjTwELN01BPm/qnP?=
 =?us-ascii?Q?7tWR/2ItTA6XQz8YdIouUDsYWsMdYhwbRKq4VKzcdS6MazqlOvXZaGDzrSaw?=
 =?us-ascii?Q?hOZBAey5ah+Xkbk5+9NXXy0mFb5CV4YzJ7Zg004/HqU92fO0w2fcfD8WHDm5?=
 =?us-ascii?Q?1SCygrogkgNnQ3O9PhGSh02cII3equQhdzJvYZ3S4RcBI9pO8TEdZ7WghrsO?=
 =?us-ascii?Q?OGEGCnxopUCzc/ZviCMeRVVYQ7DQgpBwXWTaMd7XAeKe1Jb6XihzKTjMJ5d5?=
 =?us-ascii?Q?c1sfOYCfiW6/20qoPewGnt/I1IWAuNNDi4EsgIDcDCTyBQakjR7M1KHxUSfi?=
 =?us-ascii?Q?kDivkRZuImFd5cmTbFl8l/l5wxcnT3rXBREaaPLVXjMdhojwiYYulN4tm8FJ?=
 =?us-ascii?Q?zp8vHGKSuNLRwri8hCvrOM3jw+bDUo0Rq8b2NrNFyg/AbSDBxZkqXtnuJkWz?=
 =?us-ascii?Q?P4LlKlcvEqY29Quv+UrKL+1IdI9k/9j+2sTjy0KRA7JlipJVEoLoUim0j5Z/?=
 =?us-ascii?Q?MPsWq87dbIQOxQ8Bn+A3kPYPGJ1lyhVH8p6Aqziwll5/s/g+W+6LibRkO3w3?=
 =?us-ascii?Q?F09C/9ElkIvAQ9v4D3DfZ/UvqUbzivODTAX+q5jNccvN9oLXJfKFief9Tps6?=
 =?us-ascii?Q?hc9h0bosfmMlzSSuXvN85arh5h70yNHxVqQUxidcTPeq/YKeVUnShVzPQ0Gz?=
 =?us-ascii?Q?QiL5rlh0B4RC9uNfTXdq2cS1sFMeeGv6yMsRQy+JDKwdOREMJIXqqofn+NYk?=
 =?us-ascii?Q?cwYlSgiW12SpAyeTznDwVOcCcl8Ls1tW5mq7twLpMnY5bzpV70ImPrqlmf3v?=
 =?us-ascii?Q?sA+fSoknj3UuuMKiYo8squ90VhDjc5puAgNmNjSILklF2b9Ltz0myf/sIC3R?=
 =?us-ascii?Q?DVuBM9VTwpb2gn24g5VJVcLXkUPQd3o0P6Or+htFtmKnlibg+FUo9RjMFON2?=
 =?us-ascii?Q?xmSMjEKuwfBdZ9iPcWXhqaPJgDHvM1Bwe3d0urTy/GXhQyI37UND7Q+23HvB?=
 =?us-ascii?Q?+rb0AdDG5BMpUt7rsO8jr2Tpxx4xDvin97Rr2H7TxHnFQreoyZ9TFSm35NjS?=
 =?us-ascii?Q?5/23exnvj57BVfKAJMZJ8K0YlTm1ERHuSv4tLmV8l6EzaEDHsf6Keg3HD0Hz?=
 =?us-ascii?Q?v3tnJlqHZmN+nP2ALZMKZsOa3gtb2Xm+eukL49Drwq16aVjuVDQJsvLbYoQE?=
 =?us-ascii?Q?0REpwXFwffnArohDVoV9krJDkswc5Sq+p4A8lMqe8e5lMl+JqFUet5G3hlKU?=
 =?us-ascii?Q?cPHxcVpfkNUA9yT1BvqdPJXm32/EUGLMp6+K22tZUbkx3Jax/SZl5ASr1qXL?=
 =?us-ascii?Q?V1cEcvBdnj0AUBsldm1vfrsnV3GyPlWgVKFUjc+wyDlnMsGq/Oz/EVL2DHHP?=
 =?us-ascii?Q?Yw+bbv+/xhUIMrDdeEzVnkcLiTbi/uFgYpGMV3HP53ZtcMEN4ghNeSCTlBFg?=
 =?us-ascii?Q?xFmcg2fNMPRIO+Gh7lIkaJI2IhdZuufN0xp/Aoaj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee25eebd-9ec4-4942-c7f9-08dba3f8aa00
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:40.6191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pc2yeaneATsbLKmvqQBD9H+xPw76qVDsulx86fSTKIE+UgIqZ4cmgvM7UCw879Ro
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6459
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

POWER is using the set_platform_dma_ops() callback to hook up its private
dma_ops, but this is buired under some indirection and is weirdly
happening for a BLOCKED domain as well.

For better documentation create a PLATFORM domain to manage the dma_ops,
since that is what it is for, and make the BLOCKED domain an alias for
it. BLOCKED is required for VFIO.

Also removes the leaky allocation of the BLOCKED domain by using a global
static.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/powerpc/kernel/iommu.c | 38 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index c52449ae6936ad..ffe8d1411a9d56 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1269,7 +1269,7 @@ struct iommu_table_group_ops spapr_tce_table_group_ops = {
 /*
  * A simple iommu_ops to allow less cruft in generic VFIO code.
  */
-static int spapr_tce_blocking_iommu_attach_dev(struct iommu_domain *dom,
+static int spapr_tce_platform_iommu_attach_dev(struct iommu_domain *dom,
 					       struct device *dev)
 {
 	struct iommu_group *grp = iommu_group_get(dev);
@@ -1286,17 +1286,22 @@ static int spapr_tce_blocking_iommu_attach_dev(struct iommu_domain *dom,
 	return ret;
 }
 
-static void spapr_tce_blocking_iommu_set_platform_dma(struct device *dev)
-{
-	struct iommu_group *grp = iommu_group_get(dev);
-	struct iommu_table_group *table_group;
+static const struct iommu_domain_ops spapr_tce_platform_domain_ops = {
+	.attach_dev = spapr_tce_platform_iommu_attach_dev,
+};
 
-	table_group = iommu_group_get_iommudata(grp);
-	table_group->ops->release_ownership(table_group);
-}
+static struct iommu_domain spapr_tce_platform_domain = {
+	.type = IOMMU_DOMAIN_PLATFORM,
+	.ops = &spapr_tce_platform_domain_ops,
+};
 
-static const struct iommu_domain_ops spapr_tce_blocking_domain_ops = {
-	.attach_dev = spapr_tce_blocking_iommu_attach_dev,
+static struct iommu_domain spapr_tce_blocked_domain = {
+	.type = IOMMU_DOMAIN_BLOCKED,
+	/*
+	 * FIXME: SPAPR mixes blocked and platform behaviors, the blocked domain
+	 * also sets the dma_api ops
+	 */
+	.ops = &spapr_tce_platform_domain_ops,
 };
 
 static bool spapr_tce_iommu_capable(struct device *dev, enum iommu_cap cap)
@@ -1313,18 +1318,9 @@ static bool spapr_tce_iommu_capable(struct device *dev, enum iommu_cap cap)
 
 static struct iommu_domain *spapr_tce_iommu_domain_alloc(unsigned int type)
 {
-	struct iommu_domain *dom;
-
 	if (type != IOMMU_DOMAIN_BLOCKED)
 		return NULL;
-
-	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
-	if (!dom)
-		return NULL;
-
-	dom->ops = &spapr_tce_blocking_domain_ops;
-
-	return dom;
+	return &spapr_tce_blocked_domain;
 }
 
 static struct iommu_device *spapr_tce_iommu_probe_device(struct device *dev)
@@ -1360,12 +1356,12 @@ static struct iommu_group *spapr_tce_iommu_device_group(struct device *dev)
 }
 
 static const struct iommu_ops spapr_tce_iommu_ops = {
+	.default_domain = &spapr_tce_platform_domain,
 	.capable = spapr_tce_iommu_capable,
 	.domain_alloc = spapr_tce_iommu_domain_alloc,
 	.probe_device = spapr_tce_iommu_probe_device,
 	.release_device = spapr_tce_iommu_release_device,
 	.device_group = spapr_tce_iommu_device_group,
-	.set_platform_dma_ops = spapr_tce_blocking_iommu_set_platform_dma,
 };
 
 static struct attribute *spapr_tce_iommu_attrs[] = {
-- 
2.41.0

