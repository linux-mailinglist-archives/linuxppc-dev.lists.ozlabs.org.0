Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C922D2CD084
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 08:43:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cmns00YbNzDrPl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 18:43:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmnqH2Bc1zDqWn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 18:42:13 +1100 (AEDT)
IronPort-SDR: ERf9GIpPy2oM/fqwEqymG7xPaFYHB4s7UHUr7Q9qkeuL8huR5ZDz4VOnvGlwZ/SKbO1V+uQmdW
 qsrDphFfKETg==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="172367888"
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; 
 d="gz'50?scan'50,208,50";a="172367888"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2020 23:42:05 -0800
IronPort-SDR: JD3MA88Lh6FAu7NX9S8ygLnwcPpgOwyFQMV47KjAqXNLTPK5mKSF0PdNpkCOrwQAd12WMR3KBV
 HqjY46/EZ0tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,388,1599548400"; 
 d="gz'50?scan'50,208,50";a="346137574"
Received: from lkp-server01.sh.intel.com (HELO c4fb854e61c6) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 02 Dec 2020 23:42:04 -0800
Received: from kbuild by c4fb854e61c6 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kkjFb-00007K-BN; Thu, 03 Dec 2020 07:42:03 +0000
Date: Thu, 3 Dec 2020 15:41:53 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel v2] powerpc/kuap: Restore AMR after replaying soft
 interrupts
Message-ID: <202012031541.XQHMtxZ3-lkp@intel.com>
References: <20201203054724.44838-1-aik@ozlabs.ru>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="EVF5PPMfhYS0aIcm"
Content-Disposition: inline
In-Reply-To: <20201203054724.44838-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, kbuild-all@lists.01.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alexey,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.10-rc6 next-20201201]
[cannot apply to powerpc/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Alexey-Kardashevskiy/powerpc-kuap-Restore-AMR-after-replaying-soft-interrupts/20201203-135010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 34816d20f173a90389c8a7e641166d8ea9dce70a
config: powerpc-wii_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d2a99260ef6d241abe6fb961ee3ed84bbc5db7f5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Alexey-Kardashevskiy/powerpc-kuap-Restore-AMR-after-replaying-soft-interrupts/20201203-135010
        git checkout d2a99260ef6d241abe6fb961ee3ed84bbc5db7f5
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/uaccess.h:9,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/compat.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:14:
   arch/powerpc/include/asm/kup.h: In function 'get_kuap':
>> arch/powerpc/include/asm/kup.h:19:26: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '13835058055282163712' to '0' [-Woverflow]
      19 | #define AMR_KUAP_BLOCKED (AMR_KUAP_BLOCK_READ | AMR_KUAP_BLOCK_WRITE)
         |                          ^
   arch/powerpc/include/asm/kup.h:73:9: note: in expansion of macro 'AMR_KUAP_BLOCKED'
      73 |  return AMR_KUAP_BLOCKED;
         |         ^~~~~~~~~~~~~~~~
--
   In file included from arch/powerpc/include/asm/uaccess.h:9,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:687,
                    from include/linux/ring_buffer.h:5,
                    from include/linux/trace_events.h:6,
                    from include/trace/trace_events.h:21,
                    from include/trace/define_trace.h:102,
                    from include/trace/events/sched.h:656,
                    from kernel/sched/core.c:10:
   arch/powerpc/include/asm/kup.h: In function 'get_kuap':
>> arch/powerpc/include/asm/kup.h:19:26: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '13835058055282163712' to '0' [-Woverflow]
      19 | #define AMR_KUAP_BLOCKED (AMR_KUAP_BLOCK_READ | AMR_KUAP_BLOCK_WRITE)
         |                          ^
   arch/powerpc/include/asm/kup.h:73:9: note: in expansion of macro 'AMR_KUAP_BLOCKED'
      73 |  return AMR_KUAP_BLOCKED;
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'ttwu_stat':
   kernel/sched/core.c:2419:13: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
    2419 |  struct rq *rq;
         |             ^~
--
   In file included from arch/powerpc/include/asm/uaccess.h:9,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/sched.h:11,
                    from kernel/sched/fair.c:23:
   arch/powerpc/include/asm/kup.h: In function 'get_kuap':
>> arch/powerpc/include/asm/kup.h:19:26: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '13835058055282163712' to '0' [-Woverflow]
      19 | #define AMR_KUAP_BLOCKED (AMR_KUAP_BLOCK_READ | AMR_KUAP_BLOCK_WRITE)
         |                          ^
   arch/powerpc/include/asm/kup.h:73:9: note: in expansion of macro 'AMR_KUAP_BLOCKED'
      73 |  return AMR_KUAP_BLOCKED;
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:5368:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    5368 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11150:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   11150 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11152:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   11152 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11157:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   11157 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11159:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   11159 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/powerpc/include/asm/uaccess.h:9,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/sched.h:11,
                    from kernel/sched/rt.c:6:
   arch/powerpc/include/asm/kup.h: In function 'get_kuap':
>> arch/powerpc/include/asm/kup.h:19:26: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '13835058055282163712' to '0' [-Woverflow]
      19 | #define AMR_KUAP_BLOCKED (AMR_KUAP_BLOCK_READ | AMR_KUAP_BLOCK_WRITE)
         |                          ^
   arch/powerpc/include/asm/kup.h:73:9: note: in expansion of macro 'AMR_KUAP_BLOCKED'
      73 |  return AMR_KUAP_BLOCKED;
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/rt.c: At top level:
   kernel/sched/rt.c:253:6: warning: no previous prototype for 'free_rt_sched_group' [-Wmissing-prototypes]
     253 | void free_rt_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:255:5: warning: no previous prototype for 'alloc_rt_sched_group' [-Wmissing-prototypes]
     255 | int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:668:6: warning: no previous prototype for 'sched_rt_bandwidth_account' [-Wmissing-prototypes]
     668 | bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/powerpc/include/asm/uaccess.h:9,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/compat.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:14:
   arch/powerpc/include/asm/kup.h: In function 'get_kuap':
>> arch/powerpc/include/asm/kup.h:19:26: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '13835058055282163712' to '0' [-Woverflow]
      19 | #define AMR_KUAP_BLOCKED (AMR_KUAP_BLOCK_READ | AMR_KUAP_BLOCK_WRITE)
         |                          ^
   arch/powerpc/include/asm/kup.h:73:9: note: in expansion of macro 'AMR_KUAP_BLOCKED'
      73 |  return AMR_KUAP_BLOCKED;
         |         ^~~~~~~~~~~~~~~~

vim +19 arch/powerpc/include/asm/kup.h

    16	
    17	#define AMR_KUAP_BLOCK_READ	UL(0x4000000000000000)
    18	#define AMR_KUAP_BLOCK_WRITE	UL(0x8000000000000000)
  > 19	#define AMR_KUAP_BLOCKED	(AMR_KUAP_BLOCK_READ | AMR_KUAP_BLOCK_WRITE)
    20	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--EVF5PPMfhYS0aIcm
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
bgzO+zx57fo/+WvgFdoEAQA=

--EVF5PPMfhYS0aIcm--
