Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F82488708C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 17:11:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=A9IPQhNH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1S4g65Pzz3vy7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 03:11:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=A9IPQhNH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2009::600; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2009::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1S3N0jHwz3vm8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 03:10:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVVc/7HWh66V5kI205dK4LbK4bF/z2aKyfWjsPHQaYWQVILSOJ/qOTp48v/suqNUt0RR5QJcLcy31tqeNFkNoUWTe6ri5b9hyOF+S8ZBwWdoqvM6UxOhHN5JqNS0QzQV7ANNaSfbFaUffY1qfbh2TwvWYyXcjNO2njyCpa4vMycolXV9VDK/jfyqnaX7/lzp49H6htGawKAzk3HyZUbf8wfrtXreKHkp0R1dYR2pnIj8O+CJV+G089Pu6SWaaeLSfodAzOcOvnQ+XKLpJkSep7UAzWuY7qBRyvwxIQK8btvAnzMI6Qyq/ydc1hgr69LdHw3IL0Czmx2LAQEYLSUxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKDYemAW4YphdTf3sxRnwhzr4SK9oCb785qNvR8771k=;
 b=RQSiN0T/IojTgHXZLoU3YAQAYE05IG+VyEBrypOXoqagJbjF3aiLUupJdMvTVEdzytPbhWSNdYDDMn0VvOrAAjDhPZ8T7uXcO6TzaY0d01yzKM2mbmWrhJYY/ATA21KBxq7JtqzFJVmOia3n0f4WLP+T5SwcZSW2szRsiWN7euvSzq1kBhJelVtcWq0dJ3/WwTpwLR1Y/g57Q3ugWP84+cRRiuu7oGrYaA3MfGYYBtSxyT6fR6kWupVmw/26CPg3OSwqJ9pWS3mskTxt8SuiVGkevoIDzzKN/PBeejDwdj4IP/WZXh3qcKs9uQxorpENEev3Gw7vObKSTqhZnIGEuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKDYemAW4YphdTf3sxRnwhzr4SK9oCb785qNvR8771k=;
 b=A9IPQhNHBzEczAf8r8sfrztRcBYKvmFByHHey/cVtpmRLVgltvLRjX7LNq/DazQx+sYEfTYtz2WaCUPrtJpOQ37MDCeTvqhYEXaiM2X1LKNes9Y3ejsvcoBD3QTy+MuzByge3OmcVOIYJ/KXXmNwQgjql3+uqso5c2igdvUJTv+qRkkgUk1TJNEHtBdkmF7oc8AShldw4tUesaFncRlX5YdKWasqvT5E7jKIiPRedpnKsyH8ZSaBGew9lbxJ9KNWJrRled9XdTYW5aLWXzApfAOPf3DcOxMXuULiBpV+qiWyORGR3nJyafNROyTEB59GgPSSkN9lWAzbkn/F4UbN2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by CH3PR12MB9282.namprd12.prod.outlook.com (2603:10b6:610:1cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Fri, 22 Mar
 2024 16:10:02 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7386.030; Fri, 22 Mar 2024
 16:10:02 +0000
Date: Fri, 22 Mar 2024 13:10:00 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v3 00/12] mm/gup: Unify hugetlb, part 2
Message-ID: <20240322161000.GJ159172@nvidia.com>
References: <20240321220802.679544-1-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321220802.679544-1-peterx@redhat.com>
X-ClientProxiedBy: BLAPR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:208:329::31) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|CH3PR12MB9282:EE_
X-MS-Office365-Filtering-Correlation-Id: e5901b46-1654-49c1-3e18-08dc4a8a8784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ylls6to/f0JRWJDA5WYmvJ9ziJ4Wx1qQe+VV86wCjbxj/2AMNE2bUAB2vGU1blpCkXCnDGUnH57NdqCg4gvTRmNMVph8+ehdDbYb/SvNbf9OB26yGZpgTN8spskVxBk3slcCHAbK/YU2BVZK+95BrwS+0qpSZsGDHq9Mnw2nLoQQx93BGm15dXusx0p78LkGlt4HKu+PCoyCwDEyX9Z1aSTo9UE9F2HWZ8X3DX3RaC7jQBiMI/X5cm4ijxguORtVs+1OzsYxZzhUYM0pnRoUs3NL+W87ICe+xcTyJUCAWNqrklzWzLWUzWlEvJzihtBZ7n9204ITBMnH0UTcQyjblr2S2UhT8MRzqE+3o8vD1lhLPt9FK35or3zI8Rf9eb62T8FK4T9Ikfp0XO87gEaC/tra8moTXWyGqZ6GV+hAokWIGi1B8l1EzIS3SxiafiisyIqKjAn8eM9/yDbKlJcK4EzQBIE8fC34Fp5EydvLcg7/Z5TIsSbY2zc0DRk+vfMmoyNGYpS8VPKt1LjApxxw+xSipEROzoUUlWHa8H/sADIFRDByNQTcn+E+p6Ty6h/To6gJWw/rjLek+00SKPdJ+XCRVvYDleilQCHNbUUaQl2u+ZlMze6aMcFlt8TcBI0dr/KKb0wk6UHjTrVGY11yB7KuSmUBAQRRf8acd8ein5U=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?kIdLvTDd1Y026cu2ZkT9h9jx+5xIba7uOYhC5hbOPYA8bmdG+AjKrYi30/wa?=
 =?us-ascii?Q?RqLGwpFb52DFuheY7lnatJR9aAC6Ff2rBTh1DSR1YAa4d58occXRgwa6gXfR?=
 =?us-ascii?Q?uWbEQYh8zoMAVxE5PxEL7hvGxbFVtYn5tKYIdX3hO7Rvzpz/O7GSyytH3zLJ?=
 =?us-ascii?Q?F4Wn+eNBMQaNTHRRAXmbvLtPQSugPlIK3H8qI7auaCjmDpqIDzIJX5myxIqG?=
 =?us-ascii?Q?LoCYQSNA4uNDk305diBQYTI/LFiMLHPp6F46c/oA807ODl+eifeeG/Hx7YHd?=
 =?us-ascii?Q?8uYss44auJqWZAeyCYRkA/Qqu3AhpdsGPtMJjoZWKqbt7P39lH+MVdKgB1cN?=
 =?us-ascii?Q?PQlNzWQcnTToD1ShNL05eaY0DuXiF9VxT+0xMMeJJr9VKbE+qYwHcJyaQ7Ks?=
 =?us-ascii?Q?WU6IsyO8RDVbj0v6JOeSfegHVWZk+hwaX5ArzKh9pZY+rZZdJyL/FQ5FIzS3?=
 =?us-ascii?Q?MKvWGBwq1NJ+dXUaw2KuaCIP7teovbRO2ZtAfyW+6vhT4PWMT336csAFKRpg?=
 =?us-ascii?Q?JsSFSnLJTi+wMrgLPV8a+8FyiLeCvP8nJoVANJVZ2+uJBQ8wkWDC1vMTKeNI?=
 =?us-ascii?Q?gL5yAQrd+kBDqFzPd8PC+gTewJYWpFb1WqE8xkXAtva5i82lpn8H8Qmp586V?=
 =?us-ascii?Q?DEo5T96ZFCxvG6LxR86D/ulJixMrq6A1JtlpEbrxWgUgVAObJTGAWzwrlilb?=
 =?us-ascii?Q?04qJ/HCvSObQ/VXA5SzKF5QgPqT2IjRw6RkxERSqQOXzFIMOBhhs0fCLKJT8?=
 =?us-ascii?Q?2lMVQ6AbNb4DaXdw+MXYTwcvPmC+Gd9q+sw2n76m8kfwTx3ut9pnKnQl3eQg?=
 =?us-ascii?Q?o28ECyPcL+dZfxmrkfnUZ1KbCBqyCaoGqTSMseRfA6wXUp1P6nQ7HSCFLDEf?=
 =?us-ascii?Q?FJ2769JfrqouWU6/rYw7cJufS0Vr9Rn9mj4x8v9tMKXADIVuzCgoKX1yxbra?=
 =?us-ascii?Q?rJ1zvlXwQf18PnQXqTOu1NqL4HWghbOt44GVOdH3+c8NjknX/Tf+dXaydIhO?=
 =?us-ascii?Q?T8nJX5Hy4OdrhLAutKIV9fpj/b8mY3CqRamMpvDmenjxGZirf61v63bW6DVu?=
 =?us-ascii?Q?MW27+8EPOqNBJ63TCtqa0eRhmIM6g7hk3tAX6qTqXFTs3T9IkgPq0H1pf1Lt?=
 =?us-ascii?Q?D4AN/WjMarCVip0/WdWQH1Kug7UXZCxc+Rg93rSNLstj+gad9jyOCGym2ZAQ?=
 =?us-ascii?Q?0KR1oYrgesn9jCzMCW/RMk4VqfVPYCqr6VM+njByL5wJ3XzgJikHmf737qXV?=
 =?us-ascii?Q?YVS5Q7Kzr4REI7jBQY44hY8zVRiLRJHMXbitVoRaHLXRza/5NpvB7NoyfwE9?=
 =?us-ascii?Q?JZmmudUYvYVkoviMitlERujyk/K8N4WyW01/boDzC2clgjyKsIoSTmxS50vS?=
 =?us-ascii?Q?qm3f8TLbTTtxFV6cAwZvtxytGeBlagtvfch8fs29lOuyhymyWhlrUeQiWutP?=
 =?us-ascii?Q?gEaUQF1w2E77ryrujffMxiC/EH1DvPtZbkzTYPNcsyrOncAIWxwci1NBIILa?=
 =?us-ascii?Q?mshMJ+vOnE0WuXFie0LUnWPcq/uUkL1C9DEUnTe/qizx6wN5aWSia6xo+uPa?=
 =?us-ascii?Q?tgRdT1QomJvgAE39bto3TqRjVqiy6LZ43N97NAY0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5901b46-1654-49c1-3e18-08dc4a8a8784
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 16:10:02.0583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLMKQ6y6VxwfEqDCwno+9I0w0W8DcVH9z8Tk5+KAeHsJSB1Cgrduf2FcUw5vX1PN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9282
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-arm-kernel@lists.infradead.org, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 21, 2024 at 06:07:50PM -0400, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> v3:
> - Rebased to latest mm-unstalbe (a824831a082f, of March 21th)
> - Dropped patch to introduce pmd_thp_or_huge(), replace such uses (and also
>   pXd_huge() users) with pXd_leaf() [Jason]
> - Add a comment for CONFIG_PGTABLE_HAS_HUGE_LEAVES [Jason]
> - Use IS_ENABLED() in follow_huge_pud() [Jason]
> - Remove redundant none pud check in follow_pud_mask() [Jason]
> 
> rfc: https://lore.kernel.org/r/20231116012908.392077-1-peterx@redhat.com
> v1:  https://lore.kernel.org/r/20231219075538.414708-1-peterx@redhat.com
> v2:  https://lore.kernel.org/r/20240103091423.400294-1-peterx@redhat.com
> 
> The series removes the hugetlb slow gup path after a previous refactor work
> [1], so that slow gup now uses the exact same path to process all kinds of
> memory including hugetlb.
> 
> For the long term, we may want to remove most, if not all, call sites of
> huge_pte_offset().  It'll be ideal if that API can be completely dropped
> from arch hugetlb API.  This series is one small step towards merging
> hugetlb specific codes into generic mm paths.  From that POV, this series
> removes one reference to huge_pte_offset() out of many others.

