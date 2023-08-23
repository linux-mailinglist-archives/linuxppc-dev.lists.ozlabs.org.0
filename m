Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC8D785DEF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 18:55:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RPa4kVUv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWC5Q1L9fz3dW0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 02:55:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RPa4kVUv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::619; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwk2542z3c2L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WF/42T30B/k7wJJLsd8VHYD+5AAkLC2VdXzRrmYB6tSvxUi5UrFfViTjtVfKiYGzVPvHHhgyTK0vEbBzPB1lJGyaUYjLGhxom2ZSIE2x96tTjTpfZTLlpUIinARc+qfj2WyYJ/LsW1fIzTEPkvxpDiZW/j1ie4y6r1oyVbu1lCcg5/BNwciXhxofp1nlQvTf9fM9YtSlRqA5LZGt5ee6VaAI2YzyYa8C2GdOt69DrhUQbrBoFLno3l4SxvPzeAdFj+l98GcHVatK9G6TaOMYzdvc6+PNen1qh2WSVLDInBhCndbjFrcRUEihKQspK0+5Dxt4VSt4A/ZNczEIlh8muw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lp2lrjG+gcZBwKaZgi1PgSHcf1FuE9WHhgax0sHibO8=;
 b=DeDIvnPAzD9hWKqOA+b/yxNpswsQ60P8cXtLrs9FvEu++WyfY0ECQYD65CmYokh61iRWIj/2o3ZewFl6GiFerR8zKts+q4z91O1cY50XL5SBs1nmfXZm3ShEiB8y6a65E+aFMhBrHTyCxb1wSIBMpZ4MVHthtJrwUDy16a4nRuZpb9Sj4Qu+nfTOQ+3saDQzxhYr+w2GR95eE/CqzCFZPhbIQa9u5huWS9TxivzQcKIj0af9mlR3U8EgpZ5HTvYasWEPqHHIUVroKOR5k2a8FzGJjXA2q9MzMsLMCE4qOJUPFX0vNlfXuw9SapNPM1AhBNJdmsqdx5pFW2d6zuY2aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lp2lrjG+gcZBwKaZgi1PgSHcf1FuE9WHhgax0sHibO8=;
 b=RPa4kVUvJArbZ6PLoJruVTtB7aqCW3sFWfqufJQO4W6SIIe3IwTUDborDRfWJ9dqoZCxRXTwa5BjqMtcfzYbGJjSbI48VYi5lsNInv4Fc8GRjtn/YZntp5O4c0JWntd02NUJqtzmfLogbQ9C0GWDet2ufHBja0V5dWO7BO+pJ92GZ2pSCQy6mvx2FbsKb4KdoZLWj67L+kQkZ5cvMwtWOU2gIE4/mzTRYz8Jlh/ctGdroYnL0tLg0BTKRJjQ1AQp0oBjMRscGyKiUIzWg0jWgA0aXalFGJXpcVwA4DN9PP2O8ZL5De1LQPNEeTfA6UVhJkAF7Wl6TRqSPe/g9tnStA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:49 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:49 +0000
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
Subject: [PATCH v7 13/24] iommu/omap: Implement an IDENTITY domain
Date: Wed, 23 Aug 2023 13:47:27 -0300
Message-ID: <13-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0393.namprd03.prod.outlook.com
 (2603:10b6:610:11b::21) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: f2b64f42-3da2-45c0-6634-08dba3f8ab98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VXrszHdGdMjb9IswWKxVkIrNXTYr/KKAKKdC04ZX9TMDm2mGDSEjQbQzJnVDk8CHVOZWbhjI8MyRP4ocU4CoON3NQqBWvnnVEgSflHKexTdbYfTvz4WBpePx4Vu7eUx6wR5vdNM95RYpkpuAsBrvlGrYGdZoQ4AWNwdAvnckJNZMJ1hlm/sbDGKeobwt5BaRVdfW7bKhjlLunwtpoEpdiJF1u/fSdQqgr9w48CDzdvO8uvgHLwg5fqtmkNoSPDfsTqASOSxqQ6otj2/wyR/xiKBN5Tx4PMHSj1pQgcIknZ3ZrAw3CrLrEcx1shyUcAfhd1KQpKS5OR3dKDsjvO102opGvPQOPu2NRmBFG09pxJz9C+P/aVXrnDLb2GmZBe2QtdCCajosmmPwqJkmG+yoUGsr4uySHPeciy8yQ/pMJt+54ZlQaZe7ujUzz8ahI4Q2ZqYgqScF6M6hIgedjGph9etp1ZCWNhy5vUAmhfrNMRhwLaAuyGtinKz/iIy3LW2n17hGM4XrGyvZKHWzDkSZ1l30AmlQ+J3297e6eFw5FC5Lo6OSYG9ysvM1e5ZV3IxL7wkbcydyljH8pgT7hfxFuCn5Bmuv17qYOxi20FVbCNs=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?PhBoaz1HzP+7zqOwDM8SXLjZx7jraRURUEuZ0AnYALFpSTz6MneAhkdXFGsH?=
 =?us-ascii?Q?SDqWO9a1guYPC7Qm/TWfLZobpJp8eXI/rywy6WZOlLuJSS3RupdQf9jmeguE?=
 =?us-ascii?Q?m8ium/ctUcPKYu0LXtL8VM+GIM48w5d7gDWTTWWTEbWqtokhRnvijAbkaP25?=
 =?us-ascii?Q?+zg8VHZWPB8h0gszvlIt+uEQL4rWErX4jk3TPx+8Q3J/x7SXO/qeT5zOS4PL?=
 =?us-ascii?Q?9Tn1kXkURfId7JKv+cblk4wXaXR5iQ5mG8f0TPf23nGOKMy/Qp1U/w0v/WH5?=
 =?us-ascii?Q?ElBN1kx/u7Qx1x9w8ICtk3oD7fq5zWukZYX4nVO96N29cU9Ji79S9snAJGJN?=
 =?us-ascii?Q?/0II3pW1n3axd+cRB9jDX8uV7zNqfR2GaTUjOwU73di13Hl/NBQUG95UOKA7?=
 =?us-ascii?Q?7sQjcFXubjDVk1KTp6R1DIeen5Qj6DQE7OBh/zA1arvRbXQITTQ7kdQHhWP/?=
 =?us-ascii?Q?A4XHGQUDhn2z8OAMiMPVtEXBdQPE2ABWdpUmt0G2/V/iguDauu1Hk+0d73Bd?=
 =?us-ascii?Q?7ggyPjk37MScQK2Rt8AX4HqAx0EgcxL325jtAcGuAsi2w934IeNJO7a/C4u9?=
 =?us-ascii?Q?+j410C7I4/OlFaVRBdZa62W4o93uUs+ShEtkmh592Mz0NLOJ+f6l39HRnfxg?=
 =?us-ascii?Q?pTBsP/LYamQl5xLHOTbPO16gRiUqMJKqC+Gm3zGXL0KMT0nl0hYMTizSMXvb?=
 =?us-ascii?Q?WnwgWFKZyMMQPLAtEfFGnhw+H1r2KPCy0zR3Hy0Ttvxq+K6cEcICQxqA/sXu?=
 =?us-ascii?Q?khlgafs05PnkrgLenoNFjmF38qzxZy42ILSTUjPMjwMULeM0ze5fExLTuOAR?=
 =?us-ascii?Q?0ma6d4OE2ciCMyP+acgutoFXfMA10NsU3Naj1JD+2OtkRbo+GL986275lbtM?=
 =?us-ascii?Q?fpjhHdjn+9Wjd1PXdFl82joTXp/OUWcQYXG0ohmtkQWTUjX2z8Mrt1CktjXu?=
 =?us-ascii?Q?cEJ8t+TeNGrNZI95tjSwka67PcSeCNK6bEEZ9I45ZJqkRWvyNvm0F1JZ7v9i?=
 =?us-ascii?Q?3POZHvQz0jMVNZYBxwTRY/UHcRtOht3AqzwF+XynMheFa5Lkv1I191eSFrcO?=
 =?us-ascii?Q?c3TfwjXVhs+7Inu0DUzZmFnvHfc5/2NOrlhcr2mvwt+j/a5zIXp8g5fvcnT/?=
 =?us-ascii?Q?p/3lPT0wGXcsnizoQ/l1RWjHbc75TJXQct2p8cewh67/9IQdJPNmX/9cF7qm?=
 =?us-ascii?Q?0TXl/3f5Dvz4IysYQX1NmDlCagx+95v5HKqszu/ZKJl5LmkRoePoraRpNrH3?=
 =?us-ascii?Q?FmNyvzS+Hg22DsjmUP4A2m2cF4reXFB182g3b5x9pSKorjS3gGI2HuEpkxfe?=
 =?us-ascii?Q?J1WWYS5Rtfu3CBu7WpEtGnVXvVP8tXEKWiP0JR3se6zvKuRsm+rcfujR3/qx?=
 =?us-ascii?Q?PYD91Z89WC9VIUJYFZh0YZzf4yWP0QdLNNLaGE+w7wJz9QKi6Y3SC6k0AtVb?=
 =?us-ascii?Q?aus0kxalJtXgps4RtVXsWUf6CAxO6yBFdmqjmVJ5S+Wk7+QknPMV6QxD6PQb?=
 =?us-ascii?Q?F1kJHEVCUWQQP5XamCD3NOiNP4bRIYKnepHUfZru3sRfBL6fClRYpqjwTRfA?=
 =?us-ascii?Q?DN0e2Y6fM5Lf5dDHavxI6G8kwntre9epwQqIjuAn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b64f42-3da2-45c0-6634-08dba3f8ab98
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:43.2257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ENBC/d1FpZw0JjSvUolFd8Fc+obA4aKed5PT3EJHS2vuyGzabTkkpJ+J8YgxVnU
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

