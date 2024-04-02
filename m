Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 593AB895FA1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 00:34:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Co1h3BR1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8N2z1LXZz3vZJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 09:34:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Co1h3BR1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2412::701; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:2412::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8N2C0qDbz2xTm
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 09:33:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5ierhoCNz/qyOq5xDGuhZ6yPOjr3c6waFIYghQ2gqjRrdye4ZPsEt/tE9PpWP5QEm51Wc+Xtb6zM6P/akXWIOXtPFpm5bpxCGJpd0+B9BUUde46HGRcM8ZOXVuqUAw+67npIB4BEiAOij4VxvwI3v2ByRbJHmxRgHV3gexZfkgkCA9WWpMsbwe0gy5E9Az5grHlMGv1uq9UigzQFtwpJwaAuQclMngg0wB1hwjfaOEYQq5KixTztSdWKOuGeX67hEN0Ybs9PEG9v/qspNvZXbLQYgyIxoV6jlVUkTK2ip+eNRj5RSwRpWdtrmnhWYhptEiFQ0FHISnGvyvQvFI0NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tB0wld9CioLPvgqwUdTTK5WxiWvsshqYgT+yDfVJlH8=;
 b=cvVrSTJd5e6Ow9wPCHKMNo17nrK04zqqUpnh9M38V1M1Rdd3jWt+GfKcBUkFBa6S4uqMMNHBrPzXt0zMfdq2YbbwuqAS/UFdmivGTjBwoYVj/elzKJ7x/qrDmh+mD0laKXxGN3duG5Z+a5/2iAZkLqr5Brm8rggXkprlPEAX9Nj2rf5aQZxya+yPbRcIvVkzN3sOnTZFNmyr8pTNlJv3gnD9HUBNi6jmtxMiK7Nia7xumhL1M5Ne6VTg7I/vTtXKsqxtcS6982tUEwBakENlnKt3yGf5CdCY3H9II6OZgi3SIRNzKOQC1bcOpihdsnF6nnPXWs2sbzZDTp3wUA99Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tB0wld9CioLPvgqwUdTTK5WxiWvsshqYgT+yDfVJlH8=;
 b=Co1h3BR11gXZuJOliOgfWeSbhiUvo8stZw37AmpemjU2oS+FfSPH8/DFs/0YTAqYLQIxFXmjx37mKmvN1c/l7v7YD7cVcP1yeiOK3sjEh15PQ75PTYLPx5s+YY8dgk76SoMVWbb4lGUsXjiSww/AZ8MiAHj2gjhRf+UE6cb0wh8sSjv4hPjXUjTBeCTkZ6RTMUsRW0V7M8JHl8Wg22HWulAWmj5yOy1NsYRVtP2M8ruUgnAlRuSJ8ol23B5lsmJ+ysvndWQ1swtTHeAz9p86OWdbSh6FDlJvPjqItl0U+dLZpobZybTP8znVrrey21BaXC5xIgeEUZoVEPwfMqUzbg==
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by DM4PR12MB5793.namprd12.prod.outlook.com (2603:10b6:8:60::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 22:32:58 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 22:32:58 +0000
Date: Tue, 2 Apr 2024 19:32:56 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/3] mm/treewide: rename CONFIG_HAVE_FAST_GUP to
 CONFIG_HAVE_GUP_FAST
Message-ID: <20240402223256.GR946323@nvidia.com>
References: <20240402125516.223131-1-david@redhat.com>
 <20240402125516.223131-3-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402125516.223131-3-david@redhat.com>
