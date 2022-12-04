Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B48716420AC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 01:00:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQNwT3kYWz3bfX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 11:00:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AFeOI5zS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=dmitry.torokhov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AFeOI5zS;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQNvX2Z1Kz2yxB
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Dec 2022 10:59:36 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso13270922pjt.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Dec 2022 15:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gwAN8x9L4qNxV85BxY4GhMGOx/8SzHAhEgmFjx4Yf/8=;
        b=AFeOI5zSc+VGjp6mFQ+kNOTNIrstPA+Qp6T5aON32yMPoKInxglA4O9x8PAvR3F3PB
         4ZmyV0w3xLEDD+Q3mwHy9nc7OXKh63tKpNXfKntGx3lsfbFVTD4ExvqUeO1Bzu2YiE8q
         10KOPQoIKiW2EPP8yhOo0GSwXkkKiu8S0v7qFC/UyWIfLyl+yzD8PcPf1Kdu5Ss7cU9Z
         utkIDU9hxkecSVftxnRNutbFIn2bzEc/ppQVWYAlpgBgDtGcU2y3xl6I82D9GSkmRFl3
         S2Hh40r1/su7zC7g/YwT6h+kX9GNbsRBweL6gnHrkjpThg4gqIk6bL6XUieLvxDboqkw
         R+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gwAN8x9L4qNxV85BxY4GhMGOx/8SzHAhEgmFjx4Yf/8=;
        b=RovDojBVufSRpETwbKmrRN11t33gHBQydsS1OgqSFtrEAXf7obvdOt+HWwixWxKfPq
         L4fQvmCFwzN6RLeXaFkSKmDHaVogedRpOjAoknbppyMJ7Wj+MD/O+fchkDpna6EhiOix
         Hly5e2Whjvu/qHVuBOvs7bqZFOTEx/VDXRabSEVOGBWs0uTBDa/1XN5XefbWIDDjgxvK
         ETM+fK7gWT+GDTpm+8ttpTltz6F07+gO6ph1g+qMS8jxJ4LwTkLLOj8zqhabSZIAvjNI
         Tk25xkB9ue+/u4wNhBX+i1eCOXTvjNNwbZioJiI2HRz69tlQJ44ObMJOdmHNZd6yNy90
         hPvQ==
X-Gm-Message-State: ANoB5pm95imeZoSqlRY5RD0CrFDrBm3aAE0JkhGC4tIPsJ5Nr3DzbCyx
	5FrskjVK/o1TWdpZeva8hC0=
X-Google-Smtp-Source: AA0mqf4IpXraLE56ol47TcW7xmGPEMG2N5z5q2/oJ2HjOwssbRIqD7Fw6iMCmCYVnbGcAolieL+fqg==
X-Received: by 2002:a17:902:9897:b0:186:a98c:4ab8 with SMTP id s23-20020a170902989700b00186a98c4ab8mr62957137plp.118.1670198372964;
        Sun, 04 Dec 2022 15:59:32 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:ea63:b7ba:2a89:fec])
        by smtp.gmail.com with ESMTPSA id n6-20020a654cc6000000b004468cb97c01sm7232776pgt.56.2022.12.04.15.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 15:59:32 -0800 (PST)
Date: Sun, 4 Dec 2022 15:59:29 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Subject: [PATCH v2] soc: fsl: qe: request pins non-exclusively
Message-ID: <Y400YXnWBdz1e/L5@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 84582f9ed090 ("soc: fsl: qe: Avoid using gpio_to_desc()") changed
qe_pin_request() to request and hold GPIO corresponding to a given pin.
Unfortunately this does not work, as fhci-hcd requests these GPIOs
first, befor calling qe_pin_request() (see
drivers/usb/host/fhci-hcd.c::of_fhci_probe()).
To fix it change qe_pin_request() to request GPIOs non-exclusively, and
free them once the code determines GPIO controller and offset for each
GPIO/pin.

Also reaching deep into gpiolib implementation is not the best idea. We
should either export gpio_chip_hwgpio() or keep converting to the global
gpio numbers space until we fix the driver to implement proper pin
control.

Fixes: 84582f9ed090 ("soc: fsl: qe: Avoid using gpio_to_desc()")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2:

 - rebased on top of soc/driver. This will conflict with
   c9eb6e546a23 soc: fsl: qe: Switch to use fwnode instead of of_node
   found in next, the resolution is trivial: accept
   fwnode_device_is_compatible() line found in next.
 - fixed leak of gpiod when gc is not found
 - dropped Linus' reviewed-by as the patch changed

 drivers/soc/fsl/qe/gpio.c   | 51 +++++++++++++++++--------------------
 drivers/usb/host/fhci-hcd.c |  2 +-
 include/soc/fsl/qe/qe.h     |  5 ++--
 3 files changed, 28 insertions(+), 30 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index af9193e7e49b..1440922341d8 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -13,19 +13,12 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
