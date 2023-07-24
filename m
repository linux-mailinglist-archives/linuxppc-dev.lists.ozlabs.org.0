Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F37DC75FDA3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:27:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Bw7mt5ew;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nDB6G6Vz3cbk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:27:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Bw7mt5ew;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8c::629; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6Y2zfpz2yDk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VX4phZzS+E72sU71eBO1NFA7mfpvhnQn1AR6OeX4laKPrmfbhg1ABsALLId2KxXgWaSzsRFKZnX7nlT8epiIwPE8gKl2QC/U9Ydh50BQZ08BT7f54a74+/0E+GBfEa/BXc3ZoMyxLFCuoEcMmdwy9yMhVMYzVZvUwLYJJVlD/WbgLlhBSI5/fqZATtazEtG5i84AtwB/3FtXOyxZdkU33OhA0QuTvCol5U9zE8NGOpIQnb6wRtlS3a2QNlIBG8N7oXuyCtAVQbSTDVg/cw/DPZe6q++bmGFAVrv6or1oB4BPCEsarPjtDeM9bne5a030zKrzpa/gwQTU+O+z7ni9HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuioqqLJ9nwTxiQOZ8nAoXdBA08XbZNNbPO6KQsUrqM=;
 b=Mj/ziqi9Wa9B3wro0wKvZMB4MWyxMBrrA7owRGvMnaPD5HY0jdp+yH+4djY7gDOlhLQ8HFR5mBy7WuzKc2m5qcaJY6Y9Ku9+6aQtt3xr45t6U9PqNSxURDnPqdcFcx3kGsdX/pYa/vgmvU9aZjUXu5+rYOY2eIvfcQMEchGMuzMKCA+nFFXf+hKhxt68EVYfHlNkALJWrIIP8/exKUq2GzKrrXfPk0nlz8jdLG0QkxePbS5IyGSylo8GK9IekaKwMW2DKNWM9I3Y76HFBM5Y0eCjgDZj3FdVr4HVQlHozjcreYCp0q+DEwwHUwUT1tMG3RQBZtkhGCgT0hbXGsRFMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuioqqLJ9nwTxiQOZ8nAoXdBA08XbZNNbPO6KQsUrqM=;
 b=Bw7mt5ewhjuo8RLYONK9lUJEB6sHanYcACrWKqUjWTGQa6WwURt1BBPVKUGt5vDLtPmKYtozLChy0WW9KtBXd3W0UUAJ31cHEFBqMMVrM2smF4iPbaEvNVluDi9j7LXSE98Z7tVfLYYEciuOt4WHFP9ghRGwYU++MN1/EfA4fosqOv//s1pVk596/xyl8AyCeMUZpqFISBokKsnJoOQiaBuDk2+cK+PnW9zXTqP/GtlRWSslgx06Mqjsuhav/JMe2v68/JeMpMwbQJ/V5ufLfFCOqUfufRuwngO0E6VGUAG3SymXlQyxXzQ2fkdmjiFM5IM4dW/otyuLr4zB9MNk2w==
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
Subject: [PATCH v5 10/25] iommu/exynos: Implement an IDENTITY domain
Date: Mon, 24 Jul 2023 14:22:00 -0300
Message-ID: <10-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P222CA0021.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::26) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: 339f789d-ca7b-4e71-2b42-08db8c6a8866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Ym+zAo7TIuQxTO+BY8TpSEkYe1deamCu7hHXLkGjAoB++W6aiNMEt3JsXdhII3nA8tpWkY5280seGAoLmQkLpBkfi5SVzlZP5ij12MpMbzb0qVg7u6OewH+FlhRUWT5jApvq+4xTZUB2Phr+rp9E6e2xUtVC6LYkJScSXzu4/ZhE/lwFZx/OMS/ymfl2BEov+ZBGMps7okWKQ93pku5Y90KxBDxQURLlMY2uBC3820x+vjW27mftkaJLpE3wMjgVJoJuUAVM2ypBu/VI3WD7r6T2q17t7xEgjtbyBpmr/5z78PusMPrxE3huFMmFpok1HjRxC7xaAqA2aETm5hy9kwpdYvDsApIT8paa0juWXQhsKG2v2orwvp8SIIdosKrt0BQ+X7Qs4Ye0RvwnOVcagUDm8PRjhDQH358RQoLpiNuk+cSWkhpRCAbfwIEIE+qvLLazAsrA3ktc2KM7oWmRAWrx7CIAPHDzzDqCUkXZBitqEWgHgADdX6GndFISwYRx7K7yIZ5i4d/1ocPuVbWbzbxS6qC5sJuWVBRPawHSai8et+bU+362DsUNY+96WC5xIy2D/xisQKhcV2+YOV8XaGghzGx6jPivMX35aewCVls=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(2906002)(2616005)(83380400001)(4326008)(316002)(6512007)(66476007)(66556008)(66946007)(107886003)(41300700001)(6486002)(36756003)(478600001)(6666004)(86362001)(110136005)(54906003)(921005)(38100700002)(186003)(7406005)(7416002)(8676002)(8936002)(6506007)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?k0YKfQpJzBKCePUU0CKxucA7siu03s+AL42S/ywbUMbfo1uX/k+924aldF3n?=
 =?us-ascii?Q?c7OhdpTC69Mb3DGLqJlG+moT9RoD6HEkGYhhyAkWtWKn2/2winI+tBYzzgak?=
 =?us-ascii?Q?F5YZaGxOdog8h0+oWgSQFpxCV6i4rQ2OBWpJA2pOKRRLltUmfRIDCXlZIohT?=
 =?us-ascii?Q?JOgRyYUEaITVj+geLKCpVKnahNzPO0ahHWNx5iMEKvUS9Bc9c+LGCjqJzxOU?=
 =?us-ascii?Q?6fwRx5frZE8148HjIUPjtxAjpbwMI8ydJ7lA3yjPveDA5+tLVg1ggaVE+VcX?=
 =?us-ascii?Q?QEjcE3HJovpCksceSCZH29fudRDoqwnAjsbZ5rsJESg51z3bKz28dUuZYLw6?=
 =?us-ascii?Q?sUnxX6V11cf1VxTTAUXYdq1NMtKGXVH9QlQaREt5ysbH+ainHyuN2llRT9N7?=
 =?us-ascii?Q?kajR/pc0R9RgHbfpmVZa3jfvEnCNdLMNmOXx8+6cvPl64GW9BKSRioWmcvx7?=
 =?us-ascii?Q?u/+2x9tdPF8yIGOFJsai6AOUHrC8IhviE+SdwtFygwCl4ZXiRRRHEbYp5cxm?=
 =?us-ascii?Q?bsN3MIcNMq+AfNJEX56vGniRr48sVfkQodxfsaD1/z8RQ7OMu36PdQvkKrb9?=
 =?us-ascii?Q?n0s/H/Np1MxGyon3QXeu5nUUvBq44YTNVkgIqCmDKQFhYSagXzXxwybxSOex?=
 =?us-ascii?Q?qJ0ofVl6y7qQi8eT0kd/nlHW1GlZrOWNyZIeJFwzi5V5YDZm3NH64M1hszMM?=
 =?us-ascii?Q?QHXM0hwROFo+baPQ2pfJKnFmRtvbv5YYs7ktOMmUMLKktW18DO9pe90Q6F+I?=
 =?us-ascii?Q?WqW7fV12EGD1OOUl1JY0CRqnLImiB/UqkA7MCON2lfbx9Li8/GGJLh3+9I0W?=
 =?us-ascii?Q?BU43OJ1NbmSojCf202qQ0oQ2BT1v7w++sOQ9xjpMZaAGmKgTWP4+qk6GZDXv?=
 =?us-ascii?Q?GwB2KYGR9oUBbevnqIzbZxUyqf+CcrF2jKWR/WSUoSNVVj+ojsr5l6e6ThdB?=
 =?us-ascii?Q?oSDeIdolnDlBABeQsIbBMf7gF43dLfSdrJhHe+tnhCAx7ISoWnL/anMw5Idy?=
 =?us-ascii?Q?ixFMIJ/2kO1MD78QrIhxyQIZVpHead6yvOe3+Bge+1mnMSU4unGDG0bvIpwp?=
 =?us-ascii?Q?xGeCVPGoRONO+4XgW6bxmhHQx+WaMONJHaGAyN82UFI/uXx9tIVQQ8e7oFO3?=
 =?us-ascii?Q?EYZkhTcT0K6y48YaKFAcnVT5yuzhNG9s90FI4ANSpb8dVZY0R5KxgKpAvYgD?=
 =?us-ascii?Q?WlVrYkFKXeTZu8C8DoXs/ppTix8cxL4egEowsqX6seMBy6P/HTfG7WLKmEN2?=
 =?us-ascii?Q?QAqTEESUKNXl+GwFdJWsVrmZjOtRQRCI+1WgfHSKTXggZLCz2QozVMHhS9fG?=
 =?us-ascii?Q?A8yv9Lx07GKwFABEYGaP1xOX+iCG/ifQAFD85/qTpDtNUoq2lsrtMhF2Tsgz?=
 =?us-ascii?Q?rpiMRwG0n0Km+vP242XpoS7Oo0lsqGe2LMd7F6+mR9TEOxi/w5d+CA8Jq9dK?=
 =?us-ascii?Q?/QgIVcZgqjLNNvn4rEd8IdHbLMT3IuCWJ4pZX65V9nIyBQrmljDWx2eWgaf0?=
 =?us-ascii?Q?qcnDustFPwN00Ddmvu3B9JRMjYSE4+hWY125len9Oo7lZ6d6n/zq0/OF3sNI?=
 =?us-ascii?Q?syz30jqZ2sgfYZgs+o/z5bhLjg8P2L9VJKn18Jfb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 339f789d-ca7b-4e71-2b42-08db8c6a8866
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:18.7211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhOAg1bb53PF6fMCYa20t57lkZkvU8kAjzXzrZ+2b70tedQrtyvQCDufJ6DnmTJl
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

