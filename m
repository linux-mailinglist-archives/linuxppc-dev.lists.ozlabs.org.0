Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 342A672A40A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:04:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdBrP6lXPz3fpM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:04:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=A6of4EQY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::610; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=A6of4EQY;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBfy4QVfz3dx8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ONnco2GF8WhzqRHjgt9JCr6mJOw6MxU9QvhK17Qg37xr3MTAY2ARpvNFdpuiIM7cUidq00keu5gOnWEn84EHKw6GoMu0TjDoWoK+Gsy6yIUjNG+n5l1ATMzcOVQ35WB9JBCowaveiadNWBbpn2bEJsZIOE/g2aSuU/7+Avv7oEFO+G2i8fekomzQEJZDb3x8uUY0y063SYRfvNi1p6xLp1v+a13+kPK0vnpIFs9K53KUmfsL7rnLAnTh/R+7FZ0HnlUFmAsCvwh294E9cd/KDwOZ/eTILSKIralo7S35Gmx/3fQAVAuXfwf2MKgHhQAkThboX/EcFYgyYc5aR5A46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oc9+cmsyQ7ClyqBWCUJKmesYXwKbwskFnJn3iebEKMo=;
 b=kgmaQd0AoUYyReaqMuVXh3RtbfANb+apS8fmMMzeH6ZcYBLNzTQtcaLBRYezchy/CGfKDK0HDNRn9uvnF+W8J2QuVu5e7Q9VWyeRSpWKY3jUwNLWzvb+vtwvCE/nNRyhK64ct5+FcXd8svrB0V9nxc+a/X/2mnU/mZSeZNcPxB7fIgtzjBwVSW4cXf+MFGWgBbebzbRwuaVe6vLYUsoIP6if7lYfkbJJdBykcRLO4Ohr/JgOSepCT8dPre8a2hKyZkv92vL9Hu+RqM1jmrUJRKlLjB1R4/69rhKkF6k8odUuzcKqK6b+XY9S9vt7HVykLYKS8uhya4LwtwqAMDm3Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oc9+cmsyQ7ClyqBWCUJKmesYXwKbwskFnJn3iebEKMo=;
 b=A6of4EQYw97VfRbv2z3Le0aECz9dEaiU47foB5hd4aJOsrlTDr8JWnElJLDsDbsZHH4XqAm/9DDtOwWHlMjyKQ6tp6nS6ka1zZpelbRgQ2HNTNF6WVYOfIr9xqwifaiMK6xNWPkO12bIlUoPaiDbusuduSXBKUOTuEqZLf42466NQKOWu9NT5azw1nnSm63BnOaoLy0RD59GXdl0U9wEGRRi306plYyhdjIOJKeLY+pFZGwDejNoDwwMeCMSQkwSNkNkS4HPNq7EbhnLyVX0Cauc1CsxCFrZUzMI3JmrMDFMVKABh8WRZEO4j4G1gZFkswURv0IWwaDlEKv+nWVllA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB5264.namprd12.prod.outlook.com (2603:10b6:5:39c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 19:56:21 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:21 +0000
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
Subject: [PATCH v3 07/25] iommu/mtk_iommu_v1: Implement an IDENTITY domain
Date: Fri,  9 Jun 2023 16:55:55 -0300
Message-Id: <7-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::26) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: 7856a976-9cca-4824-e529-08db692397eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	YKexdcYZjJdWXnlzmcT+KeLI0vO5uvOI77vGkZuPhzHhtPn+xRmmCgjMNDnonDo5LHUYE+RnrkIxBa8+ThyincXbLwBFFrrh6Jd+iWVIAJzk/P2+UD6TqEKxfb1qi//v2nz3FxLtgzTi+HnrrI5bxMG5CRpdKKSGOBG9ISaZn/a4OqActydHtbrrdRae+AQajP1TxCziDjehXFM6AmE1VZMNFaiWorEa5ZuLkZF2mN5+yOPQdkn+rKj8WPBNXXP5pMgaGk/YP9qCMiM+6Ewmt8QA2UQzxzeJdoIDeO5/DaUZyYRgT0hFqMMU8BpwtqqMQgE5IxNlrRI4gkepxs6qUryHZB3o0TCJtgcV/OcZmgIagRpjzBgQMsk1ti7QIrI084aSpBonWtShnxDaz2Jcfvkw5aEeRE2JL/48moe5Hai8iR4/aYWppFehyyA5tqjMHZVZuLO6DiZfUaJxxC1oc1A6yC0ZdlNGr6kYmsd7vLWLPbhcsgzZUHtonaUoiq8+kpD3AdI2zu1fi98R5SdHV5nhH4GCi4wlltlWDnz2Z9z5ydrjpE7OvsFb6L0chpYSwZfdTAyyA1Oe5AzBOa4aY00EerE/JOo5OEaF59BaoH2pL9sRhuyfL6vLf1U1GZct
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(2906002)(83380400001)(36756003)(26005)(6512007)(6506007)(478600001)(54906003)(110136005)(107886003)(6486002)(6666004)(8936002)(7416002)(7406005)(5660300002)(2616005)(41300700001)(66946007)(66556008)(4326008)(66476007)(8676002)(186003)(316002)(38100700002)(921005)(86362001)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?mugXLiFcQTl5IT2CoKPn8SmoCPQfeYUSdWYNvjwmqyEItiOnWQBf3Qv1c47H?=
 =?us-ascii?Q?i+dx7SY0sGQ9dD3w+Sl2QjjOACJqByHNXLtYw6C+H75Cxl2FP8GboERYGnr9?=
 =?us-ascii?Q?jxjgSkJdUYWK0Rayj8CFsCS2+Bwz5gPd3fdRZzOOFllCPiQ47IDvR2KzdwNN?=
 =?us-ascii?Q?i1ib+fthbI0u4QfrZTTMmw2xod7vyBwAPPKaYHb8l4aX6u+cVtywByP4+UcQ?=
 =?us-ascii?Q?g87JiIZnMnBrjZD2TOi/xH3lJaXqp7Ebb3ZwvrltSTisDKOJ0mbgRiOJl7Ch?=
 =?us-ascii?Q?UJUVyqLfPhLPRRRZk/1UaKloehctcF4YvDiNfagT5iLu7XRMguVNHi3WsczP?=
 =?us-ascii?Q?blnAMhP7LoE2Bqa/MfLKVoUbM4CjialX2IO4riOCS01vejjYFSY9IUSaOClp?=
 =?us-ascii?Q?2ZQfKBdOz+JxJYKd1t14w1Xin1LeBtqlXTElFmrXyGlpo+A4Q2vzHwfTEWt3?=
 =?us-ascii?Q?BIs5xpwAWf9rpR8t5bk8ZBmpLHt1hytOLBaLcanNzrJTzOOUU1nV/YwTb9wG?=
 =?us-ascii?Q?J0Aja2onN9mACUZwAZZw7uAGvDYW7IHYu/jVUFO8OmkgnZzdIvDPij7WbFxI?=
 =?us-ascii?Q?PRFeWotDsoGymb4MDK3paQApDzKUOG2/6n8X03uqCg2zCFOE2Ib//QBR6w05?=
 =?us-ascii?Q?01LkxAVb0oHWqVFDeUfNARII1r5lkOgMBt/seCoz7RSHlEErhRFudNGrWdjC?=
 =?us-ascii?Q?vHUYBZpFg6JzFHNcSz1VtX26J29wibw20uYiUY+PXv5AvW62vGQN/yZBLmsh?=
 =?us-ascii?Q?bMPu/uNA1HzqkOhSBmHLPjJxe9MLFih3aHh3fI9zYE8QzfjwS/frSES7e/if?=
 =?us-ascii?Q?hEKQBo5nYPRHBGC5JdSitydotfjUcVuLrIHmm+bunN9cREreqJr1RwMKoRGg?=
 =?us-ascii?Q?u/icU2kKIiy14rJ5C+0IyQIDVvnA7f/STox6t5sU5r2ENeEnhtZ9FhR8sjmk?=
 =?us-ascii?Q?Wtf4lu3chvb3S0IwhmsvNUUHBbfhmIgUwzG0p7Ng4fqcdtzUuxo3htDDL5gN?=
 =?us-ascii?Q?20epRRB27OWb0FVnDI+oA+sEuX7NqaVYMHKK6KPHm8eeu4LXE6yvBmpzVfcR?=
 =?us-ascii?Q?8Rez/CEEqMFuvogeK+L5e1FMLaC3lsOD6gky9eIxoRYA1U8pMNLDXkQqn1O3?=
 =?us-ascii?Q?KjevYgK2YhXgLbHtH0lXT3sn7rstHfQSrqsE/ZaIxv9uuSMmNH1085qguVY3?=
 =?us-ascii?Q?w1EaA8aVH+yMUs8zfstQRfiqgGtJxfPpOWP0fLSd8tC2vB2DnVNfHDWzANDz?=
 =?us-ascii?Q?V0U0mAN5d4YGS8NCGbZeiila0oKSXqA7P9wytZdXbbiHmhZttSzRSEHXrgMx?=
 =?us-ascii?Q?yK7bi/fDENoyxxV0rs3yPkMgL+cdGKftTNPbxZOVIutGgh1ge8unYpoL48J6?=
 =?us-ascii?Q?d010O7UnwHwsYqyBzBarp5SdC7lr4KOtgYy8uwOV2W9qciBjacYz8fbMaOFw?=
 =?us-ascii?Q?IaCvL/qRW6lHlExM7SxHfJKhmTGsYbVpnaVDM2L2Rg7kdLWXX4qVhq4yJM6N?=
 =?us-ascii?Q?VldbWiADiWjbBJtlKs8jAOJ5n1F1vT64ySQzDopHNuAZF3KOei3IXIebttky?=
 =?us-ascii?Q?bQGuEcXtrpFM2lKT9g8+HXWNZu3acB+picetfQnp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7856a976-9cca-4824-e529-08db692397eb
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:19.8465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 34Vg+yhZaOkC51JWqFMk/o03N9htSqYZ08AqdguWagkA8fZ5Bd9kMYcPvDL3atzY
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