+#include <linux/of_gpio.h>	/* for of_mm_gpio_chip */
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <soc/fsl/qe/qe.h>
-/*
- * FIXME: this is legacy code that is accessing gpiolib internals in order
- * to implement a custom pin controller. The proper solution is to create
- * a real combined pin control and GPIO driver in drivers/pinctrl. However
- * this hack is here for legacy code reasons.
- */
-#include "../../../gpio/gpiolib.h"
 
 struct qe_gpio_chip {
 	struct of_mm_gpio_chip mm_gc;
@@ -147,65 +140,70 @@ struct qe_pin {
 	 * something like qe_pio_controller. Someday.
 	 */
 	struct qe_gpio_chip *controller;
-	struct gpio_desc *gpiod;
 	int num;
 };
 
 /**
  * qe_pin_request - Request a QE pin
- * @np:		device node to get a pin from
- * @index:	index of a pin in the device tree
+ * @dev:	device to get the pin from
+ * @index:	index of the pin in the device tree
  * Context:	non-atomic
  *
  * This function return qe_pin so that you could use it with the rest of
  * the QE Pin Multiplexing API.
  */
-struct qe_pin *qe_pin_request(struct device_node *np, int index)
+struct qe_pin *qe_pin_request(struct device *dev, int index)
 {
 	struct qe_pin *qe_pin;
 	struct gpio_chip *gc;
 	struct gpio_desc *gpiod;
+	int gpio_num;
 	int err;
 
 	qe_pin = kzalloc(sizeof(*qe_pin), GFP_KERNEL);
 	if (!qe_pin) {
-		pr_debug("%s: can't allocate memory\n", __func__);
+		dev_dbg(dev, "%s: can't allocate memory\n", __func__);
 		return ERR_PTR(-ENOMEM);
 	}
 
-	gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), NULL, index, GPIOD_ASIS, "qe");
-	if (IS_ERR(gpiod)) {
-		err = PTR_ERR(gpiod);
-		goto err0;
-	}
-	if (!gpiod) {
-		err = -EINVAL;
+	/*
+	 * Request gpio as nonexclusive as it was likely reserved by the
+	 * caller, and we are not planning on controlling it, we only need
+	 * the descriptor to the to the gpio chip structure.
+	 */
+	gpiod = gpiod_get_index(dev, NULL, index,
+			        GPIOD_ASIS | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	err = PTR_ERR_OR_ZERO(gpiod);
+	if (err)
 		goto err0;
-	}
+
 	gc = gpiod_to_chip(gpiod);
+	gpio_num = desc_to_gpio(gpiod);
+	/* We no longer need this descriptor */
+	gpiod_put(gpiod);
+
 	if (WARN_ON(!gc)) {
 		err = -ENODEV;
 		goto err0;
 	}
-	qe_pin->gpiod = gpiod;
+
 	qe_pin->controller = gpiochip_get_data(gc);
 	/*
 	 * FIXME: this gets the local offset on the gpio_chip so that the driver
 	 * can manipulate pin control settings through its custom API. The real
 	 * solution is to create a real pin control driver for this.
 	 */
-	qe_pin->num = gpio_chip_hwgpio(gpiod);
+	qe_pin->num = gpio_num - gc->base;
 
 	if (!of_device_is_compatible(gc->of_node, "fsl,mpc8323-qe-pario-bank")) {
-		pr_debug("%s: tried to get a non-qe pin\n", __func__);
-		gpiod_put(gpiod);
+		dev_dbg(dev, "%s: tried to get a non-qe pin\n", __func__);
 		err = -EINVAL;
 		goto err0;
 	}
 	return qe_pin;
 err0:
 	kfree(qe_pin);
-	pr_debug("%s failed with status %d\n", __func__, err);
+	dev_dbg(dev, "%s failed with status %d\n", __func__, err);
 	return ERR_PTR(err);
 }
 EXPORT_SYMBOL(qe_pin_request);
@@ -220,7 +218,6 @@ EXPORT_SYMBOL(qe_pin_request);
  */
 void qe_pin_free(struct qe_pin *qe_pin)
 {
-	gpiod_put(qe_pin->gpiod);
 	kfree(qe_pin);
 }
 EXPORT_SYMBOL(qe_pin_free);
diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
index 95a44462bed0..1f666804fa91 100644
--- a/drivers/usb/host/fhci-hcd.c
+++ b/drivers/usb/host/fhci-hcd.c
@@ -651,7 +651,7 @@ static int of_fhci_probe(struct platform_device *ofdev)
 	}
 
 	for (j = 0; j < NUM_PINS; j++) {
-		fhci->pins[j] = qe_pin_request(node, j);
+		fhci->pins[j] = qe_pin_request(dev, j);
 		if (IS_ERR(fhci->pins[j])) {
 			ret = PTR_ERR(fhci->pins[j]);
 			dev_err(dev, "can't get pin %d: %d\n", j, ret);
diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
index b02e9fe69146..eb5079904cc8 100644
--- a/include/soc/fsl/qe/qe.h
+++ b/include/soc/fsl/qe/qe.h
@@ -172,14 +172,15 @@ static inline int par_io_data_set(u8 port, u8 pin, u8 val) { return -ENOSYS; }
 /*
  * Pin multiplexing functions.
  */
+struct device;
 struct qe_pin;
 #ifdef CONFIG_QE_GPIO
-extern struct qe_pin *qe_pin_request(struct device_node *np, int index);
+extern struct qe_pin *qe_pin_request(struct device *dev, int index);
 extern void qe_pin_free(struct qe_pin *qe_pin);
 extern void qe_pin_set_gpio(struct qe_pin *qe_pin);
 extern void qe_pin_set_dedicated(struct qe_pin *pin);
 #else
-static inline struct qe_pin *qe_pin_request(struct device_node *np, int index)
+static inline struct qe_pin *qe_pin_request(struct device *dev, int index)
 {
 	return ERR_PTR(-ENOSYS);
 }
-- 
2.39.0.rc0.267.gcb52ba06e7-goog


-- 
Dmitry
