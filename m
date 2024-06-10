Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0008902AF2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 23:53:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d7UoyBUE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vylsv4Gn0z3cGM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 07:53:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d7UoyBUE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VylsC23Ydz30VR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 07:52:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F22860C2D
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2024 21:52:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8931DC4AF50
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2024 21:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718056349;
	bh=KwfkgeDlNv1zZzkoeeLT17qKczH27D/OOuSnpz5Uxjg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d7UoyBUEEZGy2FK4Ph6odRIYGqwZ/02syvCXQqoz4uWIHoSyfqLMe56oUC737qTXc
	 jo31OtTDhrtTwd96vMSByasQEqMHfACABLmtgGtsox54LD6k+UbzPv2pNWXJlUsL/8
	 CHTFn6y3PqJmN8BFcf/K5TES3CTjA9S82ZOuNrWOwEvoHUaVdS9CK9a071VAusLZpD
	 4Rci34vIulObWFXrIZBNUiu08AzebCxxf7c9xVRqqhdFPqXSRko5Y/O4xNUohWM1bl
	 uRuGdaZkvLEgBrrpR9D/w4ZgsjdAsMNdvAfg7FMOSJCSB5QXuuY35+XOkLAuGFMkLJ
	 ku25Qq9GbqflQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52c82101407so3730563e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2024 14:52:29 -0700 (PDT)
X-Gm-Message-State: AOJu0YwElRJdJH+KY2gcdYnfEtHcG0XHyqI3zdSEtRl9nAUN18bOUGWZ
	8yJA94QO0LdGWbSQnoo0IYeZ83/9AtWC8DManA+GnpfOr7nrizaB0bGZdoC0kPnE17zPRlH3lm7
	Kuh4sEQ/WbhM2k2F2I1apa+QCaUM=
X-Google-Smtp-Source: AGHT+IE3uOvnEO1d2Pr2OacsiI4MpQePJaM/SDvHiVwn+MLUcfuCdyq6WKhsiSS+s1uBxScGXR0jFYq/3nBc80ijrH0=
X-Received: by 2002:a05:6512:2211:b0:52b:bf92:bcd with SMTP id
 2adb3069b0e04-52bbf920ca9mr9385299e87.22.1718056348177; Mon, 10 Jun 2024
 14:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1718008093.git.naveen@kernel.org> <a4f44ffeb6f0327639175f8aac61cd21bc23150b.1718008093.git.naveen@kernel.org>
 <CAK7LNARc2SYfNQjo78rYSc5ODmNcmBgxPjp2v6ceWju4QnxbKA@mail.gmail.com> <a3awlvqgr4quory52btf3zq7wyvgtttjjk5qjidumktcre6myw@geiennjv7pic>
In-Reply-To: <a3awlvqgr4quory52btf3zq7wyvgtttjjk5qjidumktcre6myw@geiennjv7pic>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 11 Jun 2024 06:51:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNASUiOq9otgZ4XC+9rc14S2hw+uBnToz=ig15ZH=kMRPpg@mail.gmail.com>
Message-ID: <CAK7LNASUiOq9otgZ4XC+9rc14S2hw+uBnToz=ig15ZH=kMRPpg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] kbuild: Add generic hook for architectures to
 use before the final vmlinux link
To: Naveen N Rao <naveen@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2024 at 2:20=E2=80=AFAM Naveen N Rao <naveen@kernel.org> wr=
ote:
>
> On Mon, Jun 10, 2024 at 06:14:51PM GMT, Masahiro Yamada wrote:
> > On Mon, Jun 10, 2024 at 5:39=E2=80=AFPM Naveen N Rao <naveen@kernel.org=
> wrote:
> > >
> > > On powerpc, we would like to be able to make a pass on vmlinux.o and
> > > generate a new object file to be linked into vmlinux. Add a generic p=
ass
> > > in link-vmlinux.sh that architectures can use for this purpose.
> > > Architectures need to select CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX and m=
ust
> > > provide arch/<arch>/tools/vmlinux_o.sh, which will be invoked prior t=
o
> > > the final vmlinux link step.
> > >
> > > Signed-off-by: Naveen N Rao <naveen@kernel.org>
> > > ---
> > >  arch/Kconfig            |  3 +++
> > >  scripts/link-vmlinux.sh | 18 +++++++++++++++---
> > >  2 files changed, 18 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/arch/Kconfig b/arch/Kconfig
> > > index 975dd22a2dbd..649f0903e7ef 100644
> > > --- a/arch/Kconfig
> > > +++ b/arch/Kconfig
> > > @@ -1643,4 +1643,7 @@ config CC_HAS_SANE_FUNCTION_ALIGNMENT
> > >  config ARCH_NEED_CMPXCHG_1_EMU
> > >         bool
> > >
> > > +config ARCH_WANTS_PRE_LINK_VMLINUX
> > > +       def_bool n
> > > +
> > >  endmenu
> > > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> > > index 46ce5d04dbeb..07f70e105d82 100755
> > > --- a/scripts/link-vmlinux.sh
> > > +++ b/scripts/link-vmlinux.sh
> ...
> > >
> > > +arch_vmlinux_o=3D""
> > > +if is_enabled CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX; then
> > > +       arch_vmlinux_o=3D.arch.vmlinux.o
> > > +       info "ARCH" ${arch_vmlinux_o}
> > > +       if ! ${srctree}/arch/${SRCARCH}/tools/vmlinux_o.sh ${arch_vml=
inux_o} ; then
> > > +               echo >&2 "Failed to generate ${arch_vmlinux_o}"
> > > +               echo >&2 "Try to disable CONFIG_ARCH_WANTS_PRE_LINK_V=
MLINUX"
> > > +               exit 1
> > > +       fi
> > > +fi
> >
> >
> >
> > This is wrong because scripts/link-vmlinux.sh is not triggered
> > even when source files under arch/powerpc/tools/ are changed.
> >
> > Presumably, scripts/Makefile.vmlinux will be the right place.
>
> Ah, yes. Something like this?
>
> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> index 49946cb96844..77d90b6ac53e 100644
> --- a/scripts/Makefile.vmlinux
> +++ b/scripts/Makefile.vmlinux
> @@ -22,6 +22,10 @@ targets +=3D .vmlinux.export.o
>  vmlinux: .vmlinux.export.o
>  endif
>
> +ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
> +vmlinux: $(srctree)/arch/$(SRCARCH)/tools/vmlinux_o.sh
> +endif
> +
>  ARCH_POSTLINK :=3D $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postli=
nk)
>
>  # Final link of vmlinux with optional arch pass after final link
>
>
> Thanks,
> Naveen
>



No.

Something like below.

Then, you can do everything in Makefile, not a shell script.



ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
vmlinux: .arch.vmlinux.o

.arch.vmlinux.o: FORCE
        $(Q)$(MAKE) $(build)=3Darch/$(SRCARCH)/tools .arch.vmlinux.o

endif



I did not test it, though.








--=20
Best Regards
Masahiro Yamada
