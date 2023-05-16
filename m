Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F315704223
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:15:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxZY1cVGz3fgL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:15:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dlMGMvMn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::629; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dlMGMvMn;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxGz6n5bz3f4Z
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cf34uahhvgKKIrGT+jZTH7yyDn1lMi7cDHr3caU8OmEEJZjvdrf8jcXuGZ1r0kPwoha1nBE1D6AMPiJMGDgSNl2gwa6tJiBgrbY1MEiIeUjPdKhXYo45/jZ302q5rfVpChxxBTOQnjC8XP61iWG1Q0FeOnkiKfNeOg+A1nYPs+UMIiZBEi6IM5xbVQrHUIxVCMi0DVNSIhoYC04B9gi10zz/1FZ4+ayzml30lMXTScnZ3+sTrCKPZKUEdDxIqzUzy1gXjcWoJtCtLM8y7LNTfMRmKjVZj9GpCef4u9uj27pXLqsgyWrNS/5ZO1BZ1WXNgOc5aZQDSBr323d7juOm/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccdy4lMCVhPTXmPL2kfCI+rEpB3OgvMl4gKeFc77hkA=;
 b=kQsjtumjU+mLXyLMCzMGQNGA0qJYUq0TCfFUkQCzBsOMmlG6d/PKAQgs4tKUrCKLOaX9IELP+/3bmPXPAthwY48kEsA3GvqjnIvNw3BuhXjGZwi9onx34GicNZam7s+oej9c+ErzEZ0pAhYqoFpbHZCwX4E3ubWeq0kGRbicQb14b0btgSf+di5at5Xi/a/JMiqmcWE0JjX5Z2oBlnlnAaEWjtG95mdxArJJVKAqQLHcLYT0TjiGmZ4OU85sSkTzBH8Yl1uOksdwFw20Wa73037Jyp30fZ8vM5R7Mh8wn+XOfnPxUcAPDw/aZOvcOtdYY4JGmomUnwEbRsybkpziQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccdy4lMCVhPTXmPL2kfCI+rEpB3OgvMl4gKeFc77hkA=;
 b=dlMGMvMniemOGX7UA6AI7d4Js98/oAQ5+IvIe9Sgf9O6y5CEkJuk02nPUL+Hi6+h+A6qEj6PzhyUkjNUP7I6kfPPDTFwEeHeTXtyz00vulW85Ggep5cke1rsOY2jICu0fd7i4mL0sh3kgE7YRl87sq7REwYwBWjh+HlOen9FlTyHjoPQuslbSm0Y52opt+nIbvq1SFORpOA9oYWo4lJFGQWl2AUjYy1zL+/czX5cF5De0yjdKKybS9WSQsXpW5RWeXBsNfV8fmIp5kcGvt8WNIvyfqWYI1yG+48zp6lM6x1v1J+fSRoo46Gg1ePEHfu2Zj2TOBe8pJeVEPLgp5wgJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:13 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:13 +0000
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
Subject: [PATCH v2 20/25] iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
Date: Mon, 15 May 2023 21:00:53 -0300
Message-Id: <20-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0042.namprd15.prod.outlook.com
 (2603:10b6:208:237::11) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: b732e9e5-882d-40fe-c6bc-08db55a0a360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	GbQr/5teghGL4SIZ2KQ5xjWBRiaspSGkI+bDITxkamBIjuVhlxjyT9kD4TBw7MejYCknnZErzeFfIf5pWoISnLU8ryaTtPUCxz+L60pym6FydrQQB771cWPNKkkcjux3xy0rsyrS+/ybk+SqdEh9HYl+Clmj2xj6oRPIS7tZbZs3bmSIq3wuAXvo3hVGHE2LBHFfOEdWZDy/TYVv99+Hh7JoBxuD3LxTt6Q3SW2pCGb3SMVEweR2Jv8aPUdjfKbni8KqCBPY95VNVJYs9ZGwUvk7wUkxFNoUAIsutlfBlu/rtGlnJDXpVMeWLuD88BOq3kmTQFbaNT4gW9g79FElHcpd91Ftgp22SG944H2M4qRwELQ0Q0RIgb7AYTGtbE9m7qKAeS6VQoHF5gvEV/2EzeD7/V/581JEOVviQ0Eb1kEpYXQrjYIammqpLl0GiKEeU5YBvIOOlqpiQcZR2IyGI+CMDs/xlWx939BCxZPciginzRkAMIa7A/Hwxooz5gHyvO0u6imCbi9z3C1yM17WgqoKkD4+s2drkaTM8QtIuBrWyDWk7fE7XQfyE3dnv6/tnumLuDk5R/4vGbebnRPLPb7OxQuzG/0ge4MvECwYsaQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(36756003)(110136005)(54906003)(478600001)(38100700002)(41300700001)(7416002)(7406005)(8676002)(8936002)(5660300002)(2906002)(316002)(921005)(4326008)(66476007)(66946007)(66556008)(6506007)(6512007)(107886003)(86362001)(26005)(186003)(83380400001)(2616005)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?j661ab4DjUqtOuOM+MqF2HqjKhDdV8SGNhmB+a5uHiHXoISCMeWNTu5RwSu5?=
 =?us-ascii?Q?Ze8hShmzKhkj8mD8wnix0Mpq96yCE2dVX+xI/Mk4pfmy3C5h7p+V8PkNBmeB?=
 =?us-ascii?Q?WIaxVdqEhyMrtuze6vkAcuMi/CwMO0Dj6mPx2Zcko9TJeNK6LjbivB/absH2?=
 =?us-ascii?Q?01FNzEa71VTOkIdfaY+rlRFTKknc0SYtOom2jLV0e4V2fywtAvYAx6dhijTq?=
 =?us-ascii?Q?8gCftkrjtZ76IWKKWKp1SbYzp+SpZOf4RvT29FfnmYhmoC0AxMz/6N3sSB5k?=
 =?us-ascii?Q?7a9O+7mgwOYUA2hguVL+y/Jhd+HaB/n+Q90m+Qsfttc3R2SqMY1A8MNmbPrX?=
 =?us-ascii?Q?jsfMltn6YwbMpl3UWwINmdSRW3DAjSDFnmmFd3yovPaoUeK0NOzB14vMQr1u?=
 =?us-ascii?Q?fpUrVIo3yDFSCFvNOEkhT/ZCfI/g3Ugfzm1uFZSXtzLBVkZLcqErw3f1/hSL?=
 =?us-ascii?Q?NJqZnNhcRlkbqCiDAbV5hab2gpZwylr8aC0IxzpN3UNbRBmuBfDbsHvjlkS3?=
 =?us-ascii?Q?6VQhfSNSvyM7P2b2jJBZTWMTYUD02UMUJwV0KFr3fNJ27Ti4erA76J7uamnK?=
 =?us-ascii?Q?Ys5zrgFXfmj9473N4pkDGK2EvpNlq3WmHn4T7ckIzukTCQ6haeBAotcRmlcE?=
 =?us-ascii?Q?esT//w8d+xcSwImwX4xOYkzEb3vqDAzDxUiLCvx9uOl/B3526VhjzQqekdiY?=
 =?us-ascii?Q?gPmz1bZ6h2qhhLuDgfuYWPqq8JXSAU6cgARMhuoBV9OSsJW25hnj6im4oTEY?=
 =?us-ascii?Q?dZY/sjfCiFzZ4KZBy9Pn2TXzrVdTO1TJHAta+NpdSsKoD3weXueZWuGAbapu?=
 =?us-ascii?Q?lDbMYOdTwn2rgS1v38lcNrAviJAS44I76HRLLVHo1nr7SHKV2OHjVyVIqdD+?=
 =?us-ascii?Q?cnJE2FE6yNi2AdMVXgQohQA7s6AsHWRFZCyJ8wpEMkZJp24zz+um2wdByA6v?=
 =?us-ascii?Q?/1haURsGbjj2y22uwDOTXNXa5rDg9baPPN4SA+hEf9VLpgnFawoHfla3RRSI?=
 =?us-ascii?Q?1n5F4uFPaKRUjQrexOAUlMkvExpeRCGOBL+fXOdUfLXocrYy+4oy5gTN6J8O?=
 =?us-ascii?Q?vRWQUDF9gnKO4Kj7dWNltPmeYg0mNtH/FrbHWtukGwIDN95qXFRqD726DZID?=
 =?us-ascii?Q?9jEJ416c0vpMxzEFEeHIIH73AgKLw0I/draAlbErK8YxY/eMDA1KcqYMhzni?=
 =?us-ascii?Q?eb/ZHqbLxbP4AoKln8M4HFsZUHiEYv36lMrnk617yRRtHdvfrUkNDJkhrhlo?=
 =?us-ascii?Q?p7k8bilBk6IT2Mm38WuAQZ/zB4ujXZt+D7/xGVKrjMckMVBqchaLVkKI469D?=
 =?us-ascii?Q?VT2kbliVbXDbHfAGVPmb3S2H6Du8YN8UR00h0lhpoOPa5h47+sC54vo26Guq?=
 =?us-ascii?Q?NNQfMIC78WhotVxIlMrhGzgAC1Ucb1FQ09veKEUv2wbEhktnJ6pvK0KADjr2?=
 =?us-ascii?Q?UzA2J14pijVJ+ZspDIF++PpREorrLtqjYhT6c8qBkctTusB4P4jXA98x5UPJ?=
 =?us-ascii?Q?RaqWwndupECuvmy8K+PInROAjONbU7KKP/u9/6eljNRGmWltPh/7kXs0jjYc?=
 =?us-ascii?Q?sz9TSYKkKAM1uv9D3LizAqhj4uevdF/n46SdnUah?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b732e9e5-882d-40fe-c6bc-08db55a0a360
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:02.9201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQP7TAI4EQU/m0kxd/bO0PzdTuNElkXW3GPN8X6GbWbMBOQKos1kgqCa2nMdmcAe
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

