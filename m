Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3884496776
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 22:41:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgXrl5R1Qz3cT8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 08:41:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XGWEGyhJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=sampaio.ime@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XGWEGyhJ; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgQTr1jgqz30Qw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 03:54:54 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id s127so14382045oig.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 08:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CtvdvKf3bfl2pica1l8Cw2pF6EugbvEYx4CaiKYIKZ0=;
 b=XGWEGyhJXLDY0/SCOgAaoYsffd1Ec5zfN1KHjqRA6n6f0VO9/vXz78ORilfU8noZkl
 SptuPXoysJlw+Y4qfRCYwIRQPooanvdGUn/mI0HxjADuWiNVkRtj4WUPg5AwiXjf5OXG
 sDCzJmuvM/XcDmX+2aVjbPjPSYA42wH89qrF0RqPukAFa3WlZW9/R4jfPZMs7u8HJOqr
 ulcSuDPYfZ/zQf3Xn8mfiYZM9Ip+f9mSTB76WCRLNPB1wDQN2TGWdUD0wF/2mSlnYcZG
 EhqRujrFa3sg/0044GLsQEi4dJ5wTLJQJMZK0ejLO2rGg47YqEFZl2SCpj+blTzWV6mz
 gsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtvdvKf3bfl2pica1l8Cw2pF6EugbvEYx4CaiKYIKZ0=;
 b=tIrvkQiGRq0mZ2uMxo2nhoMxnHX2P8FUz9gM/2Hfj91rbwj8Qi4Zc8X9cc7hnlVcvd
 oaZm9kvI1ievr+gfo+a8Eq+btU1NOjbofMDesCqXhdIU7kBKg16g3EIk90mrrMwEFUmT
 +SnYf/lqefEHJ7GeCTYHqGmUDaZOL+g0N3AhnmDAMakPpL1E57Xtv5HVGCoiyLZTGXbL
 njAEGvGAJVovn9b0clR6NAvwRhl9Y1Vbyhd99ztBlt25a5yfSZpPjitaU7M0P5ZwDheP
 G3fylr7OuC5DvLrr8LNzGUwjvpv+sUIjgwqrwqOeV53B2Cq+IHFjr5buWmI8Y36omGXy
 G70w==
X-Gm-Message-State: AOAM531A6HA4xWXBnF0cXVEoj/XUYKQkGMpiDsna8x+pOSSpGUx8gsom
 rNsaXm7yqIlLcOdzDnRMSYs=
X-Google-Smtp-Source: ABdhPJz0hHW1Wv5UZvrqiyoSuqikDmpEj2d/E38Gbh8uYnoC32BIP0MgXNnv57guy9ncUu3s8LU9ig==
X-Received: by 2002:a05:6808:1306:: with SMTP id
 y6mr1306040oiv.49.1642784088560; 
 Fri, 21 Jan 2022 08:54:48 -0800 (PST)
Received: from thinkpad.localdomain ([2804:14d:5cd1:5d03:cf72:4317:3105:f6e5])
 by smtp.gmail.com with ESMTPSA id
 y8sm1089271oou.23.2022.01.21.08.54.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 08:54:48 -0800 (PST)
From: Luiz Sampaio <sampaio.ime@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Andreas Werner <andreas.werner@men.de>,
 Vadim Pasternak <vadimp@nvidia.com>, Sean Wang <sean.wang@mediatek.com>,
 Riku Voipio <riku.voipio@iki.fi>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang7@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH 08/31] leds: changing LED_* from enum led_brightness to actual
 value
Date: Fri, 21 Jan 2022 13:54:13 -0300
Message-Id: <20220121165436.30956-9-sampaio.ime@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121165436.30956-1-sampaio.ime@gmail.com>
References: <20220121165436.30956-1-sampaio.ime@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 22 Jan 2022 08:40:28 +1100
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
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-leds@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Luiz Sampaio <sampaio.ime@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The enum led_brightness, which contains the declaration of LED_OFF,
LED_ON, LED_HALF and LED_FULL is obsolete, as the led class now supports
max_brightness.
---
 drivers/leds/blink/leds-lgm-sso.c        |  8 +++----
 drivers/leds/flash/leds-ktd2692.c        |  4 ++--
 drivers/leds/flash/leds-lm3601x.c        | 10 ++++----
 drivers/leds/flash/leds-mt6360.c         | 10 ++++----
 drivers/leds/flash/leds-rt4505.c         |  8 +++----
 drivers/leds/flash/leds-rt8515.c         |  4 ++--
 drivers/leds/flash/leds-sgm3140.c        |  4 ++--
 drivers/leds/led-class.c                 |  6 ++---
 drivers/leds/led-core.c                  |  8 +++----
 drivers/leds/led-triggers.c              |  4 ++--
 drivers/leds/leds-adp5520.c              |  2 +-
 drivers/leds/leds-an30259a.c             |  8 +++----
 drivers/leds/leds-apu.c                  |  6 ++---
 drivers/leds/leds-ariel.c                |  8 +++----
 drivers/leds/leds-asic3.c                |  2 +-
 drivers/leds/leds-aw2013.c               |  6 ++---
 drivers/leds/leds-bcm6328.c              | 14 +++++------
 drivers/leds/leds-bcm6358.c              | 14 +++++------
 drivers/leds/leds-bd2802.c               | 14 +++++------
 drivers/leds/leds-clevo-mail.c           |  6 ++---
 drivers/leds/leds-cobalt-qube.c          |  2 +-
 drivers/leds/leds-cpcap.c                | 10 ++++----
 drivers/leds/leds-da903x.c               |  4 ++--
 drivers/leds/leds-da9052.c               |  4 ++--
 drivers/leds/leds-dac124s085.c           |  2 +-
 drivers/leds/leds-el15203000.c           |  4 ++--
 drivers/leds/leds-gpio.c                 |  4 ++--
 drivers/leds/leds-is31fl319x.c           |  2 +-
 drivers/leds/leds-lm3530.c               |  4 ++--
 drivers/leds/leds-lm3532.c               |  8 +++----
 drivers/leds/leds-lm3533.c               |  4 ++--
 drivers/leds/leds-lm3692x.c              |  2 +-
 drivers/leds/leds-lm3697.c               |  6 ++---
 drivers/leds/leds-lp3952.c               |  4 ++--
 drivers/leds/leds-lt3593.c               |  2 +-
 drivers/leds/leds-max77650.c             |  4 ++--
 drivers/leds/leds-menf21bmc.c            |  2 +-
 drivers/leds/leds-mlxcpld.c              | 22 ++++++++---------
 drivers/leds/leds-mlxreg.c               | 10 ++++----
 drivers/leds/leds-mt6323.c               |  2 +-
 drivers/leds/leds-netxbig.c              |  4 ++--
 drivers/leds/leds-nic78bx.c              |  2 +-
 drivers/leds/leds-ns2.c                  |  4 ++--
 drivers/leds/leds-ot200.c                |  2 +-
 drivers/leds/leds-pca9532.c              |  6 ++---
 drivers/leds/leds-pca955x.c              | 30 ++++++++++++------------
 drivers/leds/leds-pca963x.c              |  4 ++--
 drivers/leds/leds-pm8058.c               |  8 +++----
 drivers/leds/leds-powernv.c              | 12 +++++-----
 drivers/leds/leds-pwm.c                  |  2 +-
 drivers/leds/leds-rb532.c                |  2 +-
 drivers/leds/leds-regulator.c            |  2 +-
 drivers/leds/leds-sc27xx-bltc.c          |  6 ++---
 drivers/leds/leds-spi-byte.c             |  2 +-
 drivers/leds/leds-ss4200.c               | 12 +++++-----
 drivers/leds/leds-sunfire.c              |  2 +-
 drivers/leds/leds-syscon.c               |  2 +-
 drivers/leds/leds-tca6507.c              |  8 +++----
 drivers/leds/leds-wm831x-status.c        |  8 +++----
 drivers/leds/leds-wm8350.c               |  8 +++----
 drivers/leds/simple/simatic-ipc-leds.c   | 10 ++++----
 drivers/leds/trigger/ledtrig-activity.c  |  2 +-
 drivers/leds/trigger/ledtrig-backlight.c |  4 ++--
 drivers/leds/trigger/ledtrig-camera.c    |  4 ++--
 drivers/leds/trigger/ledtrig-cpu.c       |  4 ++--
 drivers/leds/trigger/ledtrig-gpio.c      |  4 ++--
 drivers/leds/trigger/ledtrig-heartbeat.c |  4 ++--
 drivers/leds/trigger/ledtrig-netdev.c    |  6 ++---
 drivers/leds/trigger/ledtrig-oneshot.c   |  6 ++---
 drivers/leds/trigger/ledtrig-panic.c     |  2 +-
 drivers/leds/trigger/ledtrig-pattern.c   |  2 +-
 drivers/leds/trigger/ledtrig-timer.c     |  2 +-
 drivers/leds/trigger/ledtrig-transient.c |  6 ++---
 drivers/leds/trigger/ledtrig-tty.c       |  4 ++--
 74 files changed, 217 insertions(+), 217 deletions(-)

diff --git a/drivers/leds/blink/leds-lgm-sso.c b/drivers/leds/blink/leds-lgm-sso.c
index 6f270c0272fb..26c17c64bd4f 100644
--- a/drivers/leds/blink/leds-lgm-sso.c
+++ b/drivers/leds/blink/leds-lgm-sso.c
@@ -51,7 +51,7 @@
 #define SSO_LED_MAX_NUM			SZ_32
 #define MAX_FREQ_RANK			10
 #define DEF_GPTC_CLK_RATE		200000000
-#define SSO_DEF_BRIGHTNESS		LED_HALF
+#define SSO_DEF_BRIGHTNESS		127
 #define DATA_CLK_EDGE			0 /* 0-rising, 1-falling */
 
 static const u32 freq_div_tbl[] = {4000, 2000, 1000, 800};
