Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFCE82E01D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jan 2024 19:39:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ObHrXJ1z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDLWl3RzRz3dW3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 05:38:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ObHrXJ1z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2416::601; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2416::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDLVw4c5mz3cWV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 05:38:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNPypzcHqtwmlkR35+8+wG0HQBj4NHh/ggbbP5Ug4dxjcd+vQcUrW8vFhFymcGY7t7IIbDAy0ueN2qeVc4c8m3KMzQ9DFw9+IRb3g9AVhEcqKwgJEhhMq0kPoeaO/spbKR+xyN5qfBm2uLNbYcM2xYRksvk7eJQONIlzlT3Qm0hPOzFMyilPewVamsVlz3qqRBmR8S1+Xobkle2YhXbEEeX9pY3u3ZNypcdbSe/3ixFlcE0xhos7/0Nzleyv7aTvBOiZV+EfucY/iQagUqvjSECYAbqwKZXSjw2inV8HWxBrblob+N8YMc3WJIW3AopnyN4tI00VbcR/2CG6M/8Cew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYsO8ORNHs+BcqJyqksM2bOPMvnXEzfhiC4p8DKZRI4=;
 b=hW5orNKAXX+GGWH59gD80stcd3enkxxX6u1BYpv7LWa8eDsHca6oqGVmaf/lLDJopux6vVidjmY121HMXpbjT5KX9MQtpr/SMMLylPuhqESNqWZWKddM8fsMQBl6qcaZfGNvMhHqq3ySYFDlum0sTS+r8uZ8AbeHOArBpIO9JGdnLgRQ1HMOdu9glJrwlDN8AlRyBiTRLhThkBEJcwPo2MxC7qgWYVH5lsk3+bDU3XT2R3VKKnu8+gf0evdUyCLoqgauj/4+8xpJJpDAafOgU9xrSV/njvvQ0rlxXQtOULAGPKYZDZ4BQw5K9zdxgCFM/vxUoZ4XCwv5TvEk2v1A6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYsO8ORNHs+BcqJyqksM2bOPMvnXEzfhiC4p8DKZRI4=;
 b=ObHrXJ1zOxxxYhNPRVtjnyY/anGB4XXQHcUTWVYPKFWm8pSgA//fRjh8Deo4fy/RMswqQ/kVaSieTu+zuUYwbjBW0IV413VMvWblWN+7VTkxEPxCSpKwFEhPUYX65hcHmxlE3GFX9QSh99/lequ4SbCMu9O0yW8FT9KMtplzzkElxtVQlHHHdWxm0tim25SGEQ5JcY5vxydM45pUyJIvxXY70v0nfu1I1M0HXoF2TBJGfx9+jOU3Ww7qbNWlli6oaSsMyhP/k2ikmV4bR56gaQuG0wSS3cVacxox7JTFjSq9KvzknfnloRAKdxXK/9qRZkY3uq6dDNvZciAb0XmiPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH0PR12MB7792.namprd12.prod.outlook.com (2603:10b6:510:281::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Mon, 15 Jan
 2024 18:37:49 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::96dd:1160:6472:9873%6]) with mapi id 15.20.7181.020; Mon, 15 Jan 2024
 18:37:49 +0000
Date: Mon, 15 Jan 2024 14:37:48 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: peterx@redhat.com
Subject: Re: [PATCH v2 06/13] mm/gup: Drop folio_fast_pin_allowed() in hugepd
 processing
