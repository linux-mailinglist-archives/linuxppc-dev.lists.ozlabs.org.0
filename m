Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 235BB785E14
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 19:07:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lb8X2a7s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWCLY03bvz3dTg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 03:07:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lb8X2a7s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::61e; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwy5F6Pz3c7v
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeknOVCEZd5lZadzEWInbXMVfKndiyVXwxDXERuvjVTyRq+tsrr2TaOuZwdyrpcOwTQehtYpEcJsuB/5QIxBjq9Gbjrq96VQYXvxUUJAemda4OmF/HXOv2BlHsBdcmo4IQGbAvJGIB8+bPU1ibX8JmPJ5QVIE04AaoNPI+okHbCpuC8buYOKMQSedfI/CQGXY+hTnuFxP6FvY0v8VMBLyKgtzNJ3svtuXMPyNtwpn4AiygGxctNilmWdDj8v398k3csyHWMaFYXI0SQJK1qTECuFrLRNEH/4oEHt1ielggdmIBjXru0x9r7jfPanJloqrzWiUtQHg3s8OAG188lfDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuioqqLJ9nwTxiQOZ8nAoXdBA08XbZNNbPO6KQsUrqM=;
 b=CsTefP4hknIW7zohsedJRS4jXq+6JPOTmcCtWaSL9nZ6hiGwZH7EqKY/BI6WizCMYSYjUUtMZxl2tJgeY+4K2596yxDYcbBos6dwcwEyGTM5YeBLuTZWXZdwjv+0ee2Mu5bwiKmQZ2rCl0yBCYkGprtJbOl9CRnNRfSTkSYtCW9g+vytpkFVdRkrjhJS2NwxzZlbq0NJ1db8gBTtJ7mHx7p6w6SzIaKmdX36WhYfiTQUXC7gTSuU/NsSiQzPLR7ekPHdUgT4BgUzNDqSZnXbkkSsE8bkE4TU7eItpzjiSQRmvVlsmXfx4c3GBSiovS+Wg6NPINOYsWIondR1iErJ4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuioqqLJ9nwTxiQOZ8nAoXdBA08XbZNNbPO6KQsUrqM=;
 b=lb8X2a7smpOkbgU3rUyUg+5A1eImZIYjrAObfKd3CZZT89+XW7IDRgJe+/4vbh7KudLygM4uFwgm7cnWxD9GBwSsMPKNPZfyBiM0g4lKROBNHPow54al8e7Hzf1zCfKnk7fMNf5wAt5CrNKI46Row+pW5MwpMhDBKDhjGFxkyQDfZO5MsVrOsHKtssFVx2aljpGYGaEdjW2wvBSYqUiMKi/MQks0FlBXe1DBH7MzWL7KM/Ih0fGAR3BtuW3UgwHaW1lpuy4MJMxRPVs+ayTlzb5pf7y5FLE1w5V3LQWvp3QLEm9nhqTtAldaWMZrrKxdHBRU24C2fvVLFjQg+I4qHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Wed, 23 Aug
 2023 16:47:59 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:58 +0000
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
Subject: [PATCH v7 10/24] iommu/exynos: Implement an IDENTITY domain
Date: Wed, 23 Aug 2023 13:47:24 -0300
Message-ID: <10-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR20CA0003.namprd20.prod.outlook.com
 (2603:10b6:610:58::13) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ0PR12MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: f8eade7d-a91c-4733-24e5-08dba3f8ad94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/6gPQ7d+mJmVIv204zuH2Ta83I4E2g11v810dePcBiMiPRHBmTaezp8NXO7giEFfNtcW4Cb8aaCCK2FZ7vWQ0KebC59JVPtPE72ZtiiCYRTWA+vmRd1v2Dih+n/J7jtPJQDshDlZiY0OUfCn0LYJ/CU2vxeAGN/B4/dXi5dkVv9w3tOLSROfYKGy5ynk0Ktwg6YncVxoyTND9/SY3egvbQee9sGpb/A6KB5YtGunrpPHPgrnK6AFZINa1R6Mgy3/AuCO1iqO0sSWc7aYxPApR6HOMrdaGUM/xmZAE27ugQr0kUMKYdx4ZqvcGg3A/OTlV+qan+CNQRMEKkp1e08hoyH4Q/BDoYcjRIq3e+/vWTf5dJJmon9MRiMR70wMMk1Y/S3p3YpGhfkZz1+reNshal0uFbJDTsVxUgzJ7nALJrIC25eYGb2RbUeISOfiXu2fH8MsjEN/HGcy428/b7p7tye9H9P1rS1QWo1V3PMCtmq7JmEFyi+688QvXweRorNzJtUsKiLv+47YFA3F+fs95pHdzXJLrnn6C3L7dyvGWEQbX3Y7+Orbk1EPVM9QVkD6De6njidJxgB702xlHMFGeQDE2X1wfij+SZfKO1boJUs=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?kJ0f6kdnlNW59QTgr158NJ2o9Q1HdLmYktukRRoO8tQQK/TLxwQIMRVSSqsw?=
 =?us-ascii?Q?RJAw6COC9UViDJrQdWrsBn9q0x8Ic59QEByVzu4pE/dBWCNhK+4Mnm7ZGyy5?=
 =?us-ascii?Q?SbmOqjcxhH9aHUxGDWWaNvzQKbI66FWBzeh9v0W0j62nRkDi2vQ9/exqwVO+?=
 =?us-ascii?Q?g8wnGPVaoSR89ksBg3YBfsL8JjQfCSYjAoti6z63IllUUmt2RzTQQt+q5Z+2?=
 =?us-ascii?Q?SqiLdnneJwLrfgPQsnbHtSd6wu4GXRqJSY2ZT1GRAtp/PimoY5+ogp4TxL6Z?=
 =?us-ascii?Q?v8bOrZOYJGdrljjW5no8q5pQw4CmWlwNQCN6sYG+sMmTbU54z6Hqdr7M8eTl?=
 =?us-ascii?Q?42ZW3K2Khsfw6Q79qQljkvF8ErgDPqPblSQxeGcFBqyUMvP/F5CU7XIS7TDb?=
 =?us-ascii?Q?G7qpxNjKH4AEDI8uew//hMclZL0y8JVEUgGibqsX8+cK5JrM5t3P2USc/oam?=
 =?us-ascii?Q?YZ3Cm1+yiBwsxMsIq49AFyteAgSlG0ofFdUfkJIBGTs0jglhmZqv737P7+yU?=
 =?us-ascii?Q?XZqVlHLYr0ZTql5zARAOJdQbUphAO87omMQNBUJm7kjdMHoaMK/fvYIK14pl?=
 =?us-ascii?Q?2vjmToFdibqNCjce8U4UUr1Qi4VyE6qHGj6S5jlhVDSw0I/ssxE6TI5sbugP?=
 =?us-ascii?Q?8qyfrGjMTfXWz9y3T4Ed+9XODTVRtBak864rOyar/V+E+CAOtQxYvkFfoVQ/?=
 =?us-ascii?Q?Axj52qDVHo4w+kSBHdlW0u+bUA7QFxhHDjSIzdRROHIAJRUAq+hVEQEA8poq?=
 =?us-ascii?Q?mAk96pWubBIdTM7IvisGeVMru2oCgsUGOgIdU0unPCn3JnK53sMM7b1ntGvR?=
 =?us-ascii?Q?i5NY2Aew2MbhqOVqO+ykeXezIe+EkdULkVoFuulsOcuTfVGOiudkWK2NuOjd?=
 =?us-ascii?Q?QwunF/9FsWn1uBShdmrgrRj1lO/oI+cIg3XcKMuIEcmmrRUmRNR7zYV5Coje?=
 =?us-ascii?Q?7pBJmJB3XOZ9DmzKMNKKKRxxSVc9A5cyjxuWQZKyfGhK7tIVxXtqSYVXBgWp?=
 =?us-ascii?Q?yHmmInlqd3xMD/Q4cJATpYSpYjbBGfqmv9n3Kq/lW59UxCdBgm1Y4D/PyAwn?=
 =?us-ascii?Q?XhvWfkkbjQGnC1+YW7T+yGhHfbsRJ5S2yACkxmNCLY0KJAP7DMZ0j64JOrft?=
 =?us-ascii?Q?Wf6m52MTGx7AwVe/tIlu/IJMS6kC0o4wTR12/gSyMLSHxMvjpwXcbBFN1vNl?=
 =?us-ascii?Q?MEhuuZWMU6+zB3rsnEyP5p5QqfFQhCdwgIQL9W++eeaBF9ktbPqnvH8IlBIY?=
 =?us-ascii?Q?W2DGR3mkJqx6CBpySYsfc5/DqcR8nLqCJSayMEumYaEvvtNBMH2CX+rfzUSU?=
 =?us-ascii?Q?F1elit2j5uG7GdCkhx+ANFUH8XbV1l2nUaUvRDk+kx3RRh6e9o2cy0RvEhvT?=
 =?us-ascii?Q?mgudbPLjZuQLJN3Gz/ElkRqWxGSEgB2YKRUKSPLpmgvj5aFySABUQhC+WO74?=
 =?us-ascii?Q?Ox2SldvP4DPx43qKOYEjsf5P1aNiXXHcDCYQI33rxdecYKO5AonJjCq7NXnm?=
 =?us-ascii?Q?XDH8j8JVxDswxbNGpBA2UCfzV13ioh93ZzqMQU71sq3SneIqdkABz/0QymtQ?=
 =?us-ascii?Q?ASKUz8J9XF8+2w4bdaJVW4LSTU+vjUvFNxq4/6G9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8eade7d-a91c-4733-24e5-08dba3f8ad94
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:46.5750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +q5ixpF0Iui1PtrCLS2sbGMaJMDYaczKqdKLgsxD10mTTvrLNr/6XI5O7eHkrQHH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7473
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

