Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5880C7339A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:20:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tK9+26A6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTWN102Qz3c5C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:20:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=tK9+26A6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::60d; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT8F5v5Nz3bng
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvPBg0okGv7e88S0wagiuQLMXfoOfRiwhMh4B8U6I/NkrqPOtY/6ievuRB4ZKAEgGzYc66zGLUBROjuVaSQDb+Np9rRkpskyaGBIaWQvoUZn4s60El2Z3s3jRqDG6sCz3a6nESvgXY+IXdlWYCjnM/9yW6UYqYq0J6tAmanC17Z5ZmUvLNBNrOwamkIHS3xfF3h7yzF+0vgpa3uB/R5d3vKGEIX+7oyPefS1cdIyoU1NoyZFfogyqUQvwC/twlAWTCOHLHhwTeUZPyHZZeU0hUrnbXLxaR7aYbLqPpFdiSrIQokWlihwQ2a8qXpiYJVwsXbLLHYRbujcMWl5sWfO+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcLi5FVNpllgaVjruqTdAdysLAYv9WirjaaTtSVFkqs=;
 b=NfUmRSQofGgnU8oDP0Rc82wNjpRE0WNVU1gu3ANJz+mB8qroxmHByp/845yFVhy4kPl28wuoJFKdJUsgS0yjISJvM9dBV6E4Ml1HXTgEpwXwFSZ57pNiwn7EfLXCA/dEPu1rwZN43kkTNmQcSUcJzm42Ye9nF3bni918AR25TE6zandDtmh5Bct8gE5P4Cb6+eVCECiy7dr/WX5WZ+LszB10oVyX/EPh7hQ84zjIxLwILGKerVpmTX6/WtqXayJXShehWIKR5TI1HDowrGf+T40td1RlQGS/1TJ2ZHmtlxV5lEzKCgU4H4/y4ytV/0fSJ81IKDc/FFxvrjZMNfUMHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcLi5FVNpllgaVjruqTdAdysLAYv9WirjaaTtSVFkqs=;
 b=tK9+26A6Fo524RSgnXRy2wc1HP34lX3UiG6m6Thpc8wx/5xPuUJ49D4qE71XtPr/F2mxS8PO/9mB5WfX38apK2VXVIBHtE9E3PqEcyN9bjD24S4KQ7R/8zMrVrakUNt+Ns/bDZUCFOlwa3l/uXNGKiX5VM19waut4fXalAq0s3u5kfRSxiXdrSfmDd/DPQ5masHEek8Ny9tT1z+By4pRYV8n08eDO0U3r0C9Q3s4AieuijbhQjwOMsUZNwwsC2N5GF6cszI0Zp17Om4EFPHO2abi6aRhKi3aORir9LGRTdkekW8HqWmUx883INtn4yyfMaLf4uayL3X9JXbJxUNqig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 19:03:06 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:03:06 +0000
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
Subject: [PATCH v4 09/25] iommu: Allow an IDENTITY domain as the default_domain in ARM32
Date: Fri, 16 Jun 2023 16:02:38 -0300
Message-Id: <9-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0048.namprd20.prod.outlook.com
 (2603:10b6:208:235::17) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 8432ac28-e91a-48f8-c5da-08db6e9c4be4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ml3wuo8Gi/eMZ4klvg3qxkQIC8YPxCGDIpCThH9GhRQgnujhBg8rHHl4XbybZDIJeF5p0Lzkm7ctlvvnekwyDVRON/lwIGAEeCN7vF5z5fPeBHRZjm9G2vtZtGeBWflTIaHj9/cJM0u0eYXT/jwhFwovO+cgoKDnJHk/E3DKixfI1Lc3BOzu/7Y+LbtKgWrtdDXqiLr96sLKRT93r9FTCJPq5SafTscbGRs18GuIhn/bHHIdBLAgEigk4vhwp1VyJJ847cP73hkzlejAIHtCk9Y9anXoqR2lZVrrJMB6nwXjtTSlch8ObKczbwyfvaYdvo5ChAuPQiHAuknTbY15YoV30K9ZC2rN+zWMY4wMgez8rWFkeSMoH+NAl8am0X8RptoGXH5BKmv5JMATPzytAWsY+r7k+bqPQZo/FFVeNAN63xNA8xqs6VNWf+6CaSl9UdkPhdYdEEyCGxyjoFvmOqua0OTqbXJKbyVWuux4zLbqJPctiV4oCf+EnycdZUnUYzWEDaiSSmW2T3wQ6Dm7sbVzcKi+052QqR5R7g4qOszomRMcZKa4WWqS38C2DtJKF4/lonI2jEZ0+8077nO4hEgUECyftF9P3NYsFZx4ZXh5lVRBLKneoBmXpyNJlb0g
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(921005)(38100700002)(8676002)(8936002)(5660300002)(107886003)(66556008)(316002)(478600001)(66476007)(66946007)(4326008)(6666004)(6486002)(186003)(7416002)(6506007)(54906003)(7406005)(110136005)(41300700001)(26005)(6512007)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?7ULIWZ+t2azjASU61aUexNH4NKJ00MAJlSXnXC3GIsKkoXBnkcXUZwY55Fdf?=
 =?us-ascii?Q?c65Rcnb3saK9nehNTyH0+rOdWkUaF8VFwlvXsQYK6l8kL52DGgOmD2dtMZ3I?=
 =?us-ascii?Q?it6zS89AhG9pKcfD3R+hVvXrCQPxpEDdGBQ4ip5wvU2Xe/qdeUgyOJvM0Wof?=
 =?us-ascii?Q?PQmgU2/HLM3UBkv+mC78n28Ad2sHfhUZwVyDC/f6wID9v4y+3aYOJv3pAeoz?=
 =?us-ascii?Q?01TRrJwo5eCcu0L4vpnSIo8QmqtEWTqQU6m4fZVR4zFBgEt0MBFxTyyJMdPs?=
 =?us-ascii?Q?WJujZPu1AZ+eggzugrAGOcuobR95GIwF5KZCOQk9kRZ/KwJYgNON9G+63PBP?=
 =?us-ascii?Q?4uGU1Q5Vgl7JFeDflUlMWhxk/59WiUqS+0CgNZFZm7iPO4mTL/HaarKxS60v?=
 =?us-ascii?Q?R1/REvWnaUyvbnK19RivJ+I2jfFT/UDKFsK/C8H7oD1KFiZvWyIUQW7NhtuX?=
 =?us-ascii?Q?OK/j9B2pqoaRBQ41mLCKsalBmuJyAMa6WOvSJeoU74dBse5t/MuYbmrz31sW?=
 =?us-ascii?Q?wa/c3W+wgSi1lP3PeKh2BRWLwKl3idOSh1Z7HrhoTEwS7Rc0mcUw742KEl+V?=
 =?us-ascii?Q?fu1pSilJa4Q4ME4kNX57W0SZjq5x+LOADsWOYQwCIfaf9ojDULn0ti/uWP6e?=
 =?us-ascii?Q?Kn6jwhZgIykstkwlVgKJ5DqmYrRp6wDsje6id5hlk5CcWLr9LUsT9ApLly2v?=
 =?us-ascii?Q?VxH38HeuvmQZZJLvELLq3Gv44QLxRhVGgKJ6oW0IqfT1QNquz5kOpC9SsHz6?=
 =?us-ascii?Q?hPXDmZfowh2rx8p74SrzSEiv/HTvq+dHTndJTZb4RtxSoIaDZB1SCll1N8DD?=
 =?us-ascii?Q?WLjVtLXtqyz+KouAogz1gYGCLboTJixyKDXQR2n88+X84uNYMlYj36K1UKKY?=
 =?us-ascii?Q?RrN0i3supGsqN7F9XylSptK+3xqTtgVNza0CWsuNn9UfLvrLccfjFEifK7k2?=
 =?us-ascii?Q?FbNrm190p5ePx0/7njLZBuYomxFmElwKw6BRXoXUGdXcE3c5cIpMd4hFKBdC?=
 =?us-ascii?Q?mcSO1AhUE1CsNyiVPjRr/zkZA2yuzAf6V+yH+inofVUXFUKJLn5Y4pW8gFgR?=
 =?us-ascii?Q?ydN3+zskXpa8m3JkCsQo2XJnR8X/sOjJmX2irzoCrr9Ff5IyMfs2xHNVuTK3?=
 =?us-ascii?Q?eIYgtpZSFN5KocMhNGpR5ojdp62w3gccLBbsbEr1aKi/WwHSGujomkI+hKmV?=
 =?us-ascii?Q?+q0dI52FKSHPi8hjbL6z1KRsVQHbjcnw7dUCREXM294IonMCzGBK5+yQ1mUJ?=
 =?us-ascii?Q?CgCQTYFdoreGtDyrjfema0z1ex5/BddO5dUeIQ/tqVxEdePhVqmcGcTXQMJV?=
 =?us-ascii?Q?4LG/ukVqe9fAuq26y+IrXOKG/M3qvQZqs3HBoUIGlDVRHP8lMlSal/qAdohG?=
 =?us-ascii?Q?ANuoEnHg5GUuzrYa/1exetRwZXlEVI5R+Nrq+L7tLh9Kic1hJLKcygyD77cI?=
 =?us-ascii?Q?w8GmmV68Fg1Ysj1dA3OlM3ZWNO1SgKHbukIne6jyYKL9YZeZ7bYlTbXnOlFo?=
 =?us-ascii?Q?7DXydDpxh79hep/VSDA5qkHysQkqurkeiXyvpGLFPsWOSpPLfOS+JYW9E1bF?=
 =?us-ascii?Q?GaaAphx7so0U7KCp14NYgLIb4ryTqLalHL5BiQb+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8432ac28-e91a-48f8-c5da-08db6e9c4be4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:57.2096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xo3hQky/RWgqvR/tBzImuNwyuKAg9b3MbkHx4ofQ0363QPc6bJLEHCTyog6D1xXh
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

