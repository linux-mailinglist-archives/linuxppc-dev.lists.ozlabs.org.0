Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D90520430
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 20:08:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxq104HNMz3bxt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 04:08:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KbBGapqD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KbBGapqD; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxq0K646Cz3bdM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 04:08:01 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 32057B818CE;
 Mon,  9 May 2022 18:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2152EC385B4;
 Mon,  9 May 2022 18:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652119677;
 bh=t4ulkhvvJThK+h/J6wRFecKJVV/0w1b9o8X/UpAJe/U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KbBGapqDA4HGix0wOzG9kyYkvGvTzQzCXCelIETh4uX5dyhHabxQ33ipDKM1YfwAv
 1ciOds3Ii/wTjZkPS3LS70SFPsIHWZdll/nkc+Av6oB3vZpNxt118Sqvcah2EXfHkk
 ziszZSCqZNFDq7RWIopeaw9ChhasSZLU9bsDkUcxaYrUBQ9gc7bdtQkRg+eMpM2gcQ
 sPV4gv+uFMEXqEDyYE6pgUWwnCdIWeClf/T0E/Zz1+tkX3Lctg8sRclEu+0NT3NTIz
 4rpxq7MG9Fb+mzE478SgmWgXKCUJaCxYdnTZjplp2Tv7Td3M125MzgAh/3rONJe04b
 +t8dcm1/b/QAQ==
Date: Mon, 9 May 2022 11:07:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/llvm/lto: Allow LLVM LTO builds
Message-ID: <YnlYemdzBDCobK/d@dev-arch.thelio-3990X>
References: <20220429064547.2334280-1-aik@ozlabs.ru>
 <CAKwvOdmUMhqhQhDCpWjMNiQQPvwOJB9MbUkF3RR0BL+H+DagmA@mail.gmail.com>
 <efe4ec7b-e1ec-84fc-cc49-7e22597ff417@ozlabs.ru>
 <de7ae055-8cbb-1fd3-e1d7-93f51c2d3f4b@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de7ae055-8cbb-1fd3-e1d7-93f51c2d3f4b@ozlabs.ru>
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
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Nicholas Piggin <npiggin@gmail.com>, Sathvika Vasireddy <sv@linux.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Alexey,

