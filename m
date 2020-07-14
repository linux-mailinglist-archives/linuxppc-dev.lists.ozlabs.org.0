Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0050921E9FF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 09:26:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5XB92FGxzDqdM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 17:26:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wuCbpWXb; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5X8M4gptzDqDf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 17:24:33 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id e4so21230866ljn.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 00:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DsTnC/VUlVqwF1XtVp1muf5zivM1vKkZuI2tYPJ/2Hk=;
 b=wuCbpWXbCBM7aYUe3O4hind5+zvO8tvQn/ci/3oYyK7wJnTnyJLAocF9K7cT2XFX07
 XInRtQkDJcuDPI7DkvQiT0W3NB+Y+g2TPrp349Knkn7iPTrLS3ubRafMckXjv+ZYpufJ
 EHrP7L+n9g/FJFVKu3wXELAP4lJxWCX52XnAWJWf6osH+X593ifp5vioGIFZ001nhYFk
 vXXb8Cx619HvqCsfpm0XkPLo8yZKMpZyDlRL8P0E3Gs3+qIyC4GaIafb6HDaABOanBHZ
 d1CD8OEXQE5/xT7RKzIPi6zW9XoUAHvS2eGscYo5lvrDNfT7LZBVWdMNHsA/kbbxH+Iu
 6+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DsTnC/VUlVqwF1XtVp1muf5zivM1vKkZuI2tYPJ/2Hk=;
 b=YQwJCMOxg60hxwYdBWbrlGyf1gXpGeq+M/W5fIPIu1vciFXcfJjJJbsll9kK9xY5vo
 PXb2l5qiGFdwk/2PnMiYwJnFIUf4i0cqDCUkXYVnZSqqRiYG5raXQ2U+08us2GvDdoM6
 oBS08jKuZfR9tt3jSUmxVPcmEE5pn7n+B8wUg4l0jpsybECVny5HLjZEoee4blalxg3O
 LIBa8lwqiQoyBooCYdenUY4bPxzkyl9s/Ubbc1LjNkhU8yruaE1/apRvrn8W42eUALj9
 2ajlvUxkT+oPL8gfyBlK9t6q0kOo0S0zdPuhM+dY52vyJPM2n3V0c6dLJHd1KT1WEhDc
 2MMg==
X-Gm-Message-State: AOAM532pNnlXeRD0nEs5THPkcWhfFMaOaTJHMVzEGMIO+k+pNo4QxTaR
 EpK2e8eAJqArRqrtmxvwcRuzKA==
X-Google-Smtp-Source: ABdhPJxl+J9ZWdJ5YcjO/3NrofqTdxgZZkAtDUhah6A/8GIOYex0dLpP5FcgIeZVp9A4OiD/iTJriQ==
X-Received: by 2002:a2e:b054:: with SMTP id d20mr1534958ljl.55.1594711468890; 
 Tue, 14 Jul 2020 00:24:28 -0700 (PDT)
Received: from localhost.localdomain
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id v5sm4474655lji.75.2020.07.14.00.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 00:24:28 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Subject: [PATCH] spi: ppc4xx: Convert to use GPIO descriptors
Date: Tue, 14 Jul 2020 09:22:26 +0200
Message-Id: <20200714072226.26071-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Linus Walleij <linus.walleij@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This converts the PPC4xx SPI driver to use GPIO descriptors.

The driver is already just picking some GPIOs from the device
tree so the conversion is pretty straight forward. However
this driver is looking form a pure "gpios" property rather
than the standard binding "cs-gpios" so we need to add a new
exception to the gpiolib OF parser to allow this for this
driver's compatibles.

Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib-of.c |  10 ++--
 drivers/spi/spi-ppc4xx.c  | 106 ++++----------------------------------
 2 files changed, 17 insertions(+), 99 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 219eb0054233..e3e88510aec7 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -26,7 +26,7 @@
 /**
  * of_gpio_spi_cs_get_count() - special GPIO counting for SPI
  * Some elder GPIO controllers need special quirks. Currently we handle
- * the Freescale GPIO controller with bindings that doesn't use the
+ * the Freescale and PPC GPIO controller with bindings that doesn't use the
  * established "cs-gpios" for chip selects but instead rely on
  * "gpios" for the chip select lines. If we detect this, we redirect
  * the counting of "cs-gpios" to count "gpios" transparent to the
@@ -41,7 +41,8 @@ static int of_gpio_spi_cs_get_count(struct device *dev, const char *con_id)
 	if (!con_id || strcmp(con_id, "cs"))
 		return 0;
 	if (!of_device_is_compatible(np, "fsl,spi") &&
-	    !of_device_is_compatible(np, "aeroflexgaisler,spictrl"))
+	    !of_device_is_compatible(np, "aeroflexgaisler,spictrl") &&
+	    !of_device_is_compatible(np, "ibm,ppc4xx-spi"))
 		return 0;
 	return of_gpio_named_count(np, "gpios");
 }
@@ -405,9 +406,10 @@ static struct gpio_desc *of_find_spi_cs_gpio(struct device *dev,
 	if (!IS_ENABLED(CONFIG_SPI_MASTER))
 		return ERR_PTR(-ENOENT);
 
-	/* Allow this specifically for Freescale devices */
+	/* Allow this specifically for Freescale and PPC devices */
 	if (!of_device_is_compatible(np, "fsl,spi") &&
-	    !of_device_is_compatible(np, "aeroflexgaisler,spictrl"))
+	    !of_device_is_compatible(np, "aeroflexgaisler,spictrl") &&
+	    !of_device_is_compatible(np, "ibm,ppc4xx-spi"))
 		return ERR_PTR(-ENOENT);
 	/* Allow only if asking for "cs-gpios" */
 	if (!con_id || strcmp(con_id, "cs"))
