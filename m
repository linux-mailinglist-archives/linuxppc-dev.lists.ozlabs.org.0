Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A71BF93B905
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 00:10:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SEaWmgja;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTpB34SXmz3d4F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 08:10:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SEaWmgja;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTb8b5YtVz3cyL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 23:53:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFA8161212
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 13:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 393B5C4AF16
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 13:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721829229;
	bh=JHsErZ1Ymd3xIUMEC7/hpzB8p/mlL/O9e+IDU+AKN8I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SEaWmgjaMdyUPpB+3WNdnu/Gu9TlKShfVaI3kaPtTDUgi1+yOW7Vw3WRWHs1vW6yC
	 Y3vEwLQLJbKWWj7Dx4mkYjG+Fx1/bCL3TcivZM6ZsDaDYvp/z9r7LEiiNnP5NYrZkJ
	 SYAnbs406vjYmOQu2+pBQlU/xloyJFw0x9MXtYErO8Y/t++x+Y1gVMuplBSs0dRN1A
	 aFLBZLP7F5kEjA3DsPqSbJfUS1DcN6ec3Q2ZQcBVKquPBr0eI+0v6rCG5wVA5SqCn8
	 HZaFcNq4Nj/FL+NccJEe0+3FebAjkiI31jd7YbrmcZFhm5ZDnSwVEnGW06SIOREjmw
	 xrF3Btp6K9YPg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52efba36802so5595418e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 06:53:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWk5mMnmHD8XiuHaWegsYCMv8oIqajCi1V6z6qBmdc8DMcDMkpHGnopHR20MG5vjMtRbOoUglPPfHILfbB3Qcg/W45Vlzx/IKvdfnCgEw==
X-Gm-Message-State: AOJu0YxDzA8VWg6Jm3eA0mlkHGDqPmxC153vjfGs9OjMdm1BIxceZCUH
	zI/4939IWF8myJXRkkeHSstaMedYW162VH6Hv1YEy/HVxAG2Iq3pqzMcDf+y0XcyySCHLBHnLr6
	26LUokYectDO4BkuIpMlCrfN6ug==
X-Google-Smtp-Source: AGHT+IEk3YhHLLuWHQez8La65BtnRIR9t5/9BONqzEk5mOwWdTbwESXZpTYF2WmMXYwp6gfL+EkMMSd8FeS9sIIdSCk=
X-Received: by 2002:a05:6512:3984:b0:51a:f689:b4df with SMTP id
 2adb3069b0e04-52efb7db65bmr9357884e87.44.1721829216849; Wed, 24 Jul 2024
 06:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240717-of_property_for_each_u32-v2-1-4060990f49c9@bootlin.com>
 <1e36b1ba8af3584128550822a70cb072.sboyd@kernel.org> <20240718085651.63ddfb20@booty>
In-Reply-To: <20240718085651.63ddfb20@booty>
From: Rob Herring <robh@kernel.org>
Date: Wed, 24 Jul 2024 08:53:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKtOTgoDgfwq9Guvt_LbtnHHGJ+PDt-wgVRHU=oVzwhHw@mail.gmail.com>
Message-ID: <CAL_JsqKtOTgoDgfwq9Guvt_LbtnHHGJ+PDt-wgVRHU=oVzwhHw@mail.gmail.com>
Subject: Re: [PATCH v2] of: remove internal arguments from of_property_for_each_u32()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 25 Jul 2024 08:10:17 +1000
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
Cc: linux-riscv@lists.infradead.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Lee Jones <lee@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev, Richard Leitner <richard.leitner@linux.dev>, Jaroslav Kysela <perex@perex.cz>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, patches@opensource.cirrus.com, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Fabio Estevam <festevam@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, Jiri Slaby <jirislaby@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Daniel Lezcano <daniel.lezcano@linaro.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Andreas Kemnade <andreas@kemnade.info>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Miguel Ojeda <ojeda@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-usb@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Dong Aisheng <aisheng.dong@nxp.com>, "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>, linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Damien Le Moal <dlemoal@kernel.org>, linux-pwm@vger.kernel.org, linux-sound@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chester Lin <chester62515@gmail.com>, Roger Quadros <rogerq@kernel.org>, Matthias Brugger <mbrugger@suse.com>, Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, Samuel Holland <samuel@sholland.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, linux-sunxi@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 18, 2024 at 1:57=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Stephen,
>
> On Wed, 17 Jul 2024 16:33:34 -0700
> Stephen Boyd <sboyd@kernel.org> wrote:
>
> > > @@ -1191,20 +1191,24 @@ static int si5351_dt_parse(struct i2c_client =
*client,
> > >          * property silabs,pll-source : <num src>, [<..>]
> > >          * allow to selectively set pll source
> > >          */
> > > -       of_property_for_each_u32(np, "silabs,pll-source", prop, p, nu=
m) {
> > > +       sz =3D of_property_read_variable_u32_array(np, "silabs,pll-so=
urce", array, 2, 4);
> > > +       sz =3D (sz =3D=3D -EINVAL) ? 0 : sz; /* Missing property is O=
K */
> > > +       if (sz < 0)
> > > +               return dev_err_probe(&client->dev, sz, "invalid pll-s=
ource");
> >
> > Needs a newline on the printk message.
>
> Ouch! Fix queued for v3.

I need v3 like today if I'm going to send it for rc1.

Rob
