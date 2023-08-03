Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3500B76DC8A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:23:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MeIo1Z9d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGV1c0qZ8z3dLR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:23:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MeIo1Z9d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::61f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThp2mn0z3c1W
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLMjlBVc2o+1heVEzUQ/SoD+54U6HpXnc97NurzXgHO3xIBtro2FPy72xLHaEkMlsCSM0EsEO+yGue4CKyOxcU0F0pR0vk2DZxs91l/2KcOD7oQtegBDkDEEinzpZtNECyx/zEXKxjuH/cQsrGHHf9Mvjoq5TKSBwRHoOylecaR9jfLuv4XlBhTAg/ddL9zfXP2KQBKa+8AbiW/Z68Tg43Vb90H9VRWCo5aHIAIETwgraOnUkYkFkJu1l/RBJzYdZwyz9qdZhL7xZXhQr9s+JMI1UINYiG7AxxMbK/Wkzlgd/RUfKJ90raNz1/0GBdqIYy7Rhkk83R1u+fmemu6l4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/DHZV+QkYH14EZX/DKDDPvM+4tG5SMjo0AaHDfOmFc=;
 b=Xavk7qwkmeUu+GOcY2xoor5NgY0Grca7jfgM4nYFlh4eF7Os3fHioVITsp1v6+XVF3V2lbR61L1nSS/ziX1CdYJnPNVTutaPtVFYC560piP0AIN05KYc0nI2MrK5EbIbVfyME5I6ZTxc61gEhjeMm9l4aizqLwwRRiqPFDKPZeS3MaDhw3a38s/1KTxHw8S5hYGQBp5KvDeIDk1FHTAtKUvH0mFmoeaV0wZVKr3jduIlgDX5y6tRxMOj1VVV0JK5sxpuodtqUE9hS3qeHJ2ayCXvogsa5NLeurt4jcA8PWoY6oQUM22fubw5gXP7E96iqDkhAKg7edqvmJQ2ESuwvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/DHZV+QkYH14EZX/DKDDPvM+4tG5SMjo0AaHDfOmFc=;
 b=MeIo1Z9dVM7L6AFeQDR6BRMfRaamE6EG9eQNpPf4maqt1kKu4CmrE5tudwW5DHN6n/idyyWbCHFDa4rCBQ/BxQF1z4Dkuh1smS6JBpEhInDChzlW2yMY1+SiYCp03CTBGwrPc0y+FnVvcYlLnIqG7c1JdkLobL6OEXFntEKxMnEP2isKejeCkR5ijDBmvKmEd0wQBDt+HYDeD6EbfUC5EbEwKaxMxhccF3EE8aPHNPzKjme/ym6OBtDmBsp8NWeikvA8AXe5Kq5RebaG36okkB4Vpua0WiA/MsuU3wu3xBI2B3/ZYkqv9laf/ePKUGFzuArIcGQmV0YB0C7gL0iGJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:08:21 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:21 +0000
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
Subject: [PATCH v6 08/25] iommu: Reorganize iommu_get_default_domain_type() to respect def_domain_type()
Date: Wed,  2 Aug 2023 21:07:55 -0300
Message-ID: <8-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0128.namprd03.prod.outlook.com
 (2603:10b6:208:32e::13) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cbe9e7a-6647-474f-84b2-08db93b5bc4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	cqBW0d97T+9BChQvk36dvaeeml5s6usLtfRH0tIaf6O2QzryEHUbbY1b3LdTBtsXlij2EoMdHFZIcI8d6+ePYyAZtsc+tlE0Fwu+swjMBJu0R7SMHzCly4NaVfpHsECi9WsqYBQ/qoPZU4HvQzcmFy3/+PMUsINyvckS7HsNkuK202BQBlIRpDLn9jeABNbABcyQ5eCQezAu1m/c1yruAa1i9DPwhpDSf5W1phifG7Qv4EEXUi0J/hHvSeNnam7iwM61B5MuIfX30JcBUyy3ibNjb7VT1hgV2xTsUCG5aoWLe6kPNid3bpJRlvtjwaJ89g9SH2cg6qO9XcAqTgof5e0NOmiDXh9I2HtEpNA92M5Wffe7BPHNHeUXkC9GsZmxQBgyH/S1qfKZQGb8nF+Y2IAwFZH+0QJLMPzCuVlh3ga615MjX9KotSOVLV8xJwFq2h6iq/cRW2gLrPa0o2FQWiA70lUX4QP/pq8seOxthfgH7NsrAMZ65H4q47IA9PnsIBOIlbIlVDo2dbUz7B/calxLmBQn41DdPiekkn9ATl4hlRNAhY58ClOmf7Ewi41MJYYzMnAyw4noHD7gvne/gN8uPUAYm9pBIFANWCk+HZplR+XYT2wCjtsUCcp5Rbp2
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(110136005)(6512007)(54906003)(6486002)(6666004)(921005)(478600001)(38100700002)(41300700001)(5660300002)(316002)(66476007)(66946007)(8676002)(4326008)(8936002)(66556008)(2616005)(83380400001)(7406005)(26005)(107886003)(186003)(6506007)(7416002)(86362001)(36756003)(2906002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?7scw/Iy5nj5d85WkijeTXBkbwuSBpcsTnNpTI4ApJqSitUpufLfEP6G285Tp?=
 =?us-ascii?Q?9gSCSS3gS+rMRezJojsCkl4wT4PSLbNWu+YXnTY8JpD3+mzWRXfF7r6jUfck?=
 =?us-ascii?Q?scQlxOvkaETSPeptDfB4DH7nC9NSdfbHpg6raiSbg8Kmq3Wwz3PbOriZsZmR?=
 =?us-ascii?Q?nLHSpcf2mx+g5p4zUY7yj06HpvGrqrnmm/JFz1E9eQiHbKEqGwse49rceo5l?=
 =?us-ascii?Q?4lQ7PRcDdLxic6FZ+fsPZrCG7Q91B0qVQzlQVwgFU6TznZ+aPShzq/g5f5TL?=
 =?us-ascii?Q?VY++Kptw00Hs3LE10CCVgAb4DfxIGz5Bhsuq12RNSJFJU2P/DMuSd8oGu099?=
 =?us-ascii?Q?PIQTRN1TE8mrHF+Btp0R7LAMhL/9RS7uE0iGR4bZHhQP05lXGYMWjR3EB0St?=
 =?us-ascii?Q?F8yI7o95nF+TVjNkkaHLEnPGKhE9kCxlyvI3e5eAUdSF8mPMC3R27lz0xtsq?=
 =?us-ascii?Q?LA1tbB/JFIAKybc9ZCb88aGmbuoTLMQEvnDZRVJp1P/KHOsWVWyTSN38agik?=
 =?us-ascii?Q?8t5I1c0nCUU1ZJ80g0xxFyDryRqRv3Sz5ci2GvC4z+J0SSCAvq2BWOxohA92?=
 =?us-ascii?Q?18Kb88IKPugyvvOFefNBFm+6apcl16dj/tdfrlmzP8iZ5fQR7QVdLS3YYxUz?=
 =?us-ascii?Q?327BwZ3+m2OD2MkYwxLJYPSXEeaFlGLup0HFL1R+vG5UjsQojrcqPZKD2Zir?=
 =?us-ascii?Q?+VnH8OIm/WnCysghoyLf1GOB364J7O3yDwJKdUId0m68c+ooaA0taP2nTyb2?=
 =?us-ascii?Q?hRKgqZ06cIKchn3gfvY68D4RM2Tghp4eC1EAI2nKD5U/w5t/ZC8qsAmn1UEZ?=
 =?us-ascii?Q?Zn/qM1fAEMsPH9TtZRYNgV0a+KLkX34apkLVItGne/NkRuBApdTgq6wA0mom?=
 =?us-ascii?Q?1anz+mfYfXPLLIOAYyazUHZyMOx7Ojb5nqmq+616eMd/muuQ96dbVSztLN51?=
 =?us-ascii?Q?a0XsdeA8zPTFsUJDUSJmURYk90mlnE+XuI9oR76P5G/PhMx/33nIKI24S2IX?=
 =?us-ascii?Q?S4QL1wqvDHfkHACkJVvYmWCuGeK1NwTNDR4MHC5Ti1wy6sX57fokukJRkTyX?=
 =?us-ascii?Q?qDqqwB7Yd2p1hxSXvNRoGmMszhoj+A2iEdyTe1BtKeQ0WPy2K2tHNvdVvGEU?=
 =?us-ascii?Q?n4TKuEJxf4EJYmz3tbuiCO0dLqK7JHJT4n7ilT7kbBsnRnZKNQQS/jncttLU?=
 =?us-ascii?Q?VO/J2NB2VFq0i02Lvrshx6DVSGBqY4OBne5fFkJ5Ni+WgH+TCVijeHEJxykT?=
 =?us-ascii?Q?tS6+i/x0y59ju3ufQM+vhW4deL4MPyPASI6WkLMmLQiEIEwhFZO9Gv8lxQ2X?=
 =?us-ascii?Q?Ya4Vwp2tM/uQ0BQTQoNqy5QLkkbz6Q9fJAvEOLRHbFOfVewrD0O+czA+9tEg?=
 =?us-ascii?Q?ujL7inTteQLcmyHOp13wi9Nvac6SsSDJY9FShnouN8f3b6xUxHNGAqQB9Oqb?=
 =?us-ascii?Q?s6LZF1SSX8W4lNx5NqTDxyk026RHaQ0JXl4/YcYO1UJY3Pmu9sJfsjhPUCaQ?=
 =?us-ascii?Q?rP4lVnqMfgx9YV5rGnICtusG5x9enF5NFbVfnfJhTYtrigE47y3Pkyosb6xh?=
 =?us-ascii?Q?b/h0K2HrDP8LlEiKgassfbIwEVwjlKb0kwNA2iY3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbe9e7a-6647-474f-84b2-08db93b5bc4f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:16.3858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lgnlGrO0FrOT2P5k6j7nR5vB/sh14ozFAgxD6wVH5neE9VDkCQgpeemRm/OA1ly0
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

Except for dart every driver returns 0 or IDENTITY from def_domain_type().

The drivers that return IDENTITY have some kind of good reason, typically
that quirky hardware really can't support anything other than IDENTITY.

Arrange things so that if the driver says it needs IDENTITY then
iommu_get_default_domain_type() either fails or returns IDENTITY.  It will
never reject the driver's override to IDENTITY.

The only real functional difference is that the PCI untrusted flag is now
ignored for quirky HW instead of overriding the IOMMU driver.

This makes the next patch cleaner that wants to force IDENTITY always for
ARM_IOMMU because there is no support for DMA.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 66 +++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index c64365169b678d..53174179102d17 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1669,19 +1669,6 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(fsl_mc_device_group);
 
-static int iommu_get_def_domain_type(struct device *dev)
-{
-	const struct iommu_ops *ops = dev_iommu_ops(dev);
-
-	if (dev_is_pci(dev) && to_pci_dev(dev)->untrusted)
-		return IOMMU_DOMAIN_DMA;
-
-	if (ops->def_domain_type)
-		return ops->def_domain_type(dev);
-
-	return 0;
-}
-
 static struct iommu_domain *
 __iommu_group_alloc_default_domain(const struct bus_type *bus,
 				   struct iommu_group *group, int req_type)
@@ -1775,36 +1762,49 @@ static int iommu_bus_notifier(struct notifier_block *nb,
 static int iommu_get_default_domain_type(struct iommu_group *group,
 					 int target_type)
 {
+	const struct iommu_ops *ops = dev_iommu_ops(
+		list_first_entry(&group->devices, struct group_device, list)
+			->dev);
 	int best_type = target_type;
 	struct group_device *gdev;
 	struct device *last_dev;
+	int type;
 
 	lockdep_assert_held(&group->mutex);
-
 	for_each_group_device(group, gdev) {
-		unsigned int type = iommu_get_def_domain_type(gdev->dev);
-
-		if (best_type && type && best_type != type) {
-			if (target_type) {
-				dev_err_ratelimited(
-					gdev->dev,
-					"Device cannot be in %s domain\n",
-					iommu_domain_type_str(target_type));
-				return -1;
-			}
-
-			dev_warn(
-				gdev->dev,
-				"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
-				iommu_domain_type_str(type), dev_name(last_dev),
-				iommu_domain_type_str(best_type));
-			return 0;
+		type = best_type;
+		if (ops->def_domain_type) {
+			type = ops->def_domain_type(gdev->dev);
+			if (best_type && type && best_type != type)
+				goto err;
 		}
-		if (!best_type)
-			best_type = type;
+
+		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
+			type = IOMMU_DOMAIN_DMA;
+			if (best_type && type && best_type != type)
+				goto err;
+		}
+		best_type = type;
 		last_dev = gdev->dev;
 	}
 	return best_type;
+
+err:
+	if (target_type) {
+		dev_err_ratelimited(
+			gdev->dev,
+			"Device cannot be in %s domain - it is forcing %s\n",
+			iommu_domain_type_str(target_type),
+			iommu_domain_type_str(type));
+		return -1;
+	}
+
+	dev_warn(
+		gdev->dev,
+		"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
+		iommu_domain_type_str(type), dev_name(last_dev),
+		iommu_domain_type_str(best_type));
+	return 0;
 }
 
 static void iommu_group_do_probe_finalize(struct device *dev)
-- 
2.41.0

