Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 328C5886D0E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 14:31:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=keSUss2H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1NWm74mzz3vrB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 00:31:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=keSUss2H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2407::600; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2407::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1NW316x4z3vXb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 00:30:36 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tv1cL1mEVdR1wBllehEFSVxCkFuxyOcjn5cPtK6oFvW41n5MN4egFd3DgyzVycMCRhigbXbCZQ6qOe3omJTFrK/Jy4URp0osrhZB2t26TzZy5KfPWJ56BYYMk+5RFVdUlyVzsuSBwOmt3oEJAgbQGsK1dEQrIAGU6/jWeqWZM1GW1ck1ZQrQLiJPPkT3Rmq1kZbH+7DplXbUmteDKenXXOeYrAgfG2YT8A0FY1TkXuScy7Z71uhoZoaMvlhdZcsQAtvKEqL5Pg+TOfgQF3uFXYaw7jLx6cfgSKl60WPrWWQixvdB/zPAGr9k3gNwh0eIkYJBBLUMBMIctQyXXuG+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6VF4t36T/NJjlyDvaq1pUodkN7r3pfczzOTKwZNhKxc=;
 b=TJyo93QmWiT/9Kn1dekL6Da6HNYzrJSGD80h0xf5+p6kU5w1DxiuixEyFdIIRQD8v+FL+xXvI2n08plBxvjP3XSTWbJ5RTJnrJrNlLMKzwNSNgBRs03a53mevij1zA0LsYIMXeAU8VOJFo7IqjYSA1Nzl/H2hVyTtgY3CLgVQQfRvvaUk+sLYTqzsCN+FqPAStWgdVD4TNhiHGkiwI+fI/2stBJpj3eN8Gi4P16huaLcCQ72muwfIDj9i9Hlq49jSlgGSmTNLEjFYq0y21MbKS5jp2jWA16bwHm3j0sS8Xtya9sSF8s4J0pPp8q+nGvZH4jVkLvIYDCm1cC6KBFtMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VF4t36T/NJjlyDvaq1pUodkN7r3pfczzOTKwZNhKxc=;
 b=keSUss2HYlfI2d2zBu3X7lxTGVnzbfffPpE+FbSWnR7SxKEisNE/OOLmtKhD01klB+VIaMQPCKUGgenJfUKtx5knul6Ng63iSLH2K6KykLMMz/BzO19zndBf8Z3gaZceDtxXAKCyb5hBJxAHmiG6HomsUCX7/KmeRx9H0Gm+3jkzoCbGjhE69d4H4ZMGsP/Pe9OOwphl/bXtWE3IQNQtJOCUbUso29uZInd9D9MBqsEr4VYnUwmBUAPBLMVH1njmP3+H6SKBoz9PKfPsb81p4w4BlTncOOSdVSo2BshtDZxtE3F1X3LbbvE0XghoI2Ns3uBrAofSSI6B1o6BVD8GNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by DM4PR12MB7743.namprd12.prod.outlook.com (2603:10b6:8:101::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 13:30:13 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7386.030; Fri, 22 Mar 2024
 13:30:13 +0000
Date: Fri, 22 Mar 2024 10:30:12 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v3 12/12] mm/gup: Handle hugetlb in the generic
 follow_page_mask code
