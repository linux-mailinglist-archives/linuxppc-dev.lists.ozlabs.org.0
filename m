Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA841704208
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:04:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxKr4NHqz3fgm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:04:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ln0Q1S+b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ln0Q1S+b;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxGx0hXMz3bxt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jm7DhGy7DlbDw5BLHsFdfghGLxg+t46mWUt//3b8m+vfnkQeR3+jhA0cSgBnJaYEMrj3UYrCSIpFZ0qJ5ZERnIqhdAEISp4X6fwmx9USVitH1cJ85WWmx2I+MqLGH0Jz7cyvSuPhytaih41IK7BFcgBQr/yunEyJehgriE6jYsvGu+98fB4/uO9BBy+iw+X8DbZuine0qNuwJ5kZgX2lU5IdMsAU788y787adloBMFic2Av+JGI8ZtTfeurWLLltSjlMnslVPGyXNbMSyeAf/qi5aDNmF7O6M9moZCkoQF/bgASN0s8uVBvnw/HWgEotXUPp4M9wkZbvc2qU4Sr5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fn9RdtF11GtVVUfX3J8+C9XoRO3TIaPi/P4Q+aVJtbs=;
 b=GHEn09cJ45ZzbFLAyrDWpyPkV+hSbpY27Ym6ZWwd5T9a4UsF+p7WYFIfCBzUajrB4CCJdewzY5oOloZ1zWkapLcgdPE9NiVo+MAMvx7MbpjrOMiH+m7hsim14mLaIkAX2OFuAC+5wBshFQ1vXpH6aiIgZzP5/Fo5+MDt3hpwe9MGzUYKnnsCbOocLy6MtaPIdYQQozZYUVoS6PSvEk+MPR6J1tVt65JsAQdFpvsx9165tYaLOUwpI73aQbfXGzOJVvyQ0yqh3H3YwsSYdt2zjjVcJEf3Y3dfTSRnsMt0N3mZcWjLKifw+bUBTaVA0zsRZ2df1GSXaj1JqQHro/x90A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fn9RdtF11GtVVUfX3J8+C9XoRO3TIaPi/P4Q+aVJtbs=;
 b=ln0Q1S+bDlO6lF4hAMGhpxasMzxVLap7/M8MWUPn7kEB3CVoAnnCKLoywk1TwmJALrY5eGJz2AIQmThfTesu9QitRlstdTvFPlymk5mv1qZOIHu4IhH4NSwj+zus9ebuvdib59FURJgj4jjIbN8tSNp0mY7zrZgQYWoub1IN8FCjpB30UMiKrpo08e6CDwK+hJkMXsvK6FsqVdm5dFxy/bwF7F5zsYVr8Ng+Yb499YO0k50zDaRtFGii7TOGkBWTNVpCZvwmndkFCcj2vMBglKnD9+xcdqd2HNCEGrfUJwn01Nu+qL7Su9we1nByuOivMv4bVTL0vUL0lJ8PMtE9aQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:02 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:02 +0000
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
Subject: [PATCH v2 24/25] iommu: Convert simple drivers with DOMAIN_DMA to domain_alloc_paging()
Date: Mon, 15 May 2023 21:00:57 -0300
Message-Id: <24-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR17CA0013.namprd17.prod.outlook.com
 (2603:10b6:208:15e::26) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b428af0-b133-4db2-732b-08db55a0a1f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	vPHuxhRiA7GPzAMSFqKGYIdmzoHeZ//AGhK8RWmT6a8Za3l51cEdUEBHZh3cuGMXyonAqHSo/q5tAAE3j6+b5hQvQ0aW4xtVM3Da5jiJ/hg+FQ9zzIaqyn2EutpOJMhoeA6bnSR4IvSa9GgrDm9H+/+wY1uDyFpYrqKrkL3JQF9vums3JMELDEPdmYXr2KSB1gOU2FWAn+qymx6g7ZuJ6dkYMWO54oI5Ve5p9gLF/xL/DmM8iR3VnOw23vTl0x05bxF/UFsmIuE5RVYxH3rEQBABTgF/lVQtdXIcWSwzkm9R7uQaTh7guEyTE9tkSPsDWhR+FNouYf4ut3OFQz9YsfNcj0Da9gJYGs4LvaIqA1ysx1ILr2ci+cS9rk/NbyNdaKdVAh/mL4QdX+1J0o6sqbBVehsm/byih2hZ50ZtM7ACS6qUdFYNvXHBkamnWyHKNJ1sFmJgtAB38fv/9JnZhFncW6FUPNfR75K5pJ3zlde3WCsg/qraXeRchYsVmsWvoRkd8po1bLvVWsyUgYDEE1zAldQcDdYNmwHc6dXbnnL/lwj7tPyp68fIRW3fPpweoBRPnDBw9gjNO7hVlkGaGw6ncpsGiu/RlK4t0TTp0UQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(4326008)(41300700001)(316002)(2906002)(921005)(36756003)(38100700002)(6512007)(6506007)(26005)(6486002)(478600001)(107886003)(66556008)(66946007)(66476007)(2616005)(86362001)(5660300002)(8936002)(8676002)(110136005)(54906003)(7416002)(7406005)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?CYLswpJa0l6oQDjpDz2NHQnHRQFKQeyTlG9hyDQarM1L/ZXRpuqwK2Xo2XDh?=
 =?us-ascii?Q?adMwk9CC/KE5dDkr3w5B0hfWvIJBqT0E9aTc364UaKlwmxcNtI7deXF9zZDq?=
 =?us-ascii?Q?llM1+ImTz2VKRL6lbeHaOT9U0/rFbw8/g1qRBzlC+bAhx5jeyzwLBBKlNQqQ?=
 =?us-ascii?Q?J1UNCAdjNbVsORNzMAfjbnh6xqVUMFc9fvRrIfxUVQn5O6uyHmxI5l/K293v?=
 =?us-ascii?Q?+6w0y0ntfk7/OzyQYEjdUH8t2RGJFWWNOr+1T4OKiBt9R9CVUuab/FVLpngp?=
 =?us-ascii?Q?STKQBmfruwIqFPKmhiEwtuu241PtAEjPHLcOU1eFtgU6aLFHLkoSl2b3DmhM?=
 =?us-ascii?Q?lNoF7nHFIwGvKNWiYz8ilZ1WaTf/fxPklbYrCoG0YlJ5fDf8O1+fQceyF37m?=
 =?us-ascii?Q?EFuOGkaCNla3e7tZQ4fhhwZL/2F3Q+a7TGv6JUf0LzeSxEeIQ87fyhjzF6He?=
 =?us-ascii?Q?fSvct9dv+YP3FCA46+FPHiu8zbNkFlzyrx5g36BRG+QAk2Rw39HQ03l/ea1e?=
 =?us-ascii?Q?sEGmpOPg6EPS1drulfEHSvTQljlyk08v/Wro8Nzs62cMK7mVoeC+wPkG1wng?=
 =?us-ascii?Q?ZfPzqrke507el6YilPA8NZDJq5WFD/wgy1/2Mg7t68uSln9RUyYOu4FbcnS2?=
 =?us-ascii?Q?SNmCdWwtS9kFbp/S4DypsLJj+PK7lbXbswVXEjAOeYJZa7xrnAX30gFkaqHy?=
 =?us-ascii?Q?dX2euMjiEpSzE3v3n/o1PYX8qNvmyDiq9tIGHikGkea3yCwnMC2oRYMlumYA?=
 =?us-ascii?Q?DgZkUXYw4004qmANB0cl5MxvE/mRHgixTotF0jgdHFmNGTw30paadRaVzMqz?=
 =?us-ascii?Q?YbyRctdqtPN4i61130Z4c4zh78bpyctjOpYc7pN/ugBgaIvSe5hff03A2cVK?=
 =?us-ascii?Q?t0SBSwdMyeK+uR0x9lxfgVrhKRRZllb3KSutvVX93jtxnSfPBzQdXRG5NLqP?=
 =?us-ascii?Q?hU2VUfR2N4iew5/6v+DyPLGLSXJxqSGTdHYc+nr1+bleEtQCJ9RmWRdaClSh?=
 =?us-ascii?Q?BaUqIchmapTnLihsRcWIM5lK4odhb45QlZZV5ndWYqUkHKN8PfC2WWpv2Qkk?=
 =?us-ascii?Q?kgmXAeis6oJ3Seq9pwHyPkpoop8fZsG07Nd8ZJG1EhSRgeQ09l2soW9jcpuJ?=
 =?us-ascii?Q?/smWMHxwKiG/JzeXwlCp+XIcJITMQlyxEvkSJoh1FzIgmN59SvDzs4SWSsIq?=
 =?us-ascii?Q?Uu5fvXeCAeaW3wDk6Cfy4bzwGTllzpRL6VIM811Rnns8T6dhdLBRnNIWpYr+?=
 =?us-ascii?Q?nWmRDHiKayq/PoV3Z/dBr/i3x1m6rnfXZwZSNvUkpXk2c4Xaey0onHzsEiBZ?=
 =?us-ascii?Q?VpB3RF7ZgimFLNXptW02N83CwptSQx4sZXAjWWw1+WQsdnOyQI/nKLj9vJYT?=
 =?us-ascii?Q?DRXLbRa/QqlZyR7KozPmNYm4DokuqtIiw/I6nKir34F/mjXfnOwyyQ3gT2UM?=
 =?us-ascii?Q?VminLbhjNwzspub17UJLpVs4A55Dkcu6/pdMELwAVvoQDgkkJM+r1WN65Q+y?=
 =?us-ascii?Q?9sPHdGWYWEP4zR/91GqslZe/zKKS4Vp5uaZwYXubkoo+HRrlck56A5Ou11rR?=
 =?us-ascii?Q?rqFdHHO1+YHkUfJAuW2dvnzwtF1LjZBeyJza3bTB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b428af0-b133-4db2-732b-08db55a0a1f6
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:00.6838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4NCOLcBYcWTe9oVHAhs4A+HuS/j+cLocTc9WD8YMHczb26GGg2ApPANtn8vUA/j5
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

