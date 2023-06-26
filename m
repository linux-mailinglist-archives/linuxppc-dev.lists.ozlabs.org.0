Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DFC73D6EB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 06:42:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=TnLYX9fF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QqFZ83YsQz3bZ4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jun 2023 14:42:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=TnLYX9fF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqFY936GZz2ys3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 14:41:32 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6b72329b63eso2841059a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jun 2023 21:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687754489; x=1690346489;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjIjSBtwF6o7woy6Npq28vEiTf2tiatJf1eyfceP8+M=;
        b=TnLYX9fF5KeprRW3Kz4HAa5iaGoitIq1SE9Gi6/kpv3H2WwGmka5UYGfZDRIHiA9aB
         29aJ+EQLJMBw+FO55dCtwEoJy2eBpqZxij9V4hxSBz8wLHE+xpKhFwal4Jq/ovItuNZQ
         eC5rPYkQtQiuMI6H4bLib3AmBW7i1G2LIuh2gNmuoV3SsPbTq5qXcevkQaOTXSMA89PQ
         8wrjZgY1XDcImhYkYKN0S6WlJ7YqPG4DNp00CNjNtex/B8iQRJWK+QyRuunyqAXWsFe/
         DmHGtlbMVioKAUCmEaaTosr45t8j5etMfv1eCat0hvqRu3pbeQAkY8QYnh8Skg/zH1PO
         6Wkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687754489; x=1690346489;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IjIjSBtwF6o7woy6Npq28vEiTf2tiatJf1eyfceP8+M=;
        b=UCxdxSHWz2UDuyD+CWVH/6mgvogd+BatPIaDEAnFpkETIwgvTs0b4MrNALvpENrHcl
         FBlUjKFxCfeDE7lyFICy9ANsXz4fvDkh0zMTf9zgjE3G0YtZOWf07AXsOU6GaZgacyM/
         ODu/8qn9P1BYmk814YWbV6T0EB3D3aEeVbbDLXW21+SBythgcuoKDNR+3+xBPrRHLbL8
         jWAkcre2yVRmApuroCmxKv7Bw6NkwIdvLZf1nBpiq/+lBofQ2ndlNgyYKJa3Z058j9cZ
         m++JC5SgHgBEhIjd3LLS+k6U6V2WFxBEbkhGMONwuRxrNswqZEA6MctqCDAr80UI0p1W
         JQQA==
X-Gm-Message-State: AC+VfDySEDhyo74ujGcbaI9ZpHhmiPW1IEbdeE87eV4o1CNqA2atGtJx
	FasNc2wgarshb7HeFw6FTso=
X-Google-Smtp-Source: ACHHUZ4AB8+akzOG9NaJ7kF9YsaDyO733dStDUCkMDQ4+Chv0ieZyhsPU7l9BhtpBVSHOQm0SzYGGg==
X-Received: by 2002:a05:6808:168e:b0:39e:d559:61fc with SMTP id bb14-20020a056808168e00b0039ed55961fcmr27544563oib.30.1687754489238;
        Sun, 25 Jun 2023 21:41:29 -0700 (PDT)
Received: from localhost ([1.146.50.103])
        by smtp.gmail.com with ESMTPSA id rm8-20020a17090b3ec800b00259e553f59bsm5022722pjb.20.2023.06.25.21.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 21:41:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jun 2023 14:41:21 +1000
Message-Id: <CTMB151SAX64.1FMUHTKTUKWWE@wheely>
To: "Masahiro Yamada" <masahiroy@kernel.org>
Subject: Re: [PATCH] powerpc: remove checks for binutils older than 2.25
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.15.2
References: <20230119082250.151485-1-masahiroy@kernel.org>
 <CACPK8XeGsWN+2L57=dfQWOTSo8df7_qrxhwvV4Ho0rkhV=0vSw@mail.gmail.com>
 <CAK7LNAQWtDHOs=K+qznt5U1WiDv86tChkj4zOer4wtVRB974OA@mail.gmail.com>
 <CAK7LNAS=UCo_o-B0mgsR+SDb0sYwvQo90uag5sJ1UmB+8NqLjQ@mail.gmail.com>
 <CTM7K580U3T2.261RJKV58M653@wheely>
 <CAK7LNARx4exTpkCeR47T+XdF5-a7nLZ19p0R4tvnqyOT5y92XQ@mail.gmail.com>
