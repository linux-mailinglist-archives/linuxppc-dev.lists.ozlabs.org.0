Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 136AC35BBAA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 10:06:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJhBd73WYz302p
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 18:06:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FJhBJ1ZLkz2yyF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 18:05:42 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0D0231B;
 Mon, 12 Apr 2021 01:05:38 -0700 (PDT)
Received: from [10.163.72.17] (unknown [10.163.72.17])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 340B23F73B;
 Mon, 12 Apr 2021 01:05:36 -0700 (PDT)
Subject: Re: [PATCH V2] mm/page_alloc: Ensure that HUGETLB_PAGE_ORDER is less
 than MAX_ORDER
To: linux-mm@kvack.org, akpm@linux-foundation.org
References: <1618199302-29335-1-git-send-email-anshuman.khandual@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <09284b9a-cfe1-fc49-e1f6-3cf0c1b74c76@arm.com>
Date: Mon, 12 Apr 2021 13:36:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1618199302-29335-1-git-send-email-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linuxppc-dev @ lists . ozlabs . org" <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+ linuxppc-dev@lists.ozlabs.org
+ linux-ia64@vger.kernel.org

On 4/12/21 9:18 AM, Anshuman Khandual wrote:
> pageblock_order must always be less than MAX_ORDER, otherwise it might lead
> to an warning during boot. A similar problem got fixed on arm64 platform
> with the commit 79cc2ed5a716 ("arm64/mm: Drop THP conditionality from
> FORCE_MAX_ZONEORDER"). Assert the above condition before HUGETLB_PAGE_ORDER
> gets assigned as pageblock_order. This will help detect the problem earlier
> on platforms where HUGETLB_PAGE_SIZE_VARIABLE is enabled.
> 
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> Changes in V2:
> 
> - Changed WARN_ON() to BUILD_BUG_ON() per David
> 
> Changes in V1:
> 
> https://patchwork.kernel.org/project/linux-mm/patch/1617947717-2424-1-git-send-email-anshuman.khandual@arm.com/
> 
>  mm/page_alloc.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index cfc72873961d..19283bff4bec 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6875,10 +6875,17 @@ void __init set_pageblock_order(void)
>  	if (pageblock_order)
>  		return;
>  
> -	if (HPAGE_SHIFT > PAGE_SHIFT)
> +	if (HPAGE_SHIFT > PAGE_SHIFT) {
> +		/*
> +		 * pageblock_order must always be less than
> +		 * MAX_ORDER. So does HUGETLB_PAGE_ORDER if
> +		 * that is being assigned here.
> +		 */
> +		BUILD_BUG_ON(HUGETLB_PAGE_ORDER >= MAX_ORDER);

Unfortunately the build test fails on both the platforms (powerpc and ia64)
which subscribe HUGETLB_PAGE_SIZE_VARIABLE and where this check would make
sense. I some how overlooked the cross compile build failure that actually
detected this problem.

But wondering why this assert is not holding true ? and how these platforms
do not see the warning during boot (or do they ?) at mm/vmscan.c:1092 like
arm64 did.

static int __fragmentation_index(unsigned int order, struct contig_page_info *info)
{
        unsigned long requested = 1UL << order;

        if (WARN_ON_ONCE(order >= MAX_ORDER))
                return 0;
....

Can pageblock_order really exceed MAX_ORDER - 1 ?

>  		order = HUGETLB_PAGE_ORDER;
> -	else
> +	} else {
>  		order = MAX_ORDER - 1;
> +	}
>  
>  	/*
>  	 * Assume the largest contiguous order of interest is a huge page.
> 
