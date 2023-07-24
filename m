Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5587B75FDD6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:35:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=h8vEvwYe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nNj1mlQz3cdC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:35:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=h8vEvwYe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8c::629; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6Z6v8Yz2yVq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cpj0n2K196ZFLEmqV12KgnjGBkQL3A9DX+Qr7hYA2VxiXXugaf46KP5uHvppNJKbM1q4ylHAW8If1+iDb3XqPvvyaqVYafS0kiY2uVxRZeEDNPCEuMlqN6kLKEQ9S32o0av7N+0709GzIgr8sCouAC/b7Pu6Osz3//KHTa5TT5n44jdjA1DwPwfP8RKutHBA+gYsWSVhNyuC8FxRkzMek+HwZ7iw/MWXwBEyXEUcgG29SJWWz5IgRuIFXXQqhSfApmn7M/TLVDcayHF7LroUQdkNLZyFge8onO2duF7cic+xqNkcUGbzCFJxeTkEa6LXfvsIDyeZGJ5v/jSG0cE57Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2PBD3BXOVWRc/f35qHZJJJCRX+RoW6GH1RDzoMlN1lo=;
 b=K0vG8Ty/+kOuZu4bV0qrnBTNpC6TNEBsSk/7M8Jo3FCwPeSH2T2SV1KPrv4gYWlBQKGkwRe4o5hI6plajZGKZgumKCCqJezQSKvyPgfDKe9NIargE5XAlEO44HcQJFmCzKxk5mT4JCRkeJYaxl+TAJKTjx7XOR28vAQHbGFc6EneSy4xL/wc3b2PemLuoGCvtLj/DReOPM+hDIEqfv79CMRfgaRegSwE5oyV+mhEsfWBH+cfAIxIGrSJULs02oLWoONLUGhbc0oS64tOz+OwQFwIzO2U3NA2nOPt2G3d5zae0ROVxGbKZErvqX0yAa7A2X0b2wYOYFeN1o8EyqYvVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2PBD3BXOVWRc/f35qHZJJJCRX+RoW6GH1RDzoMlN1lo=;
 b=h8vEvwYeXg2+M1OES+hGPYUn5Iw3VkOrh5bMIQttOFBf8bahd/2TP1jPKypqjDxFt39ybT+V03x/t2BUY1Mo5nV9vGD360+YCIP8uVjS2rZ6R4FyaTW9bS0/3BZdnUfcImbeRBHAzBqrN/npqHjZEzI31UEiA6VkWXvRCQk29vJEDXLpVjO702h6lfkwCeamN3/K26biyF1ZuWtsILsRXEsM7Dcq6NhlF+o/1Tgez8NXds0vykm0iqzHbBn+MaEBamfWU620VNNmjgbcT1duzznBJMZ/zXl/35jI0IE2RjxpDFY69YdRAW5nsiRDCxmq7AoOnn/XFTpKIuBl8quB8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5252.namprd12.prod.outlook.com (2603:10b6:610:d3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:25 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:25 +0000
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
Subject: [PATCH v5 19/25] iommu/mtk_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Mon, 24 Jul 2023 14:22:09 -0300
Message-ID: <19-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0013.namprd22.prod.outlook.com
 (2603:10b6:208:238::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b560a77-8dda-4cc4-137c-08db8c6a8891
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ipcVVhd4OSYhyyhiAYCKrzN7XlUFlF1/v88VXvPl0lEUvmKHE0Xj+1/IG+BNu9Uio7DZDLwU2ny4CporFcfwB1TNpEwFg326dkhQJcBjxA3bhjP6lKfbK0xurwM7iGEPm6rzeURyy/bBUZYWejDxfX2RLj2Yaai//gBwBFOp27g2pXSeNm/O/q2KsgmP3K6fg2CMIcl0h573ZYBYdJAFSvHc/Sn+drefPnAOrt21JgBvVhOVzDn7sGTFUyOJ4peiJcgGbQ8wLxM1g469lnUFR/6Pmxb89seMre+wX4NcrttSaNFQFO5prxDT5Abwf+7wLuNqXvj9cpgHauwlMaHYFkZRlWR32F5aPsBtaHlK0FTfcRsJ6WEOQDJi6mmnxhmH8++ajxbdtY1UN2WZWpkyNXQOG19jeCHkvoSNQTMOt9ajyk3b/nlCtyoT3W9CoDsZmpUzJxU3qM2h7IewscZiXcgttC+0/m5OFdHbJD4bAyGtlbzIQNf2axwnDnl5CThPx+j4JR7fv4d3GI+oY4F0YDNrLG1ZmTG9V/T0CU6inxduqwDQQ8isx2e9hnBeJQNCDgtFL6eYEvoUJ5B5pTqTmU19FLQ6EetzCbvg0yxNzx0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(2906002)(2616005)(83380400001)(4326008)(316002)(6512007)(66476007)(66556008)(66946007)(107886003)(41300700001)(6486002)(36756003)(478600001)(6666004)(86362001)(110136005)(54906003)(921005)(38100700002)(186003)(7406005)(7416002)(8676002)(8936002)(6506007)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Iiem+Qs2e1X+srqD7iAVuxtpvcDdXAsE4MhAsiVifYe0SHxpudyFb+72f07E?=
 =?us-ascii?Q?N3tsKARg+OObHIRHi3U9TtoY7VI8ZM3VS1yVPxBsozxhEM8q+AZrrOIJMEBt?=
 =?us-ascii?Q?/KapKfwVf53RyC5M43wWRkviLenkdhI+uW/yB/3A1KoubagNmDiNs0INDOju?=
 =?us-ascii?Q?C/cfNCnZVVsdYrOXqVPa/Sly3A0FMndFkMyyEp5xF2Q/Dl2M3cjLsnMpoauu?=
 =?us-ascii?Q?TnbEiwZGY/Rl1ysX2O+wkGyOOeRGvBciFKI3Rfxxlowvu2Wy1e+x6pRgqP+c?=
 =?us-ascii?Q?PW4gaDwwSyX7Nitvyi16/KD7n1Nzjtp9DXZ8vAePtYQ64j4ugqSxRn2Ja1VW?=
 =?us-ascii?Q?c+9xFnYkWhMZcgzcmvEHk4O4/F9dJQ/tFClo19wSEuuvN6L+fnWFwPK1Jzv0?=
 =?us-ascii?Q?L5zWD0vd3jv1wA+3169ahMBJ2DmfRMoZt9INm19EN728PocisCyxMiKtj6dN?=
 =?us-ascii?Q?vSkPhcShurgZZdKtPcRIAl06jbj9nTHafXeTez9XQm1EHV12BzSlmGTMj3By?=
 =?us-ascii?Q?P4f2veYRhnmDEkU6WhuE6cgzMFn9G1a7v8fke51769cgv8q6s3wQaKme8y5P?=
 =?us-ascii?Q?puuwFCof+Rn8FbXhfCXSwZ1CZI2GzSQ9kVhBsxJewOdUh5lvStlNBVQt/rT1?=
 =?us-ascii?Q?cxXteSZOlMOJRuQd3OcIDUXOrUjBj37dLm3FEEYy06Q38Rgi56u9YpOQjEnZ?=
 =?us-ascii?Q?cnTm33r6xUkjOhlQUnuh0UCvq6lh6ZMLonSXz+10HLb3aDOnwY0n5f0Ui8cH?=
 =?us-ascii?Q?EEfC++HuSryHjftzUdMrU6aTwCoVB05amnEOLhgvJ+nJN28WOYWNqYGYi/jD?=
 =?us-ascii?Q?fN2MOfYY4CY1Hmod8bPmXlU1qU4YRGNILTQ6PgyWYzx4bVnshh3qv/HzA4rY?=
 =?us-ascii?Q?qDMr3nyhFj1VqUnTMfPR5ozK9dDoOwLnf0xjTkb3U3VR1idwAXP9LBJh5QQ6?=
 =?us-ascii?Q?ho+HOz8s9xWfvtRiaPm7WUhUJPqjVj9i4zP10dt8nxPrZ7MizkS8ETxtKl12?=
 =?us-ascii?Q?17xWyBCyIn7Aqc3Auq7Eg89QwJ1fnJrCefwuutDlqqZCaiENf4ikhBDhh18v?=
 =?us-ascii?Q?arIKpOsycMJE45SRY2BdhoIC2SHaWFIulDjVYrVyYiMoIc0r+Ad1rski0DTQ?=
 =?us-ascii?Q?/AOnqvm64nKBOjgMFi5VPsoURkVm85JA4cWbseFnu2vFIgmQ8cDhg7bM2/Jt?=
 =?us-ascii?Q?/b6/PpOItOnhsxIiGxQ3fkqUBU583pkLAAVDw6KNJT90T4fGKiYVPoQQE45B?=
 =?us-ascii?Q?YJOzPml3GMa+jEaDZVRfVGbj64D9op4GDx8cf3CVTs87AG3w30mvL1QzUkOW?=
 =?us-ascii?Q?bik2FSeFP2EG5B4SiGGW2GM6rK7+iQEUdmyHEmsuBJVELq6h0rSrlJED4QSM?=
 =?us-ascii?Q?QolczUdJAayReVfpHD5K201ZY2gVsmH22OjLni+Ezy6x9ZQ9RPCCHatW5jrO?=
 =?us-ascii?Q?0T/Nwx+YzL5FMFiHIIfI1mIGdCTU+uHrZJI0450tTfB9Aer1s5K4t8m9uOTl?=
 =?us-ascii?Q?afw7eYL7R7tdYFIOTTLiiVMjHw69TG9etFiKM2dBnycJpAIe7hj/6iqmkEgb?=
 =?us-ascii?Q?enxmqtYf0spexivKuWXS1vwxYJdOSfLlvNUMNgik?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b560a77-8dda-4cc4-137c-08db8c6a8891
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:18.9732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rK6FNlbJ/5PlZOjFAm8w7vryH1Ph2psCwUbCr3E5tjBAy0/ndIUkWkEOmD6p0RfM
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

