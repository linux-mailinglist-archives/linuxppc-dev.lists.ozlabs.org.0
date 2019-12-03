Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1589B1100ED
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 16:12:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S57g4lCTzDqQj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2019 02:12:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=osalvador@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S55Z4xPszDqWx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2019 02:10:41 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 78381C1F9;
 Tue,  3 Dec 2019 15:10:37 +0000 (UTC)
Date: Tue, 3 Dec 2019 16:10:30 +0100
From: Oscar Salvador <osalvador@suse.de>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v6 05/10] mm/memory_hotplug: Shrink zones when offlining
 memory
Message-ID: <20191203151030.GB2600@linux>
References: <20191006085646.5768-1-david@redhat.com>
 <20191006085646.5768-6-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191006085646.5768-6-david@redhat.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Michal Hocko <mhocko@suse.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-s390@vger.kernel.org,
 Yu Zhao <yuzhao@google.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Halil Pasic <pasic@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 x86@kernel.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Jun Yao <yaojun8558363@gmail.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, Ira Weiny <ira.weiny@intel.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Steve Capper <steve.capper@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Oct 06, 2019 at 10:56:41AM +0200, David Hildenbrand wrote:
> Fixes: d0dc12e86b31 ("mm/memory_hotplug: optimize memory hotplug")
> Signed-off-by: David Hildenbrand <david@redhat.com>

I did not see anything wrong with the taken approach, and makes sense to me.
The only thing that puzzles me is we seem to not balance spanned_pages
for ZONE_DEVICE anymore.
memremap_pages() increments them via move_pfn_range_to_zone, but we skip
ZONE_DEVICE in remove_pfn_range_from_zone.

That is not really related to this patch, so I might be missing something,
but it caught my eye while reviewing this.

Anyway, for this one:

Reviewed-by: Oscar Salvador <osalvador@suse.de>


off-topic: I __think__ we really need to trim the CC list.

