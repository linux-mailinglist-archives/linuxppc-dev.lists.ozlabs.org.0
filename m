Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BC875FDAB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:28:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tLuxcUkQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nF82pBZz3cSC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:28:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tLuxcUkQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::611; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6Y6VxYz2yDT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dL1iV8eG+5pr6mrOoHm3+xAfxeIcmFfRCrpvE8zZY6xrSTWjhVLX05k+vTZlKvGN5Mxqcb962BEU9dLlppN46+Ik0ADsaq/G5dITqDSW/YxO+dLNi1612dqKbhucXuhpG7oYf7QFFhbF+ixWabJ4kVatJO8srIDnwzayreT6OoJub5KF+j0ss8W/udtM2ylGib2LebVUw7rsyyiURabsMem6Pri9qjlhSFMCrlQYBenwaBoR4l0zrZX5T0LiyGJMJUVIdlFSU6P/YrngwE0e5ROzYq1CxF3FLIPx+QVWtNAnBbI4whAX2QLZuRZ2SbtMHX8RtJaiL6dGZ605fzefvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmgAxbbM05aXl6a8scPVaBLDDiCsDqadI3kHJwxmGn0=;
 b=LsAXpT+zdDbafZAyYI1mnMuacNLOWWRHhjOF2+xtSmn9gjZqVHzOo5TKUovC3u3zfDQVe63Dvevvy/WpjbZ5S9J4xLaUn10WnXYj9YtaMiPpFLDFYiaVfmscuanblc3Z/LjZC7BZfrTZ9IJCWh4+U0anjIWLf8rQNelv9QgG5fXWjsxqNwn6l09pleeZI/sULBgIbfVgDCdqn3wn+yQAUzN6PDN2ZCNFNBSFw07uEdDLNVqzi8LMmiDuNJpfmU9Miw9vLDTjV/7j4q5nz2SV+ZEF7ntclF65V2KP7lUo+BMc5slwJOAOc/aWJ0KgqJd3ozJzLmBqdyz7P9JNpqHhvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmgAxbbM05aXl6a8scPVaBLDDiCsDqadI3kHJwxmGn0=;
 b=tLuxcUkQz/KHd2hs1AZe7zaOoLaofTvId+1y/eMtcp2yx+dxwoFRcRm0Vtx+o4ZZBRPDQ2xadvkTPOAA+ktzP/SpMhw/a+ZHazpkti9uKsooE0+GXO4OTSSUW50Y7Syxy/CuUo5MdjdbAdbUtuW56eTm0b1gygFhaoHjaXVaEBLOjq8fNqZGb6MDHkOcGxaLhBfxaq7unnX4ve0ibdQyS6VWES1O1MPhoxRhvzG6mihIQquZi/pSqZKc10YFBzUpBZMASThDOv12+iToZ12VzMT4T/AhFyy3iZzhw8PXNKFpOJFLWSpHUjchXB/y2xagRcLg4CrQs5YyRwiq1QFQVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB7353.namprd12.prod.outlook.com (2603:10b6:510:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:20 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:20 +0000
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
Subject: [PATCH v5 16/25] iommu: Remove ops->set_platform_dma_ops()
Date: Mon, 24 Jul 2023 14:22:06 -0300
Message-ID: <16-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0185.namprd13.prod.outlook.com
 (2603:10b6:208:2be::10) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 76760396-2257-498f-c8af-08db8c6a8796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	louLdhnudlEwPBJCaLj/zd8leuVmKPtTYBZ8Trjx1TJrI66lFUU2lYJCGmuLD0DQS5aoqbR7OYFdhEj6jwGh7zVcdBwg+NOZ6Lg+QbBT8AhK0n7zFoBpjyOj6agawACu0zhZ9O20o+2uy8emdkkBlAMQvH63iu2oC24yP/5CppLYozBbcrJ5hj0YRWemIeT7pOFOgh01q0R+AQm164zPs49R75e6+GgckAMg5Wl9Mbua+5zhuQB/oVVGFe08lzCrpTAEIypIH0X4JjDvvh3vXhzgAObOf5Ss5pg/aRLi/I/MAypp+4pPpFL5psxH+oM37W5JK5kYg322YSnDPLW3E0/jH/GmoDM7PLfJmHZ7pE/e91ETHmErARFFNUtEFklOnBYq5YZQmhjIl8mYdHXksvTGYPRNZSPE6IF1D1nrfafk23FUTd/KufF7B/XR1MwScfedDqxV17tMkRBX1lalc+P+px4kImLl4z3oXPTWgvuPp2SnTo/MTCVvxI+o7ek7Nz+fmLRcLguEGlinx3AUALMNCyvpnam7O3MPFjOkOUYOxnvnKMebzgRA8e40cWYtTKFj1TqnfYpAYLnHXmZsXcD5arGWEOADBoaLNeafX6c=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(36756003)(478600001)(6512007)(6486002)(110136005)(6666004)(54906003)(6506007)(186003)(26005)(107886003)(2906002)(316002)(4326008)(66946007)(66556008)(66476007)(7416002)(7406005)(8676002)(5660300002)(8936002)(921005)(38100700002)(41300700001)(86362001)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/h6OcfcMbPWz883fu5irQt3vvdZGdErYy2BLSBd5ZPjva3UioD+oMG9pLR9u?=
 =?us-ascii?Q?Aks+Fb9bf/2O6x/Av9VV5jLF1fO7AFJI5Rof/G5FWKvuY49MdIFspI2QRwnZ?=
 =?us-ascii?Q?VNevzIGGe893CsRro5wy9W9XmBpXz4J6VEXZRC6ThnZrK9LJ0Y8OQVJVcDG4?=
 =?us-ascii?Q?WsFPZe2SdPb9pO3H4No/SrOsPILazjgbmOYqxhQwjlJ+awKlzSkW7uZsSq4N?=
 =?us-ascii?Q?/CaPKdj7g10Z+OEs7Jthuw1Zl0dQHKEMfTbOHr8/Ru8bOWNlP2UJz/MDKy44?=
 =?us-ascii?Q?+6jVD+WhnaCPY5TLWJAHhgyxA12Uxf0nXe5DB4pdaWjFHFyufJDXDU6EAwuq?=
 =?us-ascii?Q?FMqUNK1KklanhgJ32tKq2VIT1iKqcxf9nKe4ZxRH3ZtSd3kThcnmZvPb3cOL?=
 =?us-ascii?Q?UBv2S4+O9cIwJDcGYlhrttzyKJPPO/ub2n/TMrUOMiSyRL/byQnblRtrezFa?=
 =?us-ascii?Q?ArqlWDTbZ8O8FXqS33VevBCpK+vTkCJvAaGiw4KuB3YebX+wkdSZjypamBzX?=
 =?us-ascii?Q?3N7Je4DXwAeduDcSnbGhHFIG0YeflaAKVTxClOkDRAQIL0kLAUzN5S0+7fQw?=
 =?us-ascii?Q?19CA6AOAFgnhOjUEEvEHMTSerZSEciBgKItInNEHQWTmGoRO3TU0J9E4Xmxl?=
 =?us-ascii?Q?cUaDGrdgRkVBEza1N6Sy9qDrfJRWQcQlk7cqfkxVIM9hgN2gYMMy2euvAPrW?=
 =?us-ascii?Q?z5hVkpkcP8hkkicHipo1kh1+o1dzOnZaSHBNQdFsKVeyTd0BFqRLZE3vxInu?=
 =?us-ascii?Q?nDiGcHiit6sD2by5Iz83DqbIMmREoLa8YKaU8inDYSPf52aURIr4OP3Xj1Sk?=
 =?us-ascii?Q?kZIG1X5fuE5rYDj65Qgj027mvQAyLW5EW1/8CKYFfmSwHnadGDBGJr3C6Xff?=
 =?us-ascii?Q?FQOwI5TL1HozTalHXsnx6Fdb//lx9p6xESyjeY/pipnclO6cnwAApzUmFWJV?=
 =?us-ascii?Q?vYqrElMoK51URmUHGzw6a8LtSyO9t25OTlCur5vuehNGklZp1Y/ui6me9Vv6?=
 =?us-ascii?Q?iqv/RB58znIHvw5BTOfuYbpyI1WSlCtTbHAmhjUbpChRIYyX1GzTbF4wE+hX?=
 =?us-ascii?Q?qVy+mwSO8KK1IgOOQImK8aB/Je6u1lWb/Df1uf2W0FRoFXvYrFtguAyxwR72?=
 =?us-ascii?Q?wMP3OBpIYRicc38xMzKtx2ipTBtYmSpwO0CkNjfv+mwjBUecgVlgeZYAcMEZ?=
 =?us-ascii?Q?SS4+DYrdCnmrbEfH5WWpNFpAM3ULAvPD70dPQKwloSQkDpkChYj02d3V9bvG?=
 =?us-ascii?Q?R4kRcM5q8WVaFsKV118WhuXMZ8hjspfURAHgGaixax//8zqwklCpiZ+VZhMb?=
 =?us-ascii?Q?zzsPN5yeilCG27RwLAoOSrlZC9nVFGo9GGETp32buDDYoJ5M6h0r7rsSolp0?=
 =?us-ascii?Q?AIfa5UD2sWP6NfjqPsGEAMSARWUCUOBqfn/ptka9+QowRrxEiGt5npHKxQDg?=
 =?us-ascii?Q?cw+SMv9Sa7LYUV1qLQQqQ1ChQd2+SGZRmJRo/8dHBbC8O/ILvrsNyM3T6oij?=
 =?us-ascii?Q?jlTENul6Z627Nq6Fo1vxh9STUbZdumrEv66JBEpjioCkuJFjmSkutL6zY1iz?=
 =?us-ascii?Q?A2DiJpdPTWsw5h9UE5oWFjCSxRI513Hy7LIKWOJZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76760396-2257-498f-c8af-08db8c6a8796
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:17.3596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: adnhGIs3fQ/dHLq5c0l8OF7WSeTL82w1PJJJ+Hds1TlbWMxmG5Uf51mGSlrDHLdh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7353
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

