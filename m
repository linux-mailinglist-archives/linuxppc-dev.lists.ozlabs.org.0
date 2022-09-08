Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B693E5B10BC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 02:04:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNK9c5Nrfz3c66
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 10:04:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rX7Xp35k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.220.71; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=jhubbard@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rX7Xp35k;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNK8r5LLWz2yp5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 10:03:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4RbCigKAjk0mFxeXQfFDP6Fv7wfXLZmngad5FhzK+W7o3fbE8w5moSzjib6ZroJchqqiG9xV96LMThFytr3sL+bLK7k9Npgu/MoUU4xNpq6HtJUmpVhnLLgo0iZbe5aQVVg1u59Hn/B+J7AWeBcZyYoe98Z6baSf1ScTVlSG8e3+cQYEFs2mVyArFT5Acy6ZSC8yhyu9oRxjP2ZjUvLSZCVw2YQva9H/5k1Ofc2UEr49tre/JK3wHB7IkScrT1koUnQA+FvTnlw0vBnENIRAj3FEeG0TUbptTN3FVgK4PGDfR5sAiWslNK5uq/Vk7mp/BdNbtsmrM/fko6B7kFExg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aARjHdXADsX15NygtJyP7d2jR0UewUYfLzTqzb5Pb0=;
 b=PZSlpvieG6523yUeA6IiJk/9ag1TKEZbSV4JJclJlJamGkVNDPax2voLO23N1XjGcAQDuDAwn/pfN2vwVuKH63B/1L9jDpV3cMH4ylwYC5YsgFOqQRVF6ApvXtn6OI6+vf1lr5nhU68Rkm8HnE+b6wxfxNGF+1jaVocLuZp2MT5/DH/W6q30UqhYGRROhiPOCh5BzpIW2byh23xyuOp2P3JUZxiZYvrrfgAo8tAKiWCUYHlqTCz0kbgNEAPi4OaB1RM83JUyX13x3L7OFSh1Gl60KfBDbbo19Ooa7XGFKKv8OGr3HfD/Ej7M5Mykvdu3bZsElRVV6qkfVd9fW/Ea6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aARjHdXADsX15NygtJyP7d2jR0UewUYfLzTqzb5Pb0=;
 b=rX7Xp35khb0gnkbEq8zvkQHul9Y5647LntThls1u3N6laTlOipDGaWXtLmL0X8YS3AQu4ZTafvcQrTzn2BBc1p10LGZ2k7ACPk7XN3oix5BONIbEYD7j2slOFbOgK1bXMzh8Ln4aHzXue1rUyCyKV+GzZs1MFbHG6LHDtLIH+rJDdfHOi7GHQrUWqnBJolwfzJrIj5BT4l//hIXNL43LRevBprjDchQiEyJvtYXW6sEFizIf4RV8QPu0d6CWj48B4GXlCxTCv1DoJnoGKE19ma32vvU3o5NsncRytcxq0V1irS7qqzTB8UHPq2/j8OY48HgonQ47Ir8NULMHHfyzPA==
