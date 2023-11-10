Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE4B7E7DA8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 17:13:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aPtHpc6L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRkQm209vz3dLc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Nov 2023 03:13:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aPtHpc6L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRkPq5Rg4z2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Nov 2023 03:13:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699632784; x=1731168784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wUfYwyCiDGF76qwBnpKb0ZJXikuRl8lLIINyKn84nMo=;
  b=aPtHpc6LsJSsP/b7Go7170th3cbw01ZBSzO/vRDDmGN9MgPDHgDS7mI3
   CM+gubm66km6eoySy9WjWbTaed/Ry6pb3q9NmFKLrCoJOANXugFJMCsgm
   i0ovmoBaE3qK2O6zrDVROlHclsiKcimNpZzP1jx+HExGX5iunzsK8BAld
   fKRRhDbolXkJJrapHCM3V0jvsUdskovoJpLTI0RxqYCXnXHAQ3eKDSH2q
   D1dAGp87KO+o/bZNBbB89UmmO0dTVaEuBE+TcvX1HTIIunk3MlavmFnCb
   JKS+wPYweS2IEueKsH+ghVrjYxllUupsnEsJay3ZrDP4gCp/28Mlq9NR7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="369533672"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="369533672"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 08:12:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="713671678"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="713671678"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Nov 2023 08:12:51 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1U7l-0009iU-0p;
	Fri, 10 Nov 2023 16:12:49 +0000
Date: Sat, 11 Nov 2023 00:12:03 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pratyush Brahma <quic_pbrahma@quicinc.com>,
	Tomas Mudrunka <tomas.mudrunka@gmail.com>,
	Sean Anderson <sean.anderson@seco.com>, x86@kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/8] CMDLINE: add generic builtin command line
