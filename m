Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 277868A3E50
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Apr 2024 22:09:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YtkWpABM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VH4Jg4wFRz3vfT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Apr 2024 06:09:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YtkWpABM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::601; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VH4Hv225pz3dW4
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Apr 2024 06:08:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8WuDCbX66hoJbEa46MaN65oRrqhNUby6oAamMBXdNECD+Q59zYhCCgzP7H/xdqWH8vFzx3p8o3a2epxFU9W8NCns7TSgBX5D6qiXtTd9/r1oDSlC/2m7t3IKdjS8t19JODXcrXx1wkKom43uDadTgv25CQfMUETOQz1dcAcf4c9aBrV7N4EhGhOJxbYP1w8bw4iJ+ilfLuo1MX9aILv0xYaZ0vYLqchY2O9Rij8+PQXGCccoudHsVKiUEU9GmvEeMv4j5vOFY5doXT85TfJaAgxHT808ReTWjmZC1jK3yvRJVLKNEQ+7tiRu1CxU2kplSHgwVe9P/LlsffYf3sK4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Ldy4aGEadHWsLGVGxixwC5Xmy2B/Sn2gi1wsIlA9SU=;
 b=Da6YMRIVZO465D4FtfVtCRK95c/jRORMYs0cGjimzDW9Jp1f2xdr8crlah0f2FzjtMnp3we4/zJwrnhKrsIWXVznKnhHar3SSxdAJuTIGgd9FrtGgAa2z/DrHtWPqnsui7B9pBwj1fMLhhj4JurwtgWfyrdeL9P0v/K3m7McHuqz0nVCf8bgzQCjGbw/19obdEaFdofE7f7Zcu9Lp5uoyskCfbtIldaHzhNE82h+zblNNGF8dQ/SsA+cBME4GjOfHuWoIzWIYrnyp9rIFhrf+LIJr0H5jfe5djvO5il8F1+J8ATvLYVbDNxK8N2VdO8WalKi8qOIpYDULf1ZuoH4Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Ldy4aGEadHWsLGVGxixwC5Xmy2B/Sn2gi1wsIlA9SU=;
 b=YtkWpABMS/AR9OW1eZo36RHZPgUsbLCreM+F1KcnV8GQ2QFG7cNXMlb5Pec01dEuhKHKejfelddquUVOLRuqYV5Yy0kME3I+C/BMZQD8H2BtNKpY2U3gHntE6qPE8I0QksztK6QgFIdpQK5kUAgBxEO2E5YBJD0ERHTEyEDMKR1QghBcjRlhRjydIhzCmip4818DjiC3JyaznjIZgsonFToRThxKhmyRE/FXNC5/sSujeiANmYKyYPyk5aBh4Xhh2p8vNzf+vBTfzrg3Zv86MM056pbpJIkLY+OEYDwpn/cRKgyP69gVUruGnxKDAq5mCAGGA4iNShI47zZeddNzaw==
Received: from SA0PR11CA0034.namprd11.prod.outlook.com (2603:10b6:806:d0::9)
 by CY5PR12MB6647.namprd12.prod.outlook.com (2603:10b6:930:40::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.54; Sat, 13 Apr
 2024 20:07:59 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:d0:cafe::60) by SA0PR11CA0034.outlook.office365.com
 (2603:10b6:806:d0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31 via Frontend
 Transport; Sat, 13 Apr 2024 20:07:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Sat, 13 Apr 2024 20:07:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Sat, 13 Apr
 2024 13:07:53 -0700
Received: from [10.110.48.28] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Sat, 13 Apr
 2024 13:07:52 -0700
Message-ID: <24b88e53-a1fe-4fba-a7b5-ffcbeba88a73@nvidia.com>
Date: Sat, 13 Apr 2024 13:07:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] mm/gup: consistently name GUP-fast functions
To: David Hildenbrand <david@redhat.com>, <linux-kernel@vger.kernel.org>
References: <20240402125516.223131-1-david@redhat.com>
 <20240402125516.223131-2-david@redhat.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20240402125516.223131-2-david@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|CY5PR12MB6647:EE_
