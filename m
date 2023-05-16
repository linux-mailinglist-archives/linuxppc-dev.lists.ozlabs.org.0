Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D85D470420C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:06:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxNl51Pwz3fkb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:06:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KeGxx3pS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KeGxx3pS;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxGx675fz3bnP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3BQfrnb7Et/lzLlpvkUJYthR23hGhdftmC9HX2TrZUgtQzJZ9kbq6hteIaNcadk0bC9b8tGcR7VcR3AfZZ4ocW2RhWynBK+o3/HBFhSTc4ZwrjvuVqH//OFbQZ2L1PTMQgUCKLh/DvK0M399jjv8GaXB7nsUfpby1OnVdA27lv0Mu0w5D57jQRpoxn+fcq49mdGyPubGqD2cBv56nYzXOqzom+o2+J5bH+phWlLHgjWbZOloEeLFTYk1iKR6kxbaMsZo0EH4yUpQSlUbxnFLSU8Ed1UpqOZIu20vFMgfiGYHRxOK0XJa56I6jrKYeIMzuRLwiBk5fCTjf5AKl1h4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fg4PDu70bBbkAeF/5RSmywonYr4R1uJDMwAE1qZMrOY=;
 b=Wc3YOMgKUzlTc0FaYuTLbyOUD2L3E1Lw6FULQro8yinBvV6m34NXUc2rmpIXI9GsPJ5hDVwzYVgMiY34Sy7j+tU8gT7GjKirTXs4jd8o02aRXLz8vaBmcBcqG8gpebzGWF6oo2MJXtY15cljJEkxi9on7jyMPQYDQnbTUCoHmmq3789iVokg8h/g870H0y16r+dBBRs89Csju0qWuzlvNyMbU3kRmPU41jrc9I+RkbPeNfOvYT3ffunGIcENLdiC4+d+85xRiwE16g0z0DWdG685KziRJDV4r6JPkDD4s8gUGbY8JTz2k4fDyCiY391fsVghMIu5PS3c1AofxfdJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fg4PDu70bBbkAeF/5RSmywonYr4R1uJDMwAE1qZMrOY=;
 b=KeGxx3pSrbi6yzbRdSXgcH7SXZDcTlipBkU4c4h7Pv09Uaf+ys0qcil5pX1mvezRbGPTW9kIx0PtAvRpF8H30y5JlH0h+FI1D0OQ8mEXpRbHklansgJSsQSYh0kYN9SQMQw+G4EhedBMl/LL7I+1o2mo4qh4L+2ozph/6R76pKwf1Y/qGW7ON9kOdEkCT9K5WuYEIDSxa4d00sgLTT2tCeenYwZ241o4gx2noCioyn7dr2YwW9JLlr31qhHNDSslUjWOkqx/oq8U6OU/ni/hsNSqf9+9LJgS86M4131d6YaFoF3KoeKQRRIUrPgiAsW7VmECPiIdhC7lVmCc9p1F+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:04 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:04 +0000
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
Subject: [PATCH v2 10/25] iommu/exynos: Implement an IDENTITY domain
Date: Mon, 15 May 2023 21:00:43 -0300
Message-Id: <10-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR17CA0007.namprd17.prod.outlook.com
 (2603:10b6:208:15e::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: 59c0dfd8-a309-439e-587e-08db55a0a240
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VS0j57eLK3yo2DuyMIBx3wSwvjEOP+0aJru/X1LxHRsmyknv/aWwBwDuOy62ZS7nMWDTxKsKkTYVVR+Mvg096400XbCyB0WuLP11d8CYQMwswBGsaBLPfUjzqMVFKJXA/W5zyzYqk7O3BLv+Q/7/vEOdK5yNx5Z/pwC4WHetCnAMOcE5h6XEQIIvnS8nMwZV5kfVUt/ehh2+bEkd10UrhhXeJHt02UKx5oOOpy1dIOWXElzY1/vSh4jCkTPOOrQuNY9VbIYNd43imOaCsXpYFUeu1o8nxG3y6kf92fREAtN9SIPRgfi7eRrMJkYcmMfNgNyTRdRU0R7EOCJq4VK4Ek5dRrs2Uvuy/psgZpNg6/EGuvrdbvhKzfo+QfMHItxF8Cgvh1+8NX+q95YPywsH362ZUylJw3VWS5NUq2jLaTFD+DMsy46Qu6oKkl8yb+36rNa9GDmfR+SEO4bvbqnKPBBJd8p1F5cf5oVGSw/QGU3Md0us+SgJ2MWiXV4n47SGKYxvNGeeK2CJRahpj5GaFp/c11saDHN1pJIuxIWhTj1vueULTxfSQfS0usYHa9gYyhW6fze1XR2GwGELRUgosh8pVcMB3pC1OpCYHzabKtQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(4326008)(41300700001)(316002)(2906002)(921005)(36756003)(38100700002)(6512007)(6506007)(26005)(6486002)(478600001)(107886003)(66556008)(66946007)(66476007)(2616005)(86362001)(5660300002)(8936002)(8676002)(110136005)(54906003)(7416002)(7406005)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?a+y26GrUrHGIR7RFvPk82OvS9GIf5b9cZrG+/sUo+pgqSK5dJ2TcDDvApuv5?=
 =?us-ascii?Q?OMbAbTqPOul4JwiTuSq6m7+BVWf70xsRWmRPDhDB+v32xv9R0/uxcy+gKHhs?=
 =?us-ascii?Q?h6+H7uOXRcXbOrISmhHHqeCZ7GIn3nHZ18tim2O8IQwse9mERsBaJ4fX1inz?=
 =?us-ascii?Q?qLNwcmlwbEVJvoTczLSUHjwMoDBbOvw1CfhC/ak7xwzPRzmkzBwl1lXhFkJX?=
 =?us-ascii?Q?S/DHUhpF3fEWrCHlGzpwLlWzPCvAfHd/NBpjGYTNlv8Jn5I3rIfxjajt0Olc?=
 =?us-ascii?Q?AqRy5Ar9ARriXdBdlvrnTPaWeWrRbrYNTkhj1aVh7wx6rZdDrp7MZFB1ovB4?=
 =?us-ascii?Q?YxJsfp18stF6dS2PTWuPPFUiGqcLlSW1+l3Gr53SyC4twBvbH2r8D/QLRern?=
 =?us-ascii?Q?dj+gzgqdRfdikRzThxkyNiavHT/FEvxYlZeZqX9UbfPb4KEz9RyRyn3ai/oF?=
 =?us-ascii?Q?U9rnw3Hq7xqYjB9eHRdI4XatzbgqMT23VAs51UvwW/SxsaFWfg9Ims25fRDg?=
 =?us-ascii?Q?UszR4t+R41PJ/CxRJYl2ZlLhkV3EqwIiOAtIFKR6vybUO2QQB/0jokag4+8j?=
 =?us-ascii?Q?5gNRFJ4Po8Iv/LRLGdC3/TmOVEUwck5CvjQ+N6wLRwxw6GzueodJ6Gbw+pqO?=
 =?us-ascii?Q?zF5PHvfOf7bUvNvNb5Ho3vQ2ojsH+NqPJzOQHSO9rJPwnUg3VSOT1+xnFK15?=
 =?us-ascii?Q?mn+tVm5V/H3W7o5oNMyy0hXqtZGV3w5ZmgXQg5tI0tkQlgcntnlBazURvyW5?=
 =?us-ascii?Q?6z+Dm6TaP2G9hArIycj82OJuHVlEJLCh3H7peuocUtVKGP7FVq2QgW/8gSML?=
 =?us-ascii?Q?IQ1q4hoH9ya3vWzemr1FuChMOQwCUgETnI4Gf/Qx19yOUeis3xSx6ZOJGu3r?=
 =?us-ascii?Q?X5E3WXtp8ACM2IkOC56hf8y+KmepZXiMIgqRhRDJKaLd+s14VmhmY+TmkClh?=
 =?us-ascii?Q?U9q8yijhlk5oFLKfkGCBf/SqvLNSgQJAl+qA/aWvEeuHroocIH5macWNViJ6?=
 =?us-ascii?Q?Hq2dpUveWR+QT0K1LBP7vdFL7QNh0t03drBO7zwVA47Ydwl9nx4HyI/ZQGco?=
 =?us-ascii?Q?WvuIgFt40l8WrYqqMuxn+cdEmkFhyK3usNNK142jQaiAn+aclfpwDnNPE+cH?=
 =?us-ascii?Q?/O1v8TpN6v4P/8HrMSRkjMzDNAfXGBstZBS17CtB73DR39g60wuV5aAgu5q8?=
 =?us-ascii?Q?8w3QIZHmMeAqBcpSIjd4y+bTy2DC9isnZvAeRbxX9EEVF1lG4yYC/KpRj2p3?=
 =?us-ascii?Q?M5hgHewiHRqzs8rj6jDk8BkGINpy4e2xgFy7+42Mk8aRi87jHOs1Ktpbe92W?=
 =?us-ascii?Q?hJDJTEB7lLXV7fTNaFGJZS5c/Tj6wpGPIU/BnW3Go8nFotY7t2ORQBIpSbOg?=
 =?us-ascii?Q?FjBer+3882EPXkmFAN5CJ54dnfHhPB6aKjGbE+356UByCC9HGwtkGlDjXuZq?=
 =?us-ascii?Q?yYvB2JPPF0FCUsWN1gh0bWw918xnthqvPrHCFrvBL8rG21onxmI78ezl8717?=
 =?us-ascii?Q?sUV/BoDjN2l9+gt66XSxdenifekElyOzwT/p5+qVim/hEqv4nfPNsURLWgG0?=
 =?us-ascii?Q?nnWmE+uhKxzXSKuK1pa+7SUYgBA1E0gy/Lfl6JH1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c0dfd8-a309-439e-587e-08db55a0a240
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:01.0706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZcVfuHD93oWT0U3gGqc/M45SkB/rZthRdAXpFtl9zxOz5Q4qXR5qctm9G9TdZ3qr
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

What exynos calls exynos_iommu_detach_device is actually putting the iommu
into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

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

