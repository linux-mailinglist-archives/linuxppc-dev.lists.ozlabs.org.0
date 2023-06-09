Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DF872A428
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:13:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdC2411SFz3g8s
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:13:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lp53xtX3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::62b; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lp53xtX3;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBg1502nz3fCK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZK7UyHETw4LTiy/mFpEzooMhGPZzvCwp7RsGf0p0BUkPjTkUg0zDfRUA/5n8HW/7eSmkTz4UNbve/2ciOOvQe2ah7QOKKzVin2l70p/sL4k9gInUTVkjaO8dpxJ0wXQPe5xQwb7noEFDyYSPWTPJWtiN9widhmNYyGn6Yn+3kKn944CQ0wBZiogdmBdUdcWLdry/ce+DaK6eAxmGLBIdfV1sBfdfcfQDynYR3700ugSYq9BUsFD/cwS+L54zr7TPGmiY7o1zO9dr5cwW9npmOIZmVK643NhNPj+r/wui3FwxIrLgJOiRbI8uZCvdkK+B1wvGRpdgwbNBnQhXZgSDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWCGzrTaqbrXMG5crzEf4pxvfNiTwQ928/5BOZsI094=;
 b=bG3WP+XCv/jVDFZ60nK2O7WqmhrXmTqwf/iZm5EWk19sN3HewN25ws+jo0ed1dL69sAUJA3WxooZuR8c6fe3fQZJo5xahuzz2C/ynQPJ6eBhHu4wUBNhhQznBroBDgdpxAvLfyh+tg3EDGzWGF5BmH7ZFtpcTccRI6B9h8OhyNM9u7mrvOWJ+rg24EazxmTns9LUwpGZvmNVGrbCvT0OufmzPH3iv7ieCyBEKd3SSmnzYGlN/S6NKxFbPXt5MQerkimHVHbzTRzERYO/TgAUgpLmM0qn4beddYgnTUgdcCsG7t/PIIf6u1Ko2dSuvzDKBilqBZ2uyd6nJ8+RXESxDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWCGzrTaqbrXMG5crzEf4pxvfNiTwQ928/5BOZsI094=;
 b=lp53xtX3Ka/W0Cs3cfyG1UQB0X1Zj2AWPgdUmCwFf4DC6LkemTK2acGpyGFK7oXbRJnQrB+Ixdq1x3I3wNcRQoIZ/ZVTMJdhSVCnO3BIWi/+swQWYpbgOwfdqtJcvoYcwch/MhzE1NYq4WZmulpZ2RCSB8QZfUYYWoEIRVpWiVVUYBi1vxhXM9Ov2YBLW2D+qR6Q98HYiN3sE6f3GDxo8x9iLTBVFn4SZ7ZnlikGWAgZOZhradO5MXVMavx2p6zIzdAjQjhndBiAZQVsvi61FZzbRuQeT87J9x4xSKOmEnsdURCcOjxG0D7RrmDqdiM8xyZVaPTZYkYppvmVfTHfrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5785.namprd12.prod.outlook.com (2603:10b6:208:374::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Fri, 9 Jun
 2023 19:56:25 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:25 +0000
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
Subject: [PATCH v3 25/25] iommu: Convert remaining simple drivers to domain_alloc_paging()
Date: Fri,  9 Jun 2023 16:56:13 -0300
Message-Id: <25-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:334::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: 51210419-31cf-4f3f-8054-08db692399a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	zFqiRtjepOw4GcWpL365SsmiGWKuunZ/T2XR4+NmcnOcyzSqBRG9PTGtHl+nWPGfYxFnw1XlkE8+OxZmP8gID3hVIVpag6lNyp7Tz33lcTroEJJzCos85P1517SgwobBJJ2ys3LPM1urGsXMwwWiwZL2k0PnriemeOgCZZkjCN+QNzxprBUMDWpSFF8JSAoJxs7e+4rlSkGn+EJhCl+WQW3U5VSA0f0+p+a5pb4UE16sv32BEAciQWDy14eVYsOeRtzRUpzKn3yC+YkX41OeTYUCbDQB92wp9i4NUjhSMXu5VRz8MYo+Cl17/SQ/6fUGiqMV4gqRXiUavqNfxrgqsB67gB+EYXN0gshQ3vbYDyBO07YTP0yxL+tVBpZXaszuC+09bQ3ZIvgbbkUUnXet9PN0Z/TgktPAK3XOA6yhxvqqcsrT6xC0Gr+lu5ymhCp/v/MTCVr/6rGS6ZphnAvAa8dAkIuxPm/wBbcwP6GeBi9L9i1+0Mh3BfKszAiEMbCDW0Ho6YDToPwDybREnT2IrxLa6qTZiIfnjpAaltQuH9lvXCCInPG+mClPviIW8qnKHVgx2QBJ2NwfuJl1rCf3dntAASf8uJfl7Z2sf0Iqupk=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199021)(83380400001)(7416002)(7406005)(110136005)(478600001)(8676002)(8936002)(4326008)(86362001)(66476007)(66946007)(921005)(66556008)(5660300002)(38100700002)(41300700001)(316002)(6666004)(6486002)(36756003)(2906002)(54906003)(6512007)(107886003)(186003)(26005)(6506007)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?q8wcomeM/KwK7hC85HbFyLdEsps27eZj7E6e4ZmS3ymhrkTfqg5d8+p7zTBe?=
 =?us-ascii?Q?HeZZl39kAr2oaH74+vu09XdXPVvlnM0QuE2nb8yVWEZNxwFWU0pz0T6FXeU3?=
 =?us-ascii?Q?U465jMqoEihcQHVC83rBuCH9+qO/p7N+KhKIY/oS8TfPKhFiNPb1+evvkqng?=
 =?us-ascii?Q?BK9RWk/8eyfi5oMWJYWEZNdIj/UYgQDsfZ9rSH2Du4UZcuU3cHXIat/zHwDW?=
 =?us-ascii?Q?KTY50BT2V3MnR0gmdX1JGkdWcYv3q9Vt5N1G966ODJBRo4r09glSxR5IgFDd?=
 =?us-ascii?Q?AZhBZsJ1AILSwT8qjDix8iz71jL9cH8HzAhd8/A5U55TJdBUNq6dVxBWU1xI?=
 =?us-ascii?Q?NQ95OfyD2ITazD6xc052Ihm55gS4xxRfF+OlhqqkG9QNwyiE3fWDCkGwCDKm?=
 =?us-ascii?Q?bo81o7Q/kQwr63dRoQEs0ojUEr5znOS2H+VRlk8sl+HN5h36Hei2avpje4m0?=
 =?us-ascii?Q?0tZxA/BUPtGZvCexB8gMvb1136Fk/9OrnU5eE/SrPdYxr1yBfOf2S+9bQ7OS?=
 =?us-ascii?Q?U2Yfu3tz4bZ4c5Qb2/BE6ALlFIGn81wAgKBYycXtkYNeFUzmPt1eZ9xnO7n1?=
 =?us-ascii?Q?2CvSXH48RXwT1lNfjP3nL1OoibQ3zcllLag1Sr6swRGNtvyROyCGltzXPMqa?=
 =?us-ascii?Q?BKje8LgeZVpDt9Hvv/lmpb4A4ZCrS9DfuzAJXROPqpzA5FzOqGAj8X11bs4A?=
 =?us-ascii?Q?1+htpEChwpb1TOoYzFBmj81h27vgdgDUhyXEKBpQBbAKtSvj+iXNaDg8fJrE?=
 =?us-ascii?Q?KO5xP4AxGIV/RTZa0+4BOYMr9heDUJD22iK8M9DBw83mhJxTXi+imQFj6xPD?=
 =?us-ascii?Q?bCeMinyruMfWxUCWXGCCEM6kUiq/eY8CaD95QC8m7PrThFh48bmXc9EiyUvr?=
 =?us-ascii?Q?rw71EevtBDZ7qLLnK8Ebm+/BQd9nhvIcCSTVW7KKdvjxQq4HQeCmrMJypVae?=
 =?us-ascii?Q?jLW2EgeOrNb0WcMzK0ySj5psjHecfcSRu6QFKP+/Ut8Tbp+7BsTpkEs8Dcsf?=
 =?us-ascii?Q?i1gB37xux6ivBkkbUg9quV2hIFe1klMFhkAR3n29ukC2hlOyyPCzpOARD1Q6?=
 =?us-ascii?Q?s7EXD0XWc3J9S02U6eHDkj/Y6Sz0kNmaXE5S8RQCw23msUfMWglJYyISLe2e?=
 =?us-ascii?Q?T38z9g0x118AlBmPAbeUZCB6osQyUJp6sufsENLo9LFTDRB2HF73M/WbaXxq?=
 =?us-ascii?Q?zlhx6aIjsUY3piS5hnuKxiKtk8VOguXlqo5YTyfGzPsejmVcZTMQlR2ZUNBg?=
 =?us-ascii?Q?y2kcDZvRgtqQKB9hJIt+Q7Jd5jS/+HmKHrupiF1bSoNVzmpCU2FwhQ/3PHi9?=
 =?us-ascii?Q?2FEbVz1zjiOIVAoA3t9IvKfcKAwl9E5MQli4hAgUOfaAl8+bWAt0/nBRU39X?=
 =?us-ascii?Q?VQykRCM/od6j0ok9nXiKX/fHeZyj+Ik2IylzHu0zCvTW2O3ROZeQQEHjLbXT?=
 =?us-ascii?Q?QGcQZ8QHs0Ph9wU4QZq3KVE9Le3VN095htP+o1itR35y/yMYriONtmzNisIx?=
 =?us-ascii?Q?byDSX2N3thRGjkpUfaPknJsMW9b2cHESxjg9O8INn2uy/gEI2wktwqMl7dOF?=
 =?us-ascii?Q?VdQhlR4wqF+vDej6gr8TVbJFiPF6pw8nX5I2hPh+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51210419-31cf-4f3f-8054-08db692399a2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:22.6770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YqfON9kIl/tgaZSpdEZLGzNkxw55TIqnVXDewrj3xb7VVQiUJYTdFox1mZ4NbCDa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5785
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

