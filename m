Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A055976DC6C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:13:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SZsBcUDB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGTp32SB4z3cZF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:13:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SZsBcUDB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::61f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThk0Hvqz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AA172BgyzkSxtCR2C8uLoaBHFJIpc0z1kTwgJjg/5TH+FDDV7eFL/zH3XymPUNOUwaaifmkdgiaeOTZncrjl7Tt2bLRvQYRDuWIAJfLjv7wxJA8QI8P7fzLKbW+uR9EUlo2GTwhB9JtkRjZqxW6OG7zDjmTGPY+YjDnNM9aMmGjptOx3UkGahB2CzffJ6FscJYe/9iJu21ZIkonUqGNpF5fZQB7GFhCO9k4evuqJsVojzHVIvGyFwp026enkrn6BHRVdd7szdkKDabzSvkQ5pzsisJj3bfhVGgzhwjeUKvKhaccq8R/A9ZR+/sApeIDlbvHkrlGH0j1QVk8DkZcLhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/uxLFw6T9ll/W7V4Vb06QW+koECiUEA49Foq4D3zXw=;
 b=HYS0uKXd2sq+5FiGUPkI12i80NkP1D6NNJnOZxU0WeY3FCTa1eY2P1/x5pzz+1E4SxlR5y4bfmX2Rhy6zkL1gt0hT6jQHlkYbd/A75EmDU35QU2X+Ho9sfBm0I4UzgSvxR/IYlEzh3XJZZnAiHLv52qnoOLQrQ/S6xsyU3dMnIP3ZaUOWaCF5KVPHxYv504AfoIVuYMQbxxocLYN3/o0n4QCUZQPzEOzDP2n6v7eCx8J55E+HWnf5HzpVoH+F4mS6xsvOf+nyhyGIysntelV7x9U6F838Vh6iLazkIdNtzXmotK7V3EqxTFoyBsr4iesw0W7hihK6f9gwdR3nqGiFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/uxLFw6T9ll/W7V4Vb06QW+koECiUEA49Foq4D3zXw=;
 b=SZsBcUDBQ8OlpHvq3cDuIABZrHE+lrQgjesaYfZXC44Qpx7PfDOuHJ65xcX1MwicFInYe2dm/OnBf1CEI5mV3Kk2DORa3O64w1cYMl5AYAJlQO1xOwxAtOMjLK/46gccpNT+qK1wiet0YzYR2DC/IZ/OxjSooQoRYfIN1osFaUPxokyYnDDkAjBwbiGAj+4mQh8g9Hg7+lCMY2PDt2bPYN/FumrAk74nUu2yIENwABl8ClRgphNXVjzyPjLzZ3PSKH7vxFA/RGQgJtW8ZKLR9vu697i5bHG6GbD3FmoDP2JleNvS1I3A19b6It+FGqEFOn+R29CoVRPzh+DcTfykZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:08:16 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:16 +0000
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
Subject: [PATCH v6 25/25] iommu: Convert remaining simple drivers to domain_alloc_paging()
Date: Wed,  2 Aug 2023 21:08:12 -0300
Message-ID: <25-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0140.namprd03.prod.outlook.com
 (2603:10b6:208:32e::25) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 76aed0b4-7a47-4ecc-fb43-08db93b5bb59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	d9V0WfQLWpAns9iJCJcDCVyhbw3SfELKZqw5ct5uCW75vXDviK+YtOZ5Q7GU2DYwKVpiVFs6d95k51+Ec3x4feMMnCIlAwOCZxGd9g5xj+6aPvNRRjn/HVpGsFcjhexUrj9+gSbs6MzdhcpGN0eqVskrOw3p9iF8vZKLqUofPQFQB+YD66JZzLB3SP5S5TT+j85l3sC1xafY/Qrh8fLZ16B4WzEHKs/dZqPYVDTp8eSEkpNOuAhXBuNSuLZjhp3Mv8BjS1yNaD37Lq0dCRsx1d+NE/44SqGxNrJT3+PEa4zgBWm6DdSBQD8nbitJc5KJG6870w2EpTg0DjTIMGxupf47cWwGYvAAymC0Wo0utuuZFmIVN9lLKc00WQla8eOeZkyGnCxaaqESfavJmjjI5apQlCWrDisVIvOCAmnRYHxPdQEyBk/ckwDNGi4lTTIX9TYByDAC/D0j3bj8es5UWoF/8mZr7s8zn2CFxJyrEGE3gY6sUEQuEPKnTWqKAtEuRvckkxEpIQFPRm3D2tpWHml3ywxIHWy0VQxlcZ4lQSqWC0G9IxTuJEDyaoFYwa4+seoeMU1uYU92vFKfgF7MUn5K9KhITLleuWkoLZxVPL4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(110136005)(6512007)(54906003)(6486002)(6666004)(921005)(478600001)(38100700002)(41300700001)(5660300002)(316002)(66476007)(66946007)(8676002)(4326008)(8936002)(66556008)(2616005)(83380400001)(7406005)(26005)(107886003)(186003)(6506007)(7416002)(86362001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/F0PRCaaw4vFFP1W5WoverMFLO+cFAK2M1+MtOS/log9/Gv6XuMLTpq0fePP?=
 =?us-ascii?Q?Vd4pnD2hw7tWnhy2kWoI1Q5ll2PSjEcZ1ZZDqAB8OH6MFwV1KAjVse1NrMQy?=
 =?us-ascii?Q?wsxvorhFE3ZsPI2YQk41SkFRyVPk+FAopaxKzXbg5gxwkKWvgKn+Vem50kNp?=
 =?us-ascii?Q?965lAG/rpGL0N4j8LEvm7Xe95pIGM7I76gBKim1w/gPvcYAw/N3Q4raJ7Rto?=
 =?us-ascii?Q?/eOxoWMiy1210CaDfz5x8FeAVO1s2wNeho5Lw1h7F3h00XxyUmXsojrNxfqn?=
 =?us-ascii?Q?e0egVyHfsKesSP7b1u8s+LfKA+/9hVF6LsBQYbU2WGoApuNWRlCdvN2MmTcQ?=
 =?us-ascii?Q?7i7bwfWmaWZ0l7yPWp7RSs+II447Raa7F2XbAVITNxXEQpc19IJrswEBxHv+?=
 =?us-ascii?Q?VBHz71tV9YcJDqShXEFThveplTMoFKNIouqDps7z4bbJSpd/yWKi/hpfmXhT?=
 =?us-ascii?Q?XczgFnJRuARtJVN8ayBQW2SiGpP6V1a0De+Cu9iFqkmEgJfsBzqUyH6YtZ+3?=
 =?us-ascii?Q?7vvWUBjWMCdmfHTIpeAEml8OSodFagvoniUQ+hlFEZSeagWycDrIrFeprfeL?=
 =?us-ascii?Q?J/T9/wx/pHedDa91ddLZD5XUtSdSAvcmioNanfc6oCOVIax6H0uT/4wf5Iva?=
 =?us-ascii?Q?9BA7fP0eD9baBkb//aqoiDOuzd4oDUyVxibS3uQKanuQm35FkYgUywgBnUxh?=
 =?us-ascii?Q?+H7hspUBVMTNQNVIHIpDeoXsMVceMWqZ4eWGky4BtDA0R/2Rgzv29IdSUjYD?=
 =?us-ascii?Q?uxflIcMu/bCcBZOHeiPJe6QFcR1R/gQE6vTbWLvx01xb2+R76bwAJnPcnoam?=
 =?us-ascii?Q?b+PlVhV920NleITCojPqPE7dtEMskdzgxhuQgCGHM5zoccjdsYuwCU15ZiO6?=
 =?us-ascii?Q?fww8Q5tAoHSfIUcwnzlmhPq0OdVsZqRX4Pqx+eP1anNcKy7w5Gx6Vci3bi+J?=
 =?us-ascii?Q?paWUcQh4a7KRzDKlyqEQI/tIaqn2U24cSuMNiRbNrU0UsfXMJ75gRh4fDTKs?=
 =?us-ascii?Q?M7yobxAV2f37PwPeaAcqy66KrAWCar71dbNtzz2+ntakSn9aiM71whfYoH9U?=
 =?us-ascii?Q?fkg9mnNxrNLPHNM5UBf9ZCz8SQXWwozklu69GTr9Rd6koynRXZeud++aaT8V?=
 =?us-ascii?Q?hZdQRSOyg58rUpF4cdL+y3zp5s1hB+byZeKnxuQXOpBMGbpEqiv3ywZ+oI8s?=
 =?us-ascii?Q?LZQ4glMJhRBJsbPmLuvFsV1PTcwd/hhpAr9Y0u9Bw0/7JbsXSYaLVWweiU/U?=
 =?us-ascii?Q?MffU0IMPjG2iZ+f0zwNZIKGKK+4Gx8i1RHxUld0YsLODlPpnx8iroj30RGBV?=
 =?us-ascii?Q?jBTmw7OzClcnNzFjtFRWDMFx6Ou2Up0xV2XxKXeAdUjrfdkPrr+nisQzZ+sa?=
 =?us-ascii?Q?sdx6VsQvfB0iNHfg2CZxz21Q5PdljsPeR1sWOqWv/m/fpN5Sb4+zxK0nIixa?=
 =?us-ascii?Q?nl3+1j9leUZPY5XntlLAS2YuRY49F/vR59gEcrP4ZyZsmp2+E78fx6wlNzb+?=
 =?us-ascii?Q?53xTe5MhbubG4zUqYy+tLhwZ3A1prJw77ou0WctlgK/MKgrHUbSvAatRpngC?=
 =?us-ascii?Q?pETrQ6D02OVVvf24LEzxCQW86/jEi0ap1AgXBIIG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76aed0b4-7a47-4ecc-fb43-08db93b5bb59
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:14.8045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b7YO9+kzZyULdrW2J0Aaore3W2eoIPOKf6av8YZ1VTvDdnyovarZR2XfWodrtdHH
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

These drivers don't support IOMMU_DOMAIN_DMA, so this commit effectively
allows them to support that mode.

The prior work to require default_domains makes this safe because every
one of these drivers is either compilation incompatible with dma-iommu.c,
or already establishing a default_domain. In both cases alloc_domain()
will never be called with IOMMU_DOMAIN_DMA for these drivers so it is safe
to drop the test.

Removing these tests clarifies that the domain allocation path is only
about the functionality of a paging domain and has nothing to do with
policy of how the paging domain is used for UNMANAGED/DMA/DMA_FQ.

Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/msm_iommu.c    | 7 ++-----
 drivers/iommu/mtk_iommu_v1.c | 7 ++-----
 drivers/iommu/omap-iommu.c   | 7 ++-----
 drivers/iommu/s390-iommu.c   | 7 ++-----
 4 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 26ed81cfeee897..a163cee0b7242d 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -302,13 +302,10 @@ static void __program_context(void __iomem *base, int ctx,
 	SET_M(base, ctx, 1);
 }
 
-static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *msm_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct msm_priv *priv;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		goto fail_nomem;
@@ -691,7 +688,7 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
 
 static struct iommu_ops msm_iommu_ops = {
 	.identity_domain = &msm_iommu_identity_domain,
-	.domain_alloc = msm_iommu_domain_alloc,
+	.domain_alloc_paging = msm_iommu_domain_alloc_paging,
 	.probe_device = msm_iommu_probe_device,
 	.device_group = generic_device_group,
 	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 7c0c1d50df5f75..67e044c1a7d93b 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -270,13 +270,10 @@ static int mtk_iommu_v1_domain_finalise(struct mtk_iommu_v1_data *data)
 	return 0;
 }
 
-static struct iommu_domain *mtk_iommu_v1_domain_alloc(unsigned type)
+static struct iommu_domain *mtk_iommu_v1_domain_alloc_paging(struct device *dev)
 {
 	struct mtk_iommu_v1_domain *dom;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
 	if (!dom)
 		return NULL;
@@ -585,7 +582,7 @@ static int mtk_iommu_v1_hw_init(const struct mtk_iommu_v1_data *data)
 
 static const struct iommu_ops mtk_iommu_v1_ops = {
 	.identity_domain = &mtk_iommu_v1_identity_domain,
-	.domain_alloc	= mtk_iommu_v1_domain_alloc,
+	.domain_alloc_paging = mtk_iommu_v1_domain_alloc_paging,
 	.probe_device	= mtk_iommu_v1_probe_device,
 	.probe_finalize = mtk_iommu_v1_probe_finalize,
 	.release_device	= mtk_iommu_v1_release_device,
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 34340ef15241bc..fcf99bd195b32e 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1580,13 +1580,10 @@ static struct iommu_domain omap_iommu_identity_domain = {
 	.ops = &omap_iommu_identity_ops,
 };
 
-static struct iommu_domain *omap_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *omap_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct omap_iommu_domain *omap_domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	omap_domain = kzalloc(sizeof(*omap_domain), GFP_KERNEL);
 	if (!omap_domain)
 		return NULL;
@@ -1748,7 +1745,7 @@ static struct iommu_group *omap_iommu_device_group(struct device *dev)
 
 static const struct iommu_ops omap_iommu_ops = {
 	.identity_domain = &omap_iommu_identity_domain,
-	.domain_alloc	= omap_iommu_domain_alloc,
+	.domain_alloc_paging = omap_iommu_domain_alloc_paging,
 	.probe_device	= omap_iommu_probe_device,
 	.release_device	= omap_iommu_release_device,
 	.device_group	= omap_iommu_device_group,
diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index f0c867c57a5b9b..5695ad71d60e24 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -39,13 +39,10 @@ static bool s390_iommu_capable(struct device *dev, enum iommu_cap cap)
 	}
 }
 
-static struct iommu_domain *s390_domain_alloc(unsigned domain_type)
+static struct iommu_domain *s390_domain_alloc_paging(struct device *dev)
 {
 	struct s390_domain *s390_domain;
 
-	if (domain_type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	s390_domain = kzalloc(sizeof(*s390_domain), GFP_KERNEL);
 	if (!s390_domain)
 		return NULL;
@@ -447,7 +444,7 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
 static const struct iommu_ops s390_iommu_ops = {
 	.default_domain = &s390_iommu_platform_domain,
 	.capable = s390_iommu_capable,
-	.domain_alloc = s390_domain_alloc,
+	.domain_alloc_paging = s390_domain_alloc_paging,
 	.probe_device = s390_iommu_probe_device,
 	.release_device = s390_iommu_release_device,
 	.device_group = generic_device_group,
-- 
2.41.0

