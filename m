Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9057339B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:22:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qEDO+Tbw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTZR3BYwz3cbh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:22:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qEDO+Tbw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::62c; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2062c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT8G6PcZz3bqw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=io+Z9i3M9k+6nRYLrZGtMydKugdFleUuP3jylGyJxP9jSKrR2Hvplr3OXoKMijhop30lHWtSDlxwlvWkQV3Pea+3gZHzFuGD8AVbJu3GL4xJucfUUYEf2GEgFRykuWoOiUi88Xl3b72ii3uHaW26zTiF0Ai0hS5WpND4u4iR/mWY5OIgxkf4hUZ8GVtPLlXRoOloJpS+icPTRVDOL0kKCPtgDGWSUjifp1MYTdCA4ZY2gzezyVaO1cSOT26zO6JAW5fBAlhEDft5bM5I/snxdCPg06DFl8vCu8QqwOL0lxzWcUH+ALohS76JPUYNfdrcDJvUwc33VTeSZVv8coeU6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTIWsmIcZycPI7iiZZ7fmyAJtWycD0v37toHHV2MnwU=;
 b=ZJCwA2w9oS5hvnFvrhJIrBeXDq7olKHlbisJmfHQLVWu8t0Kz0GJu1dp3pTVHdHrcKsdn5ZEq841l7s32bU3bbDBV1GQ0EuNG/p/rdEY3cap7e1Q5UPwIahfq358gL4d6+XoRBiPgwHvqYcy+fpxx55CoHCEAqNs9cuVbLRyzN6P8otzzFFX+rJA08BKfdPkw+rB3/zGMZi6lKbQrubiDqquqnubbxbCyAtr7fcMeaI8FAwcolWingMsrHXwwonI+jK7SO5A7q4RYUcgzUmRCHhORUcIXVsQrrJCjFBwMdwuMBmBFF9McZ9YJscLA17zlgbS+JiCSiLKiyqInMAFNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTIWsmIcZycPI7iiZZ7fmyAJtWycD0v37toHHV2MnwU=;
 b=qEDO+Tbw3nFDPdBAGe/mfPbIqe8JWodwd9pS1E11z5C9CZ+HaOkkF5pwq9EIx604Azayy90gpYxZ9AF9PFaLDaRRx2ZenN5TfuVoq7Id0UjEE2Gbm43xFFqM8PJJ+Z9GdSjL7bIbx40oPaVQTo6+muWQ47T46lQqCQ2vlNxT2BG54tvC1dd6WTX4B/jN9L2SernWVtM5Yum7/vhyXmpDMUddEweqrzw4FWWSQwpcER9ENER2MkzahcDX9jjCueLHlp4pXAjbF+5Zys+IK5jFNZftfUwInqSlsDBDDvtFnyyPAHvs0yklYfhyBoDnoiZ5YHsIJLpw37WwueBR+DHHmQ==
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
Subject: [PATCH v4 01/25] iommu: Add iommu_ops->identity_domain
Date: Fri, 16 Jun 2023 16:02:30 -0300
Message-Id: <1-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:208:329::17) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 6917df59-42d3-4f3e-c84e-08db6e9c4af8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bkQ7XiiRdK85gqd4cOiWbiQ9WtLU3aKtpgC3aYz/A7ysY1PI4HVO7JiZCuNfZ54mh494zpRjscpTG48X6jGMD5kmYki+0r21Sv9zqkNpybXT/bi0o3+yTiWuG+L82JeF39nPzkJ5Xp9utDXzVves5gC7CKcVYkr6f00S3oqXhSBwYbQxZ+1u2lG/67nK8y4DBEFAE7JbmIYgrzZMC4cbYYl7DJs1WlwTssBLeMcTNkU9aptq3YOYghxXEoUDapKC+1lDZqbIOXbQ0TGgJmYcu1GDUsLETCsocqZVafPLIksKa77C7AWqWpkNhwBeYAmNmq4QEDOPM2YyZA4JWtnPZgpIVVwiVRqXDmUDwiCRY8eYJsFN5DsjZTy7ZmHZgG261ne7FPCdRHrhz0KtM9NknDE54EeboH/1cuKvTR1X2y88jaAtv7uEcq9Pnpy6kG6mNotXDJ4dkoFAgmJDMyrzFLIhzLFYJCPPGs3rDHP1o6I5e5OLaTvCg2TamRPvzUQLtZTEYssYbaAKMPZpkFsCiFjZUas4zmI0x4SL7RVH5ocJfQGmfhtwfQcZt2d61vp1TLbm3HpS1WVcceNm6rB9SDPAvPLs3q+VoSGDv/4MxIJoHYpoufpe/HSOB5mXlF8q
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(921005)(38100700002)(8676002)(8936002)(5660300002)(107886003)(66556008)(316002)(478600001)(66476007)(66946007)(4326008)(6666004)(6486002)(186003)(7416002)(6506007)(54906003)(7406005)(110136005)(41300700001)(26005)(6512007)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?v5IiqN8W0Ywfnv5KUtkkC7/XUd+FCw7KFSjcWsPjyKEc8NQHCgcWtzPB9tLZ?=
 =?us-ascii?Q?K1/JCzVpiaMpDa7rHHS2PcKHnWurDoUvjM5hnsCuNVQcy9DEwzuxfIbFHadn?=
 =?us-ascii?Q?VABivjUZHAfWQY6tdXxwlWJhhmIRXH1XML7wOo2vaZjzFWAcMJMiTaivg3qL?=
 =?us-ascii?Q?9NSZj2oBw/GK4kZaVkKRdrsLX+d1s42ABX0maOHo9XGl6HxmHt1TRezZ1DuA?=
 =?us-ascii?Q?HDnKj7w9jNqlvJCMKxnxw9p0WHirct1s17Etf7M5mCk4oKuUpdtQMOZGq0uM?=
 =?us-ascii?Q?nLoXAT7q485vR414P3YJhhfVnrvLcuxclGK26ZRYfXaBe1yMrMhdtWOGqcMl?=
 =?us-ascii?Q?oFQKbV5+7aFdA0MzhmV1xoua7CuUIkmwrxS4pyrhfRXIiTn0RBzNI9NWU10k?=
 =?us-ascii?Q?3SMo/V6cP6lIdoDo7G6aXxqI/xv3spe/uBOVE2H81iCK6HJT6Jh41HvitckH?=
 =?us-ascii?Q?1q2X9dWNGf073C9vlZmjSeJq5f1xdemuAHsANWD2+d82uqPMQHihe9wsPW0A?=
 =?us-ascii?Q?SErZv/U76BSQp7TPYFY5B1m6U80jrv3Sh83dbA3qe4nPLjESgHYDG+Q7cERN?=
 =?us-ascii?Q?6TfPVwtSenS92fa63bVrF5z1iL5BMt0gkrFTTdESC39sSaRZSavhZzCqvsgF?=
 =?us-ascii?Q?XBV2o7N4d65RlCxQHqB6h3xk0pDwJ80uSEF/qIt13WNcIsEOtProRi0WJ/Kg?=
 =?us-ascii?Q?KbtuwsBpAYMMeCGepCQqUepCRozBekO6e9fr4dI6IpYaK1yvyfG6Pi2NYPOx?=
 =?us-ascii?Q?alkujzT1YNW/S0rwPsO+/iLYEVTIdqTA1y5AIQ7Z9pSrsfEiIoqxXwiNKjpJ?=
 =?us-ascii?Q?zEDkK1jTU4DuZYhPXeoIzTYhOz5ZVlfktaY/+jX5f+HxLXYcK57WwXv7XT8q?=
 =?us-ascii?Q?PGw4q2b5u6Bbgt7itsuNIB/+HXCJaMmxC24pwJBG/Gma658frcUa44ME8kd2?=
 =?us-ascii?Q?G9leYZG4RdYRRsVDkUI+M5e3dMfRmBTt5/32kdSnHX9+u82BNlzvZv+Cptj6?=
 =?us-ascii?Q?Zble7wBJyjFmFCwZgGJHvp1S99vF5d6IKXnqSNFeMGULCPnIcXMmqwiPf/Wp?=
 =?us-ascii?Q?83k5PNTgxSJ2E44iWLFMj066bGYrjOCgP260NJp7qB0hW0hO6WxEpW+S3qxg?=
 =?us-ascii?Q?yezdjL/JIAd1xj0pjy3M3pnirYsvH0HJbHhOOhiShkukPci4nt4OIWg2LGhK?=
 =?us-ascii?Q?84D1aon+gFOvPpKLgXqImAQJ+pbSCJWEzbA1T3SG3Drtx13JXEHEmpoii7Gv?=
 =?us-ascii?Q?QAFhv8+wce7LdpNJA1qK1U4xN6Ht9yXpwsyOEzMXN4ff+kSf+y+7+xIE50Gn?=
 =?us-ascii?Q?/ItOh+IB41cZhkho8RviHsM21sRPSwzB1msjVbNwXXqwWWQrMND3zJcg1WVp?=
 =?us-ascii?Q?Q+NEJWNAco4j2OiGid3D8ebT09lchyg7j8teSEjU3eaNJOM2wY4A0NCsPN6g?=
 =?us-ascii?Q?5JCPy8ob9ymE/J3AG1LD/2AxYtRXuezTg2KUXHcHln0u+k5noTJiKo2RyvYE?=
 =?us-ascii?Q?Is5tyFQW7/jpGSykPNnCGuFouMTelbW1UOq+Q7Y5SfVUOjoZLOiJYecAXgH0?=
 =?us-ascii?Q?iQN+Ckba3Ar+2YMSajLPHnLHKN7GF8O5PjPJj/lN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6917df59-42d3-4f3e-c84e-08db6e9c4af8
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:55.6661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CWdmM1ww9hBGLBvwNZyT5nYkB3c20lfc/rXP8Fv3SmYuD3IpXrmU8oEEgGevVheG
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

