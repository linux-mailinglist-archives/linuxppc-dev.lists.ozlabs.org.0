Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BCF5ECCCE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 21:24:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McV1h6gY6z3cGj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 05:24:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NONrf1KR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=dmitry.torokhov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NONrf1KR;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McV121RP8z3bY3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 05:24:03 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id cp18so1500453pjb.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 12:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date;
        bh=i6/ryNav83BQlaWulO74ztbMcRDBUJZlZHngMujmegM=;
        b=NONrf1KR/nzHmrKI5DWkeZqB59R4iEDFU1D0IGmauZjqD2ZyNZCxrMkssgkm1WsGt8
         3m6Fhmv/9ML5en6RB5ZZeV8TPhYstv7igjLsO+2f1OsRw5VBpF9Up+s3nJFCDoWUMDVa
         1AeXaovPZgWsoBTHu1z20szad7PtWu2Ot2sWJhJ6+LRlVoTGltp9QCzOfe9yH//nFn57
         Ghx4tDLFrwskiUdnex5CgYAE8y378EjXG9jWsMmaA8tUoIboilKOKv4xtQOd279M5oQ/
         Fgn0jOPCChZCFYlbGLveS778ejmn+e6VQbzBULrZVNshOZniz3Ndb4VHcJNdbSpEKuIl
         8VSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=i6/ryNav83BQlaWulO74ztbMcRDBUJZlZHngMujmegM=;
        b=SlWoPkc0olK4UqBuLXvDrN0p2sGUp5gGcp/yUsC9VrCOPlEx8f8VgEU69H2P3PSpjd
         CDTGjDlx/Eik3M4+vuSKzrqjC1GF47fiRUKXNEOT0NejN4gelcLJiqAlv6Kq2QH5QV9Z
         +LFq2Ss+ekavFTvtso12WXQhfCIm3l2G0PJUX8c9QrsXwF0IoOvkkLdGWEPB9V60Ndg0
         yVqF7qnScuf3fXfK1GMjkdfsrHncpOHfkbdPY3f3TtsQNO0cZ8VD+7pviU1kVvHH484/
         P5iOeHxXJrgQrnrUmbh0aa63P3vf3V9CDNo7XcMih7KwGovqU2kk4jMNPLgnLs2KgqT/
         Mu2g==
X-Gm-Message-State: ACrzQf3wfzM56MV8jz17tpKXRRUNGolyFnkKimDD40u4A4ZXpoWju7Lj
	DO8w/yzjjQCtilK3g4uVmoY=
X-Google-Smtp-Source: AMsMyM7qgLGVSKn+yO8jVbz6qI2lad7JC1P2l8liI0Kl9P7MSlfQ0+2h3qLWmfPx1KOYsSvklwzfSQ==
X-Received: by 2002:a17:902:d490:b0:177:fc1d:6b0c with SMTP id c16-20020a170902d49000b00177fc1d6b0cmr28626926plg.28.1664306641554;
        Tue, 27 Sep 2022 12:24:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9739:ab49:3830:2cbb])
        by smtp.gmail.com with ESMTPSA id t6-20020a62d146000000b0053e8368ec34sm2144386pfl.32.2022.09.27.12.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 12:24:01 -0700 (PDT)
Date: Tue, 27 Sep 2022 12:23:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/sgy_cts1000: convert to using gpiod API and facelift
Message-ID: <YzNNznewTyCJiGFz@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Liang He <windhl@126.com>, linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch converts the driver to newer gpiod API, and away from
OF-specific legacy gpio API that we want to stop using.

While at it, let's address a few more issues:

- switch to using dev_info()/pr_info() and friends
- cancel work when unbinding the driver

Note that the original code handled halt GPIO polarity incorrectly:
in halt callback, when line polarity is "low" it would set trigger to
"1" and drive halt line high, which is counter to the annotation.
gpiod API will drive such line low. However I do not see any DTSes
in mainline that have a DT node with "sgy,gpio-halt" compatible.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

Cross-compiled with gcc-12.1.0, not tested on hardware.

 arch/powerpc/platforms/85xx/sgy_cts1000.c | 132 +++++++++-------------
 1 file changed, 53 insertions(+), 79 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/sgy_cts1000.c b/arch/powerpc/platforms/85xx/sgy_cts1000.c
index e14d1b74d4e4..751395cbf022 100644
--- a/arch/powerpc/platforms/85xx/sgy_cts1000.c
+++ b/arch/powerpc/platforms/85xx/sgy_cts1000.c
@@ -7,10 +7,13 @@
  * Copyright 2012 by Servergy, Inc.
  */
 
+#define pr_fmt(fmt) "gpio-halt: " fmt
+
+#include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/device.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
-#include <linux/of_gpio.h>
 #include <linux/of_irq.h>
 #include <linux/workqueue.h>
 #include <linux/reboot.h>
@@ -18,7 +21,8 @@
 
 #include <asm/machdep.h>
 
