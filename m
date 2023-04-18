Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 918FF6E565F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 03:24:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0mRF2lHzz3fR7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 11:24:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FoDm79X4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FoDm79X4;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0mQM5LfHz3cJn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 11:23:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681781004; x=1713317004;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xxj4orMdwSEXYJlb7suHd8py6WoU3VU9TrspjC7QyJg=;
  b=FoDm79X4EZbJEtt6Ehf1v/nMflm6+bAKNDSspAUe1ZvYJbXkIcRrk9Rt
   i4jk90DZy3K/Sgap6mQXdK8sBUvFqDBy1qJU0mLFHKqzKjlDTAbV/zML4
   oOP9/wILYbzF8B/AHivEL362cp1JqdFWW4OvxkO6suGYg4e65tUjL0lVg
   YkUoBEr58ozCIOrF+BYvBRbNmF6Bjbd7uHnlvLVX3hR4C6pejRhPIk4jT
   jxziYyGg2hFLwFxlhMoMYpxML6m71CotKU3OMCJrYN2C0xdz9bEXqqa9I
   m5VI6xNzWBppvRxYdxtUr9rw5SOWW4VFsH7/ZgiPmRej3EXUvSugOAr+C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="410264164"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="410264164"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 18:23:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="668298836"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="668298836"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Apr 2023 18:23:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poa3p-000co7-26;
	Tue, 18 Apr 2023 01:23:09 +0000
Date: Tue, 18 Apr 2023 09:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 04/33] mm: add utility functions for ptdesc
Message-ID: <202304180913.p1BuXrBb-lkp@intel.com>
References: <20230417205048.15870-5-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417205048.15870-5-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, Linux Memory Management List <linux-mm@kvack.org>, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, oe-kbuild-all@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vishal,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on s390/features powerpc/next powerpc/fixes geert-m68k/for-next geert-m68k/for-linus linus/master v6.3-rc7 next-20230417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishal-Moola-Oracle/s390-Use-_pt_s390_gaddr-for-gmap-address-tracking/20230418-045832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230417205048.15870-5-vishal.moola%40gmail.com
patch subject: [PATCH 04/33] mm: add utility functions for ptdesc
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230418/202304180913.p1BuXrBb-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1b6f8137ca50a543ad2937092836635ca58c78ce
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vishal-Moola-Oracle/s390-Use-_pt_s390_gaddr-for-gmap-address-tracking/20230418-045832
        git checkout 1b6f8137ca50a543ad2937092836635ca58c78ce
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304180913.p1BuXrBb-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/sh/kernel/asm-offsets.c:14:
   include/linux/mm.h: In function 'virt_to_ptdesc':
>> include/linux/mm.h:2723:16: error: implicit declaration of function 'page_ptdesc' [-Werror=implicit-function-declaration]
    2723 |         return page_ptdesc(virt_to_head_page(x));
         |                ^~~~~~~~~~~
>> include/linux/mm.h:2723:16: warning: returning 'int' from a function with return type 'struct ptdesc *' makes pointer from integer without a cast [-Wint-conversion]
    2723 |         return page_ptdesc(virt_to_head_page(x));
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/sh/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7:
   include/linux/mm.h: In function 'ptdesc_to_virt':
>> include/linux/mm.h:2728:29: error: implicit declaration of function 'ptdesc_page'; did you mean 'pte_page'? [-Werror=implicit-function-declaration]
    2728 |         return page_to_virt(ptdesc_page(pt));
         |                             ^~~~~~~~~~~
   arch/sh/include/asm/page.h:139:27: note: in definition of macro '___va'
     139 | #define ___va(x)        ((x)+PAGE_OFFSET)
         |                           ^
   include/linux/mm.h:117:25: note: in expansion of macro '__va'
     117 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                         ^~~~
   include/linux/mm.h:117:30: note: in expansion of macro 'PFN_PHYS'
     117 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                              ^~~~~~~~
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:2728:16: note: in expansion of macro 'page_to_virt'
    2728 |         return page_to_virt(ptdesc_page(pt));
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:46:35: warning: initialization of 'const struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      46 | ({      const struct page *__pg = (pg);                         \
         |                                   ^
   arch/sh/include/asm/page.h:139:27: note: in definition of macro '___va'
     139 | #define ___va(x)        ((x)+PAGE_OFFSET)
         |                           ^
   include/linux/mm.h:117:25: note: in expansion of macro '__va'
     117 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                         ^~~~
   include/linux/mm.h:117:30: note: in expansion of macro 'PFN_PHYS'
     117 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                              ^~~~~~~~
   include/asm-generic/memory_model.h:64:21: note: in expansion of macro '__page_to_pfn'
      64 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:117:39: note: in expansion of macro 'page_to_pfn'
     117 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                                       ^~~~~~~~~~~
   include/linux/mm.h:2728:16: note: in expansion of macro 'page_to_virt'
    2728 |         return page_to_virt(ptdesc_page(pt));
         |                ^~~~~~~~~~~~
   include/linux/mm.h: In function 'ptdesc_address':
