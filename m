Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7ED785DF9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 18:58:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ha5Aph5g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWC8K2b84z3dgJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 02:58:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ha5Aph5g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::619; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwm1DBWz3c5g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEV55TpPvv1XWpYARFYe6gks7H9zQTGrsoEl9uPlCION+FOlr/pgcN7vP9JpQt8sO428Laf1LwH3PJsBLu4QOcHEhLyWDMJ4ETXI2gTxY2Uq4w/R04OPFbJQFqyl3S1t5X/MMUBvnhMl/CdliUQYlfy0Ho3Bx7tNcgq4byADV/Gp077dOeMgu3XriyNFpJgjdKpb0+xlr06D/3sF9+ZACaQ66MVKiVY1W9UTKzx7KnJwHPPxKAQtZHScoQX1g3yNUAfVDx5W4ugKYX1lW/jHA7Mcn2UKrMT29AeFaQPPJIea1yVCnz7pXRl5NJBXyRrSTwbdH8Ppk32359zHzOSpDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Vh/jrZar+VF6tSbgxNByQJmljVZ29qOBiorGlPOVR4=;
 b=CBaih213gLAcebKSpZW/gjXPaO/jYUs1OXCnT/DVyARYzMtcCPJE9NL6ZVbyFiGTZ4tsCiDb62m7YpwwPn6tj209cf+KLV3WPHf+A26W1QqvuNoTCShjR+xInU4QA/uqvBTIGyBUIv5IFpcg2YUW8HE/jV3y7hcqmRDS33rkEFhsGOo5wzuRAIJxD5PJLS/q/bjEiDOJVZWlCQ8vWxP1Ym+K885upgrtmzjgcvzP2dPNfDldmIWS+4uZtg0VRcKeLPwXPJy0IoEjzQjz2otkJWEOAx+O6tvCm79DgZovYclgbAj4o12UTLKs/ducUFVuajcRt4WNMUWtcZ37983kag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Vh/jrZar+VF6tSbgxNByQJmljVZ29qOBiorGlPOVR4=;
 b=ha5Aph5gPGc6tZPEY1idGawKYiqTa49LEW77vJ3FmFtKFXdTGtXTkjdP1r507LnybBP3ReNJhG7rtE0lvQUpkMfMylp55UipEF3J5ChHK/6wyQOfMXs7BiK3pSLP/tlKa8wzpluFiWRON7KmosJMcaApaBypdhSP1sWpB5XnCVdM18YuvOEzZhkCia+acq029Nxi2RUdyOT9l9cDFa244Pf2bCBvRnPxei6o4yIqlT4XcnJvK6pGwRS8eNQr5ycIaLwFGOIbR7SQ6uTdn0qTdFbW9Nnw6lqNW38NMzZtqrDQ0pc0PRqTC01GmO3w7JkUC8hqSzuJHyImeCjDE3cJ/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:51 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:51 +0000
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
Subject: [PATCH v7 21/24] iommu: Add __iommu_group_domain_alloc()
Date: Wed, 23 Aug 2023 13:47:35 -0300
Message-ID: <21-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3fa7d4e8-1c33-4c80-7e47-08dba3f8ac3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	hZ3j5lZFzcqVEtk5AZSndJmX8RQNq6XKOFSbU7Nu2iRisiKty/qfsONeZqY30YYtdXvpH228zbxjRMug3dOFMOQ3/u6Y0ibWH9zZIsSoBGSsEaZanPPyyWOv0AIMyfZGZovQT/UWa5TssXsiBnsipCUF5zRaMrLfnwpAZliGSx2nRBiS/5CRXvZXgUnV+DCZMFqoYRVA6CyJ8cwl7oWcbKUGjnTnWD1sLQmq73z53BTC8523mWA69JCWTR1IbFtw98iM/BcgM48q5zZrL99jcJJHZ/oud1K1MC2WPTvzaK3hII7G3kB77otZHfradBVWHFelpLZfn0ZRjjmqxwGDDfHT5igJctaP8WsE0qwQGcN6Nt3ntjFDfvmdxGBHEklA6Un+QZB64tw/Ptjc4WpxVCxgV6Qsb7gIbniKcwUgch7xSxXxerDNr+sXzLMZw3/YAIEI2K79H+bpMfoXvOpsvi79nnUgT4kDpecHGxod8XoV+DhfjBjb+Lz+IUiXk6H7c90UpFdpEGYZp4WOUOL58BnNpqC6P59hYb0l0eJCRroGNk7wEx+VEuCIOlNANUem3bdjjZqNuKIPI1Gp7Qgl4jDgu+dqoHMzo0dQ6ivuZCo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?36sMzJRQmGwHSUoz9jJ5ixTEVjrR2dhZ+7wecttstgoRsNa6lDKlI0exuqal?=
 =?us-ascii?Q?SsU8xWTyCNKm5Tv6Hgw5fgcbPp8UXUHoGFcSil2Wy5g6nsqPJRK/tstj3i73?=
 =?us-ascii?Q?U3ZRpaoDoDXVnoENRmy/TLfP5RwBYiNz4W4ZZPlFZ0AHLzDJuKCn9eB0vXDa?=
 =?us-ascii?Q?lL8umkcYsJYeXif1hLeEKrLshne6w/F5MVvj8qSOJRukUTCpIDsz4zblGWSV?=
 =?us-ascii?Q?xu0HCYs58y9lp3J2OdRa+S7kz2WkMWT4yOixjZtCZO5uGd6166/RzXF1zUR9?=
 =?us-ascii?Q?yl0uybOxhciCZU2qfSP0UWnqIQ6k3PzVnB5vCakLe3IY4Y5uSiP2G4/xr3vz?=
 =?us-ascii?Q?Wy4XlTVv9ogWESjgTC2+T9CVRuIirqoQ6bFsBFXMY1EsBtVpnTiedFuretf5?=
 =?us-ascii?Q?qcuq6dknIHPy0bQgWPxvi32zg7b7p80bqi8Z+Wy/Pr9rKlv1e1G596C4HXmr?=
 =?us-ascii?Q?H3Uko67tWDTjzPjvNaHk5IKL7lqxP8hDNrayCAXh4nvzuMoFm2JaenGI/Q3V?=
 =?us-ascii?Q?yQP56vy+H2JTIT6841524I5CDhTmJM8iCRN/sHU2En/C8W0FUrESiisLaQ2e?=
 =?us-ascii?Q?TruLkg8EOVQ3W8fGoJKy6kLseUq8tYstQpARkuI3/qIk9Nrh8vT42k+Bl8oV?=
 =?us-ascii?Q?8Y0pV/EEAP+a3NFIsrR/XenfmpbGbapMoC15EaJUyUjKvxQseDPdqDjdYb5V?=
 =?us-ascii?Q?XrQJlW2mHBTABDMkKBY5ulNKEEIW15TVFEgSOqx7HhJG6ggmkawAiHgPxXVV?=
 =?us-ascii?Q?IMXLLoZOCy9wPRM7roTJZz0L+WbPo+0l5o/vEyfCAbkXZQO6d1HaiGIlYBdu?=
 =?us-ascii?Q?wclU5iSB4Vmj084ETLKRSQ54cXpjmli2uwxS4OaN90ZAFFx/cHqATRDGJ0Yh?=
 =?us-ascii?Q?Mg/X7LUYbNTqj1QffQQlHgGbztphjyT1MGwFmk2dqkDrdJZ/IIJkVSYbZCjd?=
 =?us-ascii?Q?ez/ECaylyomvq/xghzrla5LMqlbGLy4QmOH/TLTLD1Mvv4ihIWC8lyH8bSYu?=
 =?us-ascii?Q?wL2dduRTSuUSYUlw8PvdP6H4XIBo7RnkwLTkasPpuUulCCcFHUZoepwbNCRg?=
 =?us-ascii?Q?ob+yPJl/Yz7yZSfIzzR6OPoNU3PvH2hvwNC1BGxmVpg6jR3vKvKllFKFcuAo?=
 =?us-ascii?Q?stE/aZo7GxdNP3FVxqHsBH9j7FxVzreW3iqWc/cZOjK0jrqWb5LDhmNYB7cu?=
 =?us-ascii?Q?R6DnK+3ThHkNYxY+f573Z5QykTziUNPbzJrCdkuJAqOv+MwpPEEbWal5ferK?=
 =?us-ascii?Q?ZXPfihwoHkCaOZ0nWZREXFXV3eLrU8DUfBNPWmqhIm/ajCvsF+kpcXkYBH80?=
 =?us-ascii?Q?MsmpPWv0VTRlk76EpgOXf30R85J1FauPkLlu9dsb8kzwijPGuez/xjfWPBFy?=
 =?us-ascii?Q?qGSAj/pLhZ3CUlN+vr2miZpNqyN1LwiS5fWg8TM6dzcSW21G12S97wPpEGaT?=
 =?us-ascii?Q?rHH7pSGfMidGhhgxKYNB7RLRbzdJYLr9+k6WhCgymAdRGpSquvPoGdbaH3pj?=
 =?us-ascii?Q?RZKQaD8e1TGnlywtxWfo+tuy9jCznLUcZ1/V/vyR45Wa7xm3kdQAMEhbmQRo?=
 =?us-ascii?Q?t2OMArDYvbYfexUsk8lMauD7h1S1EZeWLq8PKqan?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa7d4e8-1c33-4c80-7e47-08dba3f8ac3a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:44.3673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J40PjWnDM7KG8j2X8Zvd8xQXE261dl7s4YKVONaTybRYQ++3Huc1tCk5NRtoEz9p
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

