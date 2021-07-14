Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 943FC3C93D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 00:30:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GQBz11TvJz3bhX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jul 2021 08:30:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.175;
 helo=mail-qk1-f175.google.com; envelope-from=pku.leo@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GQByY25z7z2yNW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jul 2021 08:29:55 +1000 (AEST)
Received: by mail-qk1-f175.google.com with SMTP id m68so3273015qke.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 15:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lsctwH0XgpYOHYMIUUkD/PxnFZz1dTw3T5m+9J+nUZo=;
 b=pgakz4r6JDzxAPi5Pd+YeUxNA4+esblEHmoI5OxF5rZS/sZEI7ZxIrWfxgv1Y7t7cf
 FKdwDlLjms/cNJfI1ijz2YenKeXR+s479JiElg84qDtgsbwUF4kXmtP8pAxaaBHsO0Uy
 XN3L8oW9E6nVDBXHSqRArfKpXb/j5r6dUHTistxf3rKronkjnvUds4kSXFCHQqqbvpBS
 AvPcuxxIbv1B2M9+aCAHblvPfgJApOI8Z+WlLRNIc+2v1iSsJvUbO4GsLKIyurKCg+Xy
 bJbBUMWBuQhPOBJWpbwM7VUAovoxhqMx86KkqDkZetqmJZov21VoM5rpuJDSspUpSiHp
 ibBw==
X-Gm-Message-State: AOAM533d+QzO5aOSnu+rK1viaXpSRopE1g/xPvrd3Yc208NUGHpIf+Os
 XT1DXN5dP+vNaZSguaYldD4DNzZc5L+9Iw==
X-Google-Smtp-Source: ABdhPJy76LA+yiywOGvkEc9i5u4zb6Cx89rtvs5IeiiOkG/A06s88JlKjGoTLAU7qQg6pAJf5ul48w==
X-Received: by 2002:ae9:f00c:: with SMTP id l12mr242310qkg.141.1626301791948; 
 Wed, 14 Jul 2021 15:29:51 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com.
 [209.85.222.181])
 by smtp.gmail.com with ESMTPSA id h8sm1323632qtj.57.2021.07.14.15.29.50
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 15:29:51 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id p202so3253901qka.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jul 2021 15:29:50 -0700 (PDT)
X-Received: by 2002:a37:a58f:: with SMTP id o137mr218663qke.451.1626301790102; 
 Wed, 14 Jul 2021 15:29:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210705111250.1513634-1-fido_max@inbox.ru>
In-Reply-To: <20210705111250.1513634-1-fido_max@inbox.ru>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 14 Jul 2021 17:29:38 -0500
X-Gmail-Original-Message-ID: <CADRPPNRYDBFHEppfpYLwsy7MMEdtsOLS764MJboL9ERW0-KK3Q@mail.gmail.com>
Message-ID: <CADRPPNRYDBFHEppfpYLwsy7MMEdtsOLS764MJboL9ERW0-KK3Q@mail.gmail.com>
Subject: Re: [PATCH] soc: fsl: qe: convert QE interrupt controller to
 platform_device
To: Maxim Kochetkov <fido_max@inbox.ru>
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
Cc: saravanak@google.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Zhao Qiang <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 5, 2021 at 6:12 AM Maxim Kochetkov <fido_max@inbox.ru> wrote:
>
> Since 5.13 QE's ucc nodes can't get interrupts from devicetree:
>
>         ucc@2000 {
>                 cell-index = <1>;
>                 reg = <0x2000 0x200>;
>                 interrupts = <32>;
>                 interrupt-parent = <&qeic>;
>         };
>
> Now fw_devlink expects driver to create and probe a struct device
> for interrupt controller.
>
> So lets convert this driver to simple platform_device with probe().
>
> [1] - https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com
> Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
> Fixes: ea718c699055 ("Revert "Revert "driver core: Set fw_devlink=on by default""")
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  drivers/soc/fsl/qe/qe_ic.c | 38 +++++++++++++++++++++++---------------
>  1 file changed, 23 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
> index 3f711c1a0996..03d291376895 100644
> --- a/drivers/soc/fsl/qe/qe_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ic.c
> @@ -23,6 +23,7 @@
>  #include <linux/signal.h>
>  #include <linux/device.h>
>  #include <linux/spinlock.h>
> +#include <linux/platform_device.h>
>  #include <asm/irq.h>
>  #include <asm/io.h>
>  #include <soc/fsl/qe/qe.h>
> @@ -404,27 +405,28 @@ static void qe_ic_cascade_muxed_mpic(struct irq_desc *desc)
>         chip->irq_eoi(&desc->irq_data);
>  }
>
> -static void __init qe_ic_init(struct device_node *node)
> +static int qe_ic_init(struct platform_device *pdev)
>  {
>         void (*low_handler)(struct irq_desc *desc);
>         void (*high_handler)(struct irq_desc *desc);
>         struct qe_ic *qe_ic;
>         struct resource res;
> +       struct device_node *node = pdev->dev.of_node;
>         u32 ret;
>
>         ret = of_address_to_resource(node, 0, &res);
>         if (ret)
> -               return;
> +               return -ENODEV;
>
>         qe_ic = kzalloc(sizeof(*qe_ic), GFP_KERNEL);
>         if (qe_ic == NULL)
> -               return;
> +               return -ENOMEM;
>
>         qe_ic->irqhost = irq_domain_add_linear(node, NR_QE_IC_INTS,
>                                                &qe_ic_host_ops, qe_ic);
>         if (qe_ic->irqhost == NULL) {
>                 kfree(qe_ic);
> -               return;
> +               return -ENODEV;
>         }
>
>         qe_ic->regs = ioremap(res.start, resource_size(&res));
> @@ -437,7 +439,7 @@ static void __init qe_ic_init(struct device_node *node)
>         if (!qe_ic->virq_low) {
>                 printk(KERN_ERR "Failed to map QE_IC low IRQ\n");
>                 kfree(qe_ic);
> -               return;
> +               return -ENODEV;
>         }
>         if (qe_ic->virq_high != qe_ic->virq_low) {
>                 low_handler = qe_ic_cascade_low;
> @@ -456,20 +458,26 @@ static void __init qe_ic_init(struct device_node *node)
>                 irq_set_handler_data(qe_ic->virq_high, qe_ic);
>                 irq_set_chained_handler(qe_ic->virq_high, high_handler);
>         }
> +       return 0;
>  }
> +static const struct of_device_id qe_ic_ids[] = {
> +       { .compatible = "fsl,qe-ic"},
> +       { .compatible = "qeic"},

From the original code, this should be type = "qeic".  It is not
defined in current binding but probably needed for backward
compatibility.

It would be great if you can also deal with the comments from Dan too.  Thanks.

> +       {},
> +};
>
> -static int __init qe_ic_of_init(void)
> +static struct platform_driver qe_ic_driver =
>  {
> -       struct device_node *np;
> +       .driver = {
> +               .name           = "qe-ic",
> +               .of_match_table = qe_ic_ids,
> +       },
> +       .probe  = qe_ic_init,
> +};
>
> -       np = of_find_compatible_node(NULL, NULL, "fsl,qe-ic");
> -       if (!np) {
> -               np = of_find_node_by_type(NULL, "qeic");
> -               if (!np)
> -                       return -ENODEV;
> -       }
> -       qe_ic_init(np);
> -       of_node_put(np);
> +static int __init qe_ic_of_init(void)
> +{
> +       platform_driver_register(&qe_ic_driver);
>         return 0;
>  }
>  subsys_initcall(qe_ic_of_init);
> --
> 2.31.1
>
