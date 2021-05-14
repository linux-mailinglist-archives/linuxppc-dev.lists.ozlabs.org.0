Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DADB5380292
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 05:41:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhDpr64TWz307F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 13:41:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=XRV57b2A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=XRV57b2A; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhDpJ23hmz2yXH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 13:41:08 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id 10so23870336pfl.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 20:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=a/zMUy57MWnxHZLesj+6X4PZo6CPB1vuMRE2rbZo+5A=;
 b=XRV57b2AsHu0dZ8yE2Cidzy75LqwPAWKoYG6ZELCjo2dRYviTpKt5JbSwz/jhA0RxL
 4DWmUWW0aYUgae3zarSLwMkNQisvZGI3tRo5PcnS63y1eKRsjm97jw/PypVPTlh7hS+N
 pyRVAxIzgVG8yJy6/TigwN/+JHfYY19bvHOusaNOyb0hmyF8+f6T0O8TzUkMydjI4EcL
 ijScsUcKaeoKdIidRCRPZ5CR8xccMaUd2x2YDUn2md17wQR/odG+WEwSt4yMUoHb+JOq
 PZpBsqpswweVfkRKsspjj86EEmfnTTijBs19SDqC/Bf/YcX6vGK/Kza9kJCuuaeZlpvm
 eknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a/zMUy57MWnxHZLesj+6X4PZo6CPB1vuMRE2rbZo+5A=;
 b=BetYOfgF0x5jX175svCfZOZ7fhfsSc0P41ocAz/9in4QtdUEyWsSyK2QehfaXGX9MF
 zzehI+8cdXEMlYhAMNGam45Tcb+JjeUCdQC4giWCgNqYNY0RMjjhJXXD1eQ69BcXDlFy
 mtG1PHHfKJYR0FLYzrqGE4IPvN5F44kXWEHVqjw9fDjmMKav8C3vboa6illhKHSVLgg3
 Bh+K/ZhSA+GvkUQTgc1aecy5iOQrDcFLGT2ire0KlJZXBSa5IsKRdOIsP8IKRHHhUdNv
 byKpCouJzAi8oTIon63pyIAmQb4cAz+BHP+amdaX8wL5SM81rqpOt/kJdaAEw+NAF7yD
 gTHA==
X-Gm-Message-State: AOAM5315GKTjwdTJV3f6kYJH+v2I701cgsU018GHnJkTQOXh+PtY0YrW
 vBlZ7dmp+xqVsPS5PYsP8HtxRQ==
X-Google-Smtp-Source: ABdhPJxAOMNZVGx8c+mU1b0ZbU88IzZx3Qogfbi6w8heI97iq6ocj6IYcw1Qs9fUFGCjOO6nws3Deg==
X-Received: by 2002:a62:1c0c:0:b029:2b7:6dd2:adb3 with SMTP id
 c12-20020a621c0c0000b02902b76dd2adb3mr28081537pfc.44.1620963667012; 
 Thu, 13 May 2021 20:41:07 -0700 (PDT)
Received: from localhost
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id dw18sm8506655pjb.36.2021.05.13.20.41.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 20:41:06 -0700 (PDT)
Message-ID: <193e9c74-fcd6-e232-327d-f803a017af76@ozlabs.ru>
Date: Fri, 14 May 2021 13:41:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH kernel v3] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>
References: <20210513115904.519912-1-aik@ozlabs.ru>
 <dedc7262-2956-37b2-ebfd-ae8eb9b56716@kernel.org>
 <CAK7LNASFhRE=1EBj9AoTMMEd2YJdu7bCxARAGJfZ7aXcBrMAUw@mail.gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <CAK7LNASFhRE=1EBj9AoTMMEd2YJdu7bCxARAGJfZ7aXcBrMAUw@mail.gmail.com>
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
Cc: Michal Marek <michal.lkml@markovi.net>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 14/05/2021 12:42, Masahiro Yamada wrote:
> On Fri, May 14, 2021 at 3:59 AM Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> On 5/13/2021 4:59 AM, Alexey Kardashevskiy wrote:
>>> The $(CPP) (do only preprocessing) macro is already defined in Makefile.
>>> However POWERPC redefines it and adds $(KBUILD_CFLAGS) which results
>>> in flags duplication. Which is not a big deal by itself except for
>>> the flags which depend on other flags and the compiler checks them
>>> as it parses the command line.
>>>
>>> Specifically, scripts/Makefile.build:304 generates ksyms for .S files.
>>> If clang+llvm+sanitizer are enabled, this results in
>>>
>>> -emit-llvm-bc -fno-lto -flto -fvisibility=hidden \
>>>    -fsanitize=cfi-mfcall -fno-lto  ...
>>>
>>> in the clang command line and triggers error:
> 
> I do not know how to reproduce this for powerpc.
> Currently, only x86 and arm64 select
> ARCH_SUPPORTS_LTO_CLANG.
> 
> Is this a fix for a potential issue?

Yeah, it is work in progress to enable LTO_CLANG for PPC64:

