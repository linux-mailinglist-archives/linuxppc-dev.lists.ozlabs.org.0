Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E812BA3CE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 08:48:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcpZv5DW8zDqwv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 18:48:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcpXn4QXjzDqsl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 18:47:05 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id o3so7922054ota.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 23:47:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mzOVTf49CBgNPPHdKP7kUbMvPuWEx/43NfkBigYQZhE=;
 b=Ahuh65oUpnT+meTJiojfkG67GJEnrs1AAeIaPeUsAwbslbGGzmhXut+I6Rw+UEoXbK
 0wSwIUV9LCK5x5sRcA07IG4akMypxbQHVJ8RLHcDM1auQ9Vq9PG0l/n1z+oBYHFaDkVh
 X4ZCA8HZeD/WMoRlli0tJf+JqLbJ6lmqZ8vomYYy4bBNadYGVW3lP35C1AzRvH1lkm3t
 DQR7TYyGSGa9hcvMy3yqoI/oLhoGWVl8YgsYV1lk7eaO+BHJLt8M1L3t3xNmSx2w5s3+
 iP4zUliBBPMU80CSzM8sMm6eE53pM8nOSNRTUqKPgQ3dMgP9GmLEvsJrnd++dN/kDNHA
 x34Q==
X-Gm-Message-State: AOAM533/RTEjoViljFnBg3xb3QHWfIo9Tg6oCfs5Ef4EmC6VgIPABmKu
 RHMRWhaftT4qIhsNKO6k1Pqlg3H2J2NUxKZqm78=
X-Google-Smtp-Source: ABdhPJwOSn+Wi2U4dALPYNuq2257auNX3fGfqxn0QvDZcqIAqeIC/u9OBr4xGHnHphndnbMcRmz3EcmoCGPaFWXXKjc=
X-Received: by 2002:a05:6830:210a:: with SMTP id
 i10mr12722791otc.145.1605858422365; 
 Thu, 19 Nov 2020 23:47:02 -0800 (PST)
MIME-Version: 1.0
References: <b39102a332ae92c274fc8651acb4c52cfb9824a1.1605847196.git.fthain@telegraphics.com.au>
In-Reply-To: <b39102a332ae92c274fc8651acb4c52cfb9824a1.1605847196.git.fthain@telegraphics.com.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2020 08:46:51 +0100
Message-ID: <CAMuHMdUS4wmUUtAqgjGc=WVcRC4RJ9nJhVnne89YzOUvd=CCvw@mail.gmail.com>
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

On Fri, Nov 20, 2020 at 5:51 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> Don't add platform resources that won't be used. This avoids a
> recently-added warning from the driver core, that can show up on a
> multi-platform kernel when !MACH_IS_MAC.
>
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 0 at drivers/base/platform.c:224 platform_get_irq_optional+0x8e/0xce
> 0 is an invalid IRQ number
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper Not tainted 5.9.0-multi #1
> Stack from 004b3f04:
>         004b3f04 00462c2f 00462c2f 004b3f20 0002e128 004754db 004b6ad4 004b3f4c
>         0002e19c 004754f7 000000e0 00285ba0 00000009 00000000 004b3f44 ffffffff
>         004754db 004b3f64 004b3f74 00285ba0 004754f7 000000e0 00000009 004754db
>         004fdf0c 005269e2 004fdf0c 00000000 004b3f88 00285cae 004b6964 00000000
>         004fdf0c 004b3fac 0051cc68 004b6964 00000000 004b6964 00000200 00000000
>         0051cc3e 0023c18a 004b3fc0 0051cd8a 004fdf0c 00000002 0052b43c 004b3fc8
> Call Trace: [<0002e128>] __warn+0xa6/0xd6
>  [<0002e19c>] warn_slowpath_fmt+0x44/0x76
>  [<00285ba0>] platform_get_irq_optional+0x8e/0xce
>  [<00285ba0>] platform_get_irq_optional+0x8e/0xce
>  [<00285cae>] platform_get_irq+0x12/0x4c
>  [<0051cc68>] pmz_init_port+0x2a/0xa6
>  [<0051cc3e>] pmz_init_port+0x0/0xa6
>  [<0023c18a>] strlen+0x0/0x22
>  [<0051cd8a>] pmz_probe+0x34/0x88
>  [<0051cde6>] pmz_console_init+0x8/0x28
>  [<00511776>] console_init+0x1e/0x28
>  [<0005a3bc>] printk+0x0/0x16
>  [<0050a8a6>] start_kernel+0x368/0x4ce
>  [<005094f8>] _sinittext+0x4f8/0xc48
> random: get_random_bytes called from print_oops_end_marker+0x56/0x80 with crng_init=0
> ---[ end trace 392d8e82eed68d6c ]---
>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Joshua Thompson <funaho@jurai.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: stable@vger.kernel.org # v5.8+
> References: commit a85a6c86c25b ("driver core: platform: Clarify that IRQ 0 is invalid")
> Reported-by: Laurent Vivier <laurent@vivier.eu>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> ---
> The global platform_device structs provide the equivalent of a direct
> search of the OpenFirmware tree, for platforms that don't have OF.
> The purpose of that search is discussed in the comments in pmac_zilog.c:
>
>          * First, we need to do a direct OF-based probe pass. We
>          * do that because we want serial console up before the
>          * macio stuffs calls us back
>
> The actual platform bus matching takes place later, with a module_initcall,
> following the usual pattern.

