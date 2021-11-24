Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B281C45B768
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 10:27:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzbJ0535cz2ymP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 20:27:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzbHW2Ptdz2yNq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 20:26:45 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10177"; a="222117571"
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; d="scan'208";a="222117571"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2021 01:25:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,260,1631602800"; d="scan'208";a="456979347"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 24 Nov 2021 01:25:40 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mpoX6-0004ak-45; Wed, 24 Nov 2021 09:25:40 +0000
Date: Wed, 24 Nov 2021 17:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Subject: Re: [PATCH v2 1/2] powerpc/mce: Avoid using irq_work_queue() in
 realmode
Message-ID: <202111241736.ZgcO0Sk3-lkp@intel.com>
References: <20211124050311.64959-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211124050311.64959-1-ganeshgr@linux.ibm.com>
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, kbuild-all@lists.01.org,
 mahesh@linux.ibm.com, npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ganesh,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on v5.16-rc2 next-20211124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Ganesh-Goudar/powerpc-mce-Avoid-using-irq_work_queue-in-realmode/20211124-130459
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20211124/202111241736.ZgcO0Sk3-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/bac24ec52edd7013115ad594974f64a30565266d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ganesh-Goudar/powerpc-mce-Avoid-using-irq_work_queue-in-realmode/20211124-130459
        git checkout bac24ec52edd7013115ad594974f64a30565266d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/time.c: In function '____timer_interrupt':
>> arch/powerpc/kernel/time.c:598:25: error: implicit declaration of function 'mce_run_late_handlers' [-Werror=implicit-function-declaration]
     598 |                         mce_run_late_handlers();
         |                         ^~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/mce_run_late_handlers +598 arch/powerpc/kernel/time.c

   590	
   591		old_regs = set_irq_regs(regs);
   592	
   593		trace_timer_interrupt_entry(regs);
   594	
   595		if (test_irq_work_pending()) {
   596			clear_irq_work_pending();
   597			if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
 > 598				mce_run_late_handlers();
   599			irq_work_run();
   600		}
   601	
   602		now = get_tb();
   603		if (now >= *next_tb) {
   604			*next_tb = ~(u64)0;
   605			if (evt->event_handler)
   606				evt->event_handler(evt);
   607			__this_cpu_inc(irq_stat.timer_irqs_event);
   608		} else {
   609			now = *next_tb - now;
   610			if (now <= decrementer_max)
   611				set_dec(now);
   612			/* We may have raced with new irq work */
   613			if (test_irq_work_pending())
   614				set_dec(1);
   615			__this_cpu_inc(irq_stat.timer_irqs_others);
   616		}
   617	
   618		trace_timer_interrupt_exit(regs);
   619	
   620		set_irq_regs(old_regs);
   621	}
   622	EXPORT_SYMBOL(timer_interrupt);
   623	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
