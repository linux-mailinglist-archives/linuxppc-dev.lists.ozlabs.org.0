Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D491B511C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 02:04:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496yGb2zHbzDqv4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 10:04:39 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=h4HdWPFm; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=h4HdWPFm; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496yDh5rwjzDqSj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 10:02:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587600176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=58JQfhRZc6FB9xi3d8SYqNSqIDMtxlavcMva87VT0e8=;
 b=h4HdWPFmRDIgBTYYGIUGf5dOl3T5nQe656xm1Gox2fi2+8/wen/KqzCfRTOmYbqLmxxqGI
 rIrb+gnasJZW62ZLRDwVnJy0PPqLqwrx+uziwmJ8zX1NG04kpdmql51yn11jSREeYKFuqs
 uHOpQFIxJY++uF0XN/v9+K8a5BZlRXo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587600176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=58JQfhRZc6FB9xi3d8SYqNSqIDMtxlavcMva87VT0e8=;
 b=h4HdWPFmRDIgBTYYGIUGf5dOl3T5nQe656xm1Gox2fi2+8/wen/KqzCfRTOmYbqLmxxqGI
 rIrb+gnasJZW62ZLRDwVnJy0PPqLqwrx+uziwmJ8zX1NG04kpdmql51yn11jSREeYKFuqs
 uHOpQFIxJY++uF0XN/v9+K8a5BZlRXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88--gGNncP1O_Gl0ijAAoAtsQ-1; Wed, 22 Apr 2020 20:02:53 -0400
X-MC-Unique: -gGNncP1O_Gl0ijAAoAtsQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F54D18FF661;
 Thu, 23 Apr 2020 00:02:47 +0000 (UTC)
