Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C00BF785DDD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 18:49:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=k57zNjc6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWByY46w9z3c9d
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 02:49:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=k57zNjc6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::619; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwg2G5mz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R2L2m14dJX2herp+cSfrfyyjh6LULsUDu3FmJ70BpYuMlJajFE2yEg1VPrFaURnjX/tDvK4Ds2LZM381Klxm+VXTZWij/LzrXWQv4vx3wLPhsC+ZOs2Q6VEPmsi1HaQPLtzmtOAkMT2RO6fBDcTdA30VSV8D/MzFrBLZbFmrPhQp1u+PRpdO+2LBwfTzyxVWRtjFPggC/ILcoz0KpjOXTy/CLal6ZOiuIKTietaHyxUA42oMZery774ZpuD1/NvF+QtfQeMoeBjDwaz2qOOSsx9RG1dX+eV7NuajkvPFyLdNYq0lUi+k0V07tF33/1Rq3rNV8PHU68w8t/B7Dmc7UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3TeIM1SAg45W6SvBh7RWvFnlBirSJTSHcccY6cpEOQ=;
 b=PZ3pWUuJNWy/Qr7PsruQ5HUDtdSoL3KcMlc4wuOCn9W+0zoXBeYt+SpPNwsw45fJidmawOabs1Mj4ZCZWcG/ICU3ImhBjWADzqQGPFG1yNBJcLoJrzlfhOyL48ifZ8/kInnWFJMxuqar3CYC1aNjXGHkhMuLlKegz4GoqXvkTN8sGSnuRQtkds263GuwIwPHoRskVdOc1YtE1TIXLOzWHQgKpW95Rq3HTmIKn7pKasIRLqCEytZIPFCrWYlG2p4uTNKySEkFee7U7F6LD1g2pY4Jef7fhNcXgOCnXW8qVKtb9Ht1HWvKpNGFXPySBfdsop07vIGA9p54iXnRrAY46g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3TeIM1SAg45W6SvBh7RWvFnlBirSJTSHcccY6cpEOQ=;
 b=k57zNjc63FKPAT3t2Yojr8QnT/dp0i96XR6mCrifxaU8GZe2NaRQtWHYRIETB3717o4MdVPx0lp0CM/GUeGRbji+SwmatIGhqofCW1ysO+r2eyDXanYvRz6D+WudSE8KKzCpGAgRwWD3Mil4V/wa8KMsYgC43Ew4+KADPeMdPjqQfLZOBk00q9zT/caFGo/S+y79eG5zVbEYt6nWq2jhdy+aiJhX6YL1ehAwPTeBPZC5jecIhXILzrZ2kZCZ75bKlM4x9UvX+Hs9EaQDdYnq8hpPFmQxpR6d8Yf+fymEnQapnybwvl5SUwI1F3m7AaCoumupd4uPt5wsi1Cgu5kg4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:42 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:42 +0000
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
Subject: [PATCH v7 16/24] iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Wed, 23 Aug 2023 13:47:30 -0300
Message-ID: <16-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:610:11a::24) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: c49e4d99-bd83-451f-4af3-08dba3f8aa48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	pUKUsYEqz+0mnIB2pSdY7M2JMRfJCToch6+kMyJtJ4ltBDn+jOrU+WecNUCdUpsmxmDDe/wjqnsgwlcPyeY4vRS/0PXrEU0fwg9xvMpWB+2NaGCvKtG2OORUMXIEn1v45BWaxfq8+yRQm4HNIdQV7rXYcwzzcPb4eA5xLkxpno6BVaFMJozgbf9Tdm5b393FimdN7seKdkS9TcXjk8md3ej/J7UQ78B9zg+JZ6rH5Qa/t2Fdadak6FcsxIf2rcjc6PyqrSAU2jWpjzVGxi51CyOFSNUhXxxB0HWRb8Z/sPtE00qGIWIuNAKpZZNOB+BLVv/lrcZO2r4fnn8pTLwhm8pe+rZxUcfW16fXQy0b7ZRjHB/xRphvjL53/YohXlcD+iC0ggswLRvwiRUB3vlxWM8HQuu+FCUskcfbPM7O4EgCWvsaPqPrYoR3WmbDyh9uHYvv19zem4JqZyXYORT6JHKIZyvd4MKcZy8crNAcI0d7y1X6JHkSDSMUh57g2OIRpnAgJugi1293LfcGuFX5y5uGNgfgiZPOyaPFCAKukzrAGKckqJqmcydvbtW4AZrymCWpRAzJPLHqsd+GXzwsDOTD453BPHGs6Qbpx5SqtMc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?bTY+KPioPExDszZcPNP1IcQ+rn30iY8EYgPsXxZMdUxd0EgWO/FZGiSGV/wK?=
 =?us-ascii?Q?qJzeRAL64Y2rieQjzLLrizNs5kWnLTngxY/SbT3vsShVoc9i3j3qJ4r843qn?=
 =?us-ascii?Q?NhfqTni2Hv45RY4Dau2upCacH+UEIfrN25lOs/r01EaGdtbghXVXi7c7TpOg?=
 =?us-ascii?Q?gUpp9uW83QljyHIRR9AmJN+l2WcNUxsb3/rfWvTl8MqI+jnDnpoRZrbLmAJN?=
 =?us-ascii?Q?fV9mnyllCY3N8pHpgFqWhuu2Uz6uAp2AU0OLQhaDaCxaJHX8sqXpuseRnwJ8?=
 =?us-ascii?Q?sWmZOa/xuhvNavDm/N6Jk/fXAyea9liRswoPh6ETp3Mi8kztaVBkfSGmvnC9?=
 =?us-ascii?Q?EGyYcE7MHR93FhWFGrfmFPAyr+0Fu6S+1S0rIbCzRX64qaihxODUvxaNiBef?=
 =?us-ascii?Q?MyE1+YotqwCoaMfrqyZb1PnYWNbXBPmH3qmI+vtWb+ana1G5ZVop+gNN54hy?=
 =?us-ascii?Q?FOo/9EgJnsYd/7SrK8SWQ4uo+NJuEdGZmhcZ5PaHTDB3JQbgs8FMI4BaOxQk?=
 =?us-ascii?Q?QsXVG+xgvHryiarqsnGdi8Q/2K0X83UY3MicGL3hoUBuwfpc/ylFSEOnhTXV?=
 =?us-ascii?Q?o9bq297UCUqQAnHhtoJNGZGuzKWVNJm37kMMf6/HqWcg5bOldPMzHOKrwG+4?=
 =?us-ascii?Q?PQK//YGc66zVMvmTQhvpJohi5lVkmxZsgJjid3s5O9iXT0UTNpM4+iK3ryMS?=
 =?us-ascii?Q?Gkk9psri6NuVVnaHvl1unV9Qw9ZK0rSKp09Dl6ptLK6ZtL1ZikDhoGQzqQcT?=
 =?us-ascii?Q?5Og3y/xibDl63G1h6ViCcJDpR6Yq10jfRvhPSlM0mO+X4qLUW5p66ti6MMoV?=
 =?us-ascii?Q?pYn6pI/44xQFzq2do2dtre/Dgc6jEELE/ZZV4gKS9hgmUz9VzOQz1XcuFHw3?=
 =?us-ascii?Q?gpRg8JjX8cty0Kt2E9QKy/R9wIb9UqJfa0ehV3nTT8XRY9p4j5BtNbrP0aob?=
 =?us-ascii?Q?2IgdMlGEPW13oyR7qMjBpSekw/0hiw50+2IXPZsi910h2fkoTOe3jgAtkbLJ?=
 =?us-ascii?Q?Xcj9bQlh/S/lKV40Fr2Gdqfk0YkufPLAz2H85BhwrVCLZUZ5DjvEZDWl0woh?=
 =?us-ascii?Q?RB/x1rPoKEH2J2+tO973uzmwdsr8PhxsfAr7kmY438KRY3rLhVs4H3UVcQ4a?=
 =?us-ascii?Q?qCQukxsipdxfuSPbQRvWvypuYMzV6davwDeCJ2ImSt3QZFudVepDi3z9JhOe?=
 =?us-ascii?Q?VqyPF4iCMISUdfZQXSwAKd6k1iAI9SVb5VzRBeDDx/BsYKaNf/XvUhGLldtL?=
 =?us-ascii?Q?oXCXmjrRuv7IYzZsekjUi9egknVBf0c45YaUkqFwuZW4hRQf/aWi05cw7lnq?=
 =?us-ascii?Q?0ec9Hblqbvh7XhUyy5HUZ89/e1oJs/KpMvoyGLg7lp6S/hh55tGs7uf7ynpu?=
 =?us-ascii?Q?YSfc0KFUL3BQxBkC/om+LC4hqeqbQgMyeVfZEs0/AjTW5fuTHHt+Vrgu0CKw?=
 =?us-ascii?Q?ENVWI+7bb74MJ2cjljEeCm98/49jQd55tf1B6tEGs95TuIxSTpbIxl289Kqy?=
 =?us-ascii?Q?ap9Uf0bGUNApwdbam5wxBM4RcMMsx7Np1JHB4DHxWHPRivB8d/wkh55ukG8A?=
 =?us-ascii?Q?QbfvIDYpv8xUUgku1zv3sfF0V8yzOQyK2vXx/ce7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c49e4d99-bd83-451f-4af3-08dba3f8aa48
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:41.0571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ZVwSydoKxg1sB7ifiMfZXEmIKEtt6G3krM7Ijrw+xqiV4hRE3SnCkAGK7s5fpyt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6346
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

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 775a3cbaff4ed0..bc45d18f350cb9 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -400,6 +400,44 @@ static int qcom_iommu_attach_dev(struct iommu_domain *domain, struct device *dev
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
@@ -565,6 +603,7 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 }
 
 static const struct iommu_ops qcom_iommu_ops = {
+	.identity_domain = &qcom_iommu_identity_domain,
 	.capable	= qcom_iommu_capable,
 	.domain_alloc	= qcom_iommu_domain_alloc,
 	.probe_device	= qcom_iommu_probe_device,
-- 
2.41.0

