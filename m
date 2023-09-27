Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D10AF7B0FB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 01:56:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Qmlfu+GX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rwtmf4gmdz3ckB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 09:56:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Qmlfu+GX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwtbF0Ydlz3bwb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 09:48:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=If2+lTDg31Jn7CeWslNxTDC8x1JWJdid3kWS7LQ7cdEJHPAV7A00AwAzFz3s/Nl9MjzrXqdUtAhbP43sGz4/0LwmCW+fnYBOrc2gsJHUfcBb3oglo8kWiGHEa5Metx1ZJ5o1TEIFh2GOwUqxSZYkehH2+QW19P+9xrNX6h6YnCzhulqIi/569/SVYExHldyxsjpKuguZlhJnd2hCE0fOHzR4ZdvO0YjFKzY2lswHEtzaZMFmGnXXB8gdIJOBlCED6GxWnHBRngWtb1DQ6JArvD1U/MSXOWInStm6IbJzrANvMCI/mYf9YCPYGfffPVhfD9XiY/EXgCDcoy0KdFdvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q6Nko7AUHCFkV7BDAWnuPhxdQZq513EjLqRdzOhjzpw=;
 b=DyXo5af2G7O7itxwSZOyNyQtNMUtP4SbRx6wrb5zFStSawsqMkmBO145tlDI1uJ+IuEuzQkidJA6zlIxz6L9bD1p6V0E/EG+PrC3gDKiHIL3679vkPY1/l2kU8YaP9w7ZDLG5xO9nFRPk+5Gm/j3iW2qz3QThlCq+BT5vSGUJyBwiw3llwn6xz9+wmIko1ga5fSBW6N+3Ky4X/J1uS1Y9UPYqGvj0JWnZ+foYXSDBwv12jA7W1sVZk45TISmpQ2jUWxv2D3ojyw6IWtNt4TdirKrTbVdFoVJp/PLG0MWgoAoXzNj4k8iw6kRmnLJo+sUMfIVyzRhJsM2LovVtkF9og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q6Nko7AUHCFkV7BDAWnuPhxdQZq513EjLqRdzOhjzpw=;
 b=Qmlfu+GXya2seXT/MiZpFU3CdsKTj83IAMBu+SBy15XI1QZ2bHLgRHyAh60WRzB6q5dCdiR6s+oOX2h7dtzHQjnOjWUezkplpWHCHc7LxgmKJ/6aIQ09d+sG634iHY81NdaavWBXrreyqRN/bwLkc+FqFi4ABRnpo8a0b6BBL+JbpEyNjne48EJYmIxOuUkq9raOI1OiWJ54xpNscR9OV6Belvu/hbpL9A+XH+TUi0GiB0/upcm/sTFgy2Aq92YAj688/u5xNZhPy0zZ9mPSFPfyr92g6fuPZk3zt9k5OhJgJEGGBhgmogXA6jvfDFObEkQLBr92ThSAZIbPSLQy7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 27 Sep
 2023 23:47:46 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2%5]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 23:47:46 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	David Woodhouse <dwmw2@infradead.org>,
	iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Hector Martin <marcan@marcan.st>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 2/9] iommu/vt-d: Update the definition of the blocking domain
