Return-Path: <linuxppc-dev+bounces-10871-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBADFB22A1E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 16:21:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1Yb56H77z2xlL;
	Wed, 13 Aug 2025 00:21:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::134"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755008481;
	cv=none; b=JYvZkp/HXf5v8rxK8y6Ijs0JFUX1hUPnTm7lh/RVALscNZAlyhUR8BK5N+3YRbyhS9zW4TzzjfEbcIwekUKpl4NMrlcgARpJzmKA5GW0PFmdjozUevIMIfTZhBDFcf96iR6pzm8ZMTv+Bj/9RJIBf0bvfBxtVeZtKRBGoVwamIlOjFZH98Cq5K9agtDrexs0SnteSoy3yY8wXLiNfPf6TMSUmRq2u6YdMIteO1BWKdURhk8m+pdtrDKvA6q5/I24JxO19LKOFfEpn9skXiB3XdJVlAH5eV/PXFUn3SgzLxPWPNPkyDYsN0JypTqPzUv/69IrD5VJYesBawRx4NPTEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755008481; c=relaxed/relaxed;
	bh=1pIv9AKRbkc8MISxXeVoPZny7F4ALH4S067Y82mAaRs=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QM9f9oFeFELJqmL98Aqgek99XNCH1WwfRBX8kno7Qh+ts/AROsp450foUveztK5Bbkpui+NsT7wYd8KKKOAR4PKwrIjsyMKuv4MWuQkJDItqjUTemNRd8+vHxKit53pyWx5+x3ByPqwoU8lC0PM/GV2GOI5ObLU3U56ivxZHyvsLAXAJwgjAqJPiOMyO34WYHYuwp9kQYdHTARygcXRknUd9zZw/cuGA2RjrmKsz3cs90NG2QjyQac1L0arL7wQdBgBQjFM/f4/FFnnSzRgFSQ5WV/J0rCvrgXH06HTsDI4bSe/hg4ZfZd3fk38EWA5v/t6joTqNtRJOkyN8VmjiKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=TnbZL79S; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=TnbZL79S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1Yb46cVPz2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 00:21:20 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55ba26abd62so6153896e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 07:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755008477; x=1755613277; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1pIv9AKRbkc8MISxXeVoPZny7F4ALH4S067Y82mAaRs=;
        b=TnbZL79STBSpg+JvG29x063POHuPv3Mk9wfjX4oXUjfc6diWduPolgVkij0mCLTFt9
         P0WI76iim/aegG5a/ahRtib4zXCIJb6OdOgeImPFU1EFSdmbukdsxjYxN0tkDmqxeF1u
         MUKV9zvTDxguQcg/JeIhmv6qawWwKS+hhPsH060DGHmNzS59Knmf2CsbxBaReydzFlH8
         twyLw1WN6737BmPLsNxsUrKnta6BXlCSVh5fULY7u1iPIp8G6jFHVNt5lxQvJ3ad1PsD
         6tAbb9YyX2hjvitaunV0jT19PDpZLsbM0SvRIM3bDBMdxLLBtjU5+uXt0+Y2R1f6D/6u
         Jpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755008477; x=1755613277;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1pIv9AKRbkc8MISxXeVoPZny7F4ALH4S067Y82mAaRs=;
        b=pwIYuV7RMYAiEWxaQ/m4/INdoXDX5696G7JXiYWcD8JcZvI5wMmPfz+b0N7eERzTkk
         1gk645NPRuLF+rIIx37LtbPIyX9QqPs2VBINYz53/Gwv1tYrmmwolA/qlRRsxfgZFuSs
         gyWLayYkcFwIoARbGg9m6Rjar0kEa8k4YWpf/khT66AQDuj2XxYbGUNTeKpf7sn+QvDy
         CO5LAWdBLIAa+LaeloTVNEn3YLHamEF88AabyALQjtncFWHsEB3HzxpO8yGUEqBb61bL
         tigkMCY/Yo5mA5SvW0j4GDwsnMjsCuFAHenNfC7z+xAaMTLbmYnuovhJdNkVDepH6lsU
         F0kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUurCbxXrVPUQ3RmaO+k+E3Jj5GHKD6dYJQQKI6n/r5VtCBhiCL0pWhWITdxZq1B6NiIsF4/cJ4f1VJQEk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzMIEWifpOy7cFGFhgzXmWnvpeuygXHE4k/0CBadHyGxFhFvZqE
	aVA6HtAxgr5RG0agE+KZaUuHAxT4Mza11QxXDEDHRBh3vHIsqwhiqIRhe00lzAWmjEmkF2T6+dB
	cVcQg6N0IkZ3dZAdCeQa63VUT6jeTdJ8v4gzyy6+KEg==
