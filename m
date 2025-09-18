Return-Path: <linuxppc-dev+bounces-12418-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B85B896C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 14:20:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSs6K4q46z3cYx;
	Fri, 19 Sep 2025 22:20:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758284441;
	cv=none; b=Qx7SXMHraig9mgTswaSG6BD8IPUZQXgKTGoWD3S9dYLHFru+ojGXnN28q4agRrpqLImzly/OrmkVl4CDDvygPi0xTQPfkDFjQYmQIcvO45wYXZ8gYmRJ8CKIjSpokgEQoK3PTgJToUN8OvA8qLuWBAO+s+PGqNSeVg9Nw1E9BQQ+mPWJHCi3L0v9kTavzdhTIyMCNtsEiq/AbHjaa2zUgLsUfmGakIe8p32I9ZR5e9mt/ZC7wVsTbMQWnIwMIRxXtVTVVVfSA3S3T/F5DXDpl6DB1VgWPK5vo/HaiLYgrHenRbnnJ6GhkUUa5GRGC5SbgOWsr1llY/R6I5/Thdfcjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758284441; c=relaxed/relaxed;
	bh=196i/pyGYqrZr9r1ukNaSaKe++StSIhIhFVp7l1Zsow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Np6m1zT0SFFXADHmWwDxAcmALQWQBccMrSyDTL1K9x9FNwS0YMAShJTlE/juJaHOKP3zSNzz8NHEgBQcVjjHFquYgx5+tDx1FQO7XShmldcacQlkOmMqNbAwqrc78+9F6EiQQu2yWL2Ryyr9vGtDb0EI0OjNcbiFYR18lGV3wkcWw0bUzbAHknkBHnA4ZXzvhlhE0QoGlj7gM7YM+6Dqby6J7oiwR/eN54QmbdmVLS4E1OeI9FN67eTgfA+pNzgHqoNBNhNhoTB0Edmv74jXjCfLVC4LoUg0qoI++pv9VpBMqoc7sEE4P7MuIdFOlrMG2UTI5eK9M+ByWuKKgjHdtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSs6K0v4Dz2xnt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 22:20:41 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cSLY33Jfxz9sfr;
	Thu, 18 Sep 2025 18:23:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-SAwV3r0x5Y; Thu, 18 Sep 2025 18:23:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cSLY249Jdz9sfj;
	Thu, 18 Sep 2025 18:23:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7E49F8B767;
	Thu, 18 Sep 2025 18:23:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id pGYRopBfxKG1; Thu, 18 Sep 2025 18:23:34 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BBF8E8B778;
	Thu, 18 Sep 2025 18:23:33 +0200 (CEST)
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
	devicetree@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v6 2/7] soc: fsl: qe: Change GPIO driver to a proper platform driver
Date: Thu, 18 Sep 2025 18:23:22 +0200
Message-ID: <b0b4480255569c7f0dfe58854a444f9a40da6681.1758212309.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1758212309.git.christophe.leroy@csgroup.eu>
References: <cover.1758212309.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758212605; l=4799; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=JPKAv81IjiGNw3TMzw+WVRovmT/FOWbfetWem9cmBzI=; b=9qbHdo/P81nMONTzCCSudErSniguq5Eb0y1BmQthiMKsaulHldEoExoiWx59usw/R3X7sDvgV mWeQfQrbtI0BRJXNaXw2Tw2/sa8eumjtQasowcu8pCmIwSkJuFC/ou1
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In order to be able to add interrupts to the GPIOs, first change the
QE GPIO driver to the proper platform driver in order to allow
initialisation to be done in the right order, otherwise the GPIOs
get added before the interrupts are registered.

Remove linux/of.h and linux/property.h which are unused.

And to improve readability and reduce risk of errors, add a macro to
transform a pin number into the mask that matches the associated bit
in registers.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/gpio.c | 98 +++++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 45 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 8df1e8fa86a5..04b44fc2bb58 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -12,16 +12,17 @@
 #include <linux/spinlock.h>
 #include <linux/err.h>
 #include <linux/io.h>
-#include <linux/of.h>
 #include <linux/gpio/legacy-of-mm-gpiochip.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
 #include <linux/export.h>
-#include <linux/property.h>
+#include <linux/platform_device.h>
 
 #include <soc/fsl/qe/qe.h>
 
