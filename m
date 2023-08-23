Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A985785DDF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 18:50:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=r+X9ujf1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWBzW3dSZz3dDj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 02:50:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=r+X9ujf1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::619; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwh2WR7z2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1k5aBGwc7zXR2jO86vKFGDdyTDYUZ8ph6J/ACFYjycYfn5ul3kszvD3F0dWutsk3NTE3zEXEFo7lWYjBK5QVMzQVV9mChbbb7tCzWrikAbA0njpLTnlY3tEBPVr9S9Q1cJCOc79vD9Rtif1T5mpyxYcueF93oadB6ZEdK+W0NZsPjQUUDCwbMel6eVfBT7gwGZUd8jHwPMMhBFF9lQ3CPGAfZJxEAOD6CT2UYy/zpaULGkCARxTMyM5R3471s82bovqiIrRnM9EfydUzChgZ6wfYJqvGhX6zkfKlIlQADqjCcMeRfgDyyqHisY/XW3E+qPRSAuUo3U4XhxzUzLnMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NU6+gAi7na6R2Cd9q+LQhmLXvWeshtpQZ97BCSNrvGU=;
 b=LV4Lnm3BqpGeGRksv5lQ9RQzPeFtSZ7UWJasPoC5dXQD2W114DRUh4D/xWayOdxW7mCPvzKwiKEJFIDRQU6JHKkVk2foXHsDNJgLC4+ES3qPdj1T0WYHnzDnL5gPbQWwioUCpVfI+Fe9huBMdjFEWZ70oD/08Q6JJLbyyXxNr7gkgGz7EHmTItOecGFCkvGe3jaYWKL5qUC0dAKnz6aST3o0RemflEtC3DMnaLHuJ0rljTnt/GWDmxhWauN7Naep7vdZNvHf76/nDS3w/ofrQcXFx7Cc7jH93336a+HG4TgAliArVvflF4SHEsW2BvJTg16EqFj/QW9iotbLeqDq5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NU6+gAi7na6R2Cd9q+LQhmLXvWeshtpQZ97BCSNrvGU=;
 b=r+X9ujf1HRvXIvTcw4zkJO1SaNHwGjRbg6be7ZR8Vvl0X66NuRr2bnzZaAaVBnql5QfMTzXyC8jf6YwxJPYp98aUabHfNTGKOFr/HgS+AIM3vbOoALfJ7kxWaJE3fR2Sl6d15F8Qeb2Gn3oYPwbgd/OMlxmL25fZKtJanPHoH6T2pGCvVIFM1PdsKTkbbyINOGcGUQsjOgdxyPCUU60VZryyjRbizcJXwrobY+bfkdtvEUWqZvp2jQj8rGn1ReJL/ypvMq6XRzcSJop605mWMkc3QZcRN+yLLcJqfixOmdTx4ULjVmg5NUymArJAGnYktsy9iJpLYivDXd2rNUmslA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:46 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:46 +0000
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
Subject: [PATCH v7 18/24] iommu/mtk_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Wed, 23 Aug 2023 13:47:32 -0300
Message-ID: <18-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0402.namprd03.prod.outlook.com
 (2603:10b6:610:11b::23) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dd5b181-0263-4496-5402-08dba3f8aab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ARSuSzIG4NTLUBt6iP0Xt4Iieh+wMxcoXt93FfDOiJdsQ61y+RXclG3PnAl6V8spCK4IFWYYmkCGaR6ZB4c5YtgUdfn6bB2pgy6+ynQS4VGdfqp2dtGc+gpNh9wuUZs3BuxtbyuQy8ov484kGS+OMv0BwVPNwdvT4buyxmEA7yOdhfL0BQPjTLuOie0oAEaPUyp6kBTu5a3OSP6RgpIl+IXFkpbjXCcwYSU/4x7RrQFsO7yvlOpGF2uAsFRgUdssUXFKiboDck96UIv6Fhrz73egWoSJAIICeX5abwOlWnzK5cJVxiiI34hdqHfjLr6lcJC5AGsSwRy7IXfH4BNXJWYGv03ZsU64s79FAgUdYc9YtznKj/g4ItO4Do0ebaYjjO+OL/lSZWrLiUjjDdV+Rmm/vf/2AR6XmmUap7z0MD6QYuMk+RjpDJPNlJGzH+4ixuRv5d/m94IioPyBtz7VXs6VPrArdF2FwuQ7vKKyp7hwZ2qbsvHOnu+WP56xW9qZ1o0PTEFkd2tuYXVuf/6m9u19o1HuBbzpjWbVXeKtjQyVr8CO3yr5uOBNdnLkHsEKRJd3LN17VFC6N030xIA1CPNUGw+f44+CgJTBr9Z1eAg=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?64UO3QKO0APzzmJvk9MO8LTs0t6W9y8C+5J072qdBI4AqdI+rynXtQcZTolB?=
 =?us-ascii?Q?R+0MNeQqxkfpPyX0mgiSQxuEmgCqeYnG2EjlV365G8X66yqfaVSaPNHgHoot?=
 =?us-ascii?Q?Opmfer6d3zcRPLNiIAIrccUUDKn1mAfRvIa+J99jJXihzYji7gG/tAfrsgVw?=
 =?us-ascii?Q?OB3LTOURMguuGSE1FEPZNnSlvVRKpxBvrdTxGSyVReRkewepyv8m2O2avpr8?=
 =?us-ascii?Q?DRw0ZKvDEQOSMmOmICEavmFhMfe2rnpvo8Z5cJZjTaQxzbWZsX0bop8zLpDO?=
 =?us-ascii?Q?ICbqqOZuGPcgANqSP1II6n8gRNUU0FIrBFXtIV4Qmo7QPYRrIlUOeftp1ocj?=
 =?us-ascii?Q?6aEX+ELf43kBX634oVpactgO/667RAJ5S1mvUwl5IQ+sdNA7+tV6sL+muhyA?=
 =?us-ascii?Q?Ig9jw0vTlA1CzkKq2rwUMzZ0IsfrgSN1shJuoQ4etaQTICewfNBExGdWTA9t?=
 =?us-ascii?Q?E2fRAEAXRFCjG+npMEzdRefPDCLLKuzaWo0ry03zLZL/jTDnQaEH3SC+0VMm?=
 =?us-ascii?Q?io/3wGq0+vIzxMWe3cmc/QQEzPFjo0MBclHgJFE3Tyofb1BJeRPaxZZsFgOs?=
 =?us-ascii?Q?F89jBVlsOxaHxbluM8DDypAoB+SVflr7EafS+mXF+sPuczr9PKymUAdH8it0?=
 =?us-ascii?Q?jTd3t1+HJZL6/gQ1nEumL6T11yVMYpJhcnWkX24hcdqTf0QC4quGgDXJ663w?=
 =?us-ascii?Q?GzlUPzU5JPF2za5e+3UtGuSvTiphKxxGB00OamSwf39I2Zn7d8wFfHuPRjtR?=
 =?us-ascii?Q?RrejhfjUi/kNM85d7M2w8wUOwylDVVsrvEXQ5az2SCmxF1Uev9DtWNMuhUC8?=
 =?us-ascii?Q?Ka722vJYfkCa9gycTqBPSfzRhF+w7x+cTDRAoTGyVfOFHxys9gA36EKVohqC?=
 =?us-ascii?Q?oCZLaPa8bz5ULKJzxJEQVyYNiBNegFf95k7xOfx3rQLh+1BGVCAP/EZ7FWwg?=
 =?us-ascii?Q?LG4qL/Ig9AxN4MtZB18SSAV/6hUJqaQknUDZr3DWr+h1miiYDL8OcEskO/1i?=
 =?us-ascii?Q?a5Y4rAA2t9lIb9VtY23CB3XgAcqkgrFu4dnxnsz7mLTpgTLruSMiIUuFkaVL?=
 =?us-ascii?Q?8wngX60QO66PveB2kZOqcB4Z2ie8JYKpO6cPgb6tUG2EdA3pFw0dgye0KeBA?=
 =?us-ascii?Q?FHBY61YznoUCTIB+URzZ580gPp3g053R87cehEzaN2ij8dNaZWrL2MqRBSZG?=
 =?us-ascii?Q?2CIVKic4onMDrwJ5lTT2DSSWGm+tb1GDNC/gVHF8PSE8v/Tgv14cgkc3Esmo?=
 =?us-ascii?Q?DKLeChg3j8rQ/XUNEhrMsNqe6DKkUyGgHBbqO3cosH57Hq4UkL/JtWjmPVhb?=
 =?us-ascii?Q?Iwp9zI8sokp9//xrsenHgcxmATUjKOgiaoSikV1q6qAEKVNVYSxroxEjh2oI?=
 =?us-ascii?Q?ZNkCwax4p2cfBehlfMibshMjDFsZrwNf8mpL+LpkrjqgF+ZzVRNpAfl3/v5m?=
 =?us-ascii?Q?sVW1Apbg301/D6X7EaQRFIc2ETw0mvAjEspahsU4/0Sy/FUfJRSbOj48MeBP?=
 =?us-ascii?Q?wgWImFyaCIvNE6JQj9qiNG1GSN7T9qt4aay3rNINn4CzupIuCaBdWdZrbT5T?=
 =?us-ascii?Q?A70FElVZkyWdY/wyYesZW4LSF6ntDZr4B2xyJ3Sp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd5b181-0263-4496-5402-08dba3f8aab8
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:41.7431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TOVGUd4pTUinXgJkTrPziIS6nf9ReGkQLBPp97BqZsp7VdfNUTMuECaWQ8WwCrXx
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
 drivers/iommu/mtk_iommu.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 640275873a271e..164f9759e1c039 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -777,6 +777,28 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	return ret;
 }
 
+static int mtk_iommu_identity_attach(struct iommu_domain *identity_domain,
+				     struct device *dev)
+{
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
+
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	mtk_iommu_config(data, dev, false, 0);
+	return 0;
+}
+
+static struct iommu_domain_ops mtk_iommu_identity_ops = {
+	.attach_dev = mtk_iommu_identity_attach,
+};
+
+static struct iommu_domain mtk_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &mtk_iommu_identity_ops,
+};
+
 static int mtk_iommu_map(struct iommu_domain *domain, unsigned long iova,
 			 phys_addr_t paddr, size_t pgsize, size_t pgcount,
 			 int prot, gfp_t gfp, size_t *mapped)
@@ -996,6 +1018,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 }
 
 static const struct iommu_ops mtk_iommu_ops = {
+	.identity_domain = &mtk_iommu_identity_domain,
 	.domain_alloc	= mtk_iommu_domain_alloc,
 	.probe_device	= mtk_iommu_probe_device,
 	.release_device	= mtk_iommu_release_device,
-- 
2.41.0

