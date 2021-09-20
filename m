Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 913BA41149E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 14:36:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCkZN4srgz2yxB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 22:36:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCkYs0X3Gz2yKT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 22:35:55 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="210201903"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; 
 d="gz'50?scan'50,208,50";a="210201903"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 05:34:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; 
 d="gz'50?scan'50,208,50";a="532149395"
Received: from lkp-server01.sh.intel.com (HELO 285e7b116627) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 20 Sep 2021 05:34:48 -0700
Received: from kbuild by 285e7b116627 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mSIVT-0005vQ-RJ; Mon, 20 Sep 2021 12:34:47 +0000
Date: Mon, 20 Sep 2021 20:34:11 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/3] powerpc/inst: Refactor ___get_user_instr()
Message-ID: <202109202036.43A4SRIb-lkp@intel.com>
References: <9607dfbecab2ecccb712bbd25d2d5da882239d4c.1632118950.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline
In-Reply-To: <9607dfbecab2ecccb712bbd25d2d5da882239d4c.1632118950.git.christophe.leroy@csgroup.eu>
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


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.15-rc2 next-20210920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerpc-inst-Refactor-___get_user_instr/20210920-142409
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-allnoconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5cf46b9261bd40b829a760ac96f7e8209bda11b4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christophe-Leroy/powerpc-inst-Refactor-___get_user_instr/20210920-142409
        git checkout 5cf46b9261bd40b829a760ac96f7e8209bda11b4
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

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
>> arch/powerpc/include/asm/inst.h:12:32: error: variable '__suffix' set but not used [-Werror=unused-but-set-variable]
      12 |         unsigned int __prefix, __suffix;                                \
         |                                ^~~~~~~~
   arch/powerpc/include/asm/inst.h:31:34: note: in expansion of macro '___get_user_instr'
      31 | #define __get_user_instr(x, ptr) ___get_user_instr(__get_user, x, ptr)
         |                                  ^~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/align.c:310:21: note: in expansion of macro '__get_user_instr'
     310 |                 r = __get_user_instr(instr, (void __user *)regs->nip);
         |                     ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
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
>> arch/powerpc/include/asm/inst.h:12:32: error: variable '__suffix' set but not used [-Werror=unused-but-set-variable]
      12 |         unsigned int __prefix, __suffix;                                \
         |                                ^~~~~~~~
   arch/powerpc/include/asm/inst.h:31:34: note: in expansion of macro '___get_user_instr'
      31 | #define __get_user_instr(x, ptr) ___get_user_instr(__get_user, x, ptr)
         |                                  ^~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/hw_breakpoint_constraints.c:144:13: note: in expansion of macro '__get_user_instr'
     144 |         if (__get_user_instr(*instr, (void __user *)regs->nip))
         |             ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


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
5cf46b9261bd40 Christophe Leroy 2021-09-20  17  		if (IS_ENABLED(CONFIG_PPC64) && (__prefix >> 26) == OP_PREFIX) { \
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

--x+6KMIRAuhnl3hBn
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
26+jHRicJaittv8AQUjqy9xtAAA=

--x+6KMIRAuhnl3hBn--
