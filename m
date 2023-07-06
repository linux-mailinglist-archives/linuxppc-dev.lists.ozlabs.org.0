Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A71F77496C9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 09:51:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxTH74cyRz3c3x
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 17:50:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.171; helo=mail-yb1-f171.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxTGc3Hj8z2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 17:50:30 +1000 (AEST)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-bd0a359ca35so348301276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 00:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688629827; x=1691221827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBI3tfdffNzea+PFNOGJvTbzqg9cb+gZyrTlNogDBJ8=;
        b=eltSbAo3bEU/WPH6LIl6UhtWi4NrGSMB+TT8YfO3Q+3L2OtQeMj2KIUh1h0LEZJnIK
         xaBblDpJPvUx7/7stdQdwzKCelaQBKXyzUSKvHdrLCTeBDVmHrJwK/naIW3MnpqDCaaq
         wD8XhkqA6b6AZW08hvE1/Jpx4qS0sCSmw+Qe808Z5uBq4zHkuGz1FkUs7yqhICpTsNWz
         reEPMYSYcTCfcBLgPkGqlnHXPNtfoojPfjWCAeZfzkXD//Z4Abl8EDdMRCLUpfgXzxvS
         wuDygFzFUwtY4YwGRakorZAgjik9Oso0IOzVeiJabAlY/rbt6ooFn2huapsu34g7DbUL
         bAxQ==
X-Gm-Message-State: ABy/qLbJTkKZFTdPKt6NpDhARdJF88UnjAYRmpkrEcoHSRJZYFu1H6b0
	iVnb7MhdxW5v0BTJc0E+ZpDe72QOUtraZA==
X-Google-Smtp-Source: APBJJlHrA2zK+kRoZk7kSdVqUP8+bOg8L71Kr/lYH1bWD9AR7K42FRxv5aOGgOIY0T3Zy7DWCRMYjw==
X-Received: by 2002:a81:a0d3:0:b0:579:f14f:50e0 with SMTP id x202-20020a81a0d3000000b00579f14f50e0mr1171492ywg.36.1688629827110;
        Thu, 06 Jul 2023 00:50:27 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id d199-20020a0ddbd0000000b005772fc5912dsm184831ywe.91.2023.07.06.00.50.26
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 00:50:26 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-c01e1c0402cso362476276.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 00:50:26 -0700 (PDT)
X-Received: by 2002:a5b:3c6:0:b0:c0f:c120:1a9b with SMTP id
 t6-20020a5b03c6000000b00c0fc1201a9bmr954054ybp.53.1688629826443; Thu, 06 Jul
 2023 00:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230705003024.1486757-1-bgray@linux.ibm.com> <4e94cb11-1f39-d631-fe0a-b945b301b77c@csgroup.eu>
 <06d642f1e1245df1c68b6bd5fbd288233be027bc.camel@linux.ibm.com>
In-Reply-To: <06d642f1e1245df1c68b6bd5fbd288233be027bc.camel@linux.ibm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Jul 2023 09:50:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUO_qEd2oVCMRGDZML6COquu-5=pS9fnFQ4pax6G4vxGQ@mail.gmail.com>
Message-ID: <CAMuHMdUO_qEd2oVCMRGDZML6COquu-5=pS9fnFQ4pax6G4vxGQ@mail.gmail.com>
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

Hi Benjamin,

On Thu, Jul 6, 2023 at 8:14=E2=80=AFAM Benjamin Gray <bgray@linux.ibm.com> =
wrote:
> On Thu, 2023-07-06 at 05:13 +0000, Christophe Leroy wrote:
> > Le 05/07/2023 =C3=A0 02:30, Benjamin Gray a =C3=A9crit :
> > > The drivers/rtc/rtc-ds1307.c driver has a direct dependency on
> > > struct regmap_config, which is guarded behind CONFIG_REGMAP.
> > >
> > > Commit 70a640c0efa7 ("regmap: REGMAP_KUNIT should not select
> > > REGMAP")
> > > exposed this by disabling the default pick unless KUNIT_ALL_TESTS
> > > is
> > > set, causing the ppc64be allnoconfig build to fail.
> > >
> > > Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> > > ---
> > >   drivers/rtc/Kconfig | 1 +
> > >   1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> > > index ffca9a8bb878..7455ebd189fe 100644
> > > --- a/drivers/rtc/Kconfig
> > > +++ b/drivers/rtc/Kconfig
> > > @@ -246,6 +246,7 @@ config RTC_DRV_AS3722
> > >
> > >   config RTC_DRV_DS1307
> > >         tristate "Dallas/Maxim DS1307/37/38/39/40/41, ST M41T00,
> > > EPSON RX-8025, ISL12057"
> > > +       select REGMAP
> >
> > As far as I can see, REGMAP defaults to Y when REGMAP_I2C is
> > selected.
> > Can you explain more in details why you have to select it explicitely
> > ?
> > If there is something wrong with the logic, then the logic should be
> > fixed instead of just adding a selection of REGMAP for that
> > particular
> > RTC_DRV_DS1307. Because others like RTC_DRV_ABB5ZES3 or
> > RTC_DRV_ABEOZ9
> > might have the exact same problem.
>
> Right, yeah, I don't want to assert this patch is the correct solution,
> sending it was more to offer a fix and allow discussion if it should be
> resolved some other way (so thanks for replying, I appreciate it).
>
> In terms of why I made this patch, the way I see it, if a config option
> requires another config option be set, then "selects" is the natural
> way of phrasing this dependency. "default" on the REGMAP side seems
> weird. If it's a default, does that mean it can be overridden? But
> RTC_DRV_DS1307 *requires* REGMAP; it's not just a "would be nice". The
> build breaks without it.
>
> But maybe KConfig works differently to my assumptions. Maybe the
> referenced patch that causes the build failure is actually incorrect
> (CC Geert). I spoke with Joel Stanley (CC) and he indicated you're not
> supposed to depend on REGMAP like KUnit does?

Thanks for CCing me!

Looks like I made a really silly mistake here: my patch not only allows
the user to enable REGMAP manually (for the test), but also to disable
it manually, regardless if there are users or not :-(

I think the proper fix is to replace the "default y if ..." by
"select REGMAP" for all users.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
