Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B83925986
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 12:45:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=foJzSM9R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDbzF0sdLz3dKL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 20:45:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=foJzSM9R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDbwG19qnz2ysX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 20:43:09 +1000 (AEST)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 51A77C61E0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 10:37:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3ECA340002;
	Wed,  3 Jul 2024 10:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720003045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y9dKIY8UF+nReYR3bpF9Pb7TJp7WLPLWK/B5oYjjbq8=;
	b=foJzSM9RuZQOf/VPApRW0lmUGrQblXobu0gWcMfK3rdR7fFeSllw9HZtvDHamCZSnVeAQd
	xl3StvV0X9RM6zrGGH8rKfTVgGj2rxAQ/FXj4AoPA7jwEAAykHOnYYQdsWoKj0Z5qT9EbI
	NJSgM2y4fGFlocfqLTtmMbWZcFSesBLFVfvUvMOxSvZzRHYiHre2aVkplOJXZ8APv8zjRO
	yRmCwXsRILqubrSOViPCck2qs6VXTOpPU1Zh2pkMz/CDpauRr4KYDvJCL2P3T9WnVnXRPw
	Yp49tSFnocZKud9kw1tjEbXpKeoo3s6qbV/lMc9MWdp1PkDr10Ce8YagcplEvA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 00/20] Simplify of_property_for_each_u32()
Date: Wed, 03 Jul 2024 12:36:44 +0200
Message-Id: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALwphWYC/x3MTQqEMAxA4atI1lOI9Q+8igyltKlmY0uqw4j07
 haX3+K9GzIJU4a5uUHox5njXtF+GnCb3VdS7KtBo+5xwlbFYJLERHJcJkQxZN1mzk6rfsTgUdv
 Bo4OaJ6HA/3e9fEt5ALUFP0BqAAAA
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

[Note: to reduce the noise I have trimmed the get_maintainers list
manually. Should you want to be removed, or someone else added, to future
versions, just tell me. Sorry for the noise.]

This series aims at simplifying of_property_for_each_u32() as well as
making it more difficult to misuse it in the future.

The long-term goal is changing this pattern:

  struct property *prop;
  const __be32 *p;
  u32 val;
 
  of_property_for_each_u32(np, "xyz", prop, p, val) { ... }

to this:

  u32 val;

  of_property_for_each_u32(np, "xyz", val) { ... }

So, removing the 3rd and 4th arguments which are typically meant to be
internal. Those two parameters used to be unavoidable until the kernel
moved to building with the C11 standard unconditionally. Since then, it is
now possible to get rid of them. However a few users of
of_property_for_each_u32() do actually use those arguments, which
complicates the transition. For this reason this series does the following:

 * Add of_property_for_each_u32_new(), which does not have those two
   arguments (patch 1)
 * Convert _almost_ every usage to of_property_for_each_u32_new()
 * Rename of_property_for_each_u32() to of_property_for_each_u32_old() and
   deprecate it, as a incentive to code not (yet) in mainline to upgrade
   to the *_new() version (last patch)

The plan for the next series is to additionally:

 * Convert the few remaining of_property_for_each_u32_old() instantes to
   of_property_for_each_u32_new()
 * Remove of_property_for_each_u32_old()
 * Rename of_property_for_each_u32_new() to of_property_for_each_u32()

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (20):
      of: add of_property_for_each_u32_new()
      clk: convert to of_property_for_each_u32_new()
      clk: qcom: convert to of_property_for_each_u32_new()
      clk: sunxi: clk-simple-gates: convert to of_property_for_each_u32_new()
      clk: sunxi:  clk-sun8i-bus-gates: convert to of_property_for_each_u32_new()
      clocksource/drivers/samsung_pwm: convert to of_property_for_each_u32_new()
      bus: ti-sysc: convert to of_property_for_each_u32_new()
      lk: clk-conf: convert to of_property_for_each_u32_new()
      gpio: brcmstb: convert to of_property_for_each_u32_new()
      pinctrl: s32cc: convert to of_property_for_each_u32_new()
      irqchip/atmel-aic: convert to of_property_for_each_u32_new()
      iio: adc: ti_am335x_adc: convert to of_property_for_each_u32_new()
      pwm: samsung: convert to of_property_for_each_u32_new()
      tty: sysrq: convert to of_property_for_each_u32_new()
      usb: usb251xb: convert to of_property_for_each_u32_new()
      mfd: ti_am335x_tscadc: convert to of_property_for_each_u32_new()
      ASoC: arizona: convert to of_property_for_each_u32_new()
      powerpc/xive: convert to of_property_for_each_u32_new()
      powerpc/xive: convert to of_property_for_each_u32_new()
      of: deprecate and rename of_property_for_each_u32()

 .clang-format                           |  3 ++-
 arch/powerpc/sysdev/xive/native.c       |  4 +---
 arch/powerpc/sysdev/xive/spapr.c        |  3 +--
 drivers/bus/ti-sysc.c                   |  4 +---
 drivers/clk/clk-conf.c                  |  4 +---
 drivers/clk/clk-si5351.c                |  4 ++--
 drivers/clk/clk.c                       |  6 ++----
 drivers/clk/qcom/common.c               |  4 +---
 drivers/clk/sunxi/clk-simple-gates.c    |  4 +---
 drivers/clk/sunxi/clk-sun8i-bus-gates.c |  4 +---
 drivers/clocksource/samsung_pwm_timer.c |  4 +---
 drivers/gpio/gpio-brcmstb.c             |  5 +----
 drivers/iio/adc/ti_am335x_adc.c         |  4 +---
 drivers/irqchip/irq-atmel-aic-common.c  |  4 +---
 drivers/irqchip/irq-pic32-evic.c        |  2 +-
 drivers/mfd/ti_am335x_tscadc.c          |  4 +---
 drivers/pinctrl/nxp/pinctrl-s32cc.c     |  4 +---
 drivers/pinctrl/pinctrl-k210.c          |  2 +-
 drivers/pwm/pwm-samsung.c               |  4 +---
 drivers/tty/sysrq.c                     |  4 +---
 drivers/usb/misc/usb251xb.c             |  4 +---
 include/linux/of.h                      | 14 ++++++++++----
 sound/soc/codecs/arizona.c              | 12 +++++-------
 23 files changed, 39 insertions(+), 68 deletions(-)
---
base-commit: e937d48ed96381e9620d9c81fbc1ce666f5b7358
change-id: 20240701-of_property_for_each_u32-460fd02a5d0c

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