+#define PIN_MASK(gpio) (1UL << (QE_PIO_PINS - 1 - (gpio)))
+
 struct qe_gpio_chip {
 	struct of_mm_gpio_chip mm_gc;
 	spinlock_t lock;
@@ -52,7 +53,7 @@ static int qe_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct qe_pio_regs __iomem *regs = mm_gc->regs;
-	u32 pin_mask = 1 << (QE_PIO_PINS - 1 - gpio);
+	u32 pin_mask = PIN_MASK(gpio);
 
 	return !!(ioread32be(&regs->cpdata) & pin_mask);
 }
@@ -63,7 +64,7 @@ static int qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
 	struct qe_pio_regs __iomem *regs = mm_gc->regs;
 	unsigned long flags;
-	u32 pin_mask = 1 << (QE_PIO_PINS - 1 - gpio);
+	u32 pin_mask = PIN_MASK(gpio);
 
 	spin_lock_irqsave(&qe_gc->lock, flags);
 
@@ -95,9 +96,9 @@ static int qe_gpio_set_multiple(struct gpio_chip *gc,
 			break;
 		if (__test_and_clear_bit(i, mask)) {
 			if (test_bit(i, bits))
-				qe_gc->cpdata |= (1U << (QE_PIO_PINS - 1 - i));
+				qe_gc->cpdata |= PIN_MASK(i);
 			else
-				qe_gc->cpdata &= ~(1U << (QE_PIO_PINS - 1 - i));
+				qe_gc->cpdata &= ~PIN_MASK(i);
 		}
 	}
 
@@ -295,45 +296,52 @@ void qe_pin_set_gpio(struct qe_pin *qe_pin)
 }
 EXPORT_SYMBOL(qe_pin_set_gpio);
 
-static int __init qe_add_gpiochips(void)
+static int qe_gpio_probe(struct platform_device *ofdev)
 {
-	struct device_node *np;
-
-	for_each_compatible_node(np, NULL, "fsl,mpc8323-qe-pario-bank") {
-		int ret;
-		struct qe_gpio_chip *qe_gc;
-		struct of_mm_gpio_chip *mm_gc;
-		struct gpio_chip *gc;
-
-		qe_gc = kzalloc(sizeof(*qe_gc), GFP_KERNEL);
-		if (!qe_gc) {
-			ret = -ENOMEM;
-			goto err;
-		}
+	struct device *dev = &ofdev->dev;
+	struct device_node *np = dev->of_node;
+	struct qe_gpio_chip *qe_gc;
+	struct of_mm_gpio_chip *mm_gc;
+	struct gpio_chip *gc;
 
-		spin_lock_init(&qe_gc->lock);
-
-		mm_gc = &qe_gc->mm_gc;
-		gc = &mm_gc->gc;
-
-		mm_gc->save_regs = qe_gpio_save_regs;
-		gc->ngpio = QE_PIO_PINS;
-		gc->direction_input = qe_gpio_dir_in;
-		gc->direction_output = qe_gpio_dir_out;
-		gc->get = qe_gpio_get;
-		gc->set = qe_gpio_set;
-		gc->set_multiple = qe_gpio_set_multiple;
-
-		ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
-		if (ret)
-			goto err;
-		continue;
-err:
-		pr_err("%pOF: registration failed with status %d\n",
-		       np, ret);
-		kfree(qe_gc);
-		/* try others anyway */
-	}
-	return 0;
+	qe_gc = devm_kzalloc(dev, sizeof(*qe_gc), GFP_KERNEL);
+	if (!qe_gc)
+		return -ENOMEM;
+
+	spin_lock_init(&qe_gc->lock);
+
+	mm_gc = &qe_gc->mm_gc;
+	gc = &mm_gc->gc;
+
+	mm_gc->save_regs = qe_gpio_save_regs;
+	gc->ngpio = QE_PIO_PINS;
+	gc->direction_input = qe_gpio_dir_in;
+	gc->direction_output = qe_gpio_dir_out;
+	gc->get = qe_gpio_get;
+	gc->set = qe_gpio_set;
+	gc->set_multiple = qe_gpio_set_multiple;
+
+	return of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
+}
+
+static const struct of_device_id qe_gpio_match[] = {
+	{
+		.compatible = "fsl,mpc8323-qe-pario-bank",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, qe_gpio_match);
+
+static struct platform_driver qe_gpio_driver = {
+	.probe		= qe_gpio_probe,
+	.driver		= {
+		.name	= "qe-gpio",
+		.of_match_table	= qe_gpio_match,
+	},
+};
+
+static int __init qe_gpio_init(void)
+{
+	return platform_driver_register(&qe_gpio_driver);
 }
-arch_initcall(qe_add_gpiochips);
+arch_initcall(qe_gpio_init);
-- 
2.49.0


