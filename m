Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E498976DCB4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:33:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g0+/CMjk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGVDv5xgJz3dk2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:33:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=g0+/CMjk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7ea9::617; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on20617.outbound.protection.outlook.com [IPv6:2a01:111:f400:7ea9::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGVBW1dkxz3dyk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:30:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXS1EGv5y8t6SYjHNxUs/8B6U3N172RH0FDqffgXQreP7nzbNwK7A/SI9HKeDzpCfP7D7xgsvak4cYsTI15sGSP8h6sxBXNtK2LIHz/QKcfjAFUgLP2p8aIV/XwnELd9fSYhMpAvfvSoYBfSyecKzakeYxSizR41r/TUXvjOqS2seIdNCy8RjMI1GcV6i9eH1t8sfZA80DayW9HfKlbCf//RM5x5YPaxLWSPx2r8XHtSXQAVfuUlUiUlqhH1pULkGynG1gan2n2vfPJsks3xdxmS8FZcwdpc2S9fgDIv6DvGWr61b1YgOtlZDheymOC+Zai29b013UNogqzBVCS2TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuioqqLJ9nwTxiQOZ8nAoXdBA08XbZNNbPO6KQsUrqM=;
 b=QWlAVH940jarLjjhXOd3ThQAYZcJsaVIx+2S0Gsf8VQCwHPGOwl3l/6LeR16NY1zq3Gr56uhfFDbMu7BsneZF6llZPndcJTEr1603XkrFRSD78MDYQhA5nyXSRWXI58PX0wxSECelmXskE0MLpVq8uyPWfFye0ZCfStLoAzbPLi3qFt/97saEuq+V0DEKfgixfHypofri7D9NSpY57VLaERok4o7k7dUDx8phCmKpWZRr0ftKDVD/XyTthNCc78Skm2A9GM5WwGNqVbuUuj8NloYHKRfjSQqenLY7R7o5fmNCZxKT4QyudMRv3w2J8JbNWv6HwODwqsPr7kvMrtEbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuioqqLJ9nwTxiQOZ8nAoXdBA08XbZNNbPO6KQsUrqM=;
 b=g0+/CMjkbB0WkpBc1Jb8tLQu/bgnMaYBQtdGVjcXhfkWOJk1Iu22MKLFTxwHfp4Lt7nFbn9K7I+t6m2bK2qXoK1rqhglELdkEbsr91aMrp1HteRem8AF5OQ8QFCtKcx8MLOVA+zsdJMNOQB1tFSfgJwWyMPMrhRgX2mPKiPKyuhv3tNUDvysH38vo70tq9uW/x/CnjY8u9t7UZM5+blGiZpbyCfF8fIBMse1gC+0j/N5ZCW4hANRJ0drWsDavAYmBLFg7ULVnNGSdWL71FtEqoymoJeR8Tq4Vs9sH33KvA8h37k2e8ZiTscVnqp8MSbQMY2DbaI7bjx5YOlnopV9sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW4PR12MB7261.namprd12.prod.outlook.com (2603:10b6:303:229::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:30:38 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:30:37 +0000
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
Subject: [PATCH v6 10/25] iommu/exynos: Implement an IDENTITY domain
Date: Wed,  2 Aug 2023 21:07:57 -0300
Message-ID: <10-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0105.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW4PR12MB7261:EE_
X-MS-Office365-Filtering-Correlation-Id: fe4e2eac-ba95-477e-3675-08db93b8d829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MUqS/SigT+Lw+qA+VxMrInqdOfhZ0+DU3x9N3jt73QgswMJrEUCNTVNtB3p/ot8+dPoggF/qG3+h2k7cUXfwkUEHK9Gfwg7B2hEkRvc+g2KjLrQm1H3UU8Xx6TPXT3M83KCN3uMlUpkRFf6i4EovXdtjEsWOq3G3MLUgMgtrgTRtaAgWZ6Z6TZYiFa/DLH3Y+xMcd/Cxy5tJp6EpysQ8hoC/jc3SdQCbn0bUWOadU27oS+JtzUdDJxH5EzJA3DtmpQBabC2ns4MC8E1tG5/7QqpHL+la8b0sy2ePkWIkww4z6Hoq1CYMA8D7ZAyoTYKV7qJFgNPwy/lTJhqc/xafBKmWukJtf0aL3FRK9n1HUiRHupyIh0sJXDssHSH385yqhHirX45CXeWYSaxBDqGzd67ckQ9WIHB7qxPoHepwB09ns6zFsw+gCI2yqIemnWUcH2Gqc+YmW1DoL/XRu8I4jhZBiHocQse9tzlZdjtdsw7LuEncR0PeiIl1nb1i3/+6lI7DuFf/htC2R0i+C4UVZFnPnwxFH9UgPFjIoe1fhoLVSMpHLEBaqvaSyhzd0VdOsadSQWXe8ixIznUJeTZSz6QzLpMvnL1AEV+wpQufVF8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199021)(5660300002)(2616005)(36756003)(38100700002)(921005)(2906002)(316002)(26005)(83380400001)(186003)(7406005)(6506007)(8676002)(8936002)(6666004)(7416002)(54906003)(6512007)(66476007)(6486002)(478600001)(41300700001)(86362001)(66556008)(110136005)(4326008)(66946007)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?3SU21KRJgYLd5Qz2aSpGPO0VMxmPq19wvehnmoOQLZsWgdqalNgsj5PMLexS?=
 =?us-ascii?Q?yxBn9nCHygqNXivnp2/xMMkyktEeqVcGJZApcA7YjE0r0y7ikANVRFs7h8pN?=
 =?us-ascii?Q?nXByQbIIdSMoJ8kjHmh10Geoc7KesPrYGoOhafeW76r+x72P9PY/+cWhnTQ7?=
 =?us-ascii?Q?kU4lnFofMgYoUc2+Pva0Y12jUYpEPLWDl3JAwK4vtHnKXoi8gfAu4Cf4yVo9?=
 =?us-ascii?Q?ar3vsftpS0UQHEnLpciLo6I4mmNmniWJePhk5oBay3+ixK8YTV5DOg09FXpr?=
 =?us-ascii?Q?KqQMjWqBAzw1TZjqI4iBnSp4yqJgcegiG0XCPrYbFVgRmMg2sf5QkOSCOeJ5?=
 =?us-ascii?Q?OmANZ15YpsSIjNiAtRa4EGC0u2Hd//gQrvRLgRRhvsvHu4BDNlFDgY07oP0C?=
 =?us-ascii?Q?xD+OcsnIXdH4vHqR+HSaWLN5zvAgTIH8wTCuGul4Dp/2AdmPHlCQFa58yeQy?=
 =?us-ascii?Q?ZWW7OwAS0Kx9R1VfbCSXIeF1T5PDvn4cyF9DvbQAXH2xTKh/s0Malw08ku+2?=
 =?us-ascii?Q?kmnFmkIqS8nUkZnvQZT3bxJrvaxHZm7gT2HdTOfnBxo/9tdwH4/+ODGNTft/?=
 =?us-ascii?Q?1mgh6FpwL7+q07gmkMMn16LfVGM73tX2wGH+482jVi8esw8kz8xunLbeNQgM?=
 =?us-ascii?Q?WU9ebov87e4p1OWMvXyYxsVVxqK6AWbDjxh7ZLszX+Cv85mqutGcrsV91kV9?=
 =?us-ascii?Q?X2JRbm4A5R0k7igbVdUe6QGuKWPmusih11w7J/PHtfDbJvL2uXgmd9nGHlE9?=
 =?us-ascii?Q?SwLnP6A8Z3Sjk6XqdiuErmCYieQ50itxap3kwtwlyrF6+LNbNsVbSqRcaKZ9?=
 =?us-ascii?Q?TNjZZNTIK+8akjmbhMSIIKIBJBWXDQhgb32d0eOK1O+ayw1F6tDEsGv3vacH?=
 =?us-ascii?Q?7A0MBd9nJDwefRemXbzh8HuLVnRJHnkzsageLt2j8UxSnagcapfs4qguOP07?=
 =?us-ascii?Q?o9LVoVeuhdHoD6VxiJr4L/VL+aMx/N8RLPVL69d2tFvRll/gN7skDdKi7Ysx?=
 =?us-ascii?Q?V8gHoERqnJaquUaQTLBHK8CFxboc/6cooh6Bj1S7UC+jp0A8XkNCrXmto09Y?=
 =?us-ascii?Q?PFELh3sJJJLyikISG5ssvRV10B2CnV9UsBdaaFGakd0+q68WiazWGhysG1m8?=
 =?us-ascii?Q?KEBkdvB0Y9m/adFlf7jTryFmTdG9r4bl9IGF7dgMAOGcb/ui1fBwOxVRc4hX?=
 =?us-ascii?Q?wD9GyfQDbmbM6Ff5YE4I/v48s3LIc1CLbF3hBw3Iez9k646ULPqUkAZkoAST?=
 =?us-ascii?Q?SUeNIpmpIuOceWeCFQCVVgUAeh3ij9U66eTTVOH7tl7GMYjUHkz00cpCrIoL?=
 =?us-ascii?Q?ht2CE/kbLyO16UDlcCrtL6/HQH2bQZAqx3GlyOXcJhLzun6Mzh6HWeuFOk6d?=
 =?us-ascii?Q?RoZQ8IJ5I7v2h0LWQc1tuUM41OVzxOot4AVsEdazjNRxZ+LeCubj8+J1CnPe?=
 =?us-ascii?Q?hsXL/KBgFZV05v4wInxupfJLGZaLnTXAzmOlCyo2vV4E++F3HMBjh11DkNGt?=
 =?us-ascii?Q?JppK86eNMoEiWtPbQ9cF9VtY/zOCXa+6s9nzqHfaBcx8nI41jMd18I9R/Pj6?=
 =?us-ascii?Q?r1xFGSAxGm/4VvBYt79943ElYsBTQA7be5oQSNbe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4e2eac-ba95-477e-3675-08db93b8d829
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:30:31.4370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QaeELlwN5/gdlODTRf6qSAv4wC5aJkyKljfzTVP1NSPLkHrWU4tbh8waSM/ogcMd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7261
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

