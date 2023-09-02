Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAF6790590
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Sep 2023 08:19:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hIUKwpwm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rd4VJ1jZ2z3cBH
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Sep 2023 16:19:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hIUKwpwm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rd4TR1gPJz2yh4
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Sep 2023 16:18:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A63FD61681
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Sep 2023 06:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08789C433CA
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Sep 2023 06:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693635495;
	bh=S2JjhDQaQjCUBS5BoHwvNrpSReY7nD+6fFAceggH5L4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hIUKwpwmhpYMtn3fTmQXOATMfWHK5+QPj14H0A97QXLXMppSSF9eVXCHQIGuGPsDY
	 JjzSpA3VOzM9M2jNUI1NrIRu8zgcBXHLxoQM6oHLaopiRUU3znUlfC12Ro9UhBiyLx
	 uQT/EorLWHbocPK7E0C1R7T0Ceo4xuq7MBqd0VBTtdv+WbnaPLX7CNg9/sp8uC4d1q
	 E6nGabVyu+eSwVBRG+WRXgYyuhhV+6YVwCc4NAO2vfjaKe5QtdE0vr3jDD9pYrofL/
	 ZGRbk7ZUIJXJ2i3EKLtq2t4f9yRJMYPM7drBRGh6gbPpID1D4FJKbE/iBAkuyvuhrL
	 efRJeyXUxdCfw==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1c8d895a602so1722659fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Sep 2023 23:18:14 -0700 (PDT)
X-Gm-Message-State: AOJu0YzvT4EIN9ffCblrvL/+dHZWS2Feu2Tm/lvxdjQ9pL6QYA/SqKGn
	MgAvgDnYj18tGbUNxymlyEwXvjxTG4ETPqiobHA=
X-Google-Smtp-Source: AGHT+IESGICPQ/WBafsIpCkqlmLOntDrnFZ4mcqJsB8bb0Bsgx61YqGasOzlsnoQknaLtIFXHXJ++FKkRqersGaIAOU=
X-Received: by 2002:a05:6870:ac12:b0:1b7:3f07:e431 with SMTP id
 kw18-20020a056870ac1200b001b73f07e431mr5406945oab.54.1693635494264; Fri, 01
 Sep 2023 23:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230831191335.give.534-kees@kernel.org> <CAK7LNATENQQy6LrWS10S-EXsyAvTraSj2WA=O7rFsS9Ht6a+3g@mail.gmail.com>
 <202309011250.AB0DAA03@keescook>
In-Reply-To: <202309011250.AB0DAA03@keescook>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 2 Sep 2023 15:17:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQgcdwg_3Mtu_ZQYWLKPf5Pzm9syQkqxEDPmD6tic3J6A@mail.gmail.com>
Message-ID: <CAK7LNAQgcdwg_3Mtu_ZQYWLKPf5Pzm9syQkqxEDPmD6tic3J6A@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Show marked Kconfig fragments in "help"
To: Kees Cook <keescook@chromium.org>
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
Cc: linux-s390@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 2, 2023 at 4:50=E2=80=AFAM Kees Cook <keescook@chromium.org> wr=
ote:
>
> On Fri, Sep 01, 2023 at 04:58:37PM +0900, Masahiro Yamada wrote:
> > On Fri, Sep 1, 2023 at 4:13=E2=80=AFAM Kees Cook <keescook@chromium.org=
> wrote:
> > >
> > > Currently the Kconfig fragments in kernel/configs and arch/*/configs
> > > that aren't used internally aren't discoverable through "make help",
> > > which consists of hard-coded lists of config fragments. Instead, list
> > > all the fragment targets that have a "# Help: " comment prefix so the
> > > targets can be generated dynamically.
> > >
> > > Add logic to the Makefile to search for and display the fragment and
> > > comment. Add comments to fragments that are intended to be direct tar=
gets.
> > >
> > > Cc: Nicolas Schier <nicolas@fjasle.eu>
> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > Cc: Randy Dunlap <rdunlap@infradead.org>
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: x86@kernel.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > Cc: linux-riscv@lists.infradead.org
> > > Cc: linux-s390@vger.kernel.org
> > > Cc: linux-kbuild@vger.kernel.org
> > > Cc: linux-hardening@vger.kernel.org
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > > v3:
> > > - Use Makefile logic from Masahiro Yamada
> > > - Use "# Help: " prefix, but only on desired fragment targets
> > > v2: https://lore.kernel.org/all/20230825194329.gonna.911-kees@kernel.=
org
> > > v1: https://lore.kernel.org/all/20230824223606.never.762-kees@kernel.=
org
> > > ---
> > >  Makefile                                   |  1 -
> > >  arch/arm/configs/dram_0x00000000.config    |  1 +
> > >  arch/arm/configs/dram_0xc0000000.config    |  1 +
> > >  arch/arm/configs/dram_0xd0000000.config    |  1 +
> > >  arch/arm/configs/lpae.config               |  1 +
> > >  arch/arm64/configs/virt.config             |  1 +
> > >  arch/powerpc/configs/disable-werror.config |  1 +
> > >  arch/powerpc/configs/security.config       |  4 +++-
> > >  arch/riscv/configs/32-bit.config           |  1 +
> > >  arch/riscv/configs/64-bit.config           |  1 +
> > >  arch/s390/configs/btf.config               |  1 +
> > >  arch/s390/configs/kasan.config             |  1 +
> > >  arch/x86/Makefile                          |  4 ----
> > >  kernel/configs/debug.config                |  2 ++
> > >  kernel/configs/kvm_guest.config            |  1 +
> > >  kernel/configs/nopm.config                 |  2 ++
> > >  kernel/configs/rust.config                 |  1 +
> > >  kernel/configs/tiny.config                 |  2 ++
> > >  kernel/configs/x86_debug.config            |  1 +
> > >  kernel/configs/xen.config                  |  2 ++
> > >  scripts/kconfig/Makefile                   | 15 ++++++++++++---
> > >  21 files changed, 36 insertions(+), 9 deletions(-)
> > >
> >
> >
> > Just one thing.
> >
> >
> >
> >
> >
> > > diff --git a/kernel/configs/tiny.config b/kernel/configs/tiny.config
> > > index 00009f7d0835..60a4b6d80b36 100644
> > > --- a/kernel/configs/tiny.config
> > > +++ b/kernel/configs/tiny.config
> > > @@ -1,3 +1,5 @@
> > > +# Help: Size-optimized kernel image
> >
> >
> > I will drop this.
> >
> >
> > We already have a hard-coded help message.
> >
> >   tinyconfig   - Configure the tiniest possible kernel
> >
> >
> >
> >
> > Then, some lines below, again.
> >
> >   tiny.config               - Size-optimized kernel image
> >
> >
> >
> > tiny.config is for internal use for tinyconfig.
>
> Shall I send a v4, or did you fix this up already?


Locally fixed-up.

If nobody points out anything else,
you do not need to send v4.





--=20
Best Regards
Masahiro Yamada
