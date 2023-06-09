Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B9C72A439
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:17:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdC6v4tMRz3fgs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:17:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=k/uwhYDU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::62b; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=k/uwhYDU;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBg31nrdz3fHK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lFIYJW91l7SSaT51PKfN6uY3ilbg3MS98e1cikziG718rel8+a/wz0flBqKTFQlwUflZFT/AgKSximERsh8sbOymnxhXD0AQ3pbcn6tHgh/deySIBfzYe7QKNpGNP7AhnM7BW15kTsembB6U8wgOI1v6oFiyFxOEFkzXToVVpviEAJqZkEVZW+MtF5l968cqKDSgnwBUk12ia3lL9pDZ5QZ86i9jP/3+d3PbD2OwdDesazfwrMgXXsK8bwcw40urEnLtah28pqXaIUU+LsQIeOhavxzjPWuZ5R/QoTEQ+sDs65PfcUkL90KdS+okgEqhalJ9cVfJMjAt8b5e5kNlCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1C264BQBMTFlLs4E/xf3D1AOn2brjnRUGsr5ogwL0Y=;
 b=BAWz1VfDfn1oyOdGiWoes6FI6KbpUWLvCn2zo6Mqe+LvwbgFo2Fscs2P7HywjeBDPAVrLPHVaD8q1+zctQCj+vKiSTsmV1UALsofE6xa20cATdwRRHFNKyzS9hPMROihy38QkiqE6WWp45Yd9qRP1Fb2wGoADtzcex9r8sOky1trYVzUg5e30hG694NffiLRKtdT9/s8jRnxqDAErfK3+nJ+T0gJx/7x04BFHjzTSYm1K/DcM1CTOvleNCIoKx4p6ad/wdGqxMtO11J40xOaEGe6qNYx2nzouumMZPSA4HTtq/D5K7SglE4YcOLzTTFnDKlJnqcibCNVpxQ3UDcz+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1C264BQBMTFlLs4E/xf3D1AOn2brjnRUGsr5ogwL0Y=;
 b=k/uwhYDUXCt4BJPtXbs1LuLXq7xefJBFppJ83ItGKqqOlZ7Vb74sohMeXOUsGN4nW61eMJNWUW+Bzu6GbmbEK3e6ACsW6XfL4FrvWeLFKFq+pfe6F39A7DZlnUplWOB+1GXYZC9okmQ/9DfyYRskamOQaFVAux69f8wxYybM80nDtH0NRAjtudtak+xEcaPcVBFYF8DM+q9PnPOcXzCY6L8b8dqVBQEeUyZgNybgLJW+ab/16MC8shM1MQX7D3mAKCkSvuNMeuRrQpjeg1DPhNV/nNr5c7v4LoZsTeXRhDTBdFiorQYYsO2j2fu6R4xCapM0oKhp/31GATBC18M4vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5785.namprd12.prod.outlook.com (2603:10b6:208:374::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Fri, 9 Jun
 2023 19:56:27 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:27 +0000
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
Subject: [PATCH v3 10/25] iommu/exynos: Implement an IDENTITY domain
Date: Fri,  9 Jun 2023 16:55:58 -0300
Message-Id: <10-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0379.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::24) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9ab37f-3289-4f52-cdd6-08db69239b4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	l5kAei8VvRh26wPnNNTgNWeOX8cm/qthZvQvjU3do+RKqcunw9i4TtQJr8aLqaM0w+7rQnd3CxtjL7b9IG1U5NYsaTULqCv4pFsGkwydmgG3sriRHvVyEccjVjrGYMtSZyDfaBFkFPoAtvBH+DQdoFNjfmJiU6VJafnecORpRCeGba9MTO7hphLy78a2KzFJcaOsPCdqCI1K30qWnS5qLsRwhzFhri/7dzMPaCQgMZbvCLs+5aEdEFZ4r14GbGaBwxAm8qPOovgnNmhiRmtprldvjH17/vO3PeiDwaP4sXlVxvseHc+cPDFG1yW21bJFm8ebchAGBrF1s0bOGz5Rs3gUGXjCfljxmgBvp9J6TOb7jQTn+CvKgUeJhls/dLkFfwhNFuQdMLa5bapLp/l5b8gUZFQ1Ugix3aJ3H1JFUielCMqy5CbBs2D8egp1OjWonVL5vkoqhOJD5P+QMae1zUW0JGSZqp81bM5tPfUPiZyLSfb+8BUSPEvXFBShU4C9AilYNlySnkPtZEAL/Dw0fXjaPkOmLdDbBgle29c9dHRDrzhDPR5FoIRsW7VrDv+p2wFqDAIdRqhopdko9+6vxpwMxqjKzbQUsAHbOSomXpg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199021)(83380400001)(7416002)(7406005)(110136005)(478600001)(8676002)(8936002)(4326008)(86362001)(66476007)(66946007)(921005)(66556008)(5660300002)(38100700002)(41300700001)(316002)(6666004)(6486002)(36756003)(2906002)(54906003)(6512007)(107886003)(186003)(26005)(6506007)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?1jiKpdHCAtqDY6HIE/aAsGrWAdA5ffCENu35XHTkFkY1KfvyV/mx5C2Tx9MT?=
 =?us-ascii?Q?1VVqTvceP1XO+vqanX/bt6PGoYIVa7yzOccP6W7wvk5TWOuCs4f5+LsNwe3s?=
 =?us-ascii?Q?ddYoDrqlNheoIZngMT09PadFBpV0IiPxI6/M5R1pzVPFEZ+NLVAnWCTa+AgN?=
 =?us-ascii?Q?CCDl7zLEgCcCHgXlZ6e5qg8k2cQewjewkQ4Vm4mGvZVFmyoOpMJD2mAbj1W6?=
 =?us-ascii?Q?LQ4DtRC1J6/KqkQjkQS3olE/B0WGuIxJGDJ9ztf+v6tau5ev89jBi23AS+5e?=
 =?us-ascii?Q?dGIzGOk8Y2K9V0wabhZAK3aV+/GNctJ4tGZN0ohPnMBILNSqRt6Vc8v6X/ov?=
 =?us-ascii?Q?jhQM5B5kT4n8YhWKJXafOjToZMOwlfV1CHn7V1JYUcdMOtb9mCh1pwPTwrSQ?=
 =?us-ascii?Q?ztq0YHA66RKQj6n0C1xP6tbuOxOg08WvQeMOS/yxt6iCLgsBmMEdwRCiNfgs?=
 =?us-ascii?Q?8XjfPo+klrAWpEJg8E3zq7Om28aLQ30TczKi+xCs0Y+1KEpdNwknTt+2QlWU?=
 =?us-ascii?Q?Om2TCcfSMD3xagdaobK+9Rio2To52ubb0tIH8CcuIhWLul0bgpMkShyIvfZs?=
 =?us-ascii?Q?ba0P5Vb6mHmO6zXYQC2xOXfoeHxosrO5WiNrBmc6e3fwBjF/pj5/9pdscQdF?=
 =?us-ascii?Q?I28p0vAYOxtYtnSjGr9YKHAse5BzHnnA8qZUW0DgYEF9rj/R2X+vtmkmy/lp?=
 =?us-ascii?Q?yg6Lgli5Sv7S/qLR8T94bWn4eX95Icj7b2N2H6l2uC+mJhQoHMtO5d38Hqhf?=
 =?us-ascii?Q?l1wB9Kc8f25vyavyIKp/cabvZF+Zz86izruGxED1dDivt2guUzdQKULcBcqb?=
 =?us-ascii?Q?/jTHHF7gyAUg+q6CvgQz5/GSrt4DB5qFh3cIhfv9qacvVIh384mvW7BH2lcx?=
 =?us-ascii?Q?kp9zZxEVMwODgG4P7FEp/Qdr/sPXsmlF2wRdjOkzb3gak4w+I0xfk1/sdaLg?=
 =?us-ascii?Q?kMp0WjM7PNUi5CR49ighfbuEfb7wdI57UwdZ8rlbNQl/Hg9c3kEdVzchX0qi?=
 =?us-ascii?Q?14l2e/brwUpsGBiJc7qMUduJFsGv+Qg5KY0N0/MST7kqDKv2VCAA0c7wG9aD?=
 =?us-ascii?Q?qP8yDwsHq+eQmYptwlgqkU0KY3uEfEYXLEK1MIUpfry4X1m3MNN1H9M5moO3?=
 =?us-ascii?Q?29Y3mvGIXZIs0iQP0+5oaXZFVkp623SjAYxSjR77C4Nb+wN48jJ1ofPgjWGQ?=
 =?us-ascii?Q?F5taXJ/HLJ+H8Cdcmj7uDWaQMA7HUXDv+pJ7XQWj8/2kbETzSE84oM3o4aZo?=
 =?us-ascii?Q?taXJlIrxXqw6x0K/zvIkx5q0kThPAoNg+fz16RMVhKLHlIrVh5ms8kLU0lkJ?=
 =?us-ascii?Q?ZFsrb4mvo36ysp5JDeSXaK/wOByzyAP7Yml2kcAZDZHYQpHIoyaBQid/UtYU?=
 =?us-ascii?Q?oKl4JFPeesZpSv37/Zk8FRYyH0mDnXwnwCJPfOuyoBZtbTZKKxxVoyggLhDV?=
 =?us-ascii?Q?M4MvZYH+wKQxEVThl7D+j7ELQwCrYwhW4JkdMf+a5PbpTaRSXIHievjL3+Kr?=
 =?us-ascii?Q?jAfvBPhe+5ulJ2ooRDGfFLCa+MmVD7HZTQ56fHqkbZDarNkQlPIxYrDs1KAy?=
 =?us-ascii?Q?q84XeSw1GbPjrnyWdBEshyIOVDadK6meseXISQoY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9ab37f-3289-4f52-cdd6-08db69239b4a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:25.4580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slcVzNebVuqpsWNJiKmdYmYWN0PI/dpYl9Gy1uY2KL+UJhS5IVMn1VzIwcB9tlfe
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
2.40.1