In-Reply-To: <CAK7LNARx4exTpkCeR47T+XdF5-a7nLZ19p0R4tvnqyOT5y92XQ@mail.gmail.com>
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jun 26, 2023 at 1:11 PM AEST, Masahiro Yamada wrote:
> On Mon, Jun 26, 2023 at 10:58=E2=80=AFAM Nicholas Piggin <npiggin@gmail.c=
om> wrote:
> >
> > On Sun Jun 25, 2023 at 6:02 PM AEST, Masahiro Yamada wrote:
> > > On Thu, Jan 19, 2023 at 9:37=E2=80=AFPM Masahiro Yamada <masahiroy@ke=
rnel.org> wrote:
> > > >
> > > > On Thu, Jan 19, 2023 at 9:12 PM Joel Stanley <joel@jms.id.au> wrote=
:
> > > > >
> > > > > On Thu, 19 Jan 2023 at 08:24, Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
> > > > > >
> > > > > > Commit e4412739472b ("Documentation: raise minimum supported ve=
rsion of
> > > > > > binutils to 2.25") allows us to remove the checks for old binut=
ils.
> > > > > >
> > > > > > There is no more user for ld-ifversion. Remove it as well.
> > > > >
> > > > > ppc kernels fail to link with 2.27 under some configurations:
> > > > >
> > > > >  https://github.com/linuxppc/issues/issues/388
> > > > >
> > > > > We may want to use ld-ifversion to exclude that version.
> > > >
> > > >
> > >
> > >
> > > Ping?
> > >
> > >
> > >
> > >
> > > >
> > > > For LLD, CONFIG option is directly checked.
> >
> > Yeah, doesn't seem too difficult to add new linker version tests if nee=
ded.
> >
> > > >
> > > >
> > > > masahiro@zoe:~/ref/linux(master)$ git grep  CONFIG_LLD_VERSION
> > > > Makefile:ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 130000),y)
> > > > arch/riscv/Makefile:ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 15=
0000),y)
> > > > arch/x86/Makefile:ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 1300=
00),y)
> > > > scripts/Kbuild.include:# Usage: $(call test-lt, $(CONFIG_LLD_VERSIO=
N), 150000)
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > >
> > > > > >
> > > > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > > > > ---
> > > > > >
> > > > > >  arch/powerpc/Makefile     | 22 +---------------------
> > > > > >  arch/powerpc/lib/Makefile |  2 +-
> > > > > >  scripts/Makefile.compiler |  4 ----
> > > > > >  3 files changed, 2 insertions(+), 26 deletions(-)
> > > > > >
> > > > > > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > > > > > index dc4cbf0a5ca9..3d265b16c0ae 100644
> > > > > > --- a/arch/powerpc/Makefile
> > > > > > +++ b/arch/powerpc/Makefile
> > > > > > @@ -42,18 +42,13 @@ machine-$(CONFIG_PPC64) +=3D 64
> > > > > >  machine-$(CONFIG_CPU_LITTLE_ENDIAN) +=3D le
> > > > > >  UTS_MACHINE :=3D $(subst $(space),,$(machine-y))
> > > > > >
> > > > > > -# XXX This needs to be before we override LD below
> > > > > > -ifdef CONFIG_PPC32
> > > > > > -KBUILD_LDFLAGS_MODULE +=3D arch/powerpc/lib/crtsavres.o
> > > > > > -else
> > > > > > -ifeq ($(call ld-ifversion, -ge, 22500, y),y)
> > > > > > +ifeq ($(CONFIG_PPC64)$(CONFIG_LD_IS_BFD),yy)
> > > > > >  # Have the linker provide sfpr if possible.
> > > > > >  # There is a corresponding test in arch/powerpc/lib/Makefile
> > > > > >  KBUILD_LDFLAGS_MODULE +=3D --save-restore-funcs
> > > > > >  else
> > > > > >  KBUILD_LDFLAGS_MODULE +=3D arch/powerpc/lib/crtsavres.o
> > > > > >  endif
> > > > > > -endif
> > > > > >
> > > > > >  ifdef CONFIG_CPU_LITTLE_ENDIAN
> > > > > >  KBUILD_CFLAGS  +=3D -mlittle-endian
> > > > > > @@ -389,8 +384,6 @@ vdso_prepare: prepare0
> > > > > >                 $(build)=3Darch/powerpc/kernel/vdso include/gen=
erated/vdso64-offsets.h)
> > > > > >  endif
> > > > > >
> > > > > > -archprepare: checkbin
> > > > > > -
> > > > > >  archheaders:
> > > > > >         $(Q)$(MAKE) $(build)=3Darch/powerpc/kernel/syscalls all
> > > > > >
> > > > > > @@ -405,16 +398,3 @@ else
> > > > > >         $(eval KBUILD_CFLAGS +=3D -mstack-protector-guard-offse=
t=3D$(shell awk '{if ($$2 =3D=3D "TASK_CANARY") print $$3;}' include/genera=
ted/asm-offsets.h))
> > > > > >  endif
> > > > > >  endif
> > > > > > -
> > > > > > -PHONY +=3D checkbin
> > > > > > -# Check toolchain versions:
> > > > > > -# - gcc-4.6 is the minimum kernel-wide version so nothing requ=
ired.
> > > > > > -checkbin:
> > > > > > -       @if test "x${CONFIG_LD_IS_LLD}" !=3D "xy" -a \
> > > > > > -               "x$(call ld-ifversion, -le, 22400, y)" =3D "xy"=
 ; then \