This remark would be a little easier to understand if you refer to
hugetlb_walk() not huge_pte_offset() - the latter is only used to
implement hugetlb_walk() and isn't removed by this series, while a
single hugetlb_walk() was removed.

Regardless, I think the point is spot on, the direction should be to
make the page table reading generic with minimal/no interaction with
hugetlbfs in the generic code.

After this series I would suggest doing the pagewalk.c stuff as it is
very parallel to GUP slow (indeed it would be amazing to figure out a
way to make GUP slow and pagewalk.c use the same code without a
performance cost)

Some of the other core mm callers don't look too bad either, getting
to the point where hugetlb_walk() is internal to hugetlb.c would be a
nice step that looks reasonable size.

> One goal of such a route is that we can reconsider merging hugetlb features
> like High Granularity Mapping (HGM).  It was not accepted in the past
> because it may add lots of hugetlb specific codes and make the mm code even
> harder to maintain.  With a merged codeset, features like HGM can hopefully
> share some code with THP, legacy (PMD+) or modern (continuous PTEs).

Yeah, if all the special hugetlb stuff is using generic arch code and
generic page walkers (maybe with that special vma locking hook) it is
much easier to swallow than adding yet another special class of code
to all the page walkers.

> To make it work, the generic slow gup code will need to at least understand
> hugepd, which is already done like so in fast-gup.  Due to the specialty of
> hugepd to be software-only solution (no hardware recognizes the hugepd
> format, so it's purely artificial structures), there's chance we can merge
> some or all hugepd formats with cont_pte in the future.  That question is
> yet unsettled from Power side to have an acknowledgement.  

At a minimum, I think we have a concurrence that the reading of the
hugepd entries should be fine through the standard contig pte APIs and
so all the page walkers doing read side operations could stop having
special hugepd code. It is just an implementation of contig pte with
the new property that the size of a PTE can be larger than a PMD
entry.

If, or how much, the hugepd write side remains special is the open
question, I think.

> this series, I kept the hugepd handling because we may still need to do so
> before getting a clearer picture of the future of hugepd.  The other reason
> is simply that we did it already for fast-gup and most codes are still
> around to be reused.  It'll make more sense to keep slow/fast gup behave
> the same before a decision is made to remove hugepd.

Yeah, I think that is right for this series. Lets get this done and
then try to remove hugepd read side.

Thanks,
Jason
