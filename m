Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0875F72A419
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:09:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdBxD5Y1Cz3fWY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:09:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bMBF32L4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::62b; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bMBF32L4;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBfz4DqKz3f8q
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CVHGT8nYRKuvHLh3U9XNZUJt8IR1tJrtjX/B1UtxCSYq5mRXvKgIXVk35ICFUJnGe6fggOHnDn+kMooAL00lbGSj00tQ5PDwuvECmD34law3eG2F4rGxXoLk5/hfh1JB//61T3JRzXgoZNuPpRC/gMkphNnRssRQMoq2XTHizCqlqKAP98GWyc4cZSO9w2iG//bCL2ABb5FBIipq+dqp13fgEHsG8/QZ6WnsPaX9I3UvCAjPbilQsLetIWRRro78kv3/s20RP0q6xK0dLs4jW1nuG53oYLQQDwZByM41eyEhSXMQj1A2LLaMDQ+tSmKV1mpdZlUpw+rhwWHPOMDSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKNaZwKctNyYbRBuZB+xdODMOwwW/nmEM/YaUXrFqNI=;
 b=h0wx72RqqvSLBaCJ3dorWdFv0lQzBmf5F1OyOrQEdcW7AUn6k/k+qW8WQU13dNyd6j5ZBVciNj9JQNaQ1W4SUGW4xXa+87szoOluuxmn3h9jUxa0P705N+qZ8+xGzQA7L/f2I07WBo9ERpfmfqYS4KLckXfRAGYKhnrW2qH09RTTMsPiAddOo31SfAo+bUase9MuIgCRwlF4113kvurYa35uOI9H50fRDHXy6umHCqaF3VOmPcQol3k2W9y5KYfaI0RHz8+u+q3A9tUqt7GlK8B5HcEqglHXRRczbsW62mzxomBlPkfXnJgHG5bqj1Zjs883jzmQ65LmyKRQDYW8Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKNaZwKctNyYbRBuZB+xdODMOwwW/nmEM/YaUXrFqNI=;
 b=bMBF32L423d19120rb6u5LRxm+r2QPVdpaA2lylSPxCuAV3msczT/q+bhJfLByRHB/s+5RgWR/0bPkv2nj9h8aAuxptSeh3DwQRblBn2MAYhVC5Ies5X/mCBPlaV+h8eq5aQ1CLx541zy1m7nj2BSfVeYiCHQTRyceEWzY64tcnsnY/ntnE1HWfZpmH0fRRPeHKnEtOXSpPLj6FtjB0yRuMAgWxnRKR2wqF9suTYLBhiDgmTJ4ViqbmxuIsHykeLRqqd5Rgk6XpVy6LbULuSXOxaYKlW3oMJsLTILagDcFmNl+h2Nb++fN463C1XabVG5+7jvbOE8QwGe6gt0oF2DQ==
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
Subject: [PATCH v3 19/25] iommu/mtk_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Fri,  9 Jun 2023 16:56:07 -0300
Message-Id: <19-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0379.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::24) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: cc2108ec-7028-4271-6267-08db6923993e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	00oGCDwASLtfRkMx+O0VHOY6cgwuctTFEbT5bvZOs7s5zty/ma6+GZrc0/eQqbsvlrWycIxB33yb7pacWK4/FUhU7sX1dQVLmWkdNqlNdxaX+qRBrnln8n8XPcgCt3V6TLR2bfkMiEoUUT195QLdOdGFrFXuy1KF5UjTZJnIwfQjImdp2GSRo0RaU2iaxnPmlvRbhFQ6dDIvU9fhl8OHPIJ8fYU+wia78Qp40QkDCMvSZcPG56/Hm/aHjkqT9vLYEQ8nj1X53i02K9woMjaywpSyBUW4ooFNOnH+RaWDewOjRXzCjqfg2XvucV27gSrrsAGOAF0yf48VfsOn71Tg9hXgx9qEfVE2Raq/nYkwlJSSl8lTBNNBzUV03jVifflNBgbIvezTEmsErPruJF9tJURVC3yAyReg1OhVZBJZ7sBghS97QKHraaf5Dj2Do2SbmNK3Ki3lAE0WOSNVwcw6ZKfklwV43zj2/N5g6dm7czI2gFRO43fchJrgzmM7vpw5iS+yrhMZh1E8q8s9GFIr64LRWDBOSZJwxzPAMlJhUwDZ00/tp3FGzQ6CTmZPVU3nI1LKilRKOFqY6YulVkC1kiyAtNW0FOFlNcv+l1kx/pQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199021)(83380400001)(7416002)(7406005)(110136005)(478600001)(8676002)(8936002)(4326008)(86362001)(66476007)(66946007)(921005)(66556008)(5660300002)(38100700002)(41300700001)(316002)(6666004)(6486002)(36756003)(2906002)(54906003)(6512007)(107886003)(186003)(26005)(6506007)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?hvh/cn4TFtO9rbj2biQhs41HjQ276LzJuSKSrEs6uL8PcobCrKIGhVqgbH7s?=
 =?us-ascii?Q?2zrk4HDDO9xv9mYwl+JOBLp4CV/v7bDf/a8Hrk2n1PTS0be2mmYiamG9rlv/?=
 =?us-ascii?Q?OB6edATqQQ3CMxER2f6x2DPvWgZvLcwu9B6ZwcyXAV4CDDl8wCuUFhHKZ/4x?=
 =?us-ascii?Q?RmDC65m+noGL6W9/yoM7LTJswNgrT/Lc0pKICZsYQ2yKvX65lSOsoejl87pY?=
 =?us-ascii?Q?mrcHk9ip7a1O3RZWMUiS3mO0qa4fd8Wd0jeOyNYcT2otzYn7z4nWONJCaz7H?=
 =?us-ascii?Q?6L5L5x/yLcZYYBcofpk8j72hu+7EW4JaOvQQH3tUh7FN0YnMin++7hb0wDU9?=
 =?us-ascii?Q?hBcY1jhoai94Z3CW2rhUEFMkLpSI+AaTTnY8eGyd0our+j7OSniUiaQQPKl4?=
 =?us-ascii?Q?ZBx4iK+EXuiIDJsVr9u16C+X0q0ILSKNUsF0J+jnXNCvJmdwN9XDKvnZihBe?=
 =?us-ascii?Q?w3PwZPTpCh/hrsDr+zwNIGuBmcIHeb7EPFZCZ+NTDsqh5BqqXGDvvBZRLIBg?=
 =?us-ascii?Q?m/njqnbuduGlvc8pz1oQp1uvQNg01i7H5M9BC+U3aax2jISOI3of0H2ABgN9?=
 =?us-ascii?Q?JYmVSN2yjrG0cnGsOm1Dz5KwLbjcYuew2FEo4oRpB43ibTgt/jqtehYTYTOq?=
 =?us-ascii?Q?3rlyBFN3tHmbvPWAZqd5O8cHdYI9JcYO91Nk9hLdQa0mAFpTYAEgj0+q+pkq?=
 =?us-ascii?Q?F14JzZX59E/dsRAOzf9RfM62jeCbIRBFatCD/LuP0L8FE0tgs+LUxHfMzUY9?=
 =?us-ascii?Q?HBprPHzUDRcA97pc/ECxJUA90+WBEmJ9q5E0Cc0tlJFGatzad5Ti2s0M3hU4?=
 =?us-ascii?Q?LjKxuh0eNU8fHTYupCQIUH/wz1thhaTOGe65Tv6/F9ZnxV/60CfefShKDcC2?=
 =?us-ascii?Q?iCe46w2e2DWkjdExjJ/Jo7VnXG+1/L9xLQO6MWOrioj/IOQTQsVHKScf09UX?=
 =?us-ascii?Q?Znaln9LsM4WuXUMoOR/X4eDj6hQcyHW0Iz197OcKhtU2Uhju03Du308h04Dz?=
 =?us-ascii?Q?NqCVZbecdIMCZkWXIiQp76YrSanUsE1v2sLdsYuKnq3lecH8Lbz2aRk2q05z?=
 =?us-ascii?Q?xAg3rsOP98pBATZaJR2pzx0oMv1p9Sroa54e9gCJjj66yZ4cfLfvOS/XnHih?=
 =?us-ascii?Q?qi5DroGELCiHUYKFoFe/yF6uig2t/dySCzRsVv3CCC59E51wIOO1wSj0zRUZ?=
 =?us-ascii?Q?5l42t7lQIsGghQpY1L5W1qrIss/Wf9MQgx2n5jxIGZx1wh19IYZ6+xEzF2n0?=
 =?us-ascii?Q?t5iyGs+wQdVrNiclawNSEsLR2GD2460LYi240PtrntHZwF+V9iWg8gwMBBKV?=
 =?us-ascii?Q?dAX1E9qZmrHlaw/aPzV7jCtAVZFwwTB3+opgSsbFrfhpiTjX1U+2mTDyKLvk?=
 =?us-ascii?Q?uY1TJdsXPDzePg5MZZqajeLZVUDr6Js4NGXfZuyXGHl8OGkITjF37Qq9/juJ?=
 =?us-ascii?Q?+Nk5xFLR3IesOyFeqBEbaO9VvFfsRufAE+wPBUy8RmoBEyYMlkJjA++cbx93?=
 =?us-ascii?Q?kDLZvmBu2Yg0+FXi1DSq8i9THq0SQRg0rNgNBy2Bf5Emu1yQw8ErVl866nDz?=
 =?us-ascii?Q?whDDJ2Du2OPTzqr5w7gMltkAji3yodo3C/SubN72?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc2108ec-7028-4271-6267-08db6923993e
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:22.0757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JEPosMkPTtTOgKSQCu0q3P3dn5UbdNfOKe1dQwUp/ycc915mrTMNb2q8tDCWo+Oj
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
 drivers/iommu/mtk_iommu.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index e93906d6e112e8..fdb7f5162b1d64 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -753,6 +753,28 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
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
@@ -972,6 +994,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 }
 
 static const struct iommu_ops mtk_iommu_ops = {
+	.identity_domain = &mtk_iommu_identity_domain,
 	.domain_alloc	= mtk_iommu_domain_alloc,
 	.probe_device	= mtk_iommu_probe_device,
 	.release_device	= mtk_iommu_release_device,
-- 
2.40.1

