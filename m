Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DA45A7914
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 10:32:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHcqP6hJLz3bsy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 18:32:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lBItNH+T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lBItNH+T;
	dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHcpl5sGpz2xJ9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 18:31:41 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id y10so10708088ljq.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 01:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=VIN+TgJ4Yn9I50m4rYFBe2vv4d+pbnwjXdOtIn7ysck=;
        b=lBItNH+Tqd0jkxUXFNzBvCZ1cCSriAxjS5VIu96JlQE5/Qq6lKy9/hrXYXe7C57Qpw
         GghLSSaKrWcKWa3XWUkPYGkxIrS6rUCoO/7XWgIhM7Codh6dpyciW3uctY23hxSEwmov
         eAtTZQgJe8nZU6MxWmnW5k3bbz4KdomUeACwvzmoOpeYyzAnU4fj8450lSRY9FONWvnU
         zgaHv/yYUTXfuXlc9xeOjVnjPqLA4xuTVdp1lZfI7I2orikL2AKxw/h/lvTueQ53RDU6
         qX2PepoDiHteJHhA0YX8S/jsg5wURAjkNp7DTXPEHK9AP5SqbMdtJF//ywEn6yEZanEt
         dsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=VIN+TgJ4Yn9I50m4rYFBe2vv4d+pbnwjXdOtIn7ysck=;
        b=dZBhUrHqgjB/nXTrLGb9P35n+PWE61mnpaWIqRkgRmx8lrp0GFlPvBs3kLWfV7x1eI
         kZM0CBN84LRTMnKp2XkUeoYU2D/6q0AwJyJGl6XJ2IP661Fl1j/7BHsE9KZajRCfoARz
         573yhpAjaH+LwXzAjC81iuE77wO/0G/zIVv776EnKRxoLPPHXlDcXR0AKNXETVJdbpDf
         EBg8MiDZeon1MmbEGL4hQP/iJaB7fJkQL3pOPt1Rqaj15bT45m7eNUmmkhkIAIdcPkYl
         /wgYpqpcni20ZSz2GbCn4uKyoSoJm99MXqdbsiMaIzOrUslVILnKxkrlcleWTg4Bu4MB
         EGLA==
X-Gm-Message-State: ACgBeo1/5VE7geTTNpUWDRo/CwAAD2vVclyboptAD5his9GTj8KyRC38
	DsWcSaHWttHtHOzj/IBYcSW9ZQ==
X-Google-Smtp-Source: AA6agR4mfGQohbYeHA0LSRBX8WII0cRtry2JMlmb1c+9CcT0asi22JxxbfaEam/p9RNuWiBTKF3O5A==
X-Received: by 2002:a2e:9043:0:b0:264:c94:6e6d with SMTP id n3-20020a2e9043000000b002640c946e6dmr4878303ljg.216.1661934694168;
        Wed, 31 Aug 2022 01:31:34 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id i3-20020a2ea223000000b00262fa7bae79sm1569003ljm.81.2022.08.31.01.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 01:31:33 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] USB: FHCI: Switch to GPIO descriptors
Date: Wed, 31 Aug 2022 10:29:32 +0200
Message-Id: <20220831082932.488724-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.2
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
Cc: Zhao Qiang <qiang.zhao@freescale.com>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Guilherme Maciel Ferreira <guilherme.maciel.ferreira@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This driver for the PPC Freescale SoC is using device tree
accessors and imperative GPIO semantics control using the old
GPIO API, switch it over to use GPIO descriptors.

Cc: Li Yang <leoyang.li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Zhao Qiang <qiang.zhao@freescale.com>
Cc: Guilherme Maciel Ferreira <guilherme.maciel.ferreira@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/usb/host/fhci-hcd.c | 63 +++++++++++--------------------------
 drivers/usb/host/fhci-hub.c | 15 +++++----
 drivers/usb/host/fhci.h     |  4 +--
 3 files changed, 27 insertions(+), 55 deletions(-)

diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
index 2ba09c3fbc2f..95a44462bed0 100644
--- a/drivers/usb/host/fhci-hcd.c
+++ b/drivers/usb/host/fhci-hcd.c
@@ -25,8 +25,8 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
-#include <linux/of_gpio.h>
 #include <linux/slab.h>
+#include <linux/gpio/consumer.h>
 #include <soc/fsl/qe/qe.h>
 #include <asm/fsl_gtm.h>
 #include "fhci.h"
@@ -150,15 +150,15 @@ int fhci_ioports_check_bus_state(struct fhci_hcd *fhci)
 	u8 bits = 0;
 
 	/* check USBOE,if transmitting,exit */
-	if (!gpio_get_value(fhci->gpios[GPIO_USBOE]))
+	if (!gpiod_get_value(fhci->gpiods[GPIO_USBOE]))
 		return -1;
 
 	/* check USBRP */
-	if (gpio_get_value(fhci->gpios[GPIO_USBRP]))
+	if (gpiod_get_value(fhci->gpiods[GPIO_USBRP]))
 		bits |= 0x2;
 
 	/* check USBRN */
-	if (gpio_get_value(fhci->gpios[GPIO_USBRN]))
+	if (gpiod_get_value(fhci->gpiods[GPIO_USBRN]))
 		bits |= 0x1;
 
 	return bits;
