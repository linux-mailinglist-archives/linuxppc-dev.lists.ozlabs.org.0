Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A619075FDDD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:35:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Uw3X+4LZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nPg42s1z3cZ1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:35:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Uw3X+4LZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8c::629; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6b3Sszz2yGg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kauqUzz3/mWURQOtR6m/vQarKBtd3zgUk+3ih1UQZeCEi7kSXw5XM6rTEUMu4XGZUDk8/tFixJQISQUyW/pP188YMpHFj4cEvcly7+ShaCFFkTT40otPLjYxvYXdlwxaB6kYx6kYPfPMTxwXVKj7m2KyCyheN/s/QIKpP2pOHaXvMqof/oa98MIhedIIaAm7NXe40FsmqRR7SUFTcrDyWiPO0rN83+571lqOtnmZBZUa6lHXiJV/LSVX789Vl3z++QOtyxSVirsP4XYaBfGjUlLzcI8mZjWFqAkjrRzAw/++qzfYVW8YYwIOdA4r8oYo9+UZR/rXA+MD03l+fsATgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNprHmXnkMY6BXMXgOhuw0JZy2uNvntezNiCcGkYli8=;
 b=huVbBV4aC0tOVon1H5mgKPnG9B3P5SUXmIcnuT5dH4S67uQBMn6gp5RO3MFRcFn32e8TVlOo3Fz4KJf27EB5TMgAZOARpTz0bdWVH5TlvcuqYctH8gg3s+W3AxfBrqgnEoV7PMvG3YxMPgH1aiiaNp+S7k5BFkqANibGSYjIxAhoBE9mbSC4KB6K/VlRqPKfH4eYhilY2lD0gtGaK98TbojVEIyfrEWHhN65NJTHn0ArqdWjb+TFCRw6VCdWCCZy4WjpPd/sdrLxb6qD16VemWRVHJZ7eXSHErxXx4ukZziygfoadJQc4ecKUGo9QUyDAqgTUxyNZKmW+uINqFTvAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNprHmXnkMY6BXMXgOhuw0JZy2uNvntezNiCcGkYli8=;
 b=Uw3X+4LZWv+6gcFHwBEF/m464Sje1HQo2VbQx6uFMlQ1d0881vifCmz9+XkfBFRe6RgRmAzea3NVZ/RabaU/hK69T/Ll6MY+XWKNH/uEgnQgOLWEWMiTE2/7K2x3agkwGGEeOIwZdS+DG3jam2pcNBsyUylmOt7KuQW4MBcQyS3LKTzO4eoNSmZGNmUxoj2VUE9JnFbSu/9usJUYkkTTHDjSCfSUFpMuacSiExGdtEN0pFuYvHEJifPqFkUYJRJBzrQcu3r0PYfwRLi+ZXYkiCX/FkLBncsQHk5VgpdaVkAOUZxDhKwrjQBpFRPxJtjsiCYW4dLZ0znhvT+/ge7iHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5252.namprd12.prod.outlook.com (2603:10b6:610:d3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:25 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:25 +0000
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
Subject: [PATCH v5 14/25] iommu/msm: Implement an IDENTITY domain
Date: Mon, 24 Jul 2023 14:22:04 -0300
Message-ID: <14-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: d0c8e12d-4e45-48ba-3a35-08db8c6a8898
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	S1sacousJmx3aCUviB+TOXiBQU0E3bI1b2YaJQ98ylZkFZZs4wdh9JNLU3HPtN/DHMk16ANPXKZTJuJWVtD44tK7QOC1gKxk8kYvNINCZRZRO7S8LE3BPHVRY7/EBDkqZh9nEfpAQHP07YmUDo3qn1mVxWl7H/po7MOcMVpadMS8FXw8svbW6ZlXc67TU0OGWbskfnTPnREXLab23CbPR+y+VVLT0wsOkyl/dvQVMagTpiT7/lDgi1+ZGD6SqcX5fAooOqBG0HQKwB3gOKpXfbWFxL7EmSs9FFKDSK/y16GpB04dDEBD6w/sg6GKwUo3Bn45rxgnbGTC58l4R5P4CQa9bOFiRsvzLmHTa5Jet89KtWZ0GLN96AbVdbdZ5joWgLS2UsqfjR1NGUdDNSeWD498W4672BOlw+19hG8RvPCCGOrSKbEju9iex9uIv4X3JTMhGSmzZfneBoHn3kvxIoj1+10JqZv1SHyy3AkX2ZJJCHGaBxmZZvqOgTZM6tcihNh4kaedmMUi7N9qUIhsO5FewHwTLfY665cT/2NrsgEy3OtmV8syDMhmTwqlASunb6u9vmQVmqL1bEVZzIjajmvzFwZLMB/OJGxS39DJ6Sw=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(2906002)(2616005)(83380400001)(4326008)(316002)(6512007)(66476007)(66556008)(66946007)(107886003)(41300700001)(6486002)(36756003)(478600001)(6666004)(86362001)(110136005)(54906003)(921005)(38100700002)(186003)(7406005)(7416002)(8676002)(8936002)(6506007)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?HOAjmxUJTNdaFvNbJJMLN5i3lplfQaOM7vpVtc2nbXbTBB4de93AztsoTKL6?=
 =?us-ascii?Q?wjuaSZvFt0hOSG62MsHgszDgpiO1aOSjvar9Asz8n7URdMzXJNML6o6GTLXs?=
 =?us-ascii?Q?0TeEI49APY/PVS8tIDcwEYuwu1jUuNhtiiWAr34KpX6STZnw9uvxAlxALBnJ?=
 =?us-ascii?Q?Lv0sWR6i89JS7NKP3jKnjceyKg38zaBYuuyYa/pm2tazyCPhmqswJDB72+jh?=
 =?us-ascii?Q?9k/ZTsskLFkFgIyhZDbimupB7ebv5wnkJh/wSFjo9CALL8xg14V3mPNtgHg6?=
 =?us-ascii?Q?e/16X5v4updUmshI6Z2bxAUC4K0k6BqzIMVxcP/8HbwSXkMfKxC9MjrGDOh7?=
 =?us-ascii?Q?T1EDUaw5gUT/0KRxOrg0GhuMhimsLxczOxwCUJ9NbKTSRdghLkRPYUTI3B8u?=
 =?us-ascii?Q?yqBi/EtnWiHsKh0Z4d4IVY0UG8UbGCCStjMR3jSoa3RzbA35FiuNGbbdqt7H?=
 =?us-ascii?Q?16w8Ihw73KURl/jjisUsMrDf3XI6zvhVu0L3yDkhmVJgpepJ50njKjjPP03g?=
 =?us-ascii?Q?fD58P66ZBOasYkpNuvh+tuSXexkcd2iBUDA8+ayruPRud4EfWLWbdGj8QY2j?=
 =?us-ascii?Q?nfRGii+cAZUvpUvoJh/8CUmKmApfWtmSwV6PKXl/R+wO1Fe9NqzQs63/3vAf?=
 =?us-ascii?Q?GesgicvOAsgl7oElyzjChCIOyY3XVo6CCLf1GdpFNrsMkO3/G/VcLcTZBtUa?=
 =?us-ascii?Q?YQdKWfqUjXaz0uGYzXl2VJrbduT/lFbEavlt6Vv5LNpdq5aE2v5k1I0v3KSc?=
 =?us-ascii?Q?2mgdz2lKxTJLXEqpSkjFSQhtIUhYXNtkWUP+WB+te9WcvU4Ztepz3VU66cx8?=
 =?us-ascii?Q?Pf80HfNDsS+IYg5h7zLPlrX6UFets8RJLOoJKDi9qSartWRiidk/EQnaYsqn?=
 =?us-ascii?Q?DNPBiqeWD/XtrXoLaLq+s1moGr54Mpv2ugGOILrKNh4mDr2gz7lqJRO9LWJX?=
 =?us-ascii?Q?g1crj8c96ILT0rMW2Gxjgk71ww+P1v2e5ga7Vb9lSR1uYxWzfPj8/DuxqKlY?=
 =?us-ascii?Q?LladKwGHCe5L9Ib/uSV8OwS8ffp3ZUkHfT92aS6+Bwo8a6ixpxUCG9jw+Muw?=
 =?us-ascii?Q?80CCT4VC7nRMzQNbO14+Ook2PRa+oGMAEtbnhC8urPOFXEonxIAIrnMMxBcN?=
 =?us-ascii?Q?yYiVBbJyxRsdRXleioQG39+fl8gFf+Zdilrb78QOr1Fp1+kbZZLwdwlZVDDn?=
 =?us-ascii?Q?7vQkPy52K97x8TrCm5ZNemR5EB8QcF/I1AzoYopOz5iNZKpSjog9oyKkd16V?=
 =?us-ascii?Q?KDCHfifXXn1mcorWdlNH/8kBqGUk5dl7bHqQOq4TwSQxrQJ6YBgAd7HP+ZAi?=
 =?us-ascii?Q?6hGaLGWT5fNQ6EqORgpThykAIartoshvoBAp1w3uHroeyqb9VV4aOgoh4z9I?=
 =?us-ascii?Q?OAvEHqSl2g2XCu47nRVzKWP2yqKU+rbINk9XiwfL+QcBP3IuwT3UxyUzuaIr?=
 =?us-ascii?Q?/EoM5tTbnMYg5N4MHItqFeydkySu9FC086NJuhHbwEDFBjowHnNwRMkv7J6G?=
 =?us-ascii?Q?hoW2WMgqGrze7Nn1CAILikXpj/E6UtnrrCvun0QRp0/v6WUgAk7MTw8v/+LU?=
 =?us-ascii?Q?xjPSC/9x0alDITCTnW0uYeIxERPT1OySr0CTRfOC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c8e12d-4e45-48ba-3a35-08db8c6a8898
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:19.0520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQIed9KYYg3yklCzTIbCPGqU3zR/VH58nhoma018CNLIAj+ERsYxGojuVphyMpr1
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

What msm does during omap_iommu_set_platform_dma() is actually putting the
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

