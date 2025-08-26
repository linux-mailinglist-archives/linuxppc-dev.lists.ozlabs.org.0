Return-Path: <linuxppc-dev+bounces-11316-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D789B35A01
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 12:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB3Zr5Pxyz3dSL;
	Tue, 26 Aug 2025 20:20:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756203636;
	cv=none; b=j4kcAFROkqWUNkhzYBHaM+1mQEEDNBcTG4PL7gRQtV35Z7NzdJbFG0z6eK8b9n2Cly/iP6KlizCREN48zZMrvVrxOX8dRoK5dVsc9r4ro2Xaripev9okLHaEtEV/qiZ/+y/T4TuR+AuplsFDmVOkNqGcJU7FQQmDxUgxKaGAZhSVFq6hS3RIt26L1ENniT02Jf/dpWONwsn0hqRiz2okBCY/ySFQeZ+rBZ/R3gCQw6Wsr74Z/COWFQfoLniS4wJoYZus8tsBFeyZXw9upxCw/nnvT5EIySFsphn5295GJMZkGYL8RC4A2HFSFckB00s1SLzp6/+bSB6vowV36cJ6dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756203636; c=relaxed/relaxed;
	bh=7kKWOBwADZELVrSnffADGusvaZ3WUHweIf3s2jUllZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NoqywDZA36J4iLDPGZ9LOgGIKcHoWHR6sOvH7PvA10s0HqrKBr4s2RwTUeKv3JRPbb3spc/nH4PuS6gCpj79i0QHMhEuDxNIADJMyipBZvC/+O7GJL5qJVUfBMUt3Ff6uLXtbs/BZ0N+5h7oCNHC5/TtWP8YKuU604bciIVbTHx9ZwKfJLdAtXG73oIzkQF+kDHMcGziLrAu8BwG6sTrWjBbcZiDknZCAu7pTbg8vLO5LCV73duMYi11EzzoLe8PYteaUk95yY7FVa2Piw8SX6FySNkKehcUaIS59CKbx2raQ+gJ3Db4AXBOngzD/fX3pnQhZF2wgbudMRvM+aV0Fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cB3Zq6TrMz3dLM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 20:20:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cB1Np0NmHz9sSd;
	Tue, 26 Aug 2025 10:41:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id voHHKrBq8-UN; Tue, 26 Aug 2025 10:41:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cB1Nn6L1xz9sSc;
	Tue, 26 Aug 2025 10:41:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C0CCD8B764;
	Tue, 26 Aug 2025 10:41:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id j9M1S24KLE1q; Tue, 26 Aug 2025 10:41:40 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D0548B763;
	Tue, 26 Aug 2025 10:41:40 +0200 (CEST)
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
Subject: [PATCH v4] soc: fsl: qe: Add support of IRQ in QE GPIO
Date: Tue, 26 Aug 2025 10:41:29 +0200
Message-ID: <ac7c79b3491cb48ef7c193420b9a9e4614b88436.1756197502.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <372550a2633586d2f98b077d3f520f3262ca0e2a.1756104334.git.christophe.leroy@csgroup.eu>
References: <372550a2633586d2f98b077d3f520f3262ca0e2a.1756104334.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756197697; l=2931; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=pJ0dqW2GCGa4yWArNPjCeHoPWJICNpv8ipt0j7ASM1Y=; b=qXBDjnSeeKD6zixq9hi51WNrEhQvT+wzLU+IvEBZpjXb3EHCSVzw/98Sy6Ghh9g5fyNRHzWIE JBWupobYaCsCVFuqPZds6FTJG7GVp+fHpUTHxKDVXYEvdxzDll2r4CZ
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
v4: Using device_property_read_u32() instead of of_property_read_u32()
---
 drivers/soc/fsl/qe/gpio.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 5bf073bbaac8..68bcd6048b1c 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -12,11 +12,13 @@
 #include <linux/spinlock.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/of_irq.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/slab.h>
 #include <linux/export.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #include <soc/fsl/qe/qe.h>
 
@@ -30,6 +32,8 @@ struct qe_gpio_chip {
 
 	/* saved_regs used to restore dedicated functions */
 	struct qe_pio_regs saved_regs;
+
+	int irq[32];
 };
 
 static void qe_gpio_save_regs(struct qe_gpio_chip *qe_gc)
@@ -133,6 +137,13 @@ static int qe_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
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
@@ -293,6 +304,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	struct device_node *np = dev->of_node;
 	struct qe_gpio_chip *qe_gc;
 	struct gpio_chip *gc;
+	u32 mask;
 
 	qe_gc = devm_kzalloc(dev, sizeof(*qe_gc), GFP_KERNEL);
 	if (!qe_gc)
@@ -300,6 +312,14 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 
 	spin_lock_init(&qe_gc->lock);
 
+	if (!device_property_read_u32(dev, "fsl,qe-gpio-irq-mask", &mask)) {
+		int i, j;
+
+		for (i = 0, j = 0; i < ARRAY_SIZE(qe_gc->irq); i++)
+			if (mask & (1 << (31 - i)))
+				qe_gc->irq[i] = irq_of_parse_and_map(np, j++);
+	}
+
 	gc = &qe_gc->gc;
 
 	gc->base = -1;
@@ -309,6 +329,7 @@ static int qe_gpio_probe(struct platform_device *ofdev)
 	gc->get = qe_gpio_get;
 	gc->set = qe_gpio_set;
 	gc->set_multiple = qe_gpio_set_multiple;
+	gc->to_irq = qe_gpio_to_irq;
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
 
-- 
2.49.0


