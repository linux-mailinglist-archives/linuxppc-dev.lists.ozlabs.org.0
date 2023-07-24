Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 643BC75FD7A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:23:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=duUt/Lma;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8n7Q2Dtkz3bVp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:23:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=duUt/Lma;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8c::629; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6X2PTGz2yDR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/j0DB96KBeLvMN2ZvQH6kRkxKIh9Ahb8lFajOP1x6miNt0Ho1n/zUE2J6hLcoSGQhVkgrddVV8hO7vbNcFU5KlJKWBSNebsCfai6qYIiBeQQp1Urfhus5deCCvJbQOsvDveaRYEfVkgDygDikJWUmRZyBuAu1oaPdU0erhQ5a4XuKfFY9GqDCBNNHs72svGSyUs+UUcp7uyoR15Xj/XyxEwc6/ZA4UxNSXoefstwABaE8r1IEiyAPNcRHp7TkQIzaygaXH5bSZoGwTiUaP/Aefcebtm9amsWIfvQpEq/nF9EQHltPTPvPEGSWvEP9BPXe0nWA0xwvZGpxtSOEY3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmN8wx0ZcwrsXaWrD4Fv2q50YdIFx6jmaYZV5yW4VDs=;
 b=fjBICSjRCbasHm5+MoQkHVMmzjUAvgYqwblo7vBU5V1vuRT4zuzLbGbhKXHZyFQPtpAb0NSzTAHD5qEAHaep+kVymoS6++e8vyCdbFL8nLCXmsL3HOOiouvmXG6mG4LLdgJO46/tPPI/wKX+cxgveHoWsBK72lGwHI9aOcxYsuYLbxmSewgfC2YyG5IC7QEAhnfzvO3Zy8TsidZeD4ApYnkQH6sYegDKJbvZUP1CaNAcmhNtng2DG3nZbPtrZ2ExIg7oO9e4i917vBrKktklW07PDo62ODnQZMpYpxKc2xgiUAWmIpdaBICOJW0o2QluT1FiD3ftuZ1zDAOSKAfkKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmN8wx0ZcwrsXaWrD4Fv2q50YdIFx6jmaYZV5yW4VDs=;
 b=duUt/Lmad11JosGy9d9LOXKmrXv6eWs9uVV+iCefO+/rBtgHo1NnOxZWJLQntTw3C0Qe36/HPX7ALj8EQThWsD9Ex/k+Rx/L4Wf4v9LeL22N3rT8ydX2/02o0+sbWXef5iFLu2li0GPfRoaGBvJavHyD1Xvs8JpxgH//GH6uKrfJrrWSvzkMGvojxZh5SD+IcrOegWrpWko9zox6H9RWb195XWxUBYzyYg9GnoCbkrOgbBv2DxG9faGX0swzAQbxxoevaTpkjjsFh6uplC9cfibTsqyacVeMyVpuvZdEfOk+/bLXFCfR27quqiGtJjn/odlnktnRQELnvnk/gnwWIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5252.namprd12.prod.outlook.com (2603:10b6:610:d3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:23 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:22 +0000
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
Subject: [PATCH v5 12/25] iommu/tegra-smmu: Support DMA domains in tegra
Date: Mon, 24 Jul 2023 14:22:02 -0300
Message-ID: <12-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:208:2d::33) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a0f5515-7a37-499c-1f2b-08db8c6a8815
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qhbssgMac+H0Ye46WIFcPW/cuksJzrCL1WDqAsV18EW7aqr3hrc5p8DL9OEVn8J8Dq96a0C38ZSciXet1/r1vWozJDDmPXi0zDfWy074H0iXeY/LKuh4uhYPFEKv2vrjiuLkoZaP82AzkawXCR3clBV6YdBGJ5dEG5YVThiZ7hcpiv+l/UFXT5oofxAkU9tfWwzPcYzpslwpTa6p/xQiU2+9kGTnDrkJyjVCtHPRxDHcC+yq/2et15Ycs18bVoQy8FrdzycC1MnGt7P2Q0PdEjN/ofXjjvab8izy15KHXv1PJes9ZMY0TYyVU8k6yBgY2VbMsmAkvrRK8sdy2TnqIOYri48haKuI16rulS3/B/Ia49iHlZu7sut6wd8F+xy4cDhLyqJMvnYl1naR4pALbvtwL6jX7Xxo+P30QzeU4CLCboFsgrgoHpl92DsrGC48D/OoBEwPTbv4RxHaclsqBv+cdNjIpcyO3VzXSBxcgey4OcmSMcqvISXeBzjgMe112Hd3cKGRmpW92AZviXiup7CC5N/Eqdwa/PlYbhiTyPJ3cLwCzUy6EU0Sl7xxHZ1DuyLUaLSsklUXy38DAVGIs2IwCBNKXR0Q9V2T5rcJWiQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(2906002)(2616005)(83380400001)(4326008)(316002)(6512007)(66476007)(66556008)(66946007)(107886003)(41300700001)(6486002)(36756003)(478600001)(6666004)(86362001)(110136005)(54906003)(921005)(38100700002)(186003)(7406005)(7416002)(8676002)(8936002)(6506007)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?epC4hkbXWUBEo+6CYrCTvFYhspDNy4F2wwbrw3oSxxeOxzhKvg2UOOTcipam?=
 =?us-ascii?Q?jrwkvF0+jdt4Llm6C9ogzGKooCCO/7V2J/2iJ3XF9HST9OEcGCMr74m098QB?=
 =?us-ascii?Q?V0Wgz97DxX0khhE7xnIBGiaqr1LfdH+8/Dha8QoOQ8inipewrLk6UnzGNWYf?=
 =?us-ascii?Q?2MESCDn5u3RJTqWFgNmFwZgcog2C9vra7xugYNixWAcpVP5iTqBjp8l7isQJ?=
 =?us-ascii?Q?UIN1bmT4prloPqwcmhKZE6YXfaHUFkr7hEv7/DSnzsVMENuvVJFN4OqQOAdL?=
 =?us-ascii?Q?1fb+3bYQGANihWh18019vucS8lH3VnpkVTWsUdKFhWhOzDzfr/ni5l54sL2z?=
 =?us-ascii?Q?9/R/z6XQviyD2oszewl3XgbPbEo/PaXo8YktoMNuxRmSn1sBA61wnhjBKpGr?=
 =?us-ascii?Q?jJYK1Ca8IaI9bDW+FNM54SvxSp5+L9cVM8zL7TGkVkgVt45vRcptXwaTwMNV?=
 =?us-ascii?Q?HaNmDjWtif9nuyKr57En9qeFh00wl8KGINT6RC0y3RA8TdyX1N20w46su756?=
 =?us-ascii?Q?hbloVYpEOninmlu8IWU4AkwemgbPeB5w6eh6kYNuUnO8GJdtbngV7SyTd4S1?=
 =?us-ascii?Q?xZSL1ayExiBUPncMH4Vu0EnIwV+nx/oPClapaqRN5yplBi/fGbYmD6hv1Y2K?=
 =?us-ascii?Q?hS0It6kZ4HBiM4+KSFs/doYKnMhgDi0PUyXNsNETl5o7wkU+UxtitgblmMRy?=
 =?us-ascii?Q?wIkhssGT/qOBzFB+x2Ig9rEWmNRufXC0mIYzJ5XsY7lTcY9mYRIwQB9spUjf?=
 =?us-ascii?Q?ErUTxdDn5fTyqv1xFQrq1QsdLVjB+ASPYHbqUqSxETDdvrjCxJXtKATt7kpH?=
 =?us-ascii?Q?reCNhtivFq2v9cDcHkdB/JWW9+LBf/ip/qpKSX+DOwD6JS4NuwNwyPLOI3SL?=
 =?us-ascii?Q?FIe7NoCrK7IYuKoJp6QdZRwuCjk5wsukkf0KYaIWXH3JfUakPH7tuw4FRRQv?=
 =?us-ascii?Q?Z9B5a9OIGnZS6W/ElERONS//rmqxiOk7FL1fke51sC3aJvuvQXON/sM5RuB2?=
 =?us-ascii?Q?ViPpVWGMLguQuVE03cMDfwYw0T+7RsbZtPfCMxXq11V+Om20mC3lpqn+Dzz6?=
 =?us-ascii?Q?b4w7LrlJQpLt4Lt1NUmkldWnhEOWpfeQ9XJllKPs2y8Ra5kUfBFqU+8e8eoc?=
 =?us-ascii?Q?Fz8tHOlJNeEj4ftY+kyedmAiWEuo0n6CDeuTtTEtCNI5okRh/rAAvjKEx4XY?=
 =?us-ascii?Q?zIOzCxbGlXOelQ1VB4P2UMT6ojOUHIy47iVjJtiOhiWa9MQZQP4+78xBtX2/?=
 =?us-ascii?Q?O4wi3jHFChbkLMWj8RrKdBTw0jc2WG2ZSEhNy4Kseeu+B+7On0VZLFsOy1Sz?=
 =?us-ascii?Q?YRaNx7z+TN4ohktsnrhRo7CeXdd3JeAXhISGeeidzYASjVbVjXWG8XXOFGKg?=
 =?us-ascii?Q?oo3GUhr6qGUqp2+56bN8iPFzYbC9ALt4bmQ+I3ZI1oE/FIMMpr4ygj8WxLEj?=
 =?us-ascii?Q?LOjzCac2b4m3cW515B8uNyTVBFjPjG2sjBdMZGDNmSqdK3qKqNhXvfcXUAKc?=
 =?us-ascii?Q?VaP3E3n8tR0a7ppCihB1QEKmktl0XrbUJslO4QNgqaD39y83ooJ6ZwmUDZ/q?=
 =?us-ascii?Q?0NXd3O2VQ0tzOycALBxpiwgAy2+DlFFqLkwcUGnV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0f5515-7a37-499c-1f2b-08db8c6a8815
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:18.4572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HBaTSiiCVtfxpunnsfWG5v9ZX6q/JplnGCobF6WWvTgajNCnddeetuF1O2f2+UKG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5252
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