Received: from DM6PR02CA0078.namprd02.prod.outlook.com (2603:10b6:5:1f4::19)
 by DS7PR12MB6046.namprd12.prod.outlook.com (2603:10b6:8:85::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Thu, 8 Sep
 2022 00:03:16 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::75) by DM6PR02CA0078.outlook.office365.com
 (2603:10b6:5:1f4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Thu, 8 Sep 2022 00:03:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 00:03:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.38; Thu, 8 Sep
 2022 00:03:16 +0000
Received: from [10.110.48.28] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 7 Sep 2022
 17:03:15 -0700
Message-ID: <501e653b-129d-26ad-02d7-b34fff6a6d5e@nvidia.com>
Date: Wed, 7 Sep 2022 17:06:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [v2 PATCH 1/2] mm: gup: fix the fast GUP race against THP
 collapse
To: Yang Shi <shy828301@gmail.com>, <david@redhat.com>, <peterx@redhat.com>,
	<kirill.shutemov@linux.intel.com>, <jgg@nvidia.com>, <hughd@google.com>,
	<akpm@linux-foundation.org>, <aneesh.kumar@linux.ibm.com>
References: <20220907180144.555485-1-shy828301@gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20220907180144.555485-1-shy828301@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT051:EE_|DS7PR12MB6046:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b1a0fb-db3c-4b41-2f3d-08da912d87c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3h77gEbFELcR20LbOKQxJQG5sWPIEfOkUq7bNLJGdQoTqpl13PjCM+2vPxERfE9sQP8VlQWOgUFfZuUQkLRXkSfDpenwZVgeFMy8BIBpCFxb8Pg7Vn73Xv8xdzHQJiKmvJjw34kVvCpBtoC+y2UywXcn3tx2I1iKBSgCHlNdaa1kjggfmLYXGgQy5vv2dNH25jKFryqgJETtqxWoqBFydmQMLcFX2i05rfUUn0DsjZmM0C89yaeYaQIFaXJJ1gGAFuWwtVkFeQY+nO0gBOlYomAFPxdS5Vr3L2p+VxGeuBXtXtQOFzMV8vYAcDwQSZ7d7OB2PEspFmvGPREAyfhdkt+eX8uiWuvNaPs8YCblvE7GEa8E0Dl+G4aX/amaVZhx/AXq4Hma9H52ir0AHqctoNZ/8dM+g3zNJnJasGSz++lXZ2QiBtc69pa+QjoyUMifagrpewZjleqYRX9vrrKqaGwGh3smP6KwX4SaD6s28Fz82uuIqXes0EFIDRXcjrKE+W4ACOlGhsEIqDhjhC9hfQ8M6HlJyzTHAiL0jQfc1xqyXvtN7xqGiQY45h2IbcMk6fuXjYpKiN8DomdIiMEsgxfgUNVEirrGkDxTN9RMZ/N8t9dfFrEUIox4RncuIjB+2chhtrqzxQ4mpe7HEatEcSWqyWSAqhLMRVKZX4/Tpp4xP/2sCSj25RCANFRS0dfneIlKh7qp2zeN9Btqo9nYvGQmL2j2d1pcwnoj+5dYfqvlT39CZJ0Mec0Zt0J8CBiYIkbywC9BsXpWP+5kkJf/DC8/COwzNb5JYHAS3O+hmPAaa5iVzEP7xB1Y7qx9H/w9Sl5+kkhOVLMoaiI/wOrHH4P4mWsSSY4w0IMQnJZieLU=
X-Forefront-Antispam-Report: 	CIP:12.22.5.235;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966006)(40470700004)(36840700001)(81166007)(356005)(82740400003)(36860700001)(8676002)(40460700003)(47076005)(82310400005)(110136005)(316002)(70206006)(70586007)(16576012)(54906003)(4326008)(2906002)(16526019)(40480700001)(7416002)(5660300002)(36756003)(26005)(2616005)(83380400001)(31686004)(6666004)(53546011)(426003)(478600001)(8936002)(186003)(336012)(31696002)(86362001)(41300700001)(36900700001)(43740500002)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 00:03:16.2761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b1a0fb-db3c-4b41-2f3d-08da912d87c9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.235];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6046
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/7/22 11:01, Yang Shi wrote:
> Since general RCU GUP fast was introduced in commit 2667f50e8b81 ("mm:
> introduce a general RCU get_user_pages_fast()"), a TLB flush is no longer
> sufficient to handle concurrent GUP-fast in all cases, it only handles
> traditional IPI-based GUP-fast correctly.  On architectures that send
> an IPI broadcast on TLB flush, it works as expected.  But on the
> architectures that do not use IPI to broadcast TLB flush, it may have
> the below race:
> 
>     CPU A                                          CPU B
> THP collapse                                     fast GUP
>                                                gup_pmd_range() <-- see valid pmd
>                                                    gup_pte_range() <-- work on pte
> pmdp_collapse_flush() <-- clear pmd and flush
> __collapse_huge_page_isolate()
>      check page pinned <-- before GUP bump refcount
>                                                        pin the page
>                                                        check PTE <-- no change
> __collapse_huge_page_copy()
>      copy data to huge page
>      ptep_clear()
> install huge pmd for the huge page
>                                                        return the stale page
> discard the stale page
> 
> The race could be fixed by checking whether PMD is changed or not after
> taking the page pin in fast GUP, just like what it does for PTE.  If the
> PMD is changed it means there may be parallel THP collapse, so GUP
> should back off.
> 
> Also update the stale comment about serializing against fast GUP in
> khugepaged.
> 
> Fixes: 2667f50e8b81 ("mm: introduce a general RCU get_user_pages_fast()")
> Acked-by: David Hildenbrand <david@redhat.com>
> Acked-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Yang Shi <shy828301@gmail.com>
> ---
> v2: * Incorporated the comment from Peter about the comment.
>      * Moved the comment right before gup_pte_range() instead of in the
>        body of the function, per John.
>      * Added patch 2/2 per Aneesh.
> 
>   mm/gup.c        | 34 ++++++++++++++++++++++++++++------
>   mm/khugepaged.c | 10 ++++++----
>   2 files changed, 34 insertions(+), 10 deletions(-)
> 

Looks good.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard
NVIDIA

> diff --git a/mm/gup.c b/mm/gup.c
> index f3fc1f08d90c..40aa1c937212 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2380,8 +2380,28 @@ static void __maybe_unused undo_dev_pagemap(int *nr, int nr_start,
>   }
>   
>   #ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
> -static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
> -			 unsigned int flags, struct page **pages, int *nr)
> +/*
> + * Fast-gup relies on pte change detection to avoid concurrent pgtable
> + * operations.
> + *
> + * To pin the page, fast-gup needs to do below in order:
> + * (1) pin the page (by prefetching pte), then (2) check pte not changed.
> + *
> + * For the rest of pgtable operations where pgtable updates can be racy
> + * with fast-gup, we need to do (1) clear pte, then (2) check whether page
> + * is pinned.
> + *
> + * Above will work for all pte-level operations, including THP split.
> + *
> + * For THP collapse, it's a bit more complicated because fast-gup may be
> + * walking a pgtable page that is being freed (pte is still valid but pmd
> + * can be cleared already).  To avoid race in such condition, we need to
> + * also check pmd here to make sure pmd doesn't change (corresponds to
> + * pmdp_collapse_flush() in the THP collapse code path).
> + */
> +static int gup_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
> +			 unsigned long end, unsigned int flags,
> +			 struct page **pages, int *nr)
>   {
>   	struct dev_pagemap *pgmap = NULL;
>   	int nr_start = *nr, ret = 0;
> @@ -2423,7 +2443,8 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
>   			goto pte_unmap;
>   		}
>   
> -		if (unlikely(pte_val(pte) != pte_val(*ptep))) {
> +		if (unlikely(pmd_val(pmd) != pmd_val(*pmdp)) ||
> +		    unlikely(pte_val(pte) != pte_val(*ptep))) {
>   			gup_put_folio(folio, 1, flags);
>   			goto pte_unmap;
>   		}
> @@ -2470,8 +2491,9 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
>    * get_user_pages_fast_only implementation that can pin pages. Thus it's still
>    * useful to have gup_huge_pmd even if we can't operate on ptes.
>    */
> -static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
> -			 unsigned int flags, struct page **pages, int *nr)
> +static int gup_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
> +			 unsigned long end, unsigned int flags,
> +			 struct page **pages, int *nr)
>   {
>   	return 0;
>   }
> @@ -2791,7 +2813,7 @@ static int gup_pmd_range(pud_t *pudp, pud_t pud, unsigned long addr, unsigned lo
>   			if (!gup_huge_pd(__hugepd(pmd_val(pmd)), addr,
>   					 PMD_SHIFT, next, flags, pages, nr))
>   				return 0;
> -		} else if (!gup_pte_range(pmd, addr, next, flags, pages, nr))
> +		} else if (!gup_pte_range(pmd, pmdp, addr, next, flags, pages, nr))
>   			return 0;
>   	} while (pmdp++, addr = next, addr != end);
>   
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 2d74cf01f694..518b49095db3 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1049,10 +1049,12 @@ static int collapse_huge_page(struct mm_struct *mm, unsigned long address,
>   
>   	pmd_ptl = pmd_lock(mm, pmd); /* probably unnecessary */
>   	/*
> -	 * After this gup_fast can't run anymore. This also removes
> -	 * any huge TLB entry from the CPU so we won't allow
> -	 * huge and small TLB entries for the same virtual address
> -	 * to avoid the risk of CPU bugs in that area.
> +	 * This removes any huge TLB entry from the CPU so we won't allow
> +	 * huge and small TLB entries for the same virtual address to
> +	 * avoid the risk of CPU bugs in that area.
> +	 *
> +	 * Parallel fast GUP is fine since fast GUP will back off when
> +	 * it detects PMD is changed.
>   	 */
>   	_pmd = pmdp_collapse_flush(vma, address, pmd);
>   	spin_unlock(pmd_ptl);


