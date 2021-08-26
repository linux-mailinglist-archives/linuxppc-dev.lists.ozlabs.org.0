Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1DB3F8AB1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 17:07:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwR5P4HJ2z306l
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 01:06:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwR4X5wpwz2ywG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 01:06:03 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="197328225"
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
 d="gz'50?scan'50,208,50";a="197328225"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 08:04:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
 d="gz'50?scan'50,208,50";a="456877488"
Received: from lkp-server01.sh.intel.com (HELO 4fbc2b3ce5aa) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 26 Aug 2021 08:04:18 -0700
Received: from kbuild by 4fbc2b3ce5aa with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mJGvR-0001Kv-Uk; Thu, 26 Aug 2021 15:04:17 +0000
Date: Thu, 26 Aug 2021 23:04:07 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 3/4] powerpc/64s/interrupt: Don't enable MSR[EE] in
 irq handlers unless perf is in use
Message-ID: <202108262232.PzC05uqr-lkp@intel.com>
References: <20210825123714.706201-4-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="bg08WKrSYDhXBjb5"
Content-Disposition: inline
In-Reply-To: <20210825123714.706201-4-npiggin@gmail.com>
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
Cc: kbuild-all@lists.01.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--bg08WKrSYDhXBjb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicholas,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.14-rc7 next-20210826]
[cannot apply to scottwood/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/powerpc-64s-interrupt-speedups/20210825-204209
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-allnoconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/a0eb195f49a01ed45b3f97815470f9c8acaa4991
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Nicholas-Piggin/powerpc-64s-interrupt-speedups/20210825-204209
        git checkout a0eb195f49a01ed45b3f97815470f9c8acaa4991
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/irq.c: In function '__do_irq':
>> arch/powerpc/kernel/irq.c:742:13: error: implicit declaration of function 'should_hard_irq_enable'; did you mean 'do_hard_irq_enable'? [-Werror=implicit-function-declaration]
     742 |         if (should_hard_irq_enable())
         |             ^~~~~~~~~~~~~~~~~~~~~~
         |             do_hard_irq_enable
   In file included from <command-line>:
   In function 'do_hard_irq_enable',
       inlined from '__do_irq' at arch/powerpc/kernel/irq.c:743:3:
>> include/linux/compiler_types.h:328:45: error: call to '__compiletime_assert_34' declared with attribute error: BUILD_BUG failed
     328 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:309:25: note: in definition of macro '__compiletime_assert'
     309 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:328:9: note: in expansion of macro '_compiletime_assert'
     328 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/hw_irq.h:447:9: note: in expansion of macro 'BUILD_BUG'
     447 |         BUILD_BUG();
         |         ^~~~~~~~~
   cc1: all warnings being treated as errors
--
   arch/powerpc/kernel/time.c: In function '____timer_interrupt':
>> arch/powerpc/kernel/time.c:570:13: error: implicit declaration of function 'should_hard_irq_enable'; did you mean 'do_hard_irq_enable'? [-Werror=implicit-function-declaration]
     570 |         if (should_hard_irq_enable()) {
         |             ^~~~~~~~~~~~~~~~~~~~~~
         |             do_hard_irq_enable
   In file included from <command-line>:
   In function 'do_hard_irq_enable',
       inlined from '____timer_interrupt' at arch/powerpc/kernel/time.c:584:3,
       inlined from 'timer_interrupt' at arch/powerpc/kernel/time.c:553:1:
>> include/linux/compiler_types.h:328:45: error: call to '__compiletime_assert_34' declared with attribute error: BUILD_BUG failed
     328 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:309:25: note: in definition of macro '__compiletime_assert'
     309 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:328:9: note: in expansion of macro '_compiletime_assert'
     328 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/hw_irq.h:447:9: note: in expansion of macro 'BUILD_BUG'
     447 |         BUILD_BUG();
         |         ^~~~~~~~~
   cc1: all warnings being treated as errors


vim +742 arch/powerpc/kernel/irq.c

   727	
   728	void __do_irq(struct pt_regs *regs)
   729	{
   730		unsigned int irq;
   731	
   732		trace_irq_entry(regs);
   733	
   734		/*
   735		 * Query the platform PIC for the interrupt & ack it.
   736		 *
   737		 * This will typically lower the interrupt line to the CPU
   738		 */
   739		irq = ppc_md.get_irq();
   740	
   741		/* We can hard enable interrupts now to allow perf interrupts */
 > 742		if (should_hard_irq_enable())
   743			do_hard_irq_enable();
   744	
   745		/* And finally process it */
   746		if (unlikely(!irq))
   747			__this_cpu_inc(irq_stat.spurious_irqs);
   748		else
   749			generic_handle_irq(irq);
   750	
   751		trace_irq_exit(regs);
   752	}
   753	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--bg08WKrSYDhXBjb5
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
rc12viR2Q297O1seHO3/B7ffx8sYZQAA

--bg08WKrSYDhXBjb5--
