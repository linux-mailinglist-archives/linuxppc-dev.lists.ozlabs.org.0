Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C53733946
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:12:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cgaUnfgJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTLG1p4Hz3c6n
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:12:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cgaUnfgJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::625; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT8B4cbTz3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hL7oEFOIOYlMJTfG5s8wuiGrdvFoKQpHlxW8uFedZt5ri4KKehb0gbeoT9+hhcCk3F/8c34dkFIe01PyfRau4wXuLBemPgoClRRnv4msY9607KVcknj5hhKQCr+FyPdUdNs1dm71pmAWZZqCIXH5qZao+GqobyldWjkQeBqMgdBfHRUaQ9xcRW0JjhgkXDTn3MbotzOFxFz3MiVh6w0Ic9p03h9yQ022DMT3OkvgK0fOP4qnlRddDu879gJt2pLd4CNT+7+WK94yAZeXt6LaUkP+h3xgQk1wSfsjP13PdAWCv95goBF6slMny3U84PltuVMPEtA3xkpPrr714qZGlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbWRU94XzyWJt6kncIgWnjN2oHbRSgh268gPeGHXQkY=;
 b=bjpHLtUwn3khMoHoHPwVD6ImwRttXtF0WUAkxEYOu50fiyY7VSvBGkyGi4HcirpydviLgtyRq/G9hmYuoBJkCD0sgBVuybTNev9OvtcOrprj6dJzutb/xzAjm5pa8pmJYlXXHYK1Q+LEsN0GZAsgihQgsWOs+U658y9DnXI4DCsW1MUmyme7442nqvu/94MlKGHENhhUd4dTy/HZqcHFCArO5S+IMk6hF7lAxdNCMeh88HJPGl1vov9VCj2/v/A7DV7zMEnCJbcd77G0Fd0osz6hD95f8CPOD+vZLfFhNNOiL5rPqD6qNNBBYsAffWGeRrnwU8W0EYlV3wYuhMV0Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbWRU94XzyWJt6kncIgWnjN2oHbRSgh268gPeGHXQkY=;
 b=cgaUnfgJCbfsFTTTKrs5EFNbgnLR6PIfbfTnPIT8S9zktQbLzdVImRD7ALbPmJrywahBco5TH7jDma95St6xNIu1ykA2eVGl0oIpuSJStN/9VcQ/ufDyGqMKC5xgKI6VEvcBQjUdjTIO36DWIWBUlSkib6o9gU9vTbz8QlpgzSHlPyqkIUzQgmLsMoVTGsKj86iSPhmqGWteXdw6VgW8UxaE6fVZyDt/x/5YLtwyNL4jyafzTKP9u1uiUsSrEqF5wCRrR+ExljfRF2Q/ZrPvcU0lp4LiccaeJAOwDHwEfIXe+MvOjlr76cJMo14PnMXqB/1R+q5EDandEzKs1u95cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 19:03:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:03:01 +0000
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
Subject: [PATCH v4 21/25] iommu: Require a default_domain for all iommu drivers
Date: Fri, 16 Jun 2023 16:02:50 -0300
Message-Id: <21-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0037.prod.exchangelabs.com
 (2603:10b6:208:25::14) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 237df817-974c-446f-ad9c-08db6e9c4b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0ZtgFGeopVKtyBx/YlpsVXLa8zNiU3axIkClGf3F9n6n+PirRz5lq4Lqo8RflKdu/zrZyGS6YSVHq5D10IvV52Q4LatBw1nL6+UL1FvG6nfX29MBZy6rBr04DKytU7BwSpHxATIDV4b6uWpfmTXGSD/MxaelvYzPg3LCh1K0KqmdKlWwNXIIjpGMEM3WsOMBHa5dY0sLZnOK7/zI4OWfprgXjogwaFg9xJGD4mjCAzg9/YxjNl8ZmIYR7zTgsrmujszrS2DqLUnyxBn3yhDGGKivoNqPiZRg9tpp+yNlNTbahTpPCuL5M0m+mm09/zFT0q/ulK7ppZ2v/yUC6bLNcQPnIiAQHZ/ZZZb3mEv/KUaNQRkVfkNZ74aQVrmw/5Ibtr4T4ikIqXKr1YrxiSrOJE+xeMyseEq8E6DujnlF9C8c0bgFbcM45lnCVmjiOeor8wQKisJRnKZBy3GFns/peJt2ll772PfKkb4dYCTlCyyqrMgthjzQrcoeJ2QIhzdHdMTGdksrbBqEbcgGn2c5vz7mhGJzZyBgyOR0laHFRCAaCs+n0s9LPs5Wlq/+/7pyWEweF0W4cxT6P04ci5la6NkyENbxd89cXxJpXKXB6+o=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(921005)(38100700002)(8676002)(8936002)(5660300002)(107886003)(66556008)(316002)(478600001)(66476007)(66946007)(4326008)(6666004)(6486002)(186003)(7416002)(6506007)(54906003)(7406005)(110136005)(41300700001)(26005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?29ciVHdt2riRB30SGJX8hslgcRRdYEBI4mVnV7P7r7RYO2cAINScF3G5yros?=
 =?us-ascii?Q?+G4VgL/7flbHa1vW7pcYieUHcfLAI70Omc9wyVVvgMK6akT9pFTCw3lagLaA?=
 =?us-ascii?Q?9375kdJ9monpoJC410nlTGgl4o+smMqpi+AXFp25OeAHu+sKwmr6Zd3Hg5cj?=
 =?us-ascii?Q?0x85i26UpDmnbBZpm5j5yE3Q5h9h+2i4dgmSQ0RVfMeWYpGjvFcXFF0qqOTl?=
 =?us-ascii?Q?wmLKY3bR4uzl2nDhbY/pSvmO4cMAJDBDLoTn303AYX3HDYezeYRUQGHEYwbP?=
 =?us-ascii?Q?6U7aazTy8LrrcdVzeItSEzkpVsg74PWwzssQQ9S/ZtT/Uu1tKQ9asimv85Aj?=
 =?us-ascii?Q?uLgXWliO1G9Cso17Flnv38ZpeLgTmuimUvgNzawePTQPPsb8ez60AQY81Wgw?=
 =?us-ascii?Q?S9NViD+DWH3mFA26KVNULxUIl6/QE5FpHhIyEdL5/sHEEYKI42D/2cVPXlgr?=
 =?us-ascii?Q?XgB7xDNRXoWLOGQqKeUzn1d4i3qJ4pDjg2WA9OY6icPDBWUMj9M81AeT/86f?=
 =?us-ascii?Q?/5aM8+O0KkaXdjmtGPEETzeMRNYR6D+/xx7hgCwmd+5Ih2uR9NGqXZ4+0iye?=
 =?us-ascii?Q?cJZBOsUO6O8ZHt9G574r1wS70N+R5kQKxvLb9aqLUlXKrsQQLsXNeY02giBv?=
 =?us-ascii?Q?L+rlViYS47PlTM81G2UBpqcUgaUwiGh7rKvaXhfiCyNq6Ommr4fZ1h8XLrSo?=
 =?us-ascii?Q?LImkqHbRkfLsRPqmmgXaDm8o9Vp8iVgP9dr4LPjhu0CQpXKLeTFJlNd86Xhx?=
 =?us-ascii?Q?PJjoF+oGlP7ldJ4daxV95zicWhd3pCTtUyUJ0mHkNXd3BxYkUXT5emMLQzOg?=
 =?us-ascii?Q?VOZIacSAIgslLQb6kMjD7H4S+oSiqgsBAus8F5bgEaa/aVrkMVMmnohZLwuU?=
 =?us-ascii?Q?b3z5suP+4dXjUsS+VncdVqxaAQwa4w53yCnxfFzbOEVyOTBvnSQakRpQwhbk?=
 =?us-ascii?Q?fZX1122bx1I19SRlenhIzpKeTAc1p3yo/cYYYuAIcDarTqtAjICwqDs0agDM?=
 =?us-ascii?Q?/NRhiBvhVu4yToDDTIk9wHyTRCJO4DRfFlvARwmyZlH2JOjJqgwgj7A0RjTT?=
 =?us-ascii?Q?c0ba4s5+MPXRZUIXEF19XmRs7XikGNCIIaRfAuA4YoI3ZE9oVeosmStSCT0t?=
 =?us-ascii?Q?FKycY0NrRkjAAulb1OShHdBHrmwjE233UJkVJeTe7zIbBC0FVtfasmJEuQzb?=
 =?us-ascii?Q?VlihJ/4Bhk6nV9DFZNAhw28+/KP2Gd9auQinWSdXKnke8bvkjs5EZfUXwCj9?=
 =?us-ascii?Q?tnMrYaLhBdVPI1xnYiYkfjp99Klu4smAQvuNLUNGhHC4eA5wvBU0zlqIBMTe?=
 =?us-ascii?Q?0Gi5CYnaWBe73acX51mosFXsJgjl+kVJ/0jfaMdmHXylYnRxG/2gdH8r8nE+?=
 =?us-ascii?Q?zJLP9/RX3rPRx73N6snPmsJYF5dA4ybjXXO8X3rr4n/5DSEo1bXZntq+9WrV?=
 =?us-ascii?Q?fO1XOffoKI+ift1eTWymBfwHtObBovYbWrMunKarywBvqBzPjXaUS+a/L7rp?=
 =?us-ascii?Q?/noDtfuzF5H+p+VmJMAsVtuh+CBh0iL1THvqcc39RR0JJEy1GJtDm2oEf18L?=
 =?us-ascii?Q?PW0sdGL3SGlfc+b0+igIU8msvZ+nERwK1zB5NkWe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 237df817-974c-446f-ad9c-08db6e9c4b42
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:56.1082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqHSCZ5AY8BIEc9a/7XhGziyjUnqcD93dujecZCm1wWB81Z6J024qec0sYZ7bt+3
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

At this point every iommu driver will cause a default_domain to be
selected, so we can finally remove this gap from the core code.

The following table explains what each driver supports and what the
resulting default_domain will be:

                                        ops->defaut_domain
                    IDENTITY   DMA  PLATFORM    v      ARM32          dma-iommu  ARCH
amd/iommu.c             Y       Y                       N/A             either
apple-dart.c            Y       Y                       N/A             either
arm-smmu.c              Y       Y                       IDENTITY        either
qcom_iommu.c            G       Y                       IDENTITY        either
arm-smmu-v3.c           Y       Y                       N/A             either
exynos-iommu.c          G       Y                       IDENTITY        either
fsl_pamu_domain.c       Y                               N/A             N/A     PLATFORM
intel/iommu.c           Y       Y                       N/A             either
ipmmu-vmsa.c            G       Y                       IDENTITY        either
msm_iommu.c             G                               IDENTITY        N/A
mtk_iommu.c             G       Y                       IDENTITY        either
mtk_iommu_v1.c          G                               IDENTITY        N/A
omap-iommu.c            G                               IDENTITY        N/A
rockchip-iommu.c        G       Y                       IDENTITY        either
s390-iommu.c                            Y       Y       N/A             N/A     PLATFORM
sprd-iommu.c                    Y                       N/A             DMA
sun50i-iommu.c          G       Y                       IDENTITY        either
tegra-smmu.c            G       Y                       IDENTITY        IDENTITY
virtio-iommu.c          Y       Y                       N/A             either
spapr                                   Y       Y       N/A             N/A     PLATFORM
 * G means ops->identity_domain is used
 * N/A means the driver will not compile in this configuration

ARM32 drivers select an IDENTITY default domain through either the
ops->identity_domain or directly requesting an IDENTIY domain through
alloc_domain().

In ARM64 mode tegra-smmu will still block the use of dma-iommu.c and
forces an IDENTITY domain.

S390 uses a PLATFORM domain to represent when the dma_ops are set to the
s390 iommu code.

fsl_pamu uses an IDENTITY domain.

POWER SPAPR uses PLATFORM and blocking to enable its weird VFIO mode.

The x86 drivers continue unchanged.

After this patch group->default_domain is only NULL for a short period
during bus iommu probing while all the groups are constituted. Otherwise
it is always !NULL.

This completes changing the iommu subsystem driver contract to a system
where the current iommu_domain always represents some form of translation
and the driver is continuously asserting a definable translation mode.

It resolves the confusion that the original ops->detach_dev() caused
around what translation, exactly, is the IOMMU performing after
detach. There were at least three different answers to that question in
the tree, they are all now clearly named with domain types.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e60640f6ccb625..98b855487cf03c 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1805,10 +1805,12 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
 	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
 	 * identity_domain and it will automatically become their default
 	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
-	 * Override the selection to IDENTITY if we are sure the driver supports
-	 * it.
+	 * Override the selection to IDENTITY.
 	 */
-	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && ops->identity_domain) {
+	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
+		static_assert(!(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) &&
+				IS_ENABLED(CONFIG_IOMMU_DMA)));
+
 		type = IOMMU_DOMAIN_IDENTITY;
 		if (best_type && type && best_type != type)
 			goto err;
@@ -2906,18 +2908,9 @@ static int iommu_setup_default_domain(struct iommu_group *group,
 	if (req_type < 0)
 		return -EINVAL;
 
-	/*
-	 * There are still some drivers which don't support default domains, so
-	 * we ignore the failure and leave group->default_domain NULL.
-	 */
 	dom = iommu_group_alloc_default_domain(group, req_type);
-	if (!dom) {
-		/* Once in default_domain mode we never leave */
-		if (group->default_domain)
-			return -ENODEV;
-		group->default_domain = NULL;
-		return 0;
-	}
+	if (!dom)
+		return -ENODEV;
 
 	if (group->default_domain == dom)
 		return 0;
-- 
2.40.1

