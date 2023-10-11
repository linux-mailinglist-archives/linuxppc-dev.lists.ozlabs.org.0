Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3A27C4975
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 07:53:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=L3XoScpO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S524N3Flzz3dhk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 16:53:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=L3XoScpO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S523K4BBwz3vfj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 16:52:13 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-58907163519so4854703a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 22:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697003531; x=1697608331; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uB2f3GYH/kpgRnRbL88LHcmeeqsYhInJn57hhNzYiD0=;
        b=L3XoScpOv/cwJdpX7stQfj6DWtpcc/UwN82k5rrE5Cgf8mmNrfqb5E6eb6o0ZgfNy+
         GISn417POW3ePGBDlfd4G72XnleaIdzWhP5KlI0u8uVnLgD4xjmVaRCRouCFYMdXiZir
         /QY3PDvBmqxrUVvSVZDlBvf8iNi/0gn6GqIATxsbtr4Sc/LpHagP1zmWKPozlZTi97qH
         09hVC0P60ltaeRmkzmbPyJ8qzhVsrXK0GpwL90X3hrXRuBJah6Zi/hlEZl+XHhSlgfUF
         4h5pPguICGQ6kNrhHk7Icn3MxfvEKj0dCD8fcXzhiyz/xOOiCWCOmxixADNcgnFkaVLW
         zWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697003531; x=1697608331;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uB2f3GYH/kpgRnRbL88LHcmeeqsYhInJn57hhNzYiD0=;
        b=X4Hkidot6J7fxGC5BywoM8gLltKSo3NASCJqq2kwb4JCIKV8M6taYkUPB9X8G1oXi1
         lf2XsX8pn3MuWGgGYZ7mDYaQr05yQYbBqPXRVSbgN4J0nMdy9HvD/CQFuNODQ6Lm2OCJ
         qIaO9eu55tuZ/weo8EbEPryR7ea9/sRzte+DRQv+G2jPVa90slgxhqwfkTh0rm+I+SKV
         9U05hTT+stM9TdrjPzThAwf3zfZQvZzVjEwUeoac9zYy2nxs66vxjE1+XQcqpEVyUUUg
         MRjCfuheSVAdixMddKnZdU3s32X2byGoZt1hMQIB7paOyU9ioJ6xdbOlWfXshqQpTOVo
         EHCA==
X-Gm-Message-State: AOJu0YyDHTQt8He5/OInmd8V2s+T2mq2U4Emf+ScgYdhWWXMwlcJPY/n
	qyGFiIh5X0KU5HaOgOkRXPxFyZjfijRAwoRle+RMlA==
X-Google-Smtp-Source: AGHT+IEeEqkGLmFo9PNY3EdvhcjfnAFjglTfyVtroZYi102GSplRjzRGVpjR04ewfA1Sji5L5yjrCQuQw30ii3vCSdo=
X-Received: by 2002:a05:6a20:914b:b0:158:7fdf:66df with SMTP id
 x11-20020a056a20914b00b001587fdf66dfmr25459333pzc.18.1697003530678; Tue, 10
 Oct 2023 22:52:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231010170503.657189-1-apatel@ventanamicro.com>
 <20231010170503.657189-5-apatel@ventanamicro.com> <2023101053-scholar-resolute-a9a0@gregkh>
In-Reply-To: <2023101053-scholar-resolute-a9a0@gregkh>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 11 Oct 2023 11:22:00 +0530
Message-ID: <CAK9=C2XDkYg4kVHFT4bLETBecSGgHkPaTW9wpzLEe_Fjg0UGVQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] tty/serial: Add RISC-V SBI debug console based earlycon
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: linux-serial@vger.kernel.org, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 10, 2023 at 10:46=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 10, 2023 at 10:35:01PM +0530, Anup Patel wrote:
> > We extend the existing RISC-V SBI earlycon support to use the new
> > RISC-V SBI debug console extension.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  drivers/tty/serial/Kconfig              |  2 +-
> >  drivers/tty/serial/earlycon-riscv-sbi.c | 35 ++++++++++++++++++++++---
> >  2 files changed, 32 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
> > index bdc568a4ab66..cec46091a716 100644
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
> > index 27afb0b74ea7..b1da34e8d8cd 100644
> > --- a/drivers/tty/serial/earlycon-riscv-sbi.c
> > +++ b/drivers/tty/serial/earlycon-riscv-sbi.c
> > @@ -10,22 +10,49 @@
> >  #include <linux/serial_core.h>
> >  #include <asm/sbi.h>
> >
> > +#ifdef CONFIG_RISCV_SBI_V01
> >  static void sbi_putc(struct uart_port *port, unsigned char c)
> >  {
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
> > +#endif
> > +
> > +static void sbi_dbcn_console_write(struct console *con,
> > +                                const char *s, unsigned int n)
> > +{
> > +     phys_addr_t pa =3D __pa(s);
> > +
> > +     sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> > +#ifdef CONFIG_32BIT
> > +               n, pa, (u64)pa >> 32,
> > +#else
> > +               n, pa, 0,
> > +#endif
>
> Again, no #ifdef in .c files please.

Okay, I will remove #ifdef from here as well.

>
> thanks,
>
> greg k-h

Thanks,
Anup
