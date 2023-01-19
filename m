Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDB0673801
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 13:13:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyM3T2jBDz3fCZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 23:13:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Qzda+1FK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Qzda+1FK;
	dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyM2V3zSyz3c6R
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 23:12:32 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id mg12so5141203ejc.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 04:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qGf+yAWhycXycQ2Yp6dQqCBU9N9hm20/EcONeRGAQM4=;
        b=Qzda+1FKoXwkc+DVexBSLmX3kpJyS4pGgoxta9rF6HUvlniX9CFQ0NujiyQqHenlwD
         VWgQzZ4lKzu7DrGLeRPZouPjFt/LNwc3bjWWVXWOJvbFqCT0R4oIuHGbQoMPt7H/hkpc
         oX88ALAxyi6NQwb9XIy+b195Dkq5Ny4ytnFnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGf+yAWhycXycQ2Yp6dQqCBU9N9hm20/EcONeRGAQM4=;
        b=QhtaiEt+QU4KNU+XZXftf5JPM8MRXyne04grV5vMX3y0yhE1aWzpsD7RHrOrJ1q8FO
         riy1qy9TqXogPo4tFm93Wxg9bkxckJQqm5jXwxdSCnugbI8A58ijpKAPpZgjBuzh48ZT
         Ywls+VEv2m5p3v/tCadB4aNT25KXeddFQbcYXWJayo1Vy6GquovRTIV1pPcxyWDnaehc
         29y6CNFCo15nMwS9N8+DJos8FMVvm+BlHaV4PDfVA7A+x9RKJB8BUE95Y+VA4PJUDRti
         XjaqrQpvSkvq74YQfgNpkhRfNOG6h1GmksDKFS05xsnK4txLaq3WXsX579Lnknr2Cr4h
         ZVZg==
X-Gm-Message-State: AFqh2koRIbI1HoEqix9Up5fZZ1E9sNUSzfXQVOD1+fMZvyZaWN28hFkQ
	WHV89OsdnR1Oj+42V12Icut3eVk2edQWzsXFuMU=
X-Google-Smtp-Source: AMrXdXuaaRjSRIZeHJmKIB51qInDkVHFrYZOAFXeUDCJnfTGjJl17j/VxbyTUaODPU5dae5QOWV0oF7MXmTGWBK2s6Q=
X-Received: by 2002:a17:906:8e18:b0:877:696c:e42c with SMTP id
 rx24-20020a1709068e1800b00877696ce42cmr249026ejc.651.1674130345698; Thu, 19
 Jan 2023 04:12:25 -0800 (PST)
MIME-Version: 1.0
References: <20230119082250.151485-1-masahiroy@kernel.org>
In-Reply-To: <20230119082250.151485-1-masahiroy@kernel.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Jan 2023 12:12:13 +0000
Message-ID: <CACPK8XeGsWN+2L57=dfQWOTSo8df7_qrxhwvV4Ho0rkhV=0vSw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: remove checks for binutils older than 2.25
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 19 Jan 2023 at 08:24, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Commit e4412739472b ("Documentation: raise minimum supported version of
> binutils to 2.25") allows us to remove the checks for old binutils.
>
> There is no more user for ld-ifversion. Remove it as well.

ppc kernels fail to link with 2.27 under some configurations:

 https://github.com/linuxppc/issues/issues/388

We may want to use ld-ifversion to exclude that version.

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/powerpc/Makefile     | 22 +---------------------
>  arch/powerpc/lib/Makefile |  2 +-
>  scripts/Makefile.compiler |  4 ----
>  3 files changed, 2 insertions(+), 26 deletions(-)
>
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index dc4cbf0a5ca9..3d265b16c0ae 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -42,18 +42,13 @@ machine-$(CONFIG_PPC64) += 64
>  machine-$(CONFIG_CPU_LITTLE_ENDIAN) += le
>  UTS_MACHINE := $(subst $(space),,$(machine-y))
>
> -# XXX This needs to be before we override LD below
> -ifdef CONFIG_PPC32
> -KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
> -else
> -ifeq ($(call ld-ifversion, -ge, 22500, y),y)
> +ifeq ($(CONFIG_PPC64)$(CONFIG_LD_IS_BFD),yy)
>  # Have the linker provide sfpr if possible.
>  # There is a corresponding test in arch/powerpc/lib/Makefile
>  KBUILD_LDFLAGS_MODULE += --save-restore-funcs
>  else
>  KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
>  endif
> -endif
>
>  ifdef CONFIG_CPU_LITTLE_ENDIAN
>  KBUILD_CFLAGS  += -mlittle-endian
> @@ -389,8 +384,6 @@ vdso_prepare: prepare0
>                 $(build)=arch/powerpc/kernel/vdso include/generated/vdso64-offsets.h)
>  endif
>
> -archprepare: checkbin
> -
>  archheaders:
>         $(Q)$(MAKE) $(build)=arch/powerpc/kernel/syscalls all
>
> @@ -405,16 +398,3 @@ else
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
> index 4de71cbf6e8e..c53618c34b70 100644
> --- a/arch/powerpc/lib/Makefile
> +++ b/arch/powerpc/lib/Makefile
> @@ -42,7 +42,7 @@ obj-$(CONFIG_FUNCTION_ERROR_INJECTION)        += error-inject.o
>  # 64-bit linker creates .sfpr on demand for final link (vmlinux),
>  # so it is only needed for modules, and only for older linkers which
>  # do not support --save-restore-funcs
> -ifeq ($(call ld-ifversion, -lt, 22500, y),y)
> +ifndef CONFIG_LD_IS_BFD
>  extra-$(CONFIG_PPC64)  += crtsavres.o
>  endif
>
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index 3d8adfd34af1..ad07a4efc253 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -72,7 +72,3 @@ clang-min-version = $(call test-ge, $(CONFIG_CLANG_VERSION), $1)
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
