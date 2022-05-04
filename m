Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F185197E6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 09:12:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtShG6wDWz3bgQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 17:12:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=BbmFkAbU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=BbmFkAbU; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtSgX21m9z2xCB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 17:11:49 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id z16so474330pfh.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 May 2022 00:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=52Ofjcc0wakVR7XsYhREwkaBOLIZ5tcP8RWAoexv5a8=;
 b=BbmFkAbU/EHznY10Yg44fH8Na5TMQzvAcX6Brnn7nJmxn/qWJaH9IKjRD4vrdSdu44
 obmj9j1ShPn8jhSRYTBSEE6Wfm4kgL4K6Uaxd22BLDOVrnRUOVgmbzdsuhVi0Br+NMIi
 BvXrfHu/GU3W1GRQbEgIMBEVsSFAKiw31duI+piU7uKb9N9tIaQjBAI/xnJWHh/R1Z5J
 XBDr+3DAX2p9hw9xi9F7arJ2s/GqUCAqfiAxdw5gOQUZZadjSw9f1aOcOy4oYcpS6beH
 TZ73azXsfLtFhry17RYUuX61Y9tCRH0ylF0EbNyb0+tn0uiJ38OWm9+Q5ZgUEQEIqm6t
 zfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=52Ofjcc0wakVR7XsYhREwkaBOLIZ5tcP8RWAoexv5a8=;
 b=2Kopc/xMye9h+0fKLAnp0onuz5/FZmjAtHoxAUg/9QTObTvdN1REu8vwN6ZOM4cZXt
 rVTBoBzIptO5pvr4hUSB8h3QuWimJWD+9bB/vKQT0EvolEg+oqHzRoE/B+ScOgzZ/t04
 SFc2qWfhZsXkayzfEq0fyKvisDKZVptZ5IE5K0hmU5PzXn/wYzPeHrwN0l3KACCTbF85
 u6QfiPIZYjfthJv1u/m5tltPISY4DClZrv8VxPvcWgN2dnXmrFOhAcvemoPo6qu7Qkf+
 B1b48HRqdkHfPQTvPzD4H+ZQPmK2fq+vzFkM4acllTL448HA+CnwVxic+CuyHXs9pOae
 X+/g==
X-Gm-Message-State: AOAM532AOA2h0/GMsBokrBtwL7mfG7xKST0tehj/fmeGda5XLnRGyrwl
 u3BJPRJqhj6XaFMKjnKW6IdQrA==
X-Google-Smtp-Source: ABdhPJwWxy/aMf3pnDbi+ni4M1fRwbvKXbt/my2mj97f0S9HdB09RGkQOWXNEOxkWS+D9xaiBGmplA==
X-Received: by 2002:aa7:962e:0:b0:50d:5ed8:aa23 with SMTP id
 r14-20020aa7962e000000b0050d5ed8aa23mr19419109pfg.43.1651648304936; 
 Wed, 04 May 2022 00:11:44 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 e9-20020a635449000000b003c14af505edsm11471085pgm.5.2022.05.04.00.11.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 00:11:43 -0700 (PDT)
Message-ID: <5cb86579-5e75-ac46-8f76-fac9ac405c47@ozlabs.ru>
Date: Wed, 4 May 2022 17:11:37 +1000
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


I was not.

Just did clean build like this:

mkdir ~/pbuild/llvm/llvm-lto-latest-cleanbuild

cd ~/pbuild/llvm/llvm-lto-latest-cleanbuild

CC='clang' CXX='clang++' cmake -G Ninja 
-DLLVM_ENABLE_PROJECTS="clang;lld" -DLLVM_TARGETS_TO_BUILD=PowerPC 
~/p/llvm/llvm-latest/llvm/ -DLLVM_ENABLE_LTO=ON   -DLLVM_ENABLE_LLD=ON 
-DLLVM_BINUTILS_INCDIR=/usr/include -DCMAKE_BUILD_TYPE=Release

ninja -j 50

It builds fine:

[fstn1-p1 ~/p/kernels-llvm/llvm]$ find 
/home/aik/pbuild/llvm/llvm-lto-latest-cleanbuild/ -iname LLVMgold.so 
-exec ls -l {} \;
-rwxrwxr-x 1 aik aik 39032840 May  4 13:06 
/home/aik/pbuild/llvm/llvm-lto-latest-cleanbuild/lib/LLVMgold.so 





and then in the kernel tree:


PATH=/home/aik/pbuild/llvm/llvm-lto-latest-cleanbuild/bin:$PATH make 
-j64 
O=/home/aik/pbuild/kernels-llvm/llvm-wip-llvm-latest-lto-full-cleanbuild/ 
ARCH=powerpc LLVM_IAS=1 CC=clang LLVM=1 ppc64le_defconfig

then enabled LTO in that .config and then just built "vmlinux":


[fstn1-p1 ~/p/kernels-llvm/llvm]$ ls -l 
/home/aik/pbuild/kernels-llvm/llvm-wip-llvm-latest-lto-full-cleanbuild/vmlinux 

-rwxrwxr-x 1 aik aik 48145272 May  4 17:00 
/home/aik/pbuild/kernels-llvm/llvm-wip-llvm-latest-lto-full-cleanbuild/vmlinux

which boots under qemu, the kernel version is:

Preparing to boot Linux version 5.18.0-rc2_0bb153baeff0_a+fstn1 
(aik@fstn1-p1) (clang version 15.0.0 (https://github.com/llvm/llvm-proje
ct.git e29dc0c6fde284e7f05aa5f45b05c629c9fad295), LLD 15.0.0) #1 SMP Wed 
May 4 16:54:16 AEST 2022



Before I got to this point, I did many unspeakable things to that build 
system so may be it is screwed in some way but I cannot pinpoint it.

The installed clang/lld is 12.0.0-3ubuntu1~21.04.2 and 
-DLLVM_ENABLE_LLD=ON from cmake is to accelerate rebuilding of LLVM (for 
bisecting). I'll try without it now, just takes ages to complete.

> 
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


I have posted v2:

https://lore.kernel.org/lkml/20220429053329.2278740-1-aik@ozlabs.ru/T/

with this one, the ppc64 defconfigs should just work.


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
