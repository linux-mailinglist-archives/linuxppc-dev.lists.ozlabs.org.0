Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC939EB1A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 14:52:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473mw61JZ7zF3R3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 00:52:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="fgcv/oPV"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473mq00MjvzF4YT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 00:47:40 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 473mpp0HzBz9vBLg;
 Thu, 31 Oct 2019 14:47:30 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=fgcv/oPV; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id J29njGkmL4QI; Thu, 31 Oct 2019 14:47:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 473mpn6KSFz9vBL6;
 Thu, 31 Oct 2019 14:47:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1572529649; bh=wt0Fzth6lZMxXr855wEMiyNx6P1w0vI0e5Gi+SxeS7c=;
 h=From:Subject:To:Cc:Date:From;
 b=fgcv/oPVIzSW8gV9hPwFnY5QlKgmbj24kEu5ci0VLQIAc3B/DI0j0cw231qciQaco
 qsHj+3EfUiO2C1e5bQ7n6qj7rWicdFCK7c0yGDu5IDhWCrTvzYqDMmEb5FKcFrmcy5
 zTIM/ODzmlc6ETtZLdPMNG2VySrDqXdZYCOFebXI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3C42D8B8E6;
 Thu, 31 Oct 2019 14:47:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yZZwiWq6IGG3; Thu, 31 Oct 2019 14:47:31 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D200A8B8E2;
 Thu, 31 Oct 2019 14:47:30 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7796D68289; Thu, 31 Oct 2019 13:47:30 +0000 (UTC)
Message-Id: <bf930402613b41b42d0441b784e0cc43fc18d1fb.1572529632.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/sysdev: drop simple gpio
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 31 Oct 2019 13:47:30 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is a config item CONFIG_SIMPLE_GPIO which
provides simple memory mapped GPIOs specific to powerpc.

However, the only platform which selects this option is
mpc5200, and this platform doesn't use it.

There are three boards calling simple_gpiochip_init(), but
as they don't select CONFIG_SIMPLE_GPIO, this is just a nop.

Simple_gpio is just redundant with the generic MMIO GPIO
driver which can be found in driver/gpio/ and selected via
CONFIG_GPIO_GENERIC_PLATFORM, so drop simple_gpio driver.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 .../devicetree/bindings/board/fsl-board.txt        |  30 -----
 arch/powerpc/configs/mpc5200_defconfig             |   1 -
 arch/powerpc/platforms/83xx/mpc836x_mds.c          |   7 -
 arch/powerpc/platforms/85xx/mpc85xx_mds.c          |   6 -
 arch/powerpc/platforms/86xx/mpc8610_hpcd.c         |   4 -
 arch/powerpc/platforms/Kconfig                     |  10 --
 arch/powerpc/sysdev/Makefile                       |   1 -
 arch/powerpc/sysdev/simple_gpio.c                  | 143 ---------------------
 arch/powerpc/sysdev/simple_gpio.h                  |  13 --
 9 files changed, 215 deletions(-)
 delete mode 100644 arch/powerpc/sysdev/simple_gpio.c
 delete mode 100644 arch/powerpc/sysdev/simple_gpio.h

diff --git a/Documentation/devicetree/bindings/board/fsl-board.txt b/Documentation/devicetree/bindings/board/fsl-board.txt
index eb52f6b35159..9cde57015921 100644
--- a/Documentation/devicetree/bindings/board/fsl-board.txt
+++ b/Documentation/devicetree/bindings/board/fsl-board.txt
@@ -47,36 +47,6 @@ Example (LS2080A-RDB):
                 reg = <0x3 0 0x10000>;
         };
 
