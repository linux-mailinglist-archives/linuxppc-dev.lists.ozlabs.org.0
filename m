Return-Path: <linuxppc-dev+bounces-11078-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 345D6B29D7C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 11:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c56dN4lb6z3bn8;
	Mon, 18 Aug 2025 19:20:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755508840;
	cv=none; b=Lpy5KySNLB5lmH3bBJZbCP1U43TaUd6n5wldNcCvXzbzpZY2I5X97VwRyiVvCb9YjCfvsEERY6N+4kFXO77U2tNaHUT3AYlvfNPAmjnvmpg4RCwDI7fb6sHEFO1UPFF2/Fjb2ATTLFLGuAwk896q1nIbJf3Uj9mP7wg5ynIfqPRyuDOtWdj95jwNoklJssmfsgAscfL+2IVrpf+C9vS7Bw4F5xHb4Z/zZQDUqf/+j7bBoNuY6Bhs3BCdCcdgcv30cVjePaYPh3m3xhN+6F4LtUR/Ivf0ORJ+z5i6T6db6xE0yXoinxohUlbF0KJwEF/yhLzScaJZsYaAV4bGPU3z/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755508840; c=relaxed/relaxed;
	bh=rfrcOadjj+5auBUnuI0XCrOeQQGJHs2AH2M6B9EosPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOJO/ysIljTJ44TCixeAwUJU75r8u/mkkRDUdGT6Nclz4QSnMDA7T/UY0W8ludYKKMiCldcwQEKt532zUIZ2izXdL7+ARYIa/DXpmhnaBX7FjI/mMJzei/7qVfYp9eaOLObn+JBYD1yWrEGwdysHefrR+51eflsnhx2sy3yvd5wOAoxIZZbYssBx7mZEIsmnzYRWLxadPnrUVqu9eqyZ4vx/D9KLFdTUi7r3Aw01GXMVo7QxX9/XJRUj5SniJTVEG/MtW8Rm8iG5kgLkSo+RgkyvC1dIvponJ3vKZ6Vo2/t2jniZkAks+SA/x1RIj1HhidDUQbBJDNWON1elkZe7Kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c56dK4XNyz3bn4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 19:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55sc2n60z9sX2;
	Mon, 18 Aug 2025 10:46:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5yhzdcCd9cYr; Mon, 18 Aug 2025 10:46:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55sZ07nwz9sWm;
	Mon, 18 Aug 2025 10:46:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E2A588B765;
	Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vns69XugoAlV; Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AFEEF8B764;
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
Subject: [PATCH v2 3/5] soc: fsl: qe: Drop legacy-of-mm-gpiochip.h header from GPIO driver
Date: Mon, 18 Aug 2025 10:45:56 +0200
Message-ID: <ad5d6bfb189e260dbfda160d087a203d8a68b0c4.1755506608.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755506759; l=7343; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=71KPdI4+YFoLm/OfDlnRkk1s5xf+3TgUC7cT9RMRHUM=; b=uLPKXf9NshSiWxr6TU/TtnUKKebgXkRyN2MxNbWt7oMRNnZJNZ08ev4AXPWTa3SwmAwFMervp iJhwzk0GN49BE+t4v0u0UDf53h0vc4dJRBybudsYRBREJNV9K81yyCz
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
v2: New
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
index 93fcc6d85ac7..a338469cebe4 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -13,7 +13,6 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/gpio/legacy-of-mm-gpiochip.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
@@ -24,7 +23,8 @@
 #include <soc/fsl/qe/qe.h>
 
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
 	u32 pin_mask = 1 << (QE_PIO_PINS - 1 - gpio);
 
 	return !!(ioread32be(&regs->cpdata) & pin_mask);
@@ -60,9 +58,8 @@ static int qe_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 
 static int qe_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct qe_gpio_chip *qe_gc = gpiochip_get_data(gc);
-	struct qe_pio_regs __iomem *regs = mm_gc->regs;
+	struct qe_pio_regs __iomem *regs = qe_gc->regs;
 	unsigned long flags;
 	u32 pin_mask = 1 << (QE_PIO_PINS - 1 - gpio);
 
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


