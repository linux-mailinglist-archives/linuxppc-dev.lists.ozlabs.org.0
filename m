Return-Path: <linuxppc-dev+bounces-1969-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 282F1998523
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 13:38:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPSST5n1mz2yQJ;
	Thu, 10 Oct 2024 22:38:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728560313;
	cv=none; b=XKFxYy7zJsElIgXlbSjuMuAdA7PzFCV18khwraAOQqBx4waiQ3LaGiyCe4KXoV4vI3juAAOBDlE0+gdYzkL8ropNYivH/MqMPuTSRpNOfma91gmXQsrQ81mZpAMGV4fxoo5ij6S4j39rcWeQtRLEjON/3j6TMLo5c1AArW4mRee2wn10fHlO6GqWGQSpxvxibvjd155fQr1eyQiJtSpU4hUOUxQhSLvZLjZENz9RogNKx8FwsQGCtrmlhIi8jrrupIb6oJ5N0Dfwh67qNxt0jE0LxRU16mjgQTSgimNOtj2Q6ke8EgN7X+t8jyf0t04PCovG3IruMCcjbYDdIfIybA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728560313; c=relaxed/relaxed;
	bh=koovmk3qfwAKw7/NBKELeaMwVaRFOihRPPXIo+dPsDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ciMc0TwQtBCLVulDodkuMKNmAxbezKxY0QBtNyRlZYIr/MUnF67MZhkAv8te5TPKYcJonW6w6HUWZ5lTDprbV9Df5is69Yz8LltoqKghv72L3WnUvNvYtuhgrG368Ks4PQgWBAOZ4AeedauXfTPI39C8hCAy+ni588KJy76dZCTYWwweIGc70D+DDOCdzlNZmzoxrTCtM8nQ3yc9No5JkL9MHmcJbtkfLMj8rL8utecRPvTr16ddDs9GLD8ZWZI/KkuV+8u3/hv6AXz8jeBzi0ihvHomUJMl+JrFCia4iaBSIeehDWP6mLWbMhIWWopzTANUA0+D+rQhrrLpwFKp6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r/+ROxQT; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r/+ROxQT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPSSS5Smwz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 22:38:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D984DA4416B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:38:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96AC5C4CED1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728560308;
	bh=EcW7dk1wSWnuz/T49S8ao1gJh4OZbqwJI580xsjo+jw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r/+ROxQTXVe/Wc1vwadx7014Ard+rMkAygWzGRUUvUGrCQmpFDxdZTYB74FYEYvkb
	 kmftzoSfUo8uRgD/Sh1NBaUF9WraVQxPNAc0NoZ+3yD4EBz98HYhWO7Ob+97COsOWD
	 2VOzzFjhm93phZLA+tZAfi9OftMdCxfSJWLF6cCexv0ppyLwcsYPre3jcBdZiVvZfk
	 BvbFj8qaTY/O4dDQZB2mW1EjDaQ7JTPPojEnHmjh8D128ISOnMqFFh0Jai2vqNgxiE
	 zEbLNnWTOYP3MLO4mtLhGLR6ttjDG7xNB0O6lFtfElo/fLCl5uzZqvJ6By+K099SWD
	 Ert80rTz+tRXg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53988c54ec8so1000544e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 04:38:28 -0700 (PDT)
X-Gm-Message-State: AOJu0YzqRhnFZ5NkGx0Xa6zpSOyEMBwjbjmcJzu8GeHF2LBwH/CIoBfr
	nDk6vkiudbu+eENRna2/lh6mcS4v+T6X1KfLmZgirp3zIVwjoG2v00ijWVgn3YK2TIB2nEpHSN/
	aE07uxFLvqWHh2GTEHwZYfhkxFrA=
X-Google-Smtp-Source: AGHT+IEIAeSx85GQg3WmZHRAR3Mc8OK0yGFm049Ltm6BeTKAuk4nRhXRGQZVZr/zNuugqKQ1CCwu37lOuAQuk1N8b0A=
X-Received: by 2002:a05:6512:2248:b0:535:6aa9:9855 with SMTP id
 2adb3069b0e04-539c4797433mr3902667e87.0.1728560307251; Thu, 10 Oct 2024
 04:38:27 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240915205648.830121-1-hbathini@linux.ibm.com>
 <20240915205648.830121-12-hbathini@linux.ibm.com> <CAK7LNAS9LPPxVOU55t2C_vkXYXK-8_2bHCVPWVxYdwrSrxCduw@mail.gmail.com>
 <beeea05a-7dfc-4506-9f20-7c8a4d1f4c85@linux.ibm.com>
