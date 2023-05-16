Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BD7704215
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:10:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxSv29F2z3fYk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:10:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aOO939jw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::629; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aOO939jw;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxGy43wMz3c92
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FTVcUGw9XBQ/CaUT+sjXSbdQMq3/yScqmUeFeI2m6yGoSIpqlGaiyU7tWeNw3Gkc1pHjDA3NLggHXmvp70qchHdmChaCNyBGi+3+esgI55jn7bGVcK9vUG/zwhhgBqhawnN9dfqn4gjn8spVgCImV56YL3WD1TfF6FOrgjxIcecHWbJGCQUp/Ph53giBjcu4gSEQ7OF9erHKTMRh1c9vsMe2+RAWNP3w60nvVPnr/4mmXfHVjHOCXt2DeE6ad9pxMrympe5zxIYLDSNKBtFN7ZYHOOOuZdTTdEXv/X2CjeimB14/huebc1FppTErznY1GHjnJ2tXSPCFWP+kEYMNJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHXQMEUV4dYQbTI9uoUczyFRhnx7VT/tWXCvbexUek0=;
 b=XZEQfR1ICdLxGo2bI+SCMoUNxrPq7ZA3DmLHkNWAUgB8dtqKkOQYgOpgI04xOjFzlwWQHQ5cWRgnJP1cmmbuAFip01gtV2A8CTl6SdHaS3Q9J9vtl5LO3Sev9xmqnesyXtDMLJlZabCfDSI87NcSciObQwWbx9i6CMx8XkBnBS+GcaCOkHkoUlRpEmMcVp2mcXoNG3p0s2iq0QA8PMh4zkc8vrkk3Aji7Uu9oPrXDxEN0QAoW5aSSJWO+ZofIu8R909W3zrSH2yCPjZ8zepr++Z23cDJBCCcOx2LL7AiA0TfXLI2OCVcfW2EqC2XHMQUfg8TWrZQ7L4ZhOEeNGB16Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lHXQMEUV4dYQbTI9uoUczyFRhnx7VT/tWXCvbexUek0=;
 b=aOO939jwkglkcitxRxWt/xZNWdBm4s8vU/xYhd+pinyFebhDhaxB4U86k4ZkB0RQSyvvP1qPJcB9hbEf+Xo9nnX8o6xE4b+W7yyAGOgezY9VNYS+ZUuZfmzb+oU+PkUGIa0yWO4tcE+TetuZD1BQfJm3qBNwm0qDP9k4RMJ0K5nDTHM3AceifGzioEKsEBgC0w/skccUxowDnR/nZ7ByIGX9EqBK+kX6cz1pKHEoTyLcb3YLokmo7HX70llvUuEpFJ9nHYmdz3jbuX+p11oLY1//33/ICr8f7HTYlcwkKNlZ3/ZalukeQgjZFDvRt5dnAGQt4r1hs3cVoDvkQvnn/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:10 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:10 +0000
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
Subject: [PATCH v2 09/25] iommu/fsl_pamu: Implement an IDENTITY domain
Date: Mon, 15 May 2023 21:00:42 -0300
Message-Id: <9-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0005.namprd15.prod.outlook.com
 (2603:10b6:207:17::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: 366b4628-7e43-490f-6a6a-08db55a0a320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/jB3NVr7FKSAtsY1kEZYIZPfXx3s7wWOTrDg394yx/ITtP/J1srj8SzQbaVSGxQKTg8zI+4lXD29YYfB+DStJ7TrJ0G4cfUXlS66P2PR+NJWwqIpQfIz7AIKLaV4WStvooAYSM9bm5VCTIwVbMjGCf3+RXk1+IHP9cCXDM5b8HSQQzm2CUGRHuLuACfar8C0rHqSMELh+L7J8s1dNsRNiPj38DqT+k8VQndcQfuFIlTojMSB0tHlbB+gcIgz/xdgycG1cOIQDOLnR+PNLC+eP7bKdUajdLUd8b94VS+NdeeZSkUPBQAyPcSJxbZnLkzRFMDgKcRi935lWgdXf2BKTLOWU0eYoW4oxPeu8zKRNzyS20KJnAMl2LvB7K+yEFFUev/vkSyUxcFrWiuJLi2fveVlnTXw3TROjwLsRRcYyz85YZS/+yyiIpVQ1wzv8amIyNcVNCxGfpNr8BWt63rbAtxXZBOQz2jKuEPv4SPHjogOYindlNqPVGLqVdFKa3MzC1yxpGLgyXXztf52QqcAmiC83ulFHFS2oP2A0kWpwt8iGegCZM8Hkhy5K7fCOwnhovRH4rVv55fQ1Bnm8p+i2lZyo3Wvnf51lieV932OIOhY8mvLMBEXrslM03AwCF2L
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(36756003)(110136005)(54906003)(478600001)(38100700002)(41300700001)(7416002)(7406005)(8676002)(8936002)(5660300002)(2906002)(316002)(921005)(4326008)(66476007)(66946007)(66556008)(6506007)(6512007)(107886003)(86362001)(26005)(186003)(83380400001)(2616005)(6486002)(6666004)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?3piQ96u0s8q68Si3BiArpxM+N+ycoT3hZA3HXblFA6xcegT9bm9toMBv7yb5?=
 =?us-ascii?Q?1Z4PCIl7GM0/8kZikAvnPbaQ0rQvyz6CR10Ok3R7sz7+pzMOsJrvQwH8cFi9?=
 =?us-ascii?Q?4Jhi4MuZ5OPeEudWU90QiRbfxmJyVQRt+7Q9JHQib1Ja+R32MhYZVfM4GvM9?=
 =?us-ascii?Q?LLlCGhW4H9IsZGfIQVoui2aOIW3IpmDcciYQoEbZf3jC9iO5XT6yxl1Fqbe/?=
 =?us-ascii?Q?trtBoAYNMJuZlkxpUaSQMwrDB6LGeLyuQCe8AHbIqiHa3BXszrOGqJanJ2x9?=
 =?us-ascii?Q?i7W7TKPsAZQiRSGrLaWo8iQI5wBNKPoO8lvBK3tITfydcW76k695IMWzfy8a?=
 =?us-ascii?Q?2u93VuNWOqK92FZqjhVfzTO78tukl4H1liB/W27GYCGgw21l4bi7t1MkznjE?=
 =?us-ascii?Q?v19cprph419fB3oCJPlyV/dN3GfMvGqEiQYMmeUokO0Jvv1wPNK9+a5q/+/c?=
 =?us-ascii?Q?eZXHpwp3/F4cJP3J22V0Df7vL03inIaEy+104Rq5d4t15Uv9FXDKZZHzGU7U?=
 =?us-ascii?Q?XfZs+VG41XFQqJWCJqrM0vZUzKnF3VAZKeasFW9Xx6Afj/Vz3ryWQsw1P74c?=
 =?us-ascii?Q?pcjhpMqc+fUwTQ0grhhDAO2imoeOh4Oa6NORBg63fGcvkDzF5DcaYoSCNros?=
 =?us-ascii?Q?S1GgiTItj2o0z24SKuuEF/xnhpl2FVS3hVlySwpt19Z9M++CwReHacHnHf+L?=
 =?us-ascii?Q?YjmpllU72GUig/43CCfbZMS7lnxwoIHJxKf1YVg51ZG/OA9ngj//4FUA82EQ?=
 =?us-ascii?Q?c9MzecEfwNZ/acAuOBHFLVWRX02eWtVk2QW5B0RjF7nMV9Jb17pwbDjhGbG7?=
 =?us-ascii?Q?xrKQ6mMhMigwDCLQWaw6D3Mn1ULs5+oaEoEyVV+w3RYSDJtplVjUNv0NWuTw?=
 =?us-ascii?Q?4HBn/sR2Dgj8RZqNnu+wur2pzzNjFschxj1YPf5+C2J3mCsXTgnKVJiNhnKZ?=
 =?us-ascii?Q?ssTGgnFQuvQcXU+Pih3srG0r3iwPUoRun53wUBhmFLobkPaCm6BZjFdbjeMZ?=
 =?us-ascii?Q?oorpqhaqygKA2hrYZuh0aAnngYT68udGdfHqnWr8lZOvbHgfOAIsehz6kjhR?=
 =?us-ascii?Q?pNC4CMpeKfsCR8tf08bFBhjUXzDzLwltAiVsqdwChQ3g11gPZlbCkgZ3XWK7?=
 =?us-ascii?Q?CWLSbRpIvnB+0QRzypkO9b5M9AGEvVP35rH2xr0Uwgi99yzb/AyKKSFQY2hR?=
 =?us-ascii?Q?T0Rarckh5ijxtvOypH2r2duedv85u2x3rck6ZOr/98aAxyJNod55A7M2CK4A?=
 =?us-ascii?Q?555OAdaAXxz5TKrdYZCibjX15xBEZalC2MznC+8/giKPPeHJOkHZrmiJD5hw?=
 =?us-ascii?Q?tBkXXDv38n5M8uBNuLz+sky5sPTh0fb2r1JyecSeCOwbSkmNw7QAiVnMGovz?=
 =?us-ascii?Q?hi6/sYfOr9OAjEEl4THj+QsXF5rBGRQH7sOYlsy/cDUiLG3feRWfWGhyGp+J?=
 =?us-ascii?Q?GpARZERouQV9TKe1S4m74FoA7ED5NzgINAI9n2imO2+uAVDp3+mumw95n/cS?=
 =?us-ascii?Q?ph+ZBhkyZqJVOF5EDsiWPEe4EMVJk9Ll0GThKsykzdzxxCn2zAmZIdjI95eS?=
 =?us-ascii?Q?hjmnrSejL3lyEKgxwBJj1htZhSmCNTagRewYtE7K?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366b4628-7e43-490f-6a6a-08db55a0a320
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:02.5352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NnKD8mry1EG3IuY7OoxHHCddR05IzlElZONQy3WDIOXB2G7dbdsUN2xoI6AVHPr/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6634
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

Robin was able to check the documentation and what fsl_pamu has
historically called detach_dev() is really putting the IOMMU into an
IDENTITY mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain. This is a ppc driver without any dma_ops, so ensure
the identity translation is the default domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/fsl_pamu_domain.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index bce37229709965..ca4f5ebf028783 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -283,15 +283,21 @@ static int fsl_pamu_attach_device(struct iommu_domain *domain,
 	return ret;
 }
 
-static void fsl_pamu_set_platform_dma(struct device *dev)
+static int fsl_pamu_identity_attach(struct iommu_domain *platform_domain,
+				    struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct fsl_dma_domain *dma_domain = to_fsl_dma_domain(domain);
+	struct fsl_dma_domain *dma_domain;
 	const u32 *prop;
 	int len;
 	struct pci_dev *pdev = NULL;
 	struct pci_controller *pci_ctl;
 
+	if (domain == platform_domain || !domain)
+		return 0;
+
+	dma_domain = to_fsl_dma_domain(domain);
+
 	/*
 	 * Use LIODN of the PCI controller while detaching a
 	 * PCI device.
@@ -312,8 +318,18 @@ static void fsl_pamu_set_platform_dma(struct device *dev)
 		detach_device(dev, dma_domain);
 	else
 		pr_debug("missing fsl,liodn property at %pOF\n", dev->of_node);
+	return 0;
 }
 
+static struct iommu_domain_ops fsl_pamu_identity_ops = {
+	.attach_dev = fsl_pamu_identity_attach,
+};
+
+static struct iommu_domain fsl_pamu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &fsl_pamu_identity_ops,
+};
+
 /* Set the domain stash attribute */
 int fsl_pamu_configure_l1_stash(struct iommu_domain *domain, u32 cpu)
 {
@@ -447,12 +463,22 @@ static struct iommu_device *fsl_pamu_probe_device(struct device *dev)
 	return &pamu_iommu;
 }
 
+static int fsl_pamu_def_domain_type(struct device *dev)
+{
+	/*
+	 * This platform does not use dma_ops at all so the normally the iommu
+	 * must be in identity mode
+	 */
+	return IOMMU_DOMAIN_IDENTITY;
+}
+
 static const struct iommu_ops fsl_pamu_ops = {
+	.identity_domain = &fsl_pamu_identity_domain,
+	.def_domain_type = &fsl_pamu_def_domain_type,
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

