Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B83173D5AA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 03:59:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DGmwX3l/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qq9xq2Y0Wz3bTG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 11:59:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DGmwX3l/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qq9wr1rzpz30Ln
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 11:58:19 +1000 (AEST)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-56314bd1c34so1809699eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jun 2023 18:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687744694; x=1690336694;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIi3FkwCk5HG64ANT+PN0JameuFfw1WbglMg15jyrTQ=;
        b=DGmwX3l/5bkd6oo8XKGuxduVBE1isYcG0BSNBXdo60CHGPwIdJI0SK1bob1tVFBi4Q
         WkkwPiTAUIVN2HKL8p/l5mNkEylwL49oZY0MApytICxYKc33dZzEI3lK7E1zP7Wjg/68
         Bu73LM/XkHzSN8PuNYh3o1p9HCzCVYUbho1gqSyDBsjKnI8gm0vGx/Gx8H2cw1EVBcmP
         Ng3S9CqDov70r4jNpfME0G0BzxPJuwat9i2USToRbYjdMn7T0f3KZ/FYq8A/FB7nCJw2
         loAt4Az2UHBl0E97jwJIsoCGnRLkJoYFDjj8IRVrgKZzDGvGsK/F3kB8XakoW1Hhi99q
         X60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687744694; x=1690336694;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sIi3FkwCk5HG64ANT+PN0JameuFfw1WbglMg15jyrTQ=;
        b=JU23lZ7hf4pvl11rBdGLrVpMb70Ant9DK7BWcQpLpWpwlp9p+dOPUXVqGB2rDMasre
         CB5IcTVK9aaPM5ejldn8ZjkY/Y9t3MWkjc+nCN/L8fqPNnBvy4pAGu37BjKbi6hKGkSJ
         yCIt46HjjsChi1wf/rSzIb7A3+mo3LZi74Xky0SQ42indj4zmxOS2sLST5eM720eiIwW
         107kov4eFvM7K3yjm/nrVC/4CkuD/3mIr9Exh9xcsGghu+6Pau54+XyJJdM8oNUr29AZ
         kpiVe6C47JVyUIcAes1KNTJCY0lnvQlHCd4aIR7uwDUEoe9ULKfiEHbZCOVUDnNaMugd
         KYZg==
X-Gm-Message-State: AC+VfDyAfcdXlHWbMahlgIsZmU19ZTz7uJw+6qEFm5700jnacN3+t7ha
	7QMLW6fOM3vk21ZZ4MpbK7A=
X-Google-Smtp-Source: ACHHUZ78En8oF4JQ4eCiuIXy53tCVU5GcaiDLfFNv6yo542ZIo9IsB/sdnjGu01B5GIrNjswpTqH2w==
X-Received: by 2002:a05:6808:1981:b0:3a1:cdba:e4e0 with SMTP id bj1-20020a056808198100b003a1cdbae4e0mr3634854oib.50.1687744694384;
        Sun, 25 Jun 2023 18:58:14 -0700 (PDT)
Received: from localhost (193-116-198-102.tpgi.com.au. [193.116.198.102])
        by smtp.gmail.com with ESMTPSA id az12-20020a170902a58c00b001b0034557afsm2992916plb.15.2023.06.25.18.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 18:58:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jun 2023 11:58:06 +1000
Message-Id: <CTM7K580U3T2.261RJKV58M653@wheely>
To: "Masahiro Yamada" <masahiroy@kernel.org>, "Joel Stanley"
 <joel@jms.id.au>, "Michael Ellerman" <mpe@ellerman.id.au>,
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc: remove checks for binutils older than 2.25
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.15.2
References: <20230119082250.151485-1-masahiroy@kernel.org>
 <CACPK8XeGsWN+2L57=dfQWOTSo8df7_qrxhwvV4Ho0rkhV=0vSw@mail.gmail.com>
 <CAK7LNAQWtDHOs=K+qznt5U1WiDv86tChkj4zOer4wtVRB974OA@mail.gmail.com>
 <CAK7LNAS=UCo_o-B0mgsR+SDb0sYwvQo90uag5sJ1UmB+8NqLjQ@mail.gmail.com>
