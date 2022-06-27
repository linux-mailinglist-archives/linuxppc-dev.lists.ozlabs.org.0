Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDC755BAD4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 17:43:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWsT62vq5z3c9C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 01:43:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q9GaOJQB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q9GaOJQB;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWsSW3nWPz305g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 01:43:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4587BB8188A
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 15:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01133C385A9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 15:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656344582;
	bh=CKHMDXojyAVGknyEK9CXAxoH5So1LcAEOpDD/Vy6REg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q9GaOJQBT3CkNrfY1LFiWLBlLHSvA/0kGEroapPJKffRxPY27WVCnpIINIQhL1aV2
	 DBslwOn3bS42NYFVgX7GpHB7cDSyjmia+MfybtxmI42jDRjGN2dL5hgrGuTnl1J5jz
	 oUWxssYQnljIqCE2Yw+VaVWCU1JERcFQuLpMz+ofo+MdHgHaExmNGKpkqaU9JBO8WD
	 2qq5VXUmEd/nsGc3bo98j7NkP1fmHf9QNZo7CXqxeTWlFBLVeLPRdBti6ZyPhih43E
	 9tTtt6d7EfBH+KP1HayKRC04SDD0e4yb1jRYQY8Re+jiHV01ZtWJDYPGvZoVtbP1VT
	 wUAcSgmCYAweg==
Received: by mail-vk1-f174.google.com with SMTP id m188so4658039vkm.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jun 2022 08:43:01 -0700 (PDT)
X-Gm-Message-State: AJIora/hVnb51QngDEx/nQEOlXqmP8r8b83IOJF/vY8w2Y+PH0SWxTHI
	wkZW2t9HMmoOcG5bJVGu6o076co2+vG/Y7P04w==
X-Google-Smtp-Source: AGRyM1tkqhclTIJflBrTkmr5Jd5BYzGYhiBLJyRS8Xa1qsjZ/kW95OWTv679hb8U/+MH/mM05GZLrH1MZJUoEV9YcQY=
X-Received: by 2002:a1f:2bd5:0:b0:370:23aa:ead7 with SMTP id
 r204-20020a1f2bd5000000b0037023aaead7mr1354772vkr.26.1656344580900; Mon, 27
 Jun 2022 08:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220621230941.381f9791@Cyrus.lan>
In-Reply-To: <20220621230941.381f9791@Cyrus.lan>
From: Rob Herring <robh@kernel.org>
Date: Mon, 27 Jun 2022 09:42:49 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKv9XmNcDDQvNnNXuF7DTf28tF+c3sDkpDdnyNvdx2d7w@mail.gmail.com>
Message-ID: <CAL_JsqKv9XmNcDDQvNnNXuF7DTf28tF+c3sDkpDdnyNvdx2d7w@mail.gmail.com>
Subject: Re: [PATCH RFC] drivers/usb/ehci-fsl: Fix interrupt setup in host mode.
To: Darren Stevens <darren@stevens-zone.net>
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
Cc: Scott Wood <oss@buserror.net>, Alan Stern <stern@rowland.harvard.edu>, Linux USB List <linux-usb@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <chzigotzky@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 21, 2022 at 4:09 PM Darren Stevens <darren@stevens-zone.net> wrote:
>
> In patch a1a2b7125e1079 (Drop static setup of IRQ resource from DT
> core) we stopped platform_get_resource() from returning the IRQ, as all
> drivers were supposed to have switched to platform_get_irq()
> Unfortunately the Freescale EHCI driver in host mode got missed. Fix
> it. Also fix allocation of resources to work with current kernel.
>
> Fixes:a1a2b7125e1079 (Drop static setup of IRQ resource from DT core)
> Reported-by Christian Zigotzky <chzigotzky@xenosoft.de>
> Signed-off-by Darren Stevens <darren@stevens-zone.net>
> ---
> Tested on AmigaOne X5000/20 and X5000/40 not sure if this is entirely
> correct fix though. Contains code by Rob Herring (in fsl-mph-dr-of.c)
>
> diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
> index 385be30..d0bf7fb 100644
> --- a/drivers/usb/host/ehci-fsl.c
> +++ b/drivers/usb/host/ehci-fsl.c
> @@ -23,6 +23,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/fsl_devices.h>
>  #include <linux/of_platform.h>
> +#include <linux/of_address.h>
>  #include <linux/io.h>
>
>  #include "ehci.h"
> @@ -46,9 +47,10 @@ static struct hc_driver __read_mostly
> fsl_ehci_hc_driver; */
>  static int fsl_ehci_drv_probe(struct platform_device *pdev)
>  {
> +       struct device_node *dn = pdev->dev.of_node;
>         struct fsl_usb2_platform_data *pdata;
>         struct usb_hcd *hcd;
> -       struct resource *res;
> +       struct resource res;
>         int irq;
>         int retval;
>         u32 tmp;
> @@ -76,14 +78,10 @@ static int fsl_ehci_drv_probe(struct
> platform_device *pdev) return -ENODEV;
>         }
>
> -       res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);

