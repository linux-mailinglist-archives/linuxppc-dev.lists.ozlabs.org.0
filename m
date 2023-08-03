Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8731276DC74
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:16:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uc4IdoP4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGTsf2P2lz3cN4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:16:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uc4IdoP4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::61f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThl5dMWz2ytR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KT/xuRwvJ2DrIBtxFxqp0UQygvAMNxLkkDetjArS/ouYV5F+xEPtBt2Y/3voh326Gg1ntwD3oulKg41E4JyKzfEuz0Dy2E0eVgU/dyscLP0NtzWu5e0RuWqWKbSXSwKN/Zf0DJauM6uxU5yi2A4+M5lJUwwbSZioDW8rdzyZ5lqHNncirsfL88v2brvYXAq14ba8WVEuLZDlLFtYRlJqYJlrj+YGJYBUFyHtU+sM5EAiUgpAN8NkZuA8KAd3+cMXZ0/dJ0iWolvsxxS8D1PWm9aUa+5OuehLH/c5cCNgv4RmMci5pqCd1iT7jyoTFa3tgyyvoBGGlpgpWsOZrCXbqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cc3SdkZBuY9gSAlyxygUxH6uwPRgSkuV7Wuw5HQx8PE=;
 b=Zw5GiWBjsdpeKpPcBc2Rh25zHsotnTWp546JAU4z5czJ+4OVZuNnHPnoGtlq0By1K+xMyLk3fDBNJxdq5E7kMZcoe/JYXkBt8oKnYlRWYzZKwxvXOHZmgsA3hgFxHSPR27xg9L3+4L56mICo4z6LgYqcg3j/fh10BlhQs0f1OYuCYxxIdpQlavz0EmAp4T8tsgWeOgTmWkirPQMV+gbaTAOlYhLxP3J77ojKUMQowRDKz4oB4kufDebFDWAadgOX6ioeteosg35d6Dga7f6D4mfiXXZJG2stKRTUZrQ7Sgw9PMtVpeVNy8l+oIUCU2uIC3ulozelrNhugNjV5iuITg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cc3SdkZBuY9gSAlyxygUxH6uwPRgSkuV7Wuw5HQx8PE=;
 b=uc4IdoP4cmI0dqm6CQOg576iIEDSBE0DvrR2fP3OwqeJ81XZwGEVvTUWbeNsQ/fqCzPWar0WlUJsMLkc3cgCFNOhPmUYJPL9YfOr4G+lay+v6aFfD7y+kFaBKgwAFFe0NcAoWeKeB/7nmAJr439Xf4zEuyGKHW0lm4d0//HQ4WhGKnv8Mg+rXCCYfJTKYSANB+ShocN6wsjmmwsUd7DwMHUMCf3v11TAVVQwiSrLfiJmivUHzL68xSBsdbRgT18UtUMEiirLE0jYKUeAx/25SIjaVSHMPLbrK58liNqM0uC7vjLJLSnPLO08GKxy4Pksx9MDs9RhEetfZ495dFbODg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:08:18 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:18 +0000
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
Subject: [PATCH v6 02/25] iommu: Add IOMMU_DOMAIN_PLATFORM
Date: Wed,  2 Aug 2023 21:07:49 -0300
Message-ID: <2-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR16CA0037.namprd16.prod.outlook.com
 (2603:10b6:208:234::6) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 566413f0-a27a-4843-a52e-08db93b5bba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FRCX/0/qLye+8ApBYi1hZzCSzJTo2MoNTx88J0t0lr2YXDAu9+z81ACGFcRwJOeeZk2sqyMfEFSQhN2Q/JBaBaIPnHnxDHeeRjMIS200pCZm1Yak5LMitPK4UmoA9GtpBut5ItckhfoMmjZUArSJodS8nBwOkXj+0+JB9DyU2Dr8hpiVzSDZ1N7BTdbVtDgETD+0OjkAbwpxvalUzb5CxFumgcJq8ioqLbTNNr2wRD1hGQwLgS63kojo1O+k4ukRb8YK40c/Ps6N2O+GEnFV1xz00VMdrEoS/tycqGiVHLYPtFfY0BLSEF+mQ1Db5O6vDcPH/7yS2CQVb1bdM0WNmfYfeDscxmXj5F9ytpKWOAy898r8BnJgF7fh/3uVYKisPLttVBuz7PTgP1grL2yYJO/zv3wrWkQU3ZE1OuFm9A1NOemwp51nfLzQdo21aoaRpJJ2TRPIJbJdNre1GXw7au5SOA4MdOhoCf46fquJ+VKx8vuxbbriyMkU2x0LqK5/3dIp+zIH0TIC8K6BQ2IEIimpzgsSrIwkfcvs4Euo+2pZVJtogidp6ZMRoWz1UdI6qbDk1EqxHU1Iuc0fGxIVzzdxWTfaEnmAx4W5292wVYEt0VJpIsJjOZq0ng0VFjZ9
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(110136005)(6512007)(54906003)(6486002)(6666004)(921005)(478600001)(38100700002)(41300700001)(5660300002)(316002)(66476007)(66946007)(8676002)(4326008)(8936002)(66556008)(2616005)(83380400001)(7406005)(26005)(107886003)(186003)(6506007)(7416002)(86362001)(36756003)(2906002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?nMji5UfwvwDeKBmkWy3wH3LO5qdovfpOLho5O6VwksGg9gg7KwF7rVbG4wpV?=
 =?us-ascii?Q?bk0jkKiYrLcMHLUpvkpZPUHGEAyJVHO865OR0BRS0BdJaSbdlRVi6XW59X2D?=
 =?us-ascii?Q?BXOT1oZRlbQXDLwJ6AYfreJYP7A3aRuC4M9W3ohbAeWRfSQcfJzbDgXq4P2D?=
 =?us-ascii?Q?wgR0xHp4oPAW1U4dQi/TAeS8+iTXCILUzc2dIWk1M8TqJwaIPfmU4gIaxrvd?=
 =?us-ascii?Q?I8r/CxuR1hVideHl8uLFowYYUJsvpATAZE0+UmB9enEcb2aKsxP58B5YYbo8?=
 =?us-ascii?Q?3SoI1XUzjlsIPn2I66pcmuo9ztMNhJGrPEfp6lyE3q0D9kQuS0+C5h5FAlcU?=
 =?us-ascii?Q?3mG2zHG8jjzsDxWy2sMrWw8qoYD8HKLK2u5CwvsUc2jsX3U5z63v+CbmL8oo?=
 =?us-ascii?Q?Y0BDh/uwutH3nWwtGD7P+nYbAHvmP0dDikMD7Jkw8qfqezIdpYSPOwgQHbzj?=
 =?us-ascii?Q?va2jK2pxXNOSe3NXTxxoTOxQlAqR13NMwwE7ZGcT0+kg3hFLC85FJfmgfkca?=
 =?us-ascii?Q?byGzIsLUwMYFPjYJIK9g2LOPWjDJKFb8oE8q5dddKp6S7q+bwTj33nwYC7vO?=
 =?us-ascii?Q?oVLymhTm3QxrD8/3EhzJy7sWQglKMounLggtfYW9MakKHrB3pjyTbtRL73Jp?=
 =?us-ascii?Q?xkMUhbJwMxW1ZFZQ2Ze+dHZPhbAdqIkaOBZmeTCc70i2rb0LbUatRJb0m5GT?=
 =?us-ascii?Q?vtU+mrgfdXA2kXkjZJQISdx8iszOsX/TBh1pRvdk/icSMtGSRT+/a9/2K7HL?=
 =?us-ascii?Q?E4CVujJ5f2cAMCzirwNpXn2i+M9lH7DmVHujGPYutqHl7oabDroQVZbaWU4p?=
 =?us-ascii?Q?1b7HdqRiKqASuPjfFpiMl9kXN86bBgUvKa1ygqdYsHf0OO7/h5KELr24kX2x?=
 =?us-ascii?Q?vxA7ycjOXHi5LsT1RsNdBEEgz4FSNOB5Zpt7VK/PGMl5svWDrTVPjFl9aVyp?=
 =?us-ascii?Q?Hs6MJe1MSN3kEZ5bgXRLt/Kr/Bkm6XlbhiKTLrRuDra+aT0CbQkHvhGTlnns?=
 =?us-ascii?Q?bdyhXywxHPFcgyIDyjKsGV9BbEw5zsPykYjTzjWCPTLM/0HLrm7C7ccFqtrf?=
 =?us-ascii?Q?AsoInsAMzmg21RrFxQ8B8xf1+uhtlC5X5YEO1bs5UU9gjb8dn0R9KmazHEw9?=
 =?us-ascii?Q?52FHv6cZ2NbT4OPn/mzFrW/SENoXI8n374w+OIMHLxh6oZrEl0X4fJd9sLhY?=
 =?us-ascii?Q?Sp6EafVukxGAoxXouR28VYdx/vHOVLhdXigb7GZOOQeAoiMVyYKk6eWr2cW6?=
 =?us-ascii?Q?Sv2VPvBVeireOH5B9nTadInb9GWFtKnCiueTDl/exEanGknAiXe9w/XDi/Io?=
 =?us-ascii?Q?PJqqHF9AHSSUmJ5oBt6JDwKxgiGaGgq5k05S+DjgwUwUrBr5j65PBWYEs9pE?=
 =?us-ascii?Q?WXOHQhPycHYwUNQIoS8rhCwCwhdRV0U/8mDQXaFeYAsnTJhTPhcs1C71CHS5?=
 =?us-ascii?Q?SouqP6Pat4yQcGMVeSqis6Hqkx69pLA39191pPEg1BcnrcmH8rW/tiIX4nOe?=
 =?us-ascii?Q?yUzOR3QlLOQ9uvaqqu5M+BYe4ran094ddecRyjmU/TxClGH6OsSrYKPK17++?=
 =?us-ascii?Q?so5EDGu37xwE2HPIUXNaVwOqLNMz3RQQg+odpuh1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 566413f0-a27a-4843-a52e-08db93b5bba8
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:15.2925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPdm0BFfqIFg/LvEIk9lVRtMSGgPTtpxM8VnH3c2WdHxJCfZLZbTkaQGEX8AK5YP
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

This is used when the iommu driver is taking control of the dma_ops,
currently only on S390 and power spapr. It is designed to preserve the
original ops->detach_dev() semantic that these S390 was built around.

Provide an opaque domain type and a 'default_domain' ops value that allows
the driver to trivially force any single domain as the default domain.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 14 +++++++++++++-
 include/linux/iommu.h |  6 ++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 5e3cdc9f3a9e78..c64365169b678d 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1705,6 +1705,17 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 
 	lockdep_assert_held(&group->mutex);
 
+	/*
+	 * Allow legacy drivers to specify the domain that will be the default
+	 * domain. This should always be either an IDENTITY or PLATFORM domain.
+	 * Do not use in new drivers.
+	 */
+	if (bus->iommu_ops->default_domain) {
+		if (req_type)
+			return ERR_PTR(-EINVAL);
+		return bus->iommu_ops->default_domain;
+	}
+
 	if (req_type)
 		return __iommu_group_alloc_default_domain(bus, group, req_type);
 
@@ -1967,7 +1978,8 @@ void iommu_domain_free(struct iommu_domain *domain)
 	if (domain->type == IOMMU_DOMAIN_SVA)
 		mmdrop(domain->mm);
 	iommu_put_dma_cookie(domain);
-	domain->ops->free(domain);
+	if (domain->ops->free)
+		domain->ops->free(domain);
 }
 EXPORT_SYMBOL_GPL(iommu_domain_free);
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index e05c93b6c37fba..87aebba474e093 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -64,6 +64,7 @@ struct iommu_domain_geometry {
 #define __IOMMU_DOMAIN_DMA_FQ	(1U << 3)  /* DMA-API uses flush queue    */
 
 #define __IOMMU_DOMAIN_SVA	(1U << 4)  /* Shared process address space */
+#define __IOMMU_DOMAIN_PLATFORM	(1U << 5)
 
 #define IOMMU_DOMAIN_ALLOC_FLAGS ~__IOMMU_DOMAIN_DMA_FQ
 /*
@@ -81,6 +82,8 @@ struct iommu_domain_geometry {
  *				  invalidation.
  *	IOMMU_DOMAIN_SVA	- DMA addresses are shared process addresses
  *				  represented by mm_struct's.
+ *	IOMMU_DOMAIN_PLATFORM	- Legacy domain for drivers that do their own
+ *				  dma_api stuff. Do not use in new drivers.
  */
 #define IOMMU_DOMAIN_BLOCKED	(0U)
 #define IOMMU_DOMAIN_IDENTITY	(__IOMMU_DOMAIN_PT)
@@ -91,6 +94,7 @@ struct iommu_domain_geometry {
 				 __IOMMU_DOMAIN_DMA_API |	\
 				 __IOMMU_DOMAIN_DMA_FQ)
 #define IOMMU_DOMAIN_SVA	(__IOMMU_DOMAIN_SVA)
+#define IOMMU_DOMAIN_PLATFORM	(__IOMMU_DOMAIN_PLATFORM)
 
 struct iommu_domain {
 	unsigned type;
@@ -256,6 +260,7 @@ struct iommu_iotlb_gather {
  * @owner: Driver module providing these ops
  * @identity_domain: An always available, always attachable identity
  *                   translation.
+ * @default_domain: If not NULL this will always be set as the default domain.
  */
 struct iommu_ops {
 	bool (*capable)(struct device *dev, enum iommu_cap);
@@ -290,6 +295,7 @@ struct iommu_ops {
 	unsigned long pgsize_bitmap;
 	struct module *owner;
 	struct iommu_domain *identity_domain;
+	struct iommu_domain *default_domain;
 };
 
 /**
-- 
2.41.0

