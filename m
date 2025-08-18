Return-Path: <linuxppc-dev+bounces-11104-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8C6B2B1E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 21:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5NcG4qpdz3cgW;
	Tue, 19 Aug 2025 05:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755546638;
	cv=none; b=kcetTlPe5v9kJYkiEmTBrkXzi34rAkxOke3xp+samNmjYCdsWU4Hmu71D2U31K4MxuwXpECjxWh+MA7QhiNkJ5O6stTWV61mM32/TEM+H26kuYUVV3kDmDvbN0aMzVOCAL3pVpTsx+sw43CnpCzapF79GNkou11lZwaO1xYV5UqJqolOyAJ3pFDF9crsCqtd7i4uivEW7m9HMSRPgxULd0e6HJwPZ4dSILYEMeS15GXKeP6uo8MD6kkcFJ//8pB8qSOsd06GqGqxJ4kHFDu6sAviSFZrLBn18pjhrhUKJUHN0W159J5zuH+vB8ZNfT2bS4Q6IetuusK2If7QvJnnjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755546638; c=relaxed/relaxed;
	bh=GwXUHuW5lHiBitijhc/IX+d+bm9+/Ln5pfTojM9X4vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KBbeV9AZE+nKUySuWd5QVz0hmP6Jkz3RnetxXMLhovAcW12ID3PoLvbsrdjk1iYDD4l83vs28Fe7+BtQ9j27mh3ZAomUCE9nidxbA2lv1wEV3h8O7KAPbFqkqBUFnDhJYXBOW7KJGA0iWv5rerTKhYQHi/VrR1+N6vfoyqmduf19z/OLT4Z7hmJcKgt3wDqicpDTcdM3M/gGmxYe1w7TBLqtO5478pFxknqxEuxlL3JGQeP9jph71flbZkM2OpyEQj6L0nidttcr7yeovTmrk0WmriJNgJ7XlzbwnaWb6MGfYySb7VqPdtANyV05RBI59WLb4WiP77zLSvmOclgAcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5NcF5J5Wz3cgV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 05:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c5BYd0rhsz9sV3;
	Mon, 18 Aug 2025 14:17:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUzjzR3pCnxq; Mon, 18 Aug 2025 14:17:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c5BYc0gBfz9sV0;
	Mon, 18 Aug 2025 14:17:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F2A748B763;
	Mon, 18 Aug 2025 14:17:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Ump101Aa9xV9; Mon, 18 Aug 2025 14:17:39 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C3BEB8B764;
	Mon, 18 Aug 2025 14:17:39 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] powerpc/44x: Drop legacy-of-mm-gpiochip.h header
Date: Mon, 18 Aug 2025 14:17:35 +0200
Message-ID: <2f8f16eac72b9ec202b6e593939b44308891a661.1755519343.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <29d89aa43536714b193d9710301341f838fcb5b7.1755519343.git.christophe.leroy@csgroup.eu>
References: <29d89aa43536714b193d9710301341f838fcb5b7.1755519343.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755519455; l=4820; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=PLM/65JvqNc3NilFjJ1vKDYuZPfhd7TFnkWsRNB/R5A=; b=Zjq/6FK9sXzyA80Ffb9ZnhDUHevV7VYAjbbUcFcnIkEAr3H0LvJ9wrxocZC5UcGLVp3Oh7hrV 3XC/VOwClHACT50kbShSMq0VXZqNlEjXjdKEW/gab6AUUSk0gOtmVyK
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

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/44x/Kconfig |  1 -
 arch/powerpc/platforms/44x/gpio.c  | 33 +++++++++++++++++-------------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/platforms/44x/Kconfig b/arch/powerpc/platforms/44x/Kconfig
index 35a1f4b9f827..fc79f8466933 100644
--- a/arch/powerpc/platforms/44x/Kconfig
+++ b/arch/powerpc/platforms/44x/Kconfig
@@ -231,7 +231,6 @@ config PPC4xx_GPIO
 	bool "PPC4xx GPIO support"
 	depends on 44x
 	select GPIOLIB
