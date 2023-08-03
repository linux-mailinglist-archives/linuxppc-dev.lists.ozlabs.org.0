Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BFF76DC80
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:18:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=W3ZQMJo8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGTvl5TPfz3dHq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:18:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=W3ZQMJo8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::61f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThm5ysDz30gn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kUVYhpTzrrsMNSg/oNb0CFY82j0B+Jz5UDZBXPE5qNTa/SxPycXSdq4u+VsfDFGsQAWb+6DipIdZGyfmXr9HsmPRdW9NsDq8QQ5gJipJUF2XuOHsNo/qvwfaHLkBDevYxMSHy67SVs8AyfZ56TtHLWFI4K7j2V3sZl4hChhabkABhpk1RN3ZvkSTOvEo1Q9/jYuVlwhb/CwOh0dAbfEIrWlK3K+9ZhM3xGWDuvUPdqMtuJGpRG6GnKv5NZzaoXKTqqVCognMPw3674aMIe31r0C9SauuiNAadJijVjDUGZXV6+VbdtGdaigRa+z0k66XkyEYReXj7CD2qGljJPbHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saTUg6BlTbgPp0UQzNA662P+AMrjwVD904uWvYyMZq8=;
 b=RlgYLbDRx/rEpV/eRs6EW+OiuOgVm++ftJZYFG0yIvuUywgfP/2kcxj5OfBljr/4AX8mwGMkDtwjY0gZPKVehYlpRupkhRXnwy4P/joNhJ8pVEn8Hd64g/ViyXsVK9t6PnyMZrNB6bXaraTgA0/iij0eqM8k/0b+u6gjMQL3c3sPbyuzRnEgU3YJ7iPyU7cO0jeWwmVMpp9dYzHoIulkW1m6pGHmp0HjRBSRAFBYLMJS6hSqdggMOQhcOv9rJjjA26t2aS0L29mb6P0ChLegOphCP8CVjiGA6NSya52Ct3XMVI8WlqToLUXDoF+5jP8Lzm028rpQJV/vFnfbdgdt+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=saTUg6BlTbgPp0UQzNA662P+AMrjwVD904uWvYyMZq8=;
 b=W3ZQMJo8Ka8jQgJQJtufQ9MDtECnYAEADqIU9ckZYoRvis6eB7+ddKI6WKKMnaWAIrDlxDrLlhgQjjxUs+hV/NOR4tBsDv+7JUXEQp1CW774i7j9cL2s4UWcpfoksFVDgclUdGy4mO6urceWmI0n2vsXXqKAYE/OT/ukUSd3Wp3rey/fC6Ll1E/ApKFgT/W29WDF/XuBbE/7hDZ3aeNFffJuE9HBZQNFn2uqSpsOGyFtHg06r/5NxDo5rdGyUP2fafgtmae/VLVtn/BuXR1+43iraBHqysaPUO1nGMXRHXnVsI5h8S1M/LQ6PyWfAYlHqY1l+ViG4yZooYjO0T4jAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:08:19 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:19 +0000
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
Subject: [PATCH v6 16/25] iommu: Remove ops->set_platform_dma_ops()
Date: Wed,  2 Aug 2023 21:08:03 -0300
Message-ID: <16-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR16CA0047.namprd16.prod.outlook.com
 (2603:10b6:208:234::16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 47259174-4180-45e7-ddc9-08db93b5bbc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	z4U+g+JxbWJS/JaZr/KBN/TgQC0q/dKxwD0CuzOLd+EIJ/zbVVItLIb8VKNFBf3yRhdtaNLFHHHrAXoEu4FjVvoSZpmdsJ71nW+V0t0+JLacfu+1vp795zF/La7TiYCbq7vxq/fph4I3wWMRdQc5ydKMeFfA/57LZS3udEkPM/uATUGe/wRoGDn2Fn6bhkBDMdu0pF2x39bcfJVQ0zmpHdBhOd6S/OPN7E+6w78UQkU2BIQrVAERQJ4bGXanlE2ffTfpBzpislpHC9bBtdQtdQv4QNozvxxvbQbzgRF13SeHzgpDJL+ETXM4bAKk8ScCXAUa20ACQfL/tkyZHprDn79K15FSSKIQI5YGYpsi5sjpHiT1ldjj2n9qZosLEKptLG0T0OMhQ7AX1Mn0AhkHH/MwNw6D7xDi6BUl9v0P/X/+OelGv2YnvM7duBOUvoaHwtT5m1eNTIbhKV4xPeCGJMXs1aoHKieBOce9b3Or3W3OJmKbYZChSGkGPKjYn39v952ENPGeHEIc2W2Unkr6IwYmsKYsgzZaVXYhUQiWVGnnyFuYl5pSAfxLFUGyfZ3M12uwMNHC2I5LOwsGdfqyvezJSNq7cGdwxRGne8oxiJI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(110136005)(6512007)(54906003)(6486002)(6666004)(921005)(478600001)(38100700002)(41300700001)(5660300002)(316002)(66476007)(66946007)(8676002)(4326008)(8936002)(66556008)(2616005)(83380400001)(7406005)(26005)(107886003)(186003)(6506007)(7416002)(86362001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?k+WHa7C632Srm27P7p4QmPHshFrskwvfCmBmH2FYohy2YWVClgUX8vtNuxxx?=
 =?us-ascii?Q?NQpDI0HgcaxQGp3LnW0FTD2HhbPnK4ydwvwnz8mnxOzx65THI25YCOSsZF1v?=
 =?us-ascii?Q?zzGAu/ISHnFD8tUzLOzwkxpQ3/OVDBxQO0aCUaq73+KYo9ksBnH+iDvO4R8G?=
 =?us-ascii?Q?8NmTO/yphNBPFKmnt7D3YeuT/u4m4nw1PG67V0YihrXjz4TQT7fMNEM/HTfr?=
 =?us-ascii?Q?mBLWxzBiJxgpJ0CrNyjv3eRGqPoaaQRyAJ5R5LrqRse5qeSHmPZAEB9A4kFT?=
 =?us-ascii?Q?WxrB2S7XjK6fSGq18ZCJ4BQ3hjDj+IJ4K8nvsXJ0DfYaBDkHl4bHd+ksjUtr?=
 =?us-ascii?Q?SChgjH7+cw0I49hmzHhYA10/y/DJQAUssJaGCbAAqmAOcWBRY9g62uro6GVH?=
 =?us-ascii?Q?kbgdJCguv5dBowMdq9hvtJBR2z2OI0Ts5ZDMdAkUOsLU+BhXzUzbacjFvpD4?=
 =?us-ascii?Q?4Rh7o5UfwRDJ6oUl1N6KcxrPDIVd/7ULmpnM9KV7JwQiBq+C8+aZFZxOyuuV?=
 =?us-ascii?Q?wKKMMEjz4CTXFVG9HzZ4i8M2BPY81YOh8Up2lENQKJZo9xtm4kMTRb/N+ouM?=
 =?us-ascii?Q?ShhRCvg78CWyLY/h/ctOYWcou43f7eJbtg02mZTLmyT+jKpETHTjPNeukkcp?=
 =?us-ascii?Q?VoVGXlxTUgLZwwchAUneU5tqIONAewBbwxR/k/tUJQRd6dA05agmFOO//n+7?=
 =?us-ascii?Q?StIbBpyFcw89+t0apFbWtpHcre1Z2LznJUPhXetEzIs4c23uB0SRmUmnowBc?=
 =?us-ascii?Q?GtvDl+BhZ2T9c+I0CgIxCHtT9fDqfvkgqOxaDYIwoRof8QVwl3CVhq0pYAoo?=
 =?us-ascii?Q?wyza1R3eAUsVbmi8ktF5dVx7u/l8k9vtP5vvSdcbeZq3ap3l32SrjEsu67YL?=
 =?us-ascii?Q?sXFsCi94z76KeiigpBxAvRqVQtEO/MupbI7SZ28L2d5hbeVV+1bhlzfznLjC?=
 =?us-ascii?Q?PXWAUZ7NylUoZZfXAlm+zdf3o5d9FUsyw7wZXj4820CSRtK9ec0HXaOVfT+V?=
 =?us-ascii?Q?UUhiDw2aPifZsjVrsE46TBMFZxf2tYdr/WWA0E+NaFs/KDKJCVcDyS9Olm0T?=
 =?us-ascii?Q?PcOF/StCLrXF/nbojS/7KJcw8W4kvpaDFNEQDmX7AQtd+oGhCN2dfUSVtacL?=
 =?us-ascii?Q?l5Sz1pVhDjqdNmE9meYPFbYw3+2nhcoSE02uE5XXpI3YGiJ0VrSbO/AR9u8y?=
 =?us-ascii?Q?/76AeLk8ybfmBqTtn+Rf26pmEzBsTFLaGkGFB1R4xG1fGkrA/sBtR9dhxnDW?=
 =?us-ascii?Q?SSMwVgO7aXZGXqLbVZrzREuZ5wY8/fh43cwSu6R0PI3ZapJ8Bc8zTliP2ed2?=
 =?us-ascii?Q?mVEojuhsduDhOlJMrSUDIdobX3/5tTSaBd2R1txqwweS2ItzoCgMyc5RFvEI?=
 =?us-ascii?Q?N1ovrFpTbHUgIqVgVeuQH5TBjvpQLHpBlHNG7mF6euGS6ColqJNo/4yZuppB?=
 =?us-ascii?Q?q1oZAFw/FCI+vno6wy6zAlFR6W9kwYByeDV20Ya4hn5UZ8qLYKr+9ToeO9ip?=
 =?us-ascii?Q?tk4V72jAGuzBL4SOWVUCJyUPWWc+gi72DwI66p0hnuUcAz1MlEIrpi/oXpc7?=
 =?us-ascii?Q?ZG4KVubLgGKRQsSY28ij2Z11or6GoQfLCNFCyJdu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47259174-4180-45e7-ddc9-08db93b5bbc2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:15.5026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9Rwte+xft0qHyMC9MeJN9BoWS/dwJ7KHYDaFklBsREzkL7SyoUWys7tSjqyS3M4
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
index 7fae866af0db7a..dada2c00d78ca4 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2264,21 +2264,8 @@ static int __iommu_group_set_domain_internal(struct iommu_group *group,
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
@@ -2314,19 +2301,15 @@ static int __iommu_group_set_domain_internal(struct iommu_group *group,
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
@@ -2940,9 +2923,6 @@ static int iommu_setup_default_domain(struct iommu_group *group,
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
index 87aebba474e093..df54066c262db4 100644
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
2.41.0

