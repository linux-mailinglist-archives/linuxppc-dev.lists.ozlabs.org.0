Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C19E326DA4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 16:44:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnrRN3sFtz3d3l
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Feb 2021 02:44:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=zaPKWwVU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.82;
 helo=conssluserg-03.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=zaPKWwVU; 
 dkim-atps=neutral
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com
 [210.131.2.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnrQx0CFZz3cYK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Feb 2021 02:43:36 +1100 (AEDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 11RFhBBc006800
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Feb 2021 00:43:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 11RFhBBc006800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1614440592;
 bh=9Bbuya5OLwd9CXPYjZ2K4mJy3xnCZuoMQAuWTWp7Dws=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zaPKWwVUB4MG14b3VtvOQWR0fOS1fjhsxx4ENWOGanHanpXxh2DfExIsykRuTOnAy
 08I6qsePaNCukp7ii+87oYitqj5SOkC34mcUeIjMnKnimfwiXl5/rG4l0VkZk70hEv
 AEsq9TlM+rswW/aEOEswfEkrvB9A39N1KmHhsj+DVnoNWwM5WAZzYnlZoXNuCVEIqI
 odRlvIcQc8vOuG7XYAwOJ0AgqQorQGviag9eqxVi+yJDam77byK699v/0LwEhJsIsz
 ZexkVesAqiMHGHlJUokLTuXtaWr9IYdd/wuBzPt62g4tBesKv/JunT0pJGHn8O8AIR
 c6KEhGblpnzWg==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id e9so5099425pjs.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 07:43:11 -0800 (PST)
X-Gm-Message-State: AOAM532z58z3A3zWoommTij4VnH/eIxRHuoWEsPMgzciWL05oI+k0RSS
 cEtKrhYcuNBSWF+obgKdlOf7RlER06jrIu/4vw8=
X-Google-Smtp-Source: ABdhPJxs4OZng8FebjBpFup2MaFnkLYA4Q00zjjmb4EZz+Lk6aleOqwS9qsrPzbTW+EglUQTTRkktXez2846SGvkoYs=
X-Received: by 2002:a17:902:bb87:b029:e1:d1f:2736 with SMTP id
 m7-20020a170902bb87b02900e10d1f2736mr7884830pls.1.1614440591117; Sat, 27 Feb
 2021 07:43:11 -0800 (PST)
MIME-Version: 1.0
References: <13741214-bafc-1ee5-4157-854c14dae17c@xenosoft.de>
 <CAOesGMgtAXPQRThhkF5QR25R+F68F5C_HSUvFPW0Wk1DcpCwvA@mail.gmail.com>
 <877dmythcr.fsf@mpe.ellerman.id.au>
 <CAOSf1CHQ=QDwH=J4kLYqboe481poa7EdbC6gzq29W7KYHhn1YQ@mail.gmail.com>
 <99f6d05a-d431-7444-bb0a-180c042c2afd@xenosoft.de>
 <e73a866b-f755-f227-e60a-4be05f467221@csgroup.eu>
 <93173e85-3663-8d79-ca4b-f38b505e6e05@xenosoft.de>
 <80696a7a-44fb-9ce0-76a4-42006ebe2928@csgroup.eu>
In-Reply-To: <80696a7a-44fb-9ce0-76a4-42006ebe2928@csgroup.eu>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 28 Feb 2021 00:42:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNASeMc-C6VZ3w=fJZRgfRH2pvZpFoo4XYFcxw8rMLWtEAg@mail.gmail.com>
Message-ID: <CAK7LNASeMc-C6VZ3w=fJZRgfRH2pvZpFoo4XYFcxw8rMLWtEAg@mail.gmail.com>
Subject: Re: Latest Git kernel doesn't compile because of the
 LINUX_VERSION_CODE issue
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Sasha Levin <sashal@kernel.org>, Darren Stevens <darren@stevens-zone.net>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 27, 2021 at 4:34 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
> Le 27/02/2021 =C3=A0 08:13, Christian Zigotzky a =C3=A9crit :
> > Hello Christophe,
> >
> > Thanks a lot for compiling the latest git kernel.
> >
> > I have solved the compiling issue through setting up a value for the SU=
BLEVEL variable in
> > "a/Makefile". Before it wasn't necessary to set up a value for the SUBL=
EVEL variable.
>
> I see, so it is a regression introduced by commit 9b82f13e7ef3 ("kbuild: =
clamp SUBLEVEL to 255").
>
> In the past there had already been such a regression at some point, which=
 had then been fixed by
> commit cacd54ef49b7 ("kbuild: Fix KERNELVERSION for empty SUBLEVEL or PAT=
CHLEVEL")
>
> Sasha, can you fix it ?



Thanks for catching this.

I submitted a patch:
https://lore.kernel.org/patchwork/patch/1385119/






> Thanks
> Christophe
>
>
> >
> > Cheers,
> > Christian
> >
> > On 26 February 21 at 5:10 pm, Christophe Leroy wrote:
> >>
> >>
> >> Le 26/02/2021 =C3=A0 13:34, Christian Zigotzky a =C3=A9crit :
> >>> Hello,
> >>>
> >>> I tried to compile the latest Git kernel today. Unfortunately it does=
n't compile.
> >>
> >> I have no such problem with latest git kernel.
> >>
> >> Christophe
> >>
> >>>
> >>> Error messages:
> >>>
> >>>    CC      arch/powerpc/kernel/udbg_16550.o
> >>> In file included from ./include/linux/stackprotector.h:10:0,
> >>>                   from arch/powerpc/kernel/smp.c:35:
> >>> ./arch/powerpc/include/asm/stackprotector.h: In function =E2=80=98boo=
t_init_stack_canary=E2=80=99:
> >>> ./arch/powerpc/include/asm/stackprotector.h:29:30: error: expected ex=
pression before =E2=80=98;=E2=80=99 token
> >>>    canary ^=3D LINUX_VERSION_CODE;
> >>>                                ^
> >>> scripts/Makefile.build:271: recipe for target 'arch/powerpc/kernel/sm=
p.o' failed
> >>> make[2]: *** [arch/powerpc/kernel/smp.o] Error 1
> >>>
> >>> ----
> >>>
> >>> drivers/media/cec/core/cec-api.c: In function =E2=80=98cec_adap_g_cap=
s=E2=80=99:
> >>> drivers/media/cec/core/cec-api.c:85:35: error: expected expression be=
fore =E2=80=98;=E2=80=99 token
> >>>    caps.version =3D LINUX_VERSION_CODE;
> >>>
> >>> ----
> >>>
> >>> I have found the bad commit. It's "Merge tag 'kbuild-v5.12' of
> >>> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild"=
 [1]
> >>>
> >>> The changes in the Makefile (a/Makefile) are responsible for the comp=
iling errors. [2]
> >>>
> >>> I was able to revert this bad commit. After that it compiled without =
any problems.
> >>>
> >>> Could you please compile the latest Git kernel and confirm this issue=
?
> >>>
> >>> Thanks,
> >>> Christian
> >>>
> >>> [1]
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?id=3D6fbd6cf85a3be127454a1ad58525a3adcf8612ab
> >>>
> >>> [2]
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/di=
ff/Makefile?id=3D6fbd6cf85a3be127454a1ad58525a3adcf8612ab
> >>>



--=20
Best Regards
Masahiro Yamada