> ---
>  arch/arm64/mm/mmu.c            |  4 +---
>  arch/ia64/mm/init.c            |  4 +---
>  arch/powerpc/mm/mem.c          |  3 +--
>  arch/s390/mm/init.c            |  4 +---
>  arch/sh/mm/init.c              |  4 +---
>  arch/x86/mm/init_32.c          |  4 +---
>  arch/x86/mm/init_64.c          |  4 +---
>  include/linux/memory_hotplug.h |  7 +++++--
>  mm/memory_hotplug.c            | 31 ++++++++++++++++---------------
>  mm/memremap.c                  |  2 +-
>  10 files changed, 29 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 60c929f3683b..d10247fab0fd 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1069,7 +1069,6 @@ void arch_remove_memory(int nid, u64 start, u64 size,
>  {
>  	unsigned long start_pfn = start >> PAGE_SHIFT;
>  	unsigned long nr_pages = size >> PAGE_SHIFT;
> -	struct zone *zone;
>  
>  	/*
>  	 * FIXME: Cleanup page tables (also in arch_add_memory() in case
> @@ -1078,7 +1077,6 @@ void arch_remove_memory(int nid, u64 start, u64 size,
>  	 * unplug. ARCH_ENABLE_MEMORY_HOTREMOVE must not be
>  	 * unlocked yet.
>  	 */
> -	zone = page_zone(pfn_to_page(start_pfn));
> -	__remove_pages(zone, start_pfn, nr_pages, altmap);
> +	__remove_pages(start_pfn, nr_pages, altmap);
>  }
>  #endif
> diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
> index bf9df2625bc8..a6dd80a2c939 100644
> --- a/arch/ia64/mm/init.c
> +++ b/arch/ia64/mm/init.c
> @@ -689,9 +689,7 @@ void arch_remove_memory(int nid, u64 start, u64 size,
>  {
>  	unsigned long start_pfn = start >> PAGE_SHIFT;
>  	unsigned long nr_pages = size >> PAGE_SHIFT;
> -	struct zone *zone;
>  
> -	zone = page_zone(pfn_to_page(start_pfn));
> -	__remove_pages(zone, start_pfn, nr_pages, altmap);
> +	__remove_pages(start_pfn, nr_pages, altmap);
>  }
>  #endif
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index be941d382c8d..97e5922cb52e 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -130,10 +130,9 @@ void __ref arch_remove_memory(int nid, u64 start, u64 size,
>  {
>  	unsigned long start_pfn = start >> PAGE_SHIFT;
>  	unsigned long nr_pages = size >> PAGE_SHIFT;
> -	struct page *page = pfn_to_page(start_pfn) + vmem_altmap_offset(altmap);
>  	int ret;
>  
> -	__remove_pages(page_zone(page), start_pfn, nr_pages, altmap);
> +	__remove_pages(start_pfn, nr_pages, altmap);
>  
>  	/* Remove htab bolted mappings for this section of memory */
>  	start = (unsigned long)__va(start);
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index a124f19f7b3c..c1d96e588152 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -291,10 +291,8 @@ void arch_remove_memory(int nid, u64 start, u64 size,
>  {
>  	unsigned long start_pfn = start >> PAGE_SHIFT;
>  	unsigned long nr_pages = size >> PAGE_SHIFT;
> -	struct zone *zone;
>  
> -	zone = page_zone(pfn_to_page(start_pfn));
> -	__remove_pages(zone, start_pfn, nr_pages, altmap);
> +	__remove_pages(start_pfn, nr_pages, altmap);
>  	vmem_remove_mapping(start, size);
>  }
>  #endif /* CONFIG_MEMORY_HOTPLUG */
> diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
> index dfdbaa50946e..d1b1ff2be17a 100644
> --- a/arch/sh/mm/init.c
> +++ b/arch/sh/mm/init.c
> @@ -434,9 +434,7 @@ void arch_remove_memory(int nid, u64 start, u64 size,
>  {
>  	unsigned long start_pfn = PFN_DOWN(start);
>  	unsigned long nr_pages = size >> PAGE_SHIFT;
> -	struct zone *zone;
>  
> -	zone = page_zone(pfn_to_page(start_pfn));
> -	__remove_pages(zone, start_pfn, nr_pages, altmap);
> +	__remove_pages(start_pfn, nr_pages, altmap);
>  }
>  #endif /* CONFIG_MEMORY_HOTPLUG */
> diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
> index 930edeb41ec3..0a74407ef92e 100644
> --- a/arch/x86/mm/init_32.c
> +++ b/arch/x86/mm/init_32.c
> @@ -865,10 +865,8 @@ void arch_remove_memory(int nid, u64 start, u64 size,
>  {
>  	unsigned long start_pfn = start >> PAGE_SHIFT;
>  	unsigned long nr_pages = size >> PAGE_SHIFT;
> -	struct zone *zone;
>  
> -	zone = page_zone(pfn_to_page(start_pfn));
> -	__remove_pages(zone, start_pfn, nr_pages, altmap);
> +	__remove_pages(start_pfn, nr_pages, altmap);
>  }
>  #endif
>  
> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index a6b5c653727b..b8541d77452c 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -1212,10 +1212,8 @@ void __ref arch_remove_memory(int nid, u64 start, u64 size,
>  {
>  	unsigned long start_pfn = start >> PAGE_SHIFT;
>  	unsigned long nr_pages = size >> PAGE_SHIFT;
> -	struct page *page = pfn_to_page(start_pfn) + vmem_altmap_offset(altmap);
> -	struct zone *zone = page_zone(page);
>  
> -	__remove_pages(zone, start_pfn, nr_pages, altmap);
> +	__remove_pages(start_pfn, nr_pages, altmap);
>  	kernel_physical_mapping_remove(start, start + size);
>  }
>  #endif /* CONFIG_MEMORY_HOTPLUG */
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index bc477e98a310..517b70943732 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -126,8 +126,8 @@ static inline bool movable_node_is_enabled(void)
>  
>  extern void arch_remove_memory(int nid, u64 start, u64 size,
>  			       struct vmem_altmap *altmap);
> -extern void __remove_pages(struct zone *zone, unsigned long start_pfn,
> -			   unsigned long nr_pages, struct vmem_altmap *altmap);
> +extern void __remove_pages(unsigned long start_pfn, unsigned long nr_pages,
> +			   struct vmem_altmap *altmap);
>  
>  /* reasonably generic interface to expand the physical pages */
>  extern int __add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
> @@ -346,6 +346,9 @@ extern int add_memory(int nid, u64 start, u64 size);
>  extern int add_memory_resource(int nid, struct resource *resource);
>  extern void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
>  		unsigned long nr_pages, struct vmem_altmap *altmap);
> +extern void remove_pfn_range_from_zone(struct zone *zone,
> +				       unsigned long start_pfn,
> +				       unsigned long nr_pages);
>  extern bool is_memblock_offlined(struct memory_block *mem);
>  extern int sparse_add_section(int nid, unsigned long pfn,
>  		unsigned long nr_pages, struct vmem_altmap *altmap);
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index f96608d24f6a..5b003ffa5dc9 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -457,8 +457,9 @@ static void update_pgdat_span(struct pglist_data *pgdat)
>  	pgdat->node_spanned_pages = node_end_pfn - node_start_pfn;
>  }
>  
> -static void __remove_zone(struct zone *zone, unsigned long start_pfn,
> -		unsigned long nr_pages)
> +void __ref remove_pfn_range_from_zone(struct zone *zone,
> +				      unsigned long start_pfn,
> +				      unsigned long nr_pages)
>  {
>  	struct pglist_data *pgdat = zone->zone_pgdat;
>  	unsigned long flags;
> @@ -473,28 +474,30 @@ static void __remove_zone(struct zone *zone, unsigned long start_pfn,
>  		return;
>  #endif
>  
> +	clear_zone_contiguous(zone);
> +
>  	pgdat_resize_lock(zone->zone_pgdat, &flags);
>  	shrink_zone_span(zone, start_pfn, start_pfn + nr_pages);
>  	update_pgdat_span(pgdat);
>  	pgdat_resize_unlock(zone->zone_pgdat, &flags);
> +
> +	set_zone_contiguous(zone);
>  }
>  
> -static void __remove_section(struct zone *zone, unsigned long pfn,
> -		unsigned long nr_pages, unsigned long map_offset,
> -		struct vmem_altmap *altmap)
> +static void __remove_section(unsigned long pfn, unsigned long nr_pages,
> +			     unsigned long map_offset,
> +			     struct vmem_altmap *altmap)
>  {
>  	struct mem_section *ms = __nr_to_section(pfn_to_section_nr(pfn));
>  
>  	if (WARN_ON_ONCE(!valid_section(ms)))
>  		return;
>  
> -	__remove_zone(zone, pfn, nr_pages);
>  	sparse_remove_section(ms, pfn, nr_pages, map_offset, altmap);
>  }
>  
>  /**
> - * __remove_pages() - remove sections of pages from a zone
> - * @zone: zone from which pages need to be removed
> + * __remove_pages() - remove sections of pages
>   * @pfn: starting pageframe (must be aligned to start of a section)
>   * @nr_pages: number of pages to remove (must be multiple of section size)
>   * @altmap: alternative device page map or %NULL if default memmap is used
> @@ -504,16 +507,14 @@ static void __remove_section(struct zone *zone, unsigned long pfn,
>   * sure that pages are marked reserved and zones are adjust properly by
>   * calling offline_pages().
>   */
> -void __remove_pages(struct zone *zone, unsigned long pfn,
> -		    unsigned long nr_pages, struct vmem_altmap *altmap)
> +void __remove_pages(unsigned long pfn, unsigned long nr_pages,
> +		    struct vmem_altmap *altmap)
>  {
>  	unsigned long map_offset = 0;
>  	unsigned long nr, start_sec, end_sec;
>  
>  	map_offset = vmem_altmap_offset(altmap);
>  
> -	clear_zone_contiguous(zone);
> -
>  	if (check_pfn_span(pfn, nr_pages, "remove"))
>  		return;
>  
> @@ -525,13 +526,11 @@ void __remove_pages(struct zone *zone, unsigned long pfn,
>  		cond_resched();
>  		pfns = min(nr_pages, PAGES_PER_SECTION
>  				- (pfn & ~PAGE_SECTION_MASK));
> -		__remove_section(zone, pfn, pfns, map_offset, altmap);
> +		__remove_section(pfn, pfns, map_offset, altmap);
>  		pfn += pfns;
>  		nr_pages -= pfns;
>  		map_offset = 0;
>  	}
> -
> -	set_zone_contiguous(zone);
>  }
>  
>  int set_online_page_callback(online_page_callback_t callback)
> @@ -859,6 +858,7 @@ int __ref online_pages(unsigned long pfn, unsigned long nr_pages, int online_typ
>  		 (unsigned long long) pfn << PAGE_SHIFT,
>  		 (((unsigned long long) pfn + nr_pages) << PAGE_SHIFT) - 1);
>  	memory_notify(MEM_CANCEL_ONLINE, &arg);
> +	remove_pfn_range_from_zone(zone, pfn, nr_pages);
>  	mem_hotplug_done();
>  	return ret;
>  }
> @@ -1605,6 +1605,7 @@ static int __ref __offline_pages(unsigned long start_pfn,
>  	writeback_set_ratelimit();
>  
>  	memory_notify(MEM_OFFLINE, &arg);
> +	remove_pfn_range_from_zone(zone, start_pfn, nr_pages);
>  	mem_hotplug_done();
>  	return 0;
>  
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 8c2fb44c3b4d..70263e6f093e 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -140,7 +140,7 @@ void memunmap_pages(struct dev_pagemap *pgmap)
>  
>  	mem_hotplug_begin();
>  	if (pgmap->type == MEMORY_DEVICE_PRIVATE) {
> -		__remove_pages(page_zone(first_page), PHYS_PFN(res->start),
> +		__remove_pages(PHYS_PFN(res->start),
>  			       PHYS_PFN(resource_size(res)), NULL);
>  	} else {
>  		arch_remove_memory(nid, res->start, resource_size(res),
> -- 
> 2.21.0
> 

-- 
Oscar Salvador
SUSE L3
