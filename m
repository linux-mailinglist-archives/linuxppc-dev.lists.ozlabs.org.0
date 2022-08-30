Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E675A67D6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 18:03:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHBtC04p4z3cCL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 02:03:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=ot8Tg+6/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=210.131.2.91; helo=conssluserg-06.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=ot8Tg+6/;
	dkim-atps=neutral
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com [210.131.2.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHBsZ2575z3bkh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 02:02:41 +1000 (AEST)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42]) (authenticated)
	by conssluserg-06.nifty.com with ESMTP id 27UG2Ji8011018
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 01:02:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 27UG2Ji8011018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1661875340;
	bh=H2q6GsBXBNOWOoYdMHQTssZI3S7WHvmPpJBukTaedbs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ot8Tg+6/1s1kmiJLw1ydznab3YOfSiNXdCuw44p+8JjqI2khZ0fujC+26zRSDhwWe
	 DriNnvPcUk8ZlxIwtzCJJTdzcfp1ikChCPhVm/QlpNc1URRYswQsxeFvz5Y0qsraMP
	 mRYwQADHO0SyShIr1WqN8KD2TMDqPbWQh1GNhTUmGsblS/tgNY0MijCVFg6p3111gU
	 wRjbSA8tvEKeD4emv1i5AmDFdHLz+rOxkLH6z7nPhgTmoH3VbBtN1+G4F3L05FzzDm
	 OfKjq5LyGqtgjxTxAV0M3OFc0698u7R1tn7uq7E9V4GsqZZBw2ddZKaChAlqfY6RKf
	 1WgBF7+vpczlw==
X-Nifty-SrcIP: [209.85.160.42]
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-11ba6e79dd1so17728975fac.12
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 09:02:19 -0700 (PDT)
X-Gm-Message-State: ACgBeo2qDggNCSGd2ebEn7I4dV7PPCpSXvHGdJo9IaJ5ZAUB8qoaH2zi
	ZnfIW+VteGUp4wDzZYJosl51Jwhj/PYd0Naq/jk=
X-Google-Smtp-Source: AA6agR6MoD4lCTIAFc8q3Sk8P7vy+Sb/2h4auKZ7ZeB5eFyZj15pT1A0AmZO39Wc+iLf5CYwY4KHo8nucUreL/XP98k=
X-Received: by 2002:a05:6870:c58b:b0:10b:d21d:ad5e with SMTP id
 ba11-20020a056870c58b00b0010bd21dad5emr10217645oab.287.1661875338862; Tue, 30
 Aug 2022 09:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220827164056.3365356-1-masahiroy@kernel.org>
 <58a90319-668f-7c87-4168-e0df10644aa7@csgroup.eu> <CAK7LNATJiQc5HMdsct1S5z15-b1fzc5-Y2xtBs6oT17Na79H_w@mail.gmail.com>
 <7daf34ca-ed5e-90ea-8ccc-6821127cbd96@csgroup.eu> <87o7w2j9jn.fsf@mpe.ellerman.id.au>
In-Reply-To: <87o7w2j9jn.fsf@mpe.ellerman.id.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 31 Aug 2022 01:01:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNASshE1zomfsvJf61YrAWH-AfFzx8y_NBey5MWH+3G4gvQ@mail.gmail.com>
Message-ID: <CAK7LNASshE1zomfsvJf61YrAWH-AfFzx8y_NBey5MWH+3G4gvQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc: clean up binutils version check
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Alexey Dobriyan <adobriyan@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 30, 2022 at 7:44 PM Michael Ellerman <mpe@ellerman.id.au> wrote=
:
>
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> > Le 27/08/2022 =C3=A0 20:03, Masahiro Yamada a =C3=A9crit :
> >> On Sun, Aug 28, 2022 at 2:37 AM Christophe Leroy
> >> <christophe.leroy@csgroup.eu> wrote:
> >>> Le 27/08/2022 =C3=A0 18:40, Masahiro Yamada a =C3=A9crit :
> >>>> The checkbin in arch/powerpc/Makefile errors out if ld <=3D 2.24.
> >>>> So, the requirement on PPC is binutils >=3D 2.25. It is cleaner to
> >>>> specify it in scripts/min-tool-version.sh. If binutils < 2.25 is
> >>>> used, the toolchain check will fail in the Kconfig stage going
> >>>> forward.
> >>>>
> >>>> Since binutils >=3D 2.25 is already required, another version test
> >>>> for --save-restore-funcs on PPC64 is always met.
> ...
> >>>> diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.=
sh
> >>>> index 250925aab101..7df9f2150ea1 100755
> >>>> --- a/scripts/min-tool-version.sh
> >>>> +++ b/scripts/min-tool-version.sh
> >>>> @@ -14,7 +14,13 @@ fi
> >>>>
> >>>>    case "$1" in
> >>>>    binutils)
> >>>> -     echo 2.23.0
> >>>> +     if [ "$SRCARCH" =3D powerpc ]; then
> >>>
> >>> Isn't this limitation only for ppc64le ?
> >>>
> >>> Refer commit 60e065f70bdb ("powerpc: Reject binutils 2.24 when buildi=
ng
> >>> little endian")
> >>
> >> I do not see any CONFIG check in the current checkbin.
> >>
> >> Refer commit a3ad84da0760 ("powerpc/toc: Future proof
> >> kernel toc")
> >
> > That's odd. There is no toc on PPC32.
>
> I think that's just a bug in a3ad84da0760.
>
> But that means we inadvertantly dropped support for 2.24 about 8 months
> ago, and no one noticed.
>
> Let's see what the responses are to Nick's proposal to increase the
> minimum to 2.25.1.
>
> cheers



Either way is fine with me, but in that case,
do I need to get a higher-level Ack from Linus?

The current one can go to the ppc tree
since apparently it does not affect any other arches.

--=20
Best Regards
Masahiro Yamada
