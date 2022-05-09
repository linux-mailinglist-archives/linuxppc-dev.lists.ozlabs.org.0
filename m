Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4379052046D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 20:20:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxqH61Nxlz3brq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 04:20:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=FKw96Gs6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=FKw96Gs6; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxqGS46MMz3bgC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 04:20:14 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id w19so25268526lfu.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 May 2022 11:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QmiOXHZzB0rtLFZwWWd63/Q6COhsqprxMnxqGszSfWg=;
 b=FKw96Gs6ccmBPZpSqeb6e8R8VWl/oEHndi8e4ISoHwv/PaGTrNlLNQPNmN9eKaQgFE
 6HdwVIia48oOjKrwBYPGbN06aH6ugyLWDabmtXrs85uKeTCINyBHLcyaQjz+US0cg+/q
 3lxkOuBNJ/i0yMFEnr0hxBLgCJoWgW3OSP+LBPXYQuWlKGSBEilkzwrB28SGoPSEloMG
 sMPqW8+sVonOf8Md9YO0GkmI5tKQKS/BBkrk/Q6RWCxKu3w75UwiYYcm2F+asoY1DnCJ
 bZboAwVcWljvB7BMIjA1PziHxRvndVc8tqqean5UQ1Ljt331WNzVlBglioCZ3W9w4+3O
 lVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QmiOXHZzB0rtLFZwWWd63/Q6COhsqprxMnxqGszSfWg=;
 b=mIBYr9eLE8Uepqc+tNY5ZInI/xxErERhF/THcpKWpiNV0Iu3ogc5TbfXNCMg1+mAXP
 i9K/Hh9nea14vrxNFgaHwaf4fQE6+B8Wt06n+bXSFFc6mUDoBgaJFbMO5K9uCCHRbUyn
 KJQgOao/FzkvG6e3a7Pm0mlmYkrL8c3fqF2+DzID7npL+MdQhOxL8bgQRi7bUq1xvZdG
 0YVuTP2Mwalee7kk8ZO+Akks3HB0JapfRkYdHnVumW3mo4gd/ScLKohAclH3c6oKzuCB
 2SQ72jmnT9M0+3f59MZyko60NAJcL34P3JCw+PvYmmaPkdittRJilh1jV9Iw2U1WS4jQ
 txdQ==
X-Gm-Message-State: AOAM531aTgbGZ5Xrg8MZwnD+6QF23/5bKjxU63fXBFP86apcDmCxt4x3
 UoYuMCs5MRWVYeY1p0uqVWLLeqOpr1196HBFlvFECQ==
X-Google-Smtp-Source: ABdhPJwVc9Jh+/Mt41BKpIuxKRwJkx3HZj9u+KodRqNNFBcdlCKis9ORYHLsXID7LPy0GSv+6CEMUHGf4PfDjjHWhvI=
X-Received: by 2002:a05:6512:1d1:b0:471:f63a:b182 with SMTP id
 f17-20020a05651201d100b00471f63ab182mr13278392lfp.392.1652120406979; Mon, 09
 May 2022 11:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220429064547.2334280-1-aik@ozlabs.ru>
 <CAKwvOdmUMhqhQhDCpWjMNiQQPvwOJB9MbUkF3RR0BL+H+DagmA@mail.gmail.com>
 <efe4ec7b-e1ec-84fc-cc49-7e22597ff417@ozlabs.ru>
 <de7ae055-8cbb-1fd3-e1d7-93f51c2d3f4b@ozlabs.ru>
 <YnlYemdzBDCobK/d@dev-arch.thelio-3990X>
In-Reply-To: <YnlYemdzBDCobK/d@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 May 2022 11:19:55 -0700
Message-ID: <CAKwvOdk_wNfo1GA1MsOehTuTpBQqNi3xhHHyLmkpyTr0wPj1Tg@mail.gmail.com>
Subject: Re: [PATCH kernel] powerpc/llvm/lto: Allow LLVM LTO builds
To: Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, llvm@lists.linux.dev,
 Nicholas Piggin <npiggin@gmail.com>, Sathvika Vasireddy <sv@linux.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 9, 2022 at 11:08 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Alexey,
