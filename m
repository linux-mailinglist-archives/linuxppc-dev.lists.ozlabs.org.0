Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9903B6E54A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 00:20:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0hM73mGTz3f89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 08:20:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i4Yuobev;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=i4Yuobev;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0hLH0490z3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 08:19:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681769975; x=1713305975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yMAw32GB6bnYHTIaJx+3YJu4UkN11Fi/gjV1eDLzAFs=;
  b=i4YuobevaASskwfx/3xl+M2VHPJI8f3b8u82EJGRtexan+3/BonV/MQB
   ZbXYYIEex9/t9v6CbGDecBHymFHSqy5nTXsN4HoezFHd7v06AbCwsthlM
   +bhf1ExoNa19R9WhpwTHYusD1RMuZWKo5rAQV4UJ8SxT//L5fZMf90sKF
   aftpGBpF6IIBTJ3/FTtmXD8WdwHgs+61Qtf/CSiYOxeLFf29fS94N0beq
   dDY/uK93tek1rB0aO6Ua+iWSGmColNqvVR43QxSc2CkA25AYwVRrhq48c
   1qc4+0qLVDEkA7LfME718KcoR09XFP1m8TT73WJhRBajeaJn0Xs2sPNYe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="347767948"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="347767948"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 15:19:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="684313012"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="684313012"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Apr 2023 15:19:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poXBh-000chh-0f;
	Mon, 17 Apr 2023 22:19:05 +0000
Date: Tue, 18 Apr 2023 06:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 24/33] m68k: Convert various functions to use ptdescs
Message-ID: <202304180652.LeoLmaNQ-lkp@intel.com>
References: <20230417205048.15870-25-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417205048.15870-25-vishal.moola@gmail.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on next-20230417]
[cannot apply to s390/features powerpc/next powerpc/fixes geert-m68k/for-next geert-m68k/for-linus linus/master v6.3-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishal-Moola-Oracle/s390-Use-_pt_s390_gaddr-for-gmap-address-tracking/20230418-045832
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230417205048.15870-25-vishal.moola%40gmail.com
patch subject: [PATCH 24/33] m68k: Convert various functions to use ptdescs
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230418/202304180652.LeoLmaNQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/630b38053b213e6138d3deb3e4325b24ad6dcb1f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vishal-Moola-Oracle/s390-Use-_pt_s390_gaddr-for-gmap-address-tracking/20230418-045832
        git checkout 630b38053b213e6138d3deb3e4325b24ad6dcb1f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash arch/m68k/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304180652.LeoLmaNQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/m68k/mm/motorola.c: In function 'free_pointer_table':
>> arch/m68k/mm/motorola.c:204:56: warning: passing argument 1 of 'virt_to_ptdesc' makes pointer from integer without a cast [-Wint-conversion]
     204 |                         ptdesc_pte_dtor(virt_to_ptdesc(page));
         |                                                        ^~~~
         |                                                        |
         |                                                        long unsigned int
   In file included from arch/m68k/mm/motorola.c:15:
   include/linux/mm.h:2721:57: note: expected 'const void *' but argument is of type 'long unsigned int'
    2721 | static inline struct ptdesc *virt_to_ptdesc(const void *x)
         |                                             ~~~~~~~~~~~~^
   arch/m68k/mm/motorola.c: At top level:
   arch/m68k/mm/motorola.c:418:13: warning: no previous prototype for 'paging_init' [-Wmissing-prototypes]
     418 | void __init paging_init(void)
         |             ^~~~~~~~~~~


vim +/virt_to_ptdesc +204 arch/m68k/mm/motorola.c

   185	
   186	int free_pointer_table(void *table, int type)
   187	{
   188		ptable_desc *dp;
   189		unsigned long ptable = (unsigned long)table;
   190		unsigned long page = ptable & PAGE_MASK;
   191		unsigned int mask = 1U << ((ptable - page)/ptable_size(type));
   192	
   193		dp = PD_PTABLE(page);
   194		if (PD_MARKBITS (dp) & mask)
   195			panic ("table already free!");
   196	
   197		PD_MARKBITS (dp) |= mask;
   198	
   199		if (PD_MARKBITS(dp) == ptable_mask(type)) {
   200			/* all tables in page are free, free page */
   201			list_del(dp);
   202			mmu_page_dtor((void *)page);
   203			if (type == TABLE_PTE)
 > 204				ptdesc_pte_dtor(virt_to_ptdesc(page));
   205			free_page (page);
   206			return 1;
   207		} else if (ptable_list[type].next != dp) {
   208			/*
   209			 * move this descriptor to the front of the list, since
   210			 * it has one or more free tables.
   211			 */
   212			list_move(dp, &ptable_list[type]);
   213		}
   214		return 0;
   215	}
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
