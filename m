Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7074047648E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 22:29:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDpKL1tmSz3cRD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 08:29:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=btiPqbbJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=btiPqbbJ; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDpJc4CGbz2yms
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 08:28:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639603712; x=1671139712;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=g/NNFcBw5bc4hIV6nEPi17Es916AkGoKUnMAW4aOk9w=;
 b=btiPqbbJMNHvVkkrv87fLR0R5VuMqPrb0Gx377tNLmc95GL2daTNrBOJ
 YpuIkvkYyzv/KWBqLeuz5S1oAdBPOrxJSmH9KySicDpUleNz9LNQVTobs
 T2jopIZG46PRjnErFl3U3RGkdx9KO/P/lFZua70YRwFb0HugmqYZ/LICh
 8H21AMc3hqBUWrvSGPCfR5Y2dM8xEb6J1j+2WB4pt40COfvVg5gVRx/CN
 eiyhF8EKRWwgjCdQnaBp2tkGxlUCK26qwaHypbEoHrQ7Y+diI9gDZLm18
 KOC9hdzKDKOG6c9aowFOCRXDnKfbGKHBGaTaH5hFo4b+RGAZoBSW7B0J+ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="226198117"
X-IronPort-AV: E=Sophos;i="5.88,209,1635231600"; d="scan'208";a="226198117"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 13:27:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,209,1635231600"; d="scan'208";a="662073815"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 15 Dec 2021 13:27:19 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mxbny-0002MF-Bh; Wed, 15 Dec 2021 21:27:18 +0000
Date: Thu, 16 Dec 2021 05:26:25 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "alex@ghiti.fr" <alex@ghiti.fr>
Subject: Re: [PATCH v5 07/11] powerpc/mm: Use generic_get_unmapped_area() and
 call it from arch_get_unmapped_area()
Message-ID: <202112160557.ANnYN1ZQ-lkp@intel.com>
References: <686895764befff16e9dbc2989e8f8eb2284b38d6.1639550392.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <686895764befff16e9dbc2989e8f8eb2284b38d6.1639550392.git.christophe.leroy@csgroup.eu>
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
Cc: kbuild-all@lists.01.org,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

I love your patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on next-20211214]
[cannot apply to hnaz-mm/master arm64/for-next/core linus/master v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/Convert-powerpc-to-default-topdown-mmap-layout/20211215-144700
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc64-randconfig-m031-20211214 (https://download.01.org/0day-ci/archive/20211216/202112160557.ANnYN1ZQ-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/6b1717476e74918c79cc7d76b009a9e0424a4414
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christophe-Leroy/Convert-powerpc-to-default-topdown-mmap-layout/20211215-144700
        git checkout 6b1717476e74918c79cc7d76b009a9e0424a4414
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/processor.h:71,
                    from arch/powerpc/include/asm/thread_info.h:40,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:55,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/slab.h:15,
                    from mm/mmap.c:13:
   mm/mmap.c: In function 'generic_get_unmapped_area':
>> arch/powerpc/include/asm/task_size_64.h:84:32: warning: suggest parentheses around '&&' within '||' [-Wparentheses]
      84 |          ((flags) & MAP_FIXED) && ((addr) + (len) > DEFAULT_MAP_WINDOW) ? TASK_SIZE : \
         |          ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mmap.c:2142:40: note: in expansion of macro 'arch_get_mmap_end'
    2142 |         const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
         |                                        ^~~~~~~~~~~~~~~~~
   mm/mmap.c: In function 'generic_get_unmapped_area_topdown':
>> arch/powerpc/include/asm/task_size_64.h:84:32: warning: suggest parentheses around '&&' within '||' [-Wparentheses]
      84 |          ((flags) & MAP_FIXED) && ((addr) + (len) > DEFAULT_MAP_WINDOW) ? TASK_SIZE : \
         |          ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mmap.c:2190:40: note: in expansion of macro 'arch_get_mmap_end'
    2190 |         const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
         |                                        ^~~~~~~~~~~~~~~~~


vim +84 arch/powerpc/include/asm/task_size_64.h

    78	
    79	#define arch_get_mmap_base(addr, base) \
    80		(((addr) > DEFAULT_MAP_WINDOW) ? (base) + TASK_SIZE - DEFAULT_MAP_WINDOW : (base))
    81	
    82	#define arch_get_mmap_end(addr, len, flags) \
    83		(((addr) > DEFAULT_MAP_WINDOW) || \
  > 84		 ((flags) & MAP_FIXED) && ((addr) + (len) > DEFAULT_MAP_WINDOW) ? TASK_SIZE : \
    85										  DEFAULT_MAP_WINDOW)
    86	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
