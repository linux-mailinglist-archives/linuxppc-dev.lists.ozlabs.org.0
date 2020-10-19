Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 878B3292A92
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 17:37:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFLVl4KlZzDqdl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 02:37:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFLSN0f09zDqbf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 02:35:46 +1100 (AEDT)
IronPort-SDR: tjtjzUL94BNlflbCZh9iXV2Phn+2QA7oosJaSM8pCB+Ba/tpKdnOqxJtn0cTAtJ2Kf+dGZymxq
 vjP8YP7uaL0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9778"; a="184662808"
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
 d="gz'50?scan'50,208,50";a="184662808"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2020 08:35:43 -0700
IronPort-SDR: i5pjL9KkAvTkZmKu8iYUH45oQETtPIyngSiEVprd/Z/dfjfQpOzVDtJ4a6kk5T/ZnV3cRWFoKb
 REQ2f314WEWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,394,1596524400"; 
 d="gz'50?scan'50,208,50";a="358191297"
Received: from lkp-server01.sh.intel.com (HELO 88424da292e0) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Oct 2020 08:35:40 -0700
Received: from kbuild by 88424da292e0 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kUXCF-0000Ay-TA; Mon, 19 Oct 2020 15:35:39 +0000
Date: Mon, 19 Oct 2020 23:35:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 3/3] powerpc: Fix pre-update addressing in inline assembly
Message-ID: <202010192300.35IC9AK7-lkp@intel.com>
References: <fbcdb173cc42da62f00285dfef8c2f7d4960b5c7.1603109522.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
In-Reply-To: <fbcdb173cc42da62f00285dfef8c2f7d4960b5c7.1603109522.git.christophe.leroy@csgroup.eu>
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
Cc: clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on linus/master next-20201016]
[cannot apply to kvm-ppc/kvm-ppc-next mpe/next v5.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerpc-uaccess-Don-t-use-m-constraint-with-GCC-4-9/20201019-201504
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc64-randconfig-r012-20201019 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 094e9f4779eb9b5c6a49014f2f80b8cbb833572f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc64 cross compiling tool for clang build
        # apt-get install binutils-powerpc64-linux-gnu
        # https://github.com/0day-ci/linux/commit/d57fd8d270993414b8c0414d7be4b03cc3de1856
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christophe-Leroy/powerpc-uaccess-Don-t-use-m-constraint-with-GCC-4-9/20201019-201504
        git checkout d57fd8d270993414b8c0414d7be4b03cc3de1856
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:5:
   In file included from include/linux/spinlock.h:51:
   In file included from include/linux/preempt.h:78:
   In file included from ./arch/powerpc/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
   In file included from include/linux/thread_info.h:21:
   In file included from arch/powerpc/include/asm/current.h:13:
   In file included from arch/powerpc/include/asm/paca.h:31:
   In file included from arch/powerpc/include/asm/atomic.h:13:
   In file included from arch/powerpc/include/asm/ppc_asm.h:9:
   In file included from arch/powerpc/include/asm/processor.h:40:
>> arch/powerpc/include/asm/ptrace.h:288:20: error: use of undeclared identifier 'THREAD_SIZE'
           return ((addr & ~(THREAD_SIZE - 1))  ==
                             ^
   arch/powerpc/include/asm/ptrace.h:289:35: error: use of undeclared identifier 'THREAD_SIZE'
                   (kernel_stack_pointer(regs) & ~(THREAD_SIZE - 1)));
                                                   ^
   In file included from arch/powerpc/kernel/asm-offsets.c:21:
   include/linux/mman.h:137:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:115:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:138:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      );
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:115:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   2 warnings and 2 errors generated.
   make[2]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1202: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

vim +/THREAD_SIZE +288 arch/powerpc/include/asm/ptrace.h

359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  275  
359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  276  /**
359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  277   * regs_within_kernel_stack() - check the address in the stack
359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  278   * @regs:      pt_regs which contains kernel stack pointer.
359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  279   * @addr:      address which is checked.
359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  280   *
359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  281   * regs_within_kernel_stack() checks @addr is within the kernel stack page(s).
359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  282   * If @addr is within the kernel stack, it returns true. If not, returns false.
359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  283   */
359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  284  
359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  285  static inline bool regs_within_kernel_stack(struct pt_regs *regs,
359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  286  						unsigned long addr)
359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  287  {
359e4284a3f37ab Mahesh Salgaonkar 2010-04-07 @288  	return ((addr & ~(THREAD_SIZE - 1))  ==
359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  289  		(kernel_stack_pointer(regs) & ~(THREAD_SIZE - 1)));
359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  290  }
359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  291  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--C7zPtVaVf+AK4Oqc
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--C7zPtVaVf+AK4Oqc--