What exynos calls exynos_iommu_detach_device is actually putting the iommu
into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/exynos-iommu.c | 66 +++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index c275fe71c4db32..5e12b85dfe8705 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -24,6 +24,7 @@
 
 typedef u32 sysmmu_iova_t;
 typedef u32 sysmmu_pte_t;
+static struct iommu_domain exynos_identity_domain;
 
 /* We do not consider super section mapping (16MB) */
 #define SECT_ORDER 20
@@ -829,7 +830,7 @@ static int __maybe_unused exynos_sysmmu_suspend(struct device *dev)
 		struct exynos_iommu_owner *owner = dev_iommu_priv_get(master);
 
 		mutex_lock(&owner->rpm_lock);
-		if (data->domain) {
+		if (&data->domain->domain != &exynos_identity_domain) {
 			dev_dbg(data->sysmmu, "saving state\n");
 			__sysmmu_disable(data);
 		}
@@ -847,7 +848,7 @@ static int __maybe_unused exynos_sysmmu_resume(struct device *dev)
 		struct exynos_iommu_owner *owner = dev_iommu_priv_get(master);
 
 		mutex_lock(&owner->rpm_lock);
-		if (data->domain) {
+		if (&data->domain->domain != &exynos_identity_domain) {
 			dev_dbg(data->sysmmu, "restoring state\n");
 			__sysmmu_enable(data);
 		}
@@ -980,17 +981,20 @@ static void exynos_iommu_domain_free(struct iommu_domain *iommu_domain)
 	kfree(domain);
 }
 
-static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
-				    struct device *dev)
+static int exynos_iommu_identity_attach(struct iommu_domain *identity_domain,
+					struct device *dev)
 {
-	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
 	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
-	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
+	struct exynos_iommu_domain *domain;
+	phys_addr_t pagetable;
 	struct sysmmu_drvdata *data, *next;
 	unsigned long flags;
 
-	if (!has_sysmmu(dev) || owner->domain != iommu_domain)
-		return;
+	if (owner->domain == identity_domain)
+		return 0;
+
+	domain = to_exynos_domain(owner->domain);
+	pagetable = virt_to_phys(domain->pgtable);
 
 	mutex_lock(&owner->rpm_lock);
 
@@ -1009,15 +1013,25 @@ static void exynos_iommu_detach_device(struct iommu_domain *iommu_domain,
 		list_del_init(&data->domain_node);
 		spin_unlock(&data->lock);
 	}
-	owner->domain = NULL;
+	owner->domain = identity_domain;
 	spin_unlock_irqrestore(&domain->lock, flags);
 
 	mutex_unlock(&owner->rpm_lock);
 
-	dev_dbg(dev, "%s: Detached IOMMU with pgtable %pa\n", __func__,
-		&pagetable);
+	dev_dbg(dev, "%s: Restored IOMMU to IDENTITY from pgtable %pa\n",
+		__func__, &pagetable);
+	return 0;
 }
 
