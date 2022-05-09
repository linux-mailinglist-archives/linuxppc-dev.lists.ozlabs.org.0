Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD66051F589
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 09:43:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxY8351sYz3cFp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 17:43:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=KZ5PzAAB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=KZ5PzAAB; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxY7N3TK5z2yMK
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 17:43:09 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id n18so13094993plg.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 May 2022 00:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=ehuXX1FBMkXSxSIO1nrsalxMQ5cS613ljbe6bhV7rSM=;
 b=KZ5PzAABnM7rZuNaEf3eccRR5cnr2G94ZV1XwtYplLCKyR7Q59KUGxguJ34iH486OD
 HEDUAM2ilO8WK9tEaa1ANMzauRzjKj0RbCNHtZ0SYoraprpNC2WD3MtEQzQtQYHeVt4m
 rMwT1Xue9YNWdTLjZQvLgNkFguieLN4YXPTP2v3BcKltwIAO9LlDInW7XG93PR4zzILt
 CaM3xTwlATa+Kn9xRkIa6l8+V7BugxU0TdpJUetZsBK8+g1TKI6xOcmhu6+5agvM4he3
 Kemu/c/+dpU1Rouv4Fp1Mg3Db9qmgMWsE0LkgjZyx9ukdGGN7uDy2pVFuoR7H5aBX5xw
 MtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=ehuXX1FBMkXSxSIO1nrsalxMQ5cS613ljbe6bhV7rSM=;
 b=3JnO6p57QblpNkWh9Y7ITLdPsvjTtGOvCg97XHPNnuvrKe0pg4kb+Nqf9/NWnUZEjU
 WS/7QzSozPu8nFEwlQJibOuywN3icZVRP9MGUBNVHEv8CTOrvV98iuEL9c3pD/mG+GKb
 4JQGLfOelm0aR6RgmUiit16pV6JOtw/i35//VwE0XDk7PqOWiqh1d5Wn6Yfb0UUwloJv
 1D6NBpIAZ2Sw598mlYne7IKbkL8skSyOp5+0AqKWzMSHANhHxOaX4GSEywU0nLWOzRr1
 D/ZRMiH3gplzPvacUtaNP03OCulfv614SjhpBH/MRBNBC8QPsYAIoXg8OGYQczxF8Xpy
 J7aw==
X-Gm-Message-State: AOAM532nPM4qofAmaFck2STcAClqH2vOw0FBQ3ZQI8zkxJC3mTi6Wujr
 fmneiWcSVSkqMcjPPBzHHJNISA==
X-Google-Smtp-Source: ABdhPJwMgzoh3Y2fXnk2/wstyuVnsZF2oNgkzIUibycLookoAo0VhhE5CajSIyQyjfIXih4W8ze5qQ==
X-Received: by 2002:a17:90b:1d10:b0:1dc:dea8:d2ad with SMTP id
 on16-20020a17090b1d1000b001dcdea8d2admr15400232pjb.174.1652082185680; 
 Mon, 09 May 2022 00:43:05 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 c80-20020a621c53000000b0050dc7628132sm8161048pfc.12.2022.05.09.00.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 00:43:05 -0700 (PDT)
Message-ID: <de7ae055-8cbb-1fd3-e1d7-93f51c2d3f4b@ozlabs.ru>
Date: Mon, 9 May 2022 17:42:59 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [PATCH kernel] powerpc/llvm/lto: Allow LLVM LTO builds
Content-Language: en-US
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: Nick Desaulniers <ndesaulniers@google.com>
References: <20220429064547.2334280-1-aik@ozlabs.ru>
 <CAKwvOdmUMhqhQhDCpWjMNiQQPvwOJB9MbUkF3RR0BL+H+DagmA@mail.gmail.com>
 <efe4ec7b-e1ec-84fc-cc49-7e22597ff417@ozlabs.ru>
