Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9246F5A545D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 21:15:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGgBN4VWvz3c8X
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 05:15:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=cF+kdAvc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=cF+kdAvc;
	dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGg9m33s6z2xFx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 05:14:51 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id b26so2108140ljk.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 12:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Y8cn/Ka3pcZLBE1C037RI6dkwIa2wol9roLu1FJAIwI=;
        b=cF+kdAvc4wBcoWhrn/GOzEioVwY+NRlToBqYoVLuTvU9cB/S9BjUxM8IeKAuLlNfLs
         guxPRuRbI4aNt0dY7ubYOam97BUkWCvn2zaohD+yHmSmgxHdMlkIQhOORX/BNs0DnxSD
         FT6goqc6eE2lYQLdw9NjixEPA1a3hsprxC+cDgM3/LIwOKRzCzLyD7le4hmCakgQ0D0j
         qHgxEtdVqmW+EJ5LtmaTr2QQRTXHtWLcz71Y6QM/cGMUW+VzafNLIlTf8vArp0uYIrw/
         Qh+kh8gLNj5UZZaVLMu95sLnyFB3F9eFXiMfPbmm5m1qh3iP9z4e2IbaNsvNs8IA17HF
         Qbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Y8cn/Ka3pcZLBE1C037RI6dkwIa2wol9roLu1FJAIwI=;
        b=UU1gcf4HUnFkxFIXVpm2/ze/wi2DoqweMcGLT47tZgf4F8gXA02krTE+cT72klRhy3
         qghdfP/SECDwbQdmyZxQMcSFDr+AsOtMPvpTxqfq7QMhli8A3EhV5thGxyAvtsrRf+4E
         WS7bWvKFuXBLinm6eQoydssu4U1pHXrA60FLk4L0PwS89XoGKuOu8HJ1CsuO1NHw2MKb
         jrT55Okwepsrez2ErsGBaLAepCw1lRI58rTAeWoV7yywJ2YkkyDSDewBssO/TAXNLR4d
         SnBiLOEtm1Wbu5gwAIwnDFYqLDaN1xCdWkIY6Zu+V2HX9LmRfxxfnCsCnqUDrJQC0Y0Y
         sHwg==
X-Gm-Message-State: ACgBeo2ixxJnKvVkqFrdrzUFu92Mn4RiIKn9rzmTXiLlN/fft7m/K74S
	GbVn+s3TFriW0H4+P/2vzlSXqE4NkKk+LLNNCTk41A==
X-Google-Smtp-Source: AA6agR5P7HwgcXKioSMOaHmqYnD0Zdm6r3YM9ykmsuJ9lZHHOWUMc2YeLsDh/5cR/Rn2ia4E+vs5JMAz7+l704S1p8U=
X-Received: by 2002:a2e:a910:0:b0:261:b408:1169 with SMTP id
 j16-20020a2ea910000000b00261b4081169mr6255451ljq.360.1661800482927; Mon, 29
 Aug 2022 12:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220827164056.3365356-1-masahiroy@kernel.org>
In-Reply-To: <20220827164056.3365356-1-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 29 Aug 2022 12:14:31 -0700
Message-ID: <CAKwvOdkZY5R-pU-Obz0GgwXfL=POqXkkMwidj=C3pip_vxMuog@mail.gmail.com>
Subject: Re: [PATCH] powerpc: clean up binutils version check
To: Masahiro Yamada <masahiroy@kernel.org>
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
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Alexey Dobriyan <adobriyan@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 27, 2022 at 9:43 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The checkbin in arch/powerpc/Makefile errors out if ld <= 2.24.
> So, the requirement on PPC is binutils >= 2.25. It is cleaner to
> specify it in scripts/min-tool-version.sh. If binutils < 2.25 is
> used, the toolchain check will fail in the Kconfig stage going
> forward.

Thoughts on making binutils 2.25.1 the new minimal support version for
all architectures? We already require GCC 5.1. Looking at

https://gcc.gnu.org/releases.html

that was released on April 22, 2015.  Looking at

https://ftp.gnu.org/gnu/binutils/

2.25 was released on 2014-12-23 and 2.25.1 on 2015-07-21.

Current minimum is 2.23 released on 2012-10-22.  Almost 10 years old.

