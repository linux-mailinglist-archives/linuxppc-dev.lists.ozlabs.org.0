Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D625A7045
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 00:02:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHLr90R6Bz3cBL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 08:02:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VFOBdZTW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VFOBdZTW;
	dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHLqY6Ql8z2xGJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 08:01:28 +1000 (AEST)
Received: by mail-lj1-x232.google.com with SMTP id z20so12800508ljq.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 15:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=TBOcBPEs0l2CdbJcXbd7RrlduiFRm3nf/GGeG82PD9c=;
        b=VFOBdZTWjLgB1w5EyBss2L1+o373C2ipKB+i3bC121cb0c6P9D6DWgCnEV+3pUT65v
         FK9nnlccJG63Wan63om7IzJP/MSJ1snvL6iHZfoT0x2UH75OUbs742bM/Yupg9inzr34
         07w3u4466fkemgTkQcNIOgq4goyskVMjpRxq+ONp9GualUKvfhWhG02K1S3LCuaBpqgd
         RHcbEvI9U9cZo4qCDoZjShZgpishCcHgqEJSdTTyj/YXx9Rj93Ug6yk32F/SyWHXXtNF
         LaJNAVlGZ2pFOhJKppiazPQ1NNPI+zlRtmrCkXcgLQQZuuaZUpOKWgPwiFplzf/c9OdC
         J03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=TBOcBPEs0l2CdbJcXbd7RrlduiFRm3nf/GGeG82PD9c=;
        b=wjnKWp8BA5jOo6MHsJCcMN4RnHmB7PjTNMgz87RtMjKC5ep70yRcjsRQtoe/qEjeiJ
         G9NLQ54LAWm9QDEjL3gPXpnw/QH8yMiZ7dR7TSkG5NKggMrdKXv8Nj5vJ43XWca4nRts
         Fm5Ebh06VEs6nLjgClYFSYueVb/q/asfIIQlguG34sg4J6M0o57P3dkOM7JfdoOgI1wX
         PQPN1Y8G6B1cnvClKK7B+weQvslDiwMvOoP56HBoqzDEfS/3nDzcKjoQlKR8kmPwPa55
         HfnZDXd4k/T+5L+9QL73WaiXreB0rs+yfKB9aP4ZR4rkP8AZl3VFfeiJOfUG21z/irp0
         KUrg==
X-Gm-Message-State: ACgBeo0uTqJ5GfYrMrwcwIEnUroH3waR7ZlVz8j0Y9oZE227aN4jZdWp
	8h1JraFzK4YrUjdtM4byLu3FMzt7PRqQ2MAEqavFOA==
X-Google-Smtp-Source: AA6agR6k+aunGRTyMtdNt/vLBaz8QKSpT7PVxa1geFPV0e78TEU47zMaZBwfF2tED5IC+nYD6hKYnhAG7ugVJiGc6wA=
X-Received: by 2002:a2e:aa13:0:b0:264:eb98:b7fd with SMTP id
 bf19-20020a2eaa13000000b00264eb98b7fdmr3419431ljb.26.1661896883582; Tue, 30
 Aug 2022 15:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220830190811.323760-1-masahiroy@kernel.org> <20220830190811.323760-2-masahiroy@kernel.org>
 <CAKwvOd=4F-_5+txzbNy4sC8tADGmiEtbVL64CCiAp7nmgyUTnQ@mail.gmail.com> <Yw6EoSojRZbj+STd@dev-arch.thelio-3990X>
