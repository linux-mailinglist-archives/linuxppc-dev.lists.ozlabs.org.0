Return-Path: <linuxppc-dev+bounces-11260-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D62C8B3464B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 17:50:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9Zy541ncz3cky;
	Tue, 26 Aug 2025 01:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756137037;
	cv=none; b=QffjSyi38fOazZaUt7GdqawUrs/vAULY0a3gPd4cxGFwN7uKmfetc9os82qFlzqvTPIzBeTBCSkuRW/BEQYnaqMPyXXvj+YQWQ4LdBkrp+80peyc+xays6+CJPTqXqWif4gQcwiDL58e7obtKUi2nalnnAq9/oAa+5VW8pSLgQnQXVJ1ez00Yil6slnyIumujOOhaVwiK7KyUluhlONi2MHgn6WV0Jx4FDzc4MSCIihU6Y2SmLQZZ/gD7AcMlm0nIQKcrTIppcbJkYM/sQLicJeGuStNKnDu46LQiHAYYbJL7aRfmgA4az2z+QfnkBEPAi+wDwMti0Mkk4/DqjZmhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756137037; c=relaxed/relaxed;
	bh=BhENlcfkNwyDufaRiGgcBZWw5IjhSNkLtITka6qKf/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NcWB805ISPpQmkTosznXKhq2j33wzcCD0dotukzFNdQh/3BeSfzB3RiTjceKRSHWUZdbWydVkIU4eFko9mbQDoBOdzcCBtd0DoMOkClZJz65UUsO0dWwKXxghk+nm2EIkhn869bLmpu+yQh4X4fHP517IG2kChtVhFsqdvVi3O9fl3KgGASTWllR/1bZLcz6ok/m2UiGKAarRiCUHJEeEsGN/pcckoOT/oLycYvzhqtpelXhDbyybwWhz0VKIOE+kl1m0o2E/HdeP9HpiiAhkeeWKcMLJo01T6Z5rNgo6O3q4CyywMLg/vnTSNyr6duZtpiGqx07xuyzZCwGGo9kuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9Zy46GjNz3ckk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 01:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c9M2D4bxpz9sSd;
	Mon, 25 Aug 2025 08:53:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4916ElkUcXer; Mon, 25 Aug 2025 08:53:24 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c9M292RWPz9sSV;
	Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3EDC08B769;
	Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4Ub9RjFzb6BR; Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0C4968B765;
	Mon, 25 Aug 2025 08:53:21 +0200 (CEST)
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
Subject: [PATCH v3 4/6] soc: fsl: qe: Add support of IRQ in QE GPIO
Date: Mon, 25 Aug 2025 08:53:19 +0200
Message-ID: <372550a2633586d2f98b077d3f520f3262ca0e2a.1756104334.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1756104334.git.christophe.leroy@csgroup.eu>
References: <cover.1756104334.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756104796; l=2710; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=73IQ37tskzYmvonToad8R3pHY7nT1ylYyENPfX+baes=; b=1Mw+uBZnRMBUW5TPgXymjz8dvEQOBdUgMzXytx0Smi78Dl04GaGVcXxpPem3A54R13AakQw75 tgt//oO2kqfDJlJRyyRuRIbhnogLScEB/ixa/LUl6Zzem4yDI49rlNw
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
		compatible = "fsl,mpc8323-qe-pario-bank";
		reg = <0x1418 0x18>;
		interrupts = <4 5 6 7>;
		interrupt-parent = <&qepic>;
		gpio-controller;
		#gpio-cells = <2>;
		fsl,qe-gpio-irq-mask = <0x01400050>;
	};

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/gpio.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

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


