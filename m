Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0D0826005
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jan 2024 16:00:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nm7DdId9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T6k5q67z5z3cVP
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jan 2024 02:00:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nm7DdId9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T6k4k43KVz3cPk
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jan 2024 01:59:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704553175; x=1736089175;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L+NhauzROGdh6WMc7Chr9nsrwmmGekgWgJHHxIaCxsU=;
  b=nm7DdId9Cj7o7sadPu8g4XlGaCFRTkWB/q6YPAnXdVAgETXUmF/yEfI1
   b2Qv7889+PSG7JeGM+e8zZfUVrhEoqOj8VWoyce8C0QHg+ikl5Y1G/XZh
   vu4gQXvRI3UgmPRhI+H00sOSf0gvGie2anGoKt7RdcoILtX0pnnJ/BneB
   aFKvW+Co3LtbUbrfjrPtLCOpl16scbIllaqChBH1vMAYEUCb28bgaTv/s
   ELfBWNIXKRE1nZVmiSqn+DW/5LagiZfCDrTkvKK0RQklZN55iwP+NNzBQ
   fo24tV9+C7mFowbiXeq3kGFpIVPaqlxda0fqTBA0TN3DIqHSg0dALzsEQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="461960327"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="461960327"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 06:59:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="815204441"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="815204441"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 06 Jan 2024 06:58:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rM88W-0002bg-1Z;
	Sat, 06 Jan 2024 14:58:56 +0000
Date: Sat, 6 Jan 2024 22:58:54 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] kexec_core: move kdump related codes from
 crash_core.c to kexec_core.c
