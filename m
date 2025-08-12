Return-Path: <linuxppc-dev+bounces-10868-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC86B22A10
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 16:20:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1YYv5yGsz2xcC;
	Wed, 13 Aug 2025 00:20:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755008419;
	cv=none; b=jJc1980Kx0rUcKKza8ZA4020NUYMcDpHD/WTE8haWKjeqRQDyUusPcsRZJuGh2GhaCOZ7XZMelg9iiXaM1eG7qxYw42o3g57nmUc3LcG+8c0kfWLfz0W8VFkQWGBD2XNFXV26Rvquu9VB8NZ9vhjd7caMt8YIR5LFQZPBW09Ymi4tLBKuMvxy0U58si5RSXTMJWyaO+z18iSIJPo3jX4sLtZ+M8PQoHmDwbWtOJz8g4lUDJS4UjvQy5XTYpQJdV+4ImWGTAKfzumjlU+59E18v/v5xnv/qdPAuKeEyGG2KhN20eQ5ha2dUIEi4yPMQYr7lR+qufhj2m3El8lWw90aA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755008419; c=relaxed/relaxed;
	bh=zMY/csa2U5fal/bu+jvHfhppLjeOUw06LSvQ98vCN+Y=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KRDGaudB7EDf90XgqDGoP6npn1gJscYhTK7uMKx565Il5MWtjMh48ncY3LpjMBG4fOto96LFAQ5htz5fkrH2V0oKY4+EhVmhQMwUJPUZySx6T+xl1RLc97g7IiJ+UIKfnsmoCNAtlhLo4ciHUtHXs+A6qxjDfYxoY8oUhZBC6Mv+67UggRzN90tFr9QoWs6aFDuEZmX4p49B5+TT2hW6jcsZtRc1TyRZio7gKzWKD3n8BV+tMJHa5PdUZmlL4QT4py+u/DTJYN0GezHqNrcPSmylKZcsOohQ8U2hNvQOAXeaZSe8p+ideefyyT3TKctbYfSb8Gceb0OoCndUYordCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=MfvcgC0n; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=MfvcgC0n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1YYt5Cdhz2xc8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 00:20:18 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55ba26abd62so6152536e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 07:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755008415; x=1755613215; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zMY/csa2U5fal/bu+jvHfhppLjeOUw06LSvQ98vCN+Y=;
        b=MfvcgC0nl4A3hvBn+eVxVFYugn2sr9GA0iSAKwfRh6pZlQcw4Krzj+BI0xFeR9VOxJ
         tUvHqFM9TLdjR0XYh+WdUvvWx5S7p7dvC7P2BbREajvOvbU2q5x9Iojm5bIqopwW7gve
         F61QoDDwkDfbhyV0H22SP6E3KvLSa5k7SJZ8ASVgHxIMnbSl9HsGeO1TxG2oeuJEXh8j
         nvolzfJPmxd/p2gbz1v4Mr+D3CeGWEQgpR7I9G2CTdgVmNWK7qLRv46dw1eUTYZXagPQ
         yThD5yA8/HBvtLCSd/JHWeIRZjIxwet+xl3ZUyikOaLJnhKZgvn4I6xzKt4GnnoK8oNZ
         /OSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755008415; x=1755613215;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zMY/csa2U5fal/bu+jvHfhppLjeOUw06LSvQ98vCN+Y=;
        b=xHZg6pjyFdCXTSD5epTRh0Na2jYJljD6OxqGwJAIqfNOrBrkqTo0RWAXYPLEk+sAZZ
         9t4VuY3Hfgzr0oNIqRhfqdHy5LfTk6f2mAhs7+3NJ1jZ7C95SUKofCfuoDtbtdQBqTmN
         GDP9LnxjcWlKcaZKCCo5/ZXryJxgDNlB7uu3xSQyO+A1R4gVeFoMtCNxQ/Hfo3sgKkd2
         +r9u+ebC209LR5NlZTuIu4JLwZw8kOV+a+Cc4T0SVnUo2hjzdAgpDBvaIbpoNfd0lRpZ
         tODejmOt9NBsEMN67/cfRNojpByK0JBtB1HROW/145uwC0oduy3iWaaqLA5S7HevoPr2
         UN+A==
X-Forwarded-Encrypted: i=1; AJvYcCXlmHKKJSo0ZZojSIpeuzIERfoEx9cgYeHePN7p4K7+cfztKY9cY9eVtqIFfz0PuoE4zFGmSI/nfC2k2aY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxRH5TxeszAJdHftJR4QUZPqUxXGl/TD0AkAxdSSxzZBQt3IPDh
	EkfgO4AxzsS/WI2ON4WbNWl9PL7DLFhnarwN97y+BLk9LW9Np4ThrCK+hrlAb2wOyfMRj6BsxTb
	NHaEMXimxyyxKeKPkX4STs+32uejvllMR6v0etf1N2g==
X-Gm-Gg: ASbGncvungIGdNUfCR+mc6NBna6GcM8fzUbeMZrqXJ2d8fImAAMyueep9SmHAzyX1zY
	O9m5Da7X2ctFggFfvzqSiDVl/cZehRdJJ4JMnOk4tAHaiD3ngowtrQU+XoEN1kbJJbw5RFWcSNP
	5xsOajPrFGnvuePAwgsB14UUFBd19OpmD+de1PTFPuJoXjG96el3jPkKdiuSpJf3TtUJoZJ1DTw
	KorQ3cavrYQkmUb3z3RePI+iUFv+vgWFK9a
