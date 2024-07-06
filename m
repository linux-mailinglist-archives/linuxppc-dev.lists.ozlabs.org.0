Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AAB92922E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 11:17:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ImE7yGJY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGPsx4qN6z3cVD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 19:17:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ImE7yGJY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGPsC5k9qz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2024 19:16:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720257408; x=1751793408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mSOe5IL52tQA3CSWmiOZHQq3AKs7OVITM1J54jxHzi0=;
  b=ImE7yGJY+IrO37oXXA0Ms3mt9d02ikbdeqCn0KvjMxY4sB4tdhu6x2Ju
   qLCcyv34xK5y9SKMZYGocQ5xVNiPXh09IH0jG9Sv6WkKf8nPiVGw3PbQJ
   MxihaZogXxmYzMsRiZ+g/uCqfQATQYpm92kBT9tKuInSHtvBcsImpLRrC
   Y9P79hdwR4dVKe/4pCPVLxTy8SAUjjc3nrOa2JOfeM2xWO3yVT2oZczB7
   2CavZuiDEE8c6HSXnx6HuIBxX83/Uf0aUtXIuIn+djNQT0Udl7oOeYDRI
   gsjfIzAiKmtvN+7ITZU90uvH8m6hiMN11tYZeMFQ0aKLpbEkyaVQHUO6E
   A==;
X-CSE-ConnectionGUID: baGpJLAzTz+1F9n5IaFBqA==
X-CSE-MsgGUID: X/V6aG5NSwajhPgY4iLimw==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="20430089"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="20430089"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 02:16:42 -0700
X-CSE-ConnectionGUID: eg+P6/jNRVOu0yid8K+2YA==
X-CSE-MsgGUID: pRuJzgJKTeKhngIITJkerQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="46992364"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Jul 2024 02:16:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQ1X0-000TXk-04;
	Sat, 06 Jul 2024 09:16:34 +0000
Date: Sat, 6 Jul 2024 17:16:15 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2 7/8] mm/x86: Add missing pud helpers
Message-ID: <202407061716.WH5NMiL2-lkp@intel.com>
References: <20240703212918.2417843-8-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703212918.2417843-8-peterx@redhat.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Linux Memory Management List <linux-mm@kvack.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, oe-kbuild-all@lists.linux.dev, "Kirill A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Peter,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Xu/mm-dax-Dump-start-address-in-fault-handler/20240705-013812
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240703212918.2417843-8-peterx%40redhat.com
patch subject: [PATCH v2 7/8] mm/x86: Add missing pud helpers
config: i386-randconfig-011-20240706 (https://download.01.org/0day-ci/archive/20240706/202407061716.WH5NMiL2-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407061716.WH5NMiL2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407061716.WH5NMiL2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/atomic.h:8,
                    from include/linux/atomic.h:7,
                    from include/linux/jump_label.h:256,
                    from include/linux/static_key.h:1,
                    from arch/x86/include/asm/nospec-branch.h:6,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/x86/mm/pgtable.c:2:
   In function 'pudp_establish',
       inlined from 'pudp_invalidate' at arch/x86/mm/pgtable.c:649:14:
>> arch/x86/include/asm/cmpxchg.h:67:25: error: call to '__xchg_wrong_size' declared with attribute error: Bad argument size for xchg
      67 |                         __ ## op ## _wrong_size();                      \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4758:9: note: in expansion of macro 'raw_xchg'
    4758 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   arch/x86/include/asm/pgtable.h:1415:24: note: in expansion of macro 'xchg'
    1415 |                 return xchg(pudp, pud);
         |                        ^~~~


vim +/__xchg_wrong_size +67 arch/x86/include/asm/cmpxchg.h

e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  37  
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  38  /* 
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  39   * An exchange-type operation, which takes a value and a pointer, and
7f5281ae8a8e7f8 Li Zhong            2013-04-25  40   * returns the old value.
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  41   */
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  42  #define __xchg_op(ptr, arg, op, lock)					\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  43  	({								\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  44  	        __typeof__ (*(ptr)) __ret = (arg);			\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  45  		switch (sizeof(*(ptr))) {				\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  46  		case __X86_CASE_B:					\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  47  			asm volatile (lock #op "b %b0, %1\n"		\
2ca052a3710fac2 Jeremy Fitzhardinge 2012-04-02  48  				      : "+q" (__ret), "+m" (*(ptr))	\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  49  				      : : "memory", "cc");		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  50  			break;						\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  51  		case __X86_CASE_W:					\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  52  			asm volatile (lock #op "w %w0, %1\n"		\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  53  				      : "+r" (__ret), "+m" (*(ptr))	\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  54  				      : : "memory", "cc");		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  55  			break;						\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  56  		case __X86_CASE_L:					\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  57  			asm volatile (lock #op "l %0, %1\n"		\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  58  				      : "+r" (__ret), "+m" (*(ptr))	\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  59  				      : : "memory", "cc");		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  60  			break;						\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  61  		case __X86_CASE_Q:					\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  62  			asm volatile (lock #op "q %q0, %1\n"		\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  63  				      : "+r" (__ret), "+m" (*(ptr))	\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  64  				      : : "memory", "cc");		\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  65  			break;						\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  66  		default:						\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30 @67  			__ ## op ## _wrong_size();			\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  68  		}							\
31a8394e069e47d Jeremy Fitzhardinge 2011-09-30  69  		__ret;							\
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  70  	})
e9826380d83d1bd Jeremy Fitzhardinge 2011-08-18  71  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
