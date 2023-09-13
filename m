Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D11179EA4D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 16:00:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SeqsG3Ov;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm2Cn04t4z3gpB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 00:00:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SeqsG3Ov;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::614; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1sH2Bhlz3c1Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGHQA6IFH1UwAPHzkaf0ITGhfQbfYLmQ4Xc1T0VXJrD8WeZAOaj0GAloliQN54wmQgcUxJa9tPuu3sBjGIqCqH+POnIFpphlNc870NuuLFkK+rCd+8FsbwBfDWQGxW2AOQ6mXLovOA9Z9lX/+WATV0XIKgAtLJmo3x0reEIeRD1Fw2mWAchHnNb3cBGrTAN2LNqrePBhTyhxPt3HKL53/vFmyg2L6IODFkOX6vkxSsSO0taTC2n6VMwo567pi2sWZ8QmjugTmmuUB7z05TQZ5qrgvWMA3fFHHpkZFwZ2rDYZDo9WTLQsOqw0CETNDe5oo2Zv77MuZg3feY3+w97NDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8qMKNxWPz7xZQuis83MeNawfBWsMikHBLxtnjf5Fes=;
 b=K4l08qYecAfVqaDa3N/Wo3n7Rgz46t1pw/gWu569I+GF0dgy+Mmjn4imGTGni+tfX3nCi/Ki649pVRMXRdDREHMmSrf0o/SIvllequxMJCT6dm1RaYvESVZ+wOqCYi2gx4DlTtA4mpAyxhKCLa6FHfxCEdvnsPX1H5uF+0WNIWo/SgJCUbb9NNvNZQ7ENttThIpeyEyX7d/06xk6YNHH70U9ijDs2Dw7R+m8sznBpn9JCcgdDwSXcrgEB5xVU5StLu3Uf07dlXG59p23Ybcweo8WK1gq1xRudfWbhYpJF/mRcjUJ/Khtknt0jvjDHzvl+Yh3RjKMP44XjlEYhCT44w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8qMKNxWPz7xZQuis83MeNawfBWsMikHBLxtnjf5Fes=;
 b=SeqsG3OvduLsNn8rgPfJzv5gV9kgbNcH6R2x43/1ldhbpJL6y7vZ3Kt8/VeDXVOBxHZrb/wTvvQ6vjxFx7cfNxSRw0/RQ39fkaDUD7EeFQ3l98wxbec6+AzTZ6AIjXJOoTglK5iTwJ/f/9ao+9W18zj8untBDBwBiud+OIhCBD6A48ABU/eZk8zyci3llI71F3LJIexhYYr6qd8gSb9/tj5DIpyNPThmy7ByPobwfE1dYzvk70sYtjPIdQ9MhXBVYACTiHYneHcZjY1wgDx6+Hm1Cp7zhGQ/jJUAvUxspp+0ZAfBVJN6y3VB3pznMwzD/H/jMT/ldoeYZ6wDFzWYfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ2PR12MB7848.namprd12.prod.outlook.com (2603:10b6:a03:4ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Wed, 13 Sep
 2023 13:44:14 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:14 +0000
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
Subject: [PATCH v8 10/24] iommu/exynos: Implement an IDENTITY domain
Date: Wed, 13 Sep 2023 10:43:43 -0300
Message-ID: <10-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:208:23a::21) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ2PR12MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: 6af68854-b084-4614-e0aa-08dbb45f83c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	KGogKd9FAF6bQrqzRTWqG4jsN9AZ1V2qJgnpedIqcKhlwi3PRNQAzLIGAV2eOGyvMyFWtj9uJN/+LkAqOa3T5dnK01kWzTno8a3OzhGkRlJAwJvO59knAjifVDK6jClOouzVl5ed4si77eQ2ALC6L+RK2oJl1o1mRJAPtOkoREhr7wCg0x2FGP7+fQCw6GBI5fubibKpVcuefxiCtfw8UGPzysER10lm1bkroC28xGJ2jY6vJWj9EnW1g25hmxkRtARPrNUXqprg26v2unnrBUHAPxyRUvJtvZPyMe3japbvp9x1+DFQkDIeXmDYy0FthhZTmpbsupC7Cf+L/ldletlP0LT7w22E/w8v3so6wjAfn2u0GpHWeK6bNDbV5t8UHF1sI/X801J9XB17cQi+B+Q2DPFp/uwc5Ib03H8jBZcpOIu5wg3AnZ/w07rvO41EshZt7u26ievfs+Oo8680fDm0dP7XPjI35uhhD4ak1CAtYwJnpt6GiU4wRSTk+BTUgw/tKUPgmBZRiU/uYmXCeCF85rpn9ptqeugictvUtYJsQiOkz6nuBgoCMxHlGCPaubgH/4CoyMXMaK38nsVgw/C7DCX9yjg6z2D9cC12Ddw=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(86362001)(6512007)(921005)(66946007)(110136005)(2616005)(478600001)(107886003)(6666004)(38100700002)(6506007)(6486002)(26005)(316002)(4326008)(54906003)(66476007)(8936002)(66556008)(41300700001)(36756003)(8676002)(5660300002)(2906002)(7406005)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?P6sKbJzi6+o7jSJt9DZeslyqgZocFflCSvy/OcrQXGgiVVMtGpTx7Wv6NknY?=
 =?us-ascii?Q?3laMpeJlS2evGP7VUBfm8+hZRxzejRvQVq98wDW+r9TCA8hkGJPbuEJHOAIV?=
 =?us-ascii?Q?qIWic3aNVQyY4GVGC1S7EkHotP8p1Dsmv6oDy1kNU/5kzCoStZWzupUCYKk8?=
 =?us-ascii?Q?zbbSM0nHCGAt4Jl4022N5DXlTc5i2oqTZaBWTOAJg8fwM1Z2LQCuV8OS/zQN?=
 =?us-ascii?Q?C20PcOmADrvpl2NBoAz1YqOrm/pwYH0tf/fYFL3U2MLfa97DVYjWt8tE6pOI?=
 =?us-ascii?Q?WlWaD8udzYrN96uiSoCGXhGQL72OCeQwfij2DZ7XPpcSoL7gduk7u9MWx1CJ?=
 =?us-ascii?Q?tZok63f0V67Rl1v+0kmRcWOJWIkGKDul0pZAKt5jmZ5MvfRLxYxSSVapMZBg?=
 =?us-ascii?Q?lKCQcUWUycNAqvmW33Mppjvbkx65XYkExC3QmqMA6jZ4e0vzSi2+x/mf+kU3?=
 =?us-ascii?Q?QcHz44FgL1Qrb2GPup0WsIglDJd8BiR1SJBTTbjLqIeQP0kA0CeGiXXwo2fT?=
 =?us-ascii?Q?tFnF1Lp7us6o0VG+xZaPOJZhyoUuJoY2XTBF5flQUmhbJtPFYWZf6FcX4Tnt?=
 =?us-ascii?Q?mxl9IyXO5uvuYQwG+NUTwHdHwTaUSuM6gVCrW0EvgPPrpUd7CB02z/JwkfoK?=
 =?us-ascii?Q?rNZpIwb406JCnAt9+BG1dPOUGScanAsB936c5ySrtA0WXwy++wtoeb5NLAqX?=
 =?us-ascii?Q?uXeoF0bte86rXQ9sBo0Kjr/grYuPP4ODMtO2r3obK1YSaFgTmK0h1EzRq5Cm?=
 =?us-ascii?Q?V6vvDeM9hdAoORS1A31CjgdTlbh/1PfEjnO7bXFO9DaW+GzC2ASquhulpBK0?=
 =?us-ascii?Q?LFZyiR4ajUu3fWx80P+C2FkKs/UXaD72ExWPDuPCIeat2LYgXG0vmL/HF9qP?=
 =?us-ascii?Q?G8INpfRGI9itQUse9ygREVJbl9b8ZJexCnqvH2PfREf9fqFxAzD7rypLsTYv?=
 =?us-ascii?Q?7MowY0qINKg0V+8bP+URkyOrfrZ8CrrYQ7VyXFXwBgeiceX8x5iUBct74fXF?=
 =?us-ascii?Q?JcOSBOp/sLLsltL7SRFeHFAZnL80qDCb8HZ77EKPHecnBBawrd0QVbVbyA0Y?=
 =?us-ascii?Q?A+wNoXUw0xAmf+f9qbAVTFqBFf/06b4512WMuZRZFcKRFquBTKDMA74VPag7?=
 =?us-ascii?Q?+L5DHqUC4p2Yw31gBCsoVsGQGOBxI+q3NXoY/l89+mvEjv80lT/Y5usTbnvQ?=
 =?us-ascii?Q?4zVII0IcYa9j6Rasl5FOeBtTYITmkHJjOo2DPJK5aBh+eq27YX2Zbrl0Q2X9?=
 =?us-ascii?Q?lG7x2+x/NKHSciKMBSHZi2aSUaXYYitvUSCb6DKLyzJk/6LLwwwgjuDH/v7a?=
 =?us-ascii?Q?q7scJJHELw9m9ygg7WqCjfEoNZ4J1SdO6f0iqrkGzpK010RTSLA9s+zgRb3W?=
 =?us-ascii?Q?FcapsZ+wSd5Q2YKzv5G4WOSU+CNP4m39UK93sETLTxifFjot5Kv1/xcH/yw/?=
 =?us-ascii?Q?SWVP1GGhpIu3B3sow7sJL8ap58oFdgTj5uR2yO/jIIyHBpHTXlqHazFUqqv5?=
 =?us-ascii?Q?ekPnHMPIig3TNUB+TPJHZ+gU9SQmx8U9qE938iQG5Dogzje1mUsvAUTIih9M?=
 =?us-ascii?Q?yFZk5VmmnGDh6R7tgLyEJEFuWR7hb0xZvkRP0CgA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af68854-b084-4614-e0aa-08dbb45f83c8
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:44:13.0480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxU78Db4KFIhulG3du0eSwDBq/FpVVfUEGcb9O779M5QOvqvGQcC+hTQgEjLnp2x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7848
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
Cc: Thierry Reding <treding@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

What exynos calls exynos_iommu_detach_device is actually putting the iommu
into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
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
2.42.0

