Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 604122BBE32
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Nov 2020 10:20:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CdSYw0TdtzDr0X
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Nov 2020 20:20:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.68; helo=mail-oo1-f68.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com
 [209.85.161.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CdSX150QXzDqxh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Nov 2020 20:18:41 +1100 (AEDT)
Received: by mail-oo1-f68.google.com with SMTP id z13so2798230ooa.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Nov 2020 01:18:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WaMha0En6LkvNa0zqCPwgKvusypP+GNCRLE4znVs274=;
 b=ESW1PiFXFy3a1OcarvghvMNZzTg6Nzso6CVKEAOHXY+JhXU6XuwG921D0TvUCClJom
 EkQgQQhUexyodFkljamRWD9mIOPGQlCv7WhDE4XK41mQ/X4/XRmTpGoavTD/MLJtmJLr
 5mgqH7tFX5BJa+UKYzv/PUdF2K+FGUXgNagwWZfvrjqM8yPiP/UnH2tA/fBrVfDNBLo2
 H/KPyG1cNkvKjPmPLMV2knWLKPSnR+f7fvbwxlnbk5QyvRnRGGq476KouWclDLFD8S7a
 k9apE9GTBrsZweAv13EK+2IPOo8LDcFyOzd7QOIqTtX1+EgSdwUHdD0JnCxpkr6sabH7
 Zz4Q==
X-Gm-Message-State: AOAM531hPUAM7fxCEgdnLb8OwtBdHemNZpPJ85m1wVWkIbEzrc85Rtng
 sJAXciciZ3gjLXkCunJGwnT/GMfSdA3HnZFzZ8c=
X-Google-Smtp-Source: ABdhPJyowNnoUrA3Mz/7yfMy3Z3o1JIdvy8nv3Lo7KpazvsKj/zkLv5vUmVX8M/ykA2X5Tbn+KzYCs8VU79DooXNsrw=
X-Received: by 2002:a4a:d694:: with SMTP id i20mr16921417oot.40.1605950318178; 
 Sat, 21 Nov 2020 01:18:38 -0800 (PST)
MIME-Version: 1.0
References: <b39102a332ae92c274fc8651acb4c52cfb9824a1.1605847196.git.fthain@telegraphics.com.au>
 <CAMuHMdUS4wmUUtAqgjGc=WVcRC4RJ9nJhVnne89YzOUvd=CCvw@mail.gmail.com>
 <alpine.LNX.2.23.453.2011210955390.6@nippy.intranet>
In-Reply-To: <alpine.LNX.2.23.453.2011210955390.6@nippy.intranet>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 21 Nov 2020 10:18:26 +0100
Message-ID: <CAMuHMdVRXxEU_R_Sdi7tSR7y7FoU+fFScsfUCVS+JbXU9BWt8A@mail.gmail.com>
Subject: Re: [PATCH] m68k: Fix WARNING splat in pmac_zilog driver
To: Finn Thain <fthain@telegraphics.com.au>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 stable <stable@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Paul Mackerras <paulus@samba.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Joshua Thompson <funaho@jurai.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Finn,

On Sat, Nov 21, 2020 at 12:47 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> On Fri, 20 Nov 2020, Geert Uytterhoeven wrote:
> > On Fri, Nov 20, 2020 at 5:51 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> > > Don't add platform resources that won't be used. This avoids a
> > > recently-added warning from the driver core, that can show up on a
> > > multi-platform kernel when !MACH_IS_MAC.
> > >
> > > ------------[ cut here ]------------
> > > WARNING: CPU: 0 PID: 0 at drivers/base/platform.c:224 platform_get_irq_optional+0x8e/0xce
> > > 0 is an invalid IRQ number
> > > Modules linked in:
> > > CPU: 0 PID: 0 Comm: swapper Not tainted 5.9.0-multi #1
> > > Stack from 004b3f04:
> > >         004b3f04 00462c2f 00462c2f 004b3f20 0002e128 004754db 004b6ad4 004b3f4c
> > >         0002e19c 004754f7 000000e0 00285ba0 00000009 00000000 004b3f44 ffffffff
> > >         004754db 004b3f64 004b3f74 00285ba0 004754f7 000000e0 00000009 004754db
> > >         004fdf0c 005269e2 004fdf0c 00000000 004b3f88 00285cae 004b6964 00000000
> > >         004fdf0c 004b3fac 0051cc68 004b6964 00000000 004b6964 00000200 00000000
> > >         0051cc3e 0023c18a 004b3fc0 0051cd8a 004fdf0c 00000002 0052b43c 004b3fc8
> > > Call Trace: [<0002e128>] __warn+0xa6/0xd6
> > >  [<0002e19c>] warn_slowpath_fmt+0x44/0x76
> > >  [<00285ba0>] platform_get_irq_optional+0x8e/0xce
> > >  [<00285ba0>] platform_get_irq_optional+0x8e/0xce
> > >  [<00285cae>] platform_get_irq+0x12/0x4c
> > >  [<0051cc68>] pmz_init_port+0x2a/0xa6
> > >  [<0051cc3e>] pmz_init_port+0x0/0xa6
> > >  [<0023c18a>] strlen+0x0/0x22
> > >  [<0051cd8a>] pmz_probe+0x34/0x88
> > >  [<0051cde6>] pmz_console_init+0x8/0x28
> > >  [<00511776>] console_init+0x1e/0x28
> > >  [<0005a3bc>] printk+0x0/0x16
> > >  [<0050a8a6>] start_kernel+0x368/0x4ce
> > >  [<005094f8>] _sinittext+0x4f8/0xc48
> > > random: get_random_bytes called from print_oops_end_marker+0x56/0x80 with crng_init=0
> > > ---[ end trace 392d8e82eed68d6c ]---
> > >
> > > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > > Cc: Paul Mackerras <paulus@samba.org>
> > > Cc: Joshua Thompson <funaho@jurai.org>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Jiri Slaby <jirislaby@kernel.org>
> > > Cc: stable@vger.kernel.org # v5.8+
> > > References: commit a85a6c86c25b ("driver core: platform: Clarify that IRQ 0 is invalid")
> > > Reported-by: Laurent Vivier <laurent@vivier.eu>
> > > Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> > > ---
> > > The global platform_device structs provide the equivalent of a direct
> > > search of the OpenFirmware tree, for platforms that don't have OF.
> > > The purpose of that search is discussed in the comments in pmac_zilog.c:
> > >
> > >          * First, we need to do a direct OF-based probe pass. We
> > >          * do that because we want serial console up before the
> > >          * macio stuffs calls us back
> > >
> > > The actual platform bus matching takes place later, with a module_initcall,
> > > following the usual pattern.
> >
> > I think it would be good for this explanation to be part of the
> > actual patch description above.
> >
>
> Thanks for your review.
>
> I take that explanation as read because it was fundamental to the changes
> I made to pmac_zilog.c back in 2009 with commit ec9cbe09899e ("pmac-zilog:
> add platform driver").

That's a long time ago ;-)
I asked because to the casual reader, it's far from obvious why the platform
device use-time is different from the platform device's resources use-time.

> IMO, being that it isn't news, it doesn't belong in the changelog.
> However, I agree that it needs to be documented. How about I add a comment
> to pmac_zilog.c?

Fine for me.

> > > --- a/drivers/tty/serial/pmac_zilog.c
> > > +++ b/drivers/tty/serial/pmac_zilog.c
> > > @@ -1697,18 +1697,17 @@ extern struct platform_device scc_a_pdev, scc_b_pdev;
> > >
> > >  static int __init pmz_init_port(struct uart_pmac_port *uap)
> > >  {
> > > -       struct resource *r_ports;
> > > -       int irq;
> > > +       struct resource *r_ports, *r_irq;
> > >
> > >         r_ports = platform_get_resource(uap->pdev, IORESOURCE_MEM, 0);
> > > -       irq = platform_get_irq(uap->pdev, 0);
> > > -       if (!r_ports || irq <= 0)
> > > +       r_irq = platform_get_resource(uap->pdev, IORESOURCE_IRQ, 0);
> > > +       if (!r_ports || !r_irq)
> > >                 return -ENODEV;
> > >
> > >         uap->port.mapbase  = r_ports->start;
> > >         uap->port.membase  = (unsigned char __iomem *) r_ports->start;
> > >         uap->port.iotype   = UPIO_MEM;
> > > -       uap->port.irq      = irq;
> > > +       uap->port.irq      = r_irq->start;
> > >         uap->port.uartclk  = ZS_CLOCK;
> > >         uap->port.fifosize = 1;
> > >         uap->port.ops      = &pmz_pops;
> >
> > Given the resources are no longer present on !MAC, just doing
> >
> >             r_ports = platform_get_resource(uap->pdev, IORESOURCE_MEM, 0);
> >     +       if (!r_ports)
> >     +               return -ENODEV;
> >             irq = platform_get_irq(uap->pdev, 0);
> >
> > should be sufficient?
>
> I think your suggestion is shorter but not better. Commit a85a6c86c25b
> (which introduced the WARNING) suggests that testing for irq == 0 is
> undesirable. My patch resolves that.
>
> As a bonus, by simply testing for the existence of both resources, I've
> addressed the mistake I made when I originally added the slick
> platform_get_irq() call instead of consistently using
> platform_get_resource().
>
> platform_get_irq() hides a bunch of architecture-specific logic that is
> not appropriate here. The WARNING itself is a good example of that kind of
> logic.
>
> Do you agree? If so, I will add this explanation to the commit log.

OK, your main motivation is to get rid of the zero-check.
Leaving it could indeed trigger some janitorial changes by people who
don't understand the code at all, so it's good to avoid that ;-)

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