@@ -244,7 +244,7 @@ static void sso_led_brightness_set(struct led_classdev *led_cdev,
 	desc->brightness = brightness;
 	regmap_write(priv->mmap, DUTY_CYCLE(desc->pin), brightness);
 
-	if (brightness == LED_OFF)
+	if (brightness == 0)
 		val = 0;
 	else
 		val = 1;
@@ -360,7 +360,7 @@ static int sso_create_led(struct sso_led_priv *priv, struct sso_led *led,
 	led->cdev.brightness_set = sso_led_brightness_set;
 	led->cdev.brightness_get = sso_led_brightness_get;
 	led->cdev.brightness = desc->brightness;
-	led->cdev.max_brightness = LED_FULL;
+	led->cdev.max_brightness = 255;
 
 	if (desc->retain_state_shutdown)
 		led->cdev.flags |= LED_RETAIN_AT_SHUTDOWN;
@@ -696,7 +696,7 @@ __sso_led_dt_parse(struct sso_led_priv *priv, struct fwnode_handle *fw_ssoled)
 
 		if (!fwnode_property_read_string(fwnode_child, "default-state", &tmp)) {
 			if (!strcmp(tmp, "on"))
-				desc->brightness = LED_FULL;
+				desc->brightness = 255;
 		}
 
 		ret = sso_create_led(priv, led, fwnode_child);
diff --git a/drivers/leds/flash/leds-ktd2692.c b/drivers/leds/flash/leds-ktd2692.c
index ed1f20a58bf6..30937156d156 100644
--- a/drivers/leds/flash/leds-ktd2692.c
+++ b/drivers/leds/flash/leds-ktd2692.c
@@ -161,7 +161,7 @@ static int ktd2692_led_brightness_set(struct led_classdev *led_cdev,
 
 	mutex_lock(&led->lock);
 
-	if (brightness == LED_OFF) {
+	if (brightness == 0) {
 		led->mode = KTD2692_MODE_DISABLE;
 		gpiod_direction_output(led->aux_gpio, KTD2692_LOW);
 	} else {
@@ -199,7 +199,7 @@ static int ktd2692_led_flash_strobe_set(struct led_classdev_flash *fled_cdev,
 
 	ktd2692_expresswire_write(led, led->mode | KTD2692_REG_MODE_BASE);
 
-	fled_cdev->led_cdev.brightness = LED_OFF;
+	fled_cdev->led_cdev.brightness = 0;
 	led->mode = KTD2692_MODE_DISABLE;
 
 	mutex_unlock(&led->lock);
diff --git a/drivers/leds/flash/leds-lm3601x.c b/drivers/leds/flash/leds-lm3601x.c
index d0e1d4814042..0edcb56a8e8d 100644
--- a/drivers/leds/flash/leds-lm3601x.c
+++ b/drivers/leds/flash/leds-lm3601x.c
@@ -185,9 +185,9 @@ static int lm3601x_brightness_set(struct led_classdev *cdev,
 	else
 		led_mode_val = LM3601X_MODE_IR_DRV;
 
-	if (brightness == LED_OFF) {
+	if (brightness == 0) {
 		ret = regmap_update_bits(led->regmap, LM3601X_ENABLE_REG,
-					led_mode_val, LED_OFF);
+					led_mode_val, 0);
 		goto out;
 	}
 
@@ -232,7 +232,7 @@ static int lm3601x_strobe_set(struct led_classdev_flash *fled_cdev,
 					LM3601X_MODE_STROBE);
 	else
 		ret = regmap_update_bits(led->regmap, LM3601X_ENABLE_REG,
-					LM3601X_MODE_STROBE, LED_OFF);
+					LM3601X_MODE_STROBE, 0);
 
 	ret = lm3601x_read_faults(led);
 out:
@@ -252,9 +252,9 @@ static int lm3601x_flash_brightness_set(struct led_classdev_flash *fled_cdev,
 	if (ret < 0)
 		goto out;
 
-	if (brightness == LED_OFF) {
+	if (brightness == 0) {
 		ret = regmap_update_bits(led->regmap, LM3601X_ENABLE_REG,
-					LM3601X_MODE_STROBE, LED_OFF);
+					LM3601X_MODE_STROBE, 0);
 		goto out;
 	}
 
diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
index e1066a52d2d2..69145a154b53 100644
--- a/drivers/leds/flash/leds-mt6360.c
+++ b/drivers/leds/flash/leds-mt6360.c
@@ -402,7 +402,7 @@ static int mt6360_isnk_init_default_state(struct mt6360_led *led)
 		return ret;
 
 	if (!(regval & MT6360_ISNK_ENMASK(led->led_no)))
-		level = LED_OFF;
+		level = 0;
 
 	switch (led->default_state) {
 	case STATE_ON:
@@ -412,7 +412,7 @@ static int mt6360_isnk_init_default_state(struct mt6360_led *led)
 		led->isnk.brightness = min(level, led->isnk.max_brightness);
 		break;
 	default:
-		led->isnk.brightness = LED_OFF;
+		led->isnk.brightness = 0;
 	}
 
 	return mt6360_isnk_brightness_set(&led->isnk, led->isnk.brightness);
@@ -440,7 +440,7 @@ static int mt6360_flash_init_default_state(struct mt6360_led *led)
 	if ((regval & enable_mask) == enable_mask)
 		level += 1;
 	else
-		level = LED_OFF;
+		level = 0;
 
 	switch (led->default_state) {
 	case STATE_ON:
@@ -451,7 +451,7 @@ static int mt6360_flash_init_default_state(struct mt6360_led *led)
 			min(level, flash->led_cdev.max_brightness);
 		break;
 	default:
-		flash->led_cdev.brightness = LED_OFF;
+		flash->led_cdev.brightness = 0;
 	}
 
 	return mt6360_torch_brightness_set(&flash->led_cdev,
@@ -542,7 +542,7 @@ static int mt6360_led_register(struct device *parent, struct mt6360_led *led,
 
 	switch (led->led_no) {
 	case MT6360_VIRTUAL_MULTICOLOR:
-		ret = mt6360_mc_brightness_set(&led->mc.led_cdev, LED_OFF);
+		ret = mt6360_mc_brightness_set(&led->mc.led_cdev, 0);
 		if (ret) {
 			dev_err(parent,
 				"Failed to init multicolor brightness\n");
diff --git a/drivers/leds/flash/leds-rt4505.c b/drivers/leds/flash/leds-rt4505.c
index ee129ab7255d..d92899347928 100644
--- a/drivers/leds/flash/leds-rt4505.c
+++ b/drivers/leds/flash/leds-rt4505.c
@@ -59,7 +59,7 @@ static int rt4505_torch_brightness_set(struct led_classdev *lcdev,
 
 	mutex_lock(&priv->lock);
 
-	if (level != LED_OFF) {
+	if (level != 0) {
 		ret = regmap_update_bits(priv->regmap,
 					 RT4505_REG_ILED, RT4505_ITORCH_MASK,
 					 (level - 1) << RT4505_ITORCH_SHIFT);
@@ -90,19 +90,19 @@ static enum led_brightness rt4505_torch_brightness_get(
 	ret = regmap_read(priv->regmap, RT4505_REG_ENABLE, &val);
 	if (ret) {
 		dev_err(lcdev->dev, "Failed to get LED enable\n");
-		ret = LED_OFF;
+		ret = 0;
 		goto unlock;
 	}
 
 	if ((val & RT4505_ENABLE_MASK) != RT4505_TORCH_SET) {
-		ret = LED_OFF;
+		ret = 0;
 		goto unlock;
 	}
 
 	ret = regmap_read(priv->regmap, RT4505_REG_ILED, &val);
 	if (ret) {
 		dev_err(lcdev->dev, "Failed to get LED brightness\n");
-		ret = LED_OFF;
+		ret = 0;
 		goto unlock;
 	}
 
diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-rt8515.c
index 44904fdee3cc..e9eb5f57fe50 100644
--- a/drivers/leds/flash/leds-rt8515.c
+++ b/drivers/leds/flash/leds-rt8515.c
@@ -95,7 +95,7 @@ static int rt8515_led_brightness_set(struct led_classdev *led,
 
 	mutex_lock(&rt->lock);
 
-	if (brightness == LED_OFF) {
+	if (brightness == 0) {
 		/* Off */
 		rt8515_gpio_led_off(rt);
 	} else if (brightness < RT8515_TORCH_MAX) {
@@ -132,7 +132,7 @@ static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
 		rt8515_gpio_led_off(rt);
 	}
 
-	fled->led_cdev.brightness = LED_OFF;
+	fled->led_cdev.brightness = 0;
 	/* After this the torch LED will be disabled */
 
 	mutex_unlock(&rt->lock);
diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
index f4f831570f11..4c36488a33bb 100644
--- a/drivers/leds/flash/leds-sgm3140.c
+++ b/drivers/leds/flash/leds-sgm3140.c
@@ -101,7 +101,7 @@ static int sgm3140_brightness_set(struct led_classdev *led_cdev,
 {
 	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
 	struct sgm3140 *priv = flcdev_to_sgm3140(fled_cdev);
-	bool enable = brightness == LED_ON;
+	bool enable = brightness == 1;
 	int ret;
 
 	if (priv->enabled == enable)
@@ -241,7 +241,7 @@ static int sgm3140_probe(struct platform_device *pdev)
 	fled_cdev->ops = &sgm3140_flash_ops;
 
 	led_cdev->brightness_set_blocking = sgm3140_brightness_set;
-	led_cdev->max_brightness = LED_ON;
+	led_cdev->max_brightness = 1;
 	led_cdev->flags |= LED_DEV_CAP_FLASH;
 
 	sgm3140_init_flash_timeout(priv);
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 6a8ea94834fa..786132946a10 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -53,7 +53,7 @@ static ssize_t brightness_store(struct device *dev,
 	if (ret)
 		goto unlock;
 
-	if (state == LED_OFF)
+	if (state == 0)
 		led_trigger_remove(led_cdev);
 	led_set_brightness(led_cdev, state);
 	flush_work(&led_cdev->set_brightness_work);
@@ -405,7 +405,7 @@ int led_classdev_register_ext(struct device *parent,
 	up_write(&leds_list_lock);
 
 	if (!led_cdev->max_brightness)
-		led_cdev->max_brightness = LED_FULL;
+		led_cdev->max_brightness = 255;
 
 	led_update_brightness(led_cdev);
 
@@ -448,7 +448,7 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	led_stop_software_blink(led_cdev);
 
 	if (!(led_cdev->flags & LED_RETAIN_AT_SHUTDOWN))
-		led_set_brightness(led_cdev, LED_OFF);
+		led_set_brightness(led_cdev, 0);
 
 	flush_work(&led_cdev->set_brightness_work);
 
diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 4a97cb745788..eb51f9f7d81c 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -64,7 +64,7 @@ static void led_timer_function(struct timer_list *t)
 	unsigned long delay;
 
 	if (!led_cdev->blink_delay_on || !led_cdev->blink_delay_off) {
-		led_set_brightness_nosleep(led_cdev, LED_OFF);
+		led_set_brightness_nosleep(led_cdev, 0);
 		clear_bit(LED_BLINK_SW, &led_cdev->work_flags);
 		return;
 	}
@@ -89,7 +89,7 @@ static void led_timer_function(struct timer_list *t)
 		 * to restore it when the delay_off period is over.
 		 */
 		led_cdev->blink_brightness = brightness;
-		brightness = LED_OFF;
+		brightness = 0;
 		delay = led_cdev->blink_delay_off;
 	}
 
@@ -121,7 +121,7 @@ static void set_brightness_delayed(struct work_struct *ws)
 	int ret = 0;
 
 	if (test_and_clear_bit(LED_BLINK_DISABLE, &led_cdev->work_flags)) {
-		led_cdev->delayed_set_value = LED_OFF;
+		led_cdev->delayed_set_value = 0;
 		led_stop_software_blink(led_cdev);
 	}
 
@@ -154,7 +154,7 @@ static void led_set_software_blink(struct led_classdev *led_cdev,
 
 	/* never on - just set to off */
 	if (!delay_on) {
-		led_set_brightness_nosleep(led_cdev, LED_OFF);
+		led_set_brightness_nosleep(led_cdev, 0);
 		return;
 	}
 
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 072491d3e17b..17fba1ad0d3d 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -185,7 +185,7 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 		led_cdev->trigger = NULL;
 		led_cdev->trigger_data = NULL;
 		led_cdev->activated = false;
-		led_set_brightness(led_cdev, LED_OFF);
+		led_set_brightness(led_cdev, 0);
 	}
 	if (trig) {
 		spin_lock(&trig->leddev_list_lock);
@@ -231,7 +231,7 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 	synchronize_rcu();
 	led_cdev->trigger = NULL;
 	led_cdev->trigger_data = NULL;
-	led_set_brightness(led_cdev, LED_OFF);
+	led_set_brightness(led_cdev, 0);
 	kfree(event);
 
 	return ret;
diff --git a/drivers/leds/leds-adp5520.c b/drivers/leds/leds-adp5520.c
index 5a0cc7af2df8..0cc92acffbed 100644
--- a/drivers/leds/leds-adp5520.c
+++ b/drivers/leds/leds-adp5520.c
@@ -125,7 +125,7 @@ static int adp5520_led_probe(struct platform_device *pdev)
 		led_dat->cdev.name = cur_led->name;
 		led_dat->cdev.default_trigger = cur_led->default_trigger;
 		led_dat->cdev.brightness_set_blocking = adp5520_led_set;
-		led_dat->cdev.brightness = LED_OFF;
+		led_dat->cdev.brightness = 0;
 
 		if (cur_led->flags & ADP5520_FLAG_LED_MASK)
 			led_dat->flags = cur_led->flags;
diff --git a/drivers/leds/leds-an30259a.c b/drivers/leds/leds-an30259a.c
index a0df1fb28774..8df45d78418b 100644
--- a/drivers/leds/leds-an30259a.c
+++ b/drivers/leds/leds-an30259a.c
@@ -93,7 +93,7 @@ static int an30259a_brightness_set(struct led_classdev *cdev,
 		goto error;
 
 	switch (brightness) {
-	case LED_OFF:
+	case 0:
 		led_on &= ~AN30259A_LED_EN(led->num);
 		led_on &= ~AN30259A_LED_SLOPE(led->num);
 		led->sloping = false;
@@ -262,7 +262,7 @@ static void an30259a_init_default_state(struct an30259a_led *led)
 
 	switch (led->default_state) {
 	case STATE_ON:
-		led->cdev.brightness = LED_FULL;
+		led->cdev.brightness = 255;
 		break;
 	case STATE_KEEP:
 		err = regmap_read(chip->regmap, AN30259A_REG_LED_ON, &led_on);
@@ -270,14 +270,14 @@ static void an30259a_init_default_state(struct an30259a_led *led)
 			break;
 
 		if (!(led_on & AN30259A_LED_EN(led->num))) {
-			led->cdev.brightness = LED_OFF;
+			led->cdev.brightness = 0;
 			break;
 		}
 		regmap_read(chip->regmap, AN30259A_REG_LEDCC(led->num),
 			    &led->cdev.brightness);
 		break;
 	default:
-		led->cdev.brightness = LED_OFF;
+		led->cdev.brightness = 0;
 	}
 
 	an30259a_brightness_set(&led->cdev, led->cdev.brightness);
diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
index c409b80c236d..172f86daab3b 100644
--- a/drivers/leds/leds-apu.c
+++ b/drivers/leds/leds-apu.c
@@ -77,9 +77,9 @@ struct apu_led_pdata {
 static struct apu_led_pdata *apu_led;
 
 static const struct apu_led_profile apu1_led_profile[] = {
-	{ "apu:green:1", LED_ON,  APU1_FCH_GPIO_BASE + 0 * APU1_IOSIZE },
-	{ "apu:green:2", LED_OFF, APU1_FCH_GPIO_BASE + 1 * APU1_IOSIZE },
-	{ "apu:green:3", LED_OFF, APU1_FCH_GPIO_BASE + 2 * APU1_IOSIZE },
+	{ "apu:green:1", 1,  APU1_FCH_GPIO_BASE + 0 * APU1_IOSIZE },
+	{ "apu:green:2", 0, APU1_FCH_GPIO_BASE + 1 * APU1_IOSIZE },
+	{ "apu:green:3", 0, APU1_FCH_GPIO_BASE + 2 * APU1_IOSIZE },
 };
 
 static const struct dmi_system_id apu_led_dmi_table[] __initconst = {
diff --git a/drivers/leds/leds-ariel.c b/drivers/leds/leds-ariel.c
index 49e1bddaa15e..6a6cfdf7c7df 100644
--- a/drivers/leds/leds-ariel.c
+++ b/drivers/leds/leds-ariel.c
@@ -37,12 +37,12 @@ static enum led_brightness ariel_led_get(struct led_classdev *led_cdev)
 	unsigned int led_status = 0;
 
 	if (regmap_read(led->ec_ram, led->ec_index, &led_status))
-		return LED_OFF;
+		return 0;
 
 	if (led_status == EC_LED_STILL)
-		return LED_FULL;
+		return 255;
 	else
-		return LED_OFF;
+		return 0;
 }
 
 static void ariel_led_set(struct led_classdev *led_cdev,
@@ -50,7 +50,7 @@ static void ariel_led_set(struct led_classdev *led_cdev,
 {
 	struct ariel_led *led = led_cdev_to_ariel_led(led_cdev);
 
-	if (brightness == LED_OFF)
+	if (brightness == 0)
 		regmap_write(led->ec_ram, led->ec_index, EC_LED_OFF);
 	else
 		regmap_write(led->ec_ram, led->ec_index, EC_LED_STILL);
diff --git a/drivers/leds/leds-asic3.c b/drivers/leds/leds-asic3.c
index 8cbc1b8bafa5..53b7b8551808 100644
--- a/drivers/leds/leds-asic3.c
+++ b/drivers/leds/leds-asic3.c
@@ -42,7 +42,7 @@ static void brightness_set(struct led_classdev *cdev,
 	u32 timebase;
 	unsigned int base;
 
-	timebase = (value == LED_OFF) ? 0 : (LED_EN|0x4);
+	timebase = (value == 0) ? 0 : (LED_EN|0x4);
 
 	base = led_n_base[cell->id];
 	asic3_write_register(asic, (base + ASIC3_LED_PeriodTime), 32);
diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 80d937454aee..4b3043ed1d69 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -206,7 +206,7 @@ static int aw2013_blink_set(struct led_classdev *cdev,
 	}
 
 	if (!led->cdev.brightness) {
-		led->cdev.brightness = LED_FULL;
+		led->cdev.brightness = 255;
 		ret = aw2013_brightness_set(&led->cdev, led->cdev.brightness);
 		if (ret)
 			return ret;
@@ -214,8 +214,8 @@ static int aw2013_blink_set(struct led_classdev *cdev,
 
 	/* Never on - just set to off */
 	if (!*delay_on) {
-		led->cdev.brightness = LED_OFF;
-		return aw2013_brightness_set(&led->cdev, LED_OFF);
+		led->cdev.brightness = 0;
+		return aw2013_brightness_set(&led->cdev, 0);
 	}
 
 	mutex_lock(&led->chip->mutex);
diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index 2d4d87957a30..7a2d26429653 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -138,8 +138,8 @@ static void bcm6328_led_set(struct led_classdev *led_cdev,
 	led->blink_leds[1] &= ~BIT(led->pin);
 
 	/* Set LED on/off */
-	if ((led->active_low && value == LED_OFF) ||
-	    (!led->active_low && value != LED_OFF))
+	if ((led->active_low && value == 0) ||
+	    (!led->active_low && value != 0))
 		bcm6328_led_mode(led, BCM6328_LED_MODE_ON);
 	else
 		bcm6328_led_mode(led, BCM6328_LED_MODE_OFF);
@@ -348,7 +348,7 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 
 	if (!of_property_read_string(nc, "default-state", &state)) {
 		if (!strcmp(state, "on")) {
-			led->cdev.brightness = LED_FULL;
+			led->cdev.brightness = 255;
 		} else if (!strcmp(state, "keep")) {
 			void __iomem *mode;
 			unsigned long val, shift;
@@ -364,14 +364,14 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 			val &= BCM6328_LED_MODE_MASK;
 			if ((led->active_low && val == BCM6328_LED_MODE_OFF) ||
 			    (!led->active_low && val == BCM6328_LED_MODE_ON))
-				led->cdev.brightness = LED_FULL;
+				led->cdev.brightness = 255;
 			else
-				led->cdev.brightness = LED_OFF;
+				led->cdev.brightness = 0;
 		} else {
-			led->cdev.brightness = LED_OFF;
+			led->cdev.brightness = 0;
 		}
 	} else {
-		led->cdev.brightness = LED_OFF;
+		led->cdev.brightness = 0;
 	}
 
 	bcm6328_led_set(&led->cdev, led->cdev.brightness);
diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 9d2e487fa08a..955fdd4e0967 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -82,8 +82,8 @@ static void bcm6358_led_set(struct led_classdev *led_cdev,
 	spin_lock_irqsave(led->lock, flags);
 	bcm6358_led_busy(led->mem);
 	val = bcm6358_led_read(led->mem + BCM6358_REG_MODE);
-	if ((led->active_low && value == LED_OFF) ||
-	    (!led->active_low && value != LED_OFF))
+	if ((led->active_low && value == 0) ||
+	    (!led->active_low && value != 0))
 		val |= BIT(led->pin);
 	else
 		val &= ~(BIT(led->pin));
@@ -112,21 +112,21 @@ static int bcm6358_led(struct device *dev, struct device_node *nc, u32 reg,
 
 	if (!of_property_read_string(nc, "default-state", &state)) {
 		if (!strcmp(state, "on")) {
-			led->cdev.brightness = LED_FULL;
+			led->cdev.brightness = 255;
 		} else if (!strcmp(state, "keep")) {
 			unsigned long val;
 			val = bcm6358_led_read(led->mem + BCM6358_REG_MODE);
 			val &= BIT(led->pin);
 			if ((led->active_low && !val) ||
 			    (!led->active_low && val))
-				led->cdev.brightness = LED_FULL;
+				led->cdev.brightness = 255;
 			else
-				led->cdev.brightness = LED_OFF;
+				led->cdev.brightness = 0;
 		} else {
-			led->cdev.brightness = LED_OFF;
+			led->cdev.brightness = 0;
 		}
 	} else {
-		led->cdev.brightness = LED_OFF;
+		led->cdev.brightness = 0;
 	}
 
 	bcm6358_led_set(&led->cdev, led->cdev.brightness);
diff --git a/drivers/leds/leds-bd2802.c b/drivers/leds/leds-bd2802.c
index 8bbaef5a2986..096b8c86c0ea 100644
--- a/drivers/leds/leds-bd2802.c
+++ b/drivers/leds/leds-bd2802.c
@@ -522,7 +522,7 @@ static int bd2802_set_##name##_brightness(struct led_classdev *led_cdev,\
 		container_of(led_cdev, struct bd2802_led, cdev_##name);	\
 	led->led_id = id;						\
 	led->color = clr;						\
-	if (value == LED_OFF) {						\
+	if (value == 0) {						\
 		led->state = BD2802_OFF;				\
 		bd2802_turn_off(led, led->led_id, led->color);		\
 	} else {							\
@@ -557,7 +557,7 @@ static int bd2802_register_led_classdev(struct bd2802_led *led)
 	int ret;
 
 	led->cdev_led1r.name = "led1_R";
-	led->cdev_led1r.brightness = LED_OFF;
+	led->cdev_led1r.brightness = 0;
 	led->cdev_led1r.brightness_set_blocking = bd2802_set_led1r_brightness;
 	led->cdev_led1r.blink_set = bd2802_set_led1r_blink;
 
@@ -569,7 +569,7 @@ static int bd2802_register_led_classdev(struct bd2802_led *led)
 	}
 
 	led->cdev_led1g.name = "led1_G";
-	led->cdev_led1g.brightness = LED_OFF;
+	led->cdev_led1g.brightness = 0;
 	led->cdev_led1g.brightness_set_blocking = bd2802_set_led1g_brightness;
 	led->cdev_led1g.blink_set = bd2802_set_led1g_blink;
 
@@ -581,7 +581,7 @@ static int bd2802_register_led_classdev(struct bd2802_led *led)
 	}
 
 	led->cdev_led1b.name = "led1_B";
-	led->cdev_led1b.brightness = LED_OFF;
+	led->cdev_led1b.brightness = 0;
 	led->cdev_led1b.brightness_set_blocking = bd2802_set_led1b_brightness;
 	led->cdev_led1b.blink_set = bd2802_set_led1b_blink;
 
@@ -593,7 +593,7 @@ static int bd2802_register_led_classdev(struct bd2802_led *led)
 	}
 
 	led->cdev_led2r.name = "led2_R";
-	led->cdev_led2r.brightness = LED_OFF;
+	led->cdev_led2r.brightness = 0;
 	led->cdev_led2r.brightness_set_blocking = bd2802_set_led2r_brightness;
 	led->cdev_led2r.blink_set = bd2802_set_led2r_blink;
 
@@ -605,7 +605,7 @@ static int bd2802_register_led_classdev(struct bd2802_led *led)
 	}
 
 	led->cdev_led2g.name = "led2_G";
-	led->cdev_led2g.brightness = LED_OFF;
+	led->cdev_led2g.brightness = 0;
 	led->cdev_led2g.brightness_set_blocking = bd2802_set_led2g_brightness;
 	led->cdev_led2g.blink_set = bd2802_set_led2g_blink;
 
@@ -617,7 +617,7 @@ static int bd2802_register_led_classdev(struct bd2802_led *led)
 	}
 
 	led->cdev_led2b.name = "led2_B";
-	led->cdev_led2b.brightness = LED_OFF;
+	led->cdev_led2b.brightness = 0;
 	led->cdev_led2b.brightness_set_blocking = bd2802_set_led2b_brightness;
 	led->cdev_led2b.blink_set = bd2802_set_led2b_blink;
 	led->cdev_led2b.flags |= LED_CORE_SUSPENDRESUME;
diff --git a/drivers/leds/leds-clevo-mail.c b/drivers/leds/leds-clevo-mail.c
index f512e99b976b..24e985539b18 100644
--- a/drivers/leds/leds-clevo-mail.c
+++ b/drivers/leds/leds-clevo-mail.c
@@ -97,9 +97,9 @@ static void clevo_mail_led_set(struct led_classdev *led_cdev,
 {
 	i8042_lock_chip();
 
-	if (value == LED_OFF)
+	if (value == 0)
 		i8042_command(NULL, CLEVO_MAIL_LED_OFF);
-	else if (value <= LED_HALF)
+	else if (value <= 127)
 		i8042_command(NULL, CLEVO_MAIL_LED_BLINK_0_5HZ);
 	else
 		i8042_command(NULL, CLEVO_MAIL_LED_BLINK_1HZ);
@@ -210,7 +210,7 @@ static void __exit clevo_mail_led_exit(void)
 	platform_device_unregister(pdev);
 	platform_driver_unregister(&clevo_mail_led_driver);
 
-	clevo_mail_led_set(NULL, LED_OFF);
+	clevo_mail_led_set(NULL, 0);
 }
 
 module_init(clevo_mail_led_init);
diff --git a/drivers/leds/leds-cobalt-qube.c b/drivers/leds/leds-cobalt-qube.c
index ef22e1e94048..4af123a10342 100644
--- a/drivers/leds/leds-cobalt-qube.c
+++ b/drivers/leds/leds-cobalt-qube.c
@@ -29,7 +29,7 @@ static void qube_front_led_set(struct led_classdev *led_cdev,
 
 static struct led_classdev qube_front_led = {
 	.name			= "qube::front",
-	.brightness		= LED_FULL,
+	.brightness		= 255,
 	.brightness_set		= qube_front_led_set,
 	.default_trigger	= "default-on",
 };
diff --git a/drivers/leds/leds-cpcap.c b/drivers/leds/leds-cpcap.c
index 7d41ce8c9bb1..8f7eba98a636 100644
--- a/drivers/leds/leds-cpcap.c
+++ b/drivers/leds/leds-cpcap.c
@@ -108,13 +108,13 @@ static int cpcap_led_set(struct led_classdev *ledc, enum led_brightness value)
 
 	mutex_lock(&led->update_lock);
 
-	if (value > LED_OFF) {
+	if (value > 0) {
 		err = cpcap_led_set_power(led, true);
 		if (err)
 			goto exit;
 	}
 
-	if (value == LED_OFF) {
+	if (value == 0) {
 		/* Avoid HW issue by turning off current before duty cycle */
 		err = regmap_update_bits(led->regmap,
 			led->info->reg, led->info->mask, CPCAP_LED_NO_CURRENT);
@@ -123,9 +123,9 @@ static int cpcap_led_set(struct led_classdev *ledc, enum led_brightness value)
 			goto exit;
 		}
 
-		brightness = cpcap_led_val(value, LED_OFF);
+		brightness = cpcap_led_val(value, 0);
 	} else {
-		brightness = cpcap_led_val(value, LED_ON);
+		brightness = cpcap_led_val(value, 1);
 	}
 
 	err = regmap_update_bits(led->regmap, led->info->reg, led->info->mask,
@@ -135,7 +135,7 @@ static int cpcap_led_set(struct led_classdev *ledc, enum led_brightness value)
 		goto exit;
 	}
 
-	if (value == LED_OFF) {
+	if (value == 0) {
 		err = cpcap_led_set_power(led, false);
 		if (err)
 			goto exit;
diff --git a/drivers/leds/leds-da903x.c b/drivers/leds/leds-da903x.c
index 2b5fb00438a2..a09446591add 100644
--- a/drivers/leds/leds-da903x.c
+++ b/drivers/leds/leds-da903x.c
@@ -66,7 +66,7 @@ static int da903x_led_set(struct led_classdev *led_cdev,
 	case DA9034_ID_LED_1:
 	case DA9034_ID_LED_2:
 		offset = DA9034_LED_OFFSET(led->id);
-		val = (value * 0x5f / LED_FULL) & 0x7f;
+		val = (value * 0x5f / 255) & 0x7f;
 		val |= (led->flags & DA9034_LED_RAMP) ? 0x80 : 0;
 		ret = da903x_write(led->master, DA9034_LED1_CONTROL + offset,
 				   val);
@@ -104,7 +104,7 @@ static int da903x_led_probe(struct platform_device *pdev)
 	led->cdev.name = pdata->name;
 	led->cdev.default_trigger = pdata->default_trigger;
 	led->cdev.brightness_set_blocking = da903x_led_set;
-	led->cdev.brightness = LED_OFF;
+	led->cdev.brightness = 0;
 
 	led->id = id;
 	led->flags = pdata->flags;
diff --git a/drivers/leds/leds-da9052.c b/drivers/leds/leds-da9052.c
index 04060c862bf9..69b72892b540 100644
--- a/drivers/leds/leds-da9052.c
+++ b/drivers/leds/leds-da9052.c
@@ -119,7 +119,7 @@ static int da9052_led_probe(struct platform_device *pdev)
 	for (i = 0; i < pled->num_leds; i++) {
 		led[i].cdev.name = pled->leds[i].name;
 		led[i].cdev.brightness_set_blocking = da9052_led_set;
-		led[i].cdev.brightness = LED_OFF;
+		led[i].cdev.brightness = 0;
 		led[i].cdev.max_brightness = DA9052_MAX_BRIGHTNESS;
 		led[i].led_index = pled->leds[i].flags;
 		led[i].da9052 = dev_get_drvdata(pdev->dev.parent);
@@ -169,7 +169,7 @@ static int da9052_led_remove(struct platform_device *pdev)
 	pled = pdata->pled;
 
 	for (i = 0; i < pled->num_leds; i++) {
-		da9052_set_led_brightness(&led[i], LED_OFF);
+		da9052_set_led_brightness(&led[i], 0);
 		led_classdev_unregister(&led[i].cdev);
 	}
 
diff --git a/drivers/leds/leds-dac124s085.c b/drivers/leds/leds-dac124s085.c
index 20dc9b9d7dea..582d9a070115 100644
--- a/drivers/leds/leds-dac124s085.c
+++ b/drivers/leds/leds-dac124s085.c
@@ -66,7 +66,7 @@ static int dac124s085_probe(struct spi_device *spi)
 		snprintf(led->name, sizeof(led->name), "dac124s085-%d", i);
 		mutex_init(&led->mutex);
 		led->ldev.name = led->name;
-		led->ldev.brightness = LED_OFF;
+		led->ldev.brightness = 0;
 		led->ldev.max_brightness = 0xfff;
 		led->ldev.brightness_set_blocking = dac124s085_set_brightness;
 		ret = led_classdev_register(&spi->dev, &led->ldev);
diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
index f9eb59a25570..b1a7ceaca434 100644
--- a/drivers/leds/leds-el15203000.c
+++ b/drivers/leds/leds-el15203000.c
@@ -133,7 +133,7 @@ static int el15203000_set_blocking(struct led_classdev *ldev,
 {
 	struct el15203000_led *led = to_el15203000_led(ldev);
 
-	return el15203000_cmd(led, brightness == LED_OFF ? EL_OFF : EL_ON);
+	return el15203000_cmd(led, brightness == 0 ? EL_OFF : EL_ON);
 }
 
 static int el15203000_pattern_set_S(struct led_classdev *ldev,
@@ -256,7 +256,7 @@ static int el15203000_probe_dt(struct el15203000 *priv)
 		}
 
 		led->priv			  = priv;
-		led->ldev.max_brightness	  = LED_ON;
+		led->ldev.max_brightness	  = 1;
 		led->ldev.brightness_set_blocking = el15203000_set_blocking;
 
 		if (led->reg == 'S') {
diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 092eb59a7d32..ac363efc37bc 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -38,7 +38,7 @@ static void gpio_led_set(struct led_classdev *led_cdev,
 	struct gpio_led_data *led_dat = cdev_to_gpio_led_data(led_cdev);
 	int level;
 
-	if (value == LED_OFF)
+	if (value == 0)
 		level = 0;
 	else
 		level = 1;
@@ -292,7 +292,7 @@ static void gpio_led_shutdown(struct platform_device *pdev)
 		struct gpio_led_data *led = &priv->leds[i];
 
 		if (!(led->cdev.flags & LED_RETAIN_AT_SHUTDOWN))
-			gpio_led_set(&led->cdev, LED_OFF);
+			gpio_led_set(&led->cdev, 0);
 	}
 }
 
diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index 4161b9dd7e48..2a9c8dcc9a2c 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -140,7 +140,7 @@ static int is31fl319x_brightness_set(struct led_classdev *cdev,
 		ret = regmap_read(is31->regmap, IS31FL319X_PWM(i), &pwm_value);
 		dev_dbg(&is31->client->dev, "%s read %d: ret=%d: %d\n",
 			__func__, i, ret, pwm_value);
-		on = ret >= 0 && pwm_value > LED_OFF;
+		on = ret >= 0 && pwm_value > 0;
 
 		if (i < 3)
 			ctrl1 |= on << i;       /* 0..2 => bit 0..2 */
diff --git a/drivers/leds/leds-lm3530.c b/drivers/leds/leds-lm3530.c
index e72393534b72..a5358cac5d4d 100644
--- a/drivers/leds/leds-lm3530.c
+++ b/drivers/leds/leds-lm3530.c
@@ -174,7 +174,7 @@ static void lm3530_als_configure(struct lm3530_platform_data *pdata,
 
 	for (i = 0; i < LM3530_ALS_ZB_MAX; i++)
 		als->zones[i] = (((als_vmin + LM3530_ALS_OFFSET_mV) +
-			als_vstep + (i * als_vstep)) * LED_FULL) / 1000;
+			als_vstep + (i * als_vstep)) * 255) / 1000;
 
 	als->config =
 		(pdata->als_avrg_time << LM3530_ALS_AVG_TIME_SHIFT) |
@@ -436,7 +436,7 @@ static int lm3530_probe(struct i2c_client *client,
 	drvdata->mode = pdata->mode;
 	drvdata->client = client;
 	drvdata->pdata = pdata;
-	drvdata->brightness = LED_OFF;
+	drvdata->brightness = 0;
 	drvdata->enable = false;
 	drvdata->led_dev.name = LM3530_LED_DEV;
 	drvdata->led_dev.brightness_set = lm3530_brightness_set;
diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index beb53040e09e..b0671fe4957b 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -354,7 +354,7 @@ static int lm3532_brightness_set(struct led_classdev *led_cdev,
 	mutex_lock(&led->priv->lock);
 
 	if (led->mode == LM3532_ALS_CTRL) {
-		if (brt_val > LED_OFF)
+		if (brt_val > 0)
 			ret = lm3532_led_enable(led);
 		else
 			ret = lm3532_led_disable(led);
@@ -362,7 +362,7 @@ static int lm3532_brightness_set(struct led_classdev *led_cdev,
 		goto unlock;
 	}
 
-	if (brt_val == LED_OFF) {
+	if (brt_val == 0) {
 		ret = lm3532_led_disable(led);
 		goto unlock;
 	}
@@ -459,9 +459,9 @@ static int lm3532_als_configure(struct lm3532_data *priv,
 
 	for (i = 0; i < LM3532_ALS_ZB_MAX; i++) {
 		als->zones_lo[i] = ((als_vmin + als_vstep + (i * als_vstep)) *
-				LED_FULL) / 1000;
+				255) / 1000;
 		als->zones_hi[i] = ((als_vmin + LM3532_ALS_OFFSET_mV +
-				als_vstep + (i * als_vstep)) * LED_FULL) / 1000;
+				als_vstep + (i * als_vstep)) * 255) / 1000;
 
 		zone_reg = LM3532_REG_ZN_0_HI + i * 2;
 		ret = regmap_write(priv->regmap, zone_reg, als->zones_lo[i]);
diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
index 43d5970d96aa..7411c528a0d4 100644
--- a/drivers/leds/leds-lm3533.c
+++ b/drivers/leds/leds-lm3533.c
@@ -678,7 +678,7 @@ static int lm3533_led_probe(struct platform_device *pdev)
 	led->cdev.brightness_set_blocking = lm3533_led_set;
 	led->cdev.brightness_get = lm3533_led_get;
 	led->cdev.blink_set = lm3533_led_blink_set;
-	led->cdev.brightness = LED_OFF;
+	led->cdev.brightness = 0;
 	led->cdev.groups = lm3533_led_attribute_groups;
 	led->id = pdev->id;
 
@@ -738,7 +738,7 @@ static void lm3533_led_shutdown(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "%s\n", __func__);
 
 	lm3533_ctrlbank_disable(&led->cb);
-	lm3533_led_set(&led->cdev, LED_OFF);		/* disable blink */
+	lm3533_led_set(&led->cdev, 0);		/* disable blink */
 }
 
 static struct platform_driver lm3533_led_driver = {
diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index afe6fb297855..be5fbed7f428 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -440,7 +440,7 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
 	}
 
 	ret = fwnode_property_read_u32(child, "led-max-microamp", &max_cur);
-	led->led_dev.max_brightness = ret ? LED_FULL :
+	led->led_dev.max_brightness = ret ? 255 :
 		lm3692x_max_brightness(led, max_cur);
 
 	init_data.fwnode = child;
diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index a8c9322558cc..9366e0b7fb4d 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -52,7 +52,7 @@
  * @lmu_data: Register and setting values for common code
  * @control_bank: Control bank the LED is associated to. 0 is control bank A
  *		   1 is control bank B
- * @enabled: LED brightness level (or LED_OFF)
+ * @enabled: LED brightness level (or 0)
  * @num_leds: Number of LEDs available
  */
 struct lm3697_led {
@@ -130,7 +130,7 @@ static int lm3697_brightness_set(struct led_classdev *led_cdev,
 
 	mutex_lock(&led->priv->lock);
 
-	if (brt_val == LED_OFF) {
+	if (brt_val == 0) {
 		ret = regmap_update_bits(led->priv->regmap, LM3697_CTRL_ENABLE,
 					 ctrl_en_val, ~ctrl_en_val);
 		if (ret) {
@@ -138,7 +138,7 @@ static int lm3697_brightness_set(struct led_classdev *led_cdev,
 			goto brightness_out;
 		}
 
-		led->enabled = LED_OFF;
+		led->enabled = 0;
 	} else {
 		ret = ti_lmu_common_set_brightness(&led->lmu_data, brt_val);
 		if (ret) {
diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
index 6ee9131fbf25..3b65b0206312 100644
--- a/drivers/leds/leds-lp3952.c
+++ b/drivers/leds/leds-lp3952.c
@@ -67,7 +67,7 @@ static int lp3952_set_brightness(struct led_classdev *cdev,
 	dev_dbg(cdev->dev, "Brightness request: %d on %d\n", value,
 		led->channel);
 
-	if (value == LED_OFF) {
+	if (value == 0) {
 		lp3952_on_off(priv, led->channel, false);
 		return 0;
 	}
@@ -124,7 +124,7 @@ static int lp3952_register_led_classdev(struct lp3952_led_array *priv)
 			continue;
 
 		priv->leds[i].cdev.name = priv->leds[i].name;
-		priv->leds[i].cdev.brightness = LED_OFF;
+		priv->leds[i].cdev.brightness = 0;
 		priv->leds[i].cdev.max_brightness = LP3952_BRIGHT_MAX;
 		priv->leds[i].cdev.brightness_set_blocking =
 				lp3952_set_brightness;
diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index d0160fde0f94..dd69c190ce10 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -90,7 +90,7 @@ static int lt3593_led_probe(struct platform_device *pdev)
 	}
 
 	led_data->cdev.brightness_set_blocking = lt3593_led_set;
-	led_data->cdev.brightness = state ? LED_FULL : LED_OFF;
+	led_data->cdev.brightness = state ? 255 : 0;
 
 	init_data.fwnode = child;
 	init_data.devicename = LED_LT3593_NAME;
diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index 1eeac56b0014..5ea67e3c319c 100644
--- a/drivers/leds/leds-max77650.c
+++ b/drivers/leds/leds-max77650.c
@@ -45,14 +45,14 @@ static struct max77650_led *max77650_to_led(struct led_classdev *cdev)
 }
 
 static int max77650_led_brightness_set(struct led_classdev *cdev,
-				       enum led_brightness brightness)
+				       unsigned int brightness)
 {
 	struct max77650_led *led = max77650_to_led(cdev);
 	int val, mask;
 
 	mask = MAX77650_LED_BR_MASK | MAX77650_LED_EN_MASK;
 
-	if (brightness == LED_OFF)
+	if (brightness == 0)
 		val = MAX77650_LED_DISABLE;
 	else
 		val = MAX77650_LED_ENABLE | brightness;
diff --git a/drivers/leds/leds-menf21bmc.c b/drivers/leds/leds-menf21bmc.c
index 6b1b47160602..0203db50cda2 100644
--- a/drivers/leds/leds-menf21bmc.c
+++ b/drivers/leds/leds-menf21bmc.c
@@ -62,7 +62,7 @@ menf21bmc_led_set(struct led_classdev *led_cdev, enum led_brightness value)
 	if (led_val < 0)
 		goto err_out;
 
-	if (value == LED_OFF)
+	if (value == 0)
 		led_val &= ~led->led_bit;
 	else
 		led_val |= led->led_bit;
diff --git a/drivers/leds/leds-mlxcpld.c b/drivers/leds/leds-mlxcpld.c
index 1355c84a2919..93526857e766 100644
--- a/drivers/leds/leds-mlxcpld.c
+++ b/drivers/leds/leds-mlxcpld.c
@@ -131,7 +131,7 @@ static struct mlxcpld_led_profile mlxcpld_led_default_profile[] = {
 		"mlxcpld:fan1:green",
 	},
 	{
-		0x21, 0xf0, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
+		0x21, 0xf0, MLXCPLD_LED_RED_STATIC_ON, 0,
 		"mlxcpld:fan1:red",
 	},
 	{
@@ -139,7 +139,7 @@ static struct mlxcpld_led_profile mlxcpld_led_default_profile[] = {
 		"mlxcpld:fan2:green",
 	},
 	{
-		0x21, 0x0f, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
+		0x21, 0x0f, MLXCPLD_LED_RED_STATIC_ON, 0,
 		"mlxcpld:fan2:red",
 	},
 	{
@@ -147,7 +147,7 @@ static struct mlxcpld_led_profile mlxcpld_led_default_profile[] = {
 		"mlxcpld:fan3:green",
 	},
 	{
-		0x22, 0xf0, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
+		0x22, 0xf0, MLXCPLD_LED_RED_STATIC_ON, 0,
 		"mlxcpld:fan3:red",
 	},
 	{
@@ -155,7 +155,7 @@ static struct mlxcpld_led_profile mlxcpld_led_default_profile[] = {
 		"mlxcpld:fan4:green",
 	},
 	{
-		0x22, 0x0f, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
+		0x22, 0x0f, MLXCPLD_LED_RED_STATIC_ON, 0,
 		"mlxcpld:fan4:red",
 	},
 	{
@@ -163,7 +163,7 @@ static struct mlxcpld_led_profile mlxcpld_led_default_profile[] = {
 		"mlxcpld:psu:green",
 	},
 	{
-		0x20, 0x0f, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
+		0x20, 0x0f, MLXCPLD_LED_RED_STATIC_ON, 0,
 		"mlxcpld:psu:red",
 	},
 	{
@@ -171,7 +171,7 @@ static struct mlxcpld_led_profile mlxcpld_led_default_profile[] = {
 		"mlxcpld:status:green",
 	},
 	{
-		0x20, 0xf0, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
+		0x20, 0xf0, MLXCPLD_LED_RED_STATIC_ON, 0,
 		"mlxcpld:status:red",
 	},
 };
@@ -183,7 +183,7 @@ static struct mlxcpld_led_profile mlxcpld_led_msn2100_profile[] = {
 		"mlxcpld:fan:green",
 	},
 	{
-		0x21, 0xf0, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
+		0x21, 0xf0, MLXCPLD_LED_RED_STATIC_ON, 0,
 		"mlxcpld:fan:red",
 	},
 	{
@@ -191,7 +191,7 @@ static struct mlxcpld_led_profile mlxcpld_led_msn2100_profile[] = {
 		"mlxcpld:psu1:green",
 	},
 	{
-		0x23, 0xf0, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
+		0x23, 0xf0, MLXCPLD_LED_RED_STATIC_ON, 0,
 		"mlxcpld:psu1:red",
 	},
 	{
@@ -199,7 +199,7 @@ static struct mlxcpld_led_profile mlxcpld_led_msn2100_profile[] = {
 		"mlxcpld:psu2:green",
 	},
 	{
-		0x23, 0x0f, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
+		0x23, 0x0f, MLXCPLD_LED_RED_STATIC_ON, 0,
 		"mlxcpld:psu2:red",
 	},
 	{
@@ -207,11 +207,11 @@ static struct mlxcpld_led_profile mlxcpld_led_msn2100_profile[] = {
 		"mlxcpld:status:green",
 	},
 	{
-		0x20, 0xf0, MLXCPLD_LED_RED_STATIC_ON, LED_OFF,
+		0x20, 0xf0, MLXCPLD_LED_RED_STATIC_ON, 0,
 		"mlxcpld:status:red",
 	},
 	{
-		0x24, 0xf0, MLXCPLD_LED_GREEN_STATIC_ON, LED_OFF,
+		0x24, 0xf0, MLXCPLD_LED_GREEN_STATIC_ON, 0,
 		"mlxcpld:uid:blue",
 	},
 };
diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c
index b7855c93bd72..2340a205ce44 100644
--- a/drivers/leds/leds-mlxreg.c
+++ b/drivers/leds/leds-mlxreg.c
@@ -119,7 +119,7 @@ mlxreg_led_get_hw(struct mlxreg_led_data *led_data)
 		dev_warn(led_data->led_cdev.dev, "Failed to get current brightness, error: %d\n",
 			 err);
 		/* Assume the LED is OFF */
-		return LED_OFF;
+		return 0;
 	}
 
 	regval = regval & ~data->mask;
@@ -220,20 +220,20 @@ static int mlxreg_led_config(struct mlxreg_led_priv_data *priv)
 		led_data->data_parent = priv;
 		if (strstr(data->label, "red") ||
 		    strstr(data->label, "orange")) {
-			brightness = LED_OFF;
+			brightness = 0;
 			led_data->base_color = MLXREG_LED_RED_SOLID;
 		} else if (strstr(data->label, "amber")) {
-			brightness = LED_OFF;
+			brightness = 0;
 			led_data->base_color = MLXREG_LED_AMBER_SOLID;
 		} else {
-			brightness = LED_OFF;
+			brightness = 0;
 			led_data->base_color = MLXREG_LED_GREEN_SOLID;
 		}
 		snprintf(led_data->led_cdev_name, sizeof(led_data->led_cdev_name),
 			 "mlxreg:%s", data->label);
 		led_cdev->name = led_data->led_cdev_name;
 		led_cdev->brightness = brightness;
-		led_cdev->max_brightness = LED_ON;
+		led_cdev->max_brightness = 1;
 		led_cdev->brightness_set_blocking =
 						mlxreg_led_brightness_set;
 		led_cdev->brightness_get = mlxreg_led_brightness_get;
diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
index f59e0e8bda8b..cbefd78f2d49 100644
--- a/drivers/leds/leds-mt6323.c
+++ b/drivers/leds/leds-mt6323.c
@@ -354,7 +354,7 @@ static int mt6323_led_set_dt_default(struct led_classdev *cdev,
 			ret =
 			mt6323_led_set_brightness(cdev, cdev->max_brightness);
 		} else  {
-			ret = mt6323_led_set_brightness(cdev, LED_OFF);
+			ret = mt6323_led_set_brightness(cdev, 0);
 		}
 	}
 
diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index 77213b79f84d..8ffbe5e19952 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -177,7 +177,7 @@ static void netxbig_led_set(struct led_classdev *led_cdev,
 
 	spin_lock_irqsave(&led_dat->lock, flags);
 
-	if (value == LED_OFF) {
+	if (value == 0) {
 		mode = NETXBIG_LED_OFF;
 		set_brightness = 0;
 	} else {
@@ -295,7 +295,7 @@ static int create_netxbig_led(struct platform_device *pdev,
 	 * the whole boot process (bootloader+linux).
 	 */
 	led_dat->sata = 0;
-	led_dat->cdev.brightness = LED_OFF;
+	led_dat->cdev.brightness = 0;
 	led_dat->cdev.max_brightness = template->bright_max;
 	led_dat->cdev.flags |= LED_CORE_SUSPENDRESUME;
 	led_dat->mode_addr = template->mode_addr;
diff --git a/drivers/leds/leds-nic78bx.c b/drivers/leds/leds-nic78bx.c
index f196f52eec1e..25639c40975c 100644
--- a/drivers/leds/leds-nic78bx.c
+++ b/drivers/leds/leds-nic78bx.c
@@ -72,7 +72,7 @@ static enum led_brightness nic78bx_brightness_get(struct led_classdev *cdev)
 	value = inb(nled->data->io_base);
 	spin_unlock_irqrestore(&nled->data->lock, flags);
 
-	return (value & nled->bit) ? 1 : LED_OFF;
+	return (value & nled->bit) ? 1 : 0;
 }
 
 static struct nic78bx_led nic78bx_leds[] = {
diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index 1677d66d8b0e..34e899adfc0d 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -106,7 +106,7 @@ static void ns2_led_set(struct led_classdev *led_cdev,
 	struct ns2_led *led = container_of(led_cdev, struct ns2_led, cdev);
 	enum ns2_led_modes mode;
 
-	if (value == LED_OFF)
+	if (value == 0)
 		mode = NS_V2_LED_OFF;
 	else if (led->sata)
 		mode = NS_V2_LED_SATA;
@@ -224,7 +224,7 @@ static int ns2_led_register(struct device *dev, struct fwnode_handle *node,
 
 	/* Set LED initial state. */
 	led->sata = (mode == NS_V2_LED_SATA) ? 1 : 0;
-	led->cdev.brightness = (mode == NS_V2_LED_OFF) ? LED_OFF : LED_FULL;
+	led->cdev.brightness = (mode == NS_V2_LED_OFF) ? 0 : 255;
 
 	init_data.fwnode = node;
 
diff --git a/drivers/leds/leds-ot200.c b/drivers/leds/leds-ot200.c
index 12af1127d9b7..693fbfeced6c 100644
--- a/drivers/leds/leds-ot200.c
+++ b/drivers/leds/leds-ot200.c
@@ -105,7 +105,7 @@ static void ot200_led_brightness_set(struct led_classdev *led_cdev,
 	else
 		BUG();
 
-	if (value == LED_OFF)
+	if (value == 0)
 		*val &= ~led->mask;
 	else
 		*val |= led->mask;
diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 017794bb87ae..3e14a61e9807 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -177,9 +177,9 @@ static int pca9532_set_brightness(struct led_classdev *led_cdev,
 	int err = 0;
 	struct pca9532_led *led = ldev_to_led(led_cdev);
 
-	if (value == LED_OFF)
+	if (value == 0)
 		led->state = PCA9532_OFF;
-	else if (value == LED_FULL)
+	else if (value == 255)
 		led->state = PCA9532_ON;
 	else {
 		led->state = PCA9532_PWM0; /* Thecus: hardcode one pwm */
@@ -386,7 +386,7 @@ static int pca9532_configure(struct i2c_client *client,
 			led->name = pled->name;
 			led->ldev.name = led->name;
 			led->ldev.default_trigger = pled->default_trigger;
-			led->ldev.brightness = LED_OFF;
+			led->ldev.brightness = 0;
 			led->ldev.brightness_set_blocking =
 						pca9532_set_brightness;
 			led->ldev.blink_set = pca9532_set_blink;
diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index a6b5699aeae4..2230d3f0e846 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -57,9 +57,9 @@
 #define PCA955X_LS_BLINK0	0x2	/* Blink at PWM0 rate */
 #define PCA955X_LS_BLINK1	0x3	/* Blink at PWM1 rate */
 
-#define PCA955X_GPIO_INPUT	LED_OFF
-#define PCA955X_GPIO_HIGH	LED_OFF
-#define PCA955X_GPIO_LOW	LED_FULL
+#define PCA955X_GPIO_INPUT	0
+#define PCA955X_GPIO_HIGH	0
+#define PCA955X_GPIO_LOW	255
 
 enum pca955x_type {
 	pca9550,
@@ -265,13 +265,13 @@ static enum led_brightness pca955x_led_get(struct led_classdev *led_cdev)
 	ls = (ls >> ((pca955x_led->led_num % 4) << 1)) & 0x3;
 	switch (ls) {
 	case PCA955X_LS_LED_ON:
-		ret = LED_FULL;
+		ret = 255;
 		break;
 	case PCA955X_LS_LED_OFF:
-		ret = LED_OFF;
+		ret = 0;
 		break;
 	case PCA955X_LS_BLINK0:
-		ret = LED_HALF;
+		ret = 127;
 		break;
 	case PCA955X_LS_BLINK1:
 		ret = pca955x_read_pwm(pca955x->client, 1, &pwm);
@@ -307,13 +307,13 @@ static int pca955x_led_set(struct led_classdev *led_cdev,
 		goto out;
 
 	switch (value) {
-	case LED_FULL:
+	case 255:
 		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_ON);
 		break;
-	case LED_OFF:
+	case 0:
 		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_LED_OFF);
 		break;
-	case LED_HALF:
+	case 127:
 		ls = pca955x_ledsel(ls, ls_led, PCA955X_LS_BLINK0);
 		break;
 	default:
@@ -578,12 +578,12 @@ static int pca955x_probe(struct i2c_client *client)
 
 			if (pdata->leds[i].default_state ==
 			    LEDS_GPIO_DEFSTATE_OFF) {
-				err = pca955x_led_set(led, LED_OFF);
+				err = pca955x_led_set(led, 0);
 				if (err)
 					return err;
 			} else if (pdata->leds[i].default_state ==
 				   LEDS_GPIO_DEFSTATE_ON) {
-				err = pca955x_led_set(led, LED_FULL);
+				err = pca955x_led_set(led, 255);
 				if (err)
 					return err;
 			}
@@ -621,16 +621,16 @@ static int pca955x_probe(struct i2c_client *client)
 			 */
 			if (pdata->leds[i].default_state ==
 			    LEDS_GPIO_DEFSTATE_KEEP) {
-				if (led->brightness != LED_FULL &&
-				    led->brightness != LED_OFF &&
-				    led->brightness != LED_HALF)
+				if (led->brightness != 255 &&
+				    led->brightness != 0 &&
+				    led->brightness != 127)
 					keep_pwm = true;
 			}
 		}
 	}
 
 	/* PWM0 is used for half brightness or 50% duty cycle */
-	err = pca955x_write_pwm(client, 0, 255 - LED_HALF);
+	err = pca955x_write_pwm(client, 0, 255 - 127);
 	if (err)
 		return err;
 
diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 00aecd67e348..17612f5021b9 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -128,11 +128,11 @@ static int pca963x_brightness(struct pca963x_led *led,
 	ledout = i2c_smbus_read_byte_data(client, ledout_addr);
 
 	switch (brightness) {
-	case LED_FULL:
+	case 255:
 		val = (ledout & ~mask) | (PCA963X_LED_ON << shift);
 		ret = i2c_smbus_write_byte_data(client, ledout_addr, val);
 		break;
-	case LED_OFF:
+	case 0:
 		val = ledout & ~mask;
 		ret = i2c_smbus_write_byte_data(client, ledout_addr, val);
 		break;
diff --git a/drivers/leds/leds-pm8058.c b/drivers/leds/leds-pm8058.c
index fb2ab72c0c40..535b471a634a 100644
--- a/drivers/leds/leds-pm8058.c
+++ b/drivers/leds/leds-pm8058.c
@@ -64,7 +64,7 @@ static enum led_brightness pm8058_led_get(struct led_classdev *cled)
 	ret = regmap_read(led->map, led->reg, &val);
 	if (ret) {
 		pr_err("Failed to get LED brightness\n");
-		return LED_OFF;
+		return 0;
 	}
 
 	switch (led->ledtype) {
@@ -78,7 +78,7 @@ static enum led_brightness pm8058_led_get(struct led_classdev *cled)
 		val >>= PM8058_LED_TYPE_KEYPAD_SHIFT;
 		break;
 	default:
-		val = LED_OFF;
+		val = 0;
 		break;
 	}
 
@@ -133,8 +133,8 @@ static int pm8058_led_probe(struct platform_device *pdev)
 			led->cdev.brightness = maxbright;
 			pm8058_led_set(&led->cdev, maxbright);
 		} else {
-			led->cdev.brightness = LED_OFF;
-			pm8058_led_set(&led->cdev, LED_OFF);
+			led->cdev.brightness = 0;
+			pm8058_led_set(&led->cdev, 0);
 		}
 	}
 
diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index 743e2cdd0891..9ee3ad46a82c 100644
--- a/drivers/leds/leds-powernv.c
+++ b/drivers/leds/leds-powernv.c
@@ -146,7 +146,7 @@ static enum led_brightness powernv_led_get(struct powernv_led_data *powernv_led)
 	if (rc != OPAL_SUCCESS && rc != OPAL_PARTIAL) {
 		dev_err(dev, "%s: OPAL get led call failed [rc=%d]\n",
 			__func__, rc);
-		return LED_OFF;
+		return 0;
 	}
 
 	led_mask = be64_to_cpu(mask);
@@ -156,14 +156,14 @@ static enum led_brightness powernv_led_get(struct powernv_led_data *powernv_led)
 	if (!((led_mask >> powernv_led->led_type) & OPAL_SLOT_LED_STATE_ON)) {
 		dev_err(dev, "%s: LED status not available for %s\n",
 			__func__, powernv_led->cdev.name);
-		return LED_OFF;
+		return 0;
 	}
 
 	/* LED status value */
 	if ((led_value >> powernv_led->led_type) & OPAL_SLOT_LED_STATE_ON)
-		return LED_FULL;
+		return 255;
 
-	return LED_OFF;
+	return 0;
 }
 
 /*
@@ -225,8 +225,8 @@ static int powernv_led_create(struct device *dev,
 
 	powernv_led->cdev.brightness_set_blocking = powernv_brightness_set;
 	powernv_led->cdev.brightness_get = powernv_brightness_get;
-	powernv_led->cdev.brightness = LED_OFF;
-	powernv_led->cdev.max_brightness = LED_FULL;
+	powernv_led->cdev.brightness = 0;
+	powernv_led->cdev.max_brightness = 255;
 
 	/* Register the classdev */
 	rc = devm_led_classdev_register(dev, &powernv_led->cdev);
diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 6832180c1c54..50e97e70051a 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -67,7 +67,7 @@ static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
 
 	led_data->active_low = led->active_low;
 	led_data->cdev.name = led->name;
-	led_data->cdev.brightness = LED_OFF;
+	led_data->cdev.brightness = 0;
 	led_data->cdev.max_brightness = led->max_brightness;
 	led_data->cdev.flags = LED_CORE_SUSPENDRESUME;
 
diff --git a/drivers/leds/leds-rb532.c b/drivers/leds/leds-rb532.c
index b6447c1721b4..350418795353 100644
--- a/drivers/leds/leds-rb532.c
+++ b/drivers/leds/leds-rb532.c
@@ -27,7 +27,7 @@ static void rb532_led_set(struct led_classdev *cdev,
 
 static enum led_brightness rb532_led_get(struct led_classdev *cdev)
 {
-	return (get_latch_u5() & LO_ULED) ? LED_FULL : LED_OFF;
+	return (get_latch_u5() & LO_ULED) ? 255 : 0;
 }
 
 static struct led_classdev rb532_uled = {
diff --git a/drivers/leds/leds-regulator.c b/drivers/leds/leds-regulator.c
index 208c98918433..c99460ac1d3c 100644
--- a/drivers/leds/leds-regulator.c
+++ b/drivers/leds/leds-regulator.c
@@ -96,7 +96,7 @@ static int regulator_led_brightness_set(struct led_classdev *led_cdev,
 
 	mutex_lock(&led->mutex);
 
-	if (value == LED_OFF) {
+	if (value == 0) {
 		regulator_led_disable(led);
 		goto out;
 	}
diff --git a/drivers/leds/leds-sc27xx-bltc.c b/drivers/leds/leds-sc27xx-bltc.c
index e199ea15e406..e7c105e45a81 100644
--- a/drivers/leds/leds-sc27xx-bltc.c
+++ b/drivers/leds/leds-sc27xx-bltc.c
@@ -114,14 +114,14 @@ static int sc27xx_led_disable(struct sc27xx_led *leds)
 			(SC27XX_LED_RUN | SC27XX_LED_TYPE) << ctrl_shift, 0);
 }
 
-static int sc27xx_led_set(struct led_classdev *ldev, enum led_brightness value)
+static int sc27xx_led_set(struct led_classdev *ldev, unsigned int value)
 {
 	struct sc27xx_led *leds = to_sc27xx_led(ldev);
 	int err;
 
 	mutex_lock(&leds->priv->lock);
 
-	if (value == LED_OFF)
+	if (value == 0)
 		err = sc27xx_led_disable(leds);
 	else
 		err = sc27xx_led_enable(leds, value);
@@ -161,7 +161,7 @@ static int sc27xx_led_pattern_clear(struct led_classdev *ldev)
 	err = regmap_update_bits(regmap, ctrl_base,
 			(SC27XX_LED_RUN | SC27XX_LED_TYPE) << ctrl_shift, 0);
 
-	ldev->brightness = LED_OFF;
+	ldev->brightness = 0;
 
 	mutex_unlock(&leds->priv->lock);
 
diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
index f1964c96fb15..e96fc874c0f4 100644
--- a/drivers/leds/leds-spi-byte.c
+++ b/drivers/leds/leds-spi-byte.c
@@ -103,7 +103,7 @@ static int spi_byte_probe(struct spi_device *spi)
 	mutex_init(&led->mutex);
 	led->cdef = device_get_match_data(dev);
 	led->ldev.name = led->name;
-	led->ldev.brightness = LED_OFF;
+	led->ldev.brightness = 0;
 	led->ldev.max_brightness = led->cdef->max_value - led->cdef->off_value;
 	led->ldev.brightness_set_blocking = spi_byte_brightness_set_blocking;
 
diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
index fcaa34706b6c..08cbe2ba5417 100644
--- a/drivers/leds/leds-ss4200.c
+++ b/drivers/leds/leds-ss4200.c
@@ -220,7 +220,7 @@ static void nasgpio_led_set_brightness(struct led_classdev *led_cdev,
 				       enum led_brightness brightness)
 {
 	u32 setting = 0;
-	if (brightness >= LED_HALF)
+	if (brightness >= 127)
 		setting = 1;
 	/*
 	 * Hold the lock across both operations.  This ensures
@@ -433,12 +433,12 @@ static void set_power_light_amber_noblink(void)
 	if (!amber || !blue)
 		return;
 	/*
-	 * LED_OFF implies disabling future blinking
+	 * 0 implies disabling future blinking
 	 */
 	pr_debug("setting blue off and amber on\n");
 
-	nasgpio_led_set_brightness(&blue->led_cdev, LED_OFF);
-	nasgpio_led_set_brightness(&amber->led_cdev, LED_FULL);
+	nasgpio_led_set_brightness(&blue->led_cdev, 0);
+	nasgpio_led_set_brightness(&amber->led_cdev, 255);
 }
 
 static ssize_t blink_show(struct device *dev,
@@ -482,9 +482,9 @@ static int register_nasgpio_led(int led_nr)
 	struct led_classdev *led = get_classdev_for_led_nr(led_nr);
 
 	led->name = nas_led->name;
-	led->brightness = LED_OFF;
+	led->brightness = 0;
 	if (nasgpio_led_get_attr(led, GP_LVL))
-		led->brightness = LED_FULL;
+		led->brightness = 255;
 	led->brightness_set = nasgpio_led_set_brightness;
 	led->blink_set = nasgpio_led_set_blink;
 	led->groups = nasgpio_led_groups;
diff --git a/drivers/leds/leds-sunfire.c b/drivers/leds/leds-sunfire.c
index eba7313719bf..f9e42661d02a 100644
--- a/drivers/leds/leds-sunfire.c
+++ b/drivers/leds/leds-sunfire.c
@@ -144,7 +144,7 @@ static int sunfire_led_generic_probe(struct platform_device *pdev,
 
 		p->leds[i].reg = (void __iomem *) pdev->resource[0].start;
 		lp->name = types[i].name;
-		lp->brightness = LED_FULL;
+		lp->brightness = 255;
 		lp->brightness_set = types[i].handler;
 		lp->default_trigger = types[i].default_trigger;
 
diff --git a/drivers/leds/leds-syscon.c b/drivers/leds/leds-syscon.c
index 7eddb8ecb44e..1533b39e22ec 100644
--- a/drivers/leds/leds-syscon.c
+++ b/drivers/leds/leds-syscon.c
@@ -40,7 +40,7 @@ static void syscon_led_set(struct led_classdev *led_cdev,
 	u32 val;
 	int ret;
 
-	if (value == LED_OFF) {
+	if (value == 0) {
 		val = 0;
 		sled->state = false;
 	} else {
diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 1473ced8664c..e40d659b6119 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -423,7 +423,7 @@ static int led_prepare(struct tca6507_led *led)
 		if (best == -1) {
 			/* Best brightness is full-on */
 			set_select(tca, led->num, TCA6507_LS_LED_ON);
-			led->led_cdev.brightness = LED_FULL;
+			led->led_cdev.brightness = 255;
 			return 0;
 		}
 
@@ -577,12 +577,12 @@ static int tca6507_blink_set(struct led_classdev *led_cdev,
 	if (led->offtime == 0)
 		led->offtime = 512;
 
-	if (led->led_cdev.brightness == LED_OFF)
-		led->led_cdev.brightness = LED_FULL;
+	if (led->led_cdev.brightness == 0)
+		led->led_cdev.brightness = 255;
 	if (led_assign(led) < 0) {
 		led->ontime = 0;
 		led->offtime = 0;
-		led->led_cdev.brightness = LED_OFF;
+		led->led_cdev.brightness = 0;
 		return -EINVAL;
 	}
 	*delay_on = led->ontime;
diff --git a/drivers/leds/leds-wm831x-status.c b/drivers/leds/leds-wm831x-status.c
index c48b80574f02..37328c0c00b1 100644
--- a/drivers/leds/leds-wm831x-status.c
+++ b/drivers/leds/leds-wm831x-status.c
@@ -52,7 +52,7 @@ static void wm831x_status_set(struct wm831x_status *led)
 		led->reg_val |= led->blink_time << WM831X_LED_DUR_SHIFT;
 		led->reg_val |= led->blink_cyc;
 	} else {
-		if (led->brightness != LED_OFF)
+		if (led->brightness != 0)
 			led->reg_val |= 1 << WM831X_LED_MODE_SHIFT;
 	}
 
@@ -71,7 +71,7 @@ static int wm831x_status_brightness_set(struct led_classdev *led_cdev,
 
 	spin_lock_irqsave(&led->value_lock, flags);
 	led->brightness = value;
-	if (value == LED_OFF)
+	if (value == 0)
 		led->blink = 0;
 	spin_unlock_irqrestore(&led->value_lock, flags);
 	wm831x_status_set(led);
@@ -248,9 +248,9 @@ static int wm831x_status_probe(struct platform_device *pdev)
 	drvdata->reg_val = wm831x_reg_read(wm831x, drvdata->reg);
 
 	if (drvdata->reg_val & WM831X_LED_MODE_MASK)
-		drvdata->brightness = LED_FULL;
+		drvdata->brightness = 255;
 	else
-		drvdata->brightness = LED_OFF;
+		drvdata->brightness = 0;
 
 	/* Set a default source if configured, otherwise leave the
 	 * current hardware setting.
diff --git a/drivers/leds/leds-wm8350.c b/drivers/leds/leds-wm8350.c
index 8f243c413723..512bbc266258 100644
--- a/drivers/leds/leds-wm8350.c
+++ b/drivers/leds/leds-wm8350.c
@@ -150,7 +150,7 @@ static int wm8350_led_set(struct led_classdev *led_cdev,
 
 	spin_lock_irqsave(&led->value_lock, flags);
 
-	if (led->value == LED_OFF) {
+	if (led->value == 0) {
 		spin_unlock_irqrestore(&led->value_lock, flags);
 		return wm8350_led_disable(led);
 	}
@@ -160,7 +160,7 @@ static int wm8350_led_set(struct led_classdev *led_cdev,
 	 * brightness due to the non-linear current settings provided
 	 * by the hardware.
 	 */
-	uA = (led->max_uA_index * led->value) / LED_FULL;
+	uA = (led->max_uA_index * led->value) / 255;
 	spin_unlock_irqrestore(&led->value_lock, flags);
 	BUG_ON(uA >= ARRAY_SIZE(isink_cur));
 
@@ -179,7 +179,7 @@ static void wm8350_led_shutdown(struct platform_device *pdev)
 {
 	struct wm8350_led *led = platform_get_drvdata(pdev);
 
-	led->value = LED_OFF;
+	led->value = 0;
 	wm8350_led_disable(led);
 }
 
@@ -236,7 +236,7 @@ static int wm8350_led_probe(struct platform_device *pdev)
 			 pdata->max_uA);
 
 	spin_lock_init(&led->value_lock);
-	led->value = LED_OFF;
+	led->value = 0;
 	platform_set_drvdata(pdev, led);
 
 	return led_classdev_register(&pdev->dev, &led->cdev);
diff --git a/drivers/leds/simple/simatic-ipc-leds.c b/drivers/leds/simple/simatic-ipc-leds.c
index ff2c96e73241..be5d7e1e4145 100644
--- a/drivers/leds/simple/simatic-ipc-leds.c
+++ b/drivers/leds/simple/simatic-ipc-leds.c
@@ -73,7 +73,7 @@ static void simatic_ipc_led_set_io(struct led_classdev *led_cd,
 	spin_lock_irqsave(&reg_lock, flags);
 
 	val = inw(SIMATIC_IPC_LED_PORT_BASE);
-	if (brightness == LED_OFF)
+	if (brightness == 0)
 		outw(val | led->value, SIMATIC_IPC_LED_PORT_BASE);
 	else
 		outw(val & ~led->value, SIMATIC_IPC_LED_PORT_BASE);
@@ -85,7 +85,7 @@ static enum led_brightness simatic_ipc_led_get_io(struct led_classdev *led_cd)
 {
 	struct simatic_ipc_led *led = cdev_to_led(led_cd);
 
-	return inw(SIMATIC_IPC_LED_PORT_BASE) & led->value ? LED_OFF : led_cd->max_brightness;
+	return inw(SIMATIC_IPC_LED_PORT_BASE) & led->value ? 0 : led_cd->max_brightness;
 }
 
 static void simatic_ipc_led_set_mem(struct led_classdev *led_cd,
@@ -96,7 +96,7 @@ static void simatic_ipc_led_set_mem(struct led_classdev *led_cd,
 	u32 *p;
 
 	p = simatic_ipc_led_memory + led->value;
-	*p = (*p & ~1) | (brightness == LED_OFF);
+	*p = (*p & ~1) | (brightness == 0);
 }
 
 static enum led_brightness simatic_ipc_led_get_mem(struct led_classdev *led_cd)
@@ -106,7 +106,7 @@ static enum led_brightness simatic_ipc_led_get_mem(struct led_classdev *led_cd)
 	u32 *p;
 
 	p = simatic_ipc_led_memory + led->value;
-	return (*p & 1) ? LED_OFF : led_cd->max_brightness;
+	return (*p & 1) ? 0 : led_cd->max_brightness;
 }
 
 static int simatic_ipc_leds_probe(struct platform_device *pdev)
@@ -176,7 +176,7 @@ static int simatic_ipc_leds_probe(struct platform_device *pdev)
 			cdev->brightness_set = simatic_ipc_led_set_io;
 			cdev->brightness_get = simatic_ipc_led_get_io;
 		}
-		cdev->max_brightness = LED_ON;
+		cdev->max_brightness = 1;
 		cdev->name = ipcled->name;
 
 		err = devm_led_classdev_register(dev, cdev);
diff --git a/drivers/leds/trigger/ledtrig-activity.c b/drivers/leds/trigger/ledtrig-activity.c
index 30bc9df03636..d0d8cc8db8c6 100644
--- a/drivers/leds/trigger/ledtrig-activity.c
+++ b/drivers/leds/trigger/ledtrig-activity.c
@@ -129,7 +129,7 @@ static void led_activity_function(struct timer_list *t)
 		activity_data->state = !activity_data->state;
 		led_set_brightness_nosleep(led_cdev,
 			(activity_data->state ^ activity_data->invert) ?
-			led_cdev->blink_brightness : LED_OFF);
+			led_cdev->blink_brightness : 0);
 	}
 
 	target = (cpus > 1) ? (100 / cpus) : 50;
diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
index 487577d22cfc..ec965e192365 100644
--- a/drivers/leds/trigger/ledtrig-backlight.c
+++ b/drivers/leds/trigger/ledtrig-backlight.c
@@ -47,7 +47,7 @@ static int fb_notifier_callback(struct notifier_block *p,
 
 	if ((n->old_status == UNBLANK) ^ n->invert) {
 		n->brightness = led->brightness;
-		led_set_brightness_nosleep(led, LED_OFF);
+		led_set_brightness_nosleep(led, 0);
 	} else {
 		led_set_brightness_nosleep(led, n->brightness);
 	}
@@ -84,7 +84,7 @@ static ssize_t bl_trig_invert_store(struct device *dev,
 
 	/* After inverting, we need to update the LED. */
 	if ((n->old_status == BLANK) ^ n->invert)
-		led_set_brightness_nosleep(led, LED_OFF);
+		led_set_brightness_nosleep(led, 0);
 	else
 		led_set_brightness_nosleep(led, n->brightness);
 
diff --git a/drivers/leds/trigger/ledtrig-camera.c b/drivers/leds/trigger/ledtrig-camera.c
index ab1c410872ff..1c9707c60a19 100644
--- a/drivers/leds/trigger/ledtrig-camera.c
+++ b/drivers/leds/trigger/ledtrig-camera.c
@@ -19,7 +19,7 @@ DEFINE_LED_TRIGGER(ledtrig_torch);
 
 void ledtrig_flash_ctrl(bool on)
 {
-	enum led_brightness brt = on ? LED_FULL : LED_OFF;
+	unsigned int brt = on ? 255 : 0;
 
 	led_trigger_event(ledtrig_flash, brt);
 }
@@ -27,7 +27,7 @@ EXPORT_SYMBOL_GPL(ledtrig_flash_ctrl);
 
 void ledtrig_torch_ctrl(bool on)
 {
-	enum led_brightness brt = on ? LED_FULL : LED_OFF;
+	unsigned int brt = on ? 255 : 0;
 
 	led_trigger_event(ledtrig_torch, brt);
 }
diff --git a/drivers/leds/trigger/ledtrig-cpu.c b/drivers/leds/trigger/ledtrig-cpu.c
index 8af4f9bb9cde..a7d358412f8a 100644
--- a/drivers/leds/trigger/ledtrig-cpu.c
+++ b/drivers/leds/trigger/ledtrig-cpu.c
@@ -84,11 +84,11 @@ void ledtrig_cpu(enum cpu_led_event ledevt)
 		total_cpus = num_present_cpus();
 
 		led_trigger_event(trig->_trig,
-			is_active ? LED_FULL : LED_OFF);
+			is_active ? 255 : 0);
 
 
 		led_trigger_event(trig_cpu_all,
-			DIV_ROUND_UP(LED_FULL * active_cpus, total_cpus));
+			DIV_ROUND_UP(255 * active_cpus, total_cpus));
 
 	}
 }
diff --git a/drivers/leds/trigger/ledtrig-gpio.c b/drivers/leds/trigger/ledtrig-gpio.c
index 0120faa3dafa..d794e44f2eff 100644
--- a/drivers/leds/trigger/ledtrig-gpio.c
+++ b/drivers/leds/trigger/ledtrig-gpio.c
@@ -37,9 +37,9 @@ static irqreturn_t gpio_trig_irq(int irq, void *_led)
 			led_set_brightness_nosleep(gpio_data->led,
 					   gpio_data->desired_brightness);
 		else
-			led_set_brightness_nosleep(gpio_data->led, LED_FULL);
+			led_set_brightness_nosleep(gpio_data->led, 255);
 	} else {
-		led_set_brightness_nosleep(gpio_data->led, LED_OFF);
+		led_set_brightness_nosleep(gpio_data->led, 0);
 	}
 
 	return IRQ_HANDLED;
diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c b/drivers/leds/trigger/ledtrig-heartbeat.c
index 7fe0a05574d2..0b5ec7dc14fa 100644
--- a/drivers/leds/trigger/ledtrig-heartbeat.c
+++ b/drivers/leds/trigger/ledtrig-heartbeat.c
@@ -35,13 +35,13 @@ static void led_heartbeat_function(struct timer_list *t)
 	struct heartbeat_trig_data *heartbeat_data =
 		from_timer(heartbeat_data, t, timer);
 	struct led_classdev *led_cdev;
-	unsigned long brightness = LED_OFF;
+	unsigned long brightness = 0;
 	unsigned long delay = 0;
 
 	led_cdev = heartbeat_data->led_cdev;
 
 	if (unlikely(panic_heartbeats)) {
-		led_set_brightness_nosleep(led_cdev, LED_OFF);
+		led_set_brightness_nosleep(led_cdev, 0);
 		return;
 	}
 
diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index d5e774d83021..e3174d09111c 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -74,13 +74,13 @@ static void set_baseline_state(struct led_netdev_data *trigger_data)
 		led_cdev->blink_brightness = led_cdev->max_brightness;
 
 	if (!test_bit(NETDEV_LED_MODE_LINKUP, &trigger_data->mode))
-		led_set_brightness(led_cdev, LED_OFF);
+		led_set_brightness(led_cdev, 0);
 	else {
 		if (test_bit(NETDEV_LED_LINK, &trigger_data->mode))
 			led_set_brightness(led_cdev,
 					   led_cdev->blink_brightness);
 		else
-			led_set_brightness(led_cdev, LED_OFF);
+			led_set_brightness(led_cdev, 0);
 
 		/* If we are looking for RX/TX start periodically
 		 * checking stats
@@ -355,7 +355,7 @@ static void netdev_trig_work(struct work_struct *work)
 
 	/* If we dont have a device, insure we are off */
 	if (!trigger_data->net_dev) {
-		led_set_brightness(trigger_data->led_cdev, LED_OFF);
+		led_set_brightness(trigger_data->led_cdev, 0);
 		return;
 	}
 
diff --git a/drivers/leds/trigger/ledtrig-oneshot.c b/drivers/leds/trigger/ledtrig-oneshot.c
index bee3bd452abf..bc5ff2d2fd6c 100644
--- a/drivers/leds/trigger/ledtrig-oneshot.c
+++ b/drivers/leds/trigger/ledtrig-oneshot.c
@@ -58,9 +58,9 @@ static ssize_t led_invert_store(struct device *dev,
 	oneshot_data->invert = !!state;
 
 	if (oneshot_data->invert)
-		led_set_brightness_nosleep(led_cdev, LED_FULL);
+		led_set_brightness_nosleep(led_cdev, 255);
 	else
-		led_set_brightness_nosleep(led_cdev, LED_OFF);
+		led_set_brightness_nosleep(led_cdev, 0);
 
 	return size;
 }
@@ -184,7 +184,7 @@ static void oneshot_trig_deactivate(struct led_classdev *led_cdev)
 	kfree(oneshot_data);
 
 	/* Stop blinking */
-	led_set_brightness(led_cdev, LED_OFF);
+	led_set_brightness(led_cdev, 0);
 }
 
 static struct led_trigger oneshot_led_trigger = {
diff --git a/drivers/leds/trigger/ledtrig-panic.c b/drivers/leds/trigger/ledtrig-panic.c
index 64abf2e91608..2576632d2264 100644
--- a/drivers/leds/trigger/ledtrig-panic.c
+++ b/drivers/leds/trigger/ledtrig-panic.c
@@ -58,7 +58,7 @@ static struct notifier_block led_trigger_panic_nb = {
 
 static long led_panic_blink(int state)
 {
-	led_trigger_event(trigger, state ? LED_FULL : LED_OFF);
+	led_trigger_event(trigger, state ? 255 : 0);
 	return 0;
 }
 
diff --git a/drivers/leds/trigger/ledtrig-pattern.c b/drivers/leds/trigger/ledtrig-pattern.c
index 43a265dc4696..d49e45395aca 100644
--- a/drivers/leds/trigger/ledtrig-pattern.c
+++ b/drivers/leds/trigger/ledtrig-pattern.c
@@ -432,7 +432,7 @@ static void pattern_trig_deactivate(struct led_classdev *led_cdev)
 
 	del_timer_sync(&data->timer);
 
-	led_set_brightness(led_cdev, LED_OFF);
+	led_set_brightness(led_cdev, 0);
 	kfree(data);
 	led_cdev->activated = false;
 }
diff --git a/drivers/leds/trigger/ledtrig-timer.c b/drivers/leds/trigger/ledtrig-timer.c
index b4688d1d9d2b..cb2b4dcd4a2c 100644
--- a/drivers/leds/trigger/ledtrig-timer.c
+++ b/drivers/leds/trigger/ledtrig-timer.c
@@ -124,7 +124,7 @@ static int timer_trig_activate(struct led_classdev *led_cdev)
 static void timer_trig_deactivate(struct led_classdev *led_cdev)
 {
 	/* Stop blinking */
-	led_set_brightness(led_cdev, LED_OFF);
+	led_set_brightness(led_cdev, 0);
 }
 
 static struct led_trigger timer_led_trigger = {
diff --git a/drivers/leds/trigger/ledtrig-transient.c b/drivers/leds/trigger/ledtrig-transient.c
index 80635183fac8..b35ba2527346 100644
--- a/drivers/leds/trigger/ledtrig-transient.c
+++ b/drivers/leds/trigger/ledtrig-transient.c
@@ -79,7 +79,7 @@ static ssize_t transient_activate_store(struct device *dev,
 		transient_data->activate = state;
 		led_set_brightness_nosleep(led_cdev, transient_data->state);
 		transient_data->restore_state =
-		    (transient_data->state == LED_FULL) ? LED_OFF : LED_FULL;
+		    (transient_data->state == 255) ? 0 : 255;
 		mod_timer(&transient_data->timer,
 			  jiffies + msecs_to_jiffies(transient_data->duration));
 	}
@@ -123,7 +123,7 @@ static ssize_t transient_state_show(struct device *dev,
 		led_trigger_get_drvdata(dev);
 	int state;
 
-	state = (transient_data->state == LED_FULL) ? 1 : 0;
+	state = (transient_data->state == 255) ? 1 : 0;
 	return sprintf(buf, "%d\n", state);
 }
 
@@ -142,7 +142,7 @@ static ssize_t transient_state_store(struct device *dev,
 	if (state != 1 && state != 0)
 		return -EINVAL;
 
-	transient_data->state = (state == 1) ? LED_FULL : LED_OFF;
+	transient_data->state = (state == 1) ? 255 : 0;
 	return size;
 }
 
diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledtrig-tty.c
index f62db7e520b5..378ccb7b12df 100644
--- a/drivers/leds/trigger/ledtrig-tty.c
+++ b/drivers/leds/trigger/ledtrig-tty.c
@@ -122,12 +122,12 @@ static void ledtrig_tty_work(struct work_struct *work)
 
 	if (icount.rx != trigger_data->rx ||
 	    icount.tx != trigger_data->tx) {
-		led_set_brightness_sync(trigger_data->led_cdev, LED_ON);
+		led_set_brightness_sync(trigger_data->led_cdev, 1);
 
 		trigger_data->rx = icount.rx;
 		trigger_data->tx = icount.tx;
 	} else {
-		led_set_brightness_sync(trigger_data->led_cdev, LED_OFF);
+		led_set_brightness_sync(trigger_data->led_cdev, 0);
 	}
 
 out:
-- 
2.34.1

