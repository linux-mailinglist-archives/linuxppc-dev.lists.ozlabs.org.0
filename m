Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC30462704
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 23:57:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J31353PFtz3cYK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 09:57:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J312f1CPnz2xt7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 09:57:28 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="234819053"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="234819053"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 14:56:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="511903144"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 29 Nov 2021 14:56:23 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mrpZO-000CT1-TV; Mon, 29 Nov 2021 22:56:22 +0000
Date: Tue, 30 Nov 2021 06:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 5/5] powerpc/inst: Optimise
 copy_inst_from_kernel_nofault()
Message-ID: <202111300652.0yDBNvyJ-lkp@intel.com>
References: <0d5b12183d5176dd702d29ad94c39c384e51c78f.1638208156.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d5b12183d5176dd702d29ad94c39c384e51c78f.1638208156.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

I love your patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on v5.16-rc3 next-20211129]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerpc-inst-Refactor-___get_user_instr/20211130-015346
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-randconfig-r023-20211129 (https://download.01.org/0day-ci/archive/20211130/202111300652.0yDBNvyJ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project df08b2fe8b35cb63dfb3b49738a3494b9b4e6f8e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/0day-ci/linux/commit/fb7bff30cc0efc7e4df1b48bb69de1f325eee826
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christophe-Leroy/powerpc-inst-Refactor-___get_user_instr/20211130-015346
        git checkout fb7bff30cc0efc7e4df1b48bb69de1f325eee826
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:71:
   In file included from arch/powerpc/kernel/../xmon/xmon_bpts.h:7:
>> arch/powerpc/include/asm/inst.h:165:20: warning: variable 'val' is uninitialized when used here [-Wuninitialized]
                   *inst = ppc_inst(val);
                                    ^~~
   arch/powerpc/include/asm/inst.h:53:22: note: expanded from macro 'ppc_inst'
   #define ppc_inst(x) (x)
                        ^
   arch/powerpc/include/asm/inst.h:155:18: note: initialize the variable 'val' to silence this warning
           unsigned int val, suffix;
                           ^
                            = 0
   1 warning generated.
   <stdin>:1559:2: warning: syscall futex_waitv not implemented [-W#warnings]
   #warning syscall futex_waitv not implemented
    ^
   1 warning generated.
   arch/powerpc/kernel/vdso32/gettimeofday.S:72:8: error: unsupported directive '.stabs'
   .stabs "_restgpr_31_x:F-1",36,0,0,_restgpr_31_x; .globl _restgpr_31_x; _restgpr_31_x:
          ^
   arch/powerpc/kernel/vdso32/gettimeofday.S:73:8: error: unsupported directive '.stabs'
   .stabs "_rest32gpr_31_x:F-1",36,0,0,_rest32gpr_31_x; .globl _rest32gpr_31_x; _rest32gpr_31_x:
          ^
   make[2]: *** [arch/powerpc/kernel/vdso32/Makefile:55: arch/powerpc/kernel/vdso32/gettimeofday.o] Error 1
   make[2]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[1]: *** [arch/powerpc/Makefile:421: vdso_prepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/val +165 arch/powerpc/include/asm/inst.h

   152	
   153	static inline int copy_inst_from_kernel_nofault(ppc_inst_t *inst, u32 *src)
   154	{
   155		unsigned int val, suffix;
   156	
   157		if (unlikely(!is_kernel_addr((unsigned long)src)))
   158			return -ERANGE;
   159	
   160		__get_kernel_nofault(&val, src, u32, Efault);
   161		if (IS_ENABLED(CONFIG_PPC64) && get_op(val) == OP_PREFIX) {
   162			__get_kernel_nofault(&suffix, src + 1, u32, Efault);
   163			*inst = ppc_inst_prefix(val, suffix);
   164		} else {
 > 165			*inst = ppc_inst(val);
   166		}
   167		return 0;
   168	Efault:
   169		return -EFAULT;
   170	}
   171	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
