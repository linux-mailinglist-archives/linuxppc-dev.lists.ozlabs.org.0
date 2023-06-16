Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB52D733945
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:11:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HKWqmbmK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTKG3Rd6z3cgg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:11:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HKWqmbmK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::60d; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT8B2zkBz3bhc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:22 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2KTCxvjDQUqsm7Ae0nxl4ecGQVbgN8bwsTy0tb5jKP7Now6WQLp8MsvRsxHXaDqKsYpg6EWHB7wk8SZMw2pVv0dJ553XtxNch+hi3p6hGJD0L3UPxvOKyxePNbZdeIc6w75pH4zbhr2aXn+v9zQUGhrfFvDaRQABTxaeMunfEtxd4eGS6TtVkvUK5ix4aP2Hbf4xK2XFTyH41NOhY4WGlLSF/vEQCX0y9JAci0EQFk4GzA14Kwltix2AJ947gR6SEJkvDnLuANJKFWECzvdC3PqGA3djgPRgyusgjeGtpdKXe/XXbEST25y9TVA2cNrbomlUgDW7kOW3OM1k2Krug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wtwsG7Y4uCGU7mH6MbKK3qYDI3hc9WHokBPbjewgzx4=;
 b=Mqr4vsNL1LtvYm2/wGqQsH7JKsuez9tLYIzdYOkpgW/I2dycFZFsuSSQWGVVxk9eA6qTTPZ07rjPgRigY3PfE0Cdy+X94lTJlx9c78FybH3bO/7nv0c89SO6l43M+AkmWLlz/bb57UukwKIb8cM8hRq8d/1wOCaAiUR7OJPN4SF8sM/U7w6EZyb2v+Y/SNl4w08agHo6qg7Lg5xCwqZ2JhFFq46QnvzT6JxqoeTUZbVWe2mMDU3Afsqg845WZLjqnT5G3mLEI0S5FUdHxdJsl2z5p6d3uxSAKHqHEywlSbFMxVZDaG4CcSvcgIyYot+f7akZo9wFYyLoPBsEmDcTpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wtwsG7Y4uCGU7mH6MbKK3qYDI3hc9WHokBPbjewgzx4=;
 b=HKWqmbmKtUQ/nazqB68n0Rbqe0obIN53UNZwTV6pSLTkyGFK6LU7Ly+c9OYrwayVVU2MFXGZNH8zKSmtBIJR2Aw5wFqaT/hyzLPUOOHxdFpDvKdFOEZq8srme+SBL8yWFqtM0wEq+VQA0ode0EjkidYYGKZ8pDgiIsSoHAr1TBXeWVslUQ4hhqUrwr0LQrDMmTQVyHfl3zLxKf2imiEPzmJca9AhyzlsZutsblR68IMLLxyl2MU90ly+D7fWtPa0U5rRhpWZwEpqR5+cVTIhybGQDGouNjZwis9Xi+SB0k64/h1r0G2cwb4Y6031SjccMl4vZ9/5v5F6kHuWD9daGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 19:03:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:03:01 +0000
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
Subject: [PATCH v4 23/25] iommu: Add ops->domain_alloc_paging()
Date: Fri, 16 Jun 2023 16:02:52 -0300
Message-Id: <23-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:208:329::17) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: ecd79999-76aa-4c52-24b2-08db6e9c4b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Pgk9mMpsY2urgIhqXmAGoXzL3yXXvM10FGUJ4oNnZp+Z3wDoXMPsHU+xljCvzWp5LyTs21M7uBi0tjWRQiVX9EeTVWZFqGd8Nzvsh7A39vV+qwJb0PBsgll3njZww0Tx1KLnAt4hs4JNxze10ZA/UKko1nzf4Ij2QCxcTJ/pOwLXIbOmaRYztSmjrY6zsLAOoqr8qCtJKReHE4WVP9YYImgquw0v4xEmV0A1vyOrMvt09cat6i+Ec7mqLPgAa4XTztXBlAG7Xy540NZoQCoxqLLG+8Chcn3T9rNiTQslJCcURu1lTqPY9JafpLC8vu0d6jf63EdQ37oM82CEZQ/2eA9kRHEhMrUbkdS7qfKeOgBNHazsLK795TLOqKLPD5BnQhUiNixbQ8n53EbV1M4qHwvSKIDk049Ef75pxv7uzzWfHm7THxaOuKCf94+6by/xrztLPdvyOqICvFQyLiqFxguhfCQ3Da5r7MmFv1y07ETz0OOR7kqKtJynstYBve53SupH5OgFKB3yqxJ4BPTBT+gZhWf4D0CTrgcVUvMEeS3t/PFsXVwMzwwxmeq4dsATi5jb4g2hqL7342ZOzViehh514sfscwXyM0T/QBf+cZY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(921005)(38100700002)(8676002)(8936002)(5660300002)(107886003)(66556008)(316002)(478600001)(66476007)(66946007)(4326008)(6666004)(6486002)(186003)(7416002)(6506007)(54906003)(7406005)(110136005)(41300700001)(26005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?MW+Sm9XVB23zTEh36hHAByAmtaZli774ZADhXkDD4hjWuQPxYmFMg7AlJ/HH?=
 =?us-ascii?Q?BIut/aRa8mbjzvYRa9sqSXci6Hz4WWSF6N4knZIFCqje+lfuQPNih5Sy8ldy?=
 =?us-ascii?Q?nzb99uJ3xesr/IakceNx6uANBE8Xq4SST1Sw3Gw94uUAzvBPhdn03HAc0XEN?=
 =?us-ascii?Q?PjAuydDf8Y53lfXaymSFDjgKIiQxW7XJTC7G2F96OLbdmXyjO88IrqVJNbHj?=
 =?us-ascii?Q?EuMVjX2qGA9+SQ85UUYcLEMWLrk2o26f6c5h48aNMTvt8phTBNLe448uNcgZ?=
 =?us-ascii?Q?gbA2BJh6thXE7nEilTephKEQBKIGEDCiMrLcbqZs47YQeN6g8zgd3L7uIRMI?=
 =?us-ascii?Q?QjmfmoRBUXYocriklIA3wgddIISgGcOEeuivwwlhKboL4a5o+YpVXQHnwG/w?=
 =?us-ascii?Q?7HnNix978qy/IYgSCLzj3ZiSq5RYcE3MDdfsHBKydhWPi6fgu7VOsRvIZWMf?=
 =?us-ascii?Q?hyIeUSua7V90+tb6FiWJq/3SnBruOS97v6FDBignWQWdtSSAxrh5utbmkXjd?=
 =?us-ascii?Q?dHtikpXp1z0hdspt2EsDF17b8k4OKE8y9LIm/29B9FDCCuoIPxQEiCLEFogC?=
 =?us-ascii?Q?clQ0uCUBRgPL1ZCTfjNz2Gd2LO2WP/0hdgJa3sTp81p6/GHuNh7CvLq42ufe?=
 =?us-ascii?Q?RKHlm1KGOSwyA1OFbCmfnA0I8TSui163jy607tk2/Cip/IFa9egCuKL+FLJ3?=
 =?us-ascii?Q?1TfcN6trafMOz91B4PlQrHoJNpSZB9nrN3uDLTTGYDCyt+oGpAHiyP1HSSV2?=
 =?us-ascii?Q?VsrHcSlyWNQp6c4h+QBViIdJrWYfrMt88wiWLDunUiAhoasqLdgJZq9kENpr?=
 =?us-ascii?Q?xaRfZAdKDrqK/MBXf1MgH/LDTQwjN6kU0uCsFCcktPleR1Fviuy2Q72HytiZ?=
 =?us-ascii?Q?5e29MYrw8Q7EP7Iw9qByBE9pBLYEB7lz0smmL8Jg66bmTjq0Wut6rd4vSoFd?=
 =?us-ascii?Q?JXqIfv4Z8KasF67rpkDl3oh9kJjJ0jP543GLYpjjdkdE06EWHobsXQWyeKuR?=
 =?us-ascii?Q?/QhkGn4JwP7/oM0MJuInaPdh3kbN75fJpPCokRMIYdf5VDF92a0KFl3yc6iA?=
 =?us-ascii?Q?knzgVT/N1PLhcXlOdoT6oqini6TiWh8WQMQ0H2uQok42aJ8Sx/BKhCWXzXCa?=
 =?us-ascii?Q?5cg7T45dlNmD7sP48ZAU7CoDjydBR0ZUdJn+klQpaTxUpbGEYvOJRd2CM6nc?=
 =?us-ascii?Q?1I31k3FkdfChE54Hij1oh/qUpnZ3U6rhKcAQJR8ZV00tHc27638qmBJ7GDfg?=
 =?us-ascii?Q?NPtgzlnRVbYVFnh5ftHHn1kqihiLM4rCLmtEf4rA2qoOYPjrkjrx1THyeWpH?=
 =?us-ascii?Q?DVJWXiSBSbtDaE5zvEglrWsNB0FVGlIAvr2NzBhGgcBJ57Nai+HFr8jSS/3y?=
 =?us-ascii?Q?q56pBq11fXLKvoILfehAI6PNMxqC+/OF0211s9GJgRNa2sJgU2AofS/gKDNE?=
 =?us-ascii?Q?6JBkf1TlYI1rvDIfdfO3CcNIKYDoHA4Na+wIBVT3PUJiymHP6q17f5rouu7W?=
 =?us-ascii?Q?sTkCz+AQ0x0NemwIjShap/Nxt7/FuQYapYqJwYFAeHy3vhZdMGsGFy01ouE6?=
 =?us-ascii?Q?UBXalWvbcgsjOxUppdEr3q0mtOwRp9eHZXzNEZWn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecd79999-76aa-4c52-24b2-08db6e9c4b39
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:56.0466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o2yZOfniEbWY4EkqeVWCiPu9RCjRVQ9tD8quy89d3NhVE1c86QryOHDqmb9+UJ44
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6051
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
index 0346c05e108438..8f3464ba204498 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1985,6 +1985,7 @@ void iommu_set_fault_handler(struct iommu_domain *domain,
 EXPORT_SYMBOL_GPL(iommu_set_fault_handler);
 
 static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
+						 struct device *dev,
 						 unsigned int type)
 {
 	struct iommu_domain *domain;
@@ -1992,8 +1993,13 @@ static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
 
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
 
@@ -2024,14 +2030,15 @@ __iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
 
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
index 49331573f1d1f5..8e4d178c49c417 100644
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
2.40.1

