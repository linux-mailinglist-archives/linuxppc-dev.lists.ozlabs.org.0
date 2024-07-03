Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A8D925E21
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 13:34:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=av1fiU2G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDd3r0PsVz30Sv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 21:34:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=av1fiU2G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDd371Jd2z2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 21:34:10 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-52cecba8d11so6410082e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2024 04:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720006444; x=1720611244; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGjQIIef8f4D8V2nNTqkl2FTePoqDGpILu519rNKT2M=;
        b=av1fiU2GDCfI9ntsZsVQ6zBfCi8xDZ2oiiCl1YqmRSGGdyEI2GyMbguTfp7pj/nX7j
         c9MkU5jwRSsOZt3yR4uq+38HwrqGOFknyH4jNusgT70yXxD6gBxynnQyFpViG3tU1ev1
         QK85FtiSmjiVGQW1G7ts52nywILhA9+KYjIhXdMBk9URtpplTBJd9hSAGcUDPvF0aIXE
         R0mgyH1RrUbWkVsvyDgk1SxyEDyldCQXJxMDQ1KvVd6x2wK5oKYMJaBwoJCmGA/S1ucx
         aaN2THmj5Y/BmHdCPAwxD8laUyQmphZQeS8iB3+m+Kf0O4IcduW617dk8cgsxHA5pJKR
         zTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720006444; x=1720611244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGjQIIef8f4D8V2nNTqkl2FTePoqDGpILu519rNKT2M=;
        b=t9d58HaHLLFGTdOq9Ug0dNM25qKM3Yle9pauYysxZe81tQ0/N/WfPbsh1U1KZOji8E
         1pWhDE0vE8Mh7kc2rMUbPCDQfxoJ9ck1WJUlNB23rAB/Y920LUtgpiJFDYeC/vxSeuMB
         WyB9rdihXtzusCWnEPiUvZ8VOOjm7CraKUE4Pe/LPwO/6fp3lHuJuOmdt60m31ofjI/a
         oT/ugPQfZNyb4ovUzUWgmnWDfxHu8/qz34JIcgq50U6FWFBqmNBT9zCOgl4fttuuJrLB
         mKmVY8RVPxrnp87C269XOhZHZ8JsGXmte9A/8+pWqWRyPs4a7hqeevpTgJqin4YWrwK5
         ZoQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhnLUSDoYdMQZ+QO3xSp1HG3YcRY4sq6Catcw7CEY/tBSSP30an7pj0TRsK2mPzBQdXc4EEu6jOSDwBD8G3l1zQPnMJle+rCP2y4Edpw==
X-Gm-Message-State: AOJu0Yzu7JazGlCZSNIr2oVvfGsp+7wOEyv3w4Tt7RQIwVyBwf+DM7i1
	Q1qQS7SGvCXCpC3N8D5BeHuY3nGvDt+SEWY32HvCdFcArFw57/1KR6iPKpM9uRSDutro3XQTHui
	QnBKBvBAnxYrDxHroWvkEeKKvtq3fhjknqeIwyQ==
X-Google-Smtp-Source: AGHT+IHvYQvlnz9xSSjxxA0C9+ARDlWBymS0Nc+4OcDhYKcJABqlW19CRkZVdGMg0Rc503nQzevZwF7mryFVzLHp4+k=
X-Received: by 2002:ac2:4e09:0:b0:52c:d8e9:5d8b with SMTP id
 2adb3069b0e04-52e826678a3mr7597242e87.25.1720006444010; Wed, 03 Jul 2024
 04:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com> <20240703-of_property_for_each_u32-v1-9-42c1fc0b82aa@bootlin.com>
In-Reply-To: <20240703-of_property_for_each_u32-v1-9-42c1fc0b82aa@bootlin.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Jul 2024 13:33:52 +0200
Message-ID: <CAMRc=MfjdCxbQfthWXcgz2tC+2_owfx73DBq9LqN_4wFvWwgqA@mail.gmail.com>
Subject: Re: [PATCH 09/20] gpio: brcmstb: convert to of_property_for_each_u32_new()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Richard Leitner <richard.leitner@linux.dev>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pwm@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-samsung-soc@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, Lee Jones <lee@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>, linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Shawn Guo <shawnguo@kernel.org>, linux-sunxi@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 3, 2024 at 12:38=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Simplify code using of_property_for_each_u32_new() as the two additional
> parameters in of_property_for_each_u32() are not used here.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpio/gpio-brcmstb.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
> index 8dce78ea7139..77557bc596cd 100644
> --- a/drivers/gpio/gpio-brcmstb.c
> +++ b/drivers/gpio/gpio-brcmstb.c
> @@ -591,8 +591,6 @@ static int brcmstb_gpio_probe(struct platform_device =
*pdev)
>         void __iomem *reg_base;
>         struct brcmstb_gpio_priv *priv;
>         struct resource *res;
> -       struct property *prop;
> -       const __be32 *p;
>         u32 bank_width;
>         int num_banks =3D 0;
>         int num_gpios =3D 0;
> @@ -636,8 +634,7 @@ static int brcmstb_gpio_probe(struct platform_device =
*pdev)
>         flags =3D BGPIOF_BIG_ENDIAN_BYTE_ORDER;
>  #endif
>
> -       of_property_for_each_u32(np, "brcm,gpio-bank-widths", prop, p,
> -                       bank_width) {
> +       of_property_for_each_u32_new(np, "brcm,gpio-bank-widths", bank_wi=
dth) {
>                 struct brcmstb_gpio_bank *bank;
>                 struct gpio_chip *gc;
>
>
> --
> 2.34.1
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
