Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C383760F1F2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 10:12:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mydgm4xg1z3cC5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 19:12:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Xm76KFyX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Xm76KFyX;
	dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mydfs3GH9z2xG9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 19:11:16 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id o12so1204131lfq.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 01:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NMKrhWtEGgJEHMUsPcZ5EkFWH3rKurAQv3sdpE15J7M=;
        b=Xm76KFyXjTssbhlSwSiJ9K0n93eCg87fpMlMDVvaq5WLVZBTRW9Bc2ANHHXy1Sm8AY
         pE8NzT/v1gz9/kx7ILCjBa2WnDB2cULeBdN+5TVbx+fqfwqYcgFmj5QnWqHz0NwDPi5B
         MwpEgbJuFH9fd4/A1zhFu5YAkDQQ+tLD+fTHBGZ/yf3XSE8PFpyXvVlc2PQXagPlFjOd
         hK/g1Nvj14KEXNT022uTbil25ao3IGUMOkF4e9350+o3SO0TJ2Lm1GsU8SXPUEqmUgFy
         BpLNKVMjITon1EpBuNBLcTAT3P2oAudU5fABhlT97e1nxNpU3Kki2hj4fLlWAisfXqnq
         vd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMKrhWtEGgJEHMUsPcZ5EkFWH3rKurAQv3sdpE15J7M=;
        b=n5m0uinQ6kwhYytB7TC9O9qjwUPMAX+eyv9yFTDYyDSB1cj2EOH7hkMz9yzZ/AD/Mz
         uv5hf0Nk8zZyxuWty8IM+zsQWZnksrh7ks8qKfKmZlf5kroDXScG1NjuiMtqcVhvo2zM
         a/1PJiqlJkQNDYXQEX3vvp6oSWucGAYhA7NN9y97YT/RYdWdvZiiYblo+Gy974FpxtxF
         s7pPyh2QfKD9XF3rP84wRMVZAjfwZMoLrf4mcv4xD6kI5c3OlXior+RRuHH64/erQFET
         NRNYhnORxSfaqF+s08pOboY9QFW0zOL5l/1hGMLqcMmB7aFWPE77D5ABxBG2P+gaN8Mk
         97tA==
X-Gm-Message-State: ACrzQf0t7yEtsPtePT7kz3sUreJx/ciPhfmjnCvnpkGM9mYdTGvlufqT
	XCQSxjsBUzNZBhb5guol0wxKLw==
X-Google-Smtp-Source: AMsMyM7ZtMmTHsWm1e00XPIiTpNT0S7/rCzS9DGyQzKImljosCGvsi8Ha9Q7bz3rjqOV8jiOmpbFwQ==
X-Received: by 2002:a05:6512:3b2:b0:4a2:48c3:1f46 with SMTP id v18-20020a05651203b200b004a248c31f46mr17353514lfp.572.1666858271692;
        Thu, 27 Oct 2022 01:11:11 -0700 (PDT)
Received: from fedora.. ([85.235.10.72])
        by smtp.gmail.com with ESMTPSA id bd24-20020a05651c169800b002772b70c1acsm136881ljb.21.2022.10.27.01.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 01:11:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	soc@kernel.org
Subject: [PATCH v3] soc: fsl: qe: Avoid using gpio_to_desc()
Date: Thu, 27 Oct 2022 10:11:08 +0200
Message-Id: <20221027081108.174662-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
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
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The qe gpio driver is a custom API combined GPIO and pin control
driver that exist outside of the pin control subsystem for historical
reasons.

We want to get rid of the old GPIO numberspace, so instead of
calling gpio_to_desc() we get the gpio descriptor for the requested
line from the device tree directly without passing through the
GPIO numberspace, and then we get the gpiochip from the descriptor.

Using the reference counting inside the gpio descriptor we can drop
the reference counting code in this driver. A second gpiod_get()
will not succeed.

To obtain the local hardware offset of the GPIO line, the driver
need to include the header from the gpiolib internals. This isn't
pretty but it is the lesser evil compared to keeping the code
as a roadblock to gpiolib refactoring. A proper solution would be
to rewrite the driver as a real pin control driver with a
built-in gpio_chip.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this directly for -next if it seems
OK.

ChangeLog v2->v3:
- Realize what the driver is trying to do and make a deeper
  refactoring to get at gpiolib internals.
ChangeLog v1->v2:
- Add back the <linux/of_gpio.h> include: we are using the
  mm_of_gpio_chip, which should be fixed, but not now.
