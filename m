Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F87A41AB58
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 11:01:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJYQV2cHHz305Y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 19:01:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.217.46; helo=mail-vs1-f46.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJYQ25bnSz2yJ9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 19:00:56 +1000 (AEST)
Received: by mail-vs1-f46.google.com with SMTP id 66so17243752vsd.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 02:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2LPnGpLh0Z/OFWhJ3bW6nNOAP+i5ywRc/ibvIJ8V0ZU=;
 b=v4PVMJIl7lzoZWZcu7kiwG1dyMEOsEl+ViKMDt3ASbIV42aLhf1W0sIY7WdaxUC2yM
 ksaWbn0ZHLlYZXnu5EBYLrhnCJKoKvAKBxggzFWkU9GTbsnPmPFj3Jot3ex72kzeRi94
 dE+EurmmckVFqpglx9KJOp/ngZWmxru7NFPiaoYbyBHLBNQxgK0VdYy/pFk3BuyjPNNf
 TDmuJx3h5fzcnmXrSSJTwGGBRCmiUvO1QChdN72ZDJxk0el+GXe2a1yRd5A93xHkGuA9
 XK74389vBaYn3aYrWAcvUgBDaXQaiIZTDp5dMeE9i3vYEDy51Dp2bsdLqy8qxwG7nCqu
 qIHQ==
X-Gm-Message-State: AOAM533Yv+Ne5gzS88okjVtnugGNIKyKQRVXSocGt0hPOyROZDfAIFir
 wjmziGP/0/j38x2K/V4RaiLBgl5wiD8dTGNffiE=
X-Google-Smtp-Source: ABdhPJyKCBGg8b+EUk7301gW1EQMjaY5eqfZE9QEHHk0EcY4l7Xt/v1Rn8gxQbSMp/ewzPBF7MH+2DTbO4Tgqmwiu4Y=
X-Received: by 2002:a67:cc1c:: with SMTP id q28mr3526995vsl.37.1632819653399; 
 Tue, 28 Sep 2021 02:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210921213930.10366-1-linkmauve@linkmauve.fr>
 <20210921213930.10366-2-linkmauve@linkmauve.fr>
 <CACPK8Xc+J0PbCdgheRxJbOVZ=OyyfsCA=cwkneMoboJLzC8TZQ@mail.gmail.com>
In-Reply-To: <CACPK8Xc+J0PbCdgheRxJbOVZ=OyyfsCA=cwkneMoboJLzC8TZQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Sep 2021 11:00:41 +0200
Message-ID: <CAMuHMdURNY5BRc6bfaYxX+k02w7mz2aRLOi9uW-qaoT3oBPFtQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] crypto: nintendo-aes - add a new AES driver
To: Joel Stanley <joel@jms.id.au>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.ne@posteo.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>, Ash Logan <ash@heyquark.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 22, 2021 at 4:12 AM Joel Stanley <joel@jms.id.au> wrote:
> On Tue, 21 Sept 2021 at 21:47, Emmanuel Gil Peyrot
> <linkmauve@linkmauve.fr> wrote:
> >
> > This engine implements AES in CBC mode, using 128-bit keys only.  It is
> > present on both the Wii and the Wii U, and is apparently identical in
> > both consoles.
> >
> > The hardware is capable of firing an interrupt when the operation is
> > done, but this driver currently uses a busy loop, I=E2=80=99m not too s=
ure
> > whether it would be preferable to switch, nor how to achieve that.
> >
> > It also supports a mode where no operation is done, and thus could be
> > used as a DMA copy engine, but I don=E2=80=99t know how to expose that =
to the
> > kernel or whether it would even be useful.
> >
> > In my testing, on a Wii U, this driver reaches 80.7 MiB/s, while the
> > aes-generic driver only reaches 30.9 MiB/s, so it is a quite welcome
> > speedup.
> >
> > This driver was written based on reversed documentation, see:
> > https://wiibrew.org/wiki/Hardware/AES
> >
> > Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> > Tested-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>  # on Wii U
> > ---
> >  drivers/crypto/Kconfig        |  11 ++
> >  drivers/crypto/Makefile       |   1 +
> >  drivers/crypto/nintendo-aes.c | 273 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 285 insertions(+)
> >  create mode 100644 drivers/crypto/nintendo-aes.c
> >
> > diff --git a/drivers/crypto/Kconfig b/drivers/crypto/Kconfig
> > index 9a4c275a1335..adc94ad7462d 100644
> > --- a/drivers/crypto/Kconfig
> > +++ b/drivers/crypto/Kconfig
> > @@ -871,4 +871,15 @@ config CRYPTO_DEV_SA2UL
> >
> >  source "drivers/crypto/keembay/Kconfig"
> >
> > +config CRYPTO_DEV_NINTENDO
> > +       tristate "Support for the Nintendo Wii U AES engine"
> > +       depends on WII || WIIU || COMPILE_TEST
>
> This current seteup will allow the driver to be compile tested for
> non-powerpc, which will fail on the dcbf instructions.
>
> Perhaps use this instead:
>
>        depends on WII || WIIU || (COMPILE_TEST && PPC)

Or:

    depends on PPC
    depends on WII || WIIU || COMPILE_TEST

to distinguish between hard and soft dependencies.

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
