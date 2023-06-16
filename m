Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F63A73393B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:07:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tDjy0iNU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTFC1kw9z3c1n
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:07:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tDjy0iNU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7ea9::60b; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7ea9::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT893sP7z3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXvxli7oRWdCXB0NnwQp1HUPL4mkI1S3o5KdPGs/sbOFTx46rLvdUEyABvmkKbdqmKkgPThiVrHQKfDosLaEKdxztK5M0V5NW3BbT4Yy8iRIWiZFQgJJtp8J8uP3bTtluB7Ig5EknZzJy9eInI3OKLohTfYuMyWv9aAxP2ZcHE4fnS2k2MfvQ0gEIPytTcy850KvxfTZpJ1Wy9W0vP1S2INFPMuWoSs4CtK/+pOcKFoBqN67o0UZrTvHdvab3MKW1nGCidj43hAaExfqvkopV5utxtYLrYs0q8nslTplykxuN611+exnm9WZcn4amnRi/f4jsiS9MuQC9sHBRA0Vzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNyTRyxbNWq/jd5aCXqxAkKB4mcTO+zABe+4bu/mqLE=;
 b=bPs5fPnpRfpQqerTkFIdifRVOmQr6BHcRllx86RRuRJjUbjiI3gzYlrCFU8iAOgAswPpjERNWS3M+DU94EC7b6Efx9lo4e9ZYjoUW26ZnXQCgjH38HHFFHAEvzWANQqlFSmshsg6I1XAXfSZl+bUegwgSMrS416ChDjnngcicbMttt2kSIU+UTNE/q1uwqd+9dGZSkgtHtT2Mz0nmA7sBXetkn2Gc37mURXLpu+wcOUnRx56WuHM1RgiXsB+3sZofkwAZWwgFrZQWfLxLZepVVt6pza/z3JHCPWKGXEL/XEqTeODinqfjqta8u1EiIIeeDvNF8qX5ErTaDtjWrQw0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNyTRyxbNWq/jd5aCXqxAkKB4mcTO+zABe+4bu/mqLE=;
 b=tDjy0iNUjvUBMUuhIOGWeV8PQAQjK5jrV5xlVvZTa//F0h7j12CFOQBk9VcakkDLlwxNRHUyO2TC9K7Rdwo39SXZUXwoGST4gN0UMyDIiHF01XEMuzgNm7hrSP+8+nzqQbK7H/HenPsJAxFI9DFaRNUADNW3U958kLB34Ky4vvFPUsw/K8mzx4oRDQ8TX6Getj6Y8LkKZtmT/41hSPHN55yTCX8ZgbEjNYpJesHCiEbgs8WrPCLee0OOLqUioYII1WIF758JOzsUxrYvqYABhDx41ivdMEAGXCcUXTWzHuXeo5peFtTWP+bI5MLDu0zBraV6g/cSLW5m7snUH5mdxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS7PR12MB5912.namprd12.prod.outlook.com (2603:10b6:8:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 19:03:08 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:03:08 +0000
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
Subject: [PATCH v4 05/25] iommu/fsl_pamu: Implement a PLATFORM domain
Date: Fri, 16 Jun 2023 16:02:34 -0300
Message-Id: <5-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:208:329::7) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS7PR12MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 479e6ddb-cead-42ef-fb74-08db6e9c4c1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ZvxooqNgZBmNAiyhlaxD4LFn3llK6tJV9lmNiwmjq/AdbR1Bx2c6HvFgcqsHICT7Jv9J6mLUC47oy+IYGTxkj9AKKJR4U2lPaN6bKc9ygkIts3tACNv97QoJyULS4MaQLh9wa/xkTv2CvUwnG8xJyBvmVGVtDNiyLVftv+ye2ga4tyekA3KHBtLyszZf2rcAjp03s4Csv1Bu43YjIk5RwQJcvYiarnTBEbWgqdXefifyDfYFC/hPls3zL+3nOw/rW/OABGZFqsiqCBmeRQUzcjYqMjM2/ZSiEJp0NCBb0pmhSKFcsxoeTD+YBY8jip19/fzLvQoFlm3rZIX7eG4zIWiSVo93+OGNylHqTTMwr9bE4B9qsSpYoAs3A0DrbecPVh2IdowHRbq1FBCy680gLElRMI01CBCvTD9MS1xESwr6k5W3I/FwkWTc8U3Sv4Iag+I3ANPi8dvT/ed8uco46aT0n9oouwwMaC2qlI19g8dCdEnO4VhyqULaQzKeowWouFA795HEBRGXZEFueEu1zGkp3zGJQDuVRftOB5oi/CIdVK/mWIU+3MXKoXA92f1amu0uIIiTysBsZJI++ClxdAXG9aPb3bdFpMc+c3OE1bR0yuaBqC3O6JF7hFmU6iaV
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(36756003)(86362001)(110136005)(66556008)(66476007)(54906003)(4326008)(316002)(66946007)(107886003)(478600001)(6666004)(6486002)(7416002)(41300700001)(5660300002)(8936002)(8676002)(7406005)(2906002)(38100700002)(921005)(2616005)(83380400001)(6512007)(6506007)(186003)(26005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?94nVWn5UkbfkQ4bJYwxU5cBNY5dSaAaKIwj3h1GbR8MDjfJdN+X47/hek7fV?=
 =?us-ascii?Q?cLgmskWLkz/xMDETGSYRAC8i5nANEVCPGudYaBA3qG5KItWU5jy3+ZBzzn1v?=
 =?us-ascii?Q?GU8PFWUKeoHsH0LAFx3GNo80+6CPO6ddkyIn6wMpD1KMQlXbOUmmZu0s7n1D?=
 =?us-ascii?Q?8E0QXNUSTG12GOfka1mBDh7vxBCsYKT/+C7cWo4adMpm3OjRAzO1E5sjHXzf?=
 =?us-ascii?Q?wcJQpsDgqfa3hTlTT+QiykM56IbSOh8Sy0PpFgGx6SD89btbtq745vPgpKen?=
 =?us-ascii?Q?4I8cMQAeJ+ijks/xTBXEO2Q4JS8TUpkY34M5QY/meQBCMLkYAIMKZ73/Oy8g?=
 =?us-ascii?Q?QUhXEqtPcpFYbH+QHXOrdx9NhjVb9QTlhcfcPKfAa2D0L41aJLFwkLktJknQ?=
 =?us-ascii?Q?zfHeWTOmWIk1bkKl/iuNZssAyt4PZYkyvVcgwine9VysJWCVEboyNZP1nBJ3?=
 =?us-ascii?Q?KZ16ZJNNH5fJj+2TQUmzRZMv4MV45HMNiDbbAjsFQF3Q6dvIep/jtA4em4WG?=
 =?us-ascii?Q?JAhqBNDuhRdvNbqFm1xXahTwzylybq99G7pDUILTsu8AV7FW7fLx8urcp9FZ?=
 =?us-ascii?Q?qvEfFYlqV3/33RvPHfum5nr4eFjoU/Dgx+kY31AlYPOLskBD0vf+gnMFQmPU?=
 =?us-ascii?Q?3fsALqsPwKcKgNWVDusHrYAQhdzju/EEQa48igXfA2vUJY5kb6tLzSHOsmxw?=
 =?us-ascii?Q?kMOe94chi5pfsjeRPnDrT0IbvssVvNXlj/GUp59iKqxmRfsU6HxP9BkIgCGe?=
 =?us-ascii?Q?hcuV4oKHfNdDG7vyuInR5a7MrH0SSPtEbboTdPE5F0yLKAgEa3OHvh0rea/K?=
 =?us-ascii?Q?mt+2MsY140QvGa3w4rK6xvvcviZLeIM3Oz0FOfzzpx6trtu21nsE4twAdsdw?=
 =?us-ascii?Q?/S2RyrJrIPaxd7YJrUaBGt+0N5zJsUtgpVZybmJp1gAVG4QwWxFQ6xY2S+Dh?=
 =?us-ascii?Q?e8gMd3cxim7T9aXdTsm3js8LeMINubZ5xgu/xT0dwkxUSQ5/Pr2bHUITzVwQ?=
 =?us-ascii?Q?wq0IzozrAlYnH5+cJ5eUS3EsJiSwZ2iMOGv+H2iAXkJT3pSsJMRG4OWKxcB6?=
 =?us-ascii?Q?FS+eksCuYyyEffkv2zTzjSIMbZeooNCKJJiesMYIk8BA5eFDWXHTDp2XiQkU?=
 =?us-ascii?Q?rV+e5oRfW0FIoeTcTEaEGFRjSK2aS0VNmRTtB6ZwDOuP5V9Nx1oe30Noxe5o?=
 =?us-ascii?Q?nbzug6qP8If/03wgOAqhTJfbZqxqpPGeqT/+CBiNmmg3a1QV56dDnbjHRf8J?=
 =?us-ascii?Q?evPCxOSQojpCwenZiDTWzlN0Lnk4ssmFQsB8zGvvv62ZwkuyekysJPOSFsnW?=
 =?us-ascii?Q?kGHu590yq6Iu/HC17FuKNN/ve/W79IIsajnFOPpSWfqtmUjC9ok0Lke7MxZ8?=
 =?us-ascii?Q?EoiYymXH2/3+mnebvTeR8VCjx9AZDipg2mYj6vOZ5NhANm5FiCcetaH2qXfI?=
 =?us-ascii?Q?xI2KygS4avs9F1VjLSqiplgWG2kNUHxVD2kD4mLh6P9WDqJyCtM02WSYlik6?=
 =?us-ascii?Q?w5bOgmEvoOCpkwc7wM5SLCN09o5pOpT6tHe2aE1tOYyqpIeP07lEBx++2v1R?=
 =?us-ascii?Q?azEMtg1mrZo9CJ4xLMi7U3MXDBMPi1kxgFPwPN+D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 479e6ddb-cead-42ef-fb74-08db6e9c4c1d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:57.5346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MU+Db9/kHQACuFcM4TZR0NZcLPNHdV3YhLrUcni3OjMrQX2lcmCkPhnVobXz8VMo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5912
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

This driver is nonsensical. To not block migrating the core API away from
NULL default_domains give it a hacky of a PLATFORM domain that keeps it
working exactly as it always did.

Leave some comments around to warn away any future people looking at this.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/fsl_pamu_domain.c | 41 ++++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index 4ac0e247ec2b51..e9d2bff4659b7c 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -196,6 +196,13 @@ static struct iommu_domain *fsl_pamu_domain_alloc(unsigned type)
 {
 	struct fsl_dma_domain *dma_domain;
 
+	/*
+	 * FIXME: This isn't creating an unmanaged domain since the
+	 * default_domain_ops do not have any map/unmap function it doesn't meet
+	 * the requirements for __IOMMU_DOMAIN_PAGING. The only purpose seems to
+	 * allow drivers/soc/fsl/qbman/qman_portal.c to do
+	 * fsl_pamu_configure_l1_stash()
+	 */
 	if (type != IOMMU_DOMAIN_UNMANAGED)
 		return NULL;
 
@@ -283,15 +290,33 @@ static int fsl_pamu_attach_device(struct iommu_domain *domain,
 	return ret;
 }
 
-static void fsl_pamu_set_platform_dma(struct device *dev)
+/*
+ * FIXME: fsl/pamu is completely broken in terms of how it works with the iommu
+ * API. Immediately after probe the HW is left in an IDENTITY translation and
+ * the driver provides a non-working UNMANAGED domain that it can switch over
+ * to. However it cannot switch back to an IDENTITY translation, instead it
+ * switches to what looks like BLOCKING.
+ */
+static int fsl_pamu_platform_attach(struct iommu_domain *platform_domain,
+				    struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct fsl_dma_domain *dma_domain = to_fsl_dma_domain(domain);
+	struct fsl_dma_domain *dma_domain;
 	const u32 *prop;
 	int len;
 	struct pci_dev *pdev = NULL;
 	struct pci_controller *pci_ctl;
 
+	/*
+	 * Hack to keep things working as they always have, only leaving an
+	 * UNMANAGED domain makes it BLOCKING.
+	 */
+	if (domain == platform_domain || !domain ||
+	    domain->type != IOMMU_DOMAIN_UNMANAGED)
+		return 0;
+
+	dma_domain = to_fsl_dma_domain(domain);
+
 	/*
 	 * Use LIODN of the PCI controller while detaching a
 	 * PCI device.
@@ -312,8 +337,18 @@ static void fsl_pamu_set_platform_dma(struct device *dev)
 		detach_device(dev, dma_domain);
 	else
 		pr_debug("missing fsl,liodn property at %pOF\n", dev->of_node);
+	return 0;
 }
 
+static struct iommu_domain_ops fsl_pamu_platform_ops = {
+	.attach_dev = fsl_pamu_platform_attach,
+};
+
+static struct iommu_domain fsl_pamu_platform_domain = {
+	.type = IOMMU_DOMAIN_PLATFORM,
+	.ops = &fsl_pamu_platform_ops,
+};
+
 /* Set the domain stash attribute */
 int fsl_pamu_configure_l1_stash(struct iommu_domain *domain, u32 cpu)
 {
@@ -395,11 +430,11 @@ static struct iommu_device *fsl_pamu_probe_device(struct device *dev)
 }
 
 static const struct iommu_ops fsl_pamu_ops = {
+	.default_domain = &fsl_pamu_platform_domain,
 	.capable	= fsl_pamu_capable,
 	.domain_alloc	= fsl_pamu_domain_alloc,
 	.probe_device	= fsl_pamu_probe_device,
 	.device_group   = fsl_pamu_device_group,
-	.set_platform_dma_ops = fsl_pamu_set_platform_dma,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= fsl_pamu_attach_device,
 		.iova_to_phys	= fsl_pamu_iova_to_phys,
-- 
2.40.1