These drivers don't support IOMMU_DOMAIN_DMA, so this commit effectively
allows them to support that mode.

The prior work to require default_domains makes this safe because every
one of these drivers is either compilation incompatible with dma-iommu.c,
or already establishing a default_domain. In both cases alloc_domain()
will never be called with IOMMU_DOMAIN_DMA for these drivers so it is safe
to drop the test.

Removing these tests clarifies that the domain allocation path is only
about the functionality of a paging domain and has nothing to do with
policy of how the paging domain is used for UNMANAGED/DMA/DMA_FQ.

Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/msm_iommu.c    | 7 ++-----
 drivers/iommu/mtk_iommu_v1.c | 7 ++-----
 drivers/iommu/omap-iommu.c   | 7 ++-----
 drivers/iommu/s390-iommu.c   | 7 ++-----
 4 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 26ed81cfeee897..a163cee0b7242d 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -302,13 +302,10 @@ static void __program_context(void __iomem *base, int ctx,
 	SET_M(base, ctx, 1);
 }
 
-static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *msm_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct msm_priv *priv;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		goto fail_nomem;
@@ -691,7 +688,7 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
 
 static struct iommu_ops msm_iommu_ops = {
 	.identity_domain = &msm_iommu_identity_domain,
-	.domain_alloc = msm_iommu_domain_alloc,
+	.domain_alloc_paging = msm_iommu_domain_alloc_paging,
 	.probe_device = msm_iommu_probe_device,
 	.device_group = generic_device_group,
 	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 7c0c1d50df5f75..67e044c1a7d93b 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -270,13 +270,10 @@ static int mtk_iommu_v1_domain_finalise(struct mtk_iommu_v1_data *data)
 	return 0;
 }
 