Message-ID: <20240115183748.GR734935@nvidia.com>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-7-peterx@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240103091423.400294-7-peterx@redhat.com>
X-ClientProxiedBy: MN2PR19CA0012.namprd19.prod.outlook.com
 (2603:10b6:208:178::25) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH0PR12MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: 06ebd5d6-34bd-4179-4b7c-08dc15f9133a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	NMHcwfKS5YpOgwMuTPz84dvhmzhTBPwFQkMqFqxZNsg8m6LeRCTTa7yhE7dxhsz7RTGXTmjlFmX+CmDqQz3ovOTcLqFrPqaozCanARZgyFmgZC09x0PNLg2EQzt613xqWQFTuOi1X2TdNksq0D32RVt91oITouUSB+IR/hrAJ2BTuGWq31O+I181h7ZeG0d4S4yG+WeY2BrCy5UIDPYZ0hNgS48o757OXenu8elR61aY0r+idnrr9ob7EDSLa266pIsU1ewx8aOfGal2MY1VHtZ6/5h+hBKkrWb/lgvxNgHHiZwkB0FWQZ6/2+od93+J6E7s5weGx3TQ4mQdQqtcG9oUL1aAfPUzuSxWf0tRCE06bALQkqeajpp4y4iVqeeKtEeo3HZ1CW4AdkPPIADtJBbcWlPcbAVP2iH7rZFqXeTQatYiGEKJX194HFPEMfvsBvpLNnhRZAT0N2YSU0akUiSVM1XjH5zT19dUmieeHn/I+a53Mklwk3vRGrj+vw1+1ZBdIsuGq9kIjmD9BKUoEW/jeocziEPSG0TjU9uQmlYd/W8LtxCmMySnNyX7ED3JqQPevdzXvpimrBahey+cLof4MZuDcXp/887nI6JJFyJJe5S+ZwyPVsT8zV9v4r82
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(136003)(376002)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66946007)(83380400001)(6506007)(66556008)(6512007)(26005)(478600001)(1076003)(38100700002)(4326008)(2616005)(5660300002)(8936002)(7416002)(6916009)(54906003)(8676002)(66476007)(6486002)(2906002)(316002)(33656002)(36756003)(86362001)(41300700001)(27376004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?m5QXqIddeL91NXMRxH4Uhbm4kQnyOX6HVsDIEbKpqiG+4PGO8IiaDLf0K5tR?=
 =?us-ascii?Q?IGSqxvFVSSmNerD1UaysnGHjSNoRWCr8Kv7B7FFmra2vUdsE4soiIkTbLc9Q?=
 =?us-ascii?Q?gpmkxGHY7Lp9xhviDJxGG0xJSl1uPWgdYW/MnAMRtJgNqj2yENxk2uhfHVZ2?=
 =?us-ascii?Q?CbIzE8JkfvR2WUKAVuzkV7cqJqtnAxNbM3CGr/PCspOoSot5EZ+iHeKJmhQp?=
 =?us-ascii?Q?ORg8dPKRLBh2dIxxU/VkuSAqarek5MOAyZk4oTK47FJ5KnY8TM9rzERNj699?=
 =?us-ascii?Q?+XMNN5KDe2JiKsvynSKqm1YGZUnJGsBF6T0wcDF/By2SRTT+/1K5n7qLiGN+?=
 =?us-ascii?Q?28XTLxtLlyr9EW7usdUJa8PMHiAyVRrin8H0tMx/AlZQiYwxK4DixfueEwI5?=
 =?us-ascii?Q?pTmIJbJhRsOZoVwd4KLVyh7Rufkw27UHjCMrBE6hnj+ZulPW/jxBdK/Prazv?=
 =?us-ascii?Q?+5TU/xGoyE6SYmC5tTOCisWC5ngKR/ThJUTwtS7eFpuiIJC5roJf+ObVY7N7?=
 =?us-ascii?Q?6kiROaIh1D/YanrIw2nlqhOFkU6gvPmszbYnIKiXKwSESobd+FZtz8nV4VGX?=
 =?us-ascii?Q?PseeE3ILoZktSbxFbhR/oJz+9jpnjsOK/P7dZH7eswCBJih9aAtIx1KX7dx8?=
 =?us-ascii?Q?AaBIjbA+T5TYBnAE9x/4xG+JgRnPUIux37/suInYHfd80+uwwxFRm6LE7LgF?=
 =?us-ascii?Q?usiCdtFDO5d7ZYSxTPbudO4zJqYCTXXnj8BEKTx5BxuPKe8SDTnghpCs25N0?=
 =?us-ascii?Q?20QdD6GvjvyEu1xDotg8iJcCMy3uMQ1nYXA1mOIeBUvmHhPiaYs9PV1czWV9?=
 =?us-ascii?Q?uQ1vZyg4X7217CaRyStcdLN82C+y/AkR1cXpW3Jz7g6PANvx2Pgbmz9avujV?=
 =?us-ascii?Q?TIm5guhgLjFGT3lwDgQtDvymt93hBmPqufpF9S0PtlHMmD0LGW81gk6PFC8s?=
 =?us-ascii?Q?35gBRMhVBWcEne4POgnI4Ajqk0vUULd67qo5ibzdXSvklH8IDlkLl4dwuFZh?=
 =?us-ascii?Q?ymsxdV64jY3+Fnd7pTZOkNbeGS60lIP0nldZrprp3qhBVjTypSWAAINSscVV?=
 =?us-ascii?Q?uHJBjHPIZRTnt5qEedcn2inFFcgWCWJvsd776ZTxQl81QX8x+NV2wiFnAXJn?=
 =?us-ascii?Q?ya0Eq8WmTQ908Kg1LZZcOKpJvTDxpTDWYreS6wAhVNJ6UjzQz4eKDt1fwEdH?=
 =?us-ascii?Q?5JfyJFM241llTZYVgZGXvj/AS3eoqoyhWKJB7V0CtlxwTUINydjb9fbNHmyk?=
 =?us-ascii?Q?i+f//7NADvkDzCfmBl/WIpGB8umB3kyLO04JuS7LBozcTKnK8BbxUwWulWaI?=
 =?us-ascii?Q?uydUWJ0tva2r8sppmC/Wzm5bF/iO/q6EiUK8Snbe1dKpBEbBZkU15CSQVsvj?=
 =?us-ascii?Q?JwHPIxypoCueN6GAUE7V6vnIyKjeVOMLLUCqwXsyKE71JuWWEcqZkD2+3erj?=
 =?us-ascii?Q?v/ejxhfI2a44inKW3Bb3aeOFmhCTXA8Bq7xoVBZjS0EA9UCUtAxNABFD7uKY?=
 =?us-ascii?Q?ZSNTWl0J6Kn3d+dNOTv8o6GXKP3KUFEm02/du27wp5bALPBkuWBCQX/uKtuW?=
 =?us-ascii?Q?ykvnDEHgC+YuIA8xnirfEUX8tD9vuVpsszImLq3H?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ebd5d6-34bd-4179-4b7c-08dc15f9133a
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 18:37:49.4941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQurqgZ/9Llavqp3HGEPNNUnZ+2dzwegzvxUdWvdyZgW8AYv2hfdhumQnB9vock/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7792
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 03, 2024 at 05:14:16PM +0800, peterx@redhat.com wrote:
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

I didn't dig into the ppc stuff too deeply, but this looks to me like
it is the same thing as ARM's contig bits?

ie a chunk of PMD/etc entries are all managed together as though they
are a virtual larger entry and we use the hugepte_addr_end() stuff to
iterate over each sub entry.

But WHY is GUP doing this or caring about this? GUP should have no
problem handling the super-size entry (eg 8M on nohash) as a single
thing. It seems we only lack an API to get this out of the arch code?

It seems to me we should see ARM and PPC agree on what the API is for
this and then get rid of hugepd by making both use the same page table
walker API. Is that too hopeful?

> Drop that check, not only because it'll never be true for hugepd per any
> known plan, but also it paves way for reusing the function outside
> fast-gup.

I didn't see any other caller of this function in this series? When
does this re-use happen??

Jason
