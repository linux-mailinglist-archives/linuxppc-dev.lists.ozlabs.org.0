Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBFB927EA8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 23:34:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=OW87Yyqx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFVKW3XThz3cYL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 07:34:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=OW87Yyqx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFVJr5L1nz3bxZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2024 07:34:03 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2FECD240006;
	Thu,  4 Jul 2024 21:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720128840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q5IBUlpk519TSgD6Osr1ZyaFchjMZnggQfjeK80Zda4=;
	b=OW87YyqxfC/aisrIaK1t9t5rNi1tv8W2h+PNzPy/mbY2MLmPV40lXp/tAQHoWvKu4AWsjJ
	t1azANkvi0z3C8c1zRY+dEwMFTe4IitMjntGqs0weShRTHE6S9YLuTRM50bq5PQggOGH3h
	VTb1TQxTb2kbXJ5aFHoZUbrXoTHiCyUiMq8h02kLT12CEGs/CoF9H4DdX4VqNE0u4czR5l
	eyYcAzvCetxJAj9pUcmrGPPibpICDtqgs90easLdjOXXyAP4rPd46IcoQOzY7rAZwcoezR
	bPShL3nDBJRC3irR8YI4aF7W8jyTpxGZxv27dKpKX4ap2xqwkURoZOagKsVprQ==
Date: Thu, 4 Jul 2024 23:33:46 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 20/20] of: deprecate and rename
 of_property_for_each_u32()
Message-ID: <20240704233346.478431f8@booty>
In-Reply-To: <20240703180111.GA1245093-robh@kernel.org>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
	<20240703-of_property_for_each_u32-v1-20-42c1fc0b82aa@bootlin.com>
	<20240703180111.GA1245093-robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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
Cc: Richard Leitner <richard.leitner@linux.dev>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pwm@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, Uwe =?UTF-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Emilio =?UTF-8?Q?L=C3=B3pez?= <emilio@elopez.com.ar>, Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, "Peng
 Fan \(OSS\)" <peng.fan@oss.nxp.com>, linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Shawn Guo <shawnguo@kernel.org>, linux-sunxi@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Rob,

On Wed, 3 Jul 2024 12:01:11 -0600
Rob Herring <robh@kernel.org> wrote:

> On Wed, Jul 03, 2024 at 12:37:04PM +0200, Luca Ceresoli wrote:
> > of_property_for_each_u32() is meant to disappear. All the call sites not
> > using the 3rd and 4th arguments have already been replaced by
> > of_property_for_each_u32_new().
> > 
> > Deprecate the old macro. Also rename it to minimize the number of new
> > usages and encourage conversion to the of_property_for_each_u32_new() macro
> > in not(-yet)-upstream code.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > ---
> > 
> > Notes:
> > 
> >  * The following files have not been build-tested simply because I haven't
> >    managed to have a config that enables them so far:
> > 
> >      drivers/irqchip/irq-pic32-evic.c
> >      drivers/pinctrl/pinctrl-k210.c
> > 
> >  * These have not been converted yet as they are not trivial, and they will
> >    need to use a more specific function that does the lookup they need and
> >    returns the result:
> > 
> >      drivers/clk/clk-si5351.c  
> 
> I would do something like this:

Thanks for the suggestions.

I literally did not even try to look at what the code does in these few
places, and still haven't, simply due to time availability. But I wanted
to get a first series out as soon as possible as it would probably be
useful to Peng [0]. Yours will be a good starting point for when I
tackle those few remaining usages of the "old" macro. Thanks.

[0] https://lore.kernel.org/all/20240628161617.6bc9ca3c@booty/

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
