Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF33275FD94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:26:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BP/9wtyh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nBH4Ly3z3cWm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:25:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BP/9wtyh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::611; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6Y2x2xz2yDT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMfLio63p2sKAv+I9uSl1vXxtWQE3gHLZZCfEbFqBQDHF/4eajSAruL0zh7htNbXhvv/RhLDrFvVzGUh3NMdpGEYK22JvzyKM+lCS7nibYZ6u9hNWnDdB30HeJIVIotDFf3W/nOfsoap65hmSCkCOvRZ20v7GjiBaRVbPjBFXCRM9940kSFezpzlbJ+C8L93XFeMhOeWQAMh+PsjM4ooRwFUJZ/kdrla7VBEYv3KOnmIICak+I127icdl9VP6nG/0CKNmnQXu/n3av7ESQY+6e4Bsu3gOC/LlDBAVWSA4ETx7FklXCg+H4CllolY5qGlCehEEaQqgW19WIV7Xe04hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHoJ4Ec2FR3QfbKcYvNHteX1iibvdhuwk1JTeFwq02M=;
 b=duMEipS1iICt0A9IuQhEZ+nABAk7+tJRt+e5HAaUl3ccO9IqPeVjESIpy7uIeQxOU6dPHewxoIFTlP7zLHUMdll2pnU50AqYkO2xtfJrsUQqzwavcqtULrQnR3nP0OQB6tvBH4EvDcXMcdygUB7DP5A0WEeV6T4OCtHD8EsCKeAG5RlhW/qV8o69tdM7qmbLKyyN8kMLGHGPiiKpwgh2zLudh2LrtEeu6+h3UUSKUrr+ym5RxC9yC+Lw0DPG/LS55yqKAOliVr2d8eQ5e3W3tVOZoOO7BgEagIU7vrI/lhg7/F9qHKnLqfBoX8vYVRZl8imFgZDfCJHN1MO9a5rLHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHoJ4Ec2FR3QfbKcYvNHteX1iibvdhuwk1JTeFwq02M=;
 b=BP/9wtyhOIi5a095vZdP39t7HJeleHuexjmN6lyOUDtin0+OI8Qlzti7cji/IPwewPhx9WGRfi4c9FkowDdHhL/gWDKiAI4FkSLw5Lj7sB5kQdIVk0xSmv6nJY1Bkviu92e4/MTT7ISONoWnqX3Yhd22wmTgr/2mxVu3urfF+ofa/IB4mrBlacEJfYL2sAj11g+xqcQ++XvzgjTg+pCSi39LSYjC3jIBOSuSPkOnIcONAYDi6+XPIsLquXnl792ANKehYdRQPmgQZHJI4OTYdVy3tPAZCBl0m5iSN5ymhSGm/9bXRcHn4EP37aus9HU9vGnGdD9/d64TTK5fGfGYTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB7353.namprd12.prod.outlook.com (2603:10b6:510:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:18 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:18 +0000
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
Subject: [PATCH v5 22/25] iommu: Add __iommu_group_domain_alloc()
Date: Mon, 24 Jul 2023 14:22:12 -0300
Message-ID: <22-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:208:2d::33) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bbdbdbd-e196-4e7b-f54d-08db8c6a875f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Alr9rlmTgdOvg79y1fdOm4H3dVInS0ixdKX+sBIS7FNoQ+sMgWL0+RHh9qH+LFPDJcYFJdlwH7ZrQ+k2pFQIh6PAEplwGVMZobnUCSvgwBPqLALoaGFHCzllA5aOT5rAQoPe+c5yOXbOHsRKTFo323UXjuioOQCXHeC5VvH9mVgXoYer7hBF5iG4euxHBBRL4/fLr+VeZ2Q2fn8HHDyV7pyUQNMbsOeToIsusvB6Sl+xr/D16vIAgi+JCmrOwsDpFgDe7qJjoJ/R2V3wb6cxwXN4oSOHi/3QOSZN8BDTDbOxffkqNqrjGaXhtdT9SCdQliI9akaJ3V1TK9t7/lSfQPjMKALFmosrSg9qVLrzOeHRceT0H16h14CSAAebI/6xV+GZKum3svAhNvAC0d769um07H21AHRsfb8HAf2vR3+zhGQdXRZ4/OZaSAgkp4f+XJzCSNN3j8gRPwxPDxFG/4HByuTDjFAcNupcNejkQlBqbjXjReoYlZol6MtfCBoLQqPmKS1xPhZ2GFfaHIG0IcwivzBCxMkCyDOXKeUoR6AD1T6JyVxD48/hkHOrf1LrehyBD244krnhG5SY2NbSBo81rxrTZ4/Yh8lXiKfgVqc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(36756003)(478600001)(6512007)(6486002)(110136005)(6666004)(54906003)(6506007)(186003)(26005)(107886003)(2906002)(316002)(4326008)(66946007)(66556008)(66476007)(7416002)(7406005)(8676002)(5660300002)(8936002)(921005)(38100700002)(41300700001)(86362001)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?cXP+guthJXPPYJTq13T2rPY+fDMWdwYmZrlRUJk8Ctw5t+bMaJpZ1QdFERHS?=
 =?us-ascii?Q?O4hDIKcOcIom16ae2b1gbAuM5Q7Bo48IQ8Vgyx1FDn+4UDGfSSMEU6TZ2b5K?=
 =?us-ascii?Q?lE42cb2T2xmjILZXpxTGzpgkkzbqrqLGkABRy1y6re9DnWvbMV2mhKu/qaV5?=
 =?us-ascii?Q?D2vRj/4OhAH2lWQWHULSvUq8XXAx2ndQLSGzAqFTSW5vEiPDCVtTvybSvKkF?=
 =?us-ascii?Q?9EqKjbOdKdT/kLMppdcVn/Jlt2t4SOOablvJ/m+qGPxwyaPUWDPlbqQtJ69c?=
 =?us-ascii?Q?jqfEFFuDxo4rvcNnl3mkPzZIlkIYXSM4o35c+OjChDGgxhKE3dLo5K+PhbCK?=
 =?us-ascii?Q?He2ELdKIKbvuBsGExPgZeErfEYWpked2RsUy3BFcLjn8jYoRTAV7OxG48i4E?=
 =?us-ascii?Q?7H+H0inH4jDcRVl/ebc0zHkYVnR2kLICwDh2Fm8X3fVEwP2uQ9n2V1ajSAAj?=
 =?us-ascii?Q?1NVrcKsCN2DWuMGuk5DZJef5hoXVGtRGrECnwX8XkbmDdUtEeCEdeKP9Bhqh?=
 =?us-ascii?Q?NTbxDd5RhUOC4ceuU1Tm0Cx9rWwSHgZQ4L7eY7LM8D5Fvej4sxWkvwKmdlVa?=
 =?us-ascii?Q?C6PHJfAsP4bQTifIvjgZD1UhItow++trIAKZ+C3Dnjy2LbqBpR2u6IwbfOc6?=
 =?us-ascii?Q?By5KqHvvb6YCem2NZ2Q/E1tex51U2FL3xXOUwqH1fcKAghPDDNUUeLNTTdaT?=
 =?us-ascii?Q?8Q0MlUEzd4AvOaIv3ZtQIbR2uSq0TQlUpyqwsRkrsN+OeChdj3xpIgH3OXww?=
 =?us-ascii?Q?5M2WR1WMOKpKkv7y6NgKOkMASSNjCgM0qhcw+W4QiVTiI/OK7Tkbzl5g9VLj?=
 =?us-ascii?Q?K5loO4XsF0RMW2pM75rx/2J4YyRvSSuh/qGBByEPdKnaCv49focg0RXy4ERv?=
 =?us-ascii?Q?uvqv1qt+TKH08ML9v1s0fL+ZZZUih6DfYJzNpT+xMqhmqdbiO1nCz+2iWqk2?=
 =?us-ascii?Q?GecJCgqIOZRZPTSzgiWceh9sxHUSsuhE8EfKLBIWmHVnBP/9QLhloYh/9Jzn?=
 =?us-ascii?Q?MTP+lxgS3LVTNoX42/WHeJSDb6D1x8QjFIILC5vW04VArk0hfyjWq4udueMs?=
 =?us-ascii?Q?c1248y5++AyRJ30GnA0GjAHBUI337r4GrX6teUxBzwbwcRHFaQfxjHye3ar0?=
 =?us-ascii?Q?mpq6AkMrVOqUhy2XL9R5x6Q+iznsPwuDGMlBAsaI3ApyZs3aTsMpsShp8d5S?=
 =?us-ascii?Q?5oBV9O09pqjJ30Y1bLzqgobmHoRN7ZG3nPASYgCIqWQOXGrmj+9X8gJLFoxk?=
 =?us-ascii?Q?Sko/wDss134P/4NQhDiLBkFqWy37zWAJWrB/qiw+iG9iDBajeknrSPj7chHy?=
 =?us-ascii?Q?3G8WuOqNiHtiCBokIx2v9vK8kKm7Kz56zM2LIrBgDOxIvtCuDI3m7LjwyCV5?=
 =?us-ascii?Q?7mOy3wQ1VXlpMluhZG+Xwv1SvD6KB6FLsAy2qXV7TgVDe5PwPUGmmcTnXfRo?=
 =?us-ascii?Q?A0sa2pgHjfV1SpgMTocy9LryLR6EbJU9WY2VxA1uTVS16fxrXiO7wIX8A591?=
 =?us-ascii?Q?Kq8ZT6hBCFA40Rm4GX44p1nWumR0OSM0J2np5eqdTlNsn4FD6W6vHKZut44X?=
 =?us-ascii?Q?La3HOgsq/PF0OyB1yVHEuIAWnwe4tLUiIGGbBOmx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbdbdbd-e196-4e7b-f54d-08db8c6a875f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:17.0693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpUgpw/aOVy37H16sMMvyNbmz4aayX5x3GcJ9fDxoPoo6icYsRpOmJryP+bE7CEi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7353
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

