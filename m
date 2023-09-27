Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCC17B0FA2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 01:50:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NQQqfcc4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rwtdz2DSmz3cbx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 09:50:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NQQqfcc4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::600; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwtbB2c1Kz3bv3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 09:48:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRfBTk60qASIrg5SomTSjWpj2IFpoYzaGC0NhRrK05OXSNerGb2qpfy967/AS1tpMknnT8Gm26ko0Tbo07Pq1PJN9SK82G+EIoyFNlYXl4X6el16CsCbGGR89ncuMJWzw1hlq3GJxsMbwJPUYqP7vspseFPMQIF1tXpO51iYAxtaUkjuSu7yKUfAjTgV4vfvPJ/n/ooSponXexBZVPMN9jyKRc85XfsyKhvOwBKDK4HPT2+npVY1oYjuSbAy0l5yj0ANTBWC3n3sRTp6TxjC28Ej/lpXo2gvRfTYsAaR5CUEQXiogwMxL31xZlLls0P/GhaRYhey4gNuL4yz6Ze+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ESBZMO2iwq6wy2UWLHSN4SVMKKxgAtVNG9iuu6PUrQo=;
 b=YaNmWysP2QjuTd2lDbArcC35fmOkJGm5ZnvF/ZCrUFDXM8jOs5i9TYkgOmJ1J31FCZizB7aHp8t8W4nGixrIP7nJ+uKhLlDFVuIFEcCNX03g2ocOXypZ6U+weeBB8v5GP3Ih2gtomwuBLa6e6sYroQ8fGpkhSx5mjTtrGM/kQnvZG37U/VL56CykdxgJ9w85Dj1VWMwLC1Dl5DsWKHvbJSAI/pkYMkuyhNl1Qr42UCH0VOkC/8z+s8DvzgzLuOACC828REsUmKy4KQ/7FYT6fW8z6WUXN6v0La6LNYO0UznjrKq5akve+JDQiu6q0GuuRbAgESdPWIYlFDZBqGoTqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ESBZMO2iwq6wy2UWLHSN4SVMKKxgAtVNG9iuu6PUrQo=;
 b=NQQqfcc4TuuKxAc5yFE+gCSzIWyzABXCiZhq1Fel8C4LHBZ10aq+XUqr7cRiENGC97Le7I1yEgHlANcI5kC628gGVfkanCvxkOxcrzjf2Llce4IMFqAZaa9YAMS+PiYRdCpB16LFO59s7VkZ4ofhN2ITAhDO+mjO3AP4WbKUu67yT/JHjEKHm8yA/5uIcs3luDoTMQghGCpd0p91Ble2OShGe38q3KZ3cIzs0wNK6zxzO5IedwXBQD1GSdKEtOfU960PKg8r8aIU+xxXclplmxQydHxspQM+2KZ1x2SN4sr4eYQemw2itXrpeE9iyYiFmyhFWAhkBGe5e0vrKMAaDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 27 Sep
 2023 23:47:41 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2%5]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 23:47:41 +0000
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
Subject: [PATCH v2 6/9] iommu/dart: Move the blocked domain support to a global static
Date: Wed, 27 Sep 2023 20:47:36 -0300
Message-ID: <6-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
In-Reply-To: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0345.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW4PR12MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: fd8c6b09-6965-4ac7-4eda-08dbbfb4231a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ElGCKIRwctz74yQe6twPdhOr17RGlcc3v6yULItkrGQdUH5/mPGi6WGf7buaKGDse9rHI6wDY7GAOPXUPATYzSB+4dkVYTGYTorVXd4hhp/NzcjlFfTdtGcLVex9hEBwS6yKak0SLUe1CqxYFFKAUflyK8sysFhb4tdfEX9GTpo/aZE25gI4U9yGqk/TjORJViGlaCex+v6h72nPYY8LO7PsqtvkeYS8pRZ21nqGG+bbKdfNeIpeejcVcFsKypi42KphMJW5pPLWVPGyQ9xZz83tng5mRDe/X20RL0MNdenAtE6GaI+TzuqexUubsYgIslaCFT1b27Jo99TKJxOfEfL0q92VI5RPexd46JMbAzdPwWBAeplbGElpR/dfgAWXJGT8xM/t5GOyaf8HWjJspoDtQ4on4n4MPqW8PAM6GQVsgd8Li/bylRhkBuCYUJO1APqFWpMedRTI8xeDphvMn8dAYgwmVrwNLJDu/ghptpKb+1ufxy2qjD+JxZ8DmeDDy0TbIhRMekRfCLCMSCZBTwqzpWyDdr6s0BlNRuaVU5PE+9tzo9z7HmSlww26ep4JwUJxsIc/MsuTdVx6MxdEMh6dPjvbLFskMieHxN//yCgHz769VgwIx1crKlO1ckz9
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(6486002)(6666004)(478600001)(921005)(38100700002)(86362001)(2906002)(7416002)(41300700001)(83380400001)(6512007)(26005)(2616005)(36756003)(15650500001)(54906003)(5660300002)(66556008)(66946007)(316002)(110136005)(66476007)(4326008)(8676002)(8936002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?OiKpjCoFODeTBnBos6uNImqNo4h3yfBBNUd/exLi6Np0SDWKsLQTWeC8pGh5?=
 =?us-ascii?Q?zcFUMKV5ziX7oRYRv4LuN1oU76Z9xD3zuHj3sCgPKI2bL9Fgd4lEGngAU2CC?=
 =?us-ascii?Q?BZhvwE7G+eVFM+DQHvADcSUZPNaErd3IQkG1c8TNreHfhFCwP5KJNiP1WU4G?=
 =?us-ascii?Q?6qWpScTQrC/x0Ykpr1vrXs8XcB5YTZ7E7XsjKSQiBYAytiy9XYGmvY6ozBzx?=
 =?us-ascii?Q?44steA08x81h5NWxcrYTSQ/qe2XDKZhew+JTF+c0AbmMBN0zNPFXyvI0vvBK?=
 =?us-ascii?Q?wkullkNO5OLPD4F/gOqP82hvGTppysPtifofyvYxqZKSXrxK5EvMrfsYPJhu?=
 =?us-ascii?Q?dnSW1i1mCn2UWDUNjRgIN1wTkrBdQu723loQqVo6MJCBuHEZlYMeYvK5XBMH?=
 =?us-ascii?Q?/fxves0fNYZdiWMoHeB5hvXpO+Gv4lgxf41amG4bjRXiAj0xsOGthvrDBbZm?=
 =?us-ascii?Q?/bJYVO3gDHA42W+eRasxKh+AIvBBuA8//vXs9LW+8P9rr2v/jukvTjD7ndat?=
 =?us-ascii?Q?iWJ3YDVZQ7pmyh65q7mIV3WGJxZSATjqoep5oo/gEGyG83cpDKApwVAzNkCs?=
 =?us-ascii?Q?jrhOFAbJUrCjKlBVDCBj3rLt085I798PaQxEnnK/h6syu6Bu+XmV66chtwia?=
 =?us-ascii?Q?iStpktjSOWAdw1tpmlxqN4bjXHAtPP+h2s0KhEWMeGygXzflNYTGTxc+vnd4?=
 =?us-ascii?Q?urrNDXaM2bybj9wt/zitFhd6lqsZZ0SZGUQUJMPMYCg5HzFqrqlgViwi7crK?=
 =?us-ascii?Q?pMj6W5RMAHGHPCafp+V+lrTTvDl9ZFF559B+YIh8XmjECFSRkFJKaRKJckXw?=
 =?us-ascii?Q?olczKLgll1RLnuPU3H8K68k4by2Jv/bkVn7V0aaH471PlSPxGl5zWFlrIT2b?=
 =?us-ascii?Q?vC3lRMfst0wSvHAZ7WFe0bmvBOTUwcXwN9oQP2GDLQowf2TF7Zs1LGXlkxfs?=
 =?us-ascii?Q?WMmkS3Ej/5bN2z2C/48qx68JJs8HoQ1judmq5WsK93ilOf7eR42kRBUUCxG4?=
 =?us-ascii?Q?xiOpCvi3SlQXoQrGp3DWFtVtUULoljwSgJqdwNC5+Q4M2y7pJkspwgAHQcAU?=
 =?us-ascii?Q?rNGUG4ewfaLKsGbmP5P56c8QYuwOu2tQQ9C0pvJ+rQSttVB3z56ldT0Y4dD3?=
 =?us-ascii?Q?M4NfwHU/5/yPSFyC844lYCKb3VWOGkEHekfbD5CeVz5yoaFE6dzuG3yhJ9bk?=
 =?us-ascii?Q?If277zNJum7buu4uWdyz5r2IzQ1mkgDzXlWuzdeMxDjnqdnYii+F1V+Uslge?=
 =?us-ascii?Q?tpLrS6DJZM1QnuVP7udQmIiSslUieDFjTIHf5lkTtXedsnH7DRuebB3iMo2r?=
 =?us-ascii?Q?RvdE+jRjS9t0Kxuk9sKGWw/wZwN+PLv7MeHinfe6FRATwV9AhgSr7SdDFjtj?=
 =?us-ascii?Q?3fRmBkD3nT7ywhzBISVNUGMKRdfD40WT9b7FwbFOteaPFgOQ0UvtVPaxCKsw?=
 =?us-ascii?Q?mIsNrINxs7UXaNmaLnxPwYHmy4ShjlpYtWaNZMFnoEeSciZpnsc2VKCTEWGU?=
 =?us-ascii?Q?UIxdTTmdeqrM05j/N24axuWQZN0WmMlymqzmu9P/UoMlQJDOBy98qD2WFFg/?=
 =?us-ascii?Q?ImjdzGvVNOnmj5bE4bnWi9tJhw8oeuN/ztbcEh/6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8c6b09-6965-4ac7-4eda-08dbbfb4231a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 23:47:40.8173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apWKFYYNSlWK4wrMzjAYofOAPYQh6KZ+yZeLy+IJZRaPT7jBqKjm21lQopy6kDN8
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

Move to the new static global for blocked domains. Move the blocked
specific code to apple_dart_attach_dev_blocked().

Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/apple-dart.c | 53 +++++++++++++++++++++++---------------
 1 file changed, 32 insertions(+), 21 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 2c121c525749cf..a34812e8c9ea57 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -666,22 +666,13 @@ static int apple_dart_attach_dev(struct iommu_domain *domain,
 	if (ret)
 		return ret;
 
-	switch (domain->type) {
-	default:
-		ret = apple_dart_domain_add_streams(dart_domain, cfg);
-		if (ret)
-			return ret;
+	ret = apple_dart_domain_add_streams(dart_domain, cfg);
+	if (ret)
+		return ret;
 
-		for_each_stream_map(i, cfg, stream_map)
-			apple_dart_setup_translation(dart_domain, stream_map);
-		break;
-	case IOMMU_DOMAIN_BLOCKED:
-		for_each_stream_map(i, cfg, stream_map)
-			apple_dart_hw_disable_dma(stream_map);
-		break;
-	}
-
-	return ret;
+	for_each_stream_map(i, cfg, stream_map)
+		apple_dart_setup_translation(dart_domain, stream_map);
+	return 0;
 }
 
 static int apple_dart_attach_dev_identity(struct iommu_domain *domain,
@@ -708,6 +699,30 @@ static struct iommu_domain apple_dart_identity_domain = {
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
@@ -737,8 +752,7 @@ static struct iommu_domain *apple_dart_domain_alloc(unsigned int type)
 {
 	struct apple_dart_domain *dart_domain;
 
-	if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED &&
-	    type != IOMMU_DOMAIN_BLOCKED)
+	if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED)
 		return NULL;
 
 	dart_domain = kzalloc(sizeof(*dart_domain), GFP_KERNEL);
@@ -747,10 +761,6 @@ static struct iommu_domain *apple_dart_domain_alloc(unsigned int type)
 
 	mutex_init(&dart_domain->init_lock);
 
-	/* no need to allocate pgtbl_ops or do any other finalization steps */
-	if (type == IOMMU_DOMAIN_BLOCKED)
-		dart_domain->finalized = true;
-
 	return &dart_domain->domain;
 }
 
@@ -964,6 +974,7 @@ static void apple_dart_get_resv_regions(struct device *dev,
 
 static const struct iommu_ops apple_dart_iommu_ops = {
 	.identity_domain = &apple_dart_identity_domain,
+	.blocked_domain = &apple_dart_blocked_domain,
 	.domain_alloc = apple_dart_domain_alloc,
 	.probe_device = apple_dart_probe_device,
 	.release_device = apple_dart_release_device,
-- 
2.42.0

