Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA43672A415
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:07:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdBvJ56NZz3g6g
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:07:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EnRaVg4o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::610; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EnRaVg4o;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBfz2wGNz3dx8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8MTy7gdLiRWFZS31tUNOOlzcnQLv5qO9e6SzhLeF7+gAT12ThnM3jTAukEYuy6mRWQVPNu8oGhrhOAD8AQ8q5e4mejK/+uFpsTPu+iPNUIhGJeerMPD7lvVV+Tnbga2Aet20VefUw2xcylKltAm8td4QPi6qaDxkZlDNb8EKWIpd8J7C/OVUF+wPOG++ZdyxMR/rs8tpri06xi1uH+9aPm/ktbfoSePEW6n2p2Um34ktOo9dByOohmKcH9gGrOGTsYnG4yQrReY342lyGMG0mLZdTLmuQt2uJbRVSrVLrXFmycxbzBGQaa1UVqi4ksDrf9R5lviIDKkQyi1VsRYQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0IYW6GJyVFiPWG2flp9VBNO5eU+viukK8rqNAbYods=;
 b=CWe14gVrgo89CJqrhaLa8wB1azB48GXQlOT4CVDCZVgVAiel/Za4gWa9A9506EsD3tF0fDkplP6fzBJfc2yvS0VPW/PVJR2Ce/td+cEhCRFPx3gdFXL0MpHNglSfr+zFKMRzVnfs+9NXebMpmZi6xlUPgegfMeYhh4RNyWmbPf3M1KARA0H5p7/HVke4jUolQ4+z+XAB3tDSdPdm0xoCVnllpIx3yhRzxQ0prU4wI6OuaioPS9Mc0PeN/1fE2J4Q1OaibCPbGmoyswmgMmLZmk1vRPuyv/R+KfklIYS87hRfSuN+3Fp+zQF34ERhPyel0wansBA0JXB/+b6u5ENpDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0IYW6GJyVFiPWG2flp9VBNO5eU+viukK8rqNAbYods=;
 b=EnRaVg4o/b9OOC2Bc/NgrOZz8DrN0mFwNgxFufPtSC919i0YTO2B7j38koEBSjegO3+R2r45CakxOMC/ClH9yYDZ+HEZ+QM82+BAONaSOjazfEwpgBrliT51e5nuhRWg8aWcMFcnYirzxMkeq28NvaFlV/eW9UzlgQRp4mY4vndJsNiet2yy2Fm/3NSxnfkghwYzpQL5BZU83L2u3u18+ykNMY5MWZ7WOP4xafBZK765NqnJVbQXBjOdt46FxZa52hLYeqKyLeOJCgNA7sqxQsFiSu0/TZLHtWVJiO3mUf5YSWPSJ/pBO6Azph1XxHBYT0A3lL/nMU0lsY8eogqPBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM4PR12MB5264.namprd12.prod.outlook.com (2603:10b6:5:39c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 19:56:22 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:22 +0000
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
Subject: [PATCH v3 03/25] powerpc/iommu: Setup a default domain and remove set_platform_dma_ops
Date: Fri,  9 Jun 2023 16:55:51 -0300
Message-Id: <3-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::12) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM4PR12MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d642ef5-1a52-49e4-e529-08db692397eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rKFQY+kiusr0r9umgEWutoK/KiBT1UKltFa6/kDmFSugcYg3qtYnhkAX49knnHZ0kIvzoeX1KPzSTrRWJdCPJNFwZQQmOHcfoUXShxFkyjBat56mRRTShUMRn15xZ4qjvp7YxScYdEABue3DGy/tbHZ+rs2+9Txax49PT+QusG2vxJIyX1vmrf3ImpYDv5BOrBvKw9ZHinpa8ol0SRuotwLr7UOO49iC1/3YLyWnFDyiTg/xrbR1el9GMmDKWeHw9o0ZdjsK6DOLm5ya8yLDjDZP29P/HscGyD5tEvxqTxMNi3PBme6DPmazq4hnGr+Ls7wqUEhsM0tdDcjEOzpboJONlCq33tCAjIQzXYWCUl09ZkMsLywaCXkX0o+Nff5yyP4HtK0M+HJRQcY8/MyTMe9vdswoR0F6qVJ/NhHZqt0ZmMMmRSEKg0dZm9PC/z0vgYXK1RQ9BNDt6w7qGtH+tLC+K4LSnRT3kWqwkHLmTZ0vBszb5awpiKFbuXcM0S/rmNR3KuU7b5x8w4aPbgUgdaeFJDQx8P/jGnBpWjvMwtqM+6F5KlS6/guhS6LT49fjmZD/R7xLC09XvukyJADJ/JTeCqgvG6u0Srs6wIChRFNt045tSd7BTNnEGqULgSed
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(2906002)(83380400001)(36756003)(26005)(6512007)(6506007)(478600001)(54906003)(110136005)(107886003)(6486002)(6666004)(8936002)(7416002)(7406005)(5660300002)(2616005)(41300700001)(66946007)(66556008)(4326008)(66476007)(8676002)(186003)(316002)(38100700002)(921005)(86362001)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?UQDLPQ5GLbyN15x8e9YSsqYLMK4IsURS4f4x7TJpuRM/xosMwurF2o2SwYwz?=
 =?us-ascii?Q?+299SPiTmp51/m6qCy3FPA5GgphUTzz+l4Pr0OzEBc84jgbHescoLtNuV8PR?=
 =?us-ascii?Q?MpvlC0IOJDkWbNdxiwcmCHGt7iIl2UbathwIaWFzXnhqt+xWn9/O2Ei6EAyA?=
 =?us-ascii?Q?I8F9xnKOACq64nkgCqNwTIz35IkwxcrTOr44vX7dd0kwsnJFPBmVtDYXw+Zy?=
 =?us-ascii?Q?PJL63zcaowNiVTv6DGqo3XyQQ1U7u7vSd7vxSZU1i/S2SzOjY+PYlfu6Rw57?=
 =?us-ascii?Q?i8qQJiX8SnTFun7W57vLCx4/q7pZipxEkoPo6XCMiczXHu0oJu4cN3S9URml?=
 =?us-ascii?Q?I8WI2C0PKphbW0+afrfWBF0pyMWGPyTR0pafeBEY2ELtnhQLECYdksbWpiX/?=
 =?us-ascii?Q?SYf3OQfItMz5Lmld03gRCUKd4Uefsbz9A42pjthEH7Aba9738G5W7zAszZPJ?=
 =?us-ascii?Q?fZX/dTgY35alul4T5NivHfJxJ5i5CzFsUfOXM2/TVuPb48z0eiGjo+IlS4nw?=
 =?us-ascii?Q?zspl5aCeCBhCkTh+z7Li7ATXn9VvLpfXGV3VqLaXTALqVV5C3llVdTYR0dB1?=
 =?us-ascii?Q?gsFDCHXlsPhjDOuOcGdwGLxfph1nAhtNiLm00ps47/2Ogul+bmtYfBDyDp/a?=
 =?us-ascii?Q?PObRmftJZWVkCh2DSalrD3+yhTHJYWI4A6UhN+LqwMTfxVx0Ay56c/hMFom1?=
 =?us-ascii?Q?HmevVj+rhGvdrEtXKNSAtdlUqj5xUryEjzzB4obUu+Ooq5NTS6o3oQXrbt2G?=
 =?us-ascii?Q?yT4+plUzSpCWFBjilvkWC58hl970992+qs4qhBYpL70Rq5YnF1pY4abIeDvr?=
 =?us-ascii?Q?FHzEFWKgNQvvGs/+5kR8ERoh3GcMBDIRzcny7PWBt/gQ0Jf097GvDPhqyKpW?=
 =?us-ascii?Q?Z1C5jw4AaY5RDVVAyCxGEbM6xFiIJFFam4Vye4mXVQNt2lr6RH4HSOhJaTzC?=
 =?us-ascii?Q?rc6JoeyjnhvtAWYoypYuB9eX6hgy9X2RUXBBbhnCfq90w+KZxA7Q75QxWFry?=
 =?us-ascii?Q?mGxyi9u9PwmOfwmSu004bejRq28/ETIYrkPziOXAhnVvolC/KSGel83wSQu1?=
 =?us-ascii?Q?krRBryW+c4nyo6BFSbT7qLipi+zFF1xlwpa4JZS3J0NwWGxIibhpzaj/HTHG?=
 =?us-ascii?Q?00OoJ4OK/bEzEAHfvsVb2FdZ0vcW+LifsxPRJdQb9ycyIoKYSiZLOa18RzzJ?=
 =?us-ascii?Q?ltstg2Xqfc/N+THQAzsJB0nqOsU+/uXBVOPGVovEoilIPIjt7kfuEIuwNnhI?=
 =?us-ascii?Q?+4CbaW73DPOwFH5IMoaAKY9kWSV28QN0lLsphpImpdMPYlto9PE/4mmud5dN?=
 =?us-ascii?Q?UrbuZ8+d7NGA48VUJjFSgCP+Sz3AnfRPk3kcIyeo07lfEeOhIvXeNO7w5OSQ?=
 =?us-ascii?Q?qoTkTq3kQKWADkwGbK8+NQl4j5YHKIf8OyQB755Y+7txXb2X4kaWgcjZFdIw?=
 =?us-ascii?Q?46F+NJqLzoh/C7/XsGrDk4A7iP1XaPkEm0oVuasGHty07aKzlsXl6GejxJZ5?=
 =?us-ascii?Q?lexhdhzd40FoS+IEu1bV2bkCe6SJTa4FSBYWzdxKrqrg5+XzkLFOAbXWz32t?=
 =?us-ascii?Q?ZT9OdFkj+8B6wfGWUrOe9ACFlxygycZYXs4krS/j?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d642ef5-1a52-49e4-e529-08db692397eb
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:19.8574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u530dqdTyF9Vx21F9xSFVxtWsfL3EXm+j3/AhNMcWL92R+lEIfoPUtEgWOlQDgVx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5264
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

