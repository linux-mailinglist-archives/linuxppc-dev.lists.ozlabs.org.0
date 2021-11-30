Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD88B463DFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 19:45:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3WPT3dkCz3cVT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 05:45:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=nMQBSzya;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::536;
 helo=mail-ed1-x536.google.com; envelope-from=morbo@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=nMQBSzya; dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3WNn4HWbz2yPm
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 05:44:55 +1100 (AEDT)
Received: by mail-ed1-x536.google.com with SMTP id z5so25641464edd.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 10:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sc7ICuBy+mhGXWIY44uQqPRlUbyWv7MrAGd+7Q6+8z8=;
 b=nMQBSzyaj7uZfqA+LHkgME5EDexYl5Aot3D0qzGlJLxIflgptVQPbg2ervcZgfF2GX
 2ef9Wq5N51v3fx9SwUAQZ9MtXtwfO3Lu3VIiV7e3xIWyrSzp0a+7MQekvge9nmmavlJr
 x/7EWz1Cj2Af/TTTw7IIDzU7J5+gN8ZfxibKvJL4ptxc6PJV3SvJYGUXggT84sfowdCg
 lsvtI3Q1bQ3/ZL+l6CY4mZJ9ecfrA0fSEYqcnLSLYDJpVqtktag9QVEBd0ZbHUcRdQOL
 H9nXFS32+LeUdmD+01pAqXR5mAonOUZXFBpK68bAheYASlm6+GWUtTzafN9/fpqvOVAu
 E82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sc7ICuBy+mhGXWIY44uQqPRlUbyWv7MrAGd+7Q6+8z8=;
 b=VE5lKc5oJjXq666HkZAHLmUp3gg9JEqJyvggL7G6lH4EQWnQFqARlxw6WPyqi2XmED
 mcPlhj7CwtZd78mrVJlOgJzUCSUOuh56GBkAqQjbQO1oO3ugPwdO+/gIikkaklHSZfa3
 AF9NTfrO3k1M2Fy36owJmn7Hwec9KfvUFLeZD4T5A7hCZXModLiZBIwtPgNQTPyqEEYF
 OYfu+jk2e/Xeheo8IRehTl5Zvsc/9D0ADcuSKCNIHc0JKga/a4PRX/Oy2Rv9QrYm20yX
 amOh/4pD2PYv/sweXZFod5KCLzCs4arag4pGqKuT5cccOSFvgucnxNV7XuK7XlYcFkQ1
 wMKg==
X-Gm-Message-State: AOAM533fsDca4GFslXmwF7fWsMleaPC1D0BGihtKGf+G5Yw7/RsHoNcT
 p5EhOrxmaeCEqNarCAUdjYbftJs/yCoZV7hluDKg
X-Google-Smtp-Source: ABdhPJy+UTGnLqC8KkY79o/83e+F30DrlYNo6ryih+sbOnzFI6+cdPglOCWNvHxNpX/9fG/dt1pgHpTffSIUGHZUtjw=
X-Received: by 2002:a50:9e0f:: with SMTP id z15mr1105096ede.278.1638297891129; 
 Tue, 30 Nov 2021 10:44:51 -0800 (PST)
MIME-Version: 1.0
References: <0d5b12183d5176dd702d29ad94c39c384e51c78f.1638208156.git.christophe.leroy@csgroup.eu>
 <202111300652.0yDBNvyJ-lkp@intel.com>
 <e7b67ca6-8cd1-da3c-c0f3-e05f7e592828@csgroup.eu>
 <87a6hlq408.fsf@mpe.ellerman.id.au> <YaZqs2tPxMzhgkAW@archlinux-ax161>
 <CAGG=3QX4k6MZ1qkT+sVAroJeBpbZBnOJauM_uJsu2uV1vnVObQ@mail.gmail.com>
In-Reply-To: <CAGG=3QX4k6MZ1qkT+sVAroJeBpbZBnOJauM_uJsu2uV1vnVObQ@mail.gmail.com>
From: Bill Wendling <morbo@google.com>
Date: Tue, 30 Nov 2021 10:44:40 -0800
Message-ID: <CAGG=3QVQ9bwWWyKDN3_C2B0v7H6iZ4ZpNybXGCqbzwWrPjuPrg@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] powerpc/inst: Optimise
 copy_inst_from_kernel_nofault()
