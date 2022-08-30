Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3C75A6EF7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 23:14:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHKmy62nhz3cBk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 07:14:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=omqrweNU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=omqrweNU;
	dkim-atps=neutral
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHKmJ5sDwz3bl4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 07:13:35 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id bq23so17263411lfb.7
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 14:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=oywZfDIsGL4tKXcPq28Sz6Q76UuTz9kWGjkId3y4V+M=;
        b=omqrweNUqnXpZ7v6XrnYmw432ZzRF8uJMDL5xZmfWKIGxZin/iyuL7r1sxyHjeS+XU
         0lNDFH7n4FE5kRMnZRWqrFCmaJu0bU9BKos6I2zwOZ2gQmXm4udCEurpPdPmzREC9V7q
         Pr1wtslE5QgUDM5eLOlCwS7NditreSOwiFlZwKjp3+paDkV7wNHRzHxJj2t5sykz4QgW
         Sk2qk49eW2q/EZ8+1L5oK7An9clv2FSpukfmevTyMVWcASOWUre4Ny0eN36R0pPHbQDA
         3JCUC9wb0WzKvH+4mZklMFO0VuKpjbCA2lSTX2EgvCFri1JO0Gkqqe13Shjya+wpH3nF
         aPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=oywZfDIsGL4tKXcPq28Sz6Q76UuTz9kWGjkId3y4V+M=;
        b=O6fpQnZqRrsn+pkLKz2oatDhg9rztokuUKLfi38pUzArkPaUORPhOCWZnN3iMFRU1h
         MTwolGu3Hk/Gzz0++o0VCJ3wKvLJo+C3/sox1JFObtQVr3LuCEtf7TOUo2oIgohRGyar
         T/LR/DAu0lY/K4KAuYfazwx/MrTc1jvgz562RkCkPjvXmgHS4fh3PP79pvOMuL8y280b
         wMBys/2KvzWk1mt5YfAIfXX3UJT2p1DarMZgsgNt1g4wPMzT0ffTOXXn880mAYKs9Rv7
         S5hSBTr2DUlOcDHs0qx5nnmRNra1i0PXsFWl2AGJX24QUS470rDUfnd+ulW2925SOY/b
         itkw==
X-Gm-Message-State: ACgBeo1PhzCywElMtatNXgf6qaxZOyXtKDiQrygmRWje+/swHawQ7d1t
	dCdyFmUXZineu9Wcx8QY2Swv4DEQRq2D7LchAzisQw==
X-Google-Smtp-Source: AA6agR5Mm35Ff7nsNoWDk1epY0voEja9ujnt3RTA8tTQVeTCGAk7FouatgDLGRjCpky8mt9zUKKLq00C9B92u31uczU=
X-Received: by 2002:ac2:4f03:0:b0:48a:6061:bd8e with SMTP id
 k3-20020ac24f03000000b0048a6061bd8emr9136668lfr.647.1661894011886; Tue, 30
 Aug 2022 14:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220830190811.323760-1-masahiroy@kernel.org> <20220830190811.323760-2-masahiroy@kernel.org>
In-Reply-To: <20220830190811.323760-2-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 30 Aug 2022 14:13:20 -0700
Message-ID: <CAKwvOd=4F-_5+txzbNy4sC8tADGmiEtbVL64CCiAp7nmgyUTnQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc: remove old code for binutils < 2.25
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 30, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The minimum supported version of binutils has been raised to 2.25.1.
> Drop the old code.
>
> PPC is the last user of ld-ifversion. With all the callers removed,
> the macro definition in scripts/Makefile.compiler can go away.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/powerpc/Makefile     | 21 ---------------------
>  arch/powerpc/lib/Makefile |  8 --------
>  scripts/Makefile.compiler |  4 ----
>  3 files changed, 33 deletions(-)
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

^ Perhaps this comment is still relevant and should not yet be
discarded? Or updated, dropping " if possible".

Either way:
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

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
> --
> 2.34.1
>


-- 
Thanks,
~Nick Desaulniers
