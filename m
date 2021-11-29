Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BACC94619C4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 15:38:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2nzC4vMgz3070
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 01:38:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2nyk4Fchz2x9J
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 01:38:17 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10182"; a="216674771"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="216674771"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 06:37:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="608726541"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 29 Nov 2021 06:37:11 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mrhmI-000C2S-Lg; Mon, 29 Nov 2021 14:37:10 +0000
Date: Mon, 29 Nov 2021 22:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4 1/5] powerpc/inst: Refactor ___get_user_instr()
Message-ID: <202111292213.TqMVcy38-lkp@intel.com>
References: <97a171efd8c582e2bae82c31f2a9519823a20d3f.1638186773.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97a171efd8c582e2bae82c31f2a9519823a20d3f.1638186773.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

I love your patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on v5.16-rc3 next-20211129]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerpc-inst-Refactor-___get_user_instr/20211129-195613
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20211129/202111292213.TqMVcy38-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/12f08114cece066b2640aef99e2bc74f49eebef5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christophe-Leroy/powerpc-inst-Refactor-___get_user_instr/20211129-195613
        git checkout 12f08114cece066b2640aef99e2bc74f49eebef5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/hw_breakpoint.h:13,
                    from arch/powerpc/include/asm/processor.h:43,
                    from arch/powerpc/include/asm/thread_info.h:40,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:55,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:6,
                    from include/linux/mm.h:10,
                    from arch/powerpc/kernel/align.c:17:
   arch/powerpc/kernel/align.c: In function 'fix_alignment':
>> arch/powerpc/include/asm/inst.h:12:32: warning: variable '__suffix' set but not used [-Wunused-but-set-variable]
      12 |         unsigned int __prefix, __suffix;                                \
         |                                ^~~~~~~~
   arch/powerpc/include/asm/inst.h:31:34: note: in expansion of macro '___get_user_instr'
      31 | #define __get_user_instr(x, ptr) ___get_user_instr(__get_user, x, ptr)
         |                                  ^~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/align.c:310:21: note: in expansion of macro '__get_user_instr'
     310 |                 r = __get_user_instr(instr, (void __user *)regs->nip);
         |                     ^~~~~~~~~~~~~~~~
--
   In file included from arch/powerpc/include/asm/hw_breakpoint.h:13,
                    from arch/powerpc/include/asm/processor.h:43,
                    from arch/powerpc/include/asm/thread_info.h:40,
                    from include/linux/thread_info.h:60,
                    from arch/powerpc/include/asm/ptrace.h:323,
                    from arch/powerpc/include/asm/hw_irq.h:12,
                    from arch/powerpc/include/asm/irqflags.h:12,
                    from include/linux/irqflags.h:16,
                    from include/asm-generic/cmpxchg-local.h:6,
                    from arch/powerpc/include/asm/cmpxchg.h:526,
                    from arch/powerpc/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/uaccess.h:8,
                    from arch/powerpc/kernel/hw_breakpoint_constraints.c:3:
   arch/powerpc/kernel/hw_breakpoint_constraints.c: In function 'wp_get_instr_detail':
>> arch/powerpc/include/asm/inst.h:12:32: warning: variable '__suffix' set but not used [-Wunused-but-set-variable]
      12 |         unsigned int __prefix, __suffix;                                \
         |                                ^~~~~~~~
   arch/powerpc/include/asm/inst.h:31:34: note: in expansion of macro '___get_user_instr'
      31 | #define __get_user_instr(x, ptr) ___get_user_instr(__get_user, x, ptr)
         |                                  ^~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/hw_breakpoint_constraints.c:135:13: note: in expansion of macro '__get_user_instr'
     135 |         if (__get_user_instr(*instr, (void __user *)regs->nip))
         |             ^~~~~~~~~~~~~~~~