-* Freescale BCSR GPIO banks
-
-Some BCSR registers act as simple GPIO controllers, each such
-register can be represented by the gpio-controller node.
-
-Required properities:
-- compatible : Should be "fsl,<board>-bcsr-gpio".
-- reg : Should contain the address and the length of the GPIO bank
-  register.
-- #gpio-cells : Should be two. The first cell is the pin number and the
-  second cell is used to specify optional parameters (currently unused).
-- gpio-controller : Marks the port as GPIO controller.
-
-Example:
-
-	bcsr@1,0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "fsl,mpc8360mds-bcsr";
-		reg = <1 0 0x8000>;
-		ranges = <0 1 0 0x8000>;
-
-		bcsr13: gpio-controller@d {
-			#gpio-cells = <2>;
-			compatible = "fsl,mpc8360mds-bcsr-gpio";
-			reg = <0xd 1>;
-			gpio-controller;
-		};
-	};
-
 * Freescale on-board FPGA connected on I2C bus
 
 Some Freescale boards like BSC9132QDS have on board FPGA connected on
diff --git a/arch/powerpc/configs/mpc5200_defconfig b/arch/powerpc/configs/mpc5200_defconfig
index 6f87a5c74960..83d801307178 100644
--- a/arch/powerpc/configs/mpc5200_defconfig
+++ b/arch/powerpc/configs/mpc5200_defconfig
@@ -15,7 +15,6 @@ CONFIG_PPC_MEDIA5200=y
 CONFIG_PPC_MPC5200_BUGFIX=y
 CONFIG_PPC_MPC5200_LPBFIFO=m
 # CONFIG_PPC_PMAC is not set
-CONFIG_SIMPLE_GPIO=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/arch/powerpc/platforms/83xx/mpc836x_mds.c b/arch/powerpc/platforms/83xx/mpc836x_mds.c
index 4a4efa906d35..240a26d88b07 100644
--- a/arch/powerpc/platforms/83xx/mpc836x_mds.c
+++ b/arch/powerpc/platforms/83xx/mpc836x_mds.c
@@ -39,7 +39,6 @@
 #include <asm/udbg.h>
 #include <sysdev/fsl_soc.h>
 #include <sysdev/fsl_pci.h>
-#include <sysdev/simple_gpio.h>
 #include <soc/fsl/qe/qe.h>
 #include <soc/fsl/qe/qe_ic.h>
 
@@ -181,12 +180,6 @@ static int __init mpc836x_usb_cfg(void)
 		qe_usb_clock_set(QE_CLK21, 48000000);
 	} else {
 		setbits8(&bcsr[13], BCSR13_USBMODE);
-		/*
-		 * The BCSR GPIOs are used to control power and
-		 * speed of the USB transceiver. This is needed for
-		 * the USB Host only.
-		 */
-		simple_gpiochip_init("fsl,mpc8360mds-bcsr-gpio");
 	}
 
 	of_node_put(np);
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_mds.c b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
index 5ca254256c47..d7949c003996 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_mds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
@@ -43,7 +43,6 @@
 #include <asm/udbg.h>
 #include <sysdev/fsl_soc.h>
 #include <sysdev/fsl_pci.h>
-#include <sysdev/simple_gpio.h>
 #include <soc/fsl/qe/qe.h>
 #include <soc/fsl/qe/qe_ic.h>
 #include <asm/mpic.h>
@@ -351,11 +350,6 @@ machine_arch_initcall(mpc8569_mds, board_fixups);
 
 static int __init mpc85xx_publish_devices(void)
 {
-	if (machine_is(mpc8568_mds))
-		simple_gpiochip_init("fsl,mpc8568mds-bcsr-gpio");
-	if (machine_is(mpc8569_mds))
-		simple_gpiochip_init("fsl,mpc8569mds-bcsr-gpio");
-
 	return mpc85xx_common_publish_devices();
 }
 
diff --git a/arch/powerpc/platforms/86xx/mpc8610_hpcd.c b/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
index 96b27f6fdd0f..7733d0607da2 100644
--- a/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
+++ b/arch/powerpc/platforms/86xx/mpc8610_hpcd.c
@@ -34,7 +34,6 @@
 #include <linux/of_platform.h>
 #include <sysdev/fsl_pci.h>
 #include <sysdev/fsl_soc.h>
