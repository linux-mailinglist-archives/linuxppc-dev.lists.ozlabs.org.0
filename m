Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4558B785DFB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 18:59:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VKBDlOgZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWC9H18Jgz3dj2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 02:58:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VKBDlOgZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::62a; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwm2LrWz3c6v
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+TVVxXQ/4LE1M539eLAXU0stc9Rx+pI73UOGMIQu0mBnPFkaHO/uTQQ8L5n38OsyKkJqZPrrgXuvSSXkaHEHSR8mnPBbHII+T3dwwi23U+0huAD6zYCa7ROpTdDZWeW2y9gBIgtpsXV4WNpRy6vX3MnAU6VHMez7L59L0z6ulU29s6KPnS6NMZN1UHTxw+8Q9QHlLjPz9KgtBf9mx4U9JV+1NNsL4oaZr57Qv9lelwDRPYqFXE466fIV+458HJ02dA5uNDv/RVkOz74ZzwoDreNKdDDlaHDrg9k+Ou7rlDXSDek0Wi5m3wplBUlbSK4p2HEwg6GPGV150q0GddOzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChY7ryreljqU8VQsE9TJq1HaSEt+XmVuGIuz+DNpI2g=;
 b=Mfl4bqu6joyFsKXsda9Z/1ZPpzw+WJHuArhtgXCu9up/QPEAUeQXO6Vs0a0pEgBeuksfs70dtK+K8Ky4z9SWwN2IE9RpHG+AsWC2WFXfHkkxRGmZ/SJ8aP4LAi5IpmZzcyipX2V9EuXZe/c50OgPHElZxx4Mw1RxphB68rUJoFDPs80l1eaRZFJnkXACgzDd4dssYuGpbW4pHLsQHdXmbHXmy87dW/5EF4R8EMLCP/BGHQZu91JYSM9xqWdbAS0sUXGEwD1IKNzaSbXA5HcHtu8dd3HnF2mejMfPDjac9d+jDUxyjFyGKB7DM600/yqcQDiLaZ9BaaAmfRI4krIdGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChY7ryreljqU8VQsE9TJq1HaSEt+XmVuGIuz+DNpI2g=;
 b=VKBDlOgZoauCv8kjhs9PrjCi5jVkQEAiD2KL1OxzqUOTnpHZewKLjf7mgRelV0peTC6ZRXduNKfYei4iAZGiBuMks8RnZyRY79ZArd7JR8lyXhkk8l6YjAIUxfZlazFPY4llD449xIL33NDl/j6n+PPB3JVqDx8iI0UK9v1m1IMjW4QZtGhsdoUSGWFEZzDvkeuU90CeBaPD8lg5oMMIuljTOtYmSPSoCUGL9m+UenpFEyFYNBLI8VFC3ubHicWwnWgtkC1vMcz2VhC773Yet3TKDhvuhv1+ydGtMa7aozRjjfRm6/cFgTbTTWTPax3swUk65M4WVZtsOHu+Eb5maA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:43 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:43 +0000
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
Subject: [PATCH v7 15/24] iommu: Remove ops->set_platform_dma_ops()
Date: Wed, 23 Aug 2023 13:47:29 -0300
Message-ID: <15-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0341.namprd03.prod.outlook.com
 (2603:10b6:610:11a::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: d5912b83-c6d4-45ab-0c8b-08dba3f8aa6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	d4JwmzTYSpe7fhx5wu/9ShSf0rdarOQ/OQUWZ9gwkyqDIN1UC+hB25kt1fcV3vg3d4RPuuGj5yO3qo9MFRxs3F/b+ZTcFbmPGhyOw27gHCkCnqBOu+fv4/vVjbZ33AxNQLka+JMyk4n386rXAO5f0zipJfTZ9lovYjMCaeXUCe/0ZtX65y4U0mBuT2EaHZiaVq3yok7IriJA9bsGrl6xskY/79/ZNyn38B1FyLpgY9wPYAmGqW6uxK1uEoI+2ibswkKhhs5KWPsBTqcFhhXoaW59nL2HOa8UmiiIAkvqqSGssP/JpJAY4nalvGkdYtOOanrKQ8rNMPz24Bz359TT0/wr6oiTEZw8GXc5PSXFDpM/P55N5WuhOqlkaPwRydFfsOtZEXaoSU2rpZ/aSEAyOKE1nMA3qGxjYhqVcgL3bJE6HMzu5sguTlF76QOmbDiyRhMRNYQ89LXZeavFgVpXm3+ynaPi0pQ+zZ2Hx/e+ZQ/7DMTmnZIeK4P9lrnppFaozgm+MA50Jop2VF0MLGxmOjEji+yWOWygxKpwuWCQhoGzWcjv7mI0uUu4Jp8grr/3qqI5oV0e/RC4lgegXeIyDR4AGpx1/DU2I2tBq78EL98=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?iwY336kMyxYXgsq2przvR497IhTQijmbU4oUqwZt1IYZS/8vpgILe/c7maiB?=
 =?us-ascii?Q?2fLHKjbVIV7F3AypN2jbTsc5NXD09QlBVdri5+WVDd7bO+c+u7LMdJ1C6/qL?=
 =?us-ascii?Q?M6B/Moxw3u9DhyPahVwyVWYwKCvlMhqcDJIhxeDUAVypBFjsMDPkp2H23NEn?=
 =?us-ascii?Q?kSKllXUkrbJNjOW8eKtxAJBUVSmFs3/6CqXJfAC1Rruq+HUCKHi5fAaHv91D?=
 =?us-ascii?Q?QEZPSnwgrPFHRynhUE6wNfZg/3tHj2ZEiIS+ViATnS5em9M3OwZZ2nShgiNB?=
 =?us-ascii?Q?QHEuGPoIpFr+tpKbA9pF+nhtuBxFi9YGS36teBIX9TNFUXq4PoDeNzea8n9i?=
 =?us-ascii?Q?5lMUCWk4JbrMLpUNvqHosppbdaHzRQ/WdWx71TWtQeqE2Rchc1wn2R1AYVKV?=
 =?us-ascii?Q?aSET3bzK5eFJ8lgLwDsNprI58iSY4Opl753+mxnCBLqtcY140pSEeqdP5Ah0?=
 =?us-ascii?Q?LcYgOMmh6LfLY5aCCl6ZvKF5p7q+fc5tMRzIMpkcJu0fkN/3kZVju/+sRwPR?=
 =?us-ascii?Q?8cibX8pGkVd2BoszxBLEFx4UE8veGPNSHJACbN+u0cl80Dy8RmNiX5Uu2SED?=
 =?us-ascii?Q?y1Ul67NH9joWWpgYjHZ6bCCWOJ0gTsdaKAVFMiQHbp6FKSI8jRMcKn+ZY+1E?=
 =?us-ascii?Q?2Iu2cwh+uAw3emmd9zLBxsc3zMBiZ11SSzHRCMN6CpfYB5Xr9uMtEbz5d8K8?=
 =?us-ascii?Q?tvDNdrzqJLCnN1xXr1AYf9c8VZKoDMdQumRy1jP3DZb7NnuTpTW4WGIsNtT8?=
 =?us-ascii?Q?i+CCgIXxARUo0eTOoc+/PcrlPY+ewdE2sAWHSBCtMgurkeDfc0feFLntyLNb?=
 =?us-ascii?Q?xjwdXG38fqp7JQcUCts8HLKSjDjrM7Qp5HMbE1XcwucVQyt8Cl0erPOKu9GV?=
 =?us-ascii?Q?j2JACeb+q8vil/SoH+axjrdUX24Kko0S7knqoAUtVzSRThHmOP72sFjDX7zB?=
 =?us-ascii?Q?XMJqS/BrCBbGVmA+SleEumnm8DrbjV5a6gRPJuc5qGqcsqWKUSBUX37BouHt?=
 =?us-ascii?Q?B91D+oVgPlTMLumEpzL9kO/l3NQbUtnlkvE1ZlRAfXPTp+Ds4RCx5CjTWhMO?=
 =?us-ascii?Q?by748oziflmEZIUarqERGN5OZC9zjchr12V1sgXzDVvk4jfTItFGqGZx8h7B?=
 =?us-ascii?Q?WdiuVwlc+N4LgKivxJI5LSeOflUOc+qmnt6Td1F3AshIZcdSkUULNR65kTy0?=
 =?us-ascii?Q?Plm4ZOl6IGDUiwux03Dxems4kP9MIFrUeQqKDA9jjBUi7jkO1lRw4uMBquVb?=
 =?us-ascii?Q?e3MBJdRdylTbdcsoh/LWhZdcXcUP/KysXERGGOFL05qRsUA8iCNmk4ozGvrz?=
 =?us-ascii?Q?TGGZRxTxOoqgw0niv+6XoD7iDUW/jYEm8d8EGM5CuDxd+zKdO6AnQZSOKT6o?=
 =?us-ascii?Q?wWG+2r2ZQciaB/AYhmZwPrcb1w/OKEnVQ08GMWi36uEGOyOv7ju21ub6cecK?=
 =?us-ascii?Q?Y2os8Z+HB0rl1r9D4aX3y6FWzSXZr3BRBgFsBfuFHVqn8cdMbmIBuUuCl5YT?=
 =?us-ascii?Q?AX9LFbX2ir765ioIrPcrYk4hP8ty4bniXzX9IcKKo8mEVs+qQioZSLswqi2l?=
 =?us-ascii?Q?5JaGGbuwSP5nIrgVnDKXGZ3jstt0/sP5626lczZ9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5912b83-c6d4-45ab-0c8b-08dba3f8aa6c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:41.3114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+55OL81S0Pa11KurYkC0edsuCpNxj9UemnDjt5mu5PkBtHC46edDJSiLnnleaLJ
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

All drivers are now using IDENTITY or PLATFORM domains for what this did,
we can remove it now. It is no longer possible to attach to a NULL domain.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 30 +++++-------------------------
 include/linux/iommu.h |  4 ----
 2 files changed, 5 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 5fb25bcbc42f76..a3b016543fad00 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2351,21 +2351,8 @@ static int __iommu_group_set_domain_internal(struct iommu_group *group,
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
@@ -2401,19 +2388,15 @@ static int __iommu_group_set_domain_internal(struct iommu_group *group,
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
@@ -3036,9 +3019,6 @@ static int iommu_setup_default_domain(struct iommu_group *group,
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
index 48a18b6e07abff..c3d2e79076ffab 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -243,9 +243,6 @@ struct iommu_iotlb_gather {
  * @release_device: Remove device from iommu driver handling
  * @probe_finalize: Do final setup work after the device is added to an IOMMU
  *                  group and attached to the groups domain
- * @set_platform_dma_ops: Returning control back to the platform DMA ops. This op
- *                        is to support old IOMMU drivers, new drivers should use
- *                        default domains, and the common IOMMU DMA ops.
  * @device_group: find iommu group for a particular device
  * @get_resv_regions: Request list of reserved regions for a device
  * @of_xlate: add OF master IDs to iommu grouping
@@ -278,7 +275,6 @@ struct iommu_ops {
 	struct iommu_device *(*probe_device)(struct device *dev);
 	void (*release_device)(struct device *dev);
 	void (*probe_finalize)(struct device *dev);
-	void (*set_platform_dma_ops)(struct device *dev);
 	struct iommu_group *(*device_group)(struct device *dev);
 
 	/* Request/Free a list of reserved regions for a device */
-- 
2.41.0