Prior to commit 1b932ceddd19 ("iommu: Remove detach_dev callbacks") the
sun50i_iommu_detach_device() function was being called by
ops->detach_dev().

This is an IDENTITY domain so convert sun50i_iommu_detach_device() into
sun50i_iommu_identity_attach() and a full IDENTITY domain and thus hook it
back up the same was as the old ops->detach_dev().

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/sun50i-iommu.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 74c5cb93e90027..0bf08b120cf105 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -757,21 +757,32 @@ static void sun50i_iommu_detach_domain(struct sun50i_iommu *iommu,
 	iommu->domain = NULL;
 }
 
-static void sun50i_iommu_detach_device(struct iommu_domain *domain,
-				       struct device *dev)
+static int sun50i_iommu_identity_attach(struct iommu_domain *identity_domain,
+					struct device *dev)
 {
-	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
 	struct sun50i_iommu *iommu = dev_iommu_priv_get(dev);
+	struct sun50i_iommu_domain *sun50i_domain;
 
 	dev_dbg(dev, "Detaching from IOMMU domain\n");
 
-	if (iommu->domain != domain)
-		return;
+	if (iommu->domain == identity_domain)
+		return 0;
 
+	sun50i_domain = to_sun50i_domain(iommu->domain);
 	if (refcount_dec_and_test(&sun50i_domain->refcnt))
 		sun50i_iommu_detach_domain(iommu, sun50i_domain);
+	return 0;
 }
 