--
   In file included from arch/powerpc/include/asm/hw_breakpoint.h:13,
                    from arch/powerpc/include/asm/processor.h:43,
                    from arch/powerpc/include/asm/thread_info.h:40,
                    from include/linux/thread_info.h:60,
                    from arch/powerpc/include/asm/ptrace.h:323,
                    from arch/powerpc/include/asm/hw_irq.h:12,
                    from arch/powerpc/include/asm/irqflags.h:12,
                    from include/linux/irqflags.h:16,
                    from include/asm-generic/cmpxchg-local.h:6,
                    from arch/powerpc/include/asm/cmpxchg.h:526,
                    from arch/powerpc/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/powerpc/kernel/vecemu.c:8:
   arch/powerpc/kernel/vecemu.c: In function 'emulate_altivec':
>> arch/powerpc/include/asm/inst.h:12:32: warning: variable '__suffix' set but not used [-Wunused-but-set-variable]
      12 |         unsigned int __prefix, __suffix;                                \
         |                                ^~~~~~~~
   arch/powerpc/include/asm/inst.h:29:32: note: in expansion of macro '___get_user_instr'
      29 | #define get_user_instr(x, ptr) ___get_user_instr(get_user, x, ptr)
         |                                ^~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/vecemu.c:269:13: note: in expansion of macro 'get_user_instr'
     269 |         if (get_user_instr(instr, (void __user *)regs->nip))
         |             ^~~~~~~~~~~~~~


vim +/__suffix +12 arch/powerpc/include/asm/inst.h

650b55b707fdfa Jordan Niethe    2020-05-15   6  
35506a3e2d7c4d Christophe Leroy 2021-03-10   7  #define ___get_user_instr(gu_op, dest, ptr)				\
35506a3e2d7c4d Christophe Leroy 2021-03-10   8  ({									\
042e0860e1c1d6 Christophe Leroy 2021-05-20   9  	long __gui_ret;							\
9134806e149ebb Christophe Leroy 2021-05-20  10  	u32 __user *__gui_ptr = (u32 __user *)ptr;			\
35506a3e2d7c4d Christophe Leroy 2021-03-10  11  	struct ppc_inst __gui_inst;					\
35506a3e2d7c4d Christophe Leroy 2021-03-10 @12  	unsigned int __prefix, __suffix;				\
b3a9e523237013 Christophe Leroy 2021-05-20  13  									\
b3a9e523237013 Christophe Leroy 2021-05-20  14  	__chk_user_ptr(ptr);						\
9134806e149ebb Christophe Leroy 2021-05-20  15  	__gui_ret = gu_op(__prefix, __gui_ptr);				\
35506a3e2d7c4d Christophe Leroy 2021-03-10  16  	if (__gui_ret == 0) {						\
12f08114cece06 Christophe Leroy 2021-11-29  17  		if (IS_ENABLED(CONFIG_PPC64) && (__prefix >> 26) == OP_PREFIX) { \
9134806e149ebb Christophe Leroy 2021-05-20  18  			__gui_ret = gu_op(__suffix, __gui_ptr + 1);	\
042e0860e1c1d6 Christophe Leroy 2021-05-20  19  			__gui_inst = ppc_inst_prefix(__prefix, __suffix); \
35506a3e2d7c4d Christophe Leroy 2021-03-10  20  		} else {						\
35506a3e2d7c4d Christophe Leroy 2021-03-10  21  			__gui_inst = ppc_inst(__prefix);		\
35506a3e2d7c4d Christophe Leroy 2021-03-10  22  		}							\
35506a3e2d7c4d Christophe Leroy 2021-03-10  23  		if (__gui_ret == 0)					\
35506a3e2d7c4d Christophe Leroy 2021-03-10  24  			(dest) = __gui_inst;				\
35506a3e2d7c4d Christophe Leroy 2021-03-10  25  	}								\
35506a3e2d7c4d Christophe Leroy 2021-03-10  26  	__gui_ret;							\
35506a3e2d7c4d Christophe Leroy 2021-03-10  27  })
35506a3e2d7c4d Christophe Leroy 2021-03-10  28  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
