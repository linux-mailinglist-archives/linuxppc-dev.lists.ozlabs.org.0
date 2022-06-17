Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3570B54F5FE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 12:53:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPbW11F8bz3bwb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 20:53:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=kHjwl+p3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.112; helo=m15112.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=kHjwl+p3;
	dkim-atps=neutral
Received: from m15112.mail.126.com (m15112.mail.126.com [220.181.15.112])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPbVN1RvXz3bpH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 20:52:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=TBVpT
	Xi3mOGroTRFtYnS2jF3N9afbBUgGy+vsR5qfSA=; b=kHjwl+p3FRM3LWROajx8p
	B3PCa9VMs4dEAt1MfUAIk1mN/6SLkv9dENRbifemO3CLOt34K9jVC9iwr9QS2u2c
	4DchzsaXwMOltmFCcbUrsobZLdsZk2d1Q/Eng4nfXYujRazUFo8TbNHTyn3KOhU3
	vaW4RQ7P4JmwVU2242zu50=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp2 (Coremail) with SMTP id DMmowAA3oPxkXKxipQEODg--.20553S2;
	Fri, 17 Jun 2022 18:50:12 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	christophe.leroy@csgroup.eu,
	nixiaoming@huawei.com
Subject: [PATCH v5] powerpc:85xx: Add missing of_node_put() in sgy_cst1000
Date: Fri, 17 Jun 2022 18:50:11 +0800
Message-Id: <20220617105011.4041123-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowAA3oPxkXKxipQEODg--.20553S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFWDtF4DCFW5Jw4fKw18AFb_yoW5uw17pF
	Z8CrZakrWkGw1xGas3tayDuFy2yw18t3yxJ34fGan7C34UX34qqry0yFyrWrnIgrW8C3yr
	Jr1aya40kFZrAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR-J5cUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7QUjF1pEAN95NwAAsT
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, windhl@126.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In gpio_halt_probe(), of_find_matching_node() will return a node
pointer with refcount incremented. We should use of_node_put() in
fail path or when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 changelog:
 v5: fix 'gotot' error introduced by v4 and use cross-compiler to test 
 v4: reuse exist 'err' and use a simple code style, advised by CJ
 v3: use local 'child_node' advised by Michael.
 v2: use goto-label patch style advised by Christophe Leroy.
 v1: add of_node_put() before each exit.

 arch/powerpc/platforms/85xx/sgy_cts1000.c | 35 ++++++++++++++---------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/sgy_cts1000.c b/arch/powerpc/platforms/85xx/sgy_cts1000.c
index 98ae64075193..e14d1b74d4e4 100644
--- a/arch/powerpc/platforms/85xx/sgy_cts1000.c
+++ b/arch/powerpc/platforms/85xx/sgy_cts1000.c
@@ -71,6 +71,7 @@ static int gpio_halt_probe(struct platform_device *pdev)
 {
 	enum of_gpio_flags flags;
 	struct device_node *node = pdev->dev.of_node;
+	struct device_node *child_node;
 	int gpio, err, irq;
 	int trigger;
 
@@ -78,26 +79,29 @@ static int gpio_halt_probe(struct platform_device *pdev)
 		return -ENODEV;
 
 	/* If there's no matching child, this isn't really an error */
-	halt_node = of_find_matching_node(node, child_match);
-	if (!halt_node)
+	child_node = of_find_matching_node(node, child_match);
+	if (!child_node)
 		return 0;
 
 	/* Technically we could just read the first one, but punish
 	 * DT writers for invalid form. */
-	if (of_gpio_count(halt_node) != 1)
-		return -EINVAL;
+	if (of_gpio_count(child_node) != 1) {
+		err = -EINVAL;
+		goto err_put;
+	}
 
 	/* Get the gpio number relative to the dynamic base. */
-	gpio = of_get_gpio_flags(halt_node, 0, &flags);
-	if (!gpio_is_valid(gpio))
-		return -EINVAL;
+	gpio = of_get_gpio_flags(child_node, 0, &flags);
+	if (!gpio_is_valid(gpio)) {
+		err = -EINVAL;
+		goto err_put;
+	}
 
 	err = gpio_request(gpio, "gpio-halt");
 	if (err) {
 		printk(KERN_ERR "gpio-halt: error requesting GPIO %d.\n",
 		       gpio);
-		halt_node = NULL;
-		return err;
+		goto err_put;
 	}
 
 	trigger = (flags == OF_GPIO_ACTIVE_LOW);
@@ -105,15 +109,14 @@ static int gpio_halt_probe(struct platform_device *pdev)
 	gpio_direction_output(gpio, !trigger);
 
 	/* Now get the IRQ which tells us when the power button is hit */
-	irq = irq_of_parse_and_map(halt_node, 0);
+	irq = irq_of_parse_and_map(child_node, 0);
 	err = request_irq(irq, gpio_halt_irq, IRQF_TRIGGER_RISING |
-			  IRQF_TRIGGER_FALLING, "gpio-halt", halt_node);
+			  IRQF_TRIGGER_FALLING, "gpio-halt", child_node);
 	if (err) {
 		printk(KERN_ERR "gpio-halt: error requesting IRQ %d for "
 		       "GPIO %d.\n", irq, gpio);
 		gpio_free(gpio);
-		halt_node = NULL;
-		return err;
+		goto err_put;
 	}
 
 	/* Register our halt function */
@@ -123,7 +126,12 @@ static int gpio_halt_probe(struct platform_device *pdev)
 	printk(KERN_INFO "gpio-halt: registered GPIO %d (%d trigger, %d"
 	       " irq).\n", gpio, trigger, irq);
 
+	halt_node = child_node;
 	return 0;
+
+err_put:
+	of_node_put(child_node);
+	return err;
 }
 
 static int gpio_halt_remove(struct platform_device *pdev)
@@ -139,6 +147,7 @@ static int gpio_halt_remove(struct platform_device *pdev)
 
 		gpio_free(gpio);
 
+		of_node_put(halt_node);
 		halt_node = NULL;
 	}
 
-- 
2.25.1

