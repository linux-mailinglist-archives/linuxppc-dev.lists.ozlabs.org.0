Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7CE73394B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:13:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gnXK83YM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTNG5ZrBz3cGS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:13:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gnXK83YM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::625; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT8C26n9z3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+/Iz6LndN0gvIg2Y4PmIx1r9zCl8cUq408vanmp+Hn0t1Z1JfckyWVfSCrRM2wKfzsCnJEbrHfwVHoQoWzPD6Kl7hmbSgI8Rt5pS3ssNRZyhrxaCAYHYxaFyew1U0LVSs2LqrUSoJSR52wiiwm9CvC84kWPpzkLlurrqiqtNLZdwrvxGiXVVUsmuk0iDNar4uc9GDHJL6GJa6KfhnKCEA/Lm8SqR9cBe4jk8o4yz/j3iDRYJV2jqFq5+oSJ++aUc/9XE6U3oVitXflVP3/KwSl+HnkFvywbLLOC372qURUupSBqkDQBqIVW1j/+Hu5GOd/1m9cCi9QlWPWX6jxeTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fv07ZTI6TWqMM56BZclxgR+qWcyKeH1gSmVtTipkoJE=;
 b=IkyqRaB3tysGKjrBWhlUe0wrI2aJniW9sPXM4EoW++YdpjpUs58F1cakDgiUbRBCiKoC8jxSDn6pOcYcBKyb9JG156k+dWUnnEqZ2gq4RzKf5qw4APHLoE+AQFDuUtpjLj/Xf5NFL2Lvnw1FlxBDeykI/xvPrlHJvjaUdG7gmJbX86wvWYnbWY4JUqFNoVQ10EfMSACi8cHu65pbA4d9jmdPpyK86mO8E6bSmUaHhAPAuAfKEzigd8wjO0asEsNYztzCEfx39/vMxVXzHm9GY+ltFkoa/C8gJBidQ6TVHUFkVs6Mn7rG3CpD7HQHz8j+UND+M6d5gUy3Q2HBdZVefg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fv07ZTI6TWqMM56BZclxgR+qWcyKeH1gSmVtTipkoJE=;
 b=gnXK83YM04q7/ZrspK6xN5mQY66SzPeArxCff7TwIg/dKUyr98JuQ56x10AoHtHu2AS/3kxLqUOd8PtM9GVN3ewGLaG/PgBGKYE5fYvJHs+6c/7l9J7STeKQMHF+OeRqA6DHpkL4gepFkIgsEjgfTU3hBPjlCB7+XV723tg92v76cQW+di4r4lEWwamXFGlxP0Cm7G5N5SdF8H/M6r9dnNb56ONJeYG3EpC7m37DqO7iJlsTWOMIQxsZy2m7X2PsvS+GWwqfZ2lVo15XAd3zdoPwxb/xYt+2khg2T93QEpWoXSbY424OjfqnHwynVf96zxV0aKWKJcZhTE5uJfQD7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 19:03:02 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:03:02 +0000
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
Subject: [PATCH v4 11/25] iommu/tegra-smmu: Implement an IDENTITY domain
Date: Fri, 16 Jun 2023 16:02:40 -0300
Message-Id: <11-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0062.namprd20.prod.outlook.com
 (2603:10b6:208:235::31) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b35a496-4181-439b-0d0c-08db6e9c4b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	S16JY5H491tGXdLawWVxwYFjukxfuwJLyoovRReN+lgbvg2hFRrNVxTjFlOb8IQKJ92Zoa21PIALDDlZH8MObjvwkjnn2J9nrfbbpJ5TAi//raWGZZtP5dzJ6MPFnCtYIZMJ1tJkJCZ5j4Krc7chWI/apAu6QM/PERHla7799U0NVMf2vn64TBHxMoTlh/6wYwK1OYIVyoItBHEc2Kd/XRDEUtjS89U+/TbRxA9lUbHHULJLU/NO/8V3qQpA57e5ugaEIe4+TxbD2nS6MqQXS1oyQpxu4ZQwRpd6ixyDW2/PqHXmDjHPusB/UpeqnOObgjcBx0LdNGUzd8s0TBH5+rS9FYDTp0Ir9Bi5GS0SrBQZTov+sSwUU7xN4eCT40Dp5EF4z9qa8iOhxKpGCFodlhmIO/9GMykMtGeHLaAstDTe+N2Cv+lXWea8vtyEMAU4yErdXOWeNEkW/U/4oEP/7gsGUASW/YVwd3z/GZlvxMk9Kf+8ssbppkF8w5jNQGfne/rfvKjTnvuubyy8hIsy0EQDB++RodQxCx/JQoJEi1IdbunlLi0JdWki/++qG+UBflzxqdkNLjy5itmKTTImuBWQB3cEUojqZ/wmVl9kj9U=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(921005)(38100700002)(8676002)(8936002)(5660300002)(107886003)(66556008)(316002)(478600001)(66476007)(66946007)(4326008)(6666004)(6486002)(186003)(7416002)(6506007)(54906003)(7406005)(110136005)(41300700001)(26005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?EtHvvILHIfUte7GgqzfIWALlyjAklnOgP9lIo/dN3PvcrWT4IM9kmgdRUd3q?=
 =?us-ascii?Q?LDPHeUWjl3WVGaOaRg188cwi8jM1pJ7nPKRS+Cx6uzk4xya0ZKOAFUFv4WLL?=
 =?us-ascii?Q?fmpZSxGUm/VnotyEncq3Ua0F4hI3bXQQk9YgFYPiFHuCoJBnt5nqFrzbf9oV?=
 =?us-ascii?Q?P62IQGfgXzCBiYu42WgyFShhdqprglenfDujGDV7oWyQ1nssNN+HCnWrglYC?=
 =?us-ascii?Q?gd9HLV0xYKUBWo0KiSR5Rr/wLksNpJaj2VXQrQ3vLYP+/c3ORq8aQVEezmQ2?=
 =?us-ascii?Q?1r2MEQQAOwzU6v/Ts0egiEtsRkD4dI486A3b4O4/wtN+ECovZfAgDasmYWB8?=
 =?us-ascii?Q?i1gGJy6AIPythOM4wd8jS4qK/lpf5Z0n6BMOLTCTf5TBEk4BgzWf/Y7DSc+s?=
 =?us-ascii?Q?eK1lunldT4rAD1rAATF5DuaQf+IihEfnEn6gtLwWNPjBZcgISxCi6x+wiKix?=
 =?us-ascii?Q?qB/I0PjXzE5Yir4cuy8kEvrYvE9j11ChCH/Rca92uPDNC4ZBPDnfhiNTQnys?=
 =?us-ascii?Q?4yZTFco3hoIdV4zk65xwoJ1rmg1bah/NuEH9nEMzenSDSnWgW4bACcrMrcIr?=
 =?us-ascii?Q?AZBAPPqbVPcbt9sxQ+axqfwj7vAihoraOiJrVMHrJ1+M+93xEI5l4no5lGfV?=
 =?us-ascii?Q?JEdNUUhGjfUIFlmo5CUrNxMJb6SRDnVYi/DxOfQh0LqxdX10zexhC0JSNGWC?=
 =?us-ascii?Q?vQG8tBVjMfOoH8qAACZfJzjdDb692V4x5Kmzt7c27CLeX/ADnD4YOoxTNWoP?=
 =?us-ascii?Q?X3RpCq7pjKP9RxM57UZDTk3NQhXB6IVViIEhz7ky0fmE3iBcrFxHgOYdIv4U?=
 =?us-ascii?Q?CHfDfu+0oUMbCDy7nHNaVemppEpoCeaSlj/zYqI7R0cy7t7bDrrr33jjuyVA?=
 =?us-ascii?Q?yJKfOQFF6YF3zVaOX6PJV9S7BPqg7cZiO128e5CYOD6G5M90KkUUT0w3cK6e?=
 =?us-ascii?Q?FtxSUEzu98/l6/Q9C2i2EetBzOgFsWiwICn2n2Y6ZhS6vM8erIKxM7hoFWDu?=
 =?us-ascii?Q?P4qAvcjE8ukCxipzFUESBK7g3iTA7qttzsTn3cWD9fEQ94BHsSILqwlgaTT+?=
 =?us-ascii?Q?xGMLf04K1gJBdOXyB7Lt+eYnJkJBcz4VYNYPANB5MCrhkxfWCM8H1U+ORW0d?=
 =?us-ascii?Q?fYIpZ1C6S13Pgqh/5MxQdylJaPIclPX7RUGMA216pVO4/4B+4fYin8Pk4roT?=
 =?us-ascii?Q?NaKAjNPGXZ0DH/T+9+CtcmfPUV8vYqjMr5vlbkqGRKExKTqNJCeLMvi+uaaU?=
 =?us-ascii?Q?q3muSEEW3rR6S9h1Cg9TD1yutfbkZFl2IN3S2EjVQ4Tg3FX/Op8K0e9PKauq?=
 =?us-ascii?Q?O1WcVxUbl+6oeYSVLrrCFbLzOQxzVfoAa80SRNHkH9ud+7BMUTl77sBGAT2e?=
 =?us-ascii?Q?Ip3BuMdkeQdf7ydW43tIaaZ79bL0prj7UX5tTUKFt6owe1Q4sP+l2BY1YlG5?=
 =?us-ascii?Q?vxBkD9jVmIqH0O77NL2cVebiLPWwBvzmNJOhjUlFezAE5WTi+TjtAq3S9/iY?=
 =?us-ascii?Q?nUY1iEPmVf1/oG5IUZZLanTbDl36Z+Btj9iHKFIh+kntO/E6GmX2YoXd+S5C?=
 =?us-ascii?Q?0bzLVIEjCy5ACGuafVIsbk3wM7Aw3CshQ6BxSRjY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b35a496-4181-439b-0d0c-08db6e9c4b64
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:56.3597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnrPyhNONpiLvOpeXVchz3YP0B5OZmfteUyOUn5TrqWy64QKzxA2zcKekWiVs6Kn
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

