Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FAC4944A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 01:28:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfNfY6c89z3bVL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 11:28:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=etjOl2MH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=etjOl2MH; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfNdq6tHrz2yHL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 11:28:13 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id p27so15136878lfa.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jan 2022 16:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tVzKwuqBVpquvDZTm7oLOf52IZ804sPtU0S2L3eALEE=;
 b=etjOl2MHCbdqC1BAWyaDanrMnlTeQXnGfj7yYuPH+tiOukIF60NAHBdQB6OM5Sd+Of
 2bNwRmjUhCKrNCO0Iq9Coi30RruRLWbNMKVFBjjHTY8fkJO0nCX8eUhZlOmgkZsgm6aN
 YPRYKjbxkgFeX7VZqgDQM5oGs/TbFRt7OntXv6y6f5xdCSYumuYYD1j7VIPY0EKvZOoo
 Ylkllt2+EibTXx7vDnZJgmC+To46+S5yiGD9ItauHFtGdyBTe6cTMjdA9evhRiqQ7B4A
 Owooph2ALPgK5N13UuOW2v/3Uv8tv1go7NA99IEE1+C5fDIbRur2q90GFrUvt1FOQt2J
 /SCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tVzKwuqBVpquvDZTm7oLOf52IZ804sPtU0S2L3eALEE=;
 b=KNAjQeNMrepPeyzj90FvstKz9V8C6DZQYmGlsJq+8WxGLtEfjZC/9pJ+XdUmAFJi4q
 +SrSHI7Ww/i/34MdWBYMvdI0Lmd46cWdBuXD26YvRmCTq8uGC8SL43PwHotBXysfXVrv
 +4D0TZncvx8OBnfd3TzeGji6ZLPWk1KVF7qv3s1BG38i0HvXmYabDgX3LPtkf99KGtGw
 7pGaCJ/eZWcdEsdOjak9zkMz51wHAOfYP8iv4pv99tTO4wipZVxjIXyNO7dy4DoFDw1V
 mh6zi6YjnF8oux8kNopF7/T4tRQd7svy2HZwcMBr8wRONah8K8VojgtjK3q6Ek7///AE
 wxUA==
X-Gm-Message-State: AOAM533F9zGKbcsXWrUQ9REudzn8EsHGdbpQF9kfS1hMrEmNoYnOu7MA
 iv+8lpmjjso6Nry/cW2vZ/FU3Q==
X-Google-Smtp-Source: ABdhPJx9UWUrsd1T4YFK31jeFGRUF2l+IoRJ6FCxNfgn3/oDB4KbJFS76YqvnC7ro7kux/8Sk8ruew==
X-Received: by 2002:a05:6512:3d9e:: with SMTP id
 k30mr29336643lfv.342.1642638485852; 
 Wed, 19 Jan 2022 16:28:05 -0800 (PST)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id t17sm109656lja.132.2022.01.19.16.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 16:28:04 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Subject: [PATCH v2] spi: mpc512x-psc: Convert to use GPIO descriptors
Date: Thu, 20 Jan 2022 01:26:00 +0100
Message-Id: <20220120002600.216667-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This driver is already relying on the core to provide
valid GPIO numbers in spi->cs_gpio through
of_spi_get_gpio_numbers(), so we can switch to letting
the core use GPIO descriptors instead.

The driver was assigning a local function to the custom
chipselect callback, but I chose to just open code the
gpiod setting instead, this is easier to read.

The only platform that overrides the cs_control callback
is the mpc832x_rdb.

Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Stop trying to use the core per-transfer CS handling,
  keep the old code intact around this and just deal with
  the GPIO descriptors.

I can't really compile any PPC code, I just hope I coded
this right...
---
 drivers/spi/spi-mpc512x-psc.c | 46 ++++++++++++++---------------------
 1 file changed, 18 insertions(+), 28 deletions(-)

diff --git a/drivers/spi/spi-mpc512x-psc.c b/drivers/spi/spi-mpc512x-psc.c
index 78a9bca8cc68..8a488d8e4c1b 100644
--- a/drivers/spi/spi-mpc512x-psc.c
+++ b/drivers/spi/spi-mpc512x-psc.c
@@ -23,7 +23,6 @@
 #include <linux/clk.h>
 #include <linux/spi/spi.h>
 #include <linux/fsl_devices.h>
