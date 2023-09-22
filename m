Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4E27AB709
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 19:15:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Si8UtGWU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rsf6p5kszz3dg7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 03:15:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Si8UtGWU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e83::61a; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rsdy81Jhpz3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Sep 2023 03:08:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FXw4UrV54rQefdkTyCaXNUD8PkKkYurrtOOTZzLn02ZejsWmvW/MWx4UkuRdHYQcUQyRHgwdZk5iQQ7mrnJjYrfLbXQrn1JnhUGf9QUN3kDK5d7Y9qb71WKElv/EiJk8CAS4J8Rj6UrOY84hzv6qgcAD7Xe0c0B9Y2Jl4K0U4QLPB+JGqVHJGSHmwrj5ZMPDKH5+vUU+GThZwdTlbATMXkEJSVZGPp8eOonHEsVnERXVTBhCTU3RusZLsdu5shEX8Wg3G2u7yu+JXKQYMphi7AfHqzhpQWV9qSx+azAwZB4j3oH4c1rsQKji2ngagw/Ob6drwOxd3/oE16/AZ83HWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4ZdaRsPGgwgh2HKtFEuY/GTuZgb0awJTStWcwDEGYY=;
 b=iQg36kbZYjcGPoYQBiU8kn1KCW82bxTvEnrj/PjyiETsYY+BxE3O+KjQW8ql/wL16zQgy/j0G/A0Wvx3No5wAtx76LKUZ1m0g3Q3+g5u32u7cGgKwhzG9bY+g+DuxewfE7q39oFJxbVRJU5Mo7ABbqU219g4lX/Pbr9h3zPzpMFDq3eUpMF6EIzE2TJefacG7OfS/XNOIYZRswelyMEhOylea1UrlMVh9LokPx9rVc714vLUf1F5KH7eVLAsYfkBslRj0iv3UlTHs1slBdwB8BrkanYWyj3+oopJQVHQYuuVSm1lw8Qp95FiwgiJTSx3cKTfm4V9Vihi6sFQ6fuNjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4ZdaRsPGgwgh2HKtFEuY/GTuZgb0awJTStWcwDEGYY=;
 b=Si8UtGWUCLmVYhVn4UGnuYJ3g7WKBuFTDL9vlAezeKalRrR7mn71WfEnx7H4jgJsJAK9tOtDHIM6JswAddQ3FTr+96ZgG/s3f1KQPIhlZ7dCzfhtz00x22xvA3sMvUv9qR1noT3MU9cdYhT9E35oyMSOy6BbftmLfEQahQFNQ/2lIyNiouqT3S2Pr/VyxIetLc010XQSzYARTow8KFa2mETuxo0x47l5vVKPaj4xBqeXli2F7Wy+FJp4IjQeg830wXA5O6uT1HFER/VuzbIugKgk7+zVwTumv+hSTbJQ0x4IlXGFXEZSEnoJbxGZWsdyv66bUR8f4deJH1h3cv02FQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Fri, 22 Sep
 2023 17:08:04 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6792.026; Fri, 22 Sep 2023
 17:08:04 +0000
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
Subject: [PATCH 5/8] iommu/dart: Use static global identity domains
Date: Fri, 22 Sep 2023 14:07:56 -0300
Message-ID: <5-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
In-Reply-To: <0-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQXP288CA0019.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::47) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eccccf6-3a9e-4bb1-ab8c-08dbbb8e7baa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HoIbyQ6U3GQJduuSEEn/XMeKPRiAlQyIuUbshr6cQLKcuLpiVi6f+5nDBiepDMONSQxs5kIwspOMfNJGgJG3JmUu5/S2aB34mtVmOMDD2IMk2L+BJxFt+FDxg8etUf1apORnpu3Ja/0qgYyFwBbhGPm+utp+hPgWM/WzT0qABxFcfy2SKMNn5+/GS3VOT7EZ+lXw9CMcKmtZ02BPLs3lfnP3oqK6bJXSrXXfigkF1r2YKH/2f/Eb10ObAwnBe6TJKyNzhj3B4B7VVLrW1B31sSwE2E6I0heerv4atkpbTzCkKXT9Y4BjiFriSN0ERjJS8aYltTA5cDMlSRTatz+a9Ex8pxxUwVvGwiihjag64yypcpcxnFGNNPTl7fiITuBPRx2HCBRz8dDXdIf17YiVUzoe7CmslfFduBvotaGVpfXVGOoSa8FsjW7HaF8JgAfu7N3QJfBCiMWTAImUqkSEf3FIm/wTa7smt/CyvxCQAuEtcTIPgMbfjIf27PIvsKWWtNInz5e0GiI18Z4M3vD2O3fZzAXfURA32I6QjFshPt7OK4pXtupXNQhi0PeWc5BiGTPx3Jt2qW/m1n2NsxmTnb7JAKB5alQrp4oOyoohZYO0+iB7I/6YhF9tn3q6X5FE
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(186009)(1800799009)(451199024)(921005)(26005)(8936002)(2616005)(8676002)(7416002)(83380400001)(2906002)(36756003)(86362001)(6486002)(6506007)(478600001)(6666004)(5660300002)(38100700002)(6512007)(66946007)(110136005)(41300700001)(66556008)(316002)(66476007)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?V/NRHgchph4I5eX2lOcb9YvC5WtKyDZjBb9f6qO/kJ4I6W6RxnWSKCuIlI/C?=
 =?us-ascii?Q?SHb9+N+rq9gpXyPuZhuxk9VjqDsgW5Rz7qi2aMhJ7NCOjaiEcdLotetXZ1Qb?=
 =?us-ascii?Q?2nvADOLhWUEaNo1fEtItK8GBziW6ODgmDzJs55uwrB35yNyDsKAnmUcn1fGO?=
 =?us-ascii?Q?tjSMcHpjzteZuoxGje9hKk+4OLm74UaMu9HS6JVGCaPaLELieNz47ahfTf6G?=
 =?us-ascii?Q?toKiZ+Rvl0TAwFUiLb+uR94jQpdCv9to9hnwCLag1njV+vVWn+MUEe5kvjAV?=
 =?us-ascii?Q?rOWzGsuVtiFqTNBNvejh/O1gtKOxZNYReS8Qc9KToltBjIlqatr+SDHs1vCt?=
 =?us-ascii?Q?VqQLzIWr5V0RQrzqb/mJ5I4pXNp2lGjVDvf7wHKjAZGOguzExidCV9TyoCdF?=
 =?us-ascii?Q?aW3QVWytd1m8R/zJnaB3XjEDzz3CFwLWipKP9568xTRgbZXHjyZiI5ps6h2R?=
 =?us-ascii?Q?IxKCszLhnxrUKbCvNwp3PqHB4xEFdlHA5uHhWaBdo8HjV6TaD3AGNm/oIC+Z?=
 =?us-ascii?Q?+oMb2czCUXbXhN6ZRlzZ/aOqgvy8Qu9o1V22Zj9A3qaeX/qFFLoKeZ76xc6O?=
 =?us-ascii?Q?blDSMFyhT6CJaZT7hD0KCuiBpiya7W+GkTysbGblz2tpzGOLwv8MzWHzTPft?=
 =?us-ascii?Q?BGdFIyMngtSThvqfGpzrU5nT+kunsfeofnUFmeM6QWYfguVsW6WtoGS4gkE2?=
 =?us-ascii?Q?v/tuR2rGidbzks2EjLxx2mtB/p4R+BBj+AOzxfy9kQa1r0ydZ1uexKiOnbX9?=
 =?us-ascii?Q?UMFqc83jn2bL6qDNusuTVHU78YjVkLOLCRv45mLnJpE3zrry/j6AVSyXheKB?=
 =?us-ascii?Q?HtDJQOj+avC0JMw9oRZL6WzLHjiyCCImvGS/uRclGkx+l9c5twFw4Z+v6Tdh?=
 =?us-ascii?Q?sozo+WDJtZOTK0rCac+HNBA0xv1vsSvBtoXcA7GlqVj3b9RciCrIfUEIp421?=
 =?us-ascii?Q?ToAgOnCcFvbQ/2lgHn7XSyUThg5klcGDXeHRizlmd4Ptq9OhZSIcQ5LXKE82?=
 =?us-ascii?Q?P0HK+c/5xcBISGZBMBCZqLoXXrHFImXnOl5cj8+Ttos2U6DeHTJuKUJ+dt2W?=
 =?us-ascii?Q?tLKC8AxapfLBP5poqIfO+td5DjyhZwUu9h705SBGRJRjT9FnkeAAqp3+GCzF?=
 =?us-ascii?Q?ncZxaTAOxJws7nYg/E+vBLQcxRBQFdcUtZjf5wTseCWzVmC5jgi+DWf7uqYu?=
 =?us-ascii?Q?58ocnHmJtx7LcEie9vAzbzaN6fymcXcwcgNyW7oiYQbW9RAn5GvyIIelp0QA?=
 =?us-ascii?Q?2N7C3nI7lp9q5j5sZCiE7PmJBO79xMgYRlZRHm9U96pDI2r7LrdJ12PAeo0b?=
 =?us-ascii?Q?+JCO8xjHis0tvqLlkduzqJK9lObt+PDjt8WiySeRIDkTCrah3xLMpCk4zCIg?=
 =?us-ascii?Q?mIfCryjN/RwshWfIUqaErvyonbzyiNYjQJ1aLIBwTm1gJ9IWMP8Qe6hQI+iM?=
 =?us-ascii?Q?Z3s/bgXmSByIB1rorstpKX2BmSeZ9vsXQFZDr1u2UncoNRDvedvErhvX/j+b?=
 =?us-ascii?Q?LBslixfh+qUkm03200BBFzgRMKfNgD1PAcosAXHCzsK9MsScymzxoC0lIX9/?=
 =?us-ascii?Q?5Li3pGuNMkk09A7JxE6HPY7DwZ2kT5+oluU4tTqQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eccccf6-3a9e-4bb1-ab8c-08dbbb8e7baa
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:08:03.9242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LMR/nyVOdMtFE8gvsGdYdqYnE9Ny4r4pBuIUIjshci0MNMdHGNqD7/+L3boxFpZZ
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

