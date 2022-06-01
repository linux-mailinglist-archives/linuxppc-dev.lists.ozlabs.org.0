Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F24653A0BE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 11:37:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCkZl2vbPz3bmD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 19:37:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BFfelmBF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BFfelmBF;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCkZ4116bz2y6F
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 19:36:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654076220; x=1685612220;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YI1qF/p0/ijsIffeSG35swAFNKGLLAN9OwW1VZNG/jg=;
  b=BFfelmBFHCVlSjB/TYxmcZkMcTLFCFMcrCBgV9jM4ky838QMfnwnDYO8
   K98Io23BXOBlLSzx9B3OsxE45KOo+Wvfbg6fwY5TjezMGZbpnAUJMOB7z
   PIn/tznZUcnuz/WEzabavBgd64aCkz2+SdfUN4dF5Ay4yDeYWp20Qw+DC
   TNixUvbo1/cEYgLcZN0ibjkc8W5o+Makj84R9saDPCPt8TxvaPkT3IcvH
   hSiSLYg4FaLXXrEkE87oImyjLD+GV+uy82jaKc8iVfq2zucdWRz2cOHU9
   ThKaUxh/QX7if2Hcrk9Q3M2v1INJ+B/rCN6+rg8iw6GGHsfdRQs4eysH7
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="255401802"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="255401802"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 02:35:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="755820827"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Jun 2022 02:35:54 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwKle-0003oQ-4F;
	Wed, 01 Jun 2022 09:35:54 +0000
