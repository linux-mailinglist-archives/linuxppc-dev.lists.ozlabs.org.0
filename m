Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9802654E5DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 17:20:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP5T83BYfz3bks
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 01:20:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=JRXx6Vdf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.111; helo=m15111.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=JRXx6Vdf;
	dkim-atps=neutral
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP5ST6kKFz3bYS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 01:19:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=nsVvp
	/8TetDFrxpido6IqFxlF0d+SkPkvOqKIqtD0WE=; b=JRXx6VdfJRgtM7cqNamoD
	iDlPiD9x3Jz7b7UXz+tWd08mcWIrjoLX6bp/Nmq40hPImFzDaa0BeA6ntT70cV6e
	+UeVF+bPj6Be3t786E2PtoEIimFp4cRM+rphjKsN/2HS3rYcUatoHzruJEzTxDtc
	pNAUIy3LDv2FpVQS2U2mpM=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp1 (Coremail) with SMTP id C8mowACn1CTkSatiqJdkEg--.27454S2;
	Thu, 16 Jun 2022 23:19:02 +0800 (CST)
From: Liang He <windhl@126.com>
To: oss@buserror.net,
	mpe@ellerman.id.au,
	paulus@samba.org,
	christophe.leroy@csgroup.eu,
	nixiaoming@huawei.com
Subject: [PATCH v2] arch: powerpc: platforms: 85xx: Add missing of_node_put in sgy_cts1000.c
Date: Thu, 16 Jun 2022 23:19:01 +0800
Message-Id: <20220616151901.3989078-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowACn1CTkSatiqJdkEg--.27454S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFW8uw1UJF13CF4xKrWktFb_yoW8KryfpF
	Z8GrWSkrWkGr1xG3s7ta1DuFy3tw10qay3tw13Cws7C3WUX3yqvry0vF4rXr1fWFW8C3yr
	Jr4akayj9FZFv3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRfMarUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizgciF18RPTmY+QAAsX
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

In gpio_halt_probe(), of_find_matching_node() will return a node pointer with
refcount incremented. We should use of_node_put() in each fail path or when it
is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v2: use goto-label patch style advised by Christophe.
 v1: add of_node_put() before each exit.

 arch/powerpc/platforms/85xx/sgy_cts1000.c | 27 +++++++++++++++--------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/sgy_cts1000.c b/arch/powerpc/platforms/85xx/sgy_cts1000.c
index 98ae64075193..e280f963d88c 100644
--- a/arch/powerpc/platforms/85xx/sgy_cts1000.c
+++ b/arch/powerpc/platforms/85xx/sgy_cts1000.c
@@ -73,6 +73,7 @@ static int gpio_halt_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	int gpio, err, irq;
 	int trigger;
+	int ret;
 
 	if (!node)
 		return -ENODEV;
@@ -84,20 +85,24 @@ static int gpio_halt_probe(struct platform_device *pdev)
 
 	/* Technically we could just read the first one, but punish
 	 * DT writers for invalid form. */
-	if (of_gpio_count(halt_node) != 1)
-		return -EINVAL;
+	if (of_gpio_count(halt_node) != 1) {
+		ret = -EINVAL;
+		goto err_put;
+	}
 
 	/* Get the gpio number relative to the dynamic base. */
 	gpio = of_get_gpio_flags(halt_node, 0, &flags);
-	if (!gpio_is_valid(gpio))
-		return -EINVAL;
+	if (!gpio_is_valid(gpio)) {
+		ret = -EINVAL;
+		gotot err_put;
+	}
 
 	err = gpio_request(gpio, "gpio-halt");
 	if (err) {
 		printk(KERN_ERR "gpio-halt: error requesting GPIO %d.\n",
 		       gpio);
-		halt_node = NULL;
-		return err;
+		ret = err;
+		goto err_put;
 	}
 
 	trigger = (flags == OF_GPIO_ACTIVE_LOW);
@@ -112,8 +117,8 @@ static int gpio_halt_probe(struct platform_device *pdev)
 		printk(KERN_ERR "gpio-halt: error requesting IRQ %d for "
 		       "GPIO %d.\n", irq, gpio);
 		gpio_free(gpio);
-		halt_node = NULL;
-		return err;
+		ret = err;
+		goto err_put;
 	}
 
 	/* Register our halt function */
@@ -122,8 +127,12 @@ static int gpio_halt_probe(struct platform_device *pdev)
 
 	printk(KERN_INFO "gpio-halt: registered GPIO %d (%d trigger, %d"
 	       " irq).\n", gpio, trigger, irq);
+	ret = 0;
 
-	return 0;
+err_put:
+	of_node_put(halt_node);
+	halt_node = NULL;
+	return ret;
 }
 
 static int gpio_halt_remove(struct platform_device *pdev)
-- 
2.25.1

