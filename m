Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A08481F486
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 05:09:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S42RcjWe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0w4V5bGJz3cFw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 15:09:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=S42RcjWe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0w3f6WpWz30MD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 15:08:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703736511; x=1735272511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OkLCJyJV4KFZFi+9iX4QeHDCYzZK9rcCw39vsKf1N4o=;
  b=S42RcjWedZurYKaLIDHDAmEUlELwoxuDLOqCso7COgQtHse2syXuhI5t
   174fft+Z8lj502G73/9fvv8MiRkqZ2iABPREwYyoRkQjgIYLlTWhuTmCS
   O9NjYZFPiW6sODoOCO3Pu4jTBkHX1kikeTlk3rXK29QrTS08RfSDvhm6W
   WeQvV/8VK21AGHwF1wKxu+MN4EaUDo0oz3kpRglSzf8lvMQdib2m4oTUt
   Ywxcz9c1q85VgGNPf+pn9IUpI4g6iLKZS6o+pS2FMNM9Hc1JDh2YKnie4
   5wvw0J4HLLaupgdm148eTYbdxx5vdI3u3X2K25yfH0Xqsoag75aSs9r6M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="3806748"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="3806748"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2023 20:08:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="921998159"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; 
   d="scan'208";a="921998159"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 27 Dec 2023 20:08:21 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIhgx-000G2F-0i;
	Thu, 28 Dec 2023 04:08:19 +0000
Date: Thu, 28 Dec 2023 12:07:25 +0800
From: kernel test robot <lkp@intel.com>
To: Pingfan Liu <kernelfans@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCHv10 3/3] powerpc/smp: Allow hole in paca_ptrs to
 accommodate boot_cpu
Message-ID: <202312281100.39B8MAEU-lkp@intel.com>
References: <20231227024147.12485-1-kernelfans@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231227024147.12485-1-kernelfans@gmail.com>
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
Cc: Baoquan He <bhe@redhat.com>, Pingfan Liu <piliu@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Ming Lei <ming.lei@redhat.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, oe-kbuild-all@lists.linux.dev, Hari Bathini <hbathini@linux.ibm.com>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Pingfan,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.7-rc7 next-20231222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pingfan-Liu/powerpc-kernel-Remove-check-on-paca_ptrs_size/20231227-104412
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20231227024147.12485-1-kernelfans%40gmail.com
patch subject: [PATCHv10 3/3] powerpc/smp: Allow hole in paca_ptrs to accommodate boot_cpu
config: powerpc-microwatt_defconfig (https://download.01.org/0day-ci/archive/20231228/202312281100.39B8MAEU-lkp@intel.com/config)
compiler: powerpc64le-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231228/202312281100.39B8MAEU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312281100.39B8MAEU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/smp.h:12,
                    from arch/powerpc/kernel/paca.c:6:
   arch/powerpc/kernel/paca.c: In function 'allocate_paca_ptrs':
>> arch/powerpc/kernel/paca.c:248:55: error: 'threads_in_core' undeclared (first use in this function); did you mean 'threads_per_core'?
     248 |         cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
         |                                                       ^~~~~~~~~~~~~~~
   include/linux/compiler.h:236:55: note: in definition of macro '__is_constexpr'
     236 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   include/linux/minmax.h:92:25: note: in expansion of macro '__careful_cmp'
      92 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   arch/powerpc/kernel/paca.c:248:15: note: in expansion of macro 'max'
     248 |         cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
         |               ^~~
   include/uapi/linux/const.h:31:41: note: in expansion of macro '__ALIGN_KERNEL_MASK'
      31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   arch/powerpc/kernel/paca.c:248:33: note: in expansion of macro 'ALIGN'
     248 |         cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
         |                                 ^~~~~
   arch/powerpc/kernel/paca.c:248:55: note: each undeclared identifier is reported only once for each function it appears in
     248 |         cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
         |                                                       ^~~~~~~~~~~~~~~
   include/linux/compiler.h:236:55: note: in definition of macro '__is_constexpr'
     236 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   include/linux/minmax.h:92:25: note: in expansion of macro '__careful_cmp'
      92 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   arch/powerpc/kernel/paca.c:248:15: note: in expansion of macro 'max'
     248 |         cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
         |               ^~~
   include/uapi/linux/const.h:31:41: note: in expansion of macro '__ALIGN_KERNEL_MASK'
      31 | #define __ALIGN_KERNEL(x, a)            __ALIGN_KERNEL_MASK(x, (__typeof__(x))(a) - 1)
         |                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/align.h:8:33: note: in expansion of macro '__ALIGN_KERNEL'
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         |                                 ^~~~~~~~~~~~~~
   arch/powerpc/kernel/paca.c:248:33: note: in expansion of macro 'ALIGN'
     248 |         cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
         |                                 ^~~~~
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:39:10: note: in expansion of macro '__is_signed'
      39 |         (__is_signed(x) == __is_signed(y) ||                    \
         |          ^~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:92:25: note: in expansion of macro '__careful_cmp'
      92 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   arch/powerpc/kernel/paca.c:248:15: note: in expansion of macro 'max'
     248 |         cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
         |               ^~~
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:40:17: note: in expansion of macro '__is_signed'
      40 |                 __is_signed((x) + 0) == __is_signed((y) + 0) || \
         |                 ^~~~~~~~~~~
   include/linux/minmax.h:51:23: note: in expansion of macro '__types_ok'
      51 |         static_assert(__types_ok(x, y),                 \
         |                       ^~~~~~~~~~
   include/linux/minmax.h:58:17: note: in expansion of macro '__cmp_once'
      58 |                 __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
         |                 ^~~~~~~~~~
   include/linux/minmax.h:92:25: note: in expansion of macro '__careful_cmp'
      92 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   arch/powerpc/kernel/paca.c:248:15: note: in expansion of macro 'max'
     248 |         cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
         |               ^~~
   include/linux/minmax.h:31:9: error: first argument to '__builtin_choose_expr' not a constant
      31 |         __builtin_choose_expr(__is_constexpr(is_signed_type(typeof(x))),        \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/minmax.h:51:9: note: in expansion of macro 'static_assert'
      51 |         static_assert(__types_ok(x, y),                 \
         |         ^~~~~~~~~~~~~
   include/linux/minmax.h:36:53: note: in expansion of macro '__is_signed'
      36 |         (__builtin_choose_expr(__is_constexpr(x) && __is_signed(x), x, -1) >= 0)


vim +248 arch/powerpc/kernel/paca.c

   242	
   243	void __init allocate_paca_ptrs(void)
   244	{
   245		unsigned int cnt;
   246	
   247		/* paca_ptrs should be big enough to hold boot cpu */
 > 248		cnt = max((unsigned int)ALIGN(boot_cpuid + 1, threads_in_core), nr_cpu_ids);
   249		paca_last_cpu_num = cnt;
   250		paca_ptrs_size = sizeof(struct paca_struct *) * cnt;
   251		paca_ptrs = memblock_alloc_raw(paca_ptrs_size, SMP_CACHE_BYTES);
   252		if (!paca_ptrs)
   253			panic("Failed to allocate %d bytes for paca pointers\n",
   254			      paca_ptrs_size);
   255	
   256		memset(paca_ptrs, 0x88, paca_ptrs_size);
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
