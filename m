Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 481B972A409
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:04:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdBqS0Ll4z3flp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:04:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BKYrg2k0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::610; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BKYrg2k0;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBfy17W5z3f7x
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HwE07d6nUcUPbcn5Ft0y8VJdw4liT38tmylgMa8beP68yQumRb0IwURKEBWUU8c66dht/rPUb14sFz9B4IxOc5ECOLTH1TfItvLwY1DIKMGzTOeluG+8NWvy0+1GoRQEGWjT4cBV1YB+fSE+1erq3SWqbGTpSQbmS4lhizduvLKiB7ClU95b8HP8XkOCRLO33YMYSwrP+xIqGg/wHt9KAwDDMt6/PUOcaQckImbivOWLkhGrGxyfaZxVh9Q2qUFQ10L9oYGKo8NOlCQ8MqoE6WmzH6M6wWqosl9MRPVn8JRNvJlBgAhoLo1CjNuamK4uPli5qVSxxN8V9vdVNyIQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNyTRyxbNWq/jd5aCXqxAkKB4mcTO+zABe+4bu/mqLE=;
 b=PHky4GH4Xf2OA2sJnM/DwCLR9Guh9mfjOtbpbQEsT1fp6nb1I045F/uv5hB0TYpFRHGMyB7Q77Ur+E7GHgu7yXTyBJKPrUzTpX7mehEWpjP35XJAfWIT/GQHATp3AtwOm8TJctkoHWZRpblljp+/HzjPkoF6r+7wUd+npSvwa6vcov3Yp0drNS/7lxV98Zk7yqJ5du4mS7eGZkC+GZvI/62s6+dI/thu1S7uD3DTclKOkTLeX6Ly/HwASfyVbevNggcD2lXA+mYHVrDIgIXEIFyHSg2FpHI4pP0fmo45Cp1r/0+qnrtdkR2qNibKL2Lm3jHcTRkuWfmj0EaygEzNuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNyTRyxbNWq/jd5aCXqxAkKB4mcTO+zABe+4bu/mqLE=;
 b=BKYrg2k0u0ILSYQJX0IQyKK9qvww3ktPficLTDZAROrbPNuJ2IDH3mfHwO+vwwgVeh3ikBufDl7ZOEuPwPWO4l2tQ5x0cuOaeztdBOpSzZCh6eYhOiqVEiN40L8srFplquiKRSoKyBKk+nzInCvSctF6sFI8uu0K/ZfVaMDLpepT2ouORteLSqoYq7F5sOadqIsGK5krX2pg39vorLNhzno2iZh5tFEcZZfeBiH/ArBCNNRthZ/gwavHqZ1gtg0/ipZFld8ibB7BuzePG0Sjjrks2QQ/ulWOTtwUVJyAbQNXtIe7g3+mfjOBjxa2QEZy7i74X3ZGtHMWnx+AWsXPIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB5264.namprd12.prod.outlook.com (2603:10b6:5:39c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 19:56:21 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:21 +0000
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
Subject: [PATCH v3 05/25] iommu/fsl_pamu: Implement a PLATFORM domain
Date: Fri,  9 Jun 2023 16:55:53 -0300
Message-Id: <5-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: dc09b036-3b27-4070-fa13-08db692397df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Bp3k+FpztduMrx3QZfg/nXNhYNgK6TtCoufKjp/P/ae2i2E4KRz5qjlkLlcB3EiO2/y0wIUbROmPnW5yNege/namDj/VbdWbTMJsXNPvZBmm78YEoHREa776Q3COnmgZaqND8uyPriiMAqWqbaVGVpJp1JFNztEoYtWzUJRVzo0nQa6jr3pPnKd5jut7DOV2ynJGUO4ySkZvt+D+Sm3vj7HMZv1AYB81FhxXRfJPaYBmCWYZhGmudyqcXNa/cjDR8Ltwq/q8rbTGitGqsd+qAzQhYezciXzO/kl1auYlAZapMp09sWtqdFMvlPMUs3uEEoJpJjSVxceXgZzah04czXRdvdz1M4RbRciDw2x3RZAXwE9itCXD47cAPxsbo9AEvyjh9m4zno2Pj7ZjxcWbXEmv4mizjVK//TZCikd8dlXzpRVQBr+mcxCq/qAsD7KRVxEzxhe5wjc2/++2ri8MNjcswaGReF8STEPESCk3Exh/BLKGTLSeQdD6fINTmcWnieFr+D5UWbn3jvGuBtswfWvrPWggPUeK2XbyKLDlFYzagXFtQeokh6nCtNJ77rh70CMnjzMs+6vnGYojgRkkqkSh9PipurDhNW7VJrcx3a1uo9iDjoNMxLP0KtSuiqS/
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(2906002)(83380400001)(36756003)(26005)(6512007)(6506007)(478600001)(54906003)(110136005)(107886003)(6486002)(6666004)(8936002)(7416002)(7406005)(5660300002)(2616005)(41300700001)(66946007)(66556008)(4326008)(66476007)(8676002)(186003)(316002)(38100700002)(921005)(86362001)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?T0yPWI2H1PKhBeP215/wQiwm0tuVUKrlXXGQQCi/V81xqX4WIXdAa7CyOWtu?=
 =?us-ascii?Q?YJPpWpgzl6eFZKJ/HPOIxVEf+CbSwBWdw0cqJJsIvn+3dXZ6qvXYkCqZn2UU?=
 =?us-ascii?Q?2gHm/y2fvBoOBOX+EyXiUT0LgNKL2hjHcuiGP5v96dBsfsPDdhPwYhMQnB25?=
 =?us-ascii?Q?qLtXT0C+Juyk8CMvB5wLTRxsXrRsOKjx0Y7XEXN+UWSEWZBVE/VTWolbPZgV?=
 =?us-ascii?Q?fDnEdiifmrI4wcUCoxvnZSfVZQfsdWWky0SyTt8dPf8Fs+0AdelUx21KzObJ?=
 =?us-ascii?Q?mILjayq/G33QVs37YhYBgIymeoExujzLex8XkNzVeclb3CL0E6JmAP9urY7a?=
 =?us-ascii?Q?srpne4JWIKZ3phnIQggUMKKQrdLsEmpWIZ9k+GfVNLK1ZRZBISXhFe6uCpRx?=
 =?us-ascii?Q?z6k+mQ6960oaNr+PgZRtZwPmXi8rA9zS1FOaDT0DQVAqlFiCtk24MYG+dUjS?=
 =?us-ascii?Q?htJaUFd4UVMHWRrLwjk9++SCEKOoIvOsdCCS2EnjQ0Mi5g7nL7PqZNG7qHL7?=
 =?us-ascii?Q?ffbZRnZpFdzWCvWFG+CoUB2QTuuA4HAF7qkoRViTr7zK1Btxu+xmdmC3So/C?=
 =?us-ascii?Q?eehJrVpdyDiKCOB8fjgAt4UJtSCRDZfIlucHiLfx/gsAjUgHj4AwflfFvd7B?=
 =?us-ascii?Q?Xi4V3rcj6UtkH2VBapOnKBgf4CVAcebQZQJKgUl2TZakh3Ld/zWUGJ1dMFRY?=
 =?us-ascii?Q?2LuGrip09utdS18BNUhkciw22pBqBEKYHzSJVF7uNb9ujzbJkRc34f2tKiIR?=
 =?us-ascii?Q?izeh167lsMdvzSb0Z03oyuwLb6qwrGbavl1Zq90K0ns9xXzw15Me7xu4+vbB?=
 =?us-ascii?Q?M3VjXjEdlHytnbWemPlEoP1eZjbCH0v55DoYpLBuaiC/0MSWM8k/P0pJAAU0?=
 =?us-ascii?Q?V1hzkcXy0EB2fHhE3N96v1gPEFc9OOPPiUXepBLalC+oj7/SEFLV7QQMInHO?=
 =?us-ascii?Q?85kx3Otrwqlx17FShB6L0/ZhYMBtkx1Gx5GhjBht6NhgDtZKwzISKIJAgP1F?=
 =?us-ascii?Q?ylRNpzIZIvdL1XBMihN/vMmiCbmGNArvKALZsDXtnUDNraT7dPjhRW+Zqu8f?=
 =?us-ascii?Q?AF1uRlUKRlplmISO7/mLRWCa4c+GAag+pPWTj4xafl1KRBXPdb4SkvoWrw0Y?=
 =?us-ascii?Q?uAPkrw8IpsNy9+jvrkyVN43X6n3hVohPQC0k9iZg9OzqiMC0U8KJLnBkbC0f?=
 =?us-ascii?Q?tgRiYyari54OH+xqZRxJD3UgdewaVIQqy79lZt8hmyPslYDDk5Vrh6j5n/ch?=
 =?us-ascii?Q?sQyXfiPLGnLr6f4tfHN53u9x0HltfvaX+mCyYjI8djUcD6j0yVFb0uXCijlu?=
 =?us-ascii?Q?DXrRrfVVmN0D5aPKIP1D/ZsnS/6upQor2fQe0lJ3qbylKZHz+HmRnkVsnpcE?=
 =?us-ascii?Q?C017frdc/MhNlcueJ/ZMoTV9X1+FDju1J9NLWXfpaE2HRQXqr94QOOaFHPsF?=
 =?us-ascii?Q?gCl++l8vVMhdCcguyCiRhzG+tbNKXVvRGWQAcA6242FuEbtW0z11rUPOZySQ?=
 =?us-ascii?Q?HInP1oCTt/7AA1S/YkbgGqTm3CSWiW8pSpiAIRzFIf3eTBt4PgPQKuUfVWSs?=
 =?us-ascii?Q?C41zToC8rxY/auXL8e58bDsMAzzUOh7lMIteU+9H?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc09b036-3b27-4070-fa13-08db692397df
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:19.7093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnQ7oErbksC+CGScW2foijE0RdCmlcO25ETyTWqkfJ0SgYUovsWf+jA6+d/aSSSC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5264
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

