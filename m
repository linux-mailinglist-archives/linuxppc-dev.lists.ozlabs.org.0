Return-Path: <linuxppc-dev+bounces-11591-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB49B3EECE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 21:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFzxp61gkz2yys;
	Tue,  2 Sep 2025 05:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756756238;
	cv=none; b=lpQi+lFwV+W+WD6r5SQkiRIPjzVGCRE17MkY/9nebiMSrIpq4ftRha0VRSqrN6Gm7SbHz0JpaDANCqd/Xe8k3Cbx30wEa+4eofbjyPG5/qlmqZYzyLC42CqCfjduhbfDQPhbCgDEuHTPZsbAw5vHbD7XYA2QDYbg95plrcJkOOhk3VkczK9DW3Ss8hlcxmrDFje9E2ikl0yXiwvngBN4WS9hV/1Nch4+PoV1xsRldLVLw4GwWlbAtf+95mBE3tNXiFn+fLv2SHU2r7pShsPOHgGvIjtKuTwHMmqR5wSiSwC3RuVfqakfEiR007Pxy9p0XzGLd+5dzI+gtrXGv8vqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756756238; c=relaxed/relaxed;
	bh=9iW9GqJeabnoj2ZbnLX4Izkc8n16oSwp2JzekmlHdqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=asy6pigKD1q9718lio0GIfjsuEq6hHU4T23mNZ9QdxYpB+OLbVBRGSARR235ORtrn1Bt9KopLbD/oMIrX3ZN865xS6zVf7/Ezi68/4Lxaj9XwHEWCF1gcahs+Lfbr1RHp9SSKoKpDS+nzp+OY28GZDHPNSl9x4UwE36ZpSBL46L6CKEO1gdJ0dqIAe+XQN8fFmu6tqzODaiLnvv6YAJFqfxQda/ErqP+54h5fsiuEybvbXzGniDwAd+Q5VRVdTI2X3hsrqgCx/5dycXO4563lrtnm4e2Op4zdG+hqyuPTh9tJ4s+lt/uW63MCuLhPOS/EJcjl2icDgngqEuXTeoRRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFzxn0P3gz2yqW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 05:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cFndH59YJz9sT1;
	Mon,  1 Sep 2025 14:05:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I7IsBlKEXMdn; Mon,  1 Sep 2025 14:05:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cFndC4hv4z9sSp;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E5B78B796;
	Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id edUMA0anltQY; Mon,  1 Sep 2025 14:05:35 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A3228B77B;
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
	devicetree@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v5 4/7] soc: fsl: qe: Add support of IRQ in QE GPIO
Date: Mon,  1 Sep 2025 14:05:11 +0200
Message-ID: <1234b2b7105443654c5f2bb97d25cf16408d6003.1756727747.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756728308; l=6021; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=s8KjGqMF8kQALqNMwLbzLGaJh7U5Yszt7n4kjPjPFPY=; b=5Q0lKuhrQBfag3F7DCmjgG6MlKlaxMv0YyRWMF8h3A82sy9PbLmMLb+o/21C9Bt418k4hJ5m/ 6sPuEoVkJz7D1rfCaQRi8Vuo7IC6FUSSLs9q+m8UgwIgu9cYetjKS/I
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In the QE, a few GPIOs have an associated IRQ to notify changes.
Add IRQ support to QE GPIO.

As not all GPIOs have an associated IRQ, the driver needs to know
to which GPIO corresponds each provided IRQ. This is provided via
multiple compatible properties:

	compatible = "fsl,mpc8323-qe-pario-bank-a"
	compatible = "fsl,mpc8323-qe-pario-bank-b"
	compatible = "fsl,mpc8323-qe-pario-bank-c"

	compatible = "fsl,mpc8360-qe-pario-bank-a"
	compatible = "fsl,mpc8360-qe-pario-bank-b"
	compatible = "fsl,mpc8360-qe-pario-bank-c"
	compatible = "fsl,mpc8360-qe-pario-bank-d"
	compatible = "fsl,mpc8360-qe-pario-bank-e"
	compatible = "fsl,mpc8360-qe-pario-bank-f"
	compatible = "fsl,mpc8360-qe-pario-bank-g"

	compatible = "fsl,mpc8568-qe-pario-bank-a"
	compatible = "fsl,mpc8568-qe-pario-bank-b"
	compatible = "fsl,mpc8568-qe-pario-bank-c"
	compatible = "fsl,mpc8568-qe-pario-bank-d"
	compatible = "fsl,mpc8568-qe-pario-bank-e"
	compatible = "fsl,mpc8568-qe-pario-bank-f"

When not using IRQ and for banks having no IRQ (like bank D on mpc8323)
the origin compatible = "fsl,mpc8323-qe-pario-bank" is sufficient.

Here is an exemple for port B of mpc8323 which has IRQs for
GPIOs PB7, PB9, PB25 and PB27.

	qe_pio_b: gpio-controller@1418 {
		compatible = "fsl,mpc8323-qe-pario-bank-b";
		reg = <0x1418 0x18>;
		interrupts = <4 5 6 7>;
		interrupt-parent = <&qepic>;
		gpio-controller;
		#gpio-cells = <2>;
	};

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v5: Provide the mask via the compatible data instead of adding a property in device tree
---
 drivers/soc/fsl/qe/gpio.c | 72 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index c54154b404df..8632b0d37255 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -12,6 +12,7 @@
 #include <linux/spinlock.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/of_irq.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
