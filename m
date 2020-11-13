Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A86A2B24D2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 20:44:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXpp951kGzDr7q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Nov 2020 06:44:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=oFn/RXDy; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXplH2WHKzDr3G
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Nov 2020 06:42:17 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id c20so8487836pfr.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 11:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bpaBEkCKEdHgW1h3duZgowAHWMVwm/wa+XAmGoyCFHI=;
 b=oFn/RXDyVA1j0y1YQDQOB2ftvc0uvORFJdjpj9LDlBrrNhMvbFReEzpWp24e286756
 4uT8WsjYCxktEdM0u6GrTe3zP/6MtEsFGCS4cmMGgtjYGJJ4FivdbALYSUP1DDjb73Wq
 EICO1cd3IrEkLRz/QdnDx+5qAwOofb0VdoEyfxzyPPvf9aDDudrOp8yJmeKdOO1SPZk+
 aO0NhK5SD16xRb2puDAUjDqglJe/OAjuPVAqxKxXAF0LEycfYydU/hJ7W5yzCKdEXs4B
 CCjEOXDtRhs4YQMdFVA1O8gksAFUltf/8U126y8IgS1rdV2diGiuqZ4VIE1lehcRpMj/
 uLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bpaBEkCKEdHgW1h3duZgowAHWMVwm/wa+XAmGoyCFHI=;
 b=DAkh+yuN6iGeUAwuZjJg+kUxBhcPMN9exFBZUMpwMTHKc6DMBtM5J1Ja8hlQZi2aqw
 QvFdDR5+c3dmguaoKLQQ7wSHTNC1erG+ZRAyOlHTnqKNnTOgGB6IBAaZQvhiNWwYUtYq
 nhpCbkJSKMWP0v4ZGSLGVYOIhKVcq5K7Vhla1ifcbeJQMW1jqiR9EBIZaE8G7mRVeGvb
 vnt1NRoNM3eB3wC7w1c/ifA2XtgpUeI1irI8YYhTeJp6i3n5gu13e8hGpE3xB5J/sa+C
 iorXg6kgqMgelg48hZCCRYmlenGfBvSqLvmfyRUxX+hGImPAPX3hyMBbhhEWIEAxsXgt
 pL4g==
X-Gm-Message-State: AOAM532F6OtxeHi/lqGWE0xRbNIEXFhARUGNEH2aa2K5catJhAKvH7l1
 3Ta7V/Gt1dgmgurR/g7J9nOEi0aGepIs66T+M4dpDw==
X-Google-Smtp-Source: ABdhPJxBGruW0CFPMXPkH6jCYQnUWGpwTUjThVpylwpIL+AcMQOGFSV+GJvuRANsp1Q7nkVoV1fQ8L8DYU8vKQJ5bkc=
X-Received: by 2002:a65:4b81:: with SMTP id t1mr3343357pgq.263.1605296534160; 
 Fri, 13 Nov 2020 11:42:14 -0800 (PST)
MIME-Version: 1.0
References: <202011131146.g8dPLQDD-lkp@intel.com>
 <CAFP8O3LpSmxVnjHfQAN455k1ZRg3PbgZYhWr030evCq1T10k=Q@mail.gmail.com>
 <20201113190824.GA1477315@ubuntu-m3-large-x86>
In-Reply-To: <20201113190824.GA1477315@ubuntu-m3-large-x86>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 13 Nov 2020 11:42:03 -0800
Message-ID: <CAKwvOdkEtTQhDRFRV_d66FyhQBe536vRbOW=fQjesiHz3dfeBA@mail.gmail.com>
Subject: Re: Error: invalid switch -me200
To: Nathan Chancellor <natechancellor@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>
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

+ MPE, PPC

On Fri, Nov 13, 2020 at 11:08 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Fri, Nov 13, 2020 at 09:28:03AM -0800, F=C4=81ng-ru=C3=AC S=C3=B2ng wr=
ote:
> > On Thu, Nov 12, 2020 at 7:22 PM kernel test robot <lkp@intel.com> wrote=
:
> > >
> > > Hi Fangrui,
> > >
> > > FYI, the error/warning still remains.
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git master
> > > head:   585e5b17b92dead8a3aca4e3c9876fbca5f7e0ba
> > > commit: ca9b31f6bb9c6aa9b4e5f0792f39a97bbffb8c51 Makefile: Fix GCC_TO=
OLCHAIN_DIR prefix for Clang cross compilation
> > > date:   4 months ago
> > > config: powerpc-randconfig-r031-20201113 (attached as .config)

^ randconfig

> > > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project =
9e0c35655b6e8186baef8840b26ba4090503b554)
> > > reproduce (this is a W=3D1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master=
/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # install powerpc cross compiling tool for clang build
> > >         # apt-get install binutils-powerpc-linux-gnu
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git/commit/?id=3Dca9b31f6bb9c6aa9b4e5f0792f39a97bbffb8c51
> > >         git remote add linus https://git.kernel.org/pub/scm/linux/ker=
nel/git/torvalds/linux.git
> > >         git fetch --no-tags linus master
> > >         git checkout ca9b31f6bb9c6aa9b4e5f0792f39a97bbffb8c51
> > >         # save the attached .config to linux build tree
> > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cros=
s ARCH=3Dpowerpc
> > >
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    Assembler messages:
> > > >> Error: invalid switch -me200
> > > >> Error: unrecognized option -me200
> > >    clang-12: error: assembler command failed with exit code 1 (use -v=
 to see invocation)
> > >    make[2]: *** [scripts/Makefile.build:281: scripts/mod/empty.o] Err=
or 1
> > >    make[2]: Target '__build' not remade because of errors.
> > >    make[1]: *** [Makefile:1174: prepare0] Error 2
> > >    make[1]: Target 'prepare' not remade because of errors.
> > >    make: *** [Makefile:185: __sub-make] Error 2
> > >    make: Target 'prepare' not remade because of errors.
> > >
> > > ---
> > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> >
> > This can be ignored. The LLVM integrated assembler does not recognize
> > -me200 (-Wa,-me200 in arch/powerpc/Makefile). I guess the GNU as -m
> > option is similar to .arch or .machine and controls what instructions
> > are recognized. The integrated assembler tends to support all
> > instructions (conditional supporting some instructions has some
> > challenges; in the end I have patched parsing but ignoring `.arch` for
> > x86-64 and ignoring `.machine ppc64` for ppc64)
> >
> > (In addition, e200 is a 32-bit Power ISA microprocessor. 32-bit
> > support may get less attention in LLVM.)
>
> This is also not a clang specific issue, I see the exact same error
> with GCC 10.2.0 and binutils 2.35.
>
> $ make -skj64 ARCH=3Dpowerpc CROSS_COMPILE=3Dpowerpc64-linux- olddefconfi=
g vmlinux

Does using a non 64b triple produce the same failure?

> ...
> Error: invalid switch -me200
> Error: unrecognized option -me200

There's a block in  arch/powerpc/Makefile:
248 cpu-as-$(CONFIG_40x)    +=3D -Wa,-m405
249 cpu-as-$(CONFIG_44x)    +=3D -Wa,-m440
250 cpu-as-$(CONFIG_ALTIVEC)  +=3D $(call
as-option,-Wa$(comma)-maltivec)
251 cpu-as-$(CONFIG_E200)   +=3D -Wa,-me200
252 cpu-as-$(CONFIG_E500)   +=3D -Wa,-me500

Are those all broken configs, or is Kconfig messed up such that
randconfig can select these when it should not?
--=20
Thanks,
~Nick Desaulniers
