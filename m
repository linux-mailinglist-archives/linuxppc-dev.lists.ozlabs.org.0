Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 777A37EF38A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 14:11:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=X5B1zyFP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWy3J2kkmz3dVm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 00:11:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=X5B1zyFP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=brainfault.org (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=anup@brainfault.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWy2N2n5Nz2xqH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 00:10:51 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6c34e87b571so1811105b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 05:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1700226647; x=1700831447; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKUefcBQ+EC714qLkuUiemu7uqNkdjRTt9mSK5vZdm4=;
        b=X5B1zyFPN973+wmsc4vyny4jZm+tv2/Jj7+6MU7wfOGmm9zUCfLKIFz5tDmj8Pl3f6
         09s6e3fdt6wiGaY0XZX5flR79W3dtJcbdp4lhPuEe7cV/8A2K/tidIJZPFQlJeDzVG+s
         8/0jXgzEJh/BBDFPD5oVvQNBmMl5HYYspXcq/AhXN9++4lU9z9u4j3iQNYRfiGeCq/sl
         fGAGPfPVQNVRfk6k/59LevrpbPUGzBTdOngF9pVqVLoiNCuJycZGl0D7CZmeWJkfNTqB
         hOQvwarjLjQZNVIhUQqFvgqc1Buq3pxfSfhdaK0JYCRfrwXFXt4fb6dBNXmx++77KJSM
         IpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700226647; x=1700831447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKUefcBQ+EC714qLkuUiemu7uqNkdjRTt9mSK5vZdm4=;
        b=QCjjL8bkBY5MJml7XhPQ4D3P9ZPyb6w9fXt9F7vQFVZgknYXHuO2PWI7HjtelXbRft
         JQ7R0U6AZRICkXd3+hkWI2uxxdSyCSa+hXAYbWGgr6UtxV+1wAHe7gymVJPfddU9FGeY
         dpKmBUpszH5T+Qn2DKXLExkznGdRb5TSbf93jQTu4zTFnPkYMBdjQBNYtZ+4QEqGaPA0
         YLcmtn60Gkytv7vDeNva0RvvXRrT3/iJ0biaLOhP+pS99FIrloRtS3h0SuFhNuMi0sij
         P9ccZ5yT4tyOek8vWpclud0+weJlEhxRnfI/fVVBQdkkhys9zGTM3iHH2gvMIyOuSj1e
         bPwQ==
X-Gm-Message-State: AOJu0YxbY9LaQ87g1xCZoAPE/orqDCwu+L7Y0jhDJlq5Q80AQOT1FZOK
	cFqHph28puurDc5ODY+ZOyR/Usef0VCS4Dp9x+VZ6w==
X-Google-Smtp-Source: AGHT+IHkg0ZKJ4yedCIcxWQHHEubuHsTtpsWiqkyZpXCgKHU9OBeXbOYTtFhOxXyPH/P1PauHAoacm075bpURMWJLoo=
X-Received: by 2002:a05:6a20:3c91:b0:187:eb60:d6de with SMTP id
 b17-20020a056a203c9100b00187eb60d6demr3743444pzj.27.1700226647148; Fri, 17
 Nov 2023 05:10:47 -0800 (PST)
MIME-Version: 1.0
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-8-apatel@ventanamicro.com> <2023102120-unleveled-composed-45a2@gregkh>
In-Reply-To: <2023102120-unleveled-composed-45a2@gregkh>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Nov 2023 18:40:35 +0530
Message-ID: <CAAhSdy00LaD0OLJ1ANtyAm41cCLfRX7SPM=A=4WrG_6bB=9xng@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] tty/serial: Add RISC-V SBI debug console based earlycon
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-serial@vger.kernel.org, kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, Paolo Bonzini <pbonzini@redhat.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Oct 21, 2023 at 10:16=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Oct 20, 2023 at 12:51:38PM +0530, Anup Patel wrote:
> > We extend the existing RISC-V SBI earlycon support to use the new
> > RISC-V SBI debug console extension.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  drivers/tty/serial/Kconfig              |  2 +-
> >  drivers/tty/serial/earlycon-riscv-sbi.c | 32 +++++++++++++++++++++----
> >  2 files changed, 29 insertions(+), 5 deletions(-)
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
> > index 27afb0b74ea7..c21cdef254e7 100644
> > --- a/drivers/tty/serial/earlycon-riscv-sbi.c
> > +++ b/drivers/tty/serial/earlycon-riscv-sbi.c
> > @@ -15,17 +15,41 @@ static void sbi_putc(struct uart_port *port, unsign=
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
> > +     phys_addr_t pa =3D __pa(s);
> > +
> > +     if (IS_ENABLED(CONFIG_32BIT))
> > +             sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> > +                       n, lower_32_bits(pa), upper_32_bits(pa), 0, 0, =
0);
> > +     else
> > +             sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
> > +                       n, pa, 0, 0, 0, 0);
>
> This is still a bit hard to follow, and I guarantee it will be a pain to
> maintain over time, trying to keep both calls in sync, right?
>
> Why not fix up sbi_ecall() to get this correct instead?  It should be
> handling phys_addr_t values, not forcing you to do odd bit masking every
> single time you call it, right?  That would make things much easier
> overall, and this patch simpler, as well as the next one.

On RV32 systems, the physical address can be 34bits wide hence
the on RV32 we have to pass physical address as two parameters
whereas on RV64 entier physical address can be passed as single
parameter.

>
> Oh wait, sbi_ecall() is crazy, and just a pass-through, so that's not
> going to work, you need a wrapper function for this mess to do that bit
> twiddeling for you instead of forcing you to do it each time, I guess
> that's what you are trying to do here, but ick, is it correct?

Yes, it is better to have a wrapper function to hide the differences
of RV32 and RV64 systems. I will update.

>
> thanks,
>
> greg k-h
>
> --
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

Regards,
Anup
