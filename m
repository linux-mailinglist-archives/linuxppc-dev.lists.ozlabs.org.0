Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 475F5785DEC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 18:53:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fPgEjUdR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWC3S1C4qz3dG4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 02:53:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fPgEjUdR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::619; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwj2Ws9z3c2L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ek3bOROPLwhSL5nsDLWgwn2EXnCpyURHDVU+YdVLGOsTaNnIbGpSWEWAaWsTI+vUvnfkTzcMKWqjSJ8hzb+cHDusdt8vIyQ97V/xAHyWg3tSV9T00K4lpAlCZwKosFNP1439O2NNNXIxufcWJcUaucUnwz+XqVym/etOKIRvBV8HlWeI0gN1sWSQixssq4Xe1h68nSFUjZSo+ALPCK1nR9a32OwmaQwvg/lT+WYBGQxzWXM9xNNcvcdlzNl204LFSbcYrMvDjwA9usxa3DDwvGNedwTu7Rnjnd/3xXiOXyO/wc//3mYa6zCCOlgLWkwLfG10HcyMj7o547r4dwJ0yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8jtGsZQ3LFdM09ODBzwfFD8xq0WOo85NVlBJ6RDiC8=;
 b=Dks67YewULc7ZoJmB4w4xIKMYTeLkwvDJ8GUDaMSAVjw1X+c9e8VIpbg0kLowM4Snsou3yfXHK2CeGtke1nDE/Pa2n5P/a9nymVlZbKSky2aC8jiNux+CEjzUzQUNt/fk4uRCFtHvDjScVhB96V33QIrmQawjNTjd4AsRsgPehxr8jT4IGaC5I0uXW2fngUtOyB1jzMLojeFYqk9HEQOLDaLdmfzMHKgJ0bRPPdjd2rzJejaFhrd6cHAnNFSuhwzr0ZMsSVAIM7LFHQO3KOhOQHJ+J8euN+V/c4v9UvnkwU4ynPyRPtvU0PSBKgN+KE1icVms0bIH9L3E5IkNu5Lnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8jtGsZQ3LFdM09ODBzwfFD8xq0WOo85NVlBJ6RDiC8=;
 b=fPgEjUdR+mqtm7sGV54sEfOOMUHf+CACLENfe2ZApUCj2kyoaSWrXGUYFgm9l1FefXMBRc2VQvok0qn/svll7B027id+WjTKwKi3HkWG61szIh57NJHOJh9zJZ7Hj9yB//xYi9RJ8Ox/GYUEtv5cvtsg2h5myQq6CBFvSotBPqT17Jz0SugsMU013609Rb2iVkLFxxGGMdGAKH0ykZ1vhzw9l4o5VneIK/Cm+MFm7QrnzKEteE7MqoED5Q37id+0HzMsPKsw25CdAzAUO/zn6vros5HiIHbaSe2Nb8qt6zr003LiGFJK9k8hhp9PWfOYk7L0uxn3htOIUHinBpLgSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:47 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:47 +0000
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
Subject: [PATCH v7 24/24] iommu: Convert remaining simple drivers to domain_alloc_paging()
Date: Wed, 23 Aug 2023 13:47:38 -0300
Message-ID: <24-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR20CA0022.namprd20.prod.outlook.com
 (2603:10b6:610:58::32) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: c0818554-1663-42da-e328-08dba3f8ab50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dnAbp4d8Lu/D3ZrbQW9WS9MinuP4tFB/PLUoKBUzPr9nIRwpLpYRDFAm+4t0BLosR3ysL0m5PpyP8fXW0Paa0eZO1EXUJ4EFYQiaDP4HCNHVODLfCOzkhit3PB8k+XboTru/gKkuxkUoFP0x0pfVRuhSA54D38MOVDGRNJ6i1WeG65X/m46s9KwEBiKYXkHIb7/N8AHM1l8gxcq7kmTEkm9a3es35/f9QKuJDoNdvezb0AsXWs3glLWkY3AJ2wkGiXCIWTCeAfGvDT2/FfbbJt+TnE91mV92b5rYWZ+Gp+a9gGNnhuvwYA9nvACLZrH4eEDTL58giyG88UDeo2tv9Sw5yapw1WElF9AiLzYqTRH2Ou1nH50iP6pV+SE9vHRM0lYw+s0Q7Of4HzrLu/Qr3d5Zr0FbAxf0Q7TRlBfkn4VBfF04BRziU6OipPLaegFqqcWXniILU1GKj4krCZeq8NAfNI4CpGfHqXa82I0ononI/aEvG/TxmPL9JW9hIcTmR7Q6zOeN7bdN7P2YmWQ1w27TQnAprK+tW65urpw545Z5ovW4qxcmdaE5yZlBEs77shZQUsohjU+nmYRTMwphWaS+ZAL5C1u47LuubhSsjuE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?yXi/xYEI5sSW3HfGxTB7gxq8E+o1iKGerKph2DUyHFBYr9qBLn/Ucsn/bI7X?=
 =?us-ascii?Q?XFrFKRofmb8bQHy9tWnl+suyh8rYr1l1pmf0Jd047cNTjiFvs+5gU/gqWLJy?=
 =?us-ascii?Q?5r1YsSCCmo9rKAfTl2U896+A2xWN9eNQLvKIjjDl9x9bv08c4RBCluTQFs6F?=
 =?us-ascii?Q?yOaGNW6102Qp9MS21skHBhb0/72pJ066dwWUUJs3IkYFwc0HQ/9JMe50pGAN?=
 =?us-ascii?Q?E5d76uMi8Fjs70oWqEWA+ywvus0jnDO6diCtbwES3GhtOIPl53EV+3uJX5iM?=
 =?us-ascii?Q?p/3a6ZFFSEOiD8kDN9YFOAeiW1TakZad/NHUxW1N8vcVty6U2QjIyJ/YZVLy?=
 =?us-ascii?Q?YTtnve23CbMHn7L5j9Jgb0nFgflcgVDq4d/p7Rl8eyAGPAd4knGpauemGub5?=
 =?us-ascii?Q?GkYPsOQAzjK16+0gTUjxqSePaWer4dpqAkFKRUDESVVEqQYz1fttyIqykqr3?=
 =?us-ascii?Q?S8Ed/AjzcEcrlRdllFgDHolgQsb5lRPmSyiDh/P75UxGZvCiQ3nVFhq25lL+?=
 =?us-ascii?Q?VAd53WlkAgjc/zxlVgsQwAdP1wfSPrNQcEYcCKgZ/r/wdeI0IPVr1G8MwHKx?=
 =?us-ascii?Q?34m5mt3oEMWCZWzxapu5yNwYRuaPcEgDCCwOTlOsgV2+oqF+mellGdy/QqGj?=
 =?us-ascii?Q?g/6gVPEhhCdkbY6oEgnlzfZysq1IrpXQsWTTlEIkiRiZ2lGDS9dKJhXg5AtW?=
 =?us-ascii?Q?HmeS52gJDguPUQUXSHCyzaDCgO4QKd9/YVc8Hj/sFKnFaCaMdaIvYBR3wpB6?=
 =?us-ascii?Q?+IFqpgXCb49dBMWC79D6moLE+8UYS8V95nJd9RW27Wo7dYB9LK03YX7GHraP?=
 =?us-ascii?Q?kKO4AaQJDEZYev2wlNKRwVJ3mwDeDcp3kpkMAdu7wfNaMzpK5+BrKE7MMtdT?=
 =?us-ascii?Q?/wDHCTkg/oTv26O7T/DaEGfkrsJ+V+XdEpdK57Jf4i3lmap4HLIoR7jNiWAA?=
 =?us-ascii?Q?gypXaW8cksxFwiohaDxqZY9NcMq4gEooFZRlnjNzH3Hxz3BKceQHebBn0Tuc?=
 =?us-ascii?Q?Pl4EMxBIojksiMHDGPAemteyfsmFwjtsXfudAvJsYuFXC5l3XG0g/v4cYMjR?=
 =?us-ascii?Q?TtkG68xUJsZlB5fB/2WS+XlqpnfJfgphwyYNtSZEZSy7h0gEv66l7w0kNhLO?=
 =?us-ascii?Q?VJP4gePAp2ILMGUhUfHgKrktds21Lj2N4qzQYTSP+exJ2HB89WpGZAQ0OB4F?=
 =?us-ascii?Q?hhx7FMWCKLg8LJSfv1tUa/xd+7+bs2PBb8CUyEo5K8DMICQ+HpQwJ19YQZyx?=
 =?us-ascii?Q?THWSMY3X1LCPSTHeXhFiFtypBdYbiFsgZz0iN143Pab0+v+BzhP1cXBvZI5K?=
 =?us-ascii?Q?MJI97vpdEEbc3Yd20POu3f/gLxio4FM1ScSRANbLCQo4Q0offT8uW8VIRoNx?=
 =?us-ascii?Q?nWZK55c+FnZ0NSK79nb9k2Oxr1Q51dY1BhaaKZJPj/dDO2AbGA3S/iaQUeS6?=
 =?us-ascii?Q?WbiR+M5OntEj/R9QKtBRFracVkcM1+xOUO1ydxyKFZQyLtXvDeScX/eQF3VN?=
 =?us-ascii?Q?tscAwlEETGzvrT6hF+GRWQdwgcFCsvcacIsAqV2zBLhGOvlPdmobWMwqgemE?=
 =?us-ascii?Q?amXB310/HgKdDpqkZdEoVM1G8ZvoWVdnG8yM3Myq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0818554-1663-42da-e328-08dba3f8ab50
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:42.8302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCwbE2gI1B0q/PluoH6JHHXyTpFGbiwZOa/ThF8rZPEAUvCFZhJUe0knlldPlD7s
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
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
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
2.41.0

