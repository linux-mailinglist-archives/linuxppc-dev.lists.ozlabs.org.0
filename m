Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F65776DC6B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:12:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ROLzmJfD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGTmZ2mTvz3c8n
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:11:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ROLzmJfD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::61f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThj3h7Lz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I47fsNi+eujAuIe2y7m6tIF97SFKcgN/hybz4LjN2+/UZfYeUW0Ze0gm9MU2ObkTrYXO7nWxoIekEVCLSMxJgd2f9IJul2MZA0RA20y3f6sHVPExauuKttolkwv00OWNOZIRZn1Ul33ujbpk1gAoJxnFT6/pUpk+0vKusH2BAHS+0RFVPY/qOrKu6eVZ2igDaG+Gng3nxZlP3bT9Xf+0l8BJZavTYRrUqrZhJjyFmY9PUZLFqQJ7V990P4F8fUeVmPJh3adNRiy1OHLuRVfhvka/awb27olbKxswefvUVIR9cbVrUBZt8uVXT9jxxApRsK+DDRdlZ80ZuRckEJLrLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qg6RwPc3o59Fy/WU3EeeG9ZakmbO8tBMyKbd8yYPm1c=;
 b=W8mT9JMGd9knT0/C6flLXlJp/km2oeUY9IfMSdMfutNeZ3daduUqjp+WD/oM5qHxgNQdGXPrW/Qtr4thDaSkpxu+qdalGEge+g0FivJFvQopcnvh/UvGrpF+QzPGdhTyYRblhjRqz7ldA/akxFHyuVWhY7mY8+BzGEIn0y8QIUXS6e6ehSBC7mwysVnF7k+U5k8R0b1c5ex476qOQUjo1GW8J71+BtzKDkXIn7DTQrl7OZ5NXW134av260FV0CcgukIhcQh5VXfddR8klfyFzeTdgvU07nolEI+ujNjxHnPMfqXU/fPIPbKxqYn7cM3JC6HAmP8ldxpTTg8glT2A8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qg6RwPc3o59Fy/WU3EeeG9ZakmbO8tBMyKbd8yYPm1c=;
 b=ROLzmJfDwu/0FxZcGwcHO4n0Tcspx5hyB2wFecgagQDfgXfcnRJ4wzt6YF18Fri5kCANIVv18WwEvs/tz9V5Jqr0cJaAsTGG8jSjBa5jh3uppozepqXCtb9l9RcbiBaV7/nSlGZ2ZdV3oFebuNzdwMmvTyqzZ8O0pUB7c2JB9vJ3aS27UvmAvmXrG1QeyauvQP9AQhiyZZKikfXjZxBQ1AdCHGAC0d5zajRaHCTmVHXMlFW6tseyjx73418F/HZe6vOf0HRT3BGoMhokBj9INLcUoZkcKpA2QpLriyZ2FxaJGM3Wk7ybdXqCxxqEuevV4gbiupIHWVlN7wolRpQHxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:08:16 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:16 +0000
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
Subject: [PATCH v6 24/25] iommu: Convert simple drivers with DOMAIN_DMA to domain_alloc_paging()
Date: Wed,  2 Aug 2023 21:08:11 -0300
Message-ID: <24-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:208:32e::11) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 953e61f9-b265-46ad-9eda-08db93b5bb19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	iqQl5aqQw6vSByh3mvSpOFfJaPTQAOupNPt3z6irEZxCXGPXAytB5y+Gh5yA+vBSqp943bF8yipnaiDaIJwq9xhGbvuxWtgoMM83IpAT36T2LGISIcX897+hXWQCcoOWH1rOW3NumIm6YCuT06lfRefieeQNImcijzYwg5ztuWe0EHQNeHTIjlsm92wD2aZhKWFaJo2ZKrdjO+bLBJYcK3pg9KT6fyctWC0bt2OiB8+JcAVBVqRq/rqwggg4Hxfa6wJknSAWySYfyA9JeXfBOS4aYNl+YB0txzi7EnSisN/bQWq3i/b489Afi9JI8HyLPPmxycFGCYnT95HBw/XGKdwDSN5jfwVln7dvv4anQ7Md9zR3FmNcF0/87Uqu+w5ysDPyLA3GDWdj6pXhvNCnd4ylT/vlEFu7FA4SRu0UKxvardDUEtYB5K338ettFgE5a43phL8xPmemxHB1sc3oGo7ngiykblJlJdfkxOgMYTyvTET+icZY1+Y/aYJSOsSiobqUafm1civGAkRqiUHXJw2/16ph5F4MSnuCyxbR6SOCfsGbtuWjMGb4a3Aii2X8tE2B9R5P+tDr46XN0r8B41bcaTG2Eu+mtmLWlalInaE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(110136005)(6512007)(54906003)(6486002)(6666004)(921005)(478600001)(38100700002)(41300700001)(5660300002)(316002)(66476007)(66946007)(8676002)(4326008)(8936002)(66556008)(2616005)(83380400001)(7406005)(26005)(107886003)(186003)(6506007)(7416002)(86362001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?4s6/sWxJlDTqoOP8Lu+ozo9ic1RZlURkPx+0vVAYmm+ozAk/BH+/1FydFj8t?=
 =?us-ascii?Q?W5Wm1O2xms+OJGKHo7CWzszo6zG/lW9NPT7YYlLiwrG+j2Y1oYOm3pcEMKg9?=
 =?us-ascii?Q?+Wofc63T0yYfEAIiQM4x9+SnaMeUsqT8lqaAwOt80cnuRrsa5PO+ozr75MUm?=
 =?us-ascii?Q?n45KQTQ/7eyxMn/l/0wZrQtHTFIV0eL5WIax6K3voLrGEiPuSaxVnIRiKc12?=
 =?us-ascii?Q?Qt/OBFxRphK2RZ3Z3UO6wy8Jr0SmuCKk0VSBjD14vH/Y8DZXTAT/RiqFbDLt?=
 =?us-ascii?Q?GLV/0Mreb4gKZeGQcAoPsg3ITTcQwpaNzu6k3HQAuDM8yTwP6J/6w47yNG8O?=
 =?us-ascii?Q?JtkOEw9zfNaUBJoRLJP+DgsO1Laiqvd8pCKDMFp+KbosmneaQXI93OX1yFas?=
 =?us-ascii?Q?1y1QbHQhvhI8NxQBZj0or3+THAqcc45M6Bn2kSAGYIM6cUvL+O1Az1URT1zE?=
 =?us-ascii?Q?STjVwft7OYl2KNlfSaj9Jl4y2KOGBLqFC9zCOWe3m8qc8RqSxn21YlQZiECx?=
 =?us-ascii?Q?zbtkaHBTU84ykv94lDfdD2MWMXBKnEfZXvfMZyjTkXOZFvf4p7zR8RnGHNsB?=
 =?us-ascii?Q?AVNz3OrFEl7goNb5gH2EiC/4HFbEAHLfq4TDsTxIzxs27IB5oqgCF1+siwTx?=
 =?us-ascii?Q?0F8ewbgb15+wnBK51Xfm/d0L0yoe845oDBmv+n6V8H5B4FNp3LLeQSSmTUBp?=
 =?us-ascii?Q?ezRg3ZxoKm57XpvN5OaQ4kmm340uTwBd8eVqAHV67KsXIaH/wZXbnDEvjD/P?=
 =?us-ascii?Q?NXa+0ynexzTn0Ts+ZJl9/fWon6QK8OWjVs0d58N+bEbkec/h47ZKFQdXov6u?=
 =?us-ascii?Q?iJPsKJRLmfFbiLfek6/ZyJr59MxVoiYoqODw6kz+GNT+YuqdEfR4yDoXoQXk?=
 =?us-ascii?Q?fPiH4k7GAtzhTediXUNlnbP+0gUtp1+UO/Mne5yi3gVRywdNzdtDpewrzjW8?=
 =?us-ascii?Q?ix561vGI6OOPn7DyNyPYt5aFu8sBDYkFeHOAaattKzjiMk4CMfCCIfUeeRm4?=
 =?us-ascii?Q?JonebWgRmkgm/myI8uUSAhRXXeqAqwg4vLu6nAckKnR51cRidUIvnletPJYN?=
 =?us-ascii?Q?iBxv9f9ALJsy5KohbdIutIfMN15RTjHJ4LKH0NKddKiEZZWXpL4qG3PDPHnc?=
 =?us-ascii?Q?vqqBxvjV4M+J5+9fJKpp+nbBu9kC/s+DLBQsJu9N4ekr/13xlR2l62b3A/nd?=
 =?us-ascii?Q?D4FgoCyaal8EIhz/ug1/r1Uk4E+ic0rFA0s2IYU9Cq82qdOh9nDGOk+wo29g?=
 =?us-ascii?Q?7QCfMRjKWLZs7ZJLmIPsCsyzLBmoM2exCPY/SPEdI9vSWFQDvt4yndZ9qCOH?=
 =?us-ascii?Q?aaGeiXFVotcZl1JcXHA5zP0aSHe5L6Um6dxdbQh0jeterA80vjzNpMvoDcP5?=
 =?us-ascii?Q?EuiofsEZCouwrAa4NdA3ozSzDYBzArqhrCraUJHh8vHj5gfKmZZ+xN2jLEet?=
 =?us-ascii?Q?IKH5Y1ZdIs8b3qbLL0yTK8GRWG/AFpCbhSb43PX6v5Cpr7tw1Al0O+XAcRX2?=
 =?us-ascii?Q?D1MUP/kIC348R1KWuYQm6usyBlIOENF/1KxuDTIg10Im/dbOcI6zuFyUyQE6?=
 =?us-ascii?Q?/wcSovxRo8KvegvmRLo74zulN8ia0I0hYYQt7J08?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 953e61f9-b265-46ad-9eda-08db93b5bb19
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:14.4554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kw9KTZgc7MvYDmtit+OCk24sWBx2NpPMpPDtVIxIP1Q3e75MOnu2qbRj0ayok1J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5809
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

These drivers are all trivially converted since the function is only
called if the domain type is going to be
IOMMU_DOMAIN_UNMANAGED/DMA.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 6 ++----
 drivers/iommu/exynos-iommu.c            | 7 ++-----
 drivers/iommu/ipmmu-vmsa.c              | 7 ++-----
 drivers/iommu/mtk_iommu.c               | 7 ++-----
 drivers/iommu/rockchip-iommu.c          | 7 ++-----
 drivers/iommu/sprd-iommu.c              | 7 ++-----
 drivers/iommu/sun50i-iommu.c            | 9 +++------
 drivers/iommu/tegra-smmu.c              | 7 ++-----
 8 files changed, 17 insertions(+), 40 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 9d7b9d8b4386d4..a2140fdc65ed58 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -319,12 +319,10 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	return ret;
 }
 