-#include <linux/gpio.h>
 #include <asm/mpc52xx_psc.h>
 
 enum {
@@ -128,17 +127,28 @@ static void mpc512x_psc_spi_activate_cs(struct spi_device *spi)
 	out_be32(psc_addr(mps, ccr), ccr);
 	mps->bits_per_word = cs->bits_per_word;
 
-	if (mps->cs_control && gpio_is_valid(spi->cs_gpio))
-		mps->cs_control(spi, (spi->mode & SPI_CS_HIGH) ? 1 : 0);
+	if (cs->gpiod) {
+		if (mps->cs_control)
+			/* boardfile override */
+			mps->cs_control(spi, (spi->mode & SPI_CS_HIGH) ? 1 : 0);
+		else
+			/* gpiolib will deal with the inversion */
+			gpiod_set_value(spi->cs_gpiod, 1);
+	}
 }
 
 static void mpc512x_psc_spi_deactivate_cs(struct spi_device *spi)
 {
 	struct mpc512x_psc_spi *mps = spi_master_get_devdata(spi->master);
 
-	if (mps->cs_control && gpio_is_valid(spi->cs_gpio))
-		mps->cs_control(spi, (spi->mode & SPI_CS_HIGH) ? 0 : 1);
-
+	if (spi->cs_gpiod) {
+		if (mps->cs_control)
+			/* boardfile override */
+			mps->cs_control(spi, (spi->mode & SPI_CS_HIGH) ? 0 : 1);
+		else
+			/* gpiolib will deal with the inversion */
+			gpiod_set_value(spi->cs_gpiod, 0);
+	}
 }
 
 /* extract and scale size field in txsz or rxsz */
@@ -373,18 +383,6 @@ static int mpc512x_psc_spi_setup(struct spi_device *spi)
 		if (!cs)
 			return -ENOMEM;
 
-		if (gpio_is_valid(spi->cs_gpio)) {
-			ret = gpio_request(spi->cs_gpio, dev_name(&spi->dev));
-			if (ret) {
-				dev_err(&spi->dev, "can't get CS gpio: %d\n",
-					ret);
-				kfree(cs);
-				return ret;
-			}
-			gpio_direction_output(spi->cs_gpio,
-					spi->mode & SPI_CS_HIGH ? 0 : 1);
-		}
-
 		spi->controller_state = cs;
 	}
 
@@ -396,8 +394,6 @@ static int mpc512x_psc_spi_setup(struct spi_device *spi)
 
 static void mpc512x_psc_spi_cleanup(struct spi_device *spi)
 {
-	if (gpio_is_valid(spi->cs_gpio))
-		gpio_free(spi->cs_gpio);
 	kfree(spi->controller_state);
 }
 
@@ -476,11 +472,6 @@ static irqreturn_t mpc512x_psc_spi_isr(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-static void mpc512x_spi_cs_control(struct spi_device *spi, bool onoff)
-{
-	gpio_set_value(spi->cs_gpio, onoff);
-}
-
 static int mpc512x_psc_spi_do_probe(struct device *dev, u32 regaddr,
 					      u32 size, unsigned int irq)
 {
@@ -500,9 +491,7 @@ static int mpc512x_psc_spi_do_probe(struct device *dev, u32 regaddr,
 	mps->type = (int)of_device_get_match_data(dev);
 	mps->irq = irq;
 
-	if (pdata == NULL) {
-		mps->cs_control = mpc512x_spi_cs_control;
-	} else {
+	if (pdata) {
 		mps->cs_control = pdata->cs_control;
 		master->bus_num = pdata->bus_num;
 		master->num_chipselect = pdata->max_chipselect;
@@ -513,6 +502,7 @@ static int mpc512x_psc_spi_do_probe(struct device *dev, u32 regaddr,
 	master->prepare_transfer_hardware = mpc512x_psc_spi_prep_xfer_hw;
 	master->transfer_one_message = mpc512x_psc_spi_msg_xfer;
 	master->unprepare_transfer_hardware = mpc512x_psc_spi_unprep_xfer_hw;
+	master->use_gpio_descriptors = true;
 	master->cleanup = mpc512x_psc_spi_cleanup;
 	master->dev.of_node = dev->of_node;
 
-- 
2.34.1

