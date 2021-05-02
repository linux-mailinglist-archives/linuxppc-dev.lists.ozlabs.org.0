Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DE9370B9E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 15:13:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FY64S48xGz30HQ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 23:13:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FY6426CJ8z2ydJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 May 2021 23:13:16 +1000 (AEST)
IronPort-SDR: LH2rHDUdi8iso1nhzI2XbaDEf+0j0rf8I6Jh2scMPEgOSHOfNShEZdgyhw3gxqy0PM3X9BQvuc
 +cq6IOtkxDKQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9972"; a="197635187"
X-IronPort-AV: E=Sophos;i="5.82,267,1613462400"; 
 d="gz'50?scan'50,208,50";a="197635187"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2021 06:13:11 -0700
IronPort-SDR: rQEPWHzkQzkeWduGjO/FCxWnWr0C7IRhT1hqbMPXxSHUn3MQL1j+D/wnVpB0aznhFAJG/d652g
 uj8m5hK6Xpow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,267,1613462400"; 
 d="gz'50?scan'50,208,50";a="461775652"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 02 May 2021 06:13:09 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1ldBuH-0008uW-0V; Sun, 02 May 2021 13:13:09 +0000
Date: Sun, 2 May 2021 21:12:08 +0800
From: kernel test robot <lkp@intel.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/64s/radix: Enable huge vmalloc mappings
Message-ID: <202105022125.tAoqQUso-lkp@intel.com>
References: <20210502110050.324953-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <20210502110050.324953-1-npiggin@gmail.com>
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


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nicholas,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on linus/master next-20210430]
[cannot apply to scottwood/next v5.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nicholas-Piggin/powerpc-64s-radix-Enable-huge-vmalloc-mappings/20210502-190249
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-akebono_defconfig (attached as .config)
compiler: powerpc-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/897024543f33f779ce158849e73999b9d1271f57
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Nicholas-Piggin/powerpc-64s-radix-Enable-huge-vmalloc-mappings/20210502-190249
        git checkout 897024543f33f779ce158849e73999b9d1271f57
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross W=1 ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/module.c: In function '__module_alloc':
   arch/powerpc/kernel/module.c:101:32: error: 'VM_NO_HUGE_VMAP' undeclared (first use in this function)
     101 |         VM_FLUSH_RESET_PERMS | VM_NO_HUGE_VMAP,
         |                                ^~~~~~~~~~~~~~~
   arch/powerpc/kernel/module.c:101:32: note: each undeclared identifier is reported only once for each function it appears in
   In file included from <command-line>:
   arch/powerpc/kernel/module.c: In function 'module_alloc':
>> arch/powerpc/kernel/module.c:111:27: error: 'MODULES_VADDR' undeclared (first use in this function)
     111 |  BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
         |                           ^~~~~~~~~~~~~
   include/linux/compiler_types.h:300:9: note: in definition of macro '__compiletime_assert'
     300 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:320:2: note: in expansion of macro '_compiletime_assert'
     320 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   arch/powerpc/kernel/module.c:111:2: note: in expansion of macro 'BUILD_BUG_ON'
     111 |  BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
         |  ^~~~~~~~~~~~
>> arch/powerpc/kernel/module.c:114:37: error: 'MODULES_END' undeclared (first use in this function)
     114 |  if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
         |                                     ^~~~~~~~~~~


vim +/MODULES_VADDR +111 arch/powerpc/kernel/module.c

2ec13df167040c Christophe Leroy 2021-04-01  104  
7fbc22ce299316 Christophe Leroy 2020-06-29  105  void *module_alloc(unsigned long size)
7fbc22ce299316 Christophe Leroy 2020-06-29  106  {
897024543f33f7 Nicholas Piggin  2021-05-02  107  #ifdef CONFIG_PPC32
2ec13df167040c Christophe Leroy 2021-04-01  108  	unsigned long limit = (unsigned long)_etext - SZ_32M;
2ec13df167040c Christophe Leroy 2021-04-01  109  	void *ptr = NULL;
2ec13df167040c Christophe Leroy 2021-04-01  110  
7fbc22ce299316 Christophe Leroy 2020-06-29 @111  	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
7fbc22ce299316 Christophe Leroy 2020-06-29  112  
2ec13df167040c Christophe Leroy 2021-04-01  113  	/* First try within 32M limit from _etext to avoid branch trampolines */
2ec13df167040c Christophe Leroy 2021-04-01 @114  	if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--y0ulUmNC+osPPQO6
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
YcKTDua6vxuyWyVG8d+53yRPp/8PPUQdw8IbAQA=

--y0ulUmNC+osPPQO6--