Ah, this was the part I was missing...

> -       if (!res) {
> -               dev_err(&pdev->dev,
> -                       "Found HC with no IRQ. Check %s setup!\n",
> -                       dev_name(&pdev->dev));
> -               return -ENODEV;
> +       irq = platform_get_irq(pdev, 0);
> +       if (irq < 0) {
> +               return irq;
>         }
> -       irq = res->start;
>
>         hcd = __usb_create_hcd(&fsl_ehci_hc_driver, pdev->dev.parent,
>                                &pdev->dev, dev_name(&pdev->dev), NULL);
> @@ -92,15 +90,21 @@ static int fsl_ehci_drv_probe(struct
> platform_device *pdev) goto err1;
>         }
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       hcd->regs = devm_ioremap_resource(&pdev->dev, res);
> +       platform_set_drvdata(pdev, hcd);
> +       pdev->dev.platform_data = pdata;
> +
> +       tmp = of_address_to_resource(dn, 0, &res);

There's no need to change this. platform_get_resource() still works
for IORESOURCE_MEM.

Plus, drivers shouldn't use of_address_to_resource().

> +       if (tmp)
> +               return tmp;
> +
> +       hcd->regs = devm_ioremap_resource(&pdev->dev, &res);
>         if (IS_ERR(hcd->regs)) {
>                 retval = PTR_ERR(hcd->regs);
>                 goto err2;
>         }
>
> -       hcd->rsrc_start = res->start;
> -       hcd->rsrc_len = resource_size(res);
> +       hcd->rsrc_start = res.start;
> +       hcd->rsrc_len = resource_size(&res);
>
>         pdata->regs = hcd->regs;
>
> diff --git a/drivers/usb/host/fsl-mph-dr-of.c
> b/drivers/usb/host/fsl-mph-dr-of.c index 44a7e58..766e4ab 100644
> --- a/drivers/usb/host/fsl-mph-dr-of.c
> +++ b/drivers/usb/host/fsl-mph-dr-of.c
> @@ -80,8 +80,6 @@ static struct platform_device
> *fsl_usb2_device_register( const char *name, int id)
>  {
>         struct platform_device *pdev;
> -       const struct resource *res = ofdev->resource;
> -       unsigned int num = ofdev->num_resources;
>         int retval;
>
>         pdev = platform_device_alloc(name, id);
> @@ -106,11 +104,8 @@ static struct platform_device
> *fsl_usb2_device_register( if (retval)
>                 goto error;
>
> -       if (num) {
> -               retval = platform_device_add_resources(pdev, res, num);
> -               if (retval)
> -                       goto error;
> -       }
> +       pdev->dev.of_node = ofdev->dev.of_node;
> +       pdev->dev.of_node_reused = true;
>
>         retval = platform_device_add(pdev);
>         if (retval)
