Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1776D733940
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:10:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GPrExGSt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTJF70MMz3c89
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:10:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GPrExGSt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::625; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT8972zxz3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGec1QE83DbfAPmsD6Vzy9peqLdH076xI/U7KTPlk9ABFaXJeFNSwjtajjc+3d/3BIlS6/TMw/mLNYOsJ9K+b19qOVw/lDPXpcC+RpvCSzv1k+1jgrFU0t5zRaW3peExNbuNU95uCrxFO2Ba3bee+ozLLIn9iG29V2EdlKOeccbYzv1BuZ56wnpHUp4LNqrdkr3Fw13jl6Ocd1zzcnqg7mjypEDmxJbyZHDDKcKsd1/p/lPPHaJ1cATyXTwoKdwm/4Tv0Z4hU8JLX0t8PxBjAzm3aOcQGn0w0+bXDvBp73omQLykQRZG2V6OQSPMGwsR/jg33dDkoM4cHYn2MRGhpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjMNzj9ECgTiH26ByBwRnJAD0IolSUQ+Be7+5FtoCOo=;
 b=bQvIgef75Klu8OwmqcPEsyGSMPJh0paKDjus7ABq5KA+872azs0UxuC0fxrd/AeiYoaAoH3NWfNHYz6YZbDndVAavvohXhH8wg6w2XR0F//z9SvGyEnZFunMR0e54gF960QnCgm/SsAmTrMA4/I0Q4JTCGP4+wyu25wUYa9vUmx7oPj2o1sqyx/1tzjLfRbwDOxb5gzzmvRztDwrLpeIR16/BQQggh0nPQGcDuDgOQkVwHM1jsTpuH0gwrZQ2nUiTlh48zatJ9IZehBG9ZhEwQ2ec4Bf/oCZzOmMW0C8/9MCoRYnzNkULbn5N/pa8rV09HLjNqdC/JAE1F60hpvHpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjMNzj9ECgTiH26ByBwRnJAD0IolSUQ+Be7+5FtoCOo=;
 b=GPrExGStfKUnEw/ZEk2LNqlSwAMMmp7LOxWTa09+jYwwC8seNItBvIpnEpHY6THMd0x+Ttx5oWY7cuWD3/rTAccLMQPY/OjtIDGzyoFUvqTqSKxdDpcFIDtQACtfpoPkCA76OIwydw7YaWFVnw7eQ1no6ObMi33/l8OVyY0Y4Cj3IZDg0/x/n3KI1pfBqjtcKSX2G0CC+2D3VMcNvI+a2s5pwHM4tkA8f4qpUE9aCHyvlxOqedxu9CibqkOx3S/aB6kVrmeQw2mK7WM8vdSNEk91tTnktzF3n11gcqRQht7tcbkiTvL82Q9ba6qyt02oyV3Zpfd05yIBNLQm96HYsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 19:02:58 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:02:58 +0000
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
Subject: [PATCH v4 02/25] iommu: Add IOMMU_DOMAIN_PLATFORM
Date: Fri, 16 Jun 2023 16:02:31 -0300
Message-Id: <2-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:208:329::9) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ebf6e83-3cda-46ec-ddac-08db6e9c4aec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	8m7HzXfksY4rZUFW16B+UtnhxIpmV0X0AvejhvDWUdCHpZTy8ug89GyUfs5HA957WYIZzzP01dG4g/2mE37Ua6mY2DQHbGlY8pzt3lryHkDXDEvnnI/wgCh1ScMfF4s3jo25SkVrLwyEpqbjVj1AR+xnk0BFzgvOPVkSG0QQI1rEw1kB/0D5C785DnEzrtUyocjCX2H2KJoNbeD3sH7kBvoMdDn34jtiSHeGvDntdmc2T8v5eX4qYtsRbXEGpN2RHozjNPAvrrDUEXVYdtnOgKjN1e85tjiyJ1SQv6O8/HLylTOsaiilpR3/5tTTYJAKUgyIADG8xp9bQOg1RpvDVx40Gg8So1tWF5G90wQr7i4F8BB1qqrjcOo4EkHWfXo+rojMbTPfJ8+6DFlAytXdyVDpqP+hyhOuOa+gLiEYJ+3Zvm1EIyvwqIAqJZAmpe5J510Y6kDnvjuHH8L1rUct6gwvdC81YfT9VbTq6ZgbibAcXUz10ChPWw7Boy5O97QjdmnsKiRIulwE2qnlUVmRcIPeaSg9V49toIPQpZjUtN+Bredu26YHpGhDZ1eEJOVKuE+TBufrXA6kP+JsxqwEkJIGPxGs5jbdW0mRfeNojZMdW4Tu/XV57aD7t3lZnO9f
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(921005)(38100700002)(8676002)(8936002)(5660300002)(107886003)(66556008)(316002)(478600001)(66476007)(66946007)(4326008)(6666004)(6486002)(186003)(7416002)(6506007)(54906003)(7406005)(110136005)(41300700001)(26005)(6512007)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?UK/a6fMwYmb913nD1igr94THvMguKmcos2SExBxWZQGMjBMsDjOaETvlVI+e?=
 =?us-ascii?Q?oZ/+BUbAOTWnPgarELYrjwsNRbGooRiNhxvObviAaAlJurTFczc8NQVARB2r?=
 =?us-ascii?Q?GsreqOcEVqLB4vRr83eigdMeetOKPRXFGzC/3rkd1pN2/U3ZTvEnV8bCsC0b?=
 =?us-ascii?Q?PBuRKcXfyDt+nQoO+mQkWqO8sU8Il9BHw1stzlUtTSUip3T4VzMp/ybwIMtK?=
 =?us-ascii?Q?6wknCp7YKWezlXyv97iikKPIc3A++evGIEJmTisx2fptHuAWIxXhjJdYH3hm?=
 =?us-ascii?Q?kkFoYczW/7LYTvh4sDevyvr3yo1zZ8ilIqdtMHtRKUorO4yTI0XTi91P9SDS?=
 =?us-ascii?Q?kOgKiyTNiEJAtPHPvhzAG2OpdEjkWmFycxpPRrlXwjXAmzoE4b3LYp1zQWDN?=
 =?us-ascii?Q?0whJcPWvaMqHw0vy+kk/LYNJvmy5dGwPaO7soD3V6stOJpVG9gh4mQZaxO+K?=
 =?us-ascii?Q?tGp13H3Y7PBmff85OPTdShxuCqnjySHrC1HAcJuSxbq86psgZ0JZsQ319YME?=
 =?us-ascii?Q?JaRTDepQ0aCPrDUt5EMgUKcU5GWm7gagahyn27U+/F2CcX2aMCgxVq58/V6g?=
 =?us-ascii?Q?yZlmjpcS2PU4XlQTG6nQC0HGOyv7Sd4hVY7eksm90vOTzxxXX06F5D/o8h1P?=
 =?us-ascii?Q?TJbB+HGRraM40/EQ5XT7oQPR00mpRziw666N7fl9Famyozw68RRxaez1rk0m?=
 =?us-ascii?Q?3RT7EfjXzjD6Mj2glfIX1r3u24CDANP0lwiWAeT3vKAw2d4s0s2Kf8xHb2jo?=
 =?us-ascii?Q?Bnva51Jv31K20wgoziBaMLvQbcL1erOItGnESHFR+A6lzuUVZIYjAzFS5hZW?=
 =?us-ascii?Q?e+qyJ+h5ZcWKqyBqtC0dlmD68f7UdT+cVIlYraQY432L29l032S+e6DWsut+?=
 =?us-ascii?Q?1qf8LovRqre6YpvTcog7UqOtNV6xO09G2ZxHLfuLdUwiq0LWIAtqNgQurS9D?=
 =?us-ascii?Q?Z2Yjm532WZi80wKstPLiKpFutxNSvN9iflQZGLXWu4QBYZvTE6JXlzYf0/wU?=
 =?us-ascii?Q?XBznS8OqKkNGzszShcFZrhxrPjR0vwMBCsRcuIkYjevn+gtZGN7slPBte0pm?=
 =?us-ascii?Q?GukSo+jDxc4/0vT1o+gpCJruseZSvda1Nni11KJVj8tEMPRmEz4WWysGSwiO?=
 =?us-ascii?Q?9OK2pohJKwvnFiXTiWfF1GXoK6L3EK+YMN4HsLpZ8YzDP4WTAcCSTaiQJ9mA?=
 =?us-ascii?Q?8b6CF+6BJ6UVr1QnSDd5KHdBga4a8fXCThwXI0k/uUE2xkUmKT1kHFUmIAhS?=
 =?us-ascii?Q?LPX+fg3ZvAmH0AxXir6s6+3mVailxsX97Hh2O0ZiGFkmV18INB7ip/IvQv1J?=
 =?us-ascii?Q?6tpGlA0fOxCUvNU3XcYRMJXYjZNvmnCMS24KxZqdF1QblQv+nkeyUdPNiQ3c?=
 =?us-ascii?Q?70imLfxUkG1/1M9Gq8qae2/z/ryVYX62fxogRVJDJJxtya6VHrWJbtRXWOt3?=
 =?us-ascii?Q?EB3kDXPQ6By4r9XwzH9k3Sl/GWBM0OhS+m9xa2TaAo9A/is5Jgvm4k9vgaZp?=
 =?us-ascii?Q?U9p+P1FW6sjIt2FsH587BPGxKZc9t5pC8HDUujdyxkJS05Q2d+jbqDZgNL47?=
 =?us-ascii?Q?dfAJehARupNNSjMlrBiG9YLkjotpape+U5pPO2os?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebf6e83-3cda-46ec-ddac-08db6e9c4aec
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:55.5605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2Ctpc48InBh1CR88+GYB6ZZCxFIG0VeYri6jzytF8Iosqo7NQYV39vk+l+RxVAK
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

