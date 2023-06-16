Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC1E7339AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:20:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NVxJS5Ig;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTXQ4Bg7z3cP3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:20:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NVxJS5Ig;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::625; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT8F6PTHz3bnv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOGTSeC8zYJr1DmwPNIXYySV1Av3/kUire3d9F6Qp7+fyQKcZRVWOsNbITzd7fLQuHEdnDgSU9LXxhmAP3kVLNEUbgqS5wIGpdK6Dp0h3t4iDLH8OkDT7ekMs7s1T6F7R9HuDH2CPOS0objRCoVNQcgiEt/wxIG+ITEijs82UhMV9Odcaz9ntsYLo2znFBNOda2E/o8duE2SRjAQ/TRWStqZsbT08iF8o12yKEC7hRac7Gj7MZdqP4AyUZHiEgk4aijzCESSCKP0Y/Gp9jBggLkQdMarL5fxG8/0URdzexTcK1eM4VONwh5Ay/1F2iQIf3sRqNA9wxYlSNOMYKSfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUJcfpNdGV7lboIiAgPA0VpwiRBsj+xi4myndKO42wo=;
 b=aTGcU7Sir9Mw7scqV8HGJ2A/e7a+ilz5ehuENd4bsB6uLee+1i6juXpFpBQWSFBLDV4sVfS0BUTbIKVU15VH5hXsrTibmrZIgDWIhNqN7D59cPUDnAYQmd+O8uA1M1ftcUFF34bUb9NaoEbEJUNg8mEqUWoZeK70x2tWFUzIz8IxJzKQCpWxJx918pgZPpXiBiG4Ng6PCztxij0DcSoSdLcxcnogOr0oXL1Eib1/CWgm94smQZceO01KcoZt5o1F2yYtvi7Jd5huFYV+2C67Q+o/Ou5lONN5ZNZcTPIZx7cjWxG0g6oaxFwPzlYztZPAexUnJ7zXNpo0ENWDCDW/Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUJcfpNdGV7lboIiAgPA0VpwiRBsj+xi4myndKO42wo=;
 b=NVxJS5IgZYCe1/L5WPip+HpLA1fY0Ki/1OENoQMg4vIhMUqAojuAjId4BG0BsIN0Ojg8Mo3JHir1X/EDvvdosVvYhXK37/uFRRVmsz+HERbaXEBkmHFLBUPevOCcDEj0HHmkXSMFdKNu+LiEJ/dUJzaAfWveyy6Ur44BOqI2iNfMOpffCB445m8AWhZrJ4KK2bwmr3WZc9Q/TqVJsjdnn8VcVnWNR0zgnoT4JLH4qs59e6KSIWQW+lzlk47+CqQhaJcXKCfkpLBAui4200A6Bw90RD/gQo2WPTfXRH0+8nigNN0ZWKgsDZ0hBVvH5nJALTbfzNdu6EY9sOPFl++N+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 19:03:07 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:03:07 +0000
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
Subject: [PATCH v4 16/25] iommu: Remove ops->set_platform_dma_ops()
Date: Fri, 16 Jun 2023 16:02:45 -0300
Message-Id: <16-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0059.namprd20.prod.outlook.com
 (2603:10b6:208:235::28) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: c3dfd829-b06b-4b5f-d7a3-08db6e9c4bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7XIf1xelxTdYWj1/dWcgz6FKGekMpXycQgbqA/1LvgL88CRridsQMPQCHYLGqldq9jHpNM9sRkXFVlcAA4k2uz0G9ovtg49Sk+NrtWUU4POYEhUAAET57TIrmp0A0OV0U+dvTT34loAF2+xJ5LmonSYygDJEM/vkqDYVkO55nSTFciVwdZJaC54DFYzM0Wk2OLkaQUgIdsqGlx25ZeDqaXZTTG02MTd95J2iJr74+WIP/Z2Ekt8xytIs3EqedM6BmvqCO6PGTIfaNpWoiVWbXSJXAWUAhsmpO4FeU1+Mtw4PC57WcjD3oa2BNND4t8Uwh2jRPVVRMef6gKmOO4xjfM03wxvunbp498A1nZ1eveQcVmeZgCM3frSTf/ED6bqsbB+xnrH2L8D1MZ/AKqtaEhp9gRy5VBoVBNhaZ3KMoaShCJU0TK7RSgX6pW3yyy8LNSQHBEduESN/eeVYf1giIIXqU6Lr8pTv/XZ2ev4Bl5twPWan7cRDbAEJeTQpcQyabSlR/uPSHzNFoW3kLfI6Hn4/BZk9RvdvY3r66U/rsJDxihpdyoukBNYjgUIQcy52xSC9wrURwcyJCq5V238B08C93bZzsEJDzbHOiemzByY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(921005)(38100700002)(8676002)(8936002)(5660300002)(107886003)(66556008)(316002)(478600001)(66476007)(66946007)(4326008)(6666004)(6486002)(186003)(7416002)(6506007)(54906003)(7406005)(110136005)(41300700001)(26005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?984Whq2DXQLXIvf6/pyvp6EInUv/wNOQlmq6+2le9ysGYbQpMzaENGR8AKdm?=
 =?us-ascii?Q?DbDvbuJf+vP812OfLWu3CW6Ho+z3uSu2Zdp4FXn4SIJ6MdOUVKBgsCtWyYKA?=
 =?us-ascii?Q?uJAxGBzQ3IPaglysIl55REYURDErgT2UW/rxU8J4NXXIHs91zu7Bapq5BkuC?=
 =?us-ascii?Q?A5eByqxEHByNA6bmSwk7VtPTFGzhfxIPdvvAPV/gmSOVwpEREiJ2YKNorhwz?=
 =?us-ascii?Q?zYl2hfhznBmVGrRwtuoe2mO8t+u1PBUXPi0Fbm2iVKZ1YSP2O83YLNNSNlzn?=
 =?us-ascii?Q?dMzDlq1oRNoJcp8N0micqT/N9axdRk/L0sMdQkaeorla2FO8wO5eobBu8jOy?=
 =?us-ascii?Q?QKkkbVvlOtoyLBSC0Ta94W1gtI9Edctf8z+vbqczcOXIruDdCYm3bv03kxsI?=
 =?us-ascii?Q?xvEQv5QXimHW/VYbQsw0n091cMh8hmk9nzIQDBgjvGQaRgpngFpTd0HwFr2g?=
 =?us-ascii?Q?gMo+hDIzXpfJLiIF35/e6JxzMc+QVVd0Hx40YXAmUVQCjKHApqpNjjUxr3qY?=
 =?us-ascii?Q?A99F/aWLoDNFopDOAM1h2Bd3d042z2UDN+shVGJepJDh+Lwrqdo+kJkBB2oR?=
 =?us-ascii?Q?JDY2hKQyLGAA3i9/37ytFlLHjNFUsYkKb1TFiGt0kJZkrTgtJyu6ql/ckaQo?=
 =?us-ascii?Q?EoT+3o9PYUA1tLa48Q7pRFPiDoyCD7yFgADqMD/RUTTS/wvrLvn+DHTaa1ZM?=
 =?us-ascii?Q?/NLHYvLeNIvvQj0Cyj4DaK44wOu+ZdJEQq56BlgJTGN6L1CaBufzV0pbJbT/?=
 =?us-ascii?Q?+wbJcJ++4IzVbhFg6wWV0gqousIqYG4zIZ7dqy75zhM49AYjKmzc2z74UleK?=
 =?us-ascii?Q?YvODSQWAHK3ArWA0izaC0ZTnZu1YezzzAM7lLiyD7Cvk7b+IJKjDpxsxknCT?=
 =?us-ascii?Q?RX5ksuT7WZbqWBmZPDK3x0A6gvWAf1m9LekEzmPyw3GR4sr8BR6GS9klfeNZ?=
 =?us-ascii?Q?8vzUSvAmVmsOmVmhl0zdX49R/7YE2V4hhiZLIBBLR497OycipJS76jEciL4Y?=
 =?us-ascii?Q?Qr3sNR3v0lEDVPGU+ZnaMB/tgr1EUGkOH2KKU8TOf572MUG5vQwIthlymgcE?=
 =?us-ascii?Q?cV9sJs86mB4gkXSoef9ZQB+aobV3KEakqQCzteOUY89p1np7/XISx7YKCOLB?=
 =?us-ascii?Q?w1wK7gv9BEtr8uJa9xjIC1ilgSbis8lUKoNJ5Ug0mRKDF7yYRKTdcyb2Sk58?=
 =?us-ascii?Q?c8meLiIJSSrzZIz+25KDVaF9eMiuMdgS5kI/ReGYlzZqb7XrdvEXpa9MsuFJ?=
 =?us-ascii?Q?Zv8XmLfen0NBfQ4kYXeE7yDzNfnoSrkpwLHhONyA0klFveizot6Pl0arkGIZ?=
 =?us-ascii?Q?sZqeOtN+jxLtPZezJDIcOzYLfvaSwLAwYCMTyQEqJEd1/Ht74tnJ0kJTOg+l?=
 =?us-ascii?Q?BZpVJr0q7UFSyuF/al5Wi+RUliXvu4offMuK3AeXJsyX1Y6eMkxMPabbVxec?=
 =?us-ascii?Q?Qqs1LAutq0mcTNLk0iueXE/o+KVRLZBNkLOIIlRq+T6dmyOmrLVWPZB9haH0?=
 =?us-ascii?Q?kYNPocezYULl5UeI+NJCpRv9JsJKzdTpL5waKEvbS3lllvVA4E1eER7o5XDZ?=
 =?us-ascii?Q?AuiwZRf+qOIy5Xk/9l5DMaPWmUveqfYCYgKdrFP8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3dfd829-b06b-4b5f-d7a3-08db6e9c4bf7
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:57.3081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nA8v8CV9CqPbTmeiggylA/33KWUmWZM/vyF5+NgIRDSD2H3sV0HLArq7wcLLhN2T
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

