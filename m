Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B976AABE6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Mar 2023 19:36:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PTYSx1LKGz3f3l
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 05:36:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BT9lK3gg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com; envelope-from=hurricos@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BT9lK3gg;
	dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PTYRz0k7dz30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Mar 2023 05:35:25 +1100 (AEDT)
Received: by mail-oi1-x22e.google.com with SMTP id bk32so4222021oib.10
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Mar 2023 10:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELt6unPUspT7UHJpSi3K6B41vFsf+FRWMR6egZLo5WM=;
        b=BT9lK3ggaM37VQYb3U0ar4slqMEVL/XkIrJ95bAsNpWUpY0RZPCxXrgyS1ZJGZAA2w
         76QT5+htJJ2l86778VR2v0b7ZfPZ6xTHEwYZO0Q2HFF2YU/vJvG/sBNZSCWBh6cGPJYl
         11HFjOD7Vw34kIg3lMpUmFS0OC0W6UCV1rlAeWMq0SALm6L40eJYfIoofoOIfORh/hdE
         IJ7y8nBBmMpzaf+SqoaPQrLw/DY/TfFqwtrIUDeJ/e431qyesMoj4LB2J5WgxkQGnfOH
         CDQlqxNzN213pr/otmJgU+iE8noiu1czPUADdcEACHZxqMozlu/gmBCl9HSn4dbb8HwJ
         33AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELt6unPUspT7UHJpSi3K6B41vFsf+FRWMR6egZLo5WM=;
        b=yCrs3RKKZQ/X8UZNib0UikbKnb5NHrwRgXfRebsm6lhXls1LOiptnJAXP968Ll1kgC
         gH3kgMbXAURYnaASNphxgxVJ4IVv1M3JSYH+m1YfM96mNOsq8XUKj4/QLSpADcmXJ/jn
         4LgVv94OGXKHo23cYPIaBzXeHgkG3pWSGyFwsIAD0q/jGjCs0CcHU6L9LdFRxB7uoAcs
         Bor0n/vp2dd2keVEpMFXH4ZYHa72rBxPDfL3UtlZ5RDcZFfVi9rlU6bUlkDdaH83060c
         pIN+7SHdN8+x1SLjd6C/mCZIbGlD0z9C248qt21pCTXad9VROmw7xcc4Hp5xejZpsB4u
         7blA==
X-Gm-Message-State: AO0yUKXQ6YlApkj/afvCxqMCF2ampFQt/P2lZ+lFJTvGCPqsKrnsQ3VK
	lYrYynUvue88r2opsA3L4XNepe1yE22jKZcCRUk=
X-Google-Smtp-Source: AK7set/vY+sbf8zdR7wGtENu0vpVLn5ScVX0pz6jsCZKi5aKH86cc89+lyOQXkphIjlbAeq/qAwFCl2mRnkN/2HDZtw=
X-Received: by 2002:a05:6808:64e:b0:384:1874:e0ee with SMTP id
 z14-20020a056808064e00b003841874e0eemr1813469oih.7.1677954920628; Sat, 04 Mar
 2023 10:35:20 -0800 (PST)
MIME-Version: 1.0
References: <AM0PR04MB6289FA528F76DDADB2BB0F958FA89@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <Y/o8bQz5CuRhdD8B@windriver.com> <CADRPPNRTZmhEbS0Ts6iA7bmviT_C+caUkyFwJ5WGcN6q1rTORg@mail.gmail.com>
 <1b9d4d586ae7bb5cddbb97fbc9ec7de1c475afee.camel@infinera.com>
 <83565b97-8149-492e-8f22-e3722e659b98@app.fastmail.com> <a1e955cb-f48d-4630-6c9d-2fb3e2212aff@csgroup.eu>
 <ZAFHnaSN6F5ZYTO5@windriver.com> <3efa1e29-3be9-4047-beef-eb02762ae8db@app.fastmail.com>
 <2a48667f70276ad7097e898d439dea6a9c0b414b.camel@buserror.net>
 <7b1bf4dc-d09d-35b8-f4df-16bf00429b6d@csgroup.eu> <20230304093710.tjdqbvdfqg7bgnyv@pali>
