Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C933C704209
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:04:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxLn5Bsgz3fdS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:04:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HLlUQD0z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::60d; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HLlUQD0z;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxGx3R5Lz3bnP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZM73a/qW2BYzB0Hnsv3mWDoZZDMheH7ETzyA22Z5ty2PL/aRQXTGLc6U4dsDcgZ7uaDd6o6Xg5JZQKVcbzrDYr+Xwyr4eSIU2XwyykQAdw1Apd6wmW+ZKMdwpKcBIpmce1Yb3qTwbW2+70T/RzW7OBzwpltzS1bgArRdfqmdUtO9UR2szD/VEBGHq9dbgva510mR2HFJlyINFY/6vQFLWikyPcACSrFZHJbynBlStxUz+jYGZpsZ7U42cfMU9Hr4NKKSezcf29eai6LHGjWVEBAotgCkgAfHq7bXZMYpdRCt30sLdzujcktMABv/TWqRBOm0Snaa4QN12kcEDdeLAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JplaZHxMiUJROKD+qTnd9x2wQ0YQIobZhUNJsZ+z69o=;
 b=JP2yqzCWb+T+Rg4yOqjTvz+z1m6mK7YlTyjbYLS9+D1ciOAHq1iIm9myGG7hyf53gi6P75/EcrwHLD2ofR2l7P8+VMlmdi1FXVzMSE8c2tHpv0JW2D71MvjW5PBdTvOSXX41EzK0eCfI1P6Lhn17F5tvrkhJQBF7Q53q8odQPKGSNpInjT7xZUDGdldALdUho42vKoXpZ6n/Z7Njqyz2fIM59DnjqaJMwIMKQEznLMz+rn/515tjCGtmaPR2gbqFqNyfT86eb/t774oTuTYuv23UmABStTw7kMtDvtce51zo8+9aQ9vhX2THxYXYiELGT+k3Tf2ZzSsWApoNhB9bwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JplaZHxMiUJROKD+qTnd9x2wQ0YQIobZhUNJsZ+z69o=;
 b=HLlUQD0zDTN6fbvMWaXg1wFcp/aErGluIXYr0KXocRuJaAkCaJyyq/z7dlP/qVfZ7wxH3dmIlPs0Y2yY0sUiiIDxeJZrYKoIeeLfHxcXsUJ+Gq/VWJmrxaJUwtsWltqvSUkBqrJrSg0o84Jo3NOg9edZ5nSP/qa8hD1Gv7BXLoC+j7LvoG34nGXcmDR4S4HEDAGI1GBhEvUkW9HplFVMBrpD9YELfZDPIkjp+rAcS79x/DOopAwgcl1Po5w1CPf3+hUL+/u4MbPYKAhZ/+WFg1Dkm+/Sw+2IyqvbWw1WKB7R28iW9Whm8XgvrEASOVscVH7VtI9PP/RHHKFmSfS1oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:03 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:03 +0000
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
Subject: [PATCH v2 17/25] iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Mon, 15 May 2023 21:00:50 -0300
Message-Id: <17-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0049.namprd15.prod.outlook.com
 (2603:10b6:208:237::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e237edf-cdec-43f8-0b09-08db55a0a232
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	orLASM+ABEWLxfla6fGFA6BwZNVY7wk0zsAaFrhgSCF/8IYSxL05WW19xEEROmZphqi4wBIQQHzZI1mUEFchCgSYqmBYCr8o1ts7v8FfSyud5AHkcY699Lcq5l6tzjSVS2x4GuDyWExRBZShAM5ILS2BTkhAwqU+VTt8FV0QSc4IWfewEphOH8xmHrt5QR8e4CHfp+MJza5nV0SA8Mws97MG/jN0Hj5FXD85SW9zXD8Iu5XFcMCx2w49VP6qZnE2mpGuAzHhnfbuEE/mMCU2k96/VvdBTF0iUwALSnE3IARQ/6h2I3sZrVIE4okWN6tuX3U97bN0qLrPwkzsNaHUF4X0l8ekMrNJA34s6jHSryS1k6wSOc97/ZPP+8r4xMXW1NttyAYD27s6/9TDc0sOHDLUNBlgpAgSiBlJltxiEJO1v1aDMkw9SQEzZ3LDyc8CY1nRp1dvlaVjgG8VWu7at0Vh30Q1H6xfhoNgst3r/j40G3Mt8RibK3p2hFo5b5kKXYRzH0L9wTRT2teil+wFWUbzEwK3x9UjHfK24HGjSKOVvvfqrqgZAdJJW0GSE2manvXpOU6vY1Ar36DtofUzz9llfbxB7WLJw7aLG7k2w+g=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(4326008)(41300700001)(316002)(2906002)(921005)(36756003)(38100700002)(6512007)(6506007)(26005)(6486002)(478600001)(107886003)(66556008)(66946007)(66476007)(2616005)(86362001)(5660300002)(8936002)(8676002)(110136005)(54906003)(7416002)(7406005)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?sF33eyK/zgi2IRQN+dK2wi4sfDsXTP+9j7qXmlOgGom6XBeQUvlgAsWq13D+?=
 =?us-ascii?Q?0DJvfEfkyk0Iz5bCDO3OydxjQCL/UNPicTkiIRaxFecV6o/Gcr8S+wjJxL8T?=
 =?us-ascii?Q?UPM790W9voWs/A1YVZvyEq9gAeyRrWIZsTtxKRxuhuuhpiYkMZhRSHKS956H?=
 =?us-ascii?Q?9Im15cwJ18kmeiqiT41DoNqVKv5HdJpZrXRIA9Bt5Y9ZYLlJuLtfMj1MTH9u?=
 =?us-ascii?Q?FDPtBe6FVrMXWl0N3rZUceLNiedS4HYHKcFpxnznrsiUm4Po63NUoERPMIvF?=
 =?us-ascii?Q?qMsaUpOH91v0oVvR9G3vsr+JXsqMEqCCmzW5r2BDwPdUsCe1nceko+lGnxF/?=
 =?us-ascii?Q?Ty+aMbPP/SdyWdZ+BN4/HklDppbD/DE/nseoJrocgGCVmVc7ohrV3iLn3QMh?=
 =?us-ascii?Q?q5dO/W88cn5UfndIt1EwuexQ663/29Xs9yg4IPyTEq57dCA+BFJnd7NZCvns?=
 =?us-ascii?Q?HxlK8t/Nvnx8ytakZep5PGAX0hUdpV3oA72Szkj5PYuZh+SYeolE9lEvipko?=
 =?us-ascii?Q?LN5hpsswZefXcE+RuXHvBhJS8mdrLmLntRO/C0JbYCBLJCCekEfU/EELmVrT?=
 =?us-ascii?Q?pywcSKgM0XiJv//alZgiABI4MXnQXyhL4UAmiBRCkwhMLfvwwO9z2f63Q7ti?=
 =?us-ascii?Q?b7F8ZgiX0ctes96BaLULG59U80qWI8cfgM6sFFaQSPDxl1QEO5ItfCktVWLQ?=
 =?us-ascii?Q?fXwDySjIXcDCbP488GCIlvYOTfZu1QnEUWjOG+xsz5YCs/GAt5v0uV5S7D+w?=
 =?us-ascii?Q?DH2ZH1604uZV9lLre5uB4DZGV5y8t7fsnx+Sr1GrZB1VEU3Al8tnmm0jx+av?=
 =?us-ascii?Q?Caek0rOe8/+GcGXKFdhhXxc+Yq+GpBlsLQ/AxmP72jkP5+JzY6hcDCMIsYWE?=
 =?us-ascii?Q?FkEdeCjddYEC1BhGdDeuTFBngRCAy7kSnZH4Flu/5yTTncT/O9Bf8Ne4v7Uk?=
 =?us-ascii?Q?Ei0SxRQlWE6cR9lxtArSfm4FrmnFHTa/DHS7fJn+FOTZqj/ag0+sw9xEuhen?=
 =?us-ascii?Q?wLEq54uzDxJ39Hz7D+8gqRvZyg9WfxtTnTLu73nt7Q6AEZq0co2zXaZ3LmMB?=
 =?us-ascii?Q?s2bzSmi38z/IgIpR+5Z9cyBYbURbURnRBpx6IpSJ0ShQAuuPHScmBtXB8aWz?=
 =?us-ascii?Q?1SibdQAX7d+blC2RG4EBSZXZxpovVSHoBuamsG8YhjjcnqZt6S6hMhRpohma?=
 =?us-ascii?Q?adkpK3+9kwhXlMLwdEyCiQQXsW+8q+MeL3Ecller01bvL3AGzuTPfbzwH/lH?=
 =?us-ascii?Q?uT/BCybq8KWqzGItmY7hs5icTGXJLv+CS0U7JXfgSBZKKiqYmW8mEaloxLzO?=
 =?us-ascii?Q?/szr8KX7usasbDF89+GBqxARZuocvN9NvuHK/cUC7WHtXbwx3+lJO3GnV2HG?=
 =?us-ascii?Q?3nQO+WjmmqFFMV2q8h35flvu8eX0Tmx6e4ZswStO5ij8r/j8Fq4JMmVo5+IQ?=
 =?us-ascii?Q?OUmzoU+EtIJojtHGNpGYL9zf4/gpyACAZb5kfC4Qros14cb5UoDNymibpTdq?=
 =?us-ascii?Q?9v8xq+Swj9Gnvp0tCqJUoSPii2BXXfz0+3/28Bg1Bmol/WNRU4eHFY0KY86r?=
 =?us-ascii?Q?d1o+LSqrE7zJsjS36l9TzlaS5tRm9Drd+wR5Df96?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e237edf-cdec-43f8-0b09-08db55a0a232
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:01.0198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GszyChCSFhO5fbvuOIYKTcv2TAxw4Vog8OyKxrtRccEipQqyKXFq7YZ5JHIloiVC
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

This brings back the ops->detach_dev() code that commit
1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
into an IDENTITY domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index a503ed758ec302..9d7b9d8b4386d4 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -387,6 +387,44 @@ static int qcom_iommu_attach_dev(struct iommu_domain *domain, struct device *dev
 	return 0;
 }
 
+static int qcom_iommu_identity_attach(struct iommu_domain *identity_domain,
+				      struct device *dev)
+{
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	struct qcom_iommu_domain *qcom_domain;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
+	unsigned int i;
+
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	qcom_domain = to_qcom_iommu_domain(domain);
+	if (WARN_ON(!qcom_domain->iommu))
+		return -EINVAL;
+
+	pm_runtime_get_sync(qcom_iommu->dev);
+	for (i = 0; i < fwspec->num_ids; i++) {
+		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
+
+		/* Disable the context bank: */
+		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
+
+		ctx->domain = NULL;
+	}
+	pm_runtime_put_sync(qcom_iommu->dev);
+	return 0;
+}
+
+static struct iommu_domain_ops qcom_iommu_identity_ops = {
+	.attach_dev = qcom_iommu_identity_attach,
+};
+
+static struct iommu_domain qcom_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &qcom_iommu_identity_ops,
+};
+
 static int qcom_iommu_map(struct iommu_domain *domain, unsigned long iova,
 			  phys_addr_t paddr, size_t pgsize, size_t pgcount,
 			  int prot, gfp_t gfp, size_t *mapped)
@@ -553,6 +591,7 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 }
 
 static const struct iommu_ops qcom_iommu_ops = {
+	.identity_domain = &qcom_iommu_identity_domain,
 	.capable	= qcom_iommu_capable,
 	.domain_alloc	= qcom_iommu_domain_alloc,
 	.probe_device	= qcom_iommu_probe_device,
-- 
2.40.1