Date: Wed, 27 Sep 2023 20:47:32 -0300
Message-ID: <2-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
In-Reply-To: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF0001641B.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:10) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW4PR12MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: a14f099e-e754-492a-9089-08dbbfb423a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+gKru9RDFHX2iJd3bKZkJNMrstQxyVc5WjihGfD+8URIkjwex9LBe4yTJ7QzLrO3tEgu/jPg0eQEAqy8Jl7wbezFNan3hyYbFY5sL0OA42s+I4v5/GZKpTEAmuOHoD3jSnbGlvQRaa/AJO0M51kllGraNSDyEow+ggWjaY8r2gRvi/zdvVf1BKdhqDhTL8nF91XtcSxAKONV7RYIVxMf1TdNQRJvkmXt6vU3xc7bb930gqx1q6VUIq8BrN9ele/YUMlvn+W1NaWfKXh8A/SvOp0KaIh8UqSp7WrO86XbeSICYWWaTxPg0okOWZT0Q7Wg3+6w9gSQ9U0rbgtku/4U939A30qdlW7XuxJXIH2gtZyk0JbZCdP0xy8PCyEplcHgP5w8wMtowyWXIcRc7NUtr0C6QBJB3691ZuXWYynGPWljsdqRPXhmeFlsls9gbcpkkBvRxq8yNi94VcA6Iowp6/r7EuGj1e/yRZiQlAx/HlP6LZcfrl925syFKKUhzFuDd+egEOAQ8QdcOLvlE+75KrlW96Y+WPkKQIfn/BI4F8FVSUaUEzTUky/6gi8OQJUYQ+uIzeTtouPok9X5B7fGaxdRZcbZ6wrUxXM6Oba0NV0AnZiM/f8viX23pa+xv3oC
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(6486002)(6666004)(478600001)(921005)(38100700002)(86362001)(2906002)(7416002)(41300700001)(83380400001)(6512007)(26005)(2616005)(36756003)(54906003)(5660300002)(66556008)(66946007)(316002)(110136005)(66476007)(4326008)(8676002)(8936002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?V58RtFLSNECQD2aL/rx4LFY7wp6Jr2DHWiWfyTqDuCfApSNcWs3CsNIFsPlS?=
 =?us-ascii?Q?tns/Xe4ea5lJHjQdq8Ma6x4JqxRBYx2ey6tHkZxyi2Bp0T6zQJwabDocfzqs?=
 =?us-ascii?Q?EuPbUcyFbGOWrRketkGvMoHalR46FMC6m9TBJoMgcTjB/19MXhNE2baiNPZU?=
 =?us-ascii?Q?62Je8N5ErHpswjhXst4vlbxr/6nOy8iwQX4pdkjVi14WEi7OP+rVxLR5I3Y9?=
 =?us-ascii?Q?6qr4fclga3Ws4J8ubOkKAABVBP8wakCx9ViUw816lpz6KnxUBGP/63uuM9sw?=
 =?us-ascii?Q?+0GGerSmFULv/LUaULx6PaU5mOskD9Py96Urdvhg9MGra0ckPqw19EJUviX0?=
 =?us-ascii?Q?MeKywN0/+JoIC4y7Q0R0p/Ycfye3wVYrzR5PTpnIxDUKr1DA46SVy+Vf23Sb?=
 =?us-ascii?Q?wz4+wTPM5APM7lydhg6HfZ53F0ZINiCD19Q3GT8w6MkA9/vOU/U5w6fBGQQR?=
 =?us-ascii?Q?d+RtyFvFQtvIoN9DVH1yScHvHitTaXFpulVSq/JM+DtwxzVI3MZG4fIa48Rf?=
 =?us-ascii?Q?U63Nr9bNZQPL4a8D4LhPahQqkM3ekdfdi6eudo2Zs7tZEEWpbXTyajLeuTHw?=
 =?us-ascii?Q?b7j/ZD77wvHt1mznmIms+ZH+3qRXbYqaAtj3oyWRZYtooVNSAiUtxiejWloH?=
 =?us-ascii?Q?107/fxFFH2k8QtxVxDYZjCymRxxJjw9ZC22yZE+knSn5QrD4/Ng1J4sdqhw+?=
 =?us-ascii?Q?94gEZ0xLFhLwbYRG0iSZydz5WZak1Iw9eoYNWEtiTro27JEm8LAI+LrcDUMX?=
 =?us-ascii?Q?p4GUDawCgPSiZ90IUwExG1nWq5yTFZG1rkzrrAiIcRNNgM3F1r/+8fIW9L1H?=
 =?us-ascii?Q?Q1AwQjvQh3BNo9PhBpHRwAbGkVuA/Bavs4j82EsehD9EQrl50D0I0ZRnu1dq?=
 =?us-ascii?Q?w7GcvQCe5QC/MgmS4PxRZD3hPW+nRRpIoNLmy9a7JqIaYnrI5IXxulwtNOkQ?=
 =?us-ascii?Q?1/4amPZFmn1Geas2JpHARMGLIdjxKowAKvz5xHuTLaQ82yLnTu5O08WDWiBV?=
 =?us-ascii?Q?UFfiq1T3lSyJipZsUZ+CEy7v2t0v3dh5bqp5tChg+sTUbTzseSW+cI/BaKa1?=
 =?us-ascii?Q?KZz0shsCpvMnoo2z/nMlQnDfjp5CWlGJUtg9861p09A06d3OEliIjTnC+LSy?=
 =?us-ascii?Q?jZkjXZ2pRQICJ0UI07fc4cbRXp+pewsrM76SPhJ5gn2ANG+ah0M+4nTFyRC7?=
 =?us-ascii?Q?LhhgM0Z/YpjQ1K/mgCgBrE3QrtW2ed3QZx+D4s8O4O+/XKow6tRGXGOsDe93?=
 =?us-ascii?Q?Ey1ulwjURE8ho6pOTKcCKHJzY2udqRLENabWuwctDtYMJQnj+Shfw1A6IiCJ?=
 =?us-ascii?Q?kKvAApCxC31F98o5Odcsmbm9Wr6t8BOQBHJl9OI0gGO0SrBJwveVncbJOAIt?=
 =?us-ascii?Q?OzQC493WQ+FqNY5eWQzXrGCb2ddBhwsrbl3fPIjQgPi6BUVGFDSy1JZpVLRr?=
 =?us-ascii?Q?Vjib+U8yNuCwkqY7x/hBFm8FST+6++uhI678icz1NHYhW/moEzcJzrhPavO+?=
 =?us-ascii?Q?U4etGFuBe6rQu174ICZsGnWHfzTuIXwP996lKVGcInDjR8ng7eiVsiWBqz9H?=
 =?us-ascii?Q?JBu4OcoKkeLX8kKaemza/7zDlqRACfSW2I6888M3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a14f099e-e754-492a-9089-08dbbfb423a4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 23:47:41.6926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjJTtuNCb2VzWcs7NC5oNua/4dneDHQTtAmOgXKSixxZPHPIitGJ9V1AnteIRCAj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6921
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
Cc: Janne Grunau <j@jannau.net>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The global static should pre-define the type and the NOP free function can
be now left as NULL.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/intel/iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 3685ba90ec88e8..ba9db95d2f1c5e 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4013,9 +4013,9 @@ static int blocking_domain_attach_dev(struct iommu_domain *domain,
 }
 
 static struct iommu_domain blocking_domain = {
+	.type = IOMMU_DOMAIN_BLOCKED,
 	.ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= blocking_domain_attach_dev,
-		.free		= intel_iommu_domain_free
 	}
 };
 
@@ -4060,7 +4060,7 @@ static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
 
 static void intel_iommu_domain_free(struct iommu_domain *domain)
 {
-	if (domain != &si_domain->domain && domain != &blocking_domain)
+	if (domain != &si_domain->domain)
 		domain_exit(to_dmar_domain(domain));
 }
 
-- 
2.42.0

