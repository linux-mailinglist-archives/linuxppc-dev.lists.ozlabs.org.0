Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EEC785E48
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 19:10:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HTKb+YeA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWCQM4Sp0z3c5Z
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 03:10:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HTKb+YeA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::605; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20605.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::605])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBxS1Djvz3bZM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSRFaLsJuefFxaYPmKWfYfIVcOVOYsaLChjVpDb6HLKcaMDRNi5u9/FhRj8PzGOEMqHIh++x5hQmMJEjXWzD53LqdNQ3qz7PrxuJ+WX346/8u/D8Ndxbc0Fspl3YhjnzNV/jA0IFImRAO6jKhtVWkpzhSJ+F4yeYTMN2K4t1mhyjQgecfyKcuUJm6S+jlnxzFpQowt64/SbJwwkDy66LpGYkYIguiU7xD6UmAfSyUTaEUMgqEjjI0PqS8HYe+Xq355jGsCIiStg/2orW0R8re7LwgVo9+H77FFEc32zH+eHaXWTiLXI6V8sVwuK4YzC0QLDO/6HZXz2/fWZtm3rNZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdVueBGODMcMHJZZsSJHVIVCnucCk7waKLX77JvyQE8=;
 b=DMxWIv7JD1bA/aqjR4saoqgPKqSrPVe7Pmu8co3fmEOYWvd/V7U5AhTvTWhFJ9kGqmJOtQdk2l9zf3x/4NwFB70SyVyg1qsHqLhKQlaDJ2EkL5LXgmfWVDaqJWPdoRqCk3YPCgA+Rdro7Xo31U7rfFzpPAqCkSb5fF9S2s5/5NfWRnWL5d7Vb/Qi2I/1xNaU6QTtf5E1OfUTbUeOQxDyhH0tmym4H4lZDigqbVUtPx7I6rz4QKwar/q7lEsc2GxMU5HSWc64JP4Iu9eNTXefj1vL6RQjYXM2FZpAie7G4JnX665wMroU+mX6L5Tg6MlyHPNSGKEQt9o0a5Qq8odjUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdVueBGODMcMHJZZsSJHVIVCnucCk7waKLX77JvyQE8=;
 b=HTKb+YeAX9sgRLliueJ/urcWZ3Wr37b7pAv0e3lcSwuamsWCCeB0uXZBU8Wcr+W5eruI/2s4hyy1L3vVJTNZYMCn2OCavZohr/uMLuAp6rlkE0JmSt79X+SYqzlkPE2V76v79eQs1YT51Z0Tio93Snb6MEtCneqThErphCz6w7LuBD9yi8TfcqWnYVuumBihGNoDPsetQePyuaMbjIU671zHsD9mJm/52lKQ8vlrURWoShfMX8OJc2cMx4LERXUIaw9Mep9kBiCblht87OR4HM63yvXtrHqaoN3BeL+jJSOtp9Dqg+iYmERtq0OPEFQdBR6hyYRp3Xm67l7lfUrhEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Wed, 23 Aug
 2023 16:48:00 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:59 +0000
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
Subject: [PATCH v7 09/24] iommu: Allow an IDENTITY domain as the default_domain in ARM32
Date: Wed, 23 Aug 2023 13:47:23 -0300
Message-ID: <9-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH2PR14CA0048.namprd14.prod.outlook.com
 (2603:10b6:610:56::28) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ0PR12MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cbf43be-9ace-4ae2-0aa7-08dba3f8adbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	g4W8/xOe5tr8n6Dwwweiav4qg5HKqaWGThDaCKGgrWT7WeFrg62Gxe1k/AuinWD3SjwFmtXreWQetFIiAzn3eIexjpuFkHHtTkhQPUVrte1MyhRgkbcOf52azCNIBvVnjdU7qT8ir7aiF6fAfbmwFPJECxIQDVIdNUcZ01AQodN3p2UoybyMJ6TrZBS5tRgidQlkociiOujw/vHudMPePawoib5IOG16HDEegN2NNZ13de+09KOaE5/yK6C4WB6g+0ou+h0R31I0RwoVV8U82CotklsmYPxdDcQi4uT2QhFrlR7t3W1ms/l22QlSAW4Qwj0UPQnPgsD0vZn0k7t9BDrmbBdZGKdLdKziyJt1EcT89mBwEH1OfFm+a6EuO8Mvm2NX6Pd94dM5mZ5gnphgAvylCwwVgUq7gDwwx+0kYlMk9gYYJTF6EOxTHnLpnu5vf6SbNkx4T+ki+tRnroXRjSvE0He66U/Wb54PdSx9vpL4dwpQsnpUZ7fxxdgxDTMoyDwLTJkVK4PmKqNhHfEyRnujEKs0VE56vgRK04a0GxN8h4LOAHjTmmPKX7WYrWAw3wf+U9JvRhIEM4e+jIykgyVYAn0x/LEYHEz75zWKXCBsy8IXQlETahSQW76m9/cF
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?uoAekOTb+sAFqZMwEI9bjO0P27eF0ao+PMuGW/2xdJaMLJgf42G6Bq3D1fhz?=
 =?us-ascii?Q?fxc3AuToZjIOH9Dp2NFPFBmBB1S2EarXqGQeOr8bvVzuzB/DrDRFdkD8XsQ+?=
 =?us-ascii?Q?l4dWbH72/YFkZs1WMBok5Ex6JUH49QnstlnEPgaLZC4XSUyCYXIi0jOHGtnG?=
 =?us-ascii?Q?p8wkl0fRlfsm6K8KIPt1DhiBIONOyZEmW1YY2IcGePWkRE11JyvcNYCYbbLv?=
 =?us-ascii?Q?qdFfgobPdW1eCh0h1EfjWm/c7bTcT8Fg3cdlFNammmUluXPPeUF5BS/my+Mg?=
 =?us-ascii?Q?5sKpnWIXbvGj505gesS7WF2eO8VOURbYaRZOJaqhhER2uovd1J4Ao0L17Jaa?=
 =?us-ascii?Q?bpxxILLMocxSmnikDMi59iKFDMzG9E7X+E8w1lsFERDJXGMnoLCrxgcu+HBe?=
 =?us-ascii?Q?ehseDG2ojLqEz+QguH45TpmQqO6t636jbjSphyVuYaNyQbWLc8iYO+1Djzm5?=
 =?us-ascii?Q?AzPptXE3wAMmmy+mwTEGEfdxvgjfJXKRAghGxc2fb9nO1iNcSPIbq3Yb8PKV?=
 =?us-ascii?Q?sf+kIQNzcTFQyiBBKp8oSEA4FscPDNHOru3sP1v+0sm77MTFtD/PgqDlEZYG?=
 =?us-ascii?Q?yyPEImKlLMqoT84L93LnKhvucUvU2N0cLtNhfloOjq0vxB5tUVtMYcvdjnpl?=
 =?us-ascii?Q?vE/4ALuJel4GpacgqB9qDQrWkwNt2X8e2vRBNpd9l8/nqq2HkFp/UsjWb8RD?=
 =?us-ascii?Q?ps9oD1JQ2HELSzPmFgxvc7wBqt/yhP6HSA2w0hWldF+964p3C6Mga36/w1Sg?=
 =?us-ascii?Q?UY4IJmGR4SWLXy/WhgEXkgosDw+WN5nCVQf/ytRQxeNmy0EPkTSyCajaay5h?=
 =?us-ascii?Q?pbntxX2h8OltHKy72wOHBb5rsN/amWdMqVPe8Q2jOG1w0idzUBdXeWLbJmOM?=
 =?us-ascii?Q?pFI/OxbDrMgIct7ZGiP4gcqQeybsruLs1B05SUkHkeaBJIHytZqjlWFwyjli?=
 =?us-ascii?Q?9lsv023MkJX4eHXw0xtUMougY89W8f1KtZ1u8LyyVrattPXbPqoxKCd6e1PG?=
 =?us-ascii?Q?57hMTFHRySDtgXjyNE3to3L6n7P6YzjTh/0OqUk2nkfwQPWX7aChcrug+EQU?=
 =?us-ascii?Q?TFqc7t2lTuBw7AGb73t7h9ayJt67G9HQo4y+fm4CSheZmB7ZgRJ/jgkgSc+w?=
 =?us-ascii?Q?g6zfOMfVCNiLG8MPF+je7TKiTGLp0EFpMfLlGkmSjj9kNUD7MYpIh0nwtgzY?=
 =?us-ascii?Q?Xikewuqq011QsvjyXpKvYWAXyAGYSmCbL2JgklYPb1r1+IEvWaTWiGa00lIF?=
 =?us-ascii?Q?SJWr2OHYRbY0h4mnhFd5hmE+GQFJp7lrLo4Vy7Z7v5JQy2ZUbhkAWZi293QZ?=
 =?us-ascii?Q?5jLChZKNGiJNo2K4oYHUNOkUTtsj6YiOEGashnopyul+2RE+dwCwNfJXw3TN?=
 =?us-ascii?Q?hzLkFqJfzXMIuZhoV+WFsbQ8MkA8Ql5jTm3uM+sMBYYwwz3ZSIRTX7HcQWRf?=
 =?us-ascii?Q?q9/VUqBzUdUJMYc075wPEOhB7fGHN30zofPgEJmehnM/Fafj5x5RK/TrcbCF?=
 =?us-ascii?Q?CphbIqPBObO4841A+QlOZy5/9hIJ2jZWTCEeBjDiJpqXkuOJFnkLZVuEqCN2?=
 =?us-ascii?Q?EyDrrBclbAFX47SnJ1FiI3v5SR4Xe7pqYaAySOd+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbf43be-9ace-4ae2-0aa7-08dba3f8adbf
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:46.9408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5G3H+cf4iS03kStKS2jJZTcGULM9eRCYn+RDrRmyCIlCb6Yxld79E0avVgQxNVF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7473
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

