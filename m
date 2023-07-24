Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F26E75FDD0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:34:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UBZPEcQe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nMl71Ncz3dV4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:34:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UBZPEcQe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::611; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6Z6ZDMz2yGg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dv6gDd93yoGNZVEiQ0AxVjy/EECOV6ZYnnyega/wt7WA8F00mA/n3zWtWq8snofr+VniB/pB1jFVrZsXSld3ePvfaiGQQA/S3bjHfA4GMOgWsEOvw1YYaoewOQL5ExsO9d92baicf8kccqVfUGRcKlji83z9wGMYLvrmRWK7Vqr83+rEGNWHh5tIksRaLi6NT9ycwFrcpOlPYSorp2agcgIbILBjPY8WjmvVDgZ955Yv3Hm9Dq1cWbqATLF2+dDymZNfTbwaXgoDIxN6L2/lWJQGQ4VOY3mIjubsyszeMOkX1pnK4rf1s8YMFKR0h2B2TJN5isHcDzMOLIG9mM+4ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dijjnmcTwEIG43n1u0a4rcB854nzj8vKoYIf9eO0DwA=;
 b=eB+/QD/NyVmRg6BV4hPyH9Em++m8afuOFysSMXdEKJdQTupsXBc50NFrX3oO7oBU8DajooJTNNxo5VdKiao6/H+IPc37Ey87WbCS0iDas+Bi6SpbO4qtvidJgh4jTEuO0Gmc3GcbEzziVyycU72zxzzqbMiwfU6b5Tuj6aRKXwHVI+iXbYBL1pUbXieaXp3nwdIiQlEiuaaAh36lldVl0jjke/pn2qXYjSmWFYifvKfONTPi+bNDd1vFD7IQSJhBEClqICUsrm3seBYOYMCck5a48RizOj8Q4rDeScJnaIYBf05TM8Yd5aj72/NAoqnF7f0NhRN8tAfCEK+WeTQQ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dijjnmcTwEIG43n1u0a4rcB854nzj8vKoYIf9eO0DwA=;
 b=UBZPEcQeQJ5sb197ociuAryqMHbqUNmzMYcp3tsHQld19VVrq0SvTsC5qVszP6/FyaUy+b/UvOS/UWEFc1C2DIAPf4UBkR2Bm6f6MHynmWXGWB3fUspO5hOyJvljn4xGBixZRkmBa2PQ2BkXw0WPQRoqmzTemrSmaoeamBp0gXxoVewoTzBlYMAb3UNnn2AkARowwUiLW1PUHqm7Eupt/9dWg88VXibacuAa78BgCm/813CLsjW2dJXAyATPOmxNDqA+F9tSsynlE5aQdL3jjtbhT87vVfckXsMiAib+jB/eBwrHaY9VE2vVWy55kWNz+rfqm/EGYmOuuL0aNLwSQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB7353.namprd12.prod.outlook.com (2603:10b6:510:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:22 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:22 +0000
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
Subject: [PATCH v5 07/25] iommu/mtk_iommu_v1: Implement an IDENTITY domain
Date: Mon, 24 Jul 2023 14:21:57 -0300
Message-ID: <7-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P222CA0013.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 1361a654-8c1e-4674-6f8d-08db8c6a8804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MYzMYyQfniqkRnrp4YRc0+Fe64r5DU1R9a6UJVka7JcIRC/dG9zsLTrdfVQ2MsgF+U1GEmuiQMmr9bmhD4S5xxAp1gcw6ok6QcrMz/scUTuQA9et5TS0cbOzcO0GLszCf6DwogYhIHFmQX662+ega4qDqOKXaDGC2S5zfJ+IcyrPtMJAMKimRXphrY0nqAr28W1ccRdc5Ummk2sKdhwdRJfF83IbELilsU/y/fMSzd5fio1A4UVsY+HKWSfFQqBkhblqM85RiwRaipygh74DtRbqDpX3AHRQaHqrhuWkV6P8r2aLZGcX6PMu3QDZbVGoHQx+9DMjCobuD7mcrUnQbACGrkmq5Xi6ENKacyUP5oeHGGuPv1/p/Frqwr9HJMey2QXO+0eClItZ+9b7dWbuDg2Coxxkko1kne33dHhShZaf3LqxMZOVju6lsw+t+8KLNhzzK4W9rT/C644Hg9jLGaajhZc7QppYfecWoMfDo1S2w24kW3+LMs4o6GOQoFzsDcc3EnFO/ExzN5OHdv2eARvvsCSJ2BrCmk28Swg1XjM9I1VKWXKRPzhYs6d8wxShCDukvxYk+ahfx4m2IupT1lXp2mtKOE7V3314gtIR7cGC+PTkDcJdhOqh3uRClChV
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(36756003)(478600001)(6512007)(6486002)(110136005)(6666004)(54906003)(6506007)(186003)(26005)(107886003)(2906002)(316002)(4326008)(66946007)(66556008)(66476007)(7416002)(7406005)(8676002)(5660300002)(8936002)(921005)(38100700002)(41300700001)(86362001)(83380400001)(2616005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?xpWBzhSAYPhBsAnKVjpmTwboZgk9568H7bqUAVUNz236dGhLOWxBOyKTLm4X?=
 =?us-ascii?Q?NnwwRF4yYe7VJ8uIV8lwARMs+e52r87o5HBgvQWLL7oKqFt/icg3r+Pehllg?=
 =?us-ascii?Q?OPxMfxUuYBBIwyhx38F9UApZv5M2YBPcCCbiNq025AryW1PHHk3P8sb+Y1/5?=
 =?us-ascii?Q?gM80M/xQ1U9xn0sLoSQbxEhgzL4Iic7oUDCfb2Pp+r0F4tUaItQANgQ587WJ?=
 =?us-ascii?Q?iEOqplN8cWJW/mF6sSkjceZ8o/tvnNF/9C9nnvvqFBQeD8Qi8p1cZccrPKD+?=
 =?us-ascii?Q?isHLSR6mbxlKeX+yWWviQCmGwi6CiFv/4OqcZJ5z0reQMiCOYLQlTqT6oVz7?=
 =?us-ascii?Q?ajbbNE1tbJAkHhSPptyjthJzGhtlTH36y+DuGSD98ZEkEJjrMJI0AUikkGU0?=
 =?us-ascii?Q?itY9khiZz7Z3vEwxW8WZUFo2P68R9xPsdeGoMV2DMT9MKT/BbI4gmh8N06Ix?=
 =?us-ascii?Q?uZD0vap5jqBFNicxlYoP+tHHPkhK1k/QZjftRD+K/Z8NMJyWAeHq6tJdIuiJ?=
 =?us-ascii?Q?5trN7r+7m7ty5yfBgRMOOVvSwBCIgB7HD61aPLDxVguYhmJ/F3YEwsSapvKq?=
 =?us-ascii?Q?T0TxJ6sPV8bwIZ5qU3XADdb2WSqRdQQ5QhiEl54j5h8iUwl7M9HMp3cmjCId?=
 =?us-ascii?Q?IhZkTircMFEnMdKlilcuIHLr2+HfzQCuSwj1zB8lHNZ44QeVMwEo1siJIhCb?=
 =?us-ascii?Q?mruL6WCcaR6KtZyREY/HKaCZzAhDrnlKsCCIErje2a5UQOhj6br0B8sHtSZN?=
 =?us-ascii?Q?2bIEPCloMziVzUO9IG3RTbPBom/5VU+/DCx3tBjTgUH7Z5SogYKn3ohfmgMr?=
 =?us-ascii?Q?iEMb6fxjXYWZHvf4TusQ3QacMKPLhPLAOJX75uga7dhlgD3ABCjhuNszxrOc?=
 =?us-ascii?Q?W0N5H034VbERAQnULm7ted8FO2wEGRMzZEzdF6xaG47tt9G8Ko+hMzDi9TPD?=
 =?us-ascii?Q?755TuJIeLv9aFqu+kctpQypyqyGUa8Zyj6hi3hffhEcExIeFva9r9jjN/djt?=
 =?us-ascii?Q?m2X3wQLfG+mu4Fgu32bL26Lj2JQm3QtIqksBxnFFKDckHGjKYJ8HCS5ICr5Q?=
 =?us-ascii?Q?Tpcq0FHkf+E+fSTBLlKyKgL7eI37PJl9gYs/EPK+8d/M5dJoUsnGwBf054nA?=
 =?us-ascii?Q?5sQ+K0DKr6N/wUEAZSmRdzcXtACDaq3NJS8arbDseAR/p58FFxZ3Vh/9eDYT?=
 =?us-ascii?Q?WYRMruMHt56DL07XKPZRLnaH8za3qUHyM57ReI5v7e7aS/nB2faVg1IA64jv?=
 =?us-ascii?Q?ZMiWG+zo7Vqa/X1rmwjuni0Cv5AcLJVsx8mJiB1lePRr6rxNoi9HaI1qiCYc?=
 =?us-ascii?Q?oysFwDQTCqvURJ7hlcmtJLd67IKsLNqMxHGOHj0pGs5Ii9mNJt/+ARgKY3ae?=
 =?us-ascii?Q?FI70fv7j6lR31ny/lKb/rDh3j13GbUvc+pKfbC1FAhnGxlSwyhe16r1X6BlR?=
 =?us-ascii?Q?cJfKUecyONIHokJ/2z0Di7i+shhJ9tTjRBZpgr/YO5hySL7yHExohm/UHjqc?=
 =?us-ascii?Q?RpiT6t/LPX/Uq2HDQ6/1oubEecT5kHH1E1WKi5Z9Q7eG+iWUByxt2ugvVZ9V?=
 =?us-ascii?Q?JaGJev//9V/xtk5CTTwt7mGPUweGG6MqpS2v43f2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1361a654-8c1e-4674-6f8d-08db8c6a8804
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:18.0600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufcHP9iSdAtfGtGFXhhgnu0hPvQojc1Xb8k4TwEf3eIgiRgfNLZJVovcfPl5McoF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7353
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

