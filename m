Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF8038021A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 04:44:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhCXG1cwCz30DB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 12:43:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=gx32ilFS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.81;
 helo=conssluserg-02.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=gx32ilFS; 
 dkim-atps=neutral
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhCWk1Fbzz2yWn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 12:43:29 +1000 (AEST)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 14E2h9RI021492
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 11:43:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 14E2h9RI021492
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1620960190;
 bh=DVvuxt/F2VXaZ9qg0AYDMtDw08pty3tYij5WhoLhi5g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gx32ilFSrPZOgzKEh5xfrqGmgbxdNAIPFWkBvj1cuFTQS0hKYB4pL3oi435qEe/1I
 UhGKdRVSVyb3mXfThkMhVFzSk569aA4Bm/XoXz7FtG6xkqWaED61hCWeqD55Ua9pWF
 AQpuOnvEZxN+CGg8mYx12xD9mn7wcY/ChHectxviA+7hO/b9NvtFcxMuLjqbr7Aov2
 jvnPLRpw+eqKFKO2DCDfscdpcwN6Z0K5jiHi/VaXdqTExzSp+oWmVgNUhbGqLETOqQ
 GHib2SkqhGVt7dfmBPX4V+WfJ/sB7FQRBZKC3XQmSNMmyRKZsaMVoDhjapwUDMD5Pf
 +h3nd8CyVq+ng==
X-Nifty-SrcIP: [209.85.210.171]
Received: by mail-pf1-f171.google.com with SMTP id c13so10152663pfv.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 19:43:10 -0700 (PDT)
X-Gm-Message-State: AOAM531DeIwMUw0EMuooJ/v3RUck92lyQG6QZBgsryx2oZM/r9QljTbZ
 +yaaO9XcqKduo5ib8ZBv7SNVU/WIYV4GDUIrL+8=
X-Google-Smtp-Source: ABdhPJy2EFGXTFKIbKsAyZs1aA07L2XBS7/FxM/3wJurmOPRxbPOvFj6xQvW0zDnkWlWzt7Zj51wS6cEB9fpZZfYJ5Y=
X-Received: by 2002:a63:a547:: with SMTP id r7mr44000108pgu.7.1620960189536;
 Thu, 13 May 2021 19:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210513115904.519912-1-aik@ozlabs.ru>
 <dedc7262-2956-37b2-ebfd-ae8eb9b56716@kernel.org>
In-Reply-To: <dedc7262-2956-37b2-ebfd-ae8eb9b56716@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 14 May 2021 11:42:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNASFhRE=1EBj9AoTMMEd2YJdu7bCxARAGJfZ7aXcBrMAUw@mail.gmail.com>
Message-ID: <CAK7LNASFhRE=1EBj9AoTMMEd2YJdu7bCxARAGJfZ7aXcBrMAUw@mail.gmail.com>
Subject: Re: [PATCH kernel v3] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
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
Cc: Michal Marek <michal.lkml@markovi.net>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 14, 2021 at 3:59 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On 5/13/2021 4:59 AM, Alexey Kardashevskiy wrote:
> > The $(CPP) (do only preprocessing) macro is already defined in Makefile.
> > However POWERPC redefines it and adds $(KBUILD_CFLAGS) which results
> > in flags duplication. Which is not a big deal by itself except for
> > the flags which depend on other flags and the compiler checks them
> > as it parses the command line.
> >
> > Specifically, scripts/Makefile.build:304 generates ksyms for .S files.
> > If clang+llvm+sanitizer are enabled, this results in
> >
> > -emit-llvm-bc -fno-lto -flto -fvisibility=hidden \
> >   -fsanitize=cfi-mfcall -fno-lto  ...
> >
> > in the clang command line and triggers error:

I do not know how to reproduce this for powerpc.
Currently, only x86 and arm64 select
ARCH_SUPPORTS_LTO_CLANG.

Is this a fix for a potential issue?


