Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7693476DC4C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:10:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=m8hlS1R7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGTkV2xwrz3c1H
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:10:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=m8hlS1R7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::61f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThh3V73z2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNrEWueMnOUiexLFc2X6dwlStMlqTBLxWHRST6NeREjUk94VRkxn5PcrqOJ+fGbVD7uvzK2ws4K1muO8a7UN0iIWr4mIUzXXXCT24BsGG1KxF4iqDwyBhKLbt/85vjUUYjRMODPR59MeeWa6b3Wu2P/xdYCCYAwjhkzSSlPVjt0yraMkk3xCjk3FrVW72sEg+Q7/MoD+4c7kbTtcnYXrLGWz0nwkGYz/g9RlYTaGafWKdMDnY3lA5EtvwS0Nk07WFFwRvvmnIEiPcmO+QiH6qr0F1Se/cYplGgSmRrOkJNBdNL9ivSld2OBq8X96PmkrbNvDyc0IgPeuDA6qHwuNiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PBD3BXOVWRc/f35qHZJJJCRX+RoW6GH1RDzoMlN1lo=;
 b=CMzvzAiXqt/JGZED/N2Z3EV+z7VOQGO4KQ9ex6tnuvOvd5nldj72TSmQDYBdTLfPZ9J4VXUQbjAHaRDpV13ZLo8QvXyPpBkLzX5UeT35wGoDSdAEXQDefpTiOih3g/YBscYmeRhEjLCmVJFEW6WXc/QUMEafbJgovOOj0I6ljoWRGz9eNPUN1Ja9hUNmiN55WAPtcDkd3+N+ch+HFC84TZhBILi8R2MHwHKiXE1dZgs1AIm+cRqwEGuKmKx1DQP1a0TcK1LaPO273oR+SJiuw4nHLzQYpjckz4CCHHtl6v2qNMb8k2ChVQvjMgODB6GdstNr76fG4baXcip8PiofCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PBD3BXOVWRc/f35qHZJJJCRX+RoW6GH1RDzoMlN1lo=;
 b=m8hlS1R7uUnQ0X0ivQgKoVMe2TxCz6tDf70YKlSpMOoVBC09VbZFg034yD3Pi5kn12cLjxULk/VkXO4crQfedHuJgqR0ksevc89QHE8zQbURdzODA7TtAW5pWHxTrVn86ZY5GgTN8mZtreIb+C2pLbrIO/gPC/YrB7GinoAIJVPJNelTBjGDEZ3AJAAbb1bDt4ychQlizl7DPDGFeKZYssbIxhkb4w8BC2V59ORes3b5oqYUY1DDdWgFYKGXIqcWuAg/XuCefdkb2vrV6fB2eXTDSI8gVQItCtCr5LuERZLviCpxWnzKb84iuIYfOLDKK4/m+TWAMtOU0brU0MMHsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:08:15 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:15 +0000
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
Subject: [PATCH v6 19/25] iommu/mtk_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Wed,  2 Aug 2023 21:08:06 -0300
Message-ID: <19-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0127.namprd03.prod.outlook.com
 (2603:10b6:208:32e::12) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 3225a828-dfe6-4eef-b3b7-08db93b5bb0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fQ6NE1JIp6e35ENq5wO6GMYsRFI0KXLUWvyH0MD7Az2GeB+IJRCkwIUdkpnwkJocpwjtRvreYvjNdjJrMgy8qFqEU4vw3R0kA3CGOU5dh7LEsCyV0RXee8X/XfHsiteGHMS4UTLX+KxmyhMML9rJd62H4BaM8nkT8LizG4CrUw4E9EJ3blcfRd97GkYvzNDp57g8dCQxen5ITJH2P96tmpAstyshLHHyTBgY422R43UcJ9/t+2oVScKG2kyiryTeOle+vFSclYwbRCPHSnCtrsDZMqsd1Js788M5FOOBYVJdfVEDplR13+VfRF5y59SW7GzVM5JK7vY9veIJ/yAFhlhbggj149LqrU5AewbEcgFBRyumMqXqbFhZhP6zEzz5GjldqiHiXNYgkU7Xq/j82oEaS3x66eIs8TOEoHjavb6HsW6SCAQJLmfSZVcKU3sQIZWyoNchCkrneIIY8UZ6SzKellt9zcJjosf4ywFMWcs1PSDWNezePREla5PDxsULTS5aFk35qIHfn1bwvV9o6OJnsuOYlp42SzXW6BdqZ8mXL2bKVnuHFZejXzJ2Az/+FR8BRlr34UpeZTslsR9oMQp9Oes0UV1apJoDheYGIy4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(110136005)(6512007)(54906003)(6486002)(6666004)(921005)(478600001)(38100700002)(41300700001)(5660300002)(316002)(66476007)(66946007)(8676002)(4326008)(8936002)(66556008)(2616005)(83380400001)(7406005)(26005)(107886003)(186003)(6506007)(7416002)(86362001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?WBsrs6JzdjKbl+poKKzs09KIldiMTQQm/pczdvksjsKF+oUSIuF6pYoHHO6O?=
 =?us-ascii?Q?qfPg70/wwDuNSRaZNVZUHhpwG16v2NYY6jS53OVivcEr9Ue8ZVfgytDc/aNJ?=
 =?us-ascii?Q?3xTQJkAvcSDDiwSSfwzU2/OQhLauqHXs6aYza5WcWBC3cGUwMkHdf977bQIx?=
 =?us-ascii?Q?27CQy94WW2V8SEOJ7etaQyXUng4L929rwRBn5+FxOcAP2ymfVDJFbwZ3Ezfn?=
 =?us-ascii?Q?ApUn6KQkq9n/v6r1Qp8cXksiMHBNM93NjFTXzBhnT5Hk7wnPbcPI2juCc5BW?=
 =?us-ascii?Q?mLmEZ42xEMXnceMPLzsSOekl43z6JtEPINu2fKdGBG14/lUN05pQG+lkghbB?=
 =?us-ascii?Q?lk9lUzYpXTQhxbHN4bE/9FDxepFviOkPX2GbzLS4PICBQ6rOuH2EoqUiEZ9Y?=
 =?us-ascii?Q?OBZX0RuDrYJf8390U4aBoaJ4h444aT0bznXh+Y6qaI9cINpJB+xcHrglY6hT?=
 =?us-ascii?Q?ehH6l1h9q07M3Zxt6cPtrfaucnjWpazjjj9EAuKMb/pSGURktCP/MkMAyfMk?=
 =?us-ascii?Q?JUxp7405ddt61+bPQimdcfZf2XKaFFo2ARj4Gfb9lP96PgbbCv0WF04V/qNm?=
 =?us-ascii?Q?1aiplEg23X+MckLb75TUj9PAtoFRRZLXHFCY0iJsMKPGP8chqYy8kOhgkIq4?=
 =?us-ascii?Q?fDn7Qx8pGYS/zprISNGy3z7Ds/56OgJ1/tMr8QrWKKrv+lwrIzTvk2hOXncK?=
 =?us-ascii?Q?BcAQgM8NTrn1vSBUd7Kd308ICmRzdz9vexCnm7UZ+PxocFu/DrYXagZtJ043?=
 =?us-ascii?Q?raACtoMuk83aB99AD97Kmyrrb5UmEtF49EOYf6ax5g/V40quHGYV5jciuk3D?=
 =?us-ascii?Q?pgCPAKRMmLMZS/ttpkVaw67q3gm0lfjN26fsdKKYIm1WjezclEtzRW52Bu/3?=
 =?us-ascii?Q?nwoRgRSdHa4jj7kniR8UhP2nWAhSa8vYeFE9OBfxut2LJ9XgIRODaF4SL0qM?=
 =?us-ascii?Q?mKYWUBKaJgflR7u2JskYnr+gF46iIaBpOKgvNy2XXURx03x4FD5GS6nZhfEJ?=
 =?us-ascii?Q?ESiAb6AvWl6gxqw/LDjrVY34/gMiS2NTa49LBgSIGtw2/vCFMsYLz4NXUWm1?=
 =?us-ascii?Q?+rhlU8LkeogQcEHH9M0WDiK1FWSbaD4GJnCG8hc5iJpwTRdq80PyzZCisIKs?=
 =?us-ascii?Q?9P1ZqOsY5qbUhjQUV+t6Gszd57h05wwDjRgNa7jfXziCtzmsyU/AYSKRE48Z?=
 =?us-ascii?Q?slRXPpykN5znjdOfv/nrxXPtyepU8QeSL0gG1Or2nJtdfNJWWVMJU+vVy9Uu?=
 =?us-ascii?Q?ut5//9A7vW92QfWo0E7vs44Uo8QUhdhiUv3pN7boxTuoJqi/KO53Inmj7QLb?=
 =?us-ascii?Q?ba27nRJxZwjj2/jB0JLVdyakK/1eiveB2Rr86fkIeXo4lgcFY5YCz2hZE17Y?=
 =?us-ascii?Q?myF8SbH/EELNkGmuzatIokMcsv1e0r2499JDRlDYakKCvNDRIGZD+yu7xUhx?=
 =?us-ascii?Q?R1TJ5ikkERh4s+IYL79Ii3PJzBzgev5dqOVGq7ylbqny7XA6rGM0W2GKDfCZ?=
 =?us-ascii?Q?sX3m5WLJXjFlp5BvLwkh4RDKfjAiryGSLR0swjy+x/N4hcsoHYb1mFLioNv+?=
 =?us-ascii?Q?qNjeiRSEEEuuGRFrL2K4VzoUZeRsTiKkNHnzzwnk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3225a828-dfe6-4eef-b3b7-08db93b5bb0d
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:14.2758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DI1VL8RhrcKWWECllTB+EZUuUL+Yn+0p+AQpehmasTCGxwxzW+XaY2JFf/FCZJoZ
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

This brings back the ops->detach_dev() code that commit
1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
into an IDENTITY domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/mtk_iommu.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index e93906d6e112e8..fdb7f5162b1d64 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -753,6 +753,28 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	return ret;
 }
 
+static int mtk_iommu_identity_attach(struct iommu_domain *identity_domain,
+				     struct device *dev)
+{
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
+
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	mtk_iommu_config(data, dev, false, 0);
+	return 0;
+}
+
+static struct iommu_domain_ops mtk_iommu_identity_ops = {
+	.attach_dev = mtk_iommu_identity_attach,
+};
+
+static struct iommu_domain mtk_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &mtk_iommu_identity_ops,
+};
+
 static int mtk_iommu_map(struct iommu_domain *domain, unsigned long iova,
 			 phys_addr_t paddr, size_t pgsize, size_t pgcount,
 			 int prot, gfp_t gfp, size_t *mapped)
@@ -972,6 +994,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 }
 
 static const struct iommu_ops mtk_iommu_ops = {
+	.identity_domain = &mtk_iommu_identity_domain,
 	.domain_alloc	= mtk_iommu_domain_alloc,
 	.probe_device	= mtk_iommu_probe_device,
 	.release_device	= mtk_iommu_release_device,
-- 
2.41.0

