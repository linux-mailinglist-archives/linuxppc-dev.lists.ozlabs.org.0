Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C86C76DCB3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:32:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IoQp/t9r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGVCx3nySz3f8f
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:32:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IoQp/t9r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7ea9::617; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:7ea9::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGVBV3wtwz3dyk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:30:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SMjwKJO1N+NG64s0vhyMRMv5eJXi1gkOdBMpuljounyTn/F/B6KRElotXch6PshmpCweAWO7VaDXPmDWJJv8t3Yqm1pg5uWNUAMRxSI6tb6uTSKikzIC/ilWvlfGQ4nM0QcjL2XRctkqtan/m+RrkTJcYH7MRE18+Ji8WJzwelW1GFPSXPjCgizKRmq6F9XVJuVK7P3V1ARVVkXzezEoA1G/2OwixMnFxmPrE6VhxXiQGnl2bieblbz92nF3rzPYtn+8LYZVORVFaJ283ZpGwgxEljX0nKVmkowV01Z4sPAk0ma3gXC0VAsOUFHx60kq4G1b6Q67aD6NFYAVKtebOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eopBiMSqCw6AUiHv1xpZ0ZPeA3x+XCX2w/wkIKizTT4=;
 b=Sg+X0o4YdX8nogg8LiD69y8+iy0j/S+/rCQGtCPz+RcP71EQFjzcFhhQ06V5XHTFo1BHUpekL8ROtoO74pFPuROQHKipzHMlhzm5tGmIeIcoX3J32Hx5ORHSWHmraVQm7gPLkkMfpBLOXGkYuFnu/iHxOo/95BbuUdMvENTNGbXjcW5WGog4XDOI4rwg4qPO846BC/hK2g8xrOuODcKCzhLxIeeWMADF0HVSGHdmL1G2QoIKSQSrxL2DZge97hmXjZc0ssvB18Y6QOzbJaeVf3YPyMpVtQzhp9bxCj+Vxm9sTpPQk2PvcvDRegRE2o7lmOy3omtqjcPldTbwwdvQdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eopBiMSqCw6AUiHv1xpZ0ZPeA3x+XCX2w/wkIKizTT4=;
 b=IoQp/t9rqWhuxbC713CpKUltV4Oh6GPEOHx2geeauj/FNdWL1B7rfwIaqO3s4KdnjtkLrww+il9a0ReAkGLkTdxrPuItuHQqUUvxbLAgfYEzzTjJuQP5If/AiTDEanCsA64gZDvdTua/w5VEkwg47+uf6wis8v8o7Hdmp09X3vHeCodbYwm8W5WBXEqIcSc1F7WC7e46xVYJUGv7xw0Ia82CFcLiFycgdeZ/pJLhwAe8KsPrOQg05bsK02zfntV6lVO2K1zTEXDdhYQaj1WoLq1URRMvX2LxaHb+yxfsV2p1thV3zh3RLdUYhogkI1LEmgpzWqjYIA+6d5FJ0WVbQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW4PR12MB7261.namprd12.prod.outlook.com (2603:10b6:303:229::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:30:37 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:30:30 +0000
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
Subject: [PATCH v6 09/25] iommu: Allow an IDENTITY domain as the default_domain in ARM32
Date: Wed,  2 Aug 2023 21:07:56 -0300
Message-ID: <9-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:208:fc::17) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW4PR12MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf5e2f4-2137-4fec-aa47-08db93b8d771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fROXrqN33zRP/vMgkcvNz5cbpJlmXTjHVqfl9xth4fmER/YP+AncoEjvgW6homfdYf0nafZE3cm/iibRNZwhSfqj7kSgDwxP2MbFjgTsogo4mnqEwONTYh3PvX40jBafxjMQH+x6ialZmehn37aod8OViV+XtNCnSXcReZnHlJ6KwMwYe9PJRUbuIMusl4uAwAG1wKwx586Wt4jGZEnNRtBFmsCjE7UyFEiDe/PXVeS7Y3/qq73Rz2kNszzNOMs1x4O3IY8SColZZZKSQQtAFMH1dHNncULJK7pRXKPxlmUpSmiq97H/1GttqWRubVU6Io0Scd4KVybDCEk3fzRpHUfXnrPkRwb1Jkz8JVq2BdIba+FRQPiAPU9zLnY/iR1pth+/ipjynNG6O3G3GH+EBm5AYebPQ4iWLt3htRwqtMKhkYLJ5UxtFRlvxFZeIEqe7jlg20Q8p8/Rbb3fyw7kw3mpOLzPqKihYH+IHhqbEERSWZ44AbS6uwy9WK9VWzGPODrEZ8Re/bmeSg1gS4RxCQ0Hiok+9ZgYBKJkpE9Izss0/8PIXWL0FNaE2NMkIhRBaj1F+0UAUP7psA4KQAukx4hAaYERs5Km4cYaAvRonotMm5akc6J1i+stncj6P/X8
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199021)(5660300002)(2616005)(36756003)(38100700002)(921005)(2906002)(316002)(26005)(83380400001)(186003)(7406005)(6506007)(8676002)(8936002)(6666004)(7416002)(54906003)(6512007)(66476007)(6486002)(478600001)(41300700001)(86362001)(66556008)(110136005)(4326008)(66946007)(107886003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?DB0yaH9DCQ7Tauf4Yjch25EDhn43bC/WUv5p2TDOUGveIqFNHEK/lGtSQULd?=
 =?us-ascii?Q?bRu+jpsTQ0+jQ2ysEcK4H1EVoqZaISpR8ei00LXXcEJyOGBWgsuP/dEymkCV?=
 =?us-ascii?Q?9CXWZ0pXDzEbAoHz2XCfKjmL3OuvevxfrXR06QadiwMxp4DPpf+B+i14F6av?=
 =?us-ascii?Q?SPAWifV+Vwqzianxw2p5QU+T9Qlu6eExci8cqmg055ryzpmR5xwQXWlLikTQ?=
 =?us-ascii?Q?lI/oUcitLscdaQHyuQRfSD28p9RyNXueKJd4dnppcq3jS6zIzHr6PiRpl5SU?=
 =?us-ascii?Q?id1BD0GB4vUs/j4mJEerEJVjoWwTvzg15VDCzqJR6oFr10ajMIyUuQiPeeAS?=
 =?us-ascii?Q?YIIIr23xAYbjbpf2HkaRQ9QkZk53B281CBtOSe+aZXaCOM8k03OrOA34TyCt?=
 =?us-ascii?Q?Qs+pKgXd/8G0KC4nXYaW5WQRcrWF+eBILFBpSyUgPRMTvHRiBJ1RlqnbacPQ?=
 =?us-ascii?Q?OuM6KFw4Umjp06ajUwHahnIj4DRIGpEa8hjWyoPGoNczEMLxG5QqlTj5F1v1?=
 =?us-ascii?Q?MOGze+9lV0nAWyGSrWc3JqGlSVA2rCmODby7UPw3zMfqiqjh54bU72yzRgWO?=
 =?us-ascii?Q?0WljkTqf+Th0UOKgPolDQVpOdr0dAlVWMI/NghdCVypDtjDXxWgMWbS0ZZGv?=
 =?us-ascii?Q?aVb2rLNbmy7YBIIgtcN90nMNilSUIjOqvehmhyGUFBMgcMMmrg7KyCXXogIA?=
 =?us-ascii?Q?Y6Wvc0QriJ3gmb1ilg41Z/82ygNP6KidZPD2kkg0L5TaVRl4B6qO4809Rf0C?=
 =?us-ascii?Q?bbT542yuBe+EvFOwh0yp3IRmFjNczDiwlbf6lkS7ykMUmm8tVpk4a0tHPunp?=
 =?us-ascii?Q?QwFoKyjVSi35pj6YGiAMO8BmLvexRWxAH+A54Qi3sObrFZYbjNOduiexLYak?=
 =?us-ascii?Q?dKWP/3ZgF+7zbhJvtpfDPZnuabUz7EthU0XS5dxRALplkbxFMxD0qA48pS7C?=
 =?us-ascii?Q?aZFkMJ1+GJd7BqXMgW9UksniIc5ZuN8PxU3GTu9b0i/1Ju3F/kkaKoPYno4o?=
 =?us-ascii?Q?fB60TnhyPWl8V75eSumaxz7+OVVmMBWIrzh81+nod8foKHUyYTDvgi13FtKo?=
 =?us-ascii?Q?3FXhizLM8C1CIkYf5qTGITMJsHx9xmRwC1xW2QpPx5Vp6rExjp0yHjMJyjWr?=
 =?us-ascii?Q?ZX7yXhpGnAUkPFbVwaWbx3BUnlyA9qKIK/0qMtNT3yUVQ9n+73qK0De1IJKE?=
 =?us-ascii?Q?QgATWoUM5KJDMYL0iCMYXvIgUS+zfevzUPOy4icAz55MpaXF+pJ4Z2h/9RLx?=
 =?us-ascii?Q?airmip6jDIIELqqIDizctEVgueG23ve+MQCAxBQBRHwtTXD80FMKUK3+tfoE?=
 =?us-ascii?Q?9/tiLOjnSNESZI4Pn1NPh9+zK72RC1U7+Q+fJEHBzKgg9ANnFwPFYL/NbsI4?=
 =?us-ascii?Q?IGKWu8TwTSrMVMhEoV6IJoihgPdw47FzYfmCF4BzKul55+kyK1eVtHWU6HWa?=
 =?us-ascii?Q?gBUrUQ8xLht4JX8OascPGWGhkhczAeX8UV8eAvEiU0/U7RFfchGzyej2n2LX?=
 =?us-ascii?Q?o6cg1RBgWKTDYkWTCazIBkEXBHFZheAXaWxBNKi4HoFcaTIe7cL9Rw4QzHxk?=
 =?us-ascii?Q?X1a9hQnyUB1Ib9bk5T2ZNWPFnsh8BA8lIAvY2WHe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf5e2f4-2137-4fec-aa47-08db93b8d771
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:30:30.2619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxEI+VNpAH2zGJgsEaPIsC6jM0rbMRmm5oZDZC6Q6Da/P24nIBcVdWsAZzpNqj+i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7261
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

