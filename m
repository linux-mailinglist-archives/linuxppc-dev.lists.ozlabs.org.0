Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D14831B50F8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 01:43:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496xpM70PqzDqwr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Apr 2020 09:43:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81; helo=us-smtp-1.mimecast.com;
 envelope-from=bhe@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=fCBBU3Yd; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=fCBBU3Yd; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496xmj3xfgzDqDV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Apr 2020 09:42:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587598928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ANQ58+lcIOABHJ3sRvOAg0G6V1eFGiJXpPlbhIDjOhg=;
 b=fCBBU3YdLC5rjwq3zGJIsg8wqXQi41K1zcIY+t4JEBh3FZ/bGlDekBe6mmg5yJGxUcjMBu
 t/J97UWAipV6ofL4qsBn2+7EdxeV25vlOimHSMlTlszk+zK7h3PTFJw0L5Fxxx7/BAWCAg
 /qnjUhyhWPK5sjyADJAdkBfUDnRMvCY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587598928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ANQ58+lcIOABHJ3sRvOAg0G6V1eFGiJXpPlbhIDjOhg=;
 b=fCBBU3YdLC5rjwq3zGJIsg8wqXQi41K1zcIY+t4JEBh3FZ/bGlDekBe6mmg5yJGxUcjMBu
 t/J97UWAipV6ofL4qsBn2+7EdxeV25vlOimHSMlTlszk+zK7h3PTFJw0L5Fxxx7/BAWCAg
 /qnjUhyhWPK5sjyADJAdkBfUDnRMvCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-lumEu4xvNdy0rV4ShKWfOg-1; Wed, 22 Apr 2020 19:42:06 -0400
X-MC-Unique: lumEu4xvNdy0rV4ShKWfOg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D741418C8C0D;
 Wed, 22 Apr 2020 23:41:57 +0000 (UTC)