> > > > > > -               echo -n '*** binutils 2.24 miscompiles weak sym=
bols ' ; \
> > > > > > -               echo 'in some circumstances.' ; \
> > > > > > -               echo    '*** binutils 2.23 do not define the TO=
C symbol ' ; \
> > > > > > -               echo -n '*** Please use a different binutils ve=
rsion.' ; \
> > > > > > -               false ; \
> > > > > > -       fi
> > > > > > diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makef=
ile
> > > > > > index 4de71cbf6e8e..c53618c34b70 100644
> > > > > > --- a/arch/powerpc/lib/Makefile
> > > > > > +++ b/arch/powerpc/lib/Makefile
> > > > > > @@ -42,7 +42,7 @@ obj-$(CONFIG_FUNCTION_ERROR_INJECTION)       =
 +=3D error-inject.o
> > > > > >  # 64-bit linker creates .sfpr on demand for final link (vmlinu=
x),
> > > > > >  # so it is only needed for modules, and only for older linkers=
 which
> > > > > >  # do not support --save-restore-funcs
> > > > > > -ifeq ($(call ld-ifversion, -lt, 22500, y),y)
> > > > > > +ifndef CONFIG_LD_IS_BFD
> > > > > >  extra-$(CONFIG_PPC64)  +=3D crtsavres.o
> > > > > >  endif
> >
> > This test got inverted for LLD now AFAIKS?
>
>
> In my understanding,
> For a BFD linker, use --save-restore-funcs.
> Otherwise (i.e. CONFIG_LD_IS_BFD is unset), link crtsavres.o to modules.
>
> I hope I did not change the logic.

I think I misread it, ignore me.
>
>
>
> >
> > Does LLVM support --save-restore-funcs and supply .sfpr already I
> > wonder? We could remove this stuff entirely.
>
> I don't know.
>
> If LLVM 11.0.0  (the minimum supported LLVM version) supports
> --save-restore-funcs, you can remove this check entirely.
> Even so, it should be done in a follow-up patch.

True. I don't have an lld < 14 to test, but 14 does accept the option
and emits the functions if needed. But my clang 14 does not even
generate calls to them so I assume earlier ones do not either. So we
might be able to get rid of this stuff. I'll open an issue for it.

> This patch is just dropping dead code for BFD linker < 2.25,
> which is now unsupported. Nothing else has changed (I believe).

Seems okay then.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

