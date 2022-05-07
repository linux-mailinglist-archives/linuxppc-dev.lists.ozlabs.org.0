Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F9B51E653
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 12:04:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwNM13FRzz3ccg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 20:04:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m6ktwpo2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=m6ktwpo2; dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwNKf25xgz3bXw
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 20:03:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651917782; x=1683453782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/TH2t2Zl2v5PlFXuYgl2cfI4T7s5wGnQ+3rQ63ZiRDM=;
 b=m6ktwpo2/MH20CpFvKQjQnrZ9TAVf4qeZ5loxhwdbsSWCLu9I17CCd29
 NXa5PTTD4zbU2ObOagFx3y2SlfrDXy9cAlXfx8u7/f0QbA/ukqttoD1eA
 P6LYb5bKj7d3RBxIHZPT5jIlWO2vpg8FelgHevEBpYVWFC0uTh3OCcTHA
 kJEzbVxh10KHgt7hiA95Re+nfww9m7doWjQIn5uMCXwLN8Buu4bzdrR6s
 tl4ZBJULSg9AacMu/TAXi82Ro/ppoqKZsXctlSzSdBuppeuy685W/StUd
 4KdNgV7fSyZuFFLzhpwAENxvhCsFHpGwCQiM29NqItGK1N1/ko6I1WGYn w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="268585212"
X-IronPort-AV: E=Sophos;i="5.91,206,1647327600"; d="scan'208";a="268585212"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2022 03:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,206,1647327600"; d="scan'208";a="655073428"
Received: from black.fi.intel.com ([10.237.72.28])
 by FMSMGA003.fm.intel.com with ESMTP; 07 May 2022 03:01:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 931661D6; Sat,  7 May 2022 13:01:49 +0300 (EEST)
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
Subject: [PATCH v2 3/4] powerpc/52xx: Get rid of of_node assignment
Date: Sat,  7 May 2022 13:01:46 +0300
Message-Id: <20220507100147.5802-3-andriy.shevchenko@linux.intel.com>
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

Let GPIO library assign of_node from the parent device.
This allows to move GPIO library and drivers to use fwnode
APIs instead of being stuck with OF-only interfaces.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no changes
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index 2605b4667b39..ae47fdcc8a96 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -58,6 +58,7 @@
 #include <linux/of_platform.h>
 #include <linux/of_gpio.h>
 #include <linux/kernel.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/fs.h>
 #include <linux/watchdog.h>
@@ -314,17 +315,15 @@ mpc52xx_gpt_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 	return 0;
 }
 
-static void
-mpc52xx_gpt_gpio_setup(struct mpc52xx_gpt_priv *gpt, struct device_node *node)
+static void mpc52xx_gpt_gpio_setup(struct mpc52xx_gpt_priv *gpt)
 {
 	int rc;
 
-	/* Only setup GPIO if the device tree claims the GPT is
-	 * a GPIO controller */
-	if (!of_find_property(node, "gpio-controller", NULL))
+	/* Only setup GPIO if the device claims the GPT is a GPIO controller */
+	if (!device_property_present(gpt->dev, "gpio-controller"))
 		return;
 
-	gpt->gc.label = kasprintf(GFP_KERNEL, "%pOF", node);
+	gpt->gc.label = kasprintf(GFP_KERNEL, "%pfw", dev_fwnode(gpt->dev));
 	if (!gpt->gc.label) {
 		dev_err(gpt->dev, "out of memory\n");
 		return;
@@ -336,7 +335,7 @@ mpc52xx_gpt_gpio_setup(struct mpc52xx_gpt_priv *gpt, struct device_node *node)
 	gpt->gc.get = mpc52xx_gpt_gpio_get;
 	gpt->gc.set = mpc52xx_gpt_gpio_set;
 	gpt->gc.base = -1;
-	gpt->gc.of_node = node;
+	gpt->gc.parent = gpt->dev;
 
 	/* Setup external pin in GPIO mode */
 	clrsetbits_be32(&gpt->regs->mode, MPC52xx_GPT_MODE_MS_MASK,
@@ -349,8 +348,7 @@ mpc52xx_gpt_gpio_setup(struct mpc52xx_gpt_priv *gpt, struct device_node *node)
 	dev_dbg(gpt->dev, "%s() complete.\n", __func__);
 }
 #else /* defined(CONFIG_GPIOLIB) */
-static void
-mpc52xx_gpt_gpio_setup(struct mpc52xx_gpt_priv *p, struct device_node *np) { }
+static void mpc52xx_gpt_gpio_setup(struct mpc52xx_gpt_priv *gpt) { }
 #endif /* defined(CONFIG_GPIOLIB) */
 
 /***********************************************************************
@@ -727,7 +725,7 @@ static int mpc52xx_gpt_probe(struct platform_device *ofdev)
 
 	dev_set_drvdata(&ofdev->dev, gpt);
 
-	mpc52xx_gpt_gpio_setup(gpt, ofdev->dev.of_node);
+	mpc52xx_gpt_gpio_setup(gpt);
 	mpc52xx_gpt_irq_setup(gpt, ofdev->dev.of_node);
 
 	mutex_lock(&mpc52xx_gpt_list_mutex);
-- 
2.35.1