To: Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 30, 2021 at 10:38 AM Bill Wendling <morbo@google.com> wrote:
>
> On Tue, Nov 30, 2021 at 10:17 AM Nathan Chancellor <nathan@kernel.org> wr=
ote:
> >
> > On Tue, Nov 30, 2021 at 10:25:43PM +1100, Michael Ellerman wrote:
> > > Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> > > > Le 29/11/2021 =C3=A0 23:55, kernel test robot a =C3=A9crit :
> > > >> Hi Christophe,
> > > >>
> > > >> I love your patch! Perhaps something to improve:
> > > >>
> > > >> [auto build test WARNING on powerpc/next]
> > > >> [also build test WARNING on v5.16-rc3 next-20211129]
> > > >> [If your patch is applied to the wrong git tree, kindly drop us a =
note.
> > > >> And when submitting patch, we suggest to use '--base' as documente=
d in
> > > >> https://git-scm.com/docs/git-format-patch]
> > > >>
> > > >> url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/=
powerpc-inst-Refactor-___get_user_instr/20211130-015346
> > > >> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/li=
nux.git next
> > > >> config: powerpc-randconfig-r023-20211129 (https://download.01.org/=
0day-ci/archive/20211130/202111300652.0yDBNvyJ-lkp@intel.com/config)
> > > >> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-proje=
ct df08b2fe8b35cb63dfb3b49738a3494b9b4e6f8e)
> > > >> reproduce (this is a W=3D1 build):
> > > >>          wget https://raw.githubusercontent.com/intel/lkp-tests/ma=
ster/sbin/make.cross -O ~/bin/make.cross
> > > >>          chmod +x ~/bin/make.cross
> > > >>          # install powerpc cross compiling tool for clang build
> > > >>          # apt-get install binutils-powerpc-linux-gnu
> > > >>          # https://github.com/0day-ci/linux/commit/fb7bff30cc0efc7=
e4df1b48bb69de1f325eee826
> > > >>          git remote add linux-review https://github.com/0day-ci/li=
nux
> > > >>          git fetch --no-tags linux-review Christophe-Leroy/powerpc=
-inst-Refactor-___get_user_instr/20211130-015346
> > > >>          git checkout fb7bff30cc0efc7e4df1b48bb69de1f325eee826
> > > >>          # save the config file to linux build tree
> > > >>          mkdir build_dir
> > > >>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.=
cross W=3D1 O=3Dbuild_dir ARCH=3Dpowerpc prepare
> > > >>
> > > >> If you fix the issue, kindly add following tag as appropriate
> > > >> Reported-by: kernel test robot <lkp@intel.com>
> > > >>
> > > >> All warnings (new ones prefixed by >>):
> > > >>
> > > >>     In file included from arch/powerpc/kernel/asm-offsets.c:71:
> > > >>     In file included from arch/powerpc/kernel/../xmon/xmon_bpts.h:=
7:
> > > >>>> arch/powerpc/include/asm/inst.h:165:20: warning: variable 'val' =
is uninitialized when used here [-Wuninitialized]
> > > >>                     *inst =3D ppc_inst(val);
> > > >>                                      ^~~
> > > >>     arch/powerpc/include/asm/inst.h:53:22: note: expanded from mac=
ro 'ppc_inst'
> > > >>     #define ppc_inst(x) (x)
> > > >>                          ^
> > > >>     arch/powerpc/include/asm/inst.h:155:18: note: initialize the v=
ariable 'val' to silence this warning
> > > >>             unsigned int val, suffix;
> > > >>                             ^
> > > >>                              =3D 0
> > > >
> > > > I can't understand what's wrong here.
> > > >
> > > > We have
> > > >
> > > >     __get_kernel_nofault(&val, src, u32, Efault);
> > > >     if (IS_ENABLED(CONFIG_PPC64) && get_op(val) =3D=3D OP_PREFIX) {
> > > >             __get_kernel_nofault(&suffix, src + 1, u32, Efault);
> > > >             *inst =3D ppc_inst_prefix(val, suffix);
> > > >     } else {
> > > >             *inst =3D ppc_inst(val);
> > > >     }
> > > >
> > > > With
> > > >
> > > > #define __get_kernel_nofault(dst, src, type, err_label)            =
         \