-static struct iommu_domain *mtk_iommu_v1_domain_alloc(unsigned type)
+static struct iommu_domain *mtk_iommu_v1_domain_alloc_paging(struct device *dev)
 {
 	struct mtk_iommu_v1_domain *dom;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
 	if (!dom)
 		return NULL;
@@ -585,7 +582,7 @@ static int mtk_iommu_v1_hw_init(const struct mtk_iommu_v1_data *data)
 
 static const struct iommu_ops mtk_iommu_v1_ops = {
 	.identity_domain = &mtk_iommu_v1_identity_domain,
-	.domain_alloc	= mtk_iommu_v1_domain_alloc,
+	.domain_alloc_paging = mtk_iommu_v1_domain_alloc_paging,
 	.probe_device	= mtk_iommu_v1_probe_device,
 	.probe_finalize = mtk_iommu_v1_probe_finalize,
 	.release_device	= mtk_iommu_v1_release_device,
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 34340ef15241bc..fcf99bd195b32e 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1580,13 +1580,10 @@ static struct iommu_domain omap_iommu_identity_domain = {
 	.ops = &omap_iommu_identity_ops,
 };
 
-static struct iommu_domain *omap_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *omap_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct omap_iommu_domain *omap_domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	omap_domain = kzalloc(sizeof(*omap_domain), GFP_KERNEL);
 	if (!omap_domain)
 		return NULL;
@@ -1748,7 +1745,7 @@ static struct iommu_group *omap_iommu_device_group(struct device *dev)
 
 static const struct iommu_ops omap_iommu_ops = {
 	.identity_domain = &omap_iommu_identity_domain,
-	.domain_alloc	= omap_iommu_domain_alloc,
+	.domain_alloc_paging = omap_iommu_domain_alloc_paging,
 	.probe_device	= omap_iommu_probe_device,
 	.release_device	= omap_iommu_release_device,
 	.device_group	= omap_iommu_device_group,
diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index f0c867c57a5b9b..5695ad71d60e24 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -39,13 +39,10 @@ static bool s390_iommu_capable(struct device *dev, enum iommu_cap cap)
 	}
 }
 
-static struct iommu_domain *s390_domain_alloc(unsigned domain_type)
+static struct iommu_domain *s390_domain_alloc_paging(struct device *dev)
 {
 	struct s390_domain *s390_domain;
 
-	if (domain_type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	s390_domain = kzalloc(sizeof(*s390_domain), GFP_KERNEL);
 	if (!s390_domain)
 		return NULL;
@@ -447,7 +444,7 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
 static const struct iommu_ops s390_iommu_ops = {
 	.default_domain = &s390_iommu_platform_domain,
 	.capable = s390_iommu_capable,
-	.domain_alloc = s390_domain_alloc,
+	.domain_alloc_paging = s390_domain_alloc_paging,
 	.probe_device = s390_iommu_probe_device,
 	.release_device = s390_iommu_release_device,
 	.device_group = generic_device_group,
-- 
2.40.1

