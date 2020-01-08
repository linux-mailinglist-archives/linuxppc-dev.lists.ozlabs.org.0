Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92926134F41
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 23:04:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tNZF102wzDqV3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 09:04:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tNXM5vZnzDqDs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 09:02:39 +1100 (AEDT)
Received: by mail-ot1-f68.google.com with SMTP id r27so5140037otc.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 14:02:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O9YsXaP1lcVI3YB10D/1yLJh0lm8KzUFBjhvxrtn8yA=;
 b=jxOfeqtJSb9ma1f/VnNkY1n+zrA5mFet4hn2XXtSfaW865rxCKqfAbl34EXl0qyYO0
 W/rQIePc+Bq0hq4JRqenbWmiBdEt9yupLdxVa1eSskISkHyr9sT24X0jVy1eJe1IinDF
 JSJB32UEWVp+viaGKylslZBTOWCvCujpyvGzi7lM2sQbNHgPR+U4ALkJ1ddMz+0xTJmH
 ch51v7aDuEXvI2GkuxzMBUz6JWFAhMPjdW2fssz0Ndds5uFQ+gwDX+NQueItR4r5ucMt
 7JtzBzq8VMbF0etj6mvFoHteIRPozfJ23fYOgR+NdmiDb6K9ujpop8h2YZW//n7Wryr3
 zDew==
X-Gm-Message-State: APjAAAX2FlirpcCHTrS0EviPYZTpEYirTcN4zjo/nuL5T51wYV+vCk5L
 wtC7iWlKBNepXuqOBc42LxN5sy17
X-Google-Smtp-Source: APXvYqxTDLEFxE9yTW/L6zWjpUne0cHoVTvts363U7blEIfnVbfccJNT0WvamXTjCng2oRHUzVLgFg==
X-Received: by 2002:a9d:65cf:: with SMTP id z15mr6159694oth.238.1578520956933; 
 Wed, 08 Jan 2020 14:02:36 -0800 (PST)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com.
 [209.85.167.178])
 by smtp.gmail.com with ESMTPSA id e21sm1513207oib.16.2020.01.08.14.02.36
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2020 14:02:36 -0800 (PST)
Received: by mail-oi1-f178.google.com with SMTP id z64so4115494oia.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 14:02:36 -0800 (PST)
X-Received: by 2002:aca:d887:: with SMTP id p129mr615231oig.51.1578520956285; 
 Wed, 08 Jan 2020 14:02:36 -0800 (PST)
MIME-Version: 1.0
References: <20200108130926.45808-1-yuehaibing@huawei.com>
In-Reply-To: <20200108130926.45808-1-yuehaibing@huawei.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Wed, 8 Jan 2020 16:02:25 -0600
X-Gmail-Original-Message-ID: <CADRPPNQp7KxENbr+nZ8AAZkuBW-=6sjeXd8LU2LJJZqjCvY==g@mail.gmail.com>
Message-ID: <CADRPPNQp7KxENbr+nZ8AAZkuBW-=6sjeXd8LU2LJJZqjCvY==g@mail.gmail.com>
Subject: Re: [PATCH -next] soc: fsl: qe: remove set but not used variable
 'mm_gc'
To: YueHaibing <yuehaibing@huawei.com>
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
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Zhao Qiang <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 8, 2020 at 7:12 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> drivers/soc/fsl/qe/gpio.c: In function qe_pin_request:
> drivers/soc/fsl/qe/gpio.c:163:26: warning: variable mm_gc set but not used [-Wunused-but-set-variable]
>
> commit 1e714e54b5ca ("powerpc: qe_lib-gpio: use gpiochip data pointer")
> left behind this unused variable.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied for next.  Thanks.

Btw, I find another patch from Chen Zhou fixing the same problem sent
earlier.  I will add his signed-off-by to the commit for credit too.

Regards,
Leo

> ---
>  drivers/soc/fsl/qe/gpio.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
> index 12bdfd9..ed75198 100644
> --- a/drivers/soc/fsl/qe/gpio.c
> +++ b/drivers/soc/fsl/qe/gpio.c
> @@ -160,7 +160,6 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
>  {
>         struct qe_pin *qe_pin;
>         struct gpio_chip *gc;
> -       struct of_mm_gpio_chip *mm_gc;
>         struct qe_gpio_chip *qe_gc;
>         int err;
>         unsigned long flags;
> @@ -186,7 +185,6 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
>                 goto err0;
>         }
>
> -       mm_gc = to_of_mm_gpio_chip(gc);
>         qe_gc = gpiochip_get_data(gc);
>
>         spin_lock_irqsave(&qe_gc->lock, flags);
> --
> 2.7.4
>
>
