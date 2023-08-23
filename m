Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0821785DEE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 18:54:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sTfylYuK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWC4Q675Mz3cnS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 02:54:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sTfylYuK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::619; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwj5ry6z3c2L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGa/Y8+BQotKotiXLFYYCZ2QQP9OeZ+r8ZabqSmEWa4rz5W02g4SAmcAJ61W4kahzMUl1gxUYXAIz18OuwmHk2z8kc8099rszTV6wIpn3fW4xxbv+ux8VnMZVGDSa4woAWe/Hf/6xrSA+K/8a8srx+ivHs/gusY+jgqAsjqWfltovMpN/hRBBR5cmWJCZanYftM4+JMyDSlMkNhGsh1XXuu0p2zqvGdxjr3NoUFD+WAz8ErfCNpdXswvqYOdgenLAt+9jwyFeQA9K6hLj7Danx1PhWd2gXUp2Xuz8H7RaCDh+VQqMqtZfmPVS9WCY+JjOdUbTGnV2V9DKSfER4pv9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mhu9smyZC90FGi0OLBVallHaWKkVLmn3ppnRNfJKIQ=;
 b=GFm5ljFKxMSlWs/dspU+KzL8SIvboCc5BhOhTf1q+ZBFk//Ctr+J3tAyufHhvSe9ucZvDEe1+A7EHoL90lKKH3yRNOKZSWsdzIioLIT2a7QZIiorspzDpH60iAG7jRaZ4NahYzaeQke8iaF/u4KGgFx1A4RBbJZ/G3uUpzwMFsOyo9sb0UoAKQ17AqW7O/OEzbhQAdMJe9igIdr0GH2oQn1871BXKFn+8OEv0hGNZ1x4kqiHr4J+1ZNPvHsguhLD1XKq2l1hj4fPVX5CNQ781kfvC69C2mReGM/+KMp9c61dHp3Uv1NFHbRrUFhbfTdc6bo3SYItW2lkeSE64Z3j0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mhu9smyZC90FGi0OLBVallHaWKkVLmn3ppnRNfJKIQ=;
 b=sTfylYuKTKH2M/cM0xLzzQ/OGjk63sJg3qYrojnMD71pedqeiBixVR5twBe07fNce4jnLjLcPjcUtKTHTk+hCDsbTZ+bjL9YL2H5D6DKlFC2L76Tb0i8wqnjExwo/9zIHo5TRQk1nK9JoPLw/Tb0ikXICTGGaLYjU0EAZKnbMy0Yze/mX9C/6JGdVg4jtfi8DmsgAP1XgApEdfmID/fd9bbBLDhCLA8i/aRB+YFoBSno0iHEv8LAq9UcXkrTDew4rU0V9zL2qYQi7GWN9fjtAU4VIWdpqJ0+PoiQKYRz0AKqIpbKWL1OPfGXZ7DoD3ljgeVzmR8OdPVW+or0KaJe8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:48 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:48 +0000
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
Subject: [PATCH v7 14/24] iommu/msm: Implement an IDENTITY domain
Date: Wed, 23 Aug 2023 13:47:28 -0300
Message-ID: <14-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR14CA0032.namprd14.prod.outlook.com
 (2603:10b6:610:56::12) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: b787c117-9f88-4f0b-09e7-08dba3f8ab58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/KWJw9yfGyV6iVaB+xk3yE3LEP+imonLMB4m2Zl2nFww/XYMDzGYvS6f/adK8Q6XHkogchR6sEitmLSS/xryR9ZVT1FXCQxriJRs4hH/X51M2wEZ6GvxqchPVgDHDZpRtfqlw2vqXO/u+I9HKQUZu1N1DHCB8IpnqqTlhbHKHAzPF1SWOADwU+4JP3/1cueS68Xh/GfWd1/OaJ1lRKbKMjXmYG6Kr7wsnqZJx9RDsLeYCDmWi6YmHuIT2MkhSayWvXZE7flUlriu9kT24IWLHyM1Kfe9S0HD+vvyHDwMcBHdlhw9zNCIkLBAfIUjQgmycHXO1q49EKv8TUnjBjouWd7+Ic92YMOxjLO/mK8QC5bdU16Xc6nAzTp++mQAtoq0HN4TgHQR1sF+tQfToNbxUTZ5duortNx3bwVs42ZZHqmtz1jM1fW2XSpVv69792DUNKRwqQuijw44c3zczVBPZk537Njyg5dSv0hiwyUcTb+ysDTwtcntxGw0QNhWaV4xjRDjXZD6sgNBPDqZmNC65cT06HxO8PFpWvBUt+BtriuQDaUdQXPHG+Teh0q1MAWE4egf5iL5l0T8L4aKPYCrvCcttyZdd+sSuktNqYuI1GY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?RE6UG5K+mBxII4ueiO2HcHjR0MZqHAWpgaxpyQrE4vpaZuguVAkXegfEK0lm?=
 =?us-ascii?Q?0rcMcMwRvDSI6+/DwN6OOfNzYu94v3nJpg2nrlKa6U2tgWU37l5ywKhb1dc+?=
 =?us-ascii?Q?Sk8ucnhzDvpAX10SpbFF/Fkl8vmOvT1T2seUVJ1b0ZxMBmxiZ4fuKOvkiXvE?=
 =?us-ascii?Q?f4Xa3NM/MfYwgRh1CW0kbhcrPQkn6e3TP78TxIvQKLDO3FilOMi6RIVmQAfz?=
 =?us-ascii?Q?laPKC3zSum2Jrl2nNTuw92/E0GFal6Wn8IDng8ZrL/7S9KpCwGTS/qeNRkZh?=
 =?us-ascii?Q?2WtsDefPlZmE7wYnA/nlXZrOd4fxTPm5IVDBPqyqTNqRwKqKUDFbM9xCIEDE?=
 =?us-ascii?Q?vAxcCDog170mBYrht6dc7uhKuqp17QLd99W7/7sYi7+fjiaf/JM5nKc3Jktx?=
 =?us-ascii?Q?y8bZSy+Qa8W9pFCJF71VhEOPsfwh1mON4ZW2AjHlHLyZ4A22rSlwO/3hjtjF?=
 =?us-ascii?Q?1Wgcg2br2XO2sIsxTwGjJ5sVMgr1yz4PUa6ieLP4cLewKBYDEpQwDMXBNcAO?=
 =?us-ascii?Q?x2c3TbcMgrPWaDJZkUy9MFRrMBQH1OECcldeWNGEsIuqJzjb85o3JuNGT2Pv?=
 =?us-ascii?Q?7NXKkYkDuXxumunqVmjQHug221EpxhhBwSAYMVeGzCZV8KmKKVAMaTr767+M?=
 =?us-ascii?Q?BJV1YrCLBu8si3A13/ehkD7/QzKndE2QBzfPU4u/xpkkKjHxYtO+veJRm8zM?=
 =?us-ascii?Q?BcEoty7MmewCsA6Uolu7dg8gDYxmvpa+idcPjTzeif3pn0Fw1KQ75o6IXe6l?=
 =?us-ascii?Q?6mclza9IlYnUri1McUG3e/UPzllJYnJGp6UsuoTDilvoWzyq1BvyZ1JjGNQl?=
 =?us-ascii?Q?kintlQ53z+dGPH59ql0LIaTxGgJrkVk1dDLsRZKN9/Zps7nIbTKrJehKfmL+?=
 =?us-ascii?Q?pDURt9w/s0fhNuFyrLZNZ9bwadTEyBoR5Zby8OUAfPmOsbrMTjIzSufnJ3UI?=
 =?us-ascii?Q?M5YONRxulBJPk0BEG/u2w2eKICmz/XQ+q9cgxY7t9/szHm0pZHbUeRPrpX0v?=
 =?us-ascii?Q?TSikcWya+NxmMs7j/he+2onGO1cv5Ddrr+nIB/4kU7fPZCpiW8S+Lowpywxf?=
 =?us-ascii?Q?JCFnm3tP777SKVutYhvb/YulEi1GRzUPDvLr+TRXvZUu1QjaDFEoVOaClDDi?=
 =?us-ascii?Q?oRNEaSmq3A9rq9TqKVvoukageKutKpMsjv6vbcSZG/nxaXhWOpp/nP9TnmbL?=
 =?us-ascii?Q?YEwhMYncRRPJ9/mVG3g7r0TwANQBtbUL3srCC92nNKKzGgegICu7ShKD7qJJ?=
 =?us-ascii?Q?H+n9AAw/TJ0UsEVhHGHQ0PZgCV1AKhniUZOEjvX1bHbjzYvUNNjfJQXnX4uP?=
 =?us-ascii?Q?tFz1fFqrI6dCeygCxlvzYB/2/vuw63XRXN2x5pFAO6HCBlujP8+ilsTrs6fc?=
 =?us-ascii?Q?WWQpYXYITJHRLJesAD+J4F+RQsLoktaILrt359WzmRv0GMM75SCBcjO+XNLL?=
 =?us-ascii?Q?DATehhBnUstvqyyFxbMfIYD4s1nK3OoRDN8tppY5+nXkhOvvNV1dA2PWp/Yb?=
 =?us-ascii?Q?UQQ+M7HmHTgWYf8I696VSKXmali0CI+zPU/k/olHulTT1sgI4iML1C1lgxQL?=
 =?us-ascii?Q?tR0Xvb3Bb1T4sf4ZWkeeenUAtwphgq29LElJnv8v?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b787c117-9f88-4f0b-09e7-08dba3f8ab58
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:42.8913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0uCqYQgewyVlzMOrj/UwNb9X6nNkRO2UF+44sw7rw2O+crFplGUPoNQhnYu+SisQ
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

