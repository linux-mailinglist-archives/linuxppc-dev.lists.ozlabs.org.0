Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F3D7B0FA9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 01:52:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bMJ3wVv4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rwtgs6Zzcz3dHv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 09:52:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bMJ3wVv4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::600; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwtbC04xrz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 09:48:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kapDpE99r5hVtgW/n51SorGNMuT6FiFBpygFrkb0jkVYGnGdsC1BbmJg1qX/6q8H17zkfyCEpQg9n3y+62tX4HmygeqlEpq37jgFT21AkThb7UvUBE/3B9pOWuczzxhIzW6npzLm3EmExG60jg0R2gyE94G3XQ7fTGBwgY9T9pl0GUoEwVzD1EgQXv6b23W3x1WF52zYTTnHx6n+S7nCbEly56WBz0SK9+RsIyyC+Om4mj5q0I1BRrbhxAE/hcljQ+9GyXGvWykt+4HjDOIrPft67HdrRfQ51W6N4PmnVJcnw8ajrMSBQ5//a/LcYCXCvrGPJhKb8t9Omz+I7iTkfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vG+FwzkrKHgDeirEk8MmQfqhRub1hYdYgtIgTK+SVIc=;
 b=eWj9xKnjaz9vPNaqxjUijwrF2yir1QfaXQ4cigYUnjMPfoSsTrSEvp8/g0WSxnjkCcYS8eNSLnwok6tToUAzsTvzN24Zss/H/jJdV7y0GZ/MD1mLh8TbscL3BuE/qDI2csbUSqE0PtZdh6xt1BDijOMvoW25UH/DLKxsFXZfyq48BnNccdQl5KkGxyzm9r3YrX7NcE0hdWBln3sptm+WY8cJqdPvP79YwpF+/z1UxVSL1Psof9BAhdrlPk22DrvV65ZnGZydG6CnJ6L61Q5pIsNIcN/GjsNywuOw049cXKLNKWiuFLkv8pxvup2JO3ypqK5gBx0RTKZlrco9FisLOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vG+FwzkrKHgDeirEk8MmQfqhRub1hYdYgtIgTK+SVIc=;
 b=bMJ3wVv4tVXJ8E7iBsuPsxJmuTnvrTn2KkG3iTupNQbEh6ZaE7Yyuz+iDi2iczdOR28bdhvPVmwcwKcVojjyC1epNse3vSsns7GMpe75zG1WFb9NtndqEU8HYW5xHMG978WLHd1t38EmZLOOxu4zgsbGYMMJWIAQP3yn2MTtrmQBfOKuaufvorB2wxYPTJgCy6U26hxexEQDlWaYBe9UyIynIzkYmsv3JfDQdrXtDQ7rcsjguDMB0CkxqFdGAsALU/L0zvjacEqhTPkOwQTLGbZCocHpBhUlRq/kK8WQPemNgqOWgeYwg5qJeeb290FyrAs1taVsMXV1vOh7cF4tWw==
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
Subject: [PATCH v2 5/9] iommu/dart: Use static global identity domains
Date: Wed, 27 Sep 2023 20:47:35 -0300
Message-ID: <5-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
In-Reply-To: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0351.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::26) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW4PR12MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c89df50-b20a-4dd2-5dc2-08dbbfb4234c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	O7rLj9mQc970WfvdwQIQlUxhX/b3hIC00N2B3eX1Gduskph0LFQcSnKuk+3kRkYL2fJs/zkHrf7iVjWd8hGHcXosj4n/dDx7HSPv7ywIPvOfzC5M+dnYRogAukq6XSW6qQfKa045dltclSkQHLOiqH6r4iPPQ+sdw8GS9fkO9a4jwWeMj3H8Q3HBzZOjF+1bPR7vqfdh5eFsiEeMDOklfhimODhHi0O5W3pGi0MMqijL/WlviCBP9lwZGclkQ/bfYt3y759qcnePDHP5+PR0Io5kmMj60x1G/wWLhZYIT4AWsstArhDU7bqJ1T8BNwK7ypPPVbxqxzRb4YY7MbFZTkEMNCh5yxviPnI54nv8TFrxSMDAs9YVw5pcTZng0hZ6VqXMdH0oeWfbXjZ93rpaO/2DeaTjd0E4uwgqTdjCl2Vs7R2iDrxDx+MsO9uZyUAu7Q1SwdDw4boaQ2FJzEIjpJMnT87ia3z745OizYbYl72vI9eIV7RD8M7j/WQ8oUcRcG6X9sQeUUuaI7xNJOnUJjcuRf3EAPqA8ugkI6oBN7OIg1ndK5/6XMxJHbr5YJNhDnuZ9qzt+XV89ikl0exIpQOmlPMrxrlPSH8qwrlmXsTkFPre4T0iJAVuEMQW7BPJ
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(6486002)(6666004)(478600001)(921005)(38100700002)(86362001)(2906002)(7416002)(41300700001)(83380400001)(6512007)(26005)(2616005)(36756003)(54906003)(5660300002)(66556008)(66946007)(316002)(110136005)(66476007)(4326008)(8676002)(8936002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?t20pphXjC9ykGek8Ax0+aDgr9usf963TidBPKFQdTUj+qRn6P2U0DB+f1o2w?=
 =?us-ascii?Q?JjO1af7rFdvVzo/zHYfiOl++5NXaCGej4i7nUHlK0xdHYV3oPu6lwfR8v2eg?=
 =?us-ascii?Q?uhY5oR7y9XdjDPni3vjTgvD1ZV7x0hu2ia8d6ytkXbeJHoqtF3o8jOkxs64d?=
 =?us-ascii?Q?TK56WLaDQNboaXEU7nWLXl3LuNRNx3jeFSNzNKmXC+GszDNMdAxMxxEkyT14?=
 =?us-ascii?Q?tf1fLDVrIM+m0CCG02Vtjdn21WbczlOOsubx1YszLfu7ot7Uel//YxDIsD1w?=
 =?us-ascii?Q?nR8hRP9jKMKSiXgZIKXd3Xh1dB1hq4awznQm9u17vlG6lq/eP9A5zn8O5l54?=
 =?us-ascii?Q?WMzd/YHniJCmvSjZqK6jVXbK8/JHwFTiflC0wv+FPjWp3TsP6YQAfXbuYAnJ?=
 =?us-ascii?Q?/GaOU/mDAdDjuWKbX+Xa8nv1OR1jTWiA7GwZCU0Zc2KGR2fABx1FYba6cpLk?=
 =?us-ascii?Q?8yLn0xQIdnjbw4pmXTaqsFK3RkGIyaESCQAIJIpzPfSKkUYY0K2nUQZnQd9s?=
 =?us-ascii?Q?lTClGHqgjSDsJqKYNgkVYn8ZTvRvGlG0WWIxD+gSzGkElN7TG83DHpPXJC+p?=
 =?us-ascii?Q?+xAAW0X5msQlm0zl5cZZd2QcUjoIiHYEdBOwl9Da/m4MrhWB1LHOcYzoSV19?=
 =?us-ascii?Q?icatgs1VYGS1qKR36PE0Uk9rVXuSiOOuBZXven+6X0UTKJvPBWma4Nxs9oyJ?=
 =?us-ascii?Q?nolndPpCjyyGtJyGDtIJf7QGFcgC/gcS7O8dxQ6QcEJ6DY+9yVyBvxpf/7jy?=
 =?us-ascii?Q?18qzX/c8E2kBIChx+g1LTZO0cVat6/syE9jGkpCxWZdfWTrZCzVrKN+s7T4b?=
 =?us-ascii?Q?BbLFUpkN6I7GNyJ+6tbxlXaR7fQxwnqkqj0HxwKr/ikHuEMDbk0Y8pIsjCoV?=
 =?us-ascii?Q?ixawJ2oBuSu9x/YElsKLTzOfHv9ETRmYNAJqLXeV8pswR031hYXDQ0gmOZMs?=
 =?us-ascii?Q?pL75qSUL/YIX+uaLEzpWq1XNmoSBR0c0aquHc2+E9TO5kZskvCo3PmD4t0nj?=
 =?us-ascii?Q?nw2Za/v6oCXjf4thmmfcXhYDLri3N+BUdkyR5ARNQF8qCnG4oa1S5aiadAUu?=
 =?us-ascii?Q?pTznaV5SL3PUOGqbH1uT28EEnFKeYzTXvJK2Xhl4xRz4eCh2aKTVSDYTg/oL?=
 =?us-ascii?Q?7WVUyw6qrP/l8k1t9oZZEq664qpO+ZsttRL/8QUsFyHAsu5HNmXGFgQOJxCY?=
 =?us-ascii?Q?A4sxq6fdCeeICyyZ103WbUSAghA50GacM6Ue+hVI1akRv09Opn+58hR6w3Hs?=
 =?us-ascii?Q?DGybN8gub7JgSYS1wvn91onDBFk4oveH7x5pUHGwAUj/l24EIv44VqsArI71?=
 =?us-ascii?Q?SOvT/Phn/GM9Da4l/VSk52M5bwrb+HTHvCaq7uq/p7+FoN/HVw/YSEa4o2lu?=
 =?us-ascii?Q?YCr4tIgmWoalmba1TQ8UExLIaE4on7m6onCzBr3vLFzx5O34AJxzbaa7YgHC?=
 =?us-ascii?Q?uNx0PahqjL9yNPYEHR+WN3dWQnnmhJ61hR+lZS3wp83CZUtbptKitLjBrv6r?=
 =?us-ascii?Q?eBZgH/Nl3ng//g6SewhOdhJmjVd+JQ8kfALXkNZ9ZAy3dOiPOQAlzo54KaAa?=
 =?us-ascii?Q?Y4ISMyuPEMBtO309Cd+wQPP6QzBY+r6Ae0t+iGDi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c89df50-b20a-4dd2-5dc2-08dbbfb4234c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 23:47:41.1417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbCl+LVtGZvrUEoJgrYI/lWZfttlj48ASDx5Wse23xg0VzqGpo/toY8uJzuLjlvF
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

Move to the new static global for identity domains. Move the identity
specific code to apple_dart_attach_dev_identity().

Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/apple-dart.c | 39 +++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 0b892750842746..2c121c525749cf 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -659,11 +659,7 @@ static int apple_dart_attach_dev(struct iommu_domain *domain,
 	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
 	struct apple_dart_domain *dart_domain = to_dart_domain(domain);
 
-	if (cfg->stream_maps[0].dart->force_bypass &&
-	    domain->type != IOMMU_DOMAIN_IDENTITY)
-		return -EINVAL;
-	if (!cfg->stream_maps[0].dart->supports_bypass &&
-	    domain->type == IOMMU_DOMAIN_IDENTITY)
+	if (cfg->stream_maps[0].dart->force_bypass)
 		return -EINVAL;
 
 	ret = apple_dart_finalize_domain(domain, cfg);
@@ -683,15 +679,35 @@ static int apple_dart_attach_dev(struct iommu_domain *domain,
 		for_each_stream_map(i, cfg, stream_map)
 			apple_dart_hw_disable_dma(stream_map);
 		break;
-	case IOMMU_DOMAIN_IDENTITY:
-		for_each_stream_map(i, cfg, stream_map)
-			apple_dart_hw_enable_bypass(stream_map);
-		break;
 	}
 
 	return ret;
 }
 
+static int apple_dart_attach_dev_identity(struct iommu_domain *domain,
+					  struct device *dev)
+{
+	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
+	struct apple_dart_stream_map *stream_map;
+	int i;
+
+	if (!cfg->stream_maps[0].dart->supports_bypass)
+		return -EINVAL;
+
+	for_each_stream_map(i, cfg, stream_map)
+		apple_dart_hw_enable_bypass(stream_map);
+	return 0;
+}
+
+static const struct iommu_domain_ops apple_dart_identity_ops = {
+	.attach_dev = apple_dart_attach_dev_identity,
+};
+
+static struct iommu_domain apple_dart_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &apple_dart_identity_ops,
+};
+
 static struct iommu_device *apple_dart_probe_device(struct device *dev)
 {
 	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
@@ -722,7 +738,7 @@ static struct iommu_domain *apple_dart_domain_alloc(unsigned int type)
 	struct apple_dart_domain *dart_domain;
 
 	if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED &&
-	    type != IOMMU_DOMAIN_IDENTITY && type != IOMMU_DOMAIN_BLOCKED)
+	    type != IOMMU_DOMAIN_BLOCKED)
 		return NULL;
 
 	dart_domain = kzalloc(sizeof(*dart_domain), GFP_KERNEL);
@@ -732,7 +748,7 @@ static struct iommu_domain *apple_dart_domain_alloc(unsigned int type)
 	mutex_init(&dart_domain->init_lock);
 
 	/* no need to allocate pgtbl_ops or do any other finalization steps */
-	if (type == IOMMU_DOMAIN_IDENTITY || type == IOMMU_DOMAIN_BLOCKED)
+	if (type == IOMMU_DOMAIN_BLOCKED)
 		dart_domain->finalized = true;
 
 	return &dart_domain->domain;
@@ -947,6 +963,7 @@ static void apple_dart_get_resv_regions(struct device *dev,
 }
 
 static const struct iommu_ops apple_dart_iommu_ops = {
+	.identity_domain = &apple_dart_identity_domain,
 	.domain_alloc = apple_dart_domain_alloc,
 	.probe_device = apple_dart_probe_device,
 	.release_device = apple_dart_release_device,
-- 
2.42.0

