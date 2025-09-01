Return-Path: <linuxppc-dev+bounces-11578-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3001CB3E60B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 15:50:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFqyX0sgCz2ywh;
	Mon,  1 Sep 2025 23:50:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756734644;
	cv=none; b=jJ1eoRof4JZrmqSMvUUS4haisZlT5/HAFgGCsuvLQuFvTKxdmER4WQJuPTam8ytI+AiSWIFczeZOvQ0BQbTvEI8tiRCZuQgtpNaAQOf6732CROI1P1CSBCPPT6kJBUlZcErcJppRgQ18ick9tagftJO66sHHPsfFppEG9e4/R/xoCRFhWh6SDxk3UGQh8pcEFREqaMT397HWVe5frFvX1tswHQBFRMtICfH3tmiP0SGzpKL51ht1mdj8YJvrLfD9/rj4VTGPbafVkkaPy87Y58b/n3w2Bkgn7IPOcQm6mktZ00NuPMLj10qYZhEWhp/JiZvDUjAipXP/jwmg/X1C2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756734644; c=relaxed/relaxed;
	bh=Jtz4NMD0OIuFJ1vGUjeFJCuc29nxu0XN/MgbJYMuBGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1ZJeuiYKIXYugv/uXQo1i1n5n0r3ncjtcvyfs7GViPkqUNfU95DtW/vC781JX7/wy33BeJsdNifKLTJOglMjO8eYBZ7yT54rdCA1stsm/MzH9vZ8WEVTs3nxq8FGBUSoDX0KZcavv2/wbrua3ES6/i2IqjBqZ0WSPDCLybDdGUyIHKsQNw6uqmtoFnXW5fKQ7ppiE2aaEV1h4wIZKOyKeXTbW/uIlAoCAjx0yDZQto0kyQutIj/Py6Gb7KcL1HwcKzhITKiUk+FBKHRtJSeE8ppkQDhhmqelcDCOdlAebzaSq5cJWnjCViNs2IuKcc9wkiuIdZnt7jgGT4y9GvJIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFqyW4T7Lz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 23:50:43 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cFndG1JW7z9sSj;
	Mon,  1 Sep 2025 14:05:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YjItXt-aDJex; Mon,  1 Sep 2025 14:05:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cFndC3wLgz9sSn;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6DFC88B790;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 8IHJKJa_apLX; Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 397938B796;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 3/7] soc: fsl: qe: Drop legacy-of-mm-gpiochip.h header from GPIO driver
Date: Mon,  1 Sep 2025 14:05:10 +0200
Message-ID: <c5788504a473625faeb9f99b08d3bca5e7135120.1756727747.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1756727747.git.christophe.leroy@csgroup.eu>
References: <cover.1756727747.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756728308; l=7337; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=zHMhkGOir99C4zE6CP2P9w4fbrPG2js+Iq37Oh0usVQ=; b=JCxpWDQg8OT10Z6xzFFQz7qWBVLJ3RJwav5YcIOtO07QXfDpRAg1A9uG5tFz3Z3jwLeuwAyfi deFgDBXXM30Alvf3L3FJ/ZG2MGYKdoX18I2J2JmSoeiso2DstWnIpJG
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Remove legacy-of-mm-gpiochip.h header file. The above mentioned
file provides an OF API that's deprecated. There is no agnostic
alternatives to it and we have to open code the logic which was
hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
drivers are using their own labeling schemas and resource retrieval
that only a few may gain of the code deduplication, so whenever
alternative is appear we can move drivers again to use that one.

As a side effect this change fixes a potential memory leak on
an error path, if of_mm_gpiochip_add_data() fails.