Message-ID: <202401062212.LXqinfjE-lkp@intel.com>
References: <20240105103305.557273-2-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105103305.557273-2-bhe@redhat.com>
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
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org, Baoquan He <bhe@redhat.com>, arnd@arndb.de, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, kexec@lists.infradead.org, linux-fsdevel@vger.kernel.org, viro@zeniv.linux.org.uk, oe-kbuild-all@lists.linux.dev, eric_devolder@yahoo.com, akpm@linux-foundation.org, ignat@cloudflare.com, linux-riscv@lists.infradead.org, hbathini@linux.ibm.com, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Baoquan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7-rc8]
[cannot apply to powerpc/next powerpc/fixes tip/x86/core arm64/for-next/core next-20240105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/kexec_core-move-kdump-related-codes-from-crash_core-c-to-kexec_core-c/20240105-223735
base:   linus/master
patch link:    https://lore.kernel.org/r/20240105103305.557273-2-bhe%40redhat.com
patch subject: [PATCH 1/5] kexec_core: move kdump related codes from crash_core.c to kexec_core.c
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240106/202401062212.LXqinfjE-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240106/202401062212.LXqinfjE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401062212.LXqinfjE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/crash.c:154:17: error: invalid application of 'sizeof' to an incomplete type 'struct crash_mem'
     154 |         cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:293:9: note: expanded from macro 'struct_size'
     293 |                 sizeof(*(p)) + flex_array_size(p, member, count),       \
         |                       ^~~~~~
   arch/x86/kernel/crash.c:140:15: note: forward declaration of 'struct crash_mem'
     140 | static struct crash_mem *fill_up_crash_elf_data(void)
         |               ^
>> arch/x86/kernel/crash.c:154:17: error: incomplete definition of type 'struct crash_mem'
     154 |         cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:293:18: note: expanded from macro 'struct_size'
     293 |                 sizeof(*(p)) + flex_array_size(p, member, count),       \
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:277:24: note: expanded from macro 'flex_array_size'
     277 |                 (count) * sizeof(*(p)->member) + __must_be_array((p)->member),  \
         |                                   ~~~^
   arch/x86/kernel/crash.c:140:15: note: forward declaration of 'struct crash_mem'
     140 | static struct crash_mem *fill_up_crash_elf_data(void)
         |               ^
>> arch/x86/kernel/crash.c:154:17: error: incomplete definition of type 'struct crash_mem'
     154 |         cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:293:18: note: expanded from macro 'struct_size'
     293 |                 sizeof(*(p)) + flex_array_size(p, member, count),       \
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:277:55: note: expanded from macro 'flex_array_size'
     277 |                 (count) * sizeof(*(p)->member) + __must_be_array((p)->member),  \
         |                                                  ~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/compiler.h:228:59: note: expanded from macro '__must_be_array'
     228 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   include/linux/compiler_types.h:376:63: note: expanded from macro '__same_type'
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:16:62: note: expanded from macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
   arch/x86/kernel/crash.c:140:15: note: forward declaration of 'struct crash_mem'
     140 | static struct crash_mem *fill_up_crash_elf_data(void)
         |               ^
>> arch/x86/kernel/crash.c:154:17: error: incomplete definition of type 'struct crash_mem'
     154 |         cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:293:18: note: expanded from macro 'struct_size'
     293 |                 sizeof(*(p)) + flex_array_size(p, member, count),       \
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:278:30: note: expanded from macro 'flex_array_size'
     278 |                 size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
         |                                         ~~~^
   arch/x86/kernel/crash.c:140:15: note: forward declaration of 'struct crash_mem'
     140 | static struct crash_mem *fill_up_crash_elf_data(void)
         |               ^
>> arch/x86/kernel/crash.c:154:17: error: incomplete definition of type 'struct crash_mem'
     154 |         cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:293:18: note: expanded from macro 'struct_size'
     293 |                 sizeof(*(p)) + flex_array_size(p, member, count),       \
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/overflow.h:278:61: note: expanded from macro 'flex_array_size'
     278 |                 size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
         |                                                        ~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/compiler.h:228:59: note: expanded from macro '__must_be_array'
     228 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   include/linux/compiler_types.h:376:63: note: expanded from macro '__same_type'
     376 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:16:62: note: expanded from macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
   arch/x86/kernel/crash.c:140:15: note: forward declaration of 'struct crash_mem'
     140 | static struct crash_mem *fill_up_crash_elf_data(void)
         |               ^
   arch/x86/kernel/crash.c:158:6: error: incomplete definition of type 'struct crash_mem'
     158 |         cmem->max_nr_ranges = nr_ranges;
         |         ~~~~^
   arch/x86/kernel/crash.c:140:15: note: forward declaration of 'struct crash_mem'
     140 | static struct crash_mem *fill_up_crash_elf_data(void)
         |               ^
   arch/x86/kernel/crash.c:159:6: error: incomplete definition of type 'struct crash_mem'
     159 |         cmem->nr_ranges = 0;
         |         ~~~~^
   arch/x86/kernel/crash.c:140:15: note: forward declaration of 'struct crash_mem'
     140 | static struct crash_mem *fill_up_crash_elf_data(void)
         |               ^
>> arch/x86/kernel/crash.c:173:8: error: call to undeclared function 'crash_exclude_mem_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     173 |         ret = crash_exclude_mem_range(cmem, 0, (1<<20)-1);
         |               ^
   arch/x86/kernel/crash.c:193:6: error: incomplete definition of type 'struct crash_mem'
     193 |         cmem->ranges[cmem->nr_ranges].start = res->start;
         |         ~~~~^
   arch/x86/kernel/crash.c:140:15: note: forward declaration of 'struct crash_mem'
     140 | static struct crash_mem *fill_up_crash_elf_data(void)
         |               ^
   arch/x86/kernel/crash.c:193:19: error: incomplete definition of type 'struct crash_mem'
     193 |         cmem->ranges[cmem->nr_ranges].start = res->start;
         |                      ~~~~^
   arch/x86/kernel/crash.c:140:15: note: forward declaration of 'struct crash_mem'
     140 | static struct crash_mem *fill_up_crash_elf_data(void)
         |               ^
   arch/x86/kernel/crash.c:194:6: error: incomplete definition of type 'struct crash_mem'
     194 |         cmem->ranges[cmem->nr_ranges].end = res->end;
         |         ~~~~^
   arch/x86/kernel/crash.c:140:15: note: forward declaration of 'struct crash_mem'
     140 | static struct crash_mem *fill_up_crash_elf_data(void)
         |               ^
   arch/x86/kernel/crash.c:194:19: error: incomplete definition of type 'struct crash_mem'
     194 |         cmem->ranges[cmem->nr_ranges].end = res->end;
         |                      ~~~~^
   arch/x86/kernel/crash.c:140:15: note: forward declaration of 'struct crash_mem'
     140 | static struct crash_mem *fill_up_crash_elf_data(void)
         |               ^
   arch/x86/kernel/crash.c:195:6: error: incomplete definition of type 'struct crash_mem'
     195 |         cmem->nr_ranges++;
         |         ~~~~^
   arch/x86/kernel/crash.c:140:15: note: forward declaration of 'struct crash_mem'
     140 | static struct crash_mem *fill_up_crash_elf_data(void)
         |               ^
   arch/x86/kernel/crash.c:221:23: error: incomplete definition of type 'struct crash_mem'
     221 |         *nr_mem_ranges = cmem->nr_ranges;
         |                          ~~~~^
   arch/x86/kernel/crash.c:140:15: note: forward declaration of 'struct crash_mem'
     140 | static struct crash_mem *fill_up_crash_elf_data(void)
         |               ^
>> arch/x86/kernel/crash.c:224:9: error: call to undeclared function 'crash_prepare_elf64_headers'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     224 |         ret =  crash_prepare_elf64_headers(cmem, IS_ENABLED(CONFIG_X86_64), addr, sz);
         |                ^
   arch/x86/kernel/crash.c:224:9: note: did you mean 'prepare_elf_headers'?
   arch/x86/kernel/crash.c:201:12: note: 'prepare_elf_headers' declared here
     201 | static int prepare_elf_headers(struct kimage *image, void **addr,
         |            ^
   15 errors generated.


vim +154 arch/x86/kernel/crash.c

dd5f726076cc76 Vivek Goyal         2014-08-08  138  
dd5f726076cc76 Vivek Goyal         2014-08-08  139  /* Gather all the required information to prepare elf headers for ram regions */
8d5f894a3108ac AKASHI Takahiro     2018-04-13 @140  static struct crash_mem *fill_up_crash_elf_data(void)
dd5f726076cc76 Vivek Goyal         2014-08-08  141  {
dd5f726076cc76 Vivek Goyal         2014-08-08  142  	unsigned int nr_ranges = 0;
8d5f894a3108ac AKASHI Takahiro     2018-04-13  143  	struct crash_mem *cmem;
dd5f726076cc76 Vivek Goyal         2014-08-08  144  
9eff303725da65 Borislav Petkov     2019-11-14  145  	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
8d5f894a3108ac AKASHI Takahiro     2018-04-13  146  	if (!nr_ranges)
8d5f894a3108ac AKASHI Takahiro     2018-04-13  147  		return NULL;
dd5f726076cc76 Vivek Goyal         2014-08-08  148  
8d5f894a3108ac AKASHI Takahiro     2018-04-13  149  	/*
8d5f894a3108ac AKASHI Takahiro     2018-04-13  150  	 * Exclusion of crash region and/or crashk_low_res may cause
8d5f894a3108ac AKASHI Takahiro     2018-04-13  151  	 * another range split. So add extra two slots here.
8d5f894a3108ac AKASHI Takahiro     2018-04-13  152  	 */
8d5f894a3108ac AKASHI Takahiro     2018-04-13  153  	nr_ranges += 2;
4df4309587e18a Gustavo A. R. Silva 2019-04-03 @154  	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
8d5f894a3108ac AKASHI Takahiro     2018-04-13  155  	if (!cmem)
8d5f894a3108ac AKASHI Takahiro     2018-04-13  156  		return NULL;
dd5f726076cc76 Vivek Goyal         2014-08-08  157  
8d5f894a3108ac AKASHI Takahiro     2018-04-13  158  	cmem->max_nr_ranges = nr_ranges;
8d5f894a3108ac AKASHI Takahiro     2018-04-13  159  	cmem->nr_ranges = 0;
dd5f726076cc76 Vivek Goyal         2014-08-08  160  
8d5f894a3108ac AKASHI Takahiro     2018-04-13  161  	return cmem;
dd5f726076cc76 Vivek Goyal         2014-08-08  162  }
dd5f726076cc76 Vivek Goyal         2014-08-08  163  
dd5f726076cc76 Vivek Goyal         2014-08-08  164  /*
dd5f726076cc76 Vivek Goyal         2014-08-08  165   * Look for any unwanted ranges between mstart, mend and remove them. This
8d5f894a3108ac AKASHI Takahiro     2018-04-13  166   * might lead to split and split ranges are put in cmem->ranges[] array
dd5f726076cc76 Vivek Goyal         2014-08-08  167   */
8d5f894a3108ac AKASHI Takahiro     2018-04-13  168  static int elf_header_exclude_ranges(struct crash_mem *cmem)
dd5f726076cc76 Vivek Goyal         2014-08-08  169  {
dd5f726076cc76 Vivek Goyal         2014-08-08  170  	int ret = 0;
dd5f726076cc76 Vivek Goyal         2014-08-08  171  
7c321eb2b843bf Lianbo Jiang        2019-11-08  172  	/* Exclude the low 1M because it is always reserved */
a3e1c3bb24e2ff Lianbo Jiang        2020-08-04 @173  	ret = crash_exclude_mem_range(cmem, 0, (1<<20)-1);
7c321eb2b843bf Lianbo Jiang        2019-11-08  174  	if (ret)
7c321eb2b843bf Lianbo Jiang        2019-11-08  175  		return ret;
7c321eb2b843bf Lianbo Jiang        2019-11-08  176  
dd5f726076cc76 Vivek Goyal         2014-08-08  177  	/* Exclude crashkernel region */
babac4a84a8884 AKASHI Takahiro     2018-04-13  178  	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
dd5f726076cc76 Vivek Goyal         2014-08-08  179  	if (ret)
dd5f726076cc76 Vivek Goyal         2014-08-08  180  		return ret;
dd5f726076cc76 Vivek Goyal         2014-08-08  181  
9eff303725da65 Borislav Petkov     2019-11-14  182  	if (crashk_low_res.end)
babac4a84a8884 AKASHI Takahiro     2018-04-13  183  		ret = crash_exclude_mem_range(cmem, crashk_low_res.start,
babac4a84a8884 AKASHI Takahiro     2018-04-13  184  					      crashk_low_res.end);
dd5f726076cc76 Vivek Goyal         2014-08-08  185  
dd5f726076cc76 Vivek Goyal         2014-08-08  186  	return ret;
dd5f726076cc76 Vivek Goyal         2014-08-08  187  }
dd5f726076cc76 Vivek Goyal         2014-08-08  188  
1d2e733b13b450 Tom Lendacky        2017-10-20  189  static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
dd5f726076cc76 Vivek Goyal         2014-08-08  190  {
8d5f894a3108ac AKASHI Takahiro     2018-04-13  191  	struct crash_mem *cmem = arg;
dd5f726076cc76 Vivek Goyal         2014-08-08  192  
cbe6601617302b AKASHI Takahiro     2018-04-13  193  	cmem->ranges[cmem->nr_ranges].start = res->start;
cbe6601617302b AKASHI Takahiro     2018-04-13  194  	cmem->ranges[cmem->nr_ranges].end = res->end;
cbe6601617302b AKASHI Takahiro     2018-04-13  195  	cmem->nr_ranges++;
dd5f726076cc76 Vivek Goyal         2014-08-08  196  
cbe6601617302b AKASHI Takahiro     2018-04-13  197  	return 0;
dd5f726076cc76 Vivek Goyal         2014-08-08  198  }
dd5f726076cc76 Vivek Goyal         2014-08-08  199  
dd5f726076cc76 Vivek Goyal         2014-08-08  200  /* Prepare elf headers. Return addr and size */
dd5f726076cc76 Vivek Goyal         2014-08-08  201  static int prepare_elf_headers(struct kimage *image, void **addr,
ea53ad9cf73b6b Eric DeVolder       2023-08-14  202  					unsigned long *sz, unsigned long *nr_mem_ranges)
dd5f726076cc76 Vivek Goyal         2014-08-08  203  {
8d5f894a3108ac AKASHI Takahiro     2018-04-13  204  	struct crash_mem *cmem;
7c321eb2b843bf Lianbo Jiang        2019-11-08  205  	int ret;
dd5f726076cc76 Vivek Goyal         2014-08-08  206  
8d5f894a3108ac AKASHI Takahiro     2018-04-13  207  	cmem = fill_up_crash_elf_data();
8d5f894a3108ac AKASHI Takahiro     2018-04-13  208  	if (!cmem)
dd5f726076cc76 Vivek Goyal         2014-08-08  209  		return -ENOMEM;
dd5f726076cc76 Vivek Goyal         2014-08-08  210  
9eff303725da65 Borislav Petkov     2019-11-14  211  	ret = walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
cbe6601617302b AKASHI Takahiro     2018-04-13  212  	if (ret)
cbe6601617302b AKASHI Takahiro     2018-04-13  213  		goto out;
cbe6601617302b AKASHI Takahiro     2018-04-13  214  
cbe6601617302b AKASHI Takahiro     2018-04-13  215  	/* Exclude unwanted mem ranges */
8d5f894a3108ac AKASHI Takahiro     2018-04-13  216  	ret = elf_header_exclude_ranges(cmem);
cbe6601617302b AKASHI Takahiro     2018-04-13  217  	if (ret)
cbe6601617302b AKASHI Takahiro     2018-04-13  218  		goto out;
cbe6601617302b AKASHI Takahiro     2018-04-13  219  
ea53ad9cf73b6b Eric DeVolder       2023-08-14  220  	/* Return the computed number of memory ranges, for hotplug usage */
ea53ad9cf73b6b Eric DeVolder       2023-08-14  221  	*nr_mem_ranges = cmem->nr_ranges;
ea53ad9cf73b6b Eric DeVolder       2023-08-14  222  
dd5f726076cc76 Vivek Goyal         2014-08-08  223  	/* By default prepare 64bit headers */
9eff303725da65 Borislav Petkov     2019-11-14 @224  	ret =  crash_prepare_elf64_headers(cmem, IS_ENABLED(CONFIG_X86_64), addr, sz);
cbe6601617302b AKASHI Takahiro     2018-04-13  225  
cbe6601617302b AKASHI Takahiro     2018-04-13  226  out:
8d5f894a3108ac AKASHI Takahiro     2018-04-13  227  	vfree(cmem);
dd5f726076cc76 Vivek Goyal         2014-08-08  228  	return ret;
dd5f726076cc76 Vivek Goyal         2014-08-08  229  }
ea53ad9cf73b6b Eric DeVolder       2023-08-14  230  #endif
dd5f726076cc76 Vivek Goyal         2014-08-08  231  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