These drivers are all trivially converted since the function is only
called if the domain type is going to be
IOMMU_DOMAIN_UNMANAGED/DMA.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 6 ++----
 drivers/iommu/exynos-iommu.c            | 7 ++-----
 drivers/iommu/ipmmu-vmsa.c              | 7 ++-----
 drivers/iommu/mtk_iommu.c               | 7 ++-----
 drivers/iommu/rockchip-iommu.c          | 7 ++-----
 drivers/iommu/sprd-iommu.c              | 7 ++-----
 drivers/iommu/sun50i-iommu.c            | 9 +++------
 drivers/iommu/tegra-smmu.c              | 7 ++-----
 8 files changed, 17 insertions(+), 40 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 9d7b9d8b4386d4..a2140fdc65ed58 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -319,12 +319,10 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	return ret;
 }
 
-static struct iommu_domain *qcom_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *qcom_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct qcom_iommu_domain *qcom_domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
-		return NULL;
 	/*
 	 * Allocate the domain and initialise some of its data structures.
 	 * We can't really do anything meaningful until we've added a
@@ -593,7 +591,7 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 static const struct iommu_ops qcom_iommu_ops = {
 	.identity_domain = &qcom_iommu_identity_domain,
 	.capable	= qcom_iommu_capable,
-	.domain_alloc	= qcom_iommu_domain_alloc,
+	.domain_alloc_paging = qcom_iommu_domain_alloc_paging,
 	.probe_device	= qcom_iommu_probe_device,
 	.device_group	= generic_device_group,
 	.of_xlate	= qcom_iommu_of_xlate,
diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 5e12b85dfe8705..d6dead2ed10c11 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -887,7 +887,7 @@ static inline void exynos_iommu_set_pte(sysmmu_pte_t *ent, sysmmu_pte_t val)
 				   DMA_TO_DEVICE);
 }
 
-static struct iommu_domain *exynos_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *exynos_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct exynos_iommu_domain *domain;
 	dma_addr_t handle;
@@ -896,9 +896,6 @@ static struct iommu_domain *exynos_iommu_domain_alloc(unsigned type)
 	/* Check if correct PTE offsets are initialized */
 	BUG_ON(PG_ENT_SHIFT < 0 || !dma_dev);
 
