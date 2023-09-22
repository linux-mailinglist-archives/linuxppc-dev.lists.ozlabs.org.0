Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 504667AB6E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 19:12:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nAUa3Utn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rsf2w0t3mz3dC9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Sep 2023 03:12:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=nAUa3Utn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e83::61b; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rsdy70ppdz3cKW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Sep 2023 03:08:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWLyDMUIeFegoDjesUxNrqfNdj2jGkHWACIBfZNA6mn639ykjYRmN7Z2VvRqK32Fq2a7EGu4YNEq7NX68ZqxRKAG9VkgXoO1ndGkvoi5Q4UV9SEoSsH7kSyQtQywK4It8tcuYpBMMramixQxc/UCpUqGzQVn0qAfgPRJOwuPcQoxwDWtfQmMxXmS+Eh7v2rgj0Vnq7hbomsCe0p+UEBsnCxVw0MS6cd4s8AnjW15uxUqhR7ACRmAjqAuag/M+AqLMNrmLSKp71btpve1uSa0Ag2wkep/Q5lzJuVcl0Zilj+aBofLUEqgkW02BIWmO2I8+mAR7g7oCj4Mksdy6j6NJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6f/F+3oX3DVdv7ukFG5Ga5zY2EAmoCSYx8EULKevBPs=;
 b=FWQJeMuZJzqN1DQI87tXeKXUEaWynubTXDMVospHIIXLrEvXehaLsv8ucb74zki/lM15rhlPkOjbSj3TTfy7rVxpDm3ZDufjaWNpCQHdrxGRYQnTgoDUmW+QFZmg5JlK/kB8y+7+1HM1Befg+B+UJCGUGp+1bnk0jtD4Pw/qRNo5Ro8RhHhFB8yRtO9R1RvsIee47PY33jFRn+LLXn5tZUEUTwcy21SSWse8eLdfVh+LFEC/vXqg8hGMZiyV/0fekgHmPkInD5enOcgisDEBWQGsKzjrLSsudGCFVxJJckFmzBKX5u8/VwnWRFuUFzOzsrEnNraxofEjBYV8pP6/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6f/F+3oX3DVdv7ukFG5Ga5zY2EAmoCSYx8EULKevBPs=;
 b=nAUa3UtnId/+206QHbkfIoXoanJbF9vXiJCjw+4kjiouW7obdLqCV7Vz4vf1PqXd43CVCYQLwBZAneXaY9rPw25OpTixFJv9lyljh/oRzRKp49ShUX9db9hwj4K8xCPs2IlfEk/EcMFo+v3nkVJe82+P7CFvGPtKkhJDp38adWQ7yjMW14iNwugiFHGvnahGR1RSJr+y9cuhRU9hWsDBt4fOpVpLKXRwFkKl4VyWPmwb7K9jQTgBVXq+vvKbBFnR6aSb0evPgiB5Vb4mX/MZ+l8eMNuFUoiBlMDO9PEfb3d7OT0aFYVKKkZ9jKl0h5Gin6lzGjI5um58tPB6mPXOsg==
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
Subject: [PATCH 4/8] iommufd: Convert to alloc_domain_paging()
Date: Fri, 22 Sep 2023 14:07:55 -0300
Message-ID: <4-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
In-Reply-To: <0-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQXP288CA0034.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::45) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 309ec585-3499-4ffc-4000-08dbbb8e7a6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	QDr5g9LMUbokCpafY/IdOfkR1rDjdalo/JgjIgwGf+uBzg/BLPtHJn+fofdlIclLBxMqUAvHqRcitAXgjT4OJFNzuHf7bfRv7LH3CqM/g5L8oC0mKDIP38TUQspjB/RVdoiFsDYmh7HshKdgcVlFJqnFmBhSshImgy/3K1WdGPVuAUtiiQA7C178bKk5VR+wPzeoVWKIel8FgRbF+GEOX0dknEhwlhLsoe9icO9mOED6UmtQtW3X1lzCmiP1fIPcv2bFw1GKGSiFOCwf0o5S1DyIRR5iaTRjMg4mAadgyltqK4XT4YGblpT4TlV4RUSoycE9DZZ3QEdtgD0MH/uuaHtaUPvWRn+iwlNxSujgKjibO9shydG3wmqL9hoc6LzFvrYqgukCZiCf3YxxGneBYGCsNhI4mnntfxYa7znWp/Ac3gMoJwnGFIw8zhIC310Mhpwe//j+ejRPvF5w22VhFwV3ZWq8QAduF18Wk6+YcCX6G6Zj1+0TwiOur15EuLBwdpQm+3oQdRxrcLJ9BucXRymimRLx2rjL2T0LVOkYQcDnrWMR+exb5Ok9Nfy7NFn9QJOh8MwxRYmYwpI1g4Kl7HD7Ia6AaV4OfECCvXDfUsfQrD5O33HYV+fs7Pvf4FFp
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(186009)(1800799009)(451199024)(921005)(26005)(8936002)(2616005)(8676002)(7416002)(83380400001)(2906002)(36756003)(86362001)(6486002)(6506007)(478600001)(6666004)(5660300002)(38100700002)(6512007)(66946007)(110136005)(41300700001)(66556008)(316002)(66476007)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?3LV3Dc3Jx7kdR/dUZHVgYVV2AtBPm3I+cuxg1b6sPbj+gGSVw0X2kHZ09qbo?=
 =?us-ascii?Q?QH/ZTgcV2bOUqFMCaQcG1X1E86fhEry0304hVkDQk9jH87E1dGWAeCOb3+pk?=
 =?us-ascii?Q?8qRNJENA+VE3P1dKtVP2KL5popkGPCMx0sUSwl9VlBHIy8jayqP5bbte4bTx?=
 =?us-ascii?Q?QKoxX92yCQMWYDO0jV0ayc4DcF29gnPtYPAsY0FkrOy08huchotXh7jUbmhb?=
 =?us-ascii?Q?gnYHzJz2w+zZpLjrn85PihogE1kURPAS3cI6fNerudzMrjBRsDANDYGxfOUu?=
 =?us-ascii?Q?3yqK5T319H1b3syfmMlEQ1hIbOc4rUHXX76wypSh6RrcC1W4tt34KRMYIaK7?=
 =?us-ascii?Q?GGVnFknpdG0CE8OIATEZQSg0K4xmLQOUsWiZHlRj9ouqEkRhvec40vKeK7R3?=
 =?us-ascii?Q?RG7ZklV4RCCFzk8JdhKhIXEa+pyT+PbWcaQZ9jbab/9lUwdbxc32ddYIrpGP?=
 =?us-ascii?Q?xJecd8h63UFfN5XISr6SLJU2QIp7RRPUxt1hpBP2TJ6e8N66cucQrA49P2h+?=
 =?us-ascii?Q?zZOXzFI0pOST4Br/cD/vDJan/styD4xO8vojK1h+ZHQKkuXCjKbGCpRVfkLh?=
 =?us-ascii?Q?MzKaIvZKVSHkhWNc41XJzq+0xoZENlQ8WWeHiyNwtETD+1zron3G7+NbeQQl?=
 =?us-ascii?Q?EFjr/If51uLByRoVQOm7wH4az7sKcUIr+uytPgzlCG4KHgop2EcWu+umVhRl?=
 =?us-ascii?Q?IWTz6Aqv2r/RqywYZpQzxy9WAgexjmea2lGPJQDLaIMRW6Df+7S53aPxfvfT?=
 =?us-ascii?Q?7lWBXjJKIR6AsyyeC24d1i26TLXjp8giNOBg6qH2mll8QE7ihDYDTtCS0Rlf?=
 =?us-ascii?Q?XZlqA3XwGB0g8hSPS5WQHU4dOHVJ5oajU/mE+Pv87lGgu4LFYSK1TkTpWc2T?=
 =?us-ascii?Q?Zkt9vZgK7FM92Sl92DEfMVIyOmTbffzHJwzpGq2roe+g/o/Y59inE8dQsRT8?=
 =?us-ascii?Q?uaSg9LZSNeOu4zvD3pv7TfH8xSdsegQmVoJzUAa9+JJogeY65oBs9nCUymw1?=
 =?us-ascii?Q?Vgaelr0Abz+4KrlluQvZWQf+wkkRZ8iK68sZhOznFj7AAru9sdn2HBMn6Rpw?=
 =?us-ascii?Q?P1mk8v2BtzokMbaWtXab7SbyZQcizzXnWIDkUEaUA4yc4JA95YM7VPI+QLoR?=
 =?us-ascii?Q?CSdwka0mR+XjKIPgK+k2O2QxVyIkm5UG48dDkGXNN8Z3JWxbui7I3j628jVy?=
 =?us-ascii?Q?VtRS80umx/QndA/3UAtRCmJmE4yGw5gwRa5DFRvZiCRYZu988YPQnJEDlrZD?=
 =?us-ascii?Q?aJv5fsd+gkPulJq7IyS3iuqYQneZufGEtXyd0IkbgBKUuh0v3n/my64PQLVI?=
 =?us-ascii?Q?nsum/3kO2tUiRn41cPHwCzcqZxBKDtjDo2yc97XvlAo4INLPFdBWyN5roxLx?=
 =?us-ascii?Q?yWZFWbyQQMoYE6BQQL5pjBtev3fa5ysgZQQDLUXq1gPg/WvxexCPzN77uURA?=
 =?us-ascii?Q?Oyug8AjYnOgwU9DV/+B4QOKdj3HVTcc8wcZfv9kOxgjWgAMJoHJM3NJmDKXy?=
 =?us-ascii?Q?DHnHBXwR54OAGg0LRv7bflnhdzzL/4cTndqag3urYZL5iDEkov/Nm9uTdXmq?=
 =?us-ascii?Q?m5lL950k5BjS8e/nDrz1+pSUWpO6W/6z6wWBO9Ze?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 309ec585-3499-4ffc-4000-08dbbb8e7a6b
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:08:01.8067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wQlBrkEwVa3nRIR0D17LYlCQ66pkwEOENAPFGzD0S6eh1m+mdi5BGSrp/xE6+JZ
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

