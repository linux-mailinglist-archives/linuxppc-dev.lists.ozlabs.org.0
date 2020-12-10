Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E0D2D4FFB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 01:59:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrwXl5nNPzDqwJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 11:59:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrwW15b1jzDqkq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 11:57:30 +1100 (AEDT)
IronPort-SDR: Yvaz0aN7P/Q6v5Nxk6wR1vyDxO6LxqJr8gq4hIpE9W5BgbO85PVFmxStgiQ49yQ0vIPSuiG3TL
 bXI3iXn9g7ig==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="161936572"
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; 
 d="gz'50?scan'50,208,50";a="161936572"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 16:57:26 -0800
IronPort-SDR: ZbWAY5wzphldaCwDWy/whG0of3SbI9zcN6I8LUE/1XfDs9oTqnVza0uoBLsitRhrua3UcxkubH
 4kjMa4kD85bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,407,1599548400"; 
 d="gz'50?scan'50,208,50";a="376742989"
Received: from lkp-server01.sh.intel.com (HELO 2bbb63443648) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Dec 2020 16:57:22 -0800
Received: from kbuild by 2bbb63443648 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1knAGo-0000YN-7R; Thu, 10 Dec 2020 00:57:22 +0000
Date: Thu, 10 Dec 2020 08:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Anton Blanchard <anton@ozlabs.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michael Neuling <mikey@neuling.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH v2 4/5] powerpc/smp: Add support detecting thread-groups
 sharing L2 cache
Message-ID: <202012100839.2UDPlQoi-lkp@intel.com>
References: <1607533700-5546-5-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <1607533700-5546-5-git-send-email-ego@linux.vnet.ibm.com>
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
Cc: clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi "Gautham,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.10-rc7 next-20201209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Gautham-R-Shenoy/Extend-Parsing-ibm-thread-groups-for-Shared-L2-information/20201210-011226
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc64-randconfig-r003-20201209 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 1968804ac726e7674d5de22bc2204b45857da344)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://github.com/0day-ci/linux/commit/61bc65c11bf36fdc3827c6d6f4f555fba5306bd9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Gautham-R-Shenoy/Extend-Parsing-ibm-thread-groups-for-Shared-L2-information/20201210-011226
        git checkout 61bc65c11bf36fdc3827c6d6f4f555fba5306bd9
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:164:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:557:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/kernel/smp.c:22:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:47:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:166:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:558:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/kernel/smp.c:22:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:49:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:168:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:559:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/kernel/smp.c:22:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:51:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:170:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:560:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/powerpc/kernel/smp.c:22:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:619:
   arch/powerpc/include/asm/io-defs.h:53:1: error: performing pointer arithmetic on a null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:616:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:172:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:561:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   arch/powerpc/kernel/smp.c:569:6: error: no previous prototype for function 'tick_broadcast' [-Werror,-Wmissing-prototypes]
   void tick_broadcast(const struct cpumask *mask)
        ^
   arch/powerpc/kernel/smp.c:569:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void tick_broadcast(const struct cpumask *mask)
   ^
   static 
   arch/powerpc/kernel/smp.c:579:6: error: no previous prototype for function 'debugger_ipi_callback' [-Werror,-Wmissing-prototypes]
   void debugger_ipi_callback(struct pt_regs *regs)
        ^
   arch/powerpc/kernel/smp.c:579:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void debugger_ipi_callback(struct pt_regs *regs)
   ^
   static 
>> arch/powerpc/kernel/smp.c:905:11: error: variable 'mask' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
           else if (cache_property == THREAD_GROUP_SHARE_L2)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/smp.c:908:26: note: uninitialized use occurs here
           zalloc_cpumask_var_node(mask, GFP_KERNEL, cpu_to_node(cpu));
                                   ^~~~
   arch/powerpc/kernel/smp.c:905:7: note: remove the 'if' if its condition is always true
           else if (cache_property == THREAD_GROUP_SHARE_L2)
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/kernel/smp.c:886:21: note: initialize the variable 'mask' to silence this warning
           cpumask_var_t *mask;
                              ^
                               = NULL
   arch/powerpc/kernel/smp.c:1560:5: error: no previous prototype for function 'setup_profiling_timer' [-Werror,-Wmissing-prototypes]
   int setup_profiling_timer(unsigned int multiplier)
       ^
   arch/powerpc/kernel/smp.c:1560:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int setup_profiling_timer(unsigned int multiplier)
   ^
   static 
   16 errors generated.

vim +905 arch/powerpc/kernel/smp.c

   881	
   882	{
   883		int first_thread = cpu_first_thread_sibling(cpu);
   884		int i, cpu_group_start = -1, err = 0;
   885		struct thread_groups *tg = NULL;
   886		cpumask_var_t *mask;
   887	
   888		if (cache_property != THREAD_GROUP_SHARE_L1 &&
   889		    cache_property != THREAD_GROUP_SHARE_L2)
   890			return -EINVAL;
   891	
   892		tg = get_thread_groups(cpu, cache_property, &err);
   893		if (!tg)
   894			return err;
   895	
   896		cpu_group_start = get_cpu_thread_group_start(cpu, tg);
   897	
   898		if (unlikely(cpu_group_start == -1)) {
   899			WARN_ON_ONCE(1);
   900			return -ENODATA;
   901		}
   902	
   903		if (cache_property == THREAD_GROUP_SHARE_L1)
   904			mask = &per_cpu(thread_group_l1_cache_map, cpu);
 > 905		else if (cache_property == THREAD_GROUP_SHARE_L2)
   906			mask = &per_cpu(thread_group_l2_cache_map, cpu);
   907	
   908		zalloc_cpumask_var_node(mask, GFP_KERNEL, cpu_to_node(cpu));
   909	
   910		for (i = first_thread; i < first_thread + threads_per_core; i++) {
   911			int i_group_start = get_cpu_thread_group_start(i, tg);
   912	
   913			if (unlikely(i_group_start == -1)) {
   914				WARN_ON_ONCE(1);
   915				return -ENODATA;
   916			}
   917	
   918			if (i_group_start == cpu_group_start)
   919				cpumask_set_cpu(i, *mask);
   920		}
   921	
   922		return 0;
   923	}
   924	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--lrZ03NoBR/3+SXJZ
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
m0xdQjQD0/hlcqLX1N3T/wDaTscE9bQBAA==

--lrZ03NoBR/3+SXJZ--
