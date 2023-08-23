Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56189785E0B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 19:04:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ut9vtsAs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWCJ915WRz3dWX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 03:04:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ut9vtsAs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::616; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwr1QmTz3c82
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSuBD0GSa/7494/Eiz9lD8Ymc1nhJBDA15oAvUdENRj8l55kw3pP0G1AdCWWxkLVDoH9ABcNZWOdhYC0P8bbapQY3RpMUtz6waaJIQbKUF0L3889X4tGq9B/pT6PuLE9u8hjmA3UD/OOBfX1LFiGGX6t39orJSTOoregogSgWSRzPEZz+jSK8imDQjgMyQz8yelNdGEW3UlZZiCeACdXxFs400Hjci6GhZ42u5n53C3IWD87lzngmcq1JASoos8dgfk0zgZdHhLk06KRu70GQ6tZrh5Yznda+R9ba7l77kowA9t8GH3fvzhCX4am6CH5HGOmj7IWlJHsz5XipzaP8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HNqQnpS6tKtGe02JJTfrdZny6t7WOXpQWChLYDsawY=;
 b=EE2127GWwuPI+nLhiNdq8EOTZCl7x3uzzYTIAeRtdNsa7SpVv7DVUQJ+yLBsJwhHSKY+EoBIZjpk0+Az5aNE3udbO7dDoIO6W0+dUt2WSgqzp+Fwdstkd/S3nHRRUH77ehb/hjFs7DrdTjYNdd64VuX2v6kV7sZE5dcsmRTfzpwCmMwt+7iyxl+fkKsSqVJNN/fbISIIi6k6x1cYdk8JMPwMh2apmhcnJ+Ir61q37lR1afiVfu//JcC2Zrr0WxIa5fm2yiuIEBzrpU31si6i8HtuoBlud0tdmDEkYblQZ+KlmytMjjv8TcrzIUp8iee30Rk9USEasCf3dgPoAZuARw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HNqQnpS6tKtGe02JJTfrdZny6t7WOXpQWChLYDsawY=;
 b=Ut9vtsAs7THaiOFepDazS61gVv2AO9/E6mDCyMKj2Pny1frvggSk7a85BgQb2Ma6hs+zKOCv4VptaBDN8fQv9wZszpn56hmXvT6kiesl71vmNYJ9uiGhlT34bdESYGSfGXF5Frybd4uOLZlmgmwaPgTal4CCPeHyDyaQjz/8LLRCZQkRCKqDW/ZUOzI9ZyYq8N6kyQOUuLMjvNzvjhb7jY0qVhPQnLDYskEAXrJ57Wkzow/62rw5QV+jrQpES9/Ylew49VGiN/3DRodmm1+YDTI+8pA0tXfvhCSbjr9106994zQfuxZisIg4obmW1UdNJpqkqdV5flfcFjloHFfYXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:44 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:44 +0000
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
Subject: [PATCH v7 11/24] iommu/tegra-smmu: Implement an IDENTITY domain
Date: Wed, 23 Aug 2023 13:47:25 -0300
Message-ID: <11-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR20CA0008.namprd20.prod.outlook.com
 (2603:10b6:610:58::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: e215f86c-ee99-4c72-5a01-08dba3f8aa7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+C3eNgor5u3VzuvbmzSjtMwIIlJyTgWSHRKhCaONc5g2DJ27kq9KzyOSJDizvDTB5tID4SSo0VlFX/E1g095vPGA/I7R31XMQnjEjTn5WWP+lxUJm3sp6naeuAV5qcFcYIJZhdPcFUDeY07OPujoL91rUF8S+F9b7Uok290e0bPVHsQaWP37llL8C2gir+Y+n3kB4srtQMbXSzyWpAu4K9zpPtjHvf2RAyqrs2jopUNmkiDlhxoqS0E/DKw2KgbeGFLm86XPlzvy6xkrXN5kXiHAYYlaW91ExznS//RH19VrWKfX2Ma9CGVkmNslVep+zZpkmKdGJ4fkmsiXshgnrcSabW4+HQjE6cBcWR3XLjWpHuK9RZU3I71pSkLpiNvlOZACRDHE6gAQK8C0w/V8NU1C45eoe+cWPlaTf/2XFqdqYNo5ewGRHqlimRbCcIF9Y2dbrBIMaY3ROTr0yU3ECL0HlpsEX4I0suFGsnB5pAWFziOexumGQnJpEITa16q+kixwRxEnsZ9q+rDnaphDbIFM2sGEyF275LReUrMFVln8DmvGeMNfKyDiBYATG1Lu/JFWSbkDq1/xjxo9/DkQ4nCcnKPPW1rkWR1m9hVfsQg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?mKknSh9VfhZ8SzFyYFdBrftSoJkv+FV6Xb8bdY/Ynw6vLAP2j89tacakjcuN?=
 =?us-ascii?Q?mUOjEfl7jiNbd3uBS8SCTAPdvZRfjo5XtTK/EBWqNgraH5TGrlpWbQS0usiZ?=
 =?us-ascii?Q?10F2gdx9lNj+gJ7zpYbTCPpNFMICBIBv9H/xpdTgQezgqIJpZmbOU8f/DMlK?=
 =?us-ascii?Q?NuN5km2d5NEMsK33IOVeDCN6QQl9iRjsV8re8m/UncyJ6FCT+MKEN9k416CC?=
 =?us-ascii?Q?17YqJdS/sUWzR7ztduSVbRbEo83jZomqgwPg2UlFtWUva866/MOkL7ua2xu1?=
 =?us-ascii?Q?/woBBnuSClVUU7Dj1JluAQxQlA3M5sdn0qTvUr6D/Ys61UobGTXULmk5hO7x?=
 =?us-ascii?Q?nxSPv2H8cqWjy9rk+dY4t4Bd1brDZlHxYVWCw+f5ySiWmff0QRz/nCCceCMG?=
 =?us-ascii?Q?bt45hBJxq7tjXKGIT8ISW+KOn7R674nIHMHNUVn85oX0/8lCroAJS3WyBLqD?=
 =?us-ascii?Q?3qKz42cVhA7Xt2nCDYlSqP2Goj37F4XFKJdABKlH/+TGgzSYm1TzFK++jrXD?=
 =?us-ascii?Q?bzzpe43Hh4oYLfik90DLhEMK1ij3XUNJB3yez8ySft2dCv66+K8vNzAGMOD0?=
 =?us-ascii?Q?VOgoapydSQG72vwLVkbX/ym3eNi5RYHmS2eIgZcZ6JRSK3POCEy6QqCgYgJu?=
 =?us-ascii?Q?pt1hWhCY7MSTV7twQMmp5HPG68U8EVrsJzAc7P/pvuH+cP3DpprI4PKfgfvz?=
 =?us-ascii?Q?V8Sh7UuwOZiw11kH+qmZnbe7vcLZ8RBAum0TDUY7NOSDAGdou8pDqr3ZLScK?=
 =?us-ascii?Q?kPCw0aW7qpzeBZgcMcuwMcoQ/mtJ01B729OMllVduOC9K54J4qveL6ee+mec?=
 =?us-ascii?Q?VR6QDn92IlzzV3AMniVr8C3CfNuDhCRjyIDqyDIKPS5L3y+tyzElZj8lZ+sd?=
 =?us-ascii?Q?nWuyRlnpYgvjI6eKRNJJz5KpP+OYSDEV4IvzSv2DZr4PZZkJ2p8P6H2F+yJd?=
 =?us-ascii?Q?t+O84ILc22p3Olb8qz5vpe6B7AiwnfweoDVum0EXevF2tecCr03cfozIhPbs?=
 =?us-ascii?Q?08NRipNVWztdmcIhARQBYkv8Ey60OxgPJShpe/mA7NfJC3jyTbYgOmMFc9+F?=
 =?us-ascii?Q?K1Hpr4sgr2PDL64LlZO1cGxbAM+VU6DHv+w9VUH5cmv+Cwf+FLnJUhSTi7Us?=
 =?us-ascii?Q?HZVdx/JXoRUouUHUZTR8mYjJeytH6y341gkcB3xvqez5JGcWTMZFIpgCtdrN?=
 =?us-ascii?Q?XS18QMCTrL7xY8OpqmYKC3lfuYyKLhP1isq4daqbjxUwY3SK7tcYIzh1BEEK?=
 =?us-ascii?Q?6Y3kzb22gctulyWeBm6mwP6Ynhh/DW5yQjlzoiEelXzazr94atWJ7ph32atG?=
 =?us-ascii?Q?kfNlt3MDKZzNeZ8XcIqGhe3fHf8rpo2zy3A2KfkcXfWaYt0hZOJYKvpSvfzz?=
 =?us-ascii?Q?VHsIqPz47C188Wx6beg7xvXxTYk3UtIg5v0g/nZIf9yoQWZjsYTSHMlYGy8v?=
 =?us-ascii?Q?087MaNO7pknCwdSQF2H9uF0v6AZffkGZjvIByIjfFaEAs0q5ytIvhyu3Crr3?=
 =?us-ascii?Q?5bjaX2qjpC+baiYEQ7n1juhza1ENI29DP9usFv7qzH5Nb+uUGZ9Gct8cicHQ?=
 =?us-ascii?Q?TtMJpUv1xhFGO9VHxL75H/yowHEXX7Sbo/rhlRbD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e215f86c-ee99-4c72-5a01-08dba3f8aa7a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:41.3519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dhv+mqxOUeQBzRVqi7wsuLxXb5BpxWdCj+DLZJtRULzpC9tS9IShEvTRIVG87s1v
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

What tegra-smmu does during tegra_smmu_set_platform_dma() is actually
putting the iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index e445f80d02263b..80481e1ba561b8 100644
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
2.41.0

