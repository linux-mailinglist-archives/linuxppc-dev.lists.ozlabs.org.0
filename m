Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DAF4E57C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 18:45:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNwjZ27TDz3050
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 04:45:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WPAHOZIF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WPAHOZIF; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNwhw4QByz2xTn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 04:44:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648057472; x=1679593472;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Jn+HiqIMvCI5Ag0vA8t+qIxmidEK/HlIdGCSWeHdw80=;
 b=WPAHOZIFxkl8vSUC4EMT96w+JQuG5WXIjAbTwEQBt8reUiidNSLN9DHs
 n+RgnfMA1iFAhGfeVPnay6Hj67vZaEWXh26ul7wo12hopoWQNNpkWkb/W
 82Aoo6W+UlcxeBhk6sUKFeqvW9vXQiGxpGnVIq13L0gO3Ms/NoOdfrSjo
 wNLi4SRBJfK+zhNd0okKaG9ZNEuMhnKZFCmYYp7edqLzv5iwj5xhFPSVp
 T9jrqsxIacy/XZLlbyHyFGyN2wUU/eeRoi1Ar5wG0qMeplGuYwe8cSnZW
 bY9EZPZs6zIHVHQppxkVNHfftO/FUPzzHfKV7wZftJAZ8x4aiv2Xaq7Rf g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="283035188"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="283035188"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 10:43:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="693031305"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2022 10:43:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 30515120; Wed, 23 Mar 2022 19:43:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] powerpc/83xx/mpc8349emitx: Get rid of of_node
 assignment
Date: Wed, 23 Mar 2022 19:43:42 +0200
Message-Id: <20220323174342.56187-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Scott Wood <oss@buserror.net>,
 Paul Mackerras <paulus@samba.org>, Linus Walleij <linus.walleij@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let GPIO library to assign of_node from the parent device.
This allows to move GPIO library and drivers to use fwnode
APIs instead of being stuck with OF-only interfaces.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
index a38372f9ac12..26b502773b3f 100644
--- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
+++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
@@ -8,15 +8,15 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/mutex.h>
 #include <linux/i2c.h>
 #include <linux/gpio/driver.h>
-#include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/slab.h>
 #include <linux/kthread.h>
+#include <linux/property.h>
 #include <linux/reboot.h>
 #include <asm/prom.h>
 #include <asm/machdep.h>
@@ -116,21 +116,17 @@ static int mcu_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 
 static int mcu_gpiochip_add(struct mcu *mcu)
 {
-	struct device_node *np;
+	struct device *dev = &mcu->client->dev;
 	struct gpio_chip *gc = &mcu->gc;
 
-	np = of_find_compatible_node(NULL, NULL, "fsl,mcu-mpc8349emitx");
-	if (!np)
-		return -ENODEV;
-
 	gc->owner = THIS_MODULE;
-	gc->label = kasprintf(GFP_KERNEL, "%pOF", np);
+	gc->label = kasprintf(GFP_KERNEL, "%pfw", dev_fwnode(dev));
 	gc->can_sleep = 1;
 	gc->ngpio = MCU_NUM_GPIO;
 	gc->base = -1;
 	gc->set = mcu_gpio_set;
 	gc->direction_output = mcu_gpio_dir_out;
-	gc->of_node = np;
+	gc->parent = dev;
 
 	return gpiochip_add_data(gc, mcu);
 }
-- 
2.35.1

