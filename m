Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D83B77AB6F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 19:14:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=l7cMGijz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rsf5q4xBDz3dnK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 03:14:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=l7cMGijz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e83::61b; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rsdy74jHnz3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Sep 2023 03:08:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2qZiDns02octH0Spr9yuaiwACb1gWS+4QbrF2MC1Lf/ruDb5isirret0rWAtHzVUJoC9EFLgkH9j5IlgYIeviLyD47bUSJXNx6jjXOOBRriaG21gbQywfEneSJAbeDXNhygSkJWk1xAlf04kPc2ZTUeS24PNKnpcyvx0il7fq6AqzN+1t/6ok/5NB1hTp0nNcTCop20V27aipv/ayKl9U3iG3EL2U0zLYnAgO3MVSfahVv2ZZhRAsP2Q4T0Jg5D48whOoRObwERDUC/GL3mRkrNzTRCYnX6VlaqTeD2VNT0tgPz9QkaDkC4+H3yB31LQ/WmhDlf3gbZZxRDhDDFcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=enyqSTvj8qiCy5Tg3zCgMrVyFhU/zF51YcFj4ztQ8Ig=;
 b=OoMA64h3zQlvG32BvxYpbQclIOhUGkH6nmwl4EwV6USgRW9s0gvTPaTVt7+vNusfQKN8tVg23SPYrMYTywrD/7hR7TpH0rXpwnyKnastnVdYlOIXm71u5y5AyxKBih0xiv5jTxEkvGLC7OZPRaTLMf/AOHzw4YU3NeQjPQD+Xer93Bc6iCg2sjqDM+z1Oks14kh4T7PSppzfh/0CMRu0o6QBSd9JoVG8F2X/3WhlyZ0UGhYtKI1j2QlPuMf98XIgh92olqQNQSMnRhqFbtaxfqeDSzLL8v0umkZ0xat4EiEaH73tDxrlVgi0HpsFYN5nU2LZmL/aeiPodbTq4n3HEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=enyqSTvj8qiCy5Tg3zCgMrVyFhU/zF51YcFj4ztQ8Ig=;
 b=l7cMGijzPMrw3OuVzkfvr+efOOSUnir92oIzAGoW7kJNNHZ8OP0cVFWhV5DxzyL4ASPlKhU6GlG8AIo2Ixgpq3o4gV8OHA5l+yQUmqbucUGRv57BsTK0rdQff9xY+5OaOYrBg6xlOCsuGCBagS4lX91d1eCejoHfoFX4a+ZQf/zEeKuoDPdU+toejdd/AeRn0SlcGqChQO+HawXMbd5f8o+qbFOhBGUglVcBdhvA5BiwqTWDWYA2DpfgZIODZ8o8RuoIQqqc3uSqh+6UzeQZKqffP/jP7eunFH7Co4M0XHQdrm+OCcAVXUnKnl6k16w+znad3vDPp9/6F6JXltJPDg==
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
Subject: [PATCH 7/8] iommu/dart: Convert to domain_alloc_paging()
Date: Fri, 22 Sep 2023 14:07:58 -0300
Message-ID: <7-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
In-Reply-To: <0-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0113.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 64b04e29-b690-42a8-84e0-08dbbb8e7ba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	CypL4qnjrQzbuGvY7Fq7X96Uvrj76oaI+NknA+fvdkmpZz02OCxQuFwz8NDKbQP7QMyXJOY7FxZ7b68PSD/HYFBiH4yOTXwizdq9HBb9qb4apNjF3sD36G5ZVoAb79HEBD2HsHSZGzdidHx6Tj6mKtAyhIvEb8IpLJr+6W6UQrU4iw6I9cW8mOBRBph3R53GkMjFq0VXcSFUs40iCKFJlenUpce6dg2Mpa/AD7u8qM9F9OG1BjTzXuRy5p9yF1QUk8bvO0yoxDqroRnb8rovP9niVLqToZcPKLFq8dCDxpsesG0IFu2KVTGkLL0xiLwnHA8Yazqh9eBUFbc54CRf736lvOnogeZ6xgXE4SZw264Ggm703oB81WUt1q2xKl1pe8K5gdyUA4FVMLuQ27RfTTUGADIk0nJQtqAyt7CW2MhYUJ3bGzk7SY+Yl1v390Mekf8n7ZOmgUkuo99A4wJFTyHLotf0j4vvYL1oxjiun8SyVfCIyYKMl2q6dBRz4rR4or2DIWiXigYr4CVAYyTsO2wKQ1kt0hisX3KAX6q7qZZhI1CPcfsXq5D5i2DPTSwZY2orXgA2eyqOvKH07DZw7+bNe5/OyXeW3vvz3QoXsn5ujyz8TjquDGCyszKf1D/U
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(186009)(1800799009)(451199024)(921005)(26005)(8936002)(2616005)(8676002)(7416002)(83380400001)(2906002)(36756003)(86362001)(6486002)(6506007)(478600001)(6666004)(5660300002)(38100700002)(6512007)(66946007)(110136005)(41300700001)(66556008)(316002)(66476007)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?eRyJdlPJMyFXKNzQU3gfbZ/WXONQYN1DjTRSOZ3ZzWEo39hqSjskseMo60KZ?=
 =?us-ascii?Q?KjF7LmvSX7TP1NXOzQH6lzyRdyvXTTwgyc2/OrQxJATRXoSb5u1iHsk7z3kp?=
 =?us-ascii?Q?axSGppnkqjiVTrxCfxVx+uyaoPWbwl3vE98M5i5xzZHHFXytDgO5oBngrW+b?=
 =?us-ascii?Q?QeH6wbLhPwt7foGRYQmQGvfRTn2Wh6BTzyROpuaY+jdOu7qgkK0oAkBP32Xx?=
 =?us-ascii?Q?GPy2RHZoYa99T00f3XzmiAjvHAMjIHBamF5RFv5VaYf3L5Kbm/vDtLW1FISd?=
 =?us-ascii?Q?XYNzrdpXTAtRHLOUh6g/VvfkBGuSK/Qt+0wHlLyh0jtCaOCUA394I7qeg3w6?=
 =?us-ascii?Q?QU9MMipLHrftXQosJS4tP3gOT6cDAFrseeMxjBWfrYarZCYLpn4EPQfnTau9?=
 =?us-ascii?Q?nEOEBWZj0CGpfSV4T1UrdpwMoU+GzSGAL/JmAE9L3Zrh29krO/Rxk1pXbZB3?=
 =?us-ascii?Q?nYbo5RbKdkkfodQ5hW3OuTchC4Y5r5JmpFKD1nwvkJCPNaGCVvLcol7Ctjf7?=
 =?us-ascii?Q?ZE+n/vZgN7+50G26h8x5MrGO9Mi8o4mq+8EwpolSeUGJ/Fur3TTWQJzhuMjO?=
 =?us-ascii?Q?2rgfvYeE4Anw+u47H+Iyvai7gHXdxNyFfMAyQo0a41rr8LDUGkFR2p+oM0Cl?=
 =?us-ascii?Q?Fi2CpLqC04ksux3KMc0/GWJyFgw8hqv4qTHLq0MJYDkvfBRYMf2dHAVoFPcR?=
 =?us-ascii?Q?aEh/7GVidhlZMOgZ7rufLM3F2DlTSFSW5kFk0DXFPI7ProltXyViIameGbLL?=
 =?us-ascii?Q?Cx9/mtJChxrFoCL1N2PBDdU5pXAzwUzSUSPUHMt7nOYyNQUm8/axYSFMZVNI?=
 =?us-ascii?Q?cinUSzv8gLf6wksijUQY0qvtEv4aX3fCIhmqW/kGm+EW5tukiPQZiWC8s01t?=
 =?us-ascii?Q?WNomAwKqGmO/pO6tfKsIBF2OTMNmSIJ0CJVgd0xFFqo+/FPrZcNQEqaPrgj1?=
 =?us-ascii?Q?OBn403wfSkZ/b49BUpXA+KntR5KVg3adPJRwGy6oRYEqInyIHyqxDFZBDIJD?=
 =?us-ascii?Q?0IEJf/vpUGJQNL7lkgOiqJBkOcCwdjQ7lUZcwR4O8ETMZB+dtdHNP/1YZjMd?=
 =?us-ascii?Q?mlXsWIrZiZwN6XJQvLn3y8tpFL9Ppn7IK9jGfo1s+s5IMRQXWcmsKgtmrEz4?=
 =?us-ascii?Q?tFLrid4oaVQpkRithGKK/Y7r7qGBdVXiD+J3hLUFGs+g1q+pFeVLieb1ik4O?=
 =?us-ascii?Q?716aFwvJQ5Wc9K/ZfyA1WnKz3NzS33pckK1luohUTfHN+E+fnv/2+hM2UF5X?=
 =?us-ascii?Q?DwHAdF13tnytQgzdGA755B4lsWIjQjihpRsampXMxz+CZjpdUtugzJWn+Gi8?=
 =?us-ascii?Q?DhL+xSusB+bbW09PoU0jwHolg0p5z5bDLbVKxyho+mNs7NXbURJsBcDMnI8/?=
 =?us-ascii?Q?6FTapEP4fqIje39UJwMc8GE/4dnHiUH6LIoIlGnu8JrIcbC+0mgLg5AAauzf?=
 =?us-ascii?Q?Z4QoMejX6BhC+MyrcLyOz0NxmQDwo5fACmcM1lb4hT7NpKhGakF8v3E8Tet0?=
 =?us-ascii?Q?YGigCQWJf23QUZVEaY99tai+86abBI7rYieC1LeDBfMjCLPtQVR1+WmYKsjr?=
 =?us-ascii?Q?5gFtxa48MZ7sVwNXsqFxB/1ynshwdXM2ZDmRqLrs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b04e29-b690-42a8-84e0-08dbbb8e7ba3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:08:03.8390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKUROoSuEGW5IblbzsCPG2oTN8jla4P7XZNq5umwOEOk/sucuz1EMXo6JiqmHVVv
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

