Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D5176DC07
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:09:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=p0izS8u1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGTjY0nZXz3cJ0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:09:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=p0izS8u1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::61f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThg6wGXz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YeGcO+JNNRfbzKMRX3Wj4N7IFjiATfVHgeu1mizlswXZalsKuHNVC/ChAMALhwL8wGUl9MR8hqLUKZDq5L+m0t6QXzSav5O0e/NCfRl56XvAOjUxw3wgsfYJvU8zKNoOR9Vi3avO/dfxpadc1mJefFpgqe+1F4VyNqTzavvmHl708ng2sDcLcIen6YEYmcVhzHh4OYKpUnrMq3AWUCiIbxZd7YABnF3SdirFeRnbNMQTsqEpCaALexpmQOD4w5FVRDTqZbjoSu1sce1+aEl2sdHGoFaScVqVd08H+ssi4J2Sc2E//FAmbCWOEYA3YyHdTclOCe6m67KjRRJX7fe1fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iHXF79ZsLNr+U25wG96PT5wqn685MqH0c6RI6HOHFE=;
 b=TR/D3adCcpkU/9CSW1jJ/OYSpHcqHTaPGzbgYEUP+kDp4yuCVRU8lZiRbXfbdHZaFK8ejE5uBwABE9XK1bNH1RYFemcqtjn/ItYoxjy3HJaLv4oEZMEy3YBbjKQFcf7pZa9n8ycp439/OJn3qrfKhhGGpnc73Byprbb+shfh4CtI7u5pPe/uDwCmhh3qMQ0tGUVVXqajIOig6JI0zF3CcU9WmxMDwJ98CccI5PS6OkJxlRvEUPfIb9UKjxug6pNlzXxfJphgalLy9Z5bID2AngrUZVch34AmlquwwkgHavax5C3k682PNzufWiu8Dpb1YvaRkDkxioUyy6v786tgZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iHXF79ZsLNr+U25wG96PT5wqn685MqH0c6RI6HOHFE=;
 b=p0izS8u1dzF16EeuBv8+yzruwoy7AAUIoCgmiVC49Pt7OgOfRtYgb2Hu3lDj6Um3L4ilvfDECXmblofIHhEXAig3jiLyb5dit2XTd3aIConTyXdZdHrCR5AhnzAtTi0ZdOibDsjZCHRsDd+wygFXlqoRl64kFu2C66BNM1Q/+rIF6mQbb656wmsbFpFOdhM+kSd5jXO9TyVzt3mcVWlH808khiY1veV4WkoGwv6l2x2PiD1VKlZM0uXP0i9ewQJMZgXK/2CAEO+ORq+N0r96wy8W69OcI3N8K+UbUP5dNwtJEO3IyISaN9RBKwvP+Oi+s82hBYCcn6gpH9vnF7gtjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:08:14 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:14 +0000
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
Subject: [PATCH v6 04/25] iommu: Add IOMMU_DOMAIN_PLATFORM for S390
Date: Wed,  2 Aug 2023 21:07:51 -0300
Message-ID: <4-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR16CA0039.namprd16.prod.outlook.com
 (2603:10b6:208:234::8) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff61b5d-1945-4871-5749-08db93b5bacd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	foEYqxImtsWMgsuvtMQ9F386cu6RHUTSA9oYbnHB+L458JOio5vVIyiC7rXX6zGmYvMENprX57bg5SGkSQBOgIrckWxdpZsrXL340Zt3/OrzddSZdbMx4LcAwRmrq/hmDK9dUQdDxeHg0gbRHs0cY2LO79BEXcwPDSeVDMTK/Uu/D8C9HwhTVRN7DxPGZnKgG92mq8zfP4uxl0turtA2eXWRhQYS6gXnEhXekDF5rdykvZr6IGfo9HlXahZrDGqdudAaY9kSd8i0LFvmh8ro3xyI6kDnYgbHfpTUVHs4F9GKek5LYux/D/fNhP7Vmgc684prsSuLZ8BVCglBeqKefOR2/9eFJi6LhGa8xd5+SQ04OH0mHgFvHhosmkwB/7RXff2G9FIfV0dix117Dr4hhVjhqucjbzAypIavzglruHsljBdB/ogzRA4vZubRESTQ1WGPjXXe2LXhTq5tvlzPSz7uiDZ1qkuw7qmhtt10OROrc98Q/OvWFN2DP7bukQ1KvGZAWEWAdUf2an6U4yiAPSu7pTED4j7Us+M/ldcvWavbLzk2J84cga6qjsLHMrtqJY3b0qc266+FAiHFwH1A00GQh6nJFpxloXxWKRlkK14sMv0OCCmvMNdcH2VUchOe
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(110136005)(6512007)(54906003)(6486002)(6666004)(921005)(478600001)(38100700002)(41300700001)(5660300002)(316002)(66476007)(66946007)(8676002)(4326008)(8936002)(66556008)(2616005)(83380400001)(7406005)(26005)(107886003)(186003)(6506007)(7416002)(86362001)(36756003)(2906002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?hrm2FFJf6ApE7t9+fAG3pjKqAOOjudFcvHvMG7N7NSUPr6zjBMZFihwPtflE?=
 =?us-ascii?Q?4GWkepQnnNaTGbJmjawsno6lwm1JASrDBtD+JP+1ER1KLC3mwY0HyLJVD5qc?=
 =?us-ascii?Q?LG9wmqGa58G/ZNKMbT1u83EqSuvHoWdwFnwf9q7nuqKd4ArqFQrobPgYOkg+?=
 =?us-ascii?Q?fH7HfRuuOD3pQIiNPiFKRsLygAMFar3YB/UmAXsNvNumrOLjTijXxJqQTFq1?=
 =?us-ascii?Q?CGFVC/Fg1kJ6lqHW0RgZW+IwZU7WLsvzFxlBJzQZ4JYmsk1E9KPTTECYWo55?=
 =?us-ascii?Q?ps2XCnA8+f2NZJXmYs6JgtjaZk1nKzV9h9sd5VjT3/4jKF0rx5DJW+s1SyEj?=
 =?us-ascii?Q?2C9pM6UZiLwSu6pAgcG2qIuDqMN6084HEbqfWFEzELlOLasctZlSvnqd3qah?=
 =?us-ascii?Q?WpUHcTNLy3k1U5gh+spZi3hUKt5LWNw/84HrM3pHbpDigHy6eIbYG1TrxGcU?=
 =?us-ascii?Q?dhUjE/xz8sA4b/olqPltpmQDX0TRQco3HcmuFf9NKHltyFI+qFxT/3ed1L+o?=
 =?us-ascii?Q?nGzKro262904e9mIhipxGG2HrNqsxty0W8UAa9S40qeRQ/SIYztzSD+82Ag6?=
 =?us-ascii?Q?mn/Ymryejn1IpCBpfXvIGopvLw9SxB96zsB8icszy3IkK1xfJO30XzE9iyos?=
 =?us-ascii?Q?jY6mXJ0b3i1Aoz8joQ3K2lLdxl0TZJKy6WuLWM3+ZdE/LEesqSOxIAX3XY9m?=
 =?us-ascii?Q?1fyJiH2OG0Drd5D6/bQMyZPs2flb2jdw7qUrXIbrItj9RnwaKKv3gkEdQPZJ?=
 =?us-ascii?Q?FbOF6x/vVD3FWXXHPpW1Q05faAWk+PWv+cvbvP4opQyGQtuHTpqUSTGgGyvj?=
 =?us-ascii?Q?nYlC53fzA5XcM9VMiceBbjqT7I7V9y5rrvLTqbHjcV/Tk3l6otuNRRwBUOHt?=
 =?us-ascii?Q?Y511bOsGebnl8SGzUkEAvxH2SLyengdznxc2SwqMXMnPt2jjeXoeb2hCRSPv?=
 =?us-ascii?Q?cRc8Fb3LyLJN8CKHhCPxhY/ipIhYzJViU7Ydj/fgdhqgYt60mAJpMGhRb8aB?=
 =?us-ascii?Q?Ki1lrGu1B0X++a/R5sKlfJvHs5kFiRNuAjguGKyPic9Sl3fB094O24kJgfhL?=
 =?us-ascii?Q?O4qbiOT3346kbZVJMFmHRtLEoWWDr83MLYT52+asCuOXUaGDdpaqLd4+KP8K?=
 =?us-ascii?Q?FdAWNDgJzhmnE+3G0yyshEK6go3g8O0h5hF004o6JonV7Ja74PtpUzFinsdu?=
 =?us-ascii?Q?CKo+nZCr7kQE36iRralFXXcYXiTXdzEM53+AbdCwhtCHGQiQVuydfx5kuS3G?=
 =?us-ascii?Q?V4QS2tmTteDT5aT+QpAKBPj+vzJ3qDAZaOL3ea6wP/R/0JWltU0umpWsjinB?=
 =?us-ascii?Q?+P6upyz3bhG9X2ZrQw65FrR7lorVzrWWuZFakuxLfeVFMFNTwngTGQmKK/uS?=
 =?us-ascii?Q?jcSFxpV26LxoIQqR/IDS8Fbp8pVu71z+zpgQBOI4urwORu12+hDJHPTEx+Xq?=
 =?us-ascii?Q?tTk/eLSe+CO3awp/ou2ydW41Qp8BznsENeCqb/JH6qcS+A7rVtXSCUhsSutG?=
 =?us-ascii?Q?5niroDZtST6Li8RDxScsiyXF5AL1wxdO+0hTSCelo9YWWh/IU8Rt4JdNuoAy?=
 =?us-ascii?Q?NL9/Nx9aeBBjWSd94BapwT/tLXMgHp0/Tn7t+T7/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff61b5d-1945-4871-5749-08db93b5bacd
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:13.8690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tf9avk+lKPJ/Qu2PrAyBMNL7YamYzqDRpsFb3rp3Sj9mgv5G+qRu2Il6Xtk/NeZv
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

The PLATFORM domain will be set as the default domain and attached as
normal during probe. The driver will ignore the initial attach from a NULL
domain to the PLATFORM domain.

After this, the PLATFORM domain's attach_dev will be called whenever we
detach from an UNMANAGED domain (eg for VFIO). This is the same time the
original design would have called op->detach_dev().

This is temporary until the S390 dma-iommu.c conversion is merged.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/s390-iommu.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index fbf59a8db29b11..f0c867c57a5b9b 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -142,14 +142,31 @@ static int s390_iommu_attach_device(struct iommu_domain *domain,
 	return 0;
 }
 
-static void s390_iommu_set_platform_dma(struct device *dev)
+/*
+ * Switch control over the IOMMU to S390's internal dma_api ops
+ */
+static int s390_iommu_platform_attach(struct iommu_domain *platform_domain,
+				      struct device *dev)
 {
 	struct zpci_dev *zdev = to_zpci_dev(dev);
 
+	if (!zdev->s390_domain)
+		return 0;
+
 	__s390_iommu_detach_device(zdev);
 	zpci_dma_init_device(zdev);
+	return 0;
 }
 
+static struct iommu_domain_ops s390_iommu_platform_ops = {
+	.attach_dev = s390_iommu_platform_attach,
+};
+
+static struct iommu_domain s390_iommu_platform_domain = {
+	.type = IOMMU_DOMAIN_PLATFORM,
+	.ops = &s390_iommu_platform_ops,
+};
+
 static void s390_iommu_get_resv_regions(struct device *dev,
 					struct list_head *list)
 {
@@ -428,12 +445,12 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
 }
 
 static const struct iommu_ops s390_iommu_ops = {
+	.default_domain = &s390_iommu_platform_domain,
 	.capable = s390_iommu_capable,
 	.domain_alloc = s390_domain_alloc,
 	.probe_device = s390_iommu_probe_device,
 	.release_device = s390_iommu_release_device,
 	.device_group = generic_device_group,
-	.set_platform_dma_ops = s390_iommu_set_platform_dma,
 	.pgsize_bitmap = SZ_4K,
 	.get_resv_regions = s390_iommu_get_resv_regions,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.41.0