POWER is using the set_platform_dma_ops() callback to hook up its private
dma_ops, but this is buired under some indirection and is weirdly
happening for a BLOCKED domain as well.

For better documentation create a PLATFORM domain to manage the dma_ops,
since that is what it is for, and make the BLOCKED domain an alias for
it. BLOCKED is required for VFIO.

Also removes the leaky allocation of the BLOCKED domain by using a global
static.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/powerpc/kernel/iommu.c | 38 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 67f0b01e6ff575..0f17cd767e1676 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1266,7 +1266,7 @@ struct iommu_table_group_ops spapr_tce_table_group_ops = {
 /*
  * A simple iommu_ops to allow less cruft in generic VFIO code.
  */
-static int spapr_tce_blocking_iommu_attach_dev(struct iommu_domain *dom,
+static int spapr_tce_platform_iommu_attach_dev(struct iommu_domain *dom,
 					       struct device *dev)
 {
 	struct iommu_group *grp = iommu_group_get(dev);
@@ -1283,17 +1283,22 @@ static int spapr_tce_blocking_iommu_attach_dev(struct iommu_domain *dom,
 	return ret;
 }
 
-static void spapr_tce_blocking_iommu_set_platform_dma(struct device *dev)
-{
-	struct iommu_group *grp = iommu_group_get(dev);
-	struct iommu_table_group *table_group;
+static const struct iommu_domain_ops spapr_tce_platform_domain_ops = {
+	.attach_dev = spapr_tce_platform_iommu_attach_dev,
+};
 
-	table_group = iommu_group_get_iommudata(grp);
-	table_group->ops->release_ownership(table_group);
-}
+static struct iommu_domain spapr_tce_platform_domain = {
+	.type = IOMMU_DOMAIN_PLATFORM,
+	.ops = &spapr_tce_platform_domain_ops,
+};
 
-static const struct iommu_domain_ops spapr_tce_blocking_domain_ops = {
-	.attach_dev = spapr_tce_blocking_iommu_attach_dev,
+static struct iommu_domain spapr_tce_blocked_domain = {
+	.type = IOMMU_DOMAIN_BLOCKED,
+	/*
+	 * FIXME: SPAPR mixes blocked and platform behaviors, the blocked domain
+	 * also sets the dma_api ops
+	 */
+	.ops = &spapr_tce_platform_domain_ops,
 };
 
 static bool spapr_tce_iommu_capable(struct device *dev, enum iommu_cap cap)
@@ -1310,18 +1315,9 @@ static bool spapr_tce_iommu_capable(struct device *dev, enum iommu_cap cap)
 
 static struct iommu_domain *spapr_tce_iommu_domain_alloc(unsigned int type)
 {
-	struct iommu_domain *dom;
-
 	if (type != IOMMU_DOMAIN_BLOCKED)
 		return NULL;
-
-	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
-	if (!dom)
-		return NULL;
-
-	dom->ops = &spapr_tce_blocking_domain_ops;
-
-	return dom;
+	return &spapr_tce_blocked_domain;
 }
 
 static struct iommu_device *spapr_tce_iommu_probe_device(struct device *dev)
@@ -1357,12 +1353,12 @@ static struct iommu_group *spapr_tce_iommu_device_group(struct device *dev)
 }
 
 static const struct iommu_ops spapr_tce_iommu_ops = {
+	.default_domain = &spapr_tce_platform_domain,
 	.capable = spapr_tce_iommu_capable,
 	.domain_alloc = spapr_tce_iommu_domain_alloc,
 	.probe_device = spapr_tce_iommu_probe_device,
 	.release_device = spapr_tce_iommu_release_device,
 	.device_group = spapr_tce_iommu_device_group,
-	.set_platform_dma_ops = spapr_tce_blocking_iommu_set_platform_dma,
 };
 
 static struct attribute *spapr_tce_iommu_attrs[] = {
-- 
2.40.1

