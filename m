Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C02276DC89
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:22:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IrgSjYYH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGV0f2tJRz3dX4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:22:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IrgSjYYH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::62a; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThp0C9Jz2yFC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLCNw7HuUeanTTWEbx+A7DdGuo1SlRFu72QTjRH57hbBPiKRAiKWF9QQGRlenZ+TmANhFNq+rzbECJbnmTLbK37oA2c9r1C9u69zrdPW+S4KGgCV++qB9dFBQJ62a72uCh1c3ErZdZ2KrnSxrtWPHrEKvaUXH4fhxoNJy9sCM/0SUPR//WU9zbjrZ6RvS36hJ5DszBKKDT/+tH5OCfQUGg4O0BrmLb5nc9Amyd3RlOd2boI2zohFNf7Qb1GHDHWGg6W2o3pUkm42xTO44qaXxdMtA8bIqoF1YSY0ido09c+mbE/GsfHqyE+rZXxH+23jB9H4ro9YwsntXO5But8yvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dz6dt5RIf74WYF+p6eT92sktXeneappvg700tVsi8FE=;
 b=K5jSubKbSl11abJk8XROC1fD3N+87NF6p9jW38eblqxVZUcqR4zeCebGKU8l1LUGtSZIdEatQOYZIraVwdWL4d8Ew3B4/rnnOVnPq4WJ0lzuWafFBiS05lWsD5yVYWY/z0zK+Qj9Lw19yzEZoro8RqTbypUjJg3bon+Vb869PUDKK1NpInh+NCx/loOPIL5b+9vPQ0eO4AGhernfQi+gXKfNoRW/3NrtwGRKe+paU5z6r74OrGXW6C0zt96ZSM+T8bhNXx4xGEDndQxCNiCVgpxjGfU22UA1gtf6hX2c2A5MeogHatIZkaHUBpPA/a5mOvtPkeK6fQtOeCqbk0qbjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dz6dt5RIf74WYF+p6eT92sktXeneappvg700tVsi8FE=;
 b=IrgSjYYH+dgCn99+8ienGIjsaH1lmP7bVgKhmLOlXgpTCDfVXvELZMuKo/xg1mtr4gvo2N/yZdk22R3WF7OeTkorstuqbZ7c+y0jc2rw82cdLp//cZNwPvqOGS61QBWYFKSNzaGiDXhRLNrnMvwKTySAPSWLfeqmg8976C9XjfALq7KH5isGiBMhkIHaj8k1BLLEU45URUy6c3sDmbs8w9AK19LAEFUiEfi5V1apMddeQEQrwcrQaU9B8sj3BcknMnJc30W3QD1n5zR2qIjCNQyVxNEWdmx8Z9iCZbK6TBzhw2xvOdnuBSAtnNF41/1/xtmSF41zYVcxkZ2R4wPKJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:08:21 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:21 +0000
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
Subject: [PATCH v6 14/25] iommu/msm: Implement an IDENTITY domain
Date: Wed,  2 Aug 2023 21:08:01 -0300
Message-ID: <14-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0059.namprd15.prod.outlook.com
 (2603:10b6:208:237::28) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c2988f-a516-4321-d22c-08db93b5bc3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	kbVmhJ5kzIipHTOFYRrjvSiWnHjgrlAe/5HeDoXqtyAAqXWtUe5o83FYcRy78F2oNGbrbc+8KAjq1S1meIM4Ueyvp9BcQw0ORH/WlS4Yd54AlfH2KKbZnD2nRB7mLfVmp5HufFNOt9nUo9bgpfG3agoyr1BKLfDPc1ySymp+ukJYsOsXI5K1Fi9sNfv5uPrzH7ze5nbi6sUq5jn7/1K0cPwxrGl86M5GjIrO8EqUQjyTpEpS3kYsqzAcReoUvwiVdI6uPvdQAMCWsPp5/wiaWBaxWxwDYIN7VbHRaht2G1bRk98XqVziK1QkjC6aLtxWlUg+SjV75hUiMbcnatvpcU84cFzsHV7vNYTG7S7s1o+HaXiRowgj671QAK2KuYsgMD2grsZbpisfleB4VFxOpbmmMFex/SuU5m4OYeioo8Ksz0X423las8+hBzHrz9nxXk4S5LckZglN2ZnDP065NZshwIkV9gwawhfCnBRrdFSQx2l4tGLKEs2aHKpa/bNhNoktX2r5H8FXmTQDujlyr8ghOqxUB7ixsicSVpQIS4im00LGi81QXJ7bXckKGbPRBHkl5PtlpTry51EY4LdnmZ2sIpdL59Axjj/6P6rXHKk=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(110136005)(6512007)(54906003)(6486002)(6666004)(921005)(478600001)(38100700002)(41300700001)(5660300002)(316002)(66476007)(66946007)(8676002)(4326008)(8936002)(66556008)(2616005)(83380400001)(7406005)(26005)(107886003)(186003)(6506007)(7416002)(86362001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?F1X2tmawWvei+c32esVYoFS/4e2F5mBnMkbOK8rcFqkHd5l8XhIbGfQVZNDh?=
 =?us-ascii?Q?dxgPZfpWp5ZZVqTHnTRIVZiWtkxqnXzL+m7GV5AnhbgmW7qLu06pkKP0ewRw?=
 =?us-ascii?Q?zNfVA9Ihh4HzEh1BnyANQ+xGI313mI92gOygSkYwRWypgJxpEcthd9phiHsb?=
 =?us-ascii?Q?LYgVfqb7fuvhqLuCfJRdpDDGc7L0N6prKMwQ0BIwyYTSMlvzzBBDB7ZKQhKT?=
 =?us-ascii?Q?POXpcELE/4C8n18Pp8PBjqpsLwXD8mG6UeKPY6f47j+5+nfTAGu7PIhuKdha?=
 =?us-ascii?Q?MQiPLjeuTPA2bRsBx8V7JwWhkwIbaAQAvlA5GwnA07FsUTJxOsoEwb4lEEh+?=
 =?us-ascii?Q?W+7S1ihw4N7XFu8JNklejALlaoOEXZaeBLCXMn8f1HP/+fOrp4/djUpC/WOz?=
 =?us-ascii?Q?H0zEFga0eOyfD6YgbQuUOsz2h2q1Nnu6xkd7dR3OR5WVQlRbL+Y9KX3fhmUb?=
 =?us-ascii?Q?SLgxnrc4DbnfOPr2cWgtsGb+EevKdy/7Oh2a8VYyqtbttsOqU6LYLufsv7ta?=
 =?us-ascii?Q?IeceUtOap0HM9xh8S0aWQshRowqOK1cj7m266Ud30YW3Pql2Posd1ZaM3+mF?=
 =?us-ascii?Q?ErwODFUXEpX/dyfefBSmOUgA1VmS4OlLcM90csKNY47WrT4vA/JOY055O22i?=
 =?us-ascii?Q?YTP3E4H3vK36QWjtT3da8u9imMh/sOOMh8hwHNEFnPCj/JgXi7UbdsqGO2BO?=
 =?us-ascii?Q?eapPZs4sR242gsu6v2y3O4RTDFcoqu58s8yh84dXC2K9U24zM1siWMJ3EqhU?=
 =?us-ascii?Q?pSCnhmo3xcj/S1jxUoDvZcei3O7I2Bp00wZzTBN9KVQeliyjvTMxX0pWqnIH?=
 =?us-ascii?Q?PxFN+6AWPTbS+xUtjEw7KiG5cH8Q1Pk5DQbCeVVN5pNYjOni6QcKWHvFwjFA?=
 =?us-ascii?Q?0zz82JuyzGZTT7oPI0W+7nV4izxAfNOCRVUTYlWpcp13nmgUoVDprSiYgLAL?=
 =?us-ascii?Q?uJnPU5xE8TN1Rgbgstq49kGG9yXX63mZ0LSQZ6+si9Zz0q0MnwwWz4sqSIQ1?=
 =?us-ascii?Q?sd0Fv149e5yu4X0/pbBgG9uQh98n4XbD3rygD6nI2I+WYjy1jwkHfEbsXl1H?=
 =?us-ascii?Q?P1m8lOZJmY8AKnZNQfBoQhqJyWCXXb9pPGFYFaQwtaRHuu9wwARP1TznX9kG?=
 =?us-ascii?Q?9bgKDRKaToaOaW/CPZBE2CePYa0F9yIawwug+phXdGuPbmBvDHc5bB08esF3?=
 =?us-ascii?Q?jzpvRGgClCeoWgIHm8/mfuG2dKJcfZQDodnbWbRG9HIYZWNRFfbCRio/9e2E?=
 =?us-ascii?Q?nepOfqTGVOkFgjfH4rKmo6b/tn0rh8jI96/DhmkxjE1ARVj/3Bj3sHVLQW7G?=
 =?us-ascii?Q?lk5TCDfb8rBGWjJF84mbXQWq/Vh5UE5DCiS2U07O3zUYv2q6h4Nx/mqIIxIL?=
 =?us-ascii?Q?8O9HpEUvFvl7KGEiHmtr54KyFa8W5PcCjOTSjwXopMME9ElQEKyWGefonxpE?=
 =?us-ascii?Q?Arrc0nboXkyjt1Kvt3Q2BCZhrf+yzxH3lqjE2cD/F98XK/pt2C1bts73Nfc5?=
 =?us-ascii?Q?dtgoXosL5monKaqsfsUwOrwL+pbu5L6C88NPqJyb+Rcou1WzdxyMb8RHDxqu?=
 =?us-ascii?Q?f8PaWSOQgweO2URZpjB5u26mTxhppsaSBHan/J+6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c2988f-a516-4321-d22c-08db93b5bc3e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:16.2672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0qxX+iRdVyVjrxA6v/2RAzCT4tAYguTdVZfkmM24blHmpJ2LXycNlmWm6KyRUU3
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

What msm does during msm_iommu_set_platform_dma() is actually putting the
iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
compiled on ARM64 either. Most likely it is fine to support dma-iommu.c

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/msm_iommu.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 79d89bad5132b7..26ed81cfeee897 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -443,15 +443,20 @@ static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	return ret;
 }
 
