Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B93175FDE6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:37:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LpfEVfS4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nRZ0PQjz3cYW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:37:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LpfEVfS4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8c::607; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6c4x3jz2yDd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YX9TSnfvmvRfxCWuEdHc8zUkfch/BrDC1dKhjLy9eUkqBO0AR9KZal9uKpUGkQYdh1hEQAGemC89vj2zeMUAi3I4SuYtGF0e71HeGJOM72nj1zlb5GklnRZv7Xgt7w7U1WfqN5OpglAxDzOZ4WAQvZZ5UY5Afza1bA3Z9vObYjgSf+7s3d/6TthuoUZQx5LxenQFtI/7HAvq6doDR51+WZiZPzHDNvcpuwuHCgiCRqOuAjBjg0qB4hQNWWb08TPa6tBI0ZYcZhVO+9/FjAd+ChJMIhNbSBd5DxfFo17UjmOkLrXCP61egqVITPtGXYA0VxvfrjEFpkqD2mJa7yffHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8cvW84AteYGsHkKJoxDmgX1gvmm/kLqlAnWOZtGp1s=;
 b=GeltFdPGkX/WCOS+XffqKwlKAvWwZqqXE/ItZTjIyk5wF7FNSiiDdZ9MmNUUhQRitWv6Yp+2Qts1RQuwb98ccbfoqmOOpQesDTX8WDXasW1oP2P3/qdzKUg3p1fTTQ1lSaExk8znar4YL67z8XfHeRigjySFdWJ6mZRPczaCbtUIDPgqunRPuRev6EVh3qrbAe/11vn94WurxTrH95FKdFDfeAGDz0jjAWqCKj58khhj1pDnHBNbJy4Ug0woVRcwQwyQBsz+GajPJRflWvTf7j6tCs0URcWVP7q67GRbibNGMKCL5WTxWN2j2zHRqXU6TS9Wo1cqgJmV2Zymx1Xvpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8cvW84AteYGsHkKJoxDmgX1gvmm/kLqlAnWOZtGp1s=;
 b=LpfEVfS4CCoukOzM8xJUd4MN/H43CiE2ScAkR3AZnz6WeEDvrk6hAiDjtjDG9AsjYzB/izpiHOV69lTuwBQ96TneVDbZXzK7+42j9wL1inffav4jMjxxBu2pLU+snEG394RhMellZoJ/GNfCfUJXyY2hKcLH5wwUWmBrTM/omNXCuwk4C1RIeGIbpLuyL94N1CgM6+Z0NaWKeeyNqX2vpgm6jP8u4zcnzBzGAoSjXZUU+gE0hFrkxHHx3BEC0BV476682IVr/TvkdsjtUr+pPWjvqOwfz0Ri1JnxoWNg2ItwkiE0Lc1ndu477tJh5WbpHsCm0tvvQXhutIPz8O9Dxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5252.namprd12.prod.outlook.com (2603:10b6:610:d3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:23 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:23 +0000
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
Subject: [PATCH v5 20/25] iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
Date: Mon, 24 Jul 2023 14:22:10 -0300
Message-ID: <20-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P222CA0025.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::30) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: 734e32eb-36d8-4a07-f58c-08db8c6a882c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	TeIaEAqoBcSq9Ephn8WfHlvNmuPLoheQ/hwIdt4KfmNHear4svdSN6RF+9vjs2e2IYDXIubEFeSkemD9bh8fjZK6+XBsWIQrQI0Te12dqSV2aigenZV2ndI+IlP8wY6xs98P54OmI/faoRQWe4tYS5xYTa3kP6ttDD/7Faw1T/5ENL1CfpN1jhFNK7Vt3iu45iHInv/pQZdvlHgyCY6YrvTxYAlUL+P9B60z6o/0nPV4LeH/oTgmvo7aNck1faTNHdob3L4CMxl3i/r6cjbfUODq1+AEdumGOEs+wgHwGPdnrdo0yeftCYDKUdTHXkm+Y89FwfCLRsSr2Udr/j09kXdJXhO33jnwUUiSdZCv5QDeySl7SufFnS2Cz7nUi9A2VwqlENH9RHxvmjES65F7JFDf7y5Vy8Y/dnGn9betL9Vx0RcWHq0VL0OY1+NuqPB5PEry3vhO2hgFUD/NlVnhQk3VELjpqO34glwC3SRyedptJFgyrL3f6lUjb6vKOnz9T9B+ioy0gSMjZxu8ig8Q3+6AxtzdGEWZb116qliIHh0JWP6m4EZhchALxGeYPJlrss0DFWKL8dFu54qJkoXoDiHpZ+daa0Rrw9P15PhnFaI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(2906002)(2616005)(83380400001)(4326008)(316002)(6512007)(66476007)(66556008)(66946007)(107886003)(41300700001)(6486002)(36756003)(478600001)(6666004)(86362001)(110136005)(54906003)(921005)(38100700002)(186003)(7406005)(7416002)(8676002)(8936002)(6506007)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?01Q0hpRp8GnW+iCq2uRFqiVcQgQnSyE/9cP5ivjp4q1tISdQt+3+cWOCVHSJ?=
 =?us-ascii?Q?a9mz6WEJE6ReJuVG3K4fjvDbNxBrAmekLFCgscAUmfN0hqXPVfeBIlAdFmHV?=
 =?us-ascii?Q?RShu+8GXccfRrhyrU3QZO2NjVmv+SdmtfinY3rv2FKoWVcp9rbCk9SkUnlAL?=
 =?us-ascii?Q?bK7vGPS20mEtb7aIsLY0GlKfMMfRMAUKi9VMBtBn24zqtPKa2nhA8NNub4GW?=
 =?us-ascii?Q?1Fs7PI0m0EHgxstgOTb8uccyZq5e1edY0Imt9w8cdX2NMmYqRcgXOkUbW2u7?=
 =?us-ascii?Q?rFEpSrK+8dWoIlTUbfymbqd1fBKj4r7ILN0MF7nk7RMrH9mjZo6mET+12Q5I?=
 =?us-ascii?Q?k9SoEUrkR/hcrS2h3OAOJdET5FHjnQwZJxGlpGSwiHNCI9RgkJVQ4WbkBZXT?=
 =?us-ascii?Q?a73eN/xd9j9OiAn7xA0R5Uo1PivrKFHpamsIhnPaBGb7ggg4ylGt8SLFFCxV?=
 =?us-ascii?Q?Sn6CYxAbsy4nUb6o0ZeSJj8A5tMC5AlywL5bDgYjfKWB/ef+eNyFeFnEwWLL?=
 =?us-ascii?Q?jJDPOCvPcPPhS0ADvnjPmd1par5Wf3t12uvefbBW1BMcwaJWWP3f8Gp1Rcwk?=
 =?us-ascii?Q?5a/IProeE+pckDtltoqh07IA6MpuIW/QjuPrBEYw5AO61H+xHnE9dfl81dAC?=
 =?us-ascii?Q?NYWEmVfIESzYkF7E8u0IMRduqDPg26Yn8yeQFcn9G5Mn1BA0e8aG1P9z6BKX?=
 =?us-ascii?Q?4oFlBC32+o06wQLJYPjjPNtX/KRerBJO1N8M+lwwK/vKv4cSMQ08TDArCIQQ?=
 =?us-ascii?Q?HRTKxA4rlSf9VvM6tTPawFKeDiXMx7UfZG04PFbDUVe3LQ38xy5nOHsJmYXl?=
 =?us-ascii?Q?6XGH+dKL/vccsudid/nj7H3bxaoq7LAi4kDO5+HvjesdiYXBuWhQakYXwf4r?=
 =?us-ascii?Q?7tg3T6l15RiqyPnAYISicy+6CqGVlC3XRMEq1vwd1ID/U4Huov6IGEuQRN+7?=
 =?us-ascii?Q?QamICVA+ZmCluGhxsSicOcdoCfV2Wn4NiV0eh1zrj+DezAaS65RLEqHbPQJ/?=
 =?us-ascii?Q?RF2EWdSCzojXPNH3UmjlI0MOYAuhQxkQ/m74K9CxbVWxh5G0GSzHo+95D2FN?=
 =?us-ascii?Q?+MpxDnCEEhNDCP0Qsnf+X36mbg758V+nMRrZwKDA0ZxA95FwTWg+lWcMobQ9?=
 =?us-ascii?Q?+YRKO14B0nD6sVYSBSfVaeGxaIJfasCGZShupVQFqTo/wGXqIbqoLF+hgU+v?=
 =?us-ascii?Q?OXHvntjmdxyJLMD8ep0LyrKLVo0Ecr2oYJTdNHXCXcySSMNoARG+5QgkUcUi?=
 =?us-ascii?Q?pd6QBeqBB+BfeYINkA2SARDY67KrAuA2gUK9hKuGF+K24PYxWr8dKxCUNRnm?=
 =?us-ascii?Q?lwwZI43ILopKReRpLgwHFscijTgivQaJw1hNQOy3zU4OIaKmPl+h0sqCrjZw?=
 =?us-ascii?Q?zbO492t63I0sJJo0ES0/Vhtlpvs/MZk4YOZ9w/aZte74zQZ+E/WuUGoA8eZP?=
 =?us-ascii?Q?6uFk1efSIqMzAVkG/L75tMNBBVkCOl0K+4VO5+NMXcFh50BDcIYGSgpHQcaZ?=
 =?us-ascii?Q?gwwwC00FcbbOx8xdqUcArBnDNGa6hkIvr/KC0TdaRUqeROkHaB/4oP8G3qDB?=
 =?us-ascii?Q?AUpkaQ4xZrRdGNyvmUNQ7OGyWiT8vEvhr+0z71yw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 734e32eb-36d8-4a07-f58c-08db8c6a882c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:18.5521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGTVfcXz/tae+j7tAkRF3fahaPOT58afkYHihGZdWvEf0iCO/U/+CBBA8Kd6/ah9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5252
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