Received: from localhost (ovpn-12-37.pek2.redhat.com [10.72.12.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53EE919C69;
 Wed, 22 Apr 2020 23:41:52 +0000 (UTC)
Date: Thu, 23 Apr 2020 07:41:49 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 04/21] mm: free_area_init: use maximal zone PFNs rather
 than zone sizes
Message-ID: <20200422234149.GW4247@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-5-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200412194859.12663-5-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
> Currently, architectures that use free_area_init() to initialize memory map
> and node and zone structures need to calculate zone and hole sizes. We can
> use free_area_init_nodes() instead and let it detect the zone boundaries
> while the architectures will only have to supply the possible limits for
> the zones.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/alpha/mm/init.c    | 16 ++++++----------
>  arch/c6x/mm/init.c      |  8 +++-----
>  arch/h8300/mm/init.c    |  6 +++---
>  arch/hexagon/mm/init.c  |  6 +++---
>  arch/m68k/mm/init.c     |  6 +++---
>  arch/m68k/mm/mcfmmu.c   |  9 +++------
>  arch/nds32/mm/init.c    | 11 ++++-------
>  arch/nios2/mm/init.c    |  8 +++-----
>  arch/openrisc/mm/init.c |  9 +++------
>  arch/um/kernel/mem.c    | 12 ++++--------
>  include/linux/mm.h      |  2 +-
>  mm/page_alloc.c         |  5 ++---
>  12 files changed, 38 insertions(+), 60 deletions(-)
> 
> diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
> index 12e218d3792a..667cd21393b5 100644
> --- a/arch/alpha/mm/init.c
> +++ b/arch/alpha/mm/init.c
> @@ -243,21 +243,17 @@ callback_init(void * kernel_end)
>   */
>  void __init paging_init(void)
>  {
> -	unsigned long zones_size[MAX_NR_ZONES] = {0, };
> -	unsigned long dma_pfn, high_pfn;
> +	unsigned long max_zone_pfn[MAX_NR_ZONES] = {0, };
> +	unsigned long dma_pfn;
>  
>  	dma_pfn = virt_to_phys((char *)MAX_DMA_ADDRESS) >> PAGE_SHIFT;
> -	high_pfn = max_pfn = max_low_pfn;
> +	max_pfn = max_low_pfn;
>  
> -	if (dma_pfn >= high_pfn)
> -		zones_size[ZONE_DMA] = high_pfn;
> -	else {
> -		zones_size[ZONE_DMA] = dma_pfn;
> -		zones_size[ZONE_NORMAL] = high_pfn - dma_pfn;
> -	}
> +	max_zone_pfn[ZONE_DMA] = dma_pfn;
> +	max_zone_pfn[ZONE_NORMAL] = max_pfn;
>  
>  	/* Initialize mem_map[].  */
> -	free_area_init(zones_size);
> +	free_area_init(max_zone_pfn);
>  
>  	/* Initialize the kernel's ZERO_PGE. */
>  	memset((void *)ZERO_PGE, 0, PAGE_SIZE);
> diff --git a/arch/c6x/mm/init.c b/arch/c6x/mm/init.c
> index 9b374393a8f4..a97e51a3e26d 100644
> --- a/arch/c6x/mm/init.c
> +++ b/arch/c6x/mm/init.c
> @@ -33,7 +33,7 @@ EXPORT_SYMBOL(empty_zero_page);
>  void __init paging_init(void)
>  {
>  	struct pglist_data *pgdat = NODE_DATA(0);
> -	unsigned long zones_size[MAX_NR_ZONES] = {0, };
> +	unsigned long max_zone_pfn[MAX_NR_ZONES] = {0, };
>  
>  	empty_zero_page      = (unsigned long) memblock_alloc(PAGE_SIZE,
>  							      PAGE_SIZE);
> @@ -49,11 +49,9 @@ void __init paging_init(void)
>  	/*
>  	 * Define zones
>  	 */
> -	zones_size[ZONE_NORMAL] = (memory_end - PAGE_OFFSET) >> PAGE_SHIFT;
> -	pgdat->node_zones[ZONE_NORMAL].zone_start_pfn =
> -		__pa(PAGE_OFFSET) >> PAGE_SHIFT;
> +	max_zone_pfn[ZONE_NORMAL] = memory_end >> PAGE_SHIFT;
>  
> -	free_area_init(zones_size);
> +	free_area_init(max_zone_pfn);
>  }
>  
>  void __init mem_init(void)
> diff --git a/arch/h8300/mm/init.c b/arch/h8300/mm/init.c
> index 1eab16b1a0bc..27a0020e3771 100644
> --- a/arch/h8300/mm/init.c
> +++ b/arch/h8300/mm/init.c
> @@ -83,10 +83,10 @@ void __init paging_init(void)
>  		 start_mem, end_mem);
>  
>  	{
> -		unsigned long zones_size[MAX_NR_ZONES] = {0, };
> +		unsigned long max_zone_pfn[MAX_NR_ZONES] = {0, };
>  
> -		zones_size[ZONE_NORMAL] = (end_mem - PAGE_OFFSET) >> PAGE_SHIFT;
> -		free_area_init(zones_size);
> +		max_zone_pfn[ZONE_NORMAL] = end_mem >> PAGE_SHIFT;
> +		free_area_init(max_zone_pfn);
>  	}
>  }
>  
> diff --git a/arch/hexagon/mm/init.c b/arch/hexagon/mm/init.c
> index c961773a6fff..f2e6c868e477 100644
> --- a/arch/hexagon/mm/init.c
> +++ b/arch/hexagon/mm/init.c
> @@ -91,7 +91,7 @@ void sync_icache_dcache(pte_t pte)
>   */
>  void __init paging_init(void)
>  {
> -	unsigned long zones_sizes[MAX_NR_ZONES] = {0, };
> +	unsigned long max_zone_pfn[MAX_NR_ZONES] = {0, };
>  
>  	/*
>  	 *  This is not particularly well documented anywhere, but
> @@ -101,9 +101,9 @@ void __init paging_init(void)
>  	 *  adjust accordingly.
>  	 */
>  
> -	zones_sizes[ZONE_NORMAL] = max_low_pfn;
> +	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
>  
> -	free_area_init(zones_sizes);  /*  sets up the zonelists and mem_map  */
> +	free_area_init(max_zone_pfn);  /*  sets up the zonelists and mem_map  */
>  
>  	/*
>  	 * Start of high memory area.  Will probably need something more
> diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
> index b88d510d4fe3..6d3147662ff2 100644
> --- a/arch/m68k/mm/init.c
> +++ b/arch/m68k/mm/init.c
> @@ -84,7 +84,7 @@ void __init paging_init(void)
>  	 * page_alloc get different views of the world.
>  	 */
>  	unsigned long end_mem = memory_end & PAGE_MASK;
> -	unsigned long zones_size[MAX_NR_ZONES] = { 0, };
> +	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0, };
>  
>  	high_memory = (void *) end_mem;
>  
> @@ -98,8 +98,8 @@ void __init paging_init(void)
>  	 */
>  	set_fs (USER_DS);
>  
> -	zones_size[ZONE_DMA] = (end_mem - PAGE_OFFSET) >> PAGE_SHIFT;
> -	free_area_init(zones_size);
> +	max_zone_pfn[ZONE_DMA] = end_mem >> PAGE_SHIFT;
> +	free_area_init(max_zone_pfn);
>  }
>  
>  #endif /* CONFIG_MMU */
> diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
> index 0ea375607767..80064e6d064f 100644
> --- a/arch/m68k/mm/mcfmmu.c
> +++ b/arch/m68k/mm/mcfmmu.c
> @@ -39,7 +39,7 @@ void __init paging_init(void)
>  	pte_t *pg_table;
>  	unsigned long address, size;
>  	unsigned long next_pgtable, bootmem_end;
> -	unsigned long zones_size[MAX_NR_ZONES];
> +	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
>  	enum zone_type zone;
>  	int i;
>  
> @@ -80,11 +80,8 @@ void __init paging_init(void)
>  	}
>  
>  	current->mm = NULL;
> -
> -	for (zone = 0; zone < MAX_NR_ZONES; zone++)
> -		zones_size[zone] = 0x0;
> -	zones_size[ZONE_DMA] = num_pages;
> -	free_area_init(zones_size);
> +	max_zone_pfn[ZONE_DMA] = PFN_DOWN(_ramend);
> +	free_area_init(max_zone_pfn);
>  }
>  
>  int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word)
> diff --git a/arch/nds32/mm/init.c b/arch/nds32/mm/init.c
> index 0be3833f6814..91147cca4b64 100644
> --- a/arch/nds32/mm/init.c
> +++ b/arch/nds32/mm/init.c
> @@ -31,16 +31,13 @@ EXPORT_SYMBOL(empty_zero_page);
>  
>  static void __init zone_sizes_init(void)
>  {
> -	unsigned long zones_size[MAX_NR_ZONES];
> +	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
>  
> -	/* Clear the zone sizes */
> -	memset(zones_size, 0, sizeof(zones_size));
> -
> -	zones_size[ZONE_NORMAL] = max_low_pfn;
> +	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
>  #ifdef CONFIG_HIGHMEM
> -	zones_size[ZONE_HIGHMEM] = max_pfn;
> +	max_zone_pfn[ZONE_HIGHMEM] = max_pfn;
>  #endif
> -	free_area_init(zones_size);
> +	free_area_init(max_zone_pfn);
>  
>  }
>  
> diff --git a/arch/nios2/mm/init.c b/arch/nios2/mm/init.c
> index 2c609c2516b2..9afca77d10b1 100644
> --- a/arch/nios2/mm/init.c
> +++ b/arch/nios2/mm/init.c
> @@ -46,17 +46,15 @@ pgd_t *pgd_current;
>   */
>  void __init paging_init(void)
>  {
> -	unsigned long zones_size[MAX_NR_ZONES];
> -
> -	memset(zones_size, 0, sizeof(zones_size));
> +	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
>  
>  	pagetable_init();
>  	pgd_current = swapper_pg_dir;
>  
> -	zones_size[ZONE_NORMAL] = max_mapnr;
> +	max_zone_pfn[ZONE_NORMAL] = max_mapnr;
>  
>  	/* pass the memory from the bootmem allocator to the main allocator */
> -	free_area_init(zones_size);
> +	free_area_init(max_zone_pfn);
>  
>  	flush_dcache_range((unsigned long)empty_zero_page,
>  			(unsigned long)empty_zero_page + PAGE_SIZE);
> diff --git a/arch/openrisc/mm/init.c b/arch/openrisc/mm/init.c
> index 1f87b524db78..f94fe6d3f499 100644
> --- a/arch/openrisc/mm/init.c
> +++ b/arch/openrisc/mm/init.c
> @@ -45,17 +45,14 @@ DEFINE_PER_CPU(struct mmu_gather, mmu_gathers);
>  
>  static void __init zone_sizes_init(void)
>  {
> -	unsigned long zones_size[MAX_NR_ZONES];
> -
> -	/* Clear the zone sizes */
> -	memset(zones_size, 0, sizeof(zones_size));
> +	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
>  
>  	/*
>  	 * We use only ZONE_NORMAL
>  	 */
> -	zones_size[ZONE_NORMAL] = max_low_pfn;
> +	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
>  
> -	free_area_init(zones_size);
> +	free_area_init(max_zone_pfn);
>  }
>  
>  extern const char _s_kernel_ro[], _e_kernel_ro[];
> diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
> index 30885d0b94ac..401b22f14743 100644
> --- a/arch/um/kernel/mem.c
> +++ b/arch/um/kernel/mem.c
> @@ -158,8 +158,8 @@ static void __init fixaddr_user_init( void)
>  
>  void __init paging_init(void)
>  {
> -	unsigned long zones_size[MAX_NR_ZONES], vaddr;
> -	int i;
> +	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
> +	unsigned long vaddr;
>  
>  	empty_zero_page = (unsigned long *) memblock_alloc_low(PAGE_SIZE,
>  							       PAGE_SIZE);
> @@ -167,12 +167,8 @@ void __init paging_init(void)
>  		panic("%s: Failed to allocate %lu bytes align=%lx\n",
>  		      __func__, PAGE_SIZE, PAGE_SIZE);
>  
> -	for (i = 0; i < ARRAY_SIZE(zones_size); i++)
> -		zones_size[i] = 0;
> -
> -	zones_size[ZONE_NORMAL] = (end_iomem >> PAGE_SHIFT) -
> -		(uml_physmem >> PAGE_SHIFT);
> -	free_area_init(zones_size);
> +	max_zone_pfn[ZONE_NORMAL] = end_iomem >> PAGE_SHIFT;
> +	free_area_init(max_zone_pfn);
>  
>  	/*
>  	 * Fixed mappings, only the page table structure has to be
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 5903bbbdb336..d9a256a97ac5 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2272,7 +2272,7 @@ static inline spinlock_t *pud_lock(struct mm_struct *mm, pud_t *pud)
>  }
>  
>  extern void __init pagecache_init(void);
> -extern void free_area_init(unsigned long * zones_size);
> +extern void free_area_init(unsigned long * max_zone_pfn);
>  extern void __init free_area_init_node(int nid, unsigned long * zones_size,
>  		unsigned long zone_start_pfn, unsigned long *zholes_size);
>  extern void free_initmem(void);
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 4530e9cfd9f7..530701b38bc7 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -7700,11 +7700,10 @@ void __init set_dma_reserve(unsigned long new_dma_reserve)
>  	dma_reserve = new_dma_reserve;
>  }
>  
> -void __init free_area_init(unsigned long *zones_size)
> +void __init free_area_init(unsigned long *max_zone_pfn)
>  {
>  	init_unavailable_mem();
> -	free_area_init_node(0, zones_size,
> -			__pa(PAGE_OFFSET) >> PAGE_SHIFT, NULL);
> +	free_area_init_nodes(max_zone_pfn);

Reviewed-by: Baoquan He <bhe@redhat.com>

>  }
>  
>  static int page_alloc_cpu_dead(unsigned int cpu)
> -- 
> 2.25.1
> 