-static void msm_iommu_set_platform_dma(struct device *dev)
+static int msm_iommu_identity_attach(struct iommu_domain *identity_domain,
+				     struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct msm_priv *priv = to_msm_priv(domain);
+	struct msm_priv *priv;
 	unsigned long flags;
 	struct msm_iommu_dev *iommu;
 	struct msm_iommu_ctx_dev *master;
-	int ret;
+	int ret = 0;
 
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	priv = to_msm_priv(domain);
 	free_io_pgtable_ops(priv->iop);
 
 	spin_lock_irqsave(&msm_iommu_lock, flags);
@@ -468,8 +473,18 @@ static void msm_iommu_set_platform_dma(struct device *dev)
 	}
 fail:
 	spin_unlock_irqrestore(&msm_iommu_lock, flags);
+	return ret;
 }
 
+static struct iommu_domain_ops msm_iommu_identity_ops = {
+	.attach_dev = msm_iommu_identity_attach,
+};
+
+static struct iommu_domain msm_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &msm_iommu_identity_ops,
+};
+
 static int msm_iommu_map(struct iommu_domain *domain, unsigned long iova,
 			 phys_addr_t pa, size_t pgsize, size_t pgcount,
 			 int prot, gfp_t gfp, size_t *mapped)
@@ -675,10 +690,10 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
 }
 
 static struct iommu_ops msm_iommu_ops = {
+	.identity_domain = &msm_iommu_identity_domain,
 	.domain_alloc = msm_iommu_domain_alloc,
 	.probe_device = msm_iommu_probe_device,
 	.device_group = generic_device_group,
-	.set_platform_dma_ops = msm_iommu_set_platform_dma,
 	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
 	.of_xlate = qcom_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.41.0

