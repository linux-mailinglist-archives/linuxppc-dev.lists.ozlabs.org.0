Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7ED79EA04
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:47:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fk5jtaUO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm1wm4F6pz3dT8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:47:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fk5jtaUO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::606; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20606.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1s41H8gz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jH+nBkbGXnOTlXnp3HFZZlq3uuyTByGIJ0CbuUK8GmUXFuvHzITY5xS7D/neaBv4MuOkKxasfS5LNnfPdookZTm49wSE4uSRdi1JyBDFAP536CECDMNKbpidlx8HroYzd0zwkb/QWMY14TN7ogoAVbff+wmfCj0Y4WgKKEpMgpSxijH7A2SAc9+MPLWSnMGkizTCp5D77IWuAuvaYXtiwkVdkiyisXJKEmS2lVUgHNU6fTdkoBSE4w6rgmQ75JX7rCjg8OvPcPADrgl79AtqfXrVGqUkwYsoq59nmX3ibohwfPzm3r/6oAaWBnkhCYE3+qEAXUPu1HLNnAYespJmhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fp4c1O0/lmX4CWAq7byGj8RqE4lzsolorSS3Ww52Uo=;
 b=j6S/Vtrp6WT78H05Y0pInnGY2tta5+aug2Ka+VJs64VhMU+7GF4iaSxCpKetLXL5bJqb5oP2tn6GD7hCYva9alyNZlmhJem/5kr9F5hWjrWSGL33QiJE1FWYQKvba1Jv7I3ZLgJRlqryx0ne8dcW+xPH/Xp7S9ZUhRp84bIUcHAdlVhp3wji4gfZkowl68SG/xmvi55c46CNNhcMP/A51ZDRAxwBiGvQYn3de7JE52xsqz5iJ8C69d1+rz2p3wZrIZVT+iT7t19tXG1yqhBwmXQFiweYC06U+bJAcbXMsatqOUKLgSiFDG+oEd4wI5Qfv0yTA89lPef6nge5PmKqaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fp4c1O0/lmX4CWAq7byGj8RqE4lzsolorSS3Ww52Uo=;
 b=fk5jtaUORoQlZkAraN04yq9ChZRuHaufO3Dn3G0LXbFuVBlNQ0mulasCTTQKMl2ffvUoNET0k1P9gmokISGsab6ValXNupwOdzgZKC7d1nCnU7yncpuiSk0yh/KXlRcl+cmJ7E7g2rsX/v1tg38o7dBqJwgfgm16TJwgeZaABxxRWzRlko+GVDfLJp+1/P8L9S7Sp7+/g2bB1lYLqbnc4WwVFFXDzHJZgtu54hCXgIKYT48UqpWaif2iLtCT1OqaD4+N9U1j5BWo1pd5HyBgL8zSXE0SEN3I9MKyswKohvWZHtQVQvOXYxxtw1Sa550Ku37CuPUvEpxwM4l1Nyn1nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5096.namprd12.prod.outlook.com (2603:10b6:208:316::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.40; Wed, 13 Sep
 2023 13:44:00 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:00 +0000
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
Subject: [PATCH v8 02/24] iommu: Add IOMMU_DOMAIN_PLATFORM
Date: Wed, 13 Sep 2023 10:43:35 -0300
Message-ID: <2-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0022.namprd20.prod.outlook.com
 (2603:10b6:208:e8::35) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5096:EE_
X-MS-Office365-Filtering-Correlation-Id: ae645324-67de-46df-5db9-08dbb45f7b60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	wSopem6jvT6GZCCWD2j9Peukr6bFWKUAHnNZpk7JRBv7bxuw4fgPdzNiRO6eMBSDByIM7+d/rZHiDcl2fucEdteB+pwRAgKDgBTHKyqVWV1kppIjFCWpRGkIsDvrX4nfIK86Sq9xGIy8KObdxMBKAgaYEQJqW5OQ12sSQgspALL3MnBDIvo1f69x98RZ3cBGUb/4uKE4T+7oSypbyNwQpen5BJPePM+PjWVj24YcUIIPE1ap5Bzo/m8/7fJ4K2HcqTJwSSIfUimzC3RehtBOLN0qhXvsyVH4F3w3dgsII9UOFfccpUlRFwZsX4t3cOfUbIDwvDI2j7eU/o72fs8f6/h25zcP6Du6U3MsIWjNcwe26Jkfqar5pXrYlM01Pj36DP74+4s8f1EatfjJ2RWF1cJBquNZgUq5J31Qc80QCvzi8PdngX95xGLYK2M+PGYEBL/zIUXPFXKn+OdCokJdtb6MF3ZfdO0gzza7DkBPv6X2V0/8Q4D3xFWfsnOvrmUJgjcj4GfZSLQs5qvMIbIH3R66hJ/yjDuKTT8TYGNg/I8E5JxJE/T5WdOirrHV2k3+VZ4+uBtqTLdqP/N+nVg+EVmj+XmAs3hYTWfz6ZQTodrp7vNiuxbXkiA5YXPPsPra
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(1800799009)(451199024)(186009)(26005)(8936002)(8676002)(4326008)(6666004)(921005)(38100700002)(2616005)(107886003)(478600001)(5660300002)(66556008)(54906003)(66946007)(110136005)(41300700001)(6506007)(6486002)(6512007)(316002)(66476007)(83380400001)(7406005)(7416002)(2906002)(86362001)(36756003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?eN+xPeCPJfLEDHYWv4BhRrHLkiHUe35uppK67pzcuyl5YoAEuKqSw7pJ6G+t?=
 =?us-ascii?Q?X3MLCoRzjtTyGNlZzkuJOsU6JclLLWVQrSupPPTRMaie9sw8+jj0M2s+Jr7H?=
 =?us-ascii?Q?KX+PwSQ5jGuGagOnMuG37gVcb+ZhG1JR+w8aro8EBZiAMSpakEvHtYqoOMOy?=
 =?us-ascii?Q?klT2X9RWu0FjYSNNK6WTW3ukXXt77jVTwqWFO7XJxuj3eBvC2vr3TmPSvk0Z?=
 =?us-ascii?Q?vKINnMi9UvOex4LOI2wEew1xrrnn4pWEpOo9BWiLs9s8tX2QLFTemGrOMJfj?=
 =?us-ascii?Q?9b91Uq4hpspnw/1nLTQb4jpMRQ0x4S75rbtRSdRvt/qZ3jTP/5Uo+hz/9Zhg?=
 =?us-ascii?Q?6RwC4cOZcM98Jk2jFj3Zo+tRv+YQfbk7mOCdoUSlICmeRCH5JdbvHOfr3Y/k?=
 =?us-ascii?Q?K4Q0erJGhBswk0UeW0RZ95QNoo/CxlP+ZHTVEEHLWj5dJwKHsk8Fgk/SYCry?=
 =?us-ascii?Q?xLvNz5XkvN6srrWvSzobv6izbE7uDdb3sfclXVIzTaMb/UGOj3YNVD1xpaIC?=
 =?us-ascii?Q?E3Ka6uVB72f9RbRpfqKIcNmS1imuffiPImi3QWRq+7Q4C5prnLsZdmXpRocI?=
 =?us-ascii?Q?XacBEMB1hmhcu9gZ2+UcYDZxT7n6OfEZLtxsesR6g9DorcaTu2R2a8Vqq3rM?=
 =?us-ascii?Q?ceitsiwMmDVkLzNB6TDEwDEI8BKz1JlyBoEqOKqjGRMB3ehbQfXPxwr01bV2?=
 =?us-ascii?Q?DZVYLEVW2N+UKjOdZ7l7ElHTfurJ9erGebEDyelBdgAJIDtSvoPFbAM5pGZw?=
 =?us-ascii?Q?44ltYdvSk0doLgkUAMrFZWh1qNH2aTPS4kIE3VDoK5nmPpvvIgUDHMWFbzel?=
 =?us-ascii?Q?z6C023YjpWTtn3HtT73JwC8ME2d7n0MKuODPpFYDRo0noB2n21ROVyEHgVTO?=
 =?us-ascii?Q?OW9EExrZcqwuvZhBpkLH/VLtanWP+VQ5hpy8Q08ARnd6qXRmnUtf4MVhRrqa?=
 =?us-ascii?Q?9vlI0qi3TEVRgydZfAqMZlO3gpCELKPEihV8ZbhTK9zzTFkPbgmElJ4U51Y4?=
 =?us-ascii?Q?FNrAZJbIVISqwwlykcK1O4i0hLYbxoVr5sfIrZYcY5R1QclL2DRsdNqmaxcy?=
 =?us-ascii?Q?YP2SBnqaTCdEp6iBFWtrhiJL2bud8ryfhtn1m0zUDvw2dDPO4moCdjrl23Fl?=
 =?us-ascii?Q?bgovJ8t5OcBf1CRgsaP6u5UTnNlGHXJjjFDmw7kdPZqcT0GwzoItqdgM5f59?=
 =?us-ascii?Q?qk5iVEaIj8XSD0zT7/JUR6A0Dp2GlelNagYaHySdKvvHpBuVLYtAGEa6ZXBU?=
 =?us-ascii?Q?Glxvmm0Q67NPeDMNiMk4e5RguP/8UhQadu2N21c4xjETomF20Zq6wEryUcO+?=
 =?us-ascii?Q?12xWQoTHT+vftIK0a1917dpUaAMEiRk83rAzCNMg8f7NMyLtNgkA6eJe82FP?=
 =?us-ascii?Q?6hP42m4XH4AAhNbrmq0df+0H0rBY+JzZEnplIQKIPRAgsfvo94U0ZvAp6X9b?=
 =?us-ascii?Q?YZ9W48Eq4s036Aoo32umRNRbQxq8e/jWZKxL034e//wLA5+Dg14pI0M3pJh9?=
 =?us-ascii?Q?EisPB2/fbRKGZW1hcsMCNlgTjlDff9qD8+dlYKed2EfHmOWUT634OhPlMEZ7?=
 =?us-ascii?Q?5UGQ1VZ2YO/i6gcgZY6Kp595EAWTkjhaqYWsZPjO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae645324-67de-46df-5db9-08dbb45f7b60
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:43:58.9246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0iL4+/we24A/GdGSjCQ960tNDBPcPH/gfAS/vbs5Q10IiImo49Sg/OEYIPzzgX8H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5096
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
Cc: Thierry Reding <treding@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is used when the iommu driver is taking control of the dma_ops,
currently only on S390 and power spapr. It is designed to preserve the
original ops->detach_dev() semantic that these S390 was built around.

Provide an opaque domain type and a 'default_domain' ops value that allows
the driver to trivially force any single domain as the default domain.

Update iommufd selftest to use this instead of set_platform_dma_ops

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c            | 13 +++++++++++++
 drivers/iommu/iommufd/selftest.c | 14 +++++---------
 include/linux/iommu.h            |  8 ++++++++
 3 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 33bd1107090720..0e13e566581c21 100644
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
+	 * domain. This should always be either an IDENTITY/BLOCKED/PLATFORM
+	 * domain. Do not use in new drivers.
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
index d0920b2a9f1c0e..a05480be05fd08 100644
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
@@ -262,6 +266,9 @@ struct iommu_iotlb_gather {
  * @owner: Driver module providing these ops
  * @identity_domain: An always available, always attachable identity
  *                   translation.
+ * @default_domain: If not NULL this will always be set as the default domain.
+ *                  This should be an IDENTITY/BLOCKED/PLATFORM domain.
+ *                  Do not use in new drivers.
  */
 struct iommu_ops {
 	bool (*capable)(struct device *dev, enum iommu_cap);
@@ -297,6 +304,7 @@ struct iommu_ops {
 	unsigned long pgsize_bitmap;
 	struct module *owner;
 	struct iommu_domain *identity_domain;
+	struct iommu_domain *default_domain;
 };
 
 /**
-- 
2.42.0