Since the IDENTITY and BLOCKED behaviors were moved to global statics all
that remains is the paging domain. Rename to
apple_dart_attach_dev_paging() and remove the left over cruft.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/apple-dart.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 376f4c5461e8f7..62efe0aa056f60 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -650,8 +650,8 @@ static int apple_dart_domain_add_streams(struct apple_dart_domain *domain,
 				      true);
 }
 
-static int apple_dart_attach_dev(struct iommu_domain *domain,
-				 struct device *dev)
+static int apple_dart_attach_dev_paging(struct iommu_domain *domain,
+					struct device *dev)
 {
 	int ret, i;
 	struct apple_dart_stream_map *stream_map;
@@ -665,21 +665,13 @@ static int apple_dart_attach_dev(struct iommu_domain *domain,
 	if (ret)
 		return ret;
 
-	switch (domain->type) {
-	case IOMMU_DOMAIN_DMA:
-	case IOMMU_DOMAIN_UNMANAGED:
-		ret = apple_dart_domain_add_streams(dart_domain, cfg);
-		if (ret)
-			return ret;
+	ret = apple_dart_domain_add_streams(dart_domain, cfg);
+	if (ret)
+		return ret;
 
-		for_each_stream_map(i, cfg, stream_map)
-			apple_dart_setup_translation(dart_domain, stream_map);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return ret;
+	for_each_stream_map(i, cfg, stream_map)
+		apple_dart_setup_translation(dart_domain, stream_map);
+	return 0;
 }
 
 static int apple_dart_attach_dev_identity(struct iommu_domain *domain,
@@ -755,13 +747,10 @@ static void apple_dart_release_device(struct device *dev)
 	kfree(cfg);
 }
 
-static struct iommu_domain *apple_dart_domain_alloc(unsigned int type)
+static struct iommu_domain *apple_dart_domain_alloc_paging(struct device *dev)
 {
 	struct apple_dart_domain *dart_domain;
 
-	if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	dart_domain = kzalloc(sizeof(*dart_domain), GFP_KERNEL);
 	if (!dart_domain)
 		return NULL;
@@ -982,7 +971,7 @@ static void apple_dart_get_resv_regions(struct device *dev,
 static const struct iommu_ops apple_dart_iommu_ops = {
 	.identity_domain = &apple_dart_identity_domain,
 	.blocked_domain = &apple_dart_blocked_domain,
-	.domain_alloc = apple_dart_domain_alloc,
+	.domain_alloc_paging = apple_dart_domain_alloc_paging,
 	.probe_device = apple_dart_probe_device,
 	.release_device = apple_dart_release_device,
 	.device_group = apple_dart_device_group,
@@ -992,7 +981,7 @@ static const struct iommu_ops apple_dart_iommu_ops = {
 	.pgsize_bitmap = -1UL, /* Restricted during dart probe */
 	.owner = THIS_MODULE,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-		.attach_dev	= apple_dart_attach_dev,
+		.attach_dev	= apple_dart_attach_dev_paging,
 		.map_pages	= apple_dart_map_pages,
 		.unmap_pages	= apple_dart_unmap_pages,
 		.flush_iotlb_all = apple_dart_flush_iotlb_all,
-- 
2.42.0

