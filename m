Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D29FF5B641
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 10:03:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cfxr336GzDqXV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 18:03:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=mhocko@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cfwF0HfjzDqMb
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 18:01:48 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7BCDDAF1B;
 Mon,  1 Jul 2019 08:01:44 +0000 (UTC)
Date: Mon, 1 Jul 2019 10:01:41 +0200
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 06/11] mm/memory_hotplug: Allow arch_remove_pages()
 without CONFIG_MEMORY_HOTREMOVE
Message-ID: <20190701080141.GF6376@dhcp22.suse.cz>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-7-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527111152.16324-7-david@redhat.com>
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
Cc: Oscar Salvador <osalvador@suse.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Arun KS <arunks@codeaurora.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Qian Cai <cai@lca.pw>, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, "mike.travis@hpe.com" <mike.travis@hpe.com>,
 Nicholas Piggin <npiggin@gmail.com>, Alex Deucher <alexander.deucher@amd.com>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, Baoquan He <bhe@redhat.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Banman <andrew.banman@hpe.com>, linux-kernel@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Wei Yang <richardw.yang@linux.intel.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Igor Mammedov <imammedo@redhat.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 27-05-19 13:11:47, David Hildenbrand wrote:
> We want to improve error handling while adding memory by allowing
> to use arch_remove_memory() and __remove_pages() even if
> CONFIG_MEMORY_HOTREMOVE is not set to e.g., implement something like:
> 
> 	arch_add_memory()
> 	rc = do_something();
> 	if (rc) {
> 		arch_remove_memory();
> 	}
> 
> We won't get rid of CONFIG_MEMORY_HOTREMOVE for now, as it will require
> quite some dependencies for memory offlining.

