Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA3D73398A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:19:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ONxIOThk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTVM2R1dz3cYX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:19:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ONxIOThk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::625; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT8F1nNLz3bnv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VBlHn2HR1tj/ifcc4ASOiHLh4XYL9DuonDJXWYv+mVB5BbSgqdg21l2K22Jscv9YM+94j9mNe7OdkTk9e4sUK3+b3WnjYYTJcOYI59GAixvuKTPcNNiEang7bKDW8gNeflasX4esQQ7OIsPy4tu/h4lVrKcvugAxlb6VOLeMElmVSVn7CAFo25LeLaAEYJbeB3aZIPFvkHJ+3HNockpBCLNBawv1MzQcOX115wqET+YHTpMuZ+7LQziyskj9hHy4xK/rGc6gdjme+VqiQB6TCZKo/3qTtdqzp1EUCwQDZcXcBoYgov7uuVl87fC3whELOWWL1BKdk3wCTClM3TgaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFI6YlGa/rRO/LUho1t6NDgB0fD4aHQKfGv6pVqsJA0=;
 b=P3NWaJQFC3z2TE3kIOVrDQJM2Al9+0dkBEhFQ69EnNvWbTZdCRr5NDDZHflzMwflC/KNo8+fxoJcktPZ0hekLxDgkDBglWM+0XXil3Qo1EQ99UuLqHgyuwZwG+gqF4BbouGDSrtfjohmbnslUmL430Tv+c+1MlqQ/qR0FhX8RO0XvNEbsXj7G7C8NsI902jaLnsQNg9ZcNqExImYxbhMdeVkd8U7uH3YGl2+ibQtKS4pnaAo0gC93LbA0ETfijSn3zAiF/WyVYoplhzxEslxpgaRpnFRBwnMWtgY6PLIC6Lj9bXFKOKK+6A4hmExhUSDBLulZ+SHJGPdaAas8yyNlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFI6YlGa/rRO/LUho1t6NDgB0fD4aHQKfGv6pVqsJA0=;
 b=ONxIOThkM3E7AW4ZgSPhF46OtqmQHNTBKtgX8n75TLElY8Rj2VgUYBc2Ce+VdBBF0yEUpxJSTorZpoMUm64LHRGFdr4hNX/qSC4CxUZP6gEcQMGV7Uw+eV0Op6V0No85AixpgaLs4D3HNwoXFvKh8zHf9chmUoMca86/fv9ELguGMIunqOu4en1kaZWS9SEGk5geN25LqhxZFzK1zy5/s5T3hLIHz+E/Jw/CusmO+sbhk9K7UpjnE68CJX6Nw1Ek+EWMgGh8wj+qBiOpJx92h/xS8iA+XG+pNr4gaqcWh48k3cso5DRB2M0/AKTxjz2K8oNWLTX1tNGw5v8wUDyXLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 19:03:06 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:03:06 +0000
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
Subject: [PATCH v4 14/25] iommu/msm: Implement an IDENTITY domain
Date: Fri, 16 Jun 2023 16:02:43 -0300
Message-Id: <14-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0049.namprd20.prod.outlook.com
 (2603:10b6:208:235::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b1c951e-1edc-4e03-015a-08db6e9c4be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6y1OUPj2yfzpakAH9JJ1ssrLz2xtYyn6k2QkEaMDPozzAzVrBLxKYhmLu9RlMCpcBCRnRlkNid9CC1CqcQLoM4yGcuF2KIYdJNEdckQbPX6Om9oGZYwgNUa2Q86XgozUNtxGFw4gakQwkmrsJFKwnprmetjKI+R2eOnw9Aj/9VAQQMMy8UB8u74us/1kNCVATfhTGk59s8jpnK32vMiQra+BalFLUbTrxIpBj0iNGZJuEM2bgayQyFD4vUBo2YFU8J6NHV1xAfytGe8FskclIgTD5Mc8dPQTNEtPE0hejcDo/kA74UHjte/BhCBfh9jR4UHvI9YLbwZSg5vSN/rm4kucqITTlhopuC4EvHnUuVC3I/yqH2vahBZpck5cidjnIBnTQ3x2PqypgZxNSZD6wnou4E+YILmFXCtWe2IFw1ANL1eVaf0KWaUKhxv09v/eJA3+Al8lTOTCAySpkMqdOmqT9RBqtShvk11qxf0fNgyNEEczOMBd6+tS29JP0vVFgQ2XavxqIsWKHTAEU2LKWo59g5W8BLxbWcJwO5HSPunl0+s0jzRVsGNzk1VQWMWltT2okJsJ4AQkMjyTObDYmZZw9alg1dBTOzF2ls9FHxs=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(921005)(38100700002)(8676002)(8936002)(5660300002)(107886003)(66556008)(316002)(478600001)(66476007)(66946007)(4326008)(6666004)(6486002)(186003)(7416002)(6506007)(54906003)(7406005)(110136005)(41300700001)(26005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?fL2fYieiYy0mEntm6Za9cRiowu1XVA/+FtlDUiDyaRr92vcSZtHs1/wE7vl1?=
 =?us-ascii?Q?EVo+tcb96zkVy4SWbPWtcWtStD6qDFSbCZBb9dyvCpWytlx/tyK1w8YOz6cg?=
 =?us-ascii?Q?KQSMBIbBw6+KsvwDN8DruNSbb0N0uHQg8CSLgVGPs3sxlL6eO79w+h85pkgp?=
 =?us-ascii?Q?XhfQRt/vtDkathQAQ57NpgiRhCxf3LeCZle1gQDR4B2PuNT6ESgOyfQw1Rk8?=
 =?us-ascii?Q?lhcFCKmO0fxEthJLRumE165ODcf+yEVv/QIPtfx9Grb0p+SBBIt6wGFAnRvo?=
 =?us-ascii?Q?7nIW3Z6IgCEj3MEeyFjokYkJb/2RnwOfOW6atcBV+d2qir47eiTSm5NtWekO?=
 =?us-ascii?Q?KsRI++h5KANqLpxemnbdFcRT3nTs3j9eNMiNZPeKtaDFKPTjb3i8ewU2lFz9?=
 =?us-ascii?Q?niQB0AE6BstRIcccXfAHkyldiXib26QT4Hut9HCl2SSzQ6+u++W0ElYsyBIr?=
 =?us-ascii?Q?Z7yKQke/QCDu4axPaGZaObCHXA9B6COjTSjgolPejaQ+Dequd4QHrx+0mEyV?=
 =?us-ascii?Q?oTHrdeTzB25/Mt/h7jPN4zRftL/PgdAHE33UyLGtbA2WE0MeeWKAbKPBOC5A?=
 =?us-ascii?Q?o9EbnIptGnfZ9tFZnicbTJh5SEpOO7dJWytewoaIV50UiRY2I0E33s0XQKlh?=
 =?us-ascii?Q?jWgaYo2FFoguwxSZmrX8q3dzrFIAOjz2/L2HPzJjsrVxbRgoAKTfvNSMRhVy?=
 =?us-ascii?Q?fWqWOyAl2WbHbqZCRW72XnZl8a0d85XFK/nrQ5NXCnwDzUA5oY6H0HOimLLt?=
 =?us-ascii?Q?Iiv6YXHcGPWFa1GNVCMTYKtQcq+CtM4Hk2Xu5aGQKKnpBAkBdpyxEPpFaD2k?=
 =?us-ascii?Q?iJckXXWfLeMpLy/YoIfgvm5xgOTSYHU9xWIhgtFda2rYH7fa3vU+0GDfy+rb?=
 =?us-ascii?Q?1GaMmNhbOQKuqkm/i4l+Of2Tm9fNC/HWEU0lq6TLaZPf73VS9MY/nFLfae6p?=
 =?us-ascii?Q?ytwALHNW2Y0cKC408O+Kun+ZDZveH9xvRRGun2dFx88svL36DhEyCzxayHP+?=
 =?us-ascii?Q?gCYxEQEgM/0Mk7uQ5QgsDw55bd5DxUczqq7XlYnuSknQgBFagczuDSyQgNh8?=
 =?us-ascii?Q?RYZP7B8US1VzFK8Bo9eyvAGpJZzZOkXAuprm5OTGN1GYfKwP4ZBjTJtDytpT?=
 =?us-ascii?Q?zs4idzOWqHSnon2m1P3hm+BK6y2LlVPW6UEuwK8yeOb+UDNlSNfUzsbV1jFM?=
 =?us-ascii?Q?Kaz4nxOBdSBQDxFt+j1eGXZwNuztJY/8Xnxh44QZE+UDoPpZB7UU9tDcDiTD?=
 =?us-ascii?Q?dl78Q5oJH7Zd2CxjCTPjMbb7DKBWed3rjzUcBJufSO0741D0zskPo9NN45Zn?=
 =?us-ascii?Q?uOWS2wCBeNsITa5QmswTc4tbnZJ2wCe6EQBx09IIR0srimaeYbr2jhm/TTnH?=
 =?us-ascii?Q?VASxtiSqOBwrYq+96MJEwDppW15scBlNJ+3As+mCCEFsbHwRS1UNdhmd9MIk?=
 =?us-ascii?Q?XgFTPzTv4KFe+f9QnlhOgdZUvJaZ+FHdS4ffo9n9YFuGbej6PexJOCJ1PSrA?=
 =?us-ascii?Q?dAFhWXaBaLrstSUFqbEKBEazifOCNEqPt4GVdzviROw4Znm695Ub42uZf4rO?=
 =?us-ascii?Q?dlukHGc7h7RK6j3bjsoO3hIOOA8Uvbv6s9CiGC68?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b1c951e-1edc-4e03-015a-08db6e9c4be0
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:57.1430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtUi2J+xpHy+60QXEs3ROS20LkFeg1pZTqozuCSTffnsDda6RkbvJfTZ+h4Pfl3S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6051
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

What msm does during omap_iommu_set_platform_dma() is actually putting the
iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
compiled on ARM64 either. Most likely it is fine to support dma-iommu.c

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
2.40.1