-static struct iommu_domain *qcom_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *qcom_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct qcom_iommu_domain *qcom_domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
-		return NULL;
 	/*
 	 * Allocate the domain and initialise some of its data structures.
 	 * We can't really do anything meaningful until we've added a
@@ -593,7 +591,7 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 static const struct iommu_ops qcom_iommu_ops = {
 	.identity_domain = &qcom_iommu_identity_domain,
 	.capable	= qcom_iommu_capable,
-	.domain_alloc	= qcom_iommu_domain_alloc,
+	.domain_alloc_paging = qcom_iommu_domain_alloc_paging,
 	.probe_device	= qcom_iommu_probe_device,
 	.device_group	= generic_device_group,
 	.of_xlate	= qcom_iommu_of_xlate,
diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 5e12b85dfe8705..d6dead2ed10c11 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -887,7 +887,7 @@ static inline void exynos_iommu_set_pte(sysmmu_pte_t *ent, sysmmu_pte_t val)
 				   DMA_TO_DEVICE);
 }
 
-static struct iommu_domain *exynos_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *exynos_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct exynos_iommu_domain *domain;
 	dma_addr_t handle;
@@ -896,9 +896,6 @@ static struct iommu_domain *exynos_iommu_domain_alloc(unsigned type)
 	/* Check if correct PTE offsets are initialized */
 	BUG_ON(PG_ENT_SHIFT < 0 || !dma_dev);
 