Message-ID: <20240322133012.GI159172@nvidia.com>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240321220802.679544-13-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321220802.679544-13-peterx@redhat.com>
X-ClientProxiedBy: BL1PR13CA0434.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::19) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|DM4PR12MB7743:EE_
X-MS-Office365-Filtering-Correlation-Id: 89c5d53c-ea49-447e-97fe-08dc4a74342c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	vBP8luzKzXTkiT5eg0Y6H3fTTn42qi1ORBemdbr+pREGByLPWV7Der/iTx+DWjYR9bFHGS6dCAUGQYxIE/PvIm64IZOsksrRN8lYIMyiCGJfGQk1zM2Yygw+JWjeA1p2TlAYrc67qFgHN1+0qSgbUjvpqIYoXroWpw3zyv33GqKXYHvDaQ7bSeYfHW0uUDX7pa3i0BQ3U4RCcaAh6QhVSUuo0ZpI5FFBt2uygwCnXFF6v0O+sNureFdBxzjDmXGAtymR4WcQiIqVCvJkuLP3AzK5kCtTmNhLvqDoNJFithbQu1thidn2MTrTmjvVxzwC+qtsdalA0GdM5e4bK1P1nOh92+o+vq3C9Ja+uvSySP5228Y43eIhi6T4aT3QsSSJYeKR3fAGSOdNMQAX7g8a0vcq98cqKXhdCXrxBJwutNYNXl9Ip9gZ5gW/SCtiyuX4WhRzxxXEqVSZCIspcHksUY6LkdGzGhzROsson35ic/AVg8Y7n/61KB8bYzybEOv+UBWV9RRI/YwZxNkqkEm3LeBghGRVxwTPqVI/p1I4649QKXHIneF9E06fpB5q85gNpcM6xwqBBkBmCofa8Cp+nwZPdo9VE2Eqx1okGUJpovc9aB57jpmQpgNmbQVJHJi9hAlpwzd6P9gab3CxjZK0hEljuXwSVTHjb4dfd9kxWlY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?l4ieSFyzZ2rGUDelhAOyqvVH+ny0RWLUn7y10EKMNkQEysKT5AtiwJZfRl1z?=
 =?us-ascii?Q?hgHxnTvT3YAQit1IRmxhwgoVzSiO9vHfgrZRFh5ZjshWgoVGEd9m27jJTUWA?=
 =?us-ascii?Q?Nh8/o3oBtWr9rVeqEkoNgHd/Ing2Goz6HqoqGJeqmCaVTXnYIFX/mH0AVHPe?=
 =?us-ascii?Q?71YXRup1HIK9Jp+i8U+iUfPZvW2xLu7gUj0N/tUqOIAWNyymcRI89sjw+zEH?=
 =?us-ascii?Q?DSULdgqq4SlN7Oe/Mj1bpbrGMKf5cp5SwUwm8mgauDGfjB9ydVTiPUKwtTBu?=
 =?us-ascii?Q?8pO3YCOJxOCTCDw3loBN1Pa56TSHIYodXZAvQ8TpHnlC3aXMjmeishC1lIXB?=
 =?us-ascii?Q?IGz/o+Q02DA2wtxVeoRcz3Pbf6Gk571m13Q/e15USJ9t8MIv+z5h6xJEVUis?=
 =?us-ascii?Q?RW9j9N3SS1odMOrFGX769isMr847HxvGWIKBDP5zW1IVkc8BScUYsbgam/BM?=
 =?us-ascii?Q?7JDqcGHAkSjuQ2TjPdW6dhpH2oA04Sb7srTtOb2eLmkyCHyBdfoWl/iNhftQ?=
 =?us-ascii?Q?lAL1BHT8Ew/IAydXE8TkWSQBTEU4Kjez1xcyK104hnbGZse6yxf5o7KTqsPS?=
 =?us-ascii?Q?8CfvqnKlY1By+swi1iM8su5xivzYxWS8Wj8WqPqIT4vfkh5RjakVdFM3cNM6?=
 =?us-ascii?Q?JzooYIYRPvE33sCBUppNnGMOaTtTKCPlSZ4ReBdHmmCIsPUGSJn3hUuq7kBO?=
 =?us-ascii?Q?Ba2Bs4tmeaBJ6CFNWBqQGulovnc2NlI2U91QjHp2gmBB7TyqolvUSufOWzaU?=
 =?us-ascii?Q?viQUBzdaHZXrS0CUSNIDrgMsYNzKj2pZ3XyTt6Bt6ndJp0BtKCWjPYksDJTa?=
 =?us-ascii?Q?3+wOK+I7n6YDI6nOTQ32Wh9TgE8/e09BMiVsxiWXgucewtkJUqM7PnQo14rC?=
 =?us-ascii?Q?8nyL5i34CQEP7TIpAfC7/OhdC+BotAjzr8SEarYSFI07svWGKCSlu11D5oui?=
 =?us-ascii?Q?wmweQo4Wu9WrVjEybmikRJRkvlviMzQq81FzxaoXSosOPG8lWKHxrZ+LK244?=
 =?us-ascii?Q?h03GH/Miay0SZWOK91hPWNw5AdGgIQ1TEEKiKJqkGYP+kjFwSHNhSXM9cjlY?=
 =?us-ascii?Q?l4nx93EeyOHeDSzF3Yn5EjJeXa7FwkRIoykk81oddf82pvQ+HOkom9/xL1+f?=
 =?us-ascii?Q?q5bdhfqvD5juhxNX4C/eHgkHVgEAQp9tUvvfnzaINMZhVA9sgg5++66qF/J+?=
 =?us-ascii?Q?7gbtjo+3klzty/8Qh7m6W+FsDLUxQJAmZpdCEbhP5zOdsS6trkxefHJHICFV?=
 =?us-ascii?Q?mhM6i9/ddzHrBSyyMESR3fJdPp0fWUt6MdYzDKmq6U+eAOd/mEk2RmuFqWR8?=
 =?us-ascii?Q?1706ZWlRxv83I6Sr31IRoxoma+YcWPrNgf7IdPx1Z2y635Gv8ykPBR+MlU64?=
 =?us-ascii?Q?Cykg0JkpTROE+IyE0yBy1RdGIaLDJvMeAFKsKqjr8CMuuWF4DBwz8PMVjsw+?=
 =?us-ascii?Q?xdQ8jg0ivJ2OWLrri3rclpVUDY4aYPnbbviiGv4opEy8xSelvXAjQWajdi7u?=
 =?us-ascii?Q?5/nNLwybu/Thfrx7/OCLPW+P1F2CrCPoyswZiy0rh1zFOTfX9vmyvrafUw7/?=
 =?us-ascii?Q?gtnj534LPK3rYMKbwC3JmUshVs6WZzkoxcOtjU5Z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c5d53c-ea49-447e-97fe-08dc4a74342c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 13:30:13.3152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pA1y3yaQX6Ktul/c55GGtQOFjgVFsKw9HAGxXYXKfQdSPAzxIC87/F0X5O5zHhU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7743
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

On Thu, Mar 21, 2024 at 06:08:02PM -0400, peterx@redhat.com wrote:

> A quick performance test on an aarch64 VM on M1 chip shows 15% degrade over
> a tight loop of slow gup after the path switched.  That shouldn't be a
> problem because slow-gup should not be a hot path for GUP in general: when
> page is commonly present, fast-gup will already succeed, while when the
> page is indeed missing and require a follow up page fault, the slow gup
> degrade will probably buried in the fault paths anyway.  It also explains
> why slow gup for THP used to be very slow before 57edfcfd3419 ("mm/gup:
> accelerate thp gup even for "pages != NULL"") lands, the latter not part of
> a performance analysis but a side benefit.  If the performance will be a
> concern, we can consider handle CONT_PTE in follow_page().

I think this is probably fine for the moment, at least for this
series, as CONT_PTE is still very new.

But it will need to be optimized. "slow" GUP is the only GUP that is
used by FOLL_LONGTERM and it still needs to be optimized because you
can't assume a FOLL_LONGTERM user will be hitting the really slow
fault path. There are enough important cases where it is just reading
already populted page tables, and these days, often with large folios.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
