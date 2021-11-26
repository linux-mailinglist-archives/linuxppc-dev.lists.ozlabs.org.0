Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7618D45F730
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 00:25:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J19nn2M30z3cXG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 10:25:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J19nG08WVz3bYL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 10:24:27 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="321958422"
X-IronPort-AV: E=Sophos;i="5.87,267,1631602800"; d="scan'208";a="321958422"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2021 15:23:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,267,1631602800"; d="scan'208";a="476022030"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 26 Nov 2021 15:23:20 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mqkYq-0008l3-2M; Fri, 26 Nov 2021 23:23:20 +0000
Date: Sat, 27 Nov 2021 07:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Bathini <hbathini@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Subject: Re: [PATCH v2 1/2] powerpc: handle kdump appropriately with
 crash_kexec_post_notifiers option
Message-ID: <202111270740.T4QBMa4L-lkp@intel.com>
References: <20211125180956.384886-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125180956.384886-1-hbathini@linux.ibm.com>
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
Cc: sourabhjain@linux.ibm.com, kbuild-all@lists.01.org, mahesh@linux.ibm.com,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Hari,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.16-rc2 next-20211126]
[cannot apply to mpe/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hari-Bathini/powerpc-handle-kdump-appropriately-with-crash_kexec_post_notifiers-option/20211126-021120
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-iss476-smp_defconfig (https://download.01.org/0day-ci/archive/20211127/202111270740.T4QBMa4L-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/112b5fcac650e78c2130b7f43ef66d965e69623e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hari-Bathini/powerpc-handle-kdump-appropriately-with-crash_kexec_post_notifiers-option/20211126-021120
        git checkout 112b5fcac650e78c2130b7f43ef66d965e69623e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/smp.c: In function 'crash_smp_send_stop':
>> arch/powerpc/kernel/smp.c:645:27: error: passing argument 1 of 'smp_call_function' from incompatible pointer type [-Werror=incompatible-pointer-types]
     645 |         smp_call_function(crash_stop_this_cpu, NULL, 0);
         |                           ^~~~~~~~~~~~~~~~~~~
         |                           |
         |                           void (*)(struct pt_regs *)
   In file included from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/sched/mm.h:7,
                    from arch/powerpc/kernel/smp.c:18:
   include/linux/smp.h:149:40: note: expected 'smp_call_func_t' {aka 'void (*)(void *)'} but argument is of type 'void (*)(struct pt_regs *)'
     149 | void smp_call_function(smp_call_func_t func, void *info, int wait);
         |                        ~~~~~~~~~~~~~~~~^~~~
   cc1: all warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_CPU
   Depends on SMP && (PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE
   Selected by
   - PM_SLEEP_SMP && SMP && (ARCH_SUSPEND_POSSIBLE || ARCH_HIBERNATION_POSSIBLE && PM_SLEEP


vim +/smp_call_function +645 arch/powerpc/kernel/smp.c

   632	
   633	void crash_smp_send_stop(void)
   634	{
   635		static bool stopped = false;
   636	
   637		if (stopped)
   638			return;
   639	
   640		stopped = true;
   641	
   642	#ifdef CONFIG_NMI_IPI
   643		smp_send_nmi_ipi(NMI_IPI_ALL_OTHERS, crash_stop_this_cpu, 1000000);
   644	#else
 > 645		smp_call_function(crash_stop_this_cpu, NULL, 0);
   646	#endif /* CONFIG_NMI_IPI */
   647	}
   648	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
