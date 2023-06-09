Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F086172A3F3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:00:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdBld5DpSz3fgY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:00:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ryCMDlaz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::610; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ryCMDlaz;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBfx1j1lz3dx8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkR1V20UQOdziiq6y9DNxr8c58PCLUIr8LyEJuWTRAvbKtveVU46UYDpOpwuldSX1Y1FUsoCc6APTDcRwUIaE2IsPYC6Qn2cHIVn1dRtcYDjo6VSfu1AVnZzGr7cOiJ38Wiq71Bz5QGs8381DDX8zUd9zRhFbcQXwtOg1lfddDGiqTGjWrJkbNnGfn2OTV9zPWmD2ggYyDk10RiweJfhvSrgwOzXoPQxwnVNQYUTMQfYC/agF/9wh/HU+KcCyf7ouzZzWaENr+4sNgN7w3XhdyRmcWqmgfJIrfP7d3h29T+VaSAMOH0OkK0e1xwsW7cQp7Wbs7htH5xP0LYXGu7i5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cE3gP3IT7L/AsvWvDwFn9+Dm0y7PEvGc1+Rm0rxcwBk=;
 b=YFAf6um2n+wHZvMzLMt1FIoyjrOqoaM24pN32Fonx745A6KiR5baWzNjJlacwuf7aFal1wkgY/nXuMKl4lKdcfPWKlYlwGXtkb3GRVs/BUxN78RMbiI/OBoVefvNMyHrMg4wGiNVs8EJtGlWLsyx/U3FUXt2j/Q/+sozrUJmbqR3hwQwqgjOG2d5T9qF937eZQZ/mmLqd1baX6/yKLJzumqTBBM7Q6piDClQrdTY2SduahpajJQGwFKMv5LzKneiw7Vb7dVU6sfcOD3dBOXHaix5OV1Z9gJvLbFmqLJiJp0QioCA71iUNfnGOSChTvjiBTfaBF71JfUgdKMCoTHWzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cE3gP3IT7L/AsvWvDwFn9+Dm0y7PEvGc1+Rm0rxcwBk=;
 b=ryCMDlazM2uydsdQ6DAEeBy3I++Q8v8og5pQi3FPFmDX8NCRfnIluwhHRosAWf06J7LoxlTmo4HxaQnYA5ezJF3S0/HsFJjT0urvgSY3+LAW4SgR2WY051qEXp0PC6AShIyM9pceKlr2gPyqwcRX1dSHsgBHhXeRDMtqyjARmncp47qoIu3NyKRm93o9YhAn+dXl78QWG87xp4DrytvPtyJhMomGdhvGoTBqyJQ6TznEat2pTFtbtKmcIaw5BEo0TBKy+IBnaXsTeCKOqpJkwddPkRi3Sv4BLSaI8wyICr429dvXD1VZhqpYvYrsPj3FhIyv5YoJa50rBMmvAf5MRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB5264.namprd12.prod.outlook.com (2603:10b6:5:39c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 19:56:20 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:20 +0000
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
Subject: [PATCH v3 08/25] iommu: Reorganize iommu_get_default_domain_type() to respect def_domain_type()
Date: Fri,  9 Jun 2023 16:55:56 -0300
Message-Id: <8-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0379.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::24) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: a2cbd145-fcf4-4658-eb60-08db692397ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	uT5any3+wMqRSCGC0wUyxSzF9Wk6Ee6Oo40WNvKOXaPR1BjuYyQewXSakWI/VsOK6SnuUEQ+mYkJIu5KKdLahuAc/GvVDEbqI83/LsFbwUmg4Do0+oaeCE+NSuzZHcUwBPR3FMq/BztsRmg2bSNRCNM/qY7/AzxZ4p5T1kGLmsP8hur5SdCkfItcIehHWjAK+1ISvedStTgp1iu/qkN0yixr1VTggH8MmbSRlwVjh5LzXF9QvYe6OlfzdW8NpHm9a0Nn2Z6POrJ3RT9o9I8yKu7zmTfZWLNb+VKTfPafaLTBx3KKxJxN1TIqeDx5h4KSmVVsjAwrxJ02qlX9wJ/R2QYK+Svq6s5U+R9uDb797qGgI34naoKlWkrvik1DplgeY48RNLpPcEQOOgwI+lPO2smVw4Qth0jCrJB9BvhSWjCZyx+40fn9pe55qi+o4g/JjDESWTAZQRED97vw5jXsoPHOI/NoZKNhrBZe6SAcqNUrB0yZs7Su70K7m3jWFrchgLK5bxhZdSzLkANv0lxdRXNVT2aLCo++PH3CzPkKv0DLjHiX1fNM8+n2525TmFcdH1BvvyOKguwAtfNxOrcbBg70TeR7HnTAxq0x3QnlZsXGFc57SFt0QOSmao4+Iubg
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(2906002)(83380400001)(36756003)(26005)(6512007)(6506007)(478600001)(54906003)(110136005)(107886003)(6486002)(6666004)(8936002)(7416002)(7406005)(5660300002)(2616005)(41300700001)(66946007)(66556008)(4326008)(66476007)(8676002)(186003)(316002)(38100700002)(921005)(86362001)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?23SIhOaz2rEK9hlb65fbuXpDg5QyNEkZpCOm3QBgmaK1LpJwpfjcb5K7MFHt?=
 =?us-ascii?Q?duvxnlCRz3J5nbPCKgYiAfnvqt1fkGASdHj5+ky+F7KJtGsfclCQP5VdIpYd?=
 =?us-ascii?Q?lU54w1OW/3QwXcZnOtpyL3tQpIB4FkP5LKjdu/f20Ai+oYIjhLx9yOceHEC6?=
 =?us-ascii?Q?FU0/5EGbzIQE+uO9Il7w9ooJqxCJwgu5HSex37ayvwhscmrSg0eUMs6nt48v?=
 =?us-ascii?Q?6mMQJCelaZOBQLv21tDBiPKgn04NWBOC1DaEs4Rew7cvL8TjC43ZNxRagyLy?=
 =?us-ascii?Q?i3cJcafY9hTpF6Dv7EVRT38Au+2ryiMn9uoeMXzWdMeIRqaVDld3UXpTACdm?=
 =?us-ascii?Q?K6unW5p7Zw5gW3mtALZ2Wzc+F0ox69ME13C9bLruX8KQEG1Wnsi14J0irD8p?=
 =?us-ascii?Q?BnWD7ydkCHOh3A98quTA+eKEQM8F27COLghEoBWEVdx2hUodumMZnJE0edGv?=
 =?us-ascii?Q?VJeTTFxysVEJMQdY9Kit8iTFz0I1aPYed7vZIDKounXAIcXBBuz5ylpy+OJ6?=
 =?us-ascii?Q?sBJQqiu2CNpd3SwucYV8fINPaEsocQ6WltFdawUOm6PtDIE0tdD2KbzvghGO?=
 =?us-ascii?Q?kvKur6/6nP0/zjIMBAfWhtwf5tHJp3ToYF8fdaohQu9e3pTL90+QLZixd/0W?=
 =?us-ascii?Q?o3qJzEES6FP0wdMdTdSVuMQ7ayUV+hG1NKRkC0vg7uiZrRkOPUKmSDTWoSKx?=
 =?us-ascii?Q?OAbvc3yamJgxvvlON4C+jRvn/1D/saL0LEVWr3+riJDx2C57WIniK8Wtde1p?=
 =?us-ascii?Q?7AnI+UHxqhjE5PHpKEYpnG0A6hcaz9+QKOCk3yKt5OWuqxBjuL1MN0Cax9fC?=
 =?us-ascii?Q?7HHqd2v9d86DxYsaGdugbmMP3iH5HnkRzVEnNyUYfY5tGWT8K2yWrxfCyiCE?=
 =?us-ascii?Q?bIaqvFYw6Vr//3QBWFlhcX9Pog532NKsXQmA4SfaY6BLkuCfGRbFe6XhSoZE?=
 =?us-ascii?Q?SddkmzNeYdBzcptbPxHfGklHODFcYxb0PK38EDdi7Im0TRwnjN9ojf+2HuVC?=
 =?us-ascii?Q?MQReHnALA2Z0+6vVu3wc6yHnSYNAaPiwHCofYL8LsSGINFcZwaFDG4ziJF8B?=
 =?us-ascii?Q?rLneMHMxr77X88XzFZNEcDTSTpKJiLRemouJEzx34YY7Q9TpmMnq0L4OdtIa?=
 =?us-ascii?Q?7HFuFj6Koe3Bnjbwjpe+4qGKnk+WZkDfOR8dEjyuSOSvpJiOQFDKjm/xwlkm?=
 =?us-ascii?Q?ddPWjdkzDANJs/52uFxZm37aJoGdOLPrd4/zONOtd87xV2LIu52aHHm6cTPU?=
 =?us-ascii?Q?e08heV6qCwD9hZOCiIzoK3Nr5cbedVRYGOYavSDSkk9SJt2UaaQYZhTit9gg?=
 =?us-ascii?Q?jWniKHb71+55baQF1NNtZxbsxpM1EMUaZeRY9JsW+oVyB6gmuppeUZ9gARb2?=
 =?us-ascii?Q?qmFtQZZRNQmcb78cUusik6WP7fjRF/Y3R7h8mqsp0YTIlVtr2uk2Be538BRh?=
 =?us-ascii?Q?AN4wVqunoxnbCOE7Di+6LYbo9PdNIK6wCi4elUtJwW1+LPsMiE8XieKWN3T6?=
 =?us-ascii?Q?HdWAfQA65kTFdY+UnAU+AR4nMObrtjp3iJ9gr6u6/007X4bXZ+9qZAEWqrjO?=
 =?us-ascii?Q?r2AC2faGCGntAhMQVxasUzOSGyV71egAKdiKP5KF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2cbd145-fcf4-4658-eb60-08db692397ad
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:19.4168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xcy0rF0QqIqud5ZhFQ0ypSJdflkNGBUGkd7St6/oImTRomO1o64R4cOBhkx912xC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5264
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
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 66 +++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index c8f6664767152d..0c4fc46c210366 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1608,19 +1608,6 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
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
@@ -1761,36 +1748,49 @@ static int iommu_bus_notifier(struct notifier_block *nb,
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
2.40.1

