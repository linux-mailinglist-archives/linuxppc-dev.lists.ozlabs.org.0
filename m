Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD967AB6EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 19:14:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=b/it0RRK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rsf4s0zTlz3dkF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 03:14:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=b/it0RRK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e83::61a; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rsdy74jbHz3cKW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Sep 2023 03:08:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZtx3aur0cggV6hDgM2wVNSGO4cUxz5d5+8g83HkRwslxeGtpUUYO3lJFP7SkDoAtM9Lf3qmT2GczFr33Dmo4IcSwu+OAJEM4m8Mxi9C6teOKJWoeq+SQNhPIBIPwGO8JSH94gRZOWjPX+0F993yWFcDk/m3p5hQI2KP7EgVusz/VYxmGMmsmdMpG6x/R8vgyY2ylwUKxewUtoyaiGh+xQgKjVbem0k48vHHedizgjbddZeVN3Re+hTGikxf5VLABDbJ/VMBEmNzivOIZqun2eJ8ntAtKFSCMe3xuAOpa6Vmb5rq/XjptOmpQaXlPRfgbOSo5xVcJQ9u/DqFz94rrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4DsCX1rU4U3aGM0/1fQpNOzPmGEM4a2jCpb6axFjkg=;
 b=RG2BGA7rI1YGIBFKfzqHVNvXXpIkCy7zB+oZgnx+nvI0y3DsA0/j9O3Nu1GNGl7GdQxEQcsKZahy7Wldgn/iGyMZNbld2P2R7iI7uzRvSpvohZQ04fvifAhAJg5EAUnfTSj39Qt/6qTBh/DZJYuxm0dk3m9ufmyE1XcpGrgzcJqaPSs+i/mFdne7uqxzYX/ER2E4zFyVstLjlBqnn6EnvRQkqSBipYhg45EKaWokzbJiQG48/8dlkEeHojImDMTT367C5Pz09c4QbzV+9HEAyFUmjYcMPUg8HBXLDTNo8w3QzqF4oc78A4s/lLqEQHH03zgvnZAZd+6OQscPwJD34w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4DsCX1rU4U3aGM0/1fQpNOzPmGEM4a2jCpb6axFjkg=;
 b=b/it0RRK9qhQd2vAAgJBUGPUdIq1vqAK7HfGGvuaILrXKwvBx0bFCZ5glgdd7IlpljzkWwGXDagmRFOmynPM+n49wV7EvGkaXJmdLXxT6DbtuPgKaC19oF6pH58t9z9D+gLPbrnV0DH/WXZ8KnguMDNHk9Nec9QGmvmEDDevjQGFk0YeMsXC5NNiBo6wBUf9SgU8mdgF9f7UfVnuKTde1YKu4O5i2HUHilfo5Y/DIvyXMNXAJCROSnhA9NyzSjo4ctSq5tNoFbxR35m+oUzoRREV4pKLAf3twiMNCW8t/xth8x/CqH3f+qkETbIL7igBje9pud+cs2CP9Gk1D0FO6Q==
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
Subject: [PATCH 6/8] iommu/dart: Move the blocked domain support to a global static
Date: Fri, 22 Sep 2023 14:07:57 -0300
Message-ID: <6-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
In-Reply-To: <0-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::41) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: bcdcb14b-fc2e-43c8-165e-08dbbb8e7a83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Y+lcqJ0ZQ6z+Ykf4WCEQBvaRGn8MDKUf93vh69gUz3WBcVaPWmbOiI0TNqJhbfp6Ovq9EyvNgjfT7Nd1gy/U0y0Yn/T7VTLbLk8VL1yQGUejw6ULHfp+boU1WlK23O+CjFGbtSrMsd86XMLiG0kA0g8wgGecaCN8d52fBZkr+VvvomO39dROpwTxouU1fsvsxoEGScXq2KNrsa/AGtV8jsQj4xOFSMtJbk0tG31vqIER0pQ1A/2O+jv96XBXhabw0GLL0rZZkBdp7BGE/YLsP7kEWrhkjyEXRGJIvG0b/QXk3/UW1joAAO2aE2ZjjkqBg/GOy3/95HZfIbViRZblPmiF6l5+RNHYqNkJq0hFtrJOYtgzQAFZufRMHLmlX2wpYwyqAv7eQVUxJScic5H+ClhFlYpD4A76+b/79j+DzEbu/p6sxRAN6tw7WHe685KTkpJYpg4SnXvXiQzJxWKRTZby/Kc+UEav/tgdrfvnE7yE8gdj0OsffizfP+2Ua5enh2lGKeNKTOE4cFQvFWYQWLWCfhkJDIhv91X9V4x1+04spUvXO/zqnCsZbEVM2R8kG2uAb3ytW39FMa0tUqs3SpcVNZ3MsITuvDLz/PyuBeXzZlA8SMQRFpjNYZGdiZcA
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(186009)(1800799009)(451199024)(921005)(26005)(8936002)(2616005)(8676002)(15650500001)(7416002)(83380400001)(2906002)(36756003)(86362001)(6486002)(6506007)(478600001)(6666004)(5660300002)(38100700002)(6512007)(66946007)(110136005)(41300700001)(66556008)(316002)(66476007)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?c+IXxHSrsjIkhxq3AABijW7mH0une5z4vu9Tp7m1B0WjGflw7mr9TTrUWidr?=
 =?us-ascii?Q?psOPOgdImX4cumFxvxYfA54qf3Hlum5CECP8EQGRnsvTURmKCXxt/VGhDrpE?=
 =?us-ascii?Q?+L8ojWN+2Q2vt6sk0cjfTnbY9GtlnI9bzuYNYocillr/e3TpqkDE9Yalwl9N?=
 =?us-ascii?Q?HjY4QJ9fAKDn+ON0xKIV8L3oSkbk8LclHZ/Y/J2+IWwnhCBlJrbBOj82jXjz?=
 =?us-ascii?Q?mNVNvtn3APn6axr+TS2iqdeQwqfzno6G7d+b8FiRLdRNzRWohLHmM2Ldx5ay?=
 =?us-ascii?Q?155uDxFBLjKvMT6P/etCAkvp3YnR+zyX7Yt8VXeQeO7dq2XT0eX25jyPKcLI?=
 =?us-ascii?Q?wnjMKSxGwLtV17kTe+z0ezeDx9ih+L/medCdfwuvqrgcyZQQDYZqeriIUXHT?=
 =?us-ascii?Q?Op2unWbWaRXxowwUcClRewtwe9hMpbSna/uAg12+NIx+Un0ctbc8eLcslPHB?=
 =?us-ascii?Q?2yTwmrEyB4FFe8DDul1+4O+skQZHhdqg1gFMXTYpjJ2Q3bWTkvQL1fZaN3HA?=
 =?us-ascii?Q?58dxW64xaBWOWhUFTrR6CoPc8aFZ4CqbsTrINNkytcQukxAx/x05jo9yT9bZ?=
 =?us-ascii?Q?tdJ2lGr2YFZG2EZuapWPf5M86XdC0UAiVTM/7iZfok/MW6h2NSHv1KQ8pPIv?=
 =?us-ascii?Q?7qTWF19cEJexMjXShzHa3aawXWGHMGJz40NMYFxWbp+d54DiZfO/WW9G1KoR?=
 =?us-ascii?Q?iYjzvwpx6Ca8uEEzobpFsL8K293YJhde/1x42RgJwnqmoNwLuK/lXGM7EOBk?=
 =?us-ascii?Q?mPA1iZtBazr0iH0bMYUNBeEbhDGOYZDUJ8QInYH8q1RWEcOkJbNoXKYxwmJI?=
 =?us-ascii?Q?q8DGvVkEZF5foBR8ZlpbP37ATe7LPvTw+in8NObvTXA5+NFITiPkQaFOPmHT?=
 =?us-ascii?Q?4EEpFb/MMZI1RCqzwXv7gZFt0nTaEwc6VmaE2xyMkhLdZItF5XBRVzpyu/2I?=
 =?us-ascii?Q?1RoW5zfhAH9YcgTIMCllK+DSKGxOcl09h4Q6SOvJm78GfTC2BdVavTiTi2tJ?=
 =?us-ascii?Q?tVT86Yb+y5EeuVAvxeFgwt0yTQhZXVg2A44w23KkuyxUFSzJcd4dxnyO39Pc?=
 =?us-ascii?Q?wl5wcDw9yPn5CNNw7aKViy3dtKVlv44m3qqRvcCytYjh3SQSaNPUsnPgKe5H?=
 =?us-ascii?Q?R+ItxuyVKBtDzRnL+GCKh++w/WbNFQYbu59bmbWmmIjTiWU7ablttUnpxoaD?=
 =?us-ascii?Q?3zxkBuX+vR4lZ7/Z0FqTdIKf+dKlxmHGD9IvuG7rU7s4esrs6UQ02tDHf40s?=
 =?us-ascii?Q?9A8zwI9z7Xkm3GKuVXJa/Hs6jrxFFr4ptreLPg/WYlXmTECAK+BIg7/6N3QM?=
 =?us-ascii?Q?w8oCoN+DDNORC6uP5DjoasAoLFVTmVhyxwdwlJPax7p5p6SBnMHnAdce1clO?=
 =?us-ascii?Q?FVl+e7qB+RfdgeeukAiZiS42fI0ZHNcGDHdQiikKZZs9OZhX6UI/grEehdZk?=
 =?us-ascii?Q?yWR9+m99x7RoKUYSQR4NYmbBWJBv6r+Jq8bclPvC0p+vlyLizhsXwjOMAulb?=
 =?us-ascii?Q?z+6QBKOvfmdM/ZxyrV3tGVSaM47IMlnjuGopwGduFpoQVbH4tOcUXr008iRm?=
 =?us-ascii?Q?RT5XAooBMmJOpat6htEejEXjW2JC0JZ/1/D5P9kU?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdcb14b-fc2e-43c8-165e-08dbbb8e7a83
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:08:02.0163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULXqMQOWDnW+Ke5GW4hIpfnz/ONZG0YvUWMUWTzPtS9MKj1IhNkdR7zGNLFVO6kG
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

