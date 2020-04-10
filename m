Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F0F1A4483
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 11:38:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zCcl0pYDzDrNg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Apr 2020 19:38:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cogentembedded.com (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com;
 envelope-from=sergei.shtylyov@cogentembedded.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=cogentembedded.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=cogentembedded-com.20150623.gappssmtp.com
 header.i=@cogentembedded-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=lgJpULrK; dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zCb82NyZzDr6l
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 19:37:03 +1000 (AEST)
Received: by mail-lf1-x143.google.com with SMTP id z23so953418lfh.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Apr 2020 02:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=exkqUjBnwAnJKQjQDn5TTL2pNxP0x0Ucz4ZEQEg/hEg=;
 b=lgJpULrKJ6u0MBT6ETzC4LiBEhCZXXocwkaDpsNGyo+5DkK/1JJ3+dBXaGC75FVsov
 bH+k6fpG+BLwP0tcO0pyfY3vH+sGMIfLvBCbC9OD2r5O+oN8hKfshtHylLi4mpnOwi6C
 hJ66MH7utQ1iIsSbMh6ILLq0zOCC0+d4WSktropS7gTaBzyOI6QTTw1x0zpq7rEzneCW
 IPmNcigCV9clxXSwgQ7cexhTSUl2yyjReBPfsstRpBt9BN5y9SgAKdGgrmcrsnatkiMP
 7qLFkYb2K2u3Vr6hY7CFZi+dHAFgfnd8RpHAtF/paP9L52ILXLLHY09AS5+Zo5e37lxW
 ePUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=exkqUjBnwAnJKQjQDn5TTL2pNxP0x0Ucz4ZEQEg/hEg=;
 b=G6tXYCnV90fh0KNrU4SNr6vgF4FhiENmiV3kxv5GuPh7B0Kocjef1LggRGDWvjl3eD
 uNO0KDd3PwaV1HBFl4moTCuIzixb5Oh7X8TaDxmgaXenMiB0x4Wj4Z7h5P68/BuJ075m
 cSv/TOBpLC7HK4qdQZf2lQ9zo5ixayJDW+093WHjLy0bsHD7e2SxnoDCLt04gsy9VRGW
 4Od3GxvBLP+05cc1nYXBHJa1jh9WWqjP6oxoY2iPiSxMTvb/NTTEKCVqusPKm3yjqQz0
 aEg3/D3GKLZekCnFz/hYnhoxGjy+EAWPZGtgJrjvy6R0m4fODDi3tDE6/TCbMZa6VvxN
 CxkA==
X-Gm-Message-State: AGi0PubCUi2fk9lSzCh4QbN2YkWilCmSvevaW6WGQtJn6sOfuDNTWHDW
 L7+o9FS2h5LZmMKIjFqcxDz3nA==
X-Google-Smtp-Source: APiQypIMcfl4zC6vz1w5b1PCJyqjTtBx2aRTNE1jqnlOUglSVyui2mwUKgIsqdT82ZXwaL+19jwFPw==
X-Received: by 2002:ac2:4a9d:: with SMTP id l29mr2065861lfp.4.1586511419309;
 Fri, 10 Apr 2020 02:36:59 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:449c:a024:b8e5:a34a:c38e:b427?
 ([2a00:1fa0:449c:a024:b8e5:a34a:c38e:b427])
 by smtp.gmail.com with ESMTPSA id r23sm963123lfi.33.2020.04.10.02.36.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2020 02:36:58 -0700 (PDT)
Subject: Re: [PATCH] usb: gadget: fsl: Fix a wrong judgment in fsl_udc_probe()
To: Tang Bin <tangbin@cmss.chinamobile.com>, leoyang.li@nxp.com,
 balbi@kernel.org, gregkh@linuxfoundation.org
References: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0ee67579-8c65-bde1-e458-50344d3100b9@cogentembedded.com>
Date: Fri, 10 Apr 2020 12:36:48 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Markus.Elfring@web.de, linux-usb@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello!

On 10.04.2020 4:58, Tang Bin wrote:

> If the function "platform_get_irq()" failed, the negative value
> returned will not be detected here, including "-EPROBE_DEFER", which
> causes the application to fail to get the correct error message.
> Thus it must be fixed.
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>
> ---
>   drivers/usb/gadget/udc/fsl_udc_core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
> index ec6eda426..60853ad10 100644
> --- a/drivers/usb/gadget/udc/fsl_udc_core.c
> +++ b/drivers/usb/gadget/udc/fsl_udc_core.c
> @@ -2441,8 +2441,8 @@ static int fsl_udc_probe(struct platform_device *pdev)
>   	udc_controller->max_ep = (dccparams & DCCPARAMS_DEN_MASK) * 2;
>   
>   	udc_controller->irq = platform_get_irq(pdev, 0);
> -	if (!udc_controller->irq) {

    This check has always been wrong, doesn't account for real errors and
probe deferral...

> -		ret = -ENODEV;
> +	if (udc_controller->irq <= 0) {

    Note that platfrom_get_irq() no longer returns 0 on error.

> +		ret = udc_controller->irq ? : -ENODEV;
>   		goto err_iounmap;
>   	}

MBR, Sergei
