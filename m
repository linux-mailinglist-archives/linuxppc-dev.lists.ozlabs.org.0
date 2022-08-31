Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CF05A7347
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 03:20:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHRFc4WRcz3c9m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 11:20:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=iMZAp4JS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=maskray@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=iMZAp4JS;
	dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHRDy5W26z3bXn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 11:20:17 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id s206so12220340pgs.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 18:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=7tFCGCoV5vhvYiTuKba03XJjhSgAAcnIUud2VQpsO0E=;
        b=iMZAp4JSeOAC/wfLBQGhNzves0Yi+GyLRFnaEGmIre/qVVbmBUjiluDoQXk6Bf2ToT
         Mow2iAuDsf3JPK51tK3No7W0v+hZoDTA8u4Q8YtMgCUkLMeyct8zOuio5AkdfW101bD8
         E3Qo8n4PNG0ZTZeLQC4w3coWEdfoXZvkjX3aVPqiE6L5AAx+F3alCQcqKIjg0CP23Xzp
         +JuqwJcf8aOqMmeDAe0r+vKnxSB4XZBGJL3zMDnX9UI+asPpPC2iPdypaFfiTrPhOyia
         YE/SM/pNM/Z/uTa52fC3Rc5S0F8e9er29IJxLfgz/pWwFKoLvJweh7jy6QtpXMU7JMvf
         UH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=7tFCGCoV5vhvYiTuKba03XJjhSgAAcnIUud2VQpsO0E=;
        b=NWBbCSSeH5HbjnMsJvqmPh+Z2QwJ+oIjZFBkpDSofuXNSvafJJFUrU9NqlqeC+H9IP
         iOvS37oELf1pgzvP3RVTC9kijdSgwUkjeSpN5UNXv10AOUXRdx1Mnv7q86C1wcuM9ZYO
         wBsb2k/0iG4NIFvZYNoxMsz7H6LQR4d2/piaPtTI0IQMU+0rU50ijDznCmdreX8dhuLA
         bKBB6kaVtMRZl6EKyc+HWX08NeKFLEGB3bP7uiWXB+3CAFdHurUZDQ6pQejBp4mqvKvh
         Q25Q38a8qbGIBhgYYTJId/sMhjwTqpcMrMt66+/uBwtXnx9ybz5SBg00zprFjESNGfyq
         pAVw==
X-Gm-Message-State: ACgBeo3VuzdU1nQx+OQaqv5spaJPblhUvJwmW0upeXfWeMDpifOrzPz6
	XM3cw5TVa+FxPfwUXQrWRBBdrw==
X-Google-Smtp-Source: AA6agR7EDlkjUBLso5FP2aRum1bTHgPZA9OupjzUufx5jKn20Uy57HAwqg7K9vEzKitorjgPn3z9Ig==
X-Received: by 2002:a63:8642:0:b0:42b:7f8e:415c with SMTP id x63-20020a638642000000b0042b7f8e415cmr18074866pgd.203.1661908814602;
        Tue, 30 Aug 2022 18:20:14 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:200:2c5:644c:c610:2bb9])
        by smtp.gmail.com with ESMTPSA id 4-20020a17090a198400b001f1694dafb1sm182915pji.44.2022.08.30.18.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 18:20:14 -0700 (PDT)
Date: Tue, 30 Aug 2022 18:20:09 -0700
From: Fangrui Song <maskray@google.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 2/2] powerpc: remove old code for binutils < 2.25
Message-ID: <20220831012009.4lcw35fqlpygtjys@google.com>
References: <20220830190811.323760-1-masahiroy@kernel.org>
 <20220830190811.323760-2-masahiroy@kernel.org>
 <CAKwvOd=4F-_5+txzbNy4sC8tADGmiEtbVL64CCiAp7nmgyUTnQ@mail.gmail.com>
 <Yw6EoSojRZbj+STd@dev-arch.thelio-3990X>
 <CAKwvOdnzN_-MTNeV5p5rmk1R5B7bftwcWwhXOS2fY1XjJ4u6KA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAKwvOdnzN_-MTNeV5p5rmk1R5B7bftwcWwhXOS2fY1XjJ4u6KA@mail.gmail.com>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, nemanja.i.ibm@gmail.com, Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-08-30, Nick Desaulniers wrote:
