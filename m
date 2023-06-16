Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA141733913
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:04:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GTPD8ONH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjT964W08z3c2r
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:04:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GTPD8ONH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::60d; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT876tRLz3bdV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwiRq+w97h2KBRcela5ePlCGIANVW46bp4tOF48sPJlqKTnN7swN2cbkBvWF9k47zT9lNzQcndTxfTts4wHmT9S3XVLWpCpxoZcFTaL20hY33HVZw8LEM3yzkG5GrLF4Ez80e9J1h1mkj51jTFdwhawOhLsWYnmkm5l9E9CuorsjCAlJDyQxg6qsrhN5qf/H/zZ4QytlLaB7uSs4JMmEsA2cfzFQSV35tAVSDfMcrVL8vqsuVV+F096LpYA6Idxt9feMLX58PCbA0eaPFL+LiTM7QNi5zjyv94lpuNk2GAD3qhhUC+tkJLpemkC7jqwMprkQtxwecaBd/5XqIhptAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0IYW6GJyVFiPWG2flp9VBNO5eU+viukK8rqNAbYods=;
 b=emK7MmONgTeT5x00wvZhWeNySTxerVzMUIRmorbgblV29eQAZEWzBQEH8W78fbImcjfJpsF6ZnEcwYkyimtE6BXZRUrUTTiIUvoxmUULWLGcWjc/6Ik/kBd7owYWM/uYT7+rTxipBLfvb8iXZ+/mECYgBnJLVO9E+QVxCgGpMA0sEsEzM8rVo449eLh4W9iXjZ8WknLCQgBkm1wZe8ysdtUThLL1Fh/Dpji4V5tU0m+N7q650jeHnwK3PSrOjtzzxsXdEL/sN1dCLIT05Chx6GzPYKbRY1gl93FPIMk99o96GDoTfKqwr3Op3BioHWKfdn+xXpXhSqK8A5S7QN0a0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0IYW6GJyVFiPWG2flp9VBNO5eU+viukK8rqNAbYods=;
 b=GTPD8ONHaU0LezpP7x5wBd4zqKS3levxHXqsGGaTRPVCzpGf46nWYePhUW6pBMp++3b8KY6UMP6ndWXNTVBpLcR5grBrS72dPLd0YZyRdAt4AbxoLaBmfWUe1sJsvCkLOsdx2bmN/C3SJkBEfVlicKugimkI0omZaQqwryhYAIQFFdmpQiQjJsrNylddVfc5wRTHY9fS7+BAasxJjfk528U57PpTK+xSmhyOgpJL58rwWiJHzgZGjbmUk3UKITGllxSqy3NUNgH3ycO0lMbVNet/V1ZjXplCDPcEtOXEWtlcJngpd87BrUm+VSUK0gfT+gTy7dbIE6bFfTMEjfAOBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 19:02:57 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:02:57 +0000
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
Subject: [PATCH v4 03/25] powerpc/iommu: Setup a default domain and remove set_platform_dma_ops
Date: Fri, 16 Jun 2023 16:02:32 -0300
Message-Id: <3-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0005.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::19) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: c4a91485-1b41-428a-b676-08db6e9c4ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fBa9VnyFRHphLXKFCM2lZtE19VQhnifvAAXXqlRQotWxQDUtnDX8zhSLrOOwaTBMIo3OwpCuJNA39vmzra1X806qmVFwFLEG4a1H4mEtHLfAYvkcBGRetvDZXXdHQ5vM3BCLITvkckkTQMbEjbt6DCjVbhzdrmqPD02SofMUHbSjHAzTfN87Bpw9c8PIKRrG/+3RuhxIs/VgTRljfrDyYUI5Usmtzp7+gcA8oKYU5Z1xmQgsiT8UdAzdxQHQmbsRHGplQJYelcBw7A8OQ1jUI2kp9rm7ThKWYuI6RB70EWYYpgEgslISAWu2otDoTzaNimBo+Sz4cs252p4EX64c5K7lKdrXoGw5/7hFTG4M/tAOZD4hAt62BZrjx2e5NjVPtn3Dv6usbES4E8BkSqzZ7Vk/mCt+HluJLjc5fHRBpIZWHt1yNIfAx33Kdxa1qy9vpwq/7npGZNcC6uDnYwYlBBSoeMvSZ6J5aEvJEXrki06D8HJ436S+4KJaIPMC/uGpjivhVqRY/hG5vHjWJytUftNd99bmkIrPoNpmu8cu46lvPRw4trWa+U4cdzXaXomY7zUZMZiCc/czpGbjc7prCbVVsy66pNs631z38bpuFClbIZGOj8fuuBgwj3qnBGnC
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(921005)(38100700002)(8676002)(8936002)(5660300002)(107886003)(66556008)(316002)(478600001)(66476007)(66946007)(4326008)(6666004)(6486002)(186003)(7416002)(6506007)(54906003)(7406005)(110136005)(41300700001)(26005)(6512007)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?zKwQdTkaioHxvkDk3Sl6nnslP2ixZRT8kZDLZ4flJAT7Q5CJPiC2J1/Kaf5Y?=
 =?us-ascii?Q?YhsmaLPUy9FiXCCpfpyg/xEDnxBfe3D0BCnbx/LcLWhtrvBj8JNl0nNBSwBA?=
 =?us-ascii?Q?mm4S66pCcxuN8CyhV6zq8651I/1kKMEwHMoWLB9KrlZ06pCcdfe+dSH76lRi?=
 =?us-ascii?Q?afXge0/DIqTsmkk9V+PJhNyoaw5xcd2v6j9hDOu8iEhi2Z3rZ3GDXBJ1WHz9?=
 =?us-ascii?Q?OJYCWxE+IsjUBEjILn8Mm3QRBfK7CAh/hF3WRDS+qlR2v8zo1+/2mkt6OFfi?=
 =?us-ascii?Q?4B1YNJe3og3N2kXbhiwlaSy6GT1Ozxfj5vkm1QGgMOrJNtWcUBGtPw9mSuU2?=
 =?us-ascii?Q?IfR4Y010excDaR9T2Rl2gorICjpwZKs+L6uCP/mJSysMSFQhNLbDAxeVjTw1?=
 =?us-ascii?Q?DwPq4YZSAmSBEASCy9dohCqAb4X9HA/8rtTGGDkhyLJyDtjdnPobXbO7vh5U?=
 =?us-ascii?Q?314T5us9V/zaD1/h34zZPMwxs4/WbmJH+e8rrCERpzt+5WBeFOgVtPydMkwj?=
 =?us-ascii?Q?BipnTFtZMXAjwRfIWFDIpF+5ukWK5pCzxftDv7KzdBXDA+Cw6Yk3ZrglXZi1?=
 =?us-ascii?Q?LNT4SIoFqP2/2THUmS3WyA4Cr3Y9Yhg+4gj1i3jvlg8F9hV0TXHst5Bg+GgD?=
 =?us-ascii?Q?Or0BHCf1Jrs7Q43ItwhA+t9R+MFZwT9omzLQs1MrS4zsJs22RtQB5H0ROYFZ?=
 =?us-ascii?Q?i7W52tHTsV2dybUDXfpJ2CsvH3ItSp+t4gXDYZ7f8s+9CP18VghBW6u2ixbF?=
 =?us-ascii?Q?SaTxeK9ZAtLXbC01JJ+UEcidk4A1e80IjHbwPacNmGzxHvP+RY3ZOnrBg12P?=
 =?us-ascii?Q?Hm6itfge38Kwt1OtcYbhQqVDIeNubqhhPxUR9S32wslSNKQRftCeIHnveaAo?=
 =?us-ascii?Q?3V9F+DCMOLnm4nB2++/xohNf0YRSW3uKDpGAVkkYUAsFOqpDAxTuO8+bjQWe?=
 =?us-ascii?Q?cVCclD3ZczF6/sVYhlT4vbFLv3f7lNsHiXr3V6xAHz90nzhSVSs6wCLeo/Y5?=
 =?us-ascii?Q?6jgHQCaoGMXJCF4vzOltdaarjrBawNkgZQJwPCSPCL8BOg1ySYfwdRAHZj/A?=
 =?us-ascii?Q?fte9WMRL9mznmRSSuA6YLNFtSk1pP8xa2KcLj99B4SRvPXEt8OrC675LS4Jn?=
 =?us-ascii?Q?QWr+ayOGnN+gDjiiZKGfBdK7Y2R/VceZ5fieNdY1B4R1+QnbhQnebH0pTVCf?=
 =?us-ascii?Q?V5C1niFazrJQj3zhAvIC2nP/nVqWogdsUyN13gSabGZGeoWE1VXrCEDDVCrs?=
 =?us-ascii?Q?VhMva3TzXIRgEcR68MFAxDP7+4klIwiOlHfzjZBfwMVMBb+SR8TTfK0C/+35?=
 =?us-ascii?Q?xmupU0SrHzJDl6S0DZ8nRLSgAMsUHqB0NxHQ04IwpRWaWlS0YN5LgTvok0To?=
 =?us-ascii?Q?03bPcl7Rn0lItewvBNliYogUit7WQAdxSp9jY0L5RT5MeCSqHTiiI/jByjrU?=
 =?us-ascii?Q?ZIBf8OttH0+rcOoHuNdmxyETsKTlRVvSkg7cZ2nGv1pU1/GtM2KC+ycfgNKN?=
 =?us-ascii?Q?HZM+Pid8QzhFjdY4yV3zMw1UDpGnaqTUSI5PldA9+BegMICWUIJQMXwMPRBv?=
 =?us-ascii?Q?dlijmrEmRNkbhmj1RiXoTqsYCvGxUFUnninUH7C6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a91485-1b41-428a-b676-08db6e9c4ae5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:55.4828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/gWwCOB/P+no1x2kfJRyUfQVe4iBUHDrj+OTmbxkxzIRNabZtbCnm9IcgbBgnJT
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