In-Reply-To: <CAK7LNAS=UCo_o-B0mgsR+SDb0sYwvQo90uag5sJ1UmB+8NqLjQ@mail.gmail.com>
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun Jun 25, 2023 at 6:02 PM AEST, Masahiro Yamada wrote:
> On Thu, Jan 19, 2023 at 9:37=E2=80=AFPM Masahiro Yamada <masahiroy@kernel=
.org> wrote:
> >
> > On Thu, Jan 19, 2023 at 9:12 PM Joel Stanley <joel@jms.id.au> wrote:
> > >
> > > On Thu, 19 Jan 2023 at 08:24, Masahiro Yamada <masahiroy@kernel.org> =
wrote:
> > > >
> > > > Commit e4412739472b ("Documentation: raise minimum supported versio=
n of
> > > > binutils to 2.25") allows us to remove the checks for old binutils.
> > > >
> > > > There is no more user for ld-ifversion. Remove it as well.
> > >
> > > ppc kernels fail to link with 2.27 under some configurations:
> > >
> > >  https://github.com/linuxppc/issues/issues/388
> > >
> > > We may want to use ld-ifversion to exclude that version.
> >
> >
>
>
> Ping?
>
>
>
>
> >
> > For LLD, CONFIG option is directly checked.

Yeah, doesn't seem too difficult to add new linker version tests if needed.

> >
> >
> > masahiro@zoe:~/ref/linux(master)$ git grep  CONFIG_LLD_VERSION
> > Makefile:ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 130000),y)
> > arch/riscv/Makefile:ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 150000=
),y)
> > arch/x86/Makefile:ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 130000),=
y)
> > scripts/Kbuild.include:# Usage: $(call test-lt, $(CONFIG_LLD_VERSION), =
150000)
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> >
> > > >
> > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > > ---
> > > >
> > > >  arch/powerpc/Makefile     | 22 +---------------------
> > > >  arch/powerpc/lib/Makefile |  2 +-
> > > >  scripts/Makefile.compiler |  4 ----
> > > >  3 files changed, 2 insertions(+), 26 deletions(-)
> > > >
> > > > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > > > index dc4cbf0a5ca9..3d265b16c0ae 100644
> > > > --- a/arch/powerpc/Makefile
> > > > +++ b/arch/powerpc/Makefile
> > > > @@ -42,18 +42,13 @@ machine-$(CONFIG_PPC64) +=3D 64
> > > >  machine-$(CONFIG_CPU_LITTLE_ENDIAN) +=3D le
> > > >  UTS_MACHINE :=3D $(subst $(space),,$(machine-y))
> > > >
> > > > -# XXX This needs to be before we override LD below
> > > > -ifdef CONFIG_PPC32
> > > > -KBUILD_LDFLAGS_MODULE +=3D arch/powerpc/lib/crtsavres.o
> > > > -else
> > > > -ifeq ($(call ld-ifversion, -ge, 22500, y),y)
> > > > +ifeq ($(CONFIG_PPC64)$(CONFIG_LD_IS_BFD),yy)
> > > >  # Have the linker provide sfpr if possible.
> > > >  # There is a corresponding test in arch/powerpc/lib/Makefile
> > > >  KBUILD_LDFLAGS_MODULE +=3D --save-restore-funcs
> > > >  else
> > > >  KBUILD_LDFLAGS_MODULE +=3D arch/powerpc/lib/crtsavres.o
> > > >  endif
> > > > -endif
> > > >
> > > >  ifdef CONFIG_CPU_LITTLE_ENDIAN
> > > >  KBUILD_CFLAGS  +=3D -mlittle-endian
> > > > @@ -389,8 +384,6 @@ vdso_prepare: prepare0
> > > >                 $(build)=3Darch/powerpc/kernel/vdso include/generat=
ed/vdso64-offsets.h)
> > > >  endif
> > > >
> > > > -archprepare: checkbin
> > > > -
> > > >  archheaders:
> > > >         $(Q)$(MAKE) $(build)=3Darch/powerpc/kernel/syscalls all
> > > >
> > > > @@ -405,16 +398,3 @@ else
> > > >         $(eval KBUILD_CFLAGS +=3D -mstack-protector-guard-offset=3D=
$(shell awk '{if ($$2 =3D=3D "TASK_CANARY") print $$3;}' include/generated/=
asm-offsets.h))
> > > >  endif
> > > >  endif
> > > > -
> > > > -PHONY +=3D checkbin
> > > > -# Check toolchain versions:
> > > > -# - gcc-4.6 is the minimum kernel-wide version so nothing required=
.
> > > > -checkbin:
> > > > -       @if test "x${CONFIG_LD_IS_LLD}" !=3D "xy" -a \
> > > > -               "x$(call ld-ifversion, -le, 22400, y)" =3D "xy" ; t=
hen \
> > > > -               echo -n '*** binutils 2.24 miscompiles weak symbols=
 ' ; \
> > > > -               echo 'in some circumstances.' ; \
> > > > -               echo    '*** binutils 2.23 do not define the TOC sy=
mbol ' ; \
> > > > -               echo -n '*** Please use a different binutils versio=
n.' ; \
> > > > -               false ; \
> > > > -       fi
> > > > diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
> > > > index 4de71cbf6e8e..c53618c34b70 100644
> > > > --- a/arch/powerpc/lib/Makefile
> > > > +++ b/arch/powerpc/lib/Makefile
> > > > @@ -42,7 +42,7 @@ obj-$(CONFIG_FUNCTION_ERROR_INJECTION)        +=
=3D error-inject.o
> > > >  # 64-bit linker creates .sfpr on demand for final link (vmlinux),
> > > >  # so it is only needed for modules, and only for older linkers whi=
ch
> > > >  # do not support --save-restore-funcs
> > > > -ifeq ($(call ld-ifversion, -lt, 22500, y),y)
> > > > +ifndef CONFIG_LD_IS_BFD
> > > >  extra-$(CONFIG_PPC64)  +=3D crtsavres.o
> > > >  endif

This test got inverted for LLD now AFAIKS?

Does LLVM support --save-restore-funcs and supply .sfpr already I
wonder? We could remove this stuff entirely.

Thanks,
Nick
