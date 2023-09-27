Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2E07B0FA0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 01:48:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SpworzBD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rwtc43GDSz3cNk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 09:48:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SpworzBD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::601; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rwtb91Pjxz30fd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 09:48:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J7v7E1gnePvdUxE7a0xpBCXtlY5aMNDi2PVSCH1UmfKxkfa6mwDnrWuiHkoOXxl/vYlxKuZ3KBDQ/rEP7YpkQtyTl6o9tiSCv5e6rLSfklz94RGEzZiwGbgdRbX4XYAL36rWZKDLZ4t1IsjyhUC67DlZl3C/KwNh2BUMttYFCd2cpM6N6cxUViRK34pkbXXT9JuB10wwC7wVnoJgPXt7BDiavfS19mCZjXuflwWr/86nElGjSQyG3qxsyJGNj4D2QDUQEqfTU6UU2j9IprxSsGDqjKgWA0KzjV5VQVj74EIbyxHSSTxR/ROsC4VrkUDZn0NVYS1qG2dO62KqJZpc/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVkdZdID4HiLY9Ep3+V9q+IXyUqoLUJfxukiDQpXj+g=;
 b=XGXzTT8PpLTQNKuOFTfHfwrkrd2Vb5Iecqezccs0hmf4hdkI3sIJERKpr6WInmZMI1YBjtpUrCB/yG8wElL0BY+jPnDikXdL19YSnPIxf9uo89ypUDhNrBlqBddf0vDSNSQ8v0FSKHm4sRCkJhcD9Otm+SxqqQTI3p1qzCUINod9exufs/AIyGcQ8827PZeVKspLHlnYO3vElAS8ivHh753O5ebu7FK73aa8+xblL8hxA4FdIu0rDe9Zks9LXRCl9fUCz2xOt06me39qn2oyUi4SRrOoHqGIOLzWctexEZg4y6Cu6M/P/CBSkyg/c1qd2CFFsIT/KF4no21fea0hJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVkdZdID4HiLY9Ep3+V9q+IXyUqoLUJfxukiDQpXj+g=;
 b=SpworzBDId9UQP2DBZHU/hVjQJZzT2Re6zG5w6ToREXfHBomCRbcli9zjnJzFUlxZJhYAgPDiLk/hfg7RGvrEwW3Ol/u8YFXEkaWJHoG2w8Ka7rOc8K/SLN2M0zlAn7axbmHo40JQjMiG1PPuZ0J1kAcsSdZ8zduktw7LbqZwYSuJgH8/XWtab9+xCbOlIKDR3JVsTDJ19FgXunxANgyXxQXvZLPOpahExl8Fnd9qRK2HBwwkxg5MpriMsEH98PcdWMrFdRli61D8LNULMgfBJ6lzfrzij0Sr2bcvRVWo5LQDCzB5tN1E3JhzABuZbN2Wta8pycD3pYdxdYsjFjJXA==
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
 23:47:40 +0000
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
Subject: [PATCH v2 3/9] iommu/vt-d: Use ops->blocked_domain
Date: Wed, 27 Sep 2023 20:47:33 -0300
Message-ID: <3-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
In-Reply-To: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0354.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::29) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW4PR12MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed06a80-49e0-4a2b-282a-08dbbfb42313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	CqhMA8KrlkUCLh7Q8qBfG555SVtc89zH+zFE51eBP6Hu/EMQbDToR85h6tTg6UbK3BxrGcbWL3aSRTZ12egbkE+Zovxkl1V2wbNEh7ArtNeMYgT/fHaJZIm90Tj1oEVDSf4Qox7SkQnnrZ1OOdbeN5nPo1nTcg16QE+KCRB9KdRs64EFQxJcuIuC/hbFtyfzT3Usvv1fhus40V98Slt76e0TqKmLbvKVwZzb4tl5RxPhgqF4pi4ZdfWZysxCc3+fqz1pruOJ0Is++ZSw2gd7rUo50AjAPk++e3RFruVW38A/MupxV62+YoInn217k86CWq4iPlWGkBL7K7hMg2NoZ7MFRaYeojbW4BawcDT1rpLYUs+ndCuxo7/wFfWtsgwXBnqr4loPd6ck1h0V61SSl366Q7GkPyQsZEVA+3riiCRcl7oQiwN6FdTjZnvRGrvMifja5oOxRjNH84n+/+ywrcWzw4uah3ZWO6oD4IrVEfiW9oPD0eIahs81NqNMSUSmdKj1MkQC5IA8XdZTGeigwQU68QoJkKs75AiGEBwoZ87bKeOc4c+QwgTF2ptsnlGmTkgdl3wOTL4rsXR4l3eHBiMQtA53gXDP3LatixadaDCWMOyKuJE8iGZ4mLwRSZ7w
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(6486002)(6666004)(478600001)(921005)(38100700002)(86362001)(2906002)(7416002)(41300700001)(83380400001)(6512007)(26005)(2616005)(36756003)(15650500001)(54906003)(5660300002)(66556008)(66946007)(316002)(110136005)(66476007)(4326008)(8676002)(8936002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?yQijy0nY3yWJBkIBp/wBa7mY14yPIzBla+07XhB82uNj3LvFH5PTkY1EwNfv?=
 =?us-ascii?Q?Ls+87CqtcNDNTm7QR1w/CEpTE+MqIBxlbwZdCHJw9hgF5vdcdGNHMV2PrlSS?=
 =?us-ascii?Q?l2vXDF3kjjX/b8d3x7lkJ2zo0hPs7BRo2viqXAPfS3ryOLAP2ZkaM8GxAaZT?=
 =?us-ascii?Q?NK2uEFl2iMOpde0ZocmlKCohuXgI8e3R7NV4/OKFuS3/hu2oXjVtfX1+5pr1?=
 =?us-ascii?Q?ZGbxYtt0XDz+hiLIi4YOx7oxR2aQBFpKZvH8SEU4ukkPE0Cs44TKk5kbP638?=
 =?us-ascii?Q?iHG1iM53PcvoiHKEsUbXqe/4vLURDePoQqPjCMMK08pRHsQf/weCRxGakADw?=
 =?us-ascii?Q?AD0ZBCSv4fLYA0NUAOdVj9KH6Gi1lrDJ+hPLD5T4ehAdbWobJ9aHgyRNQEll?=
 =?us-ascii?Q?r0BWqfWuZ998tJCcQjYj64J2YakICTLluiq2BqNDBkyIyjBFqd34eJyEMQPc?=
 =?us-ascii?Q?aD5naH7SQwJFttH7yJR84Sb0JCZpilJ2A6QzE3D0RXPtvKWKApp32aRWy8ai?=
 =?us-ascii?Q?CxpB6tXhwOt1sKrDxVipKGU5QeP7rTueaY7m0pBMRZN/uMLblh8zciB/SA44?=
 =?us-ascii?Q?z9dv3MJFyN+6Ifrqje73n+BTQwP1lprxSEIEM18qmtNlXlCx52DgK5JgHLwC?=
 =?us-ascii?Q?D0v8Ud49Y5T6vcCY/FEvDrZMItZF7Hgy9x6tJx0uq7hNWGeD5elPv6+VQL7r?=
 =?us-ascii?Q?XDfVXr6RRQ1lkjXiYPm7GZvflCbzywFnOTsDEgmKrG3S8vw8PqKn+FzBHCkj?=
 =?us-ascii?Q?zKN+D/KxncHFoc5WuF257l8skNhVLhmJrSVZlpG3a8g+UnNCuWyowY9hJ2gR?=
 =?us-ascii?Q?GGQCGj5KMBjx+2m7K7VCANx78RAePby15nPiqvVRP5/2J3lz2d0h3TSJ8AOP?=
 =?us-ascii?Q?H3MShKuh6m0JtAN1KxmMZgPmpVOhFnGdnE0buAkNzr9UG8gsIhi2/oA9n+Wh?=
 =?us-ascii?Q?vJlWqc74QCBqdhzkG5TlCmPiRW9yzD7M/ySWv7f62CEMds68pzNIrx14mO03?=
 =?us-ascii?Q?m58KSBbX6MouTb4dyeG1jj8sWIRh9trSJ0A0LyuXEue5kgNMuEbr9O4QlR+O?=
 =?us-ascii?Q?FkIqsu046dRtU2cgYWrj9UHsjs354KkZAfsRl9cvbP++h3E3Ql4o10oRumQI?=
 =?us-ascii?Q?8izrvidV4os9z8WEln/CBIS4UASEB9ExDaAyEyEeI803JRieF2F2vJMQcHTq?=
 =?us-ascii?Q?5De0ev12WF4t/FVZbN2pEt5whyfimkK0HoDhcNqxEQbfjGokOFf5GaV3l8hT?=
 =?us-ascii?Q?8AhEwqFdZ5JUi/9YX+QKrJ3v7AdoOmUnTHRWI/FsFKe9udMRRrkFBl/vTv6S?=
 =?us-ascii?Q?bl07f2LMSnBxhn8Fah8ptsVyLTPECAAMmr4LA7+pbsAe8J/UWPF0UHPVpvyQ?=
 =?us-ascii?Q?fKxXKWM+2d+2t/qUROKmrjOZqwMANbnxpHQ+oKDCkAd3sivF1S6LsdRZTT0H?=
 =?us-ascii?Q?tZbK2bgEUJnHRpJJID+CISRyOpZku+2etMlWUbBgugpFhKwIoBzeL1UdwVif?=
 =?us-ascii?Q?rA1Kwz9V1LbyRBIg1/Olv6M5Ie9qqUP0WZE3F0HWo6ot2S6gWdY5NePGGtWv?=
 =?us-ascii?Q?SWx0V+6xAIju9FR9cIkyHNVrM5tZ/sXe5/q1bqs+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed06a80-49e0-4a2b-282a-08dbbfb42313
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 23:47:40.7874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/Gm+q2Bm7Pi3cVP55dXApS7mC9juDyr/wVoZnlDiCPRFzqgDLGg6+8vGxXYIQnC
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

Trivially migrate to the ops->blocked_domain for the existing global
static.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/intel/iommu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index ba9db95d2f1c5e..71c12e15ecd7b3 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4025,8 +4025,6 @@ static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
 	struct iommu_domain *domain;
 
 	switch (type) {
-	case IOMMU_DOMAIN_BLOCKED:
-		return &blocking_domain;
 	case IOMMU_DOMAIN_DMA:
 	case IOMMU_DOMAIN_UNMANAGED:
 		dmar_domain = alloc_domain(type);
@@ -4788,6 +4786,7 @@ static void *intel_iommu_hw_info(struct device *dev, u32 *length, u32 *type)
 }
 
 const struct iommu_ops intel_iommu_ops = {
+	.blocked_domain		= &blocking_domain,
 	.capable		= intel_iommu_capable,
 	.hw_info		= intel_iommu_hw_info,
 	.domain_alloc		= intel_iommu_domain_alloc,
-- 
2.42.0

