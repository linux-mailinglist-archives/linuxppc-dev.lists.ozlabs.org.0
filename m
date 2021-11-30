Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71126463D94
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 19:18:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3Vny4vKZz3c98
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 05:18:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rigIwMrg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=nathan@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rigIwMrg; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3VnG4C5Vz2yJL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 05:17:38 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A512DB81B9B;
 Tue, 30 Nov 2021 18:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB67BC53FCC;
 Tue, 30 Nov 2021 18:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638296249;
 bh=we0XXIEykccEkXZEaJhZNjX+PQK69G70xjfm//KyBgA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rigIwMrgMPCkepAryW1j2rkkbvPAjrSv7o5Rc+jAMdkurrFl33bZPO2BEl55yqpQD
 ylkFUhCN6RuZo0jTXSQluq10v/HjJjEuUs7TpgPR26Wwe9yRGKnFQgmwQU0ovCAXao
 DkiQffFoZvr6AeBnAcouF6YULvoqnhcKDLQdZlk4cTwhytra+kJBJ9Z8jUmbmDPnQi
 cwOCshj0WO3ycrLOBukz03c0ViQJbLNOayYfOON9xlJ/H/42HaADYVxq0iOmpgsUQR
 QRJSV7brQAzhFAVwPwKOe87CK+miGoK8rqkMxluAVorROSUoMmXrzevYFiclY8Gx6O
 d0hFSMOg4vauA==
Date: Tue, 30 Nov 2021 11:17:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 5/5] powerpc/inst: Optimise
 copy_inst_from_kernel_nofault()
