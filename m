Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D48785DE7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 18:53:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=S4h1iM7Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWC2T4Jzqz3dCs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 02:53:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=S4h1iM7Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eb2::621; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20621.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwh6Tslz3c2L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ct9ta2B6M2DYuZFoBgi53GCownFBby8/jK/wVG+2AdFyxEO6KweGvjNgw5ehQGsyWRkBjoy6Uv+CgdKIaM0PwBF730K3BL7S3Egdff4RHkt2J7xzUeKtCCPMzb8KuSHZJh+q2YreBbFo4evzbMGtqEqJIeW6q9I6/7aVkav/b+rsBNJxhpjhQJKytB313HqOws2vUMBhhWAQG3U1lPmM8J/rLOjnR7jqyolHUmCMTcfzIQGIo+W7L4hGoA4hY6uwJWtHwwnP+9byygRI4qggO1a0lgtILVg14/jrd1BKlSOoMPrCdo6qUAcJPWwbKCcetDT6MVbBSsFRsIdMOrAvoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7AJQiKOODP2FHWqjP8ZlhtYGAN6Fmufm32JHVkIPqoc=;
 b=P3sFUJw9XNSyXFr75PtarjQR93udROWZ+eW56HHCf+xDW8LxXOz+FfZJrCvgsTQa1r5gjHZvwLpDDFX6Qt7zcKR8WOq39O9IWDnq3C48aoUPR57lRlNtBlPPPOgjQt8R7Y7kyNBxlk89B82JoxGF3E2/M7Ia87odhsh5NNua9BMtXj8ZXZIX/fJSSOsZMgGb8o1V2OKSmuxZB/wym1l2cKYTl4iiNKUaPOtxLLTU/nTSKVKFKIcXWQdjZJU5bPldBzwN4tHdi0Fm9sBsFb9eaocCR1YBKD57wOCFIMeNjrsSILGTQsexPcpFu8eA17Pvd9bR+V+4J+gQYNH2dohNPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AJQiKOODP2FHWqjP8ZlhtYGAN6Fmufm32JHVkIPqoc=;
 b=S4h1iM7YDJr1Y/iNBZma4+Tx9bvWA+B3vEg5wKk8u7vSKa2aY60t9Lr2PKOvAQbHIp8VgKdkKR5UexODCzZweDxbUDl6p7amGCQsHOIe4hPhNf0AzeMIz5FrZyxVJcMs3AzM/hzTX47OQXBaX9zrBS8x3u0Q8Z6Xb9i6VqsqoSRPAEQzR7ZaHD4eHQtHlRy3JhLgxfFUAbAVNBJ/VQGixw2M96jO2CfzVSg2PYN/o+dNEgUrUIZtKgQ64f6kriDjaCDN4QUQVziRqkJUoONONqWKFaQgWsSlYZqo5wwSrMZpi7BaXdfG5NiUObqINT96s/jSw6X4lMNpeeM/Ogu94A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by IA1PR12MB6459.namprd12.prod.outlook.com (2603:10b6:208:3a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 16:47:42 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:42 +0000
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
Subject: [PATCH v7 01/24] iommu: Add iommu_ops->identity_domain
Date: Wed, 23 Aug 2023 13:47:15 -0300
Message-ID: <1-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR14CA0047.namprd14.prod.outlook.com
 (2603:10b6:610:56::27) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|IA1PR12MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 678aef9c-22aa-4e56-390c-08dba3f8aa35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	L5Kf8nECGsOnDjf4HIpJu2vVvjMgFjnLwpraPLMvpl8BroMn3XC2JD35hhHpP/OhISO6cSPcNqAd2e9UKUlxdXB4ZOLGdxNKlUATqs6gsIO5DjUtNw1N4C/SeFv1IUmpO3bpofFNJDrIRBBsa3SYm5CK00zZk0K5UHO/tk/6v9pc1b9VEGLN/YHe2GGDtYYYlMpNWyGa+gkSDWnN/ShmPYfuzt7a7B0e1wSKkQslt7vMHqcUqFfZugQx67Uo9y3RLg+CgJQNIyAaZDoRPntlwt9Mj9oseD/DHeYM1n0Pd5qSnOsHqpqBAHNOupWl2ptjv0p7NSO3HNCZKFPa2NnwaouZQPr7xam8CXGq02B2uNSSvsuM/SX5h9qrVY/qtdW3v8KHtbdxMeq5Ce/sgSF0U3dHRW4JqaMo/sX77CB51whL1eNUET6J75L8qCR1ap18ndo+Sdqt4FvTx/klWi55yYrwITg5qf0jEc9q3ToCEsfLKj6wysds8OeL/mZY4Ss/580HNa/3NsIEOOyGZbqvzcrxRa9Xrls5vPcL20SguhS5b0SWAQy/4chJLEXMUVNrQusTQRnUmfz4Ad6eoo4kTBWT+M5njz1fzvWgjJU/hWHwyp/KHqMQjuPITULQi20s
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(366004)(396003)(376002)(451199024)(186009)(1800799009)(36756003)(478600001)(86362001)(6486002)(6506007)(66476007)(66556008)(316002)(54906003)(110136005)(66946007)(6666004)(41300700001)(6512007)(38100700002)(8676002)(4326008)(8936002)(5660300002)(107886003)(921005)(26005)(2616005)(7406005)(7416002)(83380400001)(2906002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ps+AkNIbSOFkXK10lQtKFgHGSnhKmEssNOgGe5fwx9eaQRYqWGuMUwDaZsq5?=
 =?us-ascii?Q?4/m+XWImdX6n1Pdh9nWq5sLWgOp2o/5sjBHkzphisjQKUZ5WjhbzBKNylnG0?=
 =?us-ascii?Q?2E+M8kPI/fUtq0Y/nPo3GbCrDHPTiVQgg1DZHekmEWnTqSKR3bZFVkBq+wxt?=
 =?us-ascii?Q?/C0LqX5x8SAr5P0D2vJcBVXnralZ6O/79pjn39GeQZbV0HLEOpbWQwu6wPrH?=
 =?us-ascii?Q?G8sGFHNavupXNoif4Y3UqEtL9+jBp0eMVIsocgEUYmB+G3byau7Mk1Y1qyR6?=
 =?us-ascii?Q?mpZM8EsHMvzreJ5606ODOgE91tNY9McUjtUui1pzGWWR5dBssSo3mztLZoGy?=
 =?us-ascii?Q?SIroYgPj/3YdScgF9ViQ+2XTQHyXinRDHuilKtdPckB9AGU/EIJxIk027jNt?=
 =?us-ascii?Q?+Ze96zdf7N9fprmRVfs9e+iJW6xB9IzCFfQTPFVVhChGtQMy2SWkw+4XqIOF?=
 =?us-ascii?Q?zl/e7ANlh9eeoUfZpkgHJmYjSFmGhpzMImHR+GnHho914AbPYAQlhD1drDtE?=
 =?us-ascii?Q?eYMMvkzGDVZMyBZ6H6PVoGdcHGPtEiAF2RlkvUdx1vGUJEwPsQYZ3NhmhTuw?=
 =?us-ascii?Q?LCsiWisx27Isc8qRjuMjC3vbrFHUTJy9KOGC2ZMOTwgHgWjNQ5KDRWpqZKgz?=
 =?us-ascii?Q?otUq+h4otmmIEmaWeWQ70M3AQVmGLKbCi4ljC8BguUfjjy25lJwb/OCJkUxc?=
 =?us-ascii?Q?tcVBH07on/NLXpekxnL7hsI6ClD13okUP5Srov8U3NDNwKnWZcPBwZHQpWhW?=
 =?us-ascii?Q?iZOvH5dGvwxA+CXtfJBl0aXwoVVpwXOwYMAHV6bfGScPNz6BRTXIOQVSBDrB?=
 =?us-ascii?Q?nk16SQRnRkKlDoIPv9rv0FHWUMk50LHkNzlymmbgIL70fmButS85GMd+KHdA?=
 =?us-ascii?Q?DtAIyjWo055u7KM9B4Msg42uu32vMPuTjBzDsWCJWqrvnzzlM27w3aTCcRJV?=
 =?us-ascii?Q?lWKgIjaoMniP2HxmL55cXYpsTEVK+st+fabuR7bIaIByzgofsA2xrYMCtS9f?=
 =?us-ascii?Q?OfQC3HmdHYfvf/L5faq8SG2GrvCjti08Z2NslIa8X7hxFf5CasAiA7vYSeDz?=
 =?us-ascii?Q?nR4cfx2rzYov0+dhUywpNN5yd8UT5VrkE5s91maOWKyIVx1E25hn24RmZII5?=
 =?us-ascii?Q?cLDKyt7ccQNydqFKcHJ9AKXuZqoDwv4KtA8VRjMyJobmLLQtVdjrrkhtk/MR?=
 =?us-ascii?Q?K5kzQjSoJ7ERpYmBgMPbSAzrRI3XNl32/BeQDSkTq0mWGl75kghPkxdrkTlj?=
 =?us-ascii?Q?GTlb6MIAv2cx3fE0ao9bJ9C5fUjQ6piNAMDnQU9KfV2O0t3P5LfL8HIemHjo?=
 =?us-ascii?Q?lTf+5zCsO53iFjDEsmQaHbGdJDc9IxF4kBPFeszirUoMGJKWqcxwsPV40Bs1?=
 =?us-ascii?Q?+67tRfbL2grPrb/ReIo4hpLIBuJw6TXRC8YQF07tRdUICZGbG6h+5xCAQnIg?=
 =?us-ascii?Q?KKj8vgXcY3YzS9YTZVON3LGWkyxtPCO2wd1XaZ0JdtaDAin0qU0r9cBqLRTy?=
 =?us-ascii?Q?h9qv4ITRrLH3hA1yIyPgUEgPyxOSRkctKHNnSOvVLPL57jKI6AaUUiCBOdzy?=
 =?us-ascii?Q?BTfT750LrCWnvXFKkjUZRwUPIDuMVPseqxwnB2bQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 678aef9c-22aa-4e56-390c-08dba3f8aa35
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:40.9093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXc7QYMHcH3KT8H1Z3AYq42aKBmYP8jsIQ7ZJGoYb0ie/qNbXZtBwanyOlwRxXSp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6459
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

This allows a driver to set a global static to an IDENTITY domain and
the core code will automatically use it whenever an IDENTITY domain
is requested.

By making it always available it means the IDENTITY can be used in error
handling paths to force the iommu driver into a known state. Devices
implementing global static identity domains should avoid failing their
attach_dev ops.

To make global static domains simpler allow drivers to omit their free
function and update the iommufd selftest.

Convert rockchip to use the new mechanism.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c            | 6 +++++-
 drivers/iommu/iommufd/selftest.c | 5 -----
 drivers/iommu/rockchip-iommu.c   | 9 +--------
 include/linux/iommu.h            | 3 +++
 4 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 3bfc56df4f781c..33bd1107090720 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1978,6 +1978,9 @@ static struct iommu_domain *__iommu_domain_alloc(const struct bus_type *bus,
 	if (bus == NULL || bus->iommu_ops == NULL)
 		return NULL;
 
+	if (alloc_type == IOMMU_DOMAIN_IDENTITY && bus->iommu_ops->identity_domain)
+		return bus->iommu_ops->identity_domain;
+
 	domain = bus->iommu_ops->domain_alloc(alloc_type);
 	if (!domain)
 		return NULL;
@@ -2011,7 +2014,8 @@ void iommu_domain_free(struct iommu_domain *domain)
 	if (domain->type == IOMMU_DOMAIN_SVA)
 		mmdrop(domain->mm);
 	iommu_put_dma_cookie(domain);
-	domain->ops->free(domain);
+	if (domain->ops->free)
+		domain->ops->free(domain);
 }
 EXPORT_SYMBOL_GPL(iommu_domain_free);
 
diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 56506d5753f15c..d48a202a7c3b81 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -111,10 +111,6 @@ struct selftest_obj {
 	};
 };
 
-static void mock_domain_blocking_free(struct iommu_domain *domain)
-{
-}
-
 static int mock_domain_nop_attach(struct iommu_domain *domain,
 				  struct device *dev)
 {
@@ -122,7 +118,6 @@ static int mock_domain_nop_attach(struct iommu_domain *domain,
 }
 
 static const struct iommu_domain_ops mock_blocking_ops = {
-	.free = mock_domain_blocking_free,
 	.attach_dev = mock_domain_nop_attach,
 };
 
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 8ff69fbf9f65db..033678f2f8b3ab 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -989,13 +989,8 @@ static int rk_iommu_identity_attach(struct iommu_domain *identity_domain,
 	return 0;
 }
 
-static void rk_iommu_identity_free(struct iommu_domain *domain)
-{
-}
-
 static struct iommu_domain_ops rk_identity_ops = {
 	.attach_dev = rk_iommu_identity_attach,
-	.free = rk_iommu_identity_free,
 };
 
 static struct iommu_domain rk_identity_domain = {
@@ -1059,9 +1054,6 @@ static struct iommu_domain *rk_iommu_domain_alloc(unsigned type)
 {
 	struct rk_iommu_domain *rk_domain;
 
-	if (type == IOMMU_DOMAIN_IDENTITY)
-		return &rk_identity_domain;
-
 	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
@@ -1186,6 +1178,7 @@ static int rk_iommu_of_xlate(struct device *dev,
 }
 
 static const struct iommu_ops rk_iommu_ops = {
+	.identity_domain = &rk_identity_domain,
 	.domain_alloc = rk_iommu_domain_alloc,
 	.probe_device = rk_iommu_probe_device,
 	.release_device = rk_iommu_release_device,
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index c50a769d569a60..d0920b2a9f1c0e 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -260,6 +260,8 @@ struct iommu_iotlb_gather {
  *                    will be blocked by the hardware.
  * @pgsize_bitmap: bitmap of all possible supported page sizes
  * @owner: Driver module providing these ops
+ * @identity_domain: An always available, always attachable identity
+ *                   translation.
  */
 struct iommu_ops {
 	bool (*capable)(struct device *dev, enum iommu_cap);
@@ -294,6 +296,7 @@ struct iommu_ops {
 	const struct iommu_domain_ops *default_domain_ops;
 	unsigned long pgsize_bitmap;
 	struct module *owner;
+	struct iommu_domain *identity_domain;
 };
 
 /**
-- 
2.41.0