Even though dma-iommu.c and CONFIG_ARM_DMA_USE_IOMMU do approximately the
same stuff, the way they relate to the IOMMU core is quiet different.

dma-iommu.c expects the core code to setup an UNMANAGED domain (of type
IOMMU_DOMAIN_DMA) and then configures itself to use that domain. This
becomes the default_domain for the group.

ARM_DMA_USE_IOMMU does not use the default_domain, instead it directly
allocates an UNMANAGED domain and operates it just like an external
driver. In this case group->default_domain is NULL.

If the driver provides a global static identity_domain then automatically
use it as the default_domain when in ARM_DMA_USE_IOMMU mode.

This allows drivers that implemented default_domain == NULL as an IDENTITY
translation to trivially get a properly labeled non-NULL default_domain on
ARM32 configs.

With this arrangment when ARM_DMA_USE_IOMMU wants to disconnect from the
device the normal detach_domain flow will restore the IDENTITY domain as
the default domain. Overall this makes attach_dev() of the IDENTITY domain
called in the same places as detach_dev().

This effectively migrates these drivers to default_domain mode. For
drivers that support ARM64 they will gain support for the IDENTITY
translation mode for the dma_api and behave in a uniform way.

Drivers use this by setting ops->identity_domain to a static singleton
iommu_domain that implements the identity attach. If the core detects
ARM_DMA_USE_IOMMU mode then it automatically attaches the IDENTITY domain
during probe.

