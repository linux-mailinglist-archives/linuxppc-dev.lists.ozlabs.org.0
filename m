Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EF346325A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 12:26:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3Kff3zKJz3cT5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 22:26:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OuN9dVkI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3Kf25Bs2z2yyK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 22:25:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=OuN9dVkI; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J3Kf10g6wz4xPv;
 Tue, 30 Nov 2021 22:25:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1638271546;
 bh=nKlZETLEBCIwqXXojFKIvNI8XaTBsA/rBsc8S8G5uMk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=OuN9dVkIZh85h3WdJCnej8pPVOYexe7HDrnaRr5zrtCRu1qh+4eEtIr5wSux3M/jI
 Ps+v8BZ4YieYIRVk03NzsWzjZBv2XVl5d+syfxPZ1TCP2Lc+3gnJK5Jt+T77aQoW1s
 YBXCmayRhuUDUv9qeaDlVbJXdCp+pjxb1Ry63zx5msmfqja1hcc6kgR6E2p5J2dTbB
 IJCZqzG6J+yz17JSEL8X9bJkd+7jeZW/Cv6EPTBLPJ7Xh6a/H0zz21PT4z0KGYgryc
 1bKLTAwC8vLVW1TnFOERG6rizMv5IKca/fmrzteaRJFDgOcZf5Yf6vFB3fgxYy+UAi
 owjdE0jS0CXhQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, kernel test robot
 <lkp@intel.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul
 Mackerras <paulus@samba.org>, Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v5 5/5] powerpc/inst: Optimise
 copy_inst_from_kernel_nofault()
In-Reply-To: <e7b67ca6-8cd1-da3c-c0f3-e05f7e592828@csgroup.eu>
References: <0d5b12183d5176dd702d29ad94c39c384e51c78f.1638208156.git.christophe.leroy@csgroup.eu>
 <202111300652.0yDBNvyJ-lkp@intel.com>
 <e7b67ca6-8cd1-da3c-c0f3-e05f7e592828@csgroup.eu>
Date: Tue, 30 Nov 2021 22:25:43 +1100
Message-ID: <87a6hlq408.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 29/11/2021 =C3=A0 23:55, kernel test robot a =C3=A9crit=C2=A0:
>> Hi Christophe,
>>=20
>> I love your patch! Perhaps something to improve:
>>=20
>> [auto build test WARNING on powerpc/next]
>> [also build test WARNING on v5.16-rc3 next-20211129]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch]
>>=20
>> url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerp=
c-inst-Refactor-___get_user_instr/20211130-015346
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.gi=
t next
>> config: powerpc-randconfig-r023-20211129 (https://download.01.org/0day-c=
i/archive/20211130/202111300652.0yDBNvyJ-lkp@intel.com/config)
>> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project df0=
8b2fe8b35cb63dfb3b49738a3494b9b4e6f8e)
>> reproduce (this is a W=3D1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install powerpc cross compiling tool for clang build
>>          # apt-get install binutils-powerpc-linux-gnu
>>          # https://github.com/0day-ci/linux/commit/fb7bff30cc0efc7e4df1b=
48bb69de1f325eee826
>>          git remote add linux-review https://github.com/0day-ci/linux
>>          git fetch --no-tags linux-review Christophe-Leroy/powerpc-inst-=
Refactor-___get_user_instr/20211130-015346
>>          git checkout fb7bff30cc0efc7e4df1b48bb69de1f325eee826
>>          # save the config file to linux build tree
>>          mkdir build_dir
>>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc prepare
>>=20
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>=20
>> All warnings (new ones prefixed by >>):
>>=20
>>     In file included from arch/powerpc/kernel/asm-offsets.c:71:
>>     In file included from arch/powerpc/kernel/../xmon/xmon_bpts.h:7:
>>>> arch/powerpc/include/asm/inst.h:165:20: warning: variable 'val' is uni=
nitialized when used here [-Wuninitialized]
>>                     *inst =3D ppc_inst(val);
>>                                      ^~~
>>     arch/powerpc/include/asm/inst.h:53:22: note: expanded from macro 'pp=
c_inst'
>>     #define ppc_inst(x) (x)
>>                          ^
>>     arch/powerpc/include/asm/inst.h:155:18: note: initialize the variabl=
e 'val' to silence this warning
>>             unsigned int val, suffix;
>>                             ^
>>                              =3D 0
>
> I can't understand what's wrong here.
>
> We have
>
> 	__get_kernel_nofault(&val, src, u32, Efault);
> 	if (IS_ENABLED(CONFIG_PPC64) && get_op(val) =3D=3D OP_PREFIX) {
> 		__get_kernel_nofault(&suffix, src + 1, u32, Efault);
> 		*inst =3D ppc_inst_prefix(val, suffix);
> 	} else {
> 		*inst =3D ppc_inst(val);
> 	}
>
> With
>
> #define __get_kernel_nofault(dst, src, type, err_label)			\
> 	__get_user_size_goto(*((type *)(dst)),				\
> 		(__force type __user *)(src), sizeof(type), err_label)
>
>
> And
>
> #define __get_user_size_goto(x, ptr, size, label)				\
> do {										\
> 	BUILD_BUG_ON(size > sizeof(x));						\
> 	switch (size) {								\
> 	case 1: __get_user_asm_goto(x, (u8 __user *)ptr, label, "lbz"); break;	\
> 	case 2: __get_user_asm_goto(x, (u16 __user *)ptr, label, "lhz"); break;	\
> 	case 4: __get_user_asm_goto(x, (u32 __user *)ptr, label, "lwz"); break;	\
> 	case 8: __get_user_asm2_goto(x, (u64 __user *)ptr, label);  break;	\
> 	default: x =3D 0; BUILD_BUG();						\
> 	}									\
> } while (0)
>
> And
>
> #define __get_user_asm_goto(x, addr, label, op)			\
> 	asm_volatile_goto(					\
> 		"1:	"op"%U1%X1 %0, %1	# get_user\n"	\
> 		EX_TABLE(1b, %l2)				\
> 		: "=3Dr" (x)					\
> 		: "m<>" (*addr)				\
> 		:						\
> 		: label)
>
>
> I see no possibility, no alternative path where val wouldn't be set. The=
=20
> asm clearly has *addr as an output param so it is always set.

I guess clang can't convince itself of that?

>>     1 warning generated.
>>     <stdin>:1559:2: warning: syscall futex_waitv not implemented [-W#war=
nings]
>>     #warning syscall futex_waitv not implemented
>>      ^
>>     1 warning generated.
>>     arch/powerpc/kernel/vdso32/gettimeofday.S:72:8: error: unsupported d=
irective '.stabs'
>>     .stabs "_restgpr_31_x:F-1",36,0,0,_restgpr_31_x; .globl _restgpr_31_=
x; _restgpr_31_x:
>>            ^
>>     arch/powerpc/kernel/vdso32/gettimeofday.S:73:8: error: unsupported d=
irective '.stabs'
>>     .stabs "_rest32gpr_31_x:F-1",36,0,0,_rest32gpr_31_x; .globl _rest32g=
pr_31_x; _rest32gpr_31_x:
>
> How should we fix that ? Will clang support .stabs in the future ?

I think we should drop any stabs annotations / support. AFAICT none of
the toolchains we support produce it anymore.

cheers
