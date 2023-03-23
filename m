Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4F86C6A0D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 14:54:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj6K04X8sz3f89
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 00:54:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bDwla+6/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bDwla+6/;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj6J371w4z3cfg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 00:53:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679579620; x=1711115620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BMnT2f9PT/iwzjkpsd4vT/8VCzv4VAo8CKM1oplFTtk=;
  b=bDwla+6/1ZyCS9r9Ov61n0rBBSZTIbFENdM1XpyuhFc1TE197rH7kouq
   Q0ilpp9W8zDdK0U9EdE/hkNhcr4fFKRFq7hmpIPEawiazLIjAdLdIo5wF
   O4PqbpWD6ShUY5eWWjdPN6uS1N7LsnJ3iK4fAHBr+dk1whApV+I9hYwKJ
   7begOWVHxhCaU6x8pTgo8VZ978Xp7IYyRzNVUvn/uRvecysB3IR1KfxhI
   u+jPInID1dYmewJeWzGfu3pvBj3U9NUd8SoUl6TLZKoIMSd92BzIo+kpK
   Vi/+dM9fxBGCKFJThsx5hL2zAScXlufNshCkdLJ5NIxt+77EKScHfJEqR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341043865"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="341043865"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 06:46:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="746717842"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="746717842"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2023 06:46:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfLGt-000EPw-2r;
	Thu, 23 Mar 2023 13:46:27 +0000
Date: Thu, 23 Mar 2023 21:46:13 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 02/14] arm64: drop ranges in definition of
 ARCH_FORCE_MAX_ORDER
