Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F0C929E5A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2024 10:35:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gh9N9Uw0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WHcrj14jyz3cSn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2024 18:35:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gh9N9Uw0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ab; helo=out-171.mta1.migadu.com; envelope-from=richard.leitner@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 574 seconds by postgrey-1.37 at boromir; Mon, 08 Jul 2024 17:55:51 AEST
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [IPv6:2001:41d0:203:375::ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WHbyv71ZNz3c5X
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2024 17:55:51 +1000 (AEST)
X-Envelope-To: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1720424745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6r0t4bqCeyTcKMQipHqJ13XIJ0M/NNLgBRa8TFFkq0k=;
	b=gh9N9Uw0u8C6T2INQwENuJbySC4x56TU/bCYId7J19tXTNv2leS8YvS59ZHGfqV5iEcc2W
	giRbXLJT0kVM9blL6cZF0eI0W/NaGwdLwsoCYd+qWtWL+ssOTOGgYIaHoZkEp8DXV+BDKD
	QBEscHkTSbtdZ0QzmCUfJBvJe1gdrAw=
X-Envelope-To: ojeda@kernel.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: saravanak@google.com
X-Envelope-To: nathan@kernel.org
X-Envelope-To: mturquette@baylibre.com
X-Envelope-To: sboyd@kernel.org
X-Envelope-To: tony@atomide.com
X-Envelope-To: andersson@kernel.org
X-Envelope-To: emilio@elopez.com.ar
X-Envelope-To: wens@csie.org
X-Envelope-To: jernej.skrabec@gmail.com
X-Envelope-To: samuel@sholland.org
X-Envelope-To: krzk@kernel.org
X-Envelope-To: daniel.lezcano@linaro.org
X-Envelope-To: tglx@linutronix.de
X-Envelope-To: florian.fainelli@broadcom.com
X-Envelope-To: bcm-kernel-feedback-list@broadcom.com
X-Envelope-To: linus.walleij@linaro.org
X-Envelope-To: brgl@bgdev.pl
X-Envelope-To: jic23@kernel.org
X-Envelope-To: lee@kernel.org
X-Envelope-To: shawnguo@kernel.org
X-Envelope-To: kernel@pengutronix.de
X-Envelope-To: ukleinek@kernel.org
X-Envelope-To: gregkh@linuxfoundation.org
X-Envelope-To: jirislaby@kernel.org
X-Envelope-To: lgirdwood@gmail.com
X-Envelope-To: broonie@kernel.org
X-Envelope-To: nicolas.ferre@microchip.com
X-Envelope-To: mpe@ellerman.id.au
X-Envelope-To: npiggin@gmail.com
X-Envelope-To: christophe.leroy@csgroup.eu
X-Envelope-To: naveen.n.rao@linux.ibm.com
X-Envelope-To: dlemoal@kernel.org
X-Envelope-To: peng.fan@oss.nxp.com
X-Envelope-To: thomas.petazzoni@bootlin.com
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: llvm@lists.linux.dev
X-Envelope-To: linux-clk@vger.kernel.org
X-Envelope-To: linux-omap@vger.kernel.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-sunxi@lists.linux.dev
X-Envelope-To: linux-samsung-soc@vger.kernel.org
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: linux-iio@vger.kernel.org
X-Envelope-To: linux-pwm@vger.kernel.org
X-Envelope-To: linux-serial@vger.kernel.org
X-Envelope-To: linux-usb@vger.kernel.org
X-Envelope-To: patches@opensource.cirrus.com
X-Envelope-To: linux-sound@vger.kernel.org
X-Envelope-To: linuxppc-dev@lists.ozlabs.org
X-Envelope-To: linux-riscv@lists.infradead.org
Date: Mon, 8 Jul 2024 09:45:39 +0200
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 15/20] usb: usb251xb: convert to
 of_property_for_each_u32_new()
Message-ID: <34bbebxag4neccfkb4isi4bx5uvi2dk446bqqmfmtru4vwbehk@hp7vufvfyon4>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
 <20240703-of_property_for_each_u32-v1-15-42c1fc0b82aa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703-of_property_for_each_u32-v1-15-42c1fc0b82aa@bootlin.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Mon, 08 Jul 2024 18:34:55 +1000
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pwm@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-samsung-soc@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Emilio =?utf-8?B?TMOzcGV6?= <emilio@elopez.com.ar>, Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>, linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Shawn Guo <shawnguo@kernel.org>, linux-sunxi@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Luca,

On Wed, Jul 03, 2024 at 12:36:59PM GMT, Luca Ceresoli wrote:
> Simplify code using of_property_for_each_u32_new() as the two additional
> parameters in of_property_for_each_u32() are not used here.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

please feel free to add:

Acked-by: Richard Leitner <richard.leitner@linux.dev>

> ---
>  drivers/usb/misc/usb251xb.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> index 7da404f55a6d..490004dbb9d8 100644
> --- a/drivers/usb/misc/usb251xb.c
> +++ b/drivers/usb/misc/usb251xb.c
> @@ -382,11 +382,9 @@ static void usb251xb_get_ports_field(struct usb251xb *hub,
>  				    bool ds_only, u8 *fld)
>  {
>  	struct device *dev = hub->dev;
> -	struct property *prop;
> -	const __be32 *p;
>  	u32 port;
>  
> -	of_property_for_each_u32(dev->of_node, prop_name, prop, p, port) {
> +	of_property_for_each_u32_new(dev->of_node, prop_name, port) {
>  		if ((port >= ds_only ? 1 : 0) && (port <= port_cnt))
>  			*fld |= BIT(port);
>  		else
> 
> -- 
> 2.34.1