This allows a driver to set a global static to an IDENTITY domain and
the core code will automatically use it whenever an IDENTITY domain
is requested.

By making it always available it means the IDENTITY can be used in error
handling paths to force the iommu driver into a known state. Devices
implementing global static identity domains should avoid failing their
attach_dev ops.

Convert rockchip to use the new mechanism.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c          | 3 +++
 drivers/iommu/rockchip-iommu.c | 9 +--------
 include/linux/iommu.h          | 3 +++
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 9e0228ef612b85..bb840a818525ad 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1917,6 +1917,9 @@ static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
 	if (bus == NULL || bus->iommu_ops == NULL)
 		return NULL;
 
+	if (alloc_type == IOMMU_DOMAIN_IDENTITY && bus->iommu_ops->identity_domain)
+		return bus->iommu_ops->identity_domain;
+
 	domain = bus->iommu_ops->domain_alloc(alloc_type);
 	if (!domain)
 		return NULL;
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 4054030c323795..4fbede269e6712 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1017,13 +1017,8 @@ static int rk_iommu_identity_attach(struct iommu_domain *identity_domain,
 	return 0;
 }
 
-static void rk_iommu_identity_free(struct iommu_domain *domain)
-{
-}
-
 static struct iommu_domain_ops rk_identity_ops = {
 	.attach_dev = rk_iommu_identity_attach,
-	.free = rk_iommu_identity_free,
 };
 
 static struct iommu_domain rk_identity_domain = {
@@ -1087,9 +1082,6 @@ static struct iommu_domain *rk_iommu_domain_alloc(unsigned type)
 {
 	struct rk_iommu_domain *rk_domain;
 
-	if (type == IOMMU_DOMAIN_IDENTITY)
-		return &rk_identity_domain;
-
 	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
@@ -1214,6 +1206,7 @@ static int rk_iommu_of_xlate(struct device *dev,
 }
 
 static const struct iommu_ops rk_iommu_ops = {
+	.identity_domain = &rk_identity_domain,
 	.domain_alloc = rk_iommu_domain_alloc,
 	.probe_device = rk_iommu_probe_device,
 	.release_device = rk_iommu_release_device,
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index d3164259667599..c3004eac2f88e8 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -254,6 +254,8 @@ struct iommu_iotlb_gather {
  *                    will be blocked by the hardware.
  * @pgsize_bitmap: bitmap of all possible supported page sizes
  * @owner: Driver module providing these ops
+ * @identity_domain: An always available, always attachable identity
+ *                   translation.
  */
 struct iommu_ops {
 	bool (*capable)(struct device *dev, enum iommu_cap);
@@ -287,6 +289,7 @@ struct iommu_ops {
 	const struct iommu_domain_ops *default_domain_ops;
 	unsigned long pgsize_bitmap;
 	struct module *owner;
+	struct iommu_domain *identity_domain;
 };
 
 /**
-- 
2.40.1

