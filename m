Return-Path: <linuxppc-dev+bounces-11119-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEADDB2BE00
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 11:50:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5lFW2pnRz3d0s;
	Tue, 19 Aug 2025 19:50:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755597039;
	cv=none; b=i3aTNc2yTWI+7YRw8G7WmNDzAi/pVXIWKjKcUN/GQfUf8GI7+mTMS4I3tYrxzQf8xVo7aoATd5AtV2+UhJT3QfudqSj57BvxqOPMJM207BV4nP5eDQSTFFLDymKvpVi2Dqbbm4BpuiMnr5iHCCuMaaDKKJ7oPbEq2llVPywVlhFjyTlSfqzQQVcaL6F2SoQazm6YRHAF66r4ZwZ2bH5xS1I/qwS+3p+s86b/N9qm4jV6n6mBsqXBgayP1VH0i3FGVi2lEZqLapXSPZQ86WR8jKkZuCc9xCkc8PerSo77TDBYeA+YfZdqsWZYKegmpyOhTTFmMHuYS74ShlQqcQ2z5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755597039; c=relaxed/relaxed;
	bh=G33qec1A/DXZMt9q0GxW2rwRhVixwokeGAfVQ7PwBrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MGrQdQxfJia6GiLvp5ng9jJiP1ovIoASZfhje0G73jXFJ+z9je1hhmRyKjeHFpn9GtlowLcagBnCJGCC4NPJUWxxuZgbtiWqjZ30jWG1ugFD2SyLxUETNVP0qqwevmuv4zZ63Qt4xUnCKZTMGO7GTwYQjL2l/rL8fcdktYVxyOzPFEndm83QqYC7A83+owT59sdzMqTrH+/HFpaXgsZi2iEajLsxJGBv71gkvOm/7Uqu4X5MOuwX1kpg5DdLP37js/aBbLSSTSXzc/5mhSgXycIDKU5mOjXLVsHb2dnOwte0kH8VA6SZDKa3AqffLaDxJ6TWKqNwDFwSvHO9f8FSxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5lFV5drDz3cyc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 19:50:38 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55sd6fBxz9sX3;
	Mon, 18 Aug 2025 10:46:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lbLLFka9tjxC; Mon, 18 Aug 2025 10:46:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55sZ11XFz9sWn;
	Mon, 18 Aug 2025 10:46:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0D93C8B766;
	Mon, 18 Aug 2025 10:46:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id YFmZUm584ZmT; Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CF60C8B763;
	Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
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
Subject: [PATCH v2 4/5] soc: fsl: qe: Add support of IRQ in QE GPIO
Date: Mon, 18 Aug 2025 10:45:57 +0200
Message-ID: <cddc5e900b84826614a63b8b29a048c09dd20853.1755506608.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1755506608.git.christophe.leroy@csgroup.eu>
References: <cover.1755506608.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755506759; l=4414; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=KAXI/UdG1uKmQEqjT0xzFF6ZLrXwXMHk7giEW1/cpwI=; b=MW/ze3K9TK2iL0/rORULbghAvqryKWrfqy6TLbLvD5VVeZnLqeWtR7lBIzwSXSaoZHM8JT18w /wsaAaaP1BTDABTihOHtotOGJXdkcCKIOkhkfqAHIOgpIegdhqYENi+
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In the QE, a few GPIOs are IRQ capable. Similarly to
commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
GPIO"), add IRQ support to QE GPIO.

Add property 'fsl,qe-gpio-irq-mask' similar to
'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.

Here is an exemple for port B of mpc8323 which has IRQs for
GPIOs PB7, PB9, PB25 and PB27.

	qe_pio_b: gpio-controller@1418 {
		#gpio-cells = <2>;
		compatible = "fsl,mpc8323-qe-pario-bank";
		reg = <0x1418 0x18>;
		interrupts = <4 5 6 7>;
		fsl,qe-gpio-irq-mask = <0x01400050>;
		interrupt-parent = <&qepic>;
		gpio-controller;
	};

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Document fsl,qe-gpio-irq-mask
---
 .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 19 ++++++++++++++++++
 drivers/soc/fsl/qe/gpio.c                     | 20 +++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
index 09b1b05fa677..9cd6e5ac2a7b 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
@@ -32,6 +32,15 @@ Required properties:
   "fsl,mpc8323-qe-pario-bank".
 - reg : offset to the register set and its length.
 - gpio-controller : node to identify gpio controllers.
+Optional properties:
+- fsl,qe-gpio-irq-mask : For banks having interrupt capability this item tells
+  which ports have an associated interrupt (ports are listed in the same order
+  QE ports registers)
+- interrupts : This property provides the list of interrupt for each GPIO having
+  one as described by the fsl,cpm1-gpio-irq-mask property. There should be as
+  many interrupts as number of ones in the mask property. The first interrupt in
+  the list corresponds to the most significant bit of the mask.
+- interrupt-parent : Parent for the above interrupt property.
 
 Example:
 	qe_pio_a: gpio-controller@1400 {
@@ -42,6 +51,16 @@ Example:
 		gpio-controller;
 	  };
 
+	qe_pio_b: gpio-controller@1418 {
+		#gpio-cells = <2>;
+		compatible = "fsl,mpc8323-qe-pario-bank";
+		reg = <0x1418 0x18>;
+		interrupts = <4 5 6 7>;
+		fsl,qe-gpio-irq-mask = <0x01400050>;
+		interrupt-parent = <&qepic>;
+		gpio-controller;
+	  };
+
 	qe_pio_e: gpio-controller@1460 {
 		#gpio-cells = <2>;
 		compatible = "fsl,mpc8360-qe-pario-bank",
diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index a338469cebe4..91d469403126 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -13,6 +13,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
@@ -32,6 +33,8 @@ struct qe_gpio_chip {
 
 	/* saved_regs used to restore dedicated functions */
 	struct qe_pio_regs saved_regs;
+
+	int irq[32];
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
@@ -302,6 +313,14 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 
 	spin_lock_init(&qe_gc->lock);
 
+	if (!of_property_read_u32(np, "fsl,qe-gpio-irq-mask", &mask)) {
+		int i, j;
+
+		for (i = 0, j = 0; i < ARRAY_SIZE(qe_gc->irq); i++)
+			if (mask & (1 << (31 - i)))
+				qe_gc->irq[i] = irq_of_parse_and_map(np, j++);
+	}
+
 	gc = &qe_gc->gc;
 
 	gc->base = -1;
@@ -311,6 +330,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	gc->get = qe_gpio_get;
 	gc->set = qe_gpio_set;
 	gc->set_multiple = qe_gpio_set_multiple;
+	gc->to_irq = qe_gpio_to_irq;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 
-- 
2.49.0


