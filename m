Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD04785DE4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 18:51:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aL/0e88H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWC0T4YSqz3cQr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 02:51:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aL/0e88H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eb2::621; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20621.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwh2jzyz3bZM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dhMYuFDZLLTFxLqcNAPQ2XEZwxRn39P8CV3d/zDOkRs22xUEIh0xW8dYdCHgEgAAqcO6Z8xW+/YLwo0TA+0Bl+iS2Q7CJa7X6uL26ikk1I1meSmnPymy9kcgan03XeCY2mk8d6Ye52hRLSWDN+hAu3uJt5dCloTnuY5dKK/enrXDN1zcYz/o8spJFmAa3QUHAuSLEWe39PdVm4f9/o/sKIxpFuiJujwfNB12KTlUpGTQgcCbbtjeb1+2ZtJOi8uQvRxgF51Mszlt/gS22O7orp47BH7qU871b0+2qASlQy4fMQB2HbJ8mxKmBpR+3VMAkEGPZAt9JDXYzJWDR3QRNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9jVqWjNYnYdiXeki1jbg6BHd/kVXWFzDIgAyZvEFCM=;
 b=FByMbCXjF1+0w/aOU6cH8sxdoEvBaMXpn0J/QGgp9OgzpOkqWM5EIrgu0AjxCOpP3yuJKFGc3aBwUDtWq4/oM+a8BJTqIrzGee59VHab/pfua20OsWRHVkMMYELKzr6EpfGyu+BaQHgi2b06Y10CT/GH8AIl+RopH/2xcSWWD0PgARTwzNbYGkkFvw4GBG9qeCG9F9gShdRpDAyHS109kRLg38EOUICfjzQ1ApLwm4Iao5LkWPrk4eOF+gawKj5jd60k0zzhBQtZo76PsVRUMsUqgSS9Q8MM8Itr9yrPdvwPwRyXBTBs5XkLdgeJXWgUrxfGlinx04eWn3i0Vjsa1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9jVqWjNYnYdiXeki1jbg6BHd/kVXWFzDIgAyZvEFCM=;
 b=aL/0e88HN4uaG0Tirqjb1ct9Mv8GGht65a7N5/6k0qVI8xU+0XpjYOvlZnPVou5NrCoz7eHOPsEVUtZFxdAhHDt2tM3dW237GpBSSNGsLJU+P/BZAAyNDGqIl/m0APfvh1fTGa2bcfozkvqd1yoi4WYeWkIV4kvSMKIjcAMLiD/9VHilY+MeVyNPtHVcupcKgl2wkwYdzP0tgoYsPKJvREx2YDOqo4yqUuFd0vEwpcoEXBn0xrrcQFetjDasIypWLZiLyw317bFbBj0vQC2uFN4AbsVoGVFmQSnmphHTQHwcEm+qwpaSR1usa1Wk+LdGQ7+n4FjcSYSIij7KPEouHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6459.namprd12.prod.outlook.com (2603:10b6:208:3a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 16:47:41 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:41 +0000
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
Subject: [PATCH v7 02/24] iommu: Add IOMMU_DOMAIN_PLATFORM
Date: Wed, 23 Aug 2023 13:47:16 -0300
Message-ID: <2-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0420.namprd03.prod.outlook.com
 (2603:10b6:610:11b::25) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 28fad826-712f-4553-4de0-08dba3f8aa29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	uNHgQ+qvzYBmm/wXR5Gu3Ij+luOnSlur+FgHruOpZ2oSnlQX0j73ndQVeE9o4RRADs58kgXAOD5MFNDJN2K0J8oNEsBGakjAQ8M1jmoDwuL8I/lXqhKHbdSGXQEicS39Wi1Y3W0jTiTrEtAIJC83gpc6t6Rj9v48pOifr/y5uemM4jfrNIjDl3c8xAWruf7BXpczJVqXUbyy8B2UJ5qf1dyaIhDYGM17I0ur/tNXA2t/r8suqlOjjjPgHjj5CF9jECVKvLNmY8xrRWtd76IZBoJ6aDboQRsCwYjFedVjEwofuIOpxr76vi7wqG/JHjr0L2/I3SSqpsAjjHk7/WxGDR+2V8vrxuMlsbJxsSQCB015icga/0OZ2RojM2bn3S2k3ZN3WiVV0WemYsTvmBLeL1cjb39SqJjLXBQSLWp+6b1XkT23trJ8YcGaeDzOV9AD9IxUP6vCCbf0oJrWdRNFvArt3ZvISKkZtkaH64KCdQTn7sGj+BTA92QS1kllBBhBXFw2PT2xj33QhzaOoqOZYbyPfqwEq5lF+LjRHN4RMadnONA2LhoGh4G9LqKDPfEPo/d9fr7EvSVbfy4NXsqKbZnK7WjHNi/PMV9Aiw/vZw/AaayvwWXZRuk1p/pgzaUl
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199024)(186009)(1800799009)(36756003)(478600001)(86362001)(6486002)(6506007)(66476007)(66556008)(316002)(54906003)(110136005)(66946007)(6666004)(41300700001)(6512007)(38100700002)(8676002)(4326008)(8936002)(5660300002)(107886003)(921005)(26005)(2616005)(7406005)(7416002)(83380400001)(2906002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?BMHpyuXpC4lINj6m/ScgmjDOHT1VhSaq0ZK3ayMItsdG+yzmpUx/fcuAbvnL?=
 =?us-ascii?Q?HTM6fgL5IdmoexVfLYxOev1JtMF7Ot3E+wU6umxQ/oKKmkhyylPw4BBILYvM?=
 =?us-ascii?Q?5XCH2jSGvHIHuvGkx1MD1JEwbKTT710/GtjhzFYUJA3Ua27fRgnQNK3zcRR0?=
 =?us-ascii?Q?g2M36DrT6i77hG85CiukhkIw0KNWXc5AqTTrR+I9zc92AA4ufSGcW/fltxIr?=
 =?us-ascii?Q?RwYi/Hcw0bmjWpwlaKygnSc+ajH4ubFe2T2eTuQ9QeJaPxuqT8cvwPhEouAm?=
 =?us-ascii?Q?lEdCIqCXKIqZ+RIxAayGh+l1SIpwOGDDiDFT+DmFBhmFhyqNGdYUm8xWW7Iz?=
 =?us-ascii?Q?xm6XNZoufdSdF/Ka+1zxCk49VdC8Vj9Rgt7vTbmk604wDRDZmbKcpm6gZG1c?=
 =?us-ascii?Q?mK555L0nm/8I06eLVaRsqXxWikSuFQeovTzfWOazTdNQQJfQrIOVsOtBW3Hd?=
 =?us-ascii?Q?muZPQPIqb7+qkEfQaxsNx7TdlZ239pDFNnuKgFqsnYWqOMxvcVsdhdo/bvYu?=
 =?us-ascii?Q?mReQj4dSp7mB2Y4KCS+krXdksYTvdVuhx2ZrRz/VF9cPYL13Q/G7G6wh34R0?=
 =?us-ascii?Q?PkdzCDbqsQt8HFJIa3bLUT2+HEccj6LIs6jM3cce8uBkzNWJwM8sDeCRiX2b?=
 =?us-ascii?Q?mZT8/QSi39pSHwvnbkTlYoJANMDDuza4r/BLIgWSsFls+3AzORcRzkPIFGlQ?=
 =?us-ascii?Q?mq9BnO6b5GjkSoaV+i/afYrUuOSsCoXJwaJJPq96sPaISd/HE5oDALoQXRF6?=
 =?us-ascii?Q?JLJ27n+hxXPxGFazJoGXQ/6etR8QmgIXQyiKdyMcz14c9gauydg46qnPmHG8?=
 =?us-ascii?Q?ik7+710kNurD+pcnmBEQmXXzkN+a6/mkXT7nmM96wt50iu/jC70tapu+n5+0?=
 =?us-ascii?Q?48E8Wlgvd6KgwQeJKXByeM06+o/o5WFisMZlzdAct7+wy+aJ/FUzO4ots+zo?=
 =?us-ascii?Q?xMORv9VmmlF/F8wQDs2tU+cdosS/R72EdsugYdqAtVfRpunQ2cWBXksmrwVx?=
 =?us-ascii?Q?J0l4tGT1DMjW7IEBzJKTKyqEOWj+Z5RbJ5IsNBKKRA11Z0WtZr/lwP2EZAJa?=
 =?us-ascii?Q?taJd9UnwHC3DOkzQn9NNwOMDknzfN7NuJCKUaKPIPxinY0+foaybOKePL4RF?=
 =?us-ascii?Q?mjbmFd2muVNY+ofTNYiJm2WcW9fF1svAI0JOfoho0ODEfq/4j50Vtbljaucb?=
 =?us-ascii?Q?XvYsfbf9+nl/TkQwMwANWoHshl76ACmnwmvrcX8uxngYLOpZ7/TpEDh5LinM?=
 =?us-ascii?Q?S0RVxRiZkD7CO5zfNHg6IzDWMBR4+WLTrZETPY2a9B80W5e3hQIoMe6ypJu9?=
 =?us-ascii?Q?a8oj87ETLlNSCWoQNmHRH7I1wBGn1SKezYP0f15HQNAz6pPCYUziiGNUIF8a?=
 =?us-ascii?Q?2y+fjwH57xpku4pKwPifyLuuKagEDSIDpf4eZP9NVRrY2hB85VzrNcj4K/AZ?=
 =?us-ascii?Q?EGDDEASdRbar/oaPrYj/tUZzR9rJ2if96DjglkUJKF3JkuqWeJJW+h/R91zQ?=
 =?us-ascii?Q?48jrerpXPnaOCXFIxPlEEyHaHrGkObl3yHaB5Q4q0BVtVQUbN2Qw9YGDIdv0?=
 =?us-ascii?Q?Gv+Bq++BHUtFmMMReRCJEIEQZ9n0F3lfZPqd6Qnc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fad826-712f-4553-4de0-08dba3f8aa29
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:40.8439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CK1vyeWTN3+yk0JrlP8ocPls7qunniOQa+2676khNxlI6sOdCkyO8iW78GwyH5Wu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6459
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

This is used when the iommu driver is taking control of the dma_ops,
currently only on S390 and power spapr. It is designed to preserve the
original ops->detach_dev() semantic that these S390 was built around.

Provide an opaque domain type and a 'default_domain' ops value that allows
the driver to trivially force any single domain as the default domain.

Update iommufd selftest to use this instead of set_platform_dma_ops

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c            | 13 +++++++++++++
 drivers/iommu/iommufd/selftest.c | 14 +++++---------
 include/linux/iommu.h            |  6 ++++++
 3 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 33bd1107090720..7cedb0640290c8 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -184,6 +184,8 @@ static const char *iommu_domain_type_str(unsigned int t)
 	case IOMMU_DOMAIN_DMA:
 	case IOMMU_DOMAIN_DMA_FQ:
 		return "Translated";
+	case IOMMU_DOMAIN_PLATFORM:
+		return "Platform";
 	default:
 		return "Unknown";
 	}