In-Reply-To: <20230304093710.tjdqbvdfqg7bgnyv@pali>
From: Martin Kennedy <hurricos@gmail.com>
Date: Sat, 4 Mar 2023 13:35:08 -0500
Message-ID: <CANA18UwqhKpfCEdxFcwc6k3jCgW7cf=0_g9cQCt1pVOCZVBJpQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Leo Li <leoyang.li@nxp.com>, Crystal Wood <oss@buserror.net>, Paul Gortmaker <paul.gortmaker@windriver.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 4, 2023 at 4:37=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.org> wr=
ote:
>
> On Saturday 04 March 2023 07:31:49 Christophe Leroy wrote:
> > Le 03/03/2023 =C3=A0 20:41, Crystal Wood a =C3=A9crit :
> > > On Fri, 2023-03-03 at 10:14 +0100, Arnd Bergmann wrote:
> > >> On Fri, Mar 3, 2023, at 02:04, Paul Gortmaker wrote:
> > >>> 01/03/2023 (Wed 14:23) Christophe Leroy wrote:
> > >>>> Le 28/02/2023 ?? 18:51, Arnd Bergmann a ??crit??:
> > >>>> Hope it clarifies how those reference boards are used.
> > >>>
> > >>> It was really useful input and gave an insight into how things get =
used.
> > >>>
> > >>> But let me put a slightly different slant on things.  If there is n=
o
> > >>> maintainer for the platform/architecture/CPU, then where is the
> > >>> obligation for mainline to keep it up to date just for your company=
 to
> > >>> use the code/BSP as a reference?
> > >>>
> > >>> Do they continue to do this for one more year, or three or ...  ???
> > >>> Does someone list themselves in MAINTAINERS for arch/powerpc/83xx ?
> > >> ...
> > >>>
> > >>> If you see change 0123abcdef breaks boot on your platform, you have=
 a
> > >>> legit voice to gripe about it right then and there.  Don't wait!!!
> > >>
> > >> I think the answer here is that Christophe is already the only perso=
n
> > >> that does this, so he is the de-facto maintainer for ppc32 regardles=
s
> > >> of whether he wants himself listed in the file or not:
> > >>
> > >> $ git log --no-merges --format=3D"%an" v5.0.. arch/powerpc/platforms=
/[458e]* |
> > >> sort | uniq -c | sort -rn | grep -vw 1
> > >>       61 Christophe Leroy
> > >>       12 Michael Ellerman
> > >>       11 Thomas Gleixner
> > >>       11 Oliver O'Halloran
> > >>       11 Liang He
> > >>        7 Uwe Kleine-K=C3=B6nig
> > >>        6 Nick Child
> > >>        4 Rasmus Villemoes
> > >>        4 Randy Dunlap
> > >>        4 Mike Rapoport
> > >>        4 Julia Lawall
> > >>        4 Andy Shevchenko
> > >>        3 Xiaoming Ni
> > >>        3 Nicholas Piggin
> > >>        3 Marc Zyngier
> > >>        3 Christophe JAILLET
> > >>        3 Christoph Hellwig
> > >>        2 Paul Gortmaker
> > >>        2 Mathieu Malaterre
> > >>        2 Markus Elfring
> > >>        2 Jordan Niethe
> > >>        2 Dmitry Torokhov
> > >>        2 Arnd Bergmann
> > >>
> > >> Pretty much everyone else on the list above only did treewide
> > >> cleanups, dead code removal or compile-time fixes, while Christophe
> > >> is the one that fixed machine specific bugs and added new features.
> > >
> > > Speaking of that, I'd be fine with Christophe replacing me in the "LI=
NUX FOR
> > > POWERPC EMBEDDED PPC83XX AND PPC85XX" entry, given that he's been way=
 more
> > > involved than me lately.
> >
> > MPC83XX yes I can, I have MPC8321E Hardware, but PPC85XX I'm not sure. =
I
> > don't know much more than what I can experiment with QEMU.
> >
> > Maybe Pali for MPC85XX ?
> >
> > Christophe
>
> I have P2020 SMP HW (mpc85xx platform) which I use on daily usage. So yes=
, I can help.
>
> Martin Kennedy has other P1/P2 mpc85xx hardware and is working on Linux
> support for it. So maybe can be interested in this discussion. I'm CCing.

I have mpc85xx hardware, mostly access points adapted from the
P1020WLAN board, but I am frankly a hobbyist. I do my work under
OpenWrt, and I have no relationship with the manufacturers of these
devices.

I only catch regressions on my boards when changes are backported to
the LTS kernel OpenWrt uses (so, presently, 5.15).

Martin
