Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7218926792
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 20:01:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rdkJI5WT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDnfS4Twgz3fSP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 04:01:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rdkJI5WT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDndm5hcVz3cb1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 04:01:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D9016CE2BBC;
	Wed,  3 Jul 2024 18:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF3A5C2BD10;
	Wed,  3 Jul 2024 18:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720029672;
	bh=Zf7O3ePlvok3MwLuehq8buoZy5+PWBs/kgvIKrrVIKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rdkJI5WT7xR8B3hhsVMq+7XqeIkJEsIaADXyaLtB4dJe9NXrYcxikXDJ/5KktssvA
	 7etBQGsm2VyizVMZQmA9ihpwtZYUhvkMhDqqm7DZaL9YJ8uOiDoPSmPVoICg9OuK8h
	 kf2w10dmNI2g0dOA0U+6i+Cgm8jgljOb/gfgRYI1OPkrO1v+GfL/rY1cUvohqOzaun
	 TOkDyEhrJNtkGWe8cABu77lnRtMdZJu1H5b2xga3Mp3ipQTM+FMCsdeacpzsjDre6d
	 /YbhzFbSXtxBcBUyDKr/EWUY3kR0SbLGgb2vJo3YUT8TlNsacvEqcfVsQLO/+01IoD
	 8zVzREV5iKd4A==
Date: Wed, 3 Jul 2024 12:01:11 -0600
From: Rob Herring <robh@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 20/20] of: deprecate and rename of_property_for_each_u32()
Message-ID: <20240703180111.GA1245093-robh@kernel.org>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
 <20240703-of_property_for_each_u32-v1-20-42c1fc0b82aa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703-of_property_for_each_u32-v1-20-42c1fc0b82aa@bootlin.com>
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
Cc: Richard Leitner <richard.leitner@linux.dev>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pwm@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, llvm@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-riscv@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>, linux-arm-msm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Saravana Kannan <saravanak@google.com>, linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Shawn Guo <shawnguo@kernel.org>, linux-sunxi@lists.linux.dev, Jonathan Cameron <jic23@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 03, 2024 at 12:37:04PM +0200, Luca Ceresoli wrote:
> of_property_for_each_u32() is meant to disappear. All the call sites not
> using the 3rd and 4th arguments have already been replaced by
> of_property_for_each_u32_new().
> 
> Deprecate the old macro. Also rename it to minimize the number of new
> usages and encourage conversion to the of_property_for_each_u32_new() macro
> in not(-yet)-upstream code.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Notes:
> 
>  * The following files have not been build-tested simply because I haven't
>    managed to have a config that enables them so far:
> 
>      drivers/irqchip/irq-pic32-evic.c
>      drivers/pinctrl/pinctrl-k210.c
> 
>  * These have not been converted yet as they are not trivial, and they will
>    need to use a more specific function that does the lookup they need and
>    returns the result:
> 
>      drivers/clk/clk-si5351.c

I would do something like this:

	sz = of_property_read_variable_u32_array(np, "silabs,pll-source", array, 2, 4);
	if (sz >= 2)
		pdata->pll_src[array[0]] = val_to_src(array[1]);
	if (sz >= 4)
		pdata->pll_src[array[2]] = val_to_src(array[3]);


>      drivers/clk/clk.c

Wouldn't this work:

8<------------------------------------------------------

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8cca52be993f..33a8cc193556 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5371,6 +5371,7 @@ const char *of_clk_get_parent_name(const struct device_node *np, int index)
        int rc;
        int count;
        struct clk *clk;
+       bool found = false;
 
        rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
                                        &clkspec);
@@ -5383,15 +5384,16 @@ const char *of_clk_get_parent_name(const struct device_node *np, int index)
        /* if there is an indices property, use it to transfer the index
         * specified into an array offset for the clock-output-names property.
         */
-       of_property_for_each_u32(clkspec.np, "clock-indices", prop, vp, pv) {
+       of_property_for_each_u32_new(clkspec.np, "clock-indices", pv) {
                if (index == pv) {
                        index = count;
+                       found = true;
                        break;
                }
                count++;
        }
        /* We went off the end of 'clock-indices' without finding it */
-       if (prop && !vp)
+       if (of_property_present(clkspec.np, "clock-indices") && !found)
                return NULL;
 
        if (of_property_read_string_index(clkspec.np, "clock-output-names",
