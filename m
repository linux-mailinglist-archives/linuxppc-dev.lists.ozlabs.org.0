Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C460572A421
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:11:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdC0846PLz3g3w
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:11:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XH+OhXa9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::62b; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=XH+OhXa9;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBg04fc2z3f8q
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mk2JGDyVdgBusVjBD6/kSG4IY2QcIil5vpW+K5as9Z79OFwvnDKYe+OQ7kaYvZj2rlF6pz+0OjaqTRINWiZyt7v9SDfqpIyZoA0plcwRt8HnsiQESCIpbUZeiluBMbqoG5me8Vm8K506ptbYhF7tpURbNVBysKwvmVw3U6iS2wKS5h2vjspb/1fmS3oyBs/becpu4Duh14+l31udgYFHXt0pt+3dqJQgTolZtqyVGK/6GI7kCnSv8V6yKfN9zaZe8gfVh9/Dila96T55FOq7z8OMPK2o9icu6snV6jROmiGTUOy/xSEcV9MlcsiPq9LpKa4GzYSOca4lOcpMPAietQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUJcfpNdGV7lboIiAgPA0VpwiRBsj+xi4myndKO42wo=;
 b=AVoeHJDxCCtA24qaMnzBRvjDUn+8L2IgNaPi42fJA+Gej02nCCVV6LVGhRtIbYe5vuBpuwJlKpguL45szZ6g1MyP812I4QITk20SMQ9NqTEv1uxaTXv/SuYwQMQNnaZdnEbhUM4SjXCERW4N6utJmuhw8ZEKga0M3cyoSLQ6XD4NJqpanysUIZzqBv4MD/Ss4Bq3OPPOdxtQU8U8gsJiRAWkJ2S1Lo4Xwwrcnfy9/HIAHEzPnNxQpvvH8WRw9QbOJd26gedJjbRAAhO2pkh20rjQoEJe5yQYpP1qndMs5gVrYLO3UbcoPFUkSzNET9Z9L6VTp1+jmG8z1ChtidemiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUJcfpNdGV7lboIiAgPA0VpwiRBsj+xi4myndKO42wo=;
 b=XH+OhXa9MpFyz7M5XcOJPPx/QHpZ2xX68AR0u7w/DFyauSp/0bgOH+eb5WMnln8vdF+rXoWzYmGCIqQvVd54z7EIU0YxMrspLD9HU4mSDsHWX/r+xlMWzWA6JqhKetILdUB9hPIAPaAh8zCWEu09aFTGUpGUuRCQsnUhhAXKq3zVRMvB7wkVovwofYWaRUoFJa8J04ujR7H6WOopQGEQVJIKc//D7Qj8xR8YutoOjaYJCPVSp8RqKKsevMkqM3ARUqOi6BdNQmDxqkQpTsd1tXGLCNuK6t46zRL0kRRq8995FGAbnFjfDbON48njH6F3Yt7YXnRsTmSvvcXxoV1P3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5785.namprd12.prod.outlook.com (2603:10b6:208:374::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Fri, 9 Jun
 2023 19:56:25 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:25 +0000
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
Subject: [PATCH v3 16/25] iommu: Remove ops->set_platform_dma_ops()
Date: Fri,  9 Jun 2023 16:56:04 -0300
Message-Id: <16-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0109.namprd05.prod.outlook.com
 (2603:10b6:a03:334::24) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: b7016c47-b82d-4f87-47ca-08db69239988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	amPtFXdHG8kHDNbjmB+vMrFlIZUg7BHpt0kFYxjmoV5pRrBbbT9mwSipM8koarCuY+2fOynix1kIvtZQdrAy/+sYLyx5wZckfcqaMHGR5aLnjKDSerG9h5qH1Rr/2XjMZKNap/eZm+QinTPxiHsbMIpDefVEAPEC1fXh1bCIZlsfsyE8iCDS+PvPy7Uq/NPB+/Y/G2EMsMUZdi4ePeGo9LmO8wXbqBdyTDdVWl1ezOjEvBWPep+1DySnH8kcjLbtZbaenyt/f/72gTZkqbfCGVUbJA6l5jBZpDX6w+2bAsnSX0+RDrhzxgDu0138C30GL7yHBqeOHAj6RBp9t00hZq8Ee+WmR54J6ZRxDX/dHWJ94VrslQSQ5fZfMTV/+OfbZlvTNSz0PM0x7Y2HwoubhmaKtZpJy11Kp8Jk4ExBcx9IVlS+oczIENuABeyzR8rg7VvBuD4dunDtEYNIOX1pwq4IGabN51vhmPvf5ZhNki1syEKBDYOIt2JCLpX6PaTW8fFsQTKPx1mYzY0NTN1dMyPrtpZBEPtxZYIISk3gu+BffXTotfptdKZmeVV3Z/cJ/UEDGdx7NyI6MHJ+nN2L8X/j3ujtCfiEoL+Sb54RlfI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199021)(83380400001)(7416002)(7406005)(110136005)(478600001)(8676002)(8936002)(4326008)(86362001)(66476007)(66946007)(921005)(66556008)(5660300002)(38100700002)(41300700001)(316002)(6666004)(6486002)(36756003)(2906002)(54906003)(6512007)(107886003)(186003)(26005)(6506007)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?rAZD1v/ckDPFcJRbQ+gjf7/ixbRJq8G5pgLzirpKa+jA0ZwsRzauogPjJ5wB?=
 =?us-ascii?Q?hBzODu+EePRskDmp4n7gU572TPgkAaNuzKibA/n40PnybqrtdJDMSQQ1xt1V?=
 =?us-ascii?Q?UAyxLrP2oMqTO3DA6NxsNAYc1Jx7UvVoqfkUtZOnNYguVm0cVWCyPHcl4RJQ?=
 =?us-ascii?Q?ywXCqk4fjzFB7FjvtZTdBxJRbN/zrGUfjlKHIeLFRtgRe9huYubyg+MpbPfn?=
 =?us-ascii?Q?BH5N/sCVMa05JUr/lsxSIGivSJaQG8rnbUYAiiDixQYb4qf9N9pvcqFwONY5?=
 =?us-ascii?Q?R7wc0zrMW1iP03s/EwcGB7FGUg86ysP3sdnxy4b0D39scIKrAF9IJw8dpyDR?=
 =?us-ascii?Q?svJ40Qaaw/bgZ9bZ1cKplBzHDGo7uDZiHSKZhQeunJJkQntQ7cnBsISnVdxG?=
 =?us-ascii?Q?k1ZKL6MussN7aulACNp39Len4+PEV87ABk2VPfMJjQXeY9q0zbSeYALvYxyn?=
 =?us-ascii?Q?vaUtRFGlkPsynhRdhdotuvhiH2oQDFF2vw9KXUEB9tRjRRAwfetJ+dlGhkvt?=
 =?us-ascii?Q?400L8e4ocmoE1NF+qKUtlqVF+TthNb9Y45i/ULWMWKDgHZEoTZ6uS785e2Y6?=
 =?us-ascii?Q?zivpRgiRvgHqHLlnazJO+hfB16xHjfeXFq4k4w6WboYU79/ztphXwPkMMuzA?=
 =?us-ascii?Q?QWWuV825W1XGoGK8Jq4KMm2lVhjv8dsq61WE9kZ9gWCn2ZDBZuK45ZUe/cy7?=
 =?us-ascii?Q?SWmvuAQUMQlZgbMJwBQUwX/S+Msnf8DxBXZy0r2DdP5sjVOBETk+MnIScK2r?=
 =?us-ascii?Q?jWGe4c9arNtKFcrA9D36PzKjZcb/fIp756FFyNkj7Qpf+fbCOm8iHoXKSeIo?=
 =?us-ascii?Q?LOxDuSehw3xOoNKf13k93Bl0GEe29YO871QPNnyI/XcX2V821zetKkhmrWf4?=
 =?us-ascii?Q?Z3N/f9BaZO1/PKCaeOTV+keFrV0w6213cJekZhEWoF+74R4ayGBkL8NTDF7a?=
 =?us-ascii?Q?/QYRhrlDe9GUyWMDCjhQRAkfa7Wx44reH3ujwobSvdUULp5RDseKX5V5U8lJ?=
 =?us-ascii?Q?3ZMVW8G831SEnArVowlDVVnifXioPob1zEzsBMxiGAiC6Kzaz904wIPUrb7b?=
 =?us-ascii?Q?wOAJEnRQ61ZsASSbpuBDH/qji8RghxM/FbvXphgc//qLH18XCho+XzMop/Xz?=
 =?us-ascii?Q?jRabDr0AiQODcMc3H6tmr9tvnEQMeFfWKidFqQbb/RLQS8/CZPLcdBEXst+e?=
 =?us-ascii?Q?wl4Ql+caxee5Nv8Y5hF1egVxMIIRCjFINfBVWbIJF9Cwlw9r8up7yEjbpLTT?=
 =?us-ascii?Q?/iG6J2w2rnDyDiRPNqP8S1NAqygkidSVsiGqWZsDDbnzP0sXqMOUuRx0PL5U?=
 =?us-ascii?Q?5Egf+cRAgGZfBmQe4s7QwFn9pRWGQJ8VhCjk6tNPFSGcfKgPqsqEFArL4mqn?=
 =?us-ascii?Q?vMCgRPNj7KbmkxqfNS/MPkotuhHOnvv+whqRNcsqUyVqXsrKzGzmZEHKfJcs?=
 =?us-ascii?Q?J+rOJEmOg7P4Mh7ysvSPL2B0l3qHUrvOYgrSVpk5JIcNanloFimG00yOIPzG?=
 =?us-ascii?Q?SssW0T9+Vb/g9Pd3ydkh2zkVbzdR3qpl2vk1C07QX2rTJurPJykzGMKJqrj2?=
 =?us-ascii?Q?Eb04qHPlhIk4aHCo40zZ0UH5hshrzOCEq9xRaLvI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7016c47-b82d-4f87-47ca-08db69239988
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:22.5325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5/y01kQfVfThRunHJz0Xyvhc1q5m9jHe7ppZGkJ7rdU3Lzq6EwyojXKWYiKsh79
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5785
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

