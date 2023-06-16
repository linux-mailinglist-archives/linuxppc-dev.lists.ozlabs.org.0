Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0B673393C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:08:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Xx83ko7v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTGC3Ypbz3c9j
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:08:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Xx83ko7v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::60d; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT895Tb5z3bhc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8gVspyDOwr3y4MD+SBZjp9CkVJz+5KtXRp4ge20xTBludg8ANuOJr4ILyMf2u55l37kw6yYwlZ0TCq51nf5Ts+WxySDkj+9yTME6ptyyzqLgt1IuiV6oIqmvevqStZlpuQdmGvvOPGobKMIqvl9K4gDOtLKboyQ6SlaDF1b98oE4CTOP3zYc+CFoZ2Hszep1AgGU6jVdBpFq/O744M+BbeFTmw8h82XvCzd+o7URhIxVT1ZIr7BWwPSR8cOPa9lD2vKwaNPgNTvu2puZG9fPEuL0w6QTqvL1ZlxVotvfpqS5yhO13XevJy+fZmFvlNF6NUCHqSjL5UZ65G2rHmWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGJ9OhSGaMcQ94+sOuAW3uy5BsT4kqLXHivmJ7O0hfg=;
 b=jJLG9BikP1BbOo3i89CU7HzWNEOswaDcP1JykTUvN9JlD+4LhR9B3lvsHvj2fyFZD09e5irUlbZCr9gelxI8Rq9PZYH7kuKVdRLhtlPa+6B55BMCiXcaN5kaALUCm2XhVJZjDTR+JyKYydAcGxmHp2fzyYczEm/UDO9c8vEtsW2Ic7v2BYysHOjZFsL2BPJPQycVAl6on1hFpM2Y2L07cKtibLuM79MQNRCw5rZ8UXgJrrslPS4phc1FqgSikeikoniMRRK3s6Swb2X1dRkOlTH2XyBnpxqIkn/tXBNfAcPqPdVC15sUKJCZ/31xxS1tJWl5uk2s24YGej4aOsdNww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGJ9OhSGaMcQ94+sOuAW3uy5BsT4kqLXHivmJ7O0hfg=;
 b=Xx83ko7vPjX03xpNDGdXJqZsMRhgAvDtb+3Wk8w1Tg4xKxgpGtL8LMIXivX6KcUd8f1lZcoz2MnsszwCcvpg2J4dp+fjU58OKd7/6Ssv3ktpCqRLQoHRmoaQ6eA3HYxGBFkNxPMCwhIWnq5c+RotsBuRFkyiGrI8hWWXFbXejXZOEGeT7UKn1mavMX9tkkHcQ00jzJzeh1z63W3ERuAF48B2wilDXnmrkD0Uvlxc08p03EHjmCT0Jrl1DxAi8280m2QDtMiuLAYcSncIV7XcBIJOfj3I1s65NeB/HUoMdZm1bEl25JKed2IdNhJ0nG11kfsJtjDH12f8QGhewD79nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 19:03:00 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:03:00 +0000
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
Subject: [PATCH v4 22/25] iommu: Add __iommu_group_domain_alloc()
Date: Fri, 16 Jun 2023 16:02:51 -0300
Message-Id: <22-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:208:329::32) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 2da2cd77-dde2-494b-12e9-08db6e9c4b26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Bb7o1baGLsaGCLaeruoJW8GL3T+IoioQthazHce94MlJupFbW1oFlWlP+kUr+KAK2NmM6oqyHSeTYV0ERG2KyDqPCg6vs6EAAtplvX77XbgM8Bef57gUrloiZWtIRo6OR77MAYIElKkZ4XHuCvc30ciXtukWw9/YYPcNRXCM1oBBaAC1a93L1jo3s2gTAukloqUMLLWWVvQYgmA+YjK+6BmtHwExh7Xf/SJzSKVveqap3+p636JJcFMrIs/YgI/LpsU+qW2QJJMkX0tO6AbvRHtS1ku5utTYB8DFpRrMXY9SuHo8q03JCOxa1d/J7NBc1SCh09LaxZCedJqTgqOA8GgKLqqdZzIOR1BjLoWnh7G21ih/aPpY9YjgeVFLq+ruDbmBLmjzZ57JAsvikGkF31z1kN9XU8u8X/9sFHm8HIrgCqNPMsIQr+VzWdX2lrUeIm1GQbVPyTT4m/rrU9Z2emHLzRIKzTxm7DTfYAdaVKUcXuMLv+kmAWgDciFtTpTMJuD0GvNY0005k8nQWzirNO2gcQfvhEOsQz+DtkloMESQzLgSKRAWNzkAkLTrIWdjORiceii1MgHa7Lsw9ME0Tw8DBd6OZbDtirQZ2BvYJcs=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(921005)(38100700002)(8676002)(8936002)(5660300002)(107886003)(66556008)(316002)(478600001)(66476007)(66946007)(4326008)(6666004)(6486002)(186003)(7416002)(6506007)(54906003)(7406005)(110136005)(41300700001)(26005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?U0Jcw54Y6dFGBhGrm+7+XoP0yClOjJOXeRVgjr3zqju3Z5cfEF62s7CnZnqH?=
 =?us-ascii?Q?i/1CprWkmf1CYQo0wLZNwUIOCNCEjWLDwNrWHyHi+veWIoqUj6B/52enhX32?=
 =?us-ascii?Q?sy2QhLyxnMOEAjR1ED8rdOkwifU4qV+4+sVE0cpIGeOr1n/+5YQwwT33ZArR?=
 =?us-ascii?Q?HX9+gQ8X13gFgEbs41sxs3pi7DGBtrCcvUkvtTNLHATXf6HK7sSNMPeT3byc?=
 =?us-ascii?Q?Nb++N8T0c+Rx05FrosGZkfSxcVrqK06Sr5wTj06oi/JBrex3iyT3YSBAi0cX?=
 =?us-ascii?Q?QJQS6yOgDCZh0oNWLKNl/CsplJlYYXR8t4hwG8AjaP0J8qePtOMVEstXQjzR?=
 =?us-ascii?Q?gieLLLCp4lybAg2uwTFojf2kN3cvOcudZu6BRtXKrAnWT6gXt2DeAgU4CTHS?=
 =?us-ascii?Q?8FJ9poEcaP6K3op8IRTrn8gU2YaNXcqPoFlV3eh2hnFXOlhTMeb3ZlZ6fWpY?=
 =?us-ascii?Q?ZBlPDxUiVBbpgHMw0n2WDArY5AFk32CGT3Clp0STtGudADjqKQzWrP3cilTF?=
 =?us-ascii?Q?q3OOC9Vg8ity1DhTHxcj2LTEKJNrv7qqNXq258oP26DpjtdF9TuVvbmr3Oof?=
 =?us-ascii?Q?L7tgx+HHLCKZJtMnagbDbK6qCJMLBzcudBfeurEvVL4FgvA9hJctrGAKg5mP?=
 =?us-ascii?Q?SBDOCALsf3i01lE0ANHvVdgrD5fxHU/dE/e+E6aYPW8r7RERohLKp4EJQkBu?=
 =?us-ascii?Q?R1J8I8Xu1cxm3wghdGln/vizXU1ZnfmBliTv46LiHHF3CvdupRFHlOmewAIa?=
 =?us-ascii?Q?YqJr/InKrjPG0Kz3Sy6D3QydYFDr/wK284CCTEgNUYItbNMXbHFlpEdbc2RJ?=
 =?us-ascii?Q?Lalm+bv4h4UDZukCVSgrgHyftV0X7ek8pdCcHA9aWOWPL6ENmmqVRJsqCSG5?=
 =?us-ascii?Q?hvSG0f2k19Upk4tCIDuYf+MIEL2aZa2eIJrDlLWYVUjBlwGrB+Qhq0YmSsBp?=
 =?us-ascii?Q?01tf1evYyY9keZH2M+GvbB3gzvxvaV/FU5V8IKGQvM/Ne1Up7QKTMote6znv?=
 =?us-ascii?Q?GJBi5uytAAtZBZp4q+U+kqvBGNWQrrnFRkXQnv9sZnI1mSB2oSjZ79GySiD5?=
 =?us-ascii?Q?v1r0G2HZyZFs7RuxxnJ400xCBwC3cwkzNvhNr+kwyZCzsXMQ2b4nwBKLbsIp?=
 =?us-ascii?Q?xWkem+zfuWohYiA5W7fk8Aw5k/8CNBmSWan6GfxWeilLCPpHyCyc51+wlmgP?=
 =?us-ascii?Q?eINwmw3GljmE72uHZwW+LGwKc4z2ykscXSgFv0IZHs8EIk4XY/MhvQjzmaqL?=
 =?us-ascii?Q?qUZgTwpuGkTFuTw6za3RX5awFn9vZzOIsLr/P1BXEaSh0OMCTXdDtp+1WqD1?=
 =?us-ascii?Q?9ZeArxGpmLFSCK9DCke8HCV8Ods5hxqzvsdg3zjn+fo5BGBDP6MEGRIKh6+5?=
 =?us-ascii?Q?fu5A1cRZQ3arwa3q/LGFs88cWKjgSnbz+Z3Q0QhWKR+QDy8eq0o3U2lQyG4A?=
 =?us-ascii?Q?V/V5fa7Zyy3CSVPFtLSp+ediV1qbOuhcxAcYxkOsivrlunFtPkFs/uDnNCJ+?=
 =?us-ascii?Q?SxAdhyRuMDOkZZiQqrQ/q3TFkCC430mS53e+UsLJVzP4WtbMEFqDHvNnCqox?=
 =?us-ascii?Q?ksudZQdY7hhYPiKH+O9kM6MfBfF5/YWfTYQFeKAB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da2cd77-dde2-494b-12e9-08db6e9c4b26
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:55.9525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VHSd87hHy9pS40u/7zbdQwYD70LuJHgvuV4lNkZUa0OxkUT21Jd7SYu0dzqyEdNH
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

Allocate a domain from a group. Automatically obtains the iommu_ops to use
from the device list of the group. Convert the internal callers to use it.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 66 ++++++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 98b855487cf03c..0346c05e108438 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -94,8 +94,8 @@ static const char * const iommu_group_resv_type_string[] = {
 static int iommu_bus_notifier(struct notifier_block *nb,
 			      unsigned long action, void *data);
 static void iommu_release_device(struct device *dev);
-static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
-						 unsigned type);
+static struct iommu_domain *
+__iommu_group_domain_alloc(struct iommu_group *group, unsigned int type);
 static int __iommu_attach_device(struct iommu_domain *domain,
 				 struct device *dev);
 static int __iommu_attach_group(struct iommu_domain *domain,
@@ -1652,12 +1652,11 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
 EXPORT_SYMBOL_GPL(fsl_mc_device_group);
 
 static struct iommu_domain *
-__iommu_group_alloc_default_domain(const struct bus_type *bus,
-				   struct iommu_group *group, int req_type)
+__iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 {
 	if (group->default_domain && group->default_domain->type == req_type)
 		return group->default_domain;
-	return __iommu_domain_alloc(bus, req_type);
+	return __iommu_group_domain_alloc(group, req_type);
 }
 
 /*
@@ -1667,9 +1666,10 @@ __iommu_group_alloc_default_domain(const struct bus_type *bus,
 static struct iommu_domain *
 iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 {
-	const struct bus_type *bus =
+	struct device *dev =
 		list_first_entry(&group->devices, struct group_device, list)
-			->dev->bus;
+			->dev;
+	const struct iommu_ops *ops = dev_iommu_ops(dev);
 	struct iommu_domain *dom;
 
 	lockdep_assert_held(&group->mutex);
@@ -1679,24 +1679,24 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 	 * domain. This should always be either an IDENTITY or PLATFORM domain.
 	 * Do not use in new drivers.
 	 */
-	if (bus->iommu_ops->default_domain) {
+	if (ops->default_domain) {
 		if (req_type)
 			return ERR_PTR(-EINVAL);
-		return bus->iommu_ops->default_domain;
+		return ops->default_domain;
 	}
 
 	if (req_type)
-		return __iommu_group_alloc_default_domain(bus, group, req_type);
+		return __iommu_group_alloc_default_domain(group, req_type);
 
 	/* The driver gave no guidance on what type to use, try the default */
-	dom = __iommu_group_alloc_default_domain(bus, group, iommu_def_domain_type);
+	dom = __iommu_group_alloc_default_domain(group, iommu_def_domain_type);
 	if (dom)
 		return dom;
 
 	/* Otherwise IDENTITY and DMA_FQ defaults will try DMA */
 	if (iommu_def_domain_type == IOMMU_DOMAIN_DMA)
 		return NULL;
-	dom = __iommu_group_alloc_default_domain(bus, group, IOMMU_DOMAIN_DMA);
+	dom = __iommu_group_alloc_default_domain(group, IOMMU_DOMAIN_DMA);
 	if (!dom)
 		return NULL;
 
@@ -1984,19 +1984,16 @@ void iommu_set_fault_handler(struct iommu_domain *domain,
 }
 EXPORT_SYMBOL_GPL(iommu_set_fault_handler);
 
-static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
-						 unsigned type)
+static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
+						 unsigned int type)
 {
 	struct iommu_domain *domain;
 	unsigned int alloc_type = type & IOMMU_DOMAIN_ALLOC_FLAGS;
 
-	if (bus == NULL || bus->iommu_ops == NULL)
-		return NULL;
+	if (alloc_type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
+		return ops->identity_domain;
 
-	if (alloc_type == IOMMU_DOMAIN_IDENTITY && bus->iommu_ops->identity_domain)
-		return bus->iommu_ops->identity_domain;
-
-	domain = bus->iommu_ops->domain_alloc(alloc_type);
+	domain = ops->domain_alloc(alloc_type);
 	if (!domain)
 		return NULL;
 
@@ -2006,10 +2003,10 @@ static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
 	 * may override this later
 	 */
 	if (!domain->pgsize_bitmap)
-		domain->pgsize_bitmap = bus->iommu_ops->pgsize_bitmap;
+		domain->pgsize_bitmap = ops->pgsize_bitmap;
 
 	if (!domain->ops)
-		domain->ops = bus->iommu_ops->default_domain_ops;
+		domain->ops = ops->default_domain_ops;
 
 	if (iommu_is_dma_domain(domain) && iommu_get_dma_cookie(domain)) {
 		iommu_domain_free(domain);
@@ -2018,9 +2015,23 @@ static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
 	return domain;
 }
 
+static struct iommu_domain *
+__iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
+{
+	struct device *dev =
+		list_first_entry(&group->devices, struct group_device, list)
+			->dev;
+
+	lockdep_assert_held(&group->mutex);
+
+	return __iommu_domain_alloc(dev_iommu_ops(dev), type);
+}
+
 struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
 {
-	return __iommu_domain_alloc(bus, IOMMU_DOMAIN_UNMANAGED);
+	if (bus == NULL || bus->iommu_ops == NULL)
+		return NULL;
+	return __iommu_domain_alloc(bus->iommu_ops, IOMMU_DOMAIN_UNMANAGED);
 }
 EXPORT_SYMBOL_GPL(iommu_domain_alloc);
 
@@ -3129,21 +3140,18 @@ void iommu_device_unuse_default_domain(struct device *dev)
 
 static int __iommu_group_alloc_blocking_domain(struct iommu_group *group)
 {
-	struct group_device *dev =
-		list_first_entry(&group->devices, struct group_device, list);
-
 	if (group->blocking_domain)
 		return 0;
 
 	group->blocking_domain =
-		__iommu_domain_alloc(dev->dev->bus, IOMMU_DOMAIN_BLOCKED);
+		__iommu_group_domain_alloc(group, IOMMU_DOMAIN_BLOCKED);
 	if (!group->blocking_domain) {
 		/*
 		 * For drivers that do not yet understand IOMMU_DOMAIN_BLOCKED
 		 * create an empty domain instead.
 		 */
-		group->blocking_domain = __iommu_domain_alloc(
-			dev->dev->bus, IOMMU_DOMAIN_UNMANAGED);
+		group->blocking_domain = __iommu_group_domain_alloc(
+			group, IOMMU_DOMAIN_UNMANAGED);
 		if (!group->blocking_domain)
 			return -EINVAL;
 	}
-- 
2.40.1

