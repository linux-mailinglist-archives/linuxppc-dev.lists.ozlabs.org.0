Return-Path: <linuxppc-dev+bounces-11255-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A522B34044
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 15:02:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9WDB2Kmkz3cjt;
	Mon, 25 Aug 2025 23:02:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::233"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756126954;
	cv=none; b=aEUgy5qRjxsqLxKiJVK5tdbzE9ss6goqKTn0VO1rZaTpKKns9qiShE2IPRh6Um4xUtKK9/Ubq9JPCDI5braJnmrCKC773vxDOIQtGgEPJVZIPizVx0Qt/Cces2UKJ5xTrWE0PNEenNqrpjXObtQfcNouPv9FJDqVknpKJhrazvcAmugtLmCm9H1wcFqBmLcIOXRtKPVH+fgcA8V7cuOWyUuSJriOBHfDdD1YcMFTWAVS0KtXY2eus/Tota2laHveNLoFbS7CN+I9Z9irwRQ6jI2zwmrNfWyib66EXijiy5IDziDxItav+WnPoGgUOofVDIX2IcahrLdUgq3eYCtZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756126954; c=relaxed/relaxed;
	bh=7qlNbTonn3k9dHTKDIxbFD3ecc/jQTJTOnDOSezLWog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DdgLRTlOJvAmXO8R2vkLNbHe+UiG80UGIUVFGYWhYMd6csX0qS4x+GsE6J07R4MeORcO5+D8ZG62aqQpvHtOe0qpUicilsTdxHTszUTDPLYOXkzCdVKweepUrlCuz8rIUailkC/k7jvZaNyvcaj62GCdT4T3GL/zOVaLPUr5fPQVRNJLXX1xc7CCnwQD5iOzyHdrkFoYQnQHICQpRbsoeNpM7xYb9v80myYkhge9OLsIkNONDzBHTeg9xQkFiSDIcgvQnKF8sG32/YLqxlMXjmPr+Zn+Jq/1xrcvj7qJLVppalF5fDgkOnMwDn3dBB7QEdAnoJ7BaLmdR6zqKM8Gjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=hzq3EpDk; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=hzq3EpDk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9WD90y4hz3cjm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 23:02:32 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3366f66a04eso8612181fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 06:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756126950; x=1756731750; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qlNbTonn3k9dHTKDIxbFD3ecc/jQTJTOnDOSezLWog=;
        b=hzq3EpDkWlUVUo7FbnczQ6ORBPWo5YHucBlqwGaKXDg58m/n7KQ+yfPRuNdGd65XHZ
         PyTnj86tI1RfdkARvZHS2hnz089e023AIb0By7Ft93Wwyx2yniduckxslMzolEPwYQl7
         He/tfbCGT1kjX6wgVbo2C9IgZhYhZNQw5MMJezOt6avGZKrmCWFd9T343MlQISFpt2j9
         uiNMFaM9aA+aRIPjC4HqRkYnmrbMp6Wl1366aZQNwUlVba10AhDDCULtqo3y5dalsml0
         BDtAq3UA9xJa3mstkF6khpILb4+isd9auxEbjlpc8Xi06zj/9M558OUYmUQV7bPCVLIg
         0sug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756126950; x=1756731750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qlNbTonn3k9dHTKDIxbFD3ecc/jQTJTOnDOSezLWog=;
        b=g9y+TG41N+o/Ek6I5Pj6sArJq5eToYlgaj27P+OrpU8akbdZJxDwxRm7QOnCwX+FBb
         UY+8DM86pGPoJRlYtvSxLmidZmx5KM6cdTq3q1i+oasNcG35I1Un3NH041ZM+LQ8Vnsz
         +09OlayjeAUMQnVLHuQ9GBPhnOnQIWLuusX5RSirEJZu5kTSslsO+XCOReo2SZEyNi34
         DFmxLqhWYQXyJSNQw+pnSNYva1eqaygxTg9z59nrQ+VmpA2WrdpEHOFa45uazO9QdECm
         qWSEzVkK1r1SNRBv7Ke1ZK0VqjYjvjDMlM2pvJr9YtKntPQc6Kd1xOZTvrj99bxki3cW
         uXBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC0yUvDtn27r6bvU+JLekxNudBr+SA6XwiwCXmkTpyVKqTE1CPGhZHrBqS13btOc1nmgrCnFCS54dmyPM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxo3ZkNzVuxIIgwt1YYmNJszoGcE+HNAVI3/A4RCj9TJmD7fyOx
	G9JOgHjzZpuht3zyDBx5nU1ydJgD3LtvpeWHmkSrV13UCesrswj3X4ysTCqYMDYCuW5B5o/K/PX
	+CBYecngqagA2yS8IgIzspuAWJWvJBrZeISgLRAUnIg==
X-Gm-Gg: ASbGncsoHe6FyeNiHbGTtXAsAuMY14cPUxzZ0why/aYLMmvSoV5e8nuxVbIH4isg9y/
	cPzdbpbJihmsupCpoBYSx3V8Lx3/z7cqf/r0jHxdnSa2HMZL2XMlX4PthfH/3BZWV8wJoNN+rkt
	Z9CGE3ujntWpOn6kmwnqlUscv3SjGfO+Sb8v1RfmVV4fcQRqKXmhabZw3r8miB5AbsBWoD+RxwE
	CD9OnRal51Ry6VI+lLhCOW+89eWzpNzkLbQNBQ=
