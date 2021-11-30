Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F3B462C70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 06:58:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3BNv4yN1z3cWc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 16:58:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3BNS6nSmz2xtP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 16:58:30 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J3BNM60LCz9sSS;
 Tue, 30 Nov 2021 06:58:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VJnpcIrt215C; Tue, 30 Nov 2021 06:58:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J3BNM4v9hz9sSP;
 Tue, 30 Nov 2021 06:58:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 93DDE8B778;
 Tue, 30 Nov 2021 06:58:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HJlyjb9UKWoj; Tue, 30 Nov 2021 06:58:27 +0100 (CET)
Received: from [192.168.232.93] (unknown [192.168.232.93])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0AAA58B763;
 Tue, 30 Nov 2021 06:58:27 +0100 (CET)
Message-ID: <e7b67ca6-8cd1-da3c-c0f3-e05f7e592828@csgroup.eu>
Date: Tue, 30 Nov 2021 06:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v5 5/5] powerpc/inst: Optimise
 copy_inst_from_kernel_nofault()
Content-Language: fr-FR
To: kernel test robot <lkp@intel.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nick Desaulniers <ndesaulniers@google.com>
References: <0d5b12183d5176dd702d29ad94c39c384e51c78f.1638208156.git.christophe.leroy@csgroup.eu>
 <202111300652.0yDBNvyJ-lkp@intel.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <202111300652.0yDBNvyJ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 29/11/2021 à 23:55, kernel test robot a écrit :
> Hi Christophe,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on powerpc/next]
> [also build test WARNING on v5.16-rc3 next-20211129]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerpc-inst-Refactor-___get_user_instr/20211130-015346
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: powerpc-randconfig-r023-20211129 (https://download.01.org/0day-ci/archive/20211130/202111300652.0yDBNvyJ-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project df08b2fe8b35cb63dfb3b49738a3494b9b4e6f8e)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install powerpc cross compiling tool for clang build
>          # apt-get install binutils-powerpc-linux-gnu
>          # https://github.com/0day-ci/linux/commit/fb7bff30cc0efc7e4df1b48bb69de1f325eee826
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Christophe-Leroy/powerpc-inst-Refactor-___get_user_instr/20211130-015346
>          git checkout fb7bff30cc0efc7e4df1b48bb69de1f325eee826
>          # save the config file to linux build tree
>          mkdir build_dir
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>     In file included from arch/powerpc/kernel/asm-offsets.c:71:
>     In file included from arch/powerpc/kernel/../xmon/xmon_bpts.h:7:
>>> arch/powerpc/include/asm/inst.h:165:20: warning: variable 'val' is uninitialized when used here [-Wuninitialized]
>                     *inst = ppc_inst(val);
>                                      ^~~
>     arch/powerpc/include/asm/inst.h:53:22: note: expanded from macro 'ppc_inst'
>     #define ppc_inst(x) (x)
>                          ^
>     arch/powerpc/include/asm/inst.h:155:18: note: initialize the variable 'val' to silence this warning
>             unsigned int val, suffix;
>                             ^
>                              = 0

I can't understand what's wrong here.

We have

	__get_kernel_nofault(&val, src, u32, Efault);
	if (IS_ENABLED(CONFIG_PPC64) && get_op(val) == OP_PREFIX) {
		__get_kernel_nofault(&suffix, src + 1, u32, Efault);
		*inst = ppc_inst_prefix(val, suffix);
	} else {
		*inst = ppc_inst(val);
	}

With

#define __get_kernel_nofault(dst, src, type, err_label)			\
	__get_user_size_goto(*((type *)(dst)),				\
		(__force type __user *)(src), sizeof(type), err_label)


And

#define __get_user_size_goto(x, ptr, size, label)				\
do {										\
	BUILD_BUG_ON(size > sizeof(x));						\
	switch (size) {								\
	case 1: __get_user_asm_goto(x, (u8 __user *)ptr, label, "lbz"); break;	\
	case 2: __get_user_asm_goto(x, (u16 __user *)ptr, label, "lhz"); break;	\
	case 4: __get_user_asm_goto(x, (u32 __user *)ptr, label, "lwz"); break;	\
	case 8: __get_user_asm2_goto(x, (u64 __user *)ptr, label);  break;	\
	default: x = 0; BUILD_BUG();						\
	}									\
} while (0)

And

#define __get_user_asm_goto(x, addr, label, op)			\
	asm_volatile_goto(					\
		"1:	"op"%U1%X1 %0, %1	# get_user\n"	\
		EX_TABLE(1b, %l2)				\
		: "=r" (x)					\
		: "m<>" (*addr)				\
		:						\
		: label)


I see no possibility, no alternative path where val wouldn't be set. The 
asm clearly has *addr as an output param so it is always set.

>     1 warning generated.
>     <stdin>:1559:2: warning: syscall futex_waitv not implemented [-W#warnings]
>     #warning syscall futex_waitv not implemented
>      ^
>     1 warning generated.
>     arch/powerpc/kernel/vdso32/gettimeofday.S:72:8: error: unsupported directive '.stabs'
>     .stabs "_restgpr_31_x:F-1",36,0,0,_restgpr_31_x; .globl _restgpr_31_x; _restgpr_31_x:
>            ^
>     arch/powerpc/kernel/vdso32/gettimeofday.S:73:8: error: unsupported directive '.stabs'
>     .stabs "_rest32gpr_31_x:F-1",36,0,0,_rest32gpr_31_x; .globl _rest32gpr_31_x; _rest32gpr_31_x:

How should we fix that ? Will clang support .stabs in the future ?


>            ^
>     make[2]: *** [arch/powerpc/kernel/vdso32/Makefile:55: arch/powerpc/kernel/vdso32/gettimeofday.o] Error 1
>     make[2]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
>     make[1]: *** [arch/powerpc/Makefile:421: vdso_prepare] Error 2
>     make[1]: Target 'prepare' not remade because of errors.
>     make: *** [Makefile:219: __sub-make] Error 2
>     make: Target 'prepare' not remade because of errors.
> 
> 
> vim +/val +165 arch/powerpc/include/asm/inst.h
> 
>     152	
>     153	static inline int copy_inst_from_kernel_nofault(ppc_inst_t *inst, u32 *src)
>     154	{
>     155		unsigned int val, suffix;
>     156	
>     157		if (unlikely(!is_kernel_addr((unsigned long)src)))
>     158			return -ERANGE;
>     159	
>     160		__get_kernel_nofault(&val, src, u32, Efault);
>     161		if (IS_ENABLED(CONFIG_PPC64) && get_op(val) == OP_PREFIX) {
>     162			__get_kernel_nofault(&suffix, src + 1, u32, Efault);
>     163			*inst = ppc_inst_prefix(val, suffix);
>     164		} else {
>   > 165			*inst = ppc_inst(val);
>     166		}
>     167		return 0;
>     168	Efault:
>     169		return -EFAULT;
>     170	}
>     171	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
