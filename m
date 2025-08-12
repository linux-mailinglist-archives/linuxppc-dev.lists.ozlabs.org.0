Return-Path: <linuxppc-dev+bounces-10903-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D533B23C3C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 01:20:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1nYR38qYz2xQ1;
	Wed, 13 Aug 2025 09:20:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755040843;
	cv=none; b=ePqxbMmHH67JgLfo+LHe5COTAhpIb25yP5UWe8xfu9KNYpHcEfmBy6zVDkY3E2r+R/74MeEbhPwxtvSvb9KhQwSI+a4wgx+YMBs9ajVGjoT/5qGffNqqkxGdWWcbxaTiDHa0KQIOgFq1UZ8E2pShnw97ZvUhKyU03cK3dXmx5KRBhMz7DaKJGIhiSZu3s6jHmp3RYl4sTiPVP6G7fJEUEwtFSPayeDxp3ikhCKl4MkJyHbvNQD4w3nT+8R51xmlY6Os7uyKB26KyynLSBY1KAmFcoEDudbaNc/nQoIuYv8mN/XcyOazLXrNZAnfPlNuVGAv3NjoLbk1Pi0bFCzm/3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755040843; c=relaxed/relaxed;
	bh=J/e7BCTPOj0K5g9/rGyoNcj5brE4CClsNsTeSvBl9/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bK6x70bfqUD195MoMNiHy4yNuZHYlICEs/Qmpv1SJXSOsdNb77horD8CeFJloG/c0fBU257/kxIkpVUNJBZtKfENLM1WrgUkKB/sJwQ/uz2nGbbdhENnB4NZP3WjTfmwyXxIPfOR8VnmynRP8gap/yCzdx3n30GMiLsLifL9D14LUliodK+PpaXVa8o0jNsoQWl2O7Cn3UMtmQ51A/UZj68s9zxErY1UXHKUYWUwTSVDy+W6lpsb9QdKQpQjLWSFp0Q0KyouZZWcIxORY7vXK7qGFmdPEPpXDydx4YSm47O8MPGfiPocC+To0fBhxdNhIOyLZnVam5nJ7lU9QAPkHw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1nYQ6k6kz2xPy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 09:20:42 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c1TBQ0tRhz9sT0;
	Tue, 12 Aug 2025 13:03:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HXhLiS2jPwds; Tue, 12 Aug 2025 13:03:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c1TBP1dsHz9sSv;
	Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 259218B765;
	Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id RBmU6l3SUl_P; Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 86B4E8B763;
	Tue, 12 Aug 2025 13:03:08 +0200 (CEST)
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
Subject: [PATCH 3/4] soc: fsl: qe: Add support of IRQ in QE GPIO
Date: Tue, 12 Aug 2025 13:02:53 +0200
Message-ID: <22b3847fd0011024c10aff48f1e5223894ce718a.1754996033.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1754996033.git.christophe.leroy@csgroup.eu>
References: <cover.1754996033.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754996575; l=2725; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=v14Dk1KvyA4jB0LrdnvGbfGjnbuOs9htFoqSNoWkYtI=; b=dXtCrFHN514T4E/+vNSzepJEqiPBNmxYhnTflHs68WWX2CBvxIoCBh8xJ/qz54T5GIKOuB9uB 8/NM/UEmSe3CNdXNEgNpmWyRAEbLLMxt2jbdc7GgWwSqpsaS8xWZXxl
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
 drivers/soc/fsl/qe/gpio.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index b502377193192..59145652ad850 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -13,6 +13,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/gpio/legacy-of-mm-gpiochip.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
@@ -32,6 +33,8 @@ struct qe_gpio_chip {
 
 	/* saved_regs used to restore dedicated functions */
 	struct qe_pio_regs saved_regs;
+
+	int irq[32];
 };
 
 static void qe_gpio_save_regs(struct of_mm_gpio_chip *mm_gc)
@@ -141,6 +144,13 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
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
@@ -304,6 +314,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	struct qe_gpio_chip *qe_gc;
 	struct of_mm_gpio_chip *mm_gc;
 	struct gpio_chip *gc;
+	u32 mask;
 
 	qe_gc = kzalloc(sizeof(*qe_gc), GFP_KERNEL);
 	if (!qe_gc) {
@@ -313,6 +324,14 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 
 	spin_lock_init(&qe_gc->lock);
 
+	if (!of_property_read_u32(np, "fsl,qe-gpio-irq-mask", &mask)) {
+		int i, j;
+
+		for (i = 0, j = 0; i < 32; i++)
+			if (mask & (1 << (31 - i)))
+				qe_gc->irq[i] = irq_of_parse_and_map(np, j++);
+	}
+
 	mm_gc = &qe_gc->mm_gc;
 	gc = &mm_gc->gc;
 
@@ -323,6 +342,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	gc->get = qe_gpio_get;
 	gc->set = qe_gpio_set;
 	gc->set_multiple = qe_gpio_set_multiple;
+	gc->to_irq = qe_gpio_to_irq;
 
 	ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
 	if (!ret)
-- 
2.49.0