+static struct iommu_domain_ops sun50i_iommu_identity_ops = {
+	.attach_dev = sun50i_iommu_identity_attach,
+};
+
+static struct iommu_domain sun50i_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &sun50i_iommu_identity_ops,
+};
+
 static int sun50i_iommu_attach_device(struct iommu_domain *domain,
 				      struct device *dev)
 {
@@ -789,8 +800,7 @@ static int sun50i_iommu_attach_device(struct iommu_domain *domain,
 	if (iommu->domain == domain)
 		return 0;
 
-	if (iommu->domain)
-		sun50i_iommu_detach_device(iommu->domain, dev);
+	sun50i_iommu_identity_attach(&sun50i_iommu_identity_domain, dev);
 
 	sun50i_iommu_attach_domain(iommu, sun50i_domain);
 
@@ -827,6 +837,7 @@ static int sun50i_iommu_of_xlate(struct device *dev,
 }
 
 static const struct iommu_ops sun50i_iommu_ops = {
+	.identity_domain = &sun50i_iommu_identity_domain,
 	.pgsize_bitmap	= SZ_4K,
 	.device_group	= sun50i_iommu_device_group,
 	.domain_alloc	= sun50i_iommu_domain_alloc,
@@ -985,6 +996,7 @@ static int sun50i_iommu_probe(struct platform_device *pdev)
 	if (!iommu)
 		return -ENOMEM;
 	spin_lock_init(&iommu->iommu_lock);
+	iommu->domain = &sun50i_iommu_identity_domain;
 	platform_set_drvdata(pdev, iommu);
 	iommu->dev = &pdev->dev;
 
-- 
2.40.1

