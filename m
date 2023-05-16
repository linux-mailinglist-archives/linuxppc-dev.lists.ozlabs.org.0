Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAB5704240
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:22:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxkf4Df9z3f7N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:22:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CQXJZ5ul;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::60d; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CQXJZ5ul;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxH475Hcz3f7j
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeaFIP8lEaFFUGWZoam/BQDoWarJuaudpU4r8SthZ1wD45aMSCaHdGwt/Zc5oLeE/LmO6/tQCj3iE/iFEKESE7cYMiucK6JGnwDlHWyedZ4YdjPZT4FsAs5JkpOahy4ntOkPIF1lLQgUS3WwLZ9nkOpji/Lv005VkFq39pjU2lvvlibPa551JyZgE9JQCxOi5UUnAIfKloKcbpxeL1kVF4aK8WormxtIdVzX/y0WCQyELF1XvvMUmJ7yjUrwUQo2nd6zKsfDwZAVowAhEHC3wn2kKQsGxbAZ8wGOKWR6pVloFdf/27KfpncCgAzQ7Vv2Uzi3xqq2dYB13lD4Yqf3vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFp0uU5OcIBZ9MCqfDBCyxVD3brU/ReR6xoQJy2wke8=;
 b=EEiS+aK8eM2PNDE+xmF/BdeFQr3JrI8PumUOuF5w001MG1h0qkfa+jS6uSRGN6mTqWsH2c9QvQF8ZzoVl/43Z0vmb+47AjZoEyKf35snr22SHbCvjxWQHgFNtKqhJPwx6VBg93lCNNce1GofKOT/1MyrwUaC+xPduoQjLdeA9gov/R1KwXSzaqxW3Tj0zVXNBzlV23i+ZK1MEwAkh0B9fwdT+98PunIoUjTQK/YqbNt4ABzpHugaXzms0ub2JNKcYTa9bq//V4yyLfbXivcNU7c0HRo4yaM6MB3ciMwSakLAr4N2uRMvXABlSiqp8wHhD+rM7ZAQBvumA31rlg7g5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFp0uU5OcIBZ9MCqfDBCyxVD3brU/ReR6xoQJy2wke8=;
 b=CQXJZ5ulrJhjaSh/CMGbj3c8Zw/zOIpjGztosFzaC9eAgobNuLVm9Pjy31y5TmHazJ12r1fO3CUcG0rE+niALQEAM8inWLfs92Fl80Vl1mfg+vFVriNYyhM5+Y9GXw8dzfqA3CuH2Or8JvsCA5fZNWf3QMyFm8YfSJCgNx16ofRt1XANMQjIzUq8ncaIpKKaC0SMZyI+pMaSsjChjEsV6Tm+K56/7BpcGiMWE8SQ/TGj2zKCMqZtRQhHOeYdsGnxjUJITIdsos/BI03dmMFk/nzaeJAttrcXaPSfIy1Ez1DINRJov7S/Ie1hwe+M5S1B0ScQdYbDWeeTqs4h7L93nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:11 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:11 +0000
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
Subject: [PATCH v2 03/25] powerpc/iommu: Setup a default domain and remove set_platform_dma_ops
Date: Mon, 15 May 2023 21:00:36 -0300
Message-Id: <3-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0046.namprd15.prod.outlook.com
 (2603:10b6:208:237::15) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: 766139ef-eb8e-475d-f37d-08db55a0a329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	08Q9lbueY1RpvQ9cb4Ty1jrRAhVRlJuSetM3E9LSX1Dj4bQfcQhwZt/j8id/3pVNHoNhXrLgFOPRwI2NOuQZrp2+q3LJojhwIGU0VguSaWYF2NYDcmxTuXWaE1S+6rWWtGmmQkz/p3698pZZaXwspy2LHoYyCKFruSpJMGaYUA9YvU1eZtl01hjrG8ZL0TGx8RQeu5Qj2+YWBtOLDhbHs0M9tlPIP5v0dRmqVq3DGAtc0ixPzcfPTbg83JUZtK2uIzsx819ejRRvfGpHK92BEF1TIZ/rK6kuZ8d86caoH3uovxiW935II5T52dVa8hEb75PVuVRB9zhJfOVL9vDS1JpetPGvSRfVxJ2KX+NyGyLEKiOVSSjBu5SZs3pFiKNh8KvcK1IfUgCz0kInpHfP+eqCgGG2stXY+izmLsvC3sBjhPzOvaAmr+uz5/XY3tOwZa+VXjLB0Mkj3dmrrgwozhF6a9bceRFJ4qWAMTK0gFarli3Bs2PGrLtLFOu+IvncsXM+wTRmLWrMl/IiUcPQ/mtg4Kz5ZbBkSZV5/tgRoyX3LRZ2S+J2tVaaC2tj7KPUmJ9i5nYozhvcq4FhsMzxvuvYEgaoh4Ak65F72TnEgnJRRlUwLfjtGhUSckUaeWj9
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(36756003)(110136005)(54906003)(478600001)(38100700002)(41300700001)(7416002)(7406005)(8676002)(8936002)(5660300002)(2906002)(316002)(921005)(4326008)(66476007)(66946007)(66556008)(6506007)(6512007)(107886003)(86362001)(26005)(186003)(83380400001)(2616005)(6486002)(6666004)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?NwHI7ilOJ86cdwPoS9gegZPcWRTugwkvuA/vFMS/+5/bh5qPAO+42W0vG6oK?=
 =?us-ascii?Q?ONMj1R1KLKZS+EdG0Y7kDhA5nXPYTCtYXYTa9I43OwdcSFrsxn4+wivWcnp/?=
 =?us-ascii?Q?8JMl59E6Y/2tfj/ZjCwPsHNrpulagSJaBF3K0MdTyGkSyIVh5PenmEioSXJ1?=
 =?us-ascii?Q?SVPp3bevzbyFjPSh6hNGGer9fIG1iGGwhAA+W6OWWdeZSv53gbtq85aocW6A?=
 =?us-ascii?Q?X0C6jrAu0EyW0wHK1nIHqcUS4VdXFFry5qK1zOouqzR/Ehk0bVabtawl3J/G?=
 =?us-ascii?Q?bm7Rh6qWYHUEle7FfiISwVC2kQlHDrwqn4FdOdyPRMQXJGqQjpvy2yBFtZ6B?=
 =?us-ascii?Q?GO2YV1eN3Gr8BSwztMhWQkqZqLYY43vML8eJc5uS3KZe+jeFni9lOoQB4h//?=
 =?us-ascii?Q?v0GGBBnkmD2p6e0F576gspNDGSLZS7hARvEEHEleU5zpcvg+Jch4q0lPeKON?=
 =?us-ascii?Q?jE3SshmGhR5jOANP8VYfApEvN2A9tq4w118G8nmHLUFLCOfQPK5tzznL0Wo4?=
 =?us-ascii?Q?qDotIsUak3gyeyx1ZcsN0ZIPd5qkKGq8W+QJWCimMrUZakTjZPHnpdVf9ZU4?=
 =?us-ascii?Q?9Zbs8LqIgXhPy4amPUTGshgWSvr+0/QLtpsQlTQgLvpDiKGej+aAIfx2odoG?=
 =?us-ascii?Q?2yHGI0cc7Fl9mzo81Mp4Bikt2f33QFEdIR5Cr/w4GcHo5qvbzUWHIwHMyiLa?=
 =?us-ascii?Q?FIJpbijh39+kliFrd27NXKhDbc75S/TJ+j49Vo2xHNnkmOwk32/HHj1TsZOL?=
 =?us-ascii?Q?c9cxgvEHvadM6lmji8mbrzqsMkYm5Hmkb4a9JtMIiJrW0ggLQ1S+tq/adWpq?=
 =?us-ascii?Q?Emw2gruiOOy7HvBPZ6P9/4BF83bgQMQWs9hVuoSKEnNQ3bLZmSXF+Df2wBCd?=
 =?us-ascii?Q?MObpiU2978840L+UgBn3AuRPKav+K+UZ1zCZkdwqxiCh3CQ18NTGhE98y5HW?=
 =?us-ascii?Q?Kh0AF2euHks05i9OTamsTGJz2pFikGKoi9K36B4jvSKmcuaHS1TIfLA8P5mi?=
 =?us-ascii?Q?KtvcKLFJaVO2srmpXzoVBOf+ZkoBDx3QOnXYTpwxRcpuOWe4HSovW8CkMmBT?=
 =?us-ascii?Q?C9awj/xJSJehzvy59EnasaBLkL93xlgr6Bxxnc49Z8eiw9/04a0EXl6N5mfh?=
 =?us-ascii?Q?mI8eo/+ywCIng4110CW65OLyaqjpS3Y9Oo6CVt47VH3D95PFFV5rm+oGXd6i?=
 =?us-ascii?Q?u67YbWP+6eFseg3/2201we8VsZhAmg2imzAP6pLPEkeXPPExzuciiE+ip/WR?=
 =?us-ascii?Q?J9PcZDML1d9DbTEVGTFos9Nl8mWx7D2RzWyDUlHemp6CFZzsMYP0ksWnDYcQ?=
 =?us-ascii?Q?6nQP4Ng1FHt/0NbVKTAfOudn+udtdf2p9jNsn5Pl+m0dRIlHirvqryURGLkU?=
 =?us-ascii?Q?B6ot3NLQBZ3PeAbXUmdqZOB1Tbbx1+zSLQo8mfPLn4jJvaXRoPsu1p11LEyn?=
 =?us-ascii?Q?Qy+UDDizoW/WOizGZgi1FDOSgQ0cSOX4M1G3uFfKJms5l5MmE0riOZfqrsHK?=
 =?us-ascii?Q?sjrVxST/6uI4+bnfHLlKCM/pzahfG3/X4PdIKjKRp+Q3LkT3M8bTHJAWpbue?=
 =?us-ascii?Q?41GF9+x49+95/rdFItw2G9XSph+dtodgWIXD9EUj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766139ef-eb8e-475d-f37d-08db55a0a329
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:02.5592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6607wPgbohYd3L2B7ngzqw9YXTIgs4qcc1bRHDcZDnFa0lNoXn9BR5Aq/LmcPe1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6634
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
index 0089dd49b4cbf7..db32355ba9aebc 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1280,7 +1280,7 @@ struct iommu_table_group_ops spapr_tce_table_group_ops = {
 /*
  * A simple iommu_ops to allow less cruft in generic VFIO code.
  */
-static int spapr_tce_blocking_iommu_attach_dev(struct iommu_domain *dom,
+static int spapr_tce_platform_iommu_attach_dev(struct iommu_domain *dom,
 					       struct device *dev)
 {
 	struct iommu_group *grp = iommu_group_get(dev);
@@ -1297,17 +1297,22 @@ static int spapr_tce_blocking_iommu_attach_dev(struct iommu_domain *dom,
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
@@ -1324,18 +1329,9 @@ static bool spapr_tce_iommu_capable(struct device *dev, enum iommu_cap cap)
 
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
@@ -1371,12 +1367,12 @@ static struct iommu_group *spapr_tce_iommu_device_group(struct device *dev)
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