If we cannot really remove CONFIG_MEMORY_HOTREMOVE altogether then why
not simply add an empty placeholder for arch_remove_memory when the
config is disabled?
 
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Fenghua Yu <fenghua.yu@intel.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: Rich Felker <dalias@libc.org>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Mike Rapoport <rppt@linux.ibm.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Oscar Salvador <osalvador@suse.com>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: "mike.travis@hpe.com" <mike.travis@hpe.com>
> Cc: Andrew Banman <andrew.banman@hpe.com>
> Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
> Cc: Wei Yang <richardw.yang@linux.intel.com>
> Cc: Arun KS <arunks@codeaurora.org>
> Cc: Qian Cai <cai@lca.pw>
> Cc: Mathieu Malaterre <malat@debian.org>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Logan Gunthorpe <logang@deltatee.com>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/arm64/mm/mmu.c            | 2 --
>  arch/ia64/mm/init.c            | 2 --
>  arch/powerpc/mm/mem.c          | 2 --
>  arch/s390/mm/init.c            | 2 --
>  arch/sh/mm/init.c              | 2 --
>  arch/x86/mm/init_32.c          | 2 --
>  arch/x86/mm/init_64.c          | 2 --
>  drivers/base/memory.c          | 2 --
>  include/linux/memory.h         | 2 --
>  include/linux/memory_hotplug.h | 2 --
>  mm/memory_hotplug.c            | 2 --
>  mm/sparse.c                    | 6 ------
>  12 files changed, 28 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index e569a543c384..9ccd7539f2d4 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1084,7 +1084,6 @@ int arch_add_memory(int nid, u64 start, u64 size,
>  	return __add_pages(nid, start >> PAGE_SHIFT, size >> PAGE_SHIFT,
>  			   restrictions);
>  }
> -#ifdef CONFIG_MEMORY_HOTREMOVE
>  void arch_remove_memory(int nid, u64 start, u64 size,
>  			struct vmem_altmap *altmap)
>  {
> @@ -1103,4 +1102,3 @@ void arch_remove_memory(int nid, u64 start, u64 size,
>  	__remove_pages(zone, start_pfn, nr_pages, altmap);
>  }
>  #endif
> -#endif
> diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
> index d28e29103bdb..aae75fd7b810 100644
> --- a/arch/ia64/mm/init.c
> +++ b/arch/ia64/mm/init.c
> @@ -681,7 +681,6 @@ int arch_add_memory(int nid, u64 start, u64 size,
>  	return ret;
>  }
>  
> -#ifdef CONFIG_MEMORY_HOTREMOVE
>  void arch_remove_memory(int nid, u64 start, u64 size,
>  			struct vmem_altmap *altmap)
>  {
> @@ -693,4 +692,3 @@ void arch_remove_memory(int nid, u64 start, u64 size,
>  	__remove_pages(zone, start_pfn, nr_pages, altmap);
>  }
>  #endif
> -#endif
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index e885fe2aafcc..e4bc2dc3f593 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -130,7 +130,6 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
>  	return __add_pages(nid, start_pfn, nr_pages, restrictions);
>  }
>  
> -#ifdef CONFIG_MEMORY_HOTREMOVE
>  void __ref arch_remove_memory(int nid, u64 start, u64 size,
>  			     struct vmem_altmap *altmap)
>  {
> @@ -164,7 +163,6 @@ void __ref arch_remove_memory(int nid, u64 start, u64 size,
>  		pr_warn("Hash collision while resizing HPT\n");
>  }
>  #endif
> -#endif /* CONFIG_MEMORY_HOTPLUG */
>  
>  #ifndef CONFIG_NEED_MULTIPLE_NODES
>  void __init mem_topology_setup(void)
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index 14955e0a9fcf..ffb81fe95c77 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -239,7 +239,6 @@ int arch_add_memory(int nid, u64 start, u64 size,
>  	return rc;
>  }
>  
> -#ifdef CONFIG_MEMORY_HOTREMOVE
>  void arch_remove_memory(int nid, u64 start, u64 size,
>  			struct vmem_altmap *altmap)
>  {
> @@ -251,5 +250,4 @@ void arch_remove_memory(int nid, u64 start, u64 size,
>  	__remove_pages(zone, start_pfn, nr_pages, altmap);
>  	vmem_remove_mapping(start, size);
>  }
> -#endif
>  #endif /* CONFIG_MEMORY_HOTPLUG */
> diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
> index 13c6a6bb5fd9..dfdbaa50946e 100644
> --- a/arch/sh/mm/init.c
> +++ b/arch/sh/mm/init.c
> @@ -429,7 +429,6 @@ int memory_add_physaddr_to_nid(u64 addr)
>  EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
>  #endif
>  
> -#ifdef CONFIG_MEMORY_HOTREMOVE
>  void arch_remove_memory(int nid, u64 start, u64 size,
>  			struct vmem_altmap *altmap)
>  {
> @@ -440,5 +439,4 @@ void arch_remove_memory(int nid, u64 start, u64 size,
>  	zone = page_zone(pfn_to_page(start_pfn));
>  	__remove_pages(zone, start_pfn, nr_pages, altmap);
>  }
> -#endif
>  #endif /* CONFIG_MEMORY_HOTPLUG */
> diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
> index f265a4316179..4068abb9427f 100644
> --- a/arch/x86/mm/init_32.c
> +++ b/arch/x86/mm/init_32.c
> @@ -860,7 +860,6 @@ int arch_add_memory(int nid, u64 start, u64 size,
>  	return __add_pages(nid, start_pfn, nr_pages, restrictions);
>  }
>  
> -#ifdef CONFIG_MEMORY_HOTREMOVE
>  void arch_remove_memory(int nid, u64 start, u64 size,
>  			struct vmem_altmap *altmap)
>  {
> @@ -872,7 +871,6 @@ void arch_remove_memory(int nid, u64 start, u64 size,
>  	__remove_pages(zone, start_pfn, nr_pages, altmap);
>  }
>  #endif
> -#endif
>  
>  int kernel_set_to_readonly __read_mostly;
>  
> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> index 693aaf28d5fe..8335ac6e1112 100644
> --- a/arch/x86/mm/init_64.c
> +++ b/arch/x86/mm/init_64.c
> @@ -1196,7 +1196,6 @@ void __ref vmemmap_free(unsigned long start, unsigned long end,
>  	remove_pagetable(start, end, false, altmap);
>  }
>  
> -#ifdef CONFIG_MEMORY_HOTREMOVE
>  static void __meminit
>  kernel_physical_mapping_remove(unsigned long start, unsigned long end)
>  {
> @@ -1221,7 +1220,6 @@ void __ref arch_remove_memory(int nid, u64 start, u64 size,
>  	__remove_pages(zone, start_pfn, nr_pages, altmap);
>  	kernel_physical_mapping_remove(start, start + size);
>  }
> -#endif
>  #endif /* CONFIG_MEMORY_HOTPLUG */
>  
>  static struct kcore_list kcore_vsyscall;
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index f914fa6fe350..ac17c95a5f28 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -727,7 +727,6 @@ int hotplug_memory_register(int nid, struct mem_section *section)
>  	return ret;
>  }
>  
> -#ifdef CONFIG_MEMORY_HOTREMOVE
>  static void
>  unregister_memory(struct memory_block *memory)
>  {
> @@ -766,7 +765,6 @@ void unregister_memory_section(struct mem_section *section)
>  out_unlock:
>  	mutex_unlock(&mem_sysfs_mutex);
>  }
> -#endif /* CONFIG_MEMORY_HOTREMOVE */
>  
>  /* return true if the memory block is offlined, otherwise, return false */
>  bool is_memblock_offlined(struct memory_block *mem)
> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index e1dc1bb2b787..474c7c60c8f2 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -112,9 +112,7 @@ extern void unregister_memory_notifier(struct notifier_block *nb);
>  extern int register_memory_isolate_notifier(struct notifier_block *nb);
>  extern void unregister_memory_isolate_notifier(struct notifier_block *nb);
>  int hotplug_memory_register(int nid, struct mem_section *section);
> -#ifdef CONFIG_MEMORY_HOTREMOVE
>  extern void unregister_memory_section(struct mem_section *);
> -#endif
>  extern int memory_dev_init(void);
>  extern int memory_notify(unsigned long val, void *v);
>  extern int memory_isolate_notify(unsigned long val, void *v);
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index ae892eef8b82..2d4de313926d 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -123,12 +123,10 @@ static inline bool movable_node_is_enabled(void)
>  	return movable_node_enabled;
>  }
>  
> -#ifdef CONFIG_MEMORY_HOTREMOVE
>  extern void arch_remove_memory(int nid, u64 start, u64 size,
>  			       struct vmem_altmap *altmap);
>  extern void __remove_pages(struct zone *zone, unsigned long start_pfn,
>  			   unsigned long nr_pages, struct vmem_altmap *altmap);
> -#endif /* CONFIG_MEMORY_HOTREMOVE */
>  
>  /*
>   * Do we want sysfs memblock files created. This will allow userspace to online
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 762887b2358b..4b9d2974f86c 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -318,7 +318,6 @@ int __ref __add_pages(int nid, unsigned long phys_start_pfn,
>  	return err;
>  }
>  
> -#ifdef CONFIG_MEMORY_HOTREMOVE
>  /* find the smallest valid pfn in the range [start_pfn, end_pfn) */
>  static unsigned long find_smallest_section_pfn(int nid, struct zone *zone,
>  				     unsigned long start_pfn,
> @@ -582,7 +581,6 @@ void __remove_pages(struct zone *zone, unsigned long phys_start_pfn,
>  
>  	set_zone_contiguous(zone);
>  }
> -#endif /* CONFIG_MEMORY_HOTREMOVE */
>  
>  int set_online_page_callback(online_page_callback_t callback)
>  {
> diff --git a/mm/sparse.c b/mm/sparse.c
> index fd13166949b5..d1d5e05f5b8d 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -604,7 +604,6 @@ static void __kfree_section_memmap(struct page *memmap,
>  
>  	vmemmap_free(start, end, altmap);
>  }
> -#ifdef CONFIG_MEMORY_HOTREMOVE
>  static void free_map_bootmem(struct page *memmap)
>  {
>  	unsigned long start = (unsigned long)memmap;
> @@ -612,7 +611,6 @@ static void free_map_bootmem(struct page *memmap)
>  
>  	vmemmap_free(start, end, NULL);
>  }
> -#endif /* CONFIG_MEMORY_HOTREMOVE */
>  #else
>  static struct page *__kmalloc_section_memmap(void)
>  {
> @@ -651,7 +649,6 @@ static void __kfree_section_memmap(struct page *memmap,
>  			   get_order(sizeof(struct page) * PAGES_PER_SECTION));
>  }
>  
> -#ifdef CONFIG_MEMORY_HOTREMOVE
>  static void free_map_bootmem(struct page *memmap)
>  {
>  	unsigned long maps_section_nr, removing_section_nr, i;
> @@ -681,7 +678,6 @@ static void free_map_bootmem(struct page *memmap)
>  			put_page_bootmem(page);
>  	}
>  }
> -#endif /* CONFIG_MEMORY_HOTREMOVE */
>  #endif /* CONFIG_SPARSEMEM_VMEMMAP */
>  
>  /**
> @@ -746,7 +742,6 @@ int __meminit sparse_add_one_section(int nid, unsigned long start_pfn,
>  	return ret;
>  }
>  
> -#ifdef CONFIG_MEMORY_HOTREMOVE
>  #ifdef CONFIG_MEMORY_FAILURE
>  static void clear_hwpoisoned_pages(struct page *memmap, int nr_pages)
>  {
> @@ -823,5 +818,4 @@ void sparse_remove_one_section(struct zone *zone, struct mem_section *ms,
>  			PAGES_PER_SECTION - map_offset);
>  	free_section_usemap(memmap, usemap, altmap);
>  }
> -#endif /* CONFIG_MEMORY_HOTREMOVE */
>  #endif /* CONFIG_MEMORY_HOTPLUG */
> -- 
> 2.20.1
> 

-- 
Michal Hocko
SUSE Labs
