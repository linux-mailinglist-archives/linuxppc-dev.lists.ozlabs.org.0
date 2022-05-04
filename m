Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A7051A18F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 15:57:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktdgq6ByFz3bxp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 23:57:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bcOkt8h7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bcOkt8h7; dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtdfX1tDMz3blK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 23:56:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651672596; x=1683208596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2h2A44esOD/enMpwjThJCpi/hZHnoHP+VM/cKfOHtlY=;
 b=bcOkt8h7Myo77x6vZVYeSuHHETJcBWVbaFAzDujBDoqVO0mqYYtO2VGB
 nPFnAdEjOyHOO75BSj0di8vMcaW20ouf4C3BOT6hKYK6IczrKj6oTC/D+
 y1H+gVpBmtKdf+iPSbXSp6ihqxzkGpYeJdsOAHQr8yWVzAtmEloobx5dE
 x2ww8NjJ56RmXrbw5Fp79FD07Gk883T4YisAfVlQQpSu6uc0wFPQzaM8y
 89oeeKtKjTVoM4t4WDIG92rICf8Ib1kKEbtRDk6rHE2W+LT/I6iYF9TZI
 0bAtQSgtqZlfz01+oLyWNko+pBWS3ezJFxqm24Dde5D5JXY94lP/WH3pT Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="328315617"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="328315617"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 06:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="631965917"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 04 May 2022 06:55:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 791B2D1; Wed,  4 May 2022 16:55:28 +0300 (EEST)
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
Subject: [PATCH v1 2/4] powerpc/mpc5xxx: Switch mpc5xxx_get_bus_frequency() to
 use fwnode
Date: Wed,  4 May 2022 16:44:47 +0300
Message-Id: <20220504134449.64473-2-andriy.shevchenko@linux.intel.com>
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

Switch mpc5xxx_get_bus_frequency() to use fwnode in order to help
cleaning up other parts of the kernel from OF specific code.

No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/powerpc/include/asm/mpc5xxx.h            |  9 +++-
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c     |  2 +-
 arch/powerpc/sysdev/mpc5xxx_clocks.c          | 41 ++++++++++---------
 drivers/ata/pata_mpc52xx.c                    |  2 +-
 drivers/i2c/busses/i2c-mpc.c                  |  7 ++--
 drivers/net/can/mscan/mpc5xxx_can.c           |  2 +-
 drivers/net/ethernet/freescale/fec_mpc52xx.c  |  2 +-
 .../net/ethernet/freescale/fec_mpc52xx_phy.c  |  3 +-
 .../net/ethernet/freescale/fs_enet/mii-fec.c  |  4 +-
 drivers/spi/spi-mpc52xx.c                     |  2 +-
 drivers/tty/serial/mpc52xx_uart.c             |  4 +-
 11 files changed, 44 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/include/asm/mpc5xxx.h b/arch/powerpc/include/asm/mpc5xxx.h
index 2f60f5c5461b..44db26380435 100644
--- a/arch/powerpc/include/asm/mpc5xxx.h
+++ b/arch/powerpc/include/asm/mpc5xxx.h
@@ -11,7 +11,14 @@
 #ifndef __ASM_POWERPC_MPC5xxx_H__
 #define __ASM_POWERPC_MPC5xxx_H__
 
-extern unsigned long mpc5xxx_get_bus_frequency(struct device_node *node);
+#include <linux/property.h>
+
+unsigned long mpc5xxx_fwnode_get_bus_frequency(struct fwnode_handle *fwnode);
+
+static inline unsigned long mpc5xxx_get_bus_frequency(struct device *dev)
+{
+	return mpc5xxx_fwnode_get_bus_frequency(dev_fwnode(dev));
+}
 
 #endif /* __ASM_POWERPC_MPC5xxx_H__ */
 
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index f862b48b4824..8f896a42d7d8 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -720,7 +720,7 @@ static int mpc52xx_gpt_probe(struct platform_device *ofdev)
 
 	raw_spin_lock_init(&gpt->lock);
 	gpt->dev = &ofdev->dev;
-	gpt->ipb_freq = mpc5xxx_get_bus_frequency(ofdev->dev.of_node);
+	gpt->ipb_freq = mpc5xxx_get_bus_frequency(&ofdev->dev);
 	gpt->regs = of_iomap(ofdev->dev.of_node, 0);
 	if (!gpt->regs)
 		return -ENOMEM;
diff --git a/arch/powerpc/sysdev/mpc5xxx_clocks.c b/arch/powerpc/sysdev/mpc5xxx_clocks.c
index 834a6d7fbd88..c5bf7e1b3780 100644
--- a/arch/powerpc/sysdev/mpc5xxx_clocks.c
+++ b/arch/powerpc/sysdev/mpc5xxx_clocks.c
@@ -1,31 +1,34 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
- * 	mpc5xxx_get_bus_frequency - Find the bus frequency for a device
- * 	@node:	device node
- *
- * 	Returns bus frequency (IPS on MPC512x, IPB on MPC52xx),
- * 	or 0 if the bus frequency cannot be found.
- */
 
 #include <linux/kernel.h>