POWER is using the set_platform_dma_ops() callback to hook up its private
dma_ops, but this is buired under some indirection and is weirdly
happening for a BLOCKED domain as well.

For better documentation create a PLATFORM domain to manage the dma_ops,
since that is what it is for, and make the BLOCKED domain an alias for
it. BLOCKED is required for VFIO.

Also removes the leaky allocation of the BLOCKED domain by using a global
static.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/powerpc/kernel/iommu.c | 38 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 67f0b01e6ff575..0f17cd767e1676 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1266,7 +1266,7 @@ struct iommu_table_group_ops spapr_tce_table_group_ops = {
 /*
  * A simple iommu_ops to allow less cruft in generic VFIO code.
  */
-static int spapr_tce_blocking_iommu_attach_dev(struct iommu_domain *dom,
+static int spapr_tce_platform_iommu_attach_dev(struct iommu_domain *dom,
 					       struct device *dev)
 {
 	struct iommu_group *grp = iommu_group_get(dev);
@@ -1283,17 +1283,22 @@ static int spapr_tce_blocking_iommu_attach_dev(struct iommu_domain *dom,
 	return ret;
 }
 
-static void spapr_tce_blocking_iommu_set_platform_dma(struct device *dev)
-{
-	struct iommu_group *grp = iommu_group_get(dev);
-	struct iommu_table_group *table_group;
+static const struct iommu_domain_ops spapr_tce_platform_domain_ops = {
+	.attach_dev = spapr_tce_platform_iommu_attach_dev,
+};
 
-	table_group = iommu_group_get_iommudata(grp);
-	table_group->ops->release_ownership(table_group);
-}
+static struct iommu_domain spapr_tce_platform_domain = {
+	.type = IOMMU_DOMAIN_PLATFORM,
+	.ops = &spapr_tce_platform_domain_ops,
+};
 
-static const struct iommu_domain_ops spapr_tce_blocking_domain_ops = {
-	.attach_dev = spapr_tce_blocking_iommu_attach_dev,
+static struct iommu_domain spapr_tce_blocked_domain = {
+	.type = IOMMU_DOMAIN_BLOCKED,
+	/*
+	 * FIXME: SPAPR mixes blocked and platform behaviors, the blocked domain
+	 * also sets the dma_api ops
+	 */
+	.ops = &spapr_tce_platform_domain_ops,
 };
 
 static bool spapr_tce_iommu_capable(struct device *dev, enum iommu_cap cap)
@@ -1310,18 +1315,9 @@ static bool spapr_tce_iommu_capable(struct device *dev, enum iommu_cap cap)
 
 static struct iommu_domain *spapr_tce_iommu_domain_alloc(unsigned int type)
 {
-	struct iommu_domain *dom;
-
 	if (type != IOMMU_DOMAIN_BLOCKED)
 		return NULL;
-
-	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
-	if (!dom)
-		return NULL;
-
-	dom->ops = &spapr_tce_blocking_domain_ops;
-
-	return dom;
+	return &spapr_tce_blocked_domain;
 }
 
 static struct iommu_device *spapr_tce_iommu_probe_device(struct device *dev)
@@ -1357,12 +1353,12 @@ static struct iommu_group *spapr_tce_iommu_device_group(struct device *dev)
 }
 
 static const struct iommu_ops spapr_tce_iommu_ops = {
+	.default_domain = &spapr_tce_platform_domain,
 	.capable = spapr_tce_iommu_capable,
 	.domain_alloc = spapr_tce_iommu_domain_alloc,
 	.probe_device = spapr_tce_iommu_probe_device,
 	.release_device = spapr_tce_iommu_release_device,
 	.device_group = spapr_tce_iommu_device_group,
-	.set_platform_dma_ops = spapr_tce_blocking_iommu_set_platform_dma,
 };
 
 static struct attribute *spapr_tce_iommu_attrs[] = {
-- 
2.40.1