[Text copied from commit 34064c8267a6 ("powerpc/8xx: Drop
legacy-of-mm-gpiochip.h header")]

Suggested-by: Bartosz Golaszewski <brgl@bgdev.pl>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/Kconfig |  1 -
 drivers/soc/fsl/qe/gpio.c      | 51 ++++++++++++++++++----------------
 2 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index fea3766eac0f..5b689bd3ddf4 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -232,7 +232,6 @@ config QE_GPIO
 	bool "QE GPIO support"
 	depends on QUICC_ENGINE
 	select GPIOLIB
-	select OF_GPIO_MM_GPIOCHIP
 	help
 	  Say Y here if you're going to use hardware that connects to the
 	  QE GPIOs.
diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 04b44fc2bb58..c54154b404df 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -12,7 +12,6 @@
 #include <linux/spinlock.h>
 #include <linux/err.h>
 #include <linux/io.h>
-#include <linux/gpio/legacy-of-mm-gpiochip.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
@@ -24,7 +23,8 @@
 #define PIN_MASK(gpio) (1UL << (QE_PIO_PINS - 1 - (gpio)))
 
 struct qe_gpio_chip {
-	struct of_mm_gpio_chip mm_gc;
+	struct gpio_chip gc;
+	void __iomem *regs;
 	spinlock_t lock;
 
 	/* shadowed data register to clear/set bits safely */
@@ -34,11 +34,9 @@ struct qe_gpio_chip {
 	struct qe_pio_regs saved_regs;
 };
 
-static void qe_gpio_save_regs(struct of_mm_gpio_chip *mm_gc)
+static void qe_gpio_save_regs(struct qe_gpio_chip *qe_gc)
 {
-	struct qe_gpio_chip *qe_gc =
-		container_of(mm_gc, struct qe_gpio_chip, mm_gc);
-	struct qe_pio_regs __iomem *regs = mm_gc->regs;
+	struct qe_pio_regs __iomem *regs = qe_gc->regs;
 
 	qe_gc->cpdata = ioread32be(&regs->cpdata);
 	qe_gc->saved_regs.cpdata = qe_gc->cpdata;
@@ -51,8 +49,8 @@ static void qe_gpio_save_regs(struct of_mm_gpio_chip *mm_gc)
 
 static int qe_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct qe_pio_regs __iomem *regs = mm_gc->regs;
+	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
+	struct qe_pio_regs __iomem *regs = qe_gc->regs;
 	u32 pin_mask = PIN_MASK(gpio);
 
 	return !!(ioread32be(&regs->cpdata) & pin_mask);
@@ -60,9 +58,8 @@ static int qe_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 
 static int qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
-	struct qe_pio_regs __iomem *regs = mm_gc->regs;
+	struct qe_pio_regs __iomem *regs = qe_gc->regs;
 	unsigned long flags;
 	u32 pin_mask = PIN_MASK(gpio);
 
@@ -83,9 +80,8 @@ static int qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 static int qe_gpio_set_multiple(struct gpio_chip *gc,
 				unsigned long *mask, unsigned long *bits)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
-	struct qe_pio_regs __iomem *regs = mm_gc->regs;
+	struct qe_pio_regs __iomem *regs = qe_gc->regs;
 	unsigned long flags;
 	int i;
 
@@ -111,13 +107,12 @@ static int qe_gpio_set_multiple(struct gpio_chip *gc,
 
 static int qe_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
 	unsigned long flags;
 
 	spin_lock_irqsave(&qe_gc->lock, flags);
 
-	__par_io_config_pin(mm_gc->regs, gpio, QE_PIO_DIR_IN, 0, 0, 0);
+	__par_io_config_pin(qe_gc->regs, gpio, QE_PIO_DIR_IN, 0, 0, 0);
 
 	spin_unlock_irqrestore(&qe_gc->lock, flags);
 
@@ -126,7 +121,6 @@ static int qe_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 
 static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
 	unsigned long flags;
 
@@ -134,7 +128,7 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 	spin_lock_irqsave(&qe_gc->lock, flags);
 
-	__par_io_config_pin(mm_gc->regs, gpio, QE_PIO_DIR_OUT, 0, 0, 0);
+	__par_io_config_pin(qe_gc->regs, gpio, QE_PIO_DIR_OUT, 0, 0, 0);
 
 	spin_unlock_irqrestore(&qe_gc->lock, flags);
 
@@ -240,7 +234,7 @@ EXPORT_SYMBOL(qe_pin_free);
 void qe_pin_set_dedicated(struct qe_pin *qe_pin)
 {
 	struct qe_gpio_chip *qe_gc = qe_pin->controller;
-	struct qe_pio_regs __iomem *regs = qe_gc->mm_gc.regs;
+	struct qe_pio_regs __iomem *regs = qe_gc->regs;
 	struct qe_pio_regs *sregs = &qe_gc->saved_regs;
 	int pin = qe_pin->num;
 	u32 mask1 = 1 << (QE_PIO_PINS - (pin + 1));
@@ -269,7 +263,6 @@ void qe_pin_set_dedicated(struct qe_pin *qe_pin)
 
 	iowrite32be(qe_gc->cpdata, &regs->cpdata);
 	qe_clrsetbits_be32(&regs->cpodr, mask1, sregs->cpodr & mask1);
-
 	spin_unlock_irqrestore(&qe_gc->lock, flags);
 }
 EXPORT_SYMBOL(qe_pin_set_dedicated);
@@ -284,7 +277,7 @@ EXPORT_SYMBOL(qe_pin_set_dedicated);
 void qe_pin_set_gpio(struct qe_pin *qe_pin)
 {
 	struct qe_gpio_chip *qe_gc = qe_pin->controller;
-	struct qe_pio_regs __iomem *regs = qe_gc->mm_gc.regs;
+	struct qe_pio_regs __iomem *regs = qe_gc->regs;
 	unsigned long flags;
 
 	spin_lock_irqsave(&qe_gc->lock, flags);
@@ -301,7 +294,6 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	struct device *dev = &ofdev->dev;
 	struct device_node *np = dev->of_node;
 	struct qe_gpio_chip *qe_gc;
-	struct of_mm_gpio_chip *mm_gc;
 	struct gpio_chip *gc;
 
 	qe_gc = devm_kzalloc(dev, sizeof(*qe_gc), GFP_KERNEL);
@@ -310,18 +302,29 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 
 	spin_lock_init(&qe_gc->lock);
 
-	mm_gc = &qe_gc->mm_gc;
-	gc = &mm_gc->gc;
+	gc = &qe_gc->gc;
 
-	mm_gc->save_regs = qe_gpio_save_regs;
+	gc->base = -1;
 	gc->ngpio = QE_PIO_PINS;
 	gc->direction_input = qe_gpio_dir_in;
 	gc->direction_output = qe_gpio_dir_out;
 	gc->get = qe_gpio_get;
 	gc->set = qe_gpio_set;
 	gc->set_multiple = qe_gpio_set_multiple;
+	gc->parent = dev;
+	gc->owner = THIS_MODULE;
+
+	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
+	if (!gc->label)
+		return -ENOMEM;
+
+	qe_gc->regs = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(qe_gc->regs))
+		return PTR_ERR(qe_gc->regs);
+
+	qe_gpio_save_regs(qe_gc);
 
-	return of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
+	return devm_gpiochip_add_data(dev, gc, qe_gc);
 }
 
 static const struct of_device_id qe_gpio_match[] = {
-- 
2.49.0


