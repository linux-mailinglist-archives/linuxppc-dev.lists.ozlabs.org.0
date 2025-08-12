Return-Path: <linuxppc-dev+bounces-10874-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CCFB22B07
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 16:50:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1ZDx4qx8z2xWc;
	Wed, 13 Aug 2025 00:50:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755010241;
	cv=none; b=c7hehyX99LVfKHSVeD4QMX4FvEFku3ms1XyHPwuplsCEnAnkAi5SQjYA1OcENlQYT+9NnZohb8ZhHU6wtczDsMYVFRoqVS9baSvp9IyTkHl0RvUDEx7K/v5H0fdGSuh0U7oxrcrjOx9gXhmol5HAaqODMPHvTfCx3N/ClEWjiz+QYPKs4zGc+6zd3oJmoK2oI2CCX5Z925AjGKywWPvgkqZCQF5wk0ZX8dTnrb62vNpMbJ3Ir6Mv2iOT1PviWJKEVpPMnliG/liykHSxViE9Ikcw9P6D0CECHSdJxlK5mJKcRHI9OxsYBC9oLt6LE54MH0VF3pdu8xi2LvGAksZrUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755010241; c=relaxed/relaxed;
	bh=O8n6bDh4FZgkURMOCPjf6gdU5zRoop7LpjSpVYCLjO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YeScGaJQoLRsXQP7McSVY0lsZkJdJwkxHftrenpyv1i/24Tf3vkUY+3DQrYjgk1eYD34OT5gjl1izVqRpPNXhfDtmYUnCJZ0g5HPgqOBZh1/lAcH+1fItmW11vddW8JYXkQlnsGhH+W9W45IH0kUX30tJDuu79EltO/GO+zUXrWSgZZsQznLUWEJ1YUiCJmPjBUiYVxg2e9jg7r9yEWZZCzTXVtDFFpgASs+cfybD0zsHmtYEJaIN/PLPQkjWPwPYxY6IynOsLGDjZPVBj+zNWelNfbHgc/oLWIAI27I5f//WbPRP0y3XVAhbl2MBVVOUzlqXPiTiw3zdfR3AdoQIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1ZDw5n33z2xPw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 00:50:40 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c1TBP1bFMz9sSt;
	Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id THilcENmYILV; Tue, 12 Aug 2025 13:03:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c1TBN4pjRz9sSs;
	Tue, 12 Aug 2025 13:03:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 902498B765;
	Tue, 12 Aug 2025 13:03:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id XDZeo0gya3AY; Tue, 12 Aug 2025 13:03:08 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EAD738B764;
	Tue, 12 Aug 2025 13:03:07 +0200 (CEST)
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
Subject: [PATCH 2/4] soc: fsl: qe: Change GPIO driver to a proper platform driver
Date: Tue, 12 Aug 2025 13:02:52 +0200
Message-ID: <f4d04d0c9d72d089af7490c6ce91bb4c455fbffd.1754996033.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754996575; l=3238; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=VYssVgP/HSCvUsH61iWhixO+M16MVUEty2f4L9mgniA=; b=iodPhBkh8iWD/od14mpEwzyP2AImC5CmU51Db62oh3CqMDvFaocRNpunshUxSvRzZ/wMVVWaw WMzyeRAJqalAHJY+M1Y8ugaWisKOtZ46bpCFGqhsP7ObMLulySbbKO+
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In order to be able to add interrupts to the GPIOs, first change the
QE GPIO driver to the proper platform driver in order to allow
initialisation to be done in the right order, otherwise the GPIOs
get added before the interrupts are registered.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/gpio.c | 88 +++++++++++++++++++++++----------------
 1 file changed, 53 insertions(+), 35 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 8df1e8fa86a5f..b502377193192 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -19,6 +19,7 @@
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <linux/property.h>
+#include <linux/platform_device.h>
 
 #include <soc/fsl/qe/qe.h>
 
@@ -295,45 +296,62 @@ void qe_pin_set_gpio(struct qe_pin *qe_pin)
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
+	int ret;
+	struct qe_gpio_chip *qe_gc;
+	struct of_mm_gpio_chip *mm_gc;
+	struct gpio_chip *gc;
+
+	qe_gc = kzalloc(sizeof(*qe_gc), GFP_KERNEL);
+	if (!qe_gc) {
+		ret = -ENOMEM;
+		goto err;
+	}
 
-		spin_lock_init(&qe_gc->lock);
+	spin_lock_init(&qe_gc->lock);
 
-		mm_gc = &qe_gc->mm_gc;
-		gc = &mm_gc->gc;
+	mm_gc = &qe_gc->mm_gc;
+	gc = &mm_gc->gc;
 
-		mm_gc->save_regs = qe_gpio_save_regs;
-		gc->ngpio = QE_PIO_PINS;
-		gc->direction_input = qe_gpio_dir_in;
-		gc->direction_output = qe_gpio_dir_out;
-		gc->get = qe_gpio_get;
-		gc->set = qe_gpio_set;
-		gc->set_multiple = qe_gpio_set_multiple;
+	mm_gc->save_regs = qe_gpio_save_regs;
+	gc->ngpio = QE_PIO_PINS;
+	gc->direction_input = qe_gpio_dir_in;
+	gc->direction_output = qe_gpio_dir_out;
+	gc->get = qe_gpio_get;
+	gc->set = qe_gpio_set;
+	gc->set_multiple = qe_gpio_set_multiple;
 
-		ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
-		if (ret)
-			goto err;
-		continue;
+	ret = of_mm_gpiochip_add_data(np, mm_gc, qe_gc);
+	if (!ret)
+		return 0;
 err:
-		pr_err("%pOF: registration failed with status %d\n",
-		       np, ret);
-		kfree(qe_gc);
-		/* try others anyway */
-	}
-	return 0;
+	dev_err(dev, "registration failed with status %d\n", ret);
+	kfree(qe_gc);
+
+	return ret;
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


