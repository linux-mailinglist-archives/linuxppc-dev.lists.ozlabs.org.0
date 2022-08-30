Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE8A5A6F5E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 23:44:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHLSD2YYCz3c3W
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 07:44:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oLe2luuv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oLe2luuv;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHLRY3rKwz3blx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 07:44:09 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 21C22618EE;
	Tue, 30 Aug 2022 21:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B66C433C1;
	Tue, 30 Aug 2022 21:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661895843;
	bh=BLIGtbUtxpO0HfppV2zM4Bh3yKvvPeAZzjYz6SjPg6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oLe2luuv00y0icc8Xtbz1ozqdvZcyklkJ8y9EaZ5Z2srBqYls2WnQxpXK3iO1MboY
	 0DKhe3q4H8BV2z9PhM0iojr4fhiAlZHU1k7mLWRt+iEc13UR28iWXAhD5+5W12tKIs
	 s0aRs3khkSXFesKjM34cTAyl/0q23YZ4QvtlVQUMMfAWWuHd4ty1mgcF4OYgKpv9lJ
	 uvOGlUQsBsYURjhzCPaEZBTt5xNCkqYpW4vYErdBW4kGleVhUMh5U/aVhtymN/BZhq
	 gdkrZ4vMIYHtCqZtQrz+dJRw8DMNDh6CS1uf17megW+cGApqUhs/5deOGE2OosHdnJ
	 7h1Vn6UJ4OLng==
Date: Tue, 30 Aug 2022 14:44:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 2/2] powerpc: remove old code for binutils < 2.25
Message-ID: <Yw6EoSojRZbj+STd@dev-arch.thelio-3990X>
References: <20220830190811.323760-1-masahiroy@kernel.org>
 <20220830190811.323760-2-masahiroy@kernel.org>
 <CAKwvOd=4F-_5+txzbNy4sC8tADGmiEtbVL64CCiAp7nmgyUTnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=4F-_5+txzbNy4sC8tADGmiEtbVL64CCiAp7nmgyUTnQ@mail.gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Masahiro Yamada <masahiroy@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 30, 2022 at 02:13:20PM -0700, Nick Desaulniers wrote:
> On Tue, Aug 30, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > The minimum supported version of binutils has been raised to 2.25.1.
> > Drop the old code.
> >
> > PPC is the last user of ld-ifversion. With all the callers removed,
> > the macro definition in scripts/Makefile.compiler can go away.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  arch/powerpc/Makefile     | 21 ---------------------
> >  arch/powerpc/lib/Makefile |  8 --------
> >  scripts/Makefile.compiler |  4 ----
> >  3 files changed, 33 deletions(-)
> >
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index 02742facf895..fb607758eeca 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -46,13 +46,7 @@ UTS_MACHINE := $(subst $(space),,$(machine-y))
> >  ifdef CONFIG_PPC32
> >  KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
> >  else
> > -ifeq ($(call ld-ifversion, -ge, 22500, y),y)
> > -# Have the linker provide sfpr if possible.
> 
> ^ Perhaps this comment is still relevant and should not yet be
> discarded? Or updated, dropping " if possible".
> 
> Either way:
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

I think we still want this block for ld.lld. Prior to this change,
ld.lld would fail the ld-ifversion check and use crtsavres.o. Now, it
will try to use '--save-restore-funcs', which it doesn't have support
for, breaking the build for at least powernv_defconfig:

ld.lld: error: unknown argument '--save-restore-funcs'

> > -# There is a corresponding test in arch/powerpc/lib/Makefile
> >  KBUILD_LDFLAGS_MODULE += --save-restore-funcs
> > -else
> > -KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
> > -endif
> >  endif
> >
> >  ifdef CONFIG_CPU_LITTLE_ENDIAN
> > @@ -395,8 +389,6 @@ vdso_prepare: prepare0
> >                 $(build)=arch/powerpc/kernel/vdso include/generated/vdso64-offsets.h)
> >  endif
> >
> > -archprepare: checkbin
> > -
> >  archheaders:
> >         $(Q)$(MAKE) $(build)=arch/powerpc/kernel/syscalls all
> >
> > @@ -411,16 +403,3 @@ else
> >         $(eval KBUILD_CFLAGS += -mstack-protector-guard-offset=$(shell awk '{if ($$2 == "TASK_CANARY") print $$3;}' include/generated/asm-offsets.h))
> >  endif
> >  endif
> > -
> > -PHONY += checkbin
> > -# Check toolchain versions:
> > -# - gcc-4.6 is the minimum kernel-wide version so nothing required.
> > -checkbin:
> > -       @if test "x${CONFIG_LD_IS_LLD}" != "xy" -a \
> > -               "x$(call ld-ifversion, -le, 22400, y)" = "xy" ; then \
> > -               echo -n '*** binutils 2.24 miscompiles weak symbols ' ; \
> > -               echo 'in some circumstances.' ; \
> > -               echo    '*** binutils 2.23 do not define the TOC symbol ' ; \
> > -               echo -n '*** Please use a different binutils version.' ; \
> > -               false ; \
> > -       fi
> > diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> > index 8560c912186d..5eb3971ccb9c 100644
> > --- a/arch/powerpc/lib/Makefile
> > +++ b/arch/powerpc/lib/Makefile
> > @@ -38,14 +38,6 @@ obj-$(CONFIG_PPC32)  += div64.o copy_32.o crtsavres.o
> >
> >  obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
> >
> > -# See corresponding test in arch/powerpc/Makefile
> > -# 64-bit linker creates .sfpr on demand for final link (vmlinux),
> > -# so it is only needed for modules, and only for older linkers which
> > -# do not support --save-restore-funcs
> > -ifeq ($(call ld-ifversion, -lt, 22500, y),y)
> > -extra-$(CONFIG_PPC64)  += crtsavres.o
> > -endif
> > -
> >  obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
> >                                memcpy_power7.o restart_table.o
> >
> > diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> > index 94d0d40cddb3..63e7d79dd877 100644
> > --- a/scripts/Makefile.compiler
> > +++ b/scripts/Makefile.compiler
> > @@ -68,7 +68,3 @@ cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || e
> >  # ld-option
> >  # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
> >  ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
> > -
> > -# ld-ifversion
> > -# Usage:  $(call ld-ifversion, -ge, 22252, y)
> > -ld-ifversion = $(shell [ $(CONFIG_LD_VERSION)0 $(1) $(2)0 ] && echo $(3) || echo $(4))
> > --
> > 2.34.1
> >
> 
> 
> -- 
> Thanks,
> ~Nick Desaulniers