Prior to commit 1b932ceddd19 ("iommu: Remove detach_dev callbacks") the
sun50i_iommu_detach_device() function was being called by
ops->detach_dev().

This is an IDENTITY domain so convert sun50i_iommu_detach_device() into
sun50i_iommu_identity_attach() and a full IDENTITY domain and thus hook it
back up the same was as the old ops->detach_dev().

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/sun50i-iommu.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 74c5cb93e90027..0bf08b120cf105 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -757,21 +757,32 @@ static void sun50i_iommu_detach_domain(struct sun50i_iommu *iommu,
 	iommu->domain = NULL;
 }
 
-static void sun50i_iommu_detach_device(struct iommu_domain *domain,
-				       struct device *dev)
+static int sun50i_iommu_identity_attach(struct iommu_domain *identity_domain,
+					struct device *dev)
 {
-	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
 	struct sun50i_iommu *iommu = dev_iommu_priv_get(dev);
+	struct sun50i_iommu_domain *sun50i_domain;
 
 	dev_dbg(dev, "Detaching from IOMMU domain\n");
 
-	if (iommu->domain != domain)
-		return;
+	if (iommu->domain == identity_domain)
+		return 0;
 
+	sun50i_domain = to_sun50i_domain(iommu->domain);
 	if (refcount_dec_and_test(&sun50i_domain->refcnt))
 		sun50i_iommu_detach_domain(iommu, sun50i_domain);
+	return 0;
 }
 
