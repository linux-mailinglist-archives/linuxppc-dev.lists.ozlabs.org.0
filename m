Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EE376DC79
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:17:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aIwzqC9A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGTtc6NGQz3cWM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:17:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=aIwzqC9A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::61f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThm26z8z30FW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8QPix9bAREJfygh16yFoe/yRuP85pyQ6mJSoaRl6vr1z/GhijtMCIr81KmWJgrr1q5rq6Njok29fCl4iS0v0aD1/G74waOiuNN5LnlQffIg3AF0unADULZPIztdb97gq6GkPIskS+BwcoOi6GEi2Sez87GeqfeipoTVGuSkKsUw7s37tlLmSvYbuA3iNe/D3wLnDGTwn8S4F2Z6iZAjeAvXsYmE3GLXd62K5jBJdFNleAf900pWpREBzSFqNI3bIY1N/Ua33Yk+6dMrLEOe75OvSpd5c13FYt50oo0FlwmGlwjp7vWxVCemO5MR4A6JpzaHSTF8R+HRBeC7LPvf9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHnIih7z1NsYVt0Tt2cxqsqWFhB4lKuFjuoGFmx4KEU=;
 b=Vheo70njVrparIqjmPSP1h6U1iLhUgXw+fkm+y/nHA2aJl1hKSsH9ExkrZ57/tfEf8oEEBB4iqUxxsz8VwliUxSVDnrVvc+qoDQ797Mq9fNoAjq7Y/IPyBl7aDtrraau572FhNs28QYvH89f4/F8BBzb/rkSmLIchb5LojRBTKqAWs3vw+dFmEkT8mkjrU0z01FzNcRqhXLfEhiMEIaOO2bRpYg63z1qU475//URMeNzicrib6FjDxLNMOPmgyjDdPvqYGsRHteXgPckJoWccpvqAaJfEJt6V/jr1LZ1tj/O4DjtEIOpXoVi9UgMK1fhQXd+mM0Po7UtYvwh1h3tng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHnIih7z1NsYVt0Tt2cxqsqWFhB4lKuFjuoGFmx4KEU=;
 b=aIwzqC9AVGZBHlRUBWZuYACYORVOmyfcFRXiKlEDM7p+Mh9gCHt67yDf7fyUaPgaSxRXXDRzIq8+AoP88vspGcNDUlq5iWwGDGe1Gpn2NsgihWF0pS10+k7QsV/qU8my937FmSk78HlfooiMswHZ3Hx/s0sE5v2i0o4xFtb44TSPygreegpL2nqRZjYFqGvdFAj5ahpQG/DcuNnk4iobWIEKl5CK8hFrfs+dyDH8Yc3XqaKRbZB9bOlhwKJptPiqcu3KQu3axeajSMlqI9bx+BWOBDysha7NDxiCaisA5uPVf28QnVCbFxSXyeCTzJaMdTM0dsG0ZlWr1JZme7gETg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:08:18 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:18 +0000
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
Subject: [PATCH v6 17/25] iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Wed,  2 Aug 2023 21:08:04 -0300
Message-ID: <17-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0292.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::27) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: db21c8dd-34cc-4330-cbe8-08db93b5bbaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	LrKhc6q39mImebtkpZmcn5qo5skn7GeKMXmPTTiaBfEnUaaS5mW4qYKeTWCeVh4BYobeeFpalr7JRoJJB14fG9vfFGecmg2drX08UsR0nf94mbgVeFMitJxyMb+ywnjlStE7iimoPM9lHxOzeG4CM4Mbq6gf07PS3HT9jfVa2BOU+EEniVz1JdDqDuSHc1iN73g/LILIlkGsSbPFJ2BtuMWxp8yiGcYXg/Qo6mfxIx2IoD51RZe9YDRx3yFbzKBRCNVXcG3d6tJLiU+0ACa5zbGqEQLTJziHwLV7hV3vV0qhNr4dYG1hUSBk3KqJwnuUAoNzYC0y+soT46ZZyYe768Ds4D3FEnjHGrZ5QOAfzaSeXuIkj7iotI0K21eUmuLPOXZBCb4J53zGJ1i1iyV+EFvxwL/oPgUJtHhqdGshBKsCkkOnMTvQgD0LlttBO/75N0/6kd3DShpBJ6reboyhVJqiQAzrHopWK7IT+XiqFj4hZKEK12poxwg+FSZtBWj8KLv9TB2c/iwdn6RZJosQAuQeilEpQ1BUpr7RHCk9vb34kkmk+NU4CydAkqXMKNnsdXAv5IlN/SAoI2e60+iazT0t3O4kfL/wHFD3Eiz8HoI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(110136005)(6512007)(54906003)(6486002)(6666004)(921005)(478600001)(38100700002)(41300700001)(5660300002)(316002)(66476007)(66946007)(8676002)(4326008)(8936002)(66556008)(2616005)(83380400001)(7406005)(26005)(107886003)(186003)(6506007)(7416002)(86362001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Coz0fTy5/bn7Mn7T9bfbVgVot+BJWoxxzCPm48J8NilatgbsGkndgzRV+3gW?=
 =?us-ascii?Q?BOiicbhO3sauwI/KsNRFUPn3CBWn6OQrDxxe4ZLmGCVKcHFjZzZWyxvO/1Ul?=
 =?us-ascii?Q?ds4T+w24+0Kgz5BQimehKEUGtxLEMjCHt6Pc16m47oVSpPCtQwjQqHLfggrK?=
 =?us-ascii?Q?cH8rKHBb/d+l9BZQiktBL8dmhHwMQXYW0DdxPoqQO3Qd5if0Xik6v8ANtkWf?=
 =?us-ascii?Q?JZwLwQkfIUrq4mNuw/0sGU9RtcP4klfOTl/Nfld0BPxBJMZF4c9BDSP5Zcmw?=
 =?us-ascii?Q?gmH0TKY71nDRXIN3lScevv/lYP25HC/g1eqswveVJ4bPK265vaMK/bTHNK5C?=
 =?us-ascii?Q?HUghxc153sCo7QNJ3MkheAJAw18sbgoXqrJeFVXBYx+g046RPpKOVfqhQgIE?=
 =?us-ascii?Q?POaiOZXFoOjj2Vg/OXtG0KHiE1FJqY+yvm6FQDIIseL/kCW7rmRvH5g/aVnP?=
 =?us-ascii?Q?IpMGXI/v/iF0NACxXEixC1mnd/YbdCiBQJE16FMHnbPLVeyYikEOd2B+25UW?=
 =?us-ascii?Q?CzZcqv3sGr8Dh0WqUAVMi5L5EadYDlblYnlP6OcpACJM264Ex+jMpDErIpOE?=
 =?us-ascii?Q?HXTy12x+riLATLV9jFuoc8AS8kYkD4dS9bEOAFA6PYi4bcA3BwUa5Pc1PgfF?=
 =?us-ascii?Q?iSE5KUToxaXh92ius9hEvgi8obThFoYhZjbbl7ohzGmTq38n9uLH8jEZb54W?=
 =?us-ascii?Q?KLAEVyq2zX8v+3qzbUAnDoKbp0soJVeCgBvXMB1kBQmmZ8G/Uu6EKywTgBMA?=
 =?us-ascii?Q?1FeVflEj+n0ehXglbSi3+8VWuB4o0y9ghT9zQvyXDIsUx+SGW+GKk5JzGAw1?=
 =?us-ascii?Q?spwhXDawu5Vh2R66B+bjIoICqVodhVgxS1kWYHusEfT+cq2aII32GS7QkQFb?=
 =?us-ascii?Q?gH7cJhOZJEyzrnyOSUxNYBDjmDJMpL0ouLueJH8ViVShY2eZi55JL9MrS/EG?=
 =?us-ascii?Q?hEUcShcI31LsLjpyPVlz6srDPr+SVRGSE7cRq5a4RS1BJuig8vx96a4dMsKS?=
 =?us-ascii?Q?badIrxJHOEpqSsduFJgpD1HmrX91CWrh1rxddJ/FlJca5TEOu1cj2prCtXpj?=
 =?us-ascii?Q?fHAFt+3s3jm5dHzfEazpCT6lNCBspiGlbSiyHYnyl2D6qAE7waGR95PV1ifq?=
 =?us-ascii?Q?b5LKLZqiJF1XYPdqIFY5yWxQWPHFW810iho/ShHM5ByvBIWBGAsjYO6WjUCJ?=
 =?us-ascii?Q?bSjhtDC9HLIshyoda0o2AIO0QB4Wszeettssx/bj5xn8iCld5XWPxo3/S384?=
 =?us-ascii?Q?L5SVNcOVQpQhFyK8mzVz5XLZSiOQpxHXGX6DwCVaaXFpbQ/FviafwM4hwfnY?=
 =?us-ascii?Q?+FMxm/jnZ7o9jTj47UU+iB9VFeft7jJnz7wLsr2cLceldS/DtCylydDN7OVS?=
 =?us-ascii?Q?2zxZkWQYCW6CDokE31ToGhD5KTUfCnrKZRsINeokNz2KBzayhGiSWD9edyMj?=
 =?us-ascii?Q?NW9vJnZuvYtq4qQSD8cGa7QOH2EQFYm7r8I0bdBv1NfMUU3ennJvPcs6Ithg?=
 =?us-ascii?Q?Rx8WSajdDxNEHXn4TZOJhyxRKB6ycBIqprXihEo1BVnQaaVTw3pPKKWo0Q5p?=
 =?us-ascii?Q?Iay5vsTPFjdbibxOJ3b27MIlItCisCX/J2oyWDNN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db21c8dd-34cc-4330-cbe8-08db93b5bbaf
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:15.3235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cS2Wd8juQ8ichQVgsL82fAobHlP60hgJZojXdSqyBL2IILwh7VkMzub6UstcgPC+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5809
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
2.41.0

