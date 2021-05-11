Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2958137AF3B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 21:18:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfnlQ16Qmz30BM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 05:18:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DlAB3HoT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DlAB3HoT; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ffnky023kz2yX2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 05:18:17 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2272611F1;
 Tue, 11 May 2021 19:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620760694;
 bh=OEnC+hTQkqd18So/wAQnB6c5Bc/i2RbUX1zbz1arhhM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DlAB3HoTjseavUnS2iWpqzVp7iI+FGpuo3z1Iw8dvfHiwc3qsbyzTpNcoRNuMpfyc
 NHUxSdQ9vUjtlHZwhJ74sM9NSMbXeQ9jI+2whGuHcSvGYE/cDUzNaqh5uII7qgRpOY
 kFDksDPmWamkc/cld+/dGFj5KK2HAWrIy7D+fjV8WZediM6CH72zje/QeWtwpMh18K
 ZD5t7qgYp+dSi2NlfgjFh7mUcgHWi59oP7nAn25w35U762ymMGZqxiQrTzt2HoMGG7
 6pUj629YTT7Tjsd2TY36wBoOzQjhqCThTkUrO0+IH8YdLJoceeCv8aRLYixKSODBhV
 TijhJavRzV9eA==
Subject: Re: [PATCH kernel v2] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20210511044812.267965-1-aik@ozlabs.ru>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <3579aa0d-0470-9a6b-e35b-48f997a5b48b@kernel.org>
Date: Tue, 11 May 2021 12:18:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210511044812.267965-1-aik@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, clang-built-linux@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/10/2021 9:48 PM, Alexey Kardashevskiy wrote:
> The $(CPP) (do only preprocessing) macro is already defined in Makefile.
> However POWERPC redefines it and adds $(KBUILD_CFLAGS) which results
> in flags duplication. Which is not a big deal by itself except for
> the flags which depend on other flags and the compiler checks them
> as it parses the command line.
> 
> Specifically, scripts/Makefile.build:304 generates ksyms for .S files.
> If clang+llvm+sanitizer are enabled, this results in
> 
> -emit-llvm-bc -fno-lto -flto -fvisibility=hidden \
>   -fsanitize=cfi-mfcall -fno-lto  ...
> 
> in the clang command line and triggers error:
> 
> clang-13: error: invalid argument '-fsanitize=cfi-mfcall' only allowed with '-flto'
> 
> This removes unnecessary CPP redefinition. Which works fine as in most
> place KBUILD_CFLAGS is passed to $CPP except
> arch/powerpc/kernel/vdso64/vdso(32|64).lds (and probably some others,
> not yet detected). To fix vdso, we do:
> 1. explicitly add -m(big|little)-endian to $CPP
> 2. (for clang) add $CLANG_FLAGS to $KBUILD_CPPFLAGS as otherwise clang
> silently ignores -m(big|little)-endian if the building platform does not
> support big endian (such as x86) so --prefix= is required.
> 
> While at this, remove some duplication from CPPFLAGS_vdso(32|64)
> as cmd_cpp_lds_S has them anyway. It still puzzles me why we need -C
> (preserve comments in the preprocessor output) flag here.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> Changes:
> v2:
> * fix KBUILD_CPPFLAGS
> * add CLANG_FLAGS to CPPFLAGS
> ---
>   Makefile                            | 1 +
>   arch/powerpc/Makefile               | 3 ++-
>   arch/powerpc/kernel/vdso32/Makefile | 2 +-
>   arch/powerpc/kernel/vdso64/Makefile | 2 +-
>   4 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 72af8e423f11..13acd2183d55 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -591,6 +591,7 @@ CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
>   endif
>   CLANG_FLAGS	+= -Werror=unknown-warning-option
>   KBUILD_CFLAGS	+= $(CLANG_FLAGS)
> +KBUILD_CPPFLAGS	+= $(CLANG_FLAGS)

This is going to cause flag duplication, which would be nice to avoid. I 
do not know if we can get away with just adding $(CLANG_FLAGS) to 
KBUILD_CPPFLAGS instead of KBUILD_CFLAGS though. It seems like this 
assignment might be better in arch/powerpc/Makefile with the 
KBUILD_CPPFLAGS additions there.

Cheers,
Nathan

>   KBUILD_AFLAGS	+= $(CLANG_FLAGS)
>   export CLANG_FLAGS
>   endif
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 3212d076ac6a..306bfd2797ad 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -76,6 +76,7 @@ endif
>   
>   ifdef CONFIG_CPU_LITTLE_ENDIAN
>   KBUILD_CFLAGS	+= -mlittle-endian
> +KBUILD_CPPFLAGS	+= -mlittle-endian
>   KBUILD_LDFLAGS	+= -EL
>   LDEMULATION	:= lppc
>   GNUTARGET	:= powerpcle
> @@ -83,6 +84,7 @@ MULTIPLEWORD	:= -mno-multiple
>   KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-save-toc-indirect)
>   else
>   KBUILD_CFLAGS += $(call cc-option,-mbig-endian)
> +KBUILD_CPPFLAGS += $(call cc-option,-mbig-endian)
>   KBUILD_LDFLAGS	+= -EB
>   LDEMULATION	:= ppc
>   GNUTARGET	:= powerpc
> @@ -208,7 +210,6 @@ KBUILD_CPPFLAGS	+= -I $(srctree)/arch/$(ARCH) $(asinstr)
>   KBUILD_AFLAGS	+= $(AFLAGS-y)
>   KBUILD_CFLAGS	+= $(call cc-option,-msoft-float)
>   KBUILD_CFLAGS	+= -pipe $(CFLAGS-y)
> -CPP		= $(CC) -E $(KBUILD_CFLAGS)
>   
>   CHECKFLAGS	+= -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
>   ifdef CONFIG_CPU_BIG_ENDIAN
> diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
> index 7d9a6fee0e3d..ea001c6df1fa 100644
> --- a/arch/powerpc/kernel/vdso32/Makefile
> +++ b/arch/powerpc/kernel/vdso32/Makefile
> @@ -44,7 +44,7 @@ asflags-y := -D__VDSO32__ -s
>   
>   obj-y += vdso32_wrapper.o
>   targets += vdso32.lds
> -CPPFLAGS_vdso32.lds += -P -C -Upowerpc
> +CPPFLAGS_vdso32.lds += -C
>   
>   # link rule for the .so file, .lds has to be first
>   $(obj)/vdso32.so.dbg: $(src)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday.o FORCE
> diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
> index 2813e3f98db6..07eadba48c7a 100644
> --- a/arch/powerpc/kernel/vdso64/Makefile
> +++ b/arch/powerpc/kernel/vdso64/Makefile
> @@ -30,7 +30,7 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
>   asflags-y := -D__VDSO64__ -s
>   
>   targets += vdso64.lds
> -CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
> +CPPFLAGS_vdso64.lds += -C
>   
>   # link rule for the .so file, .lds has to be first
>   $(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday.o FORCE
> 

