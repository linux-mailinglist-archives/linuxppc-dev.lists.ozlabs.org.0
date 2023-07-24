Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD5275FDBB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:30:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UEahh4DA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nHz3znCz2yDx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:30:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UEahh4DA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::627; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6Z2zNRz2yGL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScaPqeeKrk3fGCkNZlovZ5+WP7TVyQZxtk570koXaBePuyBgIZzgE27KGM9WLhxo1y8xbLEGfxXrcnoK2cpWcCV/2fbqyNJYuDYw3+uSZIH8Kc/+bvx7ZB22o3s9ICESnrVKiam7qzKgZxJXDNEYyZFv7QpnEAtNRkGwlZaf7WghRAotAIqbAPdrh+rY2mMHjqjliYyyiy4ZaT9Af9X3BCgLQ5JTD07lgaU+d+KDrT46zvWGjMYB1o9up8cqWXGvNvMQ+b1tld5oliWRmuhtMSV50b4eOVUiZ7Rq3Vm+S8NSLtLnoo71qeHkkHrswMs1Goz6pqNWDDOXpCv0UHcWBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qg6RwPc3o59Fy/WU3EeeG9ZakmbO8tBMyKbd8yYPm1c=;
 b=b8ggEgkKBysQaP3/pcUsWbDmgEjU+zmDiDInbAZGpMGrd07kxkZs/6M5CrFpy1fp2F3RpCQCUT/ziyFgj8S9alVFU8ssz6o8YicMh+K6OoWBLfSO1KrOsWTj/iBfs++i6lwlVszcTLKpWFDh9Q6V3HqsjC4wo6/gGJCqZAjrsAHqn1/XjcH2wfz2ZMuajML4XTHbUTCtRG8kwX2r/+iLVzEgGXNxSq/vFCNblM/zeyo2xdY11hCagebbzvBXhgnVpF+hDY+YZJ1BJ6SlFZci1ylzJwHnNJiugek6EoruUm1CCijWrDIRjYnDabSyhaRYYUbvrzzUAXsbTHi6geEhAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qg6RwPc3o59Fy/WU3EeeG9ZakmbO8tBMyKbd8yYPm1c=;
 b=UEahh4DAYWUczndTWR2Bx5avG7YfKk6APiEyBDZ6DUGoU2Qhl+XORApPuXyfepIidH4osjrIhxGTFufpgcr8aUu2tktXb8xx3RADBWrYKmwK0JILPoIRHs45tZ6TKyoHiN9yu6h8B0IW11gb3T8H2GZCKoL5Mp8ap6790b406s2eeLfH7VuV4ynNbOR7Cf7tjHqj9rFd0UY51ACpaz8ohf7Vt+QlA4hADgYigYSvDYmKAMMRHYNZzYwPr4Z4pZdV56lxDHaH29EywFEeBsSCBoFCmUajFLcS5FZICvyB62YJBxkZz3oZviBt9WApPTLktIcKPw0TSwxGKMnUy9jbIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB7353.namprd12.prod.outlook.com (2603:10b6:510:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:21 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:21 +0000
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
Subject: [PATCH v5 24/25] iommu: Convert simple drivers with DOMAIN_DMA to domain_alloc_paging()
Date: Mon, 24 Jul 2023 14:22:14 -0300
Message-ID: <24-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d043acd-3065-46c8-b3e8-08db8c6a87a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	AIdBwWupW9/ilall2ZbakQrVxAPQ/RTHx+9puMz9pnqyofYyi+XEu7HgqB09vdROIl5B1d71gfmpPqCqjaBDbkim19i3RcO5+Mn9+PhX/1nI4lwwzFU/XJVb/8fenxOsdwX15syMXGoUDhPoubJsnqDP5+v71Kwe+joY8zxTUfs5Q7nD1LaaKGoYG3Z/79uhdvpXkvWxtPLoKtgDbe90oZ6DXmgL45n0GySEEZI4fp96pLNRShqHibtsJerd3W1b+y49Xen8ojAb3zZN78pvh4WaLHMBFKrROCBdcsd1u3bvCb0I+SRrY8hXnCbc/QBvqwn2xJCk+vmIHXGE7bAOw6oEa6Dlge7mODd6v35rzANA/K32XupViOR07VanyFCQAQyILZBlTGb750S4cJjWQp0wzcuiaIzmz0jQmVlQF8+ePT0u8wxgwKTnNhj2LnnLN/HAJRb0OAtOvyEOk34nTsNKQ5uKIjyVCj3wJGvoQ1/LGrbKNCodozmqSOu12000Q5yaeEPY4MwFUTMJaCRgX+HNjCgKf9Yliof1Ob4nykVS8llONxP/rMVodNyqGEWT1UkP3yjO2yVuXadmEyYr9oBkIDz9G/HY8e0V1ZQ7//c=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(36756003)(478600001)(6512007)(6486002)(110136005)(6666004)(54906003)(6506007)(186003)(26005)(107886003)(2906002)(316002)(4326008)(66946007)(66556008)(66476007)(7416002)(7406005)(8676002)(5660300002)(8936002)(921005)(38100700002)(41300700001)(86362001)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?dD8jNhAEP09kjQDYOmorHa98KUVpCKtmY6BP4eZUfqDbk/9BSV5A9TV0YCAW?=
 =?us-ascii?Q?wrcdjXa4R502Q/iZ796nubOS8lwfS0M3thmHrZG+KCrXag5ikmc4zC2Wujce?=
 =?us-ascii?Q?1Q0NhEKu09jJrsIa2jhzntNbHwwP9WRMgsZWvvEXg5rs0G0T19MJRlvZlb0i?=
 =?us-ascii?Q?WbEyuISeba/I9+uoj8gml9o41rpT+taxMO3NdLKlkFgRY4wg/6Amg0Tzkqmy?=
 =?us-ascii?Q?XHntoL8SRVucleEnQ+0/zydY8iNSkKUeXdt/AraNFkzimrV4+hnLFxKKkP9Q?=
 =?us-ascii?Q?VNDlp7i1nqijNf/JRMxWrUItik4WHUynIgzUZmie7I0RFLJMJNn8dMsrhAjh?=
 =?us-ascii?Q?VdaQ92XnSDtUTW9D3lxpgdywa4jH5HJ7bEgwngQHkutmOckayfS8PlbLYETq?=
 =?us-ascii?Q?hbizVyckzcr2X3T1oU5SNOD3A6oHcOy8vaNpz+HJjNUemfmhWyeqP3UGDstU?=
 =?us-ascii?Q?WxhrDsfIOFUPNWdPiDh9qgyo96rY0XBZWICX1VnrQ5FjIGZ6lKzn1fFl0SVz?=
 =?us-ascii?Q?GQ7YWg3jjA4D7y32hQcS1lbALRMnIcW+8C0MKzHOpoJ1fefiLoLBnxVt0qAK?=
 =?us-ascii?Q?+0C+FwhvBpC5x0ejGdyluJUdw0cMH7/H4kqWXRV3ODrC43Rb27PEyMLTDuTG?=
 =?us-ascii?Q?86dUZtcJprL/bwQZ0Hi+n+9TqeI2VnQdy0XPtmHfegraXtHQx8AH61by9rzc?=
 =?us-ascii?Q?zlepz2o7RfAntX7wtQ1NdY9xVe/hY3NxojiNCW78LWM18UOSWZCFh8A14Wv/?=
 =?us-ascii?Q?Bn5X1wDUOUqTXIO8Q16+1aZsuDViF4fEgOleGhKA1Y4rAlXRSSK8mY884UZf?=
 =?us-ascii?Q?3fjQgxrGzOMXF4mQABTE+Ur8ztKuiw63XrRADguxQDHiRwGbg4Er2Zaf/nDc?=
 =?us-ascii?Q?VLyus0prrNed5qxgCVLYOA1x4BERQUR7VQnfDOxDRyFuYrRPVLBAKQ9lN6v/?=
 =?us-ascii?Q?GuqsJvGPKligT8a+JyquZPPxyCKoTX/OPGN9X7hNQky3iIzMGUDUuhJtd0ta?=
 =?us-ascii?Q?quDNldGQ5l7wNeqdvKxIx3shg1ZsD4ua/ifolrRJMq6OLH8Frg5CoWV4CHH/?=
 =?us-ascii?Q?9fCHMtPX1d6kZsyUBNMU+51BsvX4KVtKGkgz9ZT3nnMZY3/lvktqbuRVBohX?=
 =?us-ascii?Q?+lFMdwRMjnk3SbY6lBI7XqLcRvX2ikpPpAM/+c/VK4gxkFenqwd3poGrIXBZ?=
 =?us-ascii?Q?Liw3wEnfARRCKcGE/DHIjbHprcs6GCeye1V1ttFjxO4j/6QVfvdvLmwH3dcP?=
 =?us-ascii?Q?d0Zmp612RV0SgXY89R1AB+f4BVt4Iv8KKU1rvaK3BJBCRVKbIV+LUC28ld6M?=
 =?us-ascii?Q?RLdUPvDZwBxgvaoxCUTqwY8zqvPqKvoUZIZJ2GXkV4yzJHQAI9Omini9OV/C?=
 =?us-ascii?Q?cYhmQT3YNuzDzplwW1WvwX7X3WntX6EhDjx0Z6enmX6kVjLyHVNC5tadxfQ0?=
 =?us-ascii?Q?2yO3HiCBGYIWlNmT63qhfgenPo6t1SzPtgQTUaQmrTDNUWp3QJ6XExZiGJqm?=
 =?us-ascii?Q?1qRRjUdjutAiPN1JqafpxhoJ11DJkhFDtVMcnfMwzmMYWg9V+ynUYNZT6pGk?=
 =?us-ascii?Q?o+ScV7e6hcXi/pugsz6f1ZlCg8oMpzdyZ20OmzHr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d043acd-3065-46c8-b3e8-08db8c6a87a2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:17.7248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXb6Th5/Z6musT9eaxjrd0NY+KJ6u9QL7QcBjgeXXp3i04KLjYL4R7IMF16hssBF
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