@@ -630,40 +630,23 @@ static int of_fhci_probe(struct platform_device *ofdev)
 
 	/* GPIOs and pins */
 	for (i = 0; i < NUM_GPIOS; i++) {
-		int gpio;
-		enum of_gpio_flags flags;
-
-		gpio = of_get_gpio_flags(node, i, &flags);
-		fhci->gpios[i] = gpio;
-		fhci->alow_gpios[i] = flags & OF_GPIO_ACTIVE_LOW;
-
-		if (!gpio_is_valid(gpio)) {
-			if (i < GPIO_SPEED) {
-				dev_err(dev, "incorrect GPIO%d: %d\n",
-					i, gpio);
-				goto err_gpios;
-			} else {
-				dev_info(dev, "assuming board doesn't have "
-					"%s gpio\n", i == GPIO_SPEED ?
-					"speed" : "power");
-				continue;
-			}
-		}
+		if (i < GPIO_SPEED)
+			fhci->gpiods[i] = devm_gpiod_get_index(dev,
+					NULL, i, GPIOD_IN);
+
+		else
+			fhci->gpiods[i] = devm_gpiod_get_index_optional(dev,
+					NULL, i, GPIOD_OUT_LOW);
 
-		ret = gpio_request(gpio, dev_name(dev));
-		if (ret) {
-			dev_err(dev, "failed to request gpio %d", i);
+		if (IS_ERR(fhci->gpiods[i])) {
+			dev_err(dev, "incorrect GPIO%d: %ld\n",
+				i, PTR_ERR(fhci->gpiods[i]));
 			goto err_gpios;
 		}
-
-		if (i >= GPIO_SPEED) {
-			ret = gpio_direction_output(gpio, 0);
-			if (ret) {
-				dev_err(dev, "failed to set gpio %d as "
-					"an output\n", i);
-				i++;
-				goto err_gpios;
-			}
+		if (!fhci->gpiods[i]) {
+			dev_info(dev, "assuming board doesn't have "
+				 "%s gpio\n", i == GPIO_SPEED ?
+				 "speed" : "power");
 		}
 	}
 
@@ -766,10 +749,6 @@ static int of_fhci_probe(struct platform_device *ofdev)
 	while (--j >= 0)
 		qe_pin_free(fhci->pins[j]);
 err_gpios:
-	while (--i >= 0) {
-		if (gpio_is_valid(fhci->gpios[i]))
-			gpio_free(fhci->gpios[i]);
-	}
 	cpm_muram_free(pram_addr);
 err_pram:
 	iounmap(hcd->regs);
@@ -782,18 +761,12 @@ static int fhci_remove(struct device *dev)
 {
 	struct usb_hcd *hcd = dev_get_drvdata(dev);
 	struct fhci_hcd *fhci = hcd_to_fhci(hcd);
-	int i;
 	int j;
 
 	usb_remove_hcd(hcd);
 	free_irq(fhci->timer->irq, hcd);
 	gtm_put_timer16(fhci->timer);
 	cpm_muram_free(cpm_muram_offset(fhci->pram));
-	for (i = 0; i < NUM_GPIOS; i++) {
-		if (!gpio_is_valid(fhci->gpios[i]))
-			continue;
-		gpio_free(fhci->gpios[i]);
-	}
 	for (j = 0; j < NUM_PINS; j++)
 		qe_pin_free(fhci->pins[j]);
 	fhci_dfs_destroy(fhci);
diff --git a/drivers/usb/host/fhci-hub.c b/drivers/usb/host/fhci-hub.c
index c359dcdb9b13..5f48660ebdfa 100644
--- a/drivers/usb/host/fhci-hub.c
+++ b/drivers/usb/host/fhci-hub.c
@@ -19,7 +19,7 @@
 #include <linux/io.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <soc/fsl/qe/qe.h>
 #include "fhci.h"
 
@@ -38,13 +38,12 @@ static u8 root_hub_des[] = {
 
 static void fhci_gpio_set_value(struct fhci_hcd *fhci, int gpio_nr, bool on)
 {
-	int gpio = fhci->gpios[gpio_nr];
-	bool alow = fhci->alow_gpios[gpio_nr];
+	struct gpio_desc *gpiod = fhci->gpiods[gpio_nr];
 
-	if (!gpio_is_valid(gpio))
+	if (!gpiod)
 		return;
 
-	gpio_set_value(gpio, on ^ alow);
+	gpiod_set_value(gpiod, on);
 	mdelay(5);
 }
 
@@ -129,9 +128,9 @@ void fhci_io_port_generate_reset(struct fhci_hcd *fhci)
 {
 	fhci_dbg(fhci, "-> %s\n", __func__);
 
-	gpio_direction_output(fhci->gpios[GPIO_USBOE], 0);
-	gpio_direction_output(fhci->gpios[GPIO_USBTP], 0);
-	gpio_direction_output(fhci->gpios[GPIO_USBTN], 0);
+	gpiod_direction_output(fhci->gpiods[GPIO_USBOE], 0);
+	gpiod_direction_output(fhci->gpiods[GPIO_USBTP], 0);
+	gpiod_direction_output(fhci->gpiods[GPIO_USBTN], 0);
 
 	mdelay(5);
 
diff --git a/drivers/usb/host/fhci.h b/drivers/usb/host/fhci.h
index 81fbc019a9b3..1f57b0989485 100644
--- a/drivers/usb/host/fhci.h
+++ b/drivers/usb/host/fhci.h
@@ -23,6 +23,7 @@
 #include <linux/io.h>
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
+#include <linux/gpio/consumer.h>
 #include <soc/fsl/qe/qe.h>
 #include <soc/fsl/qe/immap_qe.h>
 
@@ -242,8 +243,7 @@ struct fhci_hcd {
 	enum qe_clock fullspeed_clk;
 	enum qe_clock lowspeed_clk;
 	struct qe_pin *pins[NUM_PINS];
-	int gpios[NUM_GPIOS];
-	bool alow_gpios[NUM_GPIOS];
+	struct gpio_desc *gpiods[NUM_GPIOS];
 
 	struct qe_usb_ctlr __iomem *regs; /* I/O memory used to communicate */
 	struct fhci_pram __iomem *pram;	/* Parameter RAM */
-- 
2.37.2

