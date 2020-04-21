Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4171B1D90
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 06:25:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495r8872bKzDqbY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 14:25:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bhe@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=hou0/G3h; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=hou0/G3h; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495r6P3crzzDqHY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 14:23:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587443018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JaieFtrynku5iULCPSegJfHOzOMnZqOFIqChb4nr18M=;
 b=hou0/G3hjxMsovSWTbA2YtOzZvfxbmIVq++obiJzXe+JaA2w3K/YUr5pQYjTGBRZHepNFO
 K3cXQmD5K3Umt/fbiy2kZKWj1P+XnM83ArzxarOGGxKXq3e5kFhzBfiHEAZoZa+EJoNlqF
 V/X3a3hk7M0NilfngHqRKDkIz7kpHoE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587443018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JaieFtrynku5iULCPSegJfHOzOMnZqOFIqChb4nr18M=;
 b=hou0/G3hjxMsovSWTbA2YtOzZvfxbmIVq++obiJzXe+JaA2w3K/YUr5pQYjTGBRZHepNFO
 K3cXQmD5K3Umt/fbiy2kZKWj1P+XnM83ArzxarOGGxKXq3e5kFhzBfiHEAZoZa+EJoNlqF
 V/X3a3hk7M0NilfngHqRKDkIz7kpHoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-7AL0EMq3NX6ay4HJGU29Lg-1; Tue, 21 Apr 2020 00:23:36 -0400
X-MC-Unique: 7AL0EMq3NX6ay4HJGU29Lg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABAEF1005509;
 Tue, 21 Apr 2020 04:23:23 +0000 (UTC)
