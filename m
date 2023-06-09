Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE32872A3FC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:01:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdBmb3jbFz3frP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:01:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Y38zFmp4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::61b; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Y38zFmp4;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBfx3KBpz3f5R
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eomCmEDLskTa51X9mvIQcS1T48vwGMXiFfWUbT5rjf8QaWag3hPMWm2iyDpRIHFKskzUJHk1i5xoZWKxnSoJmjt7x1SMAnBkPgZ9oBy/5fST0cvHuWHzMZ6RU2n0QvusZY+bs+VdXs0DDYI8EA98ExMk2VJS27SByCYPEvSd5FQyp6NNuLHM6EZ+QGQNk81rLG3xizT6k0jdmahYM/1ebc3J3IWm+dt88PcRqc3uByhXEQxU1hUX+gmlETiX5RkmOYcmaIbJMocdrGuFPNQI+NK/tmEV7KIJoHcKKrizkR/p0s8wA5ZXr6EDlZp0vCiTxeucoraoleeyBlrQ8KO3LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fv07ZTI6TWqMM56BZclxgR+qWcyKeH1gSmVtTipkoJE=;
 b=K+ShvmGq7QPDVqGIuMhLAf50u1pJqXXhhI4bKBbGY06Fjk4ZkQu51mH1+7k8/PjxJZRYU+jsIr/v9sHVmQHccfQNu1Ff3eWUi9ifdWpLKkUUokR14EQMVHM/8S/0R0u8+Ntt3s9YlkSgrA3QFYGBT1JPwHJU8GOBbmViAs50B59ak9cBIVbF8mIBHjGXPdVyOEUCaS/WJpDjLFsB7cuJcjpyesn6XntPEsSVFrJG0UJejxv5WyT8b99dtRD992H19xLLDSJfyNp4Ga9rmpXOEQB7tBOOApNiReFcgNhO9yHAsjgBs2eUWKUbSGpkw2MnI8DVA3ZPZbvnlZrWFLaQ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fv07ZTI6TWqMM56BZclxgR+qWcyKeH1gSmVtTipkoJE=;
 b=Y38zFmp4z0dUdArlXca7QGVV5WEz8q2fTUfqK0Ku0aHtOgwHGYZVqNK41h+/CflMcV48FwIhTUKRGCEpmupwN0gBwZW2qSB8qdOLH78bTpr1XV5ZvoTQYwPKRy6YhHuv1Tpxj3/IwE+gw4R7V5ecyqoITylJxHAHK223TMXZm7iPuuNlWbl7BCtbPN6iTh26LpReHYNLk6ySmhE75/LuFXWSuyhjrIgIW8anoeE1Iu7ZrIrkFLc0YLQLqBPGWWjVTDvOy0hzlj4PlwbUsNs2MiilU5ih5F20+3am+yA23c5l/5gOB2JT2/+qW9f7uaFElv/fuGvVxAN5HTUk7j4RHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY8PR12MB7489.namprd12.prod.outlook.com (2603:10b6:930:90::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 19:56:17 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:17 +0000
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
Subject: [PATCH v3 11/25] iommu/tegra-smmu: Implement an IDENTITY domain
Date: Fri,  9 Jun 2023 16:55:59 -0300
Message-Id: <11-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY8PR12MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b7e12b3-a9ef-4b9b-3b29-08db69239603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xNwL+dpyn7Snxgb+Owkpfd1UO4pSjWvg/FDVZcG2LxJsKIo3fR+dZTTOTv59000AuXRSYOr+5PCTYnL1PX8ggQkv1x8vlyRT6QsAMsi7fj7OkFy548IeLGuZt6kHqMOF/d10qPRuQsQNTF3bKyWVzG8CivQM53/5FCFDleQGyYoPJCqNWkNOt8tBMwGoYcG9bkhX+ujdv+vrb1hQTq8Cij/bshpiTjjZBHGit5F71pkWAycKRJlPi56VmBQEtyTx+3PW48/OO2Axid/kexsn7bNoJtaAMGC0Y7ZlU0t4NLMMNLDEXIUz+cSXtlGJFn0UBA/ZTMrA1TGAZFOTPrnNR0zS/E3f2b4T4v9yuTUQ+qoXKh24JxPRnZe5TniqE4KfwkbWSo3a9cf1KH5j6MwGVZYsP0SXEKNGSmmyjiR8WxT8saz10QhILxNkRpCXTOH/teKJUbNbzsuxoiQrkS4Hjl68ozwGpZIXHubcVHHXrgqD3+JwX+MHArCigLgynNrgkhbjA9yGXUQTDSR+i0jJ5qImsVFcFAEmu45G4xOUxb5Tm9v4r5akkOpnYDoU+J5BtxplbTTrxLSZu05foNoWivH4QgZlI9Z4/WyWHFuUkOU=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199021)(478600001)(2906002)(83380400001)(2616005)(6506007)(107886003)(186003)(6512007)(26005)(921005)(86362001)(38100700002)(6486002)(36756003)(6666004)(5660300002)(8676002)(8936002)(41300700001)(66476007)(4326008)(66556008)(66946007)(316002)(54906003)(7406005)(7416002)(110136005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?+LkP286R2qcJ5Tfv+aVC95O1lxNeTMO01qDwTvVHZiul+ZtI8EM4pUHGtgHi?=
 =?us-ascii?Q?hiCo1JD143fwm7TO+EZenJ15dRKeRc7Y1WbpJfoxNErEFncDoTpVZ+CLelWr?=
 =?us-ascii?Q?XV9k9ozTyPfH8aTV/AbJZnQr0i0pjBz5PqIrDq49Cn1gOiX5CmClWU1xvaZF?=
 =?us-ascii?Q?tWb6V3b91RYRCocBpTRzwUWGLMj0SmyjFM4KJe2EsrkX+ESAD7/6+4VhaaBe?=
 =?us-ascii?Q?CSSfGACb4UK5vJgAt19nl1euR9v2BSRh3/4hAcUAC+R/SHSWXHvpBzPucFDm?=
 =?us-ascii?Q?sVJkKMQP1cyftRi0knXRN73R3JzcT1NqC7k42vLFu0FU97kjZoPWsblRl/kt?=
 =?us-ascii?Q?HzbQH9NbG7Es0zJ4Oy0A3CiBS9/6UTmRcs1NhfSIhe6jCbCEn/w7N81YRZhK?=
 =?us-ascii?Q?maR6KZWGuYZWcj5tW6p0NjUdugDAHw+IWQ5pMmm151SLrO9N0hslVO0X4lmH?=
 =?us-ascii?Q?c15W2Cxy0eT2I70P48sRNnkJouF6K9n+uKsp3CbcTCC9zwSgnCGf17QnTuOv?=
 =?us-ascii?Q?B5Wzemoma4mz1jh7/c180I1svxO4J6Yt1/DvX6whjXigDpekz0MkXpvsnMq/?=
 =?us-ascii?Q?Nw5ofRvDdtUg2t6Jyj6tqhixWecd0zhkFmmy3TKH/C3iFIWVP4DqmpConCAR?=
 =?us-ascii?Q?tZ42vA2zMQXD4MpkY1I0aPmHiASzZY1aAdUAI3Qp/qCVe3Dn1vyiA/XP4oMW?=
 =?us-ascii?Q?DgP55HN3Jx2O7i/cIH1RgRy5ZNy1xm1ShN//PiNTTxLHivEXiicStCWuuN+F?=
 =?us-ascii?Q?cv1VyC/XUKniT0BgwwaMAXuE0Eg/906hFvFh15yd9BQrqtUlZSSgko53n3Lc?=
 =?us-ascii?Q?66xldJCmCuHxSVTCZp9oR1x1dXzIbc5U+JnrYqnc30DkafQJmaLqTfTb9hoz?=
 =?us-ascii?Q?ajouaa8nyq7SBT8Kbcl2sZU4G5GlNYG7YaIOXHLRELGJVb2/eU432L20BpmI?=
 =?us-ascii?Q?Xnum1SsGze9aThTUGdks5l1NLUAxCwxaLsFAE/pQ5x0O0IViUx98Brudihj8?=
 =?us-ascii?Q?BAm4kZ6Emhe37e34fLhzNdqxKdevvEGHM5+XQbVerE/bl5DFv8cfAseo+U3F?=
 =?us-ascii?Q?KQEd1McsY4rJWDelDTshqCg2EBFplY5qjUOyBlJDs9jpE4MEKqVe6XhZORmO?=
 =?us-ascii?Q?Jnt8VyPGlq89f8+lC0AD6wAluDjfZsUbMmFsv0kpoRGrFMhlM5jPkFOAcMdQ?=
 =?us-ascii?Q?3slxVUJ+zSCUfFYxMBr54le2qVJCFtOZ0lL50f9+2Kn80wbJV69q0aFwZJJR?=
 =?us-ascii?Q?8+tnERKnR4qOfDN6QLiyCPz571lOs2sev98ZNUr5j8g2ZN3uV7gM0xapOstd?=
 =?us-ascii?Q?JrrB7JkAIiuMwXod+gpqU1YgbVQn16WbrK3ROj1dDpr64GwAkDlzR4LZmLeP?=
 =?us-ascii?Q?loJLvbQdkp/ePXmFDQqcm2Gb2k30n5hTAYBtDD0ZbreEF+hIrsKnD8gkYN9s?=
 =?us-ascii?Q?OKSRi++thM3fhEmtG2Bg9R8j6OnLfTnJAyRoGQdQfhtLpkZ5OXC3UOCzfMOf?=
 =?us-ascii?Q?ily73piTSCg8wCBL5E71+1o4KchkI80y7/gIkHHzJABHi2JUGj2vB8yPHVS+?=
 =?us-ascii?Q?lTUW6PhUe3nTJu05qNl0g2Fq+GI1aOSHBPkD/DKa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7e12b3-a9ef-4b9b-3b29-08db69239603
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:16.6348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gjzt2DZvJBjd9m35x4vPW1hfBYPZ5dzlS0wRZA1YwJqSVsRbwrPatgWHsmx3b06H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7489
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

What tegra-smmu does during tegra_smmu_set_platform_dma() is actually
putting the iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 1cbf063ccf147a..f63f1d4f0bd10f 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -511,23 +511,39 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 	return err;
 }
 
