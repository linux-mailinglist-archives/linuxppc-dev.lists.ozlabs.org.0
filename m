Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6154235BB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 04:14:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPJ0l4LvGz306m
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 13:13:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=JVbr5EfI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPHyn1xlMz2xXs
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 13:12:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=JVbr5EfI; dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix, from userid 1010)
 id 4HPHyn1Y7fz4xbZ; Wed,  6 Oct 2021 13:12:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1633486337;
 bh=uRyhi5gqz+IyP+8AnrbQf8AGajQePT4tARoCL1WUxtg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JVbr5EfIo82buRjSQ+KmX3VTNOxBb78Y4xNpj1WR2QedkpbFS6TbpDxqvRdRyHSLA
 yQZ3p/z1+Hdv7JfpNIdAXgaCC+z7nMiYoRz5JeipgcEm4bR2WevaYRHRP4J6fXqs2T
 PsMSyXSRWCfSKTEpwFFlKHh45uHKsMZsS3PfoCmXyfouS+hHc6NniyhjsxZkanY3Rc
 RMgGr8jbabsFo9tiDeH/vrm9ChSA6tYlIWpEp2sw7putXByGQGIOCWmyWgILPRdDIW
 SE75oQNUwtDgTNy95+P8hMz5MaWCrQ0ppXbXW6/RE18kP1KB2EP3vhDAVR6yyuBM8s
 ksEViVK27OEXg==
From: Anton Blanchard <anton@ozlabs.org>
To: alistair@popple.id.au, joel@jms.id.au, andrew@aj.id.au, clg@kaod.org,
 mikey@neuling.org, jk@codeconstruct.com.au
Subject: [RFC 3/5] ipmi:bt-bmc: Put arch specific function into bt_bmc_ops
Date: Wed,  6 Oct 2021 13:12:03 +1100
Message-Id: <20211006021205.2579057-3-anton@ozlabs.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006021205.2579057-1-anton@ozlabs.org>
References: <20211006021205.2579057-1-anton@ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While most of the driver is arch agnostic, setting up and handling
interrupts, and enabling the hardware is not. Create bt_bmc_ops to
handle these functions.

Signed-off-by: Anton Blanchard <anton@ozlabs.org>
---
 drivers/char/ipmi/bt-bmc.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
index 2b0fe1255026..b48e04405ac4 100644
--- a/drivers/char/ipmi/bt-bmc.c
+++ b/drivers/char/ipmi/bt-bmc.c
@@ -17,6 +17,7 @@
 #include <linux/regmap.h>
 #include <linux/sched.h>
 #include <linux/timer.h>
+#include <linux/of_device.h>
 
 /*
  * This is a BMC device used to communicate to the host
@@ -435,15 +436,30 @@ static void aspeed_enable_bt(struct bt_bmc *bt_bmc)
 		     BT_CR0_ENABLE_IBT);
 }
 
+struct bt_bmc_ops {
+	int (*config_irq)(struct bt_bmc *bt_bmc, struct platform_device *pdev);
+	void (*enable_bt)(struct bt_bmc *bt_bmc);
+};
+
+static const struct bt_bmc_ops aspeed_bt_bmc_ops = {
+	.config_irq = aspeed_bt_bmc_config_irq,
+	.enable_bt = aspeed_enable_bt,
+};
+
 static int bt_bmc_probe(struct platform_device *pdev)
 {
 	struct bt_bmc *bt_bmc;
 	struct device *dev;
 	int rc;
+	const struct bt_bmc_ops *ops;
 
 	dev = &pdev->dev;
 	dev_info(dev, "Found bt bmc device\n");
 
+	ops = of_device_get_match_data(&pdev->dev);
+	if (!ops)
+		return -ENODEV;
+
 	bt_bmc = devm_kzalloc(dev, sizeof(*bt_bmc), GFP_KERNEL);
 	if (!bt_bmc)
 		return -ENOMEM;
@@ -483,7 +499,7 @@ static int bt_bmc_probe(struct platform_device *pdev)
 		return rc;
 	}
 
-	aspeed_bt_bmc_config_irq(bt_bmc, pdev);
+	ops->config_irq(bt_bmc, pdev);
 
 	if (bt_bmc->irq >= 0) {
 		dev_info(dev, "Using IRQ %d\n", bt_bmc->irq);
@@ -494,7 +510,7 @@ static int bt_bmc_probe(struct platform_device *pdev)
 		add_timer(&bt_bmc->poll_timer);
 	}
 
-	aspeed_enable_bt(bt_bmc);
+	ops->enable_bt(bt_bmc);
 
 	clr_b_busy(bt_bmc);
 
@@ -512,8 +528,8 @@ static int bt_bmc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id bt_bmc_match[] = {
-	{ .compatible = "aspeed,ast2400-ibt-bmc" },
-	{ .compatible = "aspeed,ast2500-ibt-bmc" },
+	{ .compatible = "aspeed,ast2400-ibt-bmc", .data = &aspeed_bt_bmc_ops },
+	{ .compatible = "aspeed,ast2500-ibt-bmc", .data = &aspeed_bt_bmc_ops },
 	{ },
 };
 
-- 
2.31.1