Move to the new static global for identity domains. Move the identity
specific code to apple_dart_attach_dev_identity().

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/apple-dart.c | 41 ++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 6bc2ad2207c3da..424f779ccc34df 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -658,11 +658,7 @@ static int apple_dart_attach_dev(struct iommu_domain *domain,
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
@@ -683,15 +679,37 @@ static int apple_dart_attach_dev(struct iommu_domain *domain,
 		for_each_stream_map(i, cfg, stream_map)
 			apple_dart_hw_disable_dma(stream_map);
 		break;
-	case IOMMU_DOMAIN_IDENTITY:
-		for_each_stream_map(i, cfg, stream_map)
-			apple_dart_hw_enable_bypass(stream_map);
-		break;
+	default:
+		return -EINVAL;
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
@@ -722,7 +740,7 @@ static struct iommu_domain *apple_dart_domain_alloc(unsigned int type)
 	struct apple_dart_domain *dart_domain;
 
 	if (type != IOMMU_DOMAIN_DMA && type != IOMMU_DOMAIN_UNMANAGED &&
-	    type != IOMMU_DOMAIN_IDENTITY && type != IOMMU_DOMAIN_BLOCKED)
+	    type != IOMMU_DOMAIN_BLOCKED)
 		return NULL;
 
 	dart_domain = kzalloc(sizeof(*dart_domain), GFP_KERNEL);
@@ -732,7 +750,7 @@ static struct iommu_domain *apple_dart_domain_alloc(unsigned int type)
 	mutex_init(&dart_domain->init_lock);
 
 	/* no need to allocate pgtbl_ops or do any other finalization steps */
-	if (type == IOMMU_DOMAIN_IDENTITY || type == IOMMU_DOMAIN_BLOCKED)
+	if (type == IOMMU_DOMAIN_BLOCKED)
 		dart_domain->finalized = true;
 
 	return &dart_domain->domain;
@@ -947,6 +965,7 @@ static void apple_dart_get_resv_regions(struct device *dev,
 }
 
 static const struct iommu_ops apple_dart_iommu_ops = {
+	.identity_domain = &apple_dart_identity_domain,
 	.domain_alloc = apple_dart_domain_alloc,
 	.probe_device = apple_dart_probe_device,
 	.release_device = apple_dart_release_device,
-- 
2.42.0