Drivers can continue to prevent the use of DMA translation by returning
IOMMU_DOMAIN_IDENTITY from def_domain_type, this will completely prevent
IOMMU_DMA from running but will not impact ARM_DMA_USE_IOMMU.

This allows removing the set_platform_dma_ops() from every remaining
driver.

Remove the set_platform_dma_ops from rockchip and mkt_v1 as all it does
is set an existing global static identity domain. mkt_v1 does not support
IOMMU_DOMAIN_DMA and it does not compile on ARM64 so this transformation
is safe.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c          | 21 ++++++++++++++++++++-
 drivers/iommu/mtk_iommu_v1.c   | 12 ------------
 drivers/iommu/rockchip-iommu.c | 10 ----------
 3 files changed, 20 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index bdeeb574d9495c..5fb25bcbc42f76 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1865,17 +1865,36 @@ static int iommu_get_def_domain_type(struct iommu_group *group,
 static int iommu_get_default_domain_type(struct iommu_group *group,
 					 int target_type)
 {
+	const struct iommu_ops *ops = group_iommu_ops(group);
 	struct device *untrusted = NULL;
 	struct group_device *gdev;
 	int driver_type = 0;
 
 	lockdep_assert_held(&group->mutex);
+
+	/*
+	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
+	 * identity_domain and it will automatically become their default
+	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
+	 * Override the selection to IDENTITY if we are sure the driver supports
+	 * it.
+	 */
+	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && ops->identity_domain)
+		driver_type = IOMMU_DOMAIN_IDENTITY;
+
 	for_each_group_device(group, gdev) {
 		driver_type = iommu_get_def_domain_type(group, gdev->dev,
 							driver_type);
 
-		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted)
+		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
+			/*
+			 * No ARM32 using systems will set untrusted, it cannot
+			 * work.
+			 */
+			if (WARN_ON(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)))
+				return -1;
 			untrusted = gdev->dev;