Received: from localhost (ovpn-12-37.pek2.redhat.com [10.72.12.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C89D21002383;
 Thu, 23 Apr 2020 00:02:44 +0000 (UTC)
Date: Thu, 23 Apr 2020 08:02:42 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 05/21] mm: use free_area_init() instead of
 free_area_init_nodes()
Message-ID: <20200423000242.GX4247@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-6-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200412194859.12663-6-rppt@kernel.org>
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

On 04/12/20 at 10:48pm, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The free_area_init() has effectively became a wrapper for
> free_area_init_nodes() and there is no point of keeping it. Still
> free_area_init() name is shorter and more general as it does not imply
> necessity to initialize multiple nodes.
> 
> Rename free_area_init_nodes() to free_area_init(), update the callers and
> drop old version of free_area_init().
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/arm64/mm/init.c             |  2 +-
>  arch/ia64/mm/contig.c            |  2 +-
>  arch/ia64/mm/discontig.c         |  2 +-
>  arch/microblaze/mm/init.c        |  2 +-
>  arch/mips/loongson64/numa.c      |  2 +-
>  arch/mips/mm/init.c              |  2 +-
>  arch/mips/sgi-ip27/ip27-memory.c |  2 +-
>  arch/powerpc/mm/mem.c            |  2 +-
>  arch/riscv/mm/init.c             |  2 +-
>  arch/s390/mm/init.c              |  2 +-
>  arch/sh/mm/init.c                |  2 +-
>  arch/sparc/mm/init_64.c          |  2 +-
>  arch/x86/mm/init.c               |  2 +-
>  include/linux/mm.h               |  7 +++----
>  mm/page_alloc.c                  | 10 ++--------
>  15 files changed, 18 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index e42727e3568e..a650adb358ee 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -206,7 +206,7 @@ static void __init zone_sizes_init(unsigned long min, unsigned long max)
>  #endif
>  	max_zone_pfns[ZONE_NORMAL] = max;
>  
> -	free_area_init_nodes(max_zone_pfns);
> +	free_area_init(max_zone_pfns);
>  }
>  
>  #else
> diff --git a/arch/ia64/mm/contig.c b/arch/ia64/mm/contig.c
> index 5b00dc3898e1..8786fa5c7612 100644
> --- a/arch/ia64/mm/contig.c
> +++ b/arch/ia64/mm/contig.c
> @@ -210,6 +210,6 @@ paging_init (void)
>  		printk("Virtual mem_map starts at 0x%p\n", mem_map);
>  	}
>  #endif /* !CONFIG_VIRTUAL_MEM_MAP */
> -	free_area_init_nodes(max_zone_pfns);
> +	free_area_init(max_zone_pfns);
>  	zero_page_memmap_ptr = virt_to_page(ia64_imva(empty_zero_page));
>  }
> diff --git a/arch/ia64/mm/discontig.c b/arch/ia64/mm/discontig.c
> index 4f33f6e7e206..dd8284bcbf16 100644
> --- a/arch/ia64/mm/discontig.c
> +++ b/arch/ia64/mm/discontig.c
> @@ -627,7 +627,7 @@ void __init paging_init(void)
>  	max_zone_pfns[ZONE_DMA32] = max_dma;
>  #endif
>  	max_zone_pfns[ZONE_NORMAL] = max_pfn;
> -	free_area_init_nodes(max_zone_pfns);
> +	free_area_init(max_zone_pfns);
>  
>  	zero_page_memmap_ptr = virt_to_page(ia64_imva(empty_zero_page));
>  }
> diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
> index 1ffbfa96b9b8..dcaa53d11339 100644
> --- a/arch/microblaze/mm/init.c
> +++ b/arch/microblaze/mm/init.c
> @@ -112,7 +112,7 @@ static void __init paging_init(void)
>  #endif
>  
>  	/* We don't have holes in memory map */
> -	free_area_init_nodes(zones_size);
> +	free_area_init(zones_size);
>  }
>  
>  void __init setup_memory(void)
> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> index 1ae072df4831..901f5be5ee76 100644
> --- a/arch/mips/loongson64/numa.c
> +++ b/arch/mips/loongson64/numa.c
> @@ -247,7 +247,7 @@ void __init paging_init(void)
>  	zones_size[ZONE_DMA32] = MAX_DMA32_PFN;
>  #endif
>  	zones_size[ZONE_NORMAL] = max_low_pfn;
> -	free_area_init_nodes(zones_size);
> +	free_area_init(zones_size);
>  }
>  
>  void __init mem_init(void)
> diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
> index 79684000de0e..19719e8b41a5 100644
> --- a/arch/mips/mm/init.c
> +++ b/arch/mips/mm/init.c
> @@ -418,7 +418,7 @@ void __init paging_init(void)
>  	}
>  #endif
>  
> -	free_area_init_nodes(max_zone_pfns);
> +	free_area_init(max_zone_pfns);
>  }
>  
>  #ifdef CONFIG_64BIT
> diff --git a/arch/mips/sgi-ip27/ip27-memory.c b/arch/mips/sgi-ip27/ip27-memory.c
> index a45691e6ab90..1213215ea965 100644
> --- a/arch/mips/sgi-ip27/ip27-memory.c
> +++ b/arch/mips/sgi-ip27/ip27-memory.c
> @@ -419,7 +419,7 @@ void __init paging_init(void)
>  
>  	pagetable_init();
>  	zones_size[ZONE_NORMAL] = max_low_pfn;
> -	free_area_init_nodes(zones_size);
> +	free_area_init(zones_size);
>  }
>  
>  void __init mem_init(void)
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 041ed7cfd341..0fcea21f26b4 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -271,7 +271,7 @@ void __init paging_init(void)
>  	max_zone_pfns[ZONE_HIGHMEM] = max_pfn;
>  #endif
>  
> -	free_area_init_nodes(max_zone_pfns);
> +	free_area_init(max_zone_pfns);
>  
>  	mark_nonram_nosave();
>  }
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index b55be44ff9bd..f2ceab77b8e6 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -39,7 +39,7 @@ static void __init zone_sizes_init(void)
>  #endif
>  	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
>  
> -	free_area_init_nodes(max_zone_pfns);
> +	free_area_init(max_zone_pfns);
>  }
>  
>  static void setup_zero_page(void)
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index 87b2d024e75a..b11bcf4da531 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -122,7 +122,7 @@ void __init paging_init(void)
>  	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
>  	max_zone_pfns[ZONE_DMA] = PFN_DOWN(MAX_DMA_ADDRESS);
>  	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> -	free_area_init_nodes(max_zone_pfns);
> +	free_area_init(max_zone_pfns);
>  }
>  
>  void mark_rodata_ro(void)
> diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
> index b9de2d4fa57e..2573b163b3ab 100644
> --- a/arch/sh/mm/init.c
> +++ b/arch/sh/mm/init.c
> @@ -334,7 +334,7 @@ void __init paging_init(void)
>  
>  	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
>  	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
> -	free_area_init_nodes(max_zone_pfns);
> +	free_area_init(max_zone_pfns);
>  }
>  
>  unsigned int mem_init_done = 0;
> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index 1cf0d666dea3..79d3c5e0802e 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -2488,7 +2488,7 @@ void __init paging_init(void)
>  
>  		max_zone_pfns[ZONE_NORMAL] = end_pfn;
>  
> -		free_area_init_nodes(max_zone_pfns);
> +		free_area_init(max_zone_pfns);
>  	}
>  
>  	printk("Booting Linux...\n");
> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> index 1bba16c5742b..4016f2bf5d87 100644
> --- a/arch/x86/mm/init.c
> +++ b/arch/x86/mm/init.c
> @@ -949,7 +949,7 @@ void __init zone_sizes_init(void)
>  	max_zone_pfns[ZONE_HIGHMEM]	= max_pfn;
>  #endif
>  
> -	free_area_init_nodes(max_zone_pfns);
> +	free_area_init(max_zone_pfns);
>  }
>  
>  __visible DEFINE_PER_CPU_SHARED_ALIGNED(struct tlb_state, cpu_tlbstate) = {
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index d9a256a97ac5..1c2ecb42e043 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2272,7 +2272,6 @@ static inline spinlock_t *pud_lock(struct mm_struct *mm, pud_t *pud)
>  }
>  
>  extern void __init pagecache_init(void);
> -extern void free_area_init(unsigned long * max_zone_pfn);
>  extern void __init free_area_init_node(int nid, unsigned long * zones_size,
>  		unsigned long zone_start_pfn, unsigned long *zholes_size);
>  extern void free_initmem(void);
> @@ -2353,21 +2352,21 @@ static inline unsigned long get_num_physpages(void)
>   *
>   * An architecture is expected to register range of page frames backed by
>   * physical memory with memblock_add[_node]() before calling
> - * free_area_init_nodes() passing in the PFN each zone ends at. At a basic
> + * free_area_init() passing in the PFN each zone ends at. At a basic
>   * usage, an architecture is expected to do something like
>   *
>   * unsigned long max_zone_pfns[MAX_NR_ZONES] = {max_dma, max_normal_pfn,
>   * 							 max_highmem_pfn};
>   * for_each_valid_physical_page_range()
>   * 	memblock_add_node(base, size, nid)
> - * free_area_init_nodes(max_zone_pfns);
> + * free_area_init(max_zone_pfns);
>   *
>   * free_bootmem_with_active_regions() calls free_bootmem_node() for each
>   * registered physical page range.  Similarly
>   * sparse_memory_present_with_active_regions() calls memory_present() for
>   * each range when SPARSEMEM is enabled.
>   */
> -extern void free_area_init_nodes(unsigned long *max_zone_pfn);
> +void free_area_init(unsigned long *max_zone_pfn);
>  unsigned long node_map_pfn_alignment(void);
>  unsigned long __absent_pages_in_range(int nid, unsigned long start_pfn,
>  						unsigned long end_pfn);
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 530701b38bc7..7f6a3081edb8 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -7428,7 +7428,7 @@ static void check_for_memory(pg_data_t *pgdat, int nid)
>  }
>  
>  /**
> - * free_area_init_nodes - Initialise all pg_data_t and zone data
> + * free_area_init - Initialise all pg_data_t and zone data
>   * @max_zone_pfn: an array of max PFNs for each zone
>   *
>   * This will call free_area_init_node() for each active node in the system.
               It's __free_area_init_node() here being called, while
it dosn't matter much because it's updated in later patch.
> @@ -7440,7 +7440,7 @@ static void check_for_memory(pg_data_t *pgdat, int nid)
>   * starts where the previous one ended. For example, ZONE_DMA32 starts
>   * at arch_max_dma_pfn.
>   */
> -void __init free_area_init_nodes(unsigned long *max_zone_pfn)
> +void __init free_area_init(unsigned long *max_zone_pfn)
>  {
>  	unsigned long start_pfn, end_pfn;
>  	int i, nid;
> @@ -7700,12 +7700,6 @@ void __init set_dma_reserve(unsigned long new_dma_reserve)
>  	dma_reserve = new_dma_reserve;
>  }
>  
> -void __init free_area_init(unsigned long *max_zone_pfn)
> -{
> -	init_unavailable_mem();
> -	free_area_init_nodes(max_zone_pfn);
> -}
> -
>  static int page_alloc_cpu_dead(unsigned int cpu)
>  {

Reviewed-by: Baoquan He <bhe@redhat.com>

>  
> -- 
> 2.25.1
> 