Even though dma-iommu.c and CONFIG_ARM_DMA_USE_IOMMU do approximately the
same stuff, the way they relate to the IOMMU core is quiet different.

dma-iommu.c expects the core code to setup an UNMANAGED domain (of type
IOMMU_DOMAIN_DMA) and then configures itself to use that domain. This
becomes the default_domain for the group.

ARM_DMA_USE_IOMMU does not use the default_domain, instead it directly
allocates an UNMANAGED domain and operates it just like an external
driver. In this case group->default_domain is NULL.

If the driver provides a global static identity_domain then automatically
use it as the default_domain when in ARM_DMA_USE_IOMMU mode.

This allows drivers that implemented default_domain == NULL as an IDENTITY
translation to trivially get a properly labeled non-NULL default_domain on
ARM32 configs.

With this arrangment when ARM_DMA_USE_IOMMU wants to disconnect from the
device the normal detach_domain flow will restore the IDENTITY domain as
the default domain. Overall this makes attach_dev() of the IDENTITY domain
called in the same places as detach_dev().

This effectively migrates these drivers to default_domain mode. For
drivers that support ARM64 they will gain support for the IDENTITY
translation mode for the dma_api and behave in a uniform way.

Drivers use this by setting ops->identity_domain to a static singleton
iommu_domain that implements the identity attach. If the core detects
ARM_DMA_USE_IOMMU mode then it automatically attaches the IDENTITY domain
during probe.

