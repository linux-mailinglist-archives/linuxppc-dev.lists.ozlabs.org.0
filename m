Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0061B2327
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 11:47:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495zHw5GwgzDqvR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 19:47:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=atP9ejV6; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=atP9ejV6; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495zG31HC8zDqnl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 19:45:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587462344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7YlUzjQkLo0H5BYCcvwstFbEoHwY4ih6fNxbEHyBvX0=;
 b=atP9ejV6+7ImGI2CQjkNd+hjE4h9niqedtb9W+X951SScJgC4xa2WDwSHc/fUeQWEPfGI9
 F89Vl1Ff1sbbdf/ONqEzATdrWg6Sprq0L1wzB5NGepR8o9ESUWzJUy6D61jNYwVfMTaLsm
 6eANUeh8XmySQJ6IDIzF3navxM0OrDQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587462344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7YlUzjQkLo0H5BYCcvwstFbEoHwY4ih6fNxbEHyBvX0=;
 b=atP9ejV6+7ImGI2CQjkNd+hjE4h9niqedtb9W+X951SScJgC4xa2WDwSHc/fUeQWEPfGI9
 F89Vl1Ff1sbbdf/ONqEzATdrWg6Sprq0L1wzB5NGepR8o9ESUWzJUy6D61jNYwVfMTaLsm
 6eANUeh8XmySQJ6IDIzF3navxM0OrDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-NpLGHwzBPpWwI4QPRhx8dw-1; Tue, 21 Apr 2020 05:45:41 -0400
X-MC-Unique: NpLGHwzBPpWwI4QPRhx8dw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E26281005509;
 Tue, 21 Apr 2020 09:45:35 +0000 (UTC)