What omap does during omap_iommu_set_platform_dma() is actually putting
the iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
compiled on ARM64 either. Most likely it is fine to support dma-iommu.c

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/omap-iommu.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 537e402f9bba97..34340ef15241bc 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1555,16 +1555,31 @@ static void _omap_iommu_detach_dev(struct omap_iommu_domain *omap_domain,
 	omap_domain->dev = NULL;
 }
 
-static void omap_iommu_set_platform_dma(struct device *dev)
+static int omap_iommu_identity_attach(struct iommu_domain *identity_domain,
+				      struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct omap_iommu_domain *omap_domain = to_omap_domain(domain);
+	struct omap_iommu_domain *omap_domain;
 
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	omap_domain = to_omap_domain(domain);
 	spin_lock(&omap_domain->lock);
 	_omap_iommu_detach_dev(omap_domain, dev);
 	spin_unlock(&omap_domain->lock);
+	return 0;
 }
 
+static struct iommu_domain_ops omap_iommu_identity_ops = {
+	.attach_dev = omap_iommu_identity_attach,
+};
+
+static struct iommu_domain omap_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &omap_iommu_identity_ops,
+};
+
 static struct iommu_domain *omap_iommu_domain_alloc(unsigned type)
 {
 	struct omap_iommu_domain *omap_domain;
@@ -1732,11 +1747,11 @@ static struct iommu_group *omap_iommu_device_group(struct device *dev)
 }
 
 static const struct iommu_ops omap_iommu_ops = {
+	.identity_domain = &omap_iommu_identity_domain,
 	.domain_alloc	= omap_iommu_domain_alloc,
 	.probe_device	= omap_iommu_probe_device,
 	.release_device	= omap_iommu_release_device,
 	.device_group	= omap_iommu_device_group,
-	.set_platform_dma_ops = omap_iommu_set_platform_dma,
 	.pgsize_bitmap	= OMAP_IOMMU_PGSIZES,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= omap_iommu_attach_dev,
-- 
2.41.0

