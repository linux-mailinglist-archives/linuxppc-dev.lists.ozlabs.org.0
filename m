Return-Path: <linuxppc-dev+bounces-11317-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B015DB35A02
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 12:20:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB3Zw6J9tz3dSd;
	Tue, 26 Aug 2025 20:20:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756203640;
	cv=none; b=oW/RVwZ1mZPyORupTCf3ecPlcitzcDn/BiljrFFDjGrHwVU7TqNkLZtbKvVguz2zm2MDMHkHNZKUuzkgmxU6ZsXmbCCvOD2FD3bE1hBEMAkKTR5x4LN/RD+7+DTzp3iUIveew19Uy9VmADGWIprwas0c2M55I5WTr6gZ7Sb4l8UW6d3BWGJbR+bL3CDg/DR0TC/tdPjV8LFX98G37QzBeWyt1H4HYz7Qip7wrEPzqLKU4P1uw8qeGM5zwC+csyVYoDIx0NKEgoxuV2g/MbA7L6zxeK2vezBEA9OF15DBMD7mnVNxL/ZBNYWHsH3vrpWROWBISyPWgNWMN/16SObGrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756203640; c=relaxed/relaxed;
	bh=AJimymYaCoFEeEjNWPjbV6cVaUCvnHLeR3zgQ1DX2sA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BqG9acRmYmvdOcwALmYOTVK9Iu0idMmUGZa0SPyNnQEDh7/sx4MJlC/qVDLImfsHrqKwIpyfaPrfwMtui6x+pJpcw1nHwdMtlYlASyVFjUg9KTtI1YviwPSWM291ztRO0du5ZKDNRHothprWe/pgJ88On+5taJDQk+prmYTrNO75jIBlFMqQ4xaLn697pVWDXezgkYLr6la16WMh5NUPXgPmFS3msgmYt9vnHVVLhPin2htWCvtPMQsgwpRGxOp+Nm0wWlPLuIUyUQ+hnGPV/g8RMLdSpZQgojfQRZk8kjfGIkhu7kSOXaPnoK98UtGmYKpq6PQ7T3hD/VZXIjem6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB3Zw2Zt0z3dSZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 20:20:40 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cB1N06r90z9sSZ;
	Tue, 26 Aug 2025 10:41:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 95Os1xD7Erc8; Tue, 26 Aug 2025 10:41:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cB1N05t26z9sSY;
	Tue, 26 Aug 2025 10:41:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B24528B764;
	Tue, 26 Aug 2025 10:41:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5Sr4FVgPNX2m; Tue, 26 Aug 2025 10:41:04 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1576D8B763;
	Tue, 26 Aug 2025 10:41:04 +0200 (CEST)
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
Subject: [PATCH v4] soc: fsl: qe: Change GPIO driver to a proper platform driver
Date: Tue, 26 Aug 2025 10:40:33 +0200
Message-ID: <2df36ab4e1ec2af1d383281ed5005a09d28f40e2.1756197491.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <e05a0959d794016bde79e48e25ff71253cf51aae.1756104334.git.christophe.leroy@csgroup.eu>
References: <e05a0959d794016bde79e48e25ff71253cf51aae.1756104334.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756197653; l=3483; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=5s3yYeYRZ3QkohcSQgNTeYUyQ5TvPkMMh0AM/N4girU=; b=I/hgGETiK8FWJI3XxVV6HRRuu9Mq+Y4KxbL8S7c07bgSnbYBq9ioSj3ZZS9Z+O/kSPSSY1Pci nxWqwwiIed3BLFJhGbGLoSuUgPAxoRcWC4vibP61MV8LRTnJhqLSaxk
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In order to be able to add interrupts to the GPIOs, first change the
QE GPIO driver to the proper platform driver in order to allow
initialisation to be done in the right order, otherwise the GPIOs
get added before the interrupts are registered.

Removing linux/of.h and linux/property.h which are unused.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v4: Removed unused headers
---
 drivers/soc/fsl/qe/gpio.c | 88 +++++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 41 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 8df1e8fa86a5..fece644ce914 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -12,13 +12,12 @@
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
 
@@ -295,45 +294,52 @@ void qe_pin_set_gpio(struct qe_pin *qe_pin)
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


