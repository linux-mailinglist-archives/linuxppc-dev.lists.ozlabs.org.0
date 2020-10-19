Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F832292D7F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 20:25:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFQDC4Yq7zDqf2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 05:25:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFQBf2N29zDqfB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 05:24:02 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CFQBH5NCgz9v6J9;
 Mon, 19 Oct 2020 20:23:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rtSOtVo1XFjp; Mon, 19 Oct 2020 20:23:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CFQBH4Kcnz9v6J7;
 Mon, 19 Oct 2020 20:23:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5CBDD8B7BF;
 Mon, 19 Oct 2020 20:23:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id n9mNzIxfnIUM; Mon, 19 Oct 2020 20:23:57 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 756CA8B79E;
 Mon, 19 Oct 2020 20:23:56 +0200 (CEST)
Subject: Re: [PATCH 3/3] powerpc: Fix pre-update addressing in inline assembly
To: kernel test robot <lkp@intel.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <fbcdb173cc42da62f00285dfef8c2f7d4960b5c7.1603109522.git.christophe.leroy@csgroup.eu>
 <202010192300.35IC9AK7-lkp@intel.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2253e9bc-8fe1-e823-2cc4-45ba9fe66d1f@csgroup.eu>
Date: Mon, 19 Oct 2020 20:23:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <202010192300.35IC9AK7-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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



Le 19/10/2020 à 17:35, kernel test robot a écrit :
> Hi Christophe,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on linus/master next-20201016]
> [cannot apply to kvm-ppc/kvm-ppc-next mpe/next v5.9]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerpc-uaccess-Don-t-use-m-constraint-with-GCC-4-9/20201019-201504
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: powerpc64-randconfig-r012-20201019 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 094e9f4779eb9b5c6a49014f2f80b8cbb833572f)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install powerpc64 cross compiling tool for clang build
>          # apt-get install binutils-powerpc64-linux-gnu
>          # https://github.com/0day-ci/linux/commit/d57fd8d270993414b8c0414d7be4b03cc3de1856
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Christophe-Leroy/powerpc-uaccess-Don-t-use-m-constraint-with-GCC-4-9/20201019-201504
>          git checkout d57fd8d270993414b8c0414d7be4b03cc3de1856
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc64
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from arch/powerpc/kernel/asm-offsets.c:14:
>     In file included from include/linux/compat.h:14:
>     In file included from include/linux/sem.h:5:
>     In file included from include/uapi/linux/sem.h:5:
>     In file included from include/linux/ipc.h:5:
>     In file included from include/linux/spinlock.h:51:
>     In file included from include/linux/preempt.h:78:
>     In file included from ./arch/powerpc/include/generated/asm/preempt.h:1:
>     In file included from include/asm-generic/preempt.h:5:
>     In file included from include/linux/thread_info.h:21:
>     In file included from arch/powerpc/include/asm/current.h:13:
>     In file included from arch/powerpc/include/asm/paca.h:31:
>     In file included from arch/powerpc/include/asm/atomic.h:13:
>     In file included from arch/powerpc/include/asm/ppc_asm.h:9:
>     In file included from arch/powerpc/include/asm/processor.h:40:
>>> arch/powerpc/include/asm/ptrace.h:288:20: error: use of undeclared identifier 'THREAD_SIZE'
>             return ((addr & ~(THREAD_SIZE - 1))  ==
>                               ^
>     arch/powerpc/include/asm/ptrace.h:289:35: error: use of undeclared identifier 'THREAD_SIZE'
>                     (kernel_stack_pointer(regs) & ~(THREAD_SIZE - 1)));

Most likely a circular inclusion problem.

I'll have to put it in a header that doesn't include pile of other stuff. The least bad candidate 
seems to be asm-const.h

Christophe

>                                                     ^
>     In file included from arch/powerpc/kernel/asm-offsets.c:21:
>     include/linux/mman.h:137:9: warning: division by zero is undefined [-Wdivision-by-zero]
>                    _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
>                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     include/linux/mman.h:115:21: note: expanded from macro '_calc_vm_trans'
>        : ((x) & (bit1)) / ((bit1) / (bit2))))
>                         ^ ~~~~~~~~~~~~~~~~~
>     include/linux/mman.h:138:9: warning: division by zero is undefined [-Wdivision-by-zero]
>                    _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      );
>                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     include/linux/mman.h:115:21: note: expanded from macro '_calc_vm_trans'
>        : ((x) & (bit1)) / ((bit1) / (bit2))))
>                         ^ ~~~~~~~~~~~~~~~~~
>     2 warnings and 2 errors generated.
>     make[2]: *** [scripts/Makefile.build:117: arch/powerpc/kernel/asm-offsets.s] Error 1
>     make[2]: Target '__build' not remade because of errors.
>     make[1]: *** [Makefile:1202: prepare0] Error 2
>     make[1]: Target 'prepare' not remade because of errors.
>     make: *** [Makefile:185: __sub-make] Error 2
>     make: Target 'prepare' not remade because of errors.
> 
> vim +/THREAD_SIZE +288 arch/powerpc/include/asm/ptrace.h
> 
> 359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  275
> 359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  276  /**
> 359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  277   * regs_within_kernel_stack() - check the address in the stack
> 359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  278   * @regs:      pt_regs which contains kernel stack pointer.
> 359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  279   * @addr:      address which is checked.
> 359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  280   *
> 359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  281   * regs_within_kernel_stack() checks @addr is within the kernel stack page(s).
> 359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  282   * If @addr is within the kernel stack, it returns true. If not, returns false.
> 359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  283   */
> 359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  284
> 359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  285  static inline bool regs_within_kernel_stack(struct pt_regs *regs,
> 359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  286  						unsigned long addr)
> 359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  287  {
> 359e4284a3f37ab Mahesh Salgaonkar 2010-04-07 @288  	return ((addr & ~(THREAD_SIZE - 1))  ==
> 359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  289  		(kernel_stack_pointer(regs) & ~(THREAD_SIZE - 1)));
> 359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  290  }
> 359e4284a3f37ab Mahesh Salgaonkar 2010-04-07  291
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
