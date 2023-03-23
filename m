Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 458DE6C6E7B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 18:13:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjBl06zvlz3fRH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 04:13:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HPG34v2v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HPG34v2v;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjBk12lVJz3f4X
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 04:12:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679591577; x=1711127577;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bOk/bK3iytGpOoPzSN/P3lMEMqW4rV3s8Am9+KQ4/Qo=;
  b=HPG34v2vN9hrkcY6N8V1fdNo1RVzczcAMz0uuKGoWj9uEiw/ZivzBijZ
   WnGQvVBxRLgM7hO05+T/e78FE6JyIzHrheCMpU6XUrTSj+6qfU8AuVfyU
   C62emDpkDJHuj/JTpxtvRnyAxOoHgRkfJSOlwliy1uZZaEOUuyaIWhDyj
   af84V99AdrFeLGTx9M8oZkwVnymHnrnoWgEMqJrYFag2eS569Nfc2RmMj
   LLrmyUM6nVT/U/PxPbVlmPvOeuMteuBeVHYOMo/KoWFzIr6IMQCskI08r
   GbtXP7NQHS3wXSP8Z/jbPbNXWZhlhhXIUJPDS8vu5CjHQLpliBMwxvBSy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="338283368"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="338283368"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 10:12:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="825909467"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="825909467"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2023 10:12:41 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfOUO-000EZ8-0H;
	Thu, 23 Mar 2023 17:12:36 +0000
Date: Fri, 24 Mar 2023 01:11:39 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 02/14] arm64: drop ranges in definition of
 ARCH_FORCE_MAX_ORDER
