Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DC5554292
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 08:12:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSY1z6zxZz3c8B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 16:12:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=N/VKWhAf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=N/VKWhAf;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSY1K3yV6z2yWr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 16:11:32 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 90CAB60B21;
	Wed, 22 Jun 2022 06:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7824AC34114;
	Wed, 22 Jun 2022 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1655878288;
	bh=xKZFvn44TVCKBwbFNgbclrJugXr5d6NQghY3H/Z6M90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N/VKWhAfpB4HS5DCPNsa3m+mwPsGZN0Rxv+1euVDptLMDhUZwICPdAZUzf9InwmNf
	 uyrDCt5timcgCUHhRsq7mA1ccVTa8GhrEuGIO9yI9h4OYbTSVzrmR7YPox0YM+6R6B
	 ew+R1TBb74XVapvArx3TD7ckSVQEDg248ZdLC8Mo=
Date: Wed, 22 Jun 2022 08:11:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Darren Stevens <darren@stevens-zone.net>
Subject: Re: [PATCH RFC] drivers/usb/ehci-fsl: Fix interrupt setup in host
 mode.
Message-ID: <YrKyjITQbhiHiCcq@kroah.com>
References: <20220621230941.381f9791@Cyrus.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220621230941.381f9791@Cyrus.lan>
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
Cc: robh@kernel.org, linux-usb@vger.kernel.org, oss@buserror.net, stern@rowland.harvard.edu, chzigotzky@xenosoft.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 21, 2022 at 11:09:41PM +0100, Darren Stevens wrote:
> In patch a1a2b7125e1079 (Drop static setup of IRQ resource from DT
> core) we stopped platform_get_resource() from returning the IRQ, as all
> drivers were supposed to have switched to platform_get_irq()
> Unfortunately the Freescale EHCI driver in host mode got missed. Fix
> it. Also fix allocation of resources to work with current kernel.
> 
> Fixes:a1a2b7125e1079 (Drop static setup of IRQ resource from DT core)

Nit, please put a space after the :.

Also not that many characters are needed, as you can see in our
documentation, this is the proper format:

Fixes: a1a2b7125e10 ("of/platform: Drop static setup of IRQ resource from DT core")

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
> +	struct device_node *dn = pdev->dev.of_node;
>  	struct fsl_usb2_platform_data *pdata;
>  	struct usb_hcd *hcd;
> -	struct resource *res;
> +	struct resource res;
>  	int irq;
>  	int retval;
>  	u32 tmp;
> @@ -76,14 +78,10 @@ static int fsl_ehci_drv_probe(struct
> platform_device *pdev) return -ENODEV;
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (!res) {
> -		dev_err(&pdev->dev,
> -			"Found HC with no IRQ. Check %s setup!\n",
> -			dev_name(&pdev->dev));
> -		return -ENODEV;
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		return irq;
>  	}

Did you run checkpatch on this?  Coding style is not correct :(

thanks,

greg k-h