In-Reply-To: <beeea05a-7dfc-4506-9f20-7c8a4d1f4c85@linux.ibm.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 10 Oct 2024 20:37:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNATFVmhfQv5Rb=Gkq=fST9+SmSFo_uPi4pB2ckC1qHdkqw@mail.gmail.com>
Message-ID: <CAK7LNATFVmhfQv5Rb=Gkq=fST9+SmSFo_uPi4pB2ckC1qHdkqw@mail.gmail.com>
Subject: Re: [PATCH v5 11/17] kbuild: Add generic hook for architectures to
 use before the final vmlinux link
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Naveen N. Rao" <naveen@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Nicholas Piggin <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Vishal Chourasia <vishalc@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 10, 2024 at 6:57=E2=80=AFPM Hari Bathini <hbathini@linux.ibm.co=
m> wrote:
>
>
> On 09/10/24 8:53 pm, Masahiro Yamada wrote:
> > On Mon, Sep 16, 2024 at 5:58=E2=80=AFAM Hari Bathini <hbathini@linux.ib=
m.com> wrote:
> >>
> >> From: Naveen N Rao <naveen@kernel.org>
> >>
> >> On powerpc, we would like to be able to make a pass on vmlinux.o and
> >> generate a new object file to be linked into vmlinux. Add a generic pa=
ss
> >> in Makefile.vmlinux that architectures can use for this purpose.
> >>
> >> Architectures need to select CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX and mu=
st
> >> provide arch/<arch>/tools/Makefile with .arch.vmlinux.o target, which
> >> will be invoked prior to the final vmlinux link step.
> >>
> >> Signed-off-by: Naveen N Rao <naveen@kernel.org>
> >> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> >> ---
> >>
> >> Changes in v5:
> >> * Intermediate files named .vmlinux.arch.* instead of .arch.vmlinux.*
> >>
> >>
> >>   arch/Kconfig             | 6 ++++++
> >>   scripts/Makefile.vmlinux | 7 +++++++
> >>   scripts/link-vmlinux.sh  | 7 ++++++-
> >>   3 files changed, 19 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/Kconfig b/arch/Kconfig
> >> index 975dd22a2dbd..ef868ff8156a 100644
> >> --- a/arch/Kconfig
> >> +++ b/arch/Kconfig
> >> @@ -1643,4 +1643,10 @@ config CC_HAS_SANE_FUNCTION_ALIGNMENT
> >>   config ARCH_NEED_CMPXCHG_1_EMU
> >>          bool
> >>
> >> +config ARCH_WANTS_PRE_LINK_VMLINUX
> >> +       def_bool n
> >
> >
> > Redundant default. This line should be "bool".
> >
> >
> >
> >
> >
> >
> >> +       help
> >> +         An architecture can select this if it provides arch/<arch>/t=
ools/Makefile
> >> +         with .arch.vmlinux.o target to be linked into vmlinux.
> >> +
> >>   endmenu
> >> diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> >> index 49946cb96844..edf6fae8d960 100644
> >> --- a/scripts/Makefile.vmlinux
> >> +++ b/scripts/Makefile.vmlinux
> >> @@ -22,6 +22,13 @@ targets +=3D .vmlinux.export.o
> >>   vmlinux: .vmlinux.export.o
> >>   endif
> >>
> >> +ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
> >> +vmlinux: arch/$(SRCARCH)/tools/.vmlinux.arch.o
> >
> > If you move this to arch/*/tools/, there is no reason
> > to make it a hidden file.
>
> Thanks for reviewing and the detailed comments, Masahiro.
>
> >
> >
> > vmlinux: arch/$(SRCARCH)/tools/vmlinux.arch.o
> >
> >
> >
> >
> >> +arch/$(SRCARCH)/tools/.vmlinux.arch.o: vmlinux.o
> >
> > FORCE is missing.
>
>
> I dropped FORCE as it was rebuilding vmlinux on every invocation
> of `make` irrespective of whether vmlinux.o changed or not..


It is because you did not add vmlinux.arch.S to 'targets'

See my comment in 12/17.

  targets +=3D vmlinux.arch.S


> Just curious if the changes you suggested makes FORCE necessary
> or FORCE was expected even without the other changes you suggested?


FORCE is necessary.

arch/powerpc/tools/Makefile must be checked every time.


When arch/powerpc/tools/ftrace-gen-ool-stubs.sh is changed,
vmlinux must be relinked.





> Thanks
> Hari




--
Best Regards
Masahiro Yamada