-#include <linux/of_platform.h>
 #include <linux/export.h>
+#include <linux/property.h>
+
 #include <asm/mpc5xxx.h>
 
-unsigned long mpc5xxx_get_bus_frequency(struct device_node *node)
+/**
+ * mpc5xxx_fwnode_get_bus_frequency - Find the bus frequency for a firmware node
+ * @fwnode:	firmware node
+ *
+ * Returns bus frequency (IPS on MPC512x, IPB on MPC52xx),
+ * or 0 if the bus frequency cannot be found.
+ */
+unsigned long mpc5xxx_fwnode_get_bus_frequency(struct fwnode_handle *fwnode)
 {
-	const unsigned int *p_bus_freq = NULL;
+	struct fwnode_handle *parent;
+	u32 bus_freq;
+	int ret;
 
-	of_node_get(node);
-	while (node) {
-		p_bus_freq = of_get_property(node, "bus-frequency", NULL);
-		if (p_bus_freq)
-			break;
+	ret = fwnode_property_read_u32(fwnode, "bus-frequency", &bus_freq);
+	if (!ret)
+		return bus_freq;
 
-		node = of_get_next_parent(node);
+	fwnode_for_each_parent_node(fwnode, parent) {
+		ret = fwnode_property_read_u32(parent, "bus-frequency", &bus_freq);
+		if (!ret)
+			return bus_freq;
 	}
-	of_node_put(node);
 
-	return p_bus_freq ? *p_bus_freq : 0;
+	return 0;
 }
-EXPORT_SYMBOL(mpc5xxx_get_bus_frequency);
+EXPORT_SYMBOL(mpc5xxx_fwnode_get_bus_frequency);
diff --git a/drivers/ata/pata_mpc52xx.c b/drivers/ata/pata_mpc52xx.c
index 03b6ae37a578..6559b606736d 100644
--- a/drivers/ata/pata_mpc52xx.c
+++ b/drivers/ata/pata_mpc52xx.c
@@ -683,7 +683,7 @@ static int mpc52xx_ata_probe(struct platform_device *op)
 	struct bcom_task *dmatsk;
 
 	/* Get ipb frequency */
-	ipb_freq = mpc5xxx_get_bus_frequency(op->dev.of_node);
+	ipb_freq = mpc5xxx_get_bus_frequency(&op->dev);
 	if (!ipb_freq) {
 		dev_err(&op->dev, "could not determine IPB bus frequency\n");
 		return -ENODEV;
diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 6c698c10d3cd..2030668ecde5 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -239,6 +239,7 @@ static const struct mpc_i2c_divider mpc_i2c_dividers_52xx[] = {
 static int mpc_i2c_get_fdr_52xx(struct device_node *node, u32 clock,
 					  u32 *real_clk)
 {
+	struct fwnode_handle = of_fwnode_handle(node);
 	const struct mpc_i2c_divider *div = NULL;
 	unsigned int pvr = mfspr(SPRN_PVR);
 	u32 divider;
@@ -246,12 +247,12 @@ static int mpc_i2c_get_fdr_52xx(struct device_node *node, u32 clock,
 
 	if (clock == MPC_I2C_CLOCK_LEGACY) {
 		/* see below - default fdr = 0x3f -> div = 2048 */
-		*real_clk = mpc5xxx_get_bus_frequency(node) / 2048;
+		*real_clk = mpc5xxx_fwnode_get_bus_frequency(fwnode) / 2048;
 		return -EINVAL;
 	}
 
 	/* Determine divider value */
-	divider = mpc5xxx_get_bus_frequency(node) / clock;
+	divider = mpc5xxx_fwnode_get_bus_frequency(fwnode) / clock;
 
 	/*
 	 * We want to choose an FDR/DFSR that generates an I2C bus speed that
@@ -266,7 +267,7 @@ static int mpc_i2c_get_fdr_52xx(struct device_node *node, u32 clock,
 			break;
 	}
 
-	*real_clk = mpc5xxx_get_bus_frequency(node) / div->divider;
+	*real_clk = mpc5xxx_fwnode_get_bus_frequency(fwnode) / div->divider;
 	return (int)div->fdr;
 }
 
diff --git a/drivers/net/can/mscan/mpc5xxx_can.c b/drivers/net/can/mscan/mpc5xxx_can.c
index 65ba6697bd7d..c469b2f3e57d 100644
--- a/drivers/net/can/mscan/mpc5xxx_can.c
+++ b/drivers/net/can/mscan/mpc5xxx_can.c
@@ -63,7 +63,7 @@ static u32 mpc52xx_can_get_clock(struct platform_device *ofdev,
 	else
 		*mscan_clksrc = MSCAN_CLKSRC_XTAL;
 
-	freq = mpc5xxx_get_bus_frequency(ofdev->dev.of_node);
+	freq = mpc5xxx_get_bus_frequency(&ofdev->dev);
 	if (!freq)
 		return 0;
 
diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx.c b/drivers/net/ethernet/freescale/fec_mpc52xx.c
index be0bd4b44926..159d59147827 100644
--- a/drivers/net/ethernet/freescale/fec_mpc52xx.c
+++ b/drivers/net/ethernet/freescale/fec_mpc52xx.c
@@ -922,7 +922,7 @@ static int mpc52xx_fec_probe(struct platform_device *op)
 	/* Start with safe defaults for link connection */
 	priv->speed = 100;
 	priv->duplex = DUPLEX_HALF;
-	priv->mdio_speed = ((mpc5xxx_get_bus_frequency(np) >> 20) / 5) << 1;
+	priv->mdio_speed = ((mpc5xxx_get_bus_frequency(&op->dev) >> 20) / 5) << 1;
 
 	/* The current speed preconfigures the speed of the MII link */
 	prop = of_get_property(np, "current-speed", &prop_size);
diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c b/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
index b5497e308302..3c9b1fae956b 100644
--- a/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
+++ b/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
@@ -99,8 +99,7 @@ static int mpc52xx_fec_mdio_probe(struct platform_device *of)
 	dev_set_drvdata(dev, bus);
 
 	/* set MII speed */
-	out_be32(&priv->regs->mii_speed,
-		((mpc5xxx_get_bus_frequency(of->dev.of_node) >> 20) / 5) << 1);
+	out_be32(&priv->regs->mii_speed, ((mpc5xxx_get_bus_frequency(dev) >> 20) / 5) << 1);
 
 	err = of_mdiobus_register(bus, np);
 	if (err)
diff --git a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
index 152f4d83765a..d37d7a19a759 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mii-fec.c
@@ -102,7 +102,7 @@ static int fs_enet_mdio_probe(struct platform_device *ofdev)
 	struct resource res;
 	struct mii_bus *new_bus;
 	struct fec_info *fec;
-	int (*get_bus_freq)(struct device_node *);
+	int (*get_bus_freq)(struct device *);
 	int ret = -ENOMEM, clock, speed;
 
 	match = of_match_device(fs_enet_mdio_fec_match, &ofdev->dev);
@@ -136,7 +136,7 @@ static int fs_enet_mdio_probe(struct platform_device *ofdev)
 	}
 
 	if (get_bus_freq) {
-		clock = get_bus_freq(ofdev->dev.of_node);
+		clock = get_bus_freq(&ofdev->dev);
 		if (!clock) {
 			/* Use maximum divider if clock is unknown */
 			dev_warn(&ofdev->dev, "could not determine IPS clock\n");
diff --git a/drivers/spi/spi-mpc52xx.c b/drivers/spi/spi-mpc52xx.c
index 3ebdce804b90..bc5e36fd4288 100644
--- a/drivers/spi/spi-mpc52xx.c
+++ b/drivers/spi/spi-mpc52xx.c
@@ -437,7 +437,7 @@ static int mpc52xx_spi_probe(struct platform_device *op)
 	ms->irq0 = irq_of_parse_and_map(op->dev.of_node, 0);
 	ms->irq1 = irq_of_parse_and_map(op->dev.of_node, 1);
 	ms->state = mpc52xx_spi_fsmstate_idle;
-	ms->ipb_freq = mpc5xxx_get_bus_frequency(op->dev.of_node);
+	ms->ipb_freq = mpc5xxx_get_bus_frequency(&op->dev);
 	ms->gpio_cs_count = of_gpio_count(op->dev.of_node);
 	if (ms->gpio_cs_count > 0) {
 		master->num_chipselect = ms->gpio_cs_count;
diff --git a/drivers/tty/serial/mpc52xx_uart.c b/drivers/tty/serial/mpc52xx_uart.c
index e50f069b5ebb..3f1986c89694 100644
--- a/drivers/tty/serial/mpc52xx_uart.c
+++ b/drivers/tty/serial/mpc52xx_uart.c
@@ -1630,7 +1630,7 @@ mpc52xx_console_setup(struct console *co, char *options)
 		return ret;
 	}
 
-	uartclk = mpc5xxx_get_bus_frequency(np);
+	uartclk = mpc5xxx_fwnode_get_bus_frequency(of_fwnode_handle(np));
 	if (uartclk == 0) {
 		pr_debug("Could not find uart clock frequency!\n");
 		return -EINVAL;
@@ -1747,7 +1747,7 @@ static int mpc52xx_uart_of_probe(struct platform_device *op)
 	/* set the uart clock to the input clock of the psc, the different
 	 * prescalers are taken into account in the set_baudrate() methods
 	 * of the respective chip */
-	uartclk = mpc5xxx_get_bus_frequency(op->dev.of_node);
+	uartclk = mpc5xxx_get_bus_frequency(&op->dev);
 	if (uartclk == 0) {
 		dev_dbg(&op->dev, "Could not find uart clock frequency!\n");
 		return -EINVAL;
-- 
2.35.1

