Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED73B886C11
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 13:29:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MyQ4R56Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1M8j59xfz3vm8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Mar 2024 23:29:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=MyQ4R56Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2417::601; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1M802Nrkz3vZM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 23:29:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/L5rXMlH8oiI2J6oqzgrh72r27VDeYnWVJ/EY1/V9YcdN9SpmMz450ZPeyrEAb0ut9f/VXiemYwMVj0SN2a8hFTEMYanSjLMoEP3Z3PQAD0VNLr0VZU1V+dxmGBNrkYAVecGro23nQauH7UpkTPylJ68D4A/Za8/3v3l3FTCnahyQJa20XYw7AlphylyTTUMJNdD+gp3oANDYd53X34SjB7WEWG7yvqixoa7Pb4bpplHro8lMNNYbRfIwgDVpqL5PBIvnVLB6r3wEl6OXmF/a628zUVHB/oQ+JcWXwGeHu/KA5IlY8Yu5DcsRZQNTNM9cNPhJ8EeP+wkvMSGSjrlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDkdacFtxB4qpcWdtAhoFkR9iyBLJ80XO7PfYd0ZaZo=;
 b=OiafJN0oRHFiQp6rBeCaXROCqnmJoqkNuW5dnP1P/1x/2DDC0Yybg3W/vWdW5/MZ0hj0q/cKWwbVEcZyb/g8PIXelLA/fcpg24LX/4tccbea7UnUwECUmwPU0KL1zOUPNCNe3CZabJNy8YTLzdqVdJfO2e4KsVOlPsBaRIKhQYV3E5dhzORMHxeFYXAoMpRMUguysdjmNrHpAGr9ZXC5hMhc5hCWWJxLkUmrZC07qLT/B/pTmcVV7eKDc4DnPVSbwhhO8O07YCYOVGNYgjaHxtjCI5p4TOnDcoPCRU9L/n6U22tTON1MykY+sSdOLSDsqi30RGSZgv4Pk2CHxQV0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDkdacFtxB4qpcWdtAhoFkR9iyBLJ80XO7PfYd0ZaZo=;
 b=MyQ4R56ZGrKp8VXSxsI9oyoz1f1pahvPhfNqJfFu6wV3wf5nbgynWTw58ce1ZMhv4Fjhtzfz4d5/9ijxUJ9+EyQgm+zFcnITBRoYsb+jWezbCE7IK6DCAzQ7s+lc5ennNdJPuc+LxQxeLB25seoSwoOdx/1tnatvTRHky+NMHvQ7WxfRGFEvDgMQ+KBzbdBONVhb008ghv8efwrTrqiHHEIy1RxnOWsx3KXraL1uVjDu26uofeLpIdcsztQIdGf8kxTuk/EY3SWxQ8Q3W61ij/8w41uQAaTvmGG575LBv4CBiphHS36mJ8O1kqf7U6lLlPUm8rDYOY+HA7MK6L6Tlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by SA0PR12MB4400.namprd12.prod.outlook.com (2603:10b6:806:95::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 12:28:43 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::6aec:dbca:a593:a222%5]) with mapi id 15.20.7386.030; Fri, 22 Mar 2024
 12:28:43 +0000
Date: Fri, 22 Mar 2024 09:28:42 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v3 05/12] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
Message-ID: <20240322122842.GH159172@nvidia.com>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240321220802.679544-6-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321220802.679544-6-peterx@redhat.com>
X-ClientProxiedBy: MN2PR08CA0022.namprd08.prod.outlook.com
 (2603:10b6:208:239::27) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|SA0PR12MB4400:EE_