Drivers can continue to prevent the use of DMA translation by returning
IOMMU_DOMAIN_IDENTITY from def_domain_type, this will completely prevent
IOMMU_DMA from running but will not impact ARM_DMA_USE_IOMMU.

This allows removing the set_platform_dma_ops() from every remaining
driver.

Remove the set_platform_dma_ops from rockchip and mkt_v1 as all it does
is set an existing global static identity domain. mkt_v1 does not support
IOMMU_DOMAIN_DMA and it does not compile on ARM64 so this transformation
is safe.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c          | 26 +++++++++++++++++++++++---
 drivers/iommu/mtk_iommu_v1.c   | 12 ------------
 drivers/iommu/rockchip-iommu.c | 10 ----------
 3 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 0c4fc46c210366..7ca70e2a3f51e9 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1757,15 +1757,35 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
 	int type;
 
 	lockdep_assert_held(&group->mutex);
+
+	/*
+	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
+	 * identity_domain and it will automatically become their default
+	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
+	 * Override the selection to IDENTITY if we are sure the driver supports
+	 * it.
+	 */
+	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && ops->identity_domain) {
+		type = IOMMU_DOMAIN_IDENTITY;
+		if (best_type && type && best_type != type)
+			goto err;
+		best_type = target_type = IOMMU_DOMAIN_IDENTITY;
+	}
+
 	for_each_group_device(group, gdev) {
 		type = best_type;
 		if (ops->def_domain_type) {
 			type = ops->def_domain_type(gdev->dev);
-			if (best_type && type && best_type != type)
+			if (best_type && type && best_type != type) {
+				/* Stick with the last driver override we saw */
+				best_type = type;
 				goto err;
+			}
 		}
 
-		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
+		/* No ARM32 using systems will set untrusted, it cannot work. */
+		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted &&
+		    !WARN_ON(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))) {
 			type = IOMMU_DOMAIN_DMA;
 			if (best_type && type && best_type != type)
 				goto err;
@@ -1790,7 +1810,7 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
 		"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
 		iommu_domain_type_str(type), dev_name(last_dev),
 		iommu_domain_type_str(best_type));