X-Gm-Gg: ASbGncv0zwnpdNXXOzWqPGZizkCMEZV7eCbku+mBwsKjw8L278u6Hr5pG24M2eDwUci
	gomFjoP4Ejs7aCuZco3YIyUyQrp8p4x19QzshqAqFl3/UgP8CzMworv9vBHAIEHElucqEY6Ij9N
	MwGAv2vzi80VSFWkaQKuaaKQRVayAmZkt5KWow/7LUlOe4qf9I+npmz1feEd+9aJqesx6SzP8kf
	KZWJQD57yA5vFpBMXhUQhWIQ/4ZhCWqWS2htyb9rWuOuhg=
X-Google-Smtp-Source: AGHT+IFpF97gii6lher4rE+Sc7yp8gRIDiPYexKTadETndnmLkjhegMyhbbEFCVjEnmVLwNTmnfVhhtavmnpc1sTYHY=
X-Received: by 2002:a05:6512:15a7:b0:55c:bfe7:f056 with SMTP id
 2adb3069b0e04-55cd759716emr1203480e87.18.1755008477463; Tue, 12 Aug 2025
 07:21:17 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Aug 2025 10:21:16 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Aug 2025 10:21:16 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <22b3847fd0011024c10aff48f1e5223894ce718a.1754996033.git.christophe.leroy@csgroup.eu>
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
References: <cover.1754996033.git.christophe.leroy@csgroup.eu> <22b3847fd0011024c10aff48f1e5223894ce718a.1754996033.git.christophe.leroy@csgroup.eu>
Date: Tue, 12 Aug 2025 10:21:16 -0400
X-Gm-Features: Ac12FXwYayzSV7JbaH60c8JY_pypspfPypyhh9tZpmA_WhfNTdKcELAccenZyWo
Message-ID: <CAMRc=Mce3LHtCUd-oO3uZjVAS-fywn86Zn+qmehZPJTKLzk6Sg@mail.gmail.com>
Subject: Re: [PATCH 3/4] soc: fsl: qe: Add support of IRQ in QE GPIO
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

On Tue, 12 Aug 2025 13:02:53 +0200, Christophe Leroy
<christophe.leroy@csgroup.eu> said:
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
> 	qe_pio_b: gpio-controller@1418 {
> 		#gpio-cells = <2>;
> 		compatible = "fsl,mpc8323-qe-pario-bank";
> 		reg = <0x1418 0x18>;
> 		interrupts = <4 5 6 7>;
> 		fsl,qe-gpio-irq-mask = <0x01400050>;
> 		interrupt-parent = <&qepic>;
> 		gpio-controller;
> 	};
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/soc/fsl/qe/gpio.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
> index b502377193192..59145652ad850 100644
> --- a/drivers/soc/fsl/qe/gpio.c
> +++ b/drivers/soc/fsl/qe/gpio.c
> @@ -13,6 +13,7 @@
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/of.h>
> +#include <linux/of_irq.h>
>  #include <linux/gpio/legacy-of-mm-gpiochip.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/driver.h>
> @@ -32,6 +33,8 @@ struct qe_gpio_chip {
>
>  	/* saved_regs used to restore dedicated functions */
>  	struct qe_pio_regs saved_regs;
> +
> +	int irq[32];
>  };
>
>  static void qe_gpio_save_regs(struct of_mm_gpio_chip *mm_gc)
> @@ -141,6 +144,13 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
>  	return 0;
>  }
>
> +static int qe_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
> +
> +	return qe_gc->irq[gpio] ? : -ENXIO;
> +}
> +
>  struct qe_pin {
>  	/*
>  	 * The qe_gpio_chip name is unfortunate, we should change that to
> @@ -304,6 +314,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
>  	struct qe_gpio_chip *qe_gc;
>  	struct of_mm_gpio_chip *mm_gc;
>  	struct gpio_chip *gc;
> +	u32 mask;
>
>  	qe_gc = kzalloc(sizeof(*qe_gc), GFP_KERNEL);
>  	if (!qe_gc) {
> @@ -313,6 +324,14 @@ static int qe_gpio_probe(struct platform_device *ofdev)
>
>  	spin_lock_init(&qe_gc->lock);
>
> +	if (!of_property_read_u32(np, "fsl,qe-gpio-irq-mask", &mask)) {

AFAICT: you can drop the of.h include and just use
device_property_present() here.

> +		int i, j;
> +
> +		for (i = 0, j = 0; i < 32; i++)
> +			if (mask & (1 << (31 - i)))
> +				qe_gc->irq[i] = irq_of_parse_and_map(np, j++);
> +	}
> +
>  	mm_gc = &qe_gc->mm_gc;
>  	gc = &mm_gc->gc;
>
> @@ -323,6 +342,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
>  	gc->get = qe_gpio_get;
>  	gc->set = qe_gpio_set;
>  	gc->set_multiple = qe_gpio_set_multiple;
> +	gc->to_irq = qe_gpio_to_irq;
>
>  	ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
>  	if (!ret)
> --
> 2.49.0
>
>

Bart

