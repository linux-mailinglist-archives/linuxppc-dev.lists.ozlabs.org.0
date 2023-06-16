Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B71F373394A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:13:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SXGzW5W1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTMG4XCKz3cRF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:12:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SXGzW5W1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::60d; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT8C0Qjtz3bhc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LH16qqhuu0/ONSdqsUApyTFzH2cfEMDtJKyQklBroQq4MHNt+o58gXzbhZMQO+bQ9kJsaYyy147LRk/JY33cbNNlW3n4j29RY0bXqoZnMLBb2gc5J607dUYfpA8NSVKfSHvC3agpj6e3QOupByExIFyRHkRBxfGTUIaVGvAvmGsyNu+4H93AwFzAYNHAxJjiz4eYCP48X7zLCSGHraaqsFs/zObuaUatbwyPuJYopKKaUNVKD6tTz3Y2sUUNopyQp+qGF6OLjblvlR7PJaDjiuZ8L2djv4JUzjOHMm3KiEj2c/TDPiZ3kLNK27LCT3YToI/MBim9Fg4F05fj8h+rhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWCGzrTaqbrXMG5crzEf4pxvfNiTwQ928/5BOZsI094=;
 b=Hvue8rteNnv7jZl/8VVVXP9sOghKzCx5+xxisTpWQ1ly+YUwDqT/ef6tjx4iaMC4ejBZ70inTTOug+mQg8PMiJWBFooP11Yr1DBqtC4MDsNfUPgM5DhLK5kZ895T/jFNKO+NyIgedpSfr9ieksAj7Tpq97qR6/pPIjFASiR/5scxb/3IUVl3ChucbUDk5LKd2yD764tuyTKGBEHuDZ8W5GwsszoRBQSQJrIs+XzUgjq+0YXyRfrRS0aI1VmOl01YLy2GJ/4qaWULhx6rivMqWtEdKhWnyhpjBm7O4As1QU9U30cWt7uP8XGsDwzdvkDN6CbSU6MbI2ybmqJ03ANwuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWCGzrTaqbrXMG5crzEf4pxvfNiTwQ928/5BOZsI094=;
 b=SXGzW5W13aWTGphgiDo4fqcLGPHnOMSNWBDn/AY+WhBwU7B7gFFIFs4fkZbCoiZ4REHKTNvAS1PKNLjUtS9fJYpgo0cYt94MxcC7F2ZHNOxLilbXubqT8w5Dhk6hJzP/9Wy3uQuM6sqoWu0q8ug+1p9Xj5eh+iQp3iiPAowZyl7pBFFrFoaYc69GuSyj0xJkjo9NebjtNSldEUEl6HS2e+fYefblYNtlc8ZLEmAbKJCowNiv/wxM/EkTyCe+eLDWAEWkhKI9JC+ByrGIuD87m62Z+lEv13cJ7ZixRbZVP0W0MzC9s2aokWfjUVKd0XgqcD8f+Q81soknHynNu1aGpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 19:03:02 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:03:02 +0000
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
Subject: [PATCH v4 25/25] iommu: Convert remaining simple drivers to domain_alloc_paging()
Date: Fri, 16 Jun 2023 16:02:54 -0300
Message-Id: <25-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0071.prod.exchangelabs.com
 (2603:10b6:208:25::48) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 0110fe4e-8987-48c5-fb2a-08db6e9c4b50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	yR0LWbemdZpFm68pzG/UvTAooMx2joI+AaliaDgIIy5t1YS9O2z2nY+UJsMXfFpni7PF8a4YRqzOX4xEnvaxCM7zjD3HTMzC0jRLk8FPqpX4PfJIik5aSKXZvHC6xveynqAuu8uCMMzxiYrLkuS4ZfdNZVEEwpMvN8IjfnQJ3M5PCcy5pauVv58nqL01CkNlMnu99TRMdWvlhFp5UAImosZmfWHVAE8RlgBeG+STZdjWGBXZFmcFczpIbntTVe8COjpcyLJtCQmGJAMHZnY+h6emjZpjJOV9Cib4oEGGW1PV2inpWXFRv0Md7gFX+K08B1rRUTxxo3S9JV2Q8q1jhfYH/IFtxR34uXRW6FjtGoJPgI/a7afEJl/a2lAcT5VXfLZtx12u+LQ7AMnO1qOjsoKhCvNJ9Ch2DpU5VhTRWprD0+KPecssfl0U0c/k4sAUXK+2xS7ntCg35JuM8xX131UVu853WLytB9TGR3x5NiRFqkTDniKEnF3q155vslzoIZwKbkMSv+3YkwHsWnLAK6pc9OI+183P9CM9TvYrvCvkI/FARDYIqiPm+JVeVe1eolFFqW0SJk5TbNjbXuG21e7Zu744H9UZfITcjnumSug=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(921005)(38100700002)(8676002)(8936002)(5660300002)(107886003)(66556008)(316002)(478600001)(66476007)(66946007)(4326008)(6666004)(6486002)(186003)(7416002)(6506007)(54906003)(7406005)(110136005)(41300700001)(26005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?IOn58KqjfqGNeSIkK2ZEjKd5DP6tx58Cg85MaKY6viLqZLZzMpd247U9xQEt?=
 =?us-ascii?Q?dSRTnOaUq0quC8PNaaS0SiFXb/axS9KaOlUD0+HVYShQAWNue58oE7rGvfLi?=
 =?us-ascii?Q?5QtpfQ04nm1z6G70eVgp4x7OAi8ofEiyhCG1f5lITSD69h/ntYKtqTD33XN1?=
 =?us-ascii?Q?x9iGfBWImJN5xn6v4qSuCpuZMy42yn0XnZe47KXa8nvyM+NuXeMGlsXlS8Oz?=
 =?us-ascii?Q?65Nmln/Bv8uo/MsmaHA0thj/Kcm20ZCzwXQ0z9OJSy2amQ72C5k+aBQmP8iq?=
 =?us-ascii?Q?IhjDH2tY5AO3XfOnBCiI05MahSIyrYQHpt0wd/IhAI+s5XppGeI7KKdjsNS1?=
 =?us-ascii?Q?Um6SiKDA7KNcZfXJuCSv7CFHZGU4dHruuVWieUyLSSlMBCzKr+H39pOk9Ucp?=
 =?us-ascii?Q?QKdtXhpKhZNDGe/K/SBNZ5Ais/VSJ4/H5VkOl8FCtL+htrOEHsX8Qr/Dpkwd?=
 =?us-ascii?Q?siXKPPLglzGgggDfW4nmGKp8emXb229GCSYVvm3ybuzaP/pxcqDHZmuKub5W?=
 =?us-ascii?Q?EmQPPMK8JA4qYJolS/B5ya9ukwUed1ZMJCVr8MIctlrmEI32XwNZ5/7DuDoT?=
 =?us-ascii?Q?vQBy29vvTg4RauIU1CrHaM4Fw3tA3JcGxDXXqAN9d6nM7qe1zbU6bwNs5hI+?=
 =?us-ascii?Q?Hh1M1ykOz3OH+IWv7q+QV3nFSEkG/qjxddieQqFNZ2pMjs0XYPBlrssg/CDj?=
 =?us-ascii?Q?eGGHFvCbcfcE9BgsSTcAEyTHlmv89maTxe0+tTfQQwWCOXzUODzaFgGdBluQ?=
 =?us-ascii?Q?J8X612uTKJPHkm78RAwx3kIS7mdC/YIB6NP8fnLGGfrgrFtov/0vIUkvSvY8?=
 =?us-ascii?Q?eqEKx6VDn6tHs0JrLgl5i5ry0i3elREU/MwUMhL4lm/F9OoyXLhdqee8g7dJ?=
 =?us-ascii?Q?WT6snEhW51DhoTVa7ddAHd5bh1oZSLHMtO7Sw5lhXM0UbCouXkdDQXymtTnc?=
 =?us-ascii?Q?bOEWCmTib9aDWhP2tBjvORUd5k/9P8LWo4+FhaA+InlUgRI9iWR8Kd4D8z8U?=
 =?us-ascii?Q?MhWgntR4IOwh8pn9/pNfI2nHEOJASWAR/CzcJ1Lq3CIQHAutP2TLNGHQtLEm?=
 =?us-ascii?Q?BxA+tzu0LHtMgdXTSU6Yr+AHnLSvbxtvjCZcDdAEY73XJRTlIV/NLujEYi26?=
 =?us-ascii?Q?Z4O6FvAV6+VxArQi5vP6zWgZj2SW+b0wm0ZLsVfbHR42dLbvnrakLZA4XZzu?=
 =?us-ascii?Q?/70BZYHL9Um0/mGVGqknjIfjxvvthXsHoZ8GiRelnWsBjMvSA+h2Flhi0Hgi?=
 =?us-ascii?Q?mK5ACLUdey75WhPKWF6iACgv8NaMYUS9Qb3v7nNtQeQdJWfZkVtymoGOkc4A?=
 =?us-ascii?Q?pZsieoQlUWmEaIGD9TDeSizrjXvtwoX9PlL9aaKHWRWg/+Tlln5X2a68twRR?=
 =?us-ascii?Q?8wyKWVuVivCp1On5FVbOqxaYgpNJY29Bci8ckK852EoETK3cU6M1J9+Z+rmy?=
 =?us-ascii?Q?r/8cw4bb+yuWc/+6HBxvwIGY5fYDS+DVWJHu5LtQsoKupuvyIHFkAH5/UJuL?=
 =?us-ascii?Q?Ovy+3UKyIfYeq1jC6ZRmKVh67XGaFDBqIWyE+pKDkAKA2KYWc99hKeEPrilJ?=
 =?us-ascii?Q?8wS0g+o7SEp4klv2THP7Ny19ezS0yX0mDEd69doF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0110fe4e-8987-48c5-fb2a-08db6e9c4b50
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:56.2071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IK26pWdshZuFg4GgDLtYSE6JNEK5MqpzSabcvCgbk5Xh8TT1qKM5NrT4/o+tKqvM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6051
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

These drivers don't support IOMMU_DOMAIN_DMA, so this commit effectively
allows them to support that mode.

The prior work to require default_domains makes this safe because every
one of these drivers is either compilation incompatible with dma-iommu.c,
or already establishing a default_domain. In both cases alloc_domain()
will never be called with IOMMU_DOMAIN_DMA for these drivers so it is safe
to drop the test.

Removing these tests clarifies that the domain allocation path is only
about the functionality of a paging domain and has nothing to do with
policy of how the paging domain is used for UNMANAGED/DMA/DMA_FQ.

Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/msm_iommu.c    | 7 ++-----
 drivers/iommu/mtk_iommu_v1.c | 7 ++-----
 drivers/iommu/omap-iommu.c   | 7 ++-----
 drivers/iommu/s390-iommu.c   | 7 ++-----
 4 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 26ed81cfeee897..a163cee0b7242d 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -302,13 +302,10 @@ static void __program_context(void __iomem *base, int ctx,
 	SET_M(base, ctx, 1);
 }
 
-static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *msm_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct msm_priv *priv;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		goto fail_nomem;
@@ -691,7 +688,7 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
 
 static struct iommu_ops msm_iommu_ops = {
 	.identity_domain = &msm_iommu_identity_domain,
-	.domain_alloc = msm_iommu_domain_alloc,
+	.domain_alloc_paging = msm_iommu_domain_alloc_paging,
 	.probe_device = msm_iommu_probe_device,
 	.device_group = generic_device_group,
 	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 7c0c1d50df5f75..67e044c1a7d93b 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -270,13 +270,10 @@ static int mtk_iommu_v1_domain_finalise(struct mtk_iommu_v1_data *data)
 	return 0;
 }
 
-static struct iommu_domain *mtk_iommu_v1_domain_alloc(unsigned type)
+static struct iommu_domain *mtk_iommu_v1_domain_alloc_paging(struct device *dev)
 {
 	struct mtk_iommu_v1_domain *dom;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
 	if (!dom)
 		return NULL;
@@ -585,7 +582,7 @@ static int mtk_iommu_v1_hw_init(const struct mtk_iommu_v1_data *data)
 
 static const struct iommu_ops mtk_iommu_v1_ops = {
 	.identity_domain = &mtk_iommu_v1_identity_domain,
-	.domain_alloc	= mtk_iommu_v1_domain_alloc,
+	.domain_alloc_paging = mtk_iommu_v1_domain_alloc_paging,
 	.probe_device	= mtk_iommu_v1_probe_device,
 	.probe_finalize = mtk_iommu_v1_probe_finalize,
 	.release_device	= mtk_iommu_v1_release_device,
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 34340ef15241bc..fcf99bd195b32e 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1580,13 +1580,10 @@ static struct iommu_domain omap_iommu_identity_domain = {
 	.ops = &omap_iommu_identity_ops,
 };
 
-static struct iommu_domain *omap_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *omap_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct omap_iommu_domain *omap_domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	omap_domain = kzalloc(sizeof(*omap_domain), GFP_KERNEL);
 	if (!omap_domain)
 		return NULL;
@@ -1748,7 +1745,7 @@ static struct iommu_group *omap_iommu_device_group(struct device *dev)
 
 static const struct iommu_ops omap_iommu_ops = {
 	.identity_domain = &omap_iommu_identity_domain,
-	.domain_alloc	= omap_iommu_domain_alloc,
+	.domain_alloc_paging = omap_iommu_domain_alloc_paging,
 	.probe_device	= omap_iommu_probe_device,
 	.release_device	= omap_iommu_release_device,
 	.device_group	= omap_iommu_device_group,
diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index f0c867c57a5b9b..5695ad71d60e24 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -39,13 +39,10 @@ static bool s390_iommu_capable(struct device *dev, enum iommu_cap cap)
 	}
 }
 
-static struct iommu_domain *s390_domain_alloc(unsigned domain_type)
+static struct iommu_domain *s390_domain_alloc_paging(struct device *dev)
 {
 	struct s390_domain *s390_domain;
 
-	if (domain_type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	s390_domain = kzalloc(sizeof(*s390_domain), GFP_KERNEL);
 	if (!s390_domain)
 		return NULL;
@@ -447,7 +444,7 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
 static const struct iommu_ops s390_iommu_ops = {
 	.default_domain = &s390_iommu_platform_domain,
 	.capable = s390_iommu_capable,
-	.domain_alloc = s390_domain_alloc,
+	.domain_alloc_paging = s390_domain_alloc_paging,
 	.probe_device = s390_iommu_probe_device,
 	.release_device = s390_iommu_release_device,
 	.device_group = generic_device_group,
-- 
2.40.1