X-MS-Office365-Filtering-Correlation-Id: ab966d8d-c364-4bf1-e90a-08dc4a6b9d10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	CPnMZoVExzZHDb9OcxiBgGLYitj5FIIiqx32x4mh44DbnWWdt/methTG85EHxb44fo5BD0JaKFBeNACN1qaSgAIXeNNkTyfKlYyzLvf2JB/WSSWZkMdHUHGy1WbANI+tlgt+r1PLPVALYEKGkAD2TdhJ4Bc+lFw75s0GO/+NbAzbI3fDUbpKksfDCaiwdJzL2jA8H/tC1HT+56NMMLb7PjaqbETQsh8yv1XZqvkWw/F/xRe2YWh6W9dZBi8MLfzCGDOEnwfQZN627bveMQflRna9LXuHBZrr9UM8HPFzMbm2ZUrl25AvHSTFWFubzFrLlon1MeRm7gGmRXvMT8CWVfz6ejwtuCuVdxnc/6iitjnXuiaZi5T18J8XfcbkAeytJRnXoyPsaenBtFFspVvhKxAW+Rc5tThWe8z63TAFkRTeXTg1uO68Zxh3ejXMvFEtT5mySiC1NR1sq3sjhMjr1g4qeMRQuu+hY7Dim8DH3r7x1kmkRTQnN1xpbNyPoPmxTxfL7HP0xQEdpsfrIW+dx8BjH6edJOEPCVEO6pWOQUU4gvydVz6FxwrG9iqloL8xq5Q8xXOtGZDDvTYJvPKL+zLTPx1rUoXLpVPsdCPfOI6DJRp8QBuItK5eCZgChc4CglHOdqd7IzhI0s63EmKFTGTgishF9KZWjk3mU/fO+AA=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?m26tBCNfyVStOXLVwAyNQSMBiqtU+WhZ98GDmtc0BbHhxLJbzdvQmQCpyOTd?=
 =?us-ascii?Q?JNe6WLDRpc1pL/Pwkh5R0KysulfEhdisK0BVtmm7d6hcN60HE+Q4wVLlQXec?=
 =?us-ascii?Q?R8ihPky77zKrrrCKBDxV6AjeyVvNOYW8i0rpG+95L69ius4oHf7pu3JbM8Lk?=
 =?us-ascii?Q?x9v9YWGwicJmWtPJvVBzz+PLM2oYdjyanl2A5wlyJXwy6KSxzGKUhSS3Dkp+?=
 =?us-ascii?Q?LxvuQdF0ER6RO2PB/BZEm5c74fmB52kHPHo/AYZTytD5vAJS5+wk2jBq6UK6?=
 =?us-ascii?Q?Qzwpb3w8Erclnc9o9oY+X50y6IUrUmfqc5ZLyAboC6G9I5xglLsKu+XnVSVz?=
 =?us-ascii?Q?6KCnGQ1KNrvfoKseLdYuKvVuUiDPDmLOQU6xtik+GE7G0owTNGa0a/wKI6Hx?=
 =?us-ascii?Q?xS0jaAyYNcKVVuN14zL4XZG7V88e75VrMRDa1mrLfNT6wsKyGg1aIf4jym6E?=
 =?us-ascii?Q?17/u5+ZbhyzQ4md2vxenI46oT9YOSuPU8NpHXoBOztmKSxBUitnIKj9PGijg?=
 =?us-ascii?Q?zPW/dTpnOE3PuAGRlqfW41i9uatPt/1dUzqd9fEZPzSwQBbFuDzIFul6T3aY?=
 =?us-ascii?Q?5umGtQxAKGaprc3coxcmGAhtlW3j2euaOeoweEMuD7F5nxdnidaPjTV95DF9?=
 =?us-ascii?Q?lIdAislSFbNuDTkDaxdRzmIlufXqbVKYc9N6At5hWRGr1xgNAb7uHlZpX3g/?=
 =?us-ascii?Q?nEZ3CuM6V5qCYULpAKEtwma+mjls70pCyupe6ZjtNimVmom0RqYoL1MgnLOJ?=
 =?us-ascii?Q?AN1gX1roHrV3iURNx2/aATLwDVeDr2RjdqX0J0Aoo9ESpLA2AwlchyvOLx44?=
 =?us-ascii?Q?QbzEEC25zNpg0eQhJaJR7yhXMExDte38tutRljeW/wl6xcEXodMugndSTVxr?=
 =?us-ascii?Q?KhWQW4RXFtsWzGYm48T6D56s09qQOpmpR51b5QTUhpjtKzqq636M7wLg5Wcj?=
 =?us-ascii?Q?d37VFtfF4bS+wT8CctezJeHTjiTwY5ZVTfv7k+d7wBNsFVF212UBlcFp3eFF?=
 =?us-ascii?Q?2e3YigLD+ulmr5VDkuP7qKZm4oRWxvkpoNTLe/PirWM6uAkwJAoV+sTsTSqH?=
 =?us-ascii?Q?d1gIbNp6yvy7HN8+7Jp4WkprLDd7/8HcoOvzhc+Ngs1hiGfvR0gk7YZDEwYY?=
 =?us-ascii?Q?qcKpebaJ8PhvpzQSHRvAxZ6Ns92N5RsxoW9khetiIsbJIHHQQNZ/DQmbvsLQ?=
 =?us-ascii?Q?YP2xaeT921/n38Ry9aSYPj/S8wg4XKhH0hQAOkKg3BlYhTSBB03VDjf2miCt?=
 =?us-ascii?Q?hkRAG6yPTLfWbuwdBo3TjxOiBsucpXmGBT4GSd1nbpAbPnB020Kk1iloEKSf?=
 =?us-ascii?Q?8jGguAY6sd3h6ITwd8zUcg4PLvbEr8J/wCkzluOzAcuLLE6LI0vhtKsSHCU9?=
 =?us-ascii?Q?uImdGfYLftkbRThrLjaPh9D7KtApMsABlihQshBPDuO86hafW04qNVgD67q7?=
 =?us-ascii?Q?KrwxJn0thmP58jdxA7ovZBP4BdImNVc/oUOW1MiWuJZnK2N0xBUYVeEMZ+Bg?=
 =?us-ascii?Q?uD8DbY6PdZGf254mSknNBlqfc6LrYZNOGGUmRx7omZ1XswCVmvwqXMrPlZ1M?=
 =?us-ascii?Q?PzxOTasoBORY14Ze5xuAw8+RA43k6s1teabQ47EJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab966d8d-c364-4bf1-e90a-08dc4a6b9d10
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 12:28:43.8149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKi1xHvflu29M8CoyCbXQXk/zZYiQ+Ipa+Ydojw+kkLvhrMansU7jp1FjmJ8K8Kj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4400
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

On Thu, Mar 21, 2024 at 06:07:55PM -0400, peterx@redhat.com wrote:
> From: Peter Xu <peterx@redhat.com>
> 
> Hugepd format for GUP is only used in PowerPC with hugetlbfs.  There are
> some kernel usage of hugepd (can refer to hugepd_populate_kernel() for
> PPC_8XX), however those pages are not candidates for GUP.
> 
> Commit a6e79df92e4a ("mm/gup: disallow FOLL_LONGTERM GUP-fast writing to
> file-backed mappings") added a check to fail gup-fast if there's potential
> risk of violating GUP over writeback file systems.  That should never apply
> to hugepd.  Considering that hugepd is an old format (and even
> software-only), there's no plan to extend hugepd into other file typed
> memories that is prone to the same issue.
> 
> Drop that check, not only because it'll never be true for hugepd per any
> known plan, but also it paves way for reusing the function outside
> fast-gup.
> 
> To make sure we'll still remember this issue just in case hugepd will be
> extended to support non-hugetlbfs memories, add a rich comment above
> gup_huge_pd(), explaining the issue with proper references.
> 
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: Lorenzo Stoakes <lstoakes@gmail.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  mm/gup.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
