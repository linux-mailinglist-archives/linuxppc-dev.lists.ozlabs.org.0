Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A610D75FDFD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:43:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iKsPyPL8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nZ744sXz3fdt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:43:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iKsPyPL8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8c::623; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20623.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6g0cbqz30Jc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FShXW3Wj2lPC1lW72g/h4z2tsVFbdwwoMDmfhJgwjNVnTaMyv5MXK4SGD/f9Wm/hSgp8xYsA9FSZejk7qq3Y907W2/7bhUOqDU4IZMsaOx0DY/ZD8uqNzfcA0Oo6oy23w1VazQUyQrBukzVqfohx+qsof4Yi9x4JeQT5noYAYN4K1O6IjER0Z0ykajSqwzmbJjAimqT7NNrqU0+HYzOB+H7NBwC9KXaHqJHPMXX0KlQEsDokZN4pTy8u5W2XJRwc8ooU6WOtMbs3ErNUKXN2BimYsGwrwDkxnijSQraysyHY4+aGQTE28xbBwrBqONDlZmZbqTjRBBGSQo+lUqKoDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERLee1ZWMOQB/9cYetsh1Svvjjbt+zObeX7Q0tU7fU0=;
 b=RrTTTGtfe+QJoNbo4DtYjOUWHesJyfm0oHlo7QZRBr0l6NT90AZ/taLqWCJp8fOr6hSvD/iXKljI5hnVRGBUfU1bb3vXYdiYavE3dqZbTCxfWj6/YrfXItGnknMka7YiQ5o7pBWipL1wAkxp6vXiYnNmJSqzOXt7mP85MZe6Nw1JfNABgm7jZnB06PVQkuIIVICPpLJaUVMBbysJp1slYMJZmHQk51NGrsZwsKXehfT6aXRxVCpIjJgrtQDaxImB+c+ZcLBcgySpiG3PDVBT/cfehsPhnqWcI8uNecgA1nQ2VO46mO3ccz8PKA3C2r1qzMnjIFLGsHLbqYR/QFCxNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERLee1ZWMOQB/9cYetsh1Svvjjbt+zObeX7Q0tU7fU0=;
 b=iKsPyPL8u2WjZBBiXDJ1swB6TzKAb1MzY17njaL9aepdbtmxv50e0DRDMxh7sJBOhqSySGJxLgXqOJ0X1hL5re++UrfvIY1ZqJdHqBh0zz1YINkqtlxaJeBsln0gAmMlJTbMIIXnnCF/X2luZ9cDAPY3PH5gA6YaT0U/mknSsdmLFNgmUOIF7bXhgR3IzdZ232X1TmlWFcyu2ScViFUAyJH+vI12xNG/Ix80KPlYpSxVoEGdTANaUf45oTAAsWg/aOBuL27rjdjKlgMqbiDpEUVMcK3i3N6N2u9HpXf37ExsSE6np9NQzZEO6UPRfQkMpgqjyLm1SvqStAzeAzRa2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5252.namprd12.prod.outlook.com (2603:10b6:610:d3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:24 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:24 +0000
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
Subject: [PATCH v5 02/25] iommu: Add IOMMU_DOMAIN_PLATFORM
Date: Mon, 24 Jul 2023 14:21:52 -0300
Message-ID: <2-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0023.namprd22.prod.outlook.com
 (2603:10b6:208:238::28) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: da5be102-91cd-45ec-f58c-08db8c6a882c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7IE0QyvdNEt54D62puXcr6lpBxOZdzATiIGcg9FrIyD/6lX7GNIyExmQMmss8uSK5DNffgpX2HnDXGvHLvMa1drscumV9Na6X1TDOhq7mEszXn9keAkiyVe9k0MSs6qyjaG0iXct1CmYaeqnFl+50B47G1g5MCh1xRfULXiRsXkPz+uihve4MbyrKJi7E9v36OcJt1/+Gtj7j5CLG9xggHK+4UBHYCUwX95/Z3laI3m8BguPiS1I8elz985N2CzFdFrOnvv+/3dMtY+hHO5M9qX49LAR4hcGcsuNQ3HdNq1f+Xp81BKbz40Jg2+VklHGsCMobaVwc/L4Q6NuIaWT8/fc9bVQ5x2QN3K1vPUK9GkY618gZ5sdz8o/E+P8gdSu+hiCe+tZbDrKtPxFnoHQMgKXFlt6e2bLD+N6x48SPvx/ctvinfbF6ESA5MAvjidTkeml36XfUEPrJWvOvi5nPhrfrFfyW2RTEk8JGm6JwXc64mqo5SLZlYRlbUKSYPnoEMF5Cvq/lyC/jBB5WZTHYmBYhbPRJqgrWUCsJA+0DP2A7d1Slr1kc2cHhck5tLGgGVs8W8Bce8rjADnN9IRhwpXEfhD5bwH4f/j4yPJgK0wtwzHuMLlTaWotPWoXLEQZ
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(2906002)(2616005)(83380400001)(4326008)(316002)(6512007)(66476007)(66556008)(66946007)(107886003)(41300700001)(6486002)(36756003)(478600001)(6666004)(86362001)(110136005)(54906003)(921005)(38100700002)(186003)(7406005)(7416002)(8676002)(8936002)(6506007)(5660300002)(26005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Xf8agOG3QtG3T6M+igoQCVtCZ1P+V7AXviXfzHxhxAmmGNqmbsKohTOG3UEc?=
 =?us-ascii?Q?ZXxKXn/w2732/GwP+vBtxZzw7CinBNBSuBhVDKFWcqWnXA9KHwl/sehPf885?=
 =?us-ascii?Q?5t9dVudx+hmZJj0OKHH77KJ+Hlyu7whaFkD7RGDEaIvwBXJo7RGfGg/0ZlmL?=
 =?us-ascii?Q?TBgEB7rafdfyPpVAzTtwT9rwgMLyBKqTdIf2Hk+CXlt8pZWq8cMO3bTzYsEg?=
 =?us-ascii?Q?Dki4KqXV4rCd8t/dyboenzd9u2s1cENfyWJbpW4IY51zX8OiWvNma2645NIs?=
 =?us-ascii?Q?P6V7GY3W6Dqy1tJ5JKQjwV6Q+LXUGFi/o4fs5BYM74+Uir/ga7Mpu19dn/yQ?=
 =?us-ascii?Q?oD/dxmjWc1hTZ/cL9EoBknR8CsODz+Eq8MlC93Y4yFiGxScuQxuP1OBrMq3G?=
 =?us-ascii?Q?ycyakq6lrp34DiyV+TuGPpXLlfV0bcrw7X35sIdEuBjERlRGUt4uH4tbZst6?=
 =?us-ascii?Q?0RPRUZApPVnDiIBopBKomuyktpPvjf9VzWiF7buPnyi3wnHLx+O+GV9qCJYk?=
 =?us-ascii?Q?MMpYH5ANZE3fksTIzNLVlrJrFBDlWtcr2gtiZ+G9tW3T4CZdfFMbyjo3ksfB?=
 =?us-ascii?Q?paR6qn4CtlaFIZ9EYLMlfqbJj8OGmCyKmv5r98lPLPIqdxI8OWVcaiWV98OC?=
 =?us-ascii?Q?IXCiGmVZD3c8MwON0Rza+XDnVCMdfDyoo5RndkSjj9SxmP27XWJmQ00QgcKs?=
 =?us-ascii?Q?vyDtHMI8th6baEzuEPy+Fq4ea421L+QxX7Smu139rIR2BJuLnDKNaJNrGrg+?=
 =?us-ascii?Q?dVnqylsMYXscC5tYUPlL2qTJ2Hz56c6MAXXY0YYOTFryskVRVZSxLfouHOeK?=
 =?us-ascii?Q?WesdpJUQUizaRPg6MmDWEymFLf/K7MjeEi3wThIND+8HeopQBx6XMDF+lFtJ?=
 =?us-ascii?Q?8+9vNPzxIAtlM+TcHgg4uFZv25N9DwcZNszQ9AZH3iMvuaEeyrY3AZXyipgT?=
 =?us-ascii?Q?vU5BhE1WV2S1ydCDqBlhVIz6jYMI8j1cJBdmWJZUZW3bX7PlaY+6WDiyRrtd?=
 =?us-ascii?Q?Rvnzp8nVLyCHlzAGrfUdT4vIX2lyvvF75dC0j0LTm+PpsKBQwYGiczrg/Qyy?=
 =?us-ascii?Q?wvdfCBEShP8b3IgR0nha2xpIYyiHV9cgzOBgJeubxgzR0MlzMHbvt1UVSjod?=
 =?us-ascii?Q?GtqE2dj/BEQKQ1pKXvieHjpVmmO35LHeeNYyIKIEmoOb3BtRuRuneaHlLxOG?=
 =?us-ascii?Q?KhfkFxFH2MnpQzYxJblntxrPoPko00+c1GzcL3aGv3Bvkgmir0ZVQ7+iZc67?=
 =?us-ascii?Q?6vqeFvuXrwzg6YjcIaP8wq3DBuVvfe2Z8lHvPe3JdQ136mdwyOBvljdEeBBR?=
 =?us-ascii?Q?eHyfpfsc5JYx9mtkofCRs0O7Zb5RPehcJOUsKR1V/PfxAzqcsLKE9aarX+tl?=
 =?us-ascii?Q?ae7hnuDwEvk7gfOnMLfRr0c35krENs+B0xxnHGRE7TmgzuHHS/Gxt4KyC0pT?=
 =?us-ascii?Q?S0RmC0y1J/tjXmyK6lVFX6sLTy/rcVf3teJffZMoArPtGH6HTPBk2pZYvVqD?=
 =?us-ascii?Q?185jkl01lYbEu6vsNY7F5y6BySqQiT2lZjFqDnei82obJsfETDkVrQXHd5b/?=
 =?us-ascii?Q?02i/lmmWGqG6Zvo3J2M277WBB00cCIivs/PjvRy2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da5be102-91cd-45ec-f58c-08db8c6a882c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:18.5756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEIITfW0ifH49cK+0wel+eQhdbmaCrzyp7hi/grYZPVMVJxSeuioIyzVR3aNAHBG
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

This is used when the iommu driver is taking control of the dma_ops,
currently only on S390 and power spapr. It is designed to preserve the
original ops->detach_dev() semantic that these S390 was built around.

Provide an opaque domain type and a 'default_domain' ops value that allows
the driver to trivially force any single domain as the default domain.

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

