Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 861698A3E62
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Apr 2024 22:13:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ccn8w4ht;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VH4Pg2Gskz3vqY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Apr 2024 06:13:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ccn8w4ht;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2409::601; helo=nam04-dm6-obe.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2409::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VH4Nx5v1mz3vkD
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Apr 2024 06:12:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUEVyDVbrG8K+tLel9BNv4Z5t63FwSTOmz+g+XXdF8mjM/zzhgrwCmTsqhQdDqif/zfjsZT6o58CD3M0jyJ5fM25mIXbWV06EhBpaLpcKhxMpdGu2m19xAK5KqQmxY1hRo1f6V+mi6q+17JdrrSf9y7ayMN4l0OWVM4A31QRtSWv4Q/15PYcQrURtMGw2OnxfBcZKqyD1HvdcjPhxUtofn6K7Wi4HrjXO5nsGpUn4RNnhyEFjM+0fe+eGnotL3X9KHrgFVuxouMfv8ncM6JyDV+mPoBdF/mAqxQR6U/3vBdn5Vsg8LYsk1CwBW4jF6bbXlSyp/zpXJV9MZBtLF52KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1dU1IB96tlkruBZtXgTUb+RzON86jsl2WlPUA31/EM=;
 b=Bn0zXH4tziyPmaKbZkrgs9omZ8WiZVlS1tKnS88lGIQ5OhIYNtLuXGEJ+DSY7MsAOprAj4XY1VY0gla24gPXQ0IlgwJHBJFCUfi4Wrfbiw+ADsCICmuJPlMaIbzpZsPGdHiPz0wWfF90syl0NuD4YC2id8Bg1ZvpXwH2kX8Duao8nSHorLGOk+NikIvavOxG9P5XTYDtfu0mfL1+gG754/Hs0nLsdb5L72HcesEDsny82syyTbaxhWiyIs4F3LvRx+z38zFadI6nUehkvOOSt2nkNZ0tQr1RYs+oYKeJ2OKcm3Das3hKGZqYKRJ9/l7XjxSktmIZx1X3xqpyi0G78w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1dU1IB96tlkruBZtXgTUb+RzON86jsl2WlPUA31/EM=;
 b=ccn8w4hthDc8Um+YTEHRtzpYLIj2iYVXP551udB3zmidxNG36Q42KWV0ppUerXx+rDn2G5rGN09ubudDFuDajew1LJTFsuW7+/vHh6fqxLyPP0QyRludIEQ1znk7sLxSYCEIai2q6U02AyP1qthy6vBGE2i7npR3Eqj390J/lD7/03mVJEb9w6E1+cdxBOofpW34x4G3Fdxzz9RneVnwF+YNNzHDh0swIhpevHLIFaXn/K5yv7+I9mjSKtuuYD8pER+miLlCOi6KVDtRx1H9G3PybhAd1IaoQiGmAXxA1vfrZTi8U1NvmVfTqgS7oiKJPo8hyRT8hfwOFftD1ltlRA==
Received: from CH2PR02CA0030.namprd02.prod.outlook.com (2603:10b6:610:4e::40)
 by SJ2PR12MB7918.namprd12.prod.outlook.com (2603:10b6:a03:4cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.54; Sat, 13 Apr
 2024 20:12:28 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::6a) by CH2PR02CA0030.outlook.office365.com
 (2603:10b6:610:4e::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31 via Frontend
 Transport; Sat, 13 Apr 2024 20:12:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Sat, 13 Apr 2024 20:12:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Sat, 13 Apr
 2024 13:12:14 -0700
Received: from [10.110.48.28] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Sat, 13 Apr
 2024 13:12:13 -0700
Message-ID: <d495cdde-71e9-4476-acbb-5afe05229ca1@nvidia.com>
Date: Sat, 13 Apr 2024 13:12:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] mm: use "GUP-fast" instead "fast GUP" in remaining
 comments
To: David Hildenbrand <david@redhat.com>, <linux-kernel@vger.kernel.org>
References: <20240402125516.223131-1-david@redhat.com>
 <20240402125516.223131-4-david@redhat.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20240402125516.223131-4-david@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|SJ2PR12MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: a0aaa0a6-70c6-472c-e044-08dc5bf60abf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	MjNVtL4LM6YK6isq4wiC8G4q8ELWNqm50rFIV6H+AkQtPk+GNTw1bypC5EjFciw0xtsNof2pxnozwmce5kJhp/UKNGsBchZdVd57/QS3woqC9fpotDv8P+94mug9Qf8sZK8laLf1JDgSbzCi5zTiKMN/k4+uqV+wEkI9OEsegekIJXERp4onv3JmvZGJwEh1NVivpGH6lTzllKAnK/xnEacIOgtAODTrv0AdzAzyF9ds0wG/RndBT+dJI1xQzJ0E9+NhOyM/jJAzNKmRzKchsEE3dTMroOA7el2vmvBvx2JB6qy21uRQeNNivbmCVZH7jkr6HvyI1JjiEYb9XfLnc023Q0V1r6qQkxB7J2q7vAi9V57pNTfjqwVnguB5TlqwZ+hE4p7q7aqolWpHtjZEOLDyGmPAuavVXib7XqXKjG3Xh6DFUOxLSIvVNJ0Zev4v17HsRH0/UlyMIh/X1djxTtymLetHYnTv50FYvUWayq4Y0S3mwe9J6WE17YBbZCklEmiTKgcvuZ1Gc33DjkjdSrdMT30eG0/T6p4YtcWU3n/WZUNnsRiwuFxHicp8MsLNN9aXbMOa2CUM0/1G+nloeyJ44xMZB0/FBVOaCyAxZeMn8o2vOmMT4DUOcPykhKwQyJ81uQq3WBLkfVr+6HWpsuJhKqSLfPCpBLTNC24e0gnSvqPkm387Me51zAyx+uC0oeFRFtx4kqrgAiWY0zDLntM4WVVzD2Yw/grQJCLhM+s1mY8b6mRGtqVG6+U8buR9
X-Forefront-Antispam-Report: 	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2024 20:12:27.8478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0aaa0a6-70c6-472c-e044-08dc5bf60abf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7918
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
> Let's fixup the remaining comments to consistently call that thing
> "GUP-fast". With this change, we consistently call it "GUP-fast".
> 
> Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   mm/filemap.c    | 2 +-
>   mm/khugepaged.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Yes, everything is changed over now, confirmed.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard
NVIDIA

