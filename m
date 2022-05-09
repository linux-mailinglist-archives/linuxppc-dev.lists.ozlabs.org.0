Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A2751F3CF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 07:19:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxTxg1nQWz3bck
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 15:19:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=x8qZjRdV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=x8qZjRdV; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxTww5qytz3bd7
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 15:18:53 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id x18so12822162plg.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 08 May 2022 22:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FpdopNqycTM/NQMtaLIl/1EvbcMzeqebZRSc8bi3hp0=;
 b=x8qZjRdVQ6t6kGvy3MRf+A2wz8AoD3TpyUyw2PAiH4ugLANg4jW1cdlvxsw9Z+vg+l
 QVYKoIgsaVfjt7QLsAA0Os/3BoXHj2Aqh+o/c143/60gu6w8eZFj4fxTZTM69UqKmSd+
 XZOV8krYRcx0YXabj2ArLbzbQnQtjku6tAaLzxdNwRYILq3oIYVaQqJK0OjkSpQCDbt9
 vof1waimJS4+kRDwarmyUHQkhzcqovLGe1gJ9MGajhxDhUAbTc3FNLVz8cfoUY2YdOG9
 kDyoiDqjYmGAcLAcwCITKbT2+Vf5DkNju9wb/fmeaaQ51M4GHNTLr2dkjLkcnZbxp+ay
 Hk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FpdopNqycTM/NQMtaLIl/1EvbcMzeqebZRSc8bi3hp0=;
 b=sJ+mESvXnthhXC/3ngpl8xChFx+Rl3VbFjnoyUiRbhCN2LM8F+6+Qlovf5SxifIMvd
 fPVtAcK17NY25u1HhYcZ3FkhjjN/4O+mDv/cfrJYX3MEugfESfm38pZunidikxHd0rpi
 8mgniHgNo+lexJwlaPbpWfRvoWtPgqdD4G9qp3aLvuAchnrZNVoJeBlrsP5Sa0i2Es2D
 48xWWo/vB6hYgG+xo51FG+BgNv5CiXVBdAPSF38H3fklw7Ts3eqtu+vY7uPEC6ikiTQt
 LCdci5pSMvnhFUOQ/mwKR75S2RLtSc38b6ie8ZCGzGqq54zh4IhVcVb1G1iS+jZ2eMQZ
 lZmg==
X-Gm-Message-State: AOAM532eRytLKILrJTyVyf2T7G/rtAV4HeRMNPfNDPvBv2ekG6tbuteh
 LbK2BbZ89IBegJbyyTl+41W9Yw==
X-Google-Smtp-Source: ABdhPJxdd9enQhRC8sNzPkBnBo6oN9jm4F3sumNgHaQDEyfZcKunVjiA4LNgORmBD7sikBcr3GtemQ==
X-Received: by 2002:a17:902:ea0e:b0:15e:c0e4:cf15 with SMTP id
 s14-20020a170902ea0e00b0015ec0e4cf15mr14791167plg.63.1652073530615; 
 Sun, 08 May 2022 22:18:50 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 f29-20020aa79d9d000000b0050dc7628180sm7799675pfq.90.2022.05.08.22.18.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 May 2022 22:18:50 -0700 (PDT)
Message-ID: <efe4ec7b-e1ec-84fc-cc49-7e22597ff417@ozlabs.ru>
Date: Mon, 9 May 2022 15:18:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [PATCH kernel] powerpc/llvm/lto: Allow LLVM LTO builds
Content-Language: en-US
To: Nick Desaulniers <ndesaulniers@google.com>
References: <20220429064547.2334280-1-aik@ozlabs.ru>
 <CAKwvOdmUMhqhQhDCpWjMNiQQPvwOJB9MbUkF3RR0BL+H+DagmA@mail.gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <CAKwvOdmUMhqhQhDCpWjMNiQQPvwOJB9MbUkF3RR0BL+H+DagmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: llvm@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/4/22 07:21, Nick Desaulniers wrote:
> On Thu, Apr 28, 2022 at 11:46 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>
>> This enables LTO_CLANG builds on POWER with the upstream version of
>> LLVM.
>>
>> LTO optimizes the output vmlinux binary and this may affect the FTP
>> alternative section if alt branches use "bc" (Branch Conditional) which
>> is limited by 16 bit offsets. This shows up in errors like:
>>
>> ld.lld: error: InputSection too large for range extension thunk vmlinux.o:(__ftr_alt_97+0xF0)
>>
>> This works around the issue by replacing "bc" in FTR_SECTION_ELSE with
>> "b" which allows 26 bit offsets.
>>
>> This catches the problem instructions in vmlinux.o before it LTO'ed:
>>
>> $ objdump -d -M raw -j __ftr_alt_97 vmlinux.o | egrep '\S+\s*\<bc\>'
>>    30:   00 00 82 40     bc      4,eq,30 <__ftr_alt_97+0x30>
>>    f0:   00 00 82 40     bc      4,eq,f0 <__ftr_alt_97+0xf0>
>>
>> This allows LTO builds for ppc64le_defconfig plus LTO options.
>> Note that DYNAMIC_FTRACE/FUNCTION_TRACER is not supported by LTO builds
>> but this is not POWERPC-specific.
> 
> $ ARCH=powerpc make LLVM=1 -j72 ppc64le_defconfig
> $ ARCH=powerpc make LLVM=1 -j72 menuconfig
> <disable FTRACE, enable LTO_CLANG_THIN>
> $ ARCH=powerpc make LLVM=1 -j72
> ...
>    VDSO64L arch/powerpc/kernel/vdso/vdso64.so.dbg
> /usr/bin/powerpc64le-linux-gnu-ld:
> /android0/llvm-project/llvm/build/bin/../lib/LLVMgold.so: error
> loading plugin:
> /android0/llvm-project/llvm/build/bin/../lib/LLVMgold.so: cannot open
> shared object file: No such file or directory
> clang-15: error: linker command failed with exit code 1 (use -v to see
> invocation)
> make[1]: *** [arch/powerpc/kernel/vdso/Makefile:67:
> arch/powerpc/kernel/vdso/vdso64.so.dbg] Error 1
> 
> Looks like LLD isn't being invoked correctly to link the vdso.
> Probably need to revisit
> https://lore.kernel.org/lkml/20200901222523.1941988-1-ndesaulniers@google.com/
> 
> How were you working around this issue? Perhaps you built clang to
> default to LLD? (there's a cmake option for that)


What option is that? I only add  -DLLVM_ENABLE_LLD=ON  which (I think) 
tells cmake to use lld to link the LLVM being built but does not seem to 
tell what the built clang should do.

Without -DLLVM_ENABLE_LLD=ON, building just fails:

[fstn1-p1 ~/pbuild/llvm/llvm-lto-latest-cleanbuild]$ ninja -j 100
[619/3501] Linking CXX executable bin/not
FAILED: bin/not
: && /usr/bin/clang++ -fPIC -fvisibility-inlines-hidden 
-Werror=date-time -Werror=unguarded-availability-new -Wall -Wextra 
-Wno-unused-parameter -Wwrite-strings -Wcast-qual 
-Wmissing-field-initializers -pedantic -Wno-long-long 
-Wc++98-compat-extra-semi -Wimplicit-fallthrough 
-Wcovered-switch-default -Wno-noexcept-type -Wnon-virtual-dtor 
-Wdelete-non-virtual-dtor -Wsuggest-override -Wstring-conversion 
-Wmisleading-indentation -fdiagnostics-color -ffunction-sections 
-fdata-sections -flto -O3 -DNDEBUG -flto 
-Wl,-rpath-link,/home/aik/pbuild/llvm/llvm-lto-latest-cleanbuild/./lib 
-Wl,--gc-sections utils/not/CMakeFiles/not.dir/not.cpp.o -o bin/not 
-Wl,-rpath,"\$ORIGIN/../lib"  -lpthread  lib/libLLVMSupport.a  -lrt 
-ldl  -lpthread  -lm  /usr/lib/powerpc64le-linux-gnu/libz.so 
/usr/lib/powerpc64le-linux-gnu/libtinfo.so  lib/libLLVMDemangle.a && :
/usr/bin/ld: lib/libLLVMSupport.a: error adding symbols: archive has no 
index; run ranlib to add one
clang: error: linker command failed with exit code 1 (use -v to see 
invocation)
[701/3501] Building CXX object 
utils/TableGen/CMakeFiles/llvm-tblgen.dir/GlobalISelEmitter.cpp.o
ninja: build stopped: subcommand failed.



My head hurts :(
The above example is running on PPC. Now I am trying x86 box:


[2693/3505] Linking CXX shared library lib/libLTO.so.15git
FAILED: lib/libLTO.so.15git
: && /usr/bin/clang++ -fPIC -fPIC -fvisibility-inlines-hidden 
-Werror=date-time -Werror=unguarded-availability-new -Wall -Wextra 
-Wno-unused-parameter -Wwrite-strings -Wcast-qual 
-Wmissing-field-initializers -pedantic -Wno-long-long 
-Wc++98-compat-extra-semi -Wimplicit-fallthrough 
-Wcovered-switch-default -Wno-noexcept-type -Wnon-virtual-dtor 
-Wdelete-non-virtual-dtor -Wsuggest-override -Wstring-conversion 
-Wmisleading-indentation -fdiagnostics-color -ffunction-sections 
-fdata-sections -flto -O3 -DNDEBUG  -Wl,-z,defs -Wl,-z,nodelete 
-fuse-ld=ld -flto   -Wl,-rpath-link,/home/aik/llvm-build/./lib 
-Wl,--gc-sections 
-Wl,--version-script,"/home/aik/llvm-build/tools/lto/LTO.exports" 
-shared -Wl,-soname,libLTO.so.15git -o lib/libLTO.so.15git 
tools/lto/CMakeFiles/LTO.dir/LTODisassembler.cpp.o 
tools/lto/CMakeFiles/LTO.dir/lto.cpp.o  -Wl,-rpath,"\$ORIGIN/../lib" 
lib/libLLVMPowerPCAsmParser.a  lib/libLLVMPowerPCCodeGen.a 
lib/libLLVMPowerPCDesc.a  lib/libLLVMPowerPCDisassembler.a 
lib/libLLVMPowerPCInfo.a  lib/libLLVMBitReader.a  lib/libLLVMCore.a 
lib/libLLVMCodeGen.a  lib/libLLVMLTO.a  lib/libLLVMMC.a 
lib/libLLVMMCDisassembler.a  lib/libLLVMSupport.a  lib/libLLVMTarget.a 
lib/libLLVMAsmPrinter.a  lib/libLLVMGlobalISel.a 
lib/libLLVMSelectionDAG.a  lib/libLLVMCodeGen.a  lib/libLLVMExtensions.a 
  lib/libLLVMPasses.a  lib/libLLVMTarget.a  lib/libLLVMObjCARCOpts.a 
lib/libLLVMCoroutines.a  lib/libLLVMipo.a  lib/libLLVMBitWriter.a 
lib/libLLVMInstrumentation.a  lib/libLLVMLinker.a 
lib/libLLVMFrontendOpenMP.a  lib/libLLVMScalarOpts.a 
lib/libLLVMAggressiveInstCombine.a  lib/libLLVMInstCombine.a 
lib/libLLVMIRReader.a  lib/libLLVMAsmParser.a  lib/libLLVMVectorize.a 
lib/libLLVMTransformUtils.a  lib/libLLVMAnalysis.a 
lib/libLLVMProfileData.a  lib/libLLVMSymbolize.a 
lib/libLLVMDebugInfoDWARF.a  lib/libLLVMDebugInfoPDB.a 
lib/libLLVMDebugInfoMSF.a  lib/libLLVMObject.a  lib/libLLVMBitReader.a 
lib/libLLVMCore.a  lib/libLLVMRemarks.a  lib/libLLVMBitstreamReader.a 
lib/libLLVMMCParser.a  lib/libLLVMMC.a  lib/libLLVMDebugInfoCodeView.a 
lib/libLLVMTextAPI.a  lib/libLLVMBinaryFormat.a  lib/libLLVMSupport.a 
-lrt  -ldl  -lm  /usr/lib64/libz.so  /usr/lib64/libtinfo.so 
lib/libLLVMDemangle.a && :
/usr/bin/ld: lib/libLLVMObject.a: error adding symbols: file format not 
recognized
clang-13: error: linker command failed with exit code 1 (use -v to see 
invocation)


Why is this?

cmake is invoked as:

CC='clang' CXX='clang++' cmake -G Ninja 
-DLLVM_ENABLE_PROJECTS="clang;lld" -DLLVM_TARGETS_TO_BUILD=PowerPC 
~/llvm-project//llvm -DLLVM_ENABLE_LTO=ON   -DLLVM_USE_LINKER=ld 
-DLLVM_BINUTILS_INCDIR=/usr/lib/gcc/powerpc64le-linux-gnu/11/plugin/include/ 
-DCMAKE_BUILD_TYPE=Release



> Perhaps for now I should just send:
> ```
> diff --git a/arch/powerpc/kernel/vdso/Makefile
> b/arch/powerpc/kernel/vdso/Makefile
> index 954974287ee7..8762e6513683 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -55,6 +55,11 @@ AS32FLAGS := -D__VDSO32__ -s
>   CC64FLAGS := -Wl,-soname=linux-vdso64.so.1
>   AS64FLAGS := -D__VDSO64__ -s
> 
> +ifneq ($(LLVM),)
> +CC32FLAGS += -fuse-ld=lld
> +CC64FLAGS += -fuse-ld=lld
> +endif
> +


Can LLVM_IAS=1 still work with bfd's LD? Thanks,



>   targets += vdso32.lds
>   CPPFLAGS_vdso32.lds += -P -C -Upowerpc
>   targets += vdso64.lds
> ```
> 
> 
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>
>> Note 1:
>> This is further development of
>> https://lore.kernel.org/all/20220211023125.1790960-1-aik@ozlabs.ru/T/
>>
>> Note 2:
>> CONFIG_ZSTD_COMPRESS and CONFIG_ZSTD_DECOMPRESS must be both "m" or "y"
>> or it won't link. For details:
>> https://lore.kernel.org/lkml/20220428043850.1706973-1-aik@ozlabs.ru/T/
> 
> Yeah, I just hit this:
> ```
>    LTO     vmlinux.o
> LLVM ERROR: Function Import: link error: linking module flags 'Code
> Model': IDs have conflicting values in
> 'lib/built-in.a(entropy_common.o at 5782)' and
> 'lib/built-in.a(zstd_decompress_block.o at 6202)'
> PLEASE submit a bug report to
> https://github.com/llvm/llvm-project/issues/ and include the crash
> backtrace.
> LLVM ERROR: Failed to rename temporary file
> .thinlto-cache/Thin-96f93f.tmp.o to
> .thinlto-cache/llvmcache-A5B351EA452D46A86980E29C78B7260673348AAF: No
> such file or directory
> scripts/link-vmlinux.sh: line 76: 1240312 Aborted
> ${LD} ${KBUILD_LDFLAGS} -r -o ${1} ${lds} ${objects}
> make: *** [Makefile:1158: vmlinux] Error 134
> ```
> These two configs aren't easily modified in menuconfig. Perhaps you
> could find the concise set of configs that need to be disabled for
> this to be buildable? At least so others can test more easily, or even
> so we can update Kconfig checks.
> 
>> ---
>>   arch/powerpc/Kconfig                   | 2 ++
>>   arch/powerpc/kernel/exceptions-64s.S   | 4 +++-
>>   arch/powerpc/lib/copyuser_64.S         | 3 ++-
>>   arch/powerpc/lib/feature-fixups-test.S | 3 +--
>>   arch/powerpc/lib/memcpy_64.S           | 3 ++-
>>   5 files changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 174edabb74fa..e2c7b5c1d0a6 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -158,6 +158,8 @@ config PPC
>>          select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
>>          select ARCH_WANT_LD_ORPHAN_WARN
>>          select ARCH_WEAK_RELEASE_ACQUIRE
>> +       select ARCH_SUPPORTS_LTO_CLANG
>> +       select ARCH_SUPPORTS_LTO_CLANG_THIN
>>          select BINFMT_ELF
>>          select BUILDTIME_TABLE_SORT
>>          select CLONE_BACKWARDS
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
>> index b66dd6f775a4..5b783bd51260 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -476,9 +476,11 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
>>                  .if IHSRR_IF_HVMODE
>>                  BEGIN_FTR_SECTION
>>                  bne     masked_Hinterrupt
>> +               b       4f
>>                  FTR_SECTION_ELSE
>> -               bne     masked_interrupt
>>                  ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
>> +               bne     masked_interrupt
>> +4:
>>                  .elseif IHSRR
>>                  bne     masked_Hinterrupt
>>                  .else
>> diff --git a/arch/powerpc/lib/copyuser_64.S b/arch/powerpc/lib/copyuser_64.S
>> index db8719a14846..d07f95eebc65 100644
>> --- a/arch/powerpc/lib/copyuser_64.S
>> +++ b/arch/powerpc/lib/copyuser_64.S
>> @@ -75,10 +75,11 @@ _GLOBAL(__copy_tofrom_user_base)
>>    * set is Power6.
>>    */
>>   test_feature = (SELFTEST_CASE == 1)
>> +       beq     .Ldst_aligned
>>   BEGIN_FTR_SECTION
>>          nop
>>   FTR_SECTION_ELSE
>> -       bne     .Ldst_unaligned
>> +       b       .Ldst_unaligned
>>   ALT_FTR_SECTION_END(CPU_FTR_UNALIGNED_LD_STD | CPU_FTR_CP_USE_DCBTZ, \
>>                      CPU_FTR_UNALIGNED_LD_STD)
>>   .Ldst_aligned:
>> diff --git a/arch/powerpc/lib/feature-fixups-test.S b/arch/powerpc/lib/feature-fixups-test.S
>> index 480172fbd024..2751e42a9fd7 100644
>> --- a/arch/powerpc/lib/feature-fixups-test.S
>> +++ b/arch/powerpc/lib/feature-fixups-test.S
>> @@ -145,7 +145,6 @@ BEGIN_FTR_SECTION
>>   FTR_SECTION_ELSE
>>   2:     or      2,2,2
>>          PPC_LCMPI       r3,1
>> -       beq     3f
>>          blt     2b
>>          b       3f
>>          b       1b
>> @@ -160,10 +159,10 @@ globl(ftr_fixup_test6_expected)
>>   1:     or      1,1,1
>>   2:     or      2,2,2
>>          PPC_LCMPI       r3,1
>> -       beq     3f
>>          blt     2b
>>          b       3f
>>          b       1b
>> +       nop
>>   3:     or      1,1,1
>>          or      2,2,2
>>          or      3,3,3
>> diff --git a/arch/powerpc/lib/memcpy_64.S b/arch/powerpc/lib/memcpy_64.S
>> index 016c91e958d8..286c7e2d0883 100644
>> --- a/arch/powerpc/lib/memcpy_64.S
>> +++ b/arch/powerpc/lib/memcpy_64.S
>> @@ -50,10 +50,11 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_VMX_COPY)
>>      At the time of writing the only CPU that has this combination of bits
>>      set is Power6. */
>>   test_feature = (SELFTEST_CASE == 1)
>> +       beq      .ldst_aligned
>>   BEGIN_FTR_SECTION
>>          nop
>>   FTR_SECTION_ELSE
>> -       bne     .Ldst_unaligned
>> +       b       .Ldst_unaligned
>>   ALT_FTR_SECTION_END(CPU_FTR_UNALIGNED_LD_STD | CPU_FTR_CP_USE_DCBTZ, \
>>                       CPU_FTR_UNALIGNED_LD_STD)
>>   .Ldst_aligned:
>> --
>> 2.30.2
>>
> 
> 