diff --git a/drivers/spi/spi-ppc4xx.c b/drivers/spi/spi-ppc4xx.c
index 0ea2d9a369d9..d8ee363fb714 100644
--- a/drivers/spi/spi-ppc4xx.c
+++ b/drivers/spi/spi-ppc4xx.c
@@ -28,11 +28,9 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
-#include <linux/of_gpio.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
 
-#include <linux/gpio.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi_bitbang.h>
 
@@ -127,8 +125,6 @@ struct ppc4xx_spi {
 	const unsigned char *tx;
 	unsigned char *rx;
 
-	int *gpios;
-
 	struct spi_ppc4xx_regs __iomem *regs; /* pointer to the registers */
 	struct spi_master *master;
 	struct device *dev;
@@ -260,27 +256,6 @@ static int spi_ppc4xx_setup(struct spi_device *spi)
 	return 0;
 }
 
-static void spi_ppc4xx_chipsel(struct spi_device *spi, int value)
-{
-	struct ppc4xx_spi *hw = spi_master_get_devdata(spi->master);
-	unsigned int cs = spi->chip_select;
-	unsigned int cspol;
-
-	/*
-	 * If there are no chip selects at all, or if this is the special
-	 * case of a non-existent (dummy) chip select, do nothing.
-	 */
-
-	if (!hw->master->num_chipselect || hw->gpios[cs] == -EEXIST)
-		return;
-
-	cspol = spi->mode & SPI_CS_HIGH ? 1 : 0;
-	if (value == BITBANG_CS_INACTIVE)
-		cspol = !cspol;
-
-	gpio_set_value(hw->gpios[cs], cspol);
-}
-
 static irqreturn_t spi_ppc4xx_int(int irq, void *dev_id)
 {
 	struct ppc4xx_spi *hw;
@@ -359,19 +334,6 @@ static void spi_ppc4xx_enable(struct ppc4xx_spi *hw)
 	dcri_clrset(SDR0, SDR0_PFC1, 0x80000000 >> 14, 0);
 }
 
-static void free_gpios(struct ppc4xx_spi *hw)
-{
-	if (hw->master->num_chipselect) {
-		int i;
-		for (i = 0; i < hw->master->num_chipselect; i++)
-			if (gpio_is_valid(hw->gpios[i]))
-				gpio_free(hw->gpios[i]);
-
-		kfree(hw->gpios);
-		hw->gpios = NULL;
-	}
-}
-
 /*
  * platform_device layer stuff...
  */
@@ -385,7 +347,6 @@ static int spi_ppc4xx_of_probe(struct platform_device *op)
 	struct device *dev = &op->dev;
 	struct device_node *opbnp;
 	int ret;
-	int num_gpios;
 	const unsigned int *clk;
 
 	master = spi_alloc_master(dev, sizeof *hw);
@@ -399,74 +360,32 @@ static int spi_ppc4xx_of_probe(struct platform_device *op)
 
 	init_completion(&hw->done);
 
