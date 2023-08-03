Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C709576DC6D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:14:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=umeqcF3i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGTqC2JDgz3cF3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:14:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=umeqcF3i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::61f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThk4DHhz2yDb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESXrL9Mqf44D/KOg1NT5TNqgyEOOeXtfr1SaJdov5B5lRU8dKIn1xzdwDGPQYHarbfHMPxCHoSG/dCJCKUjlIsn0rWPQxeyGBUKVAiK8n5KpvyjpMfjUMxOXf+ar4vAsRznM1+GzQaYGbM3u+Q8lyXEdZEpPXFsXb71CS5HnJA5rzobY73fJs7v0EJYXKiEekn8BGT+sK7HgafQoxBk3R/Nigqak1zl6pOiLjNY0PbyVTpjsaDQKGxhwR/oCY0ybM0ss7GZ42MgULHnvCbp8/DkIRWPN//ZMLZFtCsXzgziRNNUonh7qqHpp/WklLFux0J10Au/bCZVjL41tZxoScg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5SXREaZAfh1crklz/cC4OCLXkXky2FC9P9De7EhA9Y=;
 b=b0TwyCptyXBaGpCYkJUiEK6T+JQLR1sBxlN+u7BWrWDqkvz5mJa1eNLStImGD8V0UtrMWkC5LiTpq51NmjF0yvXkahErq1O3oHX5l9WJlYlCUNL31eInRIup6x3vSgfmjJB5b6g45qTFC+EqC/QMnWxBgTzJO+95FJD7W7hwxxKuFBXqv/uHudsj2gRUJFfJy7Qz0oI2kN2IIDWseCEd+82LolgzsCdJyd7Wv2nNhU/R+8rx9HdXCJawXf1v6DqHQvTWQY9i3nSk/J1EXiLDqGgt/38eG87GqLdJkNddAOpHMORP156XJ3U7d1d5wrQ56Ptd4aePBGBLlf4Gg2tFdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n5SXREaZAfh1crklz/cC4OCLXkXky2FC9P9De7EhA9Y=;
 b=umeqcF3inLNqJT23vSFHQgT4YmQN9kTmm+XDjE8A/Mjlnk6cF89KLKeAaqEQI+HDsshRESQiPTQztDRsPZdJRSPg22N61LwNUNY7OHefuUDExdqiTcYWIYdAkmslBYrcdkLCfzqUQCVFizITLSAzlyaafcUjfkt8RItso7/ir5TrFm8nxYyCC+SKqGnfMypv62fPe4rBaX7aCnkcq+9jTC82YNnVxj/MEX12t0P/s7wpQQltFyeU1D5yfFoOaRvZRFD9Pa4KgC1+Ch2QtFHN2bYySVwtwadk0+Pukm8kwy7aJqzfJGbZuhsq5T+LhTzGd7qYsYcJCA04Eg/u6jPFrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:08:17 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:17 +0000
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
Subject: [PATCH v6 05/25] iommu/fsl_pamu: Implement a PLATFORM domain
Date: Wed,  2 Aug 2023 21:07:52 -0300
Message-ID: <5-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0062.namprd15.prod.outlook.com
 (2603:10b6:208:237::31) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: f8608c0d-525d-43f3-e68e-08db93b5bb65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4Gbb2Mf4AxmxozNaAFGQ5W9Mou4qSq+U5D8m/lyWkPGZhW4d23k0Bal3y77cumzIDOQG2+jc4hWpYJAm8+tafLzUZsf5J2mn7Ji6zH6xlPRkpcowzv8AucBoYXMIY+kc2HlXl7nADJwiBmPiZNRKhJLZEQHdjVpQELbBcJJjmxg7We6clU4oTq9kQ0tmgpI7Z8T1wYzm/AI0qzmZktPn+8/+GdivkIhJn3i7JfzBVzENqZDXw7W2hTBCbPCsO8h6UKspmQIN9yYRzkEJojs35aFeHI2ilTBp0u9XYJ77g5mJ8kQL0qTy1ox1dAWLouv+4vILsT4lGk6sSkQAd6ZoGuY1h5RZQAakvxorM6TCP62X4kuyt/pENZZhAyM6dCO21lGl+90VUx+4SmkTQT6aDmO9L6Y3keWjAT6+4Zj8kQqRhdsqbMmWiqY/5qm6YVO+nuqDUa/ShjvNFhz9uuUPIWQl+rWQvUeqe85u7V5Ru9PMzaXu9zsBaeF2qaTdlC9fv1xgu3dViL2b8NrMge0OYqvpTrv+MI2/WqyGntmejuLcjObhbDtqt33Osn4wC8q9Xh4c/97g4QB9AhyYsfyEuOV8JprA1N3V1YAaUPH01SEzoAxnzrghEdpX5isd5peO
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(110136005)(6512007)(54906003)(6486002)(6666004)(921005)(478600001)(38100700002)(41300700001)(5660300002)(316002)(66476007)(66946007)(8676002)(4326008)(8936002)(66556008)(2616005)(83380400001)(7406005)(26005)(107886003)(186003)(6506007)(7416002)(86362001)(36756003)(2906002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?E47TJSJrV9L26t8Tr7rl30adXkf3UONseOGMkLARDg2PeVgipaE5jBQPYv4j?=
 =?us-ascii?Q?UToXRxH4DXM42zWuPEBPEuiQ+NY2rhiP8VQ2kdFBNw6Kj1YKP34TKHOVVinN?=
 =?us-ascii?Q?UgpQMwdvLMav2KDpHOzfIZ6UlLIkIaSh06+klOwysUhnC5NZ4Sfg9u4csKeo?=
 =?us-ascii?Q?QCkYQxpI+QiA8RPuj2Lw5Z/9diNNz96KYIBkd7w+FWVgq2F0gUHE5o7eNv+v?=
 =?us-ascii?Q?pCgQT82n5mRLyDcpoRYBE9eIXPOB2Z3tazDl6u1Ie2XbIdySNu2Q8aSE5HHR?=
 =?us-ascii?Q?21xt+4YVouUr+d7XWfKf2kHHLV0Owvo0+Q1MIBhlujC3pwq+hFelhE9FSXyU?=
 =?us-ascii?Q?Ay9Ywl7+RHeOYrKEB3+hlfmF5qPCLDTc/rFQs/PyDvNbeUSMd/yc6gv1tk6i?=
 =?us-ascii?Q?Cu14JunPsBeI+D0p4quRIl9JmmMMu1Au25ZaXOpKT07L+5goV3PVR520F2NL?=
 =?us-ascii?Q?VtP1i/kDMwsTmt91W3YK8wTnMAhIeGjd3sINKj1+pJ4tX1N0dIsQIGFJUvQe?=
 =?us-ascii?Q?WgpVdP0n42y5AcNw6aNAh4fV24iB1hvXZYVFtXUGIkyPHxsVHGyeRdein4yL?=
 =?us-ascii?Q?xW15DeY5T8AiQdoTKy/Vr2iYSKxuPhA7gb6jaPQsAFjJSKhd/1H9Po026vOp?=
 =?us-ascii?Q?BSn0Qrnav5UnWSpAP1NJ3p81m4boLr2R5Ae1JQRhZoUUOomxtYM3Viq7RTgs?=
 =?us-ascii?Q?GG545mwlJpWWjbyCNRZ0hi9n+LgNhNWuNb3WHW8m164eExeVyGU0Ggj7npjn?=
 =?us-ascii?Q?P3a5qNM7Z7A7j7C/Gua6LDFQHrJCwqW9BJuj2rQU0szLD1UItIu4mlkU0zn4?=
 =?us-ascii?Q?RnMghArpjEXN9xnglQpzZXoBNZEJxsOPyxYMHDK80eouPhJ268/XG+4aFbph?=
 =?us-ascii?Q?eQBuVzmkdbqnvwQ0BsDwHEW8cjbc4MWxzHzmUsoqmOGQxGJqtISVgcB/iTp5?=
 =?us-ascii?Q?9nChrtH+90TraJM8/ZKO7yXW8Uy+PGuhb7HQnsKVGhfKC5zSzV9YRhZFmKNl?=
 =?us-ascii?Q?ZNPHgjA5nLmjeMelFuG1hQit9JAUIKhJDr/dVUUrIl8Ve49T5YaeUit75AtX?=
 =?us-ascii?Q?shbllBvCmQVJG8auWi3rKY2Rb9+MDQfITHo5xIf/KXTE0xhHoclSCKHkGsjh?=
 =?us-ascii?Q?mFlsCV7XYGdag26q3ipHD1nPxDAiEhgSHz9mc7u4tlqlr0FBDZnqp9KlXvD+?=
 =?us-ascii?Q?mqEz7EGJm9HLU0+8GVhBgFA0BvxwChlZXwjOVUupHAhphzuSiKpRsDDr+/42?=
 =?us-ascii?Q?kSiq7qOQdBQSDpZFDaiOkOvTsy1e30axEDDQuruCxA175yEt0yERFzoHG51W?=
 =?us-ascii?Q?NyOEvVYosNLvABBvMIyNFWQFWvLKY0GD8e7k4wV9455x22KiWYM9wuOHn8pE?=
 =?us-ascii?Q?+hf5Gym61BYIOJQU+AHlZHd+KGSFvIUJlHQWnf8GT/peRSNYZLAAAyk8uWRn?=
 =?us-ascii?Q?DGoA19h5ZmVWoG0LL7M5Ex6ZpQdpPZqwzj3VUdlJKuLblPfQ8/bK0ZRJV35l?=
 =?us-ascii?Q?Vdqa4AhiOuCr/HYXQM7J+htE1R/37oIpIcl1bajqDgmUB6MCzXrzmBFZqPmo?=
 =?us-ascii?Q?BLSGXTUowZsElR53gN476lTzhlB7E/82YWM5N4xE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8608c0d-525d-43f3-e68e-08db93b5bb65
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:14.8992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61y/W5f3knNiy9Lcv7XJtu4ovDzAkrkr9DiT7glzPd54+uLqce71z/RP3byPmaZm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5809
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
2.41.0

