Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8392879E9F3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:45:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=apOnIc47;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm1sv39Fjz3cGG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:45:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=apOnIc47;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::60a; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1s30lqCz2xdd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cR2tRT36dLFayp/Y2lcwwAlQ11hAFBvPOX5dB1W/xzvZsbJV3siuADzj4JXmhBmfOIZHrMHEvlaIfyvKIpsl81ED0IhePIUU07uzGAPmEOiQo7xga7YYhs+HfElKCMGSwKOcuJrkXtNFwJjgoBDi1obAEhSE1gI2ZmPLsb1FzhwA91UZsnbwWzQAxAt7I8vIOdK4BNCAl4p3WOu6Vy4DKKKSCxs3kDpZ7EHyVzQebHdkMY5UaY0Cc6Nfku7CfbzLmF+ux5kxe8BtXPPgEQKeBSft6ckPi+1+Q0e6c6pFh7uZiiwsu4SQ5rFTBGxQN7qZXGCBFsM4pTuUjwrbIsVKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2YV82KTe9tTn6wXwywS38VBJ/YQmzoHk5lBFezbS+M=;
 b=PtKVnOmkBUgi1ywg4vceJGDYUQdpq+pzUlCLS5LEwJWg5rIRttwYwOLx6fGrcB28FkFx+3W9yXNl4dW2iy30zFdTy5kWuXhc/il2iB9iumBQ9tgaR++Iq85/1j+HJHBrlZxJ8InrGq0Ie/K5zkWN4rXLCk3g8BepSfGhcJAFcMHDBfM5oW5q/ZpaAySKT+kF100799MFaFJaT5mIFoBi+gg00WAuaxuGE+OvsEmWPc8cjRvsFXfhu/edhgUBlajOYJjNpn9GWxAS/M+I1iE4oMTmeQikSPR3iaCwLV61sCIPsfy4a1CW9ybjeImXdTEQCGXKrznqp29S4pDXc00q2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2YV82KTe9tTn6wXwywS38VBJ/YQmzoHk5lBFezbS+M=;
 b=apOnIc472rN/kplTzr1X8p/DKnzclOA07YcySTxc4hUdLuymtFZRAIWVG9ygYoyxhpbd2OFeIWgyoiKDLvx96wOekFYWyJb21AixMmXwnv/wWTSYTrTgGiCWLmQb6sHXPgJiDq0/gnCcEfFrn/6gF81xFqvq8Q2qj5fTCbRlf6lmtFtYebLUhUSjFIUpQdluLVbTCV7Na5nfk6G47UN6DFrKanp7bwmad9Pd83cmu2nBlwyZFEjZg/qzfl16ejkYDyP4XPJS9XoEtw8Bd25ZaNKIiHObYszF0QZiQOMc6yh7Hs8uSmABGD80mAF5Cs9mE1CoUhet9fTHclu2oetFLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5096.namprd12.prod.outlook.com (2603:10b6:208:316::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.40; Wed, 13 Sep
 2023 13:43:59 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:43:58 +0000
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
Subject: [PATCH v8 05/24] iommu/fsl_pamu: Implement a PLATFORM domain
Date: Wed, 13 Sep 2023 10:43:38 -0300
Message-ID: <5-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0374.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::19) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5096:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b65053-2dd1-410a-4ed0-08dbb45f7b2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QK+SVRoe1GYmeuALXotx91V9+Z5HB1Schl246Zs7lNEJU8SdcTHPVPlMn0FiZZsGt6c/p2WEspesWhnqcxFsW88Eti5JW0peTLjvR/TuJnfijbzdW3Vk9cECbnMRf9+frgINi4DV9kB8r9YQZBipsghkfJa+JGPEDRm9V2y/qmHSe2BjaJ+vxLQ5lmXMlPIlkIMqRKlQjhPJbe4xsUfkxphGwAkM6PTpRWG3RVQW6XsKOdrIm3iMxAIEvCzfw9c46ICTJCVlLlvQ7b8KTcrKNUCFIMQQrUADoSI6aV1/Z67BNxL1bhgly+ul7cG3tvGKjxL7CpuIP5kt1hsUqqRIqwJHVrsvshToJGsmg5WBwPbNoE/sPs0LT4B7xMhRWWAPJ62yrOUqqKZmcyPvN4fwejkkhCiqQEJ0wbdDucwnT9U2M60xxFmudjvQTO26k5xZlLTl+nH61ArZldOV1k5ScmjMPHIi9MPYa6bHKkqA9pVPwcj3h9nrDmlY3majonIw0Ht12PZZet62ucHV5P2pR1NI79X9hlLktWrQLe2W0UfbWrEKHwThazsqRZBJlBM8XRujrPbkLYUhZfqrh9ekNdSR9G/0hT2i1IvTfXAlh+8slDMvGyym43mEo86pW7qb
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(1800799009)(451199024)(186009)(26005)(8936002)(8676002)(4326008)(6666004)(921005)(38100700002)(2616005)(107886003)(478600001)(5660300002)(66556008)(54906003)(66946007)(110136005)(41300700001)(6506007)(6486002)(6512007)(316002)(66476007)(83380400001)(7406005)(7416002)(2906002)(86362001)(36756003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?7JMzYFtm89P7Cupcn5oZIJRilgeOBkOFwhCeCM2m8NffMFP7q9G3sI7Y443W?=
 =?us-ascii?Q?qzWzkih2i9fPmlzJoKe8ASLm4DIa6KC87oGzV6WBzVUuWENfGYdoksIYE0b6?=
 =?us-ascii?Q?T42pph+lkkuhIJVnFccWBWeSsm5QPQ/3MV0PJJmwGsck+FfGhohDnPReb0QY?=
 =?us-ascii?Q?6roCUG5eX1q9EOOBmITbapL6FNTRH6g4T9FNi/OeUWlayFhzO/TCvUWYqCaT?=
 =?us-ascii?Q?KSyL5Bh0ZpbIuhdtN4p0orwJJMpTLFTkhOYHVZ4f9KHiJABUWZLBsfGMZysC?=
 =?us-ascii?Q?dKPtXR9JL7EZZWtf0q+rSw69ywLZbD6E1LAIIlkg5gfnpyXUAeSE1hPT/ziz?=
 =?us-ascii?Q?08Zv+3CICNgC2UYY6zrKtJm23N7dF4pBkJafeOnr43gl07wST+hYuNSDJPrd?=
 =?us-ascii?Q?FnG6bHd3bhO7AroQH6kv5QVrtCpeFe9+4/JEfxF935JEOmN2xzPY/Rnx3ENY?=
 =?us-ascii?Q?4qMkMtw4K6SiIGsmgJ030Wfnqrx8A+4aTawXSrjEQz9zRgWIdE+04KPBrrt6?=
 =?us-ascii?Q?29urmRYc89GwrM4HhySaTQX+ZDv599WkNGcA4KsEQ5jROi8LvwH/lKvCAWz9?=
 =?us-ascii?Q?ngu4LvEDDngFVnS0NYG8P1yl4u7LiQwUc5pYXqGZnYZc6a6wk0rWIBlGmu/H?=
 =?us-ascii?Q?KscIFoQUpv2sj5iWPVvKg4cNp8wPY6Rb1TASseEEMzSdhEaLJz7qJ46dwGQC?=
 =?us-ascii?Q?8rkxTgLYVDD4cq+y6sw9ZgbyBfH2VT5B45JP/208zp34d2YqSO2YtmBgiy2Z?=
 =?us-ascii?Q?igxcMkriF+JcK8GXMGhEvfve33er/rRXHCH61zanOlHocAzoee+A2Hq4aDL8?=
 =?us-ascii?Q?3RC9Om7NuaX/7l3atCy1KTKKessJLSYkWc0iH0ApWnZSD+HmHC1oGrGXCaDi?=
 =?us-ascii?Q?rYX/H2F7Bz3IIjRtYopGch/8TiWUVVV1X7UW4MzLZ7ZMO09O+cf1ORc2llxX?=
 =?us-ascii?Q?nhqXuRlj1641hTUkX7/925W6fyfhXuqwjm/Wm5zM2Rw1v8npEkkb4fDe/HGI?=
 =?us-ascii?Q?snpRQ/BEiCIXGYPA7+EA69mIbDsjhcGDH2SZp3u354881vBm4U3AiNZTV2HH?=
 =?us-ascii?Q?Wkls758t0VyKRwhstmpYUrsW7QJY8V+5I+OJ5CtFLdKHtE0o/vH9ZvKtzZzH?=
 =?us-ascii?Q?FnOD6F2ya7n19g3fEOymvhvgxARHIW3PTT/dUeyQPoUdsrwDo4hTBBg3MaIr?=
 =?us-ascii?Q?vVPDlw23wbOMMMAe1BrolmRGUkiGr6OQcDIWnMo8UgUpLM1FeBwWiRi+hEJq?=
 =?us-ascii?Q?ja4VdEUtN1w3z2h6XQJW0Jeofmf/J8u2bGbIp28TgehkhmuKoQOyQNButhK5?=
 =?us-ascii?Q?Yd182Zr2ujyryt0wqXv54Ck/JLdsgH4jRq/+4ngW4sWet+MQZBzjTAnsHdFD?=
 =?us-ascii?Q?1EWGW9cYoQF5eLCVemX3bsRLBduIWe4aeAHTS2QSsqdSZGInW38sHn8L6u6n?=
 =?us-ascii?Q?rMkh8Ui1LOmYvw9JkjNGQa0q98nA1dbnm4ZnJ3LiocozUWwOQfqiujyG/hef?=
 =?us-ascii?Q?Hi0Fh5y9BTMwDp2POxsX79FsF5upMHAl0QkZnZMll+UqTgeXXo8UybaZKf86?=
 =?us-ascii?Q?vK3iCtoTquZwgXtgY80KNX160tAQbnI5iHxnBiMm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b65053-2dd1-410a-4ed0-08dbb45f7b2e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:43:58.6553
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMPVIg6mxgtnxTIGYCrMiXvRV2XJG4EhUJXtFqMxaGxUNpLyKL3Tye/W9QA5eKx2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5096
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

This driver is nonsensical. To not block migrating the core API away from
NULL default_domains give it a hacky of a PLATFORM domain that keeps it
working exactly as it always did.

Leave some comments around to warn away any future people looking at this.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
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
2.42.0