Received: from localhost (ovpn-12-34.pek2.redhat.com [10.72.12.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C21715DA76;
 Tue, 21 Apr 2020 04:23:20 +0000 (UTC)
Date: Tue, 21 Apr 2020 12:23:16 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 03/21] mm: remove CONFIG_HAVE_MEMBLOCK_NODE_MAP option
Message-ID: <20200421042316.GQ4247@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-4-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200412194859.12663-4-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On 04/12/20 at 10:48pm, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The CONFIG_HAVE_MEMBLOCK_NODE_MAP is used to differentiate initialization
> of nodes and zones structures between the systems that have region to node
> mapping in memblock and those that don't.
> 
> Currently all the NUMA architectures enable this option and for the
> non-NUMA systems we can presume that all the memory belongs to node 0 and
> therefore the compile time configuration option is not required.
> 
> The remaining few architectures that use DISCONTIGMEM without NUMA are
> easily updated to use memblock_add_node() instead of memblock_add() and
> thus have proper correspondence of memblock regions to NUMA nodes.
> 
> Still, free_area_init_node() must have a backward compatible version
> because its semantics with and without CONFIG_HAVE_MEMBLOCK_NODE_MAP is
> different. Once all the architectures will use the new semantics, the
> entire compatibility layer can be dropped.
> 
> To avoid addition of extra run time memory to store node id for
> architectures that keep memblock but have only a single node, the node id
> field of the memblock_region is guarded by CONFIG_NEED_MULTIPLE_NODES and
> the corresponding accessors presume that in those cases it is always 0.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
...
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index 6bc37a731d27..45abfc54da37 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -50,7 +50,7 @@ struct memblock_region {
>  	phys_addr_t base;
>  	phys_addr_t size;
>  	enum memblock_flags flags;
> -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
> +#ifdef CONFIG_NEED_MULTIPLE_NODES
>  	int nid;
>  #endif
>  };
> @@ -215,7 +215,6 @@ static inline bool memblock_is_nomap(struct memblock_region *m)
>  	return m->flags & MEMBLOCK_NOMAP;
>  }
>  
> -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
>  int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
>  			    unsigned long  *end_pfn);
>  void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
> @@ -234,7 +233,6 @@ void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
>  #define for_each_mem_pfn_range(i, nid, p_start, p_end, p_nid)		\
>  	for (i = -1, __next_mem_pfn_range(&i, nid, p_start, p_end, p_nid); \
>  	     i >= 0; __next_mem_pfn_range(&i, nid, p_start, p_end, p_nid))
> -#endif /* CONFIG_HAVE_MEMBLOCK_NODE_MAP */
>  
>  #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
>  void __next_mem_pfn_range_in_zone(u64 *idx, struct zone *zone,
> @@ -310,10 +308,10 @@ void __next_mem_pfn_range_in_zone(u64 *idx, struct zone *zone,
>  	for_each_mem_range_rev(i, &memblock.memory, &memblock.reserved,	\
>  			       nid, flags, p_start, p_end, p_nid)
>  
> -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
>  int memblock_set_node(phys_addr_t base, phys_addr_t size,
>  		      struct memblock_type *type, int nid);
>  
> +#ifdef CONFIG_NEED_MULTIPLE_NODES
>  static inline void memblock_set_region_node(struct memblock_region *r, int nid)
>  {
>  	r->nid = nid;
> @@ -332,7 +330,7 @@ static inline int memblock_get_region_node(const struct memblock_region *r)
>  {
>  	return 0;
>  }
> -#endif /* CONFIG_HAVE_MEMBLOCK_NODE_MAP */
> +#endif /* CONFIG_NEED_MULTIPLE_NODES */
>  
>  /* Flags for memblock allocation APIs */
>  #define MEMBLOCK_ALLOC_ANYWHERE	(~(phys_addr_t)0)
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index a404026d14d4..5903bbbdb336 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2344,9 +2344,8 @@ static inline unsigned long get_num_physpages(void)
>  	return phys_pages;
>  }
>  
> -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
>  /*
> - * With CONFIG_HAVE_MEMBLOCK_NODE_MAP set, an architecture may initialise its
> + * Using memblock node mappings, an architecture may initialise its
>   * zones, allocate the backing mem_map and account for memory holes in a more
>   * architecture independent manner. This is a substitute for creating the
>   * zone_sizes[] and zholes_size[] arrays and passing them to
> @@ -2367,9 +2366,6 @@ static inline unsigned long get_num_physpages(void)
>   * registered physical page range.  Similarly
>   * sparse_memory_present_with_active_regions() calls memory_present() for
>   * each range when SPARSEMEM is enabled.
> - *
> - * See mm/page_alloc.c for more information on each function exposed by
> - * CONFIG_HAVE_MEMBLOCK_NODE_MAP.
>   */
>  extern void free_area_init_nodes(unsigned long *max_zone_pfn);
>  unsigned long node_map_pfn_alignment(void);
> @@ -2384,13 +2380,9 @@ extern void free_bootmem_with_active_regions(int nid,
>  						unsigned long max_low_pfn);
>  extern void sparse_memory_present_with_active_regions(int nid);
>  
> -#endif /* CONFIG_HAVE_MEMBLOCK_NODE_MAP */
> -
> -#if !defined(CONFIG_HAVE_MEMBLOCK_NODE_MAP) && \
> -    !defined(CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID)
> +#ifndef CONFIG_NEED_MULTIPLE_NODES
>  static inline int early_pfn_to_nid(unsigned long pfn)
>  {
> -	BUILD_BUG_ON(IS_ENABLED(CONFIG_NUMA));
>  	return 0;
>  }
>  #else
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 7b5b6eba402f..ffc2a3d6036b 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -874,7 +874,7 @@ extern int movable_zone;
>  #ifdef CONFIG_HIGHMEM
>  static inline int zone_movable_is_highmem(void)
>  {
> -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
> +#ifdef CONFIG_NEED_MULTIPLE_NODES
>  	return movable_zone == ZONE_HIGHMEM;
>  #else
>  	return (ZONE_MOVABLE - 1) == ZONE_HIGHMEM;

If CONFIG_HIGHMEM is enabled, the above judgement is always true,
wondering what's the purpose we have to do like this. It's not related
to this patch though.

> diff --git a/mm/Kconfig b/mm/Kconfig
> index c1acc34c1c35..aaa5bdaa1c8a 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -126,9 +126,6 @@ config SPARSEMEM_VMEMMAP
>  	  pfn_to_page and page_to_pfn operations.  This is the most
>  	  efficient option when sufficient kernel resources are available.
>  
> -config HAVE_MEMBLOCK_NODE_MAP
> -	bool
> -
>  config HAVE_MEMBLOCK_PHYS_MAP
>  	bool
>  
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 43e2fd3006c1..743659d88fc4 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -620,7 +620,7 @@ static int __init_memblock memblock_add_range(struct memblock_type *type,
>  		 * area, insert that portion.
>  		 */
>  		if (rbase > base) {
> -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
> +#ifdef CONFIG_NEED_MULTIPLE_NODES
>  			WARN_ON(nid != memblock_get_region_node(rgn));
>  #endif
>  			WARN_ON(flags != rgn->flags);
> @@ -1197,7 +1197,6 @@ void __init_memblock __next_mem_range_rev(u64 *idx, int nid,
>  	*idx = ULLONG_MAX;
>  }
>  
> -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
>  /*
>   * Common iterator interface used to define for_each_mem_pfn_range().
>   */
> @@ -1247,6 +1246,7 @@ void __init_memblock __next_mem_pfn_range(int *idx, int nid,
>  int __init_memblock memblock_set_node(phys_addr_t base, phys_addr_t size,
>  				      struct memblock_type *type, int nid)
>  {
> +#ifdef CONFIG_NEED_MULTIPLE_NODES
>  	int start_rgn, end_rgn;
>  	int i, ret;
>  
> @@ -1258,9 +1258,10 @@ int __init_memblock memblock_set_node(phys_addr_t base, phys_addr_t size,
>  		memblock_set_region_node(&type->regions[i], nid);
>  
>  	memblock_merge_regions(type);
> +#endif
>  	return 0;
>  }
> -#endif /* CONFIG_HAVE_MEMBLOCK_NODE_MAP */
> +
>  #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
>  /**
>   * __next_mem_pfn_range_in_zone - iterator for for_each_*_range_in_zone()
> @@ -1799,7 +1800,6 @@ bool __init_memblock memblock_is_map_memory(phys_addr_t addr)
>  	return !memblock_is_nomap(&memblock.memory.regions[i]);
>  }
>  
> -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
>  int __init_memblock memblock_search_pfn_nid(unsigned long pfn,
>  			 unsigned long *start_pfn, unsigned long *end_pfn)
>  {
> @@ -1814,7 +1814,6 @@ int __init_memblock memblock_search_pfn_nid(unsigned long pfn,
>  
>  	return memblock_get_region_node(&type->regions[mid]);
>  }
> -#endif
>  
>  /**
>   * memblock_is_region_memory - check if a region is a subset of memory
> @@ -1905,7 +1904,7 @@ static void __init_memblock memblock_dump(struct memblock_type *type)
>  		size = rgn->size;
>  		end = base + size - 1;
>  		flags = rgn->flags;
> -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
> +#ifdef CONFIG_NEED_MULTIPLE_NODES
>  		if (memblock_get_region_node(rgn) != MAX_NUMNODES)
>  			snprintf(nid_buf, sizeof(nid_buf), " on node %d",
>  				 memblock_get_region_node(rgn));
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index fc0aad0bc1f5..e67dc501576a 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1372,11 +1372,7 @@ check_pages_isolated_cb(unsigned long start_pfn, unsigned long nr_pages,
>  
>  static int __init cmdline_parse_movable_node(char *p)
>  {
> -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
>  	movable_node_enabled = true;
> -#else
> -	pr_warn("movable_node parameter depends on CONFIG_HAVE_MEMBLOCK_NODE_MAP to work properly\n");
> -#endif

Wondering if this change will impact anything. Before, those ARCHes with
CONFIG_HAVE_MEMBLOCK_NODE_MAP support movable_node. With this patch
applied, those ARCHes which don't support CONFIG_HAVE_MEMBLOCK_NODE_MAP
can also have 'movable_node' specified in kernel cmdline.

>  	return 0;
>  }
>  early_param("movable_node", cmdline_parse_movable_node);
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 1ac775bfc9cf..4530e9cfd9f7 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -335,7 +335,6 @@ static unsigned long nr_kernel_pages __initdata;
>  static unsigned long nr_all_pages __initdata;
>  static unsigned long dma_reserve __initdata;
>  
> -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
>  static unsigned long arch_zone_lowest_possible_pfn[MAX_NR_ZONES] __initdata;
>  static unsigned long arch_zone_highest_possible_pfn[MAX_NR_ZONES] __initdata;
>  static unsigned long required_kernelcore __initdata;

Does it mean those ARCHes which don't support
CONFIG_HAVE_MEMBLOCK_NODE_MAP before, will have 'kernelcore=' and
'movablecore=' now, and will have MOVABLE zone?

> @@ -348,7 +347,6 @@ static bool mirrored_kernelcore __meminitdata;
>  /* movable_zone is the "real" zone pages in ZONE_MOVABLE are taken from */
>  int movable_zone;
>  EXPORT_SYMBOL(movable_zone);
> -#endif /* CONFIG_HAVE_MEMBLOCK_NODE_MAP */
>  
>  #if MAX_NUMNODES > 1
>  unsigned int nr_node_ids __read_mostly = MAX_NUMNODES;
> @@ -1499,8 +1497,7 @@ void __free_pages_core(struct page *page, unsigned int order)
>  	__free_pages(page, order);
>  }
>  
> -#if defined(CONFIG_HAVE_ARCH_EARLY_PFN_TO_NID) || \
> -	defined(CONFIG_HAVE_MEMBLOCK_NODE_MAP)
> +#ifdef CONFIG_NEED_MULTIPLE_NODES
>  
>  static struct mminit_pfnnid_cache early_pfnnid_cache __meminitdata;
>  
> @@ -1542,7 +1539,7 @@ int __meminit early_pfn_to_nid(unsigned long pfn)
>  
>  	return nid;
>  }
> -#endif
> +#endif /* CONFIG_NEED_MULTIPLE_NODES */
>  
>  #ifdef CONFIG_NODES_SPAN_OTHER_NODES
>  /* Only safe to use early in boot when initialisation is single-threaded */
> @@ -5924,7 +5921,6 @@ void __ref build_all_zonelists(pg_data_t *pgdat)
>  static bool __meminit
>  overlap_memmap_init(unsigned long zone, unsigned long *pfn)
>  {
> -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
>  	static struct memblock_region *r;
>  
>  	if (mirrored_kernelcore && zone == ZONE_MOVABLE) {
> @@ -5940,7 +5936,6 @@ overlap_memmap_init(unsigned long zone, unsigned long *pfn)
>  			return true;
>  		}
>  	}
> -#endif
>  	return false;
>  }
>  
> @@ -6573,8 +6568,7 @@ static unsigned long __init zone_absent_pages_in_node(int nid,
>  	return nr_absent;
>  }
>  
> -#else /* CONFIG_HAVE_MEMBLOCK_NODE_MAP */
> -static inline unsigned long __init zone_spanned_pages_in_node(int nid,
> +static inline unsigned long __init compat_zone_spanned_pages_in_node(int nid,

Is it compact zone which has continuous memory region, and the
compat here is typo? Or it's compatible zone? The name seems a little
confusing, or I miss something.

>  					unsigned long zone_type,
>  					unsigned long node_start_pfn,
>  					unsigned long node_end_pfn,
> @@ -6593,7 +6587,7 @@ static inline unsigned long __init zone_spanned_pages_in_node(int nid,
>  	return zones_size[zone_type];
>  }
>  
> -static inline unsigned long __init zone_absent_pages_in_node(int nid,
> +static inline unsigned long __init compat_zone_absent_pages_in_node(int nid,
>  						unsigned long zone_type,
>  						unsigned long node_start_pfn,
>  						unsigned long node_end_pfn,
> @@ -6605,13 +6599,12 @@ static inline unsigned long __init zone_absent_pages_in_node(int nid,
>  	return zholes_size[zone_type];
>  }
>  
> -#endif /* CONFIG_HAVE_MEMBLOCK_NODE_MAP */
> -
>  static void __init calculate_node_totalpages(struct pglist_data *pgdat,
>  						unsigned long node_start_pfn,
>  						unsigned long node_end_pfn,
>  						unsigned long *zones_size,
> -						unsigned long *zholes_size)
> +						unsigned long *zholes_size,
> +						bool compat)
>  {
>  	unsigned long realtotalpages = 0, totalpages = 0;
>  	enum zone_type i;
> @@ -6619,17 +6612,38 @@ static void __init calculate_node_totalpages(struct pglist_data *pgdat,
>  	for (i = 0; i < MAX_NR_ZONES; i++) {
>  		struct zone *zone = pgdat->node_zones + i;
>  		unsigned long zone_start_pfn, zone_end_pfn;
> +		unsigned long spanned, absent;
>  		unsigned long size, real_size;
>  
> -		size = zone_spanned_pages_in_node(pgdat->node_id, i,
> -						  node_start_pfn,
> -						  node_end_pfn,
> -						  &zone_start_pfn,
> -						  &zone_end_pfn,
> -						  zones_size);
> -		real_size = size - zone_absent_pages_in_node(pgdat->node_id, i,
> -						  node_start_pfn, node_end_pfn,
> -						  zholes_size);
> +		if (compat) {
> +			spanned = compat_zone_spanned_pages_in_node(
> +						pgdat->node_id, i,
> +						node_start_pfn,
> +						node_end_pfn,
> +						&zone_start_pfn,
> +						&zone_end_pfn,
> +						zones_size);
> +			absent = compat_zone_absent_pages_in_node(
> +						pgdat->node_id, i,
> +						node_start_pfn,
> +						node_end_pfn,
> +						zholes_size);
> +		} else {
> +			spanned = zone_spanned_pages_in_node(pgdat->node_id, i,
> +						node_start_pfn,
> +						node_end_pfn,
> +						&zone_start_pfn,
> +						&zone_end_pfn,
> +						zones_size);
> +			absent = zone_absent_pages_in_node(pgdat->node_id, i,
> +						node_start_pfn,
> +						node_end_pfn,
> +						zholes_size);
> +		}
> +
> +		size = spanned;
> +		real_size = size - absent;
> +
>  		if (size)
>  			zone->zone_start_pfn = zone_start_pfn;
>  		else
> @@ -6929,10 +6943,8 @@ static void __ref alloc_node_mem_map(struct pglist_data *pgdat)
>  	 */
>  	if (pgdat == NODE_DATA(0)) {
>  		mem_map = NODE_DATA(0)->node_mem_map;
> -#if defined(CONFIG_HAVE_MEMBLOCK_NODE_MAP) || defined(CONFIG_FLATMEM)
>  		if (page_to_pfn(mem_map) != pgdat->node_start_pfn)
>  			mem_map -= offset;
> -#endif /* CONFIG_HAVE_MEMBLOCK_NODE_MAP */
>  	}
>  #endif
>  }
> @@ -6949,9 +6961,10 @@ static inline void pgdat_set_deferred_range(pg_data_t *pgdat)
>  static inline void pgdat_set_deferred_range(pg_data_t *pgdat) {}
>  #endif
>  
> -void __init free_area_init_node(int nid, unsigned long *zones_size,
> -				   unsigned long node_start_pfn,
> -				   unsigned long *zholes_size)
> +static void __init __free_area_init_node(int nid, unsigned long *zones_size,
> +					 unsigned long node_start_pfn,
> +					 unsigned long *zholes_size,
> +					 bool compat)
>  {
>  	pg_data_t *pgdat = NODE_DATA(nid);
>  	unsigned long start_pfn = 0;
> @@ -6963,16 +6976,16 @@ void __init free_area_init_node(int nid, unsigned long *zones_size,
>  	pgdat->node_id = nid;
>  	pgdat->node_start_pfn = node_start_pfn;
>  	pgdat->per_cpu_nodestats = NULL;
> -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
> -	get_pfn_range_for_nid(nid, &start_pfn, &end_pfn);
> -	pr_info("Initmem setup node %d [mem %#018Lx-%#018Lx]\n", nid,
> -		(u64)start_pfn << PAGE_SHIFT,
> -		end_pfn ? ((u64)end_pfn << PAGE_SHIFT) - 1 : 0);
> -#else
> -	start_pfn = node_start_pfn;
> -#endif
> +	if (!compat) {
> +		get_pfn_range_for_nid(nid, &start_pfn, &end_pfn);
> +		pr_info("Initmem setup node %d [mem %#018Lx-%#018Lx]\n", nid,
> +			(u64)start_pfn << PAGE_SHIFT,
> +			end_pfn ? ((u64)end_pfn << PAGE_SHIFT) - 1 : 0);
> +	} else {
> +		start_pfn = node_start_pfn;
> +	}
>  	calculate_node_totalpages(pgdat, start_pfn, end_pfn,
> -				  zones_size, zholes_size);
> +				  zones_size, zholes_size, compat);
>  
>  	alloc_node_mem_map(pgdat);
>  	pgdat_set_deferred_range(pgdat);
> @@ -6980,6 +6993,14 @@ void __init free_area_init_node(int nid, unsigned long *zones_size,
>  	free_area_init_core(pgdat);
>  }
>  
> +void __init free_area_init_node(int nid, unsigned long *zones_size,
> +				unsigned long node_start_pfn,
> +				unsigned long *zholes_size)
> +{
> +	__free_area_init_node(nid, zones_size, node_start_pfn, zholes_size,
> +			      true);
> +}
> +
>  #if !defined(CONFIG_FLAT_NODE_MEM_MAP)
>  /*
>   * Initialize all valid struct pages in the range [spfn, epfn) and mark them
> @@ -7063,8 +7084,6 @@ static inline void __init init_unavailable_mem(void)
>  }
>  #endif /* !CONFIG_FLAT_NODE_MEM_MAP */
>  
> -#ifdef CONFIG_HAVE_MEMBLOCK_NODE_MAP
> -
>  #if MAX_NUMNODES > 1
>  /*
>   * Figure out the number of possible node ids.
> @@ -7493,8 +7512,8 @@ void __init free_area_init_nodes(unsigned long *max_zone_pfn)
>  	init_unavailable_mem();
>  	for_each_online_node(nid) {
>  		pg_data_t *pgdat = NODE_DATA(nid);
> -		free_area_init_node(nid, NULL,
> -				find_min_pfn_for_node(nid), NULL);
> +		__free_area_init_node(nid, NULL,
> +				      find_min_pfn_for_node(nid), NULL, false);
>  
>  		/* Any memory on that node */
>  		if (pgdat->node_present_pages)
> @@ -7559,8 +7578,6 @@ static int __init cmdline_parse_movablecore(char *p)
>  early_param("kernelcore", cmdline_parse_kernelcore);
>  early_param("movablecore", cmdline_parse_movablecore);
>  
> -#endif /* CONFIG_HAVE_MEMBLOCK_NODE_MAP */
> -
>  void adjust_managed_page_count(struct page *page, long count)
>  {
>  	atomic_long_add(count, &page_zone(page)->managed_pages);
> -- 
> 2.25.1
> 