What msm does during msm_iommu_set_platform_dma() is actually putting the
iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
compiled on ARM64 either. Most likely it is fine to support dma-iommu.c

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/msm_iommu.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 79d89bad5132b7..26ed81cfeee897 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -443,15 +443,20 @@ static int msm_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	return ret;
 }
 
-static void msm_iommu_set_platform_dma(struct device *dev)
+static int msm_iommu_identity_attach(struct iommu_domain *identity_domain,
+				     struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct msm_priv *priv = to_msm_priv(domain);
+	struct msm_priv *priv;
 	unsigned long flags;
 	struct msm_iommu_dev *iommu;
 	struct msm_iommu_ctx_dev *master;
-	int ret;
+	int ret = 0;
 
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	priv = to_msm_priv(domain);
 	free_io_pgtable_ops(priv->iop);
 
 	spin_lock_irqsave(&msm_iommu_lock, flags);
@@ -468,8 +473,18 @@ static void msm_iommu_set_platform_dma(struct device *dev)
 	}
 fail:
 	spin_unlock_irqrestore(&msm_iommu_lock, flags);
+	return ret;
 }
 
+static struct iommu_domain_ops msm_iommu_identity_ops = {
+	.attach_dev = msm_iommu_identity_attach,
+};
+
+static struct iommu_domain msm_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &msm_iommu_identity_ops,
+};
+
 static int msm_iommu_map(struct iommu_domain *domain, unsigned long iova,
 			 phys_addr_t pa, size_t pgsize, size_t pgcount,
 			 int prot, gfp_t gfp, size_t *mapped)
@@ -675,10 +690,10 @@ irqreturn_t msm_iommu_fault_handler(int irq, void *dev_id)
 }
 
 static struct iommu_ops msm_iommu_ops = {
+	.identity_domain = &msm_iommu_identity_domain,
 	.domain_alloc = msm_iommu_domain_alloc,
 	.probe_device = msm_iommu_probe_device,
 	.device_group = generic_device_group,
-	.set_platform_dma_ops = msm_iommu_set_platform_dma,
 	.pgsize_bitmap = MSM_IOMMU_PGSIZES,
 	.of_xlate = qcom_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.41.0