Received: from localhost (ovpn-12-34.pek2.redhat.com [10.72.12.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C3A51001938;
 Tue, 21 Apr 2020 09:45:33 +0000 (UTC)
Date: Tue, 21 Apr 2020 17:45:30 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 03/21] mm: remove CONFIG_HAVE_MEMBLOCK_NODE_MAP option
Message-ID: <20200421094530.GB29658@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-4-rppt@kernel.org>
 <20200421042316.GQ4247@MiWiFi-R3L-srv>
 <20200421090908.GC14260@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421090908.GC14260@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/21/20 at 12:09pm, Mike Rapoport wrote:
> > > diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> > > index fc0aad0bc1f5..e67dc501576a 100644
> > > --- a/mm/memory_hotplug.c
> > > +++ b/mm/memory_hotplug.c
> > > @@ -1372,11 +1372,7 @@ check_pages_isolated_cb(unsigned long start_pfn, unsigned long nr_pages,
> > >  
> > >  static int __init cmdline_parse_movable_node(char *p)
> > >  {
> > > -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
> > >  	movable_node_enabled = true;
> > > -#else
> > > -	pr_warn("movable_node parameter depends on CONFIG_HAVE_MEMBLOCK_NODE_MAP to work properly\n");
> > > -#endif
> > 
> > Wondering if this change will impact anything. Before, those ARCHes with
> > CONFIG_HAVE_MEMBLOCK_NODE_MAP support movable_node. With this patch
> > applied, those ARCHes which don't support CONFIG_HAVE_MEMBLOCK_NODE_MAP
> > can also have 'movable_node' specified in kernel cmdline.
> > 
> > >  	return 0;
> > >  }
> > >  early_param("movable_node", cmdline_parse_movable_node);
> > > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > > index 1ac775bfc9cf..4530e9cfd9f7 100644
> > > --- a/mm/page_alloc.c
> > > +++ b/mm/page_alloc.c
> > > @@ -335,7 +335,6 @@ static unsigned long nr_kernel_pages __initdata;
> > >  static unsigned long nr_all_pages __initdata;
> > >  static unsigned long dma_reserve __initdata;
> > >  
> > > -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
> > >  static unsigned long arch_zone_lowest_possible_pfn[MAX_NR_ZONES] __initdata;
> > >  static unsigned long arch_zone_highest_possible_pfn[MAX_NR_ZONES] __initdata;
> > >  static unsigned long required_kernelcore __initdata;
> > 
> > Does it mean those ARCHes which don't support
> > CONFIG_HAVE_MEMBLOCK_NODE_MAP before, will have 'kernelcore=' and
> > 'movablecore=' now, and will have MOVABLE zone?
> 
> I hesitated a lot about whether to hide the kernelcore/movablecore and
> related code behind an #ifdef.
> In the end I've decided to keep the code compiled unconditionally as it
> is anyway __init and no sane person would pass "kernelcore=" to the
> kernel on a UMA system.

I see. Then maybe can do something if someone complains about it
in the future, e.g warn out with a message in
cmdline_parse_movable_node(), cmdline_parse_kernelcore().

> 
> > > @@ -348,7 +347,6 @@ static bool mirrored_kernelcore __meminitdata;
> > >  /* movable_zone is the "real" zone pages in ZONE_MOVABLE are taken from */
> > >  int movable_zone;
> > >  EXPORT_SYMBOL(movable_zone);
> > > -#endif /* CONFIG_HAVE_MEMBLOCK_NODE_MAP */
> > >  
> > >  #if MAX_NUMNODES > 1
> > >  unsigned int nr_node_ids __read_mostly = MAX_NUMNODES;
> > > @@ -1499,8 +1497,7 @@ void __free_pages_core(struct page *page, unsigned int order)
> > >  	__free_pages(page, order);
> > >  }
> > >  
> > > -#if defined(CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID) || \
> > > -	defined(CONFIG_HAVE_MEMBLOCK_NODE_MAP)
> > > +#ifdef CONFIG_NEED_MULTIPLE_NODES
> > >  
> > >  static struct mminit_pfnnid_cache early_pfnnid_cache __meminitdata;
> > >  
> > > @@ -1542,7 +1539,7 @@ int __meminit early_pfn_to_nid(unsigned long pfn)
> > >  
> > >  	return nid;
> > >  }
> > > -#endif
> > > +#endif /* CONFIG_NEED_MULTIPLE_NODES */
> > >  
> > >  #ifdef CONFIG_NODES_SPAN_OTHER_NODES
> > >  /* Only safe to use early in boot when initialisation is single-threaded */
> > > @@ -5924,7 +5921,6 @@ void __ref build_all_zonelists(pg_data_t *pgdat)
> > >  static bool __meminit
> > >  overlap_memmap_init(unsigned long zone, unsigned long *pfn)
> > >  {
> > > -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
> > >  	static struct memblock_region *r;
> > >  
> > >  	if (mirrored_kernelcore && zone == ZONE_MOVABLE) {
> > > @@ -5940,7 +5936,6 @@ overlap_memmap_init(unsigned long zone, unsigned long *pfn)
> > >  			return true;
> > >  		}
> > >  	}
> > > -#endif
> > >  	return false;
> > >  }
> > >  
> > > @@ -6573,8 +6568,7 @@ static unsigned long __init zone_absent_pages_in_node(int nid,
> > >  	return nr_absent;
> > >  }
> > >  
> > > -#else /* CONFIG_HAVE_MEMBLOCK_NODE_MAP */
> > > -static inline unsigned long __init zone_spanned_pages_in_node(int nid,
> > > +static inline unsigned long __init compat_zone_spanned_pages_in_node(int nid,
> > 
> > Is it compact zone which has continuous memory region, and the
> > compat here is typo? Or it's compatible zone? The name seems a little
> > confusing, or I miss something.
> 
> It's 'compat' from 'compatibility'. This is kinda "the old way" and the
> version that was defined when CONFIG_HAVE_MEMBLOCK_NODE_MAP=y is the
> "new way", so I picked 'compat' for backwards compatibility. 
> Anyway, it will go away later in pacth 19. 

Got it, thanks for telling.

> 
> > >  					unsigned long zone_type,
> > >  					unsigned long node_start_pfn,
> > >  					unsigned long node_end_pfn,
> > > @@ -6593,7 +6587,7 @@ static inline unsigned long __init zone_spanned_pages_in_node(int nid,
> > >  	return zones_size[zone_type];
> > >  }
> > >  
> > > -static inline unsigned long __init zone_absent_pages_in_node(int nid,
> > > +static inline unsigned long __init compat_zone_absent_pages_in_node(int nid,
> > >  						unsigned long zone_type,
> > >  						unsigned long node_start_pfn,
> > >  						unsigned long node_end_pfn,
> > > @@ -6605,13 +6599,12 @@ static inline unsigned long __init zone_absent_pages_in_node(int nid,
> > >  	return zholes_size[zone_type];
> > >  }
> > >  
> > > -#endif /* CONFIG_HAVE_MEMBLOCK_NODE_MAP */
> > > -
> > >  static void __init calculate_node_totalpages(struct pglist_data *pgdat,
> > >  						unsigned long node_start_pfn,
> > >  						unsigned long node_end_pfn,
> > >  						unsigned long *zones_size,
> > > -						unsigned long *zholes_size)
> > > +						unsigned long *zholes_size,
> > > +						bool compat)
> > >  {
> > >  	unsigned long realtotalpages = 0, totalpages = 0;
> > >  	enum zone_type i;
> > > @@ -6619,17 +6612,38 @@ static void __init calculate_node_totalpages(struct pglist_data *pgdat,
> > >  	for (i = 0; i < MAX_NR_ZONES; i++) {
> > >  		struct zone *zone = pgdat->node_zones + i;
> > >  		unsigned long zone_start_pfn, zone_end_pfn;
> > > +		unsigned long spanned, absent;
> > >  		unsigned long size, real_size;
> > >  
> > > -		size = zone_spanned_pages_in_node(pgdat->node_id, i,
> > > -						  node_start_pfn,
> > > -						  node_end_pfn,
> > > -						  &zone_start_pfn,
> > > -						  &zone_end_pfn,
> > > -						  zones_size);
> > > -		real_size = size - zone_absent_pages_in_node(pgdat->node_id, i,
> > > -						  node_start_pfn, node_end_pfn,
> > > -						  zholes_size);
> > > +		if (compat) {
> > > +			spanned = compat_zone_spanned_pages_in_node(
> > > +						pgdat->node_id, i,
> > > +						node_start_pfn,
> > > +						node_end_pfn,
> > > +						&zone_start_pfn,
> > > +						&zone_end_pfn,
> > > +						zones_size);
> > > +			absent = compat_zone_absent_pages_in_node(
> > > +						pgdat->node_id, i,
> > > +						node_start_pfn,
> > > +						node_end_pfn,
> > > +						zholes_size);
> > > +		} else {
> > > +			spanned = zone_spanned_pages_in_node(pgdat->node_id, i,
> > > +						node_start_pfn,
> > > +						node_end_pfn,
> > > +						&zone_start_pfn,
> > > +						&zone_end_pfn,
> > > +						zones_size);
> > > +			absent = zone_absent_pages_in_node(pgdat->node_id, i,
> > > +						node_start_pfn,
> > > +						node_end_pfn,
> > > +						zholes_size);
> > > +		}
> > > +
> > > +		size = spanned;
> > > +		real_size = size - absent;
> > > +
> > >  		if (size)
> > >  			zone->zone_start_pfn = zone_start_pfn;
> > >  		else
> > > @@ -6929,10 +6943,8 @@ static void __ref alloc_node_mem_map(struct pglist_data *pgdat)
> > >  	 */
> > >  	if (pgdat == NODE_DATA(0)) {
> > >  		mem_map = NODE_DATA(0)->node_mem_map;
> > > -#if defined(CONFIG_HAVE_MEMBLOCK_NODE_MAP) || defined(CONFIG_FLATMEM)
> > >  		if (page_to_pfn(mem_map) != pgdat->node_start_pfn)
> > >  			mem_map -= offset;
> > > -#endif /* CONFIG_HAVE_MEMBLOCK_NODE_MAP */
> > >  	}
> > >  #endif
> > >  }
> > > @@ -6949,9 +6961,10 @@ static inline void pgdat_set_deferred_range(pg_data_t *pgdat)
> > >  static inline void pgdat_set_deferred_range(pg_data_t *pgdat) {}
> > >  #endif
> > >  
> > > -void __init free_area_init_node(int nid, unsigned long *zones_size,
> > > -				   unsigned long node_start_pfn,
> > > -				   unsigned long *zholes_size)
> > > +static void __init __free_area_init_node(int nid, unsigned long *zones_size,
> > > +					 unsigned long node_start_pfn,
> > > +					 unsigned long *zholes_size,
> > > +					 bool compat)
> > >  {
> > >  	pg_data_t *pgdat = NODE_DATA(nid);
> > >  	unsigned long start_pfn = 0;
> > > @@ -6963,16 +6976,16 @@ void __init free_area_init_node(int nid, unsigned long *zones_size,
> > >  	pgdat->node_id = nid;
> > >  	pgdat->node_start_pfn = node_start_pfn;
> > >  	pgdat->per_cpu_nodestats = NULL;
> > > -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
> > > -	get_pfn_range_for_nid(nid, &start_pfn, &end_pfn);
> > > -	pr_info("Initmem setup node %d [mem %#018Lx-%#018Lx]\n", nid,
> > > -		(u64)start_pfn << PAGE_SHIFT,
> > > -		end_pfn ? ((u64)end_pfn << PAGE_SHIFT) - 1 : 0);
> > > -#else
> > > -	start_pfn = node_start_pfn;
> > > -#endif
> > > +	if (!compat) {
> > > +		get_pfn_range_for_nid(nid, &start_pfn, &end_pfn);
> > > +		pr_info("Initmem setup node %d [mem %#018Lx-%#018Lx]\n", nid,
> > > +			(u64)start_pfn << PAGE_SHIFT,
> > > +			end_pfn ? ((u64)end_pfn << PAGE_SHIFT) - 1 : 0);
> > > +	} else {
> > > +		start_pfn = node_start_pfn;
> > > +	}
> > >  	calculate_node_totalpages(pgdat, start_pfn, end_pfn,
> > > -				  zones_size, zholes_size);
> > > +				  zones_size, zholes_size, compat);
> > >  
> > >  	alloc_node_mem_map(pgdat);
> > >  	pgdat_set_deferred_range(pgdat);
> > > @@ -6980,6 +6993,14 @@ void __init free_area_init_node(int nid, unsigned long *zones_size,
> > >  	free_area_init_core(pgdat);
> > >  }
> > >  
> > > +void __init free_area_init_node(int nid, unsigned long *zones_size,
> > > +				unsigned long node_start_pfn,
> > > +				unsigned long *zholes_size)
> > > +{
> > > +	__free_area_init_node(nid, zones_size, node_start_pfn, zholes_size,
> > > +			      true);
> > > +}
> > > +
> > >  #if !defined(CONFIG_FLAT_NODE_MEM_MAP)
> > >  /*
> > >   * Initialize all valid struct pages in the range [spfn, epfn) and mark them
> > > @@ -7063,8 +7084,6 @@ static inline void __init init_unavailable_mem(void)
> > >  }
> > >  #endif /* !CONFIG_FLAT_NODE_MEM_MAP */
> > >  
> > > -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
> > > -
> > >  #if MAX_NUMNODES > 1
> > >  /*
> > >   * Figure out the number of possible node ids.
> > > @@ -7493,8 +7512,8 @@ void __init free_area_init_nodes(unsigned long *max_zone_pfn)
> > >  	init_unavailable_mem();
> > >  	for_each_online_node(nid) {
> > >  		pg_data_t *pgdat = NODE_DATA(nid);
> > > -		free_area_init_node(nid, NULL,
> > > -				find_min_pfn_for_node(nid), NULL);
> > > +		__free_area_init_node(nid, NULL,
> > > +				      find_min_pfn_for_node(nid), NULL, false);
> > >  
> > >  		/* Any memory on that node */
> > >  		if (pgdat->node_present_pages)
> > > @@ -7559,8 +7578,6 @@ static int __init cmdline_parse_movablecore(char *p)
> > >  early_param("kernelcore", cmdline_parse_kernelcore);
> > >  early_param("movablecore", cmdline_parse_movablecore);
> > >  
> > > -#endif /* CONFIG_HAVE_MEMBLOCK_NODE_MAP */
> > > -
> > >  void adjust_managed_page_count(struct page *page, long count)
> > >  {
> > >  	atomic_long_add(count, &page_zone(page)->managed_pages);
> > > -- 
> > > 2.25.1
> > > 
> > 
> 
> -- 
> Sincerely yours,
> Mike.
> 