All ARM64 iommu drivers should support IOMMU_DOMAIN_DMA to enable
dma-iommu.c.

tegra is blocking dma-iommu usage, and also default_domain's, because it
wants an identity translation. This is needed for some device quirk. The
correct way to do this is to support IDENTITY domains and use
ops->def_domain_type() to return IOMMU_DOMAIN_IDENTITY for only the quirky
devices.

Add support for IOMMU_DOMAIN_DMA and force IOMMU_DOMAIN_IDENTITY mode for
everything so no behavior changes.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index f63f1d4f0bd10f..6cba034905edbf 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -276,7 +276,7 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 {
 	struct tegra_smmu_as *as;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
+	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
 	as = kzalloc(sizeof(*as), GFP_KERNEL);
@@ -989,6 +989,12 @@ static int tegra_smmu_def_domain_type(struct device *dev)
 }
 
 static const struct iommu_ops tegra_smmu_ops = {
+	/*
+	 * FIXME: For now we want to run all translation in IDENTITY mode,
+	 * better would be to have a def_domain_type op do this for just the
+	 * quirky device.
+	 */
+	.default_domain = &tegra_smmu_identity_domain,
 	.identity_domain = &tegra_smmu_identity_domain,
 	.def_domain_type = &tegra_smmu_def_domain_type,
 	.domain_alloc = tegra_smmu_domain_alloc,
-- 
2.41.0

