Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 985D5814E35
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 18:15:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pp0lD+H8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsG861gS0z3dL8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 04:15:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pp0lD+H8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsG7D0jpkz30hn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 04:15:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7AC55B82A5E
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 17:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB64C433C8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702660498;
	bh=s4dpcKFSOpffFMkLeUyk6a1Hqn70UOiGuwHq3pZ2x3M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pp0lD+H8LpkhU1gbKSJba+kSztqi0VqYD1rl0fOwE/NORkX9ChGns9bNNzrst+Xo2
	 louOv26Mj6n1EKNN/NY8GzwveRb9fER+eCudIYdzHMj/kUAlqo8A7FVTmOTcrFqdif
	 daKSQ6BZfsSTpRoZsTEneJ64xiUvH8GrrmLIwbBW9ZOpZ3B11jX9yI+BXtgl+uVW5/
	 NOC+43nfebfEuYBF7LcITZ0Asich2kam7TibasR9V5IU8kPfOk7H9Kyu842XFFHvXF
	 eNMWJ8z1yr5s3vFkV25rgoCE/GX9NLItg6eKGmxXXO6eV/s+8DjeFOFXcm1T0UbK6B
	 0q0uxBdKq0+yQ==
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6da5259e3a3so432760a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 09:14:58 -0800 (PST)
X-Gm-Message-State: AOJu0YyqtJqzp+Q6XS/KPpwx90wTdVXLiSLxeG4knhgq5gGJogHeBVnI
	5PHPCFsxSaPVHjLXDK+Ey1j0HsNYA2PuOKEdcHs=
X-Google-Smtp-Source: AGHT+IG/ffSXQejDqbvOPaP3pp3auTpYqO7TlQzwcixijWKSehFgrp3ZXIk1Q+mZdPXKJtKIb41MOV9edOYQWbYQJ/8=
X-Received: by 2002:a05:6871:750d:b0:1fb:19a:5d6 with SMTP id
 ny13-20020a056871750d00b001fb019a05d6mr14154078oac.59.1702660498202; Fri, 15
 Dec 2023 09:14:58 -0800 (PST)
MIME-Version: 1.0
References: <20231212161610.100862-1-matthias.schiffer@ew.tq-group.com>
 <CAK7LNAQhVJ6kYC_+LutUzE9m-dQmaZ2HnWbLcOj54w5LZJe2FA@mail.gmail.com> <a7ed5eddc674b0fcb7062af58c10d0190ccda2b8.camel@ew.tq-group.com>
In-Reply-To: <a7ed5eddc674b0fcb7062af58c10d0190ccda2b8.camel@ew.tq-group.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 16 Dec 2023 02:14:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNATuZ5w4+znxqUVEfyD0cCKHr+sd6Yr=R=kshxFqNYHnwA@mail.gmail.com>
Message-ID: <CAK7LNATuZ5w4+znxqUVEfyD0cCKHr+sd6Yr=R=kshxFqNYHnwA@mail.gmail.com>
Subject: Re: [PATCH] Reapply "kbuild: Create directory for target DTB"
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux@ew.tq-group.com" <linux@ew.tq-group.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 13, 2023 at 8:22=E2=80=AFPM Matthias Schiffer
<matthias.schiffer@ew.tq-group.com> wrote:
>
> On Tue, 2023-12-12 at 17:13 +0000, Masahiro Yamada wrote:
> >
> >
> > On Wed, Dec 13, 2023 at 1:17=E2=80=AFAM Matthias Schiffer
> > <matthias.schiffer@ew.tq-group.com> wrote:
> > >
> > > This reverts commit dd7699e37f289fa433f42c6bcc108468c8b198c0.
> > >
> > > On powerpc, dtb-y is usually empty unless CONFIG_OF_ALL_DTBS is set. =
While
> > > passing a DTB as a make target explicitly works fine, individual DTB
> > > builds may also be pulled in as dependencies by cuImage.% and similar
> > > targets. In this case, nothing creates the arch/powerpc/dts directory=
,
> > > causing out-of-tree builds to fail.
> > >
> > > Fixes: dd7699e37f28 ("Revert "kbuild: Create directory for target DTB=
"")
> > > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > > ---
> >
> >
> >
> > NACK.
> >
> > %.dtb is generated by if_changed_dep.
> >
> > Each Makefile is responsible for adding %.dtb to 'targets'
> > if it is pulled in as dependencies of other images.
> >
> > If it does not work for PowerPC, it is a bug in PowerPC Makefile.
> >
> >
> > Just checking arch/powerpc/boot/Makefile,
> > it adds dts/%.dtb and dts/fsl/%.dtb to 'targets'. [1] [2]
> >
> > cuImage.% should be file, but it does not cover all images.
> >
> > Fix arch/powerpc/boot/Makefile.
>
> Ah, thank you for the pointers, I did not quite get the meaning of those =
Makefile lines when first
> reading them. So the issue is that I'm trying to build a cuImage that is =
not added to image-y in the
> powerpc Makefile. It is unfortunate that this leads to a very confusing e=
rror message about the
> missing dts directory.
>
> I'll send a new patch if I come to the conclusion that I actually need th=
e cuImage (for the ancient
> TQM5200 which hasn't really been touched since 2011).




If your target image does not exist in arch/powerpc/boot/Makefile,
one solution might be CONFIG_EXTRA_TARGETS


I see the following code:

  image-y +=3D $(CONFIG_EXTRA_TARGETS)




Another solution might be:

  image-y +=3D $(filter dtbImage.% uImage.% cuImage.% simpleImage.%
treeImage.%, $(MAKECMDGOALS))




But, I did not test any of them.






> Regards,
> Matthias
>
>
> >
> >
> >
> > [1] https://github.com/torvalds/linux/blob/v6.7-rc5/arch/powerpc/boot/M=
akefile#L386
> > [2] https://github.com/torvalds/linux/blob/v6.7-rc5/arch/powerpc/boot/M=
akefile#L388
> >
> >
> >
> > >  scripts/Makefile.lib | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > > index 1a965fe68e011..3fe0fc46badfe 100644
> > > --- a/scripts/Makefile.lib
> > > +++ b/scripts/Makefile.lib
> > > @@ -389,7 +389,8 @@ $(obj)/%.dtbo.S: $(obj)/%.dtbo FORCE
> > >         $(call if_changed,wrap_S_dtb)
> > >
> > >  quiet_cmd_dtc =3D DTC     $@
> > > -cmd_dtc =3D $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $=
(dtc-tmp) $< ; \
> > > +cmd_dtc =3D mkdir -p $(dir ${dtc-tmp}) ; \
> > > +       $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-=
tmp) $< ; \
> > >         $(DTC) -o $@ -b 0 \
> > >                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS)=
 \
> > >                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
> > > --
> > > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld=
, Germany
> > > Amtsgericht M=C3=BCnchen, HRB 105018
> > > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stef=
an Schneider
> > > https://www.tq-group.com/
> > >
> >
> >
> > --
> > Best Regards
> >
> > Masahiro Yamada
> >
>
> --
> TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Ge=
rmany
> Amtsgericht M=C3=BCnchen, HRB 105018
> Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan S=
chneider
> https://www.tq-group.com/



--=20
Best Regards
Masahiro Yamada