>
> Since binutils >= 2.25 is already required, another version test
> for --save-restore-funcs on PPC64 is always met.
>
> PPC is the last user of ld-ifversion. With all the callers removed,
> the macro definition in scripts/Makefile.compiler can go away.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/powerpc/Makefile       | 21 ---------------------
>  arch/powerpc/lib/Makefile   |  8 --------
>  scripts/Makefile.compiler   |  4 ----
>  scripts/min-tool-version.sh |  8 +++++++-
>  4 files changed, 7 insertions(+), 34 deletions(-)
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index 02742facf895..fb607758eeca 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -46,13 +46,7 @@ UTS_MACHINE := $(subst $(space),,$(machine-y))
>  ifdef CONFIG_PPC32
>  KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
>  else
> -ifeq ($(call ld-ifversion, -ge, 22500, y),y)
> -# Have the linker provide sfpr if possible.
> -# There is a corresponding test in arch/powerpc/lib/Makefile
>  KBUILD_LDFLAGS_MODULE += --save-restore-funcs
> -else
> -KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
> -endif
>  endif
>
>  ifdef CONFIG_CPU_LITTLE_ENDIAN
> @@ -395,8 +389,6 @@ vdso_prepare: prepare0
>                 $(build)=arch/powerpc/kernel/vdso include/generated/vdso64-offsets.h)
>  endif
>
> -archprepare: checkbin
> -
>  archheaders:
>         $(Q)$(MAKE) $(build)=arch/powerpc/kernel/syscalls all
>
> @@ -411,16 +403,3 @@ else
>         $(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "TASK_CANARY") print $$3;}' include/generated/asm-offsets.h))
>  endif
>  endif
> -
> -PHONY += checkbin
> -# Check toolchain versions:
> -# - gcc-4.6 is the minimum kernel-wide version so nothing required.
> -checkbin:
> -       @if test "x${CONFIG_LD_IS_LLD}" != "xy" -a \
> -               "x$(call ld-ifversion, -le, 22400, y)" = "xy" ; then \
> -               echo -n '*** binutils 2.24 miscompiles weak symbols ' ; \
> -               echo 'in some circumstances.' ; \
> -               echo    '*** binutils 2.23 do not define the TOC symbol ' ; \
> -               echo -n '*** Please use a different binutils version.' ; \
> -               false ; \
> -       fi
> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> index 8560c912186d..5eb3971ccb9c 100644
> --- a/arch/powerpc/lib/Makefile
> +++ b/arch/powerpc/lib/Makefile
> @@ -38,14 +38,6 @@ obj-$(CONFIG_PPC32)  += div64.o copy_32.o crtsavres.o
>
>  obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
>
> -# See corresponding test in arch/powerpc/Makefile
> -# 64-bit linker creates .sfpr on demand for final link (vmlinux),
> -# so it is only needed for modules, and only for older linkers which
> -# do not support --save-restore-funcs
> -ifeq ($(call ld-ifversion, -lt, 22500, y),y)
> -extra-$(CONFIG_PPC64)  += crtsavres.o
> -endif
> -
>  obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
>                                memcpy_power7.o restart_table.o
>
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index 94d0d40cddb3..63e7d79dd877 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -68,7 +68,3 @@ cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || e
>  # ld-option
>  # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
>  ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
> -
> -# ld-ifversion
> -# Usage:  $(call ld-ifversion, -ge, 22252, y)
> -ld-ifversion = $(shell [ $(CONFIG_LD_VERSION)0 $(1) $(2)0 ] && echo $(3) || echo $(4))
> diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
> index 250925aab101..7df9f2150ea1 100755
> --- a/scripts/min-tool-version.sh
> +++ b/scripts/min-tool-version.sh
> @@ -14,7 +14,13 @@ fi
>
>  case "$1" in
>  binutils)
> -       echo 2.23.0
> +       if [ "$SRCARCH" = powerpc ]; then
> +               # binutils 2.24 miscompiles weak symbols in some circumstances
> +               # binutils 2.23 do not define the TOC symbol
> +               echo 2.25.0
> +       else
> +               echo 2.23.0
> +       fi
>         ;;
>  gcc)
>         echo 5.1.0
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
