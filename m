Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B5475FDF3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:40:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JSCfosNS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nWJ6tQFz3cCb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:40:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JSCfosNS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8c::607; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6d5F2qz305R
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4CW2XX1j3PaYtUDVf4D2Z8pULs4lwvd9YTqqYcQKLFGLzdAB7hkEk8ZXNB7X7Q8b/B1yShkGEyCwP0t6HR1QfmnZsZn/VlTSsVE5Kfk70Wyo2UXwNgKljQ0sQgiw/q950yMS7Tvdwni4lz2ZED00qki3x++NblhwDfLwaT6ctMLSFuogdr28JGLiU7Pg+qYwNu8w1PsL/VrI4xb27J7Qkyus5bYO8nefJgYp3deN0NXhZabo1gp6UHXGp8l8Nxql0j5i2rVfmCjA2ZicR53uac527StetmipEMhAVtyFAHK52TL5BfasEAMYIyidRHiHAAJ7WYbXPgur9KM0Pycaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrTafN+07KIfO/PnkWCxNk47ua0dcMT2PFcmy6J4qb0=;
 b=NYMDQw6KYzT2XcxUSz7dXMxGM/Vch+ji7EbAAiAqT9Yo1TKtiRWTER3O44pyROnkoDm36OV4YJXMgk2ubh6+Cov9dfG/u5E4kaFXqs2Rggo7WvtOmajHCiXzD8a4JQomYOEI82D9s9Ariz26JrSIMXuTDrNfa2TDxRbNWT/WBa6m0wx3MCoY4zPnq6PBnazni7L7rmraoLaEDfmxcmZIkpDvuo7l+XMqxcucZsrzZdj8w8vFS1F8PzWUyGmvmLRqGW/izZGhXy0etyJKbTJs9a2B8lXeUblDoUaZE3dO+RXMNvttfR1SBAlMD1PdxDFMBif3QGlGsKo8yfVtbiajTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrTafN+07KIfO/PnkWCxNk47ua0dcMT2PFcmy6J4qb0=;
 b=JSCfosNS1m1T8NZ+OhklFEBtdwXaO0CvcR/YgtKIo/khWVt/peqDa98ETisan4Oria9OWQXR+jMnnOYWL8ywTsHBA96O8gQQneV7ddsvaoxOlUw1558toEEZ0FL2fT7N0h7B0bW+jubwvye/OyPBuDDoYIi5p9gF1Owh3VmaJq9TX55FCPNV1Fi7bmYqSYoiOfnTBdK/1yCiIuxHEGti2zyzmzBjGysVjKJIG/a4Bd2SxLlrn9fJU2GyAKUjbEX/f46wfe3aaK215ZK5BkRjPewrcOTUFAW7vyMlRyod4ysseWz+6mIPkE4sD15/LEW9miw0WqoM+J5OsFlBg4H5Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5252.namprd12.prod.outlook.com (2603:10b6:610:d3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:27 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:27 +0000
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
Subject: [PATCH v5 23/25] iommu: Add ops->domain_alloc_paging()
Date: Mon, 24 Jul 2023 14:22:13 -0300
Message-ID: <23-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0200.namprd13.prod.outlook.com
 (2603:10b6:208:2be::25) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: 18473151-854a-4864-6726-08db8c6a892e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	O5pNxIN528NHo3mA+EYfJNG0sSz3MRmfa3G8qmO5DdjbvlrLgfOC/v1pKTIlQaQatF+LQBTJ/ypFFF5jLunsVXPMgd9OvpxRT+3J3uXgEHetRY81X8FHEdgk+88R3kJyfpWziX5vpSW/mbaZh9htmMuppk4Y8xToNaeAMMMu38BaNZug3MMF04EwFhPKTKVAQIuO+CbAC5oFVzVN47+JjVBpJb8eAeHUDjsokKLTs+/RVNbO27Fcil3D7PjS8BlLgLpadzPvF8AKI8py1aQTtvHwLZ6Pr76Ymp2lfT0nn369NobpyVst9PIxX+3j/56r6d4nYI8kNaZ+vcC6onX6a/N2JwRO73JRWiPFLSaOkEXs8s1hInX5ZZC9hFOsq9gLjw6xcGkP5XxGuVCZ+vWIUHob9OaxNp/irPXM5fBAi4JxkNrLbFVy4ez0/YqSPLTYjZIHtLFaLqZCZvsCpgcy7ASeqHUGSZCnXMXJaExU+bv/IlNY68N5UCpslL19to2b/s8JHr2GiqQr2fzsbxaBRV3XGluNT+dhX2S2RH3YTCUlmW3H8vzqOCDq1GsjonG1H3bo1DAkmjIcb2U9dj9sM9dixasI8uHFw7kOCNQdNjo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(2906002)(2616005)(83380400001)(4326008)(316002)(6512007)(66476007)(66556008)(66946007)(107886003)(41300700001)(6486002)(36756003)(478600001)(6666004)(86362001)(110136005)(54906003)(921005)(38100700002)(186003)(7406005)(7416002)(8676002)(8936002)(6506007)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?iWFp9rI7d3uDeq/1XeiqAnmuur3Vi4ll30Q0UfP2Uc7rsBLz/xeZewQ9SyQ6?=
 =?us-ascii?Q?Y0Ur4qWfuD0uKMWw89vUgZ7FLTs6hPFd48M7dPkIdVZx/F3FYFCFTY3OgDZq?=
 =?us-ascii?Q?vyXNwtCKsAl61HBTeMLZ1SGriQTuS+s2ZgmJQSDDMss6OZA1mVf36b50VbAs?=
 =?us-ascii?Q?Uu4K3Bdq6weZRDPqhg4dfNxWAQvesB5/QNcXwr1tjt4/UqRZEfTPEbikxjvY?=
 =?us-ascii?Q?wKrCnEsnbz6dbTcLFVj62RVLtlvnZFWQzWSud6kTHeWm84sTVObH9MYJCozv?=
 =?us-ascii?Q?jugih/UnwPa9jxedqzEvTssgQCv8NV8uaMgwuYbXRA6srgKQt/XH94S5m3GL?=
 =?us-ascii?Q?hUn5MOsXceZEYABEiuFy2FXC8h7w4nEkj/u9ig2pd/ms8lO4wIEX/REd72lD?=
 =?us-ascii?Q?3cPCdkLW3q9eoEnM4XXAeza6e1O6SBWPcm3BI3gGanHFEHh1dB76hp6xb73j?=
 =?us-ascii?Q?0+i5UxQte1qz4f4td1pMGVhvYcV0L6iX3GfXkH07meVnl1RGK031t1HRRQyt?=
 =?us-ascii?Q?fb/nSuRlaXnm2YkroFHETWEGADrmXKeq2eGlt3UftMgb8xNrgbxoyJ1ytTll?=
 =?us-ascii?Q?vsLfbi9104wG7WaU1GOJo7vdGyBigOzJfzF5ccnb9ryRxGOHU+nUYbZb6RuB?=
 =?us-ascii?Q?ZG3/xEIhMzLTKat9lC8QC6vNmZXMQ/15qZCboRTIL0N9yCtuNn1ZtNDr/+ir?=
 =?us-ascii?Q?nDbKnhdk/EABkca1dPO7tL+msNAWTcDPWAYMjIhPE4JsjMoqzh17pc9ODb+u?=
 =?us-ascii?Q?GdbGixwDNj9eoveJMs/LBx86HjMSdCh4JkpLCOQyjjBC1m+w3MIEWM/1X2rX?=
 =?us-ascii?Q?eBDSKXPNBuDVg6UEWOfes4XEAeZeVEvvjfwDbgvWbK4BL5LloQ5cqocL/mC9?=
 =?us-ascii?Q?dorn4GCv4iT6e8umP8T948UrqZkCUDnojGhpallFVOeW5qYe7RabxrmXveSm?=
 =?us-ascii?Q?kxEN+nWG5oa4TqHu8ebom5CZtajNoMl7l54B/HgsfhJR0V0mntvI7LTflxQu?=
 =?us-ascii?Q?8o0ijz+5A4jGxpIzNM07JPPPidzdCCDemxHS9Yak3qG09NiS+vr5jedtAp4g?=
 =?us-ascii?Q?K7+Cgs1m5NiLOVVEGzyjAoea/4R85ZrDak626JOgaFrQMXSjvS1E4l3EAmOg?=
 =?us-ascii?Q?q+jOnGAdvjr8dvkjChmOBBLf3M4b4FyYa3YqiTmz4TjPy8H0K8Fmw/zRzH4W?=
 =?us-ascii?Q?xcRDpE0ItbxKB4jd6wm0sjXnsnAf60hlcICGFT+tl0boCzLjU+lfuxgEC0+G?=
 =?us-ascii?Q?iiB9/5fkvWU/N4ptPLOanIawm1f8a+n+I9JcHJdyS6ki/1L3vo7yfsLSpr+P?=
 =?us-ascii?Q?XDgbtjSO/bQ3SkP/Y79s3EhfW2WpJpmV4eD043rahBF0IACDpkcxJALI+OnG?=
 =?us-ascii?Q?VxSsYSapdsvmNNqqCcgMfwY06uWAwSlownqajD0rg4rh4SIEXGDddDmNjzza?=
 =?us-ascii?Q?4dGLKZTnFGzLrof7RCG64+8aXN/619L2fUBgYGZkV9Lwg+H5EOEaVcbWOgqU?=
 =?us-ascii?Q?VZK6MQOHwsx3lRw7kHpz3w3qqJmWNF4l4rIq3iNVhoqgJJVZ/4pPgB6IIwrv?=
 =?us-ascii?Q?KbrBNrO2s2Nw25m7cn2Xg9woSOyI4C+WEvCLFMBn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18473151-854a-4864-6726-08db8c6a892e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:20.1360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPwQuQppZvhGwrB8gPAe0F2Ud4zRR1fMunX9VQRoOIbN9XHsiSM79Ydlni3nT2Xo
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

This callback requests the driver to create only a __IOMMU_DOMAIN_PAGING
domain, so it saves a few lines in a lot of drivers needlessly checking
the type.

More critically, this allows us to sweep out all the
IOMMU_DOMAIN_UNMANAGED and IOMMU_DOMAIN_DMA checks from a lot of the
drivers, simplifying what is going on in the code and ultimately removing
the now-unused special cases in drivers where they did not support
IOMMU_DOMAIN_DMA.

domain_alloc_paging() should return a struct iommu_domain that is
functionally compatible with ARM_DMA_USE_IOMMU, dma-iommu.c and iommufd.

Be forwards looking and pass in a 'struct device *' argument. We can
provide this when allocating the default_domain. No drivers will look at
this.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 13 ++++++++++---
 include/linux/iommu.h |  3 +++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index bc8b35e31b5343..5b5cf74edc7e53 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1999,6 +1999,7 @@ void iommu_set_fault_handler(struct iommu_domain *domain,
 EXPORT_SYMBOL_GPL(iommu_set_fault_handler);
 
 static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
+						 struct device *dev,
 						 unsigned int type)
 {
 	struct iommu_domain *domain;
@@ -2006,8 +2007,13 @@ static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
 
 	if (alloc_type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
 		return ops->identity_domain;
+	else if (type & __IOMMU_DOMAIN_PAGING && ops->domain_alloc_paging) {
+		domain = ops->domain_alloc_paging(dev);
+	} else if (ops->domain_alloc)
+		domain = ops->domain_alloc(alloc_type);
+	else
+		return NULL;
 
-	domain = ops->domain_alloc(alloc_type);
 	if (!domain)
 		return NULL;
 
@@ -2038,14 +2044,15 @@ __iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
 
 	lockdep_assert_held(&group->mutex);
 
-	return __iommu_domain_alloc(dev_iommu_ops(dev), type);
+	return __iommu_domain_alloc(dev_iommu_ops(dev), dev, type);
 }
 
 struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
 {
 	if (bus == NULL || bus->iommu_ops == NULL)
 		return NULL;
-	return __iommu_domain_alloc(bus->iommu_ops, IOMMU_DOMAIN_UNMANAGED);
+	return __iommu_domain_alloc(bus->iommu_ops, NULL,
+				    IOMMU_DOMAIN_UNMANAGED);
 }
 EXPORT_SYMBOL_GPL(iommu_domain_alloc);
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index df54066c262db4..8f69866c868e04 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -233,6 +233,8 @@ struct iommu_iotlb_gather {
  * struct iommu_ops - iommu ops and capabilities
  * @capable: check capability
  * @domain_alloc: allocate iommu domain
+ * @domain_alloc_paging: Allocate an iommu_domain that can be used for
+ *                       UNMANAGED, DMA, and DMA_FQ domain types.
  * @probe_device: Add device to iommu driver handling
  * @release_device: Remove device from iommu driver handling
  * @probe_finalize: Do final setup work after the device is added to an IOMMU
@@ -264,6 +266,7 @@ struct iommu_ops {
 
 	/* Domain allocation and freeing by the iommu driver */
 	struct iommu_domain *(*domain_alloc)(unsigned iommu_domain_type);
+	struct iommu_domain *(*domain_alloc_paging)(struct device *dev);
 
 	struct iommu_device *(*probe_device)(struct device *dev);
 	void (*release_device)(struct device *dev);
-- 
2.41.0

