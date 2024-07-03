Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FE292593C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 12:42:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=aLctC95x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDbtv6VyLz3dDj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 20:41:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=aLctC95x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.194; helo=relay2-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDbqF4Rplz3dBZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 20:38:49 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42E2C40006;
	Wed,  3 Jul 2024 10:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720003126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Bx2CQCZLnvl2mGaHzoLhHeTCe30chHxVgbi6fu5d+s=;
	b=aLctC95xt2Q6rMLnoKMX3FJ/PPaRdMHQEBg8Yh4ab3FSY9cbwu/dUFTyd2apLZ20deWbHL
	p+IzkHN10jVZ1AG9Zn60wT53j8GY4YjZh45RcrSYSRiZO/UmHE3QPIVv0XvnhM2mXl2hWz
	VOJOVdL5ZPhpZJKh1jWQ96KV9qbUgn5W/5TTMt7H+C2eSDixGWwEKYYBbQX1xXqSkyGHz5
	91ju+rAKcnrwNcrolgluBFlh3QFO+/DQF5Wl+7Xbh+KtpnaGIUDYbYcsxewuu+9dpHQeok
	x6ehLSPvrF/uwBxNqrMB68JqQwCZNKNJ8SkpeUBfTvTBYcpghA0kpCr+80jVbg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 03 Jul 2024 12:37:04 +0200
Subject: [PATCH 20/20] of: deprecate and rename of_property_for_each_u32()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-of_property_for_each_u32-v1-20-42c1fc0b82aa@bootlin.com>
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

of_property_for_each_u32() is meant to disappear. All the call sites not
using the 3rd and 4th arguments have already been replaced by
of_property_for_each_u32_new().

Deprecate the old macro. Also rename it to minimize the number of new
usages and encourage conversion to the of_property_for_each_u32_new() macro
in not(-yet)-upstream code.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Notes:

 * The following files have not been build-tested simply because I haven't
   managed to have a config that enables them so far:

     drivers/irqchip/irq-pic32-evic.c
     drivers/pinctrl/pinctrl-k210.c

 * These have not been converted yet as they are not trivial, and they will
   need to use a more specific function that does the lookup they need and
   returns the result:

     drivers/clk/clk-si5351.c
     drivers/clk/clk.c
---
 .clang-format                    | 2 +-
 drivers/clk/clk-si5351.c         | 4 ++--
 drivers/clk/clk.c                | 2 +-
 drivers/irqchip/irq-pic32-evic.c | 2 +-
 drivers/pinctrl/pinctrl-k210.c   | 2 +-
 include/linux/of.h               | 3 ++-
 6 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/.clang-format b/.clang-format
index db25cde2651a..a91b9bb39d9b 100644
--- a/.clang-format
+++ b/.clang-format
@@ -569,8 +569,8 @@ ForEachMacros:
   - 'nr_node_for_each_safe'
   - 'of_for_each_phandle'
   - 'of_property_for_each_string'
-  - 'of_property_for_each_u32'
   - 'of_property_for_each_u32_new'
+  - 'of_property_for_each_u32_old'
   - 'pci_bus_for_each_resource'
   - 'pci_dev_for_each_resource'
   - 'pcl_for_each_chunk'
diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index 4ce83c5265b8..ff990b15d616 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1191,7 +1191,7 @@ static int si5351_dt_parse(struct i2c_client *client,
 	 * property silabs,pll-source : <num src>, [<..>]
 	 * allow to selectively set pll source
 	 */
-	of_property_for_each_u32(np, "silabs,pll-source", prop, p, num) {
+	of_property_for_each_u32_old(np, "silabs,pll-source", prop, p, num) {
 		if (num >= 2) {
 			dev_err(&client->dev,
 				"invalid pll %d on pll-source prop\n", num);
@@ -1232,7 +1232,7 @@ static int si5351_dt_parse(struct i2c_client *client,
 	pdata->pll_reset[0] = true;
 	pdata->pll_reset[1] = true;
 
-	of_property_for_each_u32(np, "silabs,pll-reset-mode", prop, p, num) {
+	of_property_for_each_u32_old(np, "silabs,pll-reset-mode", prop, p, num) {
 		if (num >= 2) {
 			dev_err(&client->dev,
 				"invalid pll %d on pll-reset-mode prop\n", num);
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8ea168c00997..aae940c18459 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -5383,7 +5383,7 @@ const char *of_clk_get_parent_name(const struct device_node *np, int index)
 	/* if there is an indices property, use it to transfer the index
 	 * specified into an array offset for the clock-output-names property.
 	 */
-	of_property_for_each_u32(clkspec.np, "clock-indices", prop, vp, pv) {
+	of_property_for_each_u32_old(clkspec.np, "clock-indices", prop, vp, pv) {
 		if (index == pv) {
 			index = count;
 			break;
diff --git a/drivers/irqchip/irq-pic32-evic.c b/drivers/irqchip/irq-pic32-evic.c
index 1d9bb28d13e5..d9aec87f8b59 100644
--- a/drivers/irqchip/irq-pic32-evic.c
+++ b/drivers/irqchip/irq-pic32-evic.c
@@ -196,7 +196,7 @@ static void __init pic32_ext_irq_of_init(struct irq_domain *domain)
 	int i = 0;
 	const char *pname = "microchip,external-irqs";
 
-	of_property_for_each_u32(node, pname, prop, p, hwirq) {
+	of_property_for_each_u32_old(node, pname, prop, p, hwirq) {
 		if (i >= ARRAY_SIZE(priv->ext_irqs)) {
 			pr_warn("More than %d external irq, skip rest\n",
 				ARRAY_SIZE(priv->ext_irqs));
diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index b6d1ed9ec9a3..03acca8b01ef 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -797,7 +797,7 @@ static int k210_pinctrl_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 	if (ret < 0)
 		goto exit;
 
-	of_property_for_each_u32(np, "pinmux", prop, p, pinmux_group) {
+	of_property_for_each_u32_old(np, "pinmux", prop, p, pinmux_group) {
 		const char *group_name, *func_name;
 		u32 pin = FIELD_GET(K210_PG_PIN, pinmux_group);
 		u32 func = FIELD_GET(K210_PG_FUNC, pinmux_group);
diff --git a/include/linux/of.h b/include/linux/of.h
index 756847539384..15c291ab6e71 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1429,7 +1429,8 @@ static inline int of_property_read_s32(const struct device_node *np,
 	     err == 0;							\
 	     err = of_phandle_iterator_next(it))
 
-#define of_property_for_each_u32(np, propname, prop, p, u)	\
+/* deprecated - will be removed */
+#define of_property_for_each_u32_old(np, propname, prop, p, u)	\
 	for (prop = of_find_property(np, propname, NULL),	\
 		p = of_prop_next_u32(prop, NULL, &u);		\
 		p;						\

-- 
2.34.1