What tegra-smmu does during tegra_smmu_set_platform_dma() is actually
putting the iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 1cbf063ccf147a..f63f1d4f0bd10f 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -511,23 +511,39 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 	return err;
 }
 
-static void tegra_smmu_set_platform_dma(struct device *dev)
+static int tegra_smmu_identity_attach(struct iommu_domain *identity_domain,
+				      struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct tegra_smmu_as *as = to_smmu_as(domain);
-	struct tegra_smmu *smmu = as->smmu;
+	struct tegra_smmu_as *as;
+	struct tegra_smmu *smmu;
 	unsigned int index;
 
 	if (!fwspec)
-		return;
+		return -ENODEV;
 
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	as = to_smmu_as(domain);
+	smmu = as->smmu;
 	for (index = 0; index < fwspec->num_ids; index++) {
 		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
 		tegra_smmu_as_unprepare(smmu, as);
 	}
+	return 0;
 }
 
+static struct iommu_domain_ops tegra_smmu_identity_ops = {
+	.attach_dev = tegra_smmu_identity_attach,
+};
+
+static struct iommu_domain tegra_smmu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &tegra_smmu_identity_ops,
+};
+
 static void tegra_smmu_set_pde(struct tegra_smmu_as *as, unsigned long iova,
 			       u32 value)
 {
@@ -962,11 +978,22 @@ static int tegra_smmu_of_xlate(struct device *dev,
 	return iommu_fwspec_add_ids(dev, &id, 1);
 }
 
+static int tegra_smmu_def_domain_type(struct device *dev)
+{
+	/*
+	 * FIXME: For now we want to run all translation in IDENTITY mode, due
+	 * to some device quirks. Better would be to just quirk the troubled
+	 * devices.
+	 */
+	return IOMMU_DOMAIN_IDENTITY;
+}
+
 static const struct iommu_ops tegra_smmu_ops = {
+	.identity_domain = &tegra_smmu_identity_domain,
+	.def_domain_type = &tegra_smmu_def_domain_type,
 	.domain_alloc = tegra_smmu_domain_alloc,
 	.probe_device = tegra_smmu_probe_device,
 	.device_group = tegra_smmu_device_group,
-	.set_platform_dma_ops = tegra_smmu_set_platform_dma,
 	.of_xlate = tegra_smmu_of_xlate,
 	.pgsize_bitmap = SZ_4K,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.40.1

