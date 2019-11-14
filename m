Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F8CFCEDD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 20:43:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DX3L6QHfzF7Vd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 06:43:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=195.135.220.15; helo=mx1.suse.de;
 envelope-from=mhocko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DX016Bl2zF7pr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 06:40:49 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 34F55B2AF;
 Thu, 14 Nov 2019 19:40:46 +0000 (UTC)
Date: Thu, 14 Nov 2019 20:40:44 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 2/2] mm: remove "count" parameter from
 has_unmovable_pages()
Message-ID: <20191114194044.GC24848@dhcp22.suse.cz>
References: <20191114131911.11783-1-david@redhat.com>
 <20191114131911.11783-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191114131911.11783-3-david@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 linux-kernel@vger.kernel.org, Pingfan Liu <kernelfans@gmail.com>,
 linux-mm@kvack.org, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Qian Cai <cai@lca.pw>, Wei Yang <richardw.yang@linux.intel.com>,
 Arun KS <arunks@codeaurora.org>, Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 14-11-19 14:19:11, David Hildenbrand wrote:
> Now that the memory isolate notifier is gone, the parameter is always 0.
> Drop it and cleanup has_unmovable_pages().
> 
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Qian Cai <cai@lca.pw>
> Cc: Pingfan Liu <kernelfans@gmail.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mel Gorman <mgorman@techsingularity.net>
> Cc: Mike Rapoport <rppt@linux.vnet.ibm.com>
> Cc: Wei Yang <richardw.yang@linux.intel.com>
> Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Arun KS <arunks@codeaurora.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: David Hildenbrand <david@redhat.com>

yay again! I have to say that this was a head scratcher when I've seen
that for the first time. It is really great to see it go
Acked-by: Michal Hocko <mhocko@suse.com>

Thanks!

> ---
>  include/linux/page-isolation.h |  4 ++--
>  mm/memory_hotplug.c            |  2 +-
>  mm/page_alloc.c                | 21 +++++++--------------
>  mm/page_isolation.c            |  2 +-
>  4 files changed, 11 insertions(+), 18 deletions(-)
> 
> diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.h
> index 6861df759fad..148e65a9c606 100644
> --- a/include/linux/page-isolation.h
> +++ b/include/linux/page-isolation.h
> @@ -33,8 +33,8 @@ static inline bool is_migrate_isolate(int migratetype)
>  #define MEMORY_OFFLINE	0x1
>  #define REPORT_FAILURE	0x2
>  
> -bool has_unmovable_pages(struct zone *zone, struct page *page, int count,
> -			 int migratetype, int flags);
> +bool has_unmovable_pages(struct zone *zone, struct page *page, int migratetype,
> +			 int flags);
>  void set_pageblock_migratetype(struct page *page, int migratetype);
>  int move_freepages_block(struct zone *zone, struct page *page,
>  				int migratetype, int *num_movable);
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 3b5cee4d3f4e..f06d33748607 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1158,7 +1158,7 @@ static bool is_pageblock_removable_nolock(unsigned long pfn)
>  	if (!zone_spans_pfn(zone, pfn))
>  		return false;
>  
> -	return !has_unmovable_pages(zone, page, 0, MIGRATE_MOVABLE,
> +	return !has_unmovable_pages(zone, page, MIGRATE_MOVABLE,
>  				    MEMORY_OFFLINE);
>  }
>  
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index f5ecbacb0e04..e4d8f3a1a6b6 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -8270,17 +8270,15 @@ void *__init alloc_large_system_hash(const char *tablename,
>  
>  /*
>   * This function checks whether pageblock includes unmovable pages or not.
> - * If @count is not zero, it is okay to include less @count unmovable pages
>   *
>   * PageLRU check without isolation or lru_lock could race so that
>   * MIGRATE_MOVABLE block might include unmovable pages. And __PageMovable
>   * check without lock_page also may miss some movable non-lru pages at
>   * race condition. So you can't expect this function should be exact.
>   */
> -bool has_unmovable_pages(struct zone *zone, struct page *page, int count,
> -			 int migratetype, int flags)
> +bool has_unmovable_pages(struct zone *zone, struct page *page, int migratetype,
> +			 int flags)
>  {
> -	unsigned long found;
>  	unsigned long iter = 0;
>  	unsigned long pfn = page_to_pfn(page);
>  	const char *reason = "unmovable page";
> @@ -8306,13 +8304,11 @@ bool has_unmovable_pages(struct zone *zone, struct page *page, int count,
>  		goto unmovable;
>  	}
>  
> -	for (found = 0; iter < pageblock_nr_pages; iter++) {
> -		unsigned long check = pfn + iter;
> -
> -		if (!pfn_valid_within(check))
> +	for (; iter < pageblock_nr_pages; iter++) {
> +		if (!pfn_valid_within(pfn + iter))
>  			continue;
>  
> -		page = pfn_to_page(check);
> +		page = pfn_to_page(pfn + iter);
>  
>  		if (PageReserved(page))
>  			goto unmovable;
> @@ -8361,11 +8357,9 @@ bool has_unmovable_pages(struct zone *zone, struct page *page, int count,
>  		if ((flags & MEMORY_OFFLINE) && PageHWPoison(page))
>  			continue;
>  
> -		if (__PageMovable(page))
> +		if (__PageMovable(page) || PageLRU(page))
>  			continue;
>  
> -		if (!PageLRU(page))
> -			found++;
>  		/*
>  		 * If there are RECLAIMABLE pages, we need to check
>  		 * it.  But now, memory offline itself doesn't call
> @@ -8379,8 +8373,7 @@ bool has_unmovable_pages(struct zone *zone, struct page *page, int count,
>  		 * is set to both of a memory hole page and a _used_ kernel
>  		 * page at boot.
>  		 */
> -		if (found > count)
> -			goto unmovable;
> +		goto unmovable;
>  	}
>  	return false;
>  unmovable:
> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
> index 21af88b718aa..1f8b9dfecbe8 100644
> --- a/mm/page_isolation.c
> +++ b/mm/page_isolation.c
> @@ -37,7 +37,7 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
>  	 * FIXME: Now, memory hotplug doesn't call shrink_slab() by itself.
>  	 * We just check MOVABLE pages.
>  	 */
> -	if (!has_unmovable_pages(zone, page, 0, migratetype, isol_flags)) {
> +	if (!has_unmovable_pages(zone, page, migratetype, isol_flags)) {
>  		unsigned long nr_pages;
>  		int mt = get_pageblock_migratetype(page);
>  
> -- 
> 2.21.0

-- 
Michal Hocko
SUSE Labs
