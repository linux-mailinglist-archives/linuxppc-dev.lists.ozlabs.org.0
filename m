Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF0151E6A6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 13:31:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwQHj0GFCz3cJB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 21:31:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VM7ug/ck;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VM7ug/ck; dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwQH22zJ2z3c5C
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 21:30:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651923054; x=1683459054;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gZs87zfasrjwwNRalafBnDgJKHoPJaGErNWYZAsFcEA=;
 b=VM7ug/ckHgS0mNdZMqBs0Ia68zfxh3gGo0n77orSJe3MU4eMsEoRqIj7
 xm1Z5m+r9dfqYGM8oTvsXwyzeP8HuDhYbltPXdNGCTRw8x/S/gvzQeXXP
 fImMyB9V7i9NFYjyFfW8gnlj5lbE/OtXZQ/s9VuocAbnXGJMgb8xXhBY4
 5ycmZ209VEG/C7u+shC1RxgWEa19h3j224kyNlNOSFYhzHLhI3IZHU8xX
 Ug+17XXtHz+lnRA3Nt1NPyEzmZX3l5o5fMqfWxD/0WYt9z1muQXqqEYLg
 bUnUQV6+/rlPplDhV0eVMBSLesPGiN5lBTbBDY33apwow7JbHdqqVBiEv Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="267537675"
X-IronPort-AV: E=Sophos;i="5.91,207,1647327600"; d="scan'208";a="267537675"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2022 04:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,207,1647327600"; d="scan'208";a="709846771"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 07 May 2022 04:29:38 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nnId0-000EVv-7P;
 Sat, 07 May 2022 11:29:38 +0000
Date: Sat, 7 May 2022 19:29:04 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 naveen.n.rao@linux.vnet.ibm.com
Subject: Re: [PATCH v2 21/25] powerpc/ftrace: Don't use
 copy_from_kernel_nofault() in module_trampoline_target()
Message-ID: <202205071900.opHsWE8v-lkp@intel.com>
References: <921e8d60c847d42f7309feae1936fa0117b7f0d1.1651905939.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <921e8d60c847d42f7309feae1936fa0117b7f0d1.1651905939.git.christophe.leroy@csgroup.eu>
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

Hi Christophe,

I love your patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/topic/ppc-kvm v5.18-rc5 next-20220506]
[cannot apply to rostedt-trace/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/powerpc-ftrace-optimisation-and-cleanup-and-more-v2/20220507-145034
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-randconfig-s031-20220506 (https://download.01.org/0day-ci/archive/20220507/202205071900.opHsWE8v-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/intel-lab-lkp/linux/commit/1c6a385ed330a6ed959cad02f89306fb84e4334c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christophe-Leroy/powerpc-ftrace-optimisation-and-cleanup-and-more-v2/20220507-145034
        git checkout 1c6a385ed330a6ed959cad02f89306fb84e4334c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> arch/powerpc/kernel/module_32.c:298:43: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct ppc_inst_t [usertype] *inst @@     got unsigned int * @@
   arch/powerpc/kernel/module_32.c:298:43: sparse:     expected struct ppc_inst_t [usertype] *inst
   arch/powerpc/kernel/module_32.c:298:43: sparse:     got unsigned int *
   arch/powerpc/kernel/module_32.c:300:49: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct ppc_inst_t [usertype] *inst @@     got unsigned int * @@
   arch/powerpc/kernel/module_32.c:300:49: sparse:     expected struct ppc_inst_t [usertype] *inst
   arch/powerpc/kernel/module_32.c:300:49: sparse:     got unsigned int *
   arch/powerpc/kernel/module_32.c:302:49: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct ppc_inst_t [usertype] *inst @@     got unsigned int * @@
   arch/powerpc/kernel/module_32.c:302:49: sparse:     expected struct ppc_inst_t [usertype] *inst
   arch/powerpc/kernel/module_32.c:302:49: sparse:     got unsigned int *
   arch/powerpc/kernel/module_32.c:304:49: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct ppc_inst_t [usertype] *inst @@     got unsigned int * @@
   arch/powerpc/kernel/module_32.c:304:49: sparse:     expected struct ppc_inst_t [usertype] *inst
   arch/powerpc/kernel/module_32.c:304:49: sparse:     got unsigned int *

vim +298 arch/powerpc/kernel/module_32.c

   290	
   291	#ifdef CONFIG_DYNAMIC_FTRACE
   292	notrace int module_trampoline_target(struct module *mod, unsigned long addr,
   293					     unsigned long *target)
   294	{
   295		unsigned int jmp[4];
   296	
   297		/* Find where the trampoline jumps to */
 > 298		if (copy_inst_from_kernel_nofault(jmp, (void *)addr))
   299			return -EFAULT;
   300		if (__copy_inst_from_kernel_nofault(jmp + 1, (void *)addr + 4))
   301			return -EFAULT;
   302		if (__copy_inst_from_kernel_nofault(jmp + 2, (void *)addr + 8))
   303			return -EFAULT;
   304		if (__copy_inst_from_kernel_nofault(jmp + 3, (void *)addr + 12))
   305			return -EFAULT;
   306	
   307		/* verify that this is what we expect it to be */
   308		if ((jmp[0] & 0xffff0000) != PPC_RAW_LIS(_R12, 0) ||
   309		    (jmp[1] & 0xffff0000) != PPC_RAW_ADDI(_R12, _R12, 0) ||
   310		    jmp[2] != PPC_RAW_MTCTR(_R12) ||
   311		    jmp[3] != PPC_RAW_BCTR())
   312			return -EINVAL;
   313	
   314		addr = (jmp[1] & 0xffff) | ((jmp[0] & 0xffff) << 16);
   315		if (addr & 0x8000)
   316			addr -= 0x10000;
   317	
   318		*target = addr;
   319	
   320		return 0;
   321	}
   322	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