> > clang-13: error: invalid argument '-fsanitize=cfi-mfcall' only allowed with '-flto'
> >
> > This removes unnecessary CPP redefinition. Which works fine as in most
> > place KBUILD_CFLAGS is passed to $CPP except
> > arch/powerpc/kernel/vdso64/vdso(32|64).lds. To fix vdso, this does:
> > 1. add -m(big|little)-endian to $CPP
> > 2. add target to $KBUILD_CPPFLAGS as otherwise clang ignores -m(big|little)-endian if
> > the building platform does not support big endian (such as x86).
> >
> > Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> > ---
> > Changes:
> > v3:
> > * moved vdso cleanup in a separate patch
> > * only add target to KBUILD_CPPFLAGS for CLANG
> >
> > v2:
> > * fix KBUILD_CPPFLAGS
> > * add CLANG_FLAGS to CPPFLAGS
> > ---
> >   Makefile              | 1 +
> >   arch/powerpc/Makefile | 3 ++-
> >   2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 15b6476d0f89..5b545bef7653 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -576,6 +576,7 @@ CC_VERSION_TEXT = $(subst $(pound),,$(shell $(CC) --version 2>/dev/null | head -
> >   ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
> >   ifneq ($(CROSS_COMPILE),)
> >   CLANG_FLAGS += --target=$(notdir $(CROSS_COMPILE:%-=%))
> > +KBUILD_CPPFLAGS      += --target=$(notdir $(CROSS_COMPILE:%-=%))
>
> You can avoid the duplication here by just doing:
>
> KBUILD_CPPFLAGS += $(CLANG_FLAGS)
>
> I am still not super happy about the flag duplication but I am not sure
> I can think of a better solution. If KBUILD_CPPFLAGS are always included
> when building .o files, maybe we should just add $(CLANG_FLAGS) to
> KBUILD_CPPFLAGS instead of KBUILD_CFLAGS?

Hmm, I think including --target=* in CPP flags is sensible,
but not all CLANG_FLAGS are CPP flags.
At least, -(no)-integrated-as is not a CPP flag.

We could introduce a separate CLANG_CPP_FLAGS, but
it would require more code changes...

So, I do not have a strong opinion either way.



BTW, another approach might be to modify the linker script.


In my best guess, the reason why powerpc adding the endian flag to CPP
is this line in arch/powerpc/kernel/vdso64/vdso64.lds.S

#ifdef __LITTLE_ENDIAN__
OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
#else
OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc", "elf64-powerpc")
#endif


You can use the CONFIG option to check the endian-ness.

#ifdef CONFIG_CPU_BIG_ENDIAN
OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc", "elf64-powerpc")
#else
OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
#endif


All the big endian arches define CONFIG_CPU_BIG_ENDIAN.
(but not all little endian arches define CONFIG_CPU_LITTLE_ENDIAN)


So,
#ifdef CONFIG_CPU_BIG_ENDIAN
   < big endian code >
#else
  < little endian code >
#endif

works for all architectures.


Only the exception is you cannot replace the one in uapi headers.
  arch/powerpc/include/uapi/asm/byteorder.h: #ifdef __LITTLE_ENDIAN__
since it is exported to userspace, where CONFIG options are not available.



BTW, various flags are historically used.

 -  CONFIG_CPU_BIG_ENDIAN   /  CONFIG_CPU_LITTLE_ENDIAN
 -  __BIG_ENDIAN   / __LITTLE_ENDIAN
 -  __LITTLE_ENDIAN__     (powerpc only)



__LITTLE_ENDIAN__  is defined by powerpc gcc and clang.

My experiments...


[1] powerpc-linux-gnu-gcc    -> __BIG_ENDIAN__ is defined

masahiro@grover:~$ echo | powerpc-linux-gnu-gcc -E  -dM -x c - | grep ENDIAN
#define __ORDER_LITTLE_ENDIAN__ 1234
#define __BIG_ENDIAN__ 1
#define __FLOAT_WORD_ORDER__ __ORDER_BIG_ENDIAN__
#define __ORDER_PDP_ENDIAN__ 3412
#define _BIG_ENDIAN 1
#define __BYTE_ORDER__ __ORDER_BIG_ENDIAN__
#define __VEC_ELEMENT_REG_ORDER__ __ORDER_BIG_ENDIAN__
#define __ORDER_BIG_ENDIAN__ 4321


[2] powerpc-linux-gnu-gcc + -mlittle-endian    -> __LITTLE_ENDIAN__ is defined

masahiro@grover:~$ echo | powerpc-linux-gnu-gcc  -E  -dM   -x c -
-mlittle-endian  | grep ENDIAN
#define __ORDER_LITTLE_ENDIAN__ 1234
#define _LITTLE_ENDIAN 1
#define __FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__
#define __ORDER_PDP_ENDIAN__ 3412
#define __LITTLE_ENDIAN__ 1
#define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
#define __VEC_ELEMENT_REG_ORDER__ __ORDER_LITTLE_ENDIAN__
#define __ORDER_BIG_ENDIAN__ 4321


[3] other arch gcc    -> neither of them is defined

masahiro@grover:~$ echo | gcc -E  -dM   -x c -  | grep ENDIAN
#define __ORDER_LITTLE_ENDIAN__ 1234
#define __FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__
#define __ORDER_PDP_ENDIAN__ 3412
#define __ORDER_BIG_ENDIAN__ 4321
#define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__

masahiro@grover:~$ echo | arm-linux-gnueabihf-gcc   -E  -dM   -x c -
-mlittle-endian  | grep ENDIAN
#define __ORDER_LITTLE_ENDIAN__ 1234
#define __FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__
#define __ORDER_PDP_ENDIAN__ 3412
#define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
#define __ORDER_BIG_ENDIAN__ 4321

masahiro@grover:~$ echo | arm-linux-gnueabihf-gcc   -E  -dM   -x c -
-mbig-endian  | grep ENDIAN
#define __ORDER_LITTLE_ENDIAN__ 1234
#define __FLOAT_WORD_ORDER__ __ORDER_BIG_ENDIAN__
#define __ORDER_PDP_ENDIAN__ 3412
#define __ARM_BIG_ENDIAN 1
#define __BYTE_ORDER__ __ORDER_BIG_ENDIAN__
#define __ORDER_BIG_ENDIAN__ 4321


[4] Clang  --target=powerpc-linux-gnu      -> __BIG_ENDIAN__ is defined

masahiro@grover:~$ echo |  ~/tools/clang-latest/bin/clang -E
--target=powerpc-linux-gnu -dM -x c -    | grep ENDIAN
#define _BIG_ENDIAN 1
#define __BIG_ENDIAN__ 1
#define __BYTE_ORDER__ __ORDER_BIG_ENDIAN__
#define __ORDER_BIG_ENDIAN__ 4321
#define __ORDER_LITTLE_ENDIAN__ 1234
#define __ORDER_PDP_ENDIAN__ 3412



[5] very recent Clang understands --target=powerpcle-linux-gnu     -->
__LITTLE_ENDIAN__ is defined

masahiro@grover:~$ echo |  ~/tools/clang-latest/bin/clang -E
--target=powerpcle-linux-gnu -dM -x c -   | grep ENDIAN
#define _LITTLE_ENDIAN 1
#define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
#define __LITTLE_ENDIAN__ 1
#define __ORDER_BIG_ENDIAN__ 4321
#define __ORDER_LITTLE_ENDIAN__ 1234
#define __ORDER_PDP_ENDIAN__ 3412


[6] very recent Clang, --target=powerpc-linux-gnu  + -mlittle-endian
 --> __LITTLE_ENDIAN__ is defined

masahiro@grover:~$ echo |  ~/tools/clang-latest/bin/clang -E
--target=powerpc-linux-gnu -dM -x c -  -mlittle-endian  | grep ENDIAN
#define _LITTLE_ENDIAN 1
#define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
#define __LITTLE_ENDIAN__ 1
#define __ORDER_BIG_ENDIAN__ 4321
#define __ORDER_LITTLE_ENDIAN__ 1234
#define __ORDER_PDP_ENDIAN__ 3412




[7] Clang, target with little endian only ,   -mbig-endian is ignored
masahiro@grover:~$ echo |  clang -E   -dM -x c -    | grep ENDIAN
#define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
#define __LITTLE_ENDIAN__ 1
#define __ORDER_BIG_ENDIAN__ 4321
#define __ORDER_LITTLE_ENDIAN__ 1234
#define __ORDER_PDP_ENDIAN__ 3412
masahiro@grover:~$ echo |  clang -E   -dM -x c -  -mbig-endian  | grep ENDIAN
#define __BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__
#define __LITTLE_ENDIAN__ 1
#define __ORDER_BIG_ENDIAN__ 4321
#define __ORDER_LITTLE_ENDIAN__ 1234
#define __ORDER_PDP_ENDIAN__ 3412


--
Best Regards
Masahiro Yamada
