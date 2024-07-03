Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 655BE925961
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 12:43:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=SnP12D1w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDbww1PWzz3cXT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 20:43:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=SnP12D1w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDbwD13PMz2xjJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 20:43:07 +1000 (AEST)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id BD38AC6294
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 10:37:43 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 73EE740003;
	Wed,  3 Jul 2024 10:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720003049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=moEPnxiSi/c1D9xrX6V2cKPTilxyr+PMhbb8iCAH8yw=;
	b=SnP12D1wMBqz1K2C4ZP0DkuGcdvpvaSCHDwQRfHVaIbo9cTSIG+C3GanMB3Dz8GR1iRJrd
	qnT046Tf39IN3CmQhaX95SRGYP2nBDEAM5tGTOWFgBSFQDsTd3m/dsrpRU3zhAPEsF5Fl3
	jkrXFwskrz4Gh0DqUXLrMHFmuKCKCVO7or2fBHpusUScb+WZVc0lnSMePPEIldt+2+ATel
	APU1p+k00hbC0js5s0PaqwB0P2+9N6XB0yVYAx/ctq0jtZTiTZeWeHTIt6iQc8ScOmGN8+
	/UnjLPcOgpoVK2LpsDsZC2GBUe7tZlqLk8QzpQNhH6KoJ167npVDF16CAtqTyQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 03 Jul 2024 12:36:45 +0200
Subject: [PATCH 01/20] of: add of_property_for_each_u32_new()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-of_property_for_each_u32-v1-1-42c1fc0b82aa@bootlin.com>
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

The of_property_for_each_u32() macro needs five parameters, two of which
are often only used internally by the macro itself (in the for()
clause).

Now that the kernel uses C11 to build these two parameters can be avoided
by declaring them internally. Add a new macro for that, which is meant to
eventually replace the existing one.

Since two variables cannot be declared in the for clause, declare one
struct that contain the two variables we actually need. Since the variables
inside this struct are not meant to be used by users of this macro, give
the struct instance the noticeable name "_it" so it is visible during code
reviews, helping to avoid new code to use it directly.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 .clang-format      |  1 +
 include/linux/of.h | 11 ++++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/.clang-format b/.clang-format
index ccc9b93972a9..db25cde2651a 100644
--- a/.clang-format
+++ b/.clang-format
@@ -570,6 +570,7 @@ ForEachMacros:
   - 'of_for_each_phandle'
   - 'of_property_for_each_string'
   - 'of_property_for_each_u32'
+  - 'of_property_for_each_u32_new'
   - 'pci_bus_for_each_resource'
   - 'pci_dev_for_each_resource'
   - 'pcl_for_each_chunk'
diff --git a/include/linux/of.h b/include/linux/of.h
index a0bedd038a05..756847539384 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -430,11 +430,9 @@ extern int of_detach_node(struct device_node *);
 #define of_match_ptr(_ptr)	(_ptr)
 
 /*
- * struct property *prop;
- * const __be32 *p;
  * u32 u;
  *
- * of_property_for_each_u32(np, "propname", prop, p, u)
+ * of_property_for_each_u32_new(np, "propname", u)
  *         printk("U32 value: %x\n", u);
  */
 const __be32 *of_prop_next_u32(struct property *prop, const __be32 *cur,
@@ -1437,6 +1435,13 @@ static inline int of_property_read_s32(const struct device_node *np,
 		p;						\
 		p = of_prop_next_u32(prop, p, &u))
 
+#define of_property_for_each_u32_new(np, propname, u)			\
+	for (struct {struct property *prop; const __be32 *item; } _it =	\
+		{of_find_property(np, propname, NULL),			\
+		 of_prop_next_u32(_it.prop, NULL, &u)};			\
+	     _it.item;							\
+	     _it.item = of_prop_next_u32(_it.prop, _it.item, &u))
+
 #define of_property_for_each_string(np, propname, prop, s)	\
 	for (prop = of_find_property(np, propname, NULL),	\
 		s = of_prop_next_string(prop, NULL);		\

-- 
2.34.1

