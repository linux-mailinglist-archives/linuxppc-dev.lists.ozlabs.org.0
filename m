Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9FA6420A8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 00:56:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQNqg27BFz3bWb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 10:56:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NVPCNqIY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=dmitry.torokhov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NVPCNqIY;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQNpm5Jbpz2y84
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 10:55:27 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id k79so9791626pfd.7
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Dec 2022 15:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gHlZGpeZlTuBVPZFLOSWn4tUqUYQHoDhbXM9z/ibwxk=;
        b=NVPCNqIYQwJ9riFBXF9JBy0G6xWfj+kYEuyG/U/R9TRpQlNH0ftWSX5J+oxMxU5RZI
         cp6krhYjoSadBWzHh4U0D0CbqBmnQ80pjtWYKW5USrbj4LMmMqDTZoH0WymauCZk5PLa
         f5THaB5h+f134C/UwnY3U0fVLlycd3mzSe65ilIIIMu1/6HkyLvymnZNIzarKelrwOb/
         MwpTEc0FPShO2Ho3FGnJUOa66Pdv1YSwUU7GxXAoOewSP7Nh+DQNm4ykxMw6zVcY7BVZ
         RpeFezVWxW1/d3O1CJXnht0Aeh46fE4r1bb/67Z0455qAKKa3tYVWHLhNHCi6AVIiNC2
         O6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHlZGpeZlTuBVPZFLOSWn4tUqUYQHoDhbXM9z/ibwxk=;
        b=rp4z7f61WhTDT29Bn/oaOPYRUCdLV5lcCbhBKrc2SyOsNVtWy0JfroFAwrVyuWkfWI
         BRbLaCiQVqCNuERBZDzuQeB+E8+zDKgJW0aNgWIjtPfOLvq1mAEj57IC3uWK9/+sU+xQ
         ZK344vlbgZXR0gX5nDfErjPA5kSJEH+nTojf2zTEBYcuXDxF6QwMPoFpdbn4lA9svx03
         RwREkVt6B2CQgJIjR+YB6IrWKINmKAs/wQGUtewU+vQRiplIDqwkj4JwZbhvBSTIW8Nd
         uvEDSaN6BrKECa4x7hzQHffYZt3YIRm5V1IRnrOztJ5z4rn5XQRbMH4xGEtDX8QY0CpZ
         jlSQ==
X-Gm-Message-State: ANoB5pkduRZeK8lH7zWbuciX5KDgkc3NeTihXddeLN+QrLuLunQupW4k
	HNUWJ6NARGrbXW7cYiGbBeU=
X-Google-Smtp-Source: AA0mqf4pMxxhbRVxKZP9kRnJWpyGf5dQqY829R1P8RGw1dgjRNh6xo628tCXNeoJ+fmMbjg0u+d7KQ==
X-Received: by 2002:a63:cd44:0:b0:478:1391:fc43 with SMTP id a4-20020a63cd44000000b004781391fc43mr31855466pgj.431.1670198123613;
        Sun, 04 Dec 2022 15:55:23 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:ea63:b7ba:2a89:fec])
        by smtp.gmail.com with ESMTPSA id b65-20020a62cf44000000b0056f0753390csm8802078pfg.96.2022.12.04.15.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 15:55:22 -0800 (PST)
Date: Sun, 4 Dec 2022 15:55:19 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RESEND PATCH] soc: fsl: qe: request pins non-exclusively
Message-ID: <Y40zZ8fkE9d1zbbV@google.com>
References: <Y4wnGgMLOr04RwvU@google.com>
 <81a7715b-559f-4c5c-bdb6-1aa00d409155@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81a7715b-559f-4c5c-bdb6-1aa00d409155@app.fastmail.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, soc@kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Dec 04, 2022 at 01:10:19PM +0100, Arnd Bergmann wrote:
> On Sun, Dec 4, 2022, at 05:50, Dmitry Torokhov wrote:
> >
> > SoC team, the problematic patch has been in next for a while and it
> > would be great to get the fix in to make sure the driver is not broken
> > in 6.2. Thanks!
> 
> I have no problem taking thsi patch, but I get a merge conflict that
> I'm not sure how to resolve:
> 
> 
> @@@ -186,23 -182,27 +180,43 @@@ struct qe_pin *qe_pin_request(struct de
>         if (WARN_ON(!gc)) {
>                 err = -ENODEV;
>                 goto err0;
> ++<<<<<<< HEAD
>  +      }
>  +      qe_pin->gpiod = gpiod;
>  +      qe_pin->controller = gpiochip_get_data(gc);
>  +      /*
>  +       * FIXME: this gets the local offset on the gpio_chip so that the driver
>  +       * can manipulate pin control settings through its custom API. The real
>  +       * solution is to create a real pin control driver for this.
>  +       */
>  +      qe_pin->num = gpio_chip_hwgpio(gpiod);
>  +
>  +      if (!of_device_is_compatible(gc->of_node, "fsl,mpc8323-qe-pario-bank")) {
>  +              pr_debug("%s: tried to get a non-qe pin\n", __func__);
>  +              gpiod_put(gpiod);
> ++=======
> +       } else if (!fwnode_device_is_compatible(gc->fwnode,
> +                                               "fsl,mpc8323-qe-pario-bank")) {
> +               dev_dbg(dev, "%s: tried to get a non-qe pin\n", __func__);
> ++>>>>>>> soc: fsl: qe: request pins non-exclusively
>                 err = -EINVAL;
> -               goto err0;
> +       } else {
> +               qe_pin->controller = gpiochip_get_data(gc);
> +               /*
> +                * FIXME: this gets the local offset on the gpio_chip so that
> +                * the driver can manipulate pin control settings through its
> +                * custom API. The real solution is to create a real pin control
> +                * driver for this.
> +                */
> +               qe_pin->num = desc_to_gpio(gpiod) - gc->base;
>         }
> 
> Could you rebase the patch on top of the soc/driver branch in the
> soc tree and send the updated version?

I see, it conflicts with:

	c9eb6e546a23 soc: fsl: qe: Switch to use fwnode instead of of_node

that is in next but not in soc/driver tree/branch. OK, I'll rebase and I
just noticed that I was leaking gpiod in case we could not locate gc
(unlikely but still...).

Thanks.

-- 
Dmitry
