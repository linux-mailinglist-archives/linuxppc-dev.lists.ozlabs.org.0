Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A4575FDE1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:36:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=T8tKjnQS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nQd1pKqz3c44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:36:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=T8tKjnQS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8c::629; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6c1C4tz2yDd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbAPqXypk09y2v8bOFfzhr1z/gmdDHiGn2HIleckPYbCf81a7/flZViIfkvxTLUQjKpIJkrvN2/QBfDICgQC8yCMwkGEuWJH63AX1lwDtmimdZC7LVrHO1dhVHXEmDbwD3f1THRaQyP3w71LXekhYV0MW3ORetMAJ3XkMG5zeQdJ2wD7JLVSFv+16TQ/q05QtYsBXr3LtDxivOtbj18aDrRJ9YVwEU3SPJpVOLbEYQ24mgTtog8Y5iGhy2EZNSgq8kdC8VrUZNq99xKr1NFnERCYV9m8V/YRR1/9wK4jQYGdyYUVYTTGi4bkzTbYgJx0E1TnPhkCzAlyb/5NjyS59Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0slDXFYbJM//zyjPKYXqKC9rH+RXKJstRFeiCBm71E=;
 b=ETxxexAAwGbDJOCiAoipj5DyK3P2w1sUGPYa0lqnyJ1AUvNWF0hBATcsBeVzMFipwiN/+/oN1JQ2M03BSOIb01aeK7s7Eck5bM+DDAX6PQnAch/0a/mNiuRZQD8oyQSrEWyOI+Uh7JY5MCULPo4badt10vHWdjREQt+dxUZ1JjtWf5gkpTq+13cA1366aKMC6Eyf518406rl/yrTo5Ov6E/SyPvzIoxfsff13qFNNfvdlKi8lo0STk7nSBx9A2Gk7XS/aIV8qEWzp3O7KCcw/1UAbjIixmVxRlI+nz8kakQTJSFsq3tE2u8K40Mu/A5UZ9PtMU+gtIXRtLzLW6Ixnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0slDXFYbJM//zyjPKYXqKC9rH+RXKJstRFeiCBm71E=;
 b=T8tKjnQSRAPVsgdXdID+LNateY1n0CaqaGifJTgCOAeRORpnAxGDoOm2Ii06X8Qh0iz2kTjWbtrvAz+TNW/S3pyBT5VkvRrRbIY0TFXElddnJXUiJo4QQAV9aDi74ccRDMiMtsnzzSiGiAqfCyhb1i94LbtyYsSUigAqb8FBXEQeb8BhhcsLRENx604ZgfmacCOr1CqdgaKjh5gu9LkNGK/6IAlpkl4WCz6+G9mgK4+AVGGS90SfTBpevFjPU27xBgH+2CJ+v1++XrlHqI8nHA+SxriE602DZWYGD+I207JqnIw3/rIBpzzhV4LHFmNzAEgcsjyCtKU1Jp/k2lEZ8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5252.namprd12.prod.outlook.com (2603:10b6:610:d3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:26 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:26 +0000
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
Subject: [PATCH v5 13/25] iommu/omap: Implement an IDENTITY domain
Date: Mon, 24 Jul 2023 14:22:03 -0300
Message-ID: <13-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:208:2d::31) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: b805c3a9-79cf-4887-c04f-08db8c6a88c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	LRcLjbh7W2sPfsk3s5LrfHAiOE9C92rLx+sNpZAqkijijuwHcUVKjJfas4n7W77zkaRSM1d/NCaDwFAK/DrJK/uyHkLyFp7BuCM2QmSm9rqBWt/DYK5M1nWrubtfJfYt/6W7kc9u3MeSJ54BfT9g9Y0wWRSqUDiXOsJbTnM3kFMctDpDvj8XJWmEKimJUemNw6VjVANYj+sx5L+uXyRJRwRwCrc8P0bjm+WI86AuSCWQpdsC8hT+WujzwZ4oQwjbUwsD/pzuOnhGF3gwiK4ZYO9g6Qz04/yJV+Gu7X+DVzi/DsDjJk85UmwDhgLE6N4Dj+s2bjHM/RDVOVybdvjpigbWd5WwuQs1wmryozXq/zkBM+vkPrbuiR6WdjT7fxLm3vmOR41u+PYSbA2CZ15MRvlfkEbmWZjZL5bRJm3FU4esLszbr7h5wAq2WnxiZxBLtIzs+zpxds3urd4fNRPhYbhbGmEgWzgNk3FxKylwULhrVTlSzEnB+zLQj+KewWyYJx1mpBOHzoAPM0eFKjX27S3NQghRL4gKlKRzMF+qpPwenLmkvD5f/IZ0fNrmdBJA58eC42JmLR/bV1lBhwLJb80E2HfphdetHtvgIU4lryI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(2906002)(2616005)(83380400001)(4326008)(316002)(6512007)(66476007)(66556008)(66946007)(107886003)(41300700001)(6486002)(36756003)(478600001)(6666004)(86362001)(110136005)(54906003)(921005)(38100700002)(186003)(7406005)(7416002)(8676002)(8936002)(6506007)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?CCgioyyyZfBr0WDXE3jo7hZqWDEM593O1DcHf2mMzCLONYvIAarYj8eE76g1?=
 =?us-ascii?Q?yzN01sNWuEkQJO/AUSpJj6eCLgaEWJSIS26y7jlTlV+aVdVZRYaO3JNR4Imw?=
 =?us-ascii?Q?vDx3Sgdq3p9CUB8Yaub05JC4OHc4N/ULiRsT6P+NuWog4cWMpmGPpd6TkaoN?=
 =?us-ascii?Q?KTvFw8jTqqh+i5qG3elAPH0olKYdQlp57kV3ez3frVI3XSvrY3i41kxEkX25?=
 =?us-ascii?Q?4DNEMO6UO/irSRxLyVi/N61rxtA777yg0KEK6T68xryq/gjAnf1lOWbzGcN+?=
 =?us-ascii?Q?LSXZiqBnRfAh+8JRJw9Yc9VxertV4N/slUqov/AgvGpJBNvJCEC/9z9aaVd3?=
 =?us-ascii?Q?0PjIbtEJ/s5Z196oeAt/c3Qry/b+sXL4ByHkucA6wdhuS/XDr+kQ2O4hdr3k?=
 =?us-ascii?Q?qbXAjpZ8x8ROvKCb/8HAbLG1bRUm1EEkEzJ7ClyGkQq5jtRPSksgU65vS2jW?=
 =?us-ascii?Q?VyoYy7+AXbs2w7dAAraZpmWnl+wvF1GFklalqmxefcErIrmcnW1o05nZzYyE?=
 =?us-ascii?Q?8bR+Dph89qCsyszS/jHeZtQYWAYXWNKmIA97bbviJACAfYqbvAMr3QHJwUJG?=
 =?us-ascii?Q?7jPYeJ4JsrJRoB29b7qyJWBJ6j5d7g365Ka9DsHJiJsorTjixEga3VfxYB3y?=
 =?us-ascii?Q?ri0mSTzcn2gsWvbhEK+/txSXDR8mtJa9NG2Y0EYeW4MxWqIhZwpZM/Yo4vX4?=
 =?us-ascii?Q?JNT/rt+3CV3LVwa0G/cmhZzRCYZDXD6hMCOIX/VamQycckf84GejP1Jl0CRW?=
 =?us-ascii?Q?WQnbdqQ+3kmrRPLrCiTqPxp2sA4Hpb+EBkVIxPNGZSh0xkygW6cNx1wfML0R?=
 =?us-ascii?Q?X5MwxSHNLkR4zMFNV78A06hbXNwNQxGeYXS0OO7/i0ZM9Srdde2z2NVHeKLo?=
 =?us-ascii?Q?VkZCXse4Vs2flqyaSj7i5GSzZYUpngiA+DcoLtynYZdaj9Gs139ZYGkrOP+m?=
 =?us-ascii?Q?DfeotzEmGHxh1W79RoSvZOJjTImci5km7TCsWL1NGSO2FAkNnYrDUp7KJdi+?=
 =?us-ascii?Q?1pansjNl0ziyo6Mk+mY08KFIXa6FMlvEtyXptwhz56+MHa5yW5qZcXM11PbZ?=
 =?us-ascii?Q?HPUlFVYg7Ad+EzuoGco7JfSElmz5kBR5MIDP2/PPP1rjjXn9YiMITdiBhN18?=
 =?us-ascii?Q?5PD/6s/1X8PrSWhoJ5rpzStJX6XS2hbl+3T7XSN7gglbJ4NxvGmiXOj4h5QS?=
 =?us-ascii?Q?mApCMxOLnAIdsng+DBtBzyZGHl/5JoJE8wPIZBMQTt7+jKLcB8+BCtfDTrqD?=
 =?us-ascii?Q?rXOtQyBgJJbyogF3LWE0pYpDIy1Aq7CE6PQdsCBTBD466qMmpZTVWJsUVZKm?=
 =?us-ascii?Q?dVYPCTpKldR0zZG4/5fW1TkJLZhgCP1v5GO61y8DNaAPMw2ZmT/ACMsEWZ0n?=
 =?us-ascii?Q?fgjfOaQgi7PBKM8cvCGMoLXcD5qlbfJwCSDMu0eypXV3PEsvc8eA4EGFjJLv?=
 =?us-ascii?Q?qTpTIt6fItP422ZM4lt+4C7JjMXRdz3YFc8zqLz88XIwFHNLJhYwSI+AwROm?=
 =?us-ascii?Q?cj7TcjsRJAtPVAgSJEtL7iUB5c9FaydvPMNFQokW+Poatw//VPAOFOF7w4JE?=
 =?us-ascii?Q?3+jyfaT7FB04IGdTMsxIaS2TDBLZEo0BLbaF68EK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b805c3a9-79cf-4887-c04f-08db8c6a88c0
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:19.5081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: le/kmrH5b0CVWNzoWl8ShYsDdVQj600DWVTgtAXOX8L8ybyv0un3t5lFIjfHCi6G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5252
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
2.41.0

