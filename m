Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F7276DC73
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:15:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IpNWsbFL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGTrV36PXz3ckc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:15:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IpNWsbFL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::61f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThl1xw0z2yjD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSLQm0O9tiDjsaPKEfB5NsgJDv4Jjb72wRq5XulX/x4VeLThARSLGD49izC1sAFwpNcZ91W/qNo2Vqa3emEuoU8n8klF7i+S/gTnG34/aNrccZ8L0xfH33p9VVrMMu1w3hxeWrMMtAco86iQ8M5aSXbjRT7tHXYweJTMY6mDuloO1mishuy7ZZKmh7xJ+jLNa7sfTclAGvZ2uw3C3qNN9D0mWK/2kYm0hk09FrfKv3laNr7oXCL8IuSVgwS0SqP9V3w6e0ssvMr8nAQ98lfoNdytWjnL4LDkC20OUunaPnqFNFyBFMa4gPyUMbMhNay7lzWk51sIiKwFwBw98ml6vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dijjnmcTwEIG43n1u0a4rcB854nzj8vKoYIf9eO0DwA=;
 b=aI6CjzoyMe/VqT8Hm+XrGGSPjcu/V6kvb93JPEY/Yb/jfMCFSYZY9s/++aHtPupQjyX08gHN23tNE3XYYOAeyZB54D7/mvnvc82aK+soTm9WDcogkkjXb4/JCHiJFrNiGu7mt/8cgdvhym84FklEabN9IPGxRXGEppcmuMXaxJtpRY+NhqYyRTXzbdmgNK6G7P5V4aTAb/2O15cUHx8xLF26vyxjJLWGHlgTJHUr6Bt6W6A5DQx4OdjQ3pCWL/MnyW5cBGa261qrr6+vLH5LBdTw9whKHoNQ/ltGLwgxouMvsI3DIW+Hs+2x62TUVe+2hKhJTwSoYIva0pu7APhgug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dijjnmcTwEIG43n1u0a4rcB854nzj8vKoYIf9eO0DwA=;
 b=IpNWsbFLwT3iE2BuWL7CeJ1t36J/k1T470jqgcVTtewAGnBovWK8UB6h7ksm2W498AGDbaq7E2p3bJrrHHHa3uikNPTUdl+Lq1fNMpFlYJaNfMXLuNjEDrLimNfEhqvvGVHZFix9b8pVmocr1LJrirtsoJCLxNqMlwZ0e1xP3+3xgf9mHodS8CDeRNWkgiHcCb/Av98wwwOSrYUyH89jCQ1iuBxQXHuPcL9YnaMrgiNeen4DFyaKoKcpPBkubVrMxuPolDqsX3efUfW/IYeBlv39ZOLIOHlM7cQggGDjCnfTnKHDjq/d64262xOKGovl2yipRHmB3BedgV4Bqo3GKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:08:17 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:17 +0000
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
Subject: [PATCH v6 07/25] iommu/mtk_iommu_v1: Implement an IDENTITY domain
Date: Wed,  2 Aug 2023 21:07:54 -0300
Message-ID: <7-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0138.namprd03.prod.outlook.com
 (2603:10b6:208:32e::23) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b1ba6b-2722-4a3e-33e9-08db93b5bb74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bwbp1uribbGDBzANtO+GmqWXt84LaEU0PUZHZ1kSuYhxFJDpi3sqODop8qsstm+6yD5UyJ6Cz/V477HAp6O3HQhlPDJIEKPSCleadnTW3GGdFxkk1tzoZzenn4gzDlGLDpzRPppILhudR3SVwA8FZpemvAh2+89/cd+4PGV1lm1jQdtub0iK0+HtIr10fc0WV9sz/iVb+nlnPd7MLQSns3lKsqk8aGsZoy2DiCibmu75zXI8zROMPZjyz63/7cV0k8DfdRVj97/CamzpWC+T1O1PW00db+rdK/RyXymTmvvJwqirn1EOMq7F70A2CFDTGnw3DpYbDDiO22Gcfpaj3XDb+C9D9+A3uIetYfuLVTR4dkfCYt88QCk67o/sExpEoSrxCSejYrI4jsHluCDoEIwz5ygNSitphy4caRHLbwypNU5ZWcq9CvOr3qW46fx4XCLy+IlDairTS2xw9o7S1dnXj9jO4nXVg86wkVoP9tqlpk5waNl0PLIIm4b8kjPfC4uLLB7DegTA1VAgZ6z4lk7gPzhQTNYNkhRWB6GCCa9AEE4wo97Y03GzONqnQm1WTcvpz7Pj4eiX4umOQoGRa6+s+GVgSBHLeO4gnu9M5RC5VGqZwQnFaFJdcp04mODl
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(110136005)(6512007)(54906003)(6486002)(6666004)(921005)(478600001)(38100700002)(41300700001)(5660300002)(316002)(66476007)(66946007)(8676002)(4326008)(8936002)(66556008)(2616005)(83380400001)(7406005)(26005)(107886003)(186003)(6506007)(7416002)(86362001)(36756003)(2906002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?DxeVhio6hDmGjfTnErs4FgIxW5ELfrGJb/zn002NGqYbtAT8LZOlnOkyZf4k?=
 =?us-ascii?Q?XSavRg8YurPP8N24/SbYrTKkfTIGn0fIRCxlxoo+wsRYNGubk/yzFNHRCTbr?=
 =?us-ascii?Q?7kPjS+P7qfgYZZ4G/cGl0sQx8GP8J2eUuR0Vx79J8ZEZytPMX0b85pBXVEwS?=
 =?us-ascii?Q?cfgnJcYCcROARnfPH+nthK/OotEtyWnjJy0o8vyddSTyC4XKfwmLcD9Iqmj1?=
 =?us-ascii?Q?7Msz9TxumD2S7DJYVk1iRoE8kVpLbBHxzPKdPnKq6yLDQqiiAHcJvNp8DaU4?=
 =?us-ascii?Q?Hmc6uJcfIIQ9pWaSTboUEqZePA0AEjNajVoqF5oB9DoTtnLay2maLlR8ZAWO?=
 =?us-ascii?Q?+SJQRIXXx9leOTEiEsj4WSnV6M8XfmElwOWM2uxVQZ13zwLqz3xB4xRtP7wk?=
 =?us-ascii?Q?+hqyjaOL5KcmkVjhbEzXRnlNKTYMykd+vaSxKzmJd1uRROM2P0bAbluDWt2f?=
 =?us-ascii?Q?4+hQJPuRxXiS0Q21NaiGjvj3ZnvYsJi5daF3yIFm8Pw4bukO7DMXynJ5OWBj?=
 =?us-ascii?Q?BHm4ycOwoYEjiTx3cuQlJeBzY+v5PcMISzKkt0LMODxyjSNrd6z9qcNl4M1i?=
 =?us-ascii?Q?FMJ2Wchm31h50DrE79W0korF5PRdbxz5rFPlKpeXpDiUCOwg4K9Q19MrxcKJ?=
 =?us-ascii?Q?LlCki/5ooEYgNdQZ/XghI21PSk7zlU6AqDHmmXAEBkf8AcPy1yAeXswtrL0j?=
 =?us-ascii?Q?2qu66LkPQ7CDHAz3mI/Z7Ypj13WBP5JtycqWHUxLnhaWEAfAZFRavCGYPeIx?=
 =?us-ascii?Q?y2GHuxTdz6kvvnFXM0AFkdD0ROgMOUVDtBtxUX4ZHezGHYkQdShn1pANDzd7?=
 =?us-ascii?Q?r8CFHSYSRPGx555FUFzEvIu3k4dvcQZqwMiueJSzuThTJLvptcyfZTmvrBpw?=
 =?us-ascii?Q?+1oaQDauVfk3RixYhjqUhiuxYDdkzJeJyY74KuDM9q4mCWlxf/LfZGWoaTG0?=
 =?us-ascii?Q?WzB9fRkyfD7Olb1wPKg9GxS7pjrZWqZ1wllzPMz3tY5xYPu8iHuaYUBeeMx5?=
 =?us-ascii?Q?1QzUQ2nhTzlBvZsoLjRTCVBxt7N6BGCyWPSHT0oG0p4yOu0WpcFSQJQ7UJHz?=
 =?us-ascii?Q?EWjcDqeTW2X95iN4Jd6q9adZ4WkaAVabBafmLRn8cwph5Xr2BPvlqd2EqO+8?=
 =?us-ascii?Q?cvrTRXDXMSCpqmb0mMWJsy4hixDGLkxU0DhhLDFiSMHEGlRqt3Ln+DgSM8a9?=
 =?us-ascii?Q?+xegS0gt5hlIVrntphwlFKOB8O2O3LpFNMab09VCfMCLifCnt5mRAX022u0c?=
 =?us-ascii?Q?z7/T+GWBxb3RpMPxSCcRupio7fIxvE4Dln2BM6iY8SHAO1O081WhXyzM4YgH?=
 =?us-ascii?Q?SDpv3Fjje4tuhot6ZwmoacJFkMYU9N60Au2iIyEmPOBr7RHeJA4Kq5CWQRmW?=
 =?us-ascii?Q?6OTm5/f/cegYsZSrhfXsv2pdOy/ibrD7B67XT4YgCJOufR61Hb4MkWxcAslC?=
 =?us-ascii?Q?cM0qYBFg4xIdONyF7LpOrq1wyv/SGPToB6lNO3qPfKFF2AUgU8qJshk9RLiB?=
 =?us-ascii?Q?Es0kXiSJYTaAOozYVujLt+ZMq/xmDweihJOUbBTG2yqs4OezXZv81JDXc5Nk?=
 =?us-ascii?Q?b+6dHGmXhbrmVUymRXjL5tkrlSfm7VIPpoNYlDnY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b1ba6b-2722-4a3e-33e9-08db93b5bb74
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:15.0165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwkZaMtcWxYh0+SyIrAjWfa5e6RGVwC/CY3xaz421zqQxV1ZDrDk6xt4eZyRctvg
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

What mtk does during mtk_iommu_v1_set_platform_dma() is actually putting
the iommu into identity mode. Make this available as a proper IDENTITY
domain.

The mtk_iommu_v1_def_domain_type() from
commit 8bbe13f52cb7 ("iommu/mediatek-v1: Add def_domain_type") explains
this was needed to allow probe_finalize() to be called, but now the
IDENTITY domain will do the same job so change the returned
def_domain_type.

mkt_v1 is the only driver that returns IOMMU_DOMAIN_UNMANAGED from
def_domain_type().  This allows the next patch to enforce an IDENTITY
domain policy for this driver.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/mtk_iommu_v1.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 8a0a5e5d049f4a..cc3e7d53d33ad9 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -319,11 +319,27 @@ static int mtk_iommu_v1_attach_device(struct iommu_domain *domain, struct device
 	return 0;
 }
 
-static void mtk_iommu_v1_set_platform_dma(struct device *dev)
+static int mtk_iommu_v1_identity_attach(struct iommu_domain *identity_domain,
+					struct device *dev)
 {
 	struct mtk_iommu_v1_data *data = dev_iommu_priv_get(dev);
 
 	mtk_iommu_v1_config(data, dev, false);
+	return 0;
+}
+
+static struct iommu_domain_ops mtk_iommu_v1_identity_ops = {
+	.attach_dev = mtk_iommu_v1_identity_attach,
+};
+
+static struct iommu_domain mtk_iommu_v1_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &mtk_iommu_v1_identity_ops,
+};
+
+static void mtk_iommu_v1_set_platform_dma(struct device *dev)
+{
+	mtk_iommu_v1_identity_attach(&mtk_iommu_v1_identity_domain, dev);
 }
 
 static int mtk_iommu_v1_map(struct iommu_domain *domain, unsigned long iova,
@@ -443,7 +459,7 @@ static int mtk_iommu_v1_create_mapping(struct device *dev, struct of_phandle_arg
 
 static int mtk_iommu_v1_def_domain_type(struct device *dev)
 {
-	return IOMMU_DOMAIN_UNMANAGED;
+	return IOMMU_DOMAIN_IDENTITY;
 }
 
 static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
@@ -578,6 +594,7 @@ static int mtk_iommu_v1_hw_init(const struct mtk_iommu_v1_data *data)
 }
 
 static const struct iommu_ops mtk_iommu_v1_ops = {
+	.identity_domain = &mtk_iommu_v1_identity_domain,
 	.domain_alloc	= mtk_iommu_v1_domain_alloc,
 	.probe_device	= mtk_iommu_v1_probe_device,
 	.probe_finalize = mtk_iommu_v1_probe_finalize,
-- 
2.41.0