>> include/linux/mm.h:2733:30: error: implicit declaration of function 'ptdesc_folio'; did you mean 'page_folio'? [-Werror=implicit-function-declaration]
    2733 |         return folio_address(ptdesc_folio(pt));
         |                              ^~~~~~~~~~~~
         |                              page_folio
>> include/linux/mm.h:2733:30: warning: passing argument 1 of 'folio_address' makes pointer from integer without a cast [-Wint-conversion]
    2733 |         return folio_address(ptdesc_folio(pt));
         |                              ^~~~~~~~~~~~~~~~
         |                              |
         |                              int
   include/linux/mm.h:2151:55: note: expected 'const struct folio *' but argument is of type 'int'
    2151 | static inline void *folio_address(const struct folio *folio)
         |                                   ~~~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/mm.h: In function 'ptdesc_is_reserved':
>> include/linux/mm.h:2738:36: warning: passing argument 1 of 'folio_test_reserved' makes pointer from integer without a cast [-Wint-conversion]
    2738 |         return folio_test_reserved(ptdesc_folio(pt));
         |                                    ^~~~~~~~~~~~~~~~
         |                                    |
         |                                    int
   In file included from include/linux/mmzone.h:23:
   include/linux/page-flags.h:375:62: note: expected 'struct folio *' but argument is of type 'int'
     375 | static __always_inline bool folio_test_##lname(struct folio *folio)     \
         |                                                ~~~~~~~~~~~~~~^~~~~
   include/linux/page-flags.h:423:9: note: in expansion of macro 'TESTPAGEFLAG'
     423 |         TESTPAGEFLAG(uname, lname, policy)                              \
         |         ^~~~~~~~~~~~
   include/linux/page-flags.h:494:1: note: in expansion of macro 'PAGEFLAG'
     494 | PAGEFLAG(Reserved, reserved, PF_NO_COMPOUND)
         | ^~~~~~~~
   include/linux/mm.h: In function 'ptdesc_alloc':
   include/linux/mm.h:2745:16: warning: returning 'int' from a function with return type 'struct ptdesc *' makes pointer from integer without a cast [-Wint-conversion]
    2745 |         return page_ptdesc(page);
         |                ^~~~~~~~~~~~~~~~~
   include/linux/mm.h: In function 'ptdesc_free':
>> include/linux/mm.h:2750:29: warning: initialization of 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    2750 |         struct page *page = ptdesc_page(pt);
         |                             ^~~~~~~~~~~
   include/linux/mm.h: In function 'free_reserved_ptdesc':
>> include/linux/mm.h:2988:28: warning: passing argument 1 of 'free_reserved_page' makes pointer from integer without a cast [-Wint-conversion]
    2988 |         free_reserved_page(ptdesc_page(pt));
         |                            ^~~~~~~~~~~~~~~
         |                            |
         |                            int
   include/linux/mm.h:2971:52: note: expected 'struct page *' but argument is of type 'int'
    2971 | static inline void free_reserved_page(struct page *page)
         |                                       ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/sh/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/page_ptdesc +2723 include/linux/mm.h

  2720	
  2721	static inline struct ptdesc *virt_to_ptdesc(const void *x)
  2722	{
> 2723		return page_ptdesc(virt_to_head_page(x));
  2724	}
  2725	
  2726	static inline void *ptdesc_to_virt(struct ptdesc *pt)
  2727	{
> 2728		return page_to_virt(ptdesc_page(pt));
  2729	}
  2730	
  2731	static inline void *ptdesc_address(struct ptdesc *pt)
  2732	{
> 2733		return folio_address(ptdesc_folio(pt));
  2734	}
  2735	
  2736	static inline bool ptdesc_is_reserved(struct ptdesc *pt)
  2737	{
> 2738		return folio_test_reserved(ptdesc_folio(pt));
  2739	}
  2740	
  2741	static inline struct ptdesc *ptdesc_alloc(gfp_t gfp, unsigned int order)
  2742	{
  2743		struct page *page = alloc_pages(gfp | __GFP_COMP, order);
  2744	
  2745		return page_ptdesc(page);
  2746	}
  2747	
  2748	static inline void ptdesc_free(struct ptdesc *pt)
  2749	{
> 2750		struct page *page = ptdesc_page(pt);
  2751	
  2752		__free_pages(page, compound_order(page));
  2753	}
  2754	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