X-MS-Office365-Filtering-Correlation-Id: 40dcf203-1e71-41f9-509f-08dc5bf56ae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/Yh8kiGrxSEYZAQRKZ4+LFpmEH/MXvcK7Bd6ZaKz5mXR7hSl3pBC9OcSHtRPRLv68jtBcL9wDJRMrFW3BwZegnfwQ8Da65eoEJppmnIDnCcY/xfsHHyNWwtEoA/p6HNwQZtQ13xxNzzKQuMFn/ESRAS4fp6g/6oIsgOknsu+EISPCQA21IiTdonAk9nJbN2ndwv/l7DlutS3tZ4MZjoVssLon/GRUlB5D8Wwl5/q+4CocXjkIQa1QLF4eYj9RuIe0lycJrwFKsUEEnVz5u/8VEoaaOYoqxAp4ytevAFWDvKqt4PneEbKWQWBTzyJrlqv9bquDur6v4/jbEH1ujo71HwxFXRIshg8A7jL2mWRitO1fM9v5pZVAdaRN6XwtLwaqxOBVuxCbxC5eer25cFzLWYbB7TNGTHZC+AdBUgwyD6ltsH4a0hy3d2pyWsL3nybbuNzwslnhaMNRlkSqKDeb3Sorm6mmBS3fc7Hnm0gUdI85AiqR9fFvHkmxZKcXZoq1jAtZM3Jp+7dq5sUFwB3xzIweBzh0hb0QiQVjhE+34A5rLvlExI3Oiil5qCoVDIyPtsnfpUgQY3/hyHFGagnlS5FEuvRulIh0PW6Nl31NgPJLTjQDiPTLoW0aBBDldsm3am/hrsyS1p9aXn4WO1vH/EnPrbFTvfADdXyakOf49ffZWIOy8i49rBsuSBMQduj21y0LEmmCdyNXwOuB2Brs+E7O5p5EGgNGV3Nclobg/Z/3GPHxZXIW6eyRlWTzKvj
X-Forefront-Antispam-Report: 	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2024 20:07:59.6800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40dcf203-1e71-41f9-509f-08dc5bf56ae6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6647
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
Cc: linux-s390@vger.kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, Peter Xu <peterx@redhat.com>, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Mike
 Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/2/24 5:55 AM, David Hildenbrand wrote:
> Let's consistently call the "fast-only" part of GUP "GUP-fast" and rename
> all relevant internal functions to start with "gup_fast", to make it
> clearer that this is not ordinary GUP. The current mixture of
> "lockless", "gup" and "gup_fast" is confusing.
> 
> Further, avoid the term "huge" when talking about a "leaf" -- for
> example, we nowadays check pmd_leaf() because pmd_huge() is gone. For the
> "hugepd"/"hugepte" stuff, it's part of the name ("is_hugepd"), so that
> stays.
> 
> What remains is the "external" interface:
> * get_user_pages_fast_only()
> * get_user_pages_fast()
> * pin_user_pages_fast()
> 
> The high-level internal functions for GUP-fast (+slow fallback) are now:
> * internal_get_user_pages_fast() -> gup_fast_fallback()
> * lockless_pages_from_mm() -> gup_fast()
> 
> The basic GUP-fast walker functions:
> * gup_pgd_range() -> gup_fast_pgd_range()
> * gup_p4d_range() -> gup_fast_p4d_range()
> * gup_pud_range() -> gup_fast_pud_range()
> * gup_pmd_range() -> gup_fast_pmd_range()
> * gup_pte_range() -> gup_fast_pte_range()
> * gup_huge_pgd()  -> gup_fast_pgd_leaf()
> * gup_huge_pud()  -> gup_fast_pud_leaf()
> * gup_huge_pmd()  -> gup_fast_pmd_leaf()

This is my favorite cleanup of 2024 so far. The above mix was confusing
even if one worked on this file all day long--you constantly have to
translate from function name, to "is this fast or slow?". whew.


> 
> The weird hugepd stuff:
> * gup_huge_pd() -> gup_fast_hugepd()
> * gup_hugepte() -> gup_fast_hugepte()
> 
> The weird devmap stuff:
> * __gup_device_huge_pud() -> gup_fast_devmap_pud_leaf()
> * __gup_device_huge_pmd   -> gup_fast_devmap_pmd_leaf()
> * __gup_device_huge()     -> gup_fast_devmap_leaf()
> * undo_dev_pagemap()      -> gup_fast_undo_dev_pagemap()
> 
> Helper functions:
> * unpin_user_pages_lockless() -> gup_fast_unpin_user_pages()
> * gup_fast_folio_allowed() is already properly named
> * gup_fast_permitted() is already properly named
> 
> With "gup_fast()", we now even have a function that is referred to in
> comment in mm/mmu_gather.c.
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   mm/gup.c | 205 ++++++++++++++++++++++++++++---------------------------
>   1 file changed, 103 insertions(+), 102 deletions(-)
> 

Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard
NVIDIA

