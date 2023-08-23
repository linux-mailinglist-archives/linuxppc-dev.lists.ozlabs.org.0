Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C44F785E16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 19:07:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=amLv5itv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWCMW1wRgz3ddc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 03:07:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=amLv5itv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::61b; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwy4zp7z3c1H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hX54IoMTspN/Bx5JjDQI9LPr2gq5LA1WdPlBmeW3YuIGpD2UidsM0UiFk3Fj5IwPEK21LS1n/YUZYY3bEZIhgpjTNIvKTOSsurtArdgOGLIddGNdSxioOnJykKJwHZUVDCCBJIJ8iUDaVguuSWqo8yidEj5A3ue0FPAscstit3oLRQdq6u8pkUdC0IwR4iGHYhOLCPIiq6sXA8nBMJfoXCzVeGlf3OmQvhFoqVM/gd4+oyJQBtFRyO/XCfcBfFjrvm/d5kvOP28iswd9YMUO0IssIRX44FL6g5I/QXx3sfm5feSrmOFIYWqlBiHH4u51p+mRyJBubb19o9ZbzwqMEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J9zfpuOl8syD6to9mYU0Bb52J8zrmWQpQdhuQbCQze8=;
 b=RKV8og/MNoks8ZywF9U1846ortUr+xoacUnrytli4i2MaZHEhGsXrIaZVbJUMAQkQz9doEakF9VHJZKVvduuxF/A4PH/bnpxVCXbSSGSPzbkRCfYVty0CtBApR1jdMMS+rRGUFE75oqbIWk2BMYeyel2EmKDUUl6oPBmuPzFOs+CwjNSVaIa6mGeNX0jiSOJxB0sOji7SBzcXk5vBXFk51oZ1p4sB87xh5sSKliinO6dtxPL3r/oH16nR8Y1AM4wj4OLXfS1vk1MxmGpkNndOdoyxlNgVhbqMlYnjp1PmYOXBVpf1DbBGymTkvnxrxKPr4FkV9uY0j6WOqHnq53ryQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J9zfpuOl8syD6to9mYU0Bb52J8zrmWQpQdhuQbCQze8=;
 b=amLv5itvdJbfIQeep98zMsJAMDjL0X+pDG+dfP9tM23zfyOkWXaQLFHJNL9LwCaW7OZTqRqHqyh5gmQnP0rVfo6xHojRbP9dOfQQ+v7L/FB8DI1hhu5XeLSlTbL77jPzyWb3IyTsyZvGyPKu0/0QTkxx3ex5bDosPd4ltjEh4yQpaHyEE0Q91o5DYI1cYFXaRJxCXdzTj+yiN+FcUOBtvOaNX5JJ8BP4Q+37tc02zbhrw8t6ABT6xbDX4rFFiziFwlMTtUgEY/TxwZCtniw5mG8MBfhWtrLN6aGHrLTeXvIxViCO5AZRCKFRpWC2q0XCulEAGc3osNE+phcJMmA8mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:45 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:45 +0000
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
Subject: [PATCH v7 23/24] iommu: Convert simple drivers with DOMAIN_DMA to domain_alloc_paging()
Date: Wed, 23 Aug 2023 13:47:37 -0300
Message-ID: <23-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:610:58::25) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: a2e1d069-ed7a-4719-9278-08dba3f8aa94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	x1tgNO4lE3pi20zBIa8LcMsKIHMWX7aiLqFMWa7lKfSBNk/J6FL9bnvlY0wpESjlYHOsmOiZpI6wD6ZFR667AX1ox5PDJ8d5Q1OTVqG7zM7feI/fAAyIYxxyn93VT1SiBo45IIsUx5KPmjgp8mX1djpQANvh5q+1NCAIsGp/Mp8pTB94kcLUKmySP8H36MIw7ahwexelplEpeHJn8xEMO63SQyBXchYl2vfB6c4//CjmVUKOV6r/RiffiYBZN2KQyk7JL7FU6j4SDnYXUcPU42pxO1vjuCg8DB8wCbGerzV0XrvADbZkdUJPZn+kdjgjyV8M5k0O6TZHJ4J/hDLzmfX7R4fnQvOYsZbpD5wGrAHQEjCkj0dcOZSB+Rfy0bnlu5hRz0CD4q+bjCIoZozZxlqMeMryG53nkvGNSD2Y4jlKJ3jEsWxzOS9nJLPU912V7MdimJ+pj6bq3u3L5d3zIPDJYK6tpqdIaz80f92MJaFsogz17MuFhqf7Fc7HmuYzCwJpYQuxkdpo+yJPWuLgVl0hQsQNAUwPETf7WKGPFlEYxGGXGuE3g8qoRzHEZ04bRXhEPvi/W6dVbFwgR5zxxqROV/ED4i3tRds3toqACaM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?pSwfHOZG6vEuLXOn6cnvaBPaYUktFMqFmuC1uMZCnM1W25s5oHHW01/3/K3v?=
 =?us-ascii?Q?SMmhLvVO7Yvaf4TsNZmRsGlTrB89twt1KqfdHYyEdaWXIQHssm1kIQEBjcXw?=
 =?us-ascii?Q?RznL9giLkt4JOH4KJ9KhuJBS4V61YcogBKyuNwXVruHgMuRJ8SlARlGdIqCe?=
 =?us-ascii?Q?GbSUVUq06rIvlgGi5CBjJ9HBvH3g/eFP9BLRH9vMHJePndNTACZ74vJwDRzP?=
 =?us-ascii?Q?go8pdMc79xt6rRzltuwqJ4xI6+BxhYKtUiXyx0WJm67MnLwNMQCG7IXecjG7?=
 =?us-ascii?Q?Jpab0MjHVrVbhtq9DerWyTBrS5X5WQ4VC1MWRtY8OwBcfZKNli0VLpvbAh7C?=
 =?us-ascii?Q?B7mOKALqyRRg2RIdDHoAhNZKjFHDepMp5Fdx/sIB8+WdIf2CzMiyHBMBHY2K?=
 =?us-ascii?Q?PdiJ/X/6AxI6CT+OmU0gLNQR4Q7sA6rHU5Kg2HW1+AujStpuiuAmHgg/ox1o?=
 =?us-ascii?Q?d3u2axWeIjeWbMdBsEI4Obif0Pm00noJbJUPJw/ltkHFfa1UdVIMjQda7OVo?=
 =?us-ascii?Q?uBDNjgboHKE0dkLTSH+YFoTfZ3N9N4+LTAnZH9YrG/Aq3/1IWi72/I8qHhTc?=
 =?us-ascii?Q?zPXAzLHwEwGZUYYc/OQBiCxAS85D6Tgs7s1R6o7emlVwcyuoBw01uCQ/zomj?=
 =?us-ascii?Q?rOpYf0uDZpuUqkCCqix0LQcfabjcgKp4LT+oEEqHzZdTdjiaBpZWOx7cpsrW?=
 =?us-ascii?Q?C+s6yzUXMYgu9/HduFaZwIfqw8VCslyDyrhtYY2+rrKF7UmAyxD/uCbo+Ga0?=
 =?us-ascii?Q?pvICbnk2XU8ZBt7WmfHUF2L0jvPcTAElZ/2O93rdnlTcckTFUAODeoJK9Bw5?=
 =?us-ascii?Q?47KSqhjJs0ykeDsflJBnKL4eAT5ytSDY6vuVTlrD/F4nQYg60yxjH9MYQ6Eg?=
 =?us-ascii?Q?uITrzWa78zX9UVyNQTwJJzdfT+tP34luReTxqMxGcgDbxlnR5TLDJtQkup/r?=
 =?us-ascii?Q?8b4YMDdZqQ2hhSqaNt3FA4Zm0koC9y/XDJjia4girHIrpTVOrs23UZnfW9nZ?=
 =?us-ascii?Q?YEJA7Egv5SdnNh6CDtNXSY8YFdRBMOIF4j3CNVL/Y8EvSxKv3Ys4ZusXquOM?=
 =?us-ascii?Q?oGB3jS0C2AdLwnG4HJ4S379OTfPPPoBgcnLoKaJcDphjwvlOLnvwlCSq+JJR?=
 =?us-ascii?Q?aIFzrJdHT+zypjej2qanjJnsO+zWVdRR0yrryGyFKHIALfbxSXOIbJcOtfOl?=
 =?us-ascii?Q?ip6U5pp6phY3mVQWKuXfpnPEgG14JjN8BysQjd77IcbiuFYpF54oym2ZLCiH?=
 =?us-ascii?Q?5pI4x2vd8SBUeM+x22SAWMZP6oh6nwIf8IZma2Eyx6xqR8M4X4GtT3ShgH1J?=
 =?us-ascii?Q?vcI+rUyC7iLT/HACLbzbaC0fZ4fgYEZ+O0DhjhWkowfLtHqKscpEZ1kAvUhM?=
 =?us-ascii?Q?Yhi8ZUJxjJ6ODgYuClB+8mK19CDg5ssvpaDOW4Aab1jwcuZPmaQJjL/nCjzI?=
 =?us-ascii?Q?yvN2n/YtBs/x1jo1JJnydxE4iGYsypZ+ELTFjV/oTi1szOqSH9jA306499bx?=
 =?us-ascii?Q?nJ1UPmLIZ1mAWKH7psvO8Z+T5K9y+rtL04X4pUgnpMZYPxoESTcMWCh00qK9?=
 =?us-ascii?Q?dHA4tQBLoOUgIr8ihBsElt3PHjWLLPFTxzdxMlqd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e1d069-ed7a-4719-9278-08dba3f8aa94
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:41.5999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPpgHMOJDONdcMOTdUQiaROB7rtFMV2Klm4m88ENtAE3Q80JZWYBYUBPQ6RgNgp5
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

These drivers are all trivially converted since the function is only
called if the domain type is going to be
IOMMU_DOMAIN_UNMANAGED/DMA.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
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
2.41.0

