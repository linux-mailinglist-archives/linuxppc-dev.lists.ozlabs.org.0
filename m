Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6212C87024D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 14:10:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jyRGzfSi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpJwb0yfNz3w2m
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 00:10:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jyRGzfSi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::600; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpJvl53M0z3vwD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 00:10:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rm5L9umZLhztzQTEHhaVuKJoi557wCjsj1KUldNmSBd5wn0MQkGgH0+95bfZWpFCxU7p0ap6zLo4F7YzvCW5baKLl0faNjGGy3q4sRW336GMWTg78QgozYMc6siXfV/Kw52pDoYc/kI1BjzvLvAFMqfK6ayNhB5CjLSAMKpss3i19p3JI43I8uVekPxc9P75c1gMR5iOqxoLuSOkXVoZvkf5raz0M3T7dj4U5lpb6zYgQ9x4fnLcwCVG70Bv2zXJdwKB5zlsxWO/XCYWxZvy4Olup4dODBHChqMCQEu0NUQvHZVD9MpoVrzWSeaXBTbTjj6mTcIwP1sD8YP02t1fPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mma7NImu2IC7h/lQ6xNmPKiwh5vKe/YsfCmlkT6+nJQ=;
 b=S5YX1jir1iGdKUKJ7zGE+/RTgXWLhYXMHA+B9RCZmUlTluZPNomWE/132KYiICFNAck5kHf8Sy1crgHgAc/5OlSx5RocAkrPDnBKQfGP3WBTUDIB5XoXz3QLWvr+HzrZhOaFiHdt1FXp8TFayzYQWm4cuC0IBfoQgygjfwS83HvQyMvIvwt8sPfUiNPZZ8xcdGrVdUMAhJWOC+FlKpbEIzm3png5m/hgF6Mlm955WkHR9PHP2IGRBydQDEHsBCpiGDUV+VJuGoC4Kb+MTmtnqcYaQuSDEDBQYr1MLiSFcAKpFTZDe+Q6k7Gw2+rRy1lmyWdAePnmxWsMndAg77Ru7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mma7NImu2IC7h/lQ6xNmPKiwh5vKe/YsfCmlkT6+nJQ=;
 b=jyRGzfSid+Jpo+lsl45nwAvmtfq1RnVx8468tncCyPEAjF3QdqyZwRjo3JhniXhktEWWv3mooxt7hDExhIxE8U0+zmwSvtrTxyulAv57I04gQHhzjb/++kS3ijgVDZNfywlj6oiMvXqFMGLgWblPu5bfaMqJzxcCRSxRpr4KE99LMqXT4T8Q+X92TZRj3E0Or05Am/Z6v8vkp6ERaEqtTN0OZpwE2otaptWKx7oFDuJ5kY1c1ksk0Su7hqPsEjOUVuo5jqk8/fybnL30m/sXBGTEYi5ZOI/oD4gUZBhiacGK0xwE2srVl3Ecr1xpHOVJ6nalYcn/MSDAmk+rO/Uxag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by DM4PR12MB6397.namprd12.prod.outlook.com (2603:10b6:8:b4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 13:09:48 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c33c:18db:c570:33b3]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c33c:18db:c570:33b3%5]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 13:09:48 +0000
Date: Mon, 4 Mar 2024 09:09:46 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v2 6/7] mm/treewide: Replace pud_large() with pud_leaf()
Message-ID: <20240304130946.GT9179@nvidia.com>
References: <20240229084258.599774-1-peterx@redhat.com>
 <20240229084258.599774-7-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229084258.599774-7-peterx@redhat.com>
