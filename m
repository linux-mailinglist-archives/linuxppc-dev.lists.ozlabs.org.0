Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B3379E9FE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:46:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hAtbfXT7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm1vp6YLMz3cC9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:46:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hAtbfXT7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::60a; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1s40WcMz30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWExLSoLP8WU4exhJzjlj1UOFCefiq9Ptv6apYdUfF6wIJC9Pz/yfwiRZeTdtgzE+mau6EZzJuua/uBLviuJVF0sSMCWqrhDlk6C36F5j7wYG+fEmOdWqCOO60hKZ1C6/oGanvB6HdTcH+GVxfvA2yWqLrDBpyLvPNKO0RXm/MyV+3JGIYS4YDUKJAcgIupXRV6rpErxOHgM2LwQycmYT+zK2ctohWEo3RItBAXYFaxCGeuxB3d3run/qtWnNthPFi9HqUq9MWsf9HWe0tVOoRJSQ7rm8g1ZjFXUBIpVI5YpfYr0Q4YpxiyMwvBLRzqWWZl9vDUVJqYfqplisp+NFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ItGzwAg1z+K+YNDXV09TSLFDCtLJxlNV/8/ZVUr+ws=;
 b=llRCw8OsxJSZG7lLcOgbuV83s9O0ZLrEPeBBz92ckVUNUAdX0Zv6N/AvYlaAVPTVLA5mwiLnJ45hD4Ws/SeLgamZvdCUGVTUOtkgL3bPAHRY2troFSgj8+T4QYS+2M9GkPrV6smJriu/Ukkb+PwdVPR/McxDQmXhSSPb/EfY5Dxy+x+L4rFtoG8Bc3yf/nKBfeGc7Glh98/5U636kTrcZ1FQcR/BrTlrLMz4ALRH1iICGue6CQApMnqrx4vEjLyRtrm43kWJN5l6Z1thfNIsh7hZB8Si3FqXyv8x0Lw8N6TBbCe6Jl/hp7q+j1POpM5g60DD2mk9uXiBRDWE1/ixrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ItGzwAg1z+K+YNDXV09TSLFDCtLJxlNV/8/ZVUr+ws=;
 b=hAtbfXT7NeJ+nPInrSc88yx7KMvm3dAscBu72LQMTOqAzLsti9vLdyLBzc7DiL9djO/d1bOYGgnCSVKUxWGA775c3W6BqjXO//4lCIu5oVLN5rCmL7vDq7hDW+cFBW3AVpJLgiqRWGrpLeLzitqsTT+pyR+OV8rTydAdHnyJ2uZmGAvkZAoTScyQjQK9Gv3Mtt8PJ44fsj33Rnx912rflxkP/jfSP5bGDP4G7rHLhCL0o6YrqDFxPTRGf1wSrqdgC58yW+7vzh8kwWxTOcSRE2XcEfdTAtL0SljKJBoQyCl5Y9RV0Ec3s6/ICIvUzlAej0s7Na7a8wiTFoKMMQrtBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5096.namprd12.prod.outlook.com (2603:10b6:208:316::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.40; Wed, 13 Sep
 2023 13:43:59 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:43:59 +0000
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
Subject: [PATCH v8 07/24] iommu/mtk_iommu_v1: Implement an IDENTITY domain
Date: Wed, 13 Sep 2023 10:43:40 -0300
Message-ID: <7-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0382.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::27) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5096:EE_
X-MS-Office365-Filtering-Correlation-Id: 16fa492b-1640-43ae-c5ca-08dbb45f7b24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	IcdTINvX3gmeYhCp8Tzr4IDWaIRD2uxnXZm1m2z5o5W03ZGcfSwXtTBZCrr33fb5BhhlRtqZ0fxpBqcc8LodhD7ymrYmh60SYUtbwJ3Zg/NA1wvhl7EFIo5bEZRAyLMh+e5HRtWIovOyuSaqDTfwbKR+n8IxySda5lHfEf8+vUjENTdJZXz8LuPmFPU43q2ZiTiuACPF1cA3jQwnybL8E92CoqE2vgKfR6OJ9fctAq3EM7z1pdNx9ov7DmKgL8VrG+VokYvNlp+fFUTtnevwGtLxRTKMJqznbErLrjnjzojE3+EMPB2EHx7rJNgZUjwZeIzIR8wr+0or0Fw50h9SCKQkZS46Ai8kVi2v7gVlh9FARmZj9m5NJmdaRAq3HR4KdKp2VZW5shk2+DJ8T+REBVbDy02GOFqEBRVboPYlaxD8Jm4qMmu3CVYltN+KmDLDPmErgk0jQbKvq5Bxvu4YF/dzA93DBVJfSQd5YG9Kmgci9eHYvwzfpFPWTAfJjsREC01TqxsUEmnsRr6OR9gMh56wiWQK+dChPX8LyEFcipab0JmJyX9/ebQRmcra7C5aMYm4muhjMYNKdWDDqs+NhpCuPy23yr8kJw0K79d4dzOl0bxngmtfm25KSOizp8fo
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(1800799009)(451199024)(186009)(26005)(8936002)(8676002)(4326008)(6666004)(921005)(38100700002)(2616005)(107886003)(478600001)(5660300002)(66556008)(54906003)(66946007)(110136005)(41300700001)(6506007)(6486002)(6512007)(316002)(66476007)(83380400001)(7406005)(7416002)(2906002)(86362001)(36756003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?JRdv0p4JjDdbhsii2/ZVVQV8vYXfOilV2Od3eW2loNKIBerHrYftPuekunqR?=
 =?us-ascii?Q?Cdo3wFPOhH5ihLgCXYSGYkgfnAPlBltMF38IU7tJKfTQNKuPV+j+tqyLmiHB?=
 =?us-ascii?Q?WUgcPLgczbwrrEQQwjQo1P2z7fbJY0NVRVqJL+7PMJr/6TFD9bUoW9lkf+nN?=
 =?us-ascii?Q?1V0i+ZycXIGXQVSG/VUX+mOeLc9RTBi5F2ksGnChazQsAcpTF8a6uuMnkjHi?=
 =?us-ascii?Q?Q7/hMhxPgRusy74V+2ICx1t7wMRG+rkx4qNk48ZPAC6KQzxk1FVQzZOD6gAd?=
 =?us-ascii?Q?2LcGmHvi7UWfoGwjC+EJoqmoJPk0yymJduiH854Emy+mYuZUHxOjljHpxi9u?=
 =?us-ascii?Q?EuGqcPorxjGxdOAA0m/69mbCQO08T/vukF4jPF6OIw0xEEwxIqWTBLTBqiTj?=
 =?us-ascii?Q?uInnxd1TdST/UqU6Ne2nNb3fWolxnH8KXIq4fJeDC+XQ5nmDInE2y/xZBc8b?=
 =?us-ascii?Q?lnIXDQBaASfUD4olg4geb+oglfnYxwUv8griWKdq8vtIO9m1jeV22n4jrmDx?=
 =?us-ascii?Q?vKE8LepIoKtuDptISKjzHRVuU768v+scIOLpdqb//sWR2Cwn/ocZ++ojUz/s?=
 =?us-ascii?Q?H8tgv7tdCbFU4JLI2ut76wvD84VlAsdD5QOGLYmN+j3+NAxSRVZHyrsFiqXZ?=
 =?us-ascii?Q?OMVF4/eNrgconTZ8YC+F2SZnwjrpsfpnyG2ITZPvjtSiNkkWdKlRPzRyYuW7?=
 =?us-ascii?Q?je6snh1am1Rrq8ghp9VneDItPg73+2LgxucZ0UM0aBBcm7xMxbwJ8BLjArra?=
 =?us-ascii?Q?IP4ORwpVoSQq5wxfIr+phpX+gd+3jCH0XAXZUxF35Dy+ftSZzkipdUbdqDEA?=
 =?us-ascii?Q?rvRTOOGOMyiSGah6ROlr0peONQSRTp2v+r7Sgqc8ZqbK8xPOelCVwc1o2B8q?=
 =?us-ascii?Q?Xk7kIh5Mk1/KIpKejiYrUk/+OKGYnrSMbIu55FAPkWJLNiOm3+fdyTBTrQT7?=
 =?us-ascii?Q?crtxi4L0rurwsougf+yzXbMlOLI7F3Dw3AqDmo8RyBG4xFE5TihtZw69WZi0?=
 =?us-ascii?Q?ID4o0Rqsnu3DsulcDxGE5Jq4KW0x1NWJzqVmnzB/XOtPpDix74qGvWieicbw?=
 =?us-ascii?Q?eetf6IEDnscr4WfKv/hbrua9RkEKke2olAWsmxrwtR8/qOSAzcyTx8Pgz7g3?=
 =?us-ascii?Q?tqfy/pNoSgimcb4qDyThjxPhDzG7ccijyUW04H1kQDUmOFP+0Fnv+tujD7rH?=
 =?us-ascii?Q?sPXdqPp+CUQLJvDQumAR8g1cc9Ic9j+OgxknZS4bX3XvPdh6X+okdZEmKcOD?=
 =?us-ascii?Q?ze2TNrffgIGwGlx95ZaLWqxDBOU2O3yfjaE2EWSd8KtSkzCvD9RFQuAU1LS7?=
 =?us-ascii?Q?KgpgL1Y+Xl3GBA+YUb5ZE37XZ07RPvgDvChlpJ3nnPvpjlCcjsTL0vMT7cJV?=
 =?us-ascii?Q?REEDuaedsppzD+Lq08pSjbmD2yxFOU/LUD3wXThcxI5gN4Tm9C7NLEZkGCuF?=
 =?us-ascii?Q?43vd4z1S778oDqO8qAO2o94z0DVj7s1OEF4qfn1tL4JIGPZ28iKDkZM1lbMm?=
 =?us-ascii?Q?J37ri4TdzpwA59CocmjLGUCDmK4mK97lWR90Q4bXOVaWp5/cZWaB+BL9f8U7?=
 =?us-ascii?Q?7c9ZNJkqgyuHfoDXr/RSAxJfojJrj5pyy4Oi5COK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16fa492b-1640-43ae-c5ca-08dbb45f7b24
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:43:58.7115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMSfKzKw9TZO+TyvZ+RU2A8dh0uchYuPnKiqydauhSAfzSQCSJcb3noyqIyVerPw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5096
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
Cc: Thierry Reding <treding@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
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

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
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
2.42.0