Move to the new static global for blocked domains. Move the blocked
specific code to apple_dart_attach_dev_blocked().

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/apple-dart.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 424f779ccc34df..376f4c5461e8f7 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -675,10 +675,6 @@ static int apple_dart_attach_dev(struct iommu_domain *domain,
 		for_each_stream_map(i, cfg, stream_map)
 			apple_dart_setup_translation(dart_domain, stream_map);
 		break;
-	case IOMMU_DOMAIN_BLOCKED:
-		for_each_stream_map(i, cfg, stream_map)
-			apple_dart_hw_disable_dma(stream_map);
-		break;
 	default:
 		return -EINVAL;
 	}
@@ -710,6 +706,30 @@ static struct iommu_domain apple_dart_identity_domain = {
 	.ops = &apple_dart_identity_ops,
 };
 
+static int apple_dart_attach_dev_blocked(struct iommu_domain *domain,
+					 struct device *dev)
+{
+	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
+	struct apple_dart_stream_map *stream_map;
+	int i;
+
+	if (cfg->stream_maps[0].dart->force_bypass)
+		return -EINVAL;
+
+	for_each_stream_map(i, cfg, stream_map)
+		apple_dart_hw_disable_dma(stream_map);
+	return 0;
+}
+
+static const struct iommu_domain_ops apple_dart_blocked_ops = {
+	.attach_dev = apple_dart_attach_dev_blocked,
+};
+
+static struct iommu_domain apple_dart_blocked_domain = {
+	.type = IOMMU_DOMAIN_BLOCKED,
+	.ops = &apple_dart_blocked_ops,
+};
+
 static struct iommu_device *apple_dart_probe_device(struct device *dev)
 {
 	struct apple_dart_master_cfg *cfg = dev_iommu_priv_get(dev);
@@ -739,8 +759,7 @@ static struct iommu_domain *apple_dart_domain_alloc(unsigned int type)
 {
 	struct apple_dart_domain *dart_domain;
 
-	if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED &&
-	    type != IOMMU_DOMAIN_BLOCKED)
+	if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED)
 		return NULL;
 
 	dart_domain = kzalloc(sizeof(*dart_domain), GFP_KERNEL);
@@ -749,10 +768,6 @@ static struct iommu_domain *apple_dart_domain_alloc(unsigned int type)
 
 	mutex_init(&dart_domain->init_lock);
 
-	/* no need to allocate pgtbl_ops or do any other finalization steps */
-	if (type == IOMMU_DOMAIN_BLOCKED)
-		dart_domain->finalized = true;
-
 	return &dart_domain->domain;
 }
 
@@ -966,6 +981,7 @@ static void apple_dart_get_resv_regions(struct device *dev,
 
 static const struct iommu_ops apple_dart_iommu_ops = {
 	.identity_domain = &apple_dart_identity_domain,
+	.blocked_domain = &apple_dart_blocked_domain,
 	.domain_alloc = apple_dart_domain_alloc,
 	.probe_device = apple_dart_probe_device,
 	.release_device = apple_dart_release_device,
-- 
2.42.0

