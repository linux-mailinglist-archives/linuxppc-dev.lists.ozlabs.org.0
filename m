Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B71C704206
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:03:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxJw1rtNz3fZT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:03:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AsCRJNJ1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=AsCRJNJ1;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxGw3K8dz3bnP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxQo59Zvr8VmhHJrUTXjAXEHaVlIakMSkqZoEGncSKmLS77OAJ5ML/41zz2vk5KXsY7jXBNFjdaAp5SvADFwJySWCS2jENwzv67qLmLl91/3XpHmhajVvGVWojuGALeLSBgFhqgLsCAy/zoMFJnFnzR0NwKmfcI+3y/gW3hCJU1GonK8e4ADp9ns+S1F9esU0+XpNciocAcQGbhB9Wiwk4DGrL5BLiK3OUZcrkAeZcex6kwtlUkzvMHSPGOumULYB21tqTeviEwM1znA+49G82hZJHY+4g6jBcavex5XOXxfCBRL9sYhO4euwpMUYeNkkVZLxDlos6WbrUzlCP6ONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ky4MNDB1KbTGtSPq6FSrBY3vIhUHaDIOl/RZFeZ7hk=;
 b=mlba6MnHp1vi2fBGCJyVLevLkp18h5SCeDsVc4MXcAue+DsjXsOXEJNYicP5AFkiajM3Tv5T3rtr7bNqIYQltFvC4FrNXCNDDYyonNATN+SosniDARzrZhh6Rn28DXHqSY4TzICs0CTIMS0ebiYpatOSyY7WMhuciSrLW/UxQm12LnItF9WTDssB8lbpCEciDRzO1Ggz3Sf8I+3jNxUIpbT4CFEYYYyWwDiJO6Dyar1tH0qUWAHiJpk32YvkFOXzBuzGn3fxNo56qBIFEU+accCkDTCqV/SA4UYjZacE21D+MSbGx3L783Y7RgQyHy9xRvZ/e5Jl2BwXIGlH0xrdIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ky4MNDB1KbTGtSPq6FSrBY3vIhUHaDIOl/RZFeZ7hk=;
 b=AsCRJNJ1q//tTW0oM6/TnunDI4KKuQuYqPEpMW5vEgWApAUKO1QmHN3bC1C38lceXANNNFLHMJU3POUd2Oh0oP135o4KlsXxcyQp15+MhFhpdxXBOSxoCXkeH8QiwX9Lh/9/Hf7fdkt/M25ZtBdRjK80VM9Sy+lY0e4o55py+UkbQu/PFA3QA1hno4RrW1C/tYV5dqDUliRf5cLCQ8FpQXZteLcSbIWAhJBEdCctr3DMKBlg+4OTSLOyf+bcGqfYN5LJG6g6WtD3on4i/PA4y1+uMjgOIdw9NGJTUJzAOi0A27LnkF1/71BRcc/UmK5Judu66rc/1p1zAm6g2pI/Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:01 +0000
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
Subject: [PATCH v2 25/25] iommu: Convert remaining simple drivers to domain_alloc_paging()
Date: Mon, 15 May 2023 21:00:58 -0300
Message-Id: <25-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0040.namprd15.prod.outlook.com
 (2603:10b6:208:237::9) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: 47d8c657-c8a9-4f65-732b-08db55a0a1f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dHicWxMKu3nQAcbVmi4bzkP7Pq64Ex0I4QDzFRSlkRzXiMLnlwzJiDJGNuDXkwHgpiBosYzzm+60AZnlUczHxTDNr5U7VjrRVUWC0VxoKi9W3/xm76o5nkmlaMQLvJlZe1ZQ1RegvERhuWDRt9S4nQEVQfQyXEGAmtfnNN5C6+9UL3bcPqk2xQak6RWn6dCc/nlKY5dlv7usAykb0FvtHTnWVQ35b5qZyPY9W44fQWxCkqRAcB7JEBJ4q7siIQj+9Yg5WNQ9T0OHF7oSNCxocNJ+r0CV+TbPTkXVcV9FHGA5rO/F6ILI3TBW/34XHZDtGg68INZg2bnF8hC+0pJmPXTwrH4aU6G1rdYZrwIuMoi/UB4QQt3YmUX+aJcLOahzY6rGvIpqoVh6vxHKZYuuGbw0MLlX1m/ds2GB1lCvXfoBH/QTKSAU8Csudvxwz4oTIl6MAT9Ds37W6v+scw89vbdyFdU/zGn0oOaOrVh7tdFaQBDD7Yb0MV95x3+TyeK44D6wbFVstbG3DT2lNO4ydkXmecCRarNgxmWeUp4axZwjhB1sANpmllzt+bWCB0VUHukOd9St+ayFd4YStHrTF110uLSQxaHRHjdVfEoE7C8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(4326008)(41300700001)(316002)(2906002)(921005)(36756003)(38100700002)(6512007)(6506007)(26005)(6486002)(478600001)(107886003)(66556008)(66946007)(66476007)(2616005)(86362001)(5660300002)(8936002)(8676002)(110136005)(54906003)(7416002)(7406005)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?TIKVd8INUCLwGnRYGFY/GDnwqCkmgI0oIsrKIwPbaGrzUBVbTVe4YzM1UqBO?=
 =?us-ascii?Q?WL2Ul1O7cnkIiGL4jLptdUly/vH6XKdLJQBw8I5UoPok92/B5OzOx9H80ywz?=
 =?us-ascii?Q?DlYmhQH1+gZxXejaCrvF8ZYnwOwOP9fUmSKqeRhtIW9cfHQ6eQLCeIg9wdTd?=
 =?us-ascii?Q?mMNFuS/xYuUFtscRpsSZ+QC9o4jEdEV162lyoxs54pzu6+TET2UwGfGV4rLy?=
 =?us-ascii?Q?BWGeZjkxaJvYcrP77jBjUsDYso/6dWVjyPMJW2iH4a0b4Z+d8ZIdNb1pKrjR?=
 =?us-ascii?Q?SwVFRFIEQgri1lGsTYH10Yg4Y9ybDA8vZWF4VubVQJGX6t3QChepXxYsT6Wb?=
 =?us-ascii?Q?a/2mATgxhexCaKazmYik37IPE5vF3bOQ/WMlv6V41jQny8byODkxUOJnLMWU?=
 =?us-ascii?Q?boLOXyt17gn0ZbzD7fHsaRQl4QTSnzlmIZYbY57GFvRY/Qf1Mv3WARrGC4zm?=
 =?us-ascii?Q?39CzMUA5h6vJvLCrW0UC/pXR53345/97Mew8RsUXhskxH/d8Hyi/ZBANWi29?=
 =?us-ascii?Q?iW1GeXKRCnkRSgIGghx5mYM75aSxjBgg1ZOyxq0RH4zmD9/de7X4OE0YwbkT?=
 =?us-ascii?Q?b5FQA7eplCU5jXc0AXnKLWC8fcdF/QOIVl2K+xvhwSMbHbyDI9ZesJCjwkeH?=
 =?us-ascii?Q?mA/qImGSXIpcsgQuR/48aTaJgiLwBPd/nqGN4pIA/C0+j/G9++KhtCuy00fq?=
 =?us-ascii?Q?dE3JbcZZYxVOTgXZJvqaHK0KKm1zqnHETW3Q1vIcok64qtyqQyL8T1fRCj6U?=
 =?us-ascii?Q?62BZhtNM/K4UJSQVG2NiHddjXEciE+8yybg8tH2J0EATeYqx4ILoHsivMy4L?=
 =?us-ascii?Q?J41GoeBFTjcZbu3ktH5Kqy+QXTEjCShaQq+WSsrRs0vhvDyGlgT0RvI6/0TQ?=
 =?us-ascii?Q?hR4jNOgOFaNqPYgEbK5caRW/zGYj1Y+9LBU8vsQU6Qs30E62BLw6qolfqHBI?=
 =?us-ascii?Q?+9YSiX/mwSCWK80n4XbTGuB/Q0807elBnT+HRbmZPSDYy7hDzdQdGnlABuEG?=
 =?us-ascii?Q?aCfuEayXO/v5/7RKpxuRv3cnNOXCWLSwln4BH7HJziBaPJDpn9P8EzamIhUC?=
 =?us-ascii?Q?2MaLG4HN2GMxPyE82aW025Kc3Y31FdK2/oeZ58twaxheFieIL5ioz/H7T+I1?=
 =?us-ascii?Q?Rna6vhQKK9k6mIjUoYAsaN7ai2IqPlKRbk1hTJ+lhX8mfd0eSjVNJFBqBHzx?=
 =?us-ascii?Q?GVJ8wQ7caA03S1JN6vlZSQqz+jIY8/eTIwhrVkXe0e2zcZntTeP4FTvjO7+o?=
 =?us-ascii?Q?zkImI2+Dk0IumpxeRc8c0c7l1T4Ifd4cDITPkzaTiphhp+g2WLi35Pi8UQrl?=
 =?us-ascii?Q?itrdpbrTv59w+7JLeGmpvmGm+j3eGYwpx+vbrWqtKZqxnOatkeRUiwKgUyXK?=
 =?us-ascii?Q?BdH+4ECGGRG6Js3WHRIGXi1zO8c863mFThD6/PTQCxketDc2LkgKAGGBDIIf?=
 =?us-ascii?Q?iW0HCj/PypQc0tyocdv4RO3jnQR40Bhj151QYZpnqfnZpgdru1tcro9I+Rbg?=
 =?us-ascii?Q?PnfcWT+Ku73gS2Go4qu4HHtwFTRmgZd/q3y3HPJ6RrKO/goOK+Ol3gRWOLWe?=
 =?us-ascii?Q?Ib9mCpwwaumvDvdyjM8xcRuElNLu5n/hVbi0iP9i?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d8c657-c8a9-4f65-732b-08db55a0a1f6
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:00.6698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+6RjnoXJaCQkuVoVYrJG1vSxeV2QuXqb5zu2S4IfeialuSxgRjkD4oKcwRxX67Y
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

