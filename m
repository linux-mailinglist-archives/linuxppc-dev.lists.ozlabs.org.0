Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C0775FDFB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:42:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=R72OsMF7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nYB5Frjz3cjj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:42:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=R72OsMF7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8c::629; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6f24sNz30D2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:50 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXq67p9A+fttok3siOO+eaJyv9UnUr3y+d75hDBZTaMH1uY69P5HcmFXeR20Fa54eOpFdI6PhSSPB/UjaBLxn8Z4+ussn9HTqBNpYhkL1xl0x5iRyZSYXjza2UDMXWlUOunt4jDMFDqXrfticjvuWkmqfVpL+8Yk2eF3Br5lUxcu+DsTwgiuJ7JBS1USY/GP4BNxgLV5jhJMdvj+fmxTX+9QEUokwMaUM0Sy6nGVbyixqBFewDPbz1iBJ/B2gvPVfIdxPYZYJ4gDcLtg+VsG4plmou630jhOsM3IwrO+aEzM5ZxlUDy7im/60LWPtCtEj3hThlftvV2HyOMxPP1pew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJsrCPZt05R68MxKoBpco2NR/z5JZDCOUNeUC4SYSu0=;
 b=VxqsGyiQMCMuEjILvGVL+EbpKzE+k+5DJdgKMhNqzDc96YoP0HZdiz3nfnapbeic5nQbgBmL0Sy1hWhsO+QCAd+rbcvupacKMm5KQHAUJuzfoBMvLHOtw/GNzO0ItihZxTv+L2J2V5kz1J5V4i7P9VpM5zZfd4nGPrVgelWsjpZfoacXe0t8cYN/YG0RrKheS/aG8I8mjdr0sP0q2sHUOr8hD+j00viSkTkn+D/n9A/KVHSkb5u8KFNVojbMCzAfYyhCDvuTv90JX/SFJVL7K4ubJhYZmJsUiLBQY38CDwzzja0h9KNTRAszTYxReYBbVP2rqG2kezXYZIBJK2/KLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJsrCPZt05R68MxKoBpco2NR/z5JZDCOUNeUC4SYSu0=;
 b=R72OsMF7FTbwKKDip7K185lNBEbqXdgSngykaIEfvJ7BlNYb82vO2kWN6MAMPfLWGgrAu1/JmWwrYhA0COJXEkSFCU5UcyRiwa2NpW2URJo7H8sSAOULiAY7jFF1YHxM/F6N2wJhbm1PzT6noMTCFcP6ai55ErBjxXC1urnftToiXh45CR3bGTbbWBqY7Qp/cW1A9RsSyBCGeDKli066cBgKkBnvIYAaZjVpfPC4deUi0CNeCVpM7tmIhgbZR3Wr0cPsyXfroAar8YhwMltKfcM8jxrxBsAkfZBbiNuGtQjJJccoMTdJXCE2GHudhvzcI9bjOIj1H3XgsIfcBbpNYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5252.namprd12.prod.outlook.com (2603:10b6:610:d3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:28 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:28 +0000
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
Subject: [PATCH v5 11/25] iommu/tegra-smmu: Implement an IDENTITY domain
Date: Mon, 24 Jul 2023 14:22:01 -0300
Message-ID: <11-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:208:2d::30) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: a28d640f-192f-49bb-5b5b-08db8c6a89aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5Oe89XwZCSJMg3AzU5hgPKuB/a9dd4TVZd47QSKv8GjCb2WzDHyLOCTugoErlhIksOtR3Didi+4QUbC4UKjEEqrVrRzDHMVJCj+fg9udgUPTPpb1dBWzLo20Ln/oWaEDZPsyEhZwvuYfOkBP7OcPplxDBEjpzDcVxO6WAsS/aACDbQuH8XZYFrIDl7bfjFC1MByexre+aSJyIpJ76oXM5J+xvJObZ+y1xyYa6Fbq3jraJBnXBsGA8D9VI2uxsGQF3E2hUGAG/U4vz2Tokr6TokLPbd78fAj5WaR0i8YYow2ULV+gkWE3s4gSp34D9AMwooNUL9qRI8Aj0+g3Hky3AgslnAekcS8BMhV8WIYA69dLsVKZWkAHiRMHRzrmHHFmzM0Jip/3Yr014rEYALu6zzh6Dvnds5za870fMqddEIEKkuEnaGfrSdE+cpOR6mp9Re/xK3H2Py98eu4VI1aWS3WbS5+8P4VClKdzxNOvar++72AILaeQFJvCJa9IWzl4fQD6YLASdywSi3Be2LJJoBiXZXvcSdYDGKvaNVRjkA3EaSg0kMT5fWgRm2eZKY4mpMF9d3cyP99XhiUrad/x77mKR4U4Q9ZCkWGN3mH3W5o=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(2906002)(2616005)(83380400001)(4326008)(316002)(6512007)(66476007)(66556008)(66946007)(107886003)(41300700001)(6486002)(36756003)(478600001)(6666004)(86362001)(110136005)(54906003)(921005)(38100700002)(186003)(7406005)(7416002)(8676002)(8936002)(6506007)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Sq/YKANiXF4Ar5brd56HbA2rkHvn9uSdTZqMNuozKOcGBDRY5FvZ8ssNdzPn?=
 =?us-ascii?Q?4ngtBrvMaJbymP2CxniROXUoSoniK8kKC3KW5IyeRqLXMGpDcJdEm67StuRn?=
 =?us-ascii?Q?Q1lA5AMKgrB2jackDbqX6DkD1gcwKpEGwqEkujnptLmuW7hu/+s3hG6Z+I43?=
 =?us-ascii?Q?ak0RNUVoDRphrAPgj5pfX++IGJ878GmQNB01BR5rSUaqeV4iiXulPf11zAhG?=
 =?us-ascii?Q?DzITTGeHlhOMEVAv5nB2nby/e8nN0OIWH3y3GPoJSbArDkibR7GJnoCG6vka?=
 =?us-ascii?Q?BodA2r0aNsg9zPrT+lCUcxm7j8Lzu2+yg6GR7UuyP4NltTNeAq8dvOTRDta9?=
 =?us-ascii?Q?2IAQfWyP6uK7TUElF96Yl0XTmDcXA78iZA/IIKoaAtwRh2y+OVVTNA9lZ5sm?=
 =?us-ascii?Q?vpeQ3ONMeOq27o5sNMKbLav/d+/xLucy6JzwBV9byO7bDFWF14stiDesEaPz?=
 =?us-ascii?Q?OlxnqsiJz+Vm5MjrLTvpyhMWVvL1t6in/mU/xV7uomzFLze8Ew19+6VXtnwS?=
 =?us-ascii?Q?7Th+jUhn5//oqP5DBM3bWlIxopdXgDtTGIQ7p8EyZCXBkh5eT7/GxFmY+qWE?=
 =?us-ascii?Q?S+j5rV5OQ6zJuPkVcNTncQQy1PDJp5nFGV2SLmsXhZt0oGxUZ5T2ulMh4K9O?=
 =?us-ascii?Q?STKpKYVoUwQR6WshvnqiIC+pPTtwPbHPf9dM8DBofhcAPh7i0ndFmt2EEzRG?=
 =?us-ascii?Q?sqxedv+9z1M4qNdhUafDteQwcZGmPowXZl4PvaETESC57OjQFdLfZX6OdtLb?=
 =?us-ascii?Q?tie2ZMxAyCHaJNrVdfQHVfeWX0fwgNDu0xlgqb2ICnq6iywji1+B/UNzV9fH?=
 =?us-ascii?Q?2LXnvo1CN6b6blazR+nOu00TG1CNPpum4CfCcUdoK3pVURASemYBoedGM8UW?=
 =?us-ascii?Q?wmXGJHD+Bw3LGZ50zKO8+oB8WqHqo/i4Yd9Ar1wmYVvtNluORptAgyEN0eI9?=
 =?us-ascii?Q?6fmBtG+awN7JBoHF/oNFGhPqoqLOW+T9iWaUH/i0huy3uyz6p8b3l/8KTRQX?=
 =?us-ascii?Q?0Yn1WeAuZrJ2oWR7SDCad76ueu1l77sxax86efbDI9832m2wIGFMllH/BU3J?=
 =?us-ascii?Q?2Cyin2lzRpVo9s2R7l2U1YVKtFYESXB2N7ECWzfy/38Y+QnXpFmV5dBTIzFH?=
 =?us-ascii?Q?FbJHcswL4xiY0rQUnPX5Ak2ps25/iV0TDxwD34JVp7lCK2999sIDkmGs3FGT?=
 =?us-ascii?Q?TotPRraPi1Q2rYbNuSXS5DrJIwCshbQFP0aCeszUdm8XNIMLNqn+9zXMIUZO?=
 =?us-ascii?Q?UpFLNMdClNiL9IQTeEfZqLw+hfg8/+rv5gSNnhbNqP++XKbvEZWu19PeNaKG?=
 =?us-ascii?Q?BpcbKdbYqDz3m9KBTzcdhXRUR+5/04CwmiKDYgttuZ+0+CfXWqxNxdW9QWSQ?=
 =?us-ascii?Q?zSnRLgMjE9PsfJQfXp82gBXXpNMZ4oK/tZC2ZWP2YrGqviFdZqiMhC2VuEIn?=
 =?us-ascii?Q?ONe3gfjeglutGgqS+Ay+5rrpEQTRcFEj8aax/IMbx94eFtNn20xlzMZXnyLw?=
 =?us-ascii?Q?/oPYEbbORDYYxrR5oev996aaVB28Q1t9TT80aYIcrlQiy/8v2o+nPdXZhkQu?=
 =?us-ascii?Q?Blc+STYwDqoFbhKCiWO5nFmabniWeqwyitn7m4oi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a28d640f-192f-49bb-5b5b-08db8c6a89aa
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:21.1561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14SQOe3/ntZ9kJbjLlayYUlQSaoMZ0/GZl5c486gie5U1AcDxP05cJqfrp4rBkPC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5252
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
2.41.0