Date: Wed, 1 Jun 2022 17:35:19 +0800
From: kernel test robot <lkp@intel.com>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/6] powerpc: Provide syscall wrapper
Message-ID: <202206011740.FugDNwNm-lkp@intel.com>
References: <20220601054850.250287-2-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601054850.250287-2-rmclure@linux.ibm.com>
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, kbuild-all@lists.01.org, Andrew Donnellan <ajd@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rohan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.18]
[also build test ERROR on next-20220601]
[cannot apply to powerpc/next scottwood/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Rohan-McLure/powerpc-Add-ZERO_GPRS-macros-for-register-clears/20220601-135400
base:    4b0986a3613c92f4ec1bdc7f60ec66fea135991f
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20220601/202206011740.FugDNwNm-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c3efdfac99806b0d7ef4ee781283404448addc69
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rohan-McLure/powerpc-Add-ZERO_GPRS-macros-for-register-clears/20220601-135400
        git checkout c3efdfac99806b0d7ef4ee781283404448addc69
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/ fs/ kernel/ mm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/syscalls.h:98,
                    from arch/powerpc/kernel/syscalls.c:19:
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: error: no previous prototype for 'sys_switch_endian' [-Werror=missing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   arch/powerpc/kernel/syscalls.c:114:1: note: in expansion of macro 'SYSCALL_DEFINE0'
     114 | SYSCALL_DEFINE0(switch_endian)
         | ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   kernel/fork.c:163:13: warning: no previous prototype for 'arch_release_task_struct' [-Wmissing-prototypes]
     163 | void __weak arch_release_task_struct(struct task_struct *tsk)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/fork.c:854:20: warning: no previous prototype for 'arch_task_cache_init' [-Wmissing-prototypes]
     854 | void __init __weak arch_task_cache_init(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/syscalls.h:98,
                    from kernel/fork.c:55:
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_fork' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   kernel/fork.c:2695:1: note: in expansion of macro 'SYSCALL_DEFINE0'
    2695 | SYSCALL_DEFINE0(fork)
         | ^~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_vfork' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   kernel/fork.c:2711:1: note: in expansion of macro 'SYSCALL_DEFINE0'
    2711 | SYSCALL_DEFINE0(vfork)
         | ^~~~~~~~~~~~~~~
--
   In file included from include/linux/syscalls.h:98,
                    from kernel/signal.c:30:
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_restart_syscall' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   kernel/signal.c:3004:1: note: in expansion of macro 'SYSCALL_DEFINE0'
    3004 | SYSCALL_DEFINE0(restart_syscall)
         | ^~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_sgetmask' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   kernel/signal.c:4568:1: note: in expansion of macro 'SYSCALL_DEFINE0'
    4568 | SYSCALL_DEFINE0(sgetmask)
         | ^~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_pause' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   kernel/signal.c:4607:1: note: in expansion of macro 'SYSCALL_DEFINE0'
    4607 | SYSCALL_DEFINE0(pause)
         | ^~~~~~~~~~~~~~~
--
   In file included from include/linux/compat.h:34,
                    from kernel/sys.c:47:
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_getpid' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   kernel/sys.c:933:1: note: in expansion of macro 'SYSCALL_DEFINE0'
     933 | SYSCALL_DEFINE0(getpid)
         | ^~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_gettid' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   kernel/sys.c:939:1: note: in expansion of macro 'SYSCALL_DEFINE0'
     939 | SYSCALL_DEFINE0(gettid)
         | ^~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_getppid' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   kernel/sys.c:950:1: note: in expansion of macro 'SYSCALL_DEFINE0'
     950 | SYSCALL_DEFINE0(getppid)
         | ^~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_getuid' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   kernel/sys.c:961:1: note: in expansion of macro 'SYSCALL_DEFINE0'
     961 | SYSCALL_DEFINE0(getuid)
         | ^~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_geteuid' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   kernel/sys.c:967:1: note: in expansion of macro 'SYSCALL_DEFINE0'
     967 | SYSCALL_DEFINE0(geteuid)
         | ^~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_getgid' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   kernel/sys.c:973:1: note: in expansion of macro 'SYSCALL_DEFINE0'
     973 | SYSCALL_DEFINE0(getgid)
         | ^~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_getegid' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   kernel/sys.c:979:1: note: in expansion of macro 'SYSCALL_DEFINE0'
     979 | SYSCALL_DEFINE0(getegid)
         | ^~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_getpgrp' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   kernel/sys.c:1154:1: note: in expansion of macro 'SYSCALL_DEFINE0'
    1154 | SYSCALL_DEFINE0(getpgrp)
         | ^~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_setsid' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   kernel/sys.c:1233:1: note: in expansion of macro 'SYSCALL_DEFINE0'
    1233 | SYSCALL_DEFINE0(setsid)
         | ^~~~~~~~~~~~~~~
--
   In file included from include/linux/syscalls.h:98,
                    from mm/mlock.c:19:
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_munlockall' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   mm/mlock.c:725:1: note: in expansion of macro 'SYSCALL_DEFINE0'
     725 | SYSCALL_DEFINE0(munlockall)
         | ^~~~~~~~~~~~~~~
--
   In file included from include/linux/syscalls.h:98,
                    from fs/open.c:27:
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_vhangup' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   fs/open.c:1375:1: note: in expansion of macro 'SYSCALL_DEFINE0'
    1375 | SYSCALL_DEFINE0(vhangup)
         | ^~~~~~~~~~~~~~~
--
   In file included from include/linux/syscalls.h:98,
                    from fs/sync.c:15:
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_sync' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   fs/sync.c:111:1: note: in expansion of macro 'SYSCALL_DEFINE0'
     111 | SYSCALL_DEFINE0(sync)
         | ^~~~~~~~~~~~~~~
--
   kernel/sched/core.c:5235:20: warning: no previous prototype for 'task_sched_runtime' [-Wmissing-prototypes]
    5235 | unsigned long long task_sched_runtime(struct task_struct *p)
         |                    ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/syscalls.h:98,
                    from include/linux/syscalls_api.h:1,
                    from kernel/sched/core.c:13:
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_sched_yield' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   kernel/sched/core.c:8150:1: note: in expansion of macro 'SYSCALL_DEFINE0'
    8150 | SYSCALL_DEFINE0(sched_yield)
         | ^~~~~~~~~~~~~~~
   kernel/sched/core.c:9426:13: warning: no previous prototype for 'sched_init_smp' [-Wmissing-prototypes]
    9426 | void __init sched_init_smp(void)
         |             ^~~~~~~~~~~~~~
   kernel/sched/core.c:9454:13: warning: no previous prototype for 'sched_init' [-Wmissing-prototypes]
    9454 | void __init sched_init(void)
         |             ^~~~~~~~~~


vim +/sys_switch_endian +78 arch/powerpc/include/asm/syscall_wrapper.h

    49	
    50	#define __SYSCALL_DEFINEx(x, name, ...)						\
    51		asmlinkage long __powerpc_sys##name(const struct pt_regs *regs);	\
    52		ALLOW_ERROR_INJECTION(__powerpc_sys##name, ERRNO);			\
    53		long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));				\
    54		static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
    55		static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
    56		asmlinkage long __powerpc_sys##name(const struct pt_regs *regs)		\
    57		{									\
    58			return __se_sys##name(SC_POWERPC_REGS_TO_ARGS(x,__VA_ARGS__));	\
    59		}									\
    60		long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))				\
    61		{									\
    62			return __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));		\
    63		}									\
    64		static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))		\
    65		{									\
    66			long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));	\
    67			__MAP(x,__SC_TEST,__VA_ARGS__);					\
    68			__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));		\
    69			return ret;							\
    70		}									\
    71		static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
    72	
    73	#define SYSCALL_DEFINE0(sname)							\
    74		SYSCALL_METADATA(_##sname, 0);						\
    75		long sys_##name(void);							\
    76		asmlinkage long __powerpc_sys_##sname(const struct pt_regs *__unused);	\
    77		ALLOW_ERROR_INJECTION(__powerpc_sys_##sname, ERRNO);			\
  > 78		long sys_##sname(void)							\
    79		{									\
    80			return __powerpc_sys_##sname(NULL);				\
    81		}									\
    82		asmlinkage long __powerpc_sys_##sname(const struct pt_regs *__unused)
    83	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
