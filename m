Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 197AE51E65D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 12:05:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwNNM09LNz3ccr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 20:05:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PZPdFtiV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PZPdFtiV; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwNKg6dFmz3bXy
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 20:03:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651917784; x=1683453784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1MylfDouAUkI19ElTFtDpDZL11z3RMfTO2EX3tvIe7Q=;
 b=PZPdFtiV4Fs+71cmWd0xOCRdPHyIwSpy5ODBS8AFps54kYuNEAMTWXIF
 +FwZRrlctvOUlzdKTXg3yQIrIeL0V5vNY1mRHYy5v0eMH+cPLx01kP/hS
 BX3brAkDFnM1ckRzq3iML1Ejwq8LaIjA7hDjhRAZIkUl98jS91sQdL23j
 6dppv5Ph/DrWzc6hnvFGpOc/QdGjVsnyxupXs68tf3WMJmMtElBFjcE2p
 zf/eAg47yYNec7PW0kFcqOCjKfFG/wQ5kFLn0ZImIesr+dORFPpcUIW/5
 6zQQkSeYGUbu9njxZjmUZKbzpVu6ls7JYPufsvIGpcVd1HF/8Qyzb6eAo w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="268585214"
X-IronPort-AV: E=Sophos;i="5.91,206,1647327600"; d="scan'208";a="268585214"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2022 03:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,206,1647327600"; d="scan'208";a="600936229"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga001.jf.intel.com with ESMTP; 07 May 2022 03:01:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A0ED027D; Sat,  7 May 2022 13:01:49 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Mark Brown <broonie@kernel.org>, chris.packham@alliedtelesis.co.nz,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
Subject: [PATCH v2 4/4] powerpc/52xx: Convert to use fwnode API
Date: Sat,  7 May 2022 13:01:47 +0300
Message-Id: <20220507100147.5802-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507100147.5802-1-andriy.shevchenko@linux.intel.com>
References: <20220507100147.5802-1-andriy.shevchenko@linux.intel.com>
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
Cc: Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, Anatolij Gustschin <agust@denx.de>,
 Wolfgang Grandegger <wg@grandegger.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We may convert the GPT driver to use fwnode API for the sake
of consistency of the used APIs inside the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no changes
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c | 47 +++++++++++------------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index ae47fdcc8a96..58c3651034bd 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -53,10 +53,9 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/list.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/of.h>
-#include <linux/of_platform.h>
-#include <linux/of_gpio.h>
 #include <linux/kernel.h>
 #include <linux/property.h>
 #include <linux/slab.h>
@@ -64,7 +63,7 @@
 #include <linux/watchdog.h>
 #include <linux/miscdevice.h>
 #include <linux/uaccess.h>
-#include <linux/module.h>
+
 #include <asm/div64.h>
 #include <asm/mpc52xx.h>
 
@@ -235,18 +234,17 @@ static const struct irq_domain_ops mpc52xx_gpt_irq_ops = {
 	.xlate = mpc52xx_gpt_irq_xlate,
 };
 
-static void
-mpc52xx_gpt_irq_setup(struct mpc52xx_gpt_priv *gpt, struct device_node *node)
+static void mpc52xx_gpt_irq_setup(struct mpc52xx_gpt_priv *gpt)
 {
 	int cascade_virq;
 	unsigned long flags;
 	u32 mode;
 
-	cascade_virq = irq_of_parse_and_map(node, 0);
-	if (!cascade_virq)
+	cascade_virq = platform_get_irq(to_platform_device(gpt->dev), 0);
+	if (cascade_virq < 0)
 		return;
 
-	gpt->irqhost = irq_domain_add_linear(node, 1, &mpc52xx_gpt_irq_ops, gpt);
+	gpt->irqhost = irq_domain_create_linear(dev_fwnode(gpt->dev), 1, &mpc52xx_gpt_irq_ops, gpt);
 	if (!gpt->irqhost) {
 		dev_err(gpt->dev, "irq_domain_add_linear() failed\n");
 		return;
@@ -670,8 +668,7 @@ static int mpc52xx_gpt_wdt_init(void)
 	return err;
 }
 
-static int mpc52xx_gpt_wdt_setup(struct mpc52xx_gpt_priv *gpt,
-				 const u32 *period)
+static int mpc52xx_gpt_wdt_setup(struct mpc52xx_gpt_priv *gpt, const u32 period)
 {
 	u64 real_timeout;
 
@@ -679,14 +676,14 @@ static int mpc52xx_gpt_wdt_setup(struct mpc52xx_gpt_priv *gpt,
 	mpc52xx_gpt_wdt = gpt;
 
 	/* configure the wdt if the device tree contained a timeout */
-	if (!period || *period == 0)
+	if (period == 0)
 		return 0;
 
-	real_timeout = (u64) *period * 1000000000ULL;
+	real_timeout = (u64)period * 1000000000ULL;
 	if (mpc52xx_gpt_do_start(gpt, real_timeout, 0, 1))
 		dev_warn(gpt->dev, "starting as wdt failed\n");
 	else
-		dev_info(gpt->dev, "watchdog set to %us timeout\n", *period);
+		dev_info(gpt->dev, "watchdog set to %us timeout\n", period);
 	return 0;
 }
 
@@ -697,8 +694,7 @@ static int mpc52xx_gpt_wdt_init(void)
 	return 0;
 }
 
-static inline int mpc52xx_gpt_wdt_setup(struct mpc52xx_gpt_priv *gpt,
-					const u32 *period)
+static inline int mpc52xx_gpt_wdt_setup(struct mpc52xx_gpt_priv *gpt, const u32 period)
 {
 	return 0;
 }
@@ -726,25 +722,26 @@ static int mpc52xx_gpt_probe(struct platform_device *ofdev)
 	dev_set_drvdata(&ofdev->dev, gpt);
 
 	mpc52xx_gpt_gpio_setup(gpt);
-	mpc52xx_gpt_irq_setup(gpt, ofdev->dev.of_node);
+	mpc52xx_gpt_irq_setup(gpt);
 
 	mutex_lock(&mpc52xx_gpt_list_mutex);
 	list_add(&gpt->list, &mpc52xx_gpt_list);
 	mutex_unlock(&mpc52xx_gpt_list_mutex);
 
 	/* check if this device could be a watchdog */
-	if (of_get_property(ofdev->dev.of_node, "fsl,has-wdt", NULL) ||
-	    of_get_property(ofdev->dev.of_node, "has-wdt", NULL)) {
-		const u32 *on_boot_wdt;
+	if (device_property_present(gpt->dev, "fsl,has-wdt") ||
+	    device_property_present(gpt->dev, "has-wdt")) {
+		u32 on_boot_wdt = 0;
+		int ret;
 
 		gpt->wdt_mode = MPC52xx_GPT_CAN_WDT;
-		on_boot_wdt = of_get_property(ofdev->dev.of_node,
-					      "fsl,wdt-on-boot", NULL);
-		if (on_boot_wdt) {
+		ret = device_property_read_u32(gpt->dev, "fsl,wdt-on-boot", &on_boot_wdt);
+		if (ret) {
+			dev_info(gpt->dev, "can function as watchdog\n");
+		} else {
 			dev_info(gpt->dev, "used as watchdog\n");
 			gpt->wdt_mode |= MPC52xx_GPT_IS_WDT;
-		} else
-			dev_info(gpt->dev, "can function as watchdog\n");
+		}
 		mpc52xx_gpt_wdt_setup(gpt, on_boot_wdt);
 	}
 
-- 
2.35.1

