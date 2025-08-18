Return-Path: <linuxppc-dev+bounces-11090-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE28AB2A733
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 15:50:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5Dct0k5sz3cZB;
	Mon, 18 Aug 2025 23:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755525038;
	cv=none; b=bs7lfeyq9WLSlRgQJFVh3wJeUoI+RK/+7/9Y+midRFujtwmdjK484QYaDbTYIJ9mlnaBY4ZSV7NkGSkU239MD7X8bKLdnEZsyDKbYnFh4jUT82C5jGkjlZXgA1R3N+VeSEWxLVjHG2INHaB6g2GBNwrgf7SXwPuDCBqr7fcp2lYPOSANFFLq2ZSY71C3ZdOR3EzzV1fn6efQG4VlyC0Suj/ys991Ay6KN9gViANx+vnhH/LY+mbk7YEJkGwrlqhI0Ng5QMJtOum/wiGJgJGH8uO+zZ27DOwfYbB19oO46wsvxPgesxm/XOe8tNBae3j4NtO8MPGs87qT4u9CYRa1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755525038; c=relaxed/relaxed;
	bh=dpLXhn2v+vs/vaCOQE3UDaJD8EnvB4cfcuUxM0/g/pE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YENGrZzotyJ8JSpU5Z5Q3fZ3cnFHfcp20GTWgx8z4fDydVq+Ck7uMgjoUFj2bhgTPxCFtCblhQFk2W/Qh7ZvbdF4lYW+5fZ+GNNSd5N8MiijD3wJ4qTFlvOmsToYeto2EpYsunzcheMqmE2affA9r1ByRK47OWpdBsBkArNoucSE+/ACS/I1nTIxzY75U8d0nx1OfKUHrvLmR7sIgkAtSqDGXoEmNpkdcQf2d2lvY3+YjYORZqxx4yK7VWSJxMBn28EyBGTnEQxA2w1AsXJzPLG59xECxU0vZ+TxQutnGKR8n1bHtc9sPWc3wZam4+yvryX69pQaJ5cxGD85Gp5AEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5Dcs1q02z3cYx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 23:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c5BYc10C8z9sV2;
	Mon, 18 Aug 2025 14:17:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfh_z7hGOAcT; Mon, 18 Aug 2025 14:17:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c5BYb6wb1z9sTs;
	Mon, 18 Aug 2025 14:17:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D7CAA8B765;
	Mon, 18 Aug 2025 14:17:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id FTlnGI7M_tX7; Mon, 18 Aug 2025 14:17:39 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A96458B763;
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
Subject: [PATCH 1/2] powerpc/44x: Change GPIO driver to a proper platform driver
Date: Mon, 18 Aug 2025 14:17:34 +0200
Message-ID: <29d89aa43536714b193d9710301341f838fcb5b7.1755519343.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755519455; l=2973; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=cL3azlX2WcUbptT06I7EQvmQRQpz1mAubjk1mSKGiHQ=; b=oV6fRiM5cvSD8PBNYa0SCOuMFiBdwEjJTKMdrwCBL393tvhEaYJhzzYqFZtkGCBXqtkifauUH Wiy2icUwLcPCMHogvqGSuG33hJ4UPXw+9FZUV2+JiCKUwqX2mKN/3Pn
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In order to drop legacy-of-mm-gpiochip dependency, first change the
44x GPIO driver to a proper platform driver.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/44x/gpio.c | 83 +++++++++++++++++--------------
 1 file changed, 46 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/platforms/44x/gpio.c b/arch/powerpc/platforms/44x/gpio.c
index 08ab76582568..a025b3248342 100644
--- a/arch/powerpc/platforms/44x/gpio.c
+++ b/arch/powerpc/platforms/44x/gpio.c
@@ -18,6 +18,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/types.h>
 #include <linux/slab.h>
+#include <linux/platform_device.h>
 
 #define GPIO_MASK(gpio)		(0x80000000 >> (gpio))
 #define GPIO_MASK2(gpio)	(0xc0000000 >> ((gpio) * 2))
@@ -155,42 +156,50 @@ ppc4xx_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
-static int __init ppc4xx_add_gpiochips(void)
+static int ppc4xx_gpio_probe(struct platform_device *ofdev)
 {
-	struct device_node *np;
-
-	for_each_compatible_node(np, NULL, "ibm,ppc4xx-gpio") {
-		int ret;
-		struct ppc4xx_gpio_chip *ppc4xx_gc;
-		struct of_mm_gpio_chip *mm_gc;
-		struct gpio_chip *gc;
-
-		ppc4xx_gc = kzalloc(sizeof(*ppc4xx_gc), GFP_KERNEL);
-		if (!ppc4xx_gc) {
-			ret = -ENOMEM;
-			goto err;
-		}
-
-		spin_lock_init(&ppc4xx_gc->lock);
-
-		mm_gc = &ppc4xx_gc->mm_gc;
-		gc = &mm_gc->gc;
-
-		gc->ngpio = 32;
-		gc->direction_input = ppc4xx_gpio_dir_in;
-		gc->direction_output = ppc4xx_gpio_dir_out;
-		gc->get = ppc4xx_gpio_get;
-		gc->set = ppc4xx_gpio_set;
-
-		ret = of_mm_gpiochip_add_data(np, mm_gc, ppc4xx_gc);
-		if (ret)
-			goto err;
-		continue;
-err:
-		pr_err("%pOF: registration failed with status %d\n", np, ret);
-		kfree(ppc4xx_gc);
-		/* try others anyway */
-	}
-	return 0;
+	struct device *dev = &ofdev->dev;
+	struct device_node *np = dev->of_node;
+	struct ppc4xx_gpio_chip *chip;
+	struct of_mm_gpio_chip *mm_gc;
+	struct gpio_chip *gc;
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	spin_lock_init(&chip->lock);
+
+	mm_gc = &chip->mm_gc;
+	gc = &mm_gc->gc;
+
+	gc->ngpio = 32;
+	gc->direction_input = ppc4xx_gpio_dir_in;
+	gc->direction_output = ppc4xx_gpio_dir_out;
+	gc->get = ppc4xx_gpio_get;
+	gc->set = ppc4xx_gpio_set;
+
+	return of_mm_gpiochip_add_data(np, mm_gc, chip);
+}
+
+static const struct of_device_id ppc4xx_gpio_match[] = {
+	{
+		.compatible = "ibm,ppc4xx-gpio",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, ppc4xx_gpio_match);
+
+static struct platform_driver ppc4xx_gpio_driver = {
+	.probe		= ppc4xx_gpio_probe,
+	.driver		= {
+		.name	= "ppc4xx-gpio",
+		.of_match_table	= ppc4xx_gpio_match,
+	},
+};
+
+static int __init ppc4xx_gpio_init(void)
+{
+	return platform_driver_register(&ppc4xx_gpio_driver);
 }
-arch_initcall(ppc4xx_add_gpiochips);
+arch_initcall(ppc4xx_gpio_init);
-- 
2.49.0