>
> On Mon, May 09, 2022 at 05:42:59PM +1000, Alexey Kardashevskiy wrote:
> >
> >
> > On 5/9/22 15:18, Alexey Kardashevskiy wrote:
> > >
> > >
> > > On 5/4/22 07:21, Nick Desaulniers wrote:
> > > > On Thu, Apr 28, 2022 at 11:46 PM Alexey Kardashevskiy
> > > > <aik@ozlabs.ru> wrote:
> > > > >
> > > > > This enables LTO_CLANG builds on POWER with the upstream version of
> > > > > LLVM.
> > > > >
> > > > > LTO optimizes the output vmlinux binary and this may affect the FTP
> > > > > alternative section if alt branches use "bc" (Branch Conditional) which
> > > > > is limited by 16 bit offsets. This shows up in errors like:
> > > > >
> > > > > ld.lld: error: InputSection too large for range extension thunk
> > > > > vmlinux.o:(__ftr_alt_97+0xF0)
> > > > >
> > > > > This works around the issue by replacing "bc" in FTR_SECTION_ELSE with
> > > > > "b" which allows 26 bit offsets.
> > > > >
> > > > > This catches the problem instructions in vmlinux.o before it LTO'ed:
> > > > >
> > > > > $ objdump -d -M raw -j __ftr_alt_97 vmlinux.o | egrep '\S+\s*\<bc\>'
> > > > >    30:   00 00 82 40     bc      4,eq,30 <__ftr_alt_97+0x30>
> > > > >    f0:   00 00 82 40     bc      4,eq,f0 <__ftr_alt_97+0xf0>
> > > > >
> > > > > This allows LTO builds for ppc64le_defconfig plus LTO options.
> > > > > Note that DYNAMIC_FTRACE/FUNCTION_TRACER is not supported by LTO builds
> > > > > but this is not POWERPC-specific.
> > > >
> > > > $ ARCH=powerpc make LLVM=1 -j72 ppc64le_defconfig
> > > > $ ARCH=powerpc make LLVM=1 -j72 menuconfig
> > > > <disable FTRACE, enable LTO_CLANG_THIN>
> > > > $ ARCH=powerpc make LLVM=1 -j72
> > > > ...
> > > >    VDSO64L arch/powerpc/kernel/vdso/vdso64.so.dbg
> > > > /usr/bin/powerpc64le-linux-gnu-ld:
> > > > /android0/llvm-project/llvm/build/bin/../lib/LLVMgold.so: error
> > > > loading plugin:
> > > > /android0/llvm-project/llvm/build/bin/../lib/LLVMgold.so: cannot open
> > > > shared object file: No such file or directory
> > > > clang-15: error: linker command failed with exit code 1 (use -v to see
> > > > invocation)
> > > > make[1]: *** [arch/powerpc/kernel/vdso/Makefile:67:
> > > > arch/powerpc/kernel/vdso/vdso64.so.dbg] Error 1
> > > >
> > > > Looks like LLD isn't being invoked correctly to link the vdso.
> > > > Probably need to revisit
> > > > https://lore.kernel.org/lkml/20200901222523.1941988-1-ndesaulniers@google.com/
> > > >
> > > > How were you working around this issue? Perhaps you built clang to
> > > > default to LLD? (there's a cmake option for that)
> > >
> > >
> > > What option is that? I only add  -DLLVM_ENABLE_LLD=ON  which (I think)
>
> The option Nick is referring to here is CLANG_DEFAULT_LINKER, which sets
> the default linker when clang is invoked as the linker driver, which the
> PowerPC vDSO Makefile does. We have been trying to move all parts of the
> kernel to compile with $(CC) and link with $(LD) so that the default
> linker invoked by the compiler is taken out of the equation.
>
> For what it's worth, I think that the error Nick is seeing is due to a
> lack of the LLVMgold.so plugin on his system, which is built when
> -DLLVM_BINUTILS_INCDIR=... is included in the list of CMake variables,
> which you have. The LLVMgold.so plugin is needed when doing LTO with
> GNU ld, which is the case with the vDSO currently for the reason I
> mentioned above. We could work around this with Nick's proposed
> '-fuse-ld=lld' patch or just disable LTO for the vDSO.
>
> https://llvm.org/docs/GoldPlugin.html

Ah, and ld.gold is currently banned by
commit 75959d44f9dc ("kbuild: Fail if gold linker is detected")
which landed in v5.4-rc1. So the ppc vdso build isn't quite as
hermetic as we'd like.

>
> My version of the hack would probably be:
>
> ccflags-$(CONFIG_LD_IS_LLD) += -fuse-ld=lld
> asflags-$(CONFIG_LD_IS_LLD) += -fuse-ld=lld

LGTM; want to send that as a formal patch? That would also address
https://github.com/ClangBuiltLinux/linux/issues/774.

>
> > > tells cmake to use lld to link the LLVM being built but does not seem to
> > > tell what the built clang should do.
>
> Right, -DLLVM_ENABLE_LLD=ON is equivalent to -DLLVM_USE_LINKER=lld,
> except when doing a multi-stage build:
>
> https://llvm.org/docs/CMake.html#llvm-related-variables
>
> > >
> > > Without -DLLVM_ENABLE_LLD=ON, building just fails:
> > >
> > > [fstn1-p1 ~/pbuild/llvm/llvm-lto-latest-cleanbuild]$ ninja -j 100
> > > [619/3501] Linking CXX executable bin/not
> > > FAILED: bin/not
> > > : && /usr/bin/clang++ -fPIC -fvisibility-inlines-hidden
> > > -Werror=date-time -Werror=unguarded-availability-new -Wall -Wextra
> > > -Wno-unused-parameter -Wwrite-strings -Wcast-qual
> > > -Wmissing-field-initializers -pedantic -Wno-long-long
> > > -Wc++98-compat-extra-semi -Wimplicit-fallthrough
> > > -Wcovered-switch-default -Wno-noexcept-type -Wnon-virtual-dtor
> > > -Wdelete-non-virtual-dtor -Wsuggest-override -Wstring-conversion
> > > -Wmisleading-indentation -fdiagnostics-color -ffunction-sections
> > > -fdata-sections -flto -O3 -DNDEBUG -flto
> > > -Wl,-rpath-link,/home/aik/pbuild/llvm/llvm-lto-latest-cleanbuild/./lib
> > > -Wl,--gc-sections utils/not/CMakeFiles/not.dir/not.cpp.o -o bin/not
> > > -Wl,-rpath,"\$ORIGIN/../lib"  -lpthread  lib/libLLVMSupport.a  -lrt
> > > -ldl  -lpthread  -lm  /usr/lib/powerpc64le-linux-gnu/libz.so
> > > /usr/lib/powerpc64le-linux-gnu/libtinfo.so  lib/libLLVMDemangle.a && :
> > > /usr/bin/ld: lib/libLLVMSupport.a: error adding symbols: archive has no
> > > index; run ranlib to add one

Sounds like a bug with llvm cmake on ppc hosts.

The other error about

> /usr/bin/ld: lib/libLLVMObject.a: error adding symbols: file format not
recognized

Is likely because GNU ld doesn't recognize LLVM IR, which is what's
passed to the linker when you build LLVM itself with LTO via
`-DLLVM_ENABLE_LTO=ON`.
-- 
Thanks,
~Nick Desaulniers