Allocate a domain from a group. Automatically obtains the iommu_ops to use
from the device list of the group. Convert the internal callers to use it.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 66 ++++++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 1533e65d075bce..bc8b35e31b5343 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -94,8 +94,8 @@ static const char * const iommu_group_resv_type_string[] = {
 static int iommu_bus_notifier(struct notifier_block *nb,
 			      unsigned long action, void *data);
 static void iommu_release_device(struct device *dev);
-static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
-						 unsigned type);
+static struct iommu_domain *
+__iommu_group_domain_alloc(struct iommu_group *group, unsigned int type);
 static int __iommu_attach_device(struct iommu_domain *domain,
 				 struct device *dev);
 static int __iommu_attach_group(struct iommu_domain *domain,
@@ -1713,12 +1713,11 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
 EXPORT_SYMBOL_GPL(fsl_mc_device_group);
 
 static struct iommu_domain *
-__iommu_group_alloc_default_domain(const struct bus_type *bus,
-				   struct iommu_group *group, int req_type)
+__iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 {
 	if (group->default_domain && group->default_domain->type == req_type)
 		return group->default_domain;
-	return __iommu_domain_alloc(bus, req_type);
+	return __iommu_group_domain_alloc(group, req_type);
 }
 
 /*
@@ -1728,9 +1727,10 @@ __iommu_group_alloc_default_domain(const struct bus_type *bus,
 static struct iommu_domain *
 iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 {
-	const struct bus_type *bus =
+	struct device *dev =
 		list_first_entry(&group->devices, struct group_device, list)
-			->dev->bus;
+			->dev;
+	const struct iommu_ops *ops = dev_iommu_ops(dev);
 	struct iommu_domain *dom;
 
 	lockdep_assert_held(&group->mutex);
@@ -1740,24 +1740,24 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 	 * domain. This should always be either an IDENTITY or PLATFORM domain.
 	 * Do not use in new drivers.
 	 */
-	if (bus->iommu_ops->default_domain) {
+	if (ops->default_domain) {
 		if (req_type)
 			return ERR_PTR(-EINVAL);
-		return bus->iommu_ops->default_domain;
+		return ops->default_domain;
 	}
 
 	if (req_type)
-		return __iommu_group_alloc_default_domain(bus, group, req_type);
+		return __iommu_group_alloc_default_domain(group, req_type);
 
 	/* The driver gave no guidance on what type to use, try the default */
-	dom = __iommu_group_alloc_default_domain(bus, group, iommu_def_domain_type);
+	dom = __iommu_group_alloc_default_domain(group, iommu_def_domain_type);
 	if (dom)
 		return dom;
 
 	/* Otherwise IDENTITY and DMA_FQ defaults will try DMA */
 	if (iommu_def_domain_type == IOMMU_DOMAIN_DMA)
 		return NULL;
-	dom = __iommu_group_alloc_default_domain(bus, group, IOMMU_DOMAIN_DMA);
+	dom = __iommu_group_alloc_default_domain(group, IOMMU_DOMAIN_DMA);
 	if (!dom)
 		return NULL;
 
@@ -1998,19 +1998,16 @@ void iommu_set_fault_handler(struct iommu_domain *domain,
 }
 EXPORT_SYMBOL_GPL(iommu_set_fault_handler);
 
-static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
-						 unsigned type)
+static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
+						 unsigned int type)
 {
 	struct iommu_domain *domain;
 	unsigned int alloc_type = type & IOMMU_DOMAIN_ALLOC_FLAGS;
 
-	if (bus == NULL || bus->iommu_ops == NULL)
-		return NULL;
+	if (alloc_type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
+		return ops->identity_domain;
 
-	if (alloc_type == IOMMU_DOMAIN_IDENTITY && bus->iommu_ops->identity_domain)
-		return bus->iommu_ops->identity_domain;
-
-	domain = bus->iommu_ops->domain_alloc(alloc_type);
+	domain = ops->domain_alloc(alloc_type);
 	if (!domain)
 		return NULL;
 
@@ -2020,10 +2017,10 @@ static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
 	 * may override this later
 	 */
 	if (!domain->pgsize_bitmap)
-		domain->pgsize_bitmap = bus->iommu_ops->pgsize_bitmap;
+		domain->pgsize_bitmap = ops->pgsize_bitmap;
 
 	if (!domain->ops)
-		domain->ops = bus->iommu_ops->default_domain_ops;
+		domain->ops = ops->default_domain_ops;
 
 	if (iommu_is_dma_domain(domain) && iommu_get_dma_cookie(domain)) {
 		iommu_domain_free(domain);
@@ -2032,9 +2029,23 @@ static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
 	return domain;
 }
 
+static struct iommu_domain *
+__iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
+{
+	struct device *dev =
+		list_first_entry(&group->devices, struct group_device, list)
+			->dev;
+
+	lockdep_assert_held(&group->mutex);
+
+	return __iommu_domain_alloc(dev_iommu_ops(dev), type);
+}
+
 struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
 {
-	return __iommu_domain_alloc(bus, IOMMU_DOMAIN_UNMANAGED);
+	if (bus == NULL || bus->iommu_ops == NULL)
+		return NULL;
+	return __iommu_domain_alloc(bus->iommu_ops, IOMMU_DOMAIN_UNMANAGED);
 }
 EXPORT_SYMBOL_GPL(iommu_domain_alloc);
 
@@ -3144,21 +3155,18 @@ void iommu_device_unuse_default_domain(struct device *dev)
 
 static int __iommu_group_alloc_blocking_domain(struct iommu_group *group)
 {
-	struct group_device *dev =
-		list_first_entry(&group->devices, struct group_device, list);
-
 	if (group->blocking_domain)
 		return 0;
 
 	group->blocking_domain =
-		__iommu_domain_alloc(dev->dev->bus, IOMMU_DOMAIN_BLOCKED);
+		__iommu_group_domain_alloc(group, IOMMU_DOMAIN_BLOCKED);
 	if (!group->blocking_domain) {
 		/*
 		 * For drivers that do not yet understand IOMMU_DOMAIN_BLOCKED
 		 * create an empty domain instead.
 		 */
-		group->blocking_domain = __iommu_domain_alloc(
-			dev->dev->bus, IOMMU_DOMAIN_UNMANAGED);
+		group->blocking_domain = __iommu_group_domain_alloc(
+			group, IOMMU_DOMAIN_UNMANAGED);
 		if (!group->blocking_domain)
 			return -EINVAL;
 	}
-- 
2.41.0