This is used when the iommu driver is taking control of the dma_ops,
currently only on S390 and power spapr. It is designed to preserve the
original ops->detach_dev() semantic that these S390 was built around.

Provide an opaque domain type and a 'default_domain' ops value that allows
the driver to trivially force any single domain as the default domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 14 +++++++++++++-
 include/linux/iommu.h |  6 ++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index bb840a818525ad..c8f6664767152d 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1644,6 +1644,17 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 
 	lockdep_assert_held(&group->mutex);
 
+	/*
+	 * Allow legacy drivers to specify the domain that will be the default
+	 * domain. This should always be either an IDENTITY or PLATFORM domain.
+	 * Do not use in new drivers.
+	 */
+	if (bus->iommu_ops->default_domain) {
+		if (req_type)
+			return ERR_PTR(-EINVAL);
+		return bus->iommu_ops->default_domain;
+	}
+
 	if (req_type)
 		return __iommu_group_alloc_default_domain(bus, group, req_type);
 
@@ -1953,7 +1964,8 @@ void iommu_domain_free(struct iommu_domain *domain)
 	if (domain->type == IOMMU_DOMAIN_SVA)
 		mmdrop(domain->mm);
 	iommu_put_dma_cookie(domain);
-	domain->ops->free(domain);
+	if (domain->ops->free)
+		domain->ops->free(domain);
 }
 EXPORT_SYMBOL_GPL(iommu_domain_free);
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index c3004eac2f88e8..ef0a0000f09326 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -64,6 +64,7 @@ struct iommu_domain_geometry {
 #define __IOMMU_DOMAIN_DMA_FQ	(1U << 3)  /* DMA-API uses flush queue    */
 
 #define __IOMMU_DOMAIN_SVA	(1U << 4)  /* Shared process address space */
+#define __IOMMU_DOMAIN_PLATFORM	(1U << 5)
 
 #define IOMMU_DOMAIN_ALLOC_FLAGS ~__IOMMU_DOMAIN_DMA_FQ
 /*
@@ -81,6 +82,8 @@ struct iommu_domain_geometry {
  *				  invalidation.
  *	IOMMU_DOMAIN_SVA	- DMA addresses are shared process addresses
  *				  represented by mm_struct's.
+ *	IOMMU_DOMAIN_PLATFORM	- Legacy domain for drivers that do their own
+ *				  dma_api stuff. Do not use in new drivers.
  */
 #define IOMMU_DOMAIN_BLOCKED	(0U)
 #define IOMMU_DOMAIN_IDENTITY	(__IOMMU_DOMAIN_PT)
@@ -91,6 +94,7 @@ struct iommu_domain_geometry {
 				 __IOMMU_DOMAIN_DMA_API |	\
 				 __IOMMU_DOMAIN_DMA_FQ)
 #define IOMMU_DOMAIN_SVA	(__IOMMU_DOMAIN_SVA)
+#define IOMMU_DOMAIN_PLATFORM	(__IOMMU_DOMAIN_PLATFORM)
 
 struct iommu_domain {
 	unsigned type;
@@ -256,6 +260,7 @@ struct iommu_iotlb_gather {
  * @owner: Driver module providing these ops
  * @identity_domain: An always available, always attachable identity
  *                   translation.
+ * @default_domain: If not NULL this will always be set as the default domain.
  */
 struct iommu_ops {
 	bool (*capable)(struct device *dev, enum iommu_cap);
@@ -290,6 +295,7 @@ struct iommu_ops {
 	unsigned long pgsize_bitmap;
 	struct module *owner;
 	struct iommu_domain *identity_domain;
+	struct iommu_domain *default_domain;
 };
 
 /**
-- 
2.40.1