-static struct device_node *halt_node;
+static struct gpio_desc *halt_gpio;
+static int halt_irq;
 
 static const struct of_device_id child_match[] = {
 	{
@@ -36,23 +40,10 @@ static DECLARE_WORK(gpio_halt_wq, gpio_halt_wfn);
 
 static void __noreturn gpio_halt_cb(void)
 {
-	enum of_gpio_flags flags;
-	int trigger, gpio;
-
-	if (!halt_node)
-		panic("No reset GPIO information was provided in DT\n");
-
-	gpio = of_get_gpio_flags(halt_node, 0, &flags);
-
-	if (!gpio_is_valid(gpio))
-		panic("Provided GPIO is invalid\n");
-
-	trigger = (flags == OF_GPIO_ACTIVE_LOW);
-
-	printk(KERN_INFO "gpio-halt: triggering GPIO.\n");
+	pr_info("triggering GPIO.\n");
 
 	/* Probably wont return */
-	gpio_set_value(gpio, trigger);
+	gpiod_set_value(halt_gpio, 1);
 
 	panic("Halt failed\n");
 }
@@ -61,95 +52,78 @@ static void __noreturn gpio_halt_cb(void)
  * to handle the shutdown/poweroff. */
 static irqreturn_t gpio_halt_irq(int irq, void *__data)
 {
-	printk(KERN_INFO "gpio-halt: shutdown due to power button IRQ.\n");
+	struct platform_device *pdev = __data;
+
+	dev_info(&pdev->dev, "scheduling shutdown due to power button IRQ\n");
 	schedule_work(&gpio_halt_wq);
 
         return IRQ_HANDLED;
 };
 
-static int gpio_halt_probe(struct platform_device *pdev)
+static int __gpio_halt_probe(struct platform_device *pdev,
+			     struct device_node *halt_node)
 {
-	enum of_gpio_flags flags;
-	struct device_node *node = pdev->dev.of_node;
-	struct device_node *child_node;
-	int gpio, err, irq;
-	int trigger;
-
-	if (!node)
-		return -ENODEV;
-
-	/* If there's no matching child, this isn't really an error */
-	child_node = of_find_matching_node(node, child_match);
-	if (!child_node)
-		return 0;
-
-	/* Technically we could just read the first one, but punish
-	 * DT writers for invalid form. */
-	if (of_gpio_count(child_node) != 1) {
-		err = -EINVAL;
-		goto err_put;
-	}
-
-	/* Get the gpio number relative to the dynamic base. */
-	gpio = of_get_gpio_flags(child_node, 0, &flags);
-	if (!gpio_is_valid(gpio)) {
-		err = -EINVAL;
-		goto err_put;
-	}
+	int err;
 
-	err = gpio_request(gpio, "gpio-halt");
+	halt_gpio = fwnode_gpiod_get_index(of_fwnode_handle(halt_node),
+					   NULL, 0, GPIOD_OUT_LOW, "gpio-halt");
+	err = PTR_ERR_OR_ZERO(halt_gpio);
 	if (err) {
-		printk(KERN_ERR "gpio-halt: error requesting GPIO %d.\n",
-		       gpio);
-		goto err_put;
+		dev_err(&pdev->dev, "failed to request halt GPIO: %d\n", err);
+		return err;
 	}
 
-	trigger = (flags == OF_GPIO_ACTIVE_LOW);
-
-	gpio_direction_output(gpio, !trigger);
-
 	/* Now get the IRQ which tells us when the power button is hit */
-	irq = irq_of_parse_and_map(child_node, 0);
-	err = request_irq(irq, gpio_halt_irq, IRQF_TRIGGER_RISING |
-			  IRQF_TRIGGER_FALLING, "gpio-halt", child_node);
+	halt_irq = irq_of_parse_and_map(halt_node, 0);
+	err = request_irq(halt_irq, gpio_halt_irq,
+			  IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
+			  "gpio-halt", pdev);
 	if (err) {
-		printk(KERN_ERR "gpio-halt: error requesting IRQ %d for "
-		       "GPIO %d.\n", irq, gpio);
-		gpio_free(gpio);
-		goto err_put;
+		dev_err(&pdev->dev, "failed to request IRQ %d: %d\n",
+			halt_irq, err);
+		gpiod_put(halt_gpio);
+		halt_gpio = NULL;
+		return err;
 	}
 
 	/* Register our halt function */
 	ppc_md.halt = gpio_halt_cb;
 	pm_power_off = gpio_halt_cb;
 
-	printk(KERN_INFO "gpio-halt: registered GPIO %d (%d trigger, %d"
-	       " irq).\n", gpio, trigger, irq);
+	dev_info(&pdev->dev, "registered halt GPIO, irq: %d\n", halt_irq);
 
-	halt_node = child_node;
 	return 0;
-
-err_put:
-	of_node_put(child_node);
-	return err;
 }
 
-static int gpio_halt_remove(struct platform_device *pdev)
+static int gpio_halt_probe(struct platform_device *pdev)
 {
-	if (halt_node) {
-		int gpio = of_get_gpio(halt_node, 0);
-		int irq = irq_of_parse_and_map(halt_node, 0);
+	struct device_node *halt_node;
+	int ret;
+
+	if (!pdev->dev.of_node)
+		return -ENODEV;
+
+	/* If there's no matching child, this isn't really an error */
+	halt_node = of_find_matching_node(pdev->dev.of_node, child_match);
+	if (!halt_node)
+		return -ENODEV;
+
+	ret = __gpio_halt_probe(pdev, halt_node);
+	of_node_put(halt_node);
 
-		free_irq(irq, halt_node);
+	return ret;
+}
 
-		ppc_md.halt = NULL;
-		pm_power_off = NULL;
+static int gpio_halt_remove(struct platform_device *pdev)
+{
+	free_irq(halt_irq, pdev);
+	cancel_work_sync(&gpio_halt_wq);
 
-		gpio_free(gpio);
+	ppc_md.halt = NULL;
+	pm_power_off = NULL;
 
-		of_node_put(halt_node);
-		halt_node = NULL;
-	}
+	gpiod_put(halt_gpio);
+	halt_gpio = NULL;
 
 	return 0;
 }
-- 
2.38.0.rc1.362.ged0d419d3c-goog


-- 
Dmitry
