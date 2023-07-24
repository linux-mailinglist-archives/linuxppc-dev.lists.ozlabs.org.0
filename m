Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EDF75FD9C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:26:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iKvQpyqX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nCD54Q3z3bch
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:26:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iKvQpyqX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::627; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20627.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6Y2xpjz2yDb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogszGr6PLX8ycAmBaPjpubqmimd45oSwjWIg5CCr9lEKOYl1oT41MfF7n/AaxfVEmrjFoG4y0mRn6NTb6AEPrpbxARehK78r2oeiy8b963JqPFPYcScuTDovyU2CHbEfeZ7giKFAx5jebmrCEfnyWkv3Uw9e4PBrc0rwCxEFHov5CgJ2/ugCDDRKBRKfxZE/KImG+myl251kFvP0w7KFELqPFiWWMmV+viFzlKeOMD6yA8b8Oi9UIY6+XQ2gOpTdcjWC2FYY9EWhRuHggt+fAUlEHAX60EIhV7oEzeRESjrLcE0/JlCLK99AxvrM9Z5iGcaR4TRO4HV+9C2P1rUZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/0gHl//8SqNFKrgnCU9P1aax7WPPBmGyHqK+vgxw6c=;
 b=dOo0v4GnsSlUR6u/Qhl5xkGqk00EGEHQ+UcyVcM9azKGFHVWcdhNE0bR657JMI15ieBJ8/p0VyxCp9RaUAg/TmgQ4GGPy7zzwUKlDyXc2/f5wtlqdYeKtPB76XEcG1k3M6ceCE5WhxrZdDb08/zYnoo+27rq6pTzV8qwTXaA6wIoIpGvqisiDmy1iyzaQN91AZi7IuiaZJ5oMDbtjgacHlZq+GSJbmkEptk+y6ONb1QBmFzMBemtf+Wm3E977Ag9uAOiL056twH/SI+vjUGNc5x/QonWb4/nQEwmIdIHK16WzUqRlIcwc4L422GOAfsj0XU93tJ6IkEQ8ntjvUYO7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/0gHl//8SqNFKrgnCU9P1aax7WPPBmGyHqK+vgxw6c=;
 b=iKvQpyqXMuPR7tGPUvcjvEKdWpIf450LQV91jG9zkWaMTR7zMWc9CLpLEHZ7K0CBPJ7X8XPQayubsOxi1ZDFrVe9Guz7nYWOLen0/xSt3i5rWsNL1ptNY31XdiZSbtGbPjbhsg+3yWkWml+JoBh1E45kEAYBzzmstIpho7iNj70rPO72PlaASe+dWP29UhY/YUMeDbgWSRz4MkxkBbFTMK7StkIH4PoH0V+N1psW/XN47dsGxpQyQ2T6ytUbS2HG6t7eRQ8DVI75w/xpRX/VFbd2Rb9OeH45ydCgjq9bYF+UzZpdfoITvd4YXHrX8m3sTzzjL2Q9/0PzJHq9c9yBIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB7353.namprd12.prod.outlook.com (2603:10b6:510:20c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:19 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:19 +0000
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
Subject: [PATCH v5 03/25] powerpc/iommu: Setup a default domain and remove set_platform_dma_ops
Date: Mon, 24 Jul 2023 14:21:53 -0300
Message-ID: <3-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0005.namprd22.prod.outlook.com
 (2603:10b6:208:238::10) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: d02e0ffb-4e16-4a47-7b4b-08db8c6a8788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VnHX2Udv8zvsuzRPa2Rb31CAWCvKRzv73QcfBkB7LZTG9ItcLSNGtNKKPF0QmafVvS5H0pt7Ljfi/Ew4xxIngaO90WN8K6JW1nRzGb3tqNV4wXvmL8z3ow5K/n4e4X9Q87fwFq7BC32L92dZNjld+fHq5yEaWn4QaAzsLE0OX69/hvEfS8nTm8P6Eq380pt+KNmByluvvWXCRxyZqygcQ9gqIPG9pr9guj4dG1BTxU3sANuLISti2p8BHbUBccH0pbm4DPlYUAFaroe76HYZtnsxcUdMBaN6IAb9cSUuMmlS8WScpmwaSZAyyyJxktpuRmIEY60qKL4ri0slkO06ipfVdBvDGa0m25mnqkyMNZAVJRQ5/biOiLSqCX+djjTpjqBKzxamRytVCRM1CKclDHb2hzQsHdy394oIH6jHMkLlz/P8AxyUG/7P47Q4eIdfbWQQawG3nZgE0cKxdudwDFOTcKYrwYfvKwFxm9jrn72/uVkG7k+FG2m2XXYIhlukkh6Ugt2tZA55IEDDZ3av9DnVreV5gXU4nWAXhx3GJSwf71B9Z4jtu5xHqcOSL0m4nUNzi45KqjL8ikB5AgmM12+m/eXGrtxfNRrbJRT3ei8fXmotcODBmLmuNg+FaQdQ
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(36756003)(478600001)(6512007)(6486002)(110136005)(6666004)(54906003)(6506007)(186003)(26005)(107886003)(2906002)(316002)(4326008)(66946007)(66556008)(66476007)(7416002)(7406005)(8676002)(5660300002)(8936002)(921005)(38100700002)(41300700001)(86362001)(83380400001)(2616005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?AVnhixMmUZnnrr9xIWevsnXGP+qtNM9rnI4rA0eDbteXiMrOCtunSzMFsltD?=
 =?us-ascii?Q?8+t0uUuh31R6cj4/SdcfkT+PxdKkGGmWgpoTY/lw2mnFzrKf7YcyDgGkXYr1?=
 =?us-ascii?Q?9uTssT749GWv5xvl5aAPBR82xTny5JIDiCj0kFzVP11/IBIkdPAnxh9SCCGx?=
 =?us-ascii?Q?KSxybhLob7piFB55DqJ0TfM29DgaUcBNOCb7i+/5Blg35m+O+qTwnrDFc7Dz?=
 =?us-ascii?Q?Bqyr8tKbDU27/sxe5bryafLBgVE2klVCfaFXPRQOHI/TTaIFd0XKSKCk0oId?=
 =?us-ascii?Q?h4zl7PPGCH54SjA3Qi0bv8PVr9pH5Pf7ipelu6CbJFLN/JabvHZnxKWPgNea?=
 =?us-ascii?Q?9PzL464pXbqT95U/PkwRQ+xrN7nZCQY+bQ9La8dQfgduUfKcv+NTKZmRwbVV?=
 =?us-ascii?Q?kEdpHkcM2Z9Bg/Cg5xZnnrhE9UzOPJYzrBNqYfSXZyhshQ6uAeYnfnQswJT1?=
 =?us-ascii?Q?DOgKNY/rJv53NJE1mXUyqXYUG1HcK2yBrG5QVVZLV+/yNHs/M049iW2sFI5J?=
 =?us-ascii?Q?gyly7/+0Fyuyg4kLCHTgJl5ABlM6uvv+MGqMfOq0uqIwAbAE2F82Wot+sTsB?=
 =?us-ascii?Q?IRI1EZrrES8ygyp/CshEfTx45bWhUKO+0A7uJRqyMei3Sm0uS9ogB5hgNudD?=
 =?us-ascii?Q?MDFjGA2ajKla1w8XOPp60LeBzhYMN5wm2cFQy8Btl5mFqVXQYYJdxyHSE1OK?=
 =?us-ascii?Q?Gdxw2nVvPBmuyCO/rAwhNUVhyyY1VvbCCQ/Xl5CcNZ7V5H2mE4pPSvsnNlQw?=
 =?us-ascii?Q?epc67H0szkhs52EkaCUtCmeLs2r908xG9YRXb2NGrqp0p8QsGAzMGocXSoIG?=
 =?us-ascii?Q?W6uOLCuSp9M2bWFRIWaXAk2UXrVtFNVtA3WDqyZnrMRKaxLy+L+5D+4Oi4ag?=
 =?us-ascii?Q?Nr4xa4rxMXSGHkmuP7zf/Ij+u0iz2PeAUxI31TlANYwWthzkucFLFUWwhTfr?=
 =?us-ascii?Q?/AvlmKXD6y9YewNUK1BEmq+YDC6oFXgb0JnjEXdelAO9v7/R73XOY4LKrGPZ?=
 =?us-ascii?Q?BIurm9qnZKvFskyDJSKC/OOpirQs+XjS+D3a1KCvpMOc/TcjkghGA12NbnVR?=
 =?us-ascii?Q?HQ1uj+JARNZpeWSKqWrkS4Qy2v9mOksjQrC5bxxui67FTG3QdNqglOyLhpeg?=
 =?us-ascii?Q?kYtol9pW1Mhd22gELbegXCfLAzHrahkJN0NK2By8jTAiJoRuAHaFDXdJrXLd?=
 =?us-ascii?Q?BTwz8uUevIfO9eg89LUcHrYpgiTu6gh1/pD1VZX8siVUEqK6Ma0GDytOpa3H?=
 =?us-ascii?Q?dplSS+7EcQjP1/zE0Yle+v//Iumjaa7V2Bs9v+WSMUFuDyjNnrtUWLuW2Ch2?=
 =?us-ascii?Q?fjLRUZFXXQSTrmPOGxOqnxB9LinQ9DwAxjZ1ZwTlShzt/EGCt3eZ0NUW634h?=
 =?us-ascii?Q?iH/2rsq8H2Zle4Li6JEv+zZDLcYwLOzfy2ZwLV4FrUYkp6uTFdBvJYecob6X?=
 =?us-ascii?Q?KnJEI6uuWRMIhRlyiFrbWehZ9m+8gO/bZRdUgH1Sni7BwsW7cTaI8lzp4Fkw?=
 =?us-ascii?Q?sc5cFmMIC0EbcMTxwHVHnOWo8yFgyYFnHekF4HPWTpcYY+k8+2KTaiId8qLb?=
 =?us-ascii?Q?egkOgxrLDd19tMbOm7tX2Sggg+A2k6ze9+TUCRsT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02e0ffb-4e16-4a47-7b4b-08db8c6a8788
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:17.2459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0NjpVT3oBAUVYxfmIsKwTyd+NWFC+KEaJWTSmCdTRukH+TO7YrV05VoPnxXScur
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7353
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

POWER is using the set_platform_dma_ops() callback to hook up its private
dma_ops, but this is buired under some indirection and is weirdly
happening for a BLOCKED domain as well.

For better documentation create a PLATFORM domain to manage the dma_ops,
since that is what it is for, and make the BLOCKED domain an alias for
it. BLOCKED is required for VFIO.

Also removes the leaky allocation of the BLOCKED domain by using a global
static.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/powerpc/kernel/iommu.c | 38 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index c52449ae6936ad..ffe8d1411a9d56 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1269,7 +1269,7 @@ struct iommu_table_group_ops spapr_tce_table_group_ops = {
 /*
  * A simple iommu_ops to allow less cruft in generic VFIO code.
  */
-static int spapr_tce_blocking_iommu_attach_dev(struct iommu_domain *dom,
+static int spapr_tce_platform_iommu_attach_dev(struct iommu_domain *dom,
 					       struct device *dev)
 {
 	struct iommu_group *grp = iommu_group_get(dev);
@@ -1286,17 +1286,22 @@ static int spapr_tce_blocking_iommu_attach_dev(struct iommu_domain *dom,
 	return ret;
 }
 
-static void spapr_tce_blocking_iommu_set_platform_dma(struct device *dev)
-{
-	struct iommu_group *grp = iommu_group_get(dev);
-	struct iommu_table_group *table_group;
+static const struct iommu_domain_ops spapr_tce_platform_domain_ops = {
+	.attach_dev = spapr_tce_platform_iommu_attach_dev,
+};
 
-	table_group = iommu_group_get_iommudata(grp);
-	table_group->ops->release_ownership(table_group);
-}
+static struct iommu_domain spapr_tce_platform_domain = {
+	.type = IOMMU_DOMAIN_PLATFORM,
+	.ops = &spapr_tce_platform_domain_ops,
+};
 
-static const struct iommu_domain_ops spapr_tce_blocking_domain_ops = {
-	.attach_dev = spapr_tce_blocking_iommu_attach_dev,
+static struct iommu_domain spapr_tce_blocked_domain = {
+	.type = IOMMU_DOMAIN_BLOCKED,
+	/*
+	 * FIXME: SPAPR mixes blocked and platform behaviors, the blocked domain
+	 * also sets the dma_api ops
+	 */
+	.ops = &spapr_tce_platform_domain_ops,
 };
 
 static bool spapr_tce_iommu_capable(struct device *dev, enum iommu_cap cap)
@@ -1313,18 +1318,9 @@ static bool spapr_tce_iommu_capable(struct device *dev, enum iommu_cap cap)
 
 static struct iommu_domain *spapr_tce_iommu_domain_alloc(unsigned int type)
 {
-	struct iommu_domain *dom;
-
 	if (type != IOMMU_DOMAIN_BLOCKED)
 		return NULL;
-
-	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
-	if (!dom)
-		return NULL;
-
-	dom->ops = &spapr_tce_blocking_domain_ops;
-
-	return dom;
+	return &spapr_tce_blocked_domain;
 }
 
 static struct iommu_device *spapr_tce_iommu_probe_device(struct device *dev)
@@ -1360,12 +1356,12 @@ static struct iommu_group *spapr_tce_iommu_device_group(struct device *dev)
 }
 
 static const struct iommu_ops spapr_tce_iommu_ops = {
+	.default_domain = &spapr_tce_platform_domain,
 	.capable = spapr_tce_iommu_capable,
 	.domain_alloc = spapr_tce_iommu_domain_alloc,
 	.probe_device = spapr_tce_iommu_probe_device,
 	.release_device = spapr_tce_iommu_release_device,
 	.device_group = spapr_tce_iommu_device_group,
-	.set_platform_dma_ops = spapr_tce_blocking_iommu_set_platform_dma,
 };
 
 static struct attribute *spapr_tce_iommu_attrs[] = {
-- 
2.41.0

