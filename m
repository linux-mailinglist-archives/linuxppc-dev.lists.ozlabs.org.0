Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 165F12B2540
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 21:16:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXqVZ3N8ZzDr1N
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Nov 2020 07:16:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=tfJD0iPM; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXqSV6zgXzDqwy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Nov 2020 07:14:33 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id c20so8555446pfr.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 12:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SB4yM9BP1q0n/PEjqfc5daeMNdbEriOpuOWP+hRLfIQ=;
 b=tfJD0iPMCXD0GsRYB9bZgQNbLDY+gp3WsF6bCDyyzWhFXYQFN1aawkaSK4WKnf01qj
 7FEddX+XRga/EralgRN/7I6xPtQxY2ISoT5Joa9iXvPGVp7w/AsSvScVikaP8Ij9qXfh
 EIwlOAylbFtAOcT6hHtVo8obZPM8VpK/REH2HsU4c2kK0x97yqBful1JZU97ZtNIkZuk
 IWBmPESw9b0BEM3UV67gqTJBvMhQjhjeQuFkgghFAxQrnW4+ZljUi1pf5Zt2jA6vhYcj
 tuwKYNdVzkN9+GnT4lOAvrrBqwJN0dvGWXSNZNA19TIKIZgN9XMaqKMbOj/kI7VNUkC+
 s/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SB4yM9BP1q0n/PEjqfc5daeMNdbEriOpuOWP+hRLfIQ=;
 b=gjmJBEHOC1bk8n7mAeNnlV7qjgvM+1HvwnkG3NUoyVZudoO0NxvmZTg3q5NZuxu3Yy
 cmSK+JSjY0qcFj6XtkvlUvFz98wCQvUHrgqdQKFwkFOdWGQzQy12RheP4VfYwub3tkyq
 HVvGfE+8u8IGQyLxZDXTmBSo/mN9t4ChlXEwGo/iNF6FcOLP2TH0H9ALwWx9CzZoH2Rs
 0+ae7S+anIEBKPHJwh5nt9G9yLbsgm8BQifx5QWPS+lYG8UiFtSE7KPN844jwY36Gxeh
 NUjYrn17jvfWfjn48c80wII+TfemcoJjQC+l7b4voeEeZa2EKuSJ1XnVktbcDce23XfF
 LVFw==
X-Gm-Message-State: AOAM5310H6/3qNxyJbgJAsz/IV4t1BlhQaDsNo6X4la4KBNrYRwZws1s
 08OcF8P5f3UTl2bDkF3NagvknXJ+MdVeezFbGYpkDQ==
X-Google-Smtp-Source: ABdhPJzIGJk2Dbt2QgBOSvUUbHCmM38TbIhpTTtUI6llEZTfOcHX1olGj1U6kzVW7kwmcOjEm6AMr/mU0jOaFc3bg2c=
X-Received: by 2002:a62:ed0d:0:b029:18b:78d:626 with SMTP id
 u13-20020a62ed0d0000b029018b078d0626mr3515257pfh.15.1605298469564; Fri, 13
 Nov 2020 12:14:29 -0800 (PST)
MIME-Version: 1.0
References: <202011131146.g8dPLQDD-lkp@intel.com>
 <CAFP8O3LpSmxVnjHfQAN455k1ZRg3PbgZYhWr030evCq1T10k=Q@mail.gmail.com>
 <20201113190824.GA1477315@ubuntu-m3-large-x86>
 <CAKwvOdkEtTQhDRFRV_d66FyhQBe536vRbOW=fQjesiHz3dfeBA@mail.gmail.com>
 <20201113200444.GA1496675@ubuntu-m3-large-x86>
In-Reply-To: <20201113200444.GA1496675@ubuntu-m3-large-x86>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 13 Nov 2020 12:14:18 -0800
Message-ID: <CAKwvOdkBSGPaKmQY1nERVe4_n19Q=MUtuwdond=FJAAF9N9Zhg@mail.gmail.com>
Subject: Re: Error: invalid switch -me200
To: Nathan Chancellor <natechancellor@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Segher Boessenkool <segher@kernel.crashing.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Arnd Bergmann <arnd@kernel.org>, Brian Cain <bcain@codeaurora.org>
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
 =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 13, 2020 at 12:04 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Fri, Nov 13, 2020 at 11:42:03AM -0800, Nick Desaulniers wrote:
