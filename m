Return-Path: <linuxppc-dev+bounces-11126-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8B6B2C6D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 16:20:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5sF16qmZz3d8M;
	Wed, 20 Aug 2025 00:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755613237;
	cv=none; b=CQL9ZDiiZy1vYzpvUbDxHoA7/gAf2CP30Y4qsVjEMKweo4pAQqf5dH/NNHXioXV8/aBpQkyl7Lc12SEYrK8nIH/UmIDnHbI5+znR1nDTqf2mbcLjP3npx1a7XZBt+iQcj1V/bCKPB49CpVhx15KQGLbs+cIuHlLanGObfRkpG98Cn9PgLjuElEbS2mCSjljfRqP1KWlnG13Sdj9JNOL5c+xVDlxHGl0pr2PpGQ249yHdAGZILFW7GBcbI06tBDl+1eajWfI4tIAKLpsLkaeAxFtw+Lq/1pC0BFs5XYjNmFuW3KVY3r89q4IMjbsvZ2+1wjzB+ra+iQvuWjOFzRGXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755613237; c=relaxed/relaxed;
	bh=jECw0EWcetWXM76TnmkDh1X6pVty3AuaeLP1zp9SKwg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eIYR/Bf29tT/QdYG+6jAbT17syi0xIxgBSDn7IwN4122RxXoz888OFv9OAsFXJI23FMctPVI6OX9am8ZiVwXD59XhfSMr3HRpro+nTQ9Q01tCSdXSRfpfTCu3RvZ9WSXV6xByRUoS93JjOp8vjJ39efj1s0GfAadnBfCJ4TRO728KXnm5ywBAOgY/id3rcHQG87JKIVNdE7KGLOKVkhuhGG8CttJUl/rTVNDwDgtGEhZQyiuRu4qvOn4lkrFGsAleNenAGphpRuljhPy9w2rCel2jh7WQFSoqcmfSn99l17yrz6pQ9JbAEhfhQSiDnZ0vVITTlE5/do1tf10bouv+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5sF107Bqz3d8K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Aug 2025 00:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c55sb5xm8z9sX1;
	Mon, 18 Aug 2025 10:46:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id srDhj_08AVtb; Mon, 18 Aug 2025 10:46:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c55sY6Nmlz9sWk;
	Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C21A98B766;
	Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id mZjBc2RFevRD; Mon, 18 Aug 2025 10:46:09 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D79A8B763;
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
	devicetree@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 2/5] soc: fsl: qe: Change GPIO driver to a proper platform driver
Date: Mon, 18 Aug 2025 10:45:55 +0200
Message-ID: <0f534668e05631c9786c9d0382af470daeedecfd.1755506608.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755506759; l=3217; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=1uL2LicwjOlUIYno54f8JBgI5fU0qjg/pfIcjSsv9gk=; b=a3iAS5SgWnFLGYzcAQP1Hs3aUPLiJ9Kb6EOXH0JUUnDSmJHxVLljVaQVp+INS8wdONuBiGT33 T7zp17hda7cDS7eaYSg9UP/mTKJg2K6761bTFD7ruRa5i7O145Kk9AO
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
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v2: Use devm_kzalloc() instead of kzalloc()
---
 drivers/soc/fsl/qe/gpio.c | 86 +++++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 39 deletions(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 8df1e8fa86a5..93fcc6d85ac7 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -19,6 +19,7 @@
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <linux/property.h>
+#include <linux/platform_device.h>
 
 #include <soc/fsl/qe/qe.h>
 
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