+static struct iommu_domain_ops exynos_identity_ops = {
+	.attach_dev = exynos_iommu_identity_attach,
+};
+
+static struct iommu_domain exynos_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &exynos_identity_ops,
+};
+
 static int exynos_iommu_attach_device(struct iommu_domain *iommu_domain,
 				   struct device *dev)
 {
@@ -1026,12 +1040,11 @@ static int exynos_iommu_attach_device(struct iommu_domain *iommu_domain,
 	struct sysmmu_drvdata *data;
 	phys_addr_t pagetable = virt_to_phys(domain->pgtable);
 	unsigned long flags;
+	int err;
 
-	if (!has_sysmmu(dev))
-		return -ENODEV;
-
-	if (owner->domain)
-		exynos_iommu_detach_device(owner->domain, dev);
+	err = exynos_iommu_identity_attach(&exynos_identity_domain, dev);
+	if (err)
+		return err;
 
 	mutex_lock(&owner->rpm_lock);
 
@@ -1407,26 +1420,12 @@ static struct iommu_device *exynos_iommu_probe_device(struct device *dev)
 	return &data->iommu;
 }
 
-static void exynos_iommu_set_platform_dma(struct device *dev)
-{
-	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
-
-	if (owner->domain) {
-		struct iommu_group *group = iommu_group_get(dev);
-
-		if (group) {
-			exynos_iommu_detach_device(owner->domain, dev);
-			iommu_group_put(group);
-		}
-	}
-}
-
 static void exynos_iommu_release_device(struct device *dev)
 {
 	struct exynos_iommu_owner *owner = dev_iommu_priv_get(dev);
 	struct sysmmu_drvdata *data;
 
-	exynos_iommu_set_platform_dma(dev);
+	WARN_ON(exynos_iommu_identity_attach(&exynos_identity_domain, dev));
 
 	list_for_each_entry(data, &owner->controllers, owner_node)
 		device_link_del(data->link);
@@ -1457,6 +1456,7 @@ static int exynos_iommu_of_xlate(struct device *dev,
 
 		INIT_LIST_HEAD(&owner->controllers);
 		mutex_init(&owner->rpm_lock);
+		owner->domain = &exynos_identity_domain;
 		dev_iommu_priv_set(dev, owner);
 	}
 
@@ -1471,11 +1471,9 @@ static int exynos_iommu_of_xlate(struct device *dev,
 }
 
 static const struct iommu_ops exynos_iommu_ops = {
+	.identity_domain = &exynos_identity_domain,
 	.domain_alloc = exynos_iommu_domain_alloc,
 	.device_group = generic_device_group,
-#ifdef CONFIG_ARM
-	.set_platform_dma_ops = exynos_iommu_set_platform_dma,
-#endif
 	.probe_device = exynos_iommu_probe_device,
 	.release_device = exynos_iommu_release_device,
 	.pgsize_bitmap = SECT_SIZE | LPAGE_SIZE | SPAGE_SIZE,
-- 
2.41.0

