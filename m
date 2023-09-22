Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EC77AB6EC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 19:13:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uVVau97g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rsf3t4KKFz3dJ4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 03:13:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uVVau97g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e83::61a; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rsdy70pPMz3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Sep 2023 03:08:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WExkSUM56iaoSaj9otrqhkDNs8g9C0Sw0iHU8EC+EeoF8vlo44GRd7oissm4k1MbMfTgnDDTKJnFeDUP601sRSGgtXBrzRZjghcOuyVCPfKDpVHEkt2iuEeHHfH8aWeKWYqinOb5xW+eFw88LbgLjI06MmNu2bSFcnR0SXgDRlnZrAVR+PMAAzBROy1qAvyLfLrzBFldrDXqSjZ1mVVL1CXeTl3KbfvQiquq1Zb5+4CY4FgfIjMMXNdm8v4cHGBo7KRmX6eS4Aip6q3aPRsWNvjvyAWiSo072O6NTKZpZYEE5M9NJp3mcIJvbSIPskZvE6d92gGEbc8sKa6sR+FQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jr/5KfPoaUuyX/C6S7jT78l1e3DHs14ebOVrB52vXx4=;
 b=f2mxAvXwssVJRiCv2koBj20fGt8HkEmQDDKWvJsxqZWvDii8+sJqZ9ILUuK2yd+elh/7E3DbNAA1REEUz2hc21mXNkZ9ZB53IhticDY+t0O+PalUKhXpfhos8Y7eHgPi2kKoEFVciQKN9ej55XXCMeiXihPz1Lx+z7EBbe9Dk0LvEm7XBmQ2OTFD/DaAXu2ox12vzxXrc5UVKLp8h6yMZIr8Zb8B5TlmHO37t25FBiuvAHCG8a8vOiv84+XRArR5NCb5j8XnBLAdhExrMfUYaiZW28v4rWdUvG7tGb+yRBSq9WzTsr5xhWL4HWC6eMTLvm/CwYXWWIhGNv+quGuYwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jr/5KfPoaUuyX/C6S7jT78l1e3DHs14ebOVrB52vXx4=;
 b=uVVau97gSToz2NAylJ/GfNOEk84efyh7nIJsZ+LaSavaIWxS87xUWVOIiwnmvOm/st2u5IHSnnWAE6jBN9fYo+5TVrenfnze+xjyS8kVMsoukEeDBkdQOLMOx11dpfXul8p5OIvN1lR2pK+Fxp/ak/N9Kc0Xp5O5/YRkQYpK/lD1I3lSRwHh7yRZNoQSNY3ZxFFXTA0ZbTtx8vSzVgGKb2Gky57wA2G1d26HPKTxedV4wPEA/jpGKueRYA0Xz6fgQzxcbMhRiJRix31O3w/HFbERYuQR4y3/9qFLAg6gB9Z64nvExUktXkCjmuuGW0lwpBbjbENZgWd+oFJ6OfpdWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Fri, 22 Sep
 2023 17:08:03 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6792.026; Fri, 22 Sep 2023
 17:08:03 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
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
Subject: [PATCH 8/8] iommu/dart: Call apple_dart_finalize_domain() as part of alloc_paging()
Date: Fri, 22 Sep 2023 14:07:59 -0300
Message-ID: <8-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
In-Reply-To: <0-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0041.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::13) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 358646d3-3923-4b76-ddcf-08dbbb8e7a68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	LrlUM4cwssPclYgBnaWlPyV8uKn1JqWai4Ot2F+HLet7LImCye8skeOxwpXw9MoiUKtd8K27pnP78PpvLViUUCmmfKDJo6cRJLXFbB2FBEnsu1jAxR04weRITJIboJL1+sz9BTppeMEI4sbPAkI+uWjQJs3YMX8/txND0RBy8uANkXmbne3d4n1D6F9wS1egb2Sj91WAKQJ1MYUHEOFJ8p6dBEhbgjGxkRi2sY6byOnFORVkNZBZC7oPvn3fWuj5VFgcs6fxPgQX+ZzX8NMhzFNVqOUwANcGjwmGqH5VSwZWJ6WzGk3tyD8rRk5isr/34zF4kBOuaHEVyFiF6pjflJCUPIuAb8ocHOCTebNRJq4E+9nfkT6fnw0K9gPNNs3HCTEjifzoiT1x9gBC0b3QuULs7YSpJuakbXFSZBUTbp7L70pTmIpDhQ9J49hRHSq4g4Ei0C8/cIxbRcIIsrrVk0KX+zWqLRhz9n/IVuJ2fscdqoXGwHXlgci2HqKXC+83/l9uwEgppOD5rL1OH6+uRHoxGJOKkKmB4IsYMy1rJj1u5//l3+2L7dhqFam+imempK2ym7I537KHY7NtVzn3t+BDsWK5DETcBbO2+ckRs+hbmucqM+KIjkiM59yhixIzoRlY16iRnTb2xuGXEfRWoRFpCOHjODft/6yeTTTDo0w=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(47660400002)(186009)(1800799009)(451199024)(921005)(26005)(8936002)(2616005)(8676002)(7416002)(83380400001)(2906002)(36756003)(86362001)(6486002)(6506007)(478600001)(6666004)(5660300002)(38100700002)(6512007)(66946007)(110136005)(41300700001)(66556008)(316002)(66476007)(4216001)(46800400005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?huNYxPONj2sdNNWT5TW25TTi1k+mnMlTWBQMpBm5OunvMdr2Ldosacs7CFzr?=
 =?us-ascii?Q?SDfrQr5bzeKIqB+87kOXMR2bibIXwJYZuU8NLeri14yYtguD+AYhrDH+z61M?=
 =?us-ascii?Q?yvN3XHuN2JeUDVmBxfOi9HLZiMUSjx+KDd4h/AUM1JV3ywurnoxOd6Si7U9J?=
 =?us-ascii?Q?W2wYosAKD0w7wV6beBJ0T77I51QcJOyC32I5S2o7II/MvBGtWFkZkG9G88VJ?=
 =?us-ascii?Q?ffqwMHDgveL7kY5HNVQCVH0QP5tiyFYO2Ig1JUZJO2/Yj8iffLcjgmbWZv7V?=
 =?us-ascii?Q?MGzohHzeV11YL7qWoPsFR3o4Bm4e7kn0EbTkNRAVok+dDzYsrrQyBnLpiq5F?=
 =?us-ascii?Q?6A1dTz4Z/AmE1lBCYeilLEncFMJgAzafYC/P9uT85p8t+BUvj2pV6lsWfa+4?=
 =?us-ascii?Q?y8Ok0dZR1wMRnkrOwDEfnjNz6LY2UBsTDmTA3AJueJyU8QhNRBjLa6TvbwyE?=
 =?us-ascii?Q?yjTLbNY2u9Bpt9qO/DDpjefYFs5h30WhTwmidaA9CYxI6z1X89IOJVTDz2/9?=
 =?us-ascii?Q?IoHL0qYWaZTmnJljNn7EpdGS7yWTUw7SRIRBCElKl0IywmXNq81vuBss0dsf?=
 =?us-ascii?Q?CyrL/0G7mUE3hcFvFxlsdfZwvFs+9/eXYAAZtu4riwzGKBAi/bNg2r0H0bAR?=
 =?us-ascii?Q?FWRH0BtCKoYCvy3cgKySTetNC9QpP8t/vEKYVnParZ+Zi24uiWHzJsMGISWG?=
 =?us-ascii?Q?mzuYU5rO1meOKrWN3ZxkKdGQDSbe1UYUcQV1jCbabdzoQ8Vi6O1wqBszj2Ge?=
 =?us-ascii?Q?iCvpkGQFTuYw3Y8rMeQRps6S7JPj0QkmOl5ZO9XYMDMBs0g93LEiYKQOoWbc?=
 =?us-ascii?Q?+7qbREa4G00xDfgKnuA7aYzj6gtDmOBIqxXI925BzzkcKXqrvfpeU/m6iy9c?=
 =?us-ascii?Q?ZeiUOvyJft+u5pnKQ0pAXS7sNkVxg7riD/xNKnZCuBh7RXnBxPoS8TDr3dEz?=
 =?us-ascii?Q?6CtzDjWeDjKYFDOwlhNUH31q1hSBKvVuMiGNNupzL+2MyVNSTt7IXwC6+4zR?=
 =?us-ascii?Q?61t6w3lcDbKpuaMe6DIvwg0CmbG6m179NifsRf2ezY+rZ2XJLZ8MlyJ+8NUx?=
 =?us-ascii?Q?gjJ/xZbxfy6V/oT/SHXDjYI9DI4k92ksM6fqpllrwrvJGPYtT43M02Wmv5lq?=
 =?us-ascii?Q?K8ZATeJ7GMpCBToIQ3BWYEYrCXz53642pG+Hgvafm5Dwm5PVjpxsLoAKAlA8?=
 =?us-ascii?Q?O39DaP+qEnRRHWXQsPT70kgrTGwtk9bpy+Dm2z2Cf/yE4Nm6fEga/+XG4p6I?=
 =?us-ascii?Q?Bt8dwnfRu3oPDMUdL3SixC9+KPFaKPAkGORp+hLmWyCq7jIHS/0MpRBgP4+D?=
 =?us-ascii?Q?DT67EZ7luJB6PsZcxsEElSNguBOmH4tNJEkrnUklUBadt41b/3ueq952/M5G?=
 =?us-ascii?Q?0yMbd+N4xHgS9kVOmGyvGrNMrmCZLpS9WYeTNbl0tICUJ9+1iTyigyRlxAi5?=
 =?us-ascii?Q?zvizjGCO2s333qz/I2EQmy+xTeXQ/hF/7nHs7sOUyoOfBiLOnCDCR3yR5NBI?=
 =?us-ascii?Q?elr3LT154pMnykZlpGNdUstmOo+y6t5AjkyBI3acPF3AHX7VRpgbbxxgQwUo?=
 =?us-ascii?Q?DTRBjstolbVOcHrKOq3RC7QmkX92p89Z7rQlIMvj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 358646d3-3923-4b76-ddcf-08dbbb8e7a68
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:08:01.8313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ktZx81BdhJ22qR03UztPUUL5bCjCPm/SfTEIU8DgJO3s0HhkfL7Eu3078qBTX5zA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In many cases the dev argument will now be !NULL so we should use it to
finalize the domain at allocation.

Make apple_dart_finalize_domain() accept the correct type.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/apple-dart.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 62efe0aa056f60..2c1832e357c7c6 100644
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
@@ -597,16 +596,17 @@ static int apple_dart_finalize_domain(struct iommu_domain *domain,
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
+	dart_domain->domain.pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
+	dart_domain->domain.geometry.aperture_start = 0;
+	dart_domain->domain.geometry.aperture_end =
+		(dma_addr_t)DMA_BIT_MASK(dart->ias);
 
 	dart_domain->finalized = true;
 
@@ -661,7 +661,7 @@ static int apple_dart_attach_dev_paging(struct iommu_domain *domain,
 	if (cfg->stream_maps[0].dart->force_bypass)
 		return -EINVAL;
 
-	ret = apple_dart_finalize_domain(domain, cfg);
+	ret = apple_dart_finalize_domain(dart_domain, cfg);
 	if (ret)
 		return ret;
 
@@ -757,6 +757,16 @@ static struct iommu_domain *apple_dart_domain_alloc_paging(struct device *dev)
 
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

