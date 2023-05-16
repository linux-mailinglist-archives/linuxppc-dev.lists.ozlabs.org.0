Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97271704212
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:09:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxRm2D7jz3f8p
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:09:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jawKDDCk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jawKDDCk;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxGy3dxCz3bxL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYy+c07QrD/caBAjxR/jO4pbiog6PEnfcYJIWcwMwuU+T0M064VUgHSKySDAFlZuoJX10+WDnpospQtfMOQy0sc9Xd/R1l7VR8SITLAtGs0c+g/5CTDEeYGH+tcUzSeJHRBL9Zc1rwTPs5jxNPxJDZH0AvES6N6Hok+wBMaKw/z8wCpm3WyZgz+JbKKHWvWPAewF8i3lHCUQoy+dJXogTR5wVCFPPSPV4w+u+bTDjoMQXmY4FTfMok0trwZEONcgK9QldVpUcLCg3e2cH3LxNv+AGIaZrkVeIZr36tpvBVp0m7/aebdUdJiLpL/PPVezjcGK5+dPeCw1/x4T2UuNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAuIMR77aQPv61wiHitSmyHmnGNDK32ubF3lpyi4VJ4=;
 b=kX2+Hz2mLVqh94vzUJH/GnyzCKFTMeQswdffXYejFgge3YRrYiDax7Jsw+ioCBgjbRQJeLcFFyY5zEgZkd1LyM84/jf/jR1HV3XGHpUpMdMupkW9DlnZNXsVFQWIiwJre9boM0ir2wKxwunokrPKnTdeVPqTvXv2SH1v1VuKbTB/bcCfK5UDtsoX+IPWZ1kCATsFzcJrVG99ldKHJjJs+rbpHaku/FwRHAmBJUax9w5EJr0RXfLmVaeSbopfQz323a4cudabzGEgUyCddOKCnvTf3+y3nsqIuoONmEVX/ZmKoWauo2bf86himC/fsNOh3botupKlReXtF+rX4Ln6oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAuIMR77aQPv61wiHitSmyHmnGNDK32ubF3lpyi4VJ4=;
 b=jawKDDCkoPNik7ToVGGxijbrOuL0xIi23rqmZPcFgi9o+dCIvx0a2PtJ/QUN8vT+Jfh8fNdOcuvItbCwaJNY30QtEDcVQ/QfzwkD918z1CiW+1O1KaNIxKcaZqQCvfZD+9zlXi8wuQeLp49Eg0ZGdu9IRWUbtovPxU0fjeN8JsaTZv1eHn0FgD1xQ8HFQIRjIkfb+AWeJQEOxR7+yH6zSpxNUBkqm0wxE1cQj03g53TZXQz0IXNVQJfJa4ixiUy65N0VEwu8hO/pWNT3h98eDguAArFg7l/lDNWcwDlB1x0Z44sC3uLlrhnkaJi5BK/tpVTr+T14d2C44ZpW2vOA3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:07 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:07 +0000
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
Subject: [PATCH v2 23/25] iommu: Add ops->domain_alloc_paging()
Date: Mon, 15 May 2023 21:00:56 -0300
Message-Id: <23-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0003.namprd08.prod.outlook.com
 (2603:10b6:208:239::8) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: 9640c1d5-ae55-45c1-6458-08db55a0a291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	8NbESblMlUBQkx9Vmo4bu3M6YRHzyOWpOpZGak26CoM/4cVigjTy55WXpZ4JAZx2MCLzg0OspwjB6d70m67JlbTD4R8jTf0H1FyFn4aRje/p8PurYasl4ZfEovXC5XwvR3C3E7N4qXbTzOmd2as9H7haqh2sdlN8Rr7l0dEUmYOswzXTQ/lncFXROPuntkR2UgjnPwQxCnk38plPESMF4pcKHwhy19buQzoZfyWU9yPlgw7wrp9I3qWQf1XxqQKk8gB6Z8QcoFiptYPifARf0eDsmz2pMzaWesneoWFpjbuhqR5a0M8aYyNhvAA2xNQxXB5ZGFnAiC43bln02HQXfLNxqY8zDNosRhiPmF2DFvdglDuVndiF+d3tjmWYTCptPa9k7uvS81DymskpYKCdMgs2i7CQdIrBnsJx5KR35FKHBMJ+9QI6u3Zao/2sEMrEVC/lB27zXMFPdhP1A3mQPlMahMwgougFV9mP546P9U8JGPxDXFUauxAWbepen6rP6WJ3InMSf2YnAsGHI7kUcp4UCsf52BrVSIJ/xj7NqmdddzqK8iQeXE5T36sY1i83SQ+KNNcn+vbQLvDYoESBIiDbwqPwxRui2j2hgFhimLA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(4326008)(41300700001)(316002)(2906002)(921005)(36756003)(38100700002)(6512007)(6506007)(26005)(6486002)(478600001)(107886003)(66556008)(66946007)(66476007)(2616005)(86362001)(5660300002)(8936002)(8676002)(110136005)(54906003)(7416002)(7406005)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?9PDxSigXJRqx2jQ8bcjv70mRBuWncNc+nniawUpyquPm5LBJG1QEOryYfQuY?=
 =?us-ascii?Q?/9Z/TcEXAr/tLJekun1D3bq/zxRnQGfj6flwCb19NQIDx+Hu6cRdLuq9hSKB?=
 =?us-ascii?Q?c3oUsXG9WoIV6fngMnnMSftxQQIUcD6Jj1BuWg/CCjGZPWLQ8JaadsxnrPRX?=
 =?us-ascii?Q?5VfkZfu+cpgYAM2Ht0ObMP0CmreIWiZ/KgPxFROm5A4xllJncp+ytcKsT2Uz?=
 =?us-ascii?Q?JTwc1bZcqD43my7dGlfBv4fm/00GjREjlEU7M8keHgjLeUzVYJbJBKLFrP7w?=
 =?us-ascii?Q?AEj0bYNgUlsfIb4Si2P5+PspFM9IxMqx4GHsEJl1DmmfEzNBjL4INzx0uSYg?=
 =?us-ascii?Q?mMJKQ0WOCUnWcB9M6wlotIRTKB5zYa7oLYlOSOa5g4vkRNfR88nrRTp6ZqAG?=
 =?us-ascii?Q?iHBPiVtekWRWi3tPFYrPWTj9uNfzfw0dS3HMLAgiJ6XfJm0ECbz5VF2qZfOI?=
 =?us-ascii?Q?51lgcp5lm8+qlexIyW+Fy3yfKKpmK07f9YtW/DxXYuzLufTQZGznDILAwY9J?=
 =?us-ascii?Q?vQ+aB6YjigTOjaYXLJyuq6K4yIdgEzriGHoLiFxk2OiGmRETtlu9uizcC+E7?=
 =?us-ascii?Q?ZiIgcJRSSDXDgG/Rv1NpjabDUYIjclFRDdI77d/S/tuYwN3NrCC0NeYbbWaB?=
 =?us-ascii?Q?GjHkPohJmY03F+oba5FclPyMK/hM0s4xZD7rHvsxlJSR1hJoIdE2qe/LX6nP?=
 =?us-ascii?Q?eOzBNQdFoWP1XzwV/wprOrQ8rq1X88cR6nSFu7+msvkyt0j1uICFuaEenwdg?=
 =?us-ascii?Q?5a7lA+8ANawE49MuoQALhGs/Zr6k2OjMuHFj0c74NnrxolQd4iJvcbFkKMay?=
 =?us-ascii?Q?aVL8FxyZxAAfUH93qM1bNMTZJXt2v3Jgq/mG4kLnsGGvJwW6sLc0GvLivoOW?=
 =?us-ascii?Q?lFg1ev6/vZqEYM+ZF9Cfo1HRUIDIOw2b9m4d90tHhQ1j1jtOsaw91oJprh9S?=
 =?us-ascii?Q?1cIrnm5w/xA+mm2rID+DswpivuncMZAtegYWs3QVXIDcBIUk6t3zuh/UYMM1?=
 =?us-ascii?Q?TWVpFMVf4sapeW9H3JBLeh3mD8yZG61W0jGUlv7pH7o498gmj13WqBVNFWWF?=
 =?us-ascii?Q?FhLSTl79oraW6RQYM8vYk0Vr8XLpPQ5Bz9CWawRCwe1JOVfvA9K1P7N5LvtM?=
 =?us-ascii?Q?J4fTMwQ5nW3yt15B7vFK/Zu1TnSSk929H7Nux6253wOhnCe5VHoM6dcz/Y6R?=
 =?us-ascii?Q?iSAmjb0ln+nVDqYvivETzQXYGx4KdumC7/SbZorLo2GXPdJEAyWu+dnEJyih?=
 =?us-ascii?Q?sTBNDEzU/pGu+FLRiiiiqZ4iP6UCaOruPKsGMIh2pCy1bGXzuqQFyg8LagFt?=
 =?us-ascii?Q?CqBpG64/cpK39iRPzouH6s5QHXQsQoDHo5qeETy+6X6gwqpGGbS6tIfLyXX0?=
 =?us-ascii?Q?CUgGlx5W2ygK5fAb9qgsfTi4CEn0TdSOQSiYraZjQgOkJELkr/TYPpIO1Wnj?=
 =?us-ascii?Q?DF3A1YxAQ7QoK+SCsfqNpbC/qQh3CQJGgw49JxliVc3zl2vb9h8PG8z8nNSY?=
 =?us-ascii?Q?kResBQEcVyVVyfKvscGrRggWBYSrk3Xsyr7S6Cf4DZ+HwfRIKyoynwSw6zzM?=
 =?us-ascii?Q?WZVG1h1kcWCZKzzVoso3jon8fpA4dnwSEBCuJRjF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9640c1d5-ae55-45c1-6458-08db55a0a291
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:01.6789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cm17DrC1Fs041P6hFnadOExlYMzOyzd8z+iKUjL07vap3uSpyR8C8un4/JRRSqFk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6786
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

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 18 +++++++++++++++---
 include/linux/iommu.h |  3 +++
 2 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index c4cac1dcf80610..15aa51c356bd74 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1995,14 +1995,25 @@ void iommu_set_fault_handler(struct iommu_domain *domain,
 EXPORT_SYMBOL_GPL(iommu_set_fault_handler);
 
 static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
+						 struct device *dev,
 						 unsigned int type)
 {
 	struct iommu_domain *domain;
 
 	if (type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
 		return ops->identity_domain;
+	else if ((type == IOMMU_DOMAIN_UNMANAGED || type == IOMMU_DOMAIN_DMA) &&
+		 ops->domain_alloc_paging) {
+		/*
+		 * For now exclude DMA_FQ since it is still a driver policy
+		 * decision through domain_alloc() if we can use FQ mode.
+		 */
+		domain = ops->domain_alloc_paging(dev);
+	} else if (ops->domain_alloc)
+		domain = ops->domain_alloc(type);
+	else
+		return NULL;
 
-	domain = ops->domain_alloc(type);
 	if (!domain)
 		return NULL;
 
@@ -2033,14 +2044,15 @@ __iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
 
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
index 387746f8273c99..18b0df42cc80d1 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -227,6 +227,8 @@ struct iommu_iotlb_gather {
  * struct iommu_ops - iommu ops and capabilities
  * @capable: check capability
  * @domain_alloc: allocate iommu domain
+ * @domain_alloc_paging: Allocate an iommu_domain that can be used for
+ *                       UNMANAGED, DMA, and DMA_FQ domain types.
  * @probe_device: Add device to iommu driver handling
  * @release_device: Remove device from iommu driver handling
  * @probe_finalize: Do final setup work after the device is added to an IOMMU
@@ -258,6 +260,7 @@ struct iommu_ops {
 
 	/* Domain allocation and freeing by the iommu driver */
 	struct iommu_domain *(*domain_alloc)(unsigned iommu_domain_type);
+	struct iommu_domain *(*domain_alloc_paging)(struct device *dev);
 
 	struct iommu_device *(*probe_device)(struct device *dev);
 	void (*release_device)(struct device *dev);
-- 
2.40.1