In-Reply-To: <efe4ec7b-e1ec-84fc-cc49-7e22597ff417@ozlabs.ru>
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
Cc: llvm@lists.linux.dev, Nicholas Piggin <npiggin@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Sathvika Vasireddy <sv@linux.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/9/22 15:18, Alexey Kardashevskiy wrote:
> 
> 
> On 5/4/22 07:21, Nick Desaulniers wrote:
>> On Thu, Apr 28, 2022 at 11:46 PM Alexey Kardashevskiy <aik@ozlabs.ru> 
>> wrote:
>>>
>>> This enables LTO_CLANG builds on POWER with the upstream version of
>>> LLVM.
>>>
>>> LTO optimizes the output vmlinux binary and this may affect the FTP
>>> alternative section if alt branches use "bc" (Branch Conditional) which
>>> is limited by 16 bit offsets. This shows up in errors like:
>>>
>>> ld.lld: error: InputSection too large for range extension thunk 
>>> vmlinux.o:(__ftr_alt_97+0xF0)
>>>
>>> This works around the issue by replacing "bc" in FTR_SECTION_ELSE with
>>> "b" which allows 26 bit offsets.
>>>
>>> This catches the problem instructions in vmlinux.o before it LTO'ed:
>>>
>>> $ objdump -d -M raw -j __ftr_alt_97 vmlinux.o | egrep '\S+\s*\<bc\>'
>>>    30:   00 00 82 40     bc      4,eq,30 <__ftr_alt_97+0x30>
>>>    f0:   00 00 82 40     bc      4,eq,f0 <__ftr_alt_97+0xf0>
>>>
>>> This allows LTO builds for ppc64le_defconfig plus LTO options.
>>> Note that DYNAMIC_FTRACE/FUNCTION_TRACER is not supported by LTO builds
>>> but this is not POWERPC-specific.
>>
>> $ ARCH=powerpc make LLVM=1 -j72 ppc64le_defconfig
>> $ ARCH=powerpc make LLVM=1 -j72 menuconfig
>> <disable FTRACE, enable LTO_CLANG_THIN>
>> $ ARCH=powerpc make LLVM=1 -j72
>> ...
>>    VDSO64L arch/powerpc/kernel/vdso/vdso64.so.dbg
>> /usr/bin/powerpc64le-linux-gnu-ld:
>> /android0/llvm-project/llvm/build/bin/../lib/LLVMgold.so: error
>> loading plugin:
>> /android0/llvm-project/llvm/build/bin/../lib/LLVMgold.so: cannot open
>> shared object file: No such file or directory
>> clang-15: error: linker command failed with exit code 1 (use -v to see
>> invocation)
>> make[1]: *** [arch/powerpc/kernel/vdso/Makefile:67:
>> arch/powerpc/kernel/vdso/vdso64.so.dbg] Error 1
>>
>> Looks like LLD isn't being invoked correctly to link the vdso.
>> Probably need to revisit
>> https://lore.kernel.org/lkml/20200901222523.1941988-1-ndesaulniers@google.com/
>>
>> How were you working around this issue? Perhaps you built clang to
>> default to LLD? (there's a cmake option for that)
> 
> 
> What option is that? I only add  -DLLVM_ENABLE_LLD=ON  which (I think) 
> tells cmake to use lld to link the LLVM being built but does not seem to 
> tell what the built clang should do.
> 
> Without -DLLVM_ENABLE_LLD=ON, building just fails:
> 
> [fstn1-p1 ~/pbuild/llvm/llvm-lto-latest-cleanbuild]$ ninja -j 100
> [619/3501] Linking CXX executable bin/not
> FAILED: bin/not
> : && /usr/bin/clang++ -fPIC -fvisibility-inlines-hidden 
> -Werror=date-time -Werror=unguarded-availability-new -Wall -Wextra 
> -Wno-unused-parameter -Wwrite-strings -Wcast-qual 
> -Wmissing-field-initializers -pedantic -Wno-long-long 
> -Wc++98-compat-extra-semi -Wimplicit-fallthrough 
> -Wcovered-switch-default -Wno-noexcept-type -Wnon-virtual-dtor 
> -Wdelete-non-virtual-dtor -Wsuggest-override -Wstring-conversion 
> -Wmisleading-indentation -fdiagnostics-color -ffunction-sections 
> -fdata-sections -flto -O3 -DNDEBUG -flto 
> -Wl,-rpath-link,/home/aik/pbuild/llvm/llvm-lto-latest-cleanbuild/./lib 
> -Wl,--gc-sections utils/not/CMakeFiles/not.dir/not.cpp.o -o bin/not 
> -Wl,-rpath,"\$ORIGIN/../lib"  -lpthread  lib/libLLVMSupport.a  -lrt 
> -ldl  -lpthread  -lm  /usr/lib/powerpc64le-linux-gnu/libz.so 
> /usr/lib/powerpc64le-linux-gnu/libtinfo.so  lib/libLLVMDemangle.a && :
> /usr/bin/ld: lib/libLLVMSupport.a: error adding symbols: archive has no 
> index; run ranlib to add one
> clang: error: linker command failed with exit code 1 (use -v to see 
> invocation)
> [701/3501] Building CXX object 
> utils/TableGen/CMakeFiles/llvm-tblgen.dir/GlobalISelEmitter.cpp.o
> ninja: build stopped: subcommand failed.
> 
> 
> 
> My head hurts :(
> The above example is running on PPC. Now I am trying x86 box:
> 

A bit of progress.

cmake -G Ninja -DLLVM_ENABLE_PROJECTS="clang;lld" 
-DLLVM_TARGET_ARCH=PowerPC -DLLVM_TARGETS_TO_BUILD=PowerPC 
~/llvm-project//llvm -DLLVM_ENABLE_LTO=ON 
-DLLVM_BINUTILS_INCDIR=/usr/lib/gcc/powerpc64le-linux-gnu/11/plugin/include/ 
-DCMAKE_BUILD_TYPE=Release

produces:

-- Native target architecture is PowerPC 

....
-- LLVM host triple: x86_64-unknown-linux-gnu
-- LLVM default target triple: x86_64-unknown-linux-gnu


and the resulting "clang" can only to "Target: 
x86_64-unknown-linux-gnu", how do you build LLVM exactly? Thanks,


