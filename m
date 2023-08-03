Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DA476DCA7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:28:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=td1q8/q6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGV7z0njLz3dsR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:28:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=td1q8/q6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThv5prvz2yh2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hcze1gxanMQs5Uwd184PSqzdplKJR4acQQa7rzBPkG+rZADj6/OTXzcf/5zyvnSwd5lAKtnkCzuVf2nd1OmtgURGujmmvZQTzsGNC1Gex4wlWP8InucPMHV7Xc92adLM4ETSHhtUnYRsfzdmFjujE2nHPHLRptrXyIgNQStJ5OwEhB6ASaKCwkj9VOnK/0bfui9NgSJ3nE7juvA77vl3fmk+YF8OvSPiavvDUn+x63cJhy8UVCxwbftB8wyLXyJu01i0KZ5q5pOqD/gIRbZFqsAU1l8tXdQprDGeEyKRRnLmnqGA3Sm3Epgho2Li+QDUjaSTgJaZAhsBiwgJgg/SRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtZrvcRXMzDa0mN6qyI067L4cF0+kUMjpkfJj4hHp7U=;
 b=ae992h8AErQwTBhfv+rKOoEoPO+w/ui+2UnVIM6P+YNfm/Opvh37JP2bdarkAYPvKQd38AGO9LIkKK038it41wNLSksa0T07Svdc0bXhY7LT0Xm1+NgTuJjwNB/9unygKij9ZQb9G9drzdmNjg3H142C5P3XCjq3KTWfkIpi10h4nkLQgDONxARfr19jiYNzSJmec5btduPK26wXu48JzXYO4ZXs2IhL1udFLuFEWQWPcQHBFUJ4aiKDk+L/wZX58mJKH0Y1IzFIYu0qJkpV2klot37QN6QIehq5t1LuPgltanfNFkfxZuzCBd6W7F61bXY5WEzdQrVexY7Q8apd0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtZrvcRXMzDa0mN6qyI067L4cF0+kUMjpkfJj4hHp7U=;
 b=td1q8/q6sg11kff45B/V4AmhzsBVQET67J+eY0lPWVN69jJZNPg/tMpou6m7ZNwFcF+mfUyEGk3w6xOUftDRDg5SPpwjvVWuNKtt0BNDzGrQYsofRl6y8dHuYHNDGPbJEIZel8jsu6i0uCG12PYxfpMz/1MFVQD/Gz8dX760s0iCstAvO5GJ2njY+sG8SbGOD0/w6pbpTWaDsDCJwGQ6PGK8n+qENGmiO3LA+wnIG+snldEupqmZHlDjFVLL428Q2pF/Sbg4iA6m88r6zWfys+OCGfnI3F6WqkwPb8Y6igZlPwAhqXEXPH7MKntL4cR+Hy8MRoq9GZn2ctmBR8HuKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB6085.namprd12.prod.outlook.com (2603:10b6:8:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 00:08:26 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:26 +0000
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
Subject: [PATCH v6 22/25] iommu: Add __iommu_group_domain_alloc()
Date: Wed,  2 Aug 2023 21:08:09 -0300
Message-ID: <22-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0066.namprd15.prod.outlook.com
 (2603:10b6:208:237::35) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB6085:EE_
X-MS-Office365-Filtering-Correlation-Id: 35561d0e-123b-4fb1-c38f-08db93b5bcd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HHc5XGbLCJvnETbHGHcWZHUcUJuoQgEdRrQQk+gYz9xteiBx75OHxyo5U9jHsgQb6v0QV2ruhwfcjFx0+GHwEXX0X4ZU7eUciHmfcLpv3zJ983yNTLi+KAZhOgz2o5vVmSuGxyWd9Lz8BsyJsEFl3KvaMY1XaGb1Tj4Z0vgUYRM0Jaso7+EbTC+tf2QVQS308M0s0HfPKhzyLf/WwSyRaw6gqyetwOU96qrAh9/8RS8nxpPo+L/z9P/q65JuHr74LNVR543RbN9XrPf/MEZBiuASU8QeBf7Ffsz1TiVEVbIM6zj3CKrQE8tMY80Q+KoYZ8GkDmGTEDfFbAUKLBoMty+FPKCXoygBjeMvXtYrG3G1+PlJSZg81gNxbffO+JWi7gBuNsuZenqovB9eU8b1P3J6O27h6cxD+S3fTOqaqo5kLT46+W2BJzBD8IuqZSpjmb2J8Ryi105/Sx4sXcNL+oZmgU0mKTuP7QGzgcZjIWh0VUJYLEYTxf7/uwlr+SD2zVz8iRwwd/rdus+4+eS/e8sgCAoIdP6QsI1GqnEHQHx5D9mu44ubxkOHP3rTtdtTbvIN1nhUBJi9lXWm+7UOr5t+5ENLoIUDFMlpfNknSCSnExcyUFjXNS7eaXQpM34VRio+rsbnkC3uVLiDHL2SBg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199021)(7416002)(36756003)(86362001)(7406005)(54906003)(478600001)(110136005)(38100700002)(921005)(83380400001)(186003)(2616005)(6506007)(107886003)(26005)(41300700001)(8676002)(8936002)(6512007)(6666004)(6486002)(316002)(66476007)(66556008)(5660300002)(4326008)(2906002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?HVwS/4kZq3GtjnpYSaJdhIi856p9gZuXK76F9Ge35ww7GRSzdj0iYoSxhph4?=
 =?us-ascii?Q?R+MhPbg/GL2xKI0jb6PBHr4iOUxzYm0e3RnykRoC8o0xQP2a+ZruRFqSp3BP?=
 =?us-ascii?Q?Ikw/JKmUxFebaUVnlB641NgyWjNLHW0Hhx+L8EqXPtuJUCH00fJX0Ec9zeqO?=
 =?us-ascii?Q?U7cmW7lkYh9FlH+SgH9g6Ja+Z6B3lrslhpNxaKYx74HMGJM5Pe2d2S6msrjK?=
 =?us-ascii?Q?oei6hDs5njVFZjscSH3VV1xyRHYzqucfvGJit48CGJmAlySBviw/Fxrh+brE?=
 =?us-ascii?Q?9/cHaO9Fs6eL8pDE3mmo2FYIEQ818hmByGdKDpuIBOcWUPg4VAnZgPGJMYN+?=
 =?us-ascii?Q?zuyqC5eXxJo4MyJXDA5YMbl6PC8Gp9lWNvFIwNcgNc5wVknUqRu+QxU8ZCOM?=
 =?us-ascii?Q?JQoK+0SFmRTBHUYWK5BeNnkr7ugas03piQrR7kOAaqF9hDkWimPm9dzmS8EE?=
 =?us-ascii?Q?lTvMh9bZMuQH85Ln4bs/u/jAtrULLSSWtOQt7Wv5Fb2NZ9dX4LWqvrX8zFGM?=
 =?us-ascii?Q?m/ykW1t+lGqOwSRh/z7g9wEzfOYh6laBVOSqg9T+ZAOJ3Hg2fpI120zmPJJS?=
 =?us-ascii?Q?sgYq8+tuUw1f7zvhpFEuoW6LgMItzoGGr2mmvo1pcrohiTgdBHyya52tvKr3?=
 =?us-ascii?Q?eko1mzGmvY7AGTLG8d9Q6SUnKeeSG96IjPzy1qjly1cWJHsV+LFgQzLDBMyv?=
 =?us-ascii?Q?y28RRLIKU/66ZSDh2SWroo47sp826c4EYv6rAuMTsHI8EN/f1TpLHkJ+5sAW?=
 =?us-ascii?Q?ZAEyXRzEhn/sq59Jt7ivi8/icQc6UYuE90jNeEKNOHiIgVdIaOLpJyWeiQ2q?=
 =?us-ascii?Q?o7QoJDNQ9rAQ6e8oVw99yg5HyJDM+YLLUwf38Jowm/kg8xh5ZR9doR36aKro?=
 =?us-ascii?Q?T/LvDMEHSHJsg1XMXwMVC0PmaIvs5WwKMkaNzMxyLMWAzVAFHRZlB3NxY4gU?=
 =?us-ascii?Q?Mn6yicyFzkryOoPTZztM6JADXO3IRZpqsH8j5OIW8uRC/1ldRX3TsmJUV8aR?=
 =?us-ascii?Q?widEkIoTP7nO2hQ5XBo9f/tKCIplTtSDJ1+WgOmFnr6EXRv1OndJzUaozrOD?=
 =?us-ascii?Q?g4RFIkSnvdj7UKWYyw8zmDuJou+AMwwc8OXocAhYDcZ+luhP6QMqFdP7gDvD?=
 =?us-ascii?Q?guza8uWv1szkFBlf5o49KF4nXno3+CFqfZ5SwvZ/Bq8VB2+67AWu8iakkmtl?=
 =?us-ascii?Q?RhZ0ueXIho603A1YZlqXlEsaX334zL9FZn3aJW1UotR7fgLipAYTIcVLhKmX?=
 =?us-ascii?Q?MozMG2bNmImuS5N+H2zL14YOUxj0B1HZjBSH83NgjxhFyK7IorsYwThTVFpw?=
 =?us-ascii?Q?6zo6jKIeJsMVTr31LEcTBWpnteNUXKCJm9C12pg4eIB5BPh8zPDuC01urU8i?=
 =?us-ascii?Q?rzQ37vMYkrcU0PKSle4ZPtcPsvRXOnRKBEbDnziDuDIc/BEQ7njbcnAWGk3w?=
 =?us-ascii?Q?fVKOk1+WZT9FF9DbrjhCxV8o/N/pcv4swdWmDIe9j9VRPwIJ7yXaHNwg7c7f?=
 =?us-ascii?Q?wIX/IafvBY99iaA0p5KJc57lJLj0WrRzhdr2mhSV3A2uur+4y8f4hg181hk0?=
 =?us-ascii?Q?NiNVmys2UyC4uQGDGA4KVb7irP6ChQjkSqI1nECH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35561d0e-123b-4fb1-c38f-08db93b5bcd9
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:17.7290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vI9XomDANfi0p3G9/tfrDcvg/73I6Od6Yo5btFw+zkleGhQS+e0zSINfkW4lpafk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6085
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
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
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

