Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D8A3DF42A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 19:52:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfMsN4H50z3cQx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 03:52:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=GYI09HQT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b35;
 helo=mail-yb1-xb35.google.com; envelope-from=saravanak@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=GYI09HQT; dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfMrw0kFBz306F
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 03:52:14 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id x192so102163ybe.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Aug 2021 10:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PBgZljFVrSeLABLK0pp/2Hz7HIGjCIFA/IERb9MuqE0=;
 b=GYI09HQT4+g4j0DHoO2j2OmuszyEtutHTYFs/7ctFeCVDvuZAczx/kGe8dBIUNd/rr
 Cm9Mu4jUrpyXlqkS0gCPtckFJ/FEMCmxYqU3ohAHB471UCp7R6FvWk6D55zklnDEDvDd
 V9bV/fHm7RPfVlWB06Lc0GOtkdEi3ONl874d+56nq3kEw7Vv8Mr6SF3el9VeYJgHVLfj
 ylr4kfYaYDQWGpk62Zex/ZyAGA9e6tlwmIRJQlpOb9EAzLLvkD6LHg45i1ZGJ6ZN3A6f
 8uQPI0dC4aJ2TBNCnpDl3nf/Jns9a3jRuHW3u/+Z8GccGq2H92PXvM2AJxzusQBOsuBq
 s4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PBgZljFVrSeLABLK0pp/2Hz7HIGjCIFA/IERb9MuqE0=;
 b=rtxxc6kpng47PCUiw6n1nluOTmm1MWqajMrrg5/xDoasthTeDSSyHK8z4zwHIlUdjW
 6B5W8eOy5UDqMXGMkmg/tYgnzahVYIdr+XcHtV1V6gaFvfnakEMOEY/VGLu3q3DVaPR3
 gkz54Jz/6nN9U5HTafCqWqIwobU0Fo0T7ipbf7ql87suAh1N3pD9eJ2hrU6hG4aaZ4Po
 5XKiNOOOLqfoZB+W/EwJvJHh0bvws3kjCcrrVk5o8gl/Ns8B97umsafSPKMoN3O2CYZh
 4UVhN/FTugkcBUdHgjNt2tr5S6oG2nNGtsENGcTD872U7o+PmU6G1jzfoCEhj6tcw5RZ
 /e2Q==
X-Gm-Message-State: AOAM532A87WJXDMJ+OXpH0YB/QEOAQW5ltknzKfTWgs1iIdIp7tfmCAM
 DUEOsUs/6O5VtPOfEOP+KYITvS+sHijyJhUeg9eoNw==
X-Google-Smtp-Source: ABdhPJzjgKwOlw/JSZYeLJKFxQJU1P1kFOhTXCVfn2HkPxUGntC/t/KCQXvtOgO+s2Z+ENrSk1g7mWqYdSF9VroZLJ4=
X-Received: by 2002:a25:d450:: with SMTP id m77mr30661363ybf.412.1628013128847; 
 Tue, 03 Aug 2021 10:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210803113538.560277-1-fido_max@inbox.ru>
In-Reply-To: <20210803113538.560277-1-fido_max@inbox.ru>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 3 Aug 2021 10:51:32 -0700
Message-ID: <CAGETcx8QC+AMXvmk4RB=LGp00QLVVX4uCeeruAjFnGq_irMh4Q@mail.gmail.com>
Subject: Re: [PATCH v4] soc: fsl: qe: convert QE interrupt controller to
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
Cc: kernel test robot <lkp@intel.com>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, qiang.zhao@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 3, 2021 at 4:33 AM Maxim Kochetkov <fido_max@inbox.ru> wrote:
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
> Also use platform_get_ and devm_ family function to get/allocate
> resources and drop unused .compatible = "qeic".

Yes, please!

Acked-by: Saravana Kannan <saravanak@google.com>

-Saravana