-	if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
 	if (!domain)
 		return NULL;
@@ -1472,7 +1469,7 @@ static int exynos_iommu_of_xlate(struct device *dev,
 
 static const struct iommu_ops exynos_iommu_ops = {
 	.identity_domain = &exynos_identity_domain,
-	.domain_alloc = exynos_iommu_domain_alloc,
+	.domain_alloc_paging = exynos_iommu_domain_alloc_paging,
 	.device_group = generic_device_group,
 	.probe_device = exynos_iommu_probe_device,
 	.release_device = exynos_iommu_release_device,
diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index de958e411a92e0..27d36347e0fced 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -566,13 +566,10 @@ static irqreturn_t ipmmu_irq(int irq, void *dev)
  * IOMMU Operations
  */
 
-static struct iommu_domain *ipmmu_domain_alloc(unsigned type)
+static struct iommu_domain *ipmmu_domain_alloc_paging(struct device *dev)
 {
 	struct ipmmu_vmsa_domain *domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
-		return NULL;
-
 	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
 	if (!domain)
 		return NULL;
@@ -891,7 +888,7 @@ static struct iommu_group *ipmmu_find_group(struct device *dev)
 
 static const struct iommu_ops ipmmu_ops = {
 	.identity_domain = &ipmmu_iommu_identity_domain,
-	.domain_alloc = ipmmu_domain_alloc,
+	.domain_alloc_paging = ipmmu_domain_alloc_paging,
 	.probe_device = ipmmu_probe_device,
 	.release_device = ipmmu_release_device,
 	.probe_finalize = ipmmu_probe_finalize,
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index fdb7f5162b1d64..3590d3399add32 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -667,13 +667,10 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 	return 0;
 }
 
-static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *mtk_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct mtk_iommu_domain *dom;
 
-	if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
 	if (!dom)
 		return NULL;
@@ -995,7 +992,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 
 static const struct iommu_ops mtk_iommu_ops = {
 	.identity_domain = &mtk_iommu_identity_domain,
-	.domain_alloc	= mtk_iommu_domain_alloc,
+	.domain_alloc_paging = mtk_iommu_domain_alloc_paging,
 	.probe_device	= mtk_iommu_probe_device,
 	.release_device	= mtk_iommu_release_device,
 	.device_group	= mtk_iommu_device_group,
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index a582525d36f8cc..5deb64b9cbe4b5 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1043,13 +1043,10 @@ static int rk_iommu_attach_device(struct iommu_domain *domain,
 	return ret;
 }
 
-static struct iommu_domain *rk_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *rk_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct rk_iommu_domain *rk_domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
-		return NULL;
-
 	if (!dma_dev)
 		return NULL;
 
@@ -1172,7 +1169,7 @@ static int rk_iommu_of_xlate(struct device *dev,
 
 static const struct iommu_ops rk_iommu_ops = {
 	.identity_domain = &rk_identity_domain,
-	.domain_alloc = rk_iommu_domain_alloc,
+	.domain_alloc_paging = rk_iommu_domain_alloc_paging,
 	.probe_device = rk_iommu_probe_device,
 	.release_device = rk_iommu_release_device,
 	.device_group = rk_iommu_device_group,
diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
index 39e34fdeccda78..af68b3a2c123ab 100644
--- a/drivers/iommu/sprd-iommu.c
+++ b/drivers/iommu/sprd-iommu.c
@@ -133,13 +133,10 @@ sprd_iommu_pgt_size(struct iommu_domain *domain)
 		SPRD_IOMMU_PAGE_SHIFT) * sizeof(u32);
 }
 
-static struct iommu_domain *sprd_iommu_domain_alloc(unsigned int domain_type)
+static struct iommu_domain *sprd_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct sprd_iommu_domain *dom;
 
-	if (domain_type != IOMMU_DOMAIN_DMA && domain_type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
 	if (!dom)
 		return NULL;
@@ -419,7 +416,7 @@ static int sprd_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 
 
 static const struct iommu_ops sprd_iommu_ops = {
-	.domain_alloc	= sprd_iommu_domain_alloc,
+	.domain_alloc_paging = sprd_iommu_domain_alloc_paging,
 	.probe_device	= sprd_iommu_probe_device,
 	.device_group	= sprd_iommu_device_group,
 	.of_xlate	= sprd_iommu_of_xlate,
diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 0bf08b120cf105..056832a367c2af 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -667,14 +667,11 @@ static phys_addr_t sun50i_iommu_iova_to_phys(struct iommu_domain *domain,
 		sun50i_iova_get_page_offset(iova);
 }
 
-static struct iommu_domain *sun50i_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *
+sun50i_iommu_domain_alloc_paging(struct device *paging)
 {
 	struct sun50i_iommu_domain *sun50i_domain;
 
-	if (type != IOMMU_DOMAIN_DMA &&
-	    type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	sun50i_domain = kzalloc(sizeof(*sun50i_domain), GFP_KERNEL);
 	if (!sun50i_domain)
 		return NULL;
@@ -840,7 +837,7 @@ static const struct iommu_ops sun50i_iommu_ops = {
 	.identity_domain = &sun50i_iommu_identity_domain,
 	.pgsize_bitmap	= SZ_4K,
 	.device_group	= sun50i_iommu_device_group,
-	.domain_alloc	= sun50i_iommu_domain_alloc,
+	.domain_alloc_paging = sun50i_iommu_domain_alloc_paging,
 	.of_xlate	= sun50i_iommu_of_xlate,
 	.probe_device	= sun50i_iommu_probe_device,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 6cba034905edbf..69c40c191ce4f0 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -272,13 +272,10 @@ static void tegra_smmu_free_asid(struct tegra_smmu *smmu, unsigned int id)
 	clear_bit(id, smmu->asids);
 }
 
-static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
+static struct iommu_domain *tegra_smmu_domain_alloc_paging(struct device *dev)
 {
 	struct tegra_smmu_as *as;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
-		return NULL;
-
 	as = kzalloc(sizeof(*as), GFP_KERNEL);
 	if (!as)
 		return NULL;
@@ -997,7 +994,7 @@ static const struct iommu_ops tegra_smmu_ops = {
 	.default_domain = &tegra_smmu_identity_domain,
 	.identity_domain = &tegra_smmu_identity_domain,
 	.def_domain_type = &tegra_smmu_def_domain_type,
-	.domain_alloc = tegra_smmu_domain_alloc,
+	.domain_alloc_paging = tegra_smmu_domain_alloc_paging,
 	.probe_device = tegra_smmu_probe_device,
 	.device_group = tegra_smmu_device_group,
 	.of_xlate = tegra_smmu_of_xlate,
-- 
2.41.0