-	select OF_GPIO_MM_GPIOCHIP
 	help
 	  Enable gpiolib support for ppc440 based boards
 
diff --git a/arch/powerpc/platforms/44x/gpio.c b/arch/powerpc/platforms/44x/gpio.c
index a025b3248342..aea0d913b59d 100644
--- a/arch/powerpc/platforms/44x/gpio.c
+++ b/arch/powerpc/platforms/44x/gpio.c
@@ -14,7 +14,6 @@
 #include <linux/spinlock.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/gpio/legacy-of-mm-gpiochip.h>
 #include <linux/gpio/driver.h>
 #include <linux/types.h>
 #include <linux/slab.h>
@@ -46,7 +45,8 @@ struct ppc4xx_gpio {
 };
 
 struct ppc4xx_gpio_chip {
-	struct of_mm_gpio_chip mm_gc;
+	struct gpio_chip gc;
+	void __iomem *regs;
 	spinlock_t lock;
 };
 
@@ -58,8 +58,8 @@ struct ppc4xx_gpio_chip {
 
 static int ppc4xx_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct ppc4xx_gpio __iomem *regs = mm_gc->regs;
+	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
+	struct ppc4xx_gpio __iomem *regs = chip->regs;
 
 	return !!(in_be32(&regs->ir) & GPIO_MASK(gpio));
 }
@@ -67,8 +67,8 @@ static int ppc4xx_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 static inline void
 __ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct ppc4xx_gpio __iomem *regs = mm_gc->regs;
+	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
+	struct ppc4xx_gpio __iomem *regs = chip->regs;
 
 	if (val)
 		setbits32(&regs->or, GPIO_MASK(gpio));
@@ -94,9 +94,8 @@ static int ppc4xx_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 
 static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
-	struct ppc4xx_gpio __iomem *regs = mm_gc->regs;
+	struct ppc4xx_gpio __iomem *regs = chip->regs;
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -124,9 +123,8 @@ static int ppc4xx_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 static int
 ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
 	struct ppc4xx_gpio_chip *chip = gpiochip_get_data(gc);
-	struct ppc4xx_gpio __iomem *regs = mm_gc->regs;
+	struct ppc4xx_gpio __iomem *regs = chip->regs;
 	unsigned long flags;
 
 	spin_lock_irqsave(&chip->lock, flags);
@@ -161,7 +159,6 @@ static int ppc4xx_gpio_probe(struct platform_device *ofdev)
 	struct device *dev = &ofdev->dev;
 	struct device_node *np = dev->of_node;
 	struct ppc4xx_gpio_chip *chip;
-	struct of_mm_gpio_chip *mm_gc;
 	struct gpio_chip *gc;
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
@@ -170,16 +167,24 @@ static int ppc4xx_gpio_probe(struct platform_device *ofdev)
 
 	spin_lock_init(&chip->lock);
 
-	mm_gc = &chip->mm_gc;
-	gc = &mm_gc->gc;
+	gc = &chip->gc;
 
+	gc->base = -1;
 	gc->ngpio = 32;
 	gc->direction_input = ppc4xx_gpio_dir_in;
 	gc->direction_output = ppc4xx_gpio_dir_out;
 	gc->get = ppc4xx_gpio_get;
 	gc->set = ppc4xx_gpio_set;
 
-	return of_mm_gpiochip_add_data(np, mm_gc, chip);
+	gc->label = devm_kasprintf(dev, GFP_KERNEL, "%pOF", np);
+	if (!gc->label)
+		return -ENOMEM;
+
+	chip->regs = devm_of_iomap(dev, np, 0, NULL);
+	if (IS_ERR(chip->regs))
+		return PTR_ERR(chip->regs);
+
+	return devm_gpiochip_add_data(dev, gc, chip);
 }
 
 static const struct of_device_id ppc4xx_gpio_match[] = {
-- 
2.49.0