X-ClientProxiedBy: SA1P222CA0044.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::9) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|DM4PR12MB5793:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5JB6BilPex/iw8fpF25dq3VpvhrukRTjVfLurXbkj0tJQLCjcBFLMAwhURfvyYn88Utq0P0/Y8LnQxXwzhAKBmlOYFjz2fgNQbPF2Zuqj8L/lxE7XjUr0ZaSIN9oU+yoeT9dwZNTLweIq/GSNd3PHaSqnuBv3WagaVJzQ9tiZwJwjdEAIbg5Ox47pEoi+brsiuyICNgEVqgjdJzGUwi7RWbBr1Jibdi188M28zsKSartIy6AGQBFe/hNc2M7lAg9ABKwgNpIdBSqihcYKoNJpSDeZjwqMmD5rH8dSZ422xCE4sSL5BMmiMvnFXB1Rm+i2foEeUmDI0zZz8I9l0brSifTbnlDLm3ZkQt1r0KuuSgwQm5MiCAndmg7B4Hb6EyDASlXoddpfCxXygy+J8jS1hzDWxVmA5CSiidIVjI6zcQstvI2h+t6liapqcTnSMh5L98nE1XPNq3j4MO3yBvqhL2wL5NdMINmi6OQoe5g9ldu+4CDqjRW+NqbuURZjxmonzN7CScM5DCQB8xOuUwHvXcktG7tWD93OVN9RZBEqS/eHHHavLSmmktl7NyenaCE9LUmlAhDCsL7Oeex5RHhX5UJycprbUEEJILsTO8w1fv+aP0jXqC9qmHnBDn6G8Mgwwc0cj5Y8Yg9ppmcUFFIsuSIDwKiof1Z1Rc1R2hBWNo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(7416005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?YIHVYcmfjfhuGhVvO9beY3696SSbYLBXCstNYAJnOmGpVx548BoVdyxzkL9Z?=
 =?us-ascii?Q?GIB2jRnfaIHcFBFSyslNaMXAChVVeZklhjcV8mPExutYhfmO9Y4DfmUjpm7j?=
 =?us-ascii?Q?O6J0dDYtr0ZPJAgFO8kgrNWJMBH8LxZMqNdVlBzh9UunChGcQeDgwkCJ3Nbn?=
 =?us-ascii?Q?Ttj7PB+cq9go68qRbWcIXL+Om3IwMV3n7OUxuRhUCPD+NC6gDQ3ZfCoQSYqi?=
 =?us-ascii?Q?+YT/tusLgryM92iZJIs2mNcX7TIPK/XmnEm3M1E0IcYrCoI401zpjN75T9Zx?=
 =?us-ascii?Q?d0Upg2uzUi8EdZS17S/tU/lo2wtZliNOCf/ztxi23/LAsLr4R8L4zkw+ZJva?=
 =?us-ascii?Q?u/ZdgPzWTLS2th28UNKE/6RmlsrdCyl2Sf7ufAGxvu8YOfJzJF9GDLFQ9pHI?=
 =?us-ascii?Q?vMaYAoySZqjCSmdr52/fXp6zapqIYI4gc4ZI/q6Y5Vz571yJf7b5ZE6tVBG9?=
 =?us-ascii?Q?nARRVtwSarHrZTC9bXicbePKphuc+n/T8MTOGxjkfLialci9ab9iwQm8GBOd?=
 =?us-ascii?Q?8zFvsWo15Rl3A0Ed5sWi20f+0qHwt7qW/806+grXC0+CzZWiVtMNYsN/eKja?=
 =?us-ascii?Q?DcfzeUF985OzqKlNjNhDx2Zlx/81dJTBzyn+6SKqkUrxGKa2GGbddFtc+Qqm?=
 =?us-ascii?Q?NDkARs48gMG+rvftEB12mRYuljl1Yh79iURU50KEHjSc5J95dw3DA2US/yhA?=
 =?us-ascii?Q?W8/r6IeDjx/gTdjlxFr012y9ejIkh3pBIN/xmW/4pJOkD31Dz4bdsPx8Kgnv?=
 =?us-ascii?Q?GUAzJkHHcyqaQuWAFY6KydB2AXSMbCRKOZCV07oFAcgMUumaZAs+CNGQ9+Km?=
 =?us-ascii?Q?Hojxt9y/g9B5C2NjXqAaYLKqhu2cQvMAMtj7DF0lgHjUlJ4aIhxyaR6U5SfL?=
 =?us-ascii?Q?vX8kww3lLqz7yVg40o/U+6az+yviFFIvSnnz6x7B5FU/eXDDl35NlV5/riXN?=
 =?us-ascii?Q?ngBW/uuNYHH8mAQeGDFOTcyxlUxZ76q662t4DaqwXX0EKE5k4vq6DhdR4WUF?=
 =?us-ascii?Q?NlyQYjfstLK9LnckCL/va6GuWsYWBH6XChHGFeHzixvpRu2TldGn8UNn9Vry?=
 =?us-ascii?Q?bdAo9adU3CwkWzIMBfMXlldlpvNbfq2fxzoL+xfp+CZFQIIO7GFtN7rf/c7c?=
 =?us-ascii?Q?NQki/Eog3U7jG/X0b2/aCBP+5n8KhpCVewJng3pv3XL7hnt7St1kwAKISh9r?=
 =?us-ascii?Q?VyuKNtJKW77USokJtCzqj3Rbs2HG5B+9qZYVKa5S2rxU3m3qzlojskiSF4mB?=
 =?us-ascii?Q?hk6LHp7gfdfGpi4MSQQ2reB16YLXLq0S4uOsm/QpLW3JJL9bB7pkI0alH6aL?=
 =?us-ascii?Q?UzDuog4tnuDhNe1JtfcLIuiLvvk2FJ+cIWt4VQuKysx4YmMEGseaoTatrGQV?=
 =?us-ascii?Q?ecJVZm2sVBmK7XGbYFCOTfasFW2aafrySEEKwUKH1oYs+HWs+PnBf3xmdYKv?=
 =?us-ascii?Q?j1WaAPb0PrATlMCzCKbSs1nDnJ8bo2zcYihPC7KAtqNk+iTQhUjPkv5vkwYq?=
 =?us-ascii?Q?pHLverouVx4bMCo8xIFLov4q5A8jotmZ9rC+sr4jtfxcrzDgoG7MCeYZNDeH?=
 =?us-ascii?Q?DqtLNRTQsdySV80kfT7DqGtOogTmFNDQVIkgsvY/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 227402b1-27a9-43c2-b148-08dc5364d8ec
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 22:32:58.2460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MPIwg9UToD/4t9j93r/ZEdRhKmo51nZ9NLMy+VDPn+jgiEPi8hdKyWVcs8WSiH1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5793
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
Cc: linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 02, 2024 at 02:55:15PM +0200, David Hildenbrand wrote:
> Nowadays, we call it "GUP-fast", the external interface includes
> functions like "get_user_pages_fast()", and we renamed all internal
> functions to reflect that as well.
> 
> Let's make the config option reflect that.
> 
> Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/arm/Kconfig       |  2 +-
>  arch/arm64/Kconfig     |  2 +-
>  arch/loongarch/Kconfig |  2 +-
>  arch/mips/Kconfig      |  2 +-
>  arch/powerpc/Kconfig   |  2 +-
>  arch/riscv/Kconfig     |  2 +-
>  arch/s390/Kconfig      |  2 +-
>  arch/sh/Kconfig        |  2 +-
>  arch/x86/Kconfig       |  2 +-
>  include/linux/rmap.h   |  8 ++++----
>  kernel/events/core.c   |  4 ++--
>  mm/Kconfig             |  2 +-
>  mm/gup.c               | 10 +++++-----
>  mm/internal.h          |  2 +-
>  14 files changed, 22 insertions(+), 22 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