-#include <sysdev/simple_gpio.h>
 
 #include "mpc86xx.h"
 
@@ -93,9 +92,6 @@ static const struct of_device_id mpc8610_ids[] __initconst = {
 
 static int __init mpc8610_declare_of_platform_devices(void)
 {
-	/* Firstly, register PIXIS GPIOs. */
-	simple_gpiochip_init("fsl,fpga-pixis-gpio-bank");
-
 	/* Enable wakeup on PIXIS' event IRQ. */
 	mpc8610_suspend_init();
 
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index d82e3664ffdf..e28df298df56 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -303,16 +303,6 @@ config GEN_RTC
 	  replacing their get_rtc_time/set_rtc_time callbacks with
 	  a proper RTC device driver.
 
-config SIMPLE_GPIO
-	bool "Support for simple, memory-mapped GPIO controllers"
-	depends on PPC
-	select GPIOLIB
-	help
-	  Say Y here to support simple, memory-mapped GPIO controllers.
-	  These are usually BCSRs used to control board's switches, LEDs,
-	  chip-selects, Ethernet/USB PHY's power and various other small
-	  on-board peripherals.
-
 config MCU_MPC8349EMITX
 	bool "MPC8349E-mITX MCU driver"
 	depends on I2C=y && PPC_83xx
diff --git a/arch/powerpc/sysdev/Makefile b/arch/powerpc/sysdev/Makefile
index 603b3c656d19..cb5a5bd2cef5 100644
--- a/arch/powerpc/sysdev/Makefile
+++ b/arch/powerpc/sysdev/Makefile
@@ -24,7 +24,6 @@ obj-$(CONFIG_FSL_CORENET_RCPM)	+= fsl_rcpm.o
 obj-$(CONFIG_FSL_LBC)		+= fsl_lbc.o
 obj-$(CONFIG_FSL_GTM)		+= fsl_gtm.o
 obj-$(CONFIG_FSL_85XX_CACHE_SRAM)	+= fsl_85xx_l2ctlr.o fsl_85xx_cache_sram.o
-obj-$(CONFIG_SIMPLE_GPIO)	+= simple_gpio.o
 obj-$(CONFIG_FSL_RIO)		+= fsl_rio.o fsl_rmu.o
 obj-$(CONFIG_TSI108_BRIDGE)	+= tsi108_pci.o tsi108_dev.o
 obj-$(CONFIG_RTC_DRV_CMOS)	+= rtc_cmos_setup.o
diff --git a/arch/powerpc/sysdev/simple_gpio.c b/arch/powerpc/sysdev/simple_gpio.c
deleted file mode 100644
index dc1740cd9e42..000000000000
--- a/arch/powerpc/sysdev/simple_gpio.c
+++ /dev/null
@@ -1,143 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Simple Memory-Mapped GPIOs
- *
- * Copyright (c) MontaVista Software, Inc. 2008.
- *
- * Author: Anton Vorontsov <avorontsov@ru.mvista.com>
- */
-
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/spinlock.h>
-#include <linux/types.h>
-#include <linux/ioport.h>
-#include <linux/io.h>
-#include <linux/of.h>
-#include <linux/of_gpio.h>
-#include <linux/gpio/driver.h>
-#include <linux/slab.h>
-#include <asm/prom.h>
-#include "simple_gpio.h"
-
-struct u8_gpio_chip {
-	struct of_mm_gpio_chip mm_gc;
-	spinlock_t lock;
-
-	/* shadowed data register to clear/set bits safely */
-	u8 data;
-};
-
-static u8 u8_pin2mask(unsigned int pin)
-{
-	return 1 << (8 - 1 - pin);
-}
-
-static int u8_gpio_get(struct gpio_chip *gc, unsigned int gpio)
-{
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-
-	return !!(in_8(mm_gc->regs) & u8_pin2mask(gpio));
-}
-
-static void u8_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
-{
-	struct of_mm_gpio_chip *mm_gc = to_of_mm_gpio_chip(gc);
-	struct u8_gpio_chip *u8_gc = gpiochip_get_data(gc);
-	unsigned long flags;
-
-	spin_lock_irqsave(&u8_gc->lock, flags);
-
-	if (val)
-		u8_gc->data |= u8_pin2mask(gpio);
-	else
-		u8_gc->data &= ~u8_pin2mask(gpio);
-
-	out_8(mm_gc->regs, u8_gc->data);
-
-	spin_unlock_irqrestore(&u8_gc->lock, flags);
-}
-
-static int u8_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
-{
-	return 0;
-}
-
-static int u8_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
-{
-	u8_gpio_set(gc, gpio, val);
-	return 0;
-}
-
-static void u8_gpio_save_regs(struct of_mm_gpio_chip *mm_gc)
-{
-	struct u8_gpio_chip *u8_gc =
-		container_of(mm_gc, struct u8_gpio_chip, mm_gc);
-
-	u8_gc->data = in_8(mm_gc->regs);
-}
-
-static int __init u8_simple_gpiochip_add(struct device_node *np)
-{
-	int ret;
-	struct u8_gpio_chip *u8_gc;
-	struct of_mm_gpio_chip *mm_gc;
-	struct gpio_chip *gc;
-
-	u8_gc = kzalloc(sizeof(*u8_gc), GFP_KERNEL);
-	if (!u8_gc)
-		return -ENOMEM;
-
-	spin_lock_init(&u8_gc->lock);
-
-	mm_gc = &u8_gc->mm_gc;
-	gc = &mm_gc->gc;
-
-	mm_gc->save_regs = u8_gpio_save_regs;
-	gc->ngpio = 8;
-	gc->direction_input = u8_gpio_dir_in;
-	gc->direction_output = u8_gpio_dir_out;
-	gc->get = u8_gpio_get;
-	gc->set = u8_gpio_set;
-
-	ret = of_mm_gpiochip_add_data(np, mm_gc, u8_gc);
-	if (ret)
-		goto err;
-	return 0;
-err:
-	kfree(u8_gc);
-	return ret;
-}
-
-void __init simple_gpiochip_init(const char *compatible)
-{
-	struct device_node *np;
-
-	for_each_compatible_node(np, NULL, compatible) {
-		int ret;
-		struct resource r;
-
-		ret = of_address_to_resource(np, 0, &r);
-		if (ret)
-			goto err;
-
-		switch (resource_size(&r)) {
-		case 1:
-			ret = u8_simple_gpiochip_add(np);
-			if (ret)
-				goto err;
-			break;
-		default:
-			/*
-			 * Whenever you need support for GPIO bank width > 1,
-			 * please just turn u8_ code into huge macros, and
-			 * construct needed uX_ code with it.
-			 */
-			ret = -ENOSYS;
-			goto err;
-		}
-		continue;
-err:
-		pr_err("%pOF: registration failed, status %d\n", np, ret);
-	}
-}
diff --git a/arch/powerpc/sysdev/simple_gpio.h b/arch/powerpc/sysdev/simple_gpio.h
deleted file mode 100644
index f3f3a20d39e2..000000000000
--- a/arch/powerpc/sysdev/simple_gpio.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __SYSDEV_SIMPLE_GPIO_H
-#define __SYSDEV_SIMPLE_GPIO_H
-
-#include <linux/errno.h>
-
-#ifdef CONFIG_SIMPLE_GPIO
-extern void simple_gpiochip_init(const char *compatible);
-#else
-static inline void simple_gpiochip_init(const char *compatible) {}
-#endif /* CONFIG_SIMPLE_GPIO */
-
-#endif /* __SYSDEV_SIMPLE_GPIO_H */
-- 
2.13.3

