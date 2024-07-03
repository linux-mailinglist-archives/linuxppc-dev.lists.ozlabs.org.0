Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9F792592E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 12:41:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=krq9F3d5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDbt80Dwqz3c5F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 20:41:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=krq9F3d5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::222; helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Wed, 03 Jul 2024 20:38:46 AEST
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDbqB5pjvz3dDt
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 20:38:46 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41D1340003;
	Wed,  3 Jul 2024 10:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720003122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8hUMVYtBkjPdiTzE0TuzO7cuagNMWqN2g5DCdgBLSEk=;
	b=krq9F3d5fBd6bfy6FrrQ002RWueFPpkeVNZCRwuTg00aWfcsCAo+TqJP4lQX1lNb1wnXx8
	8EFt540AMIJBMaxeUFLkQZT4IJffE+hEjvm/KC8c7bvRPvQNpTIO2EjrMZkQXl6020l+ii
	3JJCVUB6s9ma44O0w2gRu+DYyEwnCB7wKWEP232QtvdGIGUIWZVUgNnTWwPDH9ook3kbME
	D1peSErXCT5Jkj8vWWwbbj3NsFjOLFQHq2H5LTJRhcGEPUiywAMdZa3b2WOwjNwo07rHbL
	UCHQQH7s337h9dfyUpfbcNeOaTH9uKaERBtKoDjD94zwX+pk5NZ396JKb9qCGQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 03 Jul 2024 12:37:03 +0200
Subject: [PATCH 19/20] powerpc/xive: convert to
 of_property_for_each_u32_new()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-of_property_for_each_u32-v1-19-42c1fc0b82aa@bootlin.com>
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

In this case only the 'prop' variable can be removed and not 'reg',
because 'reg' is used in _previous_ lines of the same function. There
is no side effect because the of_property_for_each_u32() macro being
removed would anyway write 'reg' bwfore reading its value, and 'reg'
is not used in _following_ lines.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 arch/powerpc/sysdev/xive/spapr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/xive/spapr.c b/arch/powerpc/sysdev/xive/spapr.c
index e45419264391..ffa6ca5db183 100644
--- a/arch/powerpc/sysdev/xive/spapr.c
+++ b/arch/powerpc/sysdev/xive/spapr.c
@@ -814,7 +814,6 @@ bool __init xive_spapr_init(void)
 	struct device_node *np;
 	struct resource r;
 	void __iomem *tima;
-	struct property *prop;
 	u8 max_prio;
 	u32 val;
 	u32 len;
@@ -866,7 +865,7 @@ bool __init xive_spapr_init(void)
 	}
 
 	/* Iterate the EQ sizes and pick one */
-	of_property_for_each_u32(np, "ibm,xive-eq-sizes", prop, reg, val) {
+	of_property_for_each_u32_new(np, "ibm,xive-eq-sizes", val) {
 		xive_queue_shift = val;
 		if (val == PAGE_SHIFT)
 			break;

-- 
2.34.1

