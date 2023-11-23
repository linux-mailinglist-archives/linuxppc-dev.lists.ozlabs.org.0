Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5D27F5CB6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 11:44:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=Hqk4olzZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbZVl0QjNz3dV4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 21:44:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=Hqk4olzZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbZTv084Rz3bTN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 21:43:46 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5bd306f86a8so526159a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 02:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700736222; x=1701341022; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sXx1tqGc4gio/QqB9Zb7ckRSF4i2cZOS4lFJoNm/Vo=;
        b=Hqk4olzZFk5jkOpC0Q6DqucP1kWR2ja5RjrfYSrz8n4mvQNt4JNP9z6lmmZGX7+f9/
         wHfkf8moEUsfKsFeGNWce/CWGPvj80RK7bDPKquGDckjtwSpxxrNhDe7XJTD+yK+MN1d
         nFTmGM9bKWd2l7s5re326fddZH9lqfhctUTtJOTuecbx3F5wpZ0wI/s3MJKOGfd5RhJ4
         Nr21lnf1h8qlb1CPJntmL96CmpIc6C6LmaAhGih8nPP27t1ZnXYw/G697Pi4tIniCWju
         avof9uODWkHcLTzsdZwA1AnOVfCvYlYZfC4rEout46mb9bVEvbMim89sx4fHyufJJ30v
         u7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700736222; x=1701341022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sXx1tqGc4gio/QqB9Zb7ckRSF4i2cZOS4lFJoNm/Vo=;
        b=UVXK4jmR+l359j9RRwnBaUgj1uuPVxAZprySucJxdXdBBcRAgnVN8Tz3p+n4Jhuufb
         NNS49uP8xyt3mN3PwNauJTfxuNsQOBWJqjaN/Ci6pZKJ22aYmsxElYR1ec4BbDmf5sPz
         waScBJyqg+veWZUwBUP7WIme3giTwANS3qHJJRGpBGj7Tdffm/Jn1iFxO4d5ZpftLbSS
         9N6OtU80siDyacxMz709+cfZrZo+yFHW0+s5DKzOncX/nRVvFDr3EHCG7eFZ0s2rpcWa
         zA5jEGDyWbejK2zQEuWeoqvoE4v+imTKhEnhzQdzo+Z7S5YPfbX/BHD64ELE4RuZhFQJ
         KS5Q==
X-Gm-Message-State: AOJu0Yx61JcoZqDCmS8lQiRvBsQcfyYOw7PO0Mea0Pxwimqe+IIlC4SG
	WE2G44hZXAIAJ7ymUIeEidg7y1nKM5OdX2Ss9X/oyQ==
X-Google-Smtp-Source: AGHT+IGQemXED5MdhPDs8hDtb2L/rF6Iac2SFIvvm1TlJvtt3KBDFlw9g5du469cf44grjodKd7ZU/U/xKDe/AsrzAY=
X-Received: by 2002:a05:6a21:9982:b0:189:11e8:6237 with SMTP id
 ve2-20020a056a21998200b0018911e86237mr5725421pzb.51.1700736221598; Thu, 23
 Nov 2023 02:43:41 -0800 (PST)
MIME-Version: 1.0
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-4-apatel@ventanamicro.com> <8c0f4eba-1923-4686-b07b-1f3b78b298e9@sifive.com>
In-Reply-To: <8c0f4eba-1923-4686-b07b-1f3b78b298e9@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 23 Nov 2023 16:13:29 +0530
Message-ID: <CAK9=C2U7gD2DC+zTGvSb+6uhmA=Y-nL2Mpn8tbp8R81g_6ruEA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] tty/serial: Add RISC-V SBI debug console based earlycon
To: Samuel Holland <samuel.holland@sifive.com>
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
Cc: Jiri Slaby <jirislaby@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 22, 2023 at 4:11=E2=80=AFAM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Hi Anup,
>
> On 2023-11-17 9:38 PM, Anup Patel wrote:
> > We extend the existing RISC-V SBI earlycon support to use the new
> > RISC-V SBI debug console extension.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  drivers/tty/serial/Kconfig              |  2 +-
> >  drivers/tty/serial/earlycon-riscv-sbi.c | 24 ++++++++++++++++++++----
> >  2 files changed, 21 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> > index 732c893c8d16..1f2594b8ab9d 100644
> > --- a/drivers/tty/serial/Kconfig
> > +++ b/drivers/tty/serial/Kconfig
> > @@ -87,7 +87,7 @@ config SERIAL_EARLYCON_SEMIHOST
> >
> >  config SERIAL_EARLYCON_RISCV_SBI
> >       bool "Early console using RISC-V SBI"
> > -     depends on RISCV_SBI_V01
> > +     depends on RISCV_SBI
> >       select SERIAL_CORE
> >       select SERIAL_CORE_CONSOLE
> >       select SERIAL_EARLYCON
> > diff --git a/drivers/tty/serial/earlycon-riscv-sbi.c b/drivers/tty/seri=
al/earlycon-riscv-sbi.c
> > index 27afb0b74ea7..5351e1e31f45 100644
> > --- a/drivers/tty/serial/earlycon-riscv-sbi.c
> > +++ b/drivers/tty/serial/earlycon-riscv-sbi.c
> > @@ -15,17 +15,33 @@ static void sbi_putc(struct uart_port *port, unsign=
ed char c)
> >       sbi_console_putchar(c);
> >  }
> >
> > -static void sbi_console_write(struct console *con,
> > -                           const char *s, unsigned n)
> > +static void sbi_0_1_console_write(struct console *con,
> > +                               const char *s, unsigned int n)
> >  {
> >       struct earlycon_device *dev =3D con->data;
> >       uart_console_write(&dev->port, s, n, sbi_putc);
> >  }
> >
> > +static void sbi_dbcn_console_write(struct console *con,
> > +                                const char *s, unsigned int n)
> > +{
> > +     sbi_debug_console_write(n, __pa(s));
>
> This only works for strings in the linear mapping or the kernel mapping (=
not
> vmalloc, which includes the stack). So I don't think we can use __pa() he=
re.

In which case, we need extend sbi_debug_console_write() to
do the va-to-pa conversion for both earlycon-riscv-sbi.c and
hvc_riscv_sbi.c

>
> > +}
> > +
> >  static int __init early_sbi_setup(struct earlycon_device *device,
> >                                 const char *opt)
> >  {
> > -     device->con->write =3D sbi_console_write;
> > -     return 0;
> > +     int ret =3D 0;
> > +
> > +     if (sbi_debug_console_available) {
> > +             device->con->write =3D sbi_dbcn_console_write;
> > +     } else {
> > +             if (IS_ENABLED(CONFIG_RISCV_SBI_V01))
>
> "else if", no need for the extra block/indentation.

Okay, I will update.

>
> Regards,
> Samuel
>
> > +                     device->con->write =3D sbi_0_1_console_write;
> > +             else
> > +                     ret =3D -ENODEV;
> > +     }
> > +
> > +     return ret;
> >  }
> >  EARLYCON_DECLARE(sbi, early_sbi_setup);
>

Regards,
Anup