+static struct iommu_domain_ops sun50i_iommu_identity_ops = {
+	.attach_dev = sun50i_iommu_identity_attach,
+};
+
+static struct iommu_domain sun50i_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &sun50i_iommu_identity_ops,
+};
+
 static int sun50i_iommu_attach_device(struct iommu_domain *domain,
 				      struct device *dev)
 {
@@ -789,8 +800,7 @@ static int sun50i_iommu_attach_device(struct iommu_domain *domain,
 	if (iommu->domain == domain)
 		return 0;
 
-	if (iommu->domain)
-		sun50i_iommu_detach_device(iommu->domain, dev);
+	sun50i_iommu_identity_attach(&sun50i_iommu_identity_domain, dev);
 
 	sun50i_iommu_attach_domain(iommu, sun50i_domain);
 
@@ -827,6 +837,7 @@ static int sun50i_iommu_of_xlate(struct device *dev,
 }
 
 static const struct iommu_ops sun50i_iommu_ops = {
+	.identity_domain = &sun50i_iommu_identity_domain,
 	.pgsize_bitmap	= SZ_4K,
 	.device_group	= sun50i_iommu_device_group,
 	.domain_alloc	= sun50i_iommu_domain_alloc,
@@ -985,6 +996,7 @@ static int sun50i_iommu_probe(struct platform_device *pdev)
 	if (!iommu)
 		return -ENOMEM;
 	spin_lock_init(&iommu->iommu_lock);
+	iommu->domain = &sun50i_iommu_identity_domain;
 	platform_set_drvdata(pdev, iommu);
 	iommu->dev = &pdev->dev;
 
-- 
2.41.0