Move the global static blocked domain to the ops and convert the unmanaged
domain to domain_alloc_paging.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommufd/selftest.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index fb981ba97c4e87..ee607984709102 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -141,16 +141,10 @@ static void *mock_domain_hw_info(struct device *dev, u32 *length, u32 *type)
 	return info;
 }
 
-static struct iommu_domain *mock_domain_alloc(unsigned int iommu_domain_type)
+static struct iommu_domain *mock_domain_alloc_paging(struct device *dev)
 {
 	struct mock_iommu_domain *mock;
 
-	if (iommu_domain_type == IOMMU_DOMAIN_BLOCKED)
-		return &mock_blocking_domain;
-
-	if (iommu_domain_type != IOMMU_DOMAIN_UNMANAGED)
-		return NULL;
-
 	mock = kzalloc(sizeof(*mock), GFP_KERNEL);
 	if (!mock)
 		return NULL;
@@ -295,10 +289,11 @@ static const struct iommu_ops mock_ops = {
 	 * because it is zero.
 	 */
 	.default_domain = &mock_blocking_domain,
+	.blocked_domain = &mock_blocking_domain,
 	.owner = THIS_MODULE,
 	.pgsize_bitmap = MOCK_IO_PAGE_SIZE,
 	.hw_info = mock_domain_hw_info,
-	.domain_alloc = mock_domain_alloc,
+	.domain_alloc_paging = mock_domain_alloc_paging,
 	.capable = mock_domain_capable,
 	.device_group = generic_device_group,
 	.probe_device = mock_probe_device,
-- 
2.42.0