@@ -32,6 +33,8 @@ struct qe_gpio_chip {
 
 	/* saved_regs used to restore dedicated functions */
 	struct qe_pio_regs saved_regs;
+
+	int irq[QE_PIO_PINS];
 };
 
 static void qe_gpio_save_regs(struct qe_gpio_chip *qe_gc)
@@ -135,6 +138,13 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
+static int qe_gpio_to_irq(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
+
+	return qe_gc->irq[gpio] ? : -ENXIO;
+}
+
 struct qe_pin {
 	/*
 	 * The qe_gpio_chip name is unfortunate, we should change that to
@@ -295,6 +305,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	struct device_node *np = dev->of_node;
 	struct qe_gpio_chip *qe_gc;
 	struct gpio_chip *gc;
+	u32 mask;
 
 	qe_gc = devm_kzalloc(dev, sizeof(*qe_gc), GFP_KERNEL);
 	if (!qe_gc)
@@ -302,6 +313,15 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 
 	spin_lock_init(&qe_gc->lock);
 
+	mask = (u32)of_device_get_match_data(dev);
+	if (mask) {
+		int i, j;
+
+		for (i = 0, j = 0; i < ARRAY_SIZE(qe_gc->irq); i++)
+			if (mask & PIN_MASK(i))
+				qe_gc->irq[i] = irq_of_parse_and_map(np, j++);
+	}
+
 	gc = &qe_gc->gc;
 
 	gc->base = -1;
@@ -311,6 +331,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	gc->get = qe_gpio_get;
 	gc->set = qe_gpio_set;
 	gc->set_multiple = qe_gpio_set_multiple;
+	gc->to_irq = qe_gpio_to_irq;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 
@@ -330,6 +351,57 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 static const struct of_device_id qe_gpio_match[] = {
 	{
 		.compatible = "fsl,mpc8323-qe-pario-bank",
+	}, {
+		.compatible = "fsl,mpc8323-qe-pario-bank-a",
+		.data = (void *)(PIN_MASK(8) | PIN_MASK(10) | PIN_MASK(26) | PIN_MASK(28)),
+	}, {
+		.compatible = "fsl,mpc8323-qe-pario-bank-b",
+		.data = (void *)(PIN_MASK(7) | PIN_MASK(9) | PIN_MASK(25) | PIN_MASK(27)),
+	}, {
+		.compatible = "fsl,mpc8323-qe-pario-bank-c",
+		.data = (void *)(PIN_MASK(24) | PIN_MASK(29)),
+	}, {
+		.compatible = "fsl,mpc8360-qe-pario-bank-a",
+		.data = (void *)(PIN_MASK(15) | PIN_MASK(16) | PIN_MASK(29) | PIN_MASK(30)),
+	}, {
+		.compatible = "fsl,mpc8360-qe-pario-bank-b",
+		.data = (void *)(PIN_MASK(3) | PIN_MASK(5) | PIN_MASK(12) | PIN_MASK(13) |
+				 PIN_MASK(26) | PIN_MASK(27)),
+	}, {
+		.compatible = "fsl,mpc8360-qe-pario-bank-c",
+		.data = (void *)(PIN_MASK(27) | PIN_MASK(28) | PIN_MASK(29)),
+	}, {
+		.compatible = "fsl,mpc8360-qe-pario-bank-d",
+		.data = (void *)(PIN_MASK(12) | PIN_MASK(13) | PIN_MASK(16) | PIN_MASK(17) |
+				 PIN_MASK(26) | PIN_MASK(27)),
+	}, {
+		.compatible = "fsl,mpc8360-qe-pario-bank-e",
+		.data = (void *)(PIN_MASK(12) | PIN_MASK(13) | PIN_MASK(24) | PIN_MASK(25) |
+				 PIN_MASK(26) | PIN_MASK(27) | PIN_MASK(31)),
+	}, {
+		.compatible = "fsl,mpc8360-qe-pario-bank-f",
+		.data = (void *)(PIN_MASK(20)),
+	}, {
+		.compatible = "fsl,mpc8360-qe-pario-bank-g",
+		.data = (void *)(PIN_MASK(31)),
+	}, {
+		.compatible = "fsl,mpc8568-qe-pario-bank-a",
+		.data = (void *)(PIN_MASK(22) | PIN_MASK(23)),
+	}, {
+		.compatible = "fsl,mpc8568-qe-pario-bank-b",
+		.data = (void *)(PIN_MASK(12) | PIN_MASK(13) | PIN_MASK(28) | PIN_MASK(29)),
+	}, {
+		.compatible = "fsl,mpc8568-qe-pario-bank-c",
+		.data = (void *)(PIN_MASK(16) | PIN_MASK(17) | PIN_MASK(25) | PIN_MASK(26)),
+	}, {
+		.compatible = "fsl,mpc8568-qe-pario-bank-d",
+		.data = (void *)(PIN_MASK(18) | PIN_MASK(19)),
+	}, {
+		.compatible = "fsl,mpc8568-qe-pario-bank-e",
+		.data = (void *)(PIN_MASK(12) | PIN_MASK(16) | PIN_MASK(30)),
+	}, {
+		.compatible = "fsl,mpc8568-qe-pario-bank-f",
+		.data = (void *)(PIN_MASK(12) | PIN_MASK(16) | PIN_MASK(30)),
 	},
 	{},
 };
-- 
2.49.0