> > + MPE, PPC
> >
> > On Fri, Nov 13, 2020 at 11:08 AM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > On Fri, Nov 13, 2020 at 09:28:03AM -0800, F=C4=81ng-ru=C3=AC S=C3=B2n=
g wrote:
> > > > On Thu, Nov 12, 2020 at 7:22 PM kernel test robot <lkp@intel.com> w=
rote:
> > > > >
> > > > > Hi Fangrui,
> > > > >
> > > > > FYI, the error/warning still remains.
> > > > >
> > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/=
linux.git master
> > > > > head:   585e5b17b92dead8a3aca4e3c9876fbca5f7e0ba
> > > > > commit: ca9b31f6bb9c6aa9b4e5f0792f39a97bbffb8c51 Makefile: Fix GC=
C_TOOLCHAIN_DIR prefix for Clang cross compilation
> > > > > date:   4 months ago
> > > > > config: powerpc-randconfig-r031-20201113 (attached as .config)
> >
> > ^ randconfig
> >
> > > > > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-proj=
ect 9e0c35655b6e8186baef8840b26ba4090503b554)
> > > > > reproduce (this is a W=3D1 build):
> > > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/ma=
ster/sbin/make.cross -O ~/bin/make.cross
> > > > >         chmod +x ~/bin/make.cross
> > > > >         # install powerpc cross compiling tool for clang build
> > > > >         # apt-get install binutils-powerpc-linux-gnu
> > > > >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvald=
s/linux.git/commit/?id=3Dca9b31f6bb9c6aa9b4e5f0792f39a97bbffb8c51
> > > > >         git remote add linus https://git.kernel.org/pub/scm/linux=
/kernel/git/torvalds/linux.git
> > > > >         git fetch --no-tags linus master
> > > > >         git checkout ca9b31f6bb9c6aa9b4e5f0792f39a97bbffb8c51
> > > > >         # save the attached .config to linux build tree
> > > > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.=
cross ARCH=3Dpowerpc
> > > > >
> > > > > If you fix the issue, kindly add following tag as appropriate
> > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > >
> > > > > All errors (new ones prefixed by >>):
> > > > >
> > > > >    Assembler messages:
> > > > > >> Error: invalid switch -me200
> > > > > >> Error: unrecognized option -me200
> > > > >    clang-12: error: assembler command failed with exit code 1 (us=
e -v to see invocation)
> > > > >    make[2]: *** [scripts/Makefile.build:281: scripts/mod/empty.o]=
 Error 1
> > > > >    make[2]: Target '__build' not remade because of errors.
> > > > >    make[1]: *** [Makefile:1174: prepare0] Error 2
> > > > >    make[1]: Target 'prepare' not remade because of errors.
> > > > >    make: *** [Makefile:185: __sub-make] Error 2
> > > > >    make: Target 'prepare' not remade because of errors.
> > > > >
> > > > > ---
> > > > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > > > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> > > >
> > > > This can be ignored. The LLVM integrated assembler does not recogni=
ze
> > > > -me200 (-Wa,-me200 in arch/powerpc/Makefile). I guess the GNU as -m
> > > > option is similar to .arch or .machine and controls what instructio=
ns
> > > > are recognized. The integrated assembler tends to support all
> > > > instructions (conditional supporting some instructions has some
> > > > challenges; in the end I have patched parsing but ignoring `.arch` =
for
> > > > x86-64 and ignoring `.machine ppc64` for ppc64)
> > > >
> > > > (In addition, e200 is a 32-bit Power ISA microprocessor. 32-bit
> > > > support may get less attention in LLVM.)
> > >
> > > This is also not a clang specific issue, I see the exact same error
> > > with GCC 10.2.0 and binutils 2.35.
> > >
> > > $ make -skj64 ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64-linux- olddefc=
onfig vmlinux
> >
> > Does using a non 64b triple produce the same failure?
>
> Yes, CROSS_COMPILE=3Dpowerpc-linux- produces the same failure.
>
> > > ...
> > > Error: invalid switch -me200
> > > Error: unrecognized option -me200
> >
> > There's a block in  arch/powerpc/Makefile:
> > 248 cpu-as-$(CONFIG_40x)    +=3D -Wa,-m405
> > 249 cpu-as-$(CONFIG_44x)    +=3D -Wa,-m440
> > 250 cpu-as-$(CONFIG_ALTIVEC)  +=3D $(call
> > as-option,-Wa$(comma)-maltivec)
> > 251 cpu-as-$(CONFIG_E200)   +=3D -Wa,-me200
> > 252 cpu-as-$(CONFIG_E500)   +=3D -Wa,-me500
> >
> > Are those all broken configs, or is Kconfig messed up such that
> > randconfig can select these when it should not?
>
> Hmmm, looks like this flag does not exist in mainline binutils? There is
> a thread in 2010 about this that Segher commented on:
>
> https://lore.kernel.org/linuxppc-dev/9859E645-954D-4D07-8003-FFCD2391AB6E=
@kernel.crashing.org/
>
> Guess this config should be eliminated?

If we're going to get pestered by 0day bot randconfigs over code
that's not possible to build, I'm all for deleting it.  I doubt we'll
be seeing patches from anyone to binutils for supporting these.

What has the kernel's policy been for code in tree that other folks
can't build (without proprietary tools)? (ARCH=3Dhexagon is pretty close
to not toeing the line here, not sure ICC actually works either).
--=20
Thanks,
~Nick Desaulniers
