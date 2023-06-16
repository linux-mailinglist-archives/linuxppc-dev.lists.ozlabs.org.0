Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3B973394D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:15:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZFzSUWhd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTQL19c3z3cY7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:15:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZFzSUWhd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::625; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT8C6kc9z3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZCzK9mJ68daY3j9NxhGgi5HHP4ilRLMSTh8Zqr24Xvna+geqoYNptQe/lFK8bvvUFMoQCzs5veonkbaorbn92rhDuIpXlgD6vlPuw7pHmoshCxVh9l1JULrdpeuJN2HC0F6e7TgEAb2kPGT2v8Yb1c/nHWvpz/UCuEDmXbj77I6GwxFUDCx/epk/75lF0uQFkZ0WPyxdIesVd9aR5iv5YstUhIJZC0qjlPM55jtbOp1knGT7Rmcl+rbW1aCKh7rh8+lT0ZzFenHSP1Z76RzMfBmPWbFe2vbwubMVe+1KKn6HqfGkGyZ0/S7miNG22qcL4aokLmJf0Fg1iDAj0YgZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUUt/fAI8ph2DHNlhM4gNIsfEv7BScpXS9Tps+iWPLY=;
 b=CUGUPeZ9M+f/91kypFo2s67Xypymm6M5WxcyTDEO8nyc8qJmbeTGNyAYg7K72f4nzH9hU4/pT3oRff/CDVTLlEMCn3MyketKRbl/KOtLmri7/r2BVFxEEi4LBhfl+Fcn8drXRWk2froa/VztEDvD77a9oRuiLMjUivoLV+YjtIW8zTo14YNx/VlOGFsEbQlyR8VtPDgfWla/vgx7LlMTgHGxOwCDfcxIl8jcEJMpfYLbCJp6oaKVNQA798ZhLq1Ju82Z0p0oIMBtUwfU9+krYkJkDyN3wprYSJqQ6VPNCna3xY97G9EwMpW/ZyVSa3H/YX41naZr98QwskIzSC2wvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUUt/fAI8ph2DHNlhM4gNIsfEv7BScpXS9Tps+iWPLY=;
 b=ZFzSUWhdmbQsvIhGBrN03mUboymBDRocLFtPTjE7W5N6NGb08zCV+v89o73J5RuwTpnkwgOrrVPi+dropWyszTojOAXIkj5WzcgoHFca6blAejh25r57BsvZu+XNFWHM7fJpmwk/V+4f+jFKSRcWnN6MO4dA37lX/3ht0HpNTmwjwyVmvLmmS4cjF5T1GPu9DRMf6Rx58Jz0r0lXW29K25cfZFAC8oHMvPxuT46UiWXvW7kHdTo63uy1jjl5ZBYorBmnFYK3EW+jdW61cAEn6MhwDMgxHjqqj3ta+MEC40jpqmI3d2pfA7RkB3OpBl0937EPOvQVHAHNQSb5CAgDnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 19:03:04 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:03:04 +0000
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
Subject: [PATCH v4 12/25] iommu/tegra-smmu: Support DMA domains in tegra
Date: Fri, 16 Jun 2023 16:02:41 -0300
Message-Id: <12-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0060.namprd20.prod.outlook.com
 (2603:10b6:208:235::29) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 719f4613-fe12-4385-4593-08db6e9c4b7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bph0ONWjIbIlYMdA2cwyoThAzYx/yipSrfMRcOAU2mLkSHS5eDZDjWl603gdQrti4gefZjy5D0SoKy6S46cHg/WuWlhB8+Ww63CkUCBG+vzMWyIxaYZcWlZz4N5G8lCc2NSTssGWp3RyznYTGJldbvr5Xpxgm+gxru+EpSv6dNHmID8jSBbB1/snWSUtqS9mj31gFk8uM7a5MR9NiJz2XNsULQkc5/fY5jne7vXVEwp9iw6SHlIzPX7Pd9qnf+i7fcl9J1P3Vj2EuLCpfzBtv+oc8zc78g5x6BM8AoXxlNSjsrzJHDsewb5M7VrIwwO3O3qHR8zwVbL38WNWp3zag+2qxvv9E9HJHmOsNhPRJ8kz5pOMGWFNUyatGRtllBaB5DKkfqbkQQVrHsy8U7Q2/dZR22DZUOezH7GMh0K2ePJwkOfYUkMf8uCdV1MO+w3heSISioyFzf5+OyQ78xznPRj81D6X6mfnaOuVcw2+8jqZlaeojQYnDKMkALK1KgA3Wftz543gpuucPpQQlW4Xd+yuuXBw12xnGcCwnP30hLflhmzd9zOoKdfGq1B5cH8qg2F7Krahd/NTyjIFd7e/PWeNoGA8a8/VB/OZmdx/nb0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(921005)(38100700002)(8676002)(8936002)(5660300002)(107886003)(66556008)(316002)(478600001)(66476007)(66946007)(4326008)(6666004)(6486002)(186003)(7416002)(6506007)(54906003)(7406005)(110136005)(41300700001)(26005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?BVhCJLw/cV65UtBr6Vi9PKllG5qjOsCgk3SRAU/O+fsEwAnvsDzPhMXQguXo?=
 =?us-ascii?Q?MipvDIATJJVPbkur0ixltovIGXiFFzJ15rBNpz0hF+XcXH+ZM4Z42cwU+NhS?=
 =?us-ascii?Q?eJ1Lyis7xy1eDzR7lj+8DnPLuYh9JIi1tHy9qqwzJds2er4bXgLclm/ow6+O?=
 =?us-ascii?Q?08s+h39B2ySGODgNxvr4LhDjGjvyj8D4yPvfAzXZw4SFalc2ZYbGgJP2OHPS?=
 =?us-ascii?Q?x8T2Xovks5hdmd/p6PUGvTImr4wS2rdq6VFvFqoERc1EpUpbVSLXbgEH/R0S?=
 =?us-ascii?Q?kDQ4muBRHGrgbz3+Y0FeTE8Po8aOOOCqy9mfyVDjZRVZfC1/WvM7mec5oMef?=
 =?us-ascii?Q?y/9C5sSQAnW4uM01me3fzbsIv3EOB4lrM7YPr4u8SJFMTSHhSRunuEasR8MD?=
 =?us-ascii?Q?iHNQGSYNZP5JhQpaZRhYnKjnTWRiEgZelB0e5EY5+Vc7zlgH6PxKy0sE4A5H?=
 =?us-ascii?Q?mLgOFIG+1maAMf3xJplQhXfvvEI0PesfahpyKrOfazLVAkAakeNSIMdrm8hY?=
 =?us-ascii?Q?SFC8oCfbtEkc+cFmT9x0MXcLLyy+whRflfiunAUtNvKwxS8Qq8ED05bd6S7W?=
 =?us-ascii?Q?PLb0LO3BbhXlpKpx6ZbQeDabQdZi5QLsrjJbKpHORs4hLFJ5xtFNA9XqzIYP?=
 =?us-ascii?Q?W8BsyKJ3IWNrV8ZB5UYxHx2ZrfKK1S0+qwfmJN5P08EVf4xOrKlCOomm3DHQ?=
 =?us-ascii?Q?xXGkNps8IU3vv8vtSBPdUMtY5LLTgKE7CNBicf253bTnq01BG1bahEGwi1CO?=
 =?us-ascii?Q?AL9obFT9dL6XwD/Op55MPtfEgsj64waqGy0HyjK400BR0PwMuDGaPgJvofSP?=
 =?us-ascii?Q?v24byyBiMCMNxdfXeKVekyg6QiuyQz3ibY3x66cC25QzmKdRxXXn5knrUzLl?=
 =?us-ascii?Q?3xZWylE6Ea0lc/9LUj7Mem92VXpRQSOC7qJqx0cdfhu3aD4w5IRB9E6giHth?=
 =?us-ascii?Q?9j3ElJH3YnDe26AiwMYOYD98HLn24PSwC/yvv3/947bEZPG8RvyKOcs02xes?=
 =?us-ascii?Q?3g5Zx7RECyeZEAFcS0D92F1GBVfYLGD2XqwryIlNk5doj0VTyk2mCuWTaQk1?=
 =?us-ascii?Q?PoNiYvUkV4M+3A4pV6Zd8dqsc0fMuUltw1ClFB+HCp0FYPrKVlcsO5jmeopT?=
 =?us-ascii?Q?ASRrUAxRUUZOrDMocvxPBLVdw370uALVCmxWw06C3Ocva9Mai9KfUgDktbMR?=
 =?us-ascii?Q?Qi3Je7VNJtdYBb+3gNpfaPKo0KKkJTd7m4hgiCNOVVWGiTh+kIvlls+UqhUp?=
 =?us-ascii?Q?TTHFBwpgaY5RWkHjPP77avhJSX9DIFXVVZnXukXofdtD9XXLa9m85XjZOJFL?=
 =?us-ascii?Q?y3rulW1RbP8m3xWCC8oboou0F5IQAsyzr94tV94a7fu9f7gZ/FJtaLwr/5K+?=
 =?us-ascii?Q?KCSafszLT0VO0uSn8MS9bh8UcsSeOpGcBnleM/U8veV2K0BuammAy4fWg2G/?=
 =?us-ascii?Q?3jMyKdssfawRNshb5EdFAt8eFJrEiSqDPRm0Xwm3KHV2oU51BTKF9nNTO5Sy?=
 =?us-ascii?Q?REu0dnz2wmCHvqoSvPxXPhCw3wnxPiZjemDMTYrTE+sm/tjb9w1MZGqXdsTH?=
 =?us-ascii?Q?P4qzBr7xSgmIewZ15czR9ICXPAbXNcCtaSTjxr+l?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 719f4613-fe12-4385-4593-08db6e9c4b7e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:56.5004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCiSm1w9oEWT2k5pY72RjoexHTrcywDz3wTSt3Z7UUf9FAfgXrb2VXtguyudLbzk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6051
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

All ARM64 iommu drivers should support IOMMU_DOMAIN_DMA to enable
dma-iommu.c.

tegra is blocking dma-iommu usage, and also default_domain's, because it
wants an identity translation. This is needed for some device quirk. The
correct way to do this is to support IDENTITY domains and use
ops->def_domain_type() to return IOMMU_DOMAIN_IDENTITY for only the quirky
devices.

Add support for IOMMU_DOMAIN_DMA and force IOMMU_DOMAIN_IDENTITY mode for
everything so no behavior changes.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index f63f1d4f0bd10f..6cba034905edbf 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -276,7 +276,7 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 {
 	struct tegra_smmu_as *as;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
+	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
 	as = kzalloc(sizeof(*as), GFP_KERNEL);
@@ -989,6 +989,12 @@ static int tegra_smmu_def_domain_type(struct device *dev)
 }
 
 static const struct iommu_ops tegra_smmu_ops = {
+	/*
+	 * FIXME: For now we want to run all translation in IDENTITY mode,
+	 * better would be to have a def_domain_type op do this for just the
+	 * quirky device.
+	 */
+	.default_domain = &tegra_smmu_identity_domain,
 	.identity_domain = &tegra_smmu_identity_domain,
 	.def_domain_type = &tegra_smmu_def_domain_type,
 	.domain_alloc = tegra_smmu_domain_alloc,
-- 
2.40.1