X-Google-Smtp-Source: AGHT+IHuu5wvW4QtT3XRKQhSqRyAl4ltkuZNueZbz0L47TOdCOtZKGDL/QaBXRZMyQYhkVVn0ozd5KBBIXmm6CR5nec=
X-Received: by 2002:a05:6512:1193:b0:55b:84b9:9a32 with SMTP id
 2adb3069b0e04-55cd7602a4dmr1190170e87.30.1755008414804; Tue, 12 Aug 2025
 07:20:14 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Aug 2025 10:20:14 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Aug 2025 10:20:14 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <f4d04d0c9d72d089af7490c6ce91bb4c455fbffd.1754996033.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1754996033.git.christophe.leroy@csgroup.eu> <f4d04d0c9d72d089af7490c6ce91bb4c455fbffd.1754996033.git.christophe.leroy@csgroup.eu>
Date: Tue, 12 Aug 2025 10:20:14 -0400
X-Gm-Features: Ac12FXxJwAJyIiJkerY_ZMj0NVdYlnI0XD6BtSNaGx0TIql8RITghXtjTU4PQzQ
Message-ID: <CAMRc=MfkaY5AgYrOE7eVSMbkPjWj6+5XLSrFoaSDjzUWX4Dn0Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] soc: fsl: qe: Change GPIO driver to a proper platform driver
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 12 Aug 2025 13:02:52 +0200, Christophe Leroy
<christophe.leroy@csgroup.eu> said:
> In order to be able to add interrupts to the GPIOs, first change the
> QE GPIO driver to the proper platform driver in order to allow
> initialisation to be done in the right order, otherwise the GPIOs
> get added before the interrupts are registered.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/soc/fsl/qe/gpio.c | 88 +++++++++++++++++++++++----------------
>  1 file changed, 53 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
> index 8df1e8fa86a5f..b502377193192 100644
> --- a/drivers/soc/fsl/qe/gpio.c
> +++ b/drivers/soc/fsl/qe/gpio.c
> @@ -19,6 +19,7 @@
>  #include <linux/slab.h>
>  #include <linux/export.h>
>  #include <linux/property.h>
> +#include <linux/platform_device.h>
>
>  #include <soc/fsl/qe/qe.h>
>
> @@ -295,45 +296,62 @@ void qe_pin_set_gpio(struct qe_pin *qe_pin)
>  }
>  EXPORT_SYMBOL(qe_pin_set_gpio);
>
> -static int __init qe_add_gpiochips(void)
> +static int qe_gpio_probe(struct platform_device *ofdev)
>  {
> -	struct device_node *np;
> -
> -	for_each_compatible_node(np, NULL, "fsl,mpc8323-qe-pario-bank") {
> -		int ret;
> -		struct qe_gpio_chip *qe_gc;
> -		struct of_mm_gpio_chip *mm_gc;
> -		struct gpio_chip *gc;
> -
> -		qe_gc = kzalloc(sizeof(*qe_gc), GFP_KERNEL);
> -		if (!qe_gc) {
> -			ret = -ENOMEM;
> -			goto err;
> -		}
> +	struct device *dev = &ofdev->dev;
> +	struct device_node *np = dev->of_node;
> +	int ret;
> +	struct qe_gpio_chip *qe_gc;
> +	struct of_mm_gpio_chip *mm_gc;
> +	struct gpio_chip *gc;
> +
> +	qe_gc = kzalloc(sizeof(*qe_gc), GFP_KERNEL);
> +	if (!qe_gc) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
>
> -		spin_lock_init(&qe_gc->lock);
> +	spin_lock_init(&qe_gc->lock);
>
> -		mm_gc = &qe_gc->mm_gc;
> -		gc = &mm_gc->gc;
> +	mm_gc = &qe_gc->mm_gc;
> +	gc = &mm_gc->gc;
>
> -		mm_gc->save_regs = qe_gpio_save_regs;
> -		gc->ngpio = QE_PIO_PINS;
> -		gc->direction_input = qe_gpio_dir_in;
> -		gc->direction_output = qe_gpio_dir_out;
> -		gc->get = qe_gpio_get;
> -		gc->set = qe_gpio_set;
> -		gc->set_multiple = qe_gpio_set_multiple;
> +	mm_gc->save_regs = qe_gpio_save_regs;
> +	gc->ngpio = QE_PIO_PINS;
> +	gc->direction_input = qe_gpio_dir_in;
> +	gc->direction_output = qe_gpio_dir_out;
> +	gc->get = qe_gpio_get;
> +	gc->set = qe_gpio_set;
> +	gc->set_multiple = qe_gpio_set_multiple;
>
> -		ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
> -		if (ret)
> -			goto err;
> -		continue;
> +	ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);

Actually scratch my R-b, on second glance - this should now be
replaced with devm_gpiochip_add_data(). I don't see anything that
would be in the way now that it's an actuall platform device.

Bartosz

> +	if (!ret)
> +		return 0;
>  err:
> -		pr_err("%pOF: registration failed with status %d\n",
> -		       np, ret);
> -		kfree(qe_gc);
> -		/* try others anyway */
> -	}
> -	return 0;
> +	dev_err(dev, "registration failed with status %d\n", ret);
> +	kfree(qe_gc);
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id qe_gpio_match[] = {
> +	{
> +		.compatible = "fsl,mpc8323-qe-pario-bank",
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, qe_gpio_match);
> +
> +static struct platform_driver qe_gpio_driver = {
> +	.probe		= qe_gpio_probe,
> +	.driver		= {
> +		.name	= "qe-gpio",
> +		.of_match_table	= qe_gpio_match,
> +	},
> +};
> +
> +static int __init qe_gpio_init(void)
> +{
> +	return platform_driver_register(&qe_gpio_driver);
>  }
> -arch_initcall(qe_add_gpiochips);
> +arch_initcall(qe_gpio_init);
> --
> 2.49.0
>
>