All drivers are now using IDENTITY or PLATFORM domains for what this did,
we can remove it now. It is no longer possible to attach to a NULL domain.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 30 +++++-------------------------
 include/linux/iommu.h |  4 ----
 2 files changed, 5 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index a3a4d004767b4d..e60640f6ccb625 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2250,21 +2250,8 @@ static int __iommu_group_set_domain_internal(struct iommu_group *group,
 	if (group->domain == new_domain)
 		return 0;
 
-	/*
-	 * New drivers should support default domains, so set_platform_dma()
-	 * op will never be called. Otherwise the NULL domain represents some
-	 * platform specific behavior.
-	 */
-	if (!new_domain) {
-		for_each_group_device(group, gdev) {
-			const struct iommu_ops *ops = dev_iommu_ops(gdev->dev);
-
-			if (!WARN_ON(!ops->set_platform_dma_ops))
-				ops->set_platform_dma_ops(gdev->dev);
-		}
-		group->domain = NULL;
-		return 0;
-	}
+	if (WARN_ON(!new_domain))
+		return -EINVAL;
 
 	/*
 	 * Changing the domain is done by calling attach_dev() on the new
@@ -2300,19 +2287,15 @@ static int __iommu_group_set_domain_internal(struct iommu_group *group,
 	 */
 	last_gdev = gdev;
 	for_each_group_device(group, gdev) {
-		const struct iommu_ops *ops = dev_iommu_ops(gdev->dev);
-
 		/*
-		 * If set_platform_dma_ops is not present a NULL domain can
-		 * happen only for first probe, in which case we leave
-		 * group->domain as NULL and let release clean everything up.
+		 * A NULL domain can happen only for first probe, in which case
+		 * we leave group->domain as NULL and let release clean
+		 * everything up.
 		 */
 		if (group->domain)
 			WARN_ON(__iommu_device_set_domain(
 				group, gdev->dev, group->domain,
 				IOMMU_SET_DOMAIN_MUST_SUCCEED));
-		else if (ops->set_platform_dma_ops)
-			ops->set_platform_dma_ops(gdev->dev);
 		if (gdev == last_gdev)
 			break;
 	}
@@ -2926,9 +2909,6 @@ static int iommu_setup_default_domain(struct iommu_group *group,
 	/*
 	 * There are still some drivers which don't support default domains, so
 	 * we ignore the failure and leave group->default_domain NULL.
-	 *
-	 * We assume that the iommu driver starts up the device in
-	 * 'set_platform_dma_ops' mode if it does not support default domains.
 	 */
 	dom = iommu_group_alloc_default_domain(group, req_type);
 	if (!dom) {
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ef0a0000f09326..49331573f1d1f5 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -237,9 +237,6 @@ struct iommu_iotlb_gather {
  * @release_device: Remove device from iommu driver handling
  * @probe_finalize: Do final setup work after the device is added to an IOMMU
  *                  group and attached to the groups domain
- * @set_platform_dma_ops: Returning control back to the platform DMA ops. This op
- *                        is to support old IOMMU drivers, new drivers should use
- *                        default domains, and the common IOMMU DMA ops.
  * @device_group: find iommu group for a particular device
  * @get_resv_regions: Request list of reserved regions for a device
  * @of_xlate: add OF master IDs to iommu grouping
@@ -271,7 +268,6 @@ struct iommu_ops {
 	struct iommu_device *(*probe_device)(struct device *dev);
 	void (*release_device)(struct device *dev);
 	void (*probe_finalize)(struct device *dev);
-	void (*set_platform_dma_ops)(struct device *dev);
 	struct iommu_group *(*device_group)(struct device *dev);
 
 	/* Request/Free a list of reserved regions for a device */
-- 
2.40.1

