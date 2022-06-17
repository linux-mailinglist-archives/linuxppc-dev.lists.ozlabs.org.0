Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 739E054F0EB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 08:09:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPTCF2w0mz3bvc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 16:09:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=qF2NH9P4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.111; helo=m15111.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=qF2NH9P4;
	dkim-atps=neutral
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPTBc1Dg5z3bg4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 16:08:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=o6mVs
	PYDGXwvBm364qkC63oDBpWTCRDQYS+fGz/FerM=; b=qF2NH9P40QL7D3uxt8Num
	kp2OyLY2Kos7GZx6G3+0FLw/aD70kT9VbiuanzylIq7VWeVTVT2mhMBAU0Ts8c4x
	B8Z/Ym68bl7SMJH3yQDHhDfqE/B2vvYScHY3G4BwDH3//NgLETtJkYE8FDulus/0
	4t1nN447Fk2GJ0EPMJt1MM=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp1 (Coremail) with SMTP id C8mowABnHt9cGqxiJHj2Eg--.23720S2;
	Fri, 17 Jun 2022 14:08:29 +0800 (CST)
From: Liang He <windhl@126.com>
To: oss@buserror.net,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH v4] powerpc:85xx: Add missing of_node_put() in sgy_cst1000
Date: Fri, 17 Jun 2022 14:08:26 +0800
Message-Id: <20220617060827.4004795-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowABnHt9cGqxiJHj2Eg--.23720S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZFWDtF4DCFW5Jw4fKw18AFb_yoW5uryfpF
	Z8CrZakrWkGw17Ga4SyayDZFy2yw18K3yxJw1fCan7C34UX34qqr10yF15WrnxWrW8C3yr
	Jr1aya40kFZrAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRT7KfUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3B0jF1pEDvP0zQAAsv
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
 v4: reuse exist 'err' and use a simple code style, advised by CJ
 v3: use local 'child_node' advised by Michael.
 v2: use goto-label patch style advised by Christophe Leroy.
 v1: add of_node_put() before each exit.

 arch/powerpc/platforms/85xx/sgy_cts1000.c | 35 ++++++++++++++---------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/sgy_cts1000.c b/arch/powerpc/platforms/85xx/sgy_cts1000.c
index 98ae64075193..e4588943fe7e 100644
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
+		gotot err_put;
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