>On Tue, Aug 30, 2022 at 2:44 PM Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> On Tue, Aug 30, 2022 at 02:13:20PM -0700, Nick Desaulniers wrote:
>> > On Tue, Aug 30, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>> > >
>> > > The minimum supported version of binutils has been raised to 2.25.1.
>> > > Drop the old code.
>> > >
>> > > PPC is the last user of ld-ifversion. With all the callers removed,
>> > > the macro definition in scripts/Makefile.compiler can go away.
>> > >
>> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>> > > ---
>> > >
>> > >  arch/powerpc/Makefile     | 21 ---------------------
>> > >  arch/powerpc/lib/Makefile |  8 --------
>> > >  scripts/Makefile.compiler |  4 ----
>> > >  3 files changed, 33 deletions(-)
>> > >
>> > > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
>> > > index 02742facf895..fb607758eeca 100644
>> > > --- a/arch/powerpc/Makefile
>> > > +++ b/arch/powerpc/Makefile
>> > > @@ -46,13 +46,7 @@ UTS_MACHINE := $(subst $(space),,$(machine-y))
>> > >  ifdef CONFIG_PPC32
>> > >  KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
>> > >  else
>> > > -ifeq ($(call ld-ifversion, -ge, 22500, y),y)
>> > > -# Have the linker provide sfpr if possible.
>> >
>> > ^ Perhaps this comment is still relevant and should not yet be
>> > discarded? Or updated, dropping " if possible".
>> >
>> > Either way:
>> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>>
>> I think we still want this block for ld.lld. Prior to this change,
>> ld.lld would fail the ld-ifversion check and use crtsavres.o. Now, it
>> will try to use '--save-restore-funcs', which it doesn't have support
>> for, breaking the build for at least powernv_defconfig:
>>
>> ld.lld: error: unknown argument '--save-restore-funcs'
>
>Good catch, this should probably be rewritten to use ld-option then.
>
>I wonder what LLD's default behavior is, and if we need a feature request filed?

I have implemented the save/restore functions[1] in ld.lld
(https://reviews.llvm.org/D79977) but do not add --(no-)?save-restore-funcs.
ld.lld's behavior matches GNU ld default: for non-relocatable links,
save/restore functions are synthesized.

ld.bfd --save-restore-funcs changes a relocatable link to define save/restore
functions. Is this behavior sufficiently useful? I don't think the obscure
linker option --save-restore-funcs is used anywhere else (checked with Debian
Code Search).


[1]: In the 64-bit ELF V2 API Specification: Power Architecture, 2.3.3.1. GPR
Save and Restore Functions defines some special functions which may be
referenced by GCC produced assembly (LLVM does not reference them).


>>
>> > > -# There is a corresponding test in arch/powerpc/lib/Makefile
>> > >  KBUILD_LDFLAGS_MODULE += --save-restore-funcs
>> > > -else
>> > > -KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
>> > > -endif
>> > >  endif
>> > >
>> > >  ifdef CONFIG_CPU_LITTLE_ENDIAN
>> > > @@ -395,8 +389,6 @@ vdso_prepare: prepare0
>> > >                 $(build)=arch/powerpc/kernel/vdso include/generated/vdso64-offsets.h)
>> > >  endif
>> > >
>> > > -archprepare: checkbin
>> > > -
>> > >  archheaders:
>> > >         $(Q)$(MAKE) $(build)=arch/powerpc/kernel/syscalls all
>> > >
>> > > @@ -411,16 +403,3 @@ else
>> > >         $(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "TASK_CANARY") print $$3;}' include/generated/asm-offsets.h))
>> > >  endif
>> > >  endif
>> > > -
>> > > -PHONY += checkbin
>> > > -# Check toolchain versions:
>> > > -# - gcc-4.6 is the minimum kernel-wide version so nothing required.
>> > > -checkbin:
>> > > -       @if test "x${CONFIG_LD_IS_LLD}" != "xy" -a \
>> > > -               "x$(call ld-ifversion, -le, 22400, y)" = "xy" ; then \
>> > > -               echo -n '*** binutils 2.24 miscompiles weak symbols ' ; \
>> > > -               echo 'in some circumstances.' ; \
>> > > -               echo    '*** binutils 2.23 do not define the TOC symbol ' ; \
>> > > -               echo -n '*** Please use a different binutils version.' ; \
>> > > -               false ; \
>> > > -       fi
>> > > diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
>> > > index 8560c912186d..5eb3971ccb9c 100644
>> > > --- a/arch/powerpc/lib/Makefile
>> > > +++ b/arch/powerpc/lib/Makefile
>> > > @@ -38,14 +38,6 @@ obj-$(CONFIG_PPC32)  += div64.o copy_32.o crtsavres.o
>> > >
>> > >  obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
>> > >
>> > > -# See corresponding test in arch/powerpc/Makefile
>> > > -# 64-bit linker creates .sfpr on demand for final link (vmlinux),
>> > > -# so it is only needed for modules, and only for older linkers which
>> > > -# do not support --save-restore-funcs
>> > > -ifeq ($(call ld-ifversion, -lt, 22500, y),y)
>> > > -extra-$(CONFIG_PPC64)  += crtsavres.o
>> > > -endif
>> > > -
>> > >  obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
>> > >                                memcpy_power7.o restart_table.o
>> > >
>> > > diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
>> > > index 94d0d40cddb3..63e7d79dd877 100644
>> > > --- a/scripts/Makefile.compiler
>> > > +++ b/scripts/Makefile.compiler
>> > > @@ -68,7 +68,3 @@ cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || e
>> > >  # ld-option
>> > >  # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
>> > >  ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
>> > > -
>> > > -# ld-ifversion
>> > > -# Usage:  $(call ld-ifversion, -ge, 22252, y)
>> > > -ld-ifversion = $(shell [ $(CONFIG_LD_VERSION)0 $(1) $(2)0 ] && echo $(3) || echo $(4))
>> > > --
>> > > 2.34.1
>> > >
>> >
>> >
>> > --
>> > Thanks,
>> > ~Nick Desaulniers
>
>
>
>-- 
>Thanks,
>~Nick Desaulniers
