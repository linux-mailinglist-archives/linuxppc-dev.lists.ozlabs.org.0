Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA81172A42A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:14:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdC315SRbz3fdg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:14:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ggpfEafT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::62b; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ggpfEafT;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBg21ZHsz3fDs
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/R9e6LFh6qGwGW0h/uCr/X6SI7vPRrPCQToLb1Rj3kMJnDTww3wh5cWruXMtzUd1av+xgl9CigCRkNFYOcXYYz8yHcLDosz785BoQicoYIya4PnX2QDAHiNEMP0QJY8kPqRjiF6/4Pkh8jDRqNzENOkFR7LanhBeeAnte+3My+UKuWDkEnX0AJTwORdXbDbLNd4gbIlaak3jk6yviGgvZghPI1DbMiS8RyNjglFzI5kVydxglPuyYaUCaHiMxj0fNLpvbdD8z/5pBfEuUnQlmSiaIHwQjaIufNfyqf29KEkNUifd1GEs1TfPgmws0sJAxYhtSRnZNC6ZQKio7mAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoElIesssKEjdPfTMK92RQw64fGEXLOoFDEC+x6aHHs=;
 b=h3xY2xlAkR+Cspq8/KuuLGL3HEXtin0gtRXd5DN2yCXhCU91e04PhxpdyYcLevy3tBRXwxNX/YOg4b9MOsjX4Tk23TD/wKLb1hLa9muzkE1gJ2HPOJoXms7b43rsK/kKZpKWGtDGhjDEGA+rRs7BblOehQRzwc4LThPLzwUe/QFU7mqmiyLcN55xYWtGwztQ1sLsc6r4aldNGQmhlPaU7SbBRR8wBNcandgATzc+vCaY/urnK4Tfq2KJr+yyuo+n8BN1qYAS91A4Dg6M2HvNDZpBiSRpHZpmc8m3GDiWh+n727rlFWyCq+ENZwUB6pp76G+eqXNR57Qra+rkWt7NKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoElIesssKEjdPfTMK92RQw64fGEXLOoFDEC+x6aHHs=;
 b=ggpfEafTBE5yF8UNZMpzS/7Cbc7rlhdRFxl3gBf1hy7nQZ9/oOkykhSYj8VPwnasmISIpPIhWDpbjI9a8dvaVr1c+IUH1KPavtKrQ3eXkEsbeaBPPZn6QecbsBE/11L2w9bkYPnvEptkjCtCuDqzQoj7Z0714C44KRM0P7kmDAO4vDUTBhSNUrE8Iv22KL0FdvgZMnvuoHT+ETOKmW7JrecQbW36FqtyRWlP3+7YQGAjel/9olSi8R4VcjkydwfmDf5t7a1AEG6Th80QFaYscVfkBWa2EIknGS8Qpt7uQVLCWYeHhjICLg0/zIYGEGONZGhFSTVAqIIyI8fp1iCUGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5785.namprd12.prod.outlook.com (2603:10b6:208:374::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Fri, 9 Jun
 2023 19:56:26 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:26 +0000
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
Subject: [PATCH v3 24/25] iommu: Convert simple drivers with DOMAIN_DMA to domain_alloc_paging()
Date: Fri,  9 Jun 2023 16:56:12 -0300
Message-Id: <24-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::6) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: ba16cf78-013e-40cf-f762-08db69239998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qgdaC3qZZToxMLkI4Sg8v6M+fXyfUks8Dom65NT3ojk4cnNlAjmi66bKzAbvQzc3AIo+3zw++v6+rjl1tAi98ceWNjx6Skyxf012umpMlSouhm6CLWssSW6QCtUOgPjZj4tqCq5TJeXANTfUOPm3DlZX0PfZziZyfTjgo8MBqVOp9Ay47V0mAVb/nWYvPvcaZktKgS//X/PqIlZtVNH5o4pxK666L1yBCoCAn1kNIbw8i9scso/rD4gyjzfkxXeyBMVl18M3PA0JNBIA69vsMoPR46rAYQyXBYZ9S5IN6ZW8Gm+RoAK2oGPUsaeqAYwfJAP1ezybMLgS7rQLh+AOHByJYBbhf82O3Im80276u4S5ke3HSogOcoHUpmFAOo4m9GEYOTkD7zrEHloZ6gzHl9H9oLw5i7Y3Qw85AEu0dUUhHeR6GIKhByTfQ/4hXBo6try3owwTG+XSLU9epPLw+JcpSg0YeRShJRDsTIrG54L8zFZkGIJNPD3oDJ1PZ3Q59ymBWSf/IIWiRcPw6ozDALlhlc+1i/F6y83V2qCxDaAZCaXIiT3kqle+/Q9zbhSxPoqLgX0mEdAOC5fy8oQu69zUR9beIQ4tabFAdWfzqyY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199021)(83380400001)(7416002)(7406005)(110136005)(478600001)(8676002)(8936002)(4326008)(86362001)(66476007)(66946007)(921005)(66556008)(5660300002)(38100700002)(41300700001)(316002)(6666004)(6486002)(36756003)(2906002)(54906003)(6512007)(107886003)(186003)(26005)(6506007)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?cfgQeO+CNSosEO8vatphkin71Zj3VLIaNb2LxcT8uuk7lP0WMFO2ve4TCqiD?=
 =?us-ascii?Q?K34ppZPfaHVv2BsUWDr1WvVq4oiFb2H0Bqm+tsNbXoMqXYPSl+cl2CHCeXIg?=
 =?us-ascii?Q?E9OgH3dj8KDKFqjjIRTgwAd/zBGA+5/vV6wMxad6inIphdzIH/vroQ0mxGUt?=
 =?us-ascii?Q?TbDAc3Ef8I9bXRifDNQ4IxD2PKjZ11HtRigbAXB/bjC3PAlXNdNIrBbArphw?=
 =?us-ascii?Q?0MxVoiL0z9GbPPPDZ6c9kFpHoMLn4HAL7RFi6EbI8pjUZui97224d1hHRcM9?=
 =?us-ascii?Q?DEnWDYlibl9K5vm2rX0MDIAMMb5v6jmMA6bpFLqYyW8aezeJVUN4QPiXPtYC?=
 =?us-ascii?Q?XfmO/+jGRVHSauH94STnV54LA1Vj7jt5hsjAQG0Kz0uD9DzchLhteAGFcrFR?=
 =?us-ascii?Q?gq/NH8k2u/gxGNvXCHMlzTlEphsiRssUjHxDEOcPFKXtfWsgytUIlkdoNwGc?=
 =?us-ascii?Q?7Z2M/3GK8mXt3APzco5scYQxfPMuLlC0tKy7G5OVR7vkj/yXMwGcJILJUcv8?=
 =?us-ascii?Q?Ig8vrnu5l8UaZsNd4oTNM1suH91CiuzwRARM4Rag6m5z3R3q9LNUQMpPfEuU?=
 =?us-ascii?Q?afPnMRsyOdbcRl52HG2jKzWQ+frROT+bah1ssUnQBXLaNFbZ07X4rGWZDxG7?=
 =?us-ascii?Q?3gNWHZ3Jg5z2HUoXXwhh9yDDkZwbQWWyRTgeVuKDE/8azAw7P262m1gYhJu9?=
 =?us-ascii?Q?RwiuLpbP90wI1Ys/pj7TjjVgz8SFjJiVKyFTkaw6huNvjE+rsWJe+wo86fYg?=
 =?us-ascii?Q?A+aJxfNb5ekxzJRdn6MuAqr/BTHDPh7Pi2+md4LirAhbvpnLJeHAnwD3rm5E?=
 =?us-ascii?Q?XO+CUTNydlsTCMRO6y6BoHE/JAyY3Mn8uGHJI25NcOKx3aUZEScK9jEyYbal?=
 =?us-ascii?Q?MNYQReqDj+VgWoOZXCv6nPBNF8JjrOISMKQmv9/hyBcQDQbRwpqS0Hy/B16N?=
 =?us-ascii?Q?AoooGHfUBcwTPhMphFF1QNUH1rkzOZApv2AjRjqZK2rmDoGYheH1+w5JShTU?=
 =?us-ascii?Q?K2kxn4JfmYbkygW+QJKH2I9/ysiIjbcDv4tAM01DGaH9TyaulqB8kki0/bL/?=
 =?us-ascii?Q?6CSm0tSpoE4HXjBYWKWVNbZqJE0i+7FHhoO1u5cQVeoGBzRyJ6jxWfGeFlgo?=
 =?us-ascii?Q?v+uuwT3f1rdYqi7FneNEsRf+o0Qm1BUG7i5Yah9QwyfFSYJBSI+3xoOiLlFr?=
 =?us-ascii?Q?3aArkEYr0h+eoYHTnR4FtFC0ryG8NigcYgwFh9/tkHo15EcanmiDXUDY3TAw?=
 =?us-ascii?Q?tepFFb6Fk91ASvwur6oNB0DOkif6GHTDrwJBhmB/SrZTgtfdv/uEr9M3hzAz?=
 =?us-ascii?Q?oRU1qj2z10BbYGnOk2Vih7vy+h3KkaeEa+lyo2kuRwGnjtXwQK7ORJ+2W9xb?=
 =?us-ascii?Q?vw37eeR0JOii1yIU2yZWpO71iU0bGc5vovTyUd2J2tp0v3wrsSD76l2W0ljA?=
 =?us-ascii?Q?pbpSgQD9A/ucwb9nrtZHSrMkM8ki1HM98K04NBVEoldJUuMyO+ayW3GtAkQo?=
 =?us-ascii?Q?VWNWdEFCyKsRyDGX7O0lR4L8/cnEPloVbCWIyHrMUfaSOmh01/tP0D6qfbYb?=
 =?us-ascii?Q?2gwkdX9APvbu05girPLiafuSUCUwtea9e/pEY9sN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba16cf78-013e-40cf-f762-08db69239998
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:22.7997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QEhnmrJjKrDPXHfL2yTRQ8Tle8sor0jZdcMzYjbYDZt9VRZKbkoJHMY9gij8wsdW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5785
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
index 818748a76e2469..64e32b3bcd209f 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1071,13 +1071,10 @@ static int rk_iommu_attach_device(struct iommu_domain *domain,
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
 
@@ -1200,7 +1197,7 @@ static int rk_iommu_of_xlate(struct device *dev,
 
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
2.40.1