Message-ID: <YaZqs2tPxMzhgkAW@archlinux-ax161>
References: <0d5b12183d5176dd702d29ad94c39c384e51c78f.1638208156.git.christophe.leroy@csgroup.eu>
 <202111300652.0yDBNvyJ-lkp@intel.com>
 <e7b67ca6-8cd1-da3c-c0f3-e05f7e592828@csgroup.eu>
 <87a6hlq408.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a6hlq408.fsf@mpe.ellerman.id.au>
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
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Bill Wendling <morbo@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 30, 2021 at 10:25:43PM +1100, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> > Le 29/11/2021 à 23:55, kernel test robot a écrit :
> >> Hi Christophe,
> >> 
> >> I love your patch! Perhaps something to improve:
> >> 
> >> [auto build test WARNING on powerpc/next]
> >> [also build test WARNING on v5.16-rc3 next-20211129]
> >> [If your patch is applied to the wrong git tree, kindly drop us a note.
> >> And when submitting patch, we suggest to use '--base' as documented in
> >> https://git-scm.com/docs/git-format-patch]
> >> 
> >> url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/powerpc-inst-Refactor-___get_user_instr/20211130-015346
> >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> >> config: powerpc-randconfig-r023-20211129 (https://download.01.org/0day-ci/archive/20211130/202111300652.0yDBNvyJ-lkp@intel.com/config)
> >> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project df08b2fe8b35cb63dfb3b49738a3494b9b4e6f8e)
> >> reproduce (this is a W=1 build):
> >>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >>          chmod +x ~/bin/make.cross
> >>          # install powerpc cross compiling tool for clang build
> >>          # apt-get install binutils-powerpc-linux-gnu
> >>          # https://github.com/0day-ci/linux/commit/fb7bff30cc0efc7e4df1b48bb69de1f325eee826
> >>          git remote add linux-review https://github.com/0day-ci/linux
> >>          git fetch --no-tags linux-review Christophe-Leroy/powerpc-inst-Refactor-___get_user_instr/20211130-015346
> >>          git checkout fb7bff30cc0efc7e4df1b48bb69de1f325eee826
> >>          # save the config file to linux build tree
> >>          mkdir build_dir
> >>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare
> >> 
> >> If you fix the issue, kindly add following tag as appropriate
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> 
> >> All warnings (new ones prefixed by >>):
> >> 
> >>     In file included from arch/powerpc/kernel/asm-offsets.c:71:
> >>     In file included from arch/powerpc/kernel/../xmon/xmon_bpts.h:7:
> >>>> arch/powerpc/include/asm/inst.h:165:20: warning: variable 'val' is uninitialized when used here [-Wuninitialized]
> >>                     *inst = ppc_inst(val);
> >>                                      ^~~
> >>     arch/powerpc/include/asm/inst.h:53:22: note: expanded from macro 'ppc_inst'
> >>     #define ppc_inst(x) (x)
> >>                          ^
> >>     arch/powerpc/include/asm/inst.h:155:18: note: initialize the variable 'val' to silence this warning
> >>             unsigned int val, suffix;
> >>                             ^
> >>                              = 0
> >
> > I can't understand what's wrong here.
> >
> > We have
> >
> > 	__get_kernel_nofault(&val, src, u32, Efault);
> > 	if (IS_ENABLED(CONFIG_PPC64) && get_op(val) == OP_PREFIX) {
> > 		__get_kernel_nofault(&suffix, src + 1, u32, Efault);
> > 		*inst = ppc_inst_prefix(val, suffix);
> > 	} else {
> > 		*inst = ppc_inst(val);
> > 	}
> >
> > With
> >
> > #define __get_kernel_nofault(dst, src, type, err_label)			\
> > 	__get_user_size_goto(*((type *)(dst)),				\
> > 		(__force type __user *)(src), sizeof(type), err_label)
> >
> >
> > And
> >
> > #define __get_user_size_goto(x, ptr, size, label)				\
> > do {										\
> > 	BUILD_BUG_ON(size > sizeof(x));						\
> > 	switch (size) {								\
> > 	case 1: __get_user_asm_goto(x, (u8 __user *)ptr, label, "lbz"); break;	\
> > 	case 2: __get_user_asm_goto(x, (u16 __user *)ptr, label, "lhz"); break;	\
> > 	case 4: __get_user_asm_goto(x, (u32 __user *)ptr, label, "lwz"); break;	\
> > 	case 8: __get_user_asm2_goto(x, (u64 __user *)ptr, label);  break;	\
> > 	default: x = 0; BUILD_BUG();						\
> > 	}									\
> > } while (0)
> >
> > And
> >
> > #define __get_user_asm_goto(x, addr, label, op)			\
> > 	asm_volatile_goto(					\
> > 		"1:	"op"%U1%X1 %0, %1	# get_user\n"	\
> > 		EX_TABLE(1b, %l2)				\
> > 		: "=r" (x)					\
> > 		: "m<>" (*addr)				\
> > 		:						\
> > 		: label)
> >
> >
> > I see no possibility, no alternative path where val wouldn't be set. The 
> > asm clearly has *addr as an output param so it is always set.
> 
> I guess clang can't convince itself of that?

A simplified reproducer:

$ cat test.c
static inline int copy_inst_from_kernel_nofault(unsigned int *inst,
                                                unsigned int *src)
{
        unsigned int val;

        asm goto("1: lwz %U1%X1 %0, %1   # get_user\n"
                 ".section __ex_table,\"a\";"
                 ".balign 4;"
                 ".long (1b) - . ;"
                 ".long (%l2) - . ;"
                 ".previous"
                 : "=r" (*(unsigned int *)(&val))
                 : "m<>" (*(unsigned int *)(src))
                 :
                 : Efault);

        *inst = val;
        return 0;

Efault:
        return -14; /* -EFAULT */
}

$ clang --target=powerpc-linux-gnu -Wuninitialized -fsyntax-only test.c
test.c:17:10: warning: variable 'val' is uninitialized when used here [-Wuninitialized]
        *inst = val;
                ^~~
test.c:4:18: note: initialize the variable 'val' to silence this warning
        unsigned int val;
                        ^
                         = 0
1 warning generated.

It certainly looks like there is something wrong with how clang is
tracking the initialization of the variable because it looks to me like
val is only used in the fallthrough path, which happens after it is
initialized via lwz.  Perhaps something is wrong with the logic of
https://reviews.llvm.org/D71314?  I've added Bill to CC (LLVM issues are
being migrated from Bugzilla to GitHub Issues right now so I cannot file
this upstream at the moment).

Cheers,
Nathan