https://github.com/aik/linux/commits/lto




> 
> 
>>> clang-13: error: invalid argument '-fsanitize=cfi-mfcall' only allowed with '-flto'
>>>
>>> This removes unnecessary CPP redefinition. Which works fine as in most
>>> place KBUILD_CFLAGS is passed to $CPP except
>>> arch/powerpc/kernel/vdso64/vdso(32|64).lds. To fix vdso, this does:
>>> 1. add -m(big|little)-endian to $CPP
>>> 2. add target to $KBUILD_CPPFLAGS as otherwise clang ignores -m(big|little)-endian if
>>> the building platform does not support big endian (such as x86).
>>>
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> ---
>>> Changes:
>>> v3:
>>> * moved vdso cleanup in a separate patch
>>> * only add target to KBUILD_CPPFLAGS for CLANG
>>>
>>> v2:
>>> * fix KBUILD_CPPFLAGS
>>> * add CLANG_FLAGS to CPPFLAGS
>>> ---
>>>    Makefile              | 1 +
>>>    arch/powerpc/Makefile | 3 ++-
>>>    2 files changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index 15b6476d0f89..5b545bef7653 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -576,6 +576,7 @@ CC_VERSION_TEXT = $(subst $(pound),,$(shell $(CC) --version 2>/dev/null | head -
>>>    ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
>>>    ifneq ($(CROSS_COMPILE),)
>>>    CLANG_FLAGS += --target=$(notdir $(CROSS_COMPILE:%-=%))
>>> +KBUILD_CPPFLAGS      += --target=$(notdir $(CROSS_COMPILE:%-=%))
>>
>> You can avoid the duplication here by just doing:
>>
>> KBUILD_CPPFLAGS += $(CLANG_FLAGS)
>>
>> I am still not super happy about the flag duplication but I am not sure
>> I can think of a better solution. If KBUILD_CPPFLAGS are always included
>> when building .o files, maybe we should just add $(CLANG_FLAGS) to
>> KBUILD_CPPFLAGS instead of KBUILD_CFLAGS?
> 
> Hmm, I think including --target=* in CPP flags is sensible,
> but not all CLANG_FLAGS are CPP flags.
> At least, -(no)-integrated-as is not a CPP flag.
> 
> We could introduce a separate CLANG_CPP_FLAGS, but
> it would require more code changes...
> 
> So, I do not have a strong opinion either way.
> 
> 
> 
> BTW, another approach might be to modify the linker script.
> 
> 
> In my best guess, the reason why powerpc adding the endian flag to CPP
> is this line in arch/powerpc/kernel/vdso64/vdso64.lds.S
> 
> #ifdef __LITTLE_ENDIAN__
> OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
> #else
> OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc", "elf64-powerpc")
> #endif
> 
> 
> You can use the CONFIG option to check the endian-ness.
> 
> #ifdef CONFIG_CPU_BIG_ENDIAN
> OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc", "elf64-powerpc")
> #else
> OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
> #endif
> 
> 
> All the big endian arches define CONFIG_CPU_BIG_ENDIAN.
> (but not all little endian arches define CONFIG_CPU_LITTLE_ENDIAN)


This should work with .lds. But missing --target=* might still hit us 
somewhere else later, these include 3 header files each and there might 
be endianness dependent stuff.


> 
> 
> So,
> #ifdef CONFIG_CPU_BIG_ENDIAN
>     < big endian code >
> #else
>    < little endian code >
> #endif
> 
> works for all architectures.
> 
> 
> Only the exception is you cannot replace the one in uapi headers.
>    arch/powerpc/include/uapi/asm/byteorder.h: #ifdef __LITTLE_ENDIAN__
> since it is exported to userspace, where CONFIG options are not available.
> 
> 
> 
> BTW, various flags are historically used.
> 
>   -  CONFIG_CPU_BIG_ENDIAN   /  CONFIG_CPU_LITTLE_ENDIAN
>   -  __BIG_ENDIAN   / __LITTLE_ENDIAN
>   -  __LITTLE_ENDIAN__     (powerpc only)
> 
> 
> 
> __LITTLE_ENDIAN__  is defined by powerpc gcc and clang.
> 
> My experiments...
> 
> 
> [1] powerpc-linux-gnu-gcc    -> __BIG_ENDIAN__ is defined
> 
> masahiro@grover:~$ echo | powerpc-linux-gnu-gcc -E  -dM -x c - | grep ENDIAN
> #define __ORDER_LITTLE_ENDIAN__ 1234
> #define __BIG_ENDIAN__ 1
> #define __FLOAT_WORD_ORDER__ __ORDER_BIG_ENDIAN__
> #define __ORDER_PDP_ENDIAN__ 3412
> #define _BIG_ENDIAN 1
> #define __BYTE_ORDER__ __ORDER_BIG_ENDIAN__
> #define __VEC_ELEMENT_REG_ORDER__ __ORDER_BIG_ENDIAN__
> #define __ORDER_BIG_ENDIAN__ 4321
> 
> 
> [2] powerpc-linux-gnu-gcc + -mlittle-endian    -> __LITTLE_ENDIAN__ is defined
> 
> masahiro@grover:~$ echo | powerpc-linux-gnu-gcc  -E  -dM   -x c -
> -mlittle-endian  | grep ENDIAN
> #define __ORDER_LITTLE_ENDIAN__ 1234
> #define _LITTLE_ENDIAN 1
> #define __FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__
> #define __ORDER_PDP_ENDIAN__ 3412
> #define __LITTLE_ENDIAN__ 1
> #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
> #define __VEC_ELEMENT_REG_ORDER__ __ORDER_LITTLE_ENDIAN__
> #define __ORDER_BIG_ENDIAN__ 4321
> 
> 
> [3] other arch gcc    -> neither of them is defined
> 
> masahiro@grover:~$ echo | gcc -E  -dM   -x c -  | grep ENDIAN
> #define __ORDER_LITTLE_ENDIAN__ 1234
> #define __FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__
> #define __ORDER_PDP_ENDIAN__ 3412
> #define __ORDER_BIG_ENDIAN__ 4321
> #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
> 
> masahiro@grover:~$ echo | arm-linux-gnueabihf-gcc   -E  -dM   -x c -
> -mlittle-endian  | grep ENDIAN
> #define __ORDER_LITTLE_ENDIAN__ 1234
> #define __FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__
> #define __ORDER_PDP_ENDIAN__ 3412
> #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
> #define __ORDER_BIG_ENDIAN__ 4321
> 
> masahiro@grover:~$ echo | arm-linux-gnueabihf-gcc   -E  -dM   -x c -
> -mbig-endian  | grep ENDIAN
> #define __ORDER_LITTLE_ENDIAN__ 1234
> #define __FLOAT_WORD_ORDER__ __ORDER_BIG_ENDIAN__
> #define __ORDER_PDP_ENDIAN__ 3412
> #define __ARM_BIG_ENDIAN 1
> #define __BYTE_ORDER__ __ORDER_BIG_ENDIAN__
> #define __ORDER_BIG_ENDIAN__ 4321
> 
> 
> [4] Clang  --target=powerpc-linux-gnu      -> __BIG_ENDIAN__ is defined
> 
> masahiro@grover:~$ echo |  ~/tools/clang-latest/bin/clang -E
> --target=powerpc-linux-gnu -dM -x c -    | grep ENDIAN
> #define _BIG_ENDIAN 1
> #define __BIG_ENDIAN__ 1
> #define __BYTE_ORDER__ __ORDER_BIG_ENDIAN__
> #define __ORDER_BIG_ENDIAN__ 4321
> #define __ORDER_LITTLE_ENDIAN__ 1234
> #define __ORDER_PDP_ENDIAN__ 3412
> 
> 
> 
> [5] very recent Clang understands --target=powerpcle-linux-gnu     -->
> __LITTLE_ENDIAN__ is defined
> 
> masahiro@grover:~$ echo |  ~/tools/clang-latest/bin/clang -E
> --target=powerpcle-linux-gnu -dM -x c -   | grep ENDIAN
> #define _LITTLE_ENDIAN 1
> #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
> #define __LITTLE_ENDIAN__ 1
> #define __ORDER_BIG_ENDIAN__ 4321
> #define __ORDER_LITTLE_ENDIAN__ 1234
> #define __ORDER_PDP_ENDIAN__ 3412
> 
> 
> [6] very recent Clang, --target=powerpc-linux-gnu  + -mlittle-endian
>   --> __LITTLE_ENDIAN__ is defined
> 
> masahiro@grover:~$ echo |  ~/tools/clang-latest/bin/clang -E
> --target=powerpc-linux-gnu -dM -x c -  -mlittle-endian  | grep ENDIAN
> #define _LITTLE_ENDIAN 1
> #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
> #define __LITTLE_ENDIAN__ 1
> #define __ORDER_BIG_ENDIAN__ 4321
> #define __ORDER_LITTLE_ENDIAN__ 1234
> #define __ORDER_PDP_ENDIAN__ 3412
> 
> 
> 
> 
> [7] Clang, target with little endian only ,   -mbig-endian is ignored
> masahiro@grover:~$ echo |  clang -E   -dM -x c -    | grep ENDIAN
> #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
> #define __LITTLE_ENDIAN__ 1
> #define __ORDER_BIG_ENDIAN__ 4321
> #define __ORDER_LITTLE_ENDIAN__ 1234
> #define __ORDER_PDP_ENDIAN__ 3412
> masahiro@grover:~$ echo |  clang -E   -dM -x c -  -mbig-endian  | grep ENDIAN
> #define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
> #define __LITTLE_ENDIAN__ 1
> #define __ORDER_BIG_ENDIAN__ 4321
> #define __ORDER_LITTLE_ENDIAN__ 1234
> #define __ORDER_PDP_ENDIAN__ 3412



Nice research :) Thanks,

> 
> 
> --
> Best Regards
> Masahiro Yamada
> 

-- 
Alexey