X-ClientProxiedBy: SN6PR08CA0010.namprd08.prod.outlook.com
 (2603:10b6:805:66::23) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|DM4PR12MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f0bbc82-fe31-4640-1299-08dc3c4c5ea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	OCgLfo6i9C7FwkPhRVLaYqeHeewWeM7FlLBzIa46Dop8jvYej7ZsML9OpKeLH8YpBTWiEzKoiarApReGW2vAbdOZkHQDirUSkCubF6kM/cd9ApPCR50dL+4JfCLtn1XFQtlcbcjoJP10NqcHhZ95Jo8XYFcDW8ORDnYwOan9RWZCSXgDng/FbWyT219s9PpS1sAJBegDRV54pe3OqKz4CEVR0dDpkyz8y2Dw8LHtknnhBys2nLty12yFdbDPI1dZ6nR/l6yFlSuh1sVSFgdA0ZgsKUI5FUkxBV4du1FDBBR6pPvk+EWYllyJUzWAhmXepjCUE0VS2f+llFtq8WPo3AOW3f6REw7BMURH23FwIGyix7G+vEr3IOTkz146F4/h30swNGbep28QTXl2HUORAFqCtqJc0GGLvCvDl1c65wDtSQNR2+Rk5CCT6MKqvd45Ye4B4Sot13d53TgW6KnQDUKmuNzP5HCytbPo8bzMUJYHMbZ+DyteTv8iU4eM8CQrHTgXVCYV3o3gkZlOQfzigHrrabA7F3OtT3nIFSjdFhzpUOTlfphiFUXNPWd0dnieFDyzjnv/6D6tHswIAbkxOcHgJJEsZqY/nnSUFdHCbJIqVJwZA1Bzw595giC5XfSPeSBmeDSbTHt4bX0tid0MakI3877jRoPMDuTn6S6uop0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?SkY8VDkTLSkjPKyqU+25FvSmI7mvP6gIVUz2tniuXXBkGyOYHFANYfwIaMrr?=
 =?us-ascii?Q?gzrLAuwUnKzcB/Q2xXyZw7Zw6I0oHUZSmsuWf2f5kcGPnWM0kgU7qA+57b0P?=
 =?us-ascii?Q?qQ27uedktz9wrRTwqnGayiiqLD8kgLRbigHc52hXaA9bnwOlNMLKl4h80rLB?=
 =?us-ascii?Q?2lkVeljPITn1Jly72UwcxX+g15H9g42tprUJM144ZSRwAa92hNAgGl5VPErC?=
 =?us-ascii?Q?t2yCfoOnLVw9Q3wcRIE8zCPBwMGyf+oJN9f/jB9UOtTYcSgK3Avr0tg1pMDp?=
 =?us-ascii?Q?/DLUiBQB2pq27emKDJL0ssZuj2Rin9xfWST+WUF2TvGJGlapiq7RWk8BsHF0?=
 =?us-ascii?Q?ygWCsaMKxK8bHubC81ZfsGgTjbZyS8u6arOPD/aZXIBGBmMfD0LN0uqMFHtM?=
 =?us-ascii?Q?2m9mQFi0YLhOAIP5l0RXR1Dc6FBV4HrNgGfn8E2MCf7GN+FXRT2CxdtLatVS?=
 =?us-ascii?Q?YVSOgBaCGQeyieUH8f6a9D0RX+rpaugJEesRFm9quxOVZiqtwtyIBN3H3s1c?=
 =?us-ascii?Q?VC+9j6EdJVmj0Ut8/Nbv5v3g40/i9M4LLiPkKRcRcvfKhjnCXbDdoY38sQXh?=
 =?us-ascii?Q?tWZi/xkgXA5czTAtNvB/vXtbtdjZy5K4A1qzn/0DqeBEYcc44TxWRvm9cE2O?=
 =?us-ascii?Q?WMbKhKo5l4RPOTsvqt1WdZVZ0EiFZXrNwnisMuMt9iXfwcqfYlILlzaCEKrx?=
 =?us-ascii?Q?vv3Gzvhm0i1nZ6kV+XLuYvvyt8yYsVnWPUeNY6RNbtkDeqHa+wFbbDdzLatJ?=
 =?us-ascii?Q?oSF312KwcIp5cS6pSjNQiUUwA+7hkOPQJ5ZLNPVArPMSFBWYLYNTb3a8TGcQ?=
 =?us-ascii?Q?vt6v+BOg8u2upQ5/8Ro1P+ZxjmjpAdrlLAmWD7tmSOygy9DI+qZQTBEjpHOx?=
 =?us-ascii?Q?nDdjIS8poTSWUwUbV/pfwGeRLiahLvTdnrmFdnwWi3GFl0DdiBq7Xs5TD8eh?=
 =?us-ascii?Q?GthG9zAX6u0AHCh9h8tLczeFv9oNnhspwOyc+TJgsP+zzXUnpwYH55e0zsRT?=
 =?us-ascii?Q?B0Z6VJgr7T7orGUwpXovd0/K2xo4RPqQaTnR/8iI+4B2oJ0HmmnPgyaybIbc?=
 =?us-ascii?Q?wFYE2tfIDAtg5YAzm1YHVO5rsj36rMsCX2ESWHkPkiQSIGNggkJHyVNLgT5X?=
 =?us-ascii?Q?4kJtFBYKojTX20cBuqdnyyWEfmp7spLZGpH7cZYI6XI5KYg4WQh4n0N8ssOv?=
 =?us-ascii?Q?B/NQKd6mUtSLtQaZ8+R4EUMfB/0uJVlgnAr2I1UADrJZ16naegf/8OhmHGND?=
 =?us-ascii?Q?zDNFiigXkXcJ4pvaHNq9S9YaveWtnUVGnj7ZfPEe/rJGOkgOjhkovXSNHHVk?=
 =?us-ascii?Q?RCCo4hEzgkz4id7ArSMtxAJz9uCkKo31n6j/ylj5NfapVO3fzqgEnPaDW9sa?=
 =?us-ascii?Q?UBJlRrtxXFWSrI5pCjSUKYjHMzY7KbSTqVSHwJuDxuDJe6GBQ3bFR8RIgVQc?=
 =?us-ascii?Q?swA4XptTyLLAFmyOF4zvDgNiO8/QPsA6lwQjeqhLc3sninQPMdyd920YpKSJ?=
 =?us-ascii?Q?X91UupZMc3IMLXWfVFBNneCJyKvvmyX6M///UhBfjf8K44UBTMDDZyul554g?=
 =?us-ascii?Q?xtduXKstDizWUAxgH4A=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0bbc82-fe31-4640-1299-08dc3c4c5ea4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 13:09:48.4125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQ0Go3biJDxt5/6ZlVcgbSTANFTDYuSYGK8HOv/gSiiwxB79h3usdGnWiDDTGm9j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6397
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
Cc: x86@kernel.org, Yang Shi <shy828301@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, "Kirill A . Shutemov" <kirill@shutemov.name>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 29, 2024 at 04:42:57PM +0800, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> pud_large() is always defined as pud_leaf().  Merge their usages.  Chose
> pud_leaf() because pud_leaf() is a global API, while pud_large() is not.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  arch/powerpc/mm/book3s64/pgtable.c | 2 +-
>  arch/s390/boot/vmem.c              | 2 +-
>  arch/s390/include/asm/pgtable.h    | 4 ++--
>  arch/s390/mm/gmap.c                | 2 +-
>  arch/s390/mm/hugetlbpage.c         | 4 ++--
>  arch/s390/mm/pageattr.c            | 2 +-
>  arch/s390/mm/pgtable.c             | 2 +-
>  arch/s390/mm/vmem.c                | 6 +++---
>  arch/sparc/mm/init_64.c            | 2 +-
>  arch/x86/kvm/mmu/mmu.c             | 2 +-
>  arch/x86/mm/fault.c                | 4 ++--
>  arch/x86/mm/ident_map.c            | 2 +-
>  arch/x86/mm/init_64.c              | 4 ++--
>  arch/x86/mm/kasan_init_64.c        | 2 +-
>  arch/x86/mm/mem_encrypt_identity.c | 2 +-
>  arch/x86/mm/pat/set_memory.c       | 6 +++---
>  arch/x86/mm/pgtable.c              | 2 +-
>  arch/x86/mm/pti.c                  | 2 +-
>  arch/x86/power/hibernate.c         | 2 +-
>  arch/x86/xen/mmu_pv.c              | 4 ++--
>  20 files changed, 29 insertions(+), 29 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
