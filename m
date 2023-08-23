Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F6D785DF8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 18:57:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=di4sX5Dw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWC7L5McTz3dGr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 02:57:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=di4sX5Dw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::619; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwl2vvRz3c5Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J5hPSa+1K3COn0FfQvq6qa9TGPvbRYwKmc7c79uiXEOK9yLFP1md7o6JXNDghJ/IYi7nhARt93CC/sUr8N78q8e+r0FCo1svgk1ou+FUZEBQ1e1XuPr53wMFJhTM5NP06SiodDm+jGHnTvCMxWTwVbig17zHY45015M74W8bWPhHMUkX3nwnXSLnuOZx2QgfbPg7Ozo1mk4GacjLmtpuuFL0nch2YG8JSI3MaMCcjL41EKNLvzsLrUFliDCeFAt5fOD/bHWcokhsWPsh4sj8L5cziw9J5vm6JQNf/Cit/DDKg/aK7A5JGJ3h8BKetsj/oe878gU9lKucDRA4R90g2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvHt3EDakw3FBvt2FLSJ6JmBOxjcBrgHZ0z426IsEUI=;
 b=GbOaEgt9/ZLf06nIAsynI3D5e3uuarm9/woQJanf2NpKyB3U3YV+KlV+x65zWHbSCg8oTxukY25IZrXNS5uZ3Pm756j47xupbfFQ54rVuGRveSdxl8n++nRV928p7Hk39o1S5gd2e+V2sdeMpQndsBGkPFvkyGck7Sl0GkpBjzPuaW96QZ3XT+mLefyj9dT+iUjP1DjPrpEq80ZiiOGZFXejIG7khNfcJV8g14wwG2BR3LBWdfyxw3htwij64EMBvSxKSy1OjSQ6/BFlQyeuWZQQG0ZIf+sIa8wEfnr4VL/5wSeKijSrVKoqJeKE/4M2IQyc3WFcTd8j4cAzSci/xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvHt3EDakw3FBvt2FLSJ6JmBOxjcBrgHZ0z426IsEUI=;
 b=di4sX5DwuLvAhizUs0k5MWXDXfkUNnwQJpm1DEt1iK3Iqx9qwycqa2mz2oJ+ZmbRlOkXG8rk9AWZdp8FUTH6zayVmSmeu/ASZVnHruQKynMfZ3++XF2aqK3scI6YapXFGIE5K+EWUG38juQsQ21N8YY8zx/wDGLIqPPUDC1RNPGpRqCuk7zpY2IpuSHn7qhRCzJxi4sIyFveRFsV+2zaLD5OMGDJJ/wa3G7tCkH+FyRh3xVhNBEv4Dlz0EA7F9hmN6DKnBkKS2mnoTdXxQsWVQjHAaVRtYyXkwTPsNhwyVFSubwN1NyDsiNaI2Sh+RINmMUpmPG+xvRD4zI5g4U21Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:50 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:50 +0000
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
Subject: [PATCH v7 04/24] iommu: Add IOMMU_DOMAIN_PLATFORM for S390
Date: Wed, 23 Aug 2023 13:47:18 -0300
Message-ID: <4-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0407.namprd03.prod.outlook.com
 (2603:10b6:610:11b::34) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f66e69-f005-4ecd-5165-08dba3f8aba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FJDeUIB4HOdKcjNcXpYKj1hXiNGfUWZF+4QlyiKWHsU7vadh59aUQzp4H3THu9ii9rPzE6lucU7WfjAJo496qSRLRX5Ysy6pzFgSWP14w5q6GADmD40rMU2EejsBqC+8L+HmcUjaV40XxulV8Af74fpmKl5a8MdzkAsAQKeG6X8joCHKWVWuuH8d1zEcWyD3uBiQbj5gg7jpZ0jFojVRWnopLIpS4xkNjPg4fkrQiUQ5XxmT8K7H5f/8jTEitnzodC4Q9TEAShSAEi8mSi8YeH9k+Wh4votB3GQtTBSSHN8EeDvwFSnXjWcg3e9UVegCo1ItmJu9aGE0b/3GIAtO7tyOMFfFM4ZUXZbAGaduCNtuZ6mkBEScUdzfyl/OFDU4O0Lv+2BcGRdZFkL72VdKVhl3slcJF13flK6sbwLXdnyzbDJyaat01jLmsVAxGLwR6lkehhK9oCgFKUe0zkX6FL9Pyfv37cS4r1XxMUyKP+KM6qOc+9kYvazt4EeVAu+jeFpdFPYJJMYEkBGLaWyvniyyDSrHhj5CSSJJLdhPXNL555PoA5jEJZsUwx13qHCkMyTtlyViYNdaknX346x1twVyjYYCA1trzwz0oqmHn9T5Defg4gR0AUrEznYkJKWX
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?sVmr8BVLSHZj8CEmkfDyvg/9diCzffs8b37NelkjjDAmfg6hfzVKZnW+yJew?=
 =?us-ascii?Q?K3Bm5ImwvxrXZKhYYwbiuHSdfSFjj5UI7QNj1Jm9Z0h3oFMLx3tRA2Avl/1l?=
 =?us-ascii?Q?gYOfU5/QxSdv+6qJ9smHRNsVpUQ9F+yhqhEntdhf1ryhme2gRFrA3XR4gj84?=
 =?us-ascii?Q?lLxpNj8BOEfes4XHccWcjWZzP7ygpoI99wbs0ijqkXTv0lBB+B6h0qr9cYjD?=
 =?us-ascii?Q?FmMabDmvn7QBH2NQBwt+qyUm4Ix+1As50WPFpmx67osF6rvkmJFmy9BXAZsH?=
 =?us-ascii?Q?Q5Yfz5V0VqfAGOPS6/sN9AIi0543jFe2sE8ciQb2euQ93K3x45G6OE4S/UX0?=
 =?us-ascii?Q?Hfw3IFuhx7ZAWu5H5FUyRdVrp/sc68GPAPiuRE3axjO1WjQnjYgDtSh4PifL?=
 =?us-ascii?Q?6KriA+E44+Mop3va1PQeSeXKu4Glh/KSCydd0BrTF2E+5Mft+5NwCBHiaR76?=
 =?us-ascii?Q?AspjYqVN2+lFvGnV9Ied0k2QJUfTYDOUHzg5Of8MMOQevRKJ2isrP8slD2yN?=
 =?us-ascii?Q?FtUdfog1XiuIrqPUG5e2BJv1vKRnyvbsyr4EU0KfI12kXFtfsxSQ5twNSII4?=
 =?us-ascii?Q?lJ+ypl+x7CD5h9bM7BZMY59IZv3N5ZS9tQR9Qei+yK6zUxtDnDSS9W6tVyb2?=
 =?us-ascii?Q?rCjUuOTM8T59ynDQn1ehAFZI03KE4BJM1YZ1sON9zVHWVsHp+7FUimAZvoQh?=
 =?us-ascii?Q?HwyhCgdLlvkKfvsXvWscU3K9tw0Ufvc5qIWv9jfa8SOH4eMEXXb181GoB6Vu?=
 =?us-ascii?Q?EOqIQwb8y72wlFfsnTFq6kR6UivDQVyVPh914vsViJn/lbYR6+wBiBv8hvwa?=
 =?us-ascii?Q?ay5m3PQ49g/vcKatctKDzJAAxug1aXxXCOMXC1PkB4jr+in1BRDKEcg122Vj?=
 =?us-ascii?Q?JLydQQQJJFZ0ollbpiqlzr2ddQ2DtNI8Di8lxP7hRH76EMWehH4dQHCJTrFk?=
 =?us-ascii?Q?sI7XaQaPPZ3cznlTlBd+X1A2gi7DtxZAA2raOQHYZAxA3jXyZUPijKA2txP6?=
 =?us-ascii?Q?fokVMJvxtbNjR8SB9a0I5+m+WruxkE2eXXZ0633V1prv2vQCxx9QtIYRXVZY?=
 =?us-ascii?Q?jmcIHnzL+QEQCginy1r7idXtOTXt2a5BP7hSj6UcBhB1FINHAIVi6BpJcPSc?=
 =?us-ascii?Q?Glo9AoaxEvnMA3WORxDnFh58kPs4XnMZs1Sgyrsbn0zKWf3Vmlh1oVXTmUJJ?=
 =?us-ascii?Q?2CQkzooM062DJNSgR7r78Wj4ttpFfgDiu6cnjepEHcf3lgA5BMk3FXU4bhJ4?=
 =?us-ascii?Q?aGPtNk+Uyh1LSarrsRAkS48Dt7e7FHPZyPSi1fbHQVM+A5yC8yB0e2/BDWLn?=
 =?us-ascii?Q?v5AJfbomNChi86NZr529waEgR7uR2tsxgecGlKzo1NqUCYIVDHwImSZNl4Rk?=
 =?us-ascii?Q?ycy6KjFXeppmizBKMhzfGGvxfNaWg2mmurPECqOchGfouI4k99MRnoPBLGKf?=
 =?us-ascii?Q?HqBitslobEAOqatKELgLQE7RhCM8PpQ5S4SuvyFXa1khtofDACKMqi6yZu1/?=
 =?us-ascii?Q?nVoDklvDUFEMBKaFDHbcRmFX1dvcgKoVNxVVuxIezZ1FoohwWIct7fqfqYPc?=
 =?us-ascii?Q?FPtm1s4S/hrPc9FiQ8vVkMopMlzBXmFkqQDOlnIk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f66e69-f005-4ecd-5165-08dba3f8aba4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:43.3686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5kaGt7oucMlt3HqmWb8a7BVhx05vWhm4DSAQhfEVf5dr82uZcFVQIu6frJY8CV6e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6346
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