@@ -1752,6 +1754,17 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 
 	lockdep_assert_held(&group->mutex);
 
+	/*
+	 * Allow legacy drivers to specify the domain that will be the default
+	 * domain. This should always be either an IDENTITY or PLATFORM domain.
+	 * Do not use in new drivers.
+	 */
+	if (bus->iommu_ops->default_domain) {
+		if (req_type)
+			return ERR_PTR(-EINVAL);
+		return bus->iommu_ops->default_domain;
+	}
+
 	if (req_type)
 		return __iommu_group_alloc_default_domain(bus, group, req_type);
 
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index d48a202a7c3b81..fb981ba97c4e87 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -281,14 +281,6 @@ static bool mock_domain_capable(struct device *dev, enum iommu_cap cap)
 	return cap == IOMMU_CAP_CACHE_COHERENCY;
 }
 
-static void mock_domain_set_plaform_dma_ops(struct device *dev)
-{
-	/*
-	 * mock doesn't setup default domains because we can't hook into the
-	 * normal probe path
-	 */
-}
-
 static struct iommu_device mock_iommu_device = {
 };
 
@@ -298,12 +290,16 @@ static struct iommu_device *mock_probe_device(struct device *dev)
 }
 
 static const struct iommu_ops mock_ops = {
+	/*
+	 * IOMMU_DOMAIN_BLOCKED cannot be returned from def_domain_type()
+	 * because it is zero.
+	 */
+	.default_domain = &mock_blocking_domain,
 	.owner = THIS_MODULE,
 	.pgsize_bitmap = MOCK_IO_PAGE_SIZE,
 	.hw_info = mock_domain_hw_info,
 	.domain_alloc = mock_domain_alloc,
 	.capable = mock_domain_capable,
-	.set_platform_dma_ops = mock_domain_set_plaform_dma_ops,
 	.device_group = generic_device_group,
 	.probe_device = mock_probe_device,
 	.default_domain_ops =
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index d0920b2a9f1c0e..48a18b6e07abff 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -64,6 +64,7 @@ struct iommu_domain_geometry {
 #define __IOMMU_DOMAIN_DMA_FQ	(1U << 3)  /* DMA-API uses flush queue    */
 
 #define __IOMMU_DOMAIN_SVA	(1U << 4)  /* Shared process address space */
+#define __IOMMU_DOMAIN_PLATFORM	(1U << 5)
 
 #define IOMMU_DOMAIN_ALLOC_FLAGS ~__IOMMU_DOMAIN_DMA_FQ
 /*
@@ -81,6 +82,8 @@ struct iommu_domain_geometry {
  *				  invalidation.
  *	IOMMU_DOMAIN_SVA	- DMA addresses are shared process addresses
  *				  represented by mm_struct's.
+ *	IOMMU_DOMAIN_PLATFORM	- Legacy domain for drivers that do their own
+ *				  dma_api stuff. Do not use in new drivers.
  */
 #define IOMMU_DOMAIN_BLOCKED	(0U)
 #define IOMMU_DOMAIN_IDENTITY	(__IOMMU_DOMAIN_PT)
@@ -91,6 +94,7 @@ struct iommu_domain_geometry {
 				 __IOMMU_DOMAIN_DMA_API |	\
 				 __IOMMU_DOMAIN_DMA_FQ)
 #define IOMMU_DOMAIN_SVA	(__IOMMU_DOMAIN_SVA)
+#define IOMMU_DOMAIN_PLATFORM	(__IOMMU_DOMAIN_PLATFORM)
 
 struct iommu_domain {
 	unsigned type;
@@ -262,6 +266,7 @@ struct iommu_iotlb_gather {
  * @owner: Driver module providing these ops
  * @identity_domain: An always available, always attachable identity
  *                   translation.
+ * @default_domain: If not NULL this will always be set as the default domain.
  */
 struct iommu_ops {
 	bool (*capable)(struct device *dev, enum iommu_cap);
@@ -297,6 +302,7 @@ struct iommu_ops {
 	unsigned long pgsize_bitmap;
 	struct module *owner;
 	struct iommu_domain *identity_domain;
+	struct iommu_domain *default_domain;
 };
 
 /**
-- 
2.41.0

