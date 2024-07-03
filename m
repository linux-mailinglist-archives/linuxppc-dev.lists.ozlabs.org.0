Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F56B9258FC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 12:39:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=cPZSrbgY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDbqj2zH1z3cYG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 20:39:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=cPZSrbgY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.194; helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Wed, 03 Jul 2024 20:38:36 AEST
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDbq05WBCz3c5F
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 20:38:36 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B34140007;
	Wed,  3 Jul 2024 10:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720003113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RU3pzYG6bF53Hk2/xb6Gkld3bSr1k5kQ8wZC1imwq1g=;
	b=cPZSrbgY1uyHHUyxN4ire6Mmb4TO2Vu4T16Cw0ijX9WtOdQxRVHvR8xZ+jgMpz5IE44inL
	vII6SqG0BXZ0XbJVzXjYjxMz8zquGtkc7ojMGbf+/xzpe9vPjARGlOsl4Kt/bELXixFXbH
	5T4k5i2pHjA7qYSjwFIN2biRcDna40ZV3h1eAQappwyEIKEtCUiI5XdvuyfwdrmtIeJjgC
	EmXxc3JWVdEIgSVbA2I6p8eyD4T5kYYxryDYm4ngJCNcK71xw65khBJRmgNBswdV/gvQA8
	WY/WU4scw62nCs+t+3Qq4YDu8vQayuKSd07TBXf+564kOUKkT1WLhWlM6A8vaQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 03 Jul 2024 12:37:01 +0200
Subject: [PATCH 17/20] ASoC: arizona: convert to
 of_property_for_each_u32_new()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-of_property_for_each_u32-v1-17-42c1fc0b82aa@bootlin.com>
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
 sound/soc/codecs/arizona.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 7434aeeda292..1a64b9815809 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -2786,15 +2786,13 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
 {
 	struct arizona_pdata *pdata = &arizona->pdata;
 	struct device_node *np = arizona->dev->of_node;
-	struct property *prop;
-	const __be32 *cur;
 	u32 val;
 	u32 pdm_val[ARIZONA_MAX_PDM_SPK];
 	int ret;
 	int count = 0;
 
 	count = 0;
-	of_property_for_each_u32(np, "wlf,inmode", prop, cur, val) {
+	of_property_for_each_u32_new(np, "wlf,inmode", val) {
 		if (count == ARRAY_SIZE(pdata->inmode))
 			break;
 
@@ -2803,7 +2801,7 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
 	}
 
 	count = 0;
-	of_property_for_each_u32(np, "wlf,dmic-ref", prop, cur, val) {
+	of_property_for_each_u32_new(np, "wlf,dmic-ref", val) {
 		if (count == ARRAY_SIZE(pdata->dmic_ref))
 			break;
 
@@ -2812,7 +2810,7 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
 	}
 
 	count = 0;
-	of_property_for_each_u32(np, "wlf,out-mono", prop, cur, val) {
+	of_property_for_each_u32_new(np, "wlf,out-mono", val) {
 		if (count == ARRAY_SIZE(pdata->out_mono))
 			break;
 
@@ -2821,7 +2819,7 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
 	}
 
 	count = 0;
-	of_property_for_each_u32(np, "wlf,max-channels-clocked", prop, cur, val) {
+	of_property_for_each_u32_new(np, "wlf,max-channels-clocked", val) {
 		if (count == ARRAY_SIZE(pdata->max_channels_clocked))
 			break;
 
@@ -2830,7 +2828,7 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
 	}
 
 	count = 0;
-	of_property_for_each_u32(np, "wlf,out-volume-limit", prop, cur, val) {
+	of_property_for_each_u32_new(np, "wlf,out-volume-limit", val) {
 		if (count == ARRAY_SIZE(pdata->out_vol_limit))
 			break;
 

-- 
2.34.1