> > > >     __get_user_size_goto(*((type *)(dst)),                         =
 \
> > > >             (__force type __user *)(src), sizeof(type), err_label)
> > > >
> > > >
> > > > And
> > > >
> > > > #define __get_user_size_goto(x, ptr, size, label)                  =
         \
> > > > do {                                                               =
                 \
> > > >     BUILD_BUG_ON(size > sizeof(x));                                =
         \
> > > >     switch (size) {                                                =
         \
> > > >     case 1: __get_user_asm_goto(x, (u8 __user *)ptr, label, "lbz");=
 break;  \
> > > >     case 2: __get_user_asm_goto(x, (u16 __user *)ptr, label, "lhz")=
; break; \
> > > >     case 4: __get_user_asm_goto(x, (u32 __user *)ptr, label, "lwz")=
; break; \
> > > >     case 8: __get_user_asm2_goto(x, (u64 __user *)ptr, label);  bre=
ak;      \
> > > >     default: x =3D 0; BUILD_BUG();                                 =
           \
> > > >     }                                                              =
         \
> > > > } while (0)
> > > >
> > > > And
> > > >
> > > > #define __get_user_asm_goto(x, addr, label, op)                    =
 \
> > > >     asm_volatile_goto(                                      \
> > > >             "1:     "op"%U1%X1 %0, %1       # get_user\n"   \
> > > >             EX_TABLE(1b, %l2)                               \
> > > >             : "=3Dr" (x)                                      \
> > > >             : "m<>" (*addr)                         \
> > > >             :                                               \
> > > >             : label)
> > > >
> > > >
> > > > I see no possibility, no alternative path where val wouldn't be set=
. The
> > > > asm clearly has *addr as an output param so it is always set.
> > >
> > > I guess clang can't convince itself of that?
> >
> > A simplified reproducer:
> >
> > $ cat test.c
> > static inline int copy_inst_from_kernel_nofault(unsigned int *inst,
> >                                                 unsigned int *src)
> > {
> >         unsigned int val;
> >
> >         asm goto("1: lwz %U1%X1 %0, %1   # get_user\n"
> >                  ".section __ex_table,\"a\";"
> >                  ".balign 4;"
> >                  ".long (1b) - . ;"
> >                  ".long (%l2) - . ;"
> >                  ".previous"
> >                  : "=3Dr" (*(unsigned int *)(&val))
> >                  : "m<>" (*(unsigned int *)(src))
> >                  :
> >                  : Efault);
> >
> >         *inst =3D val;
> >         return 0;
> >
> > Efault:
> >         return -14; /* -EFAULT */
> > }
> >
> > $ clang --target=3Dpowerpc-linux-gnu -Wuninitialized -fsyntax-only test=
.c
> > test.c:17:10: warning: variable 'val' is uninitialized when used here [=
-Wuninitialized]
> >         *inst =3D val;
> >                 ^~~
> > test.c:4:18: note: initialize the variable 'val' to silence this warnin=
g
> >         unsigned int val;
> >                         ^
> >                          =3D 0
> > 1 warning generated.
> >
> > It certainly looks like there is something wrong with how clang is
> > tracking the initialization of the variable because it looks to me like
> > val is only used in the fallthrough path, which happens after it is
> > initialized via lwz.  Perhaps something is wrong with the logic of
> > https://reviews.llvm.org/D71314?  I've added Bill to CC (LLVM issues ar=
e
> > being migrated from Bugzilla to GitHub Issues right now so I cannot fil=
e
> > this upstream at the moment).
> >
> If I remove the casts of "val" the warning doesn't appear. I suspect
> that when I wrote that patch I forgot to remove those when checking.
> #include "Captain_Picard_facepalm.h"
>
> I'll look into it.
>
Small retraction. It's the "*(<cast>)&val" that's the issue. (I.e. the "*&"=
)
