Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E9D2F7441
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 09:23:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHDjN27lRzDsgT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 19:23:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.45; helo=mail-ej1-f45.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHDdV3DGdzDsdC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 19:20:29 +1100 (AEDT)
Received: by mail-ej1-f45.google.com with SMTP id q22so12092297eja.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 00:20:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jEyFAI8Tiov/SBHpNo3029tSX/H+CCtTPEByvcBUUrQ=;
 b=DoSYGLPFuASAkBnAH3tqWnbGsJVBBvAMFuNUCmVRDfWyM0Zv9pbgFdihBNxK353S6l
 bUlQomorDNlUayCvGsRuJv3L+EdUEQowuejgY/nSaDou2TuHYcvG/InOI0lulf+MaPf/
 vAn7TJclGlcgv4WfML4awRwlw/WMkQgcj8gkUfUgvmhBwOGGoGd1Gnqkv0jGNgwepOYj
 ZMAF+F0pqGoJJQCEsIkRiwSmFWZhKqfZlMkY8lbC9F4AHY2wlOTLDapsNVlYjkZFT5AF
 HT/VvrfBwC+ntv0M7AnhbDARYDsli7bD4mcDYQMnayT/pR3dgn1ple+lgg+jDLhxWVTR
 7w0w==
X-Gm-Message-State: AOAM5315hmh0jMLNkY0knn1r3HbjbEkAu9B7LqhE1hC4i7hoLEVFueSY
 yZ68fZ6cwoXeNGQpbsYuuyA=
X-Google-Smtp-Source: ABdhPJza8YUJJ+T+zmo3FTE2Q4CTVcyXE8IE5bnUQXWXBR8ur4YO/4xQ/EJM/R7aABO9UuVSd7Ptxw==
X-Received: by 2002:a17:906:4893:: with SMTP id
 v19mr77844ejq.454.1610698825555; 
 Fri, 15 Jan 2021 00:20:25 -0800 (PST)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id h23sm2923600ejg.37.2021.01.15.00.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 00:20:24 -0800 (PST)
Subject: Re: [PATCH 2/3] tty: vcc: Drop unnecessary if block
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210114175718.137483-1-u.kleine-koenig@pengutronix.de>
 <20210114175718.137483-3-u.kleine-koenig@pengutronix.de>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <9a1c68fc-f3bf-79e7-e2ae-238059241e2f@kernel.org>
Date: Fri, 15 Jan 2021 09:20:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114175718.137483-3-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14. 01. 21, 18:57, Uwe Kleine-König wrote:
> If vcc_probe() succeeded dev_set_drvdata() is called with a non-NULL
> value, and if vcc_probe() failed vcc_remove() isn't called.
> 
> So there is no way dev_get_drvdata() can return NULL in vcc_remove() and
> the check can just go away.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

> ---
>   drivers/tty/vcc.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/tty/vcc.c b/drivers/tty/vcc.c
> index 9ffd42e333b8..d9b0dc6deae9 100644
> --- a/drivers/tty/vcc.c
> +++ b/drivers/tty/vcc.c
> @@ -681,9 +681,6 @@ static int vcc_remove(struct vio_dev *vdev)
>   {
>   	struct vcc_port *port = dev_get_drvdata(&vdev->dev);
>   
> -	if (!port)
> -		return -ENODEV;
> -
>   	del_timer_sync(&port->rx_timer);
>   	del_timer_sync(&port->tx_timer);
>   
> 


-- 
js
