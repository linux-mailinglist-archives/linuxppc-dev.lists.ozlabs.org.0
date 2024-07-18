Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3262B934983
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 10:03:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=OlB6nsD5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPlgG4SqQz3brC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 18:03:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=OlB6nsD5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPkBh55DTz3cHP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 16:57:13 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66B00C0011;
	Thu, 18 Jul 2024 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721285821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TgZHkXL2FGs1/bjZPDSboGR72yBe//NfgloPvNTjUQ0=;
	b=OlB6nsD5RtGZmYjd7bhjEoZx7QMkbbOT8V45YhxxCFz4y2iiCJe+cf2PVPl+VsXD6UUMqk
	Yc28bGhZQ13OubzP5CW/pjPqqFo91MRM0eVoREVGLvn0MLgNZy6pPxquFKWhNBkv4SbFT2
	sax9ioW5vC5M5bokQz4XncM9ZdU0GCDemzBwA+l1XJdTnXTEUKHI48dxPqMAjv00+G3aQG
	rBXI5/ojqb79XSjovNP74Rn6wSf1My85vfzfK9OmlUEoc3d8vGPg+knHhqSD5yHTRQLUcZ
	BDxiKiWHxBRawYhcLiwX+N2Krj0xmgk4IRTokaqbJaztXMntEG+p6mo1v3ON7A==
Date: Thu, 18 Jul 2024 08:56:51 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2] of: remove internal arguments from
 of_property_for_each_u32()
Message-ID: <20240718085651.63ddfb20@booty>
In-Reply-To: <1e36b1ba8af3584128550822a70cb072.sboyd@kernel.org>
References: <20240717-of_property_for_each_u32-v2-1-4060990f49c9@bootlin.com>
	<1e36b1ba8af3584128550822a70cb072.sboyd@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Approved-At: Thu, 18 Jul 2024 18:03:04 +1000
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
Cc: linux-riscv@lists.infradead.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Lee Jones <lee@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev, Richard Leitner <richard.leitner@linux.dev>, Jaroslav Kysela <perex@perex.cz>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, patches@opensource.cirrus.com, Uwe =?UTF-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Fabio Estevam <festevam@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Emilio =?UTF-8?Q?L=C3=B3pez?= <emilio@elopez.com.ar>, Jiri Slaby <jirislaby@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Daniel Lezcano <daniel.lezcano@linaro.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Andreas Kemnade <andreas@kemnade.info>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Miguel Ojeda <ojeda@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-usb@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Dong Aisheng <aisheng.dong@nxp.com>, "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>, linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Damien Le Moal <dlemoal@kernel.org>, linux-pwm@vger.kernel.org, linux-sound@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chester Lin <chester62515@gmail.com>, Roger Quadros <rogerq@kernel.org>, Matthias Brugger <mbrugger@suse.com>, Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, Samuel Holland <samuel@sholland.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, Uwe =?UTF-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, linux-sunxi@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Stephen,

On Wed, 17 Jul 2024 16:33:34 -0700
Stephen Boyd <sboyd@kernel.org> wrote:

> > @@ -1191,20 +1191,24 @@ static int si5351_dt_parse(struct i2c_client *client,
> >          * property silabs,pll-source : <num src>, [<..>]
> >          * allow to selectively set pll source
> >          */
> > -       of_property_for_each_u32(np, "silabs,pll-source", prop, p, num) {
> > +       sz = of_property_read_variable_u32_array(np, "silabs,pll-source", array, 2, 4);
> > +       sz = (sz == -EINVAL) ? 0 : sz; /* Missing property is OK */
> > +       if (sz < 0)
> > +               return dev_err_probe(&client->dev, sz, "invalid pll-source");  
> 
> Needs a newline on the printk message.

Ouch! Fix queued for v3.

Thanks,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
