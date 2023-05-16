Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA79704237
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:18:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxfp5d7cz3fkx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:18:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jYHRynqh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::629; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jYHRynqh;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxH242w2z3f7S
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvkEsuPF/NsVoD4FaVV0XE4inaIKiamAUWY5eSaRZUYD1PNUPSU0wCPtZxFWwOtsGknRc4F6jtLt9WBmjPaCQRGs/OCqZgHisIgTB/dXumJEJg2SWUvqoDRjOBcLfAUskB7NNw1x84U+CQv6YMzEj/pHUqjJCEiJvbeu1F+4VMDvw8Uorj1FsdmvoFbtR/i/zzGfgifZlqcmDJ5eZeYn9+mZaR/6zCdEg2MzmHxI3n4guIvXBv1KCBhlGHzOEfBKNgBKTjEnzDvTbBl+ryBw1CqwalS3K8Zp7a8fzkTu+ojaikj9mr0i4MqEtV4FfdGM5wMsgoAD8eR9De5ncKQJmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTyavZJIyqr4bzkZ78lJsHJ+7Og9ytKqwQ0syxXa+K4=;
 b=QX+Wp11LUD4JvJO3X4tgKXYLOPTFSQYkukr8SdLRCfozxrzbgmZ+rNmQ7QpwIg+14+AT9LHHT5dRzZho+UAXHMt7Mm0P6UZlEJgmOT09ooK5MsjlgIZZB1M8kyCG5WZsa5eRZmTK5HQmbFqdnyZe8io8aMBoBz/f7mZWgFxmgaaFFxIXV9Ts5B10MolAbDnCr3YjiJNJsP/iv6hr9IttIElu8t196+EoQIkHBdMcw0ZrBJBPV+j1YEHA8xUUXOyoH7fFIHo67QpSAXziVjux/OkwGPrpOjqRCI4+D1vZrxfqkRNau/zpSmkl5epewCzKSKCn+gpaITRYQ1MY9Hos6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTyavZJIyqr4bzkZ78lJsHJ+7Og9ytKqwQ0syxXa+K4=;
 b=jYHRynqhpFlfxa6Dyfhncpe7OAy1GeY65PLOa4BILMp9EnJ8uRADRsN1hJBykikB1YX8JYnQ0OMfPeTCG9M7llPB9x4JlHjrYFn4uesgx33BRkJGmN9a1AzUe8DEVjQAiPo3Z1E/ahNvpyOKHiteAWUUqmekMf/iQs2NuKTYarusbet8tcFHFQqR0IWTd9D9wr/00E3oXpNRtzM6WnuTWS43QEkPc1Bor488sPnwjjWu0jD159xzuXeWLQ3nk4n4Qk/re5+8S7zkNS4ObjNMiyNO80FxclctoL1HpSCUl3n01FfeA+ltE0GV+DWx6oaLMailnL9hzWqo7t1fvZ+ENg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:16 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:16 +0000
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
	Marek Szyprowski <m.szyprowski@samsung.com>,
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
Subject: [PATCH v2 13/25] iommu/omap: Implement an IDENTITY domain
Date: Mon, 15 May 2023 21:00:46 -0300
Message-Id: <13-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0056.namprd15.prod.outlook.com
 (2603:10b6:208:237::25) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b2d6626-160c-4eb3-f971-08db55a0a3b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	m+cagze6Cg0ZvJSkGPn+6Sv4O8CGyiXGCm9yGBVUOvSzk7wXnKK1Gn90bwdQf8N522vIa+NnGQZYNtHcFtiCZxqtdrCpIHZcktzmn9+ZfBZAkgUM31OTTtKaD5/Fjr1/17ZBb6K0qKvdQnJoLCxLEwnL8f8FnMj8Icj742q51vOC6qBrzIzAka1DF7vV8q8/84iGmD6yDIFhSGQ0oQsC+buxRcZEQcHucmKOgLRyrRnDLNMWeEDKI5SKF2OX5uN1V7X6fD81uE6v7yYYL/xDOlRY2hK01Qy+dnuiYF7b3bbU2R0IfuF5y3bXwQ69RYVSKdHE8iEaH5YulnpM09ECL62Hvs/hksEbEF2eiTBunmIu0T3D8nY7PPN+rAoBCAS8e8NymiHD3TDX3H3f5hfKIH8s3Wy3jdWeCnk70H8sed8Eefv9miI2Yr4ZLIjjj3ciNuHOXVd4zEuB6qFFiO8pwrmUI8xwTd181+HA7nCYn2dY1LlNy6QAFaRrPy+NazqE3RJQIluVMN1H62lbXO2hb+946NYSF4BLldZ3eqb+0RCqLVgcze6Cs6G0AenLh+V+mEwW2D94VJQt0WoqCiRUn98evwBSpfzw7CeDrDZ++XE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(36756003)(110136005)(54906003)(478600001)(38100700002)(41300700001)(7416002)(7406005)(8676002)(8936002)(5660300002)(2906002)(316002)(921005)(4326008)(66476007)(66946007)(66556008)(6506007)(6512007)(107886003)(86362001)(26005)(186003)(83380400001)(2616005)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?yVZaYS7E9MMWB3bBSpfen/6FXO8ZPXHr+8v9aqWLeha3ikMY5E/0H+qkGCEb?=
 =?us-ascii?Q?TXi1XCqMuXiqSEnLomeB2hTJsRR8pg7gj3tc8usBLb6ywDa7VCvbud3sCBL3?=
 =?us-ascii?Q?RX7XYluzBEuXTnhJPuiTb0sOaMoM6puMGHdTvxxfKUPopsvJ7vexudf/KsVo?=
 =?us-ascii?Q?me5k6IqZQN2hVuoZk1O575k2zH0CrSY4JA4cvV8AamaokyLtw/588LiAL3mI?=
 =?us-ascii?Q?i7mzQq/n3TZZlJgeH2VEzmwwNG64Nqfv5QpgOg2BCZiHzOXz+Uc+HxGe9l/Z?=
 =?us-ascii?Q?MMi1XdkScx9KaG3E8ZIIxzcbSCqs298MzyAWBT/yFnpzVd1XOvy76cCyQog1?=
 =?us-ascii?Q?/DzdBXjd7NI0ToVafAq650Hqtl3SGxSighcY/MuAZNAiYRJim+GjSPUEWBNn?=
 =?us-ascii?Q?DMhGWxQN0CXGQjQwVCx3YGE4Gk+TFk9C/XaTufvYoL6cb+DqzIH24t/KCrhi?=
 =?us-ascii?Q?JpSQGSTYk56CEL31cbY8YbrdEMoJWKpakx6/mtrW5px6MUV72iLdNRHDfOM7?=
 =?us-ascii?Q?9eRGf98ZilVz03lhDVMZfxpY57ukmBOyBWveHTopXSyRvc225O9h5CInnpI5?=
 =?us-ascii?Q?074iIDN3FjuBO8id/YW24dj1Vzb/kjWWt6fMUNQ9Rtme8/6W/nWUNvfffAJR?=
 =?us-ascii?Q?dPi3N2YHKhldzrPXU93RBOzwtt1scEAkYuAP8tNcDNgysPk/IFP6HNWhtQqA?=
 =?us-ascii?Q?O+GOl+Bhi3tRgwmfD+IEwFgXvJMQCcGZrO7jgry3FfJGxOkuYqYChhrUVD8V?=
 =?us-ascii?Q?O5l33TXduTKTsF7ibAhhhf1X+x7BQMajl+lpXs3f/2jokoJRXl/DYANDs8C4?=
 =?us-ascii?Q?afjQuNT7hRwzcG5lkha+4Zt0mqE7H9sIwocs9CnpYhbXYl8WDZtl8oPA42Tx?=
 =?us-ascii?Q?NprYCqcJjnB1os9HgQ0kFjYh4pn5a8PJAlXZYQMjD7wzY+e7Kn2JBHyu/IyN?=
 =?us-ascii?Q?B/K1BEg591JO2aG10XAfAZSArHh6Q/LL+D6604p/IG2RUfseekBX/AxLQi1v?=
 =?us-ascii?Q?9r9XPpYrX8jC4XVCVbEP9Z8nPzWFwM/9hd0NYuAB7F8x3imlvhjCuXOACiwd?=
 =?us-ascii?Q?Wu2SpxbrePFsMLDiyDN/Fy5Who0RrNSU3rcU/rIwaUgCwGijjCAEceEjwl6x?=
 =?us-ascii?Q?Jez/UPSLiBbSiJtDP3Fz0OyRtj67B3/hQk5j/TJZeVp/QX6UjtmG6D9Q7fY8?=
 =?us-ascii?Q?1Sk0JpleDKKCN2/gxy/SuGdDhZ/IW9vHkCKX9hindDS1nIuGFqsdca9mqSnf?=
 =?us-ascii?Q?tc57K59vQ6iP71ERnw0YMGXo8nCRJIA2phf3pInA2oesfv3fsaO1p1SMwhDI?=
 =?us-ascii?Q?1H4NzfaEHxZz03FS8nEseuMAB7n2h27VErjv7V5XJgVYQy+9SHNv7vg03jeh?=
 =?us-ascii?Q?Onuq0SQxe0/qS5/uDDwV+arV74xxk3enGo4w0wrWCvoUkBg0FkEWFHTSP5tX?=
 =?us-ascii?Q?ps0BjezDsohYMDkzH3ht/hW+kfHzUdwMeSYWxZsVEECDwF2gXzU/H5ScDZgF?=
 =?us-ascii?Q?kyqGf4oZcwzh9fJ5Hr9NQNKehOcCNiyqtfUTVAsSx7l9+W+sqg34KyaSTzNL?=
 =?us-ascii?Q?b0VA2D7TSVkyEpbDkpgsIc2BXsGTfE/RUtON5qQo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2d6626-160c-4eb3-f971-08db55a0a3b8
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:03.6060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eNedlfQJafiHl6+zyDYvNu8nxYgoDjSlLViUl7wgtFbWL9oyzfM9FuHTIymX0kae
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6634
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
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

What omap does during omap_iommu_set_platform_dma() is actually putting
the iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
compiled on ARM64 either. Most likely it is fine to support dma-iommu.c

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
2.40.1

