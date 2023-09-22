Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DD07AB6DC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 19:09:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=b3mDGcHg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rsdzz6lmPz3dDg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 03:09:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=b3mDGcHg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e83::61a; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rsdy53qwtz3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Sep 2023 03:08:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXG7vGImCBJ0Wen5LyeYG45kRPnYtVf3N3usXd4WPJ5+Zw4l9sNIj+XIL2clas3fKzdHBpb5bDrIifppB70puFxYjxHeuKAZBIOVKUeHbjawNN4gNeLykcTeVm/4/o3DPNfw+8nmcHEP8ljd0svZq/52N9egHzrBBqEndzQ9d+5FgKO/ajCu8kPBkr61c+Ppc1GqUyq1A6qGnMx2t5MlorYQpbQff9C8SblcTcTCp/gRF+zBAQxLxW2GofFngDhCJS0WUgboAqiFlEuqucZB/unzMu74/i7C/YisDfGvazQcwp7gkiubkUuM/rjehXckupl2MkFIkSU8ibJXWJbqjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMGSMhE4LPGfp9KmYnExkWeWRJfmg8ZX2jadHiHo/x4=;
 b=Yq9vy5ZZrlH3B53O+8qsQrkf1RZenzSHvdEzxKbh8lZoXP3MDRvoJcqOy86gc+IheBYSUS6U8i1bCbBE2ibYKYLJi8KW1H0cfR19+sznemcHVxCERyWvH4yQ+QP3i9gko+q3NZAl7XEZ7oPEHJgED0J6OjHcjpGDRRDOz46jCrV3hAdgg6ILM/OqZfP17UoG7BGxX9GZ5u/QlqIZ15Ra9fWvC8fun8BghJYH7mYHo91ZckDdryfQz0FwfWtJTAPIoBkl1FnbicwFLlou8o1pYY3uCNNsseKEdMttS49QLomlHI1jpQqSPsOCEe84li1kxzh3VQp2wvCy7HTS//rOsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMGSMhE4LPGfp9KmYnExkWeWRJfmg8ZX2jadHiHo/x4=;
 b=b3mDGcHgG1w3mOxLa3K156Ge3kPjrV2+WOUmDFT6RJOuLurVnviTjWvCRhhZssVrVd7SWMO+6pmz63Q2kLRxAZYLCO0psCuR9FJAjmnmswiFlwXciUv8z9nbsWieFHQNqRsIfbRCrdQuvrQ3L/Rt8nLO+TDSGBQc8VO53ONq3E9KcT/h3H1bUYTCn+ZKRhM0hQxWQmCWXcQ/6HPxPHyAkLV5ZzUTVBJQfq8tmwJVTTtmuBnf0gIjAVpYV5Lyfz/4WV8L5UYyL9Z/hYSLpZf6q/dpZNigWT4yL66pe1Gwb47HWsxY1wqduzwmvWh/VdolGmRzWn8M4hIdK6ZpSB11iw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Fri, 22 Sep
 2023 17:08:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6792.026; Fri, 22 Sep 2023
 17:08:01 +0000
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
Subject: [PATCH 3/8] iommu/vt-d: Use ops->blocked_domain
Date: Fri, 22 Sep 2023 14:07:54 -0300
Message-ID: <3-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
In-Reply-To: <0-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBP288CA0011.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::22) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: a45cc70c-28ff-4074-0d59-08dbbb8e7a13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	e9pd9KQ9wvHM0zvGvfapYNpQalWB01EgXQvt5alen8Vgw5M3av4opuGh/6kME0dpXgTo1TJEAEct9gdJh+SeRCjIDrNNBpveFvcINkqrtrxCLaYFTNX9OHJRd+SdB9nfBgtaJoMdCU4ROp/LpiuOkhgF0W/qSJXv1zdeNFfEuM/q+oBLb+BCP3x7Fc/08oI8uKp21341YuL2v3JIf3fRykfo58ZAUZZ2VY7W9a5WAWgV73EYM3NEQT0jVwJ9y/d808+1tump/gnDB1N4c1RmrrGZivdujYMH0yewVo7bKK6o6yF0l4C7m6oW1gSkg1j8YN3l6QYgAuURnIertcdBu7eEBpmZebu3DkErtbug4bw0c+P60v1SxCIOFXfZMuGm/mAbYR8ixsQGAbIzHPM7QfdN25PBghnByXyrjvviL+LsGG48HNkc0djRKyuyaacFzjfhl6KoCyxGcze51DMkGtANRVXdWva2TfcmYeLGcuRtE9Wl1a1ywhIVdwFGZQ0/SSWyR8alxkYGowTk1B3R9+EwPxMCpkys+t0tIIy7F6OSgOpApybJWQ2DbfPi2fd4T2Wn1yruynjW13rwdZKMZo+JZzqwqZcguM+1erO2zecEUkSYj7uD1RMr8YEUqbGw
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(186009)(1800799009)(451199024)(921005)(26005)(8936002)(2616005)(8676002)(15650500001)(7416002)(83380400001)(2906002)(36756003)(4744005)(86362001)(6486002)(6506007)(478600001)(6666004)(5660300002)(38100700002)(6512007)(66946007)(110136005)(41300700001)(66556008)(316002)(66476007)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?sZ4ST7THrgkBvQniSEIL2y5QCnSNTDpb3sgZHK5IHLWtd0g2T/m0ZukZO3zO?=
 =?us-ascii?Q?onKTXaJQqd/SZ2VLvtnwepyR1CekNLGEcXsbFZ3tmrrFO1YpWPsJH47bwv26?=
 =?us-ascii?Q?eDPAhCm71H/u99tWKGtNtJRvcHorBPCJCmjmeylWB+MgCumHseoG7MXtHAoQ?=
 =?us-ascii?Q?9hQ4XDjZmfa3TGJMRSEQeD0TREQjyv30iG4qgvNISioW8TBYIlW9bXV01cOE?=
 =?us-ascii?Q?apuhka2U+EXUUIj9SvxqC/8s5aM8Nj71QLbSYhfr9f0+idxU+HAM2EsHRNMr?=
 =?us-ascii?Q?YbE8fcglKgRfk+LvfNt5KrVxN8TqtdiGItpCAiQ7Ni02+mBX76G+OkanqKVZ?=
 =?us-ascii?Q?7sEiXO+J6PqR66iNp5WtYtH/TtqTQnL75VAaillyjYLtQiAzoHADencwRy7a?=
 =?us-ascii?Q?ggsXGWpGN1WMeDWgfFHEc7e9b/eviiOpZfpjxSLMM4x+9cunmQg64w2Wr7mZ?=
 =?us-ascii?Q?IhhDTAcJ13439xF91ifU2rkN1YDbBra0FQ1EEhg6fsXnIdsohyyTQ482n/Us?=
 =?us-ascii?Q?ist7aeOeyYJp8VzgrxoYUD//njA09+527XmBr85N786lc/zF/VW5qe06tQQY?=
 =?us-ascii?Q?boXVoFgKwLI8f0U3mICFnhNoukBkHeAHUcqt/Cvwior5/jzMg3VSXneED4xb?=
 =?us-ascii?Q?8Fb7bWvs/KIxGP1Uzlk+AgbAT3HCMBUZa4W3VCxw6n/QxIX5DBG/BIOS4Y1x?=
 =?us-ascii?Q?7lrevPYvbcfhQ0byraGSrtHYGU9eP1sv3Wot6F/njVpI6I6CSZi6ZCcSN3Da?=
 =?us-ascii?Q?l81Z/5FfZsm1ELL9NGMbPufpMvMiDxcqSLiTX7zBBWdxfNv37O34Xq5URX45?=
 =?us-ascii?Q?lLg9007xVcLwBZrFqt7Q/n3/70YppzOWB/GvcyfBLSPL93TlfWY2AsjH8kTP?=
 =?us-ascii?Q?iRGFhnUQFubieUmaFD0YJlHOSM/G92IJYxzob8PSoniGZ9M8mWDIDD2UTyxc?=
 =?us-ascii?Q?xs+gKGwMAzQsE/Ahaue2p6goEcMuQILpqV6sezaRm6SgWf8SDsAMND41LzZC?=
 =?us-ascii?Q?KhNFOypb/rs5cEsWH1/e0MFgznx2CIpua4BUyzFsOgCbUQzgrxhIZMOFDSnB?=
 =?us-ascii?Q?YnpKYlhApmJp14pGDl7KQ2oDqFFQT3CfaRLiETKqmaseSZpjlliO3Sx67XrZ?=
 =?us-ascii?Q?Aoyoh2NCtX9Rt8zHnO63z7S611tKbjSKHjFnZ2YX5znUpgaFLgFFPAaB4/C0?=
 =?us-ascii?Q?yXwSg1duFHGdow4CuG4Gfhkh7TXQrLnxPJ/RxoY/JxtbzVQcDKcWeuL7fTuO?=
 =?us-ascii?Q?14c6LKlDdrg7FkehNW1ys12ASSN4y0qqmZw6jkn5d8NRPQu01+P1W7aHMojv?=
 =?us-ascii?Q?mSAl6gBmQZ10z0/zY1SNeZSvHBLSdY08iGNkNGNTAvfON1SvzW6a1/eLsmXS?=
 =?us-ascii?Q?46Nn8JQuK6gvZys6IcWR/us1oZj8m54VWsmGtKjoLQ5QuscQrSTKRKp3kCRM?=
 =?us-ascii?Q?P5FZb3jzyyUohokfuI8sCUXAQF022I/SlK1rR+wMZ80IgFS+sNMKPxdXrbSq?=
 =?us-ascii?Q?EZ0jvAgJVFkwM8ay4b/qfrGr2aZ+FA2+S1v66tXNv+7ZJzE+fe8ZpITMJUD8?=
 =?us-ascii?Q?P4IeWsIYXi2sztIrAYnzLZclYD6sc9ZrbEX2SlEl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a45cc70c-28ff-4074-0d59-08dbbb8e7a13
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:08:01.2789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dc02S0UAeHgMyXujw7H4nXHL6fZ7t3C5WvImyj8Xjy3hXOleDJ7IK6lBw5q/taXN
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

Trivially migrate to the ops->blocked_domain for the existing global
static.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/intel/iommu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 0d0cb2534972a2..b79188d0c67e95 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4041,8 +4041,6 @@ static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
 	struct iommu_domain *domain;
 
 	switch (type) {
-	case IOMMU_DOMAIN_BLOCKED:
-		return &blocking_domain;
 	case IOMMU_DOMAIN_DMA:
 	case IOMMU_DOMAIN_UNMANAGED:
 		dmar_domain = alloc_domain(type);
@@ -4803,6 +4801,7 @@ static void *intel_iommu_hw_info(struct device *dev, u32 *length, u32 *type)
 }
 
 const struct iommu_ops intel_iommu_ops = {
+	.blocked_domain		= &blocking_domain,
 	.capable		= intel_iommu_capable,
 	.hw_info		= intel_iommu_hw_info,
 	.domain_alloc		= intel_iommu_domain_alloc,
-- 
2.42.0