On Mon, May 09, 2022 at 05:42:59PM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 5/9/22 15:18, Alexey Kardashevskiy wrote:
> > 
> > 
> > On 5/4/22 07:21, Nick Desaulniers wrote:
> > > On Thu, Apr 28, 2022 at 11:46 PM Alexey Kardashevskiy
> > > <aik@ozlabs.ru> wrote:
> > > > 
> > > > This enables LTO_CLANG builds on POWER with the upstream version of
> > > > LLVM.
> > > > 
> > > > LTO optimizes the output vmlinux binary and this may affect the FTP
> > > > alternative section if alt branches use "bc" (Branch Conditional) which
> > > > is limited by 16 bit offsets. This shows up in errors like:
> > > > 
> > > > ld.lld: error: InputSection too large for range extension thunk
> > > > vmlinux.o:(__ftr_alt_97+0xF0)
> > > > 
> > > > This works around the issue by replacing "bc" in FTR_SECTION_ELSE with
> > > > "b" which allows 26 bit offsets.
> > > > 
> > > > This catches the problem instructions in vmlinux.o before it LTO'ed:
> > > > 
> > > > $ objdump -d -M raw -j __ftr_alt_97 vmlinux.o | egrep '\S+\s*\<bc\>'
> > > >    30:   00 00 82 40     bc      4,eq,30 <__ftr_alt_97+0x30>
> > > >    f0:   00 00 82 40     bc      4,eq,f0 <__ftr_alt_97+0xf0>
> > > > 
> > > > This allows LTO builds for ppc64le_defconfig plus LTO options.
> > > > Note that DYNAMIC_FTRACE/FUNCTION_TRACER is not supported by LTO builds
> > > > but this is not POWERPC-specific.
> > > 
> > > $ ARCH=powerpc make LLVM=1 -j72 ppc64le_defconfig
> > > $ ARCH=powerpc make LLVM=1 -j72 menuconfig
> > > <disable FTRACE, enable LTO_CLANG_THIN>
> > > $ ARCH=powerpc make LLVM=1 -j72
> > > ...
> > >    VDSO64L arch/powerpc/kernel/vdso/vdso64.so.dbg
> > > /usr/bin/powerpc64le-linux-gnu-ld:
> > > /android0/llvm-project/llvm/build/bin/../lib/LLVMgold.so: error
> > > loading plugin:
> > > /android0/llvm-project/llvm/build/bin/../lib/LLVMgold.so: cannot open
> > > shared object file: No such file or directory
> > > clang-15: error: linker command failed with exit code 1 (use -v to see
> > > invocation)
> > > make[1]: *** [arch/powerpc/kernel/vdso/Makefile:67:
> > > arch/powerpc/kernel/vdso/vdso64.so.dbg] Error 1
> > > 
> > > Looks like LLD isn't being invoked correctly to link the vdso.
> > > Probably need to revisit
> > > https://lore.kernel.org/lkml/20200901222523.1941988-1-ndesaulniers@google.com/
> > > 
> > > How were you working around this issue? Perhaps you built clang to
> > > default to LLD? (there's a cmake option for that)
> > 
> > 
> > What option is that? I only add  -DLLVM_ENABLE_LLD=ON  which (I think)

The option Nick is referring to here is CLANG_DEFAULT_LINKER, which sets
the default linker when clang is invoked as the linker driver, which the
PowerPC vDSO Makefile does. We have been trying to move all parts of the
kernel to compile with $(CC) and link with $(LD) so that the default
linker invoked by the compiler is taken out of the equation.

For what it's worth, I think that the error Nick is seeing is due to a
lack of the LLVMgold.so plugin on his system, which is built when
-DLLVM_BINUTILS_INCDIR=... is included in the list of CMake variables,
which you have. The LLVMgold.so plugin is needed when doing LTO with
GNU ld, which is the case with the vDSO currently for the reason I
mentioned above. We could work around this with Nick's proposed
'-fuse-ld=lld' patch or just disable LTO for the vDSO.

https://llvm.org/docs/GoldPlugin.html

My version of the hack would probably be:

ccflags-$(CONFIG_LD_IS_LLD) += -fuse-ld=lld
asflags-$(CONFIG_LD_IS_LLD) += -fuse-ld=lld

> > tells cmake to use lld to link the LLVM being built but does not seem to
> > tell what the built clang should do.

Right, -DLLVM_ENABLE_LLD=ON is equivalent to -DLLVM_USE_LINKER=lld,
except when doing a multi-stage build:

https://llvm.org/docs/CMake.html#llvm-related-variables

> > 
> > Without -DLLVM_ENABLE_LLD=ON, building just fails:
> > 
> > [fstn1-p1 ~/pbuild/llvm/llvm-lto-latest-cleanbuild]$ ninja -j 100
> > [619/3501] Linking CXX executable bin/not
> > FAILED: bin/not
> > : && /usr/bin/clang++ -fPIC -fvisibility-inlines-hidden
> > -Werror=date-time -Werror=unguarded-availability-new -Wall -Wextra
> > -Wno-unused-parameter -Wwrite-strings -Wcast-qual
> > -Wmissing-field-initializers -pedantic -Wno-long-long
> > -Wc++98-compat-extra-semi -Wimplicit-fallthrough
> > -Wcovered-switch-default -Wno-noexcept-type -Wnon-virtual-dtor
> > -Wdelete-non-virtual-dtor -Wsuggest-override -Wstring-conversion
> > -Wmisleading-indentation -fdiagnostics-color -ffunction-sections
> > -fdata-sections -flto -O3 -DNDEBUG -flto
> > -Wl,-rpath-link,/home/aik/pbuild/llvm/llvm-lto-latest-cleanbuild/./lib
> > -Wl,--gc-sections utils/not/CMakeFiles/not.dir/not.cpp.o -o bin/not
> > -Wl,-rpath,"\$ORIGIN/../lib"  -lpthread  lib/libLLVMSupport.a  -lrt
> > -ldl  -lpthread  -lm  /usr/lib/powerpc64le-linux-gnu/libz.so
> > /usr/lib/powerpc64le-linux-gnu/libtinfo.so  lib/libLLVMDemangle.a && :
> > /usr/bin/ld: lib/libLLVMSupport.a: error adding symbols: archive has no
> > index; run ranlib to add one
> > clang: error: linker command failed with exit code 1 (use -v to see
> > invocation)
> > [701/3501] Building CXX object
> > utils/TableGen/CMakeFiles/llvm-tblgen.dir/GlobalISelEmitter.cpp.o
> > ninja: build stopped: subcommand failed.
> > 
> > 
> > 
> > My head hurts :(
> > The above example is running on PPC. Now I am trying x86 box:
> > 
> 
> A bit of progress.
> 
> cmake -G Ninja -DLLVM_ENABLE_PROJECTS="clang;lld" -DLLVM_TARGET_ARCH=PowerPC
> -DLLVM_TARGETS_TO_BUILD=PowerPC ~/llvm-project//llvm -DLLVM_ENABLE_LTO=ON
> -DLLVM_BINUTILS_INCDIR=/usr/lib/gcc/powerpc64le-linux-gnu/11/plugin/include/
> -DCMAKE_BUILD_TYPE=Release
> 
> produces:
> 
> -- Native target architecture is PowerPC
> 
> ....
> -- LLVM host triple: x86_64-unknown-linux-gnu
> -- LLVM default target triple: x86_64-unknown-linux-gnu
> 
> 
> and the resulting "clang" can only to "Target: x86_64-unknown-linux-gnu",
> how do you build LLVM exactly? Thanks,

I have never tried to cross compile LLVM but you can use
LLVM_DEFAULT_TARGET_TRIPLE to change the default target triple. From
what I can tell, the way you are building LLVM on your PowerPC host is
fine.

Cheers,
Nathan