-static void tegra_smmu_set_platform_dma(struct device *dev)
+static int tegra_smmu_identity_attach(struct iommu_domain *identity_domain,
+				      struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct tegra_smmu_as *as = to_smmu_as(domain);
-	struct tegra_smmu *smmu = as->smmu;
+	struct tegra_smmu_as *as;
+	struct tegra_smmu *smmu;
 	unsigned int index;
 
 	if (!fwspec)
-		return;
+		return -ENODEV;
 
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	as = to_smmu_as(domain);
+	smmu = as->smmu;
 	for (index = 0; index < fwspec->num_ids; index++) {
 		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
 		tegra_smmu_as_unprepare(smmu, as);
 	}
+	return 0;
 }
 
+static struct iommu_domain_ops tegra_smmu_identity_ops = {
+	.attach_dev = tegra_smmu_identity_attach,
+};
+
+static struct iommu_domain tegra_smmu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &tegra_smmu_identity_ops,
+};
+
 static void tegra_smmu_set_pde(struct tegra_smmu_as *as, unsigned long iova,
 			       u32 value)
 {
@@ -962,11 +978,22 @@ static int tegra_smmu_of_xlate(struct device *dev,
 	return iommu_fwspec_add_ids(dev, &id, 1);
 }
 
+static int tegra_smmu_def_domain_type(struct device *dev)
+{
+	/*
+	 * FIXME: For now we want to run all translation in IDENTITY mode, due
+	 * to some device quirks. Better would be to just quirk the troubled
+	 * devices.
+	 */
+	return IOMMU_DOMAIN_IDENTITY;
+}
+
 static const struct iommu_ops tegra_smmu_ops = {
+	.identity_domain = &tegra_smmu_identity_domain,
+	.def_domain_type = &tegra_smmu_def_domain_type,
 	.domain_alloc = tegra_smmu_domain_alloc,
 	.probe_device = tegra_smmu_probe_device,
 	.device_group = tegra_smmu_device_group,
-	.set_platform_dma_ops = tegra_smmu_set_platform_dma,
 	.of_xlate = tegra_smmu_of_xlate,
 	.pgsize_bitmap = SZ_4K,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.40.1

