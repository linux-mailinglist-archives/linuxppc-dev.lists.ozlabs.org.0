Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 875EE934514
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 01:40:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m/tYahsI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPXVc3GTjz3cVm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 09:40:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m/tYahsI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPXLr1KHdz30Vk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 09:33:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3527261976;
	Wed, 17 Jul 2024 23:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59E2C2BD10;
	Wed, 17 Jul 2024 23:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721259216;
	bh=/vntp9yziGCzvLchAgMHXkRgHgytqWIKu6wEIUPrxlQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=m/tYahsI7GcAsn0eTT4WF3W3BC90QDmQbipyzN62A8EQrxsGjJuDHvLvxJTe9ClPb
	 SxfN7qFIZCngz7gztSRBpz2eEzrUCy4jUV1ydb6l65kKp+wAq1QWNBsZy5KABTYVQR
	 tq+sCrNewY9i6SpEr8eZIOLHRCKt7Ey7NF7M1f0KLVQ+ZcrJeHrDZjeNPd1EsmFr+5
	 4zTlnoxdZoC9fCxuCKnodh5r8fGggVstFE9nygPb3O0rvXh68bBkRq/sZ9W1kFT6Vp
	 PNOejeGFpQtHdc4Q11bbXLpU6fBG4A6iIgpFlB92tbnMPPxy5xVe6T52lr0cg39ZBV
	 sbhS/c+mN45rg==
Message-ID: <1e36b1ba8af3584128550822a70cb072.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240717-of_property_for_each_u32-v2-1-4060990f49c9@bootlin.com>
References: <20240717-of_property_for_each_u32-v2-1-4060990f49c9@bootlin.com>
Subject: Re: [PATCH v2] of: remove internal arguments from of_property_for_each_u32()
From: Stephen Boyd <sboyd@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Alim Akhtar <alim.akhtar@samsung.com>, Andreas Kemnade <andreas@kemnade.info>, Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Andersson <andersson@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chen-Yu Tsai <wens@csie.org>, Chester Lin <chester62515@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Damien Le Moal <dlemoal@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>, Doug Berger <opendmb@gmail.com>, Emilio =?utf-8?q?L=C3=B3pez?= <emilio@elopez.com.ar>, Fabio Estevam <festevam@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jacky Bai <ping.bai@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jiri Slaby
  <jirislaby@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger <mbrugger@suse.com>, Michael Ellerman <mpe@ellerman.id.au>, Michael Turquette <mturquette@baylibre.com>, Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Naveen N. Rao <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Richard Leitner <richard.leitner@linux.dev>, Rob Herring <robh@kernel.org>, Roger Quadros <rogerq@kernel.org>, Samuel Holland <samuel@sholland.org>, Saravana Kannan <saravanak@google.com>, Shawn Guo <shawnguo@kernel.org>, Takashi Iwai <tiwai@suse.com>, Thomas Gleixner 
 <tglx@linutronix.de>, Tony Lindgren <tony@atomide.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Date: Wed, 17 Jul 2024 16:33:34 -0700
User-Agent: alot/0.10
X-Mailman-Approved-At: Thu, 18 Jul 2024 09:39:49 +1000
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
Cc: linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org, llvm@lists.linux.dev, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-serial@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>, linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quoting Luca Ceresoli (2024-07-17 09:16:32)
> diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
> index 4ce83c5265b8..d4904f59f83f 100644
> --- a/drivers/clk/clk-si5351.c
> +++ b/drivers/clk/clk-si5351.c
> @@ -1175,8 +1175,8 @@ static int si5351_dt_parse(struct i2c_client *clien=
t,
>  {
>         struct device_node *child, *np =3D client->dev.of_node;
>         struct si5351_platform_data *pdata;
> -       struct property *prop;
> -       const __be32 *p;
> +       u32 array[4];
> +       int sz, i;
>         int num =3D 0;
>         u32 val;
> =20
> @@ -1191,20 +1191,24 @@ static int si5351_dt_parse(struct i2c_client *cli=
ent,
>          * property silabs,pll-source : <num src>, [<..>]
>          * allow to selectively set pll source
>          */
> -       of_property_for_each_u32(np, "silabs,pll-source", prop, p, num) {
> +       sz =3D of_property_read_variable_u32_array(np, "silabs,pll-source=
", array, 2, 4);
> +       sz =3D (sz =3D=3D -EINVAL) ? 0 : sz; /* Missing property is OK */
> +       if (sz < 0)
> +               return dev_err_probe(&client->dev, sz, "invalid pll-sourc=
e");

Needs a newline on the printk message.

> +       if (sz % 2)
> +               return dev_err_probe(&client->dev, -EINVAL,
> +                                    "missing pll-source for pll %d\n", a=
rray[sz - 1]);
> +
> +       for (i =3D 0; i < sz; i +=3D 2) {
> +               num =3D array[i];
> +               val =3D array[i + 1];
> +
>                 if (num >=3D 2) {
>                         dev_err(&client->dev,
>                                 "invalid pll %d on pll-source prop\n", nu=
m);
>                         return -EINVAL;
>                 }
> =20
> -               p =3D of_prop_next_u32(prop, p, &val);
> -               if (!p) {
> -                       dev_err(&client->dev,
> -                               "missing pll-source for pll %d\n", num);
> -                       return -EINVAL;
> -               }
> -
>                 switch (val) {
>                 case 0:
>                         pdata->pll_src[num] =3D SI5351_PLL_SRC_XTAL;
> @@ -1232,19 +1236,24 @@ static int si5351_dt_parse(struct i2c_client *cli=
ent,
>         pdata->pll_reset[0] =3D true;
>         pdata->pll_reset[1] =3D true;
> =20
> -       of_property_for_each_u32(np, "silabs,pll-reset-mode", prop, p, nu=
m) {
> +       sz =3D of_property_read_variable_u32_array(np, "silabs,pll-reset-=
mode", array, 2, 4);
> +       sz =3D (sz =3D=3D -EINVAL) ? 0 : sz; /* Missing property is OK */
> +       if (sz < 0)
> +               return dev_err_probe(&client->dev, sz, "invalid pll-reset=
-mode");

Needs a newline on the printk message.

> +       if (sz % 2)
> +               return dev_err_probe(&client->dev, -EINVAL,
> +                                    "missing pll-reset-mode for pll %d\n=
", array[sz - 1]);
> +

With those fixed

Acked-by: Stephen Boyd <sboyd@kernel.org> # clk