X-Google-Smtp-Source: AGHT+IE1cPp7/f2NM1rVH6MrrLLid9uO1WDm7Tr7hJO4vukRyYAlROcawa5lviPhg4lAzMblh0nEsperMiDMgmGGDrU=
X-Received: by 2002:a05:651c:1501:b0:336:511a:5cd9 with SMTP id
 38308e7fff4ca-336511a5e23mr34251991fa.45.1756126949664; Mon, 25 Aug 2025
 06:02:29 -0700 (PDT)
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
References: <cover.1756104334.git.christophe.leroy@csgroup.eu> <372550a2633586d2f98b077d3f520f3262ca0e2a.1756104334.git.christophe.leroy@csgroup.eu>
In-Reply-To: <372550a2633586d2f98b077d3f520f3262ca0e2a.1756104334.git.christophe.leroy@csgroup.eu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 15:02:18 +0200
X-Gm-Features: Ac12FXy9S__uk5RovBEBeE_m8RhEgixkMtqWHgPxd5PT8kPlrjjc0TrS2oxEL_I
Message-ID: <CAMRc=McNAC-pN1=UUrhXVx8qQiv37HRubui6DMLVRcGg2ZONKA@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] soc: fsl: qe: Add support of IRQ in QE GPIO
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 25, 2025 at 8:53=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> In the QE, a few GPIOs are IRQ capable. Similarly to
> commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
> GPIO"), add IRQ support to QE GPIO.
>
> Add property 'fsl,qe-gpio-irq-mask' similar to
> 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
>
> Here is an exemple for port B of mpc8323 which has IRQs for
> GPIOs PB7, PB9, PB25 and PB27.
>
>         qe_pio_b: gpio-controller@1418 {
>                 compatible =3D "fsl,mpc8323-qe-pario-bank";
>                 reg =3D <0x1418 0x18>;
>                 interrupts =3D <4 5 6 7>;
>                 interrupt-parent =3D <&qepic>;
>                 gpio-controller;
>                 #gpio-cells =3D <2>;
>                 fsl,qe-gpio-irq-mask =3D <0x01400050>;
>         };
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/soc/fsl/qe/gpio.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
> index a338469cebe4..91d469403126 100644
> --- a/drivers/soc/fsl/qe/gpio.c
> +++ b/drivers/soc/fsl/qe/gpio.c
> @@ -13,6 +13,7 @@
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> +#include <linux/of_irq.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/driver.h>
>  #include <linux/slab.h>
> @@ -32,6 +33,8 @@ struct qe_gpio_chip {
>
>         /* saved_regs used to restore dedicated functions */
>         struct qe_pio_regs saved_regs;
> +
> +       int irq[32];
>  };
>
>  static void qe_gpio_save_regs(struct qe_gpio_chip *qe_gc)
> @@ -135,6 +138,13 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, uns=
igned int gpio, int val)
>         return 0;
>  }
>
> +static int qe_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio)
> +{
> +       struct qe_gpio_chip *qe_gc =3D gpiochip_get_data(gc);
> +
> +       return qe_gc->irq[gpio] ? : -ENXIO;
> +}
> +
>  struct qe_pin {
>         /*
>          * The qe_gpio_chip name is unfortunate, we should change that to
> @@ -295,6 +305,7 @@ static int qe_gpio_probe(struct platform_device *ofde=
v)
>         struct device_node *np =3D dev->of_node;
>         struct qe_gpio_chip *qe_gc;
>         struct gpio_chip *gc;
> +       u32 mask;
>
>         qe_gc =3D devm_kzalloc(dev, sizeof(*qe_gc), GFP_KERNEL);
>         if (!qe_gc)
> @@ -302,6 +313,14 @@ static int qe_gpio_probe(struct platform_device *ofd=
ev)
>
>         spin_lock_init(&qe_gc->lock);
>
> +       if (!of_property_read_u32(np, "fsl,qe-gpio-irq-mask", &mask)) {

Please use device_property_read_u32 and stop including of.h if
possible (it seems it is upon visual inspection).

Bart

> +               int i, j;
> +
> +               for (i =3D 0, j =3D 0; i < ARRAY_SIZE(qe_gc->irq); i++)
> +                       if (mask & (1 << (31 - i)))
> +                               qe_gc->irq[i] =3D irq_of_parse_and_map(np=
, j++);
> +       }
> +
>         gc =3D &qe_gc->gc;
>
>         gc->base =3D -1;
> @@ -311,6 +330,7 @@ static int qe_gpio_probe(struct platform_device *ofde=
v)
>         gc->get =3D qe_gpio_get;
>         gc->set =3D qe_gpio_set;
>         gc->set_multiple =3D qe_gpio_set_multiple;
> +       gc->to_irq =3D qe_gpio_to_irq;
>         gc->parent =3D dev;
>         gc->owner =3D THIS_MODULE;
>
> --
> 2.49.0
>

