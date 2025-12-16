Return-Path: <linuxppc-dev+bounces-14820-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E60CC3EC7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 16:28:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dW16J2NJZz2yDY;
	Wed, 17 Dec 2025 02:28:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765898904;
	cv=none; b=Z+m0hAJ3hF4yNYNzp6ttnoFy9FURHrC3lMBBJaZuJG3hL591p/tVzvH0qS5pkTTgs+abMTjpQypZ8wPpNh9Kt/a4zr4hXQFze7D+yBcpvUWkRpJDJKpBQrkNVddOKzi+KZnbn5IzndiVHrX9Hs4vcdpNnrRvyhF99b6L/RzEcKWy9qbugXENqKCcz9ff7dzbYh/eU16/d+Y5aaECQTfHMlKk4gg2qnMhSuGWZuxV8RDMLXwlnOH173Y0I+CZb3jhoOQ7LpmLW802IlNR/2MPBiOgZvutSqPzoM/R9VLcSVDR04ktTwu2xbrffqho5ZmeRA/wIpgwAqsZNBzbgBtqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765898904; c=relaxed/relaxed;
	bh=4xBR7s2gCOsT6cGLBMdEb7kJoMwrXCZ2X50ZSJOF9SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1A7ZpdHaNewsBdSlUrZUUMRRxn/JE1S4beamxOSwSrLJNNDcRlL8KB6jgtm3JiKB7HVHNRdxCtF9buchNfUoVNSy1Gx8CS0d/rvUpS7a/osdjnX7xzNFFz9X/IOKvBvBHFJkJ7dhkxJdT4s1L8J1oxbRdfM/XNHcBR3ua9bmkKZ406pIWhdB9KWiuQgZGrMRhO4/ppBM5MlqlZiwgqqgkn9aoVf5d17BOjfikNN4m0vTMGkzHgUYxUBxEVH6VcTTCttHIwquIZQupYqNy4KAuyAkZMO5+VfG/Kzu0BMLuctsA830aHK4/pFNVxA1zz77ifqOuUM9C4KQFjjWbsCxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T8USwZ21; dkim-atps=neutral; spf=pass (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T8USwZ21;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dW16F2sPcz2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 02:28:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765898901; x=1797434901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sD65R5UGhCtay10P/5W+7TM+UmAjlbjVbXwRe2em6yA=;
  b=T8USwZ21NqqiNJYFjgjuXVCZMemR9nkBSAJXi5RNgMM2n1MDBEJXRWNA
   Y4wil+dubFQsGlC6Pr9ULVwH1AiUco+n2lG3ABkzCjPFTibiM523bdQvY
   RelfTYzpHFA+BqtM1/19yWqHYmGAPuoc4M+2wG8Ia+6aYnVTaWB5moJBA
   0dC8o5hhvFFPS0NIE7cgfxbkM43nl3A8Yxy0B3vqa1yvQQNN97MfGjzp1
   Lhzzptn/W6qXJOlMJTE7DfbRPOYXH1Tjf+Ay8FYF+j9NhWVBJ0lYPsuTt
   gnUPtWxLBZtPX3fizZUjXz1GPurwZDbT8+sBI6XbWPKIpQGzhMXTOgIba
   Q==;
X-CSE-ConnectionGUID: HpOC1Sj/QSGlgVxKbwKRjQ==
X-CSE-MsgGUID: u5XP7jImSS29E3cE0tW4kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="79187691"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="79187691"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 07:28:15 -0800
X-CSE-ConnectionGUID: 2xFsI/dBQXKE8DWUTEVNrg==
X-CSE-MsgGUID: HIgAl8RFQHWXgAdjx3aUnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="202458915"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 16 Dec 2025 07:28:08 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVWy6-000000003RG-37cv;
	Tue, 16 Dec 2025 15:28:06 +0000
Date: Tue, 16 Dec 2025 23:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <202512162320.WFgo042e-lkp@intel.com>
References: <20251215163520.1144179-4-ryan.roberts@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215163520.1144179-4-ryan.roberts@arm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Ryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on akpm-mm/mm-everything linus/master v6.19-rc1 next-20251216]
[cannot apply to kees/for-next/hardening kees/for-next/execve]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Roberts/prandom-Convert-prandom_u32_state-to-__always_inline/20251216-013546
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251215163520.1144179-4-ryan.roberts%40arm.com
patch subject: [PATCH v2 3/3] randomize_kstack: Unify random source across arches
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251216/202512162320.WFgo042e-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512162320.WFgo042e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512162320.WFgo042e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/svm/svm.c:5509:1: error: redefinition of '__inittest'
    5509 | module_init(svm_init)
         | ^
   include/linux/module.h:132:42: note: expanded from macro 'module_init'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^
   include/linux/randomize_kstack.h:86:1: note: previous definition is here
      86 | late_initcall(random_kstack_init);
         | ^
   include/linux/module.h:125:28: note: expanded from macro 'late_initcall'
     125 | #define late_initcall(fn)               module_init(fn)
         |                                         ^
   include/linux/module.h:132:42: note: expanded from macro 'module_init'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^
>> arch/x86/kvm/svm/svm.c:5509:1: error: redefinition of 'init_module'
    5509 | module_init(svm_init)
         | ^
   include/linux/module.h:134:6: note: expanded from macro 'module_init'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^
   include/linux/randomize_kstack.h:86:1: note: previous definition is here
      86 | late_initcall(random_kstack_init);
         | ^
   include/linux/module.h:125:28: note: expanded from macro 'late_initcall'
     125 | #define late_initcall(fn)               module_init(fn)
         |                                         ^
   include/linux/module.h:134:6: note: expanded from macro 'module_init'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^
   2 errors generated.
--
>> drivers/misc/sgi-xp/xpc_main.c:1285:1: error: redefinition of '__inittest'
    1285 | module_init(xpc_init);
         | ^
   include/linux/module.h:132:42: note: expanded from macro 'module_init'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^
   include/linux/randomize_kstack.h:86:1: note: previous definition is here
      86 | late_initcall(random_kstack_init);
         | ^
   include/linux/module.h:125:28: note: expanded from macro 'late_initcall'
     125 | #define late_initcall(fn)               module_init(fn)
         |                                         ^
   include/linux/module.h:132:42: note: expanded from macro 'module_init'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^
>> drivers/misc/sgi-xp/xpc_main.c:1285:1: error: redefinition of 'init_module'
    1285 | module_init(xpc_init);
         | ^
   include/linux/module.h:134:6: note: expanded from macro 'module_init'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^
   include/linux/randomize_kstack.h:86:1: note: previous definition is here
      86 | late_initcall(random_kstack_init);
         | ^
   include/linux/module.h:125:28: note: expanded from macro 'late_initcall'
     125 | #define late_initcall(fn)               module_init(fn)
         |                                         ^
   include/linux/module.h:134:6: note: expanded from macro 'module_init'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^
   2 errors generated.


vim +/__inittest +5509 arch/x86/kvm/svm/svm.c

6aa8b732ca01c3d drivers/kvm/svm.c Avi Kivity 2006-12-10  5508  
6aa8b732ca01c3d drivers/kvm/svm.c Avi Kivity 2006-12-10 @5509  module_init(svm_init)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

