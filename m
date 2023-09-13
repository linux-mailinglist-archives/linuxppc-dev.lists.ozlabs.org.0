Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2439279EA62
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 16:03:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qGHm/88k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm2Gw0KKkz3hP7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 00:03:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=qGHm/88k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::614; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1sJ6Wdbz3cDd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuvTGxTA8EQTsm/vkToQaVMbiRH82m1A9tMHGB5wqfosih8zUNLffkQx0oX6QjAlLYtDbaiDc7qhyp7OaoMTCEgPcQA4U+AJs+notAxsW2TMtfuRusju5/FNK5GHCjzYWaPN79QaQVBAemRXkMx1Yb9H9Ljp7QtntpSLjebfwbD7a08Jk8vAH5oWxgZoOMiCoMz6ihv7IBcCLn7JjwG9QaNaMWw3lGwfSQLq8p773B5MtPf3UcEXh88WD96UQQTgQH/iYrUjhG9PU+DvSw6CD1CEzv8+wHqgyr+hBUuCIlD7cJCBebm6k56a55EIU5EvTv2jh3YnfKuW8if3kZxK0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XScqXzu9h+NLyjWqlodoIumV8z69Ey1u8spg6VXNw3I=;
 b=aJVnTD5XrjQCtiqW+LxdqA1LNxI62GzUUHjBMqShP1YyQdeDOVEz7CPjaCCwXof9SIE6JgBaGjtgGSG25fCyztJLm85S+z4qelkRYtrdbAqhuPyUnRnvmyjk3/rItZ7jm6Gt+LbVU7HBmVc6VLrEvA9HL2+ompnjNUnLf4Y1OY0P8/7+nau48jH+OGsnGRySDlgnH5Ey4YELga6DfWJLR20Xyd1iCE6tx3JUN0WJ8uNSTobUxyZghNgRfJ5Bh172DBsej3hoZxXdLadCiyM5pXukCYHVZRCmq7SiClXuK5XRgMJN13rQAv9S3guxcZLvcicmjzptnSSMZ8Ebv1N1jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XScqXzu9h+NLyjWqlodoIumV8z69Ey1u8spg6VXNw3I=;
 b=qGHm/88kz/nIuTwkZBe5IGNptqLNrTkPxD6Q06u3QSAdcF9W0QaCeLl5etIMKnwfnfIjuMcIdHiyxLelLzzYQ5tAMh90uItA12MehQHky7s73YNSNfyaPJ+J1MmxKCeHMdyy8WRVr07yU/cpOj8fH30mL7PDW2ohHcNO2nHst9nRiWKj3w4F5amD0x+titcehi5fTSitfhbybf5DxW9TQ26TMNxsuWMfleJBaKfbN91zGawqtd+sWTGGVv0TKmzF/Y2PjAX+/4oT8S/tmEh/7eW05RdUMoWWgVQi9Wz6nCyUuuN/78zB9x99lQpI23cYnN3GVodKskcmBfdSJ5z5vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ2PR12MB7848.namprd12.prod.outlook.com (2603:10b6:a03:4ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Wed, 13 Sep
 2023 13:44:18 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:18 +0000
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
Subject: [PATCH v8 23/24] iommu: Convert simple drivers with DOMAIN_DMA to domain_alloc_paging()
Date: Wed, 13 Sep 2023 10:43:56 -0300
Message-ID: <23-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0021.namprd20.prod.outlook.com
 (2603:10b6:208:e8::34) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ2PR12MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: 24e548d0-78b4-4e6d-69dc-08dbb45f849f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	uaV0IeAQP0g+rcnje3jF5SV5eM/YsW6JLQ9kWqUvRkDByk5MfRmbQn++F4Jtbz+r9FsWJfR6Z2cSokXmFTU8BXBq1akUkFPzjs2uaySw36f7io8GKJNgHGN4sOn2645PxSA9kkd49Z/wUn2Zi8UzSYtwArubDiVlTZxwBXi2BaGBBrrAKy6IdAvBf5MCxXe2MEecnKqVsozC6unrchbrOTIw0xKEnQSzbKiSd20D647XhNOzMZ9emlsxWLxcEz4W3uoPVJbncSYQKvBqPNFfHfLpyEolrQ92Vm9m0qbNSPWkPp+RmiSrL1N2dbaahKIh4E0fuHulKywj4ZV/MtgR1QhCoA+9RwCBBjkAHy+oZ1/3Z08q8ioLwIG26eG5if7r2UdW/X51dLLDP2NCPW5IHkIP/35O7ktZT2x5H6a9DgWzU9/zMb9zhhFLHw+Ely5ZiGlBglgFDVEJgA2UaGf2/1j6CVbRSv41KvmqvJzwJtFdw9FWBcotjCWtSsP33uV772yYrlfXxPbjViT+wkPSpUKPLXQwOEWq+uhVHEAH2OuJavqOfuJUplHahzuZn6EWhbE8mL79A4cfGr5uFdHrvZdyTICM8tF/tXlUEjQYpx4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(86362001)(6512007)(921005)(66946007)(110136005)(2616005)(478600001)(107886003)(6666004)(38100700002)(6506007)(6486002)(26005)(316002)(4326008)(54906003)(66476007)(8936002)(66556008)(41300700001)(36756003)(8676002)(5660300002)(2906002)(7406005)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?up3eZuXr/WGzcaPTh+GMw278RRYe2gCfXPpPZIPKU4mpCAIBIaX6TR50wP4+?=
 =?us-ascii?Q?jjMxZvHsHq/2PlJC/6kaARVlPGDUM9R7knvp0g6m1G+qo1ZdF2wyuPrYypc9?=
 =?us-ascii?Q?qJBZzHzj+j4BOjQP+dtTbsz56Tn8Cise9ErCmsbn74Pu6kbD23NJQMQV5Ya8?=
 =?us-ascii?Q?6mdBs+IlEbjAmi3TsUtRSTR4znhOii5H5Gl33C+E7gYFyqe5ncW6qOvo+N0W?=
 =?us-ascii?Q?P6j3A1RLjn7FTQyvsKWXj9f3R6vWeAZdY7fkRmMGsYTTndrwjacUtnL250SM?=
 =?us-ascii?Q?/i/5a74XP7nDv1n3orLaN6qriBD87SPPKFxKQok6djxv5ZlCrzadMHicx2mt?=
 =?us-ascii?Q?3Fm23m6HOuGkJlSUlKnpwyzfjnnwR0396oAKtqhBLzFSh2rDNhlF2laAvyko?=
 =?us-ascii?Q?nSIeXLd7suIGjhJy+hNsQzB+0UQp3NkRae++d+DblKVAxiWGDeVd1EXD3M1v?=
 =?us-ascii?Q?xZvcOG5A9ldsK/iN3TFbXqlXyCCjh6B1C/T1ZXlaQjVPCfky5We5VsIevjCv?=
 =?us-ascii?Q?jPpxqPXbs+R524b9TaYQd519PZPxnAbLn6nX8k39M266obym/JqsPNRV2uTe?=
 =?us-ascii?Q?q15Lg7KW6B7CV3mPFGUJeJIMekhIq1RZPuxImxPFnHsLC5sNgqV6N+EfQXFp?=
 =?us-ascii?Q?yVH4xmUUQoqDFYyFX99/8OddXDORkoIs7Vo64BIYvJ/+w8tCFg3U/euTRuGx?=
 =?us-ascii?Q?gjDsl2BSwuK2vuypJcvc0C26XBQswNKNosWtfIlI0Tgp7S9JMbYDnxR2uk4d?=
 =?us-ascii?Q?lTCiGXIubLqR+ZUc9YbCmeBS0hO5iZ5vVTC32EXMkHDQ8LmsBNrxSL51cyXJ?=
 =?us-ascii?Q?LiS4a0KpMKA7iEGdRzz2nSXEAMmjYuRmMJG/HY1SUyRtg72Jp2fN/5ZYxoj7?=
 =?us-ascii?Q?fTyHUhW4RA2JMlOzbB7VN3MMS4wUhKxfGU7VX2oGwZDHaIeuntfXq2nmobqa?=
 =?us-ascii?Q?kxrKtxGD3Dd6fcMX44l2TxybESh0yXgDcVSYkHy1NKkHOZPBgJNuEo1ge+JA?=
 =?us-ascii?Q?2yDgxWPgnQorIV1sNaDDNmGHBBi65hrnZYBpY4mr5K088frXzipFqt0NjZDF?=
 =?us-ascii?Q?waLP276dAKyPtPNpJ8njbpJnVyJ9uq2AAmjtWg77Olbvuyj6Ohqr7T4pglQX?=
 =?us-ascii?Q?9q0bSUty74ZOsrUNlq9Pah12JTV/271i8FgRZMXR22T2A6VZNkcStekIZMdM?=
 =?us-ascii?Q?JEEjlrG+tEm8gpbo2S6wet/9nNQ32rtHNUy1A2hnaVnFf9Epjp/uUxI722/W?=
 =?us-ascii?Q?aAipft1AE7KntgZiMs1NugFOpbywaSJAcj9/eGGRrobhgrF5V4EckVitI7bN?=
 =?us-ascii?Q?6IcS5rQ/yBPxqacmSoVSaAIYk4dCZ1ouCi1VBh7yoCOFPQPQxCN+NiWGbHGs?=
 =?us-ascii?Q?VqulJjc77Uif6DU6u6xieDONmUGh588dq+v3PxaEKCsYXprNZXVGCQfvbJbz?=
 =?us-ascii?Q?tP76zpu/3rBI1m+c5RdPvCf7dinHxKE88L4JVJKFewD8xPVYZRZdr528FCj4?=
 =?us-ascii?Q?bU6nKpXL+yz3as/LNtW7JtbC1w2Ur8ns3stPkZHaopBhOB0Bd8IaWjeAwtIC?=
 =?us-ascii?Q?tjR2aHawX/nFLoy7BOP2cKNefefkPtAMo57eW3FE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24e548d0-78b4-4e6d-69dc-08dbb45f849f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:44:14.6644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkeTLO9/FEHJuIy67vTtfIaW+c7bY7/+3oenAmQU3w8MJkLYVRvsshppEyzJ903g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7848
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
Cc: Thierry Reding <treding@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These drivers are all trivially converted since the function is only
called if the domain type is going to be
IOMMU_DOMAIN_UNMANAGED/DMA.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
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
index bc45d18f350cb9..97b2122032b237 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -332,12 +332,10 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
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
@@ -605,7 +603,7 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
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
index 04830d3931d239..eaabae76157761 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -563,13 +563,10 @@ static irqreturn_t ipmmu_irq(int irq, void *dev)
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
@@ -892,7 +889,7 @@ static struct iommu_group *ipmmu_find_group(struct device *dev)
 
 static const struct iommu_ops ipmmu_ops = {
 	.identity_domain = &ipmmu_iommu_identity_domain,
-	.domain_alloc = ipmmu_domain_alloc,
+	.domain_alloc_paging = ipmmu_domain_alloc_paging,
 	.probe_device = ipmmu_probe_device,
 	.release_device = ipmmu_release_device,
 	.probe_finalize = ipmmu_probe_finalize,
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 164f9759e1c039..19ef50221c93db 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -689,13 +689,10 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
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
@@ -1019,7 +1016,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 
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
index 2fa9afebd4f5f0..0642f0a3a32ab5 100644
--- a/drivers/iommu/sprd-iommu.c
+++ b/drivers/iommu/sprd-iommu.c
@@ -134,13 +134,10 @@ sprd_iommu_pgt_size(struct iommu_domain *domain)
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
@@ -421,7 +418,7 @@ static int sprd_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 
 
 static const struct iommu_ops sprd_iommu_ops = {
-	.domain_alloc	= sprd_iommu_domain_alloc,
+	.domain_alloc_paging = sprd_iommu_domain_alloc_paging,
 	.probe_device	= sprd_iommu_probe_device,
 	.device_group	= sprd_iommu_device_group,
 	.of_xlate	= sprd_iommu_of_xlate,
diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 0bf08b120cf105..d6629b0a9389f4 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -667,14 +667,11 @@ static phys_addr_t sun50i_iommu_iova_to_phys(struct iommu_domain *domain,
 		sun50i_iova_get_page_offset(iova);
 }
 
-static struct iommu_domain *sun50i_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *
+sun50i_iommu_domain_alloc_paging(struct device *dev)
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
index b91ad1b5a20d36..1764a63347b046 100644
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
@@ -991,7 +988,7 @@ static int tegra_smmu_def_domain_type(struct device *dev)
 static const struct iommu_ops tegra_smmu_ops = {
 	.identity_domain = &tegra_smmu_identity_domain,
 	.def_domain_type = &tegra_smmu_def_domain_type,
-	.domain_alloc = tegra_smmu_domain_alloc,
+	.domain_alloc_paging = tegra_smmu_domain_alloc_paging,
 	.probe_device = tegra_smmu_probe_device,
 	.device_group = tegra_smmu_device_group,
 	.of_xlate = tegra_smmu_of_xlate,
-- 
2.42.0