I think it would be good for this explanation to be part of the
actual patch description above.

> --- a/arch/m68k/mac/config.c
> +++ b/arch/m68k/mac/config.c
> @@ -777,16 +777,12 @@ static struct resource scc_b_rsrcs[] = {
>  struct platform_device scc_a_pdev = {
>         .name           = "scc",
>         .id             = 0,
> -       .num_resources  = ARRAY_SIZE(scc_a_rsrcs),
> -       .resource       = scc_a_rsrcs,
>  };
>  EXPORT_SYMBOL(scc_a_pdev);
>
>  struct platform_device scc_b_pdev = {
>         .name           = "scc",
>         .id             = 1,
> -       .num_resources  = ARRAY_SIZE(scc_b_rsrcs),
> -       .resource       = scc_b_rsrcs,
>  };
>  EXPORT_SYMBOL(scc_b_pdev);
>
> @@ -813,10 +809,15 @@ static void __init mac_identify(void)
>
>         /* Set up serial port resources for the console initcall. */
>
> -       scc_a_rsrcs[0].start = (resource_size_t) mac_bi_data.sccbase + 2;
> -       scc_a_rsrcs[0].end   = scc_a_rsrcs[0].start;
> -       scc_b_rsrcs[0].start = (resource_size_t) mac_bi_data.sccbase;
> -       scc_b_rsrcs[0].end   = scc_b_rsrcs[0].start;
> +       scc_a_rsrcs[0].start     = (resource_size_t)mac_bi_data.sccbase + 2;
> +       scc_a_rsrcs[0].end       = scc_a_rsrcs[0].start;
> +       scc_a_pdev.num_resources = ARRAY_SIZE(scc_a_rsrcs);
> +       scc_a_pdev.resource      = scc_a_rsrcs;
> +
> +       scc_b_rsrcs[0].start     = (resource_size_t)mac_bi_data.sccbase;
> +       scc_b_rsrcs[0].end       = scc_b_rsrcs[0].start;
> +       scc_b_pdev.num_resources = ARRAY_SIZE(scc_b_rsrcs);
> +       scc_b_pdev.resource      = scc_b_rsrcs;
>
>         switch (macintosh_config->scc_type) {
>         case MAC_SCC_PSC:
> diff --git a/drivers/tty/serial/pmac_zilog.c b/drivers/tty/serial/pmac_zilog.c
> index 96e7aa479961..95abdb305d67 100644
> --- a/drivers/tty/serial/pmac_zilog.c
> +++ b/drivers/tty/serial/pmac_zilog.c
> @@ -1697,18 +1697,17 @@ extern struct platform_device scc_a_pdev, scc_b_pdev;
>
>  static int __init pmz_init_port(struct uart_pmac_port *uap)
>  {
> -       struct resource *r_ports;
> -       int irq;
> +       struct resource *r_ports, *r_irq;
>
>         r_ports = platform_get_resource(uap->pdev, IORESOURCE_MEM, 0);
> -       irq = platform_get_irq(uap->pdev, 0);
> -       if (!r_ports || irq <= 0)
> +       r_irq = platform_get_resource(uap->pdev, IORESOURCE_IRQ, 0);
> +       if (!r_ports || !r_irq)
>                 return -ENODEV;
>
>         uap->port.mapbase  = r_ports->start;
>         uap->port.membase  = (unsigned char __iomem *) r_ports->start;
>         uap->port.iotype   = UPIO_MEM;
> -       uap->port.irq      = irq;
> +       uap->port.irq      = r_irq->start;
>         uap->port.uartclk  = ZS_CLOCK;
>         uap->port.fifosize = 1;
>         uap->port.ops      = &pmz_pops;

Given the resources are no longer present on !MAC, just doing

            r_ports = platform_get_resource(uap->pdev, IORESOURCE_MEM, 0);
    +       if (!r_ports)
    +               return -ENODEV;
            irq = platform_get_irq(uap->pdev, 0);

should be sufficient?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