Message-ID: <202303232149.Chh6KhiI-lkp@intel.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, oe-kbuild-all@lists.linux.dev, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, Linux Memory Management List <linux-mm@kvack.org>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mike,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on 51551d71edbc998fd8c8afa7312db3d270f5998e]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Rapoport/arm-reword-ARCH_FORCE_MAX_ORDER-prompt-and-help-text/20230323-172512
base:   51551d71edbc998fd8c8afa7312db3d270f5998e
patch link:    https://lore.kernel.org/r/20230323092156.2545741-3-rppt%40kernel.org
patch subject: [PATCH 02/14] arm64: drop ranges in definition of ARCH_FORCE_MAX_ORDER
config: arm64-randconfig-r022-20230322 (https://download.01.org/0day-ci/archive/20230323/202303232149.Chh6KhiI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0522f943c071abf1610651ea40405b7489c50987
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mike-Rapoport/arm-reword-ARCH_FORCE_MAX_ORDER-prompt-and-help-text/20230323-172512
        git checkout 0522f943c071abf1610651ea40405b7489c50987
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/base/regmap/ drivers/iommu/ fs/proc/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303232149.Chh6KhiI-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:25,
                    from mm/mm_init.c:9:
   mm/mm_init.c: In function 'find_zone_movable_pfns_for_nodes':
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/linux/math.h:61:25: note: in definition of macro 'roundup'
      61 |         typeof(y) __y = y;                              \
         |                         ^
   mm/mm_init.c:429:55: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
     429 |                         roundup(required_movablecore, MAX_ORDER_NR_PAGES);
         |                                                       ^~~~~~~~~~~~~~~~~~
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/linux/math.h:61:25: note: in definition of macro 'roundup'
      61 |         typeof(y) __y = y;                              \
         |                         ^
   mm/mm_init.c:540:56: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
     540 |                         roundup(zone_movable_pfn[nid], MAX_ORDER_NR_PAGES);
         |                                                        ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/debug.c:10:
   mm/debug.c: In function '__dump_page':
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   mm/debug.c:70:44: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
      70 |         if (page < head || (page >= head + MAX_ORDER_NR_PAGES)) {
         |                                            ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/smp.h:12,
                    from include/linux/kernel_stat.h:5,
                    from mm/memory.c:42:
   mm/memory.c: In function 'clear_huge_page':
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   mm/memory.c:5791:44: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
    5791 |         if (unlikely(pages_per_huge_page > MAX_ORDER_NR_PAGES)) {
         |                                            ^~~~~~~~~~~~~~~~~~
   mm/memory.c: In function 'copy_user_huge_page':
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   mm/memory.c:5843:44: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
    5843 |         if (unlikely(pages_per_huge_page > MAX_ORDER_NR_PAGES)) {
         |                                            ^~~~~~~~~~~~~~~~~~
--
   mm/shuffle.c: In function '__shuffle_zone':
>> mm/shuffle.c:86:35: warning: left shift count is negative [-Wshift-count-negative]
      86 |         const int order_pages = 1 << order;
         |                                 ~~^~~~~~~~
--
   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/linux/list.h:9,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/debugfs.h:15,
                    from mm/page_owner.c:2:
   mm/page_owner.c: In function 'pagetypeinfo_showmixedcount_print':
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/uapi/linux/const.h:32:50: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                  ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/page_owner.c:298:31: note: in expansion of macro 'ALIGN'
     298 |                         pfn = ALIGN(pfn + 1, MAX_ORDER_NR_PAGES);
         |                               ^~~~~
   mm/page_owner.c:298:46: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
     298 |                         pfn = ALIGN(pfn + 1, MAX_ORDER_NR_PAGES);
         |                                              ^~~~~~~~~~~~~~~~~~
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/uapi/linux/const.h:32:61: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                             ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/page_owner.c:298:31: note: in expansion of macro 'ALIGN'
     298 |                         pfn = ALIGN(pfn + 1, MAX_ORDER_NR_PAGES);
         |                               ^~~~~
   mm/page_owner.c:298:46: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
     298 |                         pfn = ALIGN(pfn + 1, MAX_ORDER_NR_PAGES);
         |                                              ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/gfp.h:7,
                    from include/linux/xarray.h:15,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13:
   mm/page_owner.c: In function 'read_page_owner':
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   mm/page_owner.c:526:43: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
     526 |         while (!pfn_valid(pfn) && (pfn & (MAX_ORDER_NR_PAGES - 1)) != 0)
         |                                           ^~~~~~~~~~~~~~~~~~
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   mm/page_owner.c:543:29: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
     543 |                 if ((pfn & (MAX_ORDER_NR_PAGES - 1)) == 0 && !pfn_valid(pfn)) {
         |                             ^~~~~~~~~~~~~~~~~~
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   mm/page_owner.c:544:32: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
     544 |                         pfn += MAX_ORDER_NR_PAGES - 1;
         |                                ^~~~~~~~~~~~~~~~~~
   mm/page_owner.c: In function 'init_pages_in_zone':
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/uapi/linux/const.h:32:50: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                  ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/page_owner.c:636:31: note: in expansion of macro 'ALIGN'
     636 |                         pfn = ALIGN(pfn + 1, MAX_ORDER_NR_PAGES);
         |                               ^~~~~
   mm/page_owner.c:636:46: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
     636 |                         pfn = ALIGN(pfn + 1, MAX_ORDER_NR_PAGES);
         |                                              ^~~~~~~~~~~~~~~~~~
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/uapi/linux/const.h:32:61: note: in definition of macro '__ALIGN_KERNEL_MASK'
      32 | #define __ALIGN_KERNEL_MASK(x, mask)    (((x) + (mask)) & ~(mask))
         |                                                             ^~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/page_owner.c:636:31: note: in expansion of macro 'ALIGN'
     636 |                         pfn = ALIGN(pfn + 1, MAX_ORDER_NR_PAGES);
         |                               ^~~~~
   mm/page_owner.c:636:46: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
     636 |                         pfn = ALIGN(pfn + 1, MAX_ORDER_NR_PAGES);
         |                                              ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/kernel.h:26,
                    from arch/arm64/include/asm/cpufeature.h:22,
                    from arch/arm64/include/asm/ptrace.h:11,
                    from arch/arm64/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:16,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from mm/page_isolation.c:6:
   mm/page_isolation.c: In function 'isolate_single_pageblock':
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/linux/minmax.h:28:27: note: in definition of macro '__cmp'
      28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                           ^
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/page_isolation.c:329:22: note: in expansion of macro 'max'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                      ^~~
   include/uapi/linux/const.h:31:41: note: in expansion of macro '__ALIGN_KERNEL_MASK'
      31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
       9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/page_isolation.c:329:26: note: in expansion of macro 'ALIGN_DOWN'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                          ^~~~~~~~~~
   mm/page_isolation.c:329:56: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                                                        ^~~~~~~~~~~~~~~~~~
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/linux/minmax.h:28:27: note: in definition of macro '__cmp'
      28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                           ^
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/page_isolation.c:329:22: note: in expansion of macro 'max'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                      ^~~
   include/uapi/linux/const.h:31:41: note: in expansion of macro '__ALIGN_KERNEL_MASK'
      31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
       9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/page_isolation.c:329:26: note: in expansion of macro 'ALIGN_DOWN'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                          ^~~~~~~~~~
   mm/page_isolation.c:329:56: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                                                        ^~~~~~~~~~~~~~~~~~
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/linux/minmax.h:28:27: note: in definition of macro '__cmp'
      28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                           ^
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/page_isolation.c:329:22: note: in expansion of macro 'max'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                      ^~~
   include/uapi/linux/const.h:31:41: note: in expansion of macro '__ALIGN_KERNEL_MASK'
      31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
       9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/page_isolation.c:329:26: note: in expansion of macro 'ALIGN_DOWN'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                          ^~~~~~~~~~
   mm/page_isolation.c:329:56: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                                                        ^~~~~~~~~~~~~~~~~~
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/linux/minmax.h:28:40: note: in definition of macro '__cmp'
      28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                                        ^
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/page_isolation.c:329:22: note: in expansion of macro 'max'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                      ^~~
   include/uapi/linux/const.h:31:41: note: in expansion of macro '__ALIGN_KERNEL_MASK'
      31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
       9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/page_isolation.c:329:26: note: in expansion of macro 'ALIGN_DOWN'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                          ^~~~~~~~~~
   mm/page_isolation.c:329:56: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                                                        ^~~~~~~~~~~~~~~~~~
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/linux/minmax.h:28:40: note: in definition of macro '__cmp'
      28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                                        ^
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/page_isolation.c:329:22: note: in expansion of macro 'max'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                      ^~~
   include/uapi/linux/const.h:31:41: note: in expansion of macro '__ALIGN_KERNEL_MASK'
      31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
       9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/page_isolation.c:329:26: note: in expansion of macro 'ALIGN_DOWN'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                          ^~~~~~~~~~
   mm/page_isolation.c:329:56: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                                                        ^~~~~~~~~~~~~~~~~~
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/linux/minmax.h:28:40: note: in definition of macro '__cmp'
      28 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                                        ^
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/page_isolation.c:329:22: note: in expansion of macro 'max'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                      ^~~
   include/uapi/linux/const.h:31:41: note: in expansion of macro '__ALIGN_KERNEL_MASK'
      31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
       9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/page_isolation.c:329:26: note: in expansion of macro 'ALIGN_DOWN'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                          ^~~~~~~~~~
   mm/page_isolation.c:329:56: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                                                        ^~~~~~~~~~~~~~~~~~
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/linux/minmax.h:31:39: note: in definition of macro '__cmp_once'
      31 |                 typeof(x) unique_x = (x);               \
         |                                       ^
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/page_isolation.c:329:22: note: in expansion of macro 'max'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                      ^~~
   include/uapi/linux/const.h:31:41: note: in expansion of macro '__ALIGN_KERNEL_MASK'
      31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
       9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/page_isolation.c:329:26: note: in expansion of macro 'ALIGN_DOWN'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                          ^~~~~~~~~~
   mm/page_isolation.c:329:56: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                                                        ^~~~~~~~~~~~~~~~~~
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/linux/minmax.h:31:39: note: in definition of macro '__cmp_once'
      31 |                 typeof(x) unique_x = (x);               \
         |                                       ^
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/page_isolation.c:329:22: note: in expansion of macro 'max'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                      ^~~
   include/uapi/linux/const.h:31:41: note: in expansion of macro '__ALIGN_KERNEL_MASK'
      31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
       9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/page_isolation.c:329:26: note: in expansion of macro 'ALIGN_DOWN'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                          ^~~~~~~~~~
   mm/page_isolation.c:329:56: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                                                        ^~~~~~~~~~~~~~~~~~
>> include/linux/mmzone.h:33:31: warning: left shift count is negative [-Wshift-count-negative]
      33 | #define MAX_ORDER_NR_PAGES (1 << MAX_ORDER)
         |                               ^~
   include/linux/minmax.h:31:39: note: in definition of macro '__cmp_once'
      31 |                 typeof(x) unique_x = (x);               \
         |                                       ^
   include/linux/minmax.h:74:25: note: in expansion of macro '__careful_cmp'
      74 | #define max(x, y)       __careful_cmp(x, y, >)
         |                         ^~~~~~~~~~~~~
   mm/page_isolation.c:329:22: note: in expansion of macro 'max'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                      ^~~
   include/uapi/linux/const.h:31:41: note: in expansion of macro '__ALIGN_KERNEL_MASK'
      31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (typeof(x))(a) - 1)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/align.h:9:33: note: in expansion of macro '__ALIGN_KERNEL'
       9 | #define ALIGN_DOWN(x, a)        __ALIGN_KERNEL((x) - ((a) - 1), (a))
         |                                 ^~~~~~~~~~~~~~
   mm/page_isolation.c:329:26: note: in expansion of macro 'ALIGN_DOWN'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                          ^~~~~~~~~~
   mm/page_isolation.c:329:56: note: in expansion of macro 'MAX_ORDER_NR_PAGES'
     329 |         start_pfn  = max(ALIGN_DOWN(isolate_pageblock, MAX_ORDER_NR_PAGES),
         |                                                        ^~~~~~~~~~~~~~~~~~
..


vim +16 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10   6  
bc6245e5efd70c Ian Abbott       2017-07-10   7  #ifdef __CHECKER__
bc6245e5efd70c Ian Abbott       2017-07-10   8  #define BUILD_BUG_ON_ZERO(e) (0)
bc6245e5efd70c Ian Abbott       2017-07-10   9  #else /* __CHECKER__ */
bc6245e5efd70c Ian Abbott       2017-07-10  10  /*
bc6245e5efd70c Ian Abbott       2017-07-10  11   * Force a compilation error if condition is true, but also produce a
8788994376d84d Rikard Falkeborn 2019-12-04  12   * result (of value 0 and type int), so the expression can be used
bc6245e5efd70c Ian Abbott       2017-07-10  13   * e.g. in a structure initializer (or where-ever else comma expressions
bc6245e5efd70c Ian Abbott       2017-07-10  14   * aren't permitted).
bc6245e5efd70c Ian Abbott       2017-07-10  15   */
8788994376d84d Rikard Falkeborn 2019-12-04 @16  #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
527edbc18a70e7 Masahiro Yamada  2019-01-03  17  #endif /* __CHECKER__ */
527edbc18a70e7 Masahiro Yamada  2019-01-03  18  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
