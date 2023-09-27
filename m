Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD127B0FA1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 01:49:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oSn/+WH+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rwtd14nnhz3cf6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 09:49:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oSn/+WH+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwtbB1sZLz30fd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 09:48:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLVasVDi9L1K/frAxoPZHUMdMAU0YSD2/pbZuwup98b36CU+IF3PWOKYNEXCxFK2WHAfodn0H56yuiZdaDVcBdL5ewsbbCznINpartJsZJAOZF6ZUXXvKJe/MVgUED4HTmhf4Ef2TchVRqp+EcdTFhbqgDFiT1H/hcRmRegI5n4FvjRJd4tEi5JpAwlrBh2I4iL+eF2Xr4LMl49kKe66stT388tW1DSC7zqCyJw8paZpjrSK0H5sNA0vgIw46kWp3X2bQ2kbQbOiobxMAx8oGuf0YxnU40zNfCLyxbLAu3adSS7MeMPGhzNu5uxU73Fmtr3vf3xdkGkv6+/xFu/UEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N88gwnz3MkROV7AYMKhONqv/oLUifzvAVQisDe91jRI=;
 b=O68KxncJVZHozyxBuQ85xz3d8XPED2PMgK/z5Xho3aZ/uuTNCh3yOnxenSIaA4BfBIDiPCcLeC8d+Cnoh9aJ3qPoKGAuwirlNYnWH/B4rcZowaxZ1OgSHiWPya7UGbv8gfgDHZ5Yu3rdv2Cq9diGuqFy/en6q624iDmjGaflHizyBt3Gs5pW3xX/bClE30Shj7D/HnsWWNmJ2PSks0Ce8pc4EvKQ3L5Qp694AM1/7aFvftOe+TRAAw0vEekHc/2JOvuVkUy3/IovKq7MjXQJiIvKMQLoy1Rk83JCDjwDjnfjXdaayW5YWVuRKSS2FNnIIURcvT07Q7H1Z0c4oSR83A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N88gwnz3MkROV7AYMKhONqv/oLUifzvAVQisDe91jRI=;
 b=oSn/+WH+VdjBquw7qhX3UAUrttyNG9dXcuEai+Jsl40xRxHactweF0pA7LLl8Tn1yFQpBl9VH7rn6YYl2UROR0WUBE81BSTAAcsbqRdZRVXev4Pvv+2Ar1+quUPGZRkdm7Dx8mZy1eKGnZbsMy60IRlaiY1c6kSxr/q41eu9i8bgP+S0nsuYLJDbSIxAQl91SIt5cpJ7uaXeQrdIF5Sc0IYs7VbF9w5+ZTKIp8dESdiuLIWTnC5dgIP/psI1Gs4jMbUC8nRC96S8SNtBSeTSFdmcnfQwIWjMav1i/lfhR3TmCNBXWiZ0T1UTi17UBVaCiky3epLeL9dwX37QKn/ncw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 27 Sep
 2023 23:47:42 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2%5]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 23:47:42 +0000
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
Subject: [PATCH v2 7/9] iommu/dart: Convert to domain_alloc_paging()
Date: Wed, 27 Sep 2023 20:47:37 -0300
Message-ID: <7-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
In-Reply-To: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00016411.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:9) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW4PR12MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 28957486-a7a9-4674-4eda-08dbbfb4231a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MNYsaVJQO8wbnOdSV4EKQjDHxCPetLyP3Lx0/D2Qa+Bps7CVXcKCNPi5PcGoPclCIQE1d3MXsHHlijM9sX8Qtz2MHfJhdOfrZHPLEnGwwBf8laYW2dqLN4oi+l4l8aAJOGleK5nSwJkDT00uNj3D4zUUvIIes/2ipAhCYJjWXmF6CnbmgeeLwfyxsFeSX6g3ULujIfT/wuvXtquRXQ3HyHBhLP5RbZjvr1iJ1vs7r++famaZCdln9fAtqEvA++kYJ1h+OM/sbx4K8iqySq+o3/UslvaFAOEsPK0MfFQmskL7tz59pHEjxzJp/vYz3iCh/LLTrQPdbmgqHFg2MKA3tBbyPEBgH4jqfRaJxW8XcY71uiYgICf9A5xVpXrD5GuW1obP/D36YuPJWY2wVvgle3jDY9+QwOgLRXYY3FBxTcrENPwDG6WPkTb4ZllRB8x5etyzsW5pMMXf8mrrvTdm8ywhXnRKXzczTqwKLZLM4Rw5ZPFS+s7rEjhFpVLJuflsc89bWzh0a/A0DDTXE5W+Z//kvAr0iT75VkyrsLjHjkXMk6neCODbr6wTm3b1HAkToTFXHCBZsrYXFO4ti5c4ef4umNfzar6Sk6ECPfShupBg+seqw5VlY6E3cIiiYB0X
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(6486002)(6666004)(478600001)(921005)(38100700002)(86362001)(2906002)(7416002)(41300700001)(83380400001)(6512007)(26005)(2616005)(36756003)(54906003)(5660300002)(66556008)(66946007)(316002)(110136005)(66476007)(4326008)(8676002)(8936002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?UyvVQ1/IwW189uIbfxP3/CaXxUARjOtS26JYUty0VCFcExPsCOYqFbuLA/O/?=
 =?us-ascii?Q?Deppcu9GqZOG+0JC3gIe974tXXyNnwNlJDLcyw/a8d5llNJsdTGAu5Kefnmi?=
 =?us-ascii?Q?BD5nWrgREPPlpopIRtwgQDa7fkri8z5wBjgn1Dc4qmEsCLkbRjEeq9Y5opeT?=
 =?us-ascii?Q?7Ju+be6Ugc67xrb/hyGO1SfoSTfRK0j8kJUtrjeg2W7ZdPnhmpQAF5KekUKN?=
 =?us-ascii?Q?ealle/4JMjnR+P/wRGfOfyWFg/8HjGz7tKTXPRtktL9ByucvHs35oc4uTi9F?=
 =?us-ascii?Q?dnYCQwcjn4nfZM1eSAF0Z7iCiRGoqzYuDiT/f/vnMpJRBHsBVJ3IYtmLUewy?=
 =?us-ascii?Q?NQvpdB55CMR8+0fFiZsxUFx0QZDvaZluMw+gdqRSU/A7Q3fGy7dZUVzVzfVZ?=
 =?us-ascii?Q?bxh+mS+QJFXcAnlbjSaoX5IgQt1yO2nJSc8vBaWaQjPuMFfKatwOSb3L4ySa?=
 =?us-ascii?Q?sVYwoWgowL3cW8slKZ4bZdPKKLEgyFFl/z7iLvzNbQp5BXtESMxrHXYUwNvJ?=
 =?us-ascii?Q?UM8PawRc2wlQs7qVUfI6gXhAGC8Go1zyjTBsbf2qISimh0XNp22BFsITK2qO?=
 =?us-ascii?Q?hTY3YMNMpx3Xhcha6+TwNeHTfiJwqrcSlSeGsoOuqtT484yyYP9+CBdrpIKb?=
 =?us-ascii?Q?VhLcd4fEhwm/1/x2S0MfQUvoNChy4zMjdEP+JMOZc554SFqsbko6JJdIztrU?=
 =?us-ascii?Q?UkNKM7w2erDt1fJF3iiZp/Vp0yUVJ8ksG5kZKM4AMvHkp0MEtayaHk16mGyx?=
 =?us-ascii?Q?w1wdgYC0juVg8BzmiCv1ixq70CsQVwB517IvVW7DWg0yg2PvARrNrLBviNgM?=
 =?us-ascii?Q?KJqlofIQB8oO8WeAeArH4DQK0cQ2QYxPH2hoh7NzqLE7Iwz6allCBK8R3f9P?=
 =?us-ascii?Q?o42tRowFuCXE9Dmra9Yg6p83T5FQfjFlpnQuAaCiSb80z1qTwjEjG8Of2MUJ?=
 =?us-ascii?Q?1etnKCCjMc7OZGzRY1XRx9C6DTOIM3Qo7GdemyQdeFV7bzzOhakgc9D2SONS?=
 =?us-ascii?Q?DDfwGfrNaS1t32CeQJjRDEiNoGZc7oGEClsLhPQrArpX9UnR2AdBCNXs0jDF?=
 =?us-ascii?Q?Ai1+6eLNAJRdAJHdciMf2Px86Y2XKcZ3hgOpXkHehkaeLVjldSGIOALmQ0/8?=
 =?us-ascii?Q?OQwAsRlJhPnzQJjyQO1BTW7yM+1pbVeddPzTD6WBHi3EH8QdMbOQhzo4pC3Z?=
 =?us-ascii?Q?qftDJWsWV/WqKwOp8EbON/jaeO3mas7ZTiDhASwCwt40kl7tBwtWeD4KyjRo?=
 =?us-ascii?Q?WTWQiKqVOGy0L8OYhXmESU+DmrtNeG6vqYpnns1mQi/PBR7AynlHbrIgJdGI?=
 =?us-ascii?Q?fFYmwlKSjTSMxRqtnsn86c+zpWiz89RXXSd7HliPe0p7yce7rdn2mQo1aumy?=
 =?us-ascii?Q?H01qi6WJ1XYcvY7dsYocUT8iXOa9mvHNCDfz35cPUZjadg7v+K+jPNIMDaJQ?=
 =?us-ascii?Q?sYjTwzFVUd+tl1o0clyza46MUml2GlJsO4GZLBO+VET/QtDZEsl3CbD3K9Yr?=
 =?us-ascii?Q?06Gb9xec9xxww+CGVPNtprKKliknYiyanvjBmwlPRlmitodXJkKEQtdrriQJ?=
 =?us-ascii?Q?SwEV1wKHrmr1Ly6q2vUKEyIRLlY+i7QH8O1pCmku?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28957486-a7a9-4674-4eda-08dbbfb4231a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 23:47:40.8360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLD1uoJ6kTePJCBP7yN1LDumzv8545EdpONg5jZlUT0/x73T37YZOHyU5oFWlszB
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

Since the IDENTITY and BLOCKED behaviors were moved to global statics all
that remains is the paging domain. Rename to
apple_dart_attach_dev_paging() and remove the left over type check.

Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/apple-dart.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index a34812e8c9ea57..2566cf3111c7c1 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -651,8 +651,8 @@ static int apple_dart_domain_add_streams(struct apple_dart_domain *domain,
 				      true);
 }
 
-static int apple_dart_attach_dev(struct iommu_domain *domain,
-				 struct device *dev)
+static int apple_dart_attach_dev_paging(struct iommu_domain *domain,
+					struct device *dev)
 {
 	int ret, i;
 	struct apple_dart_stream_map *stream_map;
@@ -748,13 +748,10 @@ static void apple_dart_release_device(struct device *dev)
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
@@ -975,7 +972,7 @@ static void apple_dart_get_resv_regions(struct device *dev,
 static const struct iommu_ops apple_dart_iommu_ops = {
 	.identity_domain = &apple_dart_identity_domain,
 	.blocked_domain = &apple_dart_blocked_domain,
-	.domain_alloc = apple_dart_domain_alloc,
+	.domain_alloc_paging = apple_dart_domain_alloc_paging,
 	.probe_device = apple_dart_probe_device,
 	.release_device = apple_dart_release_device,
 	.device_group = apple_dart_device_group,
@@ -985,7 +982,7 @@ static const struct iommu_ops apple_dart_iommu_ops = {
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

