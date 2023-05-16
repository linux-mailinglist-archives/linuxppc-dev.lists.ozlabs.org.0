Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D90E704204
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:02:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxJ008tbz3fFZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:02:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GilGkfv2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::60d; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GilGkfv2;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxGw3M6vz3bxL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8ENuULuwAFqnSXK8tqqpOWhr2PVJg3drSSusTewstpmLUuTsCAqywftMxqveT32ctD8WLWflNycOtILF8L6MgU0+V65O/bIKsAZdpbRyp1QdWahiFWv2X36jfc47N3DLbHpV4aeb1RZr6K+awD/xZeiQAs6t5iMn6UCHlKyu3IkaQdBsdM2nITuj3XHad2nn8hlTX/YGnFQMS+yn4J5xEraTgp4trxicF95DIMYRBzlzsa27J1srcheFojrlBHWDbNY4ZDOSuRzvvcG8E5+byrLmTB09wfJOuGIRh3kj9U34Mc5PA3RXo09hohjUYIfYzZdi8e/SPkQMsAJrtZfZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fv07ZTI6TWqMM56BZclxgR+qWcyKeH1gSmVtTipkoJE=;
 b=NoRk2W3OJbpZwM+sxlpFvO/kvbe3hEN2t6DTfEHEzQMaxujLR1wNpHAeRGvSvwVb6bMG9iFQGb213LwC87qfUqDgezu/N0r90uatWSrch9VinyjZwLMGkfq3DVhsYcggiNFqWx+eX07eD1O09YNhGeWv7u0NLn2Hznaf24Ms2a+cPGVlkOBn4DHXnzCqQGe093jk3bTEczwJwLbLIoUcLjAoFeS4NIcYJZrRPiHEJ86Fz5klYPR1ORH20BHkz2ujT6lBUoje8sQl2O/2tNoXKNQ2x30Sk3dqvlWT/7Y99XHsBacxsPHfsps6HJv+AuisSy0SRZba16leX/JlO/pb5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fv07ZTI6TWqMM56BZclxgR+qWcyKeH1gSmVtTipkoJE=;
 b=GilGkfv2e98bP/r30P27lvROOXaXK5ZC3ZjOpksjCBCu1n7c/rlDLRnX1ZWQVsyDT252PaFu2kbNgoSbi/vs8u4OpgIRbcuAkNQK0GuT+kqfFJhf3akYsBxOtlnlNC1byzhQPAbhhdGu3Mem3iN8M6x5tCEQZ4GiqTwtC5+0K8qwRAnSvQlKdnPZgPXSiPXO96KrxXSQV1IU30SirWf2mb3pD1wsxLjFix9TWZwK1S0atvIWetyMsAubhqFK/MgTRs7bIpd8FxeeQcrXhfnoDvpxXUEk19Oz0Usc6WdEmNskSY0gnLRZhEe28S8R38oYD2Ny719IiFn/in25Q8negQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:00 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:00 +0000
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
	Marek Szyprowski <m.szyprowski@samsung.com>,
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
Subject: [PATCH v2 11/25] iommu/tegra-smmu: Implement an IDENTITY domain
Date: Mon, 15 May 2023 21:00:44 -0300
Message-Id: <11-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0033.namprd15.prod.outlook.com
 (2603:10b6:207:17::46) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: 280b1fb8-21c7-4dfe-10f1-08db55a0a1f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Aks1VUuYTYc7AbsvVvn5E491j3YaOt2IsTKlA7P9BkUSdCDj6ZNcyqSixFswVjd2vyA8YE6lvgLgNqvBjSgv65RPQ+XK3pdiMwk/2ajPxGR7JMqRAUCYMwXhcKkBhAg0IqZ+USnxh+ALchlMCntn6Rwpe9rOOmGV4sm7WZlJ2/j38hJvmFzNPKklQ1ngFlY0g5lrIMSv6rXzNICTvUYBGoS9O4lKSla7fIxrXRjN31EZ9bX6LS4kC/DlemuWSJ+97Utcz8C8/E9bR1qQQylOAqNazjCtO2GAnn8MZYtfjxs0Q0aR17kO5+CD5Rfxy6gIxlqDMaApeDeJbs5ZRe9utwU2hTUTG4RT9Mu5C1XgSod4SrsCZSAWntLlikW0KGF8N5NWtw7kxLWJhNmlkbh83VpuqXFX1y1D/SDr1CVwLc9oGTGlkvPv1WYAZYihc5zf82G52MSUIqMS+fXyhVQdm8VV7W2I3Yf1g9HH9xKscblNHwOAjS+E0IiNhanoPdVAw/xEshnZlazSImkf+qi4nZAIW4ph/UTHQPfx2f6/bfbp548fqWYAE6CJ9PF5dAzUMXUAUamAb9+UElhgNZ/xlXQfo39fxbVwRj82lbFLlFk=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(4326008)(41300700001)(316002)(2906002)(921005)(36756003)(38100700002)(6512007)(6506007)(26005)(6486002)(478600001)(107886003)(66556008)(66946007)(66476007)(2616005)(86362001)(5660300002)(8936002)(8676002)(110136005)(54906003)(7416002)(7406005)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?feFb3zIKR3NUbX5KkNESRYkh7TBFeZ9skPbUFpwYK0Ak4UQO/YD3eJV9Q+Ah?=
 =?us-ascii?Q?/vI+7+vTYrvIQcfdiYXkF8Gf05vmRPrwsS6mU+qtn+ohATeHtJTO0k1xCbAp?=
 =?us-ascii?Q?0hi5brwKmRuCUZdp+Xd8SWHIYh424bsQF5uTjK9oTHNxBUTdZLgNceqQku7v?=
 =?us-ascii?Q?49mwBrcHS3PdwefVU1pbrT8NZt0PMDra6N6WVHUw88zscEEe1XcO7508XzD5?=
 =?us-ascii?Q?BDI06VQxE+sMCu+jbtk0mJu3sy+s5I02reEq8M4G2SfpYJUcGSsAyK0MiBRZ?=
 =?us-ascii?Q?BGNR7APpUDovZRXur34UOCJsWi59eqXWnQyz4d6SvRRubygN4GmypsNKLA/h?=
 =?us-ascii?Q?ECqjpQi6AF2iC2fxHEfwgwzDojRq2ksSItH3G6f0E/bC5QZBY+EPrISBBU7K?=
 =?us-ascii?Q?b4ca87Z3w0vNV+P1bzSqyCy7B06HSHWOD6qPddLcGwNsB+a/vtQ0XVa4tM1j?=
 =?us-ascii?Q?t47cLiimyi/rLtLnCoEtzvfR0UqIvqLYHBbi5+qDyt+7RyIj9/qpSOlFDG9K?=
 =?us-ascii?Q?4v4WWITDebObEtQmS06xHOCD0YlI8+VHrDU0WJ3VwIx+A/uK1eLPsiMGZoAu?=
 =?us-ascii?Q?Ew+vECbtg2WGPE5cAIwn6OKJ1pnGQBuz3iVis9F7l9bpWqwiWiiBK/bRCe9f?=
 =?us-ascii?Q?JMImQNDTy9ek6gZmv3378C/s/aQDHq9ULVfTOWuCVTMO4SAXFWYBG2RUZg/j?=
 =?us-ascii?Q?iigpr8ZJuIQrcwuPNc2kRHsXtLbC9Q2PDNCHEc6LOzJetI2FtiLxGsvhdPW4?=
 =?us-ascii?Q?9nfCL+YWI0c7VrGGmAyPMIbPsttU1VSjTOXrFuzpvpc++q/o4KgT+fvE/dVy?=
 =?us-ascii?Q?/6E4SdnoKaid4YoWuuzGLadfc3TGHZWXq6nHDcjpFVmeQNzCD1Jd+fn+ivGW?=
 =?us-ascii?Q?+L0S6OW5W5qhA55yq1e0nZrHYbF1UAVDiNpftVYSo+es82T7bkKvk8pCF7pK?=
 =?us-ascii?Q?27kl33gKIiwEfzPHFJt/HOYRoFx2bKXeziZ9iPoTVbJjaRJT8KgxnIHOHGK5?=
 =?us-ascii?Q?1am1gsnpxHCLqPLTCDOJhhDvKWB06f+YdII/MyHdr0pEM2i2PBLuz5nPMElX?=
 =?us-ascii?Q?3ygz6UmmDuXce7SkWrhVvcBZt1hTVkPe7gChLZ6HFGumCfNu2Iu7JM3gG+qc?=
 =?us-ascii?Q?YRyC+Bzwb8IgLIIBYclGX6lW+MLhmaoA61CLpRW/2aoUT1I84vmC6tVkV31T?=
 =?us-ascii?Q?BvlEBmnpl5MEqWLkk+MlbHQyTH+N/xy+zb9IM1I/+/YPIMpYYd2EcCtntTcy?=
 =?us-ascii?Q?w4PbCn9Lr30ZQxr8JDC1+1Ys9AmhinNREszUUjR1yTW5YVyvHlUHQJlBNR8G?=
 =?us-ascii?Q?GroWIt6/7mOssL+AZbK77VcX1FWLk8ldkU9kxyNfitgj5ueAWT8S5BktBkX3?=
 =?us-ascii?Q?aKh5w1QUne3qROkxuR5/O7uGH1GNHY3BD97Uq8inso970ApwOMUucGcm9QVc?=
 =?us-ascii?Q?RI84AprSAPzWBV9oeCp1HjbFt4ouKkhkn2qn7LdvhALjhoU6l7eWlHTw9R5w?=
 =?us-ascii?Q?Ye3sRCzvsWOorYixvQejyJSYU6ZoJWyz16mW7j3uSZloKdBmme+COg1CawzZ?=
 =?us-ascii?Q?2vRrBnjkb7GocZfHylpguKZWivzEaVXsfx9jJEI/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 280b1fb8-21c7-4dfe-10f1-08db55a0a1f4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:00.6151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vgnoWp6T63K+3QoRbcEl7R8RKO1QkTi/2VNUdZWRSvKhKEOPm+Wx+W35h9NWzqa4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6786
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
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>
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