>
> [1] - https://lore.kernel.org/lkml/CAGETcx9PiX==mLxB9PO8Myyk6u2vhPVwTMsA5NkD-ywH5xhusw@mail.gmail.com
> Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
> Fixes: ea718c699055 ("Revert "Revert "driver core: Set fw_devlink=on by default""")
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/soc/fsl/qe/qe_ic.c | 75 ++++++++++++++++++++++----------------
>  1 file changed, 44 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
> index 3f711c1a0996..e710d554425d 100644
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
> @@ -404,41 +405,40 @@ static void qe_ic_cascade_muxed_mpic(struct irq_desc *desc)
>         chip->irq_eoi(&desc->irq_data);
>  }
>
> -static void __init qe_ic_init(struct device_node *node)
> +static int qe_ic_init(struct platform_device *pdev)
>  {
> +       struct device *dev = &pdev->dev;
>         void (*low_handler)(struct irq_desc *desc);
>         void (*high_handler)(struct irq_desc *desc);
>         struct qe_ic *qe_ic;
> -       struct resource res;
> -       u32 ret;
> +       struct resource *res;
> +       struct device_node *node = pdev->dev.of_node;
>
> -       ret = of_address_to_resource(node, 0, &res);
> -       if (ret)
> -               return;
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (res == NULL) {
> +               dev_err(dev, "no memory resource defined\n");
> +               return -ENODEV;
> +       }
>
> -       qe_ic = kzalloc(sizeof(*qe_ic), GFP_KERNEL);
> +       qe_ic = devm_kzalloc(dev, sizeof(*qe_ic), GFP_KERNEL);
>         if (qe_ic == NULL)
> -               return;
> +               return -ENOMEM;
>
> -       qe_ic->irqhost = irq_domain_add_linear(node, NR_QE_IC_INTS,
> -                                              &qe_ic_host_ops, qe_ic);
> -       if (qe_ic->irqhost == NULL) {
> -               kfree(qe_ic);
> -               return;
> +       qe_ic->regs = devm_ioremap(dev, res->start, resource_size(res));
> +       if (qe_ic->regs == NULL) {
> +               dev_err(dev, "failed to ioremap() registers\n");
> +               return -ENODEV;
>         }
>
> -       qe_ic->regs = ioremap(res.start, resource_size(&res));
> -
>         qe_ic->hc_irq = qe_ic_irq_chip;
>
> -       qe_ic->virq_high = irq_of_parse_and_map(node, 0);
> -       qe_ic->virq_low = irq_of_parse_and_map(node, 1);
> +       qe_ic->virq_high = platform_get_irq(pdev, 0);
> +       qe_ic->virq_low = platform_get_irq(pdev, 1);
>
> -       if (!qe_ic->virq_low) {
> -               printk(KERN_ERR "Failed to map QE_IC low IRQ\n");
> -               kfree(qe_ic);
> -               return;
> +       if (qe_ic->virq_low < 0) {
> +               return -ENODEV;
>         }
> +
>         if (qe_ic->virq_high != qe_ic->virq_low) {
>                 low_handler = qe_ic_cascade_low;
>                 high_handler = qe_ic_cascade_high;
> @@ -447,6 +447,13 @@ static void __init qe_ic_init(struct device_node *node)
>                 high_handler = NULL;
>         }
>
> +       qe_ic->irqhost = irq_domain_add_linear(node, NR_QE_IC_INTS,
> +                                              &qe_ic_host_ops, qe_ic);
> +       if (qe_ic->irqhost == NULL) {
> +               dev_err(dev, "failed to add irq domain\n");
> +               return -ENODEV;
> +       }
> +
>         qe_ic_write(qe_ic->regs, QEIC_CICR, 0);
>
>         irq_set_handler_data(qe_ic->virq_low, qe_ic);
> @@ -456,20 +463,26 @@ static void __init qe_ic_init(struct device_node *node)
>                 irq_set_handler_data(qe_ic->virq_high, qe_ic);
>                 irq_set_chained_handler(qe_ic->virq_high, high_handler);
>         }
> +       return 0;
>  }
> +static const struct of_device_id qe_ic_ids[] = {
> +       { .compatible = "fsl,qe-ic"},
> +       { .type = "qeic"},
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