These drivers don't support IOMMU_DOMAIN_DMA, so this commit effectively
allows them to support that mode.

The prior work to require default_domains makes this safe because every
one of these drivers is either compilation incompatible with dma-iommu.c,
or already establishing a default_domain. In both cases alloc_domain()
will never be called with IOMMU_DOMAIN_DMA for these drivers so it is safe
to drop the test.

Removing these tests clarifies that the domain allocation path is only
about the functionality of a paging domain and has nothing to do with
policy of how the paging domain is used for UNMANAGED/DMA/DMA_FQ.

Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/fsl_pamu_domain.c | 7 ++-----
 drivers/iommu/msm_iommu.c       | 7 ++-----
 drivers/iommu/mtk_iommu_v1.c    | 7 ++-----
 drivers/iommu/omap-iommu.c      | 7 ++-----
 drivers/iommu/s390-iommu.c      | 7 ++-----
 5 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index ca4f5ebf028783..8d5d6a3acf9dfd 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -192,13 +192,10 @@ static void fsl_pamu_domain_free(struct iommu_domain *domain)
 	kmem_cache_free(fsl_pamu_domain_cache, dma_domain);
 }
 
-static struct iommu_domain *fsl_pamu_domain_alloc(unsigned type)
+static struct iommu_domain *fsl_pamu_domain_alloc_paging(struct device *dev)
 {
 	struct fsl_dma_domain *dma_domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	dma_domain = kmem_cache_zalloc(fsl_pamu_domain_cache, GFP_KERNEL);
 	if (!dma_domain)
 		return NULL;
@@ -476,7 +473,7 @@ static const struct iommu_ops fsl_pamu_ops = {
 	.identity_domain = &fsl_pamu_identity_domain,
 	.def_domain_type = &fsl_pamu_def_domain_type,
 	.capable	= fsl_pamu_capable,
-	.domain_alloc	= fsl_pamu_domain_alloc,
+	.domain_alloc_paging = fsl_pamu_domain_alloc_paging,
 	.probe_device	= fsl_pamu_probe_device,
 	.device_group   = fsl_pamu_device_group,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 26ed81cfeee897..a163cee0b7242d 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -302,13 +302,10 @@ static void __program_context(void __iomem *base, int ctx,
 	SET_M(base, ctx, 1);
 }
 
-static struct iommu_domain *msm_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *msm_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct msm_priv *priv;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		goto fail_nomem;
@@ -691,7 +688,7 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
 
 static struct iommu_ops msm_iommu_ops = {
 	.identity_domain = &msm_iommu_identity_domain,
-	.domain_alloc = msm_iommu_domain_alloc,
+	.domain_alloc_paging = msm_iommu_domain_alloc_paging,
 	.probe_device = msm_iommu_probe_device,
 	.device_group = generic_device_group,
 	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 7c0c1d50df5f75..67e044c1a7d93b 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -270,13 +270,10 @@ static int mtk_iommu_v1_domain_finalise(struct mtk_iommu_v1_data *data)
 	return 0;
 }
 
-static struct iommu_domain *mtk_iommu_v1_domain_alloc(unsigned type)
+static struct iommu_domain *mtk_iommu_v1_domain_alloc_paging(struct device *dev)
 {
 	struct mtk_iommu_v1_domain *dom;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
 	if (!dom)
 		return NULL;
@@ -585,7 +582,7 @@ static int mtk_iommu_v1_hw_init(const struct mtk_iommu_v1_data *data)
 
 static const struct iommu_ops mtk_iommu_v1_ops = {
 	.identity_domain = &mtk_iommu_v1_identity_domain,
-	.domain_alloc	= mtk_iommu_v1_domain_alloc,
+	.domain_alloc_paging = mtk_iommu_v1_domain_alloc_paging,
 	.probe_device	= mtk_iommu_v1_probe_device,
 	.probe_finalize = mtk_iommu_v1_probe_finalize,
 	.release_device	= mtk_iommu_v1_release_device,
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 34340ef15241bc..fcf99bd195b32e 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1580,13 +1580,10 @@ static struct iommu_domain omap_iommu_identity_domain = {
 	.ops = &omap_iommu_identity_ops,
 };
 
-static struct iommu_domain *omap_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *omap_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct omap_iommu_domain *omap_domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	omap_domain = kzalloc(sizeof(*omap_domain), GFP_KERNEL);
 	if (!omap_domain)
 		return NULL;
@@ -1748,7 +1745,7 @@ static struct iommu_group *omap_iommu_device_group(struct device *dev)
 
 static const struct iommu_ops omap_iommu_ops = {
 	.identity_domain = &omap_iommu_identity_domain,
-	.domain_alloc	= omap_iommu_domain_alloc,
+	.domain_alloc_paging = omap_iommu_domain_alloc_paging,
 	.probe_device	= omap_iommu_probe_device,
 	.release_device	= omap_iommu_release_device,
 	.device_group	= omap_iommu_device_group,
diff --git a/drivers/iommu/s390-iommu.c b/drivers/iommu/s390-iommu.c
index f0c867c57a5b9b..5695ad71d60e24 100644
--- a/drivers/iommu/s390-iommu.c
+++ b/drivers/iommu/s390-iommu.c
@@ -39,13 +39,10 @@ static bool s390_iommu_capable(struct device *dev, enum iommu_cap cap)
 	}
 }
 
-static struct iommu_domain *s390_domain_alloc(unsigned domain_type)
+static struct iommu_domain *s390_domain_alloc_paging(struct device *dev)
 {
 	struct s390_domain *s390_domain;
 
-	if (domain_type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	s390_domain = kzalloc(sizeof(*s390_domain), GFP_KERNEL);
 	if (!s390_domain)
 		return NULL;
@@ -447,7 +444,7 @@ void zpci_destroy_iommu(struct zpci_dev *zdev)
 static const struct iommu_ops s390_iommu_ops = {
 	.default_domain = &s390_iommu_platform_domain,
 	.capable = s390_iommu_capable,
-	.domain_alloc = s390_domain_alloc,
+	.domain_alloc_paging = s390_domain_alloc_paging,
 	.probe_device = s390_iommu_probe_device,
 	.release_device = s390_iommu_release_device,
 	.device_group = generic_device_group,
-- 
2.40.1

