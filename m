Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C957339C5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:24:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fNtfiAaK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTcl57qZz3c9d
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:24:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=fNtfiAaK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::614; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT8N5mWRz3bw8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nTFXpbijChNrhAL5mJb8maaMLgoADa2H/WpGWqp4cHf7RLvqkBjtVleTK4qhkc3v11ZCQj9g+J745LO8MgV3l+9qbhMSXl2QBjSmk/kxYNaqJrSs0s2/OCLFqxeIHU7OV38g9Gx3hnHwXkyOje0ED86VmdM7OgdJ2UgtE9ypzKlS/COT4bxeh5mB+CEI1HoqqP1C9k4t6MZfCqsLfaEh5+kgj5XyNWk28ynAPWBmiku10ZmvckM4ceJi5oSSk9aOlKHUDZUD2b+CLVceTx8mPWqSSz8aiPIcNCu62NoOTZY6LzjgMrAV5YMVICgJwZ0QzUQKujDc60e1G6F4IReO/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1C264BQBMTFlLs4E/xf3D1AOn2brjnRUGsr5ogwL0Y=;
 b=JQvjnXQ2Mj2xU6qxs4zJ3Q8T6nCJb9Xl6DoXnw320Eo16xENoIVZn+x+5tIB9Wpo6OYt1/pVbZ11UH5YbK7qia8BKEsfIQgHpNTLAuf2OSO/7URms1O78O8O/y9Ps1RwLskdvBJmPcOQdbS1+eJLNKRcC/5ijeCUNJgP8P1DiDYIyFAJe+4g+RcZoVY0dIWa0ZyOkjDWLv0ojkP27kOx6WSL0q9LnRunarAf1eyotdnAc9dIE23iW600upMe07WF5gupAyPk2VR94t4kbkuqHM9JjzEM2Qh/KxQc+721kHaAw3ZuIUhDDV4VhwhPaeZOWcTKUpKl7/qMpq+EToBweg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1C264BQBMTFlLs4E/xf3D1AOn2brjnRUGsr5ogwL0Y=;
 b=fNtfiAaK1S9QhntGBPiTw4EvBYI5/ce2U0c4zOl6mywaIoDNdIEdkBm32fz3ePqGsHMDOGBljqtB1XHaPplhzO+bkdvClJ3FakO05311oISiYQWEaeZN2pHfB1qzsmybLXRPNQn0wugyJasmrt2erqIEis2fpd4MOlnsQbbjviKiL2GxHeNxZI6K70JX4emYLJXKNFP6xNnvVMnrLgZJml/78AwfornzXyTjS0wsACHpS6ijzgikQ8hDQKIiqWLUbHE9O7oFzU+xrxrD0omzPLPB6JOreBiltgUaRfyipI6WTPml9pXBEOsAHGGTd9RtZsmj52lQNoqSV//P3mcslw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS7PR12MB5912.namprd12.prod.outlook.com (2603:10b6:8:7d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 19:02:56 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:02:56 +0000
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
Subject: [PATCH v4 10/25] iommu/exynos: Implement an IDENTITY domain
Date: Fri, 16 Jun 2023 16:02:39 -0300
Message-Id: <10-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0065.namprd20.prod.outlook.com
 (2603:10b6:208:235::34) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS7PR12MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: e049e19d-6e84-4967-571f-08db6e9c4ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nRi21VTenDWK+mttTSVoEydIPy44vWge2snRez+d9sFc2TWCeyQNs2aD5xbMGlKUg9XtKCPH7CJA6D2gcF0bhaWU7wwu4Aox29fAWRDQmuZqeb3wOzWLaGL6wwBx6IFX1shHr9E/qQDVn/z/yPGPW4ZBWVDNPGCnov6nsYDIQxWXixBYB7aHXsxeNGM5ij9RmAtChDV09Aqp7G+uUzMYoWqFvLhixl0jlX4N76UtC7Lw2ZEYhp0wAigPdE9KQoAklPQcQEGcJQz7f5bbSIXbTkt1Hk2hLSJ00Ijw8DeZEM/Q49m/7ZA9+h16A4IUaZkPCdVkC5y+x3rYUeDdu3NiraOFFubf+55SXwoeiLCMq5O9Q5bhIlizMeI7Uyw8ujdLbAOubw88vGL/KmltgK1Y0UQyz8UADNXsyu13vuswDJsdJfzV2q0B6wUheB2thW0yWlv9y0u1qYoR3bP9VqzN6K8iAxgRXsg/JZDnLzqgNAZ2WwC2ZPZOhG5//AJl9EMAQJLe3hmF13q1rBPAAQ36Q2vKGjeKAtoY1auIiqobhNN3OYmv6hHSmRNc4WS3QIwvX09yFL5dWr6dfTBFwsoFv+KmA4MGIUMqDboGHCswzuc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(451199021)(36756003)(86362001)(110136005)(66556008)(66476007)(54906003)(4326008)(316002)(66946007)(107886003)(478600001)(6666004)(6486002)(7416002)(41300700001)(5660300002)(8936002)(8676002)(7406005)(2906002)(38100700002)(921005)(2616005)(83380400001)(6512007)(6506007)(186003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?WdCY7A7BDQ1ctE4FThDhVjfEnxJv/FlHtyFY2VKwQSqJklCJtQblDYJVB9fv?=
 =?us-ascii?Q?U3HtLjhfDDEf+/eUPYevn6kvoS24OvpueOr2cODSvWe7gpCguOdmUPAZEZuP?=
 =?us-ascii?Q?4N1hERVq2Gim7dT8fxWOSuHmq0pXvKXR24yCH8jRaaQAbFOLSGWinzRnDHv+?=
 =?us-ascii?Q?4BDy7lb73pOXziYERgk1Qe01NdDO5ta9ALJGlRt3et/5w9zqLgIWRpqkPSLn?=
 =?us-ascii?Q?Fr5ZNkjvO5HTdaLcjzpV5F8++W3DxLaO3goDJChhAcVdP//hYch1tx1GAOnU?=
 =?us-ascii?Q?auEai9UdQgDKxItj6JS22BIJO7GHa/ngurAPmGJR9UCOUr5PnQMHpenk0LsM?=
 =?us-ascii?Q?sBg/ePmpNTCV6NEEIirxRWcEayambgfXm0rGj/rF/c14DKQp5797HV+86vMz?=
 =?us-ascii?Q?V1i+NeQ/E4+naPkuq7zehpNq09Y78iSBMO67neJhI10MmfqWT9piQ47TM491?=
 =?us-ascii?Q?iWLUFnIcb08gdLVB679y/p9+oTHGplQ7r/BDcp4ps1jsBZjDbp140hESBBaS?=
 =?us-ascii?Q?xq7Q5ewa9xOvJ8xZzvkxJ1UozbM8x5hTl3WpQBo4jTS10VZKw2hszqWis3lY?=
 =?us-ascii?Q?mk+xL5CvZmoo1DgyQqTq9/yJumwcL6nH4KMwN1ZJvbUrFB8d+BdCAYPEQixr?=
 =?us-ascii?Q?3K50SFcPKdDPCWCcy3EpQIiM61v7nxu37Sx7EKhwEBd5uOusZgN3xyMc002z?=
 =?us-ascii?Q?70mNBjp+czBzLsFBxvofioPXmhUOg6OyjXHQBBUKOO/sbn1vV7EhEqT7jrEy?=
 =?us-ascii?Q?q3qbu/F+bzjxYPNV27C3vQTunAjc/jS0cQcQQ2gJFz+R2ZkFdZ4DuXUkSmv0?=
 =?us-ascii?Q?aUcvGqnwFwdNeFKeLczkqlT0W/vhkYrUr9/D+K+PcJdkgDqp35Y1V5PCEshx?=
 =?us-ascii?Q?cwKYCJaDcQM+v1W/l302RtK3dUEoZeCN2OClKBr0my5lWN0X9tqRKQmJVlJ2?=
 =?us-ascii?Q?wlskIdv3RVLqWaFQ45Lff8kOIXVuQJs6IFHvfftczcOz58MiWb/O9y0P3tvr?=
 =?us-ascii?Q?M1qHXmfj95uyoWa84S227l/AQKaYVHVVJuRvWip8CxyJsz4xzeasj1X+zSSk?=
 =?us-ascii?Q?9JTGRe2mOBGD4vGDZofKT47jj6zrWPpGwtL8GweFEBOvt0kr16mwlfInMxJ5?=
 =?us-ascii?Q?puolHLK3m6GlCUTzZ+0DfJuh8AjxOoCMEnkTWz19fp8trkjXQ5EzXTwoUybB?=
 =?us-ascii?Q?rvVCRYp0ufEEI/WPUh5kZggKWxIrFj1GpvyNRlPBPD3eiefTf2t8ynGpPNCD?=
 =?us-ascii?Q?zjo6zpVRVuwtwAklKj1QNsDb67wiQwwgZKLzzXN7nxEj80y9/v14fklFFgOv?=
 =?us-ascii?Q?7xV7PGCPBXSKqccIxUpFOh8Om1cCN0Idzn5p3FQKhl//gz9vSnV0ENaQVjCT?=
 =?us-ascii?Q?Qc6IcWUmmC9k8xOU5Z8VwSUVi3RRLd3q1Glx4JHG5gFqtMGus79bWN6120En?=
 =?us-ascii?Q?/BBalubZrBUe54VwmpdJjhVk0G0s0Ug2Ru5JGm5xZJb8geZJWwxIifK0xPmG?=
 =?us-ascii?Q?3SHVEQ743HzmCJ0m43zd54Ro6I2QGSjfE6fz0jvjxtVZDkmNAfBtMA03z0Dd?=
 =?us-ascii?Q?fdGHHat/Yh2i91ia/6zMfjTLliXgJSCstEYun5OM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e049e19d-6e84-4967-571f-08db6e9c4ac4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:55.2685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOm1zmd4F1Jvq9cB1F3RTZDjKvXajoqXOYfF0wwN8jZlrgsrtrLGCqeyUfC4emVC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5912
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

