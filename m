Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B2551A1A5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 15:58:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtdjF4x4lz3cLG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 23:58:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z3nDi5vx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Z3nDi5vx; dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ktdfb0gSrz3bqk
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 23:56:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651672599; x=1683208599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VFRSvvAnvwFGIGd0aLNekAxiY2K03BO+iR35H1EOHsc=;
 b=Z3nDi5vxnC4Vr/ciGoymE6gP32ENP9HT0INOx/53mdYLh94PHmBAMPub
 1L7QiCPk3kyXx1gNLXqn4LYAd3Z6VI6oT0XGvSuk4OAK2M/PSPxgwexW+
 JZMRDW7fEL1HE4XiU9T8g8r4oJoELP/axGfybjtwfTJfWGu+t6I7ri8qW
 saUXrdzslC1kX7MJA4NJYPRz9iZBp1LYU2uX1mjC7fzWpD9iMEz5rXPWg
 7RoZtRAHPJ0R0EwuMxrfIJy9vBtYQoH+4MgduzREHHcnKcpMrbM5zmxIJ
 4cGBGrmUx0BnELhAJAaUloL0rJMei+h9rJczA4w2lsQc10UKbCJBY8Bk6 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="292961259"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="292961259"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 06:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="536841297"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 04 May 2022 06:55:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 39228115; Wed,  4 May 2022 16:55:29 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Wolfram Sang <wsa@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
Subject: [PATCH v1 3/4] powerpc/52xx: Get rid of of_node assignment
Date: Wed,  4 May 2022 16:44:48 +0300
Message-Id: <20220504134449.64473-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504134449.64473-1-andriy.shevchenko@linux.intel.com>
References: <20220504134449.64473-1-andriy.shevchenko@linux.intel.com>
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
 Mark Brown <broonie@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Anatolij Gustschin <agust@denx.de>, Wolfgang Grandegger <wg@grandegger.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Let GPIO library assign of_node from the parent device.
This allows to move GPIO library and drivers to use fwnode
APIs instead of being stuck with OF-only interfaces.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index 8f896a42d7d8..0831f28345af 100644
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

