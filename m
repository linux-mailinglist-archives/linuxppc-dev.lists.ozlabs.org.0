Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B7272A41E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:10:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdBzB1cFkz3fwk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:10:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SYWfI2E0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::62b; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SYWfI2E0;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBg00pFsz3f8q
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUhaSW6FLAKsF22ZQkxvR5mfvdwDD7ntvIPEJu1oO+QchS15kTr9eMZPB9YWc0e5jT0SpbCZ/s82CbfJkVXUgjKYssxJe+MwHG/deiNWMJSVHxfl3DirXjVf1c27JqyFk+PFFHqZTTTt7v5EzOLRhPRh6ofwyUxmnV2w0nGB6nIFHtjx8yOq3WAnzvxUCawvC7GjCG4qlz9Nqt9bnrmFG6+H3f6xN+mWbL9gUPaMFjYAUSwfxIhkrwI/pSEwixr36xOGfPiUhbKlVnccdHO7aPpdln1p2V5WdR7GgsOF7faTARYVFu+J9obkVXBukhRjumrWd0JpvhQN4Bx3eRjaBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JplaZHxMiUJROKD+qTnd9x2wQ0YQIobZhUNJsZ+z69o=;
 b=YsGO0DZcsA8XNwY1re1ayIHExIBXGVVTn5Xt6oBRUEurDDvJvg7cfRnzk3l/gEaB9JlO8daGCi2ERV3zJkLFQOGxdI1AWALZLHFIU0B/s0/7enI8XDjJfSM78HEuKrAwb6Y6ZiSq82bHrOS+9OEjqmMo06GUdo6s6aD8TJSpKlYwRfAWRvCga5gborwHcWS4PjGfM+2P7aCXUhK5gPdtMfHRsOYioCE70QEDn7KlH/2CyeGDSpzyuSVi95bsTJCYLifaQcT2qCCEIx67tlbOVyRApcpNyrFnJhLQu7yvHxqlUFLSjmOlZEQX03vHYTxaqiIF50Ux72Om7x5uvk3dmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JplaZHxMiUJROKD+qTnd9x2wQ0YQIobZhUNJsZ+z69o=;
 b=SYWfI2E08V0MZD2zP5Z2khMoHV/VlfnS4F1b3JzKvT0MR3mY/p79+QvoFPcppaQmFvnFxS4aD3/zGOcKAx6ps3KqYixKxueSrFsnJzwPYPNrgqVpoGxe19cSmeAtv1+abHeEpaU4MhsttGjAdLSlcZRb3BFRf0GgoGCmFRnazGShSR5wJBQhXOSd6EY31oM2QGWTZ1kkZZbXIKpcs0ARMYWSQByol1AxAXOXGQrUebawInJt2vF7ULWa0yom6b7rVXYExtLrYe5DYhQv9hH6/L1pQp6M27SXTHOpMVaCT7Puui68TFBzR2PA1lPZihvFh/EjfvmW2tQz3HyqdQCaDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5785.namprd12.prod.outlook.com (2603:10b6:208:374::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Fri, 9 Jun
 2023 19:56:24 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:24 +0000
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
Subject: [PATCH v3 17/25] iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Fri,  9 Jun 2023 16:56:05 -0300
Message-Id: <17-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::24) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d044f47-6379-4147-eb4f-08db69239947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UhVWq6Ui7oIi60oQfbS3VmDpT776EfAmTjgZZHAvyaT6H6iJuQYGo/MOxHOyJ+3H9gQOZ42q7OcSLGyvmVvlR/OMVUb9sDLO5sXkrdyfAtCAbAZQ5nVF99K5q+A3VaBr/e2mx8xd4NGoqe1uBltCY8cNySVJSbtFrB6jRsqNT8UZz4jALFUYvGqwgV/4XZtvtZD1xKUF6plawjZVZRRSgovWNf3KA6kpYdkNV0N9DFJYuZuY0HpqS6kE65uZv4IOuX/CGb/F9lLXjBdaqYmMLkXpRO1JMXvEW6OnZw4XkEPZzlVdPHl0MfC4RMkR4C2JF6xXefoAE4zl+kB2M6VCjgYvtLXQ95MfZiXTizXaJIRT2hoZlULYXtT/nG6GAhRbWU+2ekNrDyMSnG69qNBe8KCSd1TtGqeTBqgMB6z22scJZMEhLkR8yNNWhncI+2AM7rRvHxG7K4UskwM9FnPBZh3lpm4rNuPtCoOUegtH4zYSH27EqcxNr/9BIDX1Ec605AlzE1RgSHRBmsz1A+Wz/k0/OrvXHQp+lvrJYq/aigoq6woaI11QxVqR9nvcC4QrQSgUpFHDQJH3Tmv55CQI1SkjTHAEt3a+hmA9vS0/mVE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199021)(83380400001)(7416002)(7406005)(110136005)(478600001)(8676002)(8936002)(4326008)(86362001)(66476007)(66946007)(921005)(66556008)(5660300002)(38100700002)(41300700001)(316002)(6666004)(6486002)(36756003)(2906002)(54906003)(6512007)(107886003)(186003)(26005)(6506007)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?v5cpA/R4ovTaXYcwTZ0htqcineiQNZ9+zAevzNrLhLu39FPT0o7V79yBTsYy?=
 =?us-ascii?Q?FIqxZ0u3hIG14lDxiH97L4h4mokYJ/wgfqTfxMbAKqeZ69e+SOcQXTVwtjAF?=
 =?us-ascii?Q?xh5TmJteGiL8H7V24jLR1WO4m8ja6HJMlRhjj+Z9YflL3Dy6VVaiQ2xyPP8O?=
 =?us-ascii?Q?jYrISqQF1yHVqdeI1mOkpLyKmM8h5TUfVWKDHkj3rH4Abs9aQ8nao9TMdNV2?=
 =?us-ascii?Q?D64Z7uNHzLIsKHi0E4zx2hnIPbI4d/tMu2sWjJcQ/fktEMdjyNyk7PCQeMaT?=
 =?us-ascii?Q?J5APEjhd1yedt1U7F2fejYEp1eYLLQDzZg61aqBv7nf4AbV8lN9AAV7DtbY8?=
 =?us-ascii?Q?nRQuLE59yNPNyxvGpmZgf0Jjcn38+otIVz6SKLO8GKnDdis/WLIySqp4Mbu9?=
 =?us-ascii?Q?eSYRbA4My15kh3C0mx94nmlJt9Q7xYEIBQN3ad+6D0OL8iWB4DwprhkV5btC?=
 =?us-ascii?Q?4Hs3jxjiWb1B88yHVAvPhfwvkmbuTRG5ULPumLQDSBvr1ZpBpYYghk6q0547?=
 =?us-ascii?Q?5cJrJxqa7AqrRWc9C70eWYYNo0LMe2QPejbBZ1KZRYmwZDKjT0v/ykmwO5AT?=
 =?us-ascii?Q?cmmXWJ+MrCm7Zi2qtL7NIn0JpHgm8wyxL4qU0Zw38cIz9gXUi+zv7EbQyANI?=
 =?us-ascii?Q?EXQ5UkNT7FGjggH0gG97lkwO2vPhO+1WErZx5xeX3mJEGCN3gY1kDfsT0cV8?=
 =?us-ascii?Q?q6M2VflIh4A2JPIhs7N+MIL38iK3k8PaRb8if8LzksEceRXZoPmQuTMKhUBq?=
 =?us-ascii?Q?jQ/tNeKKyb3DXIcxRUq9YtZmRtsIsilSi6TNRgBwqJ3AmgmbU618S7aqLn+6?=
 =?us-ascii?Q?EadcQF2pgZhV6whJkww+dvOh59Cc+sFbIeZQ+kjZFT/uGNIamtCZgYOQsrXn?=
 =?us-ascii?Q?w5NFCnyymT8adWHjmpPdY5HCMTLhfxTglxsYs+WAzp4EtY+JceKoosnsptpU?=
 =?us-ascii?Q?mEdTmgAwftDpYobl6tT2Li1/oiXwHtX5vn0oJGHLt++UsbMCoOngp/F0V49o?=
 =?us-ascii?Q?MpaclE6na/+C0iAZNR7O72URjKqMOXFEO50kRGXwChHmRkiUIPUfqZRtb+a1?=
 =?us-ascii?Q?O5qdfGenG6+iggJFYBXW6WP/IAMjDEjctq7+0wH3Sl640pVz2dn2FNfn1y00?=
 =?us-ascii?Q?H5VlxAH4u2k19LFVr2giJPiDKAap3+HVf0ebQsvsnilffi1cz8vAMWlE4Wpn?=
 =?us-ascii?Q?NE26do47JOGMRlUDONT0KyrS0ltxdxHmVpj2FRrSMS8BMMPSEb//t4NKIX05?=
 =?us-ascii?Q?dAGpoitO8e55ZyA2OoWrMgi+AV5waKNbm8wlBXUfeWNB1enE4wJ+S5SenCfj?=
 =?us-ascii?Q?tBBSdeIn2U6ZcA6whiRnzztfLVCGq6dyaQE/QSwjogECQl4bw9i0XuIuEKnD?=
 =?us-ascii?Q?I+oOaQJSOYBdpgzWo0IgR6Jpe43NRb5cYcR/E5TrJCAqPFuZrpOJLzjtOnl1?=
 =?us-ascii?Q?1f7ULZp4AQIEq75ubOZemMTESM5fEyf5UvTvBfloaoUjNZ2o/LPaTaQW+hMU?=
 =?us-ascii?Q?+7DaPk2UEA7oVOd/n68OGV5Qd6/cSqwkVaat94zKMzVZYOpppKwstwu3Xoyn?=
 =?us-ascii?Q?pm08k7b317SDKwlj/yJ3oiNQju6AKwAidDIl6tsR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d044f47-6379-4147-eb4f-08db69239947
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:22.1349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: weLx1i3Iq+qh9NLdHRht027kguqogtdFSq1+rtL1PePc/rRzW0IY/nbsgnstUyp/
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