-	if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
 	if (!domain)
 		return NULL;
@@ -1472,7 +1469,7 @@ static int exynos_iommu_of_xlate(struct device *dev,
 
 static const struct iommu_ops exynos_iommu_ops = {
 	.identity_domain = &exynos_identity_domain,
-	.domain_alloc = exynos_iommu_domain_alloc,
+	.domain_alloc_paging = exynos_iommu_domain_alloc_paging,
 	.device_group = generic_device_group,
 	.probe_device = exynos_iommu_probe_device,
 	.release_device = exynos_iommu_release_device,
diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index de958e411a92e0..27d36347e0fced 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -566,13 +566,10 @@ static irqreturn_t ipmmu_irq(int irq, void *dev)
  * IOMMU Operations
  */
 
-static struct iommu_domain *ipmmu_domain_alloc(unsigned type)
+static struct iommu_domain *ipmmu_domain_alloc_paging(struct device *dev)
 {
 	struct ipmmu_vmsa_domain *domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
-		return NULL;
-
 	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
 	if (!domain)
 		return NULL;
@@ -891,7 +888,7 @@ static struct iommu_group *ipmmu_find_group(struct device *dev)
 
 static const struct iommu_ops ipmmu_ops = {
 	.identity_domain = &ipmmu_iommu_identity_domain,
-	.domain_alloc = ipmmu_domain_alloc,
+	.domain_alloc_paging = ipmmu_domain_alloc_paging,
 	.probe_device = ipmmu_probe_device,
 	.release_device = ipmmu_release_device,
 	.probe_finalize = ipmmu_probe_finalize,
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index e4b9f728002403..e0bb10adc62967 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -667,13 +667,10 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom,
 	return 0;
 }
 
-static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *mtk_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct mtk_iommu_domain *dom;
 
-	if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
 	if (!dom)
 		return NULL;
@@ -994,7 +991,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 
 static const struct iommu_ops mtk_iommu_ops = {
 	.identity_domain = &mtk_iommu_identity_domain,
-	.domain_alloc	= mtk_iommu_domain_alloc,
+	.domain_alloc_paging = mtk_iommu_domain_alloc_paging,
 	.probe_device	= mtk_iommu_probe_device,
 	.release_device	= mtk_iommu_release_device,
 	.device_group	= mtk_iommu_device_group,
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 9e1296a856ac4c..24a2a09fea5503 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1071,13 +1071,10 @@ static int rk_iommu_attach_device(struct iommu_domain *domain,
 	return ret;
 }
 
-static struct iommu_domain *rk_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *rk_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct rk_iommu_domain *rk_domain;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
-		return NULL;
-
 	if (!dma_dev)
 		return NULL;
 
@@ -1200,7 +1197,7 @@ static int rk_iommu_of_xlate(struct device *dev,
 
 static const struct iommu_ops rk_iommu_ops = {
 	.identity_domain = &rk_identity_domain,
-	.domain_alloc = rk_iommu_domain_alloc,
+	.domain_alloc_paging = rk_iommu_domain_alloc_paging,
 	.probe_device = rk_iommu_probe_device,
 	.release_device = rk_iommu_release_device,
 	.device_group = rk_iommu_device_group,
diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
index 39e34fdeccda78..af68b3a2c123ab 100644
--- a/drivers/iommu/sprd-iommu.c
+++ b/drivers/iommu/sprd-iommu.c
@@ -133,13 +133,10 @@ sprd_iommu_pgt_size(struct iommu_domain *domain)
 		SPRD_IOMMU_PAGE_SHIFT) * sizeof(u32);
 }
 
-static struct iommu_domain *sprd_iommu_domain_alloc(unsigned int domain_type)
+static struct iommu_domain *sprd_iommu_domain_alloc_paging(struct device *dev)
 {
 	struct sprd_iommu_domain *dom;
 
-	if (domain_type != IOMMU_DOMAIN_DMA && domain_type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
 	if (!dom)
 		return NULL;
@@ -419,7 +416,7 @@ static int sprd_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 
 
 static const struct iommu_ops sprd_iommu_ops = {
-	.domain_alloc	= sprd_iommu_domain_alloc,
+	.domain_alloc_paging = sprd_iommu_domain_alloc_paging,
 	.probe_device	= sprd_iommu_probe_device,
 	.device_group	= sprd_iommu_device_group,
 	.of_xlate	= sprd_iommu_of_xlate,
diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 0bf08b120cf105..056832a367c2af 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -667,14 +667,11 @@ static phys_addr_t sun50i_iommu_iova_to_phys(struct iommu_domain *domain,
 		sun50i_iova_get_page_offset(iova);
 }
 
-static struct iommu_domain *sun50i_iommu_domain_alloc(unsigned type)
+static struct iommu_domain *
+sun50i_iommu_domain_alloc_paging(struct device *paging)
 {
 	struct sun50i_iommu_domain *sun50i_domain;
 
-	if (type != IOMMU_DOMAIN_DMA &&
-	    type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	sun50i_domain = kzalloc(sizeof(*sun50i_domain), GFP_KERNEL);
 	if (!sun50i_domain)
 		return NULL;
@@ -840,7 +837,7 @@ static const struct iommu_ops sun50i_iommu_ops = {
 	.identity_domain = &sun50i_iommu_identity_domain,
 	.pgsize_bitmap	= SZ_4K,
 	.device_group	= sun50i_iommu_device_group,
-	.domain_alloc	= sun50i_iommu_domain_alloc,
+	.domain_alloc_paging = sun50i_iommu_domain_alloc_paging,
 	.of_xlate	= sun50i_iommu_of_xlate,
 	.probe_device	= sun50i_iommu_probe_device,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 6cba034905edbf..69c40c191ce4f0 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -272,13 +272,10 @@ static void tegra_smmu_free_asid(struct tegra_smmu *smmu, unsigned int id)
 	clear_bit(id, smmu->asids);
 }
 
-static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
+static struct iommu_domain *tegra_smmu_domain_alloc_paging(struct device *dev)
 {
 	struct tegra_smmu_as *as;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
-		return NULL;
-
 	as = kzalloc(sizeof(*as), GFP_KERNEL);
 	if (!as)
 		return NULL;
@@ -997,7 +994,7 @@ static const struct iommu_ops tegra_smmu_ops = {
 	.default_domain = &tegra_smmu_identity_domain,
 	.identity_domain = &tegra_smmu_identity_domain,
 	.def_domain_type = &tegra_smmu_def_domain_type,
-	.domain_alloc = tegra_smmu_domain_alloc,
+	.domain_alloc_paging = tegra_smmu_domain_alloc_paging,
 	.probe_device = tegra_smmu_probe_device,
 	.device_group = tegra_smmu_device_group,
 	.of_xlate = tegra_smmu_of_xlate,
-- 
2.40.1

