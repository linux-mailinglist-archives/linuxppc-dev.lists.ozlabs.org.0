Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E5470421D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:13:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxXg2chnz3fYR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:13:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=q2pXZ4ON;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::60d; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=q2pXZ4ON;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxGz12JWz3f4Z
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJ2lU0GHlZGqnDrZ06uBjjhYjDs3GLOIyObgh2p2lJ1kWhW99/vQf4ZCdGOemzr95WM1zHrkRfiPIa/Nt7booYAAwKr6z3oVbpVlpyczmZIa4x9JL/YMGQpVmc6RIaHLd3JacfcmicXA3VuGwg6Gaq9tFvum7Z67xVoW2kdwB+kKjjt+fZpc7pgne+j7nV1/FyT0WYvFmqhn1kAmdcI193nmgoqLMP/dTkGNc/Bv+A8yAFT6VtvTO3xivwWHFxhq5Yk3mio1kri3YCPl8ztAEx/CfIhtowDhnPeaicHqRemJI045X+KKahDREyCaq3eMIGBkV/F7jetjplir3plQ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fUUt/fAI8ph2DHNlhM4gNIsfEv7BScpXS9Tps+iWPLY=;
 b=kmBOdBIUMETPZpRwJPp4BQ0GaDCLLT5UImh/CMpnqhe7/8dyqIyz9aEGz/KPMUKisD/3g6KVKMP77mf2VPj/VztoPsokOHwWMowDSUtBKz6HT0r3yPXBtD+E3EhNO+rcNQvbjYC/E1FqxzLEWakKoTzqXKdWUKjKSIDFf8yf3zzu1r8J/mUzrbz5VO94gaMIJPG/a72GgSnLYY3tA6h6Mcb5l9IkfpMK5pTDjCTbLI0IGEl9vYmG6o0yhY3wGclZYtGjQI02b4ENEpFnIXDuc3k8a06c0XvafVy0IU5G33EKg+kmNYsTMNTqnRGq65J/JoR3FymbRU35t4LlZjww9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUUt/fAI8ph2DHNlhM4gNIsfEv7BScpXS9Tps+iWPLY=;
 b=q2pXZ4ONjNEREfE43yINwiMaylILLLnS35cjFsiSd7AMYsxv+/zeIxcHVDlnP5xAwkIjdeqJgqVZrMLQWZ2cUgen4Ix82gJ+7Z+7GVZMfJFWg/NlBbwHKIaTQjWMX+8YCp32m8sytri8WFmNI1i1zBG2VaWMGiaVmKPMY8d6/AQb0BB2D1wVl51SZj3bB2CJCL89KSpDU6+BC1uzwTALezRV+L9Y35uMQuZFkSWq4VVtwM41/KBTswFwSuGoaOBol26J6p8AwN+1EfW1MkaQgHhLwAUqCElnpe9bR5WztvbBYrPamdfddLUhgPjxMlvrw5oHiZTQE/zeTEw0NO8wvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:09 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:09 +0000
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
Subject: [PATCH v2 12/25] iommu/tegra-smmu: Support DMA domains in tegra
Date: Mon, 15 May 2023 21:00:45 -0300
Message-Id: <12-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR17CA0030.namprd17.prod.outlook.com
 (2603:10b6:208:15e::43) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e68c4fc-6ce6-4c6c-46be-08db55a0a2fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	GQOfA5Nasb/REu2kwQl/12VpAYnFB3s8TmAoMQen6ZKwsKyKeipXObV+UmUcx6sczsCqY2rZUvHutJPso09QyvF8loMDFoSA9AkwkbSsbZbiHaclPs4uXPlY3DE3klmHRYoPGXj7WL0HNPtjplQxLCy6JcujrIjfoXtdvRF4xxgP/kFhgA+PR0xNI/1oTsVKqNRu0PqOu/Znl9LASPfwp1St5TRML/Yu5WBM7nIj0POIOpSbWNdOgKp2Kc68yx1ELonzuOan2jlx7SlGZ+hqjiEThr6zQ/8TAxG4BACaA8BDlIuoGRXRpMWRCG7VzHjmfrlf4sY6krMCWYgrGHVAifX3hDIXXIUGce1VXCN7fAUumASwFrmTjh2wjWV1oXUbMoZrNFsBnd8OBWARjUZL/mH9vaH+jPtultehzHmY385xLH0yZnYw60KVYyA+oJoGpe2bwGKH1wJzGio5K6/ocugdmJ0VXYTeEM/u95/9ej3rzJlWvFBOPVzIXICn+c4xSWIJ7x/4OlWM5v4HqDTJkIkSgGY5vdtTTupN3BTdonBVx9qd/pdRo8G/oz2IEZ07z4Kxs1cT0ynZ+2gfJGno6GKR+r/NFYkN9Np2NRwDOfA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(4326008)(41300700001)(316002)(2906002)(921005)(36756003)(38100700002)(6512007)(6506007)(26005)(6486002)(478600001)(107886003)(66556008)(66946007)(66476007)(2616005)(86362001)(5660300002)(8936002)(8676002)(110136005)(54906003)(7416002)(7406005)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?GGUzXNu4cyaLiLPFpnhuyugfbJPa6xwbOGrclczvdhUmERg1dOHmQ8C1sySz?=
 =?us-ascii?Q?u93MkOEb47zdN8ORHys9hNpeoPKH/o2eCRQaVZCbSi5NcN/1opJU8T8q6ECF?=
 =?us-ascii?Q?R4H8m0GoIyo/J4OjoIgVuG/1ZI7Ogi0tT3f1WDiZp/Mv2zh7vLC/+7wZ8gei?=
 =?us-ascii?Q?PcMTpDnKPN1JMiHf2PbUGkg92olKYCL0BM1iZMoTZliSp4AXycBX04gHJPXn?=
 =?us-ascii?Q?1BM4Vsr6OaEoFo7elme1flOn3kY0AGalRAMWOlMQXxXyjEFfLyWSszY4gexS?=
 =?us-ascii?Q?tS9bHZbnGpuLBN6Td4lxZamQuUT8Fi2dwq8ywfVCau2j9gl1q35MJB1eAp/4?=
 =?us-ascii?Q?RpqT9hJ2bM6+gSVzoPDO9axIpqpl66KBEfKk2eWBeiOkQHWeHXTWIt4ccots?=
 =?us-ascii?Q?ytGv5CNKk8ubdur4j/0/bXBaTucixEKhUbpoGIyDyk0ZDabN3v9CEX4UJPf7?=
 =?us-ascii?Q?3URFMZrtmOm0U70PzscQ831Y2N8rzPnaRyD47itYuc2OjyzDT2A33DXlEyEG?=
 =?us-ascii?Q?pw0hNuY4nKGWm1KGa3R9Ne6HoDwmi46YNvBB8v/hWsfSuT8EBUVyhlCUVvjF?=
 =?us-ascii?Q?LI0XHrQsal9w3O5pK36aK+a8Nothe+xgfL8oODM2ysyqLlzSltTlrt6lB3i8?=
 =?us-ascii?Q?jYc+EsQhGBHVwXHjwKFInHt8WOse7+4lc6hKr5+TArUMQUS6IDuT18fuyem9?=
 =?us-ascii?Q?rcmrMokTVrswwNjUj76m0f17N/Hy/KF6n61THFjTIwodJS0blAC8vbpA+R3B?=
 =?us-ascii?Q?3BBbeVUVcw921eqB72NWCagvjtw8YCC+HWn8XHeOFWiIuV4MmYm8WULlDItj?=
 =?us-ascii?Q?ZDSIy5GOl3c4ViyYdRL1rCC6Ye5P3bdfT6yeckRr7Kwtl2GEdGDnCcpDKtug?=
 =?us-ascii?Q?rD6R0X1yOdoUSzNzVtxDqng8129gzKhWtzrLYew7NCU56eyr3PhygHBS4ZxK?=
 =?us-ascii?Q?o/F0+UWatJgs8lCZ+t9o0lmDQxp+3l/gf99a3nieIoUM5xWzgjDCdqCVnW0O?=
 =?us-ascii?Q?eLxnHXZJWBNfnatXYmx7dpxByivGbIrc/YC4TqoKCQV051QIe42T2cMpNbw4?=
 =?us-ascii?Q?gZRdDlNi01bTXFocFZUDTMc6/G09KsSxXzNE+R8eMHctSQKsX0MpmYtWKrrE?=
 =?us-ascii?Q?phkk9XZQ3CxQpt5y2z35q6CQ1mNHe1uqOQ0J+zsUkBqHSw+zcrdGxpXLJYvu?=
 =?us-ascii?Q?gHRedXGji+qJYcscVdRngU74CnbWFsbKCVbd122p6tE+8ni6bxqLEWEgpkjX?=
 =?us-ascii?Q?FlSY9rI2baD2YxvQhxLUuaegzz+o7Vb79vDz5dpQLENjmFwM/oCG3Pivqfzn?=
 =?us-ascii?Q?3QcwPterjI+ZCP5FXKKtEU1fa31J0TmNI4QEt7DsABkHyIvVeFSRjG1ls9Vg?=
 =?us-ascii?Q?MviatJCUkCyQdyCml3ZWUL64w3y3W4lGB7QKHIYUT8YffyE9q9J77J3ug7Vt?=
 =?us-ascii?Q?cA2CzqJ2CEILKE+ckfkuJ60K/ckWIIM9Exr4b0SgAHh0S6vGRp94n0fsOv39?=
 =?us-ascii?Q?2NiYdCzwsQWaXzMddRSau1LvUr7FOMBhRSfNeTQg8uDS3uKPT2Jvj1cKcQX4?=
 =?us-ascii?Q?/Mb1P4U2FlBVB8m/Jsl2JIkmal1dP6XfR6EM/ZM/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e68c4fc-6ce6-4c6c-46be-08db55a0a2fa
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:02.2664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Wpc4MrkXIuj9BoB5AVVN0mo2OL0zvoGKyAmiIb8kLJ4fTXS3dwgysEY9/K5eUaT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6786
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
2.40.1