---
 drivers/soc/fsl/qe/gpio.c | 66 ++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 36 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 99f7de43c3c6..af9193e7e49b 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -14,20 +14,23 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
-/* FIXME: needed for gpio_to_chip() get rid of this */
-#include <linux/gpio.h>
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <soc/fsl/qe/qe.h>
+/*
+ * FIXME: this is legacy code that is accessing gpiolib internals in order
+ * to implement a custom pin controller. The proper solution is to create
+ * a real combined pin control and GPIO driver in drivers/pinctrl. However
+ * this hack is here for legacy code reasons.
+ */
+#include "../../../gpio/gpiolib.h"
 
 struct qe_gpio_chip {
 	struct of_mm_gpio_chip mm_gc;
 	spinlock_t lock;
 
-	unsigned long pin_flags[QE_PIO_PINS];
-#define QE_PIN_REQUESTED 0
-
 	/* shadowed data register to clear/set bits safely */
 	u32 cpdata;
 
@@ -144,6 +147,7 @@ struct qe_pin {
 	 * something like qe_pio_controller. Someday.
 	 */
 	struct qe_gpio_chip *controller;
+	struct gpio_desc *gpiod;
 	int num;
 };
 
@@ -160,9 +164,8 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 {
 	struct qe_pin *qe_pin;
 	struct gpio_chip *gc;
-	struct qe_gpio_chip *qe_gc;
+	struct gpio_desc *gpiod;
 	int err;
-	unsigned long flags;
 
 	qe_pin = kzalloc(sizeof(*qe_pin), GFP_KERNEL);
 	if (!qe_pin) {
@@ -170,38 +173,36 @@ struct qe_pin *qe_pin_request(struct device_node *np, int index)
 		return ERR_PTR(-ENOMEM);
 	}
 
-	err = of_get_gpio(np, index);
-	if (err < 0)
+	gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), NULL, index, GPIOD_ASIS, "qe");
+	if (IS_ERR(gpiod)) {
+		err = PTR_ERR(gpiod);
+		goto err0;
+	}
+	if (!gpiod) {
+		err = -EINVAL;
 		goto err0;
-	gc = gpio_to_chip(err);
+	}
+	gc = gpiod_to_chip(gpiod);
 	if (WARN_ON(!gc)) {
 		err = -ENODEV;
 		goto err0;
 	}
+	qe_pin->gpiod = gpiod;
+	qe_pin->controller = gpiochip_get_data(gc);
+	/*
+	 * FIXME: this gets the local offset on the gpio_chip so that the driver
+	 * can manipulate pin control settings through its custom API. The real
+	 * solution is to create a real pin control driver for this.
+	 */
+	qe_pin->num = gpio_chip_hwgpio(gpiod);
 
 	if (!of_device_is_compatible(gc->of_node, "fsl,mpc8323-qe-pario-bank")) {
 		pr_debug("%s: tried to get a non-qe pin\n", __func__);
+		gpiod_put(gpiod);
 		err = -EINVAL;
 		goto err0;
 	}
-
-	qe_gc = gpiochip_get_data(gc);
-
-	spin_lock_irqsave(&qe_gc->lock, flags);
-
-	err -= gc->base;
-	if (test_and_set_bit(QE_PIN_REQUESTED, &qe_gc->pin_flags[err]) == 0) {
-		qe_pin->controller = qe_gc;
-		qe_pin->num = err;
-		err = 0;
-	} else {
-		err = -EBUSY;
-	}
-
-	spin_unlock_irqrestore(&qe_gc->lock, flags);
-
-	if (!err)
-		return qe_pin;
+	return qe_pin;
 err0:
 	kfree(qe_pin);
 	pr_debug("%s failed with status %d\n", __func__, err);
@@ -219,14 +220,7 @@ EXPORT_SYMBOL(qe_pin_request);
  */
 void qe_pin_free(struct qe_pin *qe_pin)
 {
-	struct qe_gpio_chip *qe_gc = qe_pin->controller;
-	unsigned long flags;
-	const int pin = qe_pin->num;
-
-	spin_lock_irqsave(&qe_gc->lock, flags);
-	test_and_clear_bit(QE_PIN_REQUESTED, &qe_gc->pin_flags[pin]);
-	spin_unlock_irqrestore(&qe_gc->lock, flags);
-
+	gpiod_put(qe_pin->gpiod);
 	kfree(qe_pin);
 }
 EXPORT_SYMBOL(qe_pin_free);
-- 
2.34.1

