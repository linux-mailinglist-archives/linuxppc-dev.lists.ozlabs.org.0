Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5773173392F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:05:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FaffOsvV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTB91x9sz3c04
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:05:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=FaffOsvV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7ea9::60b; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7ea9::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT881CQ7z3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JN/v3l4XbnD/HBcSlxckL3cYHxC4uVQKegCxjBiTQNrgSSdXQ2TMkPiMfm5MRi5PQa6k7VAwE2GLsoqvD3ZXnY4OpBsVtFDgAW4WwUuo7mQMrqp5Cl3sVgobGnEBvCVkfbIkm8UZdRe96ujqDdRMBBe5Wsa6ejP5kIay6sZkMYRvOCfrxzvLzVeF91hnDwVpueAMlZEAl5DSMab8byyXWbmbzrMxawsi7oxcubwi3Pe8xXMvmDg1ixFVLZ5lgLx1G2565Ls2aXW3wdr8ilv04WOKKi+S/fI9BAhlGm54rpNw+TPCg21QCqCukztlSeTcf9LqHkeFbLW/Jw95jLWEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oc9+cmsyQ7ClyqBWCUJKmesYXwKbwskFnJn3iebEKMo=;
 b=ckU45o6hE555WtzAMiaUZgbl9SKagy4MjW6GYJaUCcrC4tPPW88NIOrn4g5ujuSebkQ+nTdnF1MDcKvbmnHcK8okE7cgo55xGxhGit1I/VhYRIDK8I+n34DXdXQEuSglwWumH0YojslByADiJ8/xIXKeLoMoQ9K/syJTuzc5Sn2HEEfcV1gZt/ZKlFsCNHQVhg1WBxq3HeUnZs42+Zfu69B2ne7JSahvQDcs1AOaNR/GJy0SpfjcunZYoDw8dB1dYGVxROsGEZDTcaoH2lEOUimpLl/T20u8Sk94uLn3h3P0Mb6QwGiXCmtQyGbL1JnjD3PlXthQ+L/VGSvd0n6orQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oc9+cmsyQ7ClyqBWCUJKmesYXwKbwskFnJn3iebEKMo=;
 b=FaffOsvV8xbHPY5E+gB/87OzK6CWY5NyETL1eT8n/+3R/yt8IRv1bnhESjAAV6fc6/YzHK5TuZDULkAcE3oSbdSXjfbonuxcfH962DyVB30nT80z/RIJBaJyCteqPwL1nnHNhBjDnT/KjN+eWBxkxOAoi/Ljgv+iRV3sKY29lvknaFKLa1C0Z0qc7CbW4XV6GfnoD+2zPkCB6W32AU+tOPA2cKTx/sEIWBTB/nJhWlXyAP82xHgi7/ewkqaybg9XuKEvDTGsaQcZkZiNT064qQuyPyfue8E/RLVz3MdR77svSFLkjMLLqKVHm/8k5vciF8OXsL9/bxuxSxnihIpveQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS7PR12MB5912.namprd12.prod.outlook.com (2603:10b6:8:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 19:02:55 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:02:55 +0000
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
Subject: [PATCH v4 07/25] iommu/mtk_iommu_v1: Implement an IDENTITY domain
Date: Fri, 16 Jun 2023 16:02:36 -0300
Message-Id: <7-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS7PR12MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: ba5fb741-ff9b-4aca-6bdf-08db6e9c4ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nDZX7Z0IMW7AIx81V45HVuwU/qcLbPpP6tYFrasRli8wZD8rSu39siksaXbtKytY4UZTlgcfGTJNoPWdLLKMaZRcvJzg1yH5M182hfvQ2mrgXn0eUWgqrqJ5jUXALS+Cs5fpEXFrjgScfYErNxJKp0/v4VciLZoTEVKME+7hmIzfDuedbs2Kth4WvkvQRtjZjaEJJ2QtK9VBJfZtzRkX4bPEukDiYBhsXuLBTdDUtESliiBZCEtlTfPXZ5ZihFGJVnP5+7KfHJzIC5+jQdbIXT42Bwr4thz9sml3fqg5NfKaOMQBThZ5q/E7d1+PuJtGmZT/UYsSFf3Siy12NKjFXAkxV7V9fcCCILOLLjmlKOlMeUT95FLrmfzEXZqJ/nYubOnKCFqKv1ydr6z7lUdDhTjNxAhMF3c5nmDBoyvOiCSCYEjzmC5cjQ1Jli99lzigk/MNBpyEEI0JTynWzxs3kDPKQSY/5iFZIMNZdVOkk/sj/o++Mxy2Vs7Q54Fs+X1Zn/nDczbir/veAu0NdoKRG28X93bof0st7WenQ+7xh8EyCI0jgNJzN7XNE0rQ/XZHziz1A8Ed2pfWsKfdg8fpMrK/ZE6RO8oPdxtt9MtLcgzeKs7Z+weiQbclqOk1TFcW
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(36756003)(86362001)(110136005)(66556008)(66476007)(54906003)(4326008)(316002)(66946007)(107886003)(478600001)(6666004)(6486002)(7416002)(41300700001)(5660300002)(8936002)(8676002)(7406005)(2906002)(38100700002)(921005)(2616005)(83380400001)(6512007)(6506007)(186003)(26005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?AS4myCmkuekrawsO3bY9j1M1g53dgMnIP0UQvpuXizhCMlEpp6lk1UF6OfKM?=
 =?us-ascii?Q?9zrVrnT9WNISSqsISEjJIujeMmNCi+9ptbkZC1J994axUQ66koVkt9rXZiP0?=
 =?us-ascii?Q?6EUVMK3ppZ/P74xuChGgkHk9+WDAH03kSd5C6YfJVecyMJFU4wO0DbNzCgzF?=
 =?us-ascii?Q?P1NPUjg9fZe0gYcogFfrrFCtZr7Hp0b/4Yl2tASTByB6Z/il5aTLRzh73IT7?=
 =?us-ascii?Q?AY+iT2NVfVBbzpoWMCl7phohE/jr7DXYvhjGoDsDM+1BCaBv6Yj5Mdxqrp0Q?=
 =?us-ascii?Q?Gfk8Snoxi3jPAWpHzRO6zz+OHfS9jQMZo+hbe4Tm7JVmoKF420D3lNUswv5v?=
 =?us-ascii?Q?PBHTkLjun4DgY5Cv8nfnTD8ccuZ7kh3V7yoUfKSFdPpOrElxl2QgqxAlZ/0W?=
 =?us-ascii?Q?3adrQB1656CAiM5xoJzAsXQYTpAbgkwN24uUPlfmFca3LZEFv9sk/hCNS5M8?=
 =?us-ascii?Q?n/VAfh1hBXfvdYPDAj1IazqUTvP7f7Wj/01mpRIfUfZJnw8rwwLb4OHOivMg?=
 =?us-ascii?Q?XC4ZNFZt6HTynkIEbPekExQKAAUp+pA5jFD/7EE++lsmSOcaj99ouKQY00vG?=
 =?us-ascii?Q?jEk9xjTBEpytDjzvqF/7t1P+2v9ZDN7x/yLjgBZJ8eQb6YqI6vMGOnPziYCp?=
 =?us-ascii?Q?AOyfEGx4mRX6gJjlb+ukSu4hNuRarHf2cVJpc8TbE/QWgw025CIOPL2HHLUi?=
 =?us-ascii?Q?k/Yt1IAdNP733f7wN1UYzVwlENjc1Wkfgh6qzpROHcJ02lBbDEA9sYtZSClt?=
 =?us-ascii?Q?6678rpjTCfI4R6jAAUOnUOmBvq3JJ9eJdNgqYkIRu2Rxi+tagZYPT5EJu/Ke?=
 =?us-ascii?Q?ZJ8qPh2+kGObI1TgjzZqHybccUsxHdeGqeFHbQP8nO3rO59p0NBGQOZVAx31?=
 =?us-ascii?Q?cUZS3ars2597cRBaVvulHjdAk4i6y09vSLwosSpD2CazLP88WmHj3DUEQxlN?=
 =?us-ascii?Q?7MTL26fKU/2jnSl29b/fhb9vnc7Jz2ZaC7ZXGFrhyutUMIO6H/wRn2XtcrvG?=
 =?us-ascii?Q?pl09uG2kQbIigmvMAb4R5gtAt1avSEpU+kg5AyHWW0ZYlAuBZJ7y8OWMzoLP?=
 =?us-ascii?Q?xa+C4x724FWljg7fva1yo6NAnGPREQcoI0AjeB06ymnVfM9+Prs9NRd+x5N8?=
 =?us-ascii?Q?dN3dgyTZ8MZaBt0gsC6vt/lFm9ckmJHTPmSEHp31O0aT2xQD77SGYOnWyELZ?=
 =?us-ascii?Q?aW5+15gSoHwizq2glnkpwvDf1R89xltrgJ1xjxyHq1loyKwF1PFrY8PHeUvo?=
 =?us-ascii?Q?7FU14D7erLMuvnxJzrVEm1TYJbS1tV+yA3kI5C09U8mJP0R2wEELXIrB/w0M?=
 =?us-ascii?Q?LJI/u3d+uZLcs+QHF0T6hGIEygwR3FI7tVwdVdjKpyZCur00cww/napcY3ew?=
 =?us-ascii?Q?InIweydrkXiMJeoqdLaQ9Csx+cb7kIjaqdvlnFcp8aBdIRnH5mrfKRYjHout?=
 =?us-ascii?Q?xSlTtNkTaAO/gtgBeLCccvtO9V8KOlnC05TAmLAw6cHZ17+CN00dAFcezzCZ?=
 =?us-ascii?Q?DtEK+4I+LC1OjBAFGwvlqOVkoqs9C8799POjlTAc7IwqE4cq+OE5X9JlOZZj?=
 =?us-ascii?Q?dhcDdAhPB5ayiBeWSe95PWZkgBDaM16A/tdUvvh6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba5fb741-ff9b-4aca-6bdf-08db6e9c4ab8
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:55.2072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwZo/lNoIHKTt80v3ZaHUrj1Py/BIiENoJXEqIjPRtgbjThprjcO/YGyaa6WOCDo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5912
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
2.40.1

