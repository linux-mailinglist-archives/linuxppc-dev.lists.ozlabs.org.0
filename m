Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B09B67B0FAF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 01:54:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pm1jh3Cd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rwtkk3kMGz3dGG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 09:54:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pm1jh3Cd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwtbD31c4z3bwL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 09:48:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpnRo3Wj576p20HW/M5ubBrIE9NUZRJq5THJAy4Voe6vfstrSyzAIBBLaCMkZOYtKweSnmfeEivgGYvAwJZDBiA98zx8f9xs232upOjRPlYK3cYeKnQ89S+bgGJR/Cgzy6HKvSh9zBdVUc4HQjhInn7tOb5WL1kw4fzToZdVOfgusqieSkHTIFFVLAetrtVqi85mVoJtrav9kT0WefxDeWcYYtaneL1En1ubT/dwTVAyeFjqvAkZ5rvtjUJ9Dhunc9oELXpswrliSh06jNyWj06q4uYFJnlF62M4EWuZQ+KftIy5mUQLIRMZtSRyCmB3hJq1jV7qKeC/yL3zJ+wwxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gELA7TKkXRBO5gDuCm9mtSEzN9B6yYLp/wr3qwlYb/Q=;
 b=EHt0V0jFUiqjdh5o+KEP+ZkA0GxIgS3n6Fd7166/Fy4jdEA/M5Bt5K9l0tQtq7Z9zD0MtaaOsN0uoCF7FhSHDEdCqkcLYFvsNTAYhXD0UV6aii9R398L6legzgt1MOVBwLsETapsPPEdcRWsZhgxkB4zrNUY/VJTrqy6rpdW8G2Dw2zNOzoqwkuaaCmDnfKErUC/X3ejs+Y/DlgNogxPxH3f6MtMAt2hpAIoA0eumd/mTxrG6gmQgmCDKIYfVqKN4qtGV5I18nxlabOpJ81S6PSXfElEXBSTddTAfOUCfbORm7xGV2EDYRHCQNqR3faZOCgytd9tCxbePqNZ+2n/tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gELA7TKkXRBO5gDuCm9mtSEzN9B6yYLp/wr3qwlYb/Q=;
 b=pm1jh3CdqqnlEZB9lo3dNnA7c3GRTo8dtQ/J2z4ZTU/mHJZTc17kMy7i1a1FsWocJaJM4HbttyXNM+t+9agdD0Bz5oBNqvwtw5uNnNnKoCKTi4L8FVIk325d5+c01cPRlGYquH6S1Fr2IhjoZWOHFpy+UJBr9znFVtBTEBX90dC5+2N+hhTaVOXAk1Ha+loWObc1Vd0dpSes9mlnPGmMB7QRUthjCxDaYEIPOL+Jm6n8F0nre3LKUzJCIzDQkjd730p/qT3LoejLn6bh0pBCLCl9dygY6oojQCL0XHaxiHzs0yFFtjcrfeeK673p/uXg9QZhNS9qvNLWXmqeiHxXaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 27 Sep
 2023 23:47:44 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2%5]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 23:47:44 +0000
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
Subject: [PATCH v2 9/9] iommu/dart: Remove the force_bypass variable
Date: Wed, 27 Sep 2023 20:47:39 -0300
Message-ID: <9-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
In-Reply-To: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0113.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::28) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW4PR12MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 5faf5023-34d5-403b-5e67-08dbbfb4236b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HQaUt9xLbftrbvgdMZ7TmzPfP61J/kQPeMsmsYIiGvzeAk3J3hplwzi9wFrj/SxF/wbpBWZXyvjfAm9eZFXeyfQaqv94ha5D2jDG66imQ8ShJgVcjOegELxxaOk0F4B6lGv69wLmwgfPrEMRMRa+nQlNYEXW5e5VBn46hGoJd35gimDMHHHSHI93sbH65V5osBRAf43rydCtSR29wt7/qwALD+FBOa4GPAErh0O0vNjv58paWNspPdiTuXysb35dDw1ymGqfh5YfPA9p02OhqdJVl7y2SGymfDXw8USJLgZo2NZs8qgT5q1dCF7Qk7sule32/Aws4GIOAoL7MBM3ZaFqebfOmBk/bYynHD5RWfE56DUFbrfn2j5RgJWQEcpomOya6Tsx2PdQWhlHx607jyQnUSxgIv+57NaVZcaOKcJe7xbYU5YdYQhcZyEgvyRWK7759++XpEploJkq1BQL5utWtsUQI32C9+DfqrroOxFhkWvYNt6zjCDKDPDfbMK6vPve1BXVt/sKCrExsBtnV8JD4nT1f+MKC+i3nJvZaXqY3ISJBZtr/GJ3dMyDYoRljMm6Su4S2lqRdponzQs210hegd51tKhOsz0GYDdmcipQ+BB4+U6use08Y5MhIBgN
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(66899024)(6506007)(6486002)(6666004)(478600001)(921005)(38100700002)(86362001)(2906002)(7416002)(41300700001)(83380400001)(6512007)(26005)(2616005)(36756003)(54906003)(5660300002)(66556008)(66946007)(316002)(110136005)(66476007)(4326008)(8676002)(8936002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?x/qaEpbUgeXHHcPRyv6WSn/FQf7K8RM+XQ5IlivZQ5skDxsvvb0m0P5efFK+?=
 =?us-ascii?Q?lCbAbqkX/wpYyebPfJz3FKIwlKqYeA+/BOg7TttqBEibGhthVQU5gVkcrXVD?=
 =?us-ascii?Q?xhJLhlQZCgq1f9XofDMHHxKqMFXdjzFriX4EQz4JgXVEGcKeJUrCPhUtKkeE?=
 =?us-ascii?Q?7VMjk+qWdHpC5PkXo6f7WFZo3oKpZYJt14L23NMRaA4ycWAfq599xIcd6n3A?=
 =?us-ascii?Q?bzFFNKdIy/eY+LRcPllkSbaeIsBeeU9PdS1mbgk5xsRdFiHjHZS6SeBBQXFz?=
 =?us-ascii?Q?4rmJQTNDHHX30HV8LXoUOkYfEqa/UzOT4Z/lf/TCiswZUB0iNN1F988AJL2f?=
 =?us-ascii?Q?0Y8UGXdGSBWUwH0KrnEb59Z+xK9IDgvhpNADl0MKYMOHe9FGmtilR8jU5J/K?=
 =?us-ascii?Q?lgbH90qZJljlPhCwJ+PkvyqI34PUWLznfZDNt/wvOYJ4B97i4JWvJx2nJ0hD?=
 =?us-ascii?Q?u/7j9Jl0Qth/Kh9zJLr1klzwnXO56cu7enUjwkP8NvdmH2BfjpTPTZGmHK4m?=
 =?us-ascii?Q?ZkaxJOBN6EnM7F5u2Wx9y9dtcX36nn3US5XaF6aNHm9SRa+FUvvese2qrs80?=
 =?us-ascii?Q?oLVOmLFojKsm5g6iT44oD06XhXKdchBjymQOFbKc0Ap1sjVesrUDEvDdrt/G?=
 =?us-ascii?Q?3xLp9NkaoOW83PHh+xEDFWBpJUWdf7MMES7W6W65g8ywwuXgVsoQVhPG40k8?=
 =?us-ascii?Q?Cv7z4hamT6qspgiRR56cc+yyyLKRP6l8DdOhmztZUBE9FZqraO0wkU4Z3GAo?=
 =?us-ascii?Q?2fNF14d26pAFS1CHWgY4Ua1k8qNMMdy2PJQ8SYIIG1PQuqsu6dk7tp7elasD?=
 =?us-ascii?Q?UQ7lTEGO5wSN/mITP9GiT9EqOWFGrFLnbZbWlPSrIUBSt8asy2VCmA10RMzp?=
 =?us-ascii?Q?1d8genK0wMTtW6lBPlPy4KZq44aSwQ8vhcRKUqoTRzUq9+QbrdmM/hNQaS8o?=
 =?us-ascii?Q?pr5RJpE+ktcrqiKOh48uq/qb0SdcWcwBxcajxO5OdDQxrvs2jCt0TgH05Jr0?=
 =?us-ascii?Q?JdRAZQPTmjqlFhWaMLhf+vXiI7nVXqzDySammuCvdMow2W46B8IIxVRaTcd6?=
 =?us-ascii?Q?3yLtO33culcwT+4v4MU8Ijv9FTdtsoSc+HqTx8e6Fkp8rrs3gPyroaNKqk8N?=
 =?us-ascii?Q?WQaWxJNnfzlm15k8idiVI3AM8O30YiQZ/sEcEqTjtJ8Q9s4NAr7LO6ER8FwU?=
 =?us-ascii?Q?ol5UcDhYmG2TqmtHUiYYNNsX9e/e9M6RSMXeVHUbPoySJyjOab66Me8QDGy9?=
 =?us-ascii?Q?qxoSh/vHsBGjdcT9Qg0fHHFuk8ewBF/eAZs3p4h8h7mgy70he4nPVouauT6m?=
 =?us-ascii?Q?9CeJ6J794aezOwSS0JAx83shcWrA92X74OJRskhzGIyIvd7qZEhVg1pxvt/X?=
 =?us-ascii?Q?TVHG5PLOO8d8sGKbFmMplojScNMfF/seYESiUV0pyqlYhNkwJgE5vRJaqqlK?=
 =?us-ascii?Q?BRNw20lZ4Csg/T0KsZ7PwGDDH57cbV5xWjCepKKksP4UnyziTyu7rBVXP/1k?=
 =?us-ascii?Q?Kw0Odu3bqmtRmDEWG1snySkKSUhqSIq0t9ham6FuLcYJLtHzhqBRjgqtC0d7?=
 =?us-ascii?Q?w96PIixP8VDHAsViEV03rcd4U2xIgGZySCNfVIwM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5faf5023-34d5-403b-5e67-08dbbfb4236b
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 23:47:41.3537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nNNQkR9ZbRa1xdeFss7VgMTSxWuG7bK4J+EGUehbQi0NOqiC6acU4gryReG6e6Oa
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

This flag just caches if the IO page size is larger than the CPU
PAGE_SIZE. This only needs to be checked in two places so remove the
confusingly named cache.

dart would like to not support paging domains at all if the IO page size
is larger than the CPU page size. In this case we should ideally fail
domain_alloc_paging(), as there is no point in creating a domain that can
never be attached. Move the test into apple_dart_finalize_domain().

The check in apple_dart_mod_streams() will prevent the domain from being
attached to the wrong dart

There is no HW limitation that prevents BLOCKED domains from working,
remove that test.

The check in apple_dart_of_xlate() is redundant since immediately after
the pgsize is checked. Remove it.

Remove the variable.

Suggested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/apple-dart.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 126da0d89f0dd4..821b4a3465dfb9 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -196,7 +196,6 @@ struct apple_dart_hw {
  * @lock: lock for hardware operations involving this dart
  * @pgsize: pagesize supported by this DART
  * @supports_bypass: indicates if this DART supports bypass mode
- * @force_bypass: force bypass mode due to pagesize mismatch?
  * @sid2group: maps stream ids to iommu_groups
  * @iommu: iommu core device
  */
@@ -217,7 +216,6 @@ struct apple_dart {
 	u32 pgsize;
 	u32 num_streams;
 	u32 supports_bypass : 1;
-	u32 force_bypass : 1;
 
 	struct iommu_group *sid2group[DART_MAX_STREAMS];
 	struct iommu_device iommu;
@@ -576,6 +574,9 @@ static int apple_dart_finalize_domain(struct apple_dart_domain *dart_domain,
 	int ret = 0;
 	int i, j;
 
+	if (dart->pgsize > PAGE_SIZE)
+		return -EINVAL;
+
 	mutex_lock(&dart_domain->init_lock);
 
 	if (dart_domain->finalized)
@@ -659,9 +660,6 @@ static int apple_dart_attach_dev_paging(struct iommu_domain *domain,
 	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
 	struct apple_dart_domain *dart_domain = to_dart_domain(domain);
 
-	if (cfg->stream_maps[0].dart->force_bypass)
-		return -EINVAL;
-
 	ret = apple_dart_finalize_domain(dart_domain, cfg);
 	if (ret)
 		return ret;
@@ -706,9 +704,6 @@ static int apple_dart_attach_dev_blocked(struct iommu_domain *domain,
 	struct apple_dart_stream_map *stream_map;
 	int i;
 
-	if (cfg->stream_maps[0].dart->force_bypass)
-		return -EINVAL;
-
 	for_each_stream_map(i, cfg, stream_map)
 		apple_dart_hw_disable_dma(stream_map);
 	return 0;
@@ -803,8 +798,6 @@ static int apple_dart_of_xlate(struct device *dev, struct of_phandle_args *args)
 	if (cfg_dart) {
 		if (cfg_dart->supports_bypass != dart->supports_bypass)
 			return -EINVAL;
-		if (cfg_dart->force_bypass != dart->force_bypass)
-			return -EINVAL;
 		if (cfg_dart->pgsize != dart->pgsize)
 			return -EINVAL;
 	}
@@ -946,7 +939,7 @@ static int apple_dart_def_domain_type(struct device *dev)
 {
 	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
 
-	if (cfg->stream_maps[0].dart->force_bypass)
+	if (cfg->stream_maps[0].dart->pgsize > PAGE_SIZE)
 		return IOMMU_DOMAIN_IDENTITY;
 	if (!cfg->stream_maps[0].dart->supports_bypass)
 		return IOMMU_DOMAIN_DMA;
@@ -1146,8 +1139,6 @@ static int apple_dart_probe(struct platform_device *pdev)
 		goto err_clk_disable;
 	}
 
-	dart->force_bypass = dart->pgsize > PAGE_SIZE;
-
 	ret = apple_dart_hw_reset(dart);
 	if (ret)
 		goto err_clk_disable;
@@ -1171,7 +1162,8 @@ static int apple_dart_probe(struct platform_device *pdev)
 	dev_info(
 		&pdev->dev,
 		"DART [pagesize %x, %d streams, bypass support: %d, bypass forced: %d] initialized\n",
-		dart->pgsize, dart->num_streams, dart->supports_bypass, dart->force_bypass);
+		dart->pgsize, dart->num_streams, dart->supports_bypass,
+		dart->pgsize > PAGE_SIZE);
 	return 0;
 
 err_sysfs_remove:
-- 
2.42.0