Allocate a domain from a group. Automatically obtains the iommu_ops to use
from the device list of the group. Convert the internal callers to use it.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 59 +++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 3003c249ab9b8e..568dec45a06954 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -96,8 +96,8 @@ static const char * const iommu_group_resv_type_string[] = {
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
@@ -1719,12 +1719,11 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
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
@@ -1751,9 +1750,7 @@ static const struct iommu_ops *group_iommu_ops(struct iommu_group *group)
 static struct iommu_domain *
 iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 {
-	const struct bus_type *bus =
-		list_first_entry(&group->devices, struct group_device, list)
-			->dev->bus;
+	const struct iommu_ops *ops = group_iommu_ops(group);
 	struct iommu_domain *dom;
 
 	lockdep_assert_held(&group->mutex);
@@ -1763,24 +1760,24 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
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
 
@@ -2043,19 +2040,16 @@ void iommu_set_fault_handler(struct iommu_domain *domain,
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
 
@@ -2065,10 +2059,10 @@ static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
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
@@ -2077,9 +2071,17 @@ static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
 	return domain;
 }
 
+static struct iommu_domain *
+__iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
+{
+	return __iommu_domain_alloc(group_iommu_ops(group), type);
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
 
@@ -3239,21 +3241,18 @@ void iommu_device_unuse_default_domain(struct device *dev)
 
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
2.41.0

