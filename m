Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FC65672DB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 17:41:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lcn3R6MWqz3c55
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 01:41:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jNn+5tgw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jNn+5tgw;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lcn2k3md7z3blD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 01:41:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1657035636;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=tsHhud5sfQVz9Np8da35W2zVQWtwjMLPWbpgLRPf9Sc=;
    b=jNn+5tgwv2Mwz2d7c/+ymHOlS5zOTOE5jgBBL36leTJZgzdNUHD8DaIT1f7vYyVKxA
    WKINEFN0bQEB4yZc9/ZpcurIKQv7HtauvZXp85y1LSjJdUMCBgkbY7zL9FK4RDDYHRMW
    tIiAtDz4ruj4iKNRhsYQuqWfp+7CNt1l0KVi8o1uiNbFSd8dxWwxwdmjXsoRbmuBz6sK
    AYaJCjGeT1N5f0WrMfCXKuZyrUoKvR3zgLHqGV8sAFiHFi5DvbX3qIFegnOso7s4DgyM
    +hGAFky15Su1DIa8Vbu8bCD/1+3whQqLXitpA5ddM9CcfLH98JW8veD7jAmMrXY5MOVL
    E8tA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwjW4dqgkobcHPYDc/BNBepImPPJ"
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:3840:b132:e6ea:146]
    by smtp.strato.de (RZmta 47.46.1 AUTH)
    with ESMTPSA id icdf6dy65FeYK21
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 5 Jul 2022 17:40:34 +0200 (CEST)
Message-ID: <cee04f80-9131-5ab3-7382-50cb5a01fd08@xenosoft.de>
Date: Tue, 5 Jul 2022 17:40:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3] drivers/usb/host/ehci-fsl: Fix interrupt setup in host
 mode.
Content-Language: de-DE
To: Darren Stevens <darren@stevens-zone.net>, linuxppc-dev@lists.ozlabs.org,
 oss@buserror.net, robh@kernel.org, stern@rowland.harvard.edu,
 linux-usb@vger.kernel.org
References: <20220702220355.63b36fb8@Cyrus.lan>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <20220702220355.63b36fb8@Cyrus.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Christian Zigotzky <info@xenosoft.de>, shawnguo@kernel.org, mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, leoyang.li@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02 July 2022 at 11:03 pm, Darren Stevens wrote:
> In patch a1a2b7125e10 (Drop static setup of IRQ resource from DT
> core) we stopped platform_get_resource() from returning the IRQ, as all
> drivers were supposed to have switched to platform_get_irq()
> Unfortunately the Freescale EHCI driver in host mode got missed. Fix
> it.
>
> Fixes: a1a2b7125e10 (Drop static setup of IRQ resource from DT core)
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Darren Stevens <darren@stevens-zone.net>
> ---
>   v3 - Corrected resource allocation in fsl-mph-dr-of.c
>
>   v2 - Fixed coding style, removed a couple of unneeded initializations,
>        cc'd Layerscape maintainers.
>
> Tested on AmigaOne X5000/20 and X5000/40 Contains code by Rob Herring
> (in fsl-mph-dr-of.c)
>
> diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
> index 385be30..896c0d1 100644
> --- a/drivers/usb/host/ehci-fsl.c
> +++ b/drivers/usb/host/ehci-fsl.c
> @@ -76,14 +76,9 @@ static int fsl_ehci_drv_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>   
> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (!res) {
> -		dev_err(&pdev->dev,
> -			"Found HC with no IRQ. Check %s setup!\n",
> -			dev_name(&pdev->dev));
> -		return -ENODEV;
> -	}
> -	irq = res->start;
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
>   
>   	hcd = __usb_create_hcd(&fsl_ehci_hc_driver, pdev->dev.parent,
>   			       &pdev->dev, dev_name(&pdev->dev), NULL);
> diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
> index 44a7e58..e5df175 100644
> --- a/drivers/usb/host/fsl-mph-dr-of.c
> +++ b/drivers/usb/host/fsl-mph-dr-of.c
> @@ -112,6 +112,9 @@ static struct platform_device *fsl_usb2_device_register(
>   			goto error;
>   	}
>   
> +	pdev->dev.of_node = ofdev->dev.of_node;
> +	pdev->dev.of_node_reused = true;
> +
>   	retval = platform_device_add(pdev);
>   	if (retval)
>   		goto error;
Hello,

I patched the RC5 of kernel 5.19 with this patch and I can confirm, that 
my keyboard and mouse work without any problems.

Tested-by: Christian Zigotzky <chzigotzky@xenosoft.de>

Please accept this patch.

Thanks,
Christian
