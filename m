Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EB8FCED6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 20:41:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DX0r5fBwzDsYg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 06:41:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DWyY10W3zF7P3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 06:39:31 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E7941ACA3;
 Thu, 14 Nov 2019 19:39:27 +0000 (UTC)
Date: Thu, 14 Nov 2019 20:39:26 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 1/2] mm: remove the memory isolate notifier
Message-ID: <20191114193925.GB24848@dhcp22.suse.cz>
References: <20191114131911.11783-1-david@redhat.com>
 <20191114131911.11783-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191114131911.11783-2-david@redhat.com>
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
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-kernel@vger.kernel.org,
 Pingfan Liu <kernelfans@gmail.com>, linux-mm@kvack.org, Qian Cai <cai@lca.pw>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 14-11-19 14:19:10, David Hildenbrand wrote:
> Luckily, we have no users left, so we can get rid of it. Cleanup
> set_migratetype_isolate() a little bit.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Qian Cai <cai@lca.pw>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Pingfan Liu <kernelfans@gmail.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: David Hildenbrand <david@redhat.com>

\o/
Acked-by: Michal Hocko <mhocko@suse.com>

There is some potential on a further cleanups but this is definitely a
great step

> ---
>  drivers/base/memory.c  | 19 -------------------
>  include/linux/memory.h | 27 ---------------------------
>  mm/page_isolation.c    | 38 ++++----------------------------------
>  3 files changed, 4 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index a757d9ed88a7..03c18c97c2bf 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -73,20 +73,6 @@ void unregister_memory_notifier(struct notifier_block *nb)
>  }
>  EXPORT_SYMBOL(unregister_memory_notifier);
>  
> -static ATOMIC_NOTIFIER_HEAD(memory_isolate_chain);
> -
> -int register_memory_isolate_notifier(struct notifier_block *nb)
> -{
> -	return atomic_notifier_chain_register(&memory_isolate_chain, nb);
> -}
> -EXPORT_SYMBOL(register_memory_isolate_notifier);
> -
> -void unregister_memory_isolate_notifier(struct notifier_block *nb)
> -{
> -	atomic_notifier_chain_unregister(&memory_isolate_chain, nb);
> -}
> -EXPORT_SYMBOL(unregister_memory_isolate_notifier);
> -
>  static void memory_block_release(struct device *dev)
>  {
>  	struct memory_block *mem = to_memory_block(dev);
> @@ -178,11 +164,6 @@ int memory_notify(unsigned long val, void *v)
>  	return blocking_notifier_call_chain(&memory_chain, val, v);
>  }
>  
> -int memory_isolate_notify(unsigned long val, void *v)
> -{
> -	return atomic_notifier_call_chain(&memory_isolate_chain, val, v);
> -}
> -
>  /*
>   * The probe routines leave the pages uninitialized, just as the bootmem code
>   * does. Make sure we do not access them, but instead use only information from
> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index 0ebb105eb261..d3fde2d0d94b 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -55,19 +55,6 @@ struct memory_notify {
>  	int status_change_nid;
>  };
>  
> -/*
> - * During pageblock isolation, count the number of pages within the
> - * range [start_pfn, start_pfn + nr_pages) which are owned by code
> - * in the notifier chain.
> - */
> -#define MEM_ISOLATE_COUNT	(1<<0)
> -
> -struct memory_isolate_notify {
> -	unsigned long start_pfn;	/* Start of range to check */
> -	unsigned int nr_pages;		/* # pages in range to check */
> -	unsigned int pages_found;	/* # pages owned found by callbacks */
> -};
> -
>  struct notifier_block;
>  struct mem_section;
>  
> @@ -94,27 +81,13 @@ static inline int memory_notify(unsigned long val, void *v)
>  {
>  	return 0;
>  }
> -static inline int register_memory_isolate_notifier(struct notifier_block *nb)
> -{
> -	return 0;
> -}
> -static inline void unregister_memory_isolate_notifier(struct notifier_block *nb)
> -{
> -}
> -static inline int memory_isolate_notify(unsigned long val, void *v)
> -{
> -	return 0;
> -}
>  #else
>  extern int register_memory_notifier(struct notifier_block *nb);
>  extern void unregister_memory_notifier(struct notifier_block *nb);
> -extern int register_memory_isolate_notifier(struct notifier_block *nb);
> -extern void unregister_memory_isolate_notifier(struct notifier_block *nb);
>  int create_memory_block_devices(unsigned long start, unsigned long size);
>  void remove_memory_block_devices(unsigned long start, unsigned long size);
>  extern void memory_dev_init(void);
>  extern int memory_notify(unsigned long val, void *v);
> -extern int memory_isolate_notify(unsigned long val, void *v);
>  extern struct memory_block *find_memory_block(struct mem_section *);
>  typedef int (*walk_memory_blocks_func_t)(struct memory_block *, void *);
>  extern int walk_memory_blocks(unsigned long start, unsigned long size,
> diff --git a/mm/page_isolation.c b/mm/page_isolation.c
> index 04ee1663cdbe..21af88b718aa 100644
> --- a/mm/page_isolation.c
> +++ b/mm/page_isolation.c
> @@ -18,9 +18,7 @@
>  static int set_migratetype_isolate(struct page *page, int migratetype, int isol_flags)
>  {
>  	struct zone *zone;
> -	unsigned long flags, pfn;
> -	struct memory_isolate_notify arg;
> -	int notifier_ret;
> +	unsigned long flags;
>  	int ret = -EBUSY;
>  
>  	zone = page_zone(page);
> @@ -35,41 +33,11 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
>  	if (is_migrate_isolate_page(page))
>  		goto out;
>  
> -	pfn = page_to_pfn(page);
> -	arg.start_pfn = pfn;
> -	arg.nr_pages = pageblock_nr_pages;
> -	arg.pages_found = 0;
> -
> -	/*
> -	 * It may be possible to isolate a pageblock even if the
> -	 * migratetype is not MIGRATE_MOVABLE. The memory isolation
> -	 * notifier chain is used by balloon drivers to return the
> -	 * number of pages in a range that are held by the balloon
> -	 * driver to shrink memory. If all the pages are accounted for
> -	 * by balloons, are free, or on the LRU, isolation can continue.
> -	 * Later, for example, when memory hotplug notifier runs, these
> -	 * pages reported as "can be isolated" should be isolated(freed)
> -	 * by the balloon driver through the memory notifier chain.
> -	 */
> -	notifier_ret = memory_isolate_notify(MEM_ISOLATE_COUNT, &arg);
> -	notifier_ret = notifier_to_errno(notifier_ret);
> -	if (notifier_ret)
> -		goto out;
>  	/*
>  	 * FIXME: Now, memory hotplug doesn't call shrink_slab() by itself.
>  	 * We just check MOVABLE pages.
>  	 */
> -	if (!has_unmovable_pages(zone, page, arg.pages_found, migratetype,
> -				 isol_flags))
> -		ret = 0;
> -
> -	/*
> -	 * immobile means "not-on-lru" pages. If immobile is larger than
> -	 * removable-by-driver pages reported by notifier, we'll fail.
> -	 */
> -
> -out:
> -	if (!ret) {
> +	if (!has_unmovable_pages(zone, page, 0, migratetype, isol_flags)) {
>  		unsigned long nr_pages;
>  		int mt = get_pageblock_migratetype(page);
>  
> @@ -79,8 +47,10 @@ static int set_migratetype_isolate(struct page *page, int migratetype, int isol_
>  									NULL);
>  
>  		__mod_zone_freepage_state(zone, -nr_pages, mt);
> +		ret = 0;
>  	}
>  
> +out:
>  	spin_unlock_irqrestore(&zone->lock, flags);
>  	if (!ret)
>  		drain_all_pages(zone);
> -- 
> 2.21.0

-- 
Michal Hocko
SUSE Labs
