Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F557749B08
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 13:44:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxZS42LYCz3c3g
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 21:44:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.177; helo=mail-yw1-f177.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxZRZ73pfz3bVJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 21:43:38 +1000 (AEST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5703cb4bcb4so7611607b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 04:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688643815; x=1691235815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3B1P5iTyw+q1EyirQ9/CZcpAFyHq3bZB1xtPbht2ZGU=;
        b=KHwYmzUXn2BdFfEfEjrme9eWfBpyX1nKnHjQYhHo2pFhm88o20d++QlwWo6ezFdoY4
         RF6px5PqOEZGFF2AGh1ajGKDOooac1ps2bmbn/NxeAANwiLuFwaJwwa+np4TEYU8sKEd
         9kbb67ZxHoccFXztk40Gk2AHZpb5tEqkqjEm4H9X2I2mTbOD0bQpNsLRO5zUhPN5Nc2W
         xbTu5JdBjD6K0QFP6H778bXXaX5nTi5wOeGBa8r06rKo/xwIxR+KBrflPgD1m9p9cMer
         +pbNfY6BKYRzbProAVvb+5JgSgaaFxU45cu241hsTmBjOWeQSG/nwLvzqoXUbzQPDxp6
         jM2Q==
X-Gm-Message-State: ABy/qLZmptnF+fTjHlBwO0tRFsKe5UpXA2vqXRM4XBE7ZTQZVPqXnck+
	PhKOo9KF8QS05dbkCoBQh3fR2LcalLEkkg==
X-Google-Smtp-Source: APBJJlEyLQesUgSXcyGTsRToBTsEI3JLwj0zTYRgYRRV5HQfoG/3ms448ScwyzhwuCkYw2o7ba6M/w==
X-Received: by 2002:a0d:d953:0:b0:54f:9cd0:990 with SMTP id b80-20020a0dd953000000b0054f9cd00990mr1908549ywe.18.1688643815169;
        Thu, 06 Jul 2023 04:43:35 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id v126-20020a0dd384000000b0057a02887d4esm282083ywd.100.2023.07.06.04.43.34
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 04:43:34 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-c4dd264359cso568054276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 04:43:34 -0700 (PDT)
X-Received: by 2002:a25:4f03:0:b0:bff:5852:b112 with SMTP id
 d3-20020a254f03000000b00bff5852b112mr1350536ybb.61.1688643814620; Thu, 06 Jul
 2023 04:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230705003024.1486757-1-bgray@linux.ibm.com> <4e94cb11-1f39-d631-fe0a-b945b301b77c@csgroup.eu>
 <06d642f1e1245df1c68b6bd5fbd288233be027bc.camel@linux.ibm.com> <CAMuHMdUO_qEd2oVCMRGDZML6COquu-5=pS9fnFQ4pax6G4vxGQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUO_qEd2oVCMRGDZML6COquu-5=pS9fnFQ4pax6G4vxGQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Jul 2023 13:43:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWL+1=dZHCXwxO7PmK8kU95Ey5boQrqCxUNQPed_5U+Hw@mail.gmail.com>
Message-ID: <CAMuHMdWL+1=dZHCXwxO7PmK8kU95Ey5boQrqCxUNQPed_5U+Hw@mail.gmail.com>
Subject: Re: [PATCH] rtc: Kconfig: select REGMAP for RTC_DRV_DS1307
To: Benjamin Gray <bgray@linux.ibm.com>
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
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 6, 2023 at 9:50=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
> On Thu, Jul 6, 2023 at 8:14=E2=80=AFAM Benjamin Gray <bgray@linux.ibm.com=
> wrote:
> > On Thu, 2023-07-06 at 05:13 +0000, Christophe Leroy wrote:
> > > Le 05/07/2023 =C3=A0 02:30, Benjamin Gray a =C3=A9crit :
> > > > The drivers/rtc/rtc-ds1307.c driver has a direct dependency on
> > > > struct regmap_config, which is guarded behind CONFIG_REGMAP.
> > > >
> > > > Commit 70a640c0efa7 ("regmap: REGMAP_KUNIT should not select
> > > > REGMAP")
> > > > exposed this by disabling the default pick unless KUNIT_ALL_TESTS
> > > > is
> > > > set, causing the ppc64be allnoconfig build to fail.
> > > >
> > > > Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> > > > ---
> > > >   drivers/rtc/Kconfig | 1 +
> > > >   1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > > > index ffca9a8bb878..7455ebd189fe 100644
> > > > --- a/drivers/rtc/Kconfig
> > > > +++ b/drivers/rtc/Kconfig
> > > > @@ -246,6 +246,7 @@ config RTC_DRV_AS3722
> > > >
> > > >   config RTC_DRV_DS1307
> > > >         tristate "Dallas/Maxim DS1307/37/38/39/40/41, ST M41T00,
> > > > EPSON RX-8025, ISL12057"
> > > > +       select REGMAP
> > >
> > > As far as I can see, REGMAP defaults to Y when REGMAP_I2C is
> > > selected.
> > > Can you explain more in details why you have to select it explicitely
> > > ?
> > > If there is something wrong with the logic, then the logic should be
> > > fixed instead of just adding a selection of REGMAP for that
> > > particular
> > > RTC_DRV_DS1307. Because others like RTC_DRV_ABB5ZES3 or
> > > RTC_DRV_ABEOZ9
> > > might have the exact same problem.
> >
> > Right, yeah, I don't want to assert this patch is the correct solution,
> > sending it was more to offer a fix and allow discussion if it should be
> > resolved some other way (so thanks for replying, I appreciate it).
> >
> > In terms of why I made this patch, the way I see it, if a config option
> > requires another config option be set, then "selects" is the natural
> > way of phrasing this dependency. "default" on the REGMAP side seems
> > weird. If it's a default, does that mean it can be overridden? But
> > RTC_DRV_DS1307 *requires* REGMAP; it's not just a "would be nice". The
> > build breaks without it.
> >
> > But maybe KConfig works differently to my assumptions. Maybe the
> > referenced patch that causes the build failure is actually incorrect
> > (CC Geert). I spoke with Joel Stanley (CC) and he indicated you're not
> > supposed to depend on REGMAP like KUnit does?
>
> Thanks for CCing me!
>
> Looks like I made a really silly mistake here: my patch not only allows
> the user to enable REGMAP manually (for the test), but also to disable
> it manually, regardless if there are users or not :-(
>
> I think the proper fix is to replace the "default y if ..." by
> "select REGMAP" for all users.

I have sent a patch to do so, followed by a few related fixes
https://lore.kernel.org/r/525c37a568b10623ffb2d108850afd7e37f9350e.16886434=
42.git.geert@linux-m68k.org

Thanks!


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
