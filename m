Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EA9926A2E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 23:24:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=DEwxBebM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDt7r3Z7wz3dXD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 07:24:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=DEwxBebM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDt776Cm4z3cZ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 07:23:28 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a7541fad560so291512466b.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2024 14:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720041805; x=1720646605; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rmKjZalCS3qgqBNUJ2X1ny0z1S/+Ouz6++2zspqi0Zc=;
        b=DEwxBebMWQgnXd79/a7lE867h5teziQ9Azo2rIemM8NevQ4V69vqN1FbK7ydo8jhLw
         n1vvR6+PpE+DCzxE3m6I45E94Da0rLQIDqb1fCSoaIuYhd4hgog3vGts/Q6aXdOsxuK1
         lKJ+U1dyTfEivKabUjUIMdCvg501O9ulO+NsMiKsZ3CD5VOJzdsrAM9sMLK9CzhNkvXd
         /XBLE76+wCKoARpFUJNCOrLmV6voWzFaPkJgQwM/xdGCCK5Rx15ZV351AjdSZZczO/q7
         4LgztIr297pa1rpwB2k09KX66QtOfcSr+A+aZs8gYGpnKWJZ5g+3oFtvUJ69YLkJWPvE
         NgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720041805; x=1720646605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmKjZalCS3qgqBNUJ2X1ny0z1S/+Ouz6++2zspqi0Zc=;
        b=ks4nVvaqBbxmbwsu3WmI1f+2LdfBocGaE36e0pe0VneprSHMMolxYkTKn9XlwsJQCR
         FUbqqR6i6N4g2DAgCkzYYPc9zKd+GohN33WWuupTTb8CQg83sNap91LC0zFlktMGwo0t
         xXHYRtaQ7qDIISyawlJbVuFt9nypR2WPyBoOGVNXmaVV77JGnvJI9hF2kZadeYMBUBER
         FjcfaOQrN8Sfb4qddx1AkmAQdzNcqShfF1DrMRq7wkxw10KMIFOhdzHCkvkC176mhtQx
         ma0z5vrzcyCHvn+36x1Vh0hX6Y4dAPv8/R4YbJShmrXDsi+s7xiT7D3M+YusDrG5O890
         spJw==
X-Forwarded-Encrypted: i=1; AJvYcCW/JOSquj/mAxEsNgEU0WjZbtrtYrc1OPzWDnLq5lTJEZM0kevPW2AOzYDIzerDtIrMDdIhwvuDDZgiZROSgoseaWmrIaDf/Kjdjq5Q+g==
X-Gm-Message-State: AOJu0YwKfgfg+NTgq4rxwvua/vr0+2QbTvDBXHbb355rJhWiNaJTgSZ4
	+PjpbZNKq71qdNaw/boqv6xeiqALQdjZiTC499Efiy4lAhV2Z8xHAl/xui5+Q9A=
X-Google-Smtp-Source: AGHT+IEiDeirJZbiRR9WOgvKVRp5lPoOHJBTmQD67pQvhrzI/8nB0fQNgTn38F10sD2qUfAawYddVg==
X-Received: by 2002:a17:907:1c15:b0:a72:883f:f3dd with SMTP id a640c23a62f3a-a75144a8a02mr1042146966b.56.1720041804879;
        Wed, 03 Jul 2024 14:23:24 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:5696:f293:6e5e:98bf])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab0651c0sm541105666b.123.2024.07.03.14.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:23:24 -0700 (PDT)
Date: Wed, 3 Jul 2024 23:23:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 13/20] pwm: samsung: convert to
 of_property_for_each_u32_new()
Message-ID: <l2xret6kx4qwee3c3abmmhz5uop7zuobxath2eou2utklztkgl@c7lskt3xk3wj>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
 <20240703-of_property_for_each_u32-v1-13-42c1fc0b82aa@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3uu6b6ybcnfri4lk"
Content-Disposition: inline
In-Reply-To: <20240703-of_property_for_each_u32-v1-13-42c1fc0b82aa@bootlin.com>
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
Cc: Richard Leitner <richard.leitner@linux.dev>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pwm@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, Krzysztof Kozlowski <krzk@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-samsung-soc@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Emilio =?utf-8?B?TMOzcGV6?= <emilio@elopez.com.ar>, Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>, linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Shawn Guo <shawnguo@kernel.org>, linux-sunxi@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--3uu6b6ybcnfri4lk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Jul 03, 2024 at 12:36:57PM +0200, Luca Ceresoli wrote:
> Simplify code using of_property_for_each_u32_new() as the two additional
> parameters in of_property_for_each_u32() are not used here.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/pwm/pwm-samsung.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
> index efb60c9f0cb3..fef02a0b023e 100644
> --- a/drivers/pwm/pwm-samsung.c
> +++ b/drivers/pwm/pwm-samsung.c
> @@ -510,8 +510,6 @@ static int pwm_samsung_parse_dt(struct pwm_chip *chip)
>  	struct samsung_pwm_chip *our_chip =3D to_samsung_pwm_chip(chip);
>  	struct device_node *np =3D pwmchip_parent(chip)->of_node;
>  	const struct of_device_id *match;
> -	struct property *prop;
> -	const __be32 *cur;
>  	u32 val;
> =20
>  	match =3D of_match_node(samsung_pwm_matches, np);
> @@ -520,7 +518,7 @@ static int pwm_samsung_parse_dt(struct pwm_chip *chip)
> =20
>  	memcpy(&our_chip->variant, match->data, sizeof(our_chip->variant));
> =20
> -	of_property_for_each_u32(np, "samsung,pwm-outputs", prop, cur, val) {
> +	of_property_for_each_u32_new(np, "samsung,pwm-outputs", val) {
>  		if (val >=3D SAMSUNG_PWM_NUM) {
>  			dev_err(pwmchip_parent(chip),
>  				"%s: invalid channel index in samsung,pwm-outputs property\n",
>=20

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Feel free to merge this together with the change from the first patch.

Best regards
Uwe

--3uu6b6ybcnfri4lk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaFwUcACgkQj4D7WH0S
/k6PuggAu8WCVFGH6QIMKU3X2rf+i2w61Hm9yGoz/E1JXjYYwhvN07D9QQrg3lFk
uuvOlwgkdfuIHAsZupm4B503z6Cr+9e1c0yd2UsXZkR+Y5e5uAcWpFrqQPpsUjg6
K4y5iO46KFiNdoyIw5vaEqa9r+2MGaV/6utEBzK71uNVzWWnYAxGJSrp9BXXUlRN
ZUz4u7b3Yp+kmsIoFWF2SYjPB08bXS+XlNegSLFuhFLAklD1WtMgdfiyFyqVm20f
wxAtUX4pOe9E7HV+9qcyWKkbxhOVOOD6iG1CnatgtZoAeRfvmcNx+o2M4x8H0qXK
hetCnR7IsLL80SX5lvKiYYw2At4OEA==
=UQNH
-----END PGP SIGNATURE-----

--3uu6b6ybcnfri4lk--
