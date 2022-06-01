Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F82B539FFF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 11:01:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCjnJ5NGwz3bks
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 19:01:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kBc8P1yl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kBc8P1yl;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCjmb5TcNz306Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 19:00:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654074064; x=1685610064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bdVg1VUMec80CM1eBb5q0I4PuqkD3X8vjB9ksxnSYCY=;
  b=kBc8P1yltYu4xGlC/yzB3b2cK06qbs7Qr+4K3iE8lQZkNw7RFyj1qDKN
   pHmjyQrsTSSajG5tfIRD/ivsGarrW3F8QcGanwvF4ydSISKT90Y7QXx30
   Gyrs3d3YFItwKsrhhm7KV/AP8IfvKcMQGA9WwSeCSlVD7NXibo/Wzj4r0
   H+1FsMfumIs9/OSX8ZgJUwSAbrSrMpJLTAgClxMtEQ7DPBs5vo/umsSiz
   juAXHrtbJiX6T2KqH9XEcfmWQ2uZnKY9PcnkbY5+uRPgJZVg2XQyqXTUO
   a9Ypg/8pXPEWWyBA/IVI8Z/H7W6ExO57SmESN+ORlidXZtQd5EexGqSw8
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="273088468"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="273088468"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 01:59:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="679999285"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Jun 2022 01:59:53 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwKCm-0003m8-PZ;
	Wed, 01 Jun 2022 08:59:52 +0000
Date: Wed, 1 Jun 2022 16:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/6] powerpc: Provide syscall wrapper
Message-ID: <202206011624.sRj0DSyf-lkp@intel.com>
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v5.18]
[also build test WARNING on next-20220601]
[cannot apply to powerpc/next scottwood/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Rohan-McLure/powerpc-Add-ZERO_GPRS-macros-for-register-clears/20220601-135400
base:    4b0986a3613c92f4ec1bdc7f60ec66fea135991f
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20220601/202206011624.sRj0DSyf-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/syscalls.h:98,
                    from arch/powerpc/kernel/syscalls.c:19:
>> arch/powerpc/include/asm/syscall_wrapper.h:78:14: warning: no previous prototype for 'sys_switch_endian' [-Wmissing-prototypes]
      78 |         long sys_##sname(void)                                                  \
         |              ^~~~
   arch/powerpc/kernel/syscalls.c:114:1: note: in expansion of macro 'SYSCALL_DEFINE0'
     114 | SYSCALL_DEFINE0(switch_endian)
         | ^~~~~~~~~~~~~~~


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