The PLATFORM domain will be set as the default domain and attached as
normal during probe. The driver will ignore the initial attach from a NULL
domain to the PLATFORM domain.

After this, the PLATFORM domain's attach_dev will be called whenever we
detach from an UNMANAGED domain (eg for VFIO). This is the same time the
original design would have called op->detach_dev().

This is temporary until the S390 dma-iommu.c conversion is merged.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/s390-iommu.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index fbf59a8db29b11..f0c867c57a5b9b 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -142,14 +142,31 @@ static int s390_iommu_attach_device(struct iommu_domain *domain,
 	return 0;
 }
 
-static void s390_iommu_set_platform_dma(struct device *dev)
+/*
+ * Switch control over the IOMMU to S390's internal dma_api ops
+ */
+static int s390_iommu_platform_attach(struct iommu_domain *platform_domain,
+				      struct device *dev)
 {
 	struct zpci_dev *zdev = to_zpci_dev(dev);
 
+	if (!zdev->s390_domain)
+		return 0;
+
 	__s390_iommu_detach_device(zdev);
 	zpci_dma_init_device(zdev);
+	return 0;
 }
 
+static struct iommu_domain_ops s390_iommu_platform_ops = {
+	.attach_dev = s390_iommu_platform_attach,
+};
+
+static struct iommu_domain s390_iommu_platform_domain = {
+	.type = IOMMU_DOMAIN_PLATFORM,
+	.ops = &s390_iommu_platform_ops,
+};
+
 static void s390_iommu_get_resv_regions(struct device *dev,
 					struct list_head *list)
 {
@@ -428,12 +445,12 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
 }
 
 static const struct iommu_ops s390_iommu_ops = {
+	.default_domain = &s390_iommu_platform_domain,
 	.capable = s390_iommu_capable,
 	.domain_alloc = s390_domain_alloc,
 	.probe_device = s390_iommu_probe_device,
 	.release_device = s390_iommu_release_device,
 	.device_group = generic_device_group,
-	.set_platform_dma_ops = s390_iommu_set_platform_dma,
 	.pgsize_bitmap = SZ_4K,
 	.get_resv_regions = s390_iommu_get_resv_regions,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.41.0

