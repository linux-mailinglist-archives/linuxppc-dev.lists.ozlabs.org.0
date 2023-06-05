Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22440722701
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 15:11:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZYrm6Ztyz3flG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 23:11:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=ukl@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZYqF60Rmz3bgs
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jun 2023 23:09:42 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q69xM-0001WK-KH; Mon, 05 Jun 2023 15:09:08 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q69xG-005HiR-1R; Mon, 05 Jun 2023 15:09:02 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q69xF-00BOyO-A8; Mon, 05 Jun 2023 15:09:01 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 2/2] serial: 8250: Apply FSL workarounds also without SERIAL_8250_CONSOLE
Date: Mon,  5 Jun 2023 15:08:57 +0200
Message-Id: <20230605130857.85543-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230605130857.85543-1-u.kleine-koenig@pengutronix.de>
References: <20230605130857.85543-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2668; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=/iY8DOYiUKQ3IjFvzh5hTbIR5kmRBK3gTLZzDTO0E0I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkfd5m2spn9NPH1ET1qFwBJUJEoEBvhKes6ITC9 xXnMdPTWfCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZH3eZgAKCRCPgPtYfRL+ TjiGCACtnb4oAf0+eyz+aIlLtpyep/naQvxVEmicNKRgK1bmBVd4+2E6Yc/lmqMU7uaePjbMqBZ L2qV7RUsNv9+StMaJjMetKfojPzQxDdbGdT2UsI8yccvFVd4W7nUhyd0YSjCCLfUI9pV+8vCr6o ab5XpL0kwljGEcxaZvnqw2cor/Y1noxqLZe5MjBiLqHrdyLudS/8hOiBrwjaWJR125arBX2FW0o uhvumK87tOCraxhuwX9WxiwYgWfO2Qygqnwmkua2zyK0rF/lHJ0n04IYoT2znMZBntuRShFvbK6 R4OnYXRPdqUGChAau9SPD8yj2LxbZDjtR/7PJdUNxpDpafRQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, linux-serial@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Liang He <windhl@126.com>, Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, kernel@pengutronix.de, Matthew Gerlach <matthew.gerlach@linux.intel.com>, =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The need to handle the FSL variant of 8250 in a special way is also
present without console support. So soften the dependency for
SERIAL_8250_FSL accordingly. Note that with the 8250 driver compiled as
a module, some devices still might not make use of the needed
workarounds. That affects the ports instantiated in
arch/powerpc/kernel/legacy_serial.c.

This issue was identified by Dominik Andreas Schorpp.

To cope for CONFIG_SERIAL_8250=m + CONFIG_SERIAL_8250_FSL=y, 8250_fsl.o
must be put in the same compilation unit as 8250_port.o because the
latter defines some functions needed in the former and so 8250_fsl.o
must not be built-in if 8250_port.o is available in a module.

Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Link: https://lore.kernel.org/r/20230531083230.2702181-1-u.kleine-koenig@pengutronix.de
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/tty/serial/8250/Kconfig  | 2 +-
 drivers/tty/serial/8250/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/8250/Kconfig b/drivers/tty/serial/8250/Kconfig
index 5313aa31930f..10c09b19c871 100644
--- a/drivers/tty/serial/8250/Kconfig
+++ b/drivers/tty/serial/8250/Kconfig
@@ -378,7 +378,7 @@ config SERIAL_8250_BCM2835AUX
 
 config SERIAL_8250_FSL
 	bool "Freescale 16550 UART support" if COMPILE_TEST && !(PPC || ARM || ARM64)
-	depends on SERIAL_8250_CONSOLE
+	depends on SERIAL_8250
 	default PPC || ARM || ARM64
 	help
 	  Selecting this option enables a workaround for a break-detection
diff --git a/drivers/tty/serial/8250/Makefile b/drivers/tty/serial/8250/Makefile
index 4fc2fc1f41b6..8824ba5295b6 100644
--- a/drivers/tty/serial/8250/Makefile
+++ b/drivers/tty/serial/8250/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_SERIAL_8250)		+= 8250.o 8250_base.o
 8250_base-$(CONFIG_SERIAL_8250_DMA)	+= 8250_dma.o
 8250_base-$(CONFIG_SERIAL_8250_DWLIB)	+= 8250_dwlib.o
 8250_base-$(CONFIG_SERIAL_8250_FINTEK)	+= 8250_fintek.o
+8250_base-$(CONFIG_SERIAL_8250_FSL)	+= 8250_fsl.o
 8250_base-$(CONFIG_SERIAL_8250_PCILIB)	+= 8250_pcilib.o
 obj-$(CONFIG_SERIAL_8250_PARISC)	+= 8250_parisc.o
 obj-$(CONFIG_SERIAL_8250_PCI)		+= 8250_pci.o
@@ -28,7 +29,6 @@ obj-$(CONFIG_SERIAL_8250_BOCA)		+= 8250_boca.o
 obj-$(CONFIG_SERIAL_8250_EXAR_ST16C554)	+= 8250_exar_st16c554.o
 obj-$(CONFIG_SERIAL_8250_HUB6)		+= 8250_hub6.o
 obj-$(CONFIG_SERIAL_8250_PCI1XXXX)	+= 8250_pci1xxxx.o
-obj-$(CONFIG_SERIAL_8250_FSL)		+= 8250_fsl.o
 obj-$(CONFIG_SERIAL_8250_MEN_MCB)	+= 8250_men_mcb.o
 obj-$(CONFIG_SERIAL_8250_DFL)		+= 8250_dfl.o
 obj-$(CONFIG_SERIAL_8250_DW)		+= 8250_dw.o
-- 
2.39.2

