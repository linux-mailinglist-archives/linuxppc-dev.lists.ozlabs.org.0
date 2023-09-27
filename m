Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FA67B0FAC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 01:53:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OVgdCtod;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rwthp4pMWz3dTq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 09:52:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OVgdCtod;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwtbC4BHWz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 09:48:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVGU3tCT7GxerTUReCbDQPzCEh1mylsXwncIQwX2Lx56J9dhZUNfcrDgUywFKSppHp3/03SMm1RHwUVl3BOKD3ZSF3HGEh3yMUgPClL38pNmrFI0W8iLhYM0rL09pB+Ba9rU+liSukZarOFraj49+r7Dfpw7B9iKMS38+lZ/C5pqQ7kvizkpRL8epdGI/07cblu7WpI7081X9DFECqKgjHvE6Bk3ZK5a52xZSp0eb7rylWgaUdFUHlujHWxD73wOfUYRx07e+Fu9wVOTQwR4jsosPqr0DsMzlVtmbms8+eZMLI9dV71oOZY0l0D1LZd97xDhPKVRYmQjtY8br/v97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/GGbYV1wY58i9EIyfGh01y7j+uWcA9Ew0V0DEWgx+k=;
 b=Jchtd0GotokSJGa/GnSeDqnS2Phzxrp4t9prr0NVgAFiiEL3q4kNW5bTVCcAZqL8P0oGFg9Q7GWpLrToK5kYQRl9q22YmdfVUx3fKei+/vP6p4XsdGUJZivY43uxFxUtzvR7UwYABAazkms0BcSacCOjd8126T5g+mYPnPi7TefGrOM3htfwlqNxg5665kvcHhy0s1AzKvKL2CBKS0CA6MJ4+6qIQCmLM4jIpV1Bj9KdfK/E0e6VRHmLrMsKOP4NSoGaiNlGS+g6r5KxAEHfbfv3rKxeBVFPPNltABjYV238f+1LXP590OTX3DeUBAXgxU8XGT/F4lc/ujSZ8qgR1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/GGbYV1wY58i9EIyfGh01y7j+uWcA9Ew0V0DEWgx+k=;
 b=OVgdCtodRHlDiXvndO4ibuKAQFnBQikQhenE59K+R0Cgu9ep+ijM46lx8yWhmBefWcg7Ef23nppol7Uzgnem5Cdnqog7E5D6OLhSjBcgNLn2GQ75dI1nF1stnpGkhZ9stztKu0+mirtx4lmdIM0Bf5FVETAEpDpZzP0kPI2nWUAvBkrev2yH/WuR5DVSbZYnXmVchYlVaVWf4z/8ydm+iEDQ78RTnHjS/diK5qa45F+dxE3sCwBIHrabwiEp0wSEKxa/CK/I4OrgJohsFulsCTCzFHQ7/4KpKlWCZUnDNsnYGuc7gQHSbb9kmwixgRwAzdlIf3TWq7UwldgnWYcdJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 27 Sep
 2023 23:47:43 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2%5]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 23:47:43 +0000
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
Subject: [PATCH v2 8/9] iommu/dart: Call apple_dart_finalize_domain() as part of alloc_paging()
Date: Wed, 27 Sep 2023 20:47:38 -0300
Message-ID: <8-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
In-Reply-To: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF0001641F.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:f) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW4PR12MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 813ec1ed-1a2f-4822-ab2f-08dbbfb4235a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bH7PxJL5BRcmiXiVnyJ0TWboLH/Pt3mTIy5Dstm2ntduCTyGrG7FGRjOHenqzUi6wZPO6HL4toWaec4VvO/X+2+g++9hamVVWlSbrbC1Ij5/sL4IOhLX02hyF9dyF7xgUeV7u6L/mo+KrVjndZrEKI0Q66MoznTQG0Z1hiZX5CIeOFDht+v6jy6Wv8O/iVfAOx2k3ahXScCGhH4nQbluh4lfFvKoHFeJivlCCUYXmJqSxkXUZBhpysz+forOFhbY8UK1pjkKXtvVUcalnGh8pxp55s8KaXxZpcvQUl+QbeUNGEn+lF2WKLDv8D0PUPHDOMcDz5sC6cmiOJ+7UbnquTykOQ1+i/NMu88KUQu2p+dCFunf9UdaHnx35n5ScGik6Gwv2K/d6SHAMt+uYWymP230DwYCW0O5/A4Kf6PKHsgu11jB+gV8I+G+wEta23AGq3PmHEWt32vJLI/xLQHAOiaOGOy7HFCC17nUIOAWspIYlMBRONmlvNl2sIqmgwePFPhqbgbazIQP0cZHuc4/4ORoMd5jrnAvRWgpk5HnGcRc9t85XNeGQATJYYpxGBfHGiN0Upa7umAmE65Tg0h6LUmhnlMrNqXeVvEfmuoa6tp0EQSd2/p0FyPCppE7tx5IOdtj7lrq9AC137UgyIud8c0CTzuKjPdUuOjL2JMGX8c=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(47660400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(6486002)(6666004)(478600001)(921005)(38100700002)(86362001)(2906002)(7416002)(41300700001)(83380400001)(6512007)(26005)(2616005)(36756003)(54906003)(5660300002)(66556008)(66946007)(316002)(110136005)(66476007)(4326008)(8676002)(8936002)(4216001)(46800400005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?TZb8DHUx/60IFr61LPwus3vo7bh1C4FZlC/s5HLcmQCSajQ6Zc1GuYEUxpiE?=
 =?us-ascii?Q?tYcMtyctSpE80QTP1IIAmz1MuzVZqPZlxhsDXhQ4YPorsB9uSSLfF+3KF41D?=
 =?us-ascii?Q?OT1kb3SmNpfAoxBMTysMTfrajNH666gHL2jSXlyvqb+IEJjtiXGJBIZZuVBK?=
 =?us-ascii?Q?U8wWFX4r2kbUhZl98U70iPZlXxi91Lm3ZlQsym+st5h7Cor1eQRgHkOid1AV?=
 =?us-ascii?Q?Jw57Jd0Z9hLH/RDv3vqmfBUISRxbPAOYY8aQS6CTy/o/cyH/9tZrf0qvUD5u?=
 =?us-ascii?Q?AZ8EXdMIk/NQCGY6/e3vxiznolIYdN9HdfNubZFV4A8NhAjcsF+q8ojjIBuJ?=
 =?us-ascii?Q?g8onLrLKXCXmgWnn+UMIeyKZwfI+6oeeqakJhqHUN+M7WSKbXWWeHz0vGNTU?=
 =?us-ascii?Q?/8gNwFNWLUSvpnfhDNFcsbexAs5F1iCwGCzZCEEhIQbFPlNK6zJlDdeXPtGP?=
 =?us-ascii?Q?1pTafkEosa88XNoA2M8huIiV2/VVIJmbjm9v/yCFQ1ss062+dcZOBlgd6u1k?=
 =?us-ascii?Q?pWt1JaVy/OAnv7QqbObGzkab2bOEnymcId8fKNr4PPoVzG53jU1RGuSiykFr?=
 =?us-ascii?Q?WiOqZPhMKJUiaZFxLo9bQgC+CrL0csXQv7o7/KoVgbmHQ07qF8r7JrINl1ml?=
 =?us-ascii?Q?eEvghuAua/7FiWsKWibC8R9oqjtKt1Mvdl/6qbE3hRrZyllB7ylNmKKki4SB?=
 =?us-ascii?Q?qq88AVXZawhsqcYeZ3IcjB3QfwIWyeYRrY+U7Ek2nz7Rj6Rn796A3xROf3Ri?=
 =?us-ascii?Q?0ibQhnwmiCdLEDfqhv5Z/H9nDwWbnxORE74nynM8gVSFdX2jvn7R+YY6DHkH?=
 =?us-ascii?Q?pz2y80uqULVg8k3dVltTORlb7XoPnYjphhg0piYmue56OgYh7RDNIs/OxLYN?=
 =?us-ascii?Q?5hm+C/y8KZ5Z+y6GBiDKPdHv3ebaBsEfJZ5Qc1DBp11W8WvrteMFPqDB/TyD?=
 =?us-ascii?Q?Rr77IBli8EPMZQhWAxtUGke3GdYDGgyTAGVpn+TsXIUH5EoL7WoC3yeJKG3w?=
 =?us-ascii?Q?S10JuAVOCnDqndP+ij7kNUfvU/n9LLs0X/u2AKpvHuh8IO8ADNzzKDe35yNP?=
 =?us-ascii?Q?2o3aPeAj5Av+eoGwnUFQ8xmuG+WrO9rvXWNG0avkuhB9Kb3UtPzjUiCnVkb3?=
 =?us-ascii?Q?HEEdW1cDuSnU6nhnkGy+Uk3Zam6WwTanTm7AuYd3jaVh/hHXZHj96MUg/K55?=
 =?us-ascii?Q?0uEVl2lpmOdZp6d5Ok7sU5WvHSrkcUHHsWu6i8ctfui2xaqE5yLPv/9M416d?=
 =?us-ascii?Q?2GePfciaqbX4j8JRD/MLB03vOCCZWAagcrm8lPKUhAe4bhZSGw1pQ6gUwYTJ?=
 =?us-ascii?Q?l/ozZpw8qqtuEvw1FbMPzDvBzeZ7YviZnZo4JiU7O0WbtsIII81vvgcKjBMq?=
 =?us-ascii?Q?lNL78yxpdsDeI5Pubfozxk+teywtKpgkvhoeb+53ctfnno4TfT58DgXzgz29?=
 =?us-ascii?Q?Hx+Om4QSAW/meJp2lOu1eHV6okpZd732yZUWyrt2mUbIylu1pS6yuB3+fZTr?=
 =?us-ascii?Q?hrsYTOv6rSkrNvtJ2QATOR0Ma0Uw5BPfxNt3qcZyey0iJADotKVfxZC3lMyh?=
 =?us-ascii?Q?lf8I4bSg7D98LDWv4+Ege6EkMwI+x9DViEw9uxmS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 813ec1ed-1a2f-4822-ab2f-08dbbfb4235a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 23:47:41.2013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 627xtSO6qR80neW05zDlh8PJgELzwCV1BDdotYS3WxAo1dezxZhyTTo0hfcqh8YQ
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

In many cases the dev argument will now be !NULL so we should use it to
finalize the domain at allocation.

Make apple_dart_finalize_domain() accept the correct type.

Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/apple-dart.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 2566cf3111c7c1..126da0d89f0dd4 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -568,10 +568,9 @@ apple_dart_setup_translation(struct apple_dart_domain *domain,
 	stream_map->dart->hw->invalidate_tlb(stream_map);
 }
 
-static int apple_dart_finalize_domain(struct iommu_domain *domain,
+static int apple_dart_finalize_domain(struct apple_dart_domain *dart_domain,
 				      struct apple_dart_master_cfg *cfg)
 {
-	struct apple_dart_domain *dart_domain = to_dart_domain(domain);
 	struct apple_dart *dart = cfg->stream_maps[0].dart;
 	struct io_pgtable_cfg pgtbl_cfg;
 	int ret = 0;
@@ -597,17 +596,18 @@ static int apple_dart_finalize_domain(struct iommu_domain *domain,
 		.iommu_dev = dart->dev,
 	};
 
-	dart_domain->pgtbl_ops =
-		alloc_io_pgtable_ops(dart->hw->fmt, &pgtbl_cfg, domain);
+	dart_domain->pgtbl_ops = alloc_io_pgtable_ops(dart->hw->fmt, &pgtbl_cfg,
+						      &dart_domain->domain);
 	if (!dart_domain->pgtbl_ops) {
 		ret = -ENOMEM;
 		goto done;
 	}
 
-	domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
-	domain->geometry.aperture_start = 0;
-	domain->geometry.aperture_end = (dma_addr_t)DMA_BIT_MASK(dart->ias);
-	domain->geometry.force_aperture = true;
+	dart_domain->domain.pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
+	dart_domain->domain.geometry.aperture_start = 0;
+	dart_domain->domain.geometry.aperture_end =
+		(dma_addr_t)DMA_BIT_MASK(dart->ias);
+	dart_domain->domain.geometry.force_aperture = true;
 
 	dart_domain->finalized = true;
 
@@ -662,7 +662,7 @@ static int apple_dart_attach_dev_paging(struct iommu_domain *domain,
 	if (cfg->stream_maps[0].dart->force_bypass)
 		return -EINVAL;
 
-	ret = apple_dart_finalize_domain(domain, cfg);
+	ret = apple_dart_finalize_domain(dart_domain, cfg);
 	if (ret)
 		return ret;
 
@@ -758,6 +758,16 @@ static struct iommu_domain *apple_dart_domain_alloc_paging(struct device *dev)
 
 	mutex_init(&dart_domain->init_lock);
 
+	if (dev) {
+		struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
+		int ret;
+
+		ret = apple_dart_finalize_domain(dart_domain, cfg);
+		if (ret) {
+			kfree(dart_domain);
+			return ERR_PTR(ret);
+		}
+	}
 	return &dart_domain->domain;
 }
 
-- 
2.42.0