Message-ID: <202303240155.01y6T6Fj-lkp@intel.com>
References: <20230323092156.2545741-3-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323092156.2545741-3-rppt@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, llvm@lists.linux.dev, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, oe-kbuild-all@lists.linux.dev, Geert Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mike,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on 51551d71edbc998fd8c8afa7312db3d270f5998e]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Rapoport/arm-reword-ARCH_FORCE_MAX_ORDER-prompt-and-help-text/20230323-172512
base:   51551d71edbc998fd8c8afa7312db3d270f5998e
patch link:    https://lore.kernel.org/r/20230323092156.2545741-3-rppt%40kernel.org
patch subject: [PATCH 02/14] arm64: drop ranges in definition of ARCH_FORCE_MAX_ORDER
config: arm64-randconfig-r031-20230322 (https://download.01.org/0day-ci/archive/20230324/202303240155.01y6T6Fj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/0522f943c071abf1610651ea40405b7489c50987
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mike-Rapoport/arm-reword-ARCH_FORCE_MAX_ORDER-prompt-and-help-text/20230323-172512
        git checkout 0522f943c071abf1610651ea40405b7489c50987
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/iommu/ kernel/dma/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303240155.01y6T6Fj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/memory.c:5791:37: warning: shift count is negative [-Wshift-count-negative]
           if (unlikely(pages_per_huge_page > MAX_ORDER_NR_PAGES)) {
                                              ^~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:33:31: note: expanded from macro 'MAX_ORDER_NR_PAGES'
   #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
                                 ^  ~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
>> mm/memory.c:5791:37: warning: shift count is negative [-Wshift-count-negative]
           if (unlikely(pages_per_huge_page > MAX_ORDER_NR_PAGES)) {
                                              ^~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:33:31: note: expanded from macro 'MAX_ORDER_NR_PAGES'
   #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
                                 ^  ~~~~~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_check__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   mm/memory.c:5843:37: warning: shift count is negative [-Wshift-count-negative]
           if (unlikely(pages_per_huge_page > MAX_ORDER_NR_PAGES)) {
                                              ^~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:33:31: note: expanded from macro 'MAX_ORDER_NR_PAGES'
   #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
                                 ^  ~~~~~~~~~
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_check__'
                           ______r = __builtin_expect(!!(x), expect);      \
                                                         ^
   mm/memory.c:5843:37: warning: shift count is negative [-Wshift-count-negative]
           if (unlikely(pages_per_huge_page > MAX_ORDER_NR_PAGES)) {
                                              ^~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:33:31: note: expanded from macro 'MAX_ORDER_NR_PAGES'
   #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
                                 ^  ~~~~~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_check__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   4 warnings generated.
--
>> drivers/iommu/dma-iommu.c:739:16: error: anonymous bit-field has negative width (-1)
           order_mask &= GENMASK(MAX_ORDER, 0);
                         ^
   include/linux/bits.h:37:3: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
            ^
   include/linux/bits.h:23:3: note: expanded from macro 'GENMASK_INPUT_CHECK'
           (BUILD_BUG_ON_ZERO(__builtin_choose_expr( \
            ^
   include/linux/build_bug.h:16:53: note: expanded from macro 'BUILD_BUG_ON_ZERO'
   #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
                                                       ^
>> drivers/iommu/dma-iommu.c:739:16: warning: shift count >= width of type [-Wshift-count-overflow]
           order_mask &= GENMASK(MAX_ORDER, 0);
                         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:37:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^~~~~~~~~~~~~~~
   include/linux/bits.h:35:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.
--
>> kernel/dma/pool.c:197:39: warning: shift count is negative [-Wshift-count-negative]
                   pages = min_t(unsigned long, pages, MAX_ORDER_NR_PAGES);
                                                       ^~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:33:31: note: expanded from macro 'MAX_ORDER_NR_PAGES'
   #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
                                 ^  ~~~~~~~~~
   include/linux/minmax.h:126:59: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                                                   ^
   include/linux/minmax.h:37:12: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                            ^
   include/linux/minmax.h:28:34: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                                    ^
>> kernel/dma/pool.c:197:39: warning: shift count is negative [-Wshift-count-negative]
                   pages = min_t(unsigned long, pages, MAX_ORDER_NR_PAGES);
                                                       ^~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:33:31: note: expanded from macro 'MAX_ORDER_NR_PAGES'
   #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
                                 ^  ~~~~~~~~~
   include/linux/minmax.h:126:59: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                                                   ^
   include/linux/minmax.h:37:12: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                            ^
   include/linux/minmax.h:28:46: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                                                ^
>> kernel/dma/pool.c:197:39: warning: shift count is negative [-Wshift-count-negative]
                   pages = min_t(unsigned long, pages, MAX_ORDER_NR_PAGES);
                                                       ^~~~~~~~~~~~~~~~~~
   include/linux/mmzone.h:33:31: note: expanded from macro 'MAX_ORDER_NR_PAGES'
   #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
                                 ^  ~~~~~~~~~
   include/linux/minmax.h:126:59: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
                                                                   ^
   include/linux/minmax.h:38:17: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                                 ^
   include/linux/minmax.h:32:25: note: expanded from macro '__cmp_once'
                   typeof(y) unique_y = (y);               \
                                         ^
   3 warnings generated.


vim +739 drivers/iommu/dma-iommu.c

0db2e5d18f76a6 Robin Murphy        2015-10-01  732  
c4b17afb0a4e8d Ganapatrao Kulkarni 2018-11-30  733  static struct page **__iommu_dma_alloc_pages(struct device *dev,
c4b17afb0a4e8d Ganapatrao Kulkarni 2018-11-30  734  		unsigned int count, unsigned long order_mask, gfp_t gfp)
0db2e5d18f76a6 Robin Murphy        2015-10-01  735  {
0db2e5d18f76a6 Robin Murphy        2015-10-01  736  	struct page **pages;
c4b17afb0a4e8d Ganapatrao Kulkarni 2018-11-30  737  	unsigned int i = 0, nid = dev_to_node(dev);
3b6b7e19e31a81 Robin Murphy        2016-04-13  738  
98d56389a5e38b Kirill A. Shutemov  2023-03-15 @739  	order_mask &= GENMASK(MAX_ORDER, 0);
3b6b7e19e31a81 Robin Murphy        2016-04-13  740  	if (!order_mask)
3b6b7e19e31a81 Robin Murphy        2016-04-13  741  		return NULL;
0db2e5d18f76a6 Robin Murphy        2015-10-01  742  
ab6f4b001c8c72 Gustavo A. R. Silva 2021-09-28  743  	pages = kvcalloc(count, sizeof(*pages), GFP_KERNEL);
0db2e5d18f76a6 Robin Murphy        2015-10-01  744  	if (!pages)
0db2e5d18f76a6 Robin Murphy        2015-10-01  745  		return NULL;
0db2e5d18f76a6 Robin Murphy        2015-10-01  746  
0db2e5d18f76a6 Robin Murphy        2015-10-01  747  	/* IOMMU can map any pages, so himem can also be used here */
0db2e5d18f76a6 Robin Murphy        2015-10-01  748  	gfp |= __GFP_NOWARN | __GFP_HIGHMEM;
0db2e5d18f76a6 Robin Murphy        2015-10-01  749  
0db2e5d18f76a6 Robin Murphy        2015-10-01  750  	while (count) {
0db2e5d18f76a6 Robin Murphy        2015-10-01  751  		struct page *page = NULL;
3b6b7e19e31a81 Robin Murphy        2016-04-13  752  		unsigned int order_size;
0db2e5d18f76a6 Robin Murphy        2015-10-01  753  
0db2e5d18f76a6 Robin Murphy        2015-10-01  754  		/*
0db2e5d18f76a6 Robin Murphy        2015-10-01  755  		 * Higher-order allocations are a convenience rather
0db2e5d18f76a6 Robin Murphy        2015-10-01  756  		 * than a necessity, hence using __GFP_NORETRY until
3b6b7e19e31a81 Robin Murphy        2016-04-13  757  		 * falling back to minimum-order allocations.
0db2e5d18f76a6 Robin Murphy        2015-10-01  758  		 */
a706e6e10225fb Kirill A. Shutemov  2023-03-15  759  		for (order_mask &= GENMASK(__fls(count), 0);
3b6b7e19e31a81 Robin Murphy        2016-04-13  760  		     order_mask; order_mask &= ~order_size) {
3b6b7e19e31a81 Robin Murphy        2016-04-13  761  			unsigned int order = __fls(order_mask);
c4b17afb0a4e8d Ganapatrao Kulkarni 2018-11-30  762  			gfp_t alloc_flags = gfp;
3b6b7e19e31a81 Robin Murphy        2016-04-13  763  
3b6b7e19e31a81 Robin Murphy        2016-04-13  764  			order_size = 1U << order;
c4b17afb0a4e8d Ganapatrao Kulkarni 2018-11-30  765  			if (order_mask > order_size)
c4b17afb0a4e8d Ganapatrao Kulkarni 2018-11-30  766  				alloc_flags |= __GFP_NORETRY;
c4b17afb0a4e8d Ganapatrao Kulkarni 2018-11-30  767  			page = alloc_pages_node(nid, alloc_flags, order);
0db2e5d18f76a6 Robin Murphy        2015-10-01  768  			if (!page)
0db2e5d18f76a6 Robin Murphy        2015-10-01  769  				continue;
4604393ca0c6e4 Robin Murphy        2020-09-03  770  			if (order)
0db2e5d18f76a6 Robin Murphy        2015-10-01  771  				split_page(page, order);
0db2e5d18f76a6 Robin Murphy        2015-10-01  772  			break;
0db2e5d18f76a6 Robin Murphy        2015-10-01  773  		}
0db2e5d18f76a6 Robin Murphy        2015-10-01  774  		if (!page) {
0db2e5d18f76a6 Robin Murphy        2015-10-01  775  			__iommu_dma_free_pages(pages, i);
0db2e5d18f76a6 Robin Murphy        2015-10-01  776  			return NULL;
0db2e5d18f76a6 Robin Murphy        2015-10-01  777  		}
3b6b7e19e31a81 Robin Murphy        2016-04-13  778  		count -= order_size;
3b6b7e19e31a81 Robin Murphy        2016-04-13  779  		while (order_size--)
0db2e5d18f76a6 Robin Murphy        2015-10-01  780  			pages[i++] = page++;
0db2e5d18f76a6 Robin Murphy        2015-10-01  781  	}
0db2e5d18f76a6 Robin Murphy        2015-10-01  782  	return pages;
0db2e5d18f76a6 Robin Murphy        2015-10-01  783  }
0db2e5d18f76a6 Robin Murphy        2015-10-01  784  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
