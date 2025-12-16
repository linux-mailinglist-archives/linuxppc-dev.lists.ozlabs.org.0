Return-Path: <linuxppc-dev+bounces-14821-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F11CC44E0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 17:32:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dW2Wz6Rrmz2yF1;
	Wed, 17 Dec 2025 03:32:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765902735;
	cv=none; b=bDdKMAjm5AS+34eC3MIawZKu6hACAsUoE7OWu1byk62bKn/UbwVg1oCPVjEwLJJcr2p+z6mV+MhcldHj8fwztE0bGGPLp0xrZ+9rgdwJF5mef2upvtOf+k6wTV0DG/SakOunwzXJn/Km4I7H6uUwRos+nTTzlMrXL2+eKLuSIM9Q56mRHwRemLpoulFWKoHzRicV9u1uR9OR4jUTPXfbeLvECzVunXCH5lurr2ZfrMlJvqG014kosspRsIwI/mpD0FTFwFlRqPP9AYfxu1aRSQiQ8+aaUbd+lx7QM6TQ08srSk3hS6Txgp4lpWOQCbNGUc6ZBs7oEyOJ+EJcxy6aRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765902735; c=relaxed/relaxed;
	bh=eZRUio5zfRZF4Wp0TXIUZCi5a4FZapbOokb+FP2/ep4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lb2sCJRe1+ghasdTLwutsXs4tlZYLx0vEQaczeVbfQNP6MKhnFz37yMl7bJizHND9csT7kuOpelcpoSXNuYoSqGCl+tdk7N1CuGhH1spdGee0bVz4HI3c6AwpMlJitpSS8KnH7qqcrXoK+iuAnIKio8X0qvJcnUx9EMfht2flMtvAdrLMtc8jUJ3Rpk657tY057svEQR8kwOUJkNl1dsHSJhw3XY5imC1aNHErPnAp410YNJ3m/WKCbRLeEPxSwwzZGlA2/GXTW2HUoy37WNPfdFw9A+KeeBYV8YLOQqHfrFCmYqa9GN+VtxVrxM7DMwTO73FsgeomcklT2uIwM3RA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z+99b0hC; dkim-atps=neutral; spf=pass (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z+99b0hC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dW2Ww6gYKz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 03:32:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765902733; x=1797438733;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BYYyvPXCv/z3Zv/yIQlMx58UIuXYnnZWL+o4/ZYGJM8=;
  b=Z+99b0hC+e2NnQDrBkBq0MNdXkdSehLOevLD9AyTjyIHAvjd+3F4nEru
   wJtkhchXww24a4QjqF2fzTcBFj4NyJsEQ+OxTIThIutW4aD3J2EC+iWR8
   aUTBhfxSQiXtAaiq5IT/AcqkDt+XTQ3ZIFUsu6yF+DO94xsBYoZYEzKXc
   oltcmYfVHUAaWdXWcUgcDTp5NL74JICJHtorpB6JOxORlDkzWqoSETOEn
   rfiOdSjTiuzCWyWNxM0AmvGp6qH+tB9tw/wPx2W1YL75LZNIvDZPFLDzX
   DeC7f3vJnMCZ3Yy1zY1lF1Vd/dHOpbCqEZOr4OrzZPtv0dzSj322412Q6
   w==;
X-CSE-ConnectionGUID: aoRVZK3iQ0KnuPTACqvYeg==
X-CSE-MsgGUID: TdHgEYftRtOoLqXQjAjBlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67868239"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="67868239"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 08:32:07 -0800
X-CSE-ConnectionGUID: hOe0vqPVR7CciV+fTWvORw==
X-CSE-MsgGUID: v02B96M3SIa8VhPps1uokQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="197808734"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Dec 2025 08:32:00 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVXxu-000000003YO-0J5B;
	Tue, 16 Dec 2025 16:31:58 +0000
Date: Wed, 17 Dec 2025 00:31:27 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <202512170038.vJZdUhEN-lkp@intel.com>
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
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251217/202512170038.vJZdUhEN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170038.vJZdUhEN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170038.vJZdUhEN-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> arch/x86/boot/startup/sev-startup.o: warning: objtool: section .discard.addressable has absolute relocation at offset 0x0
--
   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/resume_user_mode.h:8,
                    from include/linux/entry-virt.h:6,
                    from include/linux/kvm_host.h:5,
                    from arch/x86/kvm/svm/svm.c:3:
>> include/linux/module.h:132:49: error: redefinition of '__inittest'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   arch/x86/kvm/svm/svm.c:5509:1: note: in expansion of macro 'module_init'
    5509 | module_init(svm_init)
         | ^~~~~~~~~~~
   include/linux/module.h:132:49: note: previous definition of '__inittest' with type 'int (*(void))(void)'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/module.h:125:41: note: in expansion of macro 'module_init'
     125 | #define late_initcall(fn)               module_init(fn)
         |                                         ^~~~~~~~~~~
   include/linux/randomize_kstack.h:86:1: note: in expansion of macro 'late_initcall'
      86 | late_initcall(random_kstack_init);
         | ^~~~~~~~~~~~~
>> include/linux/module.h:134:13: error: redefinition of 'init_module'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   arch/x86/kvm/svm/svm.c:5509:1: note: in expansion of macro 'module_init'
    5509 | module_init(svm_init)
         | ^~~~~~~~~~~
   include/linux/module.h:134:13: note: previous definition of 'init_module' with type 'int(void)'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/module.h:125:41: note: in expansion of macro 'module_init'
     125 | #define late_initcall(fn)               module_init(fn)
         |                                         ^~~~~~~~~~~
   include/linux/randomize_kstack.h:86:1: note: in expansion of macro 'late_initcall'
      86 | late_initcall(random_kstack_init);
         | ^~~~~~~~~~~~~
--
   ld: arch/x86/kvm/vmx/main.o: in function `vt_init':
>> arch/x86/kvm/vmx/main.c:1038: multiple definition of `init_module'; arch/x86/kvm/vmx/vmx.o:include/linux/randomize_kstack.h:81: first defined here
--
   In file included from drivers/misc/sgi-xp/xpc_main.c:47:
>> include/linux/module.h:132:49: error: redefinition of '__inittest'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   drivers/misc/sgi-xp/xpc_main.c:1285:1: note: in expansion of macro 'module_init'
    1285 | module_init(xpc_init);
         | ^~~~~~~~~~~
   include/linux/module.h:132:49: note: previous definition of '__inittest' with type 'int (*(void))(void)'
     132 |         static inline initcall_t __maybe_unused __inittest(void)                \
         |                                                 ^~~~~~~~~~
   include/linux/module.h:125:41: note: in expansion of macro 'module_init'
     125 | #define late_initcall(fn)               module_init(fn)
         |                                         ^~~~~~~~~~~
   include/linux/randomize_kstack.h:86:1: note: in expansion of macro 'late_initcall'
      86 | late_initcall(random_kstack_init);
         | ^~~~~~~~~~~~~
>> include/linux/module.h:134:13: error: redefinition of 'init_module'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   drivers/misc/sgi-xp/xpc_main.c:1285:1: note: in expansion of macro 'module_init'
    1285 | module_init(xpc_init);
         | ^~~~~~~~~~~
   include/linux/module.h:134:13: note: previous definition of 'init_module' with type 'int(void)'
     134 |         int init_module(void) __copy(initfn)                    \
         |             ^~~~~~~~~~~
   include/linux/module.h:125:41: note: in expansion of macro 'module_init'
     125 | #define late_initcall(fn)               module_init(fn)
         |                                         ^~~~~~~~~~~
   include/linux/randomize_kstack.h:86:1: note: in expansion of macro 'late_initcall'
      86 | late_initcall(random_kstack_init);
         | ^~~~~~~~~~~~~


vim +1038 arch/x86/kvm/vmx/main.c

d6bee7813752b3 Kai Huang 2025-01-22  1036  
d6bee7813752b3 Kai Huang 2025-01-22  1037  static int __init vt_init(void)
d6bee7813752b3 Kai Huang 2025-01-22 @1038  {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