Message-ID: <202311102331.GllFaI9t-lkp@intel.com>
References: <20231110013817.2378507-2-danielwa@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110013817.2378507-2-danielwa@cisco.com>
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
Cc: Ruslan Bilovol <rbilovol@cisco.com>, Linux Memory Management List <linux-mm@kvack.org>, xe-linux-external@cisco.com, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Daniel,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.6]
[cannot apply to arm64/for-next/core efi/next tip/x86/core robh/for-next linus/master next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Walker/CMDLINE-add-generic-builtin-command-line/20231110-094423
base:   v6.6
patch link:    https://lore.kernel.org/r/20231110013817.2378507-2-danielwa%40cisco.com
patch subject: [PATCH 1/8] CMDLINE: add generic builtin command line
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231110/202311102331.GllFaI9t-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311102331.GllFaI9t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311102331.GllFaI9t-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:15,
                    from include/linux/interrupt.h:6,
                    from arch/sparc/include/asm/setup.h:8,
                    from lib/generic_cmdline.S:5:
>> include/linux/align.h:8: warning: "ALIGN" redefined
       8 | #define ALIGN(x, a)             __ALIGN_KERNEL((x), (a))
         | 
   In file included from include/linux/export.h:6,
                    from lib/generic_cmdline.S:2:
   include/linux/linkage.h:103: note: this is the location of the previous definition
     103 | #define ALIGN __ALIGN
         | 
   In file included from include/linux/kcsan-checks.h:13,
                    from include/linux/instrumented.h:12,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/sparc/include/asm/bitops_64.h:52,
                    from arch/sparc/include/asm/bitops.h:5,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:22:
>> include/linux/compiler_attributes.h:55: warning: "__always_inline" redefined
      55 | #define __always_inline                 inline __attribute__((__always_inline__))
         | 
   In file included from include/linux/stddef.h:5,
                    from include/linux/kernel.h:18:
   include/uapi/linux/stddef.h:8: note: this is the location of the previous definition
       8 | #define __always_inline inline
         | 
>> include/linux/compiler_attributes.h:91:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
      91 | #if __has_attribute(__copy__)
         |     ^~~~~~~~~~~~~~~
>> include/linux/compiler_attributes.h:91:20: error: missing binary operator before token "("
      91 | #if __has_attribute(__copy__)
         |                    ^
   include/linux/compiler_attributes.h:104:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     104 | #if __has_attribute(__counted_by__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:104:20: error: missing binary operator before token "("
     104 | #if __has_attribute(__counted_by__)
         |                    ^
>> include/linux/compiler_attributes.h:107: warning: "__counted_by" redefined
     107 | # define __counted_by(member)
         | 
   include/uapi/linux/stddef.h:55: note: this is the location of the previous definition
      55 | #define __counted_by(m)
         | 
   include/linux/compiler_attributes.h:116:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     116 | #if __has_attribute(__diagnose_as_builtin__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:116:20: error: missing binary operator before token "("
     116 | #if __has_attribute(__diagnose_as_builtin__)
         |                    ^
   include/linux/compiler_attributes.h:139:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     139 | #if __has_attribute(__designated_init__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:139:20: error: missing binary operator before token "("
     139 | #if __has_attribute(__designated_init__)
         |                    ^
   include/linux/compiler_attributes.h:150:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     150 | #if __has_attribute(__error__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:150:20: error: missing binary operator before token "("
     150 | #if __has_attribute(__error__)
         |                    ^
   include/linux/compiler_attributes.h:161:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     161 | #if __has_attribute(__externally_visible__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:161:20: error: missing binary operator before token "("
     161 | #if __has_attribute(__externally_visible__)
         |                    ^
   include/linux/compiler_attributes.h:198:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     198 | #if __has_attribute(__no_caller_saved_registers__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:198:20: error: missing binary operator before token "("
     198 | #if __has_attribute(__no_caller_saved_registers__)
         |                    ^
   include/linux/compiler_attributes.h:209:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     209 | #if __has_attribute(__noclone__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:209:20: error: missing binary operator before token "("
     209 | #if __has_attribute(__noclone__)
         |                    ^
   include/linux/compiler_attributes.h:226:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     226 | #if __has_attribute(__fallthrough__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:226:20: error: missing binary operator before token "("
     226 | #if __has_attribute(__fallthrough__)
         |                    ^
   include/linux/compiler_attributes.h:252:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     252 | #if __has_attribute(__nonstring__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:252:20: error: missing binary operator before token "("
     252 | #if __has_attribute(__nonstring__)
         |                    ^
   include/linux/compiler_attributes.h:264:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     264 | #if __has_attribute(__no_profile_instrument_function__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:264:20: error: missing binary operator before token "("
     264 | #if __has_attribute(__no_profile_instrument_function__)
         |                    ^
   include/linux/compiler_attributes.h:283:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     283 | #if __has_attribute(__no_stack_protector__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:283:20: error: missing binary operator before token "("
     283 | #if __has_attribute(__no_stack_protector__)
         |                    ^
   include/linux/compiler_attributes.h:294:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     294 | #if __has_attribute(__overloadable__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:294:20: error: missing binary operator before token "("
     294 | #if __has_attribute(__overloadable__)
         |                    ^
   include/linux/compiler_attributes.h:313:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     313 | #if __has_attribute(__pass_dynamic_object_size__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:313:20: error: missing binary operator before token "("
     313 | #if __has_attribute(__pass_dynamic_object_size__)
         |                    ^
   include/linux/compiler_attributes.h:318:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     318 | #if __has_attribute(__pass_object_size__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:318:20: error: missing binary operator before token "("
     318 | #if __has_attribute(__pass_object_size__)
         |                    ^
   include/linux/compiler_attributes.h:363:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     363 | #if __has_attribute(__warning__)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:363:20: error: missing binary operator before token "("
     363 | #if __has_attribute(__warning__)
         |                    ^
   include/linux/compiler_attributes.h:380:5: warning: "__has_attribute" is not defined, evaluates to 0 [-Wundef]
     380 | #if __has_attribute(disable_sanitizer_instrumentation)
         |     ^~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:380:20: error: missing binary operator before token "("
     380 | #if __has_attribute(disable_sanitizer_instrumentation)
         |                    ^


vim +91 include/linux/compiler_attributes.h

86cffecdeaa278 Kees Cook      2021-11-05   45  
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   46  /*
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   47   * Note: users of __always_inline currently do not write "inline" themselves,
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   48   * which seems to be required by gcc to apply the attribute according
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   49   * to its docs (and also "warning: always_inline function might not be
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   50   * inlinable [-Wattributes]" is emitted).
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   51   *
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   52   *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-always_005finline-function-attribute
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   53   * clang: mentioned
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   54   */
a3f8a30f3f0079 Miguel Ojeda   2018-08-30  @55  #define __always_inline                 inline __attribute__((__always_inline__))
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   56  
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   57  /*
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   58   * The second argument is optional (default 0), so we use a variadic macro
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   59   * to make the shorthand.
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   60   *
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   61   * Beware: Do not apply this to functions which may return
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   62   * ERR_PTRs. Also, it is probably unwise to apply it to functions
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   63   * returning extra information in the low bits (but in that case the
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   64   * compiler should see some alignment anyway, when the return value is
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   65   * massaged by 'flags = ptr & 3; ptr &= ~3;').
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   66   *
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   67   *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-assume_005faligned-function-attribute
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   68   * clang: https://clang.llvm.org/docs/AttributeReference.html#assume-aligned
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   69   */
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   70  #define __assume_aligned(a, ...)        __attribute__((__assume_aligned__(a, ## __VA_ARGS__)))
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   71  
54da6a0924311c Peter Zijlstra 2023-05-26   72  /*
54da6a0924311c Peter Zijlstra 2023-05-26   73   *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html#index-cleanup-variable-attribute
54da6a0924311c Peter Zijlstra 2023-05-26   74   * clang: https://clang.llvm.org/docs/AttributeReference.html#cleanup
54da6a0924311c Peter Zijlstra 2023-05-26   75   */
54da6a0924311c Peter Zijlstra 2023-05-26   76  #define __cleanup(func)			__attribute__((__cleanup__(func)))
54da6a0924311c Peter Zijlstra 2023-05-26   77  
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   78  /*
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   79   * Note the long name.
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   80   *
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   81   *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-const-function-attribute
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   82   */
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   83  #define __attribute_const__             __attribute__((__const__))
a3f8a30f3f0079 Miguel Ojeda   2018-08-30   84  
c0d9782f5b6d71 Miguel Ojeda   2019-02-08   85  /*
c0d9782f5b6d71 Miguel Ojeda   2019-02-08   86   * Optional: only supported since gcc >= 9
c0d9782f5b6d71 Miguel Ojeda   2019-02-08   87   * Optional: not supported by clang
c0d9782f5b6d71 Miguel Ojeda   2019-02-08   88   *
c0d9782f5b6d71 Miguel Ojeda   2019-02-08   89   *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-copy-function-attribute
c0d9782f5b6d71 Miguel Ojeda   2019-02-08   90   */
c0d9782f5b6d71 Miguel Ojeda   2019-02-08  @91  #if __has_attribute(__copy__)
c0d9782f5b6d71 Miguel Ojeda   2019-02-08   92  # define __copy(symbol)                 __attribute__((__copy__(symbol)))
c0d9782f5b6d71 Miguel Ojeda   2019-02-08   93  #else
c0d9782f5b6d71 Miguel Ojeda   2019-02-08   94  # define __copy(symbol)
c0d9782f5b6d71 Miguel Ojeda   2019-02-08   95  #endif
c0d9782f5b6d71 Miguel Ojeda   2019-02-08   96  
c8248faf3ca276 Kees Cook      2023-08-17   97  /*
c8248faf3ca276 Kees Cook      2023-08-17   98   * Optional: only supported since gcc >= 14
c8248faf3ca276 Kees Cook      2023-08-17   99   * Optional: only supported since clang >= 18
c8248faf3ca276 Kees Cook      2023-08-17  100   *
c8248faf3ca276 Kees Cook      2023-08-17  101   *   gcc: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108896
c8248faf3ca276 Kees Cook      2023-08-17  102   * clang: https://reviews.llvm.org/D148381
c8248faf3ca276 Kees Cook      2023-08-17  103   */
c8248faf3ca276 Kees Cook      2023-08-17  104  #if __has_attribute(__counted_by__)
c8248faf3ca276 Kees Cook      2023-08-17  105  # define __counted_by(member)		__attribute__((__counted_by__(member)))
c8248faf3ca276 Kees Cook      2023-08-17  106  #else
c8248faf3ca276 Kees Cook      2023-08-17 @107  # define __counted_by(member)
c8248faf3ca276 Kees Cook      2023-08-17  108  #endif
c8248faf3ca276 Kees Cook      2023-08-17  109  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