In-Reply-To: <Yw6EoSojRZbj+STd@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 30 Aug 2022 15:01:12 -0700
Message-ID: <CAKwvOdnzN_-MTNeV5p5rmk1R5B7bftwcWwhXOS2fY1XjJ4u6KA@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc: remove old code for binutils < 2.25
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
Cc: Fangrui Song <maskray@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, nemanja.i.ibm@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 30, 2022 at 2:44 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Tue, Aug 30, 2022 at 02:13:20PM -0700, Nick Desaulniers wrote:
> > On Tue, Aug 30, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > The minimum supported version of binutils has been raised to 2.25.1.
> > > Drop the old code.
> > >
> > > PPC is the last user of ld-ifversion. With all the callers removed,
> > > the macro definition in scripts/Makefile.compiler can go away.
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  arch/powerpc/Makefile     | 21 ---------------------
> > >  arch/powerpc/lib/Makefile |  8 --------
> > >  scripts/Makefile.compiler |  4 ----
> > >  3 files changed, 33 deletions(-)
> > >
> > > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > > index 02742facf895..fb607758eeca 100644
> > > --- a/arch/powerpc/Makefile
> > > +++ b/arch/powerpc/Makefile
> > > @@ -46,13 +46,7 @@ UTS_MACHINE := $(subst $(space),,$(machine-y))
> > >  ifdef CONFIG_PPC32
> > >  KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
> > >  else
> > > -ifeq ($(call ld-ifversion, -ge, 22500, y),y)
> > > -# Have the linker provide sfpr if possible.
> >
> > ^ Perhaps this comment is still relevant and should not yet be
> > discarded? Or updated, dropping " if possible".
> >
> > Either way:
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> I think we still want this block for ld.lld. Prior to this change,
> ld.lld would fail the ld-ifversion check and use crtsavres.o. Now, it
> will try to use '--save-restore-funcs', which it doesn't have support
> for, breaking the build for at least powernv_defconfig:
>
> ld.lld: error: unknown argument '--save-restore-funcs'

Good catch, this should probably be rewritten to use ld-option then.

I wonder what LLD's default behavior is, and if we need a feature request filed?

>
> > > -# There is a corresponding test in arch/powerpc/lib/Makefile
> > >  KBUILD_LDFLAGS_MODULE += --save-restore-funcs
> > > -else
> > > -KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
> > > -endif
> > >  endif
> > >
> > >  ifdef CONFIG_CPU_LITTLE_ENDIAN
> > > @@ -395,8 +389,6 @@ vdso_prepare: prepare0
> > >                 $(build)=arch/powerpc/kernel/vdso include/generated/vdso64-offsets.h)
> > >  endif
> > >
> > > -archprepare: checkbin
> > > -
> > >  archheaders:
> > >         $(Q)$(MAKE) $(build)=arch/powerpc/kernel/syscalls all
> > >
> > > @@ -411,16 +403,3 @@ else
> > >         $(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "TASK_CANARY") print $$3;}' include/generated/asm-offsets.h))
> > >  endif
> > >  endif
> > > -
> > > -PHONY += checkbin
> > > -# Check toolchain versions:
> > > -# - gcc-4.6 is the minimum kernel-wide version so nothing required.
> > > -checkbin:
> > > -       @if test "x${CONFIG_LD_IS_LLD}" != "xy" -a \
> > > -               "x$(call ld-ifversion, -le, 22400, y)" = "xy" ; then \
> > > -               echo -n '*** binutils 2.24 miscompiles weak symbols ' ; \
> > > -               echo 'in some circumstances.' ; \
> > > -               echo    '*** binutils 2.23 do not define the TOC symbol ' ; \
> > > -               echo -n '*** Please use a different binutils version.' ; \
> > > -               false ; \
> > > -       fi
> > > diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> > > index 8560c912186d..5eb3971ccb9c 100644
> > > --- a/arch/powerpc/lib/Makefile
> > > +++ b/arch/powerpc/lib/Makefile
> > > @@ -38,14 +38,6 @@ obj-$(CONFIG_PPC32)  += div64.o copy_32.o crtsavres.o
> > >
> > >  obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
> > >
> > > -# See corresponding test in arch/powerpc/Makefile
> > > -# 64-bit linker creates .sfpr on demand for final link (vmlinux),
> > > -# so it is only needed for modules, and only for older linkers which
> > > -# do not support --save-restore-funcs
> > > -ifeq ($(call ld-ifversion, -lt, 22500, y),y)
> > > -extra-$(CONFIG_PPC64)  += crtsavres.o
> > > -endif
> > > -
> > >  obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
> > >                                memcpy_power7.o restart_table.o
> > >
> > > diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> > > index 94d0d40cddb3..63e7d79dd877 100644
> > > --- a/scripts/Makefile.compiler
> > > +++ b/scripts/Makefile.compiler
> > > @@ -68,7 +68,3 @@ cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || e
> > >  # ld-option
> > >  # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
> > >  ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
> > > -
> > > -# ld-ifversion
> > > -# Usage:  $(call ld-ifversion, -ge, 22252, y)
> > > -ld-ifversion = $(shell [ $(CONFIG_LD_VERSION)0 $(1) $(2)0 ] && echo $(3) || echo $(4))
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers
