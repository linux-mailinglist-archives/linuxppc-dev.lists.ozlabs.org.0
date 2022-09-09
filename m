Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF52F5B2C2F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 04:36:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP0Vj71Q7z3c6B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 12:36:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JpKBfFDr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JpKBfFDr;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP0V23rLcz2yWl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 12:35:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662690954; x=1694226954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U1hSfds/0CHqbUVcqtbT2D1gvOsodINiriQZ+MVT87w=;
  b=JpKBfFDrlU8pvpmt236vhJQdA+qmgJ+M46k/znJBgdkPyIBOlzfTMbeA
   ClRl7sr1Q7OezCJbdCU4DRfP6C7IYtfjbe7v0pxI4pr/6mqoL8RJxeAtn
   2u4h5PKxZFBIU669oJHjpcGyjmUIKxbAKkC6N0uVHoEl2mk498PPcZbIZ
   qiwnkd2YfALeou2kV+86MAuoGeRszH7swE3sUMTJdJXRkkXsW7Z6MAoAQ
   CTctPDB7NMV6iIz1ydGOnRbl1tZUPZZGI4ra3i1jNf/ZGDtxQmJZj13M1
   uycmzyw0gkT9N88uJ3iFEID1P1XWQa83Lovzp+Rzz3VUs7pROlpppi2VL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="280405057"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="280405057"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 19:35:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="592436885"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 08 Sep 2022 19:35:43 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWTrq-0000bb-1n;
	Fri, 09 Sep 2022 02:35:42 +0000
Date: Fri, 9 Sep 2022 10:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 19/19] powerpc: Remove impossible mmu_psize_defs[] on
 nohash
Message-ID: <202209091055.Tq3tkK5a-lkp@intel.com>
References: <304d1442c5caa276c87c2caa615fcb6eed96c30c.1662658653.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <304d1442c5caa276c87c2caa615fcb6eed96c30c.1662658653.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/topic/ppc-kvm linus/master v6.0-rc4 next-20220908]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/powerpc-Kconfig-Fix-non-existing-CONFIG_PPC_FSL_BOOKE/20220909-014729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-fsp2_defconfig (https://download.01.org/0day-ci/archive/20220909/202209091055.Tq3tkK5a-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/452a31e5ede29b8b06cd0db37bf68959ce3d753a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christophe-Leroy/powerpc-Kconfig-Fix-non-existing-CONFIG_PPC_FSL_BOOKE/20220909-014729
        git checkout 452a31e5ede29b8b06cd0db37bf68959ce3d753a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   __do_insb
   ^
   arch/powerpc/include/asm/io.h:577:56: note: expanded from macro '__do_insb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/nohash/tlb.c:29:
   In file included from include/linux/highmem.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:640:
   arch/powerpc/include/asm/io-defs.h:45:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:637:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:224:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:578:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/nohash/tlb.c:29:
   In file included from include/linux/highmem.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:640:
   arch/powerpc/include/asm/io-defs.h:47:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:637:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:226:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:579:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/nohash/tlb.c:29:
   In file included from include/linux/highmem.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:640:
   arch/powerpc/include/asm/io-defs.h:49:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:637:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:228:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:580:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/nohash/tlb.c:29:
   In file included from include/linux/highmem.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:640:
   arch/powerpc/include/asm/io-defs.h:51:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:637:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:230:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:581:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/mm/nohash/tlb.c:29:
   In file included from include/linux/highmem.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:640:
   arch/powerpc/include/asm/io-defs.h:53:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:637:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:232:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:582:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> arch/powerpc/mm/nohash/tlb.c:104:9: error: use of undeclared identifier 'mmu_psize_defs'
           return mmu_psize_defs[psize].enc;
                  ^
>> arch/powerpc/mm/nohash/tlb.c:106:2: error: #else without #if
   #else
    ^
>> arch/powerpc/mm/nohash/tlb.c:107:19: error: redefinition of 'mmu_get_tsize'
   static inline int mmu_get_tsize(int psize)
                     ^
   arch/powerpc/mm/nohash/tlb.c:102:19: note: previous definition is here
   static inline int mmu_get_tsize(int psize)
                     ^
>> arch/powerpc/mm/nohash/tlb.c:112:2: error: #endif without #if
   #endif /* CONFIG_PPC_E500 */
    ^
   arch/powerpc/mm/nohash/tlb.c:315:13: error: no previous prototype for function 'early_init_mmu_47x' [-Werror,-Wmissing-prototypes]
   void __init early_init_mmu_47x(void)
               ^
   arch/powerpc/mm/nohash/tlb.c:315:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init early_init_mmu_47x(void)
   ^
   static 
   11 errors generated.


vim +/mmu_psize_defs +104 arch/powerpc/mm/nohash/tlb.c

41151e77a4d96e arch/powerpc/mm/tlb_nohash.c Becky Bruce            2011-06-28  101  
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  102  static inline int mmu_get_tsize(int psize)
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  103  {
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23 @104  	return mmu_psize_defs[psize].enc;
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  105  }
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23 @106  #else
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23 @107  static inline int mmu_get_tsize(int psize)
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  108  {
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  109  	/* This isn't used on !Book3E for now */
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  110  	return 0;
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  111  }
823ee1119f6e4c arch/powerpc/mm/nohash/tlb.c Christophe Leroy       2022-09-08 @112  #endif /* CONFIG_PPC_E500 */
25d21ad6e799cc arch/powerpc/mm/tlb_nohash.c Benjamin Herrenschmidt 2009-07-23  113  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
