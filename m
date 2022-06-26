Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5119455B06A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 10:50:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LW4Lw1h6mz3c8x
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jun 2022 18:50:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LtVmvH0s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=sergei.shtylyov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LtVmvH0s;
	dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LW4LF74mCz3bkC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 18:49:56 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id g4so11614860lfv.9
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jun 2022 01:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yEGDBxIrxLnZhZc+wkclIQTRrLXd7F46K6vXNtU2YDc=;
        b=LtVmvH0sEbW7l7lbVsQJUVz6qFVlvSIdjlWRhR6MDBzyRwCeecj0RK0ipdewP4yJ1H
         7mgcf1d5B8io8PMujQ6eU7b4DPW5oiuWfvQc37jby/FSbmOzemLaZLvQyp03ew6Ap+2W
         1c1f1HrcIEmaiYnW0HKwbNClAzIk1mXhMGaZ7SuCeaJG6boZKu2fNskWdHe7GBxPGyk6
         UlYWjb/FwL7S8mfD6YzQuEerjjft9hffZdEw+MOHVyUoG1KjcO0gjP2w8KbEmaTJ5NGb
         WqXOi74OaQDgRMUVuNo0xoCPhvCjJzAdtROdm6sAot2DpioRIurBLvcQIhip1I8ca3OJ
         eijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yEGDBxIrxLnZhZc+wkclIQTRrLXd7F46K6vXNtU2YDc=;
        b=inB4qI7DdJNQCzlyjLKbjW+a7z6iXG4QDHAxuMqrbKl+vB7LRkT9HB8mp8Zz78ctbE
         epy+sonXVtk+HVm4F4Mh3b39AwiHXyKIpmvw8b1+Ez8M1HUboxWR9EmOI+xNABLvEtH/
         xM5JyAjZhmU28BE7v/b7pmQIWv14nw2bRzBtEiJ5ofVOOe9SRk6hvS0byqtJapjQ47BC
         02lf99sjc7SxHaVOiBlSutot3zcO1sMZVu9MxDKcz/0z4EOkzXbLV9gEQLYyZNOMcLrL
         FwiocfF3zG/1f4E3DDRNmtlsSmXwkprzzfoCVdJdyvShc+SCH8iHc3YPYMZpXHC41Miu
         13Jg==
X-Gm-Message-State: AJIora9ChGBev1TD6ewjuUwiSrYsNVNYceFZVTq/u0j4WNUZb42GG/HK
	BkXkzAOEiC8bnUhXDizIGCw=
X-Google-Smtp-Source: AGRyM1vV+NgxcIUouLKwJqKqWew25IGPhu9Nm7WUJ8BJKaKrGf9eCzzh2qLf+oVaL/i611FO9BcMFA==
X-Received: by 2002:a05:6512:475:b0:47f:a44c:e481 with SMTP id x21-20020a056512047500b0047fa44ce481mr5180849lfd.670.1656233387984;
        Sun, 26 Jun 2022 01:49:47 -0700 (PDT)
Received: from [192.168.1.103] ([178.176.72.32])
        by smtp.gmail.com with ESMTPSA id r23-20020a2e8e37000000b0025a72ee37cdsm920370ljk.24.2022.06.26.01.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 01:49:47 -0700 (PDT)
Subject: Re: [PATCH v2 RFC] drivers/usb/host/ehci-fsl: Fix interrupt setup in
 host mode.
To: Darren Stevens <darren@stevens-zone.net>, linuxppc-dev@lists.ozlabs.org,
 oss@buserror.net, chzigotzky@xenosoft.de, robh@kernel.org,
 stern@rowland.harvard.edu, linux-usb@vger.kernel.org
References: <20220625214151.547b3570@Cyrus.lan>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <947e4583-fe0b-b8af-61b3-2d120357727c@gmail.com>
Date: Sun, 26 Jun 2022 11:49:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220625214151.547b3570@Cyrus.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: shawnguo@kernel.org, leoyang.li@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello!

On 6/25/22 11:41 PM, Darren Stevens wrote:

> In patch a1a2b7125e10 (Drop static setup of IRQ resource from DT
> core) we stopped platform_get_resource() from returning the IRQ, as all

In commit a1a2b7125e10 ("Drop static setup of IRQ resource from DT core")

> drivers were supposed to have switched to platform_get_irq()
> Unfortunately the Freescale EHCI driver in host mode got missed. Fix
> it. Also fix allocation of resources to work with current kernel.

   The basic rule (especially for the fixes) is "do one thing per patch".

> Fixes: a1a2b7125e10 (Drop static setup of IRQ resource from DT core)
> Reported-by Christian Zigotzky <chzigotzky@xenosoft.de>
> Signed-off-by Darren Stevens <darren@stevens-zone.net>
> ---
>  v2 - Fixed coding style, removed a couple of unneeded initializations,
>       cc'd Layerscape maintainers.
> 
> Tested on AmigaOne X5000/20 and X5000/40 not sure if this is entirely
> correct fix though. Contains code by Rob Herring (in fsl-mph-dr-of.c)
> 
> diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
> index 385be30..8bd258a 100644
> --- a/drivers/usb/host/ehci-fsl.c
> +++ b/drivers/usb/host/ehci-fsl.c
[...]
> @@ -92,15 +89,18 @@ static int fsl_ehci_drv_probe(struct platform_device *pdev)
>  		goto err1;
>  	}
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	hcd->regs = devm_ioremap_resource(&pdev->dev, res);
> +	tmp = of_address_to_resource(dn, 0, &res);

   Hm, why? What does this fix?

[...]

MBR, Sergey
