Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A895D9259BA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 12:49:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=M1vtRZ/I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDc3F36LRz3dVb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 20:49:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=M1vtRZ/I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDbwM688Dz3dK6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 20:43:15 +1000 (AEST)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 22AE8C6713
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 10:38:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8268640007;
	Wed,  3 Jul 2024 10:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720003077;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ObZqIn61RNEy1X0aCEEJcJ3TWqr0KXyZ0h8jl51/dRQ=;
	b=M1vtRZ/IwZA73ShP/81Am2+1HF7s4FmiDSV9DEbuggRaHcKQERp7OSPzywsZUadCPqsxaR
	RZ7oCjkG0C8ViUS6anX2ndvvJHX2z7DdcITxSZ12zgS3G5KqbQAXHCT4KkxX9nIVquZUy5
	15LLa5bd5PLS4v07vuIgeRs4STDPZtGPsgXPh06/GA6Qudtdx0Fny6/LYyK5olTsct1HMA
	CU4vip10scfCAV+QM/o2bhZlf4YgKbKpZ2BH1KagdlEV/37l3LzbomatP49hAXtTXvQgU2
	EKMDSO4JJomZuAYfInK+g5FgIWtvH9+N8OhUTELm/RUseTXOmmYBYbCHO97pNg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 03 Jul 2024 12:36:52 +0200
Subject: [PATCH 08/20] lk: clk-conf: convert to
 of_property_for_each_u32_new()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-of_property_for_each_u32-v1-8-42c1fc0b82aa@bootlin.com>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
In-Reply-To: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Cameron <jic23@kernel.org>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Richard Leitner <richard.leitner@linux.dev>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Damien Le Moal <dlemoal@kernel.org>
X-Mailer: b4 0.14.0
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>, linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, linux-usb@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Simplify code using of_property_for_each_u32_new() as the two additional
parameters in of_property_for_each_u32() are not used here.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/clk/clk-conf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
index 1a4e6340f95c..290dd1230bad 100644
--- a/drivers/clk/clk-conf.c
+++ b/drivers/clk/clk-conf.c
@@ -81,13 +81,11 @@ static int __set_clk_parents(struct device_node *node, bool clk_supplier)
 static int __set_clk_rates(struct device_node *node, bool clk_supplier)
 {
 	struct of_phandle_args clkspec;
-	struct property	*prop;
-	const __be32 *cur;
 	int rc, index = 0;
 	struct clk *clk;
 	u32 rate;
 
-	of_property_for_each_u32(node, "assigned-clock-rates", prop, cur, rate) {
+	of_property_for_each_u32_new(node, "assigned-clock-rates", rate) {
 		if (rate) {
 			rc = of_parse_phandle_with_args(node, "assigned-clocks",
 					"#clock-cells",	index, &clkspec);

-- 
2.34.1

