Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9AD53A4E3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 14:25:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCpJr0FZwz3btW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 22:25:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N7nz4v8d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N7nz4v8d;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCpJ86KQmz30BP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 22:25:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654086313; x=1685622313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yP2VCbuxwpAtkxJbhJmqdtjCZ2SBroOqZ3dphxWtEpk=;
  b=N7nz4v8dEKTp22wG1jMMNeZrPSLWjzwevWOmnaO+Z4etqEjIdsuaoYJE
   Rud4tl3Axy2IfrcUjCAr1Ol5ywC+/YlJKQ6dpgKWQXCb32MsPUHp534ef
   W8IRGy2QOMaGeKGgYDFDsrXqMa2onte4G5pWFmRBYNnT//LbjEqge53zS
   zt0o6YKEVTMONDBPJYiHulOoWAjX42Vh5TBAbMHmils8ArNl2Y3zvYkek
   JOjmp4bWSEcUAu5kDGFHHni2+YJ4TbcHay14nGadl22TFlWOuMHKLS9d6
   6ZvW3pcHHj9O3hZ5iE76wcCjBQ5+s3CWr+0e4obMj4mMGAChDMMQvda/Y
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="275648163"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="275648163"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 05:24:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="612295095"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Jun 2022 05:24:00 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwNOJ-0003x4-WF;
	Wed, 01 Jun 2022 12:24:00 +0000
Date: Wed, 1 Jun 2022 20:23:14 +0800
From: kernel test robot <lkp@intel.com>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/6] powerpc: Provide syscall wrapper
Message-ID: <202206012020.14R31W6c-lkp@intel.com>
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
config: powerpc64-allnoconfig (https://download.01.org/0day-ci/archive/20220601/202206012020.14R31W6c-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c3efdfac99806b0d7ef4ee781283404448addc69
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rohan-McLure/powerpc-Add-ZERO_GPRS-macros-for-register-clears/20220601-135400
        git checkout c3efdfac99806b0d7ef4ee781283404448addc69
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/syscalls.h:98,
                    from arch/powerpc/kernel/signal_64.c:23:
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: error: no previous prototype for 'sys_rt_sigreturn' [-Werror=missing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   arch/powerpc/kernel/signal_64.c:736:1: note: in expansion of macro 'SYSCALL_DEFINE0'
     736 | SYSCALL_DEFINE0(rt_sigreturn)
         | ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/sys_rt_sigreturn +78 arch/powerpc/include/asm/syscall_wrapper.h

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
