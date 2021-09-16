Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFB240D530
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 10:56:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H99tN5dFVz3089
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 18:56:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.217.41; helo=mail-vs1-f41.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H99sy5PZFz2xXX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Sep 2021 18:56:05 +1000 (AEST)
Received: by mail-vs1-f41.google.com with SMTP id n17so4757496vsr.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Sep 2021 01:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+EQOzi6GoX/Ngw6/fSChQOM/x46HyAvx0gYxin2/a30=;
 b=xMhJa7JAnpn3gC8glM29nRX8WEaUVRZO9hz16NGWtlQDYBKDAmi9TIVUHw8NrM4E7l
 tp1WOF8IEZIQWgmPhoYJB0UOUPvqpJXGktqP/rZ6cnFNSH8540tVd8idN5CNfMT63foE
 +8e3hrB4nGlqxrto0kTrwtqMNobgeDB1hgBCsEWAKmQXRQF9Ad9BCRgUTqOemlYQ7m/S
 Sba9n4/2Mglh6TkIIlrwxXgYA/BQYcsXW4UndjthRMfIpEBcYtz95Knjed5oYiCoKlbt
 fSQ6a5ZAbbj+dWiYlDDLFZEk6/z0QUA/6xkz9QONQSAjBL+p4QeLR8k0wcdso7UlqsNi
 FVug==
X-Gm-Message-State: AOAM530MfNsSz0qP9Mgz6hYEti7K3sBhMGfpczLLFhyd+NO+0Mkv6BIL
 a3GbaaKP4gdcC2I6wuDSGhLsbNeegFVLOBWst4s=
X-Google-Smtp-Source: ABdhPJyvOyxa/pmzGY2Bx+ipIQAdYpVoYfpJmNto/Se29JgkEW5BfsmTxPaq1OwYBhfxiruK4W7wSZsYRWnpM3+5lho=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr3281079vsl.9.1631782561209;
 Thu, 16 Sep 2021 01:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <c5f8aa5c081755f3c960b86fc61c2baaa33edcd9.1631710216.git.geert+renesas@glider.be>
 <YUMESxr907YHM3ZT@hovoldconsulting.com>
In-Reply-To: <YUMESxr907YHM3ZT@hovoldconsulting.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Sep 2021 10:55:49 +0200
Message-ID: <CAMuHMdX7_AOuGEjvTHpQ-4KHMH+m800KTu7wads6UTfMZiu9BQ@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250: SERIAL_8250_FSL should not default to y
 when compile-testing
To: Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Li Yang <leoyang.li@nxp.com>,
 Scott Wood <oss@buserror.net>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Johan,

On Thu, Sep 16, 2021 at 10:46 AM Johan Hovold <johan@kernel.org> wrote:
> On Wed, Sep 15, 2021 at 02:56:52PM +0200, Geert Uytterhoeven wrote:
> > Commit b1442c55ce8977aa ("serial: 8250: extend compile-test coverage")
> > added compile-test support to the Freescale 16550 driver.  However, as
> > SERIAL_8250_FSL is an invisible symbol, merely enabling COMPILE_TEST now
> > enables this driver.
> >
> > Fix this by making SERIAL_8250_FSL visible.  Tighten the dependencies to
> > prevent asking the user about this driver when configuring a kernel
> > without appropriate Freescale SoC or ACPI support.
>
> This tightening is arguable a separate change which risk introducing
> regressions if you get it wrong and should go in a separate patch at
> least.

Getting it wrong would indeed be a regression, but not tightening
that at the same time would mean I have to send a separate patch with
a Fixes tag referring to this fix, following this template:

    foo should depend on bar

    The foo hardware is only present on bar SoCs.  Hence add a
    dependency on bar, to prevent asking the user about this driver
    when configuring a kernel without bar support.

> > Fixes: b1442c55ce8977aa ("serial: 8250: extend compile-test coverage")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Yes, it's ugly, but I see no better solution. Do you?
> >
> >  drivers/tty/serial/8250/Kconfig | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
> > index 808268edd2e82a45..a2978b31144e94f2 100644
> > --- a/drivers/tty/serial/8250/Kconfig
> > +++ b/drivers/tty/serial/8250/Kconfig
> > @@ -361,9 +361,13 @@ config SERIAL_8250_BCM2835AUX
> >         If unsure, say N.
> >
> >  config SERIAL_8250_FSL
> > -     bool
> > +     bool "Freescale 16550-style UART support (8250 based driver)"
> >       depends on SERIAL_8250_CONSOLE
> > -     default PPC || ARM || ARM64 || COMPILE_TEST
> > +     depends on FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A || (ARM64 && ACPI) || COMPILE_TEST
> > +     default FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A || (ARM64 && ACPI)
>
> I'd suggest just doing
>
>         bool "Freescale 16550-style UART support (8250 based driver)"
>         depends on SERIAL_8250_CONSOLE
>         default PPC || ARM || ARM64
>
> Since neither of the symbols you add to that "depends on" line is an
> actual build or runtime dependency.

They are.

> Then you can refine the "default" line in a follow up (or argue why you
> think there should be a "depends on FSL_SOC || ...").
>
> > +     help
> > +       Selecting this option will add support for the 16550-style serial
> > +       port hardware found on Freescale SoCs.
> >
> >  config SERIAL_8250_DW
> >       tristate "Support for Synopsys DesignWare 8250 quirks"

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
