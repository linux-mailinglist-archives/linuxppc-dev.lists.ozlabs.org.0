Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E671A704246
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:24:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxmt60ptz3fKC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:23:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bV+0IrZ+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::619; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bV+0IrZ+;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxH94Yvcz3f8L
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iv3htm8OM+DndC5bgjxFccEJWsbtushlZx1umVfvI6QC+zk7AyjgC3PkFIwsEcoUuKU30E6IBt8cw5h0v46mZVdPAfsmipQzOfdoWKAMDpRBN535flW2y15kmhdzH+I603aswP8lthRRooKzLa5LEkNAA9LyG4xOGjnCjaGMj9PLfbjpp8ieFwcyXMhiyhYKUj33cI5lJ7imyilcmB3froIg6J+63S/zknuHFAIg63ZosDtiMHNOrZlUXkonE/gAQHvc2Rx2RNxp3JLWaso/63V8a0fwQrZy0B1zaW2dtf61ml/iOMCX39i31ClmmiXQs8OgcJDGzFYHoXKo8wV9gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dHYOo7lmtd7yw6zzjbMBlXQO1CO8489E943E48VsfI=;
 b=ofzwjyXctgC4t/UJPk1K4Mbq6zuGSWRhZjfFxubSPxHRxoGm8AdjOwF17hzvT0Bjqef3r24+PpjRKgkwDOhFuwmJZctaqnN5S72uQW0itn/HfmFef2lpZ/lUA/7bne6K5sSEd9QRwdOluRKnHjZFZmiDBIk6wqcrCH09R/Op3tB/CymqNDZSi5nCq33cg16YqfcWQX0zMcCYwa6TR3UVR5WwefhsTD9LJC+jjbUTxf91o0UEU9TNz4oqPosJe0QzGmN6YxY2XJeGGqH5GOi15XcaXWR2qbhKH4H17u0dMmotp2oDBbWgK4RBXhV3WC1yjOlzacJxu8Y/bGUYhZUooA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dHYOo7lmtd7yw6zzjbMBlXQO1CO8489E943E48VsfI=;
 b=bV+0IrZ+0ryiVhHo1tNWSwvJJAhZ5ifOigURjGVd77O26mz2eIe7ONyAVTElnYjzZELXm1DIy12kZuM00/nDjZnH6y2OiqdtJVXW8LTBS02Dp7bPyJ6XkUijYzlmOH812APnds7YxvG1NEPcyf2PC0yZQviyJqqwA6VkJg/fs3IXlC/x2SiUoqYa0p8UXJgSU3eR4YJHsFDqFC63GaLsCOlsPtVRc2V32/BQu8bow1xrzHMJTY8GWuizBk5mLd65/QTAlhlaxMyQhhwqgonz3yhcdrh08GMDHOq8Cn8ffLpy8GPUw1/AbCGs0alvF71dHLw1K6unjbDo/TJuQAAuIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:12 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:11 +0000
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
Subject: [PATCH v2 19/25] iommu/mtk_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Mon, 15 May 2023 21:00:52 -0300
Message-Id: <19-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0014.namprd08.prod.outlook.com
 (2603:10b6:208:239::19) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: db36c414-836a-4f5d-562b-08db55a0a32c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	TMgRZ0bb1MmQMxCeHyLAJF/VyM0KBQrsSaL9++Sgw4iEqHXY53TCvmjtltUJPcCQoS/S8y9iBtVqbXClyhCe8b8iDkkGOaCksBumYWjFmJ5Oh7CxqwPCiuzm4h+7zPabuQ3XkNv0F/GP7WOqZu8PCHri2z06F15hU+SJULLAFuXr/ftOVIErSW4aPxNGRaNqrKTskQ6m7IM2SRmZINoyR5+zagZ8AaLG/zlo6+lxVeNomchFjbhphi2KRVbyRrMuRFpefdNzYdPPskrMIc+B1FTQV/CSITv4h8CbZEeLvII50uPG2LE7+Gh0n1Bq1CsB4wP8vlS4DVpEJ90yi33PP2SkqLqkYZI4RfPhfg5lPTNd4nb4va18bFuljAq6WBWlFw1NAFZlJVhOGMwrS+pwOLQBG75GLXaapCYDGjKu5Z8KPn8HVmXgEWOOE7w2fbpIP5uw4MU3ZGtX1Uy1HxVN0JM6r2fZBJQpnDRNSQt9BBU4h1Xbvd6qm4lZioy/WnsLC+NFrOC4lK8yfubITAlLSz1tUfYsZEqO7QiXqIvrNQ1+GRFkTF8iv6uv9+bFM4Ie6rw7Z3/o3Ny8mpN55mUqJ2B37qZXQP+QGNMRzGAFb/c=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(36756003)(110136005)(54906003)(478600001)(38100700002)(41300700001)(7416002)(7406005)(8676002)(8936002)(5660300002)(2906002)(316002)(921005)(4326008)(66476007)(66946007)(66556008)(6506007)(6512007)(107886003)(86362001)(26005)(186003)(83380400001)(2616005)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?bdDzpaI0FUOo5kRk7NvbjZzc7nsIYY5HFyIDqlcYMNmuSzaQrMzHA1rR0H5F?=
 =?us-ascii?Q?SmDqLNub7N4D4eDO7mUTCd6EaGajndG/UROAo5D3RDOIGC6NfvPEYuxdM/2s?=
 =?us-ascii?Q?iPIuFEL//po0XyXMKVquwxpkBCYIaHE5gt8TjTm98x22sU6goZ1MmKtLebqg?=
 =?us-ascii?Q?Cmznsfsq4v8zqkPitk3ArSKWeRepCceLuR1iYpAuMJkaB0H6mmN0AzByBXIg?=
 =?us-ascii?Q?I4ZxC+uWB5rHoFk1T7A7zi3hro7kV6XxfFg8uHNkHbFChHdvCwXoVnMVXeDS?=
 =?us-ascii?Q?VC1b7EZJks5VZN4OxMkPZLN6EFH1eu+yqh21P42uJrb6/FKavpCgkdDdrJwI?=
 =?us-ascii?Q?927q0mXEK7ULNaE5aDxHGXJtC9+769i2RROc4pl0JCunsWP+s6jROwloMEmT?=
 =?us-ascii?Q?tElEmZdmO74o3TB8UmTIeTg5rD6SaMJ2DronEWgEg9X6u3DRqy0OL3/3Swa1?=
 =?us-ascii?Q?9PycVPIy8jpoFKfuTp5YUbC4wlh/EaFVagQ+/sigetkmYJsOt4+TmEi75282?=
 =?us-ascii?Q?06R2UB+XSL84NOzSmT3B15vKsAK+obRdHPkRNJiOmXMTraBmkWJExfY6dBpF?=
 =?us-ascii?Q?O43zq2v33lunTkdPXROHc8GggDqyftAUvHLyhrioFOhdaaGyVulbcd8cCYLz?=
 =?us-ascii?Q?z5ZP+JifOVfoy5c26FzNN8WbFtgK4i9JN17FpSfGChaVYiM5hNv2xV8sBMVF?=
 =?us-ascii?Q?XM3Ovoi+vTaJyImIYcqEwmDVET8CfLkaaBWzDY1pCy44CErVuKtup3MJzDeA?=
 =?us-ascii?Q?fvYYALVYzqu/yT1A5l5HNb++4KKabuBnJ17DAuXLuCUUlHOQprXX3YYb7CkL?=
 =?us-ascii?Q?fKUNqjyq6kc+74pCRazL4xZ8JwanEM04N4pWsBfBeNAmBgfxKTBGxrslKnoh?=
 =?us-ascii?Q?mJdX1d8N0CIY5+KB1rj6iovZixwe+4vnHetlQCHDfXiqJoshUhVodKKn0K+W?=
 =?us-ascii?Q?/LRD/jVEDWTFNfZ1MqnT0cPB+8IpHcmbVQKv+54AOAveV6vn/25w5AJiPOY3?=
 =?us-ascii?Q?YLoeET15M0mARxZMGUbMSa/NjykKhF5xm7LD1ieG4YFZdm3XDEl1v/MimjHU?=
 =?us-ascii?Q?hiaaiWLTbqi1pnFIrE/+4T8lde9oQaTO0AJGICUxu50I3Ys6XujF6vR5GE42?=
 =?us-ascii?Q?zT9EnEMHZvzqcQXHBr+OVtDppefe17MvWssTn4jsbRcRNfM10MCwAbk9nWG9?=
 =?us-ascii?Q?4r69wMC5nE9x88Jbn5CEZafARWafecP1h+rPUF0WekxEibYSlz8xJLZ8HEPS?=
 =?us-ascii?Q?okWPKgM//0vvDZ2XBvb+hHsycKPfzHDnQzjKUFMJzyQ0FkX13Ex6SqGfcGdc?=
 =?us-ascii?Q?BkdCk26e0/ijcD9Z2Z1fgpP+cuyyFDebJCnN0Jtqa5LIKzxp8qMwdecDBCK3?=
 =?us-ascii?Q?oruzqhqZSGy6cgycTbpdV7hO+88GEznQQTM5SOHAXLSUhHYV+ujGywu6eg7c?=
 =?us-ascii?Q?Eqt8kBhmSrrQrG0tL48NQggNjtficVc9/asz7XKKP1p5WET1a9F+u7gIzbrE?=
 =?us-ascii?Q?hU8ttQutzShlgGax0LrSr3FT97NDNG0kzd/bDv3f6a2u4R99ZFuH5F+V6Cau?=
 =?us-ascii?Q?asfQSuvuzO6hhPjVwFrnIkZfsNoPD4oNjXDtuWfU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db36c414-836a-4f5d-562b-08db55a0a32c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:02.5842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFkPkm1srgA7+QA7mEHwqhss7ZqHnadS1C34vYWg2CsalXaryrbJ0yzfvsbV3c/d
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

This brings back the ops->detach_dev() code that commit
1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
into an IDENTITY domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/mtk_iommu.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index aecc7d154f28ee..e4b9f728002403 100644
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
@@ -971,6 +993,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 }
 
 static const struct iommu_ops mtk_iommu_ops = {
+	.identity_domain = &mtk_iommu_identity_domain,
 	.domain_alloc	= mtk_iommu_domain_alloc,
 	.probe_device	= mtk_iommu_probe_device,
 	.release_device	= mtk_iommu_release_device,
-- 
2.40.1

