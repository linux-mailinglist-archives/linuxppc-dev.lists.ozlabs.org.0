Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A469D70423C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:20:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxhp3Tz4z3gB2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:20:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gbS7CoBL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::629; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gbS7CoBL;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxH365kDz3bxt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=napWWXTsvz1J0QJprrVZdjRvmLQ5PaxO2a1/77kJ7mAuNwlSDiVYxCBZ9toUb3rItKYdvg5iuZcjPNxzKYN7VPR0UW591a9eTz9RvLFd1Fb/M11lEkyituqusmg3c02fLaHLjtg6zbeurHVNSvcMPgCpmyLu7F43O9FJhQdR8uzwI++KMjHNycftlK4cSCf8699UnJPpAjEo733EbJKI4nElwytaJLP90eGyyebEhchA3ieW4aU3+NRWBc5TWKn7/qk9V62PB7ZWm99tBkwhe5KaU8zaPP/C14NJz4kbocwDchoRZzOANjph4503TJl36h6NrwCetsKicrZ7NawjhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oc9+cmsyQ7ClyqBWCUJKmesYXwKbwskFnJn3iebEKMo=;
 b=U74Hd3uBIVFCqf08fiFGQ2cPviyJ/4c7YLUthUmiKfriY+tGesTuZtEppAjLu2168TkeEYVGhF8Vd8DW0jMOemhi+XDy2XMDkv4umHuItSFe+BY8XQa5w2lYMb3LCn0WRhh5qBbH9wrQuWS6Y5VMo4ZHPzWbgQeBpWyVsZ4ZOpOLlp6Mr81rXNUodXwq1TvdX3RlSfR41em4vPanABFZXy00uBJ3Va4W0P5q0GLwD4qHd5lCS8mWmwRf6sLXdLfJzTp2TK0pdKZMTzhhmK7IdsgqR8ddYP4eU+pLeTusHlit6oCy4DreGQy/Nwp8yNOiTdCc1dtNhMDe557bQNSCPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oc9+cmsyQ7ClyqBWCUJKmesYXwKbwskFnJn3iebEKMo=;
 b=gbS7CoBL4UVbYYATsOVWJU5d5WEMHCGawihLDYO+0PD7acZ5uPV/33rQ6xRGSksQS1apy0S+ulkdR4oySHoK4FulG7DKzjVThzdWeP/vfAXkTXr+2T7RVo0m+ZuSrOcSlmgb7cM+UeP5uceJ/taiv41WBra7uyzuVtOS2SZoNZ7HxG9Q203FCET6XFR2gbYFYa+I8vswiONYFqkGHspc5Rz0CpOx4yEOMYgHdbif7eVtRBQhod+Qd4iHsZEHEJj+FSqVRZY6TJhgZa0hlb0NReZ57CQk9H1fXlHKnm8X65YZuoGh2JcUU9TG2P9WW+kTyzdFtaIawWx00y6kbdrEJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:17 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:17 +0000
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
Subject: [PATCH v2 06/25] iommu/mtk_iommu_v1: Implement an IDENTITY domain
Date: Mon, 15 May 2023 21:00:39 -0300
Message-Id: <6-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0003.namprd08.prod.outlook.com
 (2603:10b6:208:239::8) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f81d3c-bb59-4ff0-2f17-08db55a0a3f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UZI6ikJI6wiP7YVANKocQdFrJPoE69I/82XqhC9h+ppUUXIDJ3wnL/avx/0T/7vj8VclQUUEvK2bvsbR65Fn9U4IScsrwIsErL84bohRiUy3+v4GvWVW1JaKJy9tSghu+tdwCf0rZ2zUyaEq1MFy6xuFCEzsmqvTlb3mUW84yhUdcJt0xgvN/SPl8IONTly/v3vmWRbut0fjTIO1vwETp9+u7nMANDwgpUzvlPZh3TS6Bu3m3Ccuy+miCaYBLROL0iJ6HzaaJnFdLWRuyuD0Z+DedF8NMuPLe0YsZVAcoCPtLeNPvN/xE7yz7I3OaUkOA/usuqIUQpBgK+9wpMeQ1gEL3bsDda+Pz1Os4CdIX7ZeuWfV+7TDoyhOLLD/GJKAhklOaO7mV64l1yuzOzKC6iz6aMHqGHlvkBccSiTbFeouJkAUavte83u7Lsl3jNDCcYcPqAjiPqixubot3xvK8WwLd36O27/RO4+NthFQZLe9tqJKDP30cbKoHDrWT8Ic22tFOnaKgAN+QG4LzVVgcaDF00JgkJ30tu4o2GvLg3ymSLAxbl3H28rY9b4vn6wz9s5KGvEjJs6NrIRuTvh/npI0wU8/5IEG/Oq3uLn3vu2LxHKK3yN6UFjMiMV0rtuF
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(36756003)(110136005)(54906003)(478600001)(38100700002)(41300700001)(7416002)(7406005)(8676002)(8936002)(5660300002)(2906002)(316002)(921005)(4326008)(66476007)(66946007)(66556008)(6506007)(6512007)(107886003)(86362001)(26005)(186003)(83380400001)(2616005)(6486002)(6666004)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?sx9FG84Ss/oro7mDpMd4H3/gbFjCyeHEQiSibOGZP97U2dOZIgkEI2oVsGi1?=
 =?us-ascii?Q?zAADtIUnUKcOzEK2rC/bPElgiRLQ29sU91sikeqC1hH6ISIuWQbNarKQRIKp?=
 =?us-ascii?Q?A9WTHTN5zN9fiuQ5N+jTVoEm2DQSEsDIW0zdMUlA3+nYH39rgzr3r/TeOuVQ?=
 =?us-ascii?Q?lgFOyOBGhbZeF+/8wW2XfnPb30VO8nkPiKJH7r1wVtcmEMVA5xqrx9ud6A3m?=
 =?us-ascii?Q?nbqjze8yRSEQGa4O6lYsMDt6duy/PlE5VlrLhQW50f6bBTV42x2a3NbX8MFa?=
 =?us-ascii?Q?gKXNpR97Q8gNCLNWS6wwnRLBOJWuS19Z4lXOVdiQaMokmfk5AEw7nUPf50zE?=
 =?us-ascii?Q?bv2E38a1U2wwUK6McYBWU6NdinjFaqIGyy8dw4JgAr/q3IO+h616S+tzNmTM?=
 =?us-ascii?Q?d1y+DwrJWtYa/VvqD8Yf+MEngwTDfpglFjWBpDWwS8b0BYXgYkRgWJPpSjWa?=
 =?us-ascii?Q?3ggADWGoy0qskFUnb5H0gwQKzrEtIHJklN3skotQTpVwsmWezGVSKPwkTnW4?=
 =?us-ascii?Q?CwB/sHFNn7Lh2jX1eqxzvktBVoN0LmGoDFekCIT1HVJs1sNoROg5Hekq8o+I?=
 =?us-ascii?Q?+4ijzZ3XQpVFi7TCk/UnrXrzjnGet2qGM10kXsqLgRHI3IKLWLlP70UrutcH?=
 =?us-ascii?Q?WIqtkEJ07YTECMrs4g/C1WDF5LyETVBb8sWS6rG5BHQk6tapFf2qJ5mcmMBf?=
 =?us-ascii?Q?zEbmoZTDClHz50wSD3eXUEfwE29T6qwZDCAFza8vtuDeyqSEyMKY519aWr1y?=
 =?us-ascii?Q?JC91rColG6/+STWIgvS+YiiNIUXp2OGkrXKFP75bzgJ9neuOGjwCnKank9Lx?=
 =?us-ascii?Q?sp839oARtjL6EYx/qXzkqhULnG6OhG3spquhl00oYfWDn+Q83EN/rySXwE7Y?=
 =?us-ascii?Q?0dy5q7VFQNGR/OFbydm4IhrMKdwRvWGnV7DSyu5a3GuHHQ4/rcuKbQXpPd8z?=
 =?us-ascii?Q?yWYXU9dDIHRJ9VE154xyPgB8wt3119zoQRs5c9H9JfTH4A+IhqlnWx+2H9aI?=
 =?us-ascii?Q?7tDCyCybSH7wfVb9q38IZgt0eNQBX/RPfRYSsbV3y+L+INXRinysIQj6zrTS?=
 =?us-ascii?Q?wNC9tNVEzs4joVohUqY+c/DKvV9LjWpkCxaipJBFzrqGFHR6iRR3JBZAgISe?=
 =?us-ascii?Q?Q6W8r3nhQIRllrso53YwOp+pybg3WtV1Vul8v5ErsP5BHHS/2k338sZasA2D?=
 =?us-ascii?Q?i0ClLptBmP52B24eYKukC09uc2hRe8r668ABo2S1DPcHvSSL7THcoM2JprUk?=
 =?us-ascii?Q?xLn7Kk1Hk1/EfXduGB0GeA0vgfYOLS9sWMFQcZtwzLJp9GalVnBLpoXPLcZu?=
 =?us-ascii?Q?KXEB0VGrobYb+NFvVGjAmcO82Nzhoh1boH+XOEzThjmKxaI0MXikq1u7udCJ?=
 =?us-ascii?Q?uUTy9X2WTjI10XbyiTRgiJv2lcT0R/U/5eozDpP9oECzs3CmvhV7VQ/kBJWq?=
 =?us-ascii?Q?Z2hjAOjIFD8v7tazo5NA+277L5QLWhFh5OfaxNh6i110rypEjvs8GG4LyPfd?=
 =?us-ascii?Q?oaKES19enA3H4hf2EBSGXVu6m0mJwkW9CqXzTIsH7ZSmpCFu8TEOlz1eCrcB?=
 =?us-ascii?Q?w49/fnWZAcAwZPEv1AZHkClDr1YmKFIr/U97yCsC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f81d3c-bb59-4ff0-2f17-08db55a0a3f2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:03.8982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52UU+Z/lqnoxCrFZ1Mz2nMOq1tZ1osgGiQLuE3Q3/zVXLQT0ZE2s3osaOFlB5mQn
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
2.40.1