-	return 0;
+	return best_type;
 }
 
 static void iommu_group_do_probe_finalize(struct device *dev)
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index cc3e7d53d33ad9..7c0c1d50df5f75 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -337,11 +337,6 @@ static struct iommu_domain mtk_iommu_v1_identity_domain = {
 	.ops = &mtk_iommu_v1_identity_ops,
 };
 
-static void mtk_iommu_v1_set_platform_dma(struct device *dev)
-{
-	mtk_iommu_v1_identity_attach(&mtk_iommu_v1_identity_domain, dev);
-}
-
 static int mtk_iommu_v1_map(struct iommu_domain *domain, unsigned long iova,
 			    phys_addr_t paddr, size_t pgsize, size_t pgcount,
 			    int prot, gfp_t gfp, size_t *mapped)
@@ -457,11 +452,6 @@ static int mtk_iommu_v1_create_mapping(struct device *dev, struct of_phandle_arg
 	return 0;
 }
 
-static int mtk_iommu_v1_def_domain_type(struct device *dev)
-{
-	return IOMMU_DOMAIN_IDENTITY;
-}
-
 static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
@@ -599,10 +589,8 @@ static const struct iommu_ops mtk_iommu_v1_ops = {
 	.probe_device	= mtk_iommu_v1_probe_device,
 	.probe_finalize = mtk_iommu_v1_probe_finalize,
 	.release_device	= mtk_iommu_v1_release_device,
-	.def_domain_type = mtk_iommu_v1_def_domain_type,
 	.device_group	= generic_device_group,
 	.pgsize_bitmap	= MT2701_IOMMU_PAGE_SIZE,
-	.set_platform_dma_ops = mtk_iommu_v1_set_platform_dma,
 	.owner          = THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= mtk_iommu_v1_attach_device,
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 4fbede269e6712..818748a76e2469 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1026,13 +1026,6 @@ static struct iommu_domain rk_identity_domain = {
 	.ops = &rk_identity_ops,
 };
 
-#ifdef CONFIG_ARM
-static void rk_iommu_set_platform_dma(struct device *dev)
-{
-	WARN_ON(rk_iommu_identity_attach(&rk_identity_domain, dev));
-}
-#endif
-
 static int rk_iommu_attach_device(struct iommu_domain *domain,
 		struct device *dev)
 {
@@ -1211,9 +1204,6 @@ static const struct iommu_ops rk_iommu_ops = {
 	.probe_device = rk_iommu_probe_device,
 	.release_device = rk_iommu_release_device,
 	.device_group = rk_iommu_device_group,
-#ifdef CONFIG_ARM
-	.set_platform_dma_ops = rk_iommu_set_platform_dma,
-#endif
 	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
 	.of_xlate = rk_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.40.1

