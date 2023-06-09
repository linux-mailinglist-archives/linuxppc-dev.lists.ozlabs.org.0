Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BC172A431
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:15:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdC4z1k3fz3gFX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:15:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZxwgZr+e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::62b; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZxwgZr+e;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBg25FmKz3fGF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ny/QLz501byOV8eupXHS1azzb+Wt7Mn+JZYbA0MpYFtnkBbel5BvBeM5A22JLWx0/JAIKtaPdAVdHcBDZE/sVFKnYP43+u1XwlAQFAaYLgdkzBfWknwBKopquT4CRqAD87bK8QNOd+uq6gufxIckgFdCRiSLa6jj0msiB4peSLIHHDbV3Z18OVueP655kILMMbJl13QXr3kiUMADcmRat0e0aGmzIvHvOmmJdd7N7scqJdHNCf/vv5hp939hp9R97I3CmKWUOddlSLjlRp34Se6bWIjiqPkaqa/helsTBD/88o7Ihsw1V3QrmPyS0QyHOausSiDfhPPQvCqisYr60Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFI6YlGa/rRO/LUho1t6NDgB0fD4aHQKfGv6pVqsJA0=;
 b=lnRLqz5KdYgWmNHMxdQV0mQdmuILIWpjD39b60LojPLBlv/IQzGYDxYma0RC+89M5wY2ZkolQLiE/whF5ICakxAA6z/PtHHAbAKBBYrL6mr8YMXvGG+DWZrMadRjD2HoKQNMLhKlRnRc2eMzxMbSwgC1wQTK9rISOFISKxQzxY8ld0e2vQ1I4tvvUFI3/4QY55Ts93lrPB9cPZjhDIbCCYU827jw2EBwvGoqTqbEhiIGUmooVbQNCCSbWkKRuh1J5a+3pyAo4s3MCSYZCsA6MLGHGeu1YSAvZXyhr4mLHL6vU6xEDMO1ElOPTqZnyd1IAKU/nz8YXmmLOj1WMtHaSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFI6YlGa/rRO/LUho1t6NDgB0fD4aHQKfGv6pVqsJA0=;
 b=ZxwgZr+eZ1INxxBZSMRncm88Tzc2MLYLHTOAQhEm6HzY79uNlALiAY/RrE6j6AI2DSqXa1V/JIYwHP9q7cs1CpPKkHS/J14UKNMpR0dOWyS+pSjXVqlOvnuV/wpv8Aur68D4tH7wfc3WeM42iYqETIxA1ot23vPVGu3xxoBbn0z/cuvenD7Yl8xnXbM9v7ZpAKjQtOBrigsOSONcFZSBctFA5XnMO3fhe0ZCoGTUEnaI5bQ+yBi81ZV6oJ2eDz3wfu4g7FeaK5OTA70EFtpTi8HIg/jX75as06ydZqFQ/J/lDYBHhdfR421XTILMkeGBoPsFmzMAa9UAWMUyakTFfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5785.namprd12.prod.outlook.com (2603:10b6:208:374::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Fri, 9 Jun
 2023 19:56:26 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:26 +0000
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
Subject: [PATCH v3 14/25] iommu/msm: Implement an IDENTITY domain
Date: Fri,  9 Jun 2023 16:56:02 -0300
Message-Id: <14-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::35) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: ad775b14-09ac-459e-c7ca-08db692399ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SgyiDDbhtyLQDZjV2A8J27WxjjryAjq8EzPOoqnolEEwsDUIkeMEdokrZkyoWl1m9zf72adYkUpjX4JsPZKU6CcYczqM6fe8U7x2Q4W4Cp3IRL56t4LfMiFcvv6YjNHYvMeGe6vzgZtJM2QzsncTaZUvD5n9J+KU1agbKt1X2ThQyT12rPsaeHj0vZzGifObdo4jMRG1BwyYrr0klGLeREFitZKzfbpH642CXSDGX/glLQSZ4nuHNV2iaPvCwvvdhGn+jp3Mgp7mlxYLFUkPG4PrcIfMXXk3h+k4pFstYavWAcIZye7lybqLwlYOI37ZZOkR+x1vbeSYt9S1n31VwRnEBgHVzNzD6c4h7NLwvwFWhJDhiE/Lr/PWbkheYA83GaKmcmA65cPA0sAbMeUrHGFPMMR981JMVftAupWcuFsIjRgvBDdCvIx5Lk2oZ+tl2n/sR8vy6W8rNA5v0tde3F/If/1dzwJQy1EtDcUexYLCC2U/D1uU0uj6aKx6Id1LWZT6Y4nRispPBPTIoOdu+UsBHCztMJhYsoRDpZ68Rm7k0nBPB9Knk4ITs/qxKB2vdlmXCoIzR4MHMl0T9me6qezNGDaYpf6+4jYr/qBj7r0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199021)(83380400001)(7416002)(7406005)(110136005)(478600001)(8676002)(8936002)(4326008)(86362001)(66476007)(66946007)(921005)(66556008)(5660300002)(38100700002)(41300700001)(316002)(6666004)(6486002)(36756003)(2906002)(54906003)(6512007)(107886003)(186003)(26005)(6506007)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?a3TNEbUU85knR5N9WjLBSYiIbDJny673+7k5kaGT1xIG8/WZJcGvBCNKfr89?=
 =?us-ascii?Q?OEp6WrfUo8u3iaQT5gVZU2DMb8VCyYoICxHdxX2REw3AG7pwmAgIYdAyNRfW?=
 =?us-ascii?Q?GQ4C6y70vM30AJG3+73u7wOLeKddYmfG/2GPAQXJf0m4ndACD7r/CIjmdq4q?=
 =?us-ascii?Q?9wphPrFF2+S0CIwrsPVABrVE2XEM9ErpR4UC8ZY8QyT5/HDvqbfyQYnNmmgS?=
 =?us-ascii?Q?kKndop39e6lVGH6SajRaTDKG3IJEbRu8psg97gUNLFRQlbbxXxnHn0bYlDG1?=
 =?us-ascii?Q?7eMb+4nV85pG7bvs2FtiGHOTl9RK0K0Gn1LDj4W/tn7ex74C/4Bj/OdO2yaG?=
 =?us-ascii?Q?TYeN4qtHASoNSAAeJQbMEJY82pKbB0KMmV4jsMjxfd5tvQz5iTmdAko2TLkc?=
 =?us-ascii?Q?3wyUFzCfIhGwhSP+FkAUGZW8UNcs7n5BwSpn3y0LPt1gi0ejMpF2mslDbb2p?=
 =?us-ascii?Q?/a9CIkrV3CGaddCDPDCSJxNfIXNt+d8agV4fPbrLnuw4UXMP3t9RXcBDIe4P?=
 =?us-ascii?Q?GDSpyZn3w3OwggXWlnn63hxjbJgRqRsDYVQ2VPDQJvVNUue0jNOLRmvU+A4H?=
 =?us-ascii?Q?t1ulxWRal2okEr9ElhZCc5PgxSR7HaKqpYAZkWdG38ACowhXg2n5tIx2A5N5?=
 =?us-ascii?Q?7NpouGZ07qBz1K6hXbyexF9SPvsRolGF5G8AW6rGholABhgfla75Hwi0ZdCX?=
 =?us-ascii?Q?xgQJtnt1Q/PNviI8ITzPYmMnPREJjXEZtwOnaHZkRTooRjDBmknOVwv+e1R/?=
 =?us-ascii?Q?UXqBxW0AJqbBC0vFkZyyNdq75S++D0q18gYXn5a8LhdxcRPCGpsChiaWra15?=
 =?us-ascii?Q?W//CW3IDBWIrWU59GIw23a/d8ZCyljcOo3RaSPducGw991QuQtk+SFYU1zqf?=
 =?us-ascii?Q?UO4DwuSe+7C+h45CE0nx/aMnJIoZpOwzsyZU9OeK6JLocvSQLlYo+WKRMIEt?=
 =?us-ascii?Q?tseYKRoZmNPoplkT26RhCrZvj+UKEmCSdb3JTQLP2vU9ZNtO8V6uRqkP+G6u?=
 =?us-ascii?Q?G86QIjNIhsi/XxvVlh0Tx4qdA6tlPhC50KjPP8eNiTV3x5MZBDihupOPumx6?=
 =?us-ascii?Q?/ftEL5BHOKoYY5N7P7Rew0AzfPBi6hhYnXCgBaMgmSkw8bgUtrY4xAySW/7B?=
 =?us-ascii?Q?jr7FUMW7WWQWl/R0GOD2hF1m0DwXRNZnownaclk08CsX+g5g9agfVWsmPc9R?=
 =?us-ascii?Q?/h/lQR+zDuWcPKswmdJwiyA7yzki7uw3f2/Hf0sp39zuLDr+KcwROUKFsSvY?=
 =?us-ascii?Q?ti+fNeaRW8/HVoXlBPHDsfbBcqYZMTHSAuKZrZVZz13ugmFn6EkbtV7CUG2D?=
 =?us-ascii?Q?LNibP5VV+FN0lA+dpNo5wNN/uvfXq/Pd/g+/j9xcHQ3kQhjRLR9T3KNUa6IU?=
 =?us-ascii?Q?qqRQKIue6m9ynTWUNTaSbLSyrWQO/WrafdHySij3EscvoObu5q4XV1K/Ztnv?=
 =?us-ascii?Q?TobaTFyCHCdJ55ZCVbOAYpTIwRVAGXwzRwI7Wcb74r/x4vbSri/cAZMkk+Bp?=
 =?us-ascii?Q?mxGO+1mtciRmNa79klBOafq6sO/vQIjk5fL9VQDuwpxcSrYH0b4X8ANY/1ky?=
 =?us-ascii?Q?n+w0sU9aX/H9u+jMeHL3pDUvv/Lk0yzU0H9RJrHC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad775b14-09ac-459e-c7ca-08db692399ee
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:23.1673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2yhwY4Wl4jPia9wjzBFPDQ2hVg4VtTG3JrXTfx4kyZNMaEoKcd41o3yD2fyNAWj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5785
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
2.40.1