+		}
 	}
 
 	if (untrusted) {
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index cc3e7d53d33ad9..7c0c1d50df5f75 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -337,11 +337,6 @@ static struct iommu_domain mtk_iommu_v1_identity_domain = {
 	.ops = &mtk_iommu_v1_identity_ops,
 };
 
-static void mtk_iommu_v1_set_platform_dma(struct device *dev)
-{
-	mtk_iommu_v1_identity_attach(&mtk_iommu_v1_identity_domain, dev);
-}
-
 static int mtk_iommu_v1_map(struct iommu_domain *domain, unsigned long iova,
 			    phys_addr_t paddr, size_t pgsize, size_t pgcount,
 			    int prot, gfp_t gfp, size_t *mapped)
@@ -457,11 +452,6 @@ static int mtk_iommu_v1_create_mapping(struct device *dev, struct of_phandle_arg
 	return 0;
 }
 
-static int mtk_iommu_v1_def_domain_type(struct device *dev)
-{
-	return IOMMU_DOMAIN_IDENTITY;
-}
-
 static struct iommu_device *mtk_iommu_v1_probe_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
@@ -599,10 +589,8 @@ static const struct iommu_ops mtk_iommu_v1_ops = {
 	.probe_device	= mtk_iommu_v1_probe_device,
 	.probe_finalize = mtk_iommu_v1_probe_finalize,
 	.release_device	= mtk_iommu_v1_release_device,
-	.def_domain_type = mtk_iommu_v1_def_domain_type,
 	.device_group	= generic_device_group,
 	.pgsize_bitmap	= MT2701_IOMMU_PAGE_SIZE,
-	.set_platform_dma_ops = mtk_iommu_v1_set_platform_dma,
 	.owner          = THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= mtk_iommu_v1_attach_device,
diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 033678f2f8b3ab..a582525d36f8cc 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -998,13 +998,6 @@ static struct iommu_domain rk_identity_domain = {
 	.ops = &rk_identity_ops,
 };
 
-#ifdef CONFIG_ARM
-static void rk_iommu_set_platform_dma(struct device *dev)
-{
-	WARN_ON(rk_iommu_identity_attach(&rk_identity_domain, dev));
-}
-#endif
-
 static int rk_iommu_attach_device(struct iommu_domain *domain,
 		struct device *dev)
 {
@@ -1183,9 +1176,6 @@ static const struct iommu_ops rk_iommu_ops = {
 	.probe_device = rk_iommu_probe_device,
 	.release_device = rk_iommu_release_device,
 	.device_group = rk_iommu_device_group,
-#ifdef CONFIG_ARM
-	.set_platform_dma_ops = rk_iommu_set_platform_dma,
-#endif
 	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
 	.of_xlate = rk_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.41.0

