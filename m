Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF2F641ABA
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Dec 2022 05:51:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NPvQv4rYMz3bb6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Dec 2022 15:51:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HZ3Jzy08;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=dmitry.torokhov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HZ3Jzy08;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NPvPw4SGrz3bTq
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Dec 2022 15:50:42 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id k5so8363608pjo.5
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Dec 2022 20:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G5RXZPYNU+MGBPjRAeU3aYtU4jqo7I+GsemvhOJe/IQ=;
        b=HZ3Jzy08bo6BR6ef6vSMmFg8qNnkSsmht0/NEpeDT2monTU4soJcvmDXBT/2uL+Ms6
         pMDOvTtn8Cy+vUunaoSxxsr6Q6CQWtskPwC0EN/1D30EgSz0Xr2y02Yze/9W0QZs4KR2
         1Qz2XJqQs7+fQ21Q3litDCICMKO6HF+Hs919/l9J/KIvhhP4QmFhiJvk8VbXGUZuf2BB
         jBs91beu7NBUSDIzfOiO31Gwh5vkQxU04Mt5ch0qx1YnXU5yymfiJ769rsvFEJg77qqp
         XtzpgW4vWao/iYKQp+aLUF3kjvQq5OPg6G3cUGHsDxwWTtePDXCmJaWY9tBCPH4f/mAo
         Nsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G5RXZPYNU+MGBPjRAeU3aYtU4jqo7I+GsemvhOJe/IQ=;
        b=WsCwazG7MTYbOe5Z7aEwuH6luMM9E52tcNaRGhVCSPkQqbEIqeiI9YTELx9aQt5k0Z
         LbIB97NuRWnGcDL1l2Mmhbx8MhltegGXV1a2gGeYHN8Bw6W3H6xuN5ZkHJl9WSaDj+6K
         RAdkEXAejVso7FIg1nxlXg0Xtr+6h0dR235jJDobbcBzIxkJz+gd6M6ngHpQH4pW53gj
         S7i6Ywg9qrlMgA0BMh7NeJqKXf8A9j6mUnVCgSf+G2Jc+nTisZHgvucC0zfkQDIN/LdD
         uebJE3OcUMA//OjVExkUmJVSfacSi7koLnG5XFOM3mqLUjoVeIIQVn2TRP0333XC5mtt
         BlnQ==
X-Gm-Message-State: ANoB5pkLSVOUp802G3d+p3xo5hzQOyBCq5i99oZCwlBHkkfUnlo2dKDw
	uh8DA5FxP1hiEudaC/1DnKc=
X-Google-Smtp-Source: AA0mqf7wyNuhKRXDWggFHjgJr0OniHRf0fRJqFY/fRXX3I4DTnRHj/XYZ0YfuFTr9qK8qWVZ1wXsfw==
X-Received: by 2002:a17:90a:9c5:b0:219:89c3:23a9 with SMTP id 63-20020a17090a09c500b0021989c323a9mr11145029pjo.212.1670129438001;
        Sat, 03 Dec 2022 20:50:38 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:50bf:ab09:e932:bfd2])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902e48a00b00189bf5dc96dsm3575476ple.230.2022.12.03.20.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 20:50:37 -0800 (PST)
Date: Sat, 3 Dec 2022 20:50:34 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org
Subject: [RESEND PATCH] soc: fsl: qe: request pins non-exclusively
Message-ID: <Y4wnGgMLOr04RwvU@google.com>
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
first, before calling qe_pin_request() (see
drivers/usb/host/fhci-hcd.c::of_fhci_probe()).
To fix it change qe_pin_request() to request GPIOs non-exclusively, and
free them once the code determines GPIO controller and offset for each
GPIO/pin.

Also reaching deep into gpiolib implementation is not the best idea. We
should either export gpio_chip_hwgpio() or keep converting to the global
gpio numbers space until we fix the driver to implement proper pin
control.

Fixes: 84582f9ed090 ("soc: fsl: qe: Avoid using gpio_to_desc()")
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

SoC team, the problematic patch has been in next for a while and it
would be great to get the fix in to make sure the driver is not broken
in 6.2. Thanks!

 drivers/soc/fsl/qe/gpio.c   | 71 ++++++++++++++++++-------------------
 drivers/usb/host/fhci-hcd.c |  2 +-
 include/soc/fsl/qe/qe.h     |  5 +--
 3 files changed, 38 insertions(+), 40 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 0ee887f89deb..5bb71a2b5b7a 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -13,7 +13,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
+#include <linux/of_gpio.h>	/* for of_mm_gpio_chip */
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
@@ -21,13 +21,6 @@
 #include <linux/property.h>
 
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
@@ -149,20 +142,19 @@ struct qe_pin {
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
@@ -171,40 +163,46 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 
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
+	 * Request gpio as nonexclusive as it was likely was reserved by
+	 * the caller, and we are not planning on controlling it, we only
+	 * need the descriptor to the to the gpio chip structure.
+	 */
+	gpiod = gpiod_get_index(dev, NULL, index,
+			        GPIOD_ASIS | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	err = PTR_ERR_OR_ZERO(gpiod);
+	if (err)
 		goto err0;
-	}
+
 	gc = gpiod_to_chip(gpiod);
 	if (WARN_ON(!gc)) {
 		err = -ENODEV;
 		goto err0;
-	}
-	qe_pin->gpiod = gpiod;
-	qe_pin->controller = gpiochip_get_data(gc);
-	/*
-	 * FIXME: this gets the local offset on the gpio_chip so that the driver
-	 * can manipulate pin control settings through its custom API. The real
-	 * solution is to create a real pin control driver for this.
-	 */
-	qe_pin->num = gpio_chip_hwgpio(gpiod);
-
-	if (!fwnode_device_is_compatible(gc->fwnode, "fsl,mpc8323-qe-pario-bank")) {
-		pr_debug("%s: tried to get a non-qe pin\n", __func__);
-		gpiod_put(gpiod);
+	} else if (!fwnode_device_is_compatible(gc->fwnode,
+						"fsl,mpc8323-qe-pario-bank")) {
+		dev_dbg(dev, "%s: tried to get a non-qe pin\n", __func__);
 		err = -EINVAL;
-		goto err0;
+	} else {
+		qe_pin->controller = gpiochip_get_data(gc);
+		/*
+		 * FIXME: this gets the local offset on the gpio_chip so that
+		 * the driver can manipulate pin control settings through its
+		 * custom API. The real solution is to create a real pin control
+		 * driver for this.
+		 */
+		qe_pin->num = desc_to_gpio(gpiod) - gc->base;
 	}
-	return qe_pin;
+
+	/* We no longer need this descriptor */
+	gpiod_put(gpiod);
+
+	if (!err)
+		return qe_pin;
+
 err0:
 	kfree(qe_pin);
 	pr_debug("%s failed with status %d\n", __func__, err);
@@ -222,7 +220,6 @@ EXPORT_SYMBOL(qe_pin_request);
  */
 void qe_pin_free(struct qe_pin *qe_pin)
 {
-	gpiod_put(qe_pin->gpiod);
 	kfree(qe_pin);
 }
 EXPORT_SYMBOL(qe_pin_free);
diff --git a/drivers/usb/host/fhci-hcd.c b/drivers/usb/host/fhci-hcd.c
index 64a64140c2fd..92794ffc25c8 100644
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