-	/*
-	 * A count of zero implies a single SPI device without any chip-select.
-	 * Note that of_gpio_count counts all gpios assigned to this spi master.
-	 * This includes both "null" gpio's and real ones.
-	 */
-	num_gpios = of_gpio_count(np);
-	if (num_gpios > 0) {
-		int i;
-
-		hw->gpios = kcalloc(num_gpios, sizeof(*hw->gpios), GFP_KERNEL);
-		if (!hw->gpios) {
-			ret = -ENOMEM;
-			goto free_master;
-		}
-
-		for (i = 0; i < num_gpios; i++) {
-			int gpio;
-			enum of_gpio_flags flags;
-
-			gpio = of_get_gpio_flags(np, i, &flags);
-			hw->gpios[i] = gpio;
-
-			if (gpio_is_valid(gpio)) {
-				/* Real CS - set the initial state. */
-				ret = gpio_request(gpio, np->name);
-				if (ret < 0) {
-					dev_err(dev,
-						"can't request gpio #%d: %d\n",
-						i, ret);
-					goto free_gpios;
-				}
-
-				gpio_direction_output(gpio,
-						!!(flags & OF_GPIO_ACTIVE_LOW));
-			} else if (gpio == -EEXIST) {
-				; /* No CS, but that's OK. */
-			} else {
-				dev_err(dev, "invalid gpio #%d: %d\n", i, gpio);
-				ret = -EINVAL;
-				goto free_gpios;
-			}
-		}
-	}
-
 	/* Setup the state for the bitbang driver */
 	bbp = &hw->bitbang;
 	bbp->master = hw->master;
 	bbp->setup_transfer = spi_ppc4xx_setupxfer;
-	bbp->chipselect = spi_ppc4xx_chipsel;
 	bbp->txrx_bufs = spi_ppc4xx_txrx;
 	bbp->use_dma = 0;
 	bbp->master->setup = spi_ppc4xx_setup;
 	bbp->master->cleanup = spi_ppc4xx_cleanup;
 	bbp->master->bits_per_word_mask = SPI_BPW_MASK(8);
+	bbp->master->use_gpio_descriptors = true;
+	/*
+	 * The SPI core will count the number of GPIO descriptors to figure
+	 * out the number of chip selects available on the platform.
+	 */
+	bbp->master->num_chipselect = 0;
 
 	/* the spi->mode bits understood by this driver: */
 	bbp->master->mode_bits =
 		SPI_CPHA | SPI_CPOL | SPI_CS_HIGH | SPI_LSB_FIRST;
 
-	/* this many pins in all GPIO controllers */
-	bbp->master->num_chipselect = num_gpios > 0 ? num_gpios : 0;
-
 	/* Get the clock for the OPB */
 	opbnp = of_find_compatible_node(NULL, NULL, "ibm,opb");
 	if (opbnp == NULL) {
 		dev_err(dev, "OPB: cannot find node\n");
 		ret = -ENODEV;
-		goto free_gpios;
+		goto free_master;
 	}
 	/* Get the clock (Hz) for the OPB */
 	clk = of_get_property(opbnp, "clock-frequency", NULL);
@@ -474,7 +393,7 @@ static int spi_ppc4xx_of_probe(struct platform_device *op)
 		dev_err(dev, "OPB: no clock-frequency property set\n");
 		of_node_put(opbnp);
 		ret = -ENODEV;
-		goto free_gpios;
+		goto free_master;
 	}
 	hw->opb_freq = *clk;
 	hw->opb_freq >>= 2;
@@ -483,7 +402,7 @@ static int spi_ppc4xx_of_probe(struct platform_device *op)
 	ret = of_address_to_resource(np, 0, &resource);
 	if (ret) {
 		dev_err(dev, "error while parsing device node resource\n");
-		goto free_gpios;
+		goto free_master;
 	}
 	hw->mapbase = resource.start;
 	hw->mapsize = resource_size(&resource);
@@ -492,7 +411,7 @@ static int spi_ppc4xx_of_probe(struct platform_device *op)
 	if (hw->mapsize < sizeof(struct spi_ppc4xx_regs)) {
 		dev_err(dev, "too small to map registers\n");
 		ret = -EINVAL;
-		goto free_gpios;
+		goto free_master;
 	}
 
 	/* Request IRQ */
@@ -501,7 +420,7 @@ static int spi_ppc4xx_of_probe(struct platform_device *op)
 			  0, "spi_ppc4xx_of", (void *)hw);
 	if (ret) {
 		dev_err(dev, "unable to allocate interrupt\n");
-		goto free_gpios;
+		goto free_master;
 	}
 
 	if (!request_mem_region(hw->mapbase, hw->mapsize, DRIVER_NAME)) {
@@ -538,8 +457,6 @@ static int spi_ppc4xx_of_probe(struct platform_device *op)
 	release_mem_region(hw->mapbase, hw->mapsize);
 request_mem_error:
 	free_irq(hw->irqnum, hw);
-free_gpios:
-	free_gpios(hw);
 free_master:
 	spi_master_put(master);
 
@@ -556,7 +473,6 @@ static int spi_ppc4xx_of_remove(struct platform_device *op)
 	release_mem_region(hw->mapbase, hw->mapsize);
 	free_irq(hw->irqnum, hw);
 	iounmap(hw->regs);
-	free_gpios(hw);
 	spi_master_put(master);
 	return 0;
 }
-- 
2.26.2

